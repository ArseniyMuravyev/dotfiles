local M = {}

M.treesitter = {
  ensure_installed = {
    "html",
    "vim",
    "lua",
    "javascript",
    "typescript",
    "tsx",
    "css",
  },
  indent = {
    enable = true,
  },
}

M.mason = {
  ensure_installed = {
    "lua-language-server",
    "typescript-language-server",
    "prettier",
    "pyright",
    "eslint_d",
    "css-lsp",
    "emmet-language-server",
    "html-lsp",
    "stylua",
  },
}

M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
