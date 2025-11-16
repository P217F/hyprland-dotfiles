local function set_transparent()
  vim.cmd [[
    hi CursorLine guibg=NONE ctermbg=NONE
    hi CursorLineNr guibg=NONE ctermbg=NONE
    hi LineNr guibg=NONE ctermbg=NONE
    hi SignColumn guibg=NONE ctermbg=NONE
    ]]
end

vim.api.nvim_create_autocmd("ColorScheme", { pattern="*", callback=set_transparent })
vim.api.nvim_create_autocmd("VimEnter", { callback=set_transparent })
set_transparent()

