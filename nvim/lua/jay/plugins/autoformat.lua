return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>fb",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	opts = {
		formatters = {
			prettier = {
				prepend_args = { "--ignore-unknown" },
			},
		},
		notify_on_error = false,
		format_on_save = function(bufnr)
			-- Disable "format_on_save lsp_fallback" for languages that don't
			local disable_filetypes = { c = true, cpp = true }
			return {
				timeout_ms = 500,
				lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
			}
		end,
		formatters_by_ft = {
			blade = { "prettier", "blade-formatter", stop_after_first = true },
			json = { "prettier", "jq", stop_after_first = true },
			javascript = { "prettierd", "prettier", stop_after_first = true },
			lua = { "stylua" },
			markdown = { "prettier", "markdownlint", stop_after_first = true },
			php = { "pint", "phpcbf", "php_cs_fixer", stop_after_first = true },
			sql = { "pg_format", "sqlfmt", stop_after_first = true },
			yaml = { "yamlfmt" },
			["*"] = { "injected" },
		},
	},
}
