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
