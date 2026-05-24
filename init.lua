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
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣', space = '⋅' }
vim.opt.hlsearch = true
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("state") .. "/undo"
vim.fn.mkdir(vim.opt.undodir:get()[1], "p")
-- Spelling
vim.opt.spell = true
vim.opt.spelllang = 'en_us'
-- Mojo filetypes: `.mojo` and the unicode extension `.🔥`
vim.filetype.add {
	extension = {
		mojo = 'mojo',
		['🔥'] = 'mojo',
	},
}
-- ========================================
-- KEYMAPS
-- ========================================
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "[W]rite file" })
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "[Q]uit window" })
vim.keymap.set("n", "<leader>pu", function()
	vim.pack.update()
end, { desc = "[P]ackages [U]pdate" })

vim.api.nvim_create_user_command("ReloadConfig", function()
	vim.cmd.source(vim.env.MYVIMRC)
end, { desc = "Reload Neovim config" })

vim.keymap.set("n", "<leader>r", "<cmd>ReloadConfig<CR>", { desc = "[R]eload config" })

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

	-- File explorer
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },

	-- Terminal
	{ src = "https://github.com/akinsho/toggleterm.nvim" },

	-- Git
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{
		src = "https://github.com/NeogitOrg/neogit",
		dependencies = {
			{ src = "https://github.com/nvim-lua/plenary.nvim" },
			{ src = "https://github.com/sindrets/diffview.nvim" },
			{ src = "https://github.com/nvim-telescope/telescope.nvim" },
			{ src = "https://github.com/ibhagwan/fzf-lua" },
			{ src = "https://github.com/echasnovski/mini.pick" },
		},
	},

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
	{ src = "https://github.com/windwp/nvim-autopairs" },
	-- Treesitter
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },

	-- Formatting
	{ src = "https://github.com/stevearc/conform.nvim" },

	-- Debugging
	{ src = "https://github.com/mfussenegger/nvim-dap" },
	{ src = "https://github.com/rcarriga/nvim-dap-ui" },
	{ src = "https://github.com/theHamsta/nvim-dap-virtual-text" },

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

pcall(function()
	require("neogit").setup({})
end)

