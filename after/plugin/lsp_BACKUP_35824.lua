--ThisfunctiongetsrunwhenanLSPconnectstoaparticularbuffer.
local on_attach = function(client, bufnr)
	-- NOTE: Remember that lua is a real programming language, and as such it is possible
	-- to define small helper and utility functions so you don't have to repeat yourself
	-- many times.
	--
	-- In this case, we create a function that lets us more easily define mappings specific
	-- for LSP related items. It sets the mode, buffer and description for us each time.
	if client.name == "ruff" then
		-- Disable hover in favor of Pyright
		client.server_capabilities.hoverProvider = false
		-- client.server_capabilities.linting = false
	end
	local nmap = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end

		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
	end

	nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
	nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

	nmap("<leader>gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
	nmap("<leader>gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
	nmap("<leader>gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
	-- nmap("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
	nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
	nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

	-- See `:help K` for why this keymap
	nmap("K", vim.lsp.buf.hover, "Hover Documentation")
	nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

	-- Lesser used LSP functionality
	nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
	nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
	nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
	nmap("<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, "[W]orkspace [L]ist Folders")

	-- -- Create a command `:Format` local to the LSP buffer
	-- vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
	--   vim.lsp.buf.format()
	-- end, { desc = 'Format current buffer with LSP' })
end

-- document existing key chains
-- mason-lspconfig requires that these setup functions are called in this order
-- before setting up the servers.
require("mason").setup()
require("mason-lspconfig").setup()

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
--
--  If you want to override the default filetypes that your language server will attach to you can
--  define the property 'filetypes' to the map in question.
local servers = {
	-- clangd = {},
	gopls = {},
	taplo = {},
	pyright = {},
	-- pylsp = {},
	-- jedi_language_server = {},
	ruff = {},
	rust_analyzer = {},
	zls = {},
	-- tsserver = {},
	-- html = { filetypes = { 'html', 'twig', 'hbs'} },

	lua_ls = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
			-- NOTE: toggle below to ignore Lua_LS's noisy `missing-fields` warnings
			diagnostics = { disable = { "missing-fields" } },
		},
	},
}

-- Setup neovim lua configuration
require("neodev").setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
require("blink.cmp").get_lsp_capabilities(capabilities)
-- capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
	ensure_installed = vim.tbl_keys(servers),
})

mason_lspconfig.setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = servers[server_name],
			filetypes = (servers[server_name] or {}).filetypes,
		})
	end,
})
<<<<<<< HEAD
-- require ('lspconfig').pylsp.setup {
-- settings = {
-- pylsp = {
-- plugins = {
-- configurationSources = { "flake8" },
-- autopep8 = { enabled = false },
-- flake8 = { enabled = true },
-- mccabe = { enabled = false },
-- preload = { enabled = true },
-- pycodestyle = { enabled = true },
-- pydocstyle = { enabled = false },
-- pyflakes = { enabled = false },
-- pylint = { enabled = false },
-- yapf = { enabled = false },

-- -- https://github.com/python-rope/pylsp-rope
-- rope_autoimport = { enabled = true, memory = true },
-- rope_completion = { enabled = true, eager = true },

-- -- 3rd party plugins
-- -- https://github.com/Richardk2n/pylsp-mypy
-- pylsp_mypy = {
-- live_mode = false,
-- report_progress = true,
-- dmypy = true,
-- },

-- isort = { enabled = false },
-- black = { enabled = false, cache_config = true },
-- ruff = { enabled = false },

-- -- Jedi configuration
-- jedi_hover = { enabled = true },
-- jedi_signature_help = { enabled = true },
-- jedi_references = { enabled = true },
-- jedi_symbols = { enabled = true },
-- jedi_definition = {
-- enabled = true,
-- follow_imports = true,
-- follow_builtin_imports = true,
-- follow_builtin_definitions = true,
-- },
-- jedi_completion = {
-- enabled = true,
-- include_params = true,
-- include_class_objects = false,
-- include_function_objects = false,
-- fuzzy = false,
-- eager = false,
-- resolve_at_most = 25,
-- cache_for = {
-- "pandas",
-- "numpy",
-- "tensorflow",
-- "matplotlib",
-- "pydantic",
-- "fastapi",
-- "flask",
-- "sqlalchemy",
-- "dagster",
-- },
-- },
-- },
-- },
-- },
-- }
=======

