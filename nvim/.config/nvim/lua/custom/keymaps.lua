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

-- Open file explorer with space+e and symbols list with space+s
keymap("n", "<leader>e", ":Neotree<CR>", opts)
keymap("n", "<leader>s", ":SymbolsOutline<CR>", opts)

-- Resize with Ctrl+arrows
keymap("n", "<C-Up>", ":resize +2<cr>", opts)
keymap("n", "<C-Down>", ":resize -2<cr>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<cr>", opts)
keymap("n", "<C-Right>", ":vertical :resize -2<cr>", opts)

-- Unmap <S-j> (join lines) to avoid accidentally hitting it.
keymap("n", "<S-j>", '', opts)

-- Navigate buffers
keymap("n", "<S-l>", "<CMD>BufferNext<CR>", opts)
keymap("n", "<S-h>", "<CMD>BufferPrevious<CR>", opts)
keymap("n", "<S-q>", "<CMD>BufferClose<CR>", opts) -- Close current buffer but not the window
keymap("n", "<S-p>", "<CMD>BufferPick<CR>", opts) -- Close current buffer but not the window

-- Telescope
keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<leader>g", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>p", "<cmd>Telescope projects<cr>", opts)
keymap("n", "<leader>y", "<cmd>Telescope registers<cr>", opts)

-- PhpActor
keymap("n", "<leader>cp", "<cmd>PhpActor<cr>", opts)

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
