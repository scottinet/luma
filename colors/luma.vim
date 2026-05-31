" Luma — A soothing colorscheme using the Oklab color space.
" Author: Sébastien Cottinet
" Generated from src/templates/vim.yaml — do not edit directly.
"
" 24-bit color is required: `set termguicolors`.

hi clear
if exists("syntax_on") | syntax reset | endif
let g:colors_name = "luma"

if &background ==# "dark"
  " ===== Editor UI =====
  hi Normal          guifg=#ababab                        guibg=#20222a
  hi NormalNC        guifg=#ababab                        guibg=#20222a
  hi NormalFloat     guifg=#ababab                        guibg=#2b2e38
  hi FloatBorder     guifg=#9e9e9e      guibg=#2b2e38
  hi FloatTitle      guifg=#ababab                        guibg=#2b2e38 gui=bold cterm=bold
  hi LineNr          guifg=#58595e    guibg=#20222a
  hi LineNrAbove     guifg=#58595e    guibg=#20222a
  hi LineNrBelow     guifg=#58595e    guibg=#20222a
  hi CursorLineNr    guifg=#ababab                        guibg=#2b2e38 gui=bold cterm=bold
  hi CursorLine                                                                 guibg=#2b2e38
  hi CursorColumn                                                               guibg=#2b2e38
  hi ColorColumn                                                                guibg=#2b2e38
  hi SignColumn                                                                 guibg=#20222a
  hi Folded          guifg=#9e9e9e      guibg=#2b2e38
  hi FoldColumn      guifg=#9e9e9e      guibg=#20222a
  hi VertSplit       guifg=#2b2e38
  hi WinSeparator    guifg=#2b2e38
  hi StatusLine      guifg=#ababab                        guibg=#14161c
  hi StatusLineNC    guifg=#9e9e9e      guibg=#14161c
  hi TabLine         guifg=#9e9e9e      guibg=#14161c
  hi TabLineSel      guifg=#ababab                        guibg=#20222a gui=bold cterm=bold
  hi TabLineFill                                                                guibg=#14161c
  hi Pmenu           guifg=#ababab                        guibg=#2b2e38
  hi PmenuSel        guifg=#ababab                        guibg=#349499 gui=bold cterm=bold
  hi PmenuSbar                                                                  guibg=#2b2e38
  hi PmenuThumb                                                                 guibg=#3c3d44
  hi Visual                                                                     guibg=#284850
  hi VisualNOS                                                                  guibg=#284850
  hi Search          guifg=#20222a                        guibg=#855835
  hi IncSearch       guifg=#20222a                        guibg=#5aa55e
  hi CurSearch       guifg=#20222a                        guibg=#c97c3c
  hi MatchParen      guifg=#43b0b6     guibg=NONE gui=bold,underline cterm=bold,underline
  hi NonText         guifg=#4a4b51
  hi SpecialKey      guifg=#4a4b51
  hi EndOfBuffer     guifg=#3c3d44
  hi Whitespace      guifg=#3c3d44
  hi Directory       guifg=#5f90e2
  hi Title           guifg=#5aa55e                        gui=bold cterm=bold
  hi Question        guifg=#3ba2a7
  hi ErrorMsg        guifg=#dd6660
  hi WarningMsg      guifg=#a09239
  hi ModeMsg         guifg=#ababab
  hi MoreMsg         guifg=#3ba2a7
  hi WildMenu        guifg=#ababab                        guibg=#349499
  hi QuickFixLine                                                               guibg=#284850
  hi Conceal         guifg=#58595e
  hi Cursor          guifg=#20222a                        guibg=#9e9e9e
  hi lCursor         guifg=#20222a                        guibg=#9e9e9e
  hi TermCursor      guifg=#20222a                        guibg=#9e9e9e

  " ===== Diff =====
  hi DiffAdd                                                                    guibg=#2c3c34
  hi DiffChange                                                                 guibg=#3a382d
  hi DiffDelete      guifg=#dd6660                          guibg=#463035
  hi DiffText                                                                   guibg=#37563f

  " ===== Spell =====
  hi SpellBad        guisp=#dd6660                          gui=undercurl cterm=undercurl
  hi SpellCap        guisp=#a09239                       gui=undercurl cterm=undercurl
  hi SpellLocal      guisp=#3ba2a7                         gui=undercurl cterm=undercurl
  hi SpellRare       guisp=#967ce6                      gui=undercurl cterm=undercurl

  " ===== Syntax (legacy groups) =====
  hi Comment         guifg=#5aa55e                        gui=italic cterm=italic
  hi SpecialComment  guifg=#5aa55e                        gui=italic cterm=italic
  hi Todo            guifg=#63b468    guibg=NONE gui=bold cterm=bold
  hi Constant        guifg=#ababab
  hi String          guifg=#3ba2a7
  hi Character       guifg=#db5ca4
  hi Number          guifg=#db5ca4
  hi Float           guifg=#db5ca4
  hi Boolean         guifg=#967ce6                      gui=italic cterm=italic
  hi Identifier      guifg=#ababab
  hi Function        guifg=#c97c3c
  hi Statement       guifg=#a09239
  hi Conditional     guifg=#a09239
  hi Repeat          guifg=#a09239
  hi Label           guifg=#a09239
  hi Operator        guifg=#dd6660
  hi Keyword         guifg=#a09239
  hi Exception       guifg=#a09239
  hi PreProc         guifg=#a09239
  hi Include         guifg=#a09239
  hi Define          guifg=#a09239
  hi Macro           guifg=#a09239
  hi PreCondit       guifg=#a09239
  hi Type            guifg=#5f90e2
  hi StorageClass    guifg=#a09239
  hi Structure       guifg=#5f90e2
  hi Typedef         guifg=#5f90e2
  hi Special         guifg=#db5ca4
  hi SpecialChar     guifg=#db5ca4
  hi Tag             guifg=#5f90e2
  hi Delimiter       guifg=#ababab
  hi Debug           guifg=#dd6660
  hi Underlined      guifg=#5f90e2                         gui=underline cterm=underline
  hi Error           guifg=#dd6660
  hi Ignore          guifg=#58595e

  " ===== Tokens that don't fit a legacy base group =====
  hi LumaRegex       guifg=#967ce6
  hi LumaConstructor guifg=#5f90e2
  hi LumaAttribute   guifg=#a09239                       gui=italic cterm=italic
  hi LumaHeading     guifg=#5aa55e                        gui=bold cterm=bold
  hi LumaStrong      guifg=#5f90e2                         gui=bold cterm=bold
  hi LumaEmphasis    guifg=#5f90e2                         gui=italic cterm=italic
  hi LumaLink        guifg=#c97c3c                       gui=underline cterm=underline
  hi LumaRaw         guifg=#c97c3c
  hi LumaQuote       guifg=#c97c3c                       gui=italic cterm=italic

  " ===== Diagnostic foregrounds (LSP) =====
  hi DiagnosticError guifg=#dd6660
  hi DiagnosticWarn  guifg=#a09239
  hi DiagnosticInfo  guifg=#5f90e2
  hi DiagnosticHint  guifg=#5aa55e
  hi DiagnosticOk    guifg=#5aa55e

  " ===== LSP references =====
  hi LspReferenceText                                                            guibg=#253c43
  hi LspReferenceRead                                                            guibg=#253c43
  hi LspReferenceWrite                                                           guibg=#253c43
  hi LspInlayHint    guifg=#5aa55e                          guibg=#20222a
  hi LspSignatureActiveParameter guifg=#c97c3c             gui=bold cterm=bold

  " ===== Git signs =====
  hi GitSignsAdd     guifg=#5aa55e
  hi GitSignsChange  guifg=#a09239
  hi GitSignsDelete  guifg=#dd6660
  hi DiffAdded       guifg=#5aa55e
  hi DiffRemoved     guifg=#dd6660
  hi DiffChanged     guifg=#a09239

