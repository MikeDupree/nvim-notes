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

	-- New ViewNotes command
	vim.api.nvim_create_user_command("ViewNotes", function()
		-- Get the user-defined notes directory
		local notes_directory = config.get_notes_dir()

		-- Create a vertical split
		vim.cmd("vsplit")

		-- Focus the left window for Neo-tree
		vim.cmd("wincmd h")
		require("neo-tree").open() -- Open Neo-tree in the left pane

		-- Focus the right window for file viewing
		vim.cmd("wincmd l")
		vim.cmd("Explore " .. notes_directory) -- Open the notes directory in the right window

		-- Optional: Set Neo-tree window width (you can tweak this as needed)
		vim.wo[vim.fn.winnr()].winwidth = 30
	end, {})
end

return M
