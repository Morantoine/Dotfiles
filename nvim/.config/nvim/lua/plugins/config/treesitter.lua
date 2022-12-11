local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

-- configure treesitter
treesitter.setup({
	-- enable syntax highlighting
	highlight = {
		enable = true,
	},
	-- enable indentation
	indent = { enable = true },
	-- ensure these language parsers are installed
	ensure_installed = {
		"json",
		"javascript",
		"html",
		"markdown",
		"bash",
		"lua",
		"vim",
		"dockerfile",
		"gitignore",
		"python",
		"rust",
		"c",
		"cmake",
	},
	-- auto install above language parsers
	auto_install = true,
})
