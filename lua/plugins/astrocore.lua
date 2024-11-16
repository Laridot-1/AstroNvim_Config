-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing
--

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = false, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = true, -- sets vim.opt.wrap
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
        mapleader = " ",
        autoformat_enabled = true,
        cmp_enabled = true,
        autopairs_enabled = true,
        diagnostics_mode = 3,
        icons_enabled = true,
        ui_notifications_enabled = true,
        resession_enabled = false,
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        ["<Tab>"] = {
          function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer",
        },
        ["te"] = { "<cmd>tabnew<cr>", desc = "New tab" },
        -- ["<leader>x"] = { function() atrocore.buffer.close() end, desc = "Close buffer" },
        ["<C-n>"] = { "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer" },
        ["ff"] = { function() require("telescope.builtin").find_files() end, desc = "Find files" },
        ["fw"] = { function() require("telescope.builtin").grep_string() end, desc = "Find word under cursor" },
        ["fc"] = { function() require("telescope.builtin").current_buffer_fuzzy_find() end, desc = "Find words in current buffer" },
        ["fg"] = { function()                                            require("telescope.builtin").live_grep {
            additional_args = function(args) return vim.list_extend(args, { "--hidden", "--no-ignore"})
          end,
        }
        end,
        desc = "Live grep",
        },
        ["<A-h>"] = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "ToggleTerm horizontal split" },
        -- ["<A-g>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
        -- ["<leader>bD"] = {
          -- function()
            -- require("astronvim.utils.status").heirline.buffer_picker(
              -- function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
            -- )  end,                                           desc = "Pick to close",
        -- },
        ["<leader>b"] = { name = "Buffers" },
        ["<C-s>"] = { ":w<cr>", desc = "Save File" },
        ["<leader>x"] = {function() require("astrocore.buffer").close() end, desc = "Close buffer"}
      }
    },
  },
}
