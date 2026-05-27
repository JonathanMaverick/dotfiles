vim.filetype.add({
  pattern = {
    ["%.env.*"] = "dotenv",
    ["%.env"] = "dotenv",
  },
})

return {
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.formatters_by_ft["dotenv"] = { "dotenv_linter" }

      opts.format_on_save = opts.format_on_save or {}
      if type(opts.format_on_save) == "table" then
        opts.format_on_save.timeout_ms = opts.format_on_save.timeout_ms or 500
        opts.format_on_save.lsp_fallback = true
      end
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "dotenv-linter" })
    end,
  },
}
