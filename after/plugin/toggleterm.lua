local toggleterm = require("toggleterm")

vim.keymap.set({  "n", "t" }, "<leader>t", "<CMD>ToggleTerm<CR>", {
    desc = "Open floating terminal.",
  })


toggleterm.setup{
    size = vim.api.nvim_win_get_width(0) - 1,
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = "float",
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = "curved",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
}

