# LazyVim Default Keybindings – Programming Workflow

Below is a concise reference of the **default keymaps** that LazyVim provides out‑of‑the‑box, focused on actions you’ll use while writing code.  
All bindings use the `<Leader>` key (space by default) unless otherwise noted.

| Mode       | Keys                | Action                               | Description                                               |
| ---------- | ------------------- | ------------------------------------ | --------------------------------------------------------- |
| **Normal** | `<Leader>ff`        | `:Telescope find_files`              | Quickly open any file in the project.                     |
| **Normal** | `<Leader>fg`        | `:Telescope live_grep`               | Search text across the whole workspace.                   |
| **Normal** | `<Leader>fb`        | `:Telescope buffers`                 | Switch between open buffers.                              |
| **Normal** | `<Leader>fh`        | `:Telescope help_tags`               | Browse Vim/Neovim help.                                   |
| **Normal** | `<Leader>ca`        | `:Lspsaga code_action`               | Show LSP code actions (refactor, fix, etc.).              |
| **Normal** | `<Leader>rn`        | `:Lspsaga rename`                    | Rename symbol under cursor via LSP.                       |
| **Normal** | `<Leader>gd`        | `:Lspsaga peek_definition`           | Peek definition in a floating window.                     |
| **Normal** | `<Leader>gr`        | `:Lspsaga lsp_finder`                | Find references, definitions, implementations.            |
| **Normal** | `<Leader>gh`        | `:Lspsaga hover_doc`                 | Show hover documentation for symbol.                      |
| **Normal** | `<Leader>gs`        | `:Lspsaga signature_help`            | Show function signature while typing.                     |
| **Normal** | `<Leader>fm`        | `:LspFormatting`                     | Format the current buffer using the attached LSP.         |
| **Normal** | `<Leader>tt`        | `:ToggleTerm`                        | Open a terminal split (useful for REPLs, build commands). |
| **Insert** | `<C-space>`         | `cmp.complete()`                     | Trigger completion manually (if not auto‑triggered).      |
| **Insert** | `<C-e>`             | `cmp.abort()`                        | Cancel the completion menu.                               |
| **Insert** | `<Tab>` / `<S-Tab>` | `cmp.select_next()/prev()`           | Navigate completion items.                                |
| **Visual** | `<Leader>c`         | `:CommentToggle`                     | Comment/uncomment selected lines (via `Comment.nvim`).    |
| **Normal** | `]d` / `[d`         | `:Lspsaga diagnostic_jump_next/prev` | Jump to next/previous diagnostics (errors, warnings).     |
| **Normal** | `]b` / `[b`         | `:bnext` / `:bprevious`              | Cycle through buffers.                                    |
| **Normal** | `]t` / `[t`         | `:tabnext` / `:tabprevious`          | Cycle through tabs.                                       |
| **Normal** | `gp`                | `:Git push` (via Fugitive)           | Push current branch.                                      |
| **Normal** | `gs`                | `:Git status` (via Fugitive)         | Open Git status window.                                   |
| **Normal** | `gc`                | `:Git commit` (via Fugitive)         | Start a commit.                                           |
| **Normal** | `gb`                | `:Git blame` (via Fugitive)          | Show inline blame for the current line.                   |

## How to Use These Bindings While Coding

1. **Navigate the Codebase**
   - Press `<Leader>ff` to jump to any file, then start editing.
   - Use `<Leader>fg` to search for a function name or variable across the repo.

2. **Leverage LSP Features**
   - When the cursor is on a symbol, hit `<Leader>gd` to peek its definition without leaving your context.
   - Use `<Leader>ca` for quick refactors (e.g., extract method, convert var to const).
   - After typing a function call, `<Leader>gs` displays the signature help.

3. **Auto‑Completion**
   - Completion pops up automatically; if you need to trigger it manually, press `<C-space>`.
   - Navigate suggestions with `<Tab>` / `<S-Tab>` and confirm with `<Enter>`.

4. **Code Formatting**
   - Hit `<Leader>fm` to format the whole buffer according to the language server’s rules (e.g., `prettier`, `black`, `clang-format`).

5. **Terminal Integration**
   - Press `<Leader>tt` to open a floating terminal. Run tests, REPLs, or build commands without leaving Neovim.

6. **Version Control**
   - Use `gs` to view the Git status pane, `gc` to start a commit, and `gp` to push changes—all from within the editor.

7. **Commenting**
   - Select a block in visual mode and press `<Leader>c` to toggle comments, useful for quick debugging.

8. **Diagnostics Navigation**
   - Jump between errors/warnings with `]d` and `[d` to fix issues efficiently.

## Customising or Extending

If a default binding clashes with your workflow, you can override it in `lua/keymaps.lua`:

```lua
local map = vim.keymap.set
-- Example: change the leader from space to comma
vim.g.mapleader = ","
-- Re‑assign a binding
map("n", "<Leader>ff", "<cmd>Telescope find_files hidden=true<cr>", { desc = "Find files (incl. hidden)" })
```