-- require("lspconfig").pylsp.setup({
-- 	cmd = { "pylsp", "-vv", "--log-file", "/tmp/nvim-pylsp.log" },
-- 	cmd_env = { VIRTUAL_ENV = ".venv" },
-- 	settings = {
-- 		pylsp = {
-- 			plugins = {
-- 				configurationSources = { "flake8" },
-- 				autopep8 = { enabled = false },
-- 				flake8 = { enabled = true, maxLineLength = 120 },
-- 				mccabe = { enabled = false },
-- 				preload = { enabled = true },
-- 				pycodestyle = { enabled = false },
-- 				pydocstyle = { enabled = false },
-- 				pyflakes = { enabled = false },
-- 				pylint = { enabled = false },
-- 				yapf = { enabled = false },
--
-- 				-- https://github.com/python-rope/pylsp-rope
-- 				rope_completion = {
-- 					enabled = true,
-- 				},
-- 				rope_autoimport = {
-- 					enabled = true,
-- 					completions = {
-- 						enabled = true,
-- 					},
-- 					code_actions = {
-- 						enabled = true,
-- 					},
-- 				},
-- 				-- rope_completion = { enabled = true, eager = true },
--
-- 				-- 3rd party plugins
-- 				-- https://github.com/Richardk2n/pylsp-mypy
-- 				pylsp_mypy = {
-- 					live_mode = false,
-- 					report_progress = true,
-- 					dmypy = true,
-- 				},
-- 				pylsp_rope = { enabled = true },
--
-- 				isort = { enabled = false },
-- 				black = { enabled = false, cache_config = true },
-- 				ruff = { enabled = false },
--
-- 				-- Jedi configuration
-- 				jedi_hover = { enabled = true },
-- 				jedi_signature_help = { enabled = true },
-- 				jedi_references = { enabled = true },
-- 				jedi_symbols = { enabled = true },
-- 				jedi_definition = {
-- 					enabled = true,
-- 					follow_imports = true,
-- 					follow_builtin_imports = true,
-- 					follow_builtin_definitions = true,
-- 				},
-- 				jedi_completion = {
-- 					enabled = true,
-- 					include_params = true,
-- 					include_class_objects = false,
-- 					include_function_objects = false,
-- 					fuzzy = true,
-- 					eager = false,
-- 					resolve_at_most = 25,
-- 					cache_for = {
-- 						"pandas",
-- 						"numpy",
-- 						"tensorflow",
-- 						"matplotlib",
-- 						"pydantic",
-- 						"fastapi",
-- 						"flask",
-- 						"sqlalchemy",
-- 						"dagster",
-- 					},
-- 				},
-- 			},
-- 		},
-- 	},
-- })
>>>>>>> 00f7d7b (some old changes, dopn't remember)
require("lspconfig").pyright.setup({
	settings = {
		pyright = {
			-- Using Ruff's import organizer
			disableOrganizeImports = true,
			-- disableLanguageServices = true,
			-- reportMissingModuleSource = "none",
			-- reportMissingImports = "none",
			-- reportUndefinedVariable = "none",
			reportAny = "none",
		},
		python = {
			analysis = {
				-- Ignore all files for analysis to exclusively use Ruff for linting
				ignore = { "*" },
				typeCheckingMode = "off",
			},
		},
	},
})
-- require('go').setup({
--   -- other setups ....
--   lsp_cfg = {
--     capabilities = capabilities,
--     on_attach = on_attach,
--     -- other setups
--   },
-- })
