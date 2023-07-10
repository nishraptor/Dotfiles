local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


plugins = {
{"catppuccin/nvim", name = "catppuccin", priority = 1000, opts = {integrations = {nvimtree=true}}},

{"nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = true
},

{"neovim/nvim-lspconfig"},
{"dundalek/lazy-lsp.nvim", opts = {}},
{"nvim-lualine/lualine.nvim", opts = {theme = 'catppuccin'}},

}

vim.g.mapleader = " " --leaderkey

require("lazy").setup(plugins)


vim.cmd.colorscheme "catppuccin"

-- vim options
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.signcolumn = "number"

-- vim keymaps
vim.keymap.set("n", "<leader><leader>", "<cmd>w<CR>")

-- nvim-tree
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>")
