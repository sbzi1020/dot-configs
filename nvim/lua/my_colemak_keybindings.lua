if vim.g.enable_vim_debug then print "'my_colemak_keybindings' has been loaded >>>" end

local function set_key_mapping(mode, key, mapping_command, opts)
    local options = {noremap = true}
    if opts then options = vim.tbl_extend('force', options, opts) end
    --vim.api.nvim_set_keymap(mode, key, mapping_command, options)
    vim.keymap.set(mode, key, mapping_command, options)
end


-- Leader key: <Space>
set_key_mapping('n', '<Space>', '<NOP>', {silent=true})
vim.g.mapleader = ' '


--[[
-----------------------------------------------------------------------
Reload `init.lua`
-----------------------------------------------------------------------
--]]
set_key_mapping('n', '<leader>rr', ':luafile ~/.config/nvim/init.lua<CR>:setlocal nospell<CR>')

--[[
-----------------------------------------------------------------------
Colemak navigation
-----------------------------------------------------------------------
--]]
set_key_mapping('n', 'm', 'h', { noremap=true, silent=true })
set_key_mapping('n', 'n', 'j', { noremap=true, silent=true })
set_key_mapping('n', 'e', 'k', { noremap=true, silent=true })
set_key_mapping('n', 'i', 'l', { noremap=true, silent=true })


-- Edit
set_key_mapping('n', 'L', 'I', { noremap=true, silent=true })
set_key_mapping('n', 'l', 'i', { noremap=true, silent=true })


--[[
-----------------------------------------------------------------------
Normal settings
-----------------------------------------------------------------------
--]]

-- Y: Copy to the end of the line
set_key_mapping('n', 'Y', 'y$')

-- W: save, Q: quit, R: open Ranger/Vifm
set_key_mapping('n', 'W', ':w<CR>')
set_key_mapping('n', 'Q', ':q<CR>')

-- jj: <ESC> from `insert` mode
set_key_mapping('i', 'jj', '<ESC>')
set_key_mapping('v', 'jj', '<ESC>')
set_key_mapping('i', 'jj', '<ESC>')

-- <Tab> and shift+<Tab> to cycle through the opened buffers
set_key_mapping('n', '<Tab>', ':bn<CR>')
set_key_mapping('n', '<S-Tab>', ':bp<CR>')

-- <leader><leader>: toggles between buffers
set_key_mapping('n', '<leader><leader>', '<c-^>', {silent=true})

-- <leader>th: save current file to HTML
set_key_mapping('n', '<leader>e', ':Lexplore<CR>')



--[[
ctrl+s: replace all works under cursor. Do a `/pattern` which the `pattern`
is the word under cursor.

<c-r>(Ctrl+r), <c-w>(Ctrl+w) to Grab the word under cursor
--]]
-- nnoremap <silent> <c-s> *:%s//
-- nnoremap <silent> <c-s> :%s/\<<C-r><C-w>\>/
set_key_mapping('n', '<c-s>', ':%s/<C-r><C-w>//g<left><left>')


--[[
-----------------------------------------------------------------------
Split & window movement
-----------------------------------------------------------------------
--]]

-- Vertical split
set_key_mapping('n', '<leader>vs', ':vsplit<CR>')

set_key_mapping('n', '<C-m>', ':wincmd h<CR>', {silent=true})
set_key_mapping('n', '<C-i>', ':wincmd l<CR>', {silent=true})

-- Can't use '<c-j>' and '<c-k>', as already used for ':cnext<CR>' and ':cNext<CR>'
-- set_key_mapping('n', '<C-j>', ':wincmd j<CR>', {silent=true})
-- set_key_mapping('n', '<C-k>', ':wincmd k<CR>', {silent=true})

-- Resize windows
set_key_mapping('n', '-', ':vertical resize -5<CR>', {silent=true})
set_key_mapping('n', '=', ':vertical resize +5<CR>', {silent=true})
set_key_mapping('n', '|', '<C-w>=', {silent=true})


--[[
-----------------------------------------------------------------------
Block and line movement
-----------------------------------------------------------------------

Visual Mode: Select and cursor enhancement

After make selection on lines:

shift+j: move selection down
shift+k: move selection up
<: move selection to left with one tab distance
>: move selection to right with one tab distance
--]]
set_key_mapping('v', 'N', ":m '>+1<CR>gv=gv")
set_key_mapping('v', 'E', ":m '<-2<CR>gv=gv")
set_key_mapping('v', '<', '<gv')
set_key_mapping('v', '>', '>gv')


--[[
-----------------------------------------------------------------------
Plugin related
-----------------------------------------------------------------------
--]]

-- <leader><CR>: Toggle Goyo mode
set_key_mapping('n', '<leader><CR>', ':Goyo<CR>', {silent=true})


