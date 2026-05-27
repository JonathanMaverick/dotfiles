return {
  {
    "uZer/pywal16.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local function apply_wal()
        require("pywal16").setup()
        vim.cmd("colorscheme pywal16")
        local c = require("pywal16.core").get_colors()

        -- Dashboard: LAZYVIM logo uses color1 (vibrant accent)
        vim.api.nvim_set_hl(0, "SnacksDashboardHeader", { fg = c.color1, bold = true })

        -- pywal sets NonText.fg = background (invisible) — fix it to a dim but readable color
        -- This also fixes SnacksPickerPathHidden, SnacksPickerDir, SnacksDashboardDir
        -- which all link to NonText
        vim.api.nvim_set_hl(0, "NonText", { fg = c.color8 })

        -- File explorer / general directory entries
        vim.api.nvim_set_hl(0, "Directory", { fg = c.color6 })
      end

      apply_wal()

      -- Watch ~/.cache/wal/colors-wal.vim for live updates when wallpaper changes
      local wal_file = vim.fn.expand("~/.cache/wal/colors-wal.vim")
      local timer = vim.uv.new_timer()
      local watcher = vim.uv.new_fs_event()

      watcher:start(wal_file, {}, function()
        -- Debounce rapid writes
        timer:stop()
        timer:start(300, 0, vim.schedule_wrap(apply_wal))
      end)
    end,
  },
}
