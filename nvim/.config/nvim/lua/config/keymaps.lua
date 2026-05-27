vim.keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true })

vim.cmd([[command! W w]])

vim.keymap.set("n", "<leadercd", function()
  vim.diagnostic.open_float({ scope = "line", focusable = false })
end, { noremap = true, silent = true })
