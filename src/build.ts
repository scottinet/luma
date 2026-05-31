import { mkdir, readdir, readFile, writeFile } from "node:fs/promises";
import path from "node:path";
import { parse as parseYaml } from "yaml";
import colors from "./colors.json";

const availableVariants: string[] = Object.keys(colors);
const availableLuminosities = ["brighter", "normal", "darker"] as const;

interface FileTemplate {
  description?: string;
  target: string;
  variant?: string;
  content: string | Record<string, unknown>;
}

interface Pattern {
  color: string;
  luminosity: "brighter" | "normal" | "darker";
  format: "hex" | "rgb" | "pdict";
  variant: string;
  alpha?: number;
  over?: string;
  overLuminosity?: "brighter" | "normal" | "darker";
}

function isPattern(obj: Record<string, any>): obj is Pattern {
  return (
    typeof obj.color === "string" &&
    typeof obj.luminosity === "string" &&
    availableLuminosities.includes(obj.luminosity) &&
    (obj.alpha === undefined || !isNaN(obj.alpha)) &&
    typeof obj.format === "string" &&
    ["hex", "rgb", "pdict"].includes(obj.format) &&
    availableVariants.includes(obj.variant) &&
    (obj.over === undefined ||
      (typeof obj.over === "string" &&
        !!colors[obj.variant as keyof typeof colors]?.[
          obj.over as keyof typeof colors.light
        ])) &&
    (obj.overLuminosity === undefined ||
      availableLuminosities.includes(obj.overLuminosity))
  );
}

function isTemplate(obj: Record<string, any>): obj is FileTemplate {
  return (
    typeof obj.target === "string" &&
    (typeof obj.variant === "undefined" ||
      availableVariants.includes(obj.variant)) &&
    (typeof obj.content === "string" ||
      (!!obj.content &&
        typeof obj.content === "object" &&
        !Array.isArray(obj.content))) &&
    ["undefined", "string"].includes(typeof obj.description)
  );
}

function blendOverBackground(
  fgHex: string,
  bgHex: string,
  alphaPercent: number,
): string {
  const a = alphaPercent / 100;
  const channel = (offset: number) => {
    const fg = Number.parseInt(fgHex.slice(offset, offset + 2), 16);
    const bg = Number.parseInt(bgHex.slice(offset, offset + 2), 16);
    return Math.round(fg * a + bg * (1 - a))
      .toString(16)
      .padStart(2, "0");
  };
  return `${channel(0)}${channel(2)}${channel(4)}`;
}

function patternToString(pattern: Pattern): string {
  const color =
    colors[pattern.variant as keyof typeof colors]?.[
      pattern.color as keyof typeof colors.light
    ]?.[pattern.luminosity];

  if (!color) {
    throw new Error(`invalid pattern ${JSON.stringify(pattern)}`);
  }

  switch (pattern.format) {
    case "hex":
      if (pattern.alpha !== undefined && pattern.over) {
        const bg =
          colors[pattern.variant as keyof typeof colors][
            pattern.over as keyof typeof colors.light
          ][pattern.overLuminosity ?? "normal"];
        return `#${blendOverBackground(color, bg, pattern.alpha)}`;
      }
      return `#${color}${pattern.alpha ?? ""}`;
    case "rgb":
      const r = Number.parseInt(color.slice(0, 2), 16);
      const g = Number.parseInt(color.slice(2, 4), 16);
      const b = Number.parseInt(color.slice(4, 6), 16);

      if (pattern.alpha) {
        const alpha = pattern.alpha / 100;
        return `${r},${g},${b},${alpha}`;
      }

      return `${r},${g},${b}`;
    case "pdict":
      return `<dict>
  <key>Color Space</key>
  <string>sRGB</string>
  <key>Red Component</key>
  <real>${Number.parseInt(color.slice(0, 2), 16) / 255}</real>
  <key>Green Component</key>
  <real>${Number.parseInt(color.slice(2, 4), 16) / 255}</real>
  <key>Blue Component</key>
  <real>${Number.parseInt(color.slice(4, 6), 16) / 255}</real>
  <key>Alpha Component</key>
  <real>${pattern.alpha ? pattern.alpha / 100 : 1}</real>
</dict>`;
  }
}

async function applyTemplate(input: FileTemplate): Promise<void> {
  const text =
    typeof input.content === "string"
      ? input.content
      : JSON.stringify(input.content);
  const applied = text.replace(
    /\{\{([\w;:-]+)\}\}/g,
    (match: string, p: string) => {
      const pattern: Record<string, any> = p.split(";").reduce(
        (acc, val) => {
          const [k, v] = val.split(":");

          if (k === "alpha") {
            acc.alpha = Number.parseInt(v, 10);
          } else if (k === "over") {
            const [oc, ol] = v.split("-");
            acc.over = oc;
            if (ol) acc.overLuminosity = ol;
          } else {
            acc[k] = v;
          }

          acc.variant ??= input.variant;
          acc.luminosity ??= "normal";

          return acc;
        },
        { format: "hex" } as Record<string, any>,
      );

      if (!isPattern(pattern)) {
        throw new Error(
          `invalid pattern "${match} (parsed: "${JSON.stringify(pattern)}")"`,
        );
      }

      return patternToString(pattern);
    },
  );

  const targetPath = path.join(process.cwd(), input.target);
  await mkdir(path.dirname(targetPath), { recursive: true });
  await writeFile(
    targetPath,
    typeof input.content === "string"
      ? applied
      : JSON.stringify(JSON.parse(applied), null, 2),
  );
}

function parse(buf: Buffer): FileTemplate {
  let parsed: Record<string, unknown> = parseYaml(buf.toString("utf-8"));

  if (isTemplate(parsed)) {
    return parsed;
  }

  throw new Error("not a valid template");
}

async function run(): Promise<void> {
  const tdir = path.join(__dirname, "templates");
  const files = await readdir(tdir, {
    withFileTypes: true,
  });

  for (const file of files) {
    if (!file.isFile()) continue;
    let parsed: FileTemplate;

    try {
      let buf = await readFile(path.join(tdir, file.name));

      parsed = parse(buf);
      await applyTemplate(parsed);
    } catch (error) {
      console.error(error);
      continue;
    }

    console.info(
      `Generated: ${parsed.description ?? "template"} (${parsed.target})`,
    );
  }
}

run();
