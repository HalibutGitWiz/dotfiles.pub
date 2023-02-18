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

-- Easier window navigation (Ctrl+hjkl)
keymap("n", "<C-h>", "<CMD>NavigatorLeft<CR>", opts)
keymap("n", "<C-j>", "<CMD>NavigatorDown<CR>", opts)
keymap("n", "<C-k>", "<CMD>NavigatorUp<CR>", opts)
keymap("n", "<C-l>", "<CMD>NavigatorRight<CR>", opts)
keymap("n", "<C-p>", "<CMD>NavigatorPrevious<CR>", opts)

-- Open file explorer with space+e
keymap("n", "<leader>e", ":Neotree<CR>", opts)

-- Resize with Ctrl+arrows
keymap("n", "<C-Up>", ":resize +2<cr>", opts)
keymap("n", "<C-Down>", ":resize -2<cr>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<cr>", opts)
keymap("n", "<C-Right>", ":vertical :resize -2<cr>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bn<cr>", opts)
keymap("n", "<S-h>", ":bp<cr>", opts)
keymap("n", "<S-q>", ":bp<bar>sp<bar>bn<bar>bd<CR>", opts) -- Close current buffer but not the window

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-----------------
-- Visual mode --
-----------------

-- Stay in visual mode after indenting
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Keep register content after pasting
keymap("v", "p", '"_dP', opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Telescope
keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<leader>g", "<cmd>Telescope live_grep<cr>", opts)
