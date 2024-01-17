return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
                -- JS and HTML
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.diagnostics.erb_lint,
				null_ls.builtins.diagnostics.eslint_d,
                -- PYTHON
                null_ls.builtins.diagnostics.pylint,
                null_ls.builtins.formatting.isort,
                null_ls.builtins.formatting.black,
                -- GO
                -- CPP
			},
		})
	end,
}