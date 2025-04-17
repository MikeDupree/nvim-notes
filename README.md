# 🗒️ nvim-notes

A simple and fast Neovim plugin to manage your personal notes — from *anywhere* in your editor.

- 📁 Customizable notes directory (default: `~/.nvim-notes`)
- ✍️ Create a new note from any buffer
- 🔍 Fuzzy search your notes via Telescope
- 🧠 Works well with markdown, Obsidian, and other tooling

---

## ✨ Features

- `:NewNote` — Prompt for a note title and open it instantly
- `:SearchNotes` — Use Telescope to fuzzy find notes
- `:ViewNotes` – Open a popup with Neo-tree on the left and a file explorer on the right, showing the notes directory.
- `:CloseNotes` - Closes the notes popup
- Notes are stored in a single directory (or whatever you configure)
- Easy to use from *any Neovim session*, no need to open the notes dir directly

---

## 📦 Installation

### Lazy.nvim

```lua
{
  "yourusername/nvim-notes",
  config = function()
    require("nvim-notes").setup({
      notes_dir = "~/notes", -- optional, default is ~/.nvim-notes
    })
  end
}
```

### Example keymapping:
```lua
 vim.keymap.set('n', '<leader>nn', '<cmd>NewNote<CR>', { desc = '[N]ew [N]ote' })
 vim.keymap.set('n', '<leader>ns', '<cmd>SearchNotes<CR>', { desc = '[N]otes [S]earch' })
 vim.keymap.set('n', '<leader>ne', '<cmd>ViewNotes<CR>', { desc = '[N]otes [E]xplorer' })
 vim.keymap.set('n', '<leader>nx', '<cmd>CloseNotes<CR>', { desc = '[N]otes E[x]it' })
```
