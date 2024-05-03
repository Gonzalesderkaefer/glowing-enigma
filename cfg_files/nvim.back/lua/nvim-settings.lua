
--Setting tab to 4 spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.bo.softtabstop = 4

-- Setting space to leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Enable Numberlines
vim.cmd("set number")

-- Enable current line highlighting
vim.cmd("set cursorline")

-- Set split below
vim.cmd("set splitbelow")

-- Keybinds
vim.keymap.set("n", "<C-i>", ":BufferNext<CR>")
vim.keymap.set("n", "<C-W>", ":w | BufferClose<CR>")
vim.keymap.set("n", "<leader>f", ":E<CR>")
vim.keymap.set("n", "<F12>", ":20 split | terminal<CR>")

vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

-- Autocmds --
-- Compile LaTeX after writing
vim.cmd("autocmd BufWritePost *.tex !pdflatex %")
-- Compile Java after writing
vim.cmd("autocmd BufWritePost *.java !javac %")
-- Compile cpp after saving
vim.cmd(' autocmd BufWritePost *.cpp !make "$(echo "%" | sed -e \'s/.cpp//\')" ')
-- Compile c after saving
vim.cmd(' autocmd BufWritePost *.c !make "$(echo "%" | sed -e \'s/.c//\')" ')

--Open .tex file in Zathura upon opening
vim.cmd(' autocmd BufReadPost *.tex !zathura "$(echo "%" | sed -e \'s/.tex/.pdf/\')" & ')