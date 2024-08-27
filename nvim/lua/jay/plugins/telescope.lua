return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
	},
	config = function()
		local actions = require("telescope.actions")

		require("telescope").setup({
			defaults = {
				sorting_strategy = "ascending",
				layout_strategy = "horizontal",
				layout_config = { prompt_position = "top" },
				mappings = {
					i = {
						["<Esc>"] = actions.close,
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
					},
				},
			},
			file_ignore_patterns = { ".git/" },
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
			pickers = {
				find_files = {
					hidden = true,
				},
				buffers = {
					previewer = false,
					layout_config = {
						width = 80,
					},
				},
				oldfiles = {
					prompt_title = "History",
				},
				lsp_references = {
					previewer = false,
				},
				lsp_definitions = {
					previewer = false,
				},
				lsp_document_symbols = {
					symbol_width = 55,
				},
			},
		})

		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>h", builtin.help_tags, { desc = "Search help" })
		vim.keymap.set("n", "<leader>k", builtin.keymaps, { desc = "Search keymaps" })
		vim.keymap.set("n", "<leader>f", builtin.find_files, { desc = "Search files" })
		vim.keymap.set("n", "<leader>F", function()
			builtin.find_files({ no_ignore = true, prompt_title = "All Files" })
		end, { desc = "Search all files" })
		vim.keymap.set("n", "<leader>g", builtin.live_grep, { desc = "Search by grep" })
		vim.keymap.set("n", "<leader>d", builtin.diagnostics, { desc = "Search diagnostics" })
		vim.keymap.set("n", "<leader>b", builtin.buffers, { desc = "Find existing buffers" })

		vim.keymap.set("n", "<leader>/", function()
			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				previewer = false,
			}))
		end, { desc = "Fuzzily search in current buffer" })
	end,
}
