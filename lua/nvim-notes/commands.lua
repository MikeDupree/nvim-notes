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

	--
	-- Opens the notes view
	--
	vim.api.nvim_create_user_command("SearchNotes", function()
		require("telescope.builtin").find_files({
			prompt_title = "Search Notes",
			cwd = config.get_notes_dir(),
		})
	end, {})

	vim.api.nvim_create_user_command("ViewNotes", function()
		local notes_directory = config.get_notes_dir()

		-- Open a new tab (isolated view)
		vim.cmd("tabnew")

		-- Set up floating window style
		-- Left pane: Neo-tree scoped to notes dir
		vim.cmd("wincmd h")
		vim.cmd("Neotree dir=" .. notes_directory .. " reveal left")

		-- Right pane: empty buffer or default note
		vim.cmd("wincmd l")
		vim.cmd("enew") -- This could open a specific note if we want?

		vim.t[vim.api.nvim_get_current_tabpage()].tabname = "Notes"
	end, {})

	--
	-- Closes the notes view
	--
	vim.api.nvim_create_user_command("CloseNotes", function()
		vim.cmd("tabclose")
	end, {})
end

return M
