return {

	{
		-- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
		-- used for completion, annotations and signatures of Neovim apis
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		-- Main LSP Configuration
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs and related tools to stdpath for Neovim
			-- Mason must be loaded before its dependents so we need to set it up here.
			-- :NOTE tip:  `opts = {}` is the same as calling `require('mason').setup({})`
			{ "williamboman/mason.nvim", opts = {} },
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",

			-- Useful status updates for LSP.
			{
				"j-hui/fidget.nvim",
				opts = {},
				config = function()
					require("fidget").setup({
						notification = {
							window = {
								winblend = 0,
							},
						},
						-- ... the rest of your fidget config
					})
				end,
			},

			-- Allows extra capabilities provided by nvim-cmp
			-- 'hrsh7th/cmp-nvim-lsp',
		},
		config = function()
			-- Brief aside: **What is LSP?**
			--
			-- LSP is an initialism you've probably heard, but might not understand what it is.
			--
			-- LSP stands for Language Server Protocol. It's a protocol that helps editors
			-- and language tooling communicate in a standardized fashion.
			--
			-- In general, you have a "server" which is some tool built to understand a particular
			-- language (such as `gopls`, `lua_ls`, `rust_analyzer`, etc.). These Language Servers
			-- (sometimes called LSP servers, but that's kind of like ATM Machine) are standalone
			-- processes that communicate with some "client" - in this case, Neovim!
			--
			-- LSP provides Neovim with features like:
			--  - Go to definition
			--  - Find references
			--  - Autocompletion
			--  - Symbol Search
			--  - and more!
			--
			-- Thus, Language Servers are external tools that must be installed separately from
			-- Neovim. This is where `mason` and related plugins come into play.
			--
			-- If you're wondering about lsp vs treesitter, you can check out the wonderfully
			-- and elegantly composed help section, `:help lsp-vs-treesitter`

			--  This function gets run when an LSP attaches to a particular buffer.
			--    That is to say, every time a new file is opened that is associated with
			--    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
			--    function will be executed to configure the current buffer
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
				callback = function(event)
					-- :NOTE tip:  Remember that Lua is a real programming language, and as such it is possible
					-- to define small helper and utility functions so you don't have to repeat yourself.
					--
					-- In this case, we create a function that lets us more easily define mappings specific
					-- for LSP related items. It sets the mode, buffer and description for us each time.
					local map = function(keys, func, desc, mode)
						mode = mode or "n"
						vim.keymaps.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					-- This function resolves a difference between neovim nightly (version 0.11) and stable (version 0.10)
					---@param client vim.lsp.Client
					---@param method vim.lsp.protocol.Method
					---@param bufnr? integer some lsp support methods only in specific files
					---@return boolean
					local function client_supports_method(client, method, bufnr)
						if vim.fn.has("nvim-0.11") == 1 then
							return client:supports_method(method, bufnr)
						else
							return client.supports_method(method, { bufnr = bufnr })
						end
					end
				end,
			})

			-- Diagnostic Config
			-- See :help vim.diagnostic.Opts
			vim.diagnostic.config({
				severity_sort = true,
				float = { border = "rounded", source = "if_many" },
				underline = { severity = vim.diagnostic.severity.ERROR },
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = "󰅚 ",
						[vim.diagnostic.severity.WARN] = "󰀪 ",
						[vim.diagnostic.severity.INFO] = "󰋽 ",
						[vim.diagnostic.severity.HINT] = "󰌶 ",
					},
				} or {},
				virtual_text = {
					source = "if_many",
					spacing = 2,
					format = function(diagnostic)
						local diagnostic_message = {
							[vim.diagnostic.severity.ERROR] = diagnostic.message,
							[vim.diagnostic.severity.WARN] = diagnostic.message,
							[vim.diagnostic.severity.INFO] = diagnostic.message,
							[vim.diagnostic.severity.HINT] = diagnostic.message,
						}
						return diagnostic_message[diagnostic.severity]
					end,
				},
			})

			-- LSP servers and clients are able to communicate to each other what features they support.
			--  By default, Neovim doesn't support everything that is in the LSP specification.
			--  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
			--  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.

			--   local capabilities = vim.lsp.protocol.make_client_capabilities() -- Enable this for nvim-cmp
			-- capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities()) -- Enable this for nvim-cmp

			local original_capabilities = vim.lsp.protocol.make_client_capabilities() -- Enable this for blink-cmp
			local capabilities = require("blink.cmp").get_lsp_capabilities(original_capabilities) --Enable this for blink-cmp

			-- Enable the following language servers
			--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
			--
			--  Add any additional override configuration in the following tables. Available keys are:
			--  - cmd (table): Override the default command used to start the server
			--  - filetypes (table): Override the default list of associated filetypes for the server
			--  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
			--  - settings (table): Override the default settings passed when initializing the server.
			--        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
			local servers = {
				-- bashls = {},
				-- clangd = {},
				-- gopls = {},
				-- pyright = {},
				-- rust_analyzer = {},
				-- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
				-- :CONFIG Reference: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
				--
				-- Some languages (like typescript) have entire language plugins that can be useful:
				--    https://github.com/pmizio/typescript-tools.nvim
				--
				-- But for many setups, the LSP (`ts_ls`) will work just fine
				-- ts_ls = {},
				--
				vim.lsp.enable("lua_ls"),
				lua_ls = {
					cmd = { "lua-language-server" },
					filetypes = { "lua" },
					capabilities = capabilities,
					root_markers = {
						".emmyrc.json",
						".luarc.json",
						".luarc.jsonc",
						".luacheckrc",
						".stylua.toml",
						"stylua.toml",
						"selene.toml",
						"selene.yml",
						".git",
					},
					settings = {
						Lua = {
							completion = {
								callSnippet = "Replace",
							},
							-- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
							diagnostics = { globals = { "vim" } },
							-- diagnostics = { disable = { "missing-fields" }, globals = { "vim", "Snacks" } },
							telemetry = {
								enable = false,
							},
						},
					},
				},

				tailwindcss = {
					capabilities = capabilities,
					filetypes = { "svelte", "html", "typescript", "javascript", "markdown" },
					root_pattern = {
						"tailwind.config.js",
						"tailwind.config.cjs",
						"tailwind.config.mjs",
						"tailwind.config.ts",
						"postcss.config.js",
						"postcss.config.cjs",
						"postcss.config.mjs",
						"postcss.config.ts",
						"package.json",
						"node_modules",
						".git",
					},

					settings = {
						tailwindCSS = {
							classAttributes = { "class", "className", "class:list", "classList", "ngClass" },
							lint = {
								cssConflict = "warning",
								invalidApply = "error",
								invalidConfigPath = "error",
								invalidScreen = "error",
								invalidTailwindDirective = "error",
								invalidVariant = "error",
								recommendedVariantOrder = "warning",
							},
							validate = true,
						},
					},
				},

				svelte = {
					capabilities = capabilities,
				},

				vim.lsp.enable("emmet_ls"),
				emmet_ls = {
					cmd = { "emmet-ls", "--stdio" },
					capabilities = capabilities,
					filetypes = {
						"markdown",
						"htmldjango",
						"html",
						"css",
						"sass",
						"scss",
						"less",
					},
				},

				vim.lsp.enable("denols"),
				denols = {
					cmd = { "deno", "lsp" },
					capabilities = capabilities,
					cmd_env = { NO_COLOR = true },
					filetypes = {
						"svelte",
						"javascript",
						"javascriptreact",
						"javascript.jsx",
						"typescript",
						"typescriptreact",
						"typescript.tsx",
					},
					settings = {
						deno = {
							enable = true,
							suggest = {
								imports = {
									hosts = {
										["https://deno.land"] = true,
									},
								},
							},
						},
					},
				},

				-- vim.lsp.enable("harper_ls"),
				-- harper_ls = {
				-- 	cmd = { "harper-ls", "--stdio" },
				-- 	capabilities = capabilities,
				-- 	filetypes = { "markdown", "html" },
				-- 	root_markers = {".git"},
				-- },

				-- vim.lsp.enable("postgres_lsp"),
				-- postgrestools = {
				-- 	cmd = { "postgrestools", "lsp-proxy" },
				-- 	filetypes = { "sql" },
				-- },
				--
				-- vim.lsp.enable("docker_compose_language_service"),
				-- docker_compose_language_service = {
				-- 	cmd = { "docker-compose-langserver", "--stdio" },
				-- 	filetypes = { "yaml.docker-compose" },
				-- 	root_markers = { "docker-compose.yaml", "docker-compose.yml", "compose.yaml", "compose.yml" },
				-- },
			}

			-- Ensure the servers and tools above are installed
			--
			-- To check the current status of installed tools and/or manually install
			-- other tools, you can run
			--    :Mason
			--
			-- You can press `g?` for help in this menu.
			--
			-- `mason` had to be setup earlier: to configure its options see the
			-- `dependencies` table for `nvim-lspconfig` above.
			--
			-- You can add other tools here that you want Mason to install
			-- for you, so that they are available from within Neovim.
			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, {
				"stylua", -- Used to format Lua code
				-- "ts_ls",
				"svelte",
				-- "cssls",
				"lua_ls",
				-- "bashls",
				-- "autopep8",
				-- "rust_analyzer",
				"tailwindcss",
				"emmet_ls",
				-- "html",
				-- "sleek", -- Used to format sql with conform.nvim
				-- "docker_compose_language_service",
				-- "prettier",
				-- "black",
				-- "harper_ls",
				-- "pyright",
				"denols",
			})
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			require("mason-lspconfig").setup({
				ensure_installed = {}, -- explicitly set to an empty table (Kickstart populates installs via mason-tool-installer)
				automatic_installation = false,
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						-- This handles overriding only values explicitly passed
						-- by the server configuration above. Useful when disabling
						-- certain features of an LSP (for example, turning off formatting for ts_ls)
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})
		end,
	},
}
