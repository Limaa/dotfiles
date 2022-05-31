-- nvim-treesitter
require'nvim-treesitter.configs'.setup {
	ensure_installed = {
		"bash",
		"c", "cpp", "cmake",
		"dockerfile",
		"html", "javascript", "typescript", "json",
		"lua",
		"php",
		"python",
		"rust",
	},
	highlight = {
		enable = true,
	},
}


-- https://github.com/hrsh7th/nvim-cmp
-- Setup nvim-cmp.
local cmp = require'cmp'
cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
			-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
			-- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
		end,
	},
	mapping = {
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
	},
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'vsnip' }, -- For vsnip users.
		-- { name = 'luasnip' }, -- For luasnip users.
		-- { name = 'ultisnips' }, -- For ultisnips users.
		-- { name = 'snippy' }, -- For snippy users.
		}, {
			{ name = 'buffer' },
		}
	)
})


-- Setup lspconfig
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local lspconfig = require('lspconfig')

config = {
  capabilities = capabilities
}

lspconfig.bashls.setup(config)
lspconfig.clangd.setup(config)
lspconfig.cmake.setup(config)
lspconfig.dockerls.setup(config)
lspconfig.vimls.setup(config)
lspconfig.pyright.setup(config)
-- lspconfig.pylsp.setup(config)


require('rust-tools').setup({})

