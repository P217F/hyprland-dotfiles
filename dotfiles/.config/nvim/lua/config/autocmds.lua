local function set_transparent()
  vim.cmd [[
    hi CursorLine      guibg=NONE ctermbg=NONE
    hi CursorLineNr    guibg=NONE ctermbg=NONE
    hi LineNr          guibg=NONE ctermbg=NONE
    hi SignColumn      guibg=NONE ctermbg=NONE
    hi Pmenu           guibg=#363632 ctermbg=NONE
    hi PmenuSel        guibg=#b8bb26 ctermbg=NONE
    hi NormalFloat     guibg=NONE ctermbg=NONE
    hi FloatBorder     guibg=NONE ctermbg=NONE
  ]]
end

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = set_transparent,
})

vim.api.nvim_create_autocmd("VimEnter", {
  callback = set_transparent,
})

set_transparent()
