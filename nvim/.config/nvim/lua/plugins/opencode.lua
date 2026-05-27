return {
  {
    "NickvanDyke/opencode.nvim",
    dependencies = { "folke/snacks.nvim" },
    opts = {
      auto_fallback_to_embedded = false,
      cmp = {
        blink = {
          enable = false,
        },
      },
    },
    keys = {
      {
        "<leader>oa",
        function()
          require("opencode").ask()
        end,
        mode = "n",
      },
      {
        "<leader>oa",
        function()
          require("opencode").ask("@selection: ")
        end,
        mode = "v",
      },
    },
  },
}
