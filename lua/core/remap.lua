-- NORMAL MODE
-- vim.keymap.set("n", "<leader>e", vim.cmd.Ex, {desc = "Open File Explorer"})
vim.keymap.set("n", "0", "^", {desc = "Move at the start of the line"})
vim.keymap.set("n", "<leader>w", vim.cmd.write, {desc = "Save File"})
vim.keymap.set("n", "<leader>q", vim.cmd.quit, {desc = "Quit"})

vim.keymap.set("n", "n", "nzzzv", {desc = "Next Selection"})
vim.keymap.set("n", "N", "Nzzzv", {desc = "Previous Selection"})

vim.keymap.set("n", "<leader>V", "<C-w>v", {desc = "Vertical Split"})
vim.keymap.set("n", "<leader>H", "<C-w>s", {desc = "Horizontal Split"})
vim.keymap.set("n", "<leader><Left>", "<C-w>h", {desc = "Move to Left Split"})
vim.keymap.set("n", "<leader><Right>", "<C-w>l", {desc = "Move to Left Split"})
vim.keymap.set("n", "<leader><Up>", "<C-w>k", {desc = "Move to Upper Split"})
vim.keymap.set("n", "<leader><Down>", "<C-w>j", {desc = "Move to Lower Split"})


-- VISUAL MODE
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {desc = "Move Selection Down"})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", {desc = "Move Selection Up"})

--COMBINED MODES
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])


-- OTHER MODES
vim.keymap.set("x", "<leader>p", [["_dP]], {desc = "Paste Without Losing Buffer"})

-- NVIM TREE
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

-- FUGITIVE
vim.keymap.set("n", "<leader>gs", vim.cmd.Git, {desc = "Open Git Status"})

-- TELESCOPE
local ts_builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', ts_builtin.find_files , {desc = "Find Between Files in CWD"})

vim.keymap.set('n', '<leader>fG', ts_builtin.git_files , {desc = "Find Between GIT Files in CWD"})
vim.keymap.set('n', '<leader>fs', function()
	ts_builtin.grep_string({ search = vim.fn.input("Grep > ") })
end , {desc = "Grep Find"})
vim.keymap.set('n', '<leader>fl', ts_builtin.live_grep, {desc = "Live Grep"})

-- HARPOON
local harpoon_mark = require("harpoon.mark")
local harpoon_ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>ha", harpoon_mark.add_file, {desc = "Add To Harpoon"})
vim.keymap.set("n", "<leader>ht", harpoon_ui.toggle_quick_menu, {desc = "Toggle Harpoon"})

vim.keymap.set("n", "<leader>h1", function() harpoon_ui.nav_file(1) end, {desc = "First Harpoon File"})
vim.keymap.set("n", "<leader>h2", function() harpoon_ui.nav_file(2) end, {desc = "Second Harpoon File"})
vim.keymap.set("n", "<leader>h3", function() harpoon_ui.nav_file(3) end, {desc = "Third Harpoon File"})
vim.keymap.set("n", "<leader>h4", function() harpoon_ui.nav_file(4) end, {desc = "Fourth Harpoon File"})
vim.keymap.set("n", "<leader>h5", function() harpoon_ui.nav_file(5) end, {desc = "Fifth Harpoon File"})
vim.keymap.set("n", "<leader>h6", function() harpoon_ui.nav_file(6) end, {desc = "Sixth Harpoon File"})
vim.keymap.set("n", "<leader>h7", function() harpoon_ui.nav_file(7) end, {desc = "Seventh Harpoon File"})
vim.keymap.set("n", "<leader>h8", function() harpoon_ui.nav_file(8) end, {desc = "Eighth Harpoon File"})
vim.keymap.set("n", "<leader>h9", function() harpoon_ui.nav_file(9) end, {desc = "Ninth Harpoon File"})

-- UNDOTREE
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, {desc = "Toggle Undotree"})

-- WHICHKEY

-- HOP
local hop = require('hop')
local directions = require('hop.hint').HintDirection
vim.keymap.set('n', '<leader>jf', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR })
end, {remap=true, desc="Search the prompted character in the following lines"})
vim.keymap.set('n', '<leader>jb', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR })
end, {remap=true, desc="Search the prompted character in the previous lines"})
vim.keymap.set('n', '<leader>jF', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, {remap=true, desc="Search the prompted character in this line, after the cursor"})
vim.keymap.set('n', '<leader>jB', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
end, {remap=true, desc="Search the prompted character in this line, before the cursor"})

-- LSP
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local opts = { buffer = ev.buf }
    vim.keymap.set("n", "<leader>lgd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "<leader>lgD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "<leader>lgi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<leader>lgt", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "<leader>lgr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>li", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "<leader>ln", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "<leader>lp", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>lh", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<leader>lca", vim.lsp.buf.code_action, opts)

  end,
})

-- NULL-LS
vim.keymap.set("n", "<leader>nf", vim.lsp.buf.format, {})