local overrides = require("custom.configs.overrides")

local plugins = {
--[[
--]]
  { "williamboman/mason.nvim", opts = overrides.mason },
  { "nvim-treesitter/nvim-treesitter", opts = overrides.treesitter },
--  { "nvim-tree/nvim-tree.lua", opts = overrides.nvimtree },
  --  setup our cusotm nvim-tree
  { "nvim-tree/nvim-tree.lua",
    config = function()
      require "custom.configs.nvim-tree"
    end
  },
-- mappings/loading is borked atm
--  { "mfussenegger/nvim-dap",
--     init = function()
--       require("core.utils").load_mappings("dap")
--     end,
--  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  { "jose-elias-alvarez/null-ls.nvim",
    ft = "go",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },

  --------------------------------------------- custom plugins ----------------------------------------------
  -- Go debug adapter
  { "dreamsofcode-io/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)
      require("core.utils").load_mappings("dap_go")
    end
  },

  -- light version of vim-go adds a bunch of :Go cmds
  { "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
      require("core.utils").load_mappings("gopher")
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },

  -- smooth scroll
  { "karb94/neoscroll.nvim",
    keys = { "<C-d>", "<C-u>" },
    config = function() require("neoscroll").setup() end
  },

  -- dim inactive windows
  { "andreadev-it/shade.nvim",
    config = function()
      require("shade").setup {
        exclude_filetypes = { "NvimTree" },
      }
    end,
  },

  -- pretty diagnostics panel
  { "folke/trouble.nvim",
    cmd = "Trouble",
    config = function() require("trouble").setup() end
  },

  -- terminal tweaks uses <leader>-h|v to toggle on/off vs create/delete
  { "zbirenbaum/nvim-chadterm",
    setup = function()
      vim.schedule_wrap(vim.cmd[[packadd nvim-chadterm]])
    end,
    config = function()
      vim.schedule_wrap(require("chadterm").setup({}))
    end
  },

  -- Golden ratio resizing, and window tinting
  { "beauwilliams/focus.nvim",
    lazy = false,
    config = function()
      require("focus").setup {
        winhighlight = true,
      }
    end
  },

  -- Tmux and nvim lpaying nice together
  --  {"aserowy/tmux.nvim",
  --    lazy = false,
  --    config = function() return require("tmux").setup() end
  --  }
  { "alexghergh/nvim-tmux-navigation",
    lazy = false,
    config = function()
      local nvim_tmux_nav = require("nvim-tmux-navigation")
      nvim_tmux_nav.setup { disable_when_zoomed = true }
      vim.keymap.set('n', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
      vim.keymap.set('n', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
      vim.keymap.set('n', "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
      vim.keymap.set('n', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
      vim.keymap.set('n', "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
      vim.keymap.set('n', "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
    end
  },

  -- better marks
  { "chentoast/marks.nvim",
    lazy = false,
    config = function()
                        require("marks").setup()
                end
  },
}




return plugins