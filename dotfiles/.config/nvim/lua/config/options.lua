-- Option
vim.opt.compatible = false
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.timeoutlen = 400
vim.opt.updatetime = 160
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.fillchars = { eob=" " }
vim.opt.shortmess:append("sI")
vim.opt.whichwrap:append("<,>,[,],h,l")
vim.opt.laststatus = 3
vim.opt.termguicolors = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = " "
vim.o.cursorline = true

-- Saved notify
local write_failed = false
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    write_failed = false
  end,
})
vim.api.nvim_create_autocmd("BufWritePost", {
  callback = function(args)
    if vim.bo.modified then
      write_failed = true
    end
    if not write_failed then
      vim.notify("✅ Saved: " .. args.file)
    else
      vim.notify("❌ Error Saving: " .. args.file, vim.log.levels.ERROR)
    end
  end,
})

