require("globals")
require("options")
require("keymaps")

vim.api.nvim_create_autocmd("PackChanged", {callback = function(ev)
	if ev.data.spec.name == "nvim-treesitter" and ev.data.kind == "update" then
		if not ev.data.active then
			vim.cmd.packadd("nvim-treesitter")
		end

		vim.cmd("TSUpdate")
	end
end})

vim.pack.add({
	"https://github.com/TheTyl/akihabara.nvim",
	"https://github.com/nvim-mini/mini.statusline",
	"https://github.com/ibhagwan/fzf-lua",
	"https://github.com/nvim-treesitter/nvim-treesitter"
})

vim.cmd.colorscheme("akihabara")

-- statusline
require("mini.statusline").setup()

-- fzf-lua
local fzf = require("fzf-lua")
fzf.setup({fzf_colors = true})

fzf.config.defaults.keymap.fzf["ctrl-q"] = "select-all+accept"
fzf.config.defaults.keymap.fzf["ctrl-u"] = "half-page-up"
fzf.config.defaults.keymap.fzf["ctrl-d"] = "half-page-down"

-- treesitter
local treesitter = require("nvim-treesitter")
treesitter.setup();
treesitter.install({"c", "lua","vim", "vimdoc", "cpp"})

vim.api.nvim_create_autocmd("FileType", {
	pattern = {"c", "lua", "vim", "vimdoc", "cpp"},
	callback = function()
		vim.treesitter.start()
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end
})
