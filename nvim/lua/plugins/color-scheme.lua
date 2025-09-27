return {
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("onedark").setup({
        style = "dark", -- "dark", "darker", "cool", etc.
        transparent = true, -- enable transparency
      })
      require("onedark").load()

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
