M = {}

M.scroll_to_next_paragraph = function()
	local current_line = vim.api.nvim_win_get_cursor(0)[1]
	local next_paragraph_start = vim.api.nvim_call_function("search", { "^$", "n" })
	local lines_to_scroll = next_paragraph_start - current_line
	local neoscroll = require("neoscroll")
	neoscroll.scroll(lines_to_scroll, true, 50)
end

M.scroll_to_prev_paragraph = function()
	local current_line = vim.api.nvim_win_get_cursor(0)[1]
	local prev_paragraph_start = vim.api.nvim_call_function("search", { "^$", "b" })
	local lines_to_scroll = current_line - prev_paragraph_start
	local neoscroll = require("neoscroll")
	neoscroll.scroll(-lines_to_scroll, true, 50)
end

M.setup = function()
	vim.api.nvim_set_keymap(
		"n",
		"}",
		"<CMD>lua require('neoscroll-paragraph').scroll_to_next_paragraph()<CR>",
		{ noremap = true, silent = true }
	)
	vim.api.nvim_set_keymap(
		"n",
		"{",
		"<CMD>lua require('neoscroll-paragraph').scroll_to_prev_paragraph()<CR>",
		{ noremap = true, silent = true }
	)
end

return M
