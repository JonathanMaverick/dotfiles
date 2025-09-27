return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      pyright = {
        settings = {
          python = {
            pythonPath = vim.fn.expand("/home/paultsai/miniconda3/envs/AI/bin/python"),
          },
        },
      },
    },
  },
}
