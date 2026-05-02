-- ========================================
-- LEADER
-- ========================================
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ========================================
-- BASIC SETTINGS
-- ========================================
vim.opt.number = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true
vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.showmode = false
vim.opt.list = true
vim.opt.cursorline = true
-- eol = '↵'
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣', }
vim.opt.hlsearch = true
-- Spelling
vim.opt.spell = true
vim.opt.spelllang = 'en_us'
-- ========================================
-- KEYMAPS
-- ========================================
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "[W]rite file" })
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "[Q]uit window" })
vim.keymap.set("n", "<leader>pu", function()
	vim.pack.update()
end, { desc = "[P]ackages [U]pdate" })
vim.keymap.set("n", "<leader>rr", function()
	vim.cmd.source(vim.env.MYVIMRC)
end, { desc = "[R]eload config" })

vim.keymap.set("n", "<C-h>", "<C-w><C-h>")
vim.keymap.set("n", "<C-l>", "<C-w><C-l>")
vim.keymap.set("n", "<C-j>", "<C-w><C-j>")
vim.keymap.set("n", "<C-k>", "<C-w><C-k>")

-- ========================================
-- PLUGINS
-- ========================================
vim.pack.add({
	-- UI
	{ src = "https://github.com/rebelot/kanagawa.nvim" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },

	-- Telescope
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope-ui-select.nvim" },

	-- Neo-tree (MAIN BRANCH FIXED)
	{ src = "https://github.com/nvim-neo-tree/neo-tree.nvim" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/MunifTanjim/nui.nvim" },

	-- Terminal
	{ src = "https://github.com/akinsho/toggleterm.nvim" },

	-- Git
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },

	-- Which-key
	{ src = "https://github.com/folke/which-key.nvim" },
	-- Mini
	{ src = "https://github.com/echasnovski/mini.nvim" },
	-- CMP
	{ src = "https://github.com/hrsh7th/nvim-cmp" },
	{ src = "https://github.com/hrsh7th/cmp-nvim-lsp" },
	{ src = "https://github.com/hrsh7th/cmp-buffer" },
	{ src = "https://github.com/hrsh7th/cmp-path" },
	{ src = "https://github.com/hrsh7th/cmp-cmdline" },
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
	{ src = "https://github.com/saadparwaiz1/cmp_luasnip" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/kdheepak/cmp-latex-symbols" },
	-- Treesitter
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },

	-- Formatting
	{ src = "https://github.com/stevearc/conform.nvim" },

	-- Utils
	{ src = "https://github.com/s1n7ax/nvim-search-and-replace" },
	{ src = "https://github.com/lervag/vimtex" },

	-- Markdown
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },

	-- Math
	{ src = "https://github.com/Thiago4532/mdmath.nvim" },

	-- Quarto
	{ src = "https://github.com/quarto-dev/quarto-nvim" },
	{ src = "https://github.com/jmbuhr/otter.nvim" },
	{ src = "https://github.com/Vigemus/iron.nvim" },
})
-- ========================================
-- COLORSCHEME
-- ========================================
vim.cmd.colorscheme("kanagawa-dragon")

-- ========================================
-- WHICH-KEY
-- ========================================
vim.o.timeout = true
vim.o.timeoutlen = 300

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		local wk = require("which-key")
		wk.setup()

		wk.add({
			{ "<leader>c",        group = "[C]ode" },
			{ "<leader>c_",       hidden = true },
			{ "<leader>cq",       group = "[Q]uarto" },
			{ "<leader>d",        group = "[D]ocument" },
			{ "<leader>d_",       hidden = true },
			{ "<leader>g",        group = "[G]rep replace" },
			{ "<leader>g_",       hidden = true },
			{ "<leader>h",        group = "Git [H]unk" },
			{ "<leader>h_",       hidden = true },
			{ "<leader>o",        group = "[O]rg-mode" },
			{ "<leader>o_",       hidden = true },
			{ "<leader>p",        group = "[P]ackages" },
			{ "<leader>p_",       hidden = true },
			{ "<leader>r",        group = "[R]ename" },
			{ "<leader>r_",       hidden = true },
			{ "<leader>s",        group = "[S]earch" },
			{ "<leader>s_",       hidden = true },
			{ "<leader>t",        group = "[T]oggle" },
			{ "<leader>t_",       hidden = true },
			{ "<leader><leader>", desc = "Find buffers" },
			{ "<leader>e",        desc = "Toggle file explorer" },
			{ "<leader>q",        desc = "[Q]uit window" },
			{ "<leader>tt",       desc = "[T]oggle [T]erminal" },
			{ "<leader>rr",       desc = "[R]eload config" },
			{ "<leader>w",        desc = "[W]rite file" },
			{
				mode = { "n", "v" },
				{ "<leader>h", group = "Git [H]unk" },
			},
		})
	end,
})

