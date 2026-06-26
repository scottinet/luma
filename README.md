# Luma

A soothing theme, using the Oklab color space to make all accent colors of the same perceptual intensity.

| Luma Dark                                                                                                     | Luma Light                                                                                                     |
| ------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- |
| ![Luma Dark Code](https://raw.githubusercontent.com/scottinet/luma/refs/heads/main/assets/luma-dark-code.png) | ![Luma Light Code](https://raw.githubusercontent.com/scottinet/luma/refs/heads/main/assets/luma-light-code.png) |
| ![Luma Dark](https://raw.githubusercontent.com/scottinet/luma/refs/heads/main/assets/luma-dark.png)           | ![Luma Light](https://raw.githubusercontent.com/scottinet/luma/refs/heads/main/assets/luma-light.png)          |

## About

Luma is built around a single principle: every accent color sits at the same perceptual intensity, so no single token visually dominates the others. Colors are picked in the [Oklab](https://bottosson.github.io/posts/oklab/) color space, which models perception more faithfully than RGB or HSL.

Every variant — editors, terminals, and other apps — is generated from a single source palette in [`src/colors.json`](./src/colors.json), so the theme stays consistent across the whole stack.

Two appearances are provided: **Dark** and **Light**.

## Editors

### Visual Studio Code

Install from the [Marketplace](https://marketplace.visualstudio.com/items?itemName=SebastienCottinet.luma-theme), then pick `Luma - Dark` or `Luma - Light` in `Preferences: Color Theme`.

### Vim / Neovim

The colorscheme is at [`colors/luma.vim`](./colors/luma.vim). It supports both `set background=dark` and `set background=light`, and covers legacy syntax groups, Tree-sitter (`@…`), and LSP / Diagnostic groups. 24-bit color is required: `set termguicolors`.

**Neovim 0.12+ (`vim.pack`)**

```lua
vim.pack.add({ "https://github.com/scottinet/luma" })
vim.cmd.colorscheme("luma")
```

**lazy.nvim**

```lua
{
  "scottinet/luma",
  lazy = false,
  priority = 1000,
  config = function() vim.cmd.colorscheme("luma") end,
}
```

**vim-plug**

```vim
Plug 'scottinet/luma'
" then in your config, after plug#end():
colorscheme luma
```

### Zed

Copy [`themes/editors/zed/luma.json`](./themes/editors/zed/luma.json) to `~/.config/zed/themes/luma.json`, then pick `Luma Dark` or `Luma Light` in Zed's theme selector.

## Terminals

### Ghostty

Copy [`LumaDark`](./themes/terminals/ghostty/LumaDark) and [`LumaLight`](./themes/terminals/ghostty/LumaLight) to `~/.config/ghostty/themes/`, then in `~/.config/ghostty/config`:

```
theme = LumaDark
```

### iTerm2

Open `Settings → Profiles → Colors → Color Presets → Import…` and select [`Luma-dark.itermcolors`](./themes/terminals/iterm2/Luma-dark.itermcolors) or [`Luma-light.itermcolors`](./themes/terminals/iterm2/Luma-light.itermcolors). Then pick the imported preset from the same menu.

### Konsole

Copy [`luma-dark.colorscheme`](./themes/terminals/konsole/luma-dark.colorscheme) and [`luma-light.colorscheme`](./themes/terminals/konsole/luma-light.colorscheme) to `~/.local/share/konsole/`, then in Konsole: `Settings → Edit Current Profile → Appearance → Color scheme`.

### Warp

Copy [`luma-dark.yaml`](./themes/terminals/warp/luma-dark.yaml) and [`luma-light.yaml`](./themes/terminals/warp/luma-light.yaml) to `~/.warp/themes/`, then pick the theme from Warp's theme picker.

### Windows Terminal

Open `Settings → Open JSON file` and merge the scheme objects from [`luma-dark.json`](./themes/terminals/windows-terminal/luma-dark.json) and [`luma-light.json`](./themes/terminals/windows-terminal/luma-light.json) into the top-level `schemes` array. Then set `"colorScheme": "Luma Dark"` (or `"Luma Light"`) on a profile.

### XFCE4 Terminal

Copy [`luma-dark.theme`](./themes/terminals/xfce4-terminal/luma-dark.theme) and [`luma-light.theme`](./themes/terminals/xfce4-terminal/luma-light.theme) to `~/.local/share/xfce4/terminal/colorschemes/`, then in the terminal: `Edit → Preferences → Colors → Presets`.

## Other

### Slack

Open `Preferences → Themes`, scroll to `Custom theme` and paste the contents of [`LumaDark`](./themes/others/slack/LumaDark) or [`LumaLight`](./themes/others/slack/LumaLight) into the input field.

## Building from source

All themes are generated from [`src/colors.json`](./src/colors.json) via templates in [`src/templates/`](./src/templates/).

```sh
npm install
npm run build
```

To package the VS Code extension:

```sh
npm run package
```

## License

[MIT](./LICENSE)
