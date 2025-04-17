local config = require("nvim-notes.config")

local M = {}

function M.setup()
	vim.api.nvim_create_user_command("NewNote", function()
		vim.ui.input({ prompt = "Note title: " }, function(input)
			if input and input ~= "" then
				local filename = config.get_notes_dir() .. "/" .. input .. ".md"
				vim.cmd("edit " .. filename)
			end
		end)
	end, {})

	vim.api.nvim_create_user_command("SearchNotes", function()
		require("telescope.builtin").find_files({
			prompt_title = "Search Notes",
			cwd = config.get_notes_dir(),
		})
	end, {})
end

return M
