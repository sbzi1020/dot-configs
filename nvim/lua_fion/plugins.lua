local fn = vim.fn

-- `data` usually point to `$HOME/.local/share/nvim`
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
-- print("install_path: "..install_path)

local packer_first_installed = false
if fn.empty(fn.glob(install_path)) > 0 then
  packer_first_installed = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

--[[
Every time save this fiile, run the `:PackerSync` command to make sure all
plugins are up-to-date.
--]]
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost my_plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    -- non_interactive = true,
    -- open_fn = function()
    --   return require("packer.util").float { border = "rounded" }
    -- end,
  },
}
-- Only required if you have packer configured as `opt`
return require('packer').startup(function()
    
use 'wbthomason/packer.nvim'
-- telescope
use {
  'nvim-telescope/telescope.nvim',
  requires = { {'nvim-lua/plenary.nvim'} }
}


end)
