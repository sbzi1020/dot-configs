local opts_with_silent = {noremap = true, silent = true}
--
-- Find files using Telescope command-line sugar.
vim.api.nvim_set_keymap('n', '<leader>p', '<cmd>lua require(\'telescope.builtin\').find_files()<cr>' , opts_with_silent)
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>lua require(\'telescope.builtin\').live_grep()<cr>', opts_with_silent)
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>lua require(\'telescope.builtin\').buffers()<cr>' , opts_with_silent)
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>lua require(\'telescope.huiltin\').help_tags()<cr>' , opts_with_silent)

local actions = require('telescope.actions')

require('telescope').setup {
    defaults = {
        layout_config = {
            width = 0.90,
            prompt_position = 'top',
            horizontal = {
                preview_width = 0.45,
                mirror = false,
            }
        },
        layout_strategy = 'horizontal',
        sorting_strategy = 'ascending',
        -- search bar settings
        prompt_prefix = '>',
        selection_caret = '>',
        entry_prefix = ' ',
        initial_mode = 'insert',
        -- Customized Key mapping
        i = {
            ['<C-j>'] = actions.move_selection_next,
            ['<C-k>'] = actions.move_selection_previous,

        }
    }
}

