return {
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        terminal_colors = true,
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
          strings = true,
          comments = true,
          operators = false,
          folds = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true, -- invert background for search, diffs, etc.
        contrast = "soft", -- "hard", "soft", or leave empty
        palette_overrides = {},
        overrides = {},
        transparent_mode = true,
      })
      vim.cmd("colorscheme gruvbox")

      vim.cmd([[
        hi Normal guibg=NONE ctermbg=NONE
        hi NormalNC guibg=NONE ctermbg=NONE
        hi LineNr guibg=NONE
        hi Folded guibg=NONE
        hi SignColumn guibg=NONE
        hi VertSplit guibg=NONE
        hi StatusLine guibg=NONE
        hi StatusLineNC guibg=NONE
      ]])
    end,
  },
}