pcall(function()
	require("nvim-search-and-replace").setup({
		replace_keymap = "<leader>sR",
	})
end)

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
			-- Groups
			{ "<leader>c",        group = "[C]ode" },
			{ "<leader>d",        group = "[D]iagnostics" },
			{ "<leader>g",        group = "[G]it" },
			{ "<leader>h",        group = "Git [H]unk" },
			{ "<leader>f",        group = "[F]ormat" },
			{ "<leader>D",        group = "[D]ebug" },
			{ "<leader>n",        group = "[N]otebook" },
			{ "<leader>l",        group = "[L]SP" },
			{ "<leader>x",        group = "REPL" },
			{ "<leader>p",        group = "[P]ackages" },
			{ "<leader>s",        group = "[S]earch" },
			{ "<leader>t",        group = "[T]oggle" },

			-- Hidden placeholders
			{ "<leader>c_",       hidden = true },
			{ "<leader>d_",       hidden = true },
			{ "<leader>g_",       hidden = true },
			{ "<leader>h_",       hidden = true },
			{ "<leader>n_",       hidden = true },
			{ "<leader>x_",       hidden = true },
			{ "<leader>p_",       hidden = true },
			{ "<leader>s_",       hidden = true },
			{ "<leader>t_",       hidden = true },

			-- General
			{ "<leader><leader>", desc = "Find buffers" },
			{ "<leader>e",        desc = "Toggle file explorer" },
			{ "<leader>gs",       desc = "[G]it [S]tatus" },
			{ "<leader>gc",       desc = "[G]it [C]ommit" },
			{ "<leader>gl",       desc = "[G]it [L]og" },
			{ "<leader>gp",       desc = "[G]it [P]ush" },
			{ "<leader>gb",       desc = "[G]it [B]lame" },
			{ "<leader>gh",       desc = "[G]it file [H]istory" },
			{ "<leader>gH",       desc = "[G]it line [H]istory" },
			{ "<leader>hs",       desc = "Stage hunk" },
			{ "<leader>hr",       desc = "Reset hunk" },
			{ "<leader>hp",       desc = "Preview hunk" },
			{ "<leader>hu",       desc = "Undo stage hunk" },
			{ "<leader>hb",       desc = "Blame line" },
			{ "<leader>f",        desc = "Format buffer" },
			{ "<leader>Db",       desc = "Toggle breakpoint" },
			{ "<leader>Dc",       desc = "Continue debugging" },
			{ "<leader>Dd",       desc = "Toggle debug UI" },
			{ "<leader>Di",       desc = "Step into" },
			{ "<leader>Dl",       desc = "Run last debug session" },
			{ "<leader>Dn",       desc = "Step over" },
			{ "<leader>Do",       desc = "Step out" },
			{ "<leader>Dr",       desc = "Open debug REPL" },
			{ "<leader>Du",       desc = "Toggle DAP UI" },
			{ "<leader>sR",       desc = "[S]earch and [R]eplace (project)" },
			{ "<leader>q",        desc = "[Q]uit window" },
			{ "<leader>tt",       desc = "[T]oggle terminal" },
			{ "<leader>r",        desc = "[R]eload config" },
			{ "<leader>w",        desc = "[W]rite file" },

			-- Notebook / Quarto
			{ "<leader>nr",       desc = "Run cell" },
			{ "<leader>na",       desc = "Run above" },
			{ "<leader>nA",       desc = "Run all" },
			{ "<leader>np",       desc = "Preview notebook" },
			{ "<leader>nv",       desc = "Run visual selection", mode = "v" },

			-- LSP
			{ "<leader>ld",       desc = "Go to definition" },
			{ "<leader>lr",       desc = "Go to references" },
			{ "<leader>lh",       desc = "Hover documentation" },
			{ "<leader>ln",       desc = "[R]e[n]ame symbol" },
			{ "<leader>la",       desc = "Code action" },

			-- Iron / REPL
			{ "<leader>xx",       desc = "Open REPL" },
			{ "<leader>xi",       desc = "Focus REPL" },
			{ "<leader>xq",       desc = "Close REPL" },
			{ "<leader>xs",       desc = "Send motion/selection" },
			{ "<leader>xl",       desc = "Send line" },
			{ "<leader>xf",       desc = "Send file" },
			{ "<leader>xu",       desc = "Send until cursor" },
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
vim.keymap.set("n", "<leader>sn", function()
	builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "[S]earch [N]vim config files" })
vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = "[S]earch recent files" })
vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Find buffers" })

-- ========================================
-- OIL
-- ========================================
require("oil").setup({
	default_file_explorer = true,
	view_options = {
		show_hidden = true,
	},
})

vim.keymap.set("n", "<leader>e", function()
	if vim.bo.filetype == "oil" then
		vim.cmd("close")
		return
	end

	vim.cmd("topleft vsplit")
	vim.cmd("vertical resize 35")
	require("oil").open()
end, { desc = "Toggle file explorer" })

vim.keymap.set("n", "<leader>eo", function()
	vim.cmd("topleft vsplit")
	vim.cmd("vertical resize 35")
	require("oil").open(vim.fn.getcwd())
end, { desc = "Open oil in project root" })

vim.keymap.set("n", "<leader>er", function()
	if vim.bo.filetype == "oil" then
		require("oil").refresh()
	end
end, { desc = "Refresh oil" })

-- ========================================
-- GIT
-- ========================================
vim.keymap.set("n", "<leader>gs", function()
	vim.cmd("Neogit")
end, { desc = "[G]it [S]tatus" })

vim.keymap.set("n", "<leader>gc", function()
	vim.cmd("Neogit commit")
end, { desc = "[G]it [C]ommit" })

vim.keymap.set("n", "<leader>gl", function()
	vim.cmd("Neogit log")
end, { desc = "[G]it [L]og" })

vim.keymap.set("n", "<leader>gp", function()
	vim.cmd("Neogit push")
end, { desc = "[G]it [P]ush" })

vim.keymap.set("n", "<leader>gb", function()
	require("gitsigns").toggle_current_line_blame()
end, { desc = "[G]it [B]lame" })

vim.keymap.set("n", "<leader>gh", function()
	vim.cmd("DiffviewFileHistory %")
end, { desc = "[G]it file [H]istory" })

vim.keymap.set("n", "<leader>gH", function()
	vim.cmd("DiffviewFileHistory")
end, { desc = "[G]it line [H]istory" })

-- ========================================
-- DIAGNOSTICS
-- ========================================
vim.keymap.set("n", "<leader>dl", function()
	require("telescope.builtin").diagnostics()
end, { desc = "[D]iagnostics list" })

