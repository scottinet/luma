# Luma

A soothing, low-intensity color theme for people who stare at code all day. Every accent color sits at the same perceptual brightness, so nothing on screen fights for your attention.

| Luma Dark | Luma Light |
| --- | --- |
| <img src="https://raw.githubusercontent.com/scottinet/luma/refs/heads/main/assets/luma-dark-code.png" alt="Luma Dark Code" width="430"> | <img src="https://raw.githubusercontent.com/scottinet/luma/refs/heads/main/assets/luma-light-code.png" alt="Luma Light Code" width="430"> |
| <img src="https://raw.githubusercontent.com/scottinet/luma/refs/heads/main/assets/luma-dark.png" alt="Luma Dark" width="430"> | <img src="https://raw.githubusercontent.com/scottinet/luma/refs/heads/main/assets/luma-light.png" alt="Luma Light" width="430"> |

## Why Luma

**Equal perceptual intensity.** Most themes choose colors in RGB or HSL, where a "pure" green and a "pure" blue can differ wildly in how bright they actually *look* — so some tokens leap out and others recede, whether the syntax means anything by it or not. Luma picks every accent in the [Oklab](https://bottosson.github.io/posts/oklab/) color space and pins them all to the same perceptual lightness, for a calm, even surface where color reads as structure rather than competing highlights.

**Color means one thing.** Highlighting follows meaning, not syntax: with semantic highlighting, a function keeps its color whether it's declared, called, or invoked as a method, and a string looks like a string everywhere. The palette stays deliberately small, and each accent carries a single, consistent meaning — so hue alone tells you what a token *is*.

**Comments are first-class.** Many themes fade comments into the background. Luma renders them at full intensity, as part of the code: they carry intent — and in the AI era increasingly steer the tools that write the code — so they deserve as much of your attention as the lines they describe.

Both a **Dark** and a **Light** appearance are included, generated from one shared palette.

## What's themed

Luma is a complete theme, not just a syntax palette:

- **Syntax** — language tokens, italic comments, and bracket-pair colorization
- **Editor & workbench** — sidebar, tabs, status bar, title bar, and panels
- **Git** — gutter and explorer decorations plus inline blame, in a neutral tone that never reads like a comment
- **Integrated terminal** — the full 16-color ANSI palette
- **Diffs & search** — added/removed lines and match highlights

## Set your theme

Open the Command Palette, run `Preferences: Color Theme`, and pick **Luma - Dark** or **Luma - Light**.

## Other variants

The same palette also drives themes for Neovim/Vim, Zed, Ghostty, iTerm2, Konsole, Warp, Windows Terminal, XFCE4 Terminal, and Slack. See the [GitHub repository](https://github.com/scottinet/luma) for setup instructions.

## License

[MIT](https://github.com/scottinet/luma/blob/main/LICENSE)