else
  " ===== Editor UI =====
  hi Normal          guifg=#20222a                       guibg=#f1f1ee
  hi NormalNC        guifg=#20222a                       guibg=#f1f1ee
  hi NormalFloat     guifg=#20222a                       guibg=#f9f9f8
  hi FloatBorder     guifg=#2b2e38   guibg=#f9f9f8
  hi FloatTitle      guifg=#20222a                       guibg=#f9f9f8 gui=bold cterm=bold
  hi LineNr          guifg=#9d9ea0   guibg=#f1f1ee
  hi LineNrAbove     guifg=#9d9ea0   guibg=#f1f1ee
  hi LineNrBelow     guifg=#9d9ea0   guibg=#f1f1ee
  hi CursorLineNr    guifg=#20222a                       guibg=#e3e3dd gui=bold cterm=bold
  hi CursorLine                                                                 guibg=#e3e3dd
  hi CursorColumn                                                               guibg=#e3e3dd
  hi ColorColumn                                                                guibg=#e3e3dd
  hi SignColumn                                                                 guibg=#f1f1ee
  hi Folded          guifg=#2b2e38   guibg=#e3e3dd
  hi FoldColumn      guifg=#2b2e38   guibg=#f1f1ee
  hi VertSplit       guifg=#e3e3dd
  hi WinSeparator    guifg=#e3e3dd
  hi StatusLine      guifg=#20222a                       guibg=#e3e3dd
  hi StatusLineNC    guifg=#2b2e38   guibg=#e3e3dd
  hi TabLine         guifg=#2b2e38   guibg=#e3e3dd
  hi TabLineSel      guifg=#20222a                       guibg=#f1f1ee gui=bold cterm=bold
  hi TabLineFill                                                                guibg=#e3e3dd
  hi Pmenu           guifg=#20222a                       guibg=#f9f9f8
  hi PmenuSel        guifg=#f1f1ee                       guibg=#248595 gui=bold cterm=bold
  hi PmenuSbar                                                                  guibg=#f9f9f8
  hi PmenuThumb                                                                 guibg=#b2b3b3
  hi Visual                                                                     guibg=#b4d1d3
  hi VisualNOS                                                                  guibg=#b4d1d3
  hi Search          guifg=#20222a                       guibg=#dab39e
  hi IncSearch       guifg=#f1f1ee                       guibg=#478944
  hi CurSearch       guifg=#f1f1ee                       guibg=#b75726
  hi MatchParen      guifg=#1f7785      guibg=NONE gui=bold,underline cterm=bold,underline
  hi NonText         guifg=#b2b3b3
  hi SpecialKey      guifg=#b2b3b3
  hi EndOfBuffer     guifg=#c7c8c7
  hi Whitespace      guifg=#c7c8c7
  hi Directory       guifg=#2f78c8
  hi Title           guifg=#478944                       gui=bold cterm=bold
  hi Question        guifg=#248595
  hi ErrorMsg        guifg=#ca3c4e
  hi WarningMsg      guifg=#897622
  hi ModeMsg         guifg=#20222a
  hi MoreMsg         guifg=#248595
  hi WildMenu        guifg=#f1f1ee                       guibg=#248595
  hi QuickFixLine                                                               guibg=#b4d1d3
  hi Conceal         guifg=#9d9ea0
  hi Cursor          guifg=#f1f1ee                       guibg=#2b2e38
  hi lCursor         guifg=#f1f1ee                       guibg=#2b2e38
  hi TermCursor      guifg=#f1f1ee                       guibg=#2b2e38

  " ===== Diff =====
  hi DiffAdd                                                                    guibg=#cfdccc
  hi DiffChange                                                                 guibg=#dcd8c5
  hi DiffDelete     guifg=#ca3c4e                          guibg=#e9cdce
  hi DiffText                                                                   guibg=#adc7aa

  " ===== Spell =====
  hi SpellBad       guisp=#ca3c4e                          gui=undercurl cterm=undercurl
  hi SpellCap       guisp=#897622                       gui=undercurl cterm=undercurl
  hi SpellLocal     guisp=#248595                         gui=undercurl cterm=undercurl
  hi SpellRare      guisp=#8354de                      gui=undercurl cterm=undercurl

  " ===== Syntax (legacy groups) =====
  hi Comment        guifg=#478944                        gui=italic cterm=italic
  hi SpecialComment guifg=#478944                        gui=italic cterm=italic
  hi Todo           guifg=#3f7b3c      guibg=NONE gui=bold cterm=bold
  hi Constant       guifg=#20222a
  hi String         guifg=#248595
  hi Character      guifg=#c63187
  hi Number         guifg=#c63187
  hi Float          guifg=#c63187
  hi Boolean        guifg=#8354de                      gui=italic cterm=italic
  hi Identifier     guifg=#20222a
  hi Function       guifg=#b75726
  hi Statement      guifg=#897622
  hi Conditional    guifg=#897622
  hi Repeat         guifg=#897622
  hi Label          guifg=#897622
  hi Operator       guifg=#ca3c4e
  hi Keyword        guifg=#897622
  hi Exception      guifg=#897622
  hi PreProc        guifg=#897622
  hi Include        guifg=#897622
  hi Define         guifg=#897622
  hi Macro          guifg=#897622
  hi PreCondit      guifg=#897622
  hi Type           guifg=#2f78c8
  hi StorageClass   guifg=#897622
  hi Structure      guifg=#2f78c8
  hi Typedef        guifg=#2f78c8
  hi Special        guifg=#c63187
  hi SpecialChar    guifg=#c63187
  hi Tag            guifg=#2f78c8
  hi Delimiter      guifg=#20222a
  hi Debug          guifg=#ca3c4e
  hi Underlined     guifg=#2f78c8                         gui=underline cterm=underline
  hi Error          guifg=#ca3c4e
  hi Ignore         guifg=#9d9ea0

  " ===== Tokens that don't fit a legacy base group =====
  hi LumaRegex       guifg=#8354de
  hi LumaConstructor guifg=#2f78c8
  hi LumaAttribute   guifg=#897622                      gui=italic cterm=italic
  hi LumaHeading     guifg=#478944                       gui=bold cterm=bold
  hi LumaStrong      guifg=#8354de                     gui=bold cterm=bold
  hi LumaEmphasis    guifg=#8354de                     gui=italic cterm=italic
  hi LumaLink        guifg=#b75726                      gui=underline cterm=underline
  hi LumaRaw         guifg=#b75726
  hi LumaQuote       guifg=#b75726                      gui=italic cterm=italic

  " ===== Diagnostic foregrounds (LSP) =====
  hi DiagnosticError guifg=#ca3c4e
  hi DiagnosticWarn  guifg=#897622
  hi DiagnosticInfo  guifg=#2f78c8
  hi DiagnosticHint  guifg=#478944
  hi DiagnosticOk    guifg=#478944

  " ===== LSP references =====
  hi LspReferenceText                                                            guibg=#c8dbdc
  hi LspReferenceRead                                                            guibg=#c8dbdc
  hi LspReferenceWrite                                                           guibg=#c8dbdc
  hi LspInlayHint    guifg=#478944                         guibg=#f1f1ee
  hi LspSignatureActiveParameter guifg=#b75726            gui=bold cterm=bold

  " ===== Git signs =====
  hi GitSignsAdd     guifg=#478944
  hi GitSignsChange  guifg=#897622
  hi GitSignsDelete  guifg=#ca3c4e
  hi DiffAdded       guifg=#478944
  hi DiffRemoved     guifg=#ca3c4e
  hi DiffChanged     guifg=#897622
