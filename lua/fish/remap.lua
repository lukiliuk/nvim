vim.g.mapleader = " "

-- NORMAL MODE
vim.keymap.set("n", "<leader>e", vim.cmd.Ex, {desc = "Open File Explorer"})
vim.keymap.set("n", "<leader>w", vim.cmd.write, {desc = "Save File"})

vim.keymap.set("n", "n", "nzzzv", {desc = "Next Selection"})
vim.keymap.set("n", "N", "Nzzzv", {desc = "Previous Selection"})


-- VISUAL MODE
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {desc = "Move Selection Down"})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", {desc = "Move Selection Up"})


-- OTHER MODES
vim.keymap.set("x", "<leader>p", [["_dP]], {desc = "Paste Without Losing Buffer"})

