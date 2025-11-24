return {
  "nvim-neotest/neotest",
  lazy = true,
  dependencies = { "nvim-neotest/neotest-python", "nvim-neotest/neotest-plenary", "nvim-neotest/neotest-jest" },
  config = function()
    local neotest = require("neotest")

    neotest.setup({
      adapters = {
        require("neotest-python")({ dap = { justMyCode = false }, runner = "pytest", }),
        require("neotest-jest")({ jestCommand = "npm test --", })
      },
    })

    vim.keymap.set("n", "<leader>tn", function() neotest.run.run() end, { desc = "Run nearest test" })
    vim.keymap.set("n", "<leader>tf", function() neotest.run.run(vim.fn.getcwd()) end, { desc = "Run all tests in project" })
    vim.keymap.set("n", "<leader>ts", function() neotest.summary.toggle() end, { desc = "Toggle test summary" })
  end
}
