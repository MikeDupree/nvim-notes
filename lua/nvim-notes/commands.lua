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

	vim.api.nvim_create_user_command("ViewNotes", function()
		local notes_directory = config.get_notes_dir()

		-- Save the current tab to return later if needed
		local current_tab = vim.api.nvim_get_current_tabpage()

		-- Open a new tab (isolated view)
		vim.cmd("tabnew")

		-- Set up floating window style
		vim.cmd("topleft vsplit") -- Split vertically for Neo-tree and file viewer
		vim.cmd("vertical resize 30") -- Left pane size for Neo-tree

		-- Left pane: Neo-tree scoped to notes dir
		vim.cmd("wincmd h")
		vim.cmd("Neotree dir=" .. notes_directory .. " reveal left")

		-- Right pane: empty buffer or default note
		vim.cmd("wincmd l")
		vim.cmd("enew") -- or open a specific note if you want

		-- Optional: rename tab for clarity
		vim.t[vim.api.nvim_get_current_tabpage()].tabname = "Notes"
	end, {})
end

return M
