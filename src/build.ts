import { readdir, readFile, writeFile } from "node:fs/promises";
import path from "node:path";
import { parse as parseYaml } from "yaml";
import colors from "./colors.json";

const availableVariants: string[] = Object.keys(colors);

interface FileTemplate {
  description?: string;
  target: string;
  variant: string;
  content: string | Record<string, unknown>;
}

interface Pattern {
  color: string;
  modifier: "bright" | "normal" | "dark";
  alpha?: number;
  format: "hex" | "rgb";
}

function isPattern(obj: Record<string, any>): obj is Pattern {
  return (
    typeof obj.color === "string" &&
    typeof obj.modifier === "string" &&
    ["bright", "normal", "dark"].includes(obj.modifier) &&
    (obj.alpha === undefined || !isNaN(obj.alpha)) &&
    typeof obj.format === "string" &&
    ["hex", "rgb"].includes(obj.format)
  );
}

function isTemplate(obj: Record<string, any>): obj is FileTemplate {
  return (
    typeof obj.target === "string" &&
    typeof obj.variant === "string" &&
    availableVariants.includes(obj.variant) &&
    (typeof obj.content === "string" ||
      (!!obj.content &&
        typeof obj.content === "object" &&
        !Array.isArray(obj.content))) &&
    ["undefined", "string"].includes(typeof obj.description)
  );
}

function patternToString(input: FileTemplate, pattern: Pattern): string {
  const color =
    colors[input.variant as keyof typeof colors]?.[
      pattern.color as keyof typeof colors.light
    ]?.[pattern.modifier];

  if (!color) {
    throw new Error(`invalid pattern ${JSON.stringify(pattern)}`);
  }

  switch (pattern.format) {
    case "hex":
      return `#${color}${pattern.alpha ?? ""}`;
    case "rgb":
      const r = parseInt(color.slice(0, 2), 16);
      const g = parseInt(color.slice(2, 4), 16);
      const b = parseInt(color.slice(4, 6), 16);

      if (pattern.alpha) {
        const alpha = pattern.alpha / 100;
        return `${r},${g},${b},${alpha}`;
      }

      return `${r},${g},${b}`;
  }
}

async function applyTemplate(input: FileTemplate): Promise<void> {
  const text =
    typeof input.content === "string"
      ? input.content
      : JSON.stringify(input.content);
  const availableColors = Object.keys(
    colors[input.variant as keyof typeof colors] ?? {}
  );

  const applied = text.replace(
    /\{\{([\w;:]+)\}\}/g,
    (match: string, p: string) => {
      const pattern: Record<string, any> = p.split(";").reduce(
        (acc, val) => {
          const [k, v] = val.split(":");

          if (k === "alpha") {
            acc.alpha = parseInt(v);
          } else if (availableColors.includes(k)) {
            acc.color = k;
            acc.modifier = v;
          } else {
            acc[k] = v;
          }

          return acc;
        },
        { format: "hex" } as Record<string, any>
      );

      if (!isPattern(pattern)) {
        throw new Error(
          `invalid pattern "${match} (parsed: "${JSON.stringify(pattern)}")"`
        );
      }

      return patternToString(input, pattern);
    }
  );

  await writeFile(
    path.join(process.cwd(), input.target),
    typeof input.content === "string"
      ? applied
      : JSON.stringify(JSON.parse(applied), null, 2)
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
      `Generated: ${parsed.description ?? "template"} (${parsed.target})`
    );
  }
}

run();
