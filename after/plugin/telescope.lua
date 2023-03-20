local builtin = require('telescope').setup{ 
	defaults = { 
	  file_ignore_patterns = { 
		"node_modules",
		"venv"
	  }
	}
  }

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files , {desc = "Find Between Files in CWD"})

vim.keymap.set('n', '<leader>fG', builtin.git_files , {desc = "Find Between GIT Files in CWD"})
vim.keymap.set('n', '<leader>fgs', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end , {desc = "Grep Find"})
vim.keymap.set('n', '<leader>fgl', builtin.live_grep, {desc = "Live Grep"})
