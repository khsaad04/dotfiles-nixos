return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "j-hui/fidget.nvim", opts = {} },
	},
	ft = { "python", "rust", "nix", "lua" },
	config = function()
		local lspconfig = require("lspconfig")
		local on_attach = function(_, bufnr)
			local nmap = function(keys, func, desc)
				if desc then
					desc = "LSP: " .. desc
				end

				vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
			end

			nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
			nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
			nmap("K", vim.lsp.buf.hover, "Hover Documentation")
			nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
			nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")
			nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
			nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
			nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
			nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
			nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
		end

		-- Setup neovim lua configuration
		-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

		lspconfig.lua_ls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})

		lspconfig.nixd.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})

		lspconfig.rust_analyzer.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})

		lspconfig.pylsp.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				pylsp = {
					plugins = {
						pycodestyle = {
							enabled = false,
						},
						autopep8 = {
							enabled = false,
						},
						yapf = {
							enabled = false,
						},
						pyflakes = {
							enabled = false,
						},
					},
				},
			},
		})

		-- Diagnostics

		vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
		vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

		local signs = {
			{ name = "DiagnosticSignError", text = "" },
			{ name = "DiagnosticSignWarn", text = "" },
			{ name = "DiagnosticSignHint", text = "" },
			{ name = "DiagnosticSignInfo", text = "" },
		}

		for _, sign in ipairs(signs) do
			vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
		end

		local config = {
			-- disable virtual text
			virtual_text = false,
			signs = {
				active = signs,
			},
			update_in_insert = true,
			underline = true,
			severity_sort = true,
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
				suffix = "",
			},
		}

		vim.diagnostic.config(config)
	end,
}
