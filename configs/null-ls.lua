local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

local sources = {
  formatting.goimports,
  formatting.golines,
  formatting.gofmt,
  formatting.prettier,
  formatting.stylua,
  formatting.beautysh,
  formatting.black,
  formatting.buf,
  formatting.buildifier,
  formatting.cbfmt,
  formatting.csharpier,
  formatting.hclfmt,
  formatting.jq,
  formatting.lua_format,
  formatting.rego,
  formatting.rubocop,
  formatting.shfmt,
  formatting.stylua,
  formatting.taplo,
  formatting.terraform_fmt,
  formatting.tidy,
  formatting.yq,

  lint.golangci_lint,
  lint.shellcheck,
  lint.hadolint,
  lint.jsonlint,
  lint.luacheck,
  lint.markdownlint,
  lint.opacheck,
  lint.protolint,
  lint.rubocop,
  lint.terraform_validate,
  lint.tidy,
  lint.todo_comments,
  lint.trail_space,
  lint.write_good,
  lint.yamllint,
}


local opts = {
  sources = sources,
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr,
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
        })
    end
  end,
}

return opts