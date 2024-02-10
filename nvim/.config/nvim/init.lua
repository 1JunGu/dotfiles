if not vim.g.vscode then
	require("core")

	-- copy to attached terminal using the yank(1) script:
	-- https://github.com/sunaku/home/blob/master/bin/yank
	local function yank(text)
		local escape = vim.fn.system({ "yank", text })
		if vim.v.shell_error ~= 0 then
			vim.api.nvim_echo({ { escape } }, true, {})
		else
			vim.api.nvim_call_function("writefile", { { escape }, "/dev/tty", "b" })
		end
	end

	vim.api.nvim_set_keymap(
		"n",
		"<Leader>y",
		'y:<C-U>lua yank(vim.fn.join(vim.fn.getreg(0), "\\n"))<CR>',
		{ noremap = true, silent = true }
	)
	-- automatically run yank(1) whenever yanking in neovim
	-- (this snippet was contributed by Larry Sanderson and Jun Gu(transfer to neovim))

	local function copy_yank()
		local reg_contents = vim.fn.getreg(0, 1).regcontents
		if reg_contents then
			local text = table.concat(reg_contents, "\n")
			yank(text)
		end
	end

	vim.api.nvim_create_autocmd({ "TextYankPost" }, {
		callback = copy_yank,
	})
end