-- <leader>p: Fuzzy file searching
set_key_mapping('n', '<leader>p', ':lua require(\'telescope.builtin\').find_files({layout_strategy = \'vertical\', layout_config = {width=0.6}, previewer = false })<CR>', {silent=true})


-- <leader>B: List opened files (to select)
-- set_key_mapping('n', '<leader>b', ':Buffers<CR>', {silent=true})
set_key_mapping('n', '<leader>b', ':lua require(\'telescope.builtin\').buffers()<CR>', {silent=true})


--[[
-----------------------------------------------------------------------
Basic searching improvement
-----------------------------------------------------------------------
--]]

-- <leader>n: Close highlight
set_key_mapping('n', '<leader>n', ':nohl<CR>')

-- Search results center jump
set_key_mapping('n', 'N', '<NOP>')
set_key_mapping('n', 'k', 'nzz')
set_key_mapping('n', 'K', 'Nzz')

-- Snippets (suggestion list) navigation by `ctrl+j` and `ctrl+k`
set_key_mapping('i', '<c-e>', '<c-p>')

-- <leader>oq: Open quickfix list
-- <leader>cq: Close quickfix list
set_key_mapping('n', '<leader>oq', ':copen<CR>')
set_key_mapping('n', '<leader>cq', ':cclose<CR>')

-- <leader>ol: Open location list
-- <leader>cl: Close location list
set_key_mapping('n', '<leader>ol', ':lopen<CR>')
set_key_mapping('n', '<leader>cl', ':lclose<CR>')

-- Help search by in Telescope
set_key_mapping('n', '<leader>h', ':lua require(\'telescope.builtin\').help_tags()<CR>')


--[[
-----------------------------------------------------------------------
Advanced searching
-----------------------------------------------------------------------
--]]


--[[
<leader>f:

* Run the external `grep` command with the given searching keyword
* Auto jump to the first matching result
--]]
set_key_mapping('n', '<leader>f', ':silent grep ')

--[[
<leader>c: Fuzzy searching for vim comman hisotry
--]]
set_key_mapping('n', '<leader>ch', ':lua require(\'telescope.builtin\').command_history()<CR>')


-- `ctrl+j` and `ctrl+k`: Cycle through the quick fix list and center the current result line
set_key_mapping('n', '<c-n>', ':cnext<CR>zz')
set_key_mapping('n', '<c-e>', ':cNext<CR>zz')


--[[
Rust plugin related

<leader>cc: run shell command `cargo check`
<leader>cb: run shell command `cargo build --release`
<leader>cr: run shell command `cargo run`
--]]
set_key_mapping('n', '<leader>cb', '::vsplit<CR>:terminal cargo build --release<CR>')
set_key_mapping('n', '<leader>cr', '::vsplit<CR>:terminal cargo run <CR>')
set_key_mapping('n', '<leader>ct', '::vsplit<CR>:terminal cargo test<CR>')


--[[
-----------------------------------------------------------------------
<leader>sc: Toggle spell checking
-----------------------------------------------------------------------
--]]
function is_enabled_spell()
    -- vim.wo.spell = !vim.wo.spell
    if vim.wo.spell == true then vim.wo.spell = false
    else vim.wo.spell = true
    end
end


--[[
.md

nn - Go to the next '<++>' placeholder
hh - Add Highlight content
bb - Add Bold content
aa - Add Link content
--]]
vim.cmd 'autocmd FileType markdown inoremap <buffer> nnn <ESC>/<++><CR>:nohl<CR>c4l'
vim.cmd 'autocmd FileType markdown inoremap <buffer> hh `` <++><ESC>F`;a'
vim.cmd 'autocmd FileType markdown inoremap <buffer> bb **** <++><ESC>F*2;a'
vim.cmd 'autocmd FileType markdown inoremap <buffer> aa [](<++>) <++><ESC>F[a'
vim.cmd 'autocmd FileType markdown inoremap <buffer> img ![](<++>) <++><ESC>F[a'
vim.cmd 'autocmd FileType markdown inoremap <buffer> /br <CR></br><CR><CR>'
vim.cmd 'autocmd FileType markdown inoremap <buffer> ``` ```<CR><ESC>i```<ESC>kA'
vim.cmd 'autocmd FileType markdown inoremap <buffer> { {  }<left><left>'
set_key_mapping('n', '<leader>sc', '<cmd>lua is_enabled_spell()<CR>')



--[[
-----------------------------------------------------------------------
Zip fold
-----------------------------------------------------------------------
--]]
-- `<leader>z`: zip fold
--  close zip fold
set_key_mapping('n', '<leader>z', 'zo')
set_key_mapping('n', '<leader><leader>z', 'zc')
set_key_mapping('v', 'z', 'zf')

