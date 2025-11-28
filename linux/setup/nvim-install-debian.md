# Install and use of NeoVim

LazyVim is a pre-configured setup for Neovim that simplifies customization and enhances the coding experience by providing a full-fledged IDE-like environment. It includes a variety of pre-installed plugins and features, making it easier for users to get started with coding in Neovim.

![lazyvim](/assets/lazyvim.png)

## Install dependecies

`sudo apt update`
`sudo apt install make gcc ripgrep unzip git xclip curl node`

## Now we install nvim

`curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz`  
`sudo rm -rf /opt/nvim-linux-x86_64`  
`sudo mkdir -p /opt/nvim-linux-x86_64`  
`sudo chmod a+rX /opt/nvim-linux-x86_64`  
`sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz`

## make it available in /usr/local/bin, distro installs to /usr/bin

`sudo ln -sf /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/`

## Now we install lazyVim

`git clone https://github.com/LazyVim/starter ~/.config/nvim`  
`rm -rf ~/.config/nvim/.git`  
`nvim`

## Core directory layout

`~/.config/nvim/  
├─ init.lua                # entry point – loads LazyVim  
├─ lua/  
│  ├─ plugins/             # one *.lua file per plugin spec  
│  ├─ config/              # overrides for built‑in plugins  
│  ├─ keymaps.lua          # central place for custom mappings  
│  └─ options.lua          # global Neovim options (line numbers, etc.)  
└─ after/                  # optional Vimscript that runs after init`  
LazyVim automatically reads any `*.lua` file inside `lua/plugins`

## Adding a new plugin

Create a file `lua/plugins/<name>.lua`. Example -adding telescope.nvim

```lua
-- lua/plugins/telescope.lua
return {
  "nvim-telescope/telescope.nvim",        -- GitHub repo
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = "Telescope",                      -- lazy‑load when the command is called
  opts = {
    defaults = {
      layout_strategy = "horizontal",
      sorting_strategy = "ascending",
    },
  },
}
```

Save the file and run `:Lazy Sync`

## Overriding a Pluin's Options

To change the defaults configuration of a built-in plugin, edit the corresponding file in `lua/config`.
Example - customizing nvim-cmp completion:

```lua
-- lua/config/cmp.lua
local cmp = require("cmp")

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"]      = cmp.mapping.confirm({ select = false }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "buffer" },
  }),
})
```

Only the fields you define are merged with the original LazyVim defaults.

## Defining you own keymaps

All custom shortcuts belong in `lua/keymaps.lua`. Use the modern `vim.keymaps.set` API:

```lua
-- lua/keymaps.lua
local map = vim.keymap.set

-- Open Telescope file finder
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })

-- Save with Ctrl‑S (normal & insert modes)
map({ "n", "i" }, "<C-s>", "<cmd>w<cr>", { desc = "Save file" })

-- Format buffer with LSP
map("n", "<leader>cf", function() vim.lsp.buf.format() end,
    { desc = "Format buffer" })
```

The `desc` attribute makes the binding appear in which-key pop-ups.

## Global NeoVim options

Put generic settings in `lua/options.lua`

```lua
-- lua/options.lua
vim.opt.number       = true          -- show line numbers
vim.opt.relativenumber = true        -- relative numbers
vim.opt.termguicolors = true         -- true‑color support
vim.opt.mouse        = "a"           -- enable mouse
vim.g.mapleader      = " "           -- space as <Leader>
```

These options are applied early during statup.

## Adding Lnaguage Servers (LSP)

LazyVim ships with _nvim-lspconfig_.To enable a server, extend the `servers` table in `lua/plugins/lsp.lua` (or create a new spec)

```lua
-- lua/plugins/lsp.lua
return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      pyright = {},               -- Python
      tsserver = {},              -- TypeScript/JavaScript
      rust_analyzer = {},         -- Rust
    },
  },
}
```

Run `:LspInfo` to verify thtat the servers attached correctly.

## Changing the Colorscheme

Add a line to `lua/config/colorscheme.lus` (create the file if it doesn't exists):

```lua
-- lua/config/colorscheme.lua
vim.cmd([[colorscheme catppuccin]])   -- any installed scheme works
```

Make sure the colorscheme plugin is listed in `lua/plugins/` (e.g., `catppuccin/nvim`)

## where to learn more

- [LazyVim Wiki](https://github.com/LazyVim/LazyVim/wiki)
- [lazy.vim Specification](https://github.com/folke/lazy.nvim#%EF%B8%8F-specification)
