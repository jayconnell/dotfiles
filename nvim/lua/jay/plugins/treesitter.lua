return { -- Highlight, edit, and navigate code
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	main = "nvim-treesitter.configs", -- Sets main module to use for opts
	opts = {
		ensure_installed = {
			"bash",
			"comment",
			"css",
			"diff",
			"dockerfile",
			"git_config",
			"git_rebase",
			"gitattributes",
			"gitcommit",
			"gitignore",
			"go",
			"html",
			"http",
			"ini",
			"javascript",
			"json",
			"jsonc",
			"lua",
			"make",
			"markdown",
			"passwd",
			"php",
			"phpdoc",
			"php_only",
			"python",
			"regex",
			"sql",
			"typescript",
			"vim",
			"vue",
			"xml",
			"yaml",
		},
		-- Autoinstall languages that are not installed
		auto_install = true,
		highlight = {
			enable = true,
		},
		indent = {
			enable = true,
			disable = { "yaml" },
		},
		textobjects = {
			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					["if"] = "@function.inner",
					["af"] = "@function.outer",
					["ic"] = "@class.inner",
					["ac"] = "@class.outer",
					["il"] = "@loop.inner",
					["al"] = "@loop.outer",
					["ia"] = "@parameter.inner",
					["aa"] = "@parameter.outer",
				},
			},
		},
	},
	dependencies = {
		"windwp/nvim-ts-autotag",
		"RRethy/nvim-treesitter-endwise",
		"nvim-treesitter/nvim-treesitter-textobjects",
		{
			"nvim-treesitter/nvim-treesitter-context",
			opts = {
				separator = "⎯",
			},
		},
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)

		local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
		---@diagnostic disable-next-line: inject-field
		parser_config.blade = {
			install_info = {
				url = "https://github.com/EmranMR/tree-sitter-blade",
				files = { "src/parser.c" },
				branch = "main",
			},
			filetype = "blade",
		}

		vim.filetype.add({
			pattern = {
				[".*%.blade%.php"] = "blade",
			},
		})

		vim.keymap.set("n", "<leader>it", vim.treesitter.inspect_tree, { desc = "Inspect in language Tree" })
		vim.keymap.set("n", "<leader>i", vim.show_pos, { desc = "Inspect position" })
	end,
}
