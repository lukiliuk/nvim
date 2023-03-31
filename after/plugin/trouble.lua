vim.keymap.set("n", "<leader>Tt", "<cmd>TroubleToggle<cr>",
  {silent = true, noremap = true, desc = "Toggle Trouble"}
)
vim.keymap.set("n", "<leader>Tw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>Td", "<cmd>TroubleToggle document_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>Tl", "<cmd>TroubleToggle loclist<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>Tq", "<cmd>TroubleToggle quickfix<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "Tr", "<cmd>TroubleToggle lsp_references<cr>",
  {silent = true, noremap = true}
)