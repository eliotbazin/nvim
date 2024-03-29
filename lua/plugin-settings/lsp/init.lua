local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("plugin-settings.lsp.mason")
require("plugin-settings.lsp.handlers").setup()
require("plugin-settings.lsp.null-ls")
