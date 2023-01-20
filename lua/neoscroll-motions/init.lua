M = {}

M.scroll_to_next = function(pattern)
	local current_line = vim.api.nvim_win_get_cursor(0)[1]
	local next_pattern_start = vim.api.nvim_call_function("search", { pattern, "n" })
	local lines_to_scroll = next_pattern_start - current_line
	local neoscroll = require("neoscroll")
	neoscroll.scroll(lines_to_scroll, true, 50)
end

M.scroll_to_prev = function(pattern)
	local current_line = vim.api.nvim_win_get_cursor(0)[1]
	local prev_pattern_start = vim.api.nvim_call_function("search", { pattern, "b" })
	local lines_to_scroll = current_line - prev_pattern_start
	local neoscroll = require("neoscroll")
	neoscroll.scroll(-lines_to_scroll, true, 50)
end

M.setup = function()
	vim.api.nvim_set_keymap(
		"n",
		"}",
		"<CMD>lua require('neoscroll-motions').scroll_to_next('^$')<CR>",
		{ noremap = true, silent = true }
	)
	vim.api.nvim_set_keymap(
		"n",
		"{",
		"<CMD>lua require('neoscroll-motions').scroll_to_prev('^$')<CR>",
		{ noremap = true, silent = true }
	)
	vim.api.nvim_set_keymap(
		"n",
		"n",
		"<CMD>lua require('neoscroll-motions').scroll_to_next('@/')<CR>",
		{ noremap = true, silent = true }
	)
	vim.api.nvim_set_keymap(
		"n",
		"N",
		"<CMD>lua require('neoscroll-motions').scroll_to_prev('@/')<CR>",
		{ noremap = true, silent = true }
	)
	vim.api.nvim_set_keymap(
		"n",
		"*",
		"<CMD>lua require('neoscroll-motions').scroll_to_next('@*')<CR>",
		{ noremap = true, silent = true }
	)
	vim.api.nvim_set_keymap(
		"n",
		"#",
		"<CMD>lua require('neoscroll-motions').scroll_to_prev('@*')<CR>",
		{ noremap = true, silent = true }
	)
end

return M