endif

" Treesitter, LSP semantic tokens and Diagnostics: neovim only.
" Vim doesn't allow '@' in group names, so we skip these on classic vim.
if !has("nvim") | finish | endif

" ===== Treesitter (variant-agnostic via links) =====
hi! link @comment                  Comment
hi! link @comment.documentation    Comment
hi! link @comment.error            Error
hi! link @comment.warning          WarningMsg
hi! link @comment.todo             Todo
hi! link @comment.note             Todo

hi! link @punctuation              Delimiter
hi! link @punctuation.bracket      Delimiter
hi! link @punctuation.delimiter    Delimiter
hi! link @punctuation.special      Delimiter

hi! link @constant                 Constant
hi! link @constant.builtin         Boolean
hi! link @constant.macro           Macro

hi! link @string                   String
hi! link @string.documentation     Comment
hi! link @string.escape            SpecialChar
hi! link @string.special           SpecialChar
hi! link @string.special.symbol    SpecialChar
hi! link @string.special.url       LumaLink
hi! link @string.regex             LumaRegex
hi! link @string.regexp            LumaRegex

hi! link @character                Character
hi! link @character.special        SpecialChar

hi! link @number                   Number
hi! link @number.float             Float
hi! link @boolean                  Boolean
hi! link @float                    Float

