require'lualine'.setup {
      options = {theme = 'dracula'},
}

---@diagnostic disable-next-line: unused-local
local function on_attach()
    -- TODO: TJ told me to do this and I should do it because he is Telescopic
    -- "Big Tech" "Cash Money" Johnson
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

require'lspconfig'.vuels.setup{
  capabilities = capabilities,
}
require'lspconfig'.tsserver.setup{
  capabilities = capabilities,
}
require'lspconfig'.vimls.setup{
  capabilities = capabilities,
}
require'lspconfig'.html.setup {
  capabilities = capabilities,
}

-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
local sumneko_root_path = "/home/oacs/lua-language-server"
local sumneko_binary = sumneko_root_path.."/bin/Linux/lua-language-server"

require'lspconfig'.sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  settings = {
    Lua = {
  capabilities = capabilities,
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

local opts = {
    -- whether to highlight the currently hovered symbol
    -- disable if your cpu usage is higher than you want it
    -- or you just hate the highlight
    -- default: true
    highlight_hovered_item = true,

    -- whether to show outline guides
    -- default: true
    show_guides = true,
}

require('symbols-outline').setup(opts)


require 'nvim-treesitter.install'.compilers = { "gcc", "clang" }

require'nvim-treesitter.configs'.setup {
  ensure_installed = { 'bash', 'cpp', 'comment', 'css', 'graphql', 'html', 'javascript', 'jsdoc', 'json', 'lua', 'python', 'regex', 'tsx', 'vue', 'typescript' },
  highlight = { enable = true },
  incremental_selection = { enable = true },
  textobjects = { enable = true },
}

require("harpoon").setup{
    global_settings = {
        save_on_toggle = false,
        save_on_change = true,
    },
     projects = {
        -- Yes $HOME works
        ["$HOME/dev/admin-portal"] = {
            term = {
                cmds = {
                    "./frontend && npm start",
                    "./backend && npm run start:ubuntu",
                }
            }
        }
    }
}

local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        -- For `vsnip` user.
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` user.

        -- For `luasnip` user.
        -- require('luasnip').lsp_expand(args.body)

        -- For `ultisnips` user.
        -- vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    mapping = {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
      { name = 'nvim_lsp' },

      -- For vsnip user.
      { name = 'vsnip' },

      -- For luasnip user.
      -- { name = 'luasnip' },

      -- For ultisnips user.
      -- { name = 'ultisnips' },

      { name = 'buffer' },
    }
  })

