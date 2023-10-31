local M = {}

M.treesitter = {
  prefer_git = true,
  ensure_installed = {
                "go",
    "vim",
    "json",
    "toml",
    "markdown",
    "c",
    "bash",
    "lua",
  },
}

M.mason = {
  ensure_installed = {
    "gopls",

    -- lua stuff
    "lua-language-server",
    "stylua",

    -- shell
    "shfmt",
    "shellcheck",
    "bash-language-server",
  },
}

return M