hi! link @function                 Function
hi! link @function.builtin         Function
hi! link @function.call            Function
hi! link @function.macro           Macro
hi! link @function.method          Function
hi! link @function.method.call     Function
hi! link @method                   Function
hi! link @method.call              Function
hi! link @constructor              LumaConstructor

hi! link @keyword                  Keyword
hi! link @keyword.coroutine        Keyword
hi! link @keyword.function         Keyword
hi! link @keyword.operator         Keyword
hi! link @keyword.import           Include
hi! link @keyword.type             Keyword
hi! link @keyword.modifier         StorageClass
hi! link @keyword.repeat           Repeat
hi! link @keyword.return           Keyword
hi! link @keyword.debug            Debug
hi! link @keyword.exception        Exception
hi! link @keyword.conditional      Conditional
hi! link @keyword.directive        PreProc
hi! link @keyword.directive.define Define

hi! link @operator                 Operator

hi! link @variable                 Identifier
hi! link @variable.builtin         Keyword
hi! link @variable.parameter       Identifier
hi! link @variable.member          Identifier
hi! link @parameter                Identifier
hi! link @field                    Identifier
hi! link @property                 Identifier

hi! link @type                     Type
hi! link @type.builtin             Type
hi! link @type.definition          Typedef
hi! link @type.qualifier           StorageClass

