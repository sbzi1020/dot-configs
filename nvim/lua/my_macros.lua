--[[
[ JSS macro ]

Turn the "a-b: column;" into "aB: `column`,"

For example, "flex-direction: column;" --> "flexDirection: `column`,"
--]]
vim.cmd 'let @c="^f-xvUf:wvt;S`$C,\\<ESC>j"'


--[[
[ JSS macro ]

Turn the "a: column;" into "a: `column`,"

For example, "display: flex;" --> "display: `flex`,"
--]]
vim.cmd 'let @d="^f:wvt;S`$C,\\<ESC>j"'