vim.keymap.set("n", "<leader>de", function()
	vim.diagnostic.open_float({ scope = "line" })
end, { desc = "[D]iagnostic on line" })

vim.keymap.set("n", "<leader>f", function()
	require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format buffer" })

-- ========================================
-- DEBUGGING
-- ========================================
pcall(function()
	local dap = require("dap")
	local dapui = require("dapui")
	local dap_available = function(bin)
		return vim.fn.executable(bin) == 1
	end

	require("nvim-dap-virtual-text").setup({})
	dapui.setup({})

	if dap_available("python3") and pcall(vim.fn.system, { "python3", "-m", "debugpy", "--version" }) then
		dap.adapters.python = {
			type = "executable",
			command = vim.fn.exepath("python3"),
			args = { "-m", "debugpy.adapter" },
		}

		dap.configurations.python = {
			{
				type = "python",
				request = "launch",
				name = "Launch current file",
				program = "${file}",
				console = "integratedTerminal",
				justMyCode = false,
			},
			{
				type = "python",
				request = "launch",
				name = "Launch module",
				module = function()
					return vim.fn.input("Module: ")
				end,
				console = "integratedTerminal",
				justMyCode = false,
			},
		}
	end

	if dap_available("dlv") or dap_available("delve") then
		dap.adapters.go = {
			type = "executable",
			command = dap_available("dlv") and vim.fn.exepath("dlv") or vim.fn.exepath("delve"),
			args = { "dap" },
		}

		dap.configurations.go = {
			{
				type = "go",
				request = "launch",
				name = "Debug current file",
				program = "${file}",
			},
			{
				type = "go",
				request = "launch",
				name = "Debug package",
				program = "${workspaceFolder}",
			},
		}
	end

	local codelldb = vim.fn.exepath("codelldb")
	if codelldb ~= "" then
		dap.adapters.codelldb = {
			type = "server",
			port = "${port}",
			executable = {
				command = codelldb,
				args = { "--port", "${port}" },
			},
		}

		local cpp_config = {
			{
				name = "Launch file",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			},
		}

		dap.configurations.rust = cpp_config
		dap.configurations.c = cpp_config
		dap.configurations.cpp = cpp_config
	end

	if vim.fn.executable("lldb-dap") == 1 then
		dap.adapters.lldb = {
			type = "executable",
			command = vim.fn.exepath("lldb-dap"),
			name = "lldb",
		}
	end

	dap.listeners.after.event_initialized["dapui_config"] = function()
		dapui.open()
	end
	dap.listeners.before.event_terminated["dapui_config"] = function()
		dapui.close()
	end
	dap.listeners.before.event_exited["dapui_config"] = function()
		dapui.close()
	end

	vim.keymap.set("n", "<leader>Db", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
	vim.keymap.set("n", "<leader>Dc", dap.continue, { desc = "Continue debugging" })
	vim.keymap.set("n", "<leader>Dn", dap.step_over, { desc = "Step over" })
	vim.keymap.set("n", "<leader>Di", dap.step_into, { desc = "Step into" })
	vim.keymap.set("n", "<leader>Do", dap.step_out, { desc = "Step out" })
	vim.keymap.set("n", "<leader>Dr", dap.repl.open, { desc = "Open debug REPL" })
	vim.keymap.set("n", "<leader>Dl", dap.run_last, { desc = "Run last debug session" })
	vim.keymap.set("n", "<leader>Du", dapui.toggle, { desc = "Toggle DAP UI" })
	vim.keymap.set("n", "<leader>Dd", dapui.toggle, { desc = "Toggle debug UI" })
	vim.keymap.set("n", "<leader>Df", function()
		dap.run(vim.tbl_get(dap.configurations, vim.bo.filetype, 1))
	end, { desc = "Start debug for filetype" })
end)

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

		-- Indentation guide
		require("mini.indentscope").setup({
			symbol = "│",
			options = { try_as_border = true },
		})

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
	map("n", "<leader>hu", gs.undo_stage_hunk, "Git [H]unk [U]ndo stage")
	map("n", "<leader>hb", function()
		gs.blame_line({ full = true })
	end, "Git [H]unk [B]lame line")
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
					typeCheckingMode = "standard",
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

	metals = {
		cmd = { "metals" },
		filetypes = { "scala", "sbt", "java" },
		root_markers = { "build.sbt", "build.sc", "build.gradle", "pom.xml", ".git" },
	},

	ocamllsp = {
		cmd = { "ocamllsp" },
		filetypes = { "ocaml", "reason" },
		root_markers = { ".merlin", "dune-project", "dune-workspace", "package.json", ".git" },
	},

	hls = {
		cmd = { "haskell-language-server-wrapper", "--lsp" },
		filetypes = { "haskell", "lhaskell", "cabal" },
		root_markers = { "cabal.project", "stack.yaml", "package.yaml", ".git" },
	},

	julials = {
		cmd = {
			"julia",
			"--startup-file=no",
			"--history-file=no",
			"-e",
			'using LanguageServer; runserver()',
		},
		filetypes = { "julia" },
		root_markers = { "Project.toml", "Manifest.toml", ".git" },
	},

	dockerls = {
		cmd = { "docker-langserver", "--stdio" },
		filetypes = { "dockerfile" },
		root_markers = { "Dockerfile", ".git" },
	},

	leanls = {
		cmd = { "lean", "--server" },
		filetypes = { "lean" },
		root_markers = { "lakefile.lean", "lean-toolchain", ".git" },
	},

	mojo = {
		cmd = { "mojo-lsp-server" },
		filetypes = { "mojo" },
		root_markers = { "mojo.lock", "pyproject.toml", ".git" },
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

		vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition,
			vim.tbl_extend("force", opts, { desc = "[L]SP [D]efinition" }))
		vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references,
			vim.tbl_extend("force", opts, { desc = "[L]SP [R]eferences" }))
		vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover,
			vim.tbl_extend("force", opts, { desc = "[L]SP [H]over documentation" }))
		vim.keymap.set("n", "<leader>ln", vim.lsp.buf.rename,
			vim.tbl_extend("force", opts, { desc = "[L]SP [N]ame symbol" }))
		vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action,
			vim.tbl_extend("force", opts, { desc = "[L]SP code [A]ction" }))
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
local autopairs = require("nvim-autopairs")