hi! link @attribute                LumaAttribute
hi! link @namespace                Type
hi! link @module                   Type
hi! link @label                    Label

hi! link @tag                      Tag
hi! link @tag.attribute            LumaAttribute
hi! link @tag.delimiter            Delimiter
hi! link @tag.builtin              Tag

" --- Markup (markdown, rst, etc.) ---
hi! link @markup                   Normal
hi! link @markup.heading           LumaHeading
hi! link @markup.heading.1         LumaHeading
hi! link @markup.heading.2         LumaHeading
hi! link @markup.heading.3         LumaHeading
hi! link @markup.heading.4         LumaHeading
hi! link @markup.heading.5         LumaHeading
hi! link @markup.heading.6         LumaHeading
hi! link @markup.strong            LumaStrong
hi! link @markup.italic            LumaEmphasis
hi! link @markup.emphasis          LumaEmphasis
hi! link @markup.underline         Underlined
hi! link @markup.strikethrough     Comment
hi! link @markup.link              LumaLink
hi! link @markup.link.label        LumaLink
hi! link @markup.link.url          LumaLink
hi! link @markup.raw               LumaRaw
hi! link @markup.raw.block         LumaRaw
hi! link @markup.list              Delimiter
hi! link @markup.list.checked      DiagnosticHint
hi! link @markup.list.unchecked    Comment
hi! link @markup.quote             LumaQuote
hi! link @markup.math              LumaRaw
hi! link @markup.environment       Keyword

" --- Diff (treesitter) ---
hi! link @diff.plus                DiffAdded
hi! link @diff.minus               DiffRemoved
hi! link @diff.delta               DiffChanged

" --- Legacy treesitter names (pre-0.10 compat) ---
hi! link @text                     Normal
hi! link @text.title               LumaHeading
hi! link @text.literal             LumaRaw
hi! link @text.strong              LumaStrong
hi! link @text.emphasis            LumaEmphasis
hi! link @text.underline           Underlined
hi! link @text.uri                 LumaLink
hi! link @text.todo                Todo
hi! link @text.note                Todo
hi! link @text.warning             WarningMsg
hi! link @text.danger              ErrorMsg
hi! link @text.diff.add            DiffAdded
hi! link @text.diff.delete         DiffRemoved

" ===== LSP semantic tokens =====
hi! link @lsp.type.class           Type
hi! link @lsp.type.decorator       LumaAttribute
hi! link @lsp.type.enum            Type
hi! link @lsp.type.enumMember      Constant
hi! link @lsp.type.function        Function
hi! link @lsp.type.interface       Type
hi! link @lsp.type.macro           Macro
hi! link @lsp.type.method          Function
hi! link @lsp.type.namespace       Type
hi! link @lsp.type.parameter       Identifier
hi! link @lsp.type.property        Identifier
hi! link @lsp.type.struct          Type
hi! link @lsp.type.type            Type
hi! link @lsp.type.typeParameter   Type
hi! link @lsp.type.variable        Identifier
hi! link @lsp.mod.deprecated       Comment
hi! link @lsp.mod.readonly         Constant

" ===== Diagnostic variants =====
hi! link DiagnosticVirtualTextError DiagnosticError
hi! link DiagnosticVirtualTextWarn  DiagnosticWarn
hi! link DiagnosticVirtualTextInfo  DiagnosticInfo
hi! link DiagnosticVirtualTextHint  DiagnosticHint
hi! link DiagnosticVirtualTextOk    DiagnosticOk
hi! link DiagnosticFloatingError    DiagnosticError
hi! link DiagnosticFloatingWarn     DiagnosticWarn
hi! link DiagnosticFloatingInfo     DiagnosticInfo
hi! link DiagnosticFloatingHint     DiagnosticHint
hi! link DiagnosticFloatingOk       DiagnosticOk
hi! link DiagnosticSignError        DiagnosticError
hi! link DiagnosticSignWarn         DiagnosticWarn
hi! link DiagnosticSignInfo         DiagnosticInfo
hi! link DiagnosticSignHint         DiagnosticHint
hi! link DiagnosticSignOk           DiagnosticOk
hi! link DiagnosticUnderlineError   SpellBad
hi! link DiagnosticUnderlineWarn    SpellCap
hi! link DiagnosticUnderlineInfo    SpellLocal
hi! link DiagnosticUnderlineHint    SpellRare
