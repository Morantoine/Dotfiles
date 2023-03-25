-- Set colorscheme

local dracula_status, dracula = pcall(require, "dracula")
if not dracula_status then
	return
end

dracula.setup({
	transparent_bg = true,
})

vim.cmd([[colorscheme dracula]])
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "debugPC", { link = "Normal" })
vim.api.nvim_set_hl(0, "DiffAdd", { link = "Character" })
