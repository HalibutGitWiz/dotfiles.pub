local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-----------------
-- Normal mode --
-----------------

-- Easier window navigation (space+hjkl)
keymap("n", "<leader>h", "<C-w>h", opts)
keymap("n", "<leader>j", "<C-w>j", opts)
keymap("n", "<leader>k", "<C-w>k", opts)
keymap("n", "<leader>l", "<C-w>l", opts)

-- Open file explorer with space+e
keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- Resize with Ctrl+arrows
keymap("n", "<C-Up>", ":resize +2<cr>", opts)
keymap("n", "<C-Down>", ":resize -2<cr>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<cr>", opts)
keymap("n", "<C-Right>", ":vertical :resize -2<cr>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bn<cr>", opts)
keymap("n", "<S-h>", ":bp<cr>", opts)

-----------------
-- Visual mode --
-----------------

-- Stay in visual mode after indenting
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Keep register content after pasting
keymap("v", "p", '"_dP', opts)
