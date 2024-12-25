
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'morhetz/gruvbox'
  use {
    'nvim-treesitter/nvim-treesitter', 
    build = ':TSUpdate',
    config = function()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
        auto_install = true,
        ignore_install = { "javascript" },
        highlight = {
          enable = true,
          disable = function(lang, buf)
              local max_filesize = 100 * 1024 -- 100 KB
              local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
              if ok and stats and stats.size > max_filesize then
                  return true
              end
          end,
          additional_vim_regex_highlighting = false,
      	},
      }
    end,
  }
end)

vim.opt.number = true		-- Show line numbers
vim.opt.relativenumber = true	-- Show relative line numbers
vim.opt.expandtab = true	-- Use spaces instead of tabs
vim.opt.shiftwidth = 2		-- Number of spaces to use for auto-indent
vim.opt.smartindent = true	-- Auto-indent based on previous line
vim.opt.wrap = false		-- Don't wrap lines
vim.cmd('colorscheme gruvbox')