-- ========================================
-- LUALINE
-- ========================================
local function solid_theme()
	local hl = vim.api.nvim_get_hl(0, { name = "CursorLine", link = false })
	local bg = hl.bg and string.format("#%06x", hl.bg) or "#2d2d2d"
	local fg = "#c5c9c5"
	local section = { a = { bg = bg, fg = fg }, b = { bg = bg, fg = fg }, c = { bg = bg, fg = fg } }
	return {
		normal = section,
		insert = section,
		visual = section,
		replace = section,
		command = section,
		inactive =
		    section
	}
end

require("lualine").setup({
	options = {
		theme = solid_theme(),
		component_separators = "",
		section_separators = "",
	},
	sections = {
		lualine_c = {
			{ "filename", path = 1 },
		},
	},
})

-- ========================================
-- TELESCOPE
-- ========================================
local telescope = require("telescope")
local builtin = require("telescope.builtin")

telescope.setup({
	extensions = {
		["ui-select"] = require("telescope.themes").get_dropdown(),
	},
})
pcall(require("telescope").load_extension, "ui-select")

vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = "[S]earch recent files" })
vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Find buffers" })

-- ========================================
-- NEO-TREE
-- ========================================
vim.keymap.set("n", "<leader>e", function()
	require("neo-tree.command").execute({ toggle = true })
end, { desc = "Toggle file explorer" })

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		local ok, neotree = pcall(require, "neo-tree")
		if ok then
			neotree.setup({
				filesystem = {
					follow_current_file = { enabled = true },
				},
			})
		end
	end,
})

-- ========================================
-- TOGGLETERM
-- ========================================
require("toggleterm").setup({
	direction = "float",
	open_mapping = [[<leader>tt]],
})


-- ========================================
-- MINI.NVIM (TEXT OBJECTS, SURROUND, ETC)
-- ========================================
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		-- Better Around/Inside textobjects
		require("mini.ai").setup({ n_lines = 500 })

		-- Surround (add/delete/replace brackets, quotes, etc.)
		require("mini.surround").setup()

		-- Tabline
		require("mini.tabline").setup()

		-- Git diff indicators
		require("mini.diff").setup()

		-- Move lines / selections
		require("mini.move").setup()
	end,
})

-- ========================================
-- GITSIGNS
-- ========================================
require("gitsigns").setup({
	current_line_blame = true,
	on_attach = function(bufnr)
		local gs = require("gitsigns")
		local map = function(mode, l, r, desc)
			vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
		end

		map("n", "]c", gs.next_hunk, "Next git hunk")
		map("n", "[c", gs.prev_hunk, "Previous git hunk")
		map("n", "<leader>hs", gs.stage_hunk, "Git [H]unk [S]tage")
		map("n", "<leader>hr", gs.reset_hunk, "Git [H]unk [R]eset")
		map("n", "<leader>hp", gs.preview_hunk, "Git [H]unk [P]review")
	end,
})

