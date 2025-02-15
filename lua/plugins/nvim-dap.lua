-- return {
-- 	{
-- 		"nicholasmata/nvim-dap-cs",
-- 		dependencies = { "mfussenegger/nvim-dap" },
-- 		opts = {
-- 			dap_configurations = {
-- 				{
-- 					-- Must be "coreclr" or it will be ignored by the plugin
-- 					type = "coreclr",
-- 					name = "Attach remote",
-- 					mode = "remote",
-- 					request = "attach",
-- 				},
-- 			},
-- 		},
-- 	},
-- }
return {
	url = "git@github.com:mfussenegger/nvim-dap.git",
	init = function()
		local dap = require("dap")
		dap.set_log_level("TRACE")
		dap.adapters.coreclr = {
			type = "executable",
			command = "netcoredbg.exe",
			args = { "--interpreter=vscode" },
		}

		vim.keymap.set("n", "<F5>", "<Cmd> lua require('dap').continue()<CR>", { silent = true })
		vim.keymap.set("n", "<F10>", "<Cmd> lua require('dap').step_over()<CR>", { silent = true })
		vim.keymap.set("n", "<F11>", "<Cmd> lua require('dap').step_into()<CR>", { silent = true })
		vim.keymap.set("n", "<F12>", "<Cmd> lua require('dap').step_out()<CR>", { silent = true })
		vim.keymap.set("n", "<leader>b", "<Cmd> lua require('dap').toggle_breakpoint()<CR>", { silent = true })
		vim.keymap.set(
			"n",
			"<leader>B",
			"<Cmd> lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
			{ silent = true }
		)
		vim.keymap.set(
			"n",
			"<leader>lp",
			"<Cmd> lua require('dap').set_breakpoint(nil,nil,vim.fn.input('Log breakpoint message: '))<CR>",
			{ silent = true }
		)
		vim.keymap.set("n", "<leader>dr", "<Cmd> lua require('dap').repl_open()<CR>", { silent = true })
		vim.keymap.set("n", "<leader>dl", "<Cmd> lua require('dap').run_last()<CR>", { silent = true })
	end,
}