require("luasnip.loaders.from_vscode").lazy_load()
autopairs.setup({})

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

cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())

-- ========================================
-- FORMAT
-- ========================================
require("conform").setup({
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
	formatters_by_ft = {
		c = { "clang-format" },
		cpp = { "clang-format" },
		lua = { "stylua" },
		scala = { "scalafmt" },
		sbt = { "scalafmt" },
		ocaml = { "ocamlformat" },
		reason = { "ocamlformat" },
		haskell = { "ormolu" },
		lhaskell = { "ormolu" },
		julia = { "runic" },
		lean = { lsp_format = "fallback" },
		mojo = { "mojo_format" },
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
	formatters = {
		mojo_format = {
			command = "mojo",
			args = { "format", "--quiet", "$FILENAME" },
			stdin = false,
		},
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
		scratch_repl = true,

		repl_definition = {
			python = {
				command = { "ipython", "--no-autoindent" },
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
		send_motion = "<leader>xs",
		visual_send = "<leader>xs",
		send_file = "<leader>xf",
		send_line = "<leader>xl",
		send_until_cursor = "<leader>xu",
	},

	highlight = {
		italic = true,
	},

	ignore_blank_lines = true,
})

-- ========================================
-- QUARTO
-- ========================================
local quarto = require("quarto")
quarto.setup({
	debug = false,
	closePreviewOnExit = true,

	lspFeatures = {
		enabled = true,
		chunks = "curly",

		languages = {
			"python",
			"r",
			"julia",
			"bash",
			"html",
		},

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
		default_method = "iron",

		ft_runners = {
			python = "iron",
		},

		never_run = { "yaml" },
	},
})

local runner = require("quarto.runner")

vim.keymap.set("n", "<leader>nr", runner.run_cell, {
	desc = "[N]otebook Run cell",
})

vim.keymap.set("n", "<leader>na", runner.run_above, {
	desc = "[N]otebook Run above",
})

vim.keymap.set("n", "<leader>nA", runner.run_all, {
	desc = "[N]otebook Run all",
})

vim.keymap.set("n", "<leader>np", quarto.quartoPreview, {
	desc = "[N]otebook Preview",
})

vim.keymap.set("v", "<leader>nv", runner.run_range, {
	desc = "[N]otebook Run visual",
})