-- ========================================
-- LSP (MODERN)
-- ========================================
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local servers = {

	pyright = {
		cmd = { "pyright-langserver", "--stdio" },
		filetypes = { "python" },
		root_markers = { ".git", "pyproject.toml", "requirements.txt" },
		settings = {
			python = {
				analysis = {
					typeCheckingMode = "strict",
					autoSearchPaths = true,
					useLibraryCodeForTypes = true,
				},
			},
		},
	},
	pyrefly = {
		cmd = { "pyrefly", "lsp" },
		filetypes = { "python" },
		root_markers = { ".git", "pyproject.toml", "requirements.txt" },
		on_attach = function(client, bufnr)
			-- disable overlap with pyright
			client.server_capabilities.definitionProvider = false
			client.server_capabilities.referencesProvider = false
			client.server_capabilities.renameProvider = false
			client.server_capabilities.hoverProvider = false
			client.server_capabilities.completionProvider = false
			client.server_capabilities.diagnosticProvider = false

			vim.defer_fn(function()
				vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
			end, 100)
		end,
		settings = {
			python = {
				inlayHints = {
					variableTypes = true,
					functionReturnTypes = true,
					callArgumentNames = true,
				},
			},
		},
	},
	rust_analyzer = {
		cmd = { "rust-analyzer" },
		filetypes = { "rust" },
		root_markers = { "Cargo.toml", ".git" },
		settings = {
			["rust-analyzer"] = {
				inlayHints = {
					typeHints = { enable = true },
					parameterHints = { enable = true },
					chainingHints = { enable = true },
					closingBraceHints = { enable = true },
					bindingModeHints = { enable = true },
					lifetimeElisionHints = { enable = "always" },
				},
			},
		},
	},

	gopls = {
		cmd = { "gopls" },
		filetypes = { "go", "gomod", "gowork", "gotmpl" },
		root_markers = { "go.work", "go.mod", ".git" },
	},

	bashls = {
		cmd = { "bash-language-server", "start" },
		filetypes = { "sh", "bash", "zsh" },
		root_markers = { ".git" },
	},

	texlab = {
		cmd = { "texlab" },
		filetypes = { "tex", "plaintex", "bib" },
		root_markers = { ".git", "main.tex" },
	},

	jsonls = {
		cmd = { "vscode-json-language-server", "--stdio" },
		filetypes = { "json", "jsonc" },
		root_markers = { ".git", "package.json" },
	},

	marksman = {
		cmd = { "marksman" },
		filetypes = { "markdown" },
		root_markers = { ".git" },
	},

	clangd = {
		cmd = { "clangd" },
		filetypes = { "c", "cpp", "objc", "objcpp" },
		root_markers = { "compile_commands.json", "compile_flags.txt", ".git" },
	},

	lua_ls = {
		cmd = { "lua-language-server" },
		filetypes = { "lua" },
		root_markers = { ".git", ".luarc.json" },
		settings = {
			Lua = {
				diagnostics = { globals = { "vim" } },
			},
		},
	},

	taplo = {
		cmd = { "taplo", "lsp", "stdio" },
		filetypes = { "toml" },
		root_markers = { ".git", "Cargo.toml", "pyproject.toml" },
	},

	yamlls = {
		cmd = { "yaml-language-server", "--stdio" },
		filetypes = { "yaml", "yml" },
		root_markers = { ".git", "docker-compose.yml" },
	},

	dockerls = {
		cmd = { "docker-langserver", "--stdio" },
		filetypes = { "dockerfile" },
		root_markers = { "Dockerfile", ".git" },
	},
}

-- Apply configs
for name, config in pairs(servers) do
	config.capabilities = capabilities
	vim.lsp.config(name, config)
end

-- Enable all servers
vim.lsp.enable(vim.tbl_keys(servers))

