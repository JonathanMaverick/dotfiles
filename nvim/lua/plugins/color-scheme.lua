return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      theme = "dragon",
      --transparent = true,
      background = {
        dark = "dragon",
      },
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = "none",
              bg = "none",
              bg_dark = "none",
              bg_float = "none",
            },
          },
        },
      },
    },
  },
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    lazy = false,
    priority = 1000,
    config = function()
      require("github-theme").setup({
        options = {
          transparent = true, -- do NOT set a background color
          hide_end_of_buffer = true, -- hide ~ characters
          terminal_colors = true, -- let the theme set terminal colors
        },
      })

      -- load the style you prefer:
      vim.cmd("colorscheme github_dark") -- or github_dark_dimmed
    end,
  },
}
