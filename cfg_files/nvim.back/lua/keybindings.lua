-- Keybinds --
--
--
--
vim.keymap.set("n", "<C-i>", ":BufferNext<CR>")
vim.keymap.set("n", "<C-W>", ":w | BufferClose<CR>")
vim.keymap.set("n", "<leader>f", ":E<CR>")
vim.keymap.set("n", "<F12>", ":20 split | terminal<CR>")

vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")
