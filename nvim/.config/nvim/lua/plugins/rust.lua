return {
  {
    "mrcjkb/rustaceanvim",
    opts = {
      server = {
        settings = {
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = true,
              loadOutDirsFromCheck = true,
              buildScripts = { enable = true },
            },
            procMacro = {
              enable = true,
            },
          },
        },
        on_attach = function(_, bufnr)
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.code_action({
                context = {
                  only = { "quickfix" },
                  diagnostics = {},
                },
                apply = true,
              })
            end,
          })
        end,
      },
    },
  },
}
