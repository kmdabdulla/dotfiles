require("mason-lspconfig").setup()
local configs = require 'lspconfig.configs'
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

if not configs.intelephense then
  configs.intelephense = {
    default_config = {
      cmd = { 'intelephense', '--stdio' };
      filetypes = { 'php' };
      root_dir = function(fname)
        return vim.loop.cwd()
      end;
      settings = {
        intelephense = {
          files = {
            maxSize = 1000000;
          };
        }
      }
    }
  }
end

require('lspsaga').setup({
  code_action_icon = "💡",
  symbol_in_winbar = {
    in_custom = false,
    enable = true,
    separator = ' ',
    show_file = true,
    file_formatter = ""
  },
})

vim.keymap.set("n", "gd", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<cr>', { silent = true })
vim.keymap.set({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { silent = true })

require("lspconfig").lua_ls.setup {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.stdpath "config" .. "/lua"] = true,
        },
      },
    },
  }
}

require("lspconfig").solargraph.setup {
  capabilities = capabilities
}

require("lspconfig").pyright.setup {
  capabilities = capabilities
}
require("lspconfig").intelephense.setup {
  capabilities = capabilities
}
