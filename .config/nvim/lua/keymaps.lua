vim.keymap.set("i", "jj", "<esc>", {remap = false})

vim.keymap.set({"n", "v", "i"}, "<up>", "<nop>")
vim.keymap.set({"n", "v", "i"}, "<down>", "<nop>")
vim.keymap.set({"n", "v", "i"}, "<left>", "<nop>")
vim.keymap.set({"n", "v", "i"}, "<right>", "<nop>")

vim.keymap.set("n", "<C-k>", "<cmd>m-2<cr>")
vim.keymap.set("n", "<C-j>", "<cmd>m+<cr>")

vim.keymap.set("n", "<leader>b", "^")
vim.keymap.set("n", "<leader>e", "$")

vim.keymap.set("n", "-", "<cmd>Ex<cr>")

vim.keymap.set("n", "<leader>w", "<C-w>w")
vim.keymap.set("n", "<leader>cn", "<cmd>cnext<cr>")
vim.keymap.set("n", "<leader>cp", "<cmd>cprev<cr>");

-- fzf-lua
vim.keymap.set("n", "<leader>ff", "<cmd>FzfLua files<cr>", {desc="Find files"})
vim.keymap.set("n", "<leader>fg", "<cmd>FzfLua live_grep<cr>", {desc="Find grep"})
vim.keymap.set("n", "<leader>fc", "<cmd>lua require('fzf-lua').files({cwd=vim.fn.stdpath('config')})<cr>", {desc="find in neovim configuration"})
vim.keymap.set("n", "<leader>fh", "<cmd>FzfLua helptags<cr>", {desc="Find help"})
vim.keymap.set("n", "<leader>fw", "<cmd>FzfLua grep_cword<cr>", {desc="Find current word"})
vim.keymap.set("n", "<leader>fW", "<cmd>FzfLua grep_cWORD<cr>", {desc="Find current WORD"})
vim.keymap.set("n", "<leader>fr", "<cmd>FzfLua resume<cr>", {desc="Find resume"})
vim.keymap.set("n", "<leader>fo", "<cmd>FzfLua oldfiles<cr>", {desc="Find old files"})
vim.keymap.set("n", "<leader>fb", "<cmd>FzfLua buffers<cr>", {desc="Find existing buffers"})
vim.keymap.set("n", "<leader>/", "<cmd>FzfLua lgrep_curbuf<cr>", {desc="Live grep the current buffer"})
