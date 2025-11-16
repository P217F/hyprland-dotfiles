return {
  "goolord/alpha-nvim",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- 🧱 Header
    dashboard.section.header.val = {
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      " █████╗ ██╗     ██╗     ███████╗███╗   ██╗",
      "██╔══██╗██║     ██║     ██╔════╝████╗  ██║",
      "███████║██║     ██║     █████╗  ██╔██╗ ██║",
      "██╔══██║██║     ██║     ██╔══╝  ██║╚██╗██║",
      "██║  ██║███████╗███████╗███████╗██║ ╚████║",
      "╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═══╝",
      "                  NEOVIM DASHBOARD",
    }

    -- 🧭 Buttons
    dashboard.section.buttons.val = {  
      dashboard.button("F1", "󰱼  Search Text with Telescope", ":Telescope live_grep<CR>"),
      dashboard.button("F6","󰙅  Show NvimTree", ":NvimTreeToggle<CR>"),
      dashboard.button("F9","  Open Terminal", ":ToggleTerm<CR>"),
    }

    -- 🪶 Footer
    dashboard.section.footer.val = "⚡ Welcome back, ALLEN — loaded via Lazy.nvim ⚡"

    dashboard.opts.opts.noautocmd = true
    alpha.setup(dashboard.opts)

    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyVimStarted",
      callback = function()
        if vim.fn.argc() == 0 then
          require("alpha").start(true)
        end
      end,
    })

    vim.api.nvim_create_autocmd("BufDelete", {
      callback = function()
        if vim.fn.bufnr("$") == 1 and vim.api.nvim_buf_get_name(0) == "" then
          require("alpha").start(true)
        end
      end,
    })
  end,
}
