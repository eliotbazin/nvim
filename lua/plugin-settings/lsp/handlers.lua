local M = {}

M.setup = function()
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "󰠠" },
		{ name = "DiagnosticSignInfo", text = "" },
	}
	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		-- disable virtual text
		virtual_text = false,
		-- show signs
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
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end

local function lsp_highlight_document(client)
	-- Set autocommands conditional on server_capabilities
	if client.server_capabilities.documentHighlight then
		vim.api.nvim_exec(
			[[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
			false
		)
	end
end

local function lsp_keymaps(bufnr)
	local function keymap(mode, lhs, rhs, opts)
		return vim.api.nvim_buf_set_keymap(
			bufnr,
			mode,
			lhs,
			rhs,
			vim.tbl_extend("keep", opts or {}, {
				nowait = true,
				silent = true,
				noremap = true,
			})
		)
	end
	-- Keymaps assigned to buffer --
	keymap("n", "gR", "<cmd>Telescope lsp_references<cr>", { desc = "Show LSP references" })
	-- keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { desc = "Show LSP references" })
	keymap("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
	keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Show LSP definitions" }) -- "<cmd>Telescope lsp_definitions<CR>"
	keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation<CR>", { desc = "Show LSP implementations" }) -- "<cmd>Telescope lsp_implementations<CR>"
	keymap("n", "gt", "<cmd>Telescope lsp_type_definitions<cr>", { desc = "Show LSP type definitions" })

	keymap("n", "K", vim.lsp.buf.hover, { desc = "Show documentation for what is under cursor" })
	keymap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "See available code actions" })
	keymap("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Smart rename" })

	keymap("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
	keymap("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", { desc = "Show buffer diagnostics" })
	keymap("n", "[d", vim.diagnostic.goto_prev({ border = "rounded" }), { desc = "Go to previous diagnostic" })
	keymap("n", "]d", vim.diagnostic.goto_next({ border = "rounded" }), { desc = "Go to next diagnostic" })

	keymap("n", "<leader>ls", "<cmd>LspRestart<cr>", { desc = "Restarts LSP" })

	-- keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
	-- keymap("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>")

	-- Command to format file
	vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])
end

M.on_attach = function(client, bufnr)
	if client.name == "tsserver" then
		client.server_capabilities.documentFormattingProvider = false
	end
	lsp_keymaps(bufnr)
	lsp_highlight_document(client)
end

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if status_ok then
	M.capabilities = cmp_nvim_lsp.default_capabilities()
end

return M
