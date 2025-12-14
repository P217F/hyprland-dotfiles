return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
    },
    cmd = "Neogit",
    keys = {
        { "gi", "<cmd>Neogit<CR>" },
    },
    config = function()
        require("neogit").setup({
            disable_commit_confirmation = true,
            kind = "tab",
            integrations = {
                diffview = true,
            },
            signs = {
                section = { "", "" },
                item = { "", "" },
                hunk = { "", "" },
            },
        })
    end,
}
