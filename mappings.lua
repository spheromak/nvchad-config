local M = {}

-- our custom keymaps
M.abc = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait =true} },
    ["<leader>n"] = { function() vim.diagnostic.open_float { border = "rounded" } end, "Floating diagnostic" },
    ["n"] = { function()
                vim.diagnostic.goto_next {
                  severity = {
                    vim.diagnostic.severity.ERROR,
                    vim.diagnostic.severity.WARN,
                    vim.diagnostic.severity.HINT,
                  },
                  float = { border = "rounded"}
                }
              end, "Next diagnostic in Floating window"
            },
   ["<C-1>"] = { "tabn1<cr>", "GOTO Tab 1"},
   ["<C-2>"] = { "tabn2<cr>", "GOTO Tab 2"},
   ["<C-3>"] = { "tabn3<cr>", "GOTO Tab 3"},
   ["<C-4>"] = { "tabn4<cr>", "GOTO Tab 4"},
   ["<C-5>"] = { "tabn5<cr>", "GOTO Tab 5"},

   ["<leader>1"] = { function() vim.api.nvim_set_current_buf(vim.t.bufs[1]) end, "GOTO Buffer 1"},
   ["<leader>2"] = { function() vim.api.nvim_set_current_buf(vim.t.bufs[2]) end, "GOTO Buffer 2"},
   ["<leader>3"] = { function() vim.api.nvim_set_current_buf(vim.t.bufs[3]) end, "GOTO Buffer 3"},
   ["<leader>4"] = { function() vim.api.nvim_set_current_buf(vim.t.bufs[4]) end, "GOTO Buffer 4"},
   ["<leader>5"] = { function() vim.api.nvim_set_current_buf(vim.t.bufs[5]) end, "GOTO Buffer 5"},

    -- switch between windows
    -- CTRL-motion is bound to the tmux
    ["<A-h>"] = { "<C-w>h", "Window left" },
    ["<A-l>"] = { "<C-w>l", "Window right" },
    ["<A-j>"] = { "<C-w>j", "Window down" },
    ["<A-k>"] = { "<C-w>k", "Window up" },
  },
        i = {

        }
}

-- disable these nvchad keymaps
M.disabled = {
  -- umap the ctrl maps so our nvim+tmux works
  i = {
    ["<C-h>"] = "",
    ["<C-l>"] = "",
    ["<C-j>"] = "",
    ["<C-k>"] = "",
    ["<C-p>"] = "",
  },

  n = {
    ["<C-j>"] = "",
    ["<C-k>"] = "",
    ["<C-h>"] = "",
    ["<C-l>"] = "",
    ["<C-p>"] = "",
  },

}

return M