local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  'tsserver',
  'pyright',
  'angularls'
})



lsp.configure('lua-language-server', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

lsp.configure('pyright', {
  on_attach = function(client, bufnr)
    print('PyRight Started')
  end,
  settings = {
      python = {
          analysis = {
              autoSearchPaths = true,
              diagnosticMode = "workspace",
              useLibraryCodeForTypes = true,
          }
      }
  }
})

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]


local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

--[[
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

]]--

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
  function getDesc(description)
    return {buffer = bufnr, remap = false, desc=description}
  end

  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "<leader>lgd", function() vim.lsp.buf.definition() end, getDesc("Go to Definition"))
  vim.keymap.set("n", "<leader>lgD", function() vim.lsp.buf.declaration() end, getDesc("Go to Declaration"))
  vim.keymap.set("n", "<leader>lgi", function() vim.lsp.buf.implementation() end, getDesc("List All Implementations"))
  vim.keymap.set("n", "<leader>lgt", function() vim.lsp.buf.type_definition() end, getDesc("Go to Type Definition"))
  vim.keymap.set("n", "<leader>lgr", function() vim.lsp.buf.references() end, getDesc("Go to References"))
  vim.keymap.set("n", "<leader>li", function() vim.lsp.buf.hover() end, getDesc("Get Symbol Informations (If Any)"))
  vim.keymap.set("n", "<leader>ld", function() vim.diagnostic.open_float() end, getDesc("Show Diagnostics in Floating Window"))
  vim.keymap.set("n", "<leader>ln", function() vim.diagnostic.goto_next() end, getDesc("Next Definition"))
  vim.keymap.set("n", "<leader>lp", function() vim.diagnostic.goto_prev() end, getDesc("Previous Definition"))
  vim.keymap.set("n", "<leader>lr", function() vim.lsp.buf.rename() end, getDesc("Rename Symbol References"))
  vim.keymap.set("n", "<leader>lh", function() vim.lsp.buf.signature_help() end, getDesc("Displays Signature Information"))
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})
