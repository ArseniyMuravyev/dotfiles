require("obsidian").setup {
  workspaces = {
    {
      name = "Notes",
      path = "~/Notes",
    },
  },

  mappings = {
    ["gf"] = {
      action = function()
        return require("obsidian").util.gf_passthrough()
      end,
      opts = { noremap = false, expr = true, buffer = true },
    },
    ["<leader>ch"] = {
      action = function()
        return require("obsidian").util.toggle_checkbox()
      end,
      opts = { buffer = true },
    },
    ["<cr>"] = {
      action = function()
        return require("obsidian").util.smart_action()
      end,
      opts = { buffer = true, expr = true },
    },
  },
  ---@param url string
  follow_url_func = function(url)
    vim.fn.jobstart { "open", url }
  end,
}
