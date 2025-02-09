return {
	-- amongst your other plugins
	"akinsho/toggleterm.nvim",
	version = "*",
	-- keys = {
	-- 	{[[<C-\>]], "<cmd>ToggleTerm size=40 direction=horizontal" }
	-- }
	-- opts = {
	-- 	open_mapping = [[<C-\>]],
	-- 	insert_mappings = true,
	-- 	terminal_mappings = true,
	-- 	close_on_exit = true,
	-- 	auto_scroll = true,
	-- },
	--
	config = function()
		require("toggleterm").setup({
			size = function(term)
				if term.direction == "horizontal" then
					return 15
				elseif term.direction == "vertical" then
					return vim.o.columns * 0.4
				end
			end,
			insert_mappings = true,
			terminal_mappings = true,
			close_on_exit = true,
			auto_scroll = true,
			shell = vim.o.shell,
		})

		function _G.set_terminal_keymaps()
			local opts = { buffer = 0 }
			vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
			vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
			vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
			vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
			vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
			vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
			vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
		end

		-- if you only want these mappings for toggle term use term://*toggleterm#* instead
		vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

		vim.keymap.set("n", [[<C-\>]], "<Cmd>ToggleTerm direction=horizontal<CR>")
		vim.keymap.set("i", [[<C-\>]], "<Esc><Cmd>ToggleTerm<CR>")

		vim.keymap.set("n", [[<leader>\]], "<Cmd>ToggleTerm direction=vertical<CR>")
		vim.keymap.set("i", [[<leader>\]], "<Esc><Cmd>ToggleTerm direction=vertical<CR>")

		vim.api.nvim_create_autocmd("TermEnter", {
			pattern = "term://*",
			callback = function()
				vim.keymap.set("t", [[<C-\>]], [[<Cmd>ToggleTermToggleAll<CR>]], { silent = true })
			end,
		})
	end,

	-- or
	-- {'akinsho/toggleterm.nvim', version = "*", opts = {--[[ things you want to change go here]]}}
}