-- ========================================
-- LSP ATTACH (KEYMAPS + INLAY HINTS)
-- ========================================
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		local opts = { buffer = event.buf }

		vim.keymap.set("n", "gd", vim.lsp.buf.definition,
			vim.tbl_extend("force", opts, { desc = "Go to definition" }))
		vim.keymap.set("n", "gr", vim.lsp.buf.references,
			vim.tbl_extend("force", opts, { desc = "Go to references" }))
		vim.keymap.set("n", "K", vim.lsp.buf.hover,
			vim.tbl_extend("force", opts, { desc = "Hover documentation" }))
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename,
			vim.tbl_extend("force", opts, { desc = "[R]e[n]ame symbol" }))
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action,
			vim.tbl_extend("force", opts, { desc = "[C]ode [A]ction" }))

		-- FIX: defer to avoid race condition
		vim.defer_fn(function()
			vim.lsp.inlay_hint.enable(true, { bufnr = event.buf })
		end, 50)
	end,
})

-- ========================================
-- INLAY HINT TOGGLE (WHICH-KEY)
-- ========================================
vim.keymap.set("n", "<leader>th", function()
	local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = 0 })
	vim.lsp.inlay_hint.enable(not enabled, { bufnr = 0 })
end, { desc = "[T]oggle Inlay [H]ints" })
-- ========================================
-- CMP
-- ========================================
local cmp = require("cmp")
local luasnip = require("luasnip")

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-Space>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<Tab>"] = cmp.mapping.select_next_item(),
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
	}),
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
		{ name = "latex_symbols" },
	},
})

-- ========================================
-- FORMAT
-- ========================================
require("conform").setup({
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "ruff_fix", "ruff_format" },
		rust = { "rustfmt" },
		go = { "gofmt" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		json = { "prettier" },
		yaml = { "prettier" },
		markdown = { "prettier" },
		sh = { "shfmt" },
		toml = { "taplo" },
	},
})

-- ========================================
-- TREESITTER (NATIVE)
-- ========================================
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99

-- ========================================
-- IRON.NVIM (REPL RUNNER)
-- ========================================
local iron = require("iron.core")

iron.setup({
	config = {
		repl_definition = {
			python = {
				command = { "python3" },
			},
			r = {
				command = { "R" },
			},
			julia = {
				command = { "julia" },
			},
			sh = {
				command = { "bash" },
			},
		},
		repl_open_cmd = require("iron.view").split.vertical.botright(0.4),
	},
	keymaps = {
		send_motion = "<space>sc",
		visual_send = "<space>sc",
		send_file = "<space>sf",
		send_line = "<space>sl",
	},
})

-- ========================================
-- QUARTO
-- ========================================
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "quarto", "rmd" },
	callback = function()
		pcall(vim.cmd, "packadd quarto-nvim")

		local ok, quarto = pcall(require, "quarto")
		if not ok then
			return
		end

		quarto.setup({
			debug = false,
			closePreviewOnExit = true,
			lspFeatures = {
				enabled = true,
				chunks = "curly",
				languages = { "r", "python", "julia", "bash", "html" },
				diagnostics = {
					enabled = true,
					triggers = { "BufWritePost" },
				},
				completion = {
					enabled = true,
				},
			},
			codeRunner = {
				enabled = true,
				default_method = "iron", -- CHANGE THIS
				ft_runners = {
					python = "iron",
				},
				never_run = { "yaml" },
			},
		})

		local runner = require("quarto.runner")

		-- Preview
		vim.keymap.set("n", "<leader>cqp", require("quarto").quartoPreview, {
			desc = "Quarto preview",
		})

		-- Execution
		vim.keymap.set("n", "<leader>cqr", runner.run_cell, { desc = "Run cell" })
		vim.keymap.set("n", "<leader>cqa", runner.run_above, { desc = "Run above" })
		vim.keymap.set("n", "<leader>cqR", runner.run_all, { desc = "Run all" })
		vim.keymap.set("n", "<leader>cql", runner.run_line, { desc = "Run line" })
		vim.keymap.set("v", "<leader>cqv", runner.run_range, { desc = "Run visual" })

		-- REPL (iron)
		vim.keymap.set("n", "<leader>cqs", function()
			if vim.bo.filetype == "quarto" then
				require("iron.core").repl_for("python")
			else
				require("iron.core").repl_for(vim.bo.filetype)
			end
		end, { desc = "Start REPL" })
	end,
})
