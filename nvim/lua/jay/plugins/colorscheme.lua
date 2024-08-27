return {
	"rose-pine/neovim",
	lazy = false,
	name = "rose-pine",
	priority = 1000,
	config = function()
		require("rose-pine").setup({
			varient = "moon",
			styles = {
				bold = true,
				italic = true,
				transparency = true,
			},
			highlight_groups = {
				TelescopeBorder = { fg = "highlight_high", bg = "none" },
				TelescopeNormal = { bg = "none" },
				TelescopePromptNormal = { bg = "none" },
				TelescopeResultsNormal = { fg = "subtle", bg = "none" },
				TelescopeSelection = { fg = "text", bg = "none" },
				TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
				TreesitterContext = { bg = "#232136" },
			},
		})
		vim.cmd.colorscheme("rose-pine")
	end,
}
