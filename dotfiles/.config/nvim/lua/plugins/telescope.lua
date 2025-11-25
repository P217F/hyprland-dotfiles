return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  lazy = false,
  cmd = "Telescope",
  config = function()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")
    local Path = require("plenary.path")

    telescope.setup({
      defaults = {
        layout_strategy = "horizontal",
        layout_config = {
          width = 0.9,
          height = 0.9,
          preview_cutoff = 120,
          prompt_position = "top",
        },
        sorting_strategy = "ascending",
        preview = { hide_on_startup = false },
        file_ignore_patterns = { "node_modules", ".git/" },
      },
      pickers = {
        find_files = {
          hidden = true,
          previewer = true,
        },
        live_grep = {
          previewer = true,
        },
        buffers = {
          previewer = true,
        },
      },
    })

    vim.keymap.set("n", "<F1>", builtin.find_files, { desc = "Find files" })
    vim.keymap.set("n", "<F2>", builtin.live_grep, { desc = "Live grep" })
    vim.keymap.set("n", "<F3>", builtin.oldfiles, { desc = "Oldfiles" })

    local project_patterns = {
      ".git", ".hg", ".svn",
      "package.json", "yarn.lock", "pnpm-lock.yaml", "tsconfig.json",
      "pyproject.toml", "requirements.txt", "setup.py", "Pipfile",
      "Cargo.toml", "go.mod",
      "Makefile", "CMakeLists.txt",
      "init.lua", "lua",
      ".env", ".env.local", ".nvim.lua", "README.md",
    }

    local function find_project_root()
      local cwd = vim.fn.expand("%:p:h")
      while cwd ~= "/" do
        for _, pattern in ipairs(project_patterns) do
          if Path:new(cwd, pattern):exists() then
            return cwd
          end
        end
        cwd = Path:new(cwd):parent():absolute()
      end
      return vim.loop.cwd()
    end

    local function telescope_projects()
      local root = find_project_root()
      builtin.find_files({ cwd = root, prompt_title = "Project Files", hidden = true, no_ignore = true, })
    end

    vim.keymap.set("n", "<leader>pp", telescope_projects, { desc = "Telescope: Project Files" })
    vim.keymap.set("n", "<leader>pc", function()
      local root = find_project_root()
      vim.cmd("lcd " .. root)
      print("Project root set to: " .. root)
    end, { desc = "Set Project Root manually" })
  end,
}
