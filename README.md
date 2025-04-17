# 📝 nvim-notes v1.0.0
Say hello to nvim-notes — a simple, powerful Neovim plugin to manage your personal notes right from your editor. This is the first stable release, packed with a smooth workflow for note-taking in Markdown.

### ✨ Features
`:NewNote` – Quickly create a new Markdown note by name.

`:SearchNotes` – Use Telescope to search through your notes directory.

`:ViewNotes` – Open a dedicated tab with a floating-style layout:

📁 Neo-tree scoped to your notes directory on the left

📄 Editable note preview on the right


### ⚙️ Configurable
Customize your notes directory:

```lua
require('nvim-notes').setup({
  notes_dir = '~/notes', -- Default: ~/.nvim-notes
})
```
### 📦 Dependencies
To take full advantage of all features, make sure you have the following plugins installed:

[Telescope](https://github.com/nvim-telescope/telescope.nvim) (for :SearchNotes)

### 🚀 Getting Started
Install with your plugin manager

Ex: Lazy

```lua
{
  'mikedupree/nvim-notes',
  dependencies = {
    'nvim-telescope/telescope.nvim',
    {
      'nvim-neo-tree/neo-tree.nvim',
      branch = 'v3.x',
      dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
        'MunifTanjim/nui.nvim',
      },
    },
  },
  config = function()
    require('nvim-notes').setup {
      notes_dir = '~/notes', -- optional, default is ~/.nvim-notes
    }
  end,
}
```


Set your preferred notes directory

Start creating and organizing notes effortlessly!
