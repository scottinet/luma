# AGENTS.md

Guidance for working on Luma. Luma is a multi-editor/terminal color theme
**generated from a single source palette**.

## Architecture

- `src/colors.json` — the source palette (OKLCH-designed). Two variants
  (`light`, `dark`), each with named colors, each color with
  `darker` / `normal` / `brighter` luminosities.
- `src/templates/*.yaml` — one template per target (vscode, vim, zed, ghostty,
  iterm2, …). They reference the palette via `{{color:NAME;luminosity:LUM;alpha:AA}}`
  placeholders. `alpha` is appended as raw hex digits (e.g. `alpha:40` → `40` →
  ~25% opacity), not a percentage.
- `src/build.ts` — resolves the placeholders and writes the final theme files.
- `themes/` — generated output. **Do not edit by hand**; edit the palette or a
  template, then rebuild.

## Making a change

```sh
npm install        # first time only
npm run build      # regenerates everything in themes/
```

Always rebuild after touching `src/colors.json` or `src/templates/`, and commit
the regenerated `themes/**` alongside the source change.

## Publishing the VS Code extension

**Important: publishing is done by drag & drop of a `.vsix` on the Marketplace
web UI. There is NO Azure DevOps organization and NO Personal Access Token (PAT)
for this publisher.** Do not attempt `vsce publish` / `vsce login` — it dead-ends
on a PAT that doesn't exist. (Creating one would require setting up an Azure
DevOps org, which we deliberately avoid.)

Publisher: **SebastienCottinet** — manage page:
<https://marketplace.visualstudio.com/manage/publishers/sebastiencottinet>

Steps:

1. `npm run build` — make sure the generated themes are current (there is no
   `vscode:prepublish` hook, so the build is **not** automatic).
2. **Bump `version` in `package.json`.** The Marketplace rejects re-uploading an
   existing version, so this is mandatory for every release.
3. `npm run package` — produces `luma-theme-<version>.vsix` at the repo root.
4. Open the manage page above → **Extensions** tab → the **Luma** row →
   **⋯ (More actions) → Update**, or simply **drag & drop the `.vsix`** onto the
   page. The Marketplace reads the version from the file. Propagation takes
   ~5–10 min.
5. Commit the `package.json` version bump (and push).

### Notes / gotchas

- **WSL:** the `.vsix` lives in the WSL filesystem but the browser runs on
  Windows. Reach the file for drag & drop via
  `\\wsl.localhost\<distro>\home\scottinet\git\luma\luma-theme-<version>.vsix`
  (or copy it to the Windows desktop first).
- `.vscodeignore` excludes the root `README.md` on purpose: packaging uses
  `--readme-path themes/editors/vscode/README.md` (the VS Code-specific page),
  and shipping both READMEs caused a case-insensitive `README.md`/`readme.md`
  collision that the VSIX format rejects.
- The `.vsix` is not committed (ignored).
