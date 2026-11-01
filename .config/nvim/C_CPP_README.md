# C/C++ Neovim configuration

This is the supplied config with a C/C++ IDE layer added.

## System programs

Install these with your distro package manager:

- Neovim 0.12+
- gcc / g++
- make
- cmake
- git
- ripgrep
- a C compiler toolchain

Mason will install these automatically on first launch:

- clangd
- clang-format
- codelldb

The first startup may install plugins/tools. Run `:Mason` to see tool status.

## C/C++ editing

- clangd LSP with background indexing and clang-tidy
- completion through blink.cmp
- Treesitter C and C++ parsers
- clang-format on save
- 4 spaces, no tabs for C/C++
- project `.clang-format` files are respected
- if no `.clang-format` exists, formatting falls back to LLVM style with 4 spaces
- CMake configure exports `compile_commands.json`

For complex Makefile projects, clangd works best when a `compile_commands.json` exists. Tools such as Bear can generate one if the build system does not.

## Main keybinds

### IDE / LSP

- `gd` definition
- `gD` declaration
- `grr` references (Telescope)
- `gri` implementation (Telescope)
- `grt` type definition (Telescope)
- `K` hover/documentation
- `F2` rename symbol
- `Alt+Enter` code action
- `<leader>ca` code action
- `<leader>cr` rename
- `<leader>ch` switch C/C++ source/header
- `<leader>cs` clangd symbol info
- `<leader>ci` incoming calls
- `<leader>co` outgoing calls
- `<leader>th` toggle inlay hints

### Diagnostics

- `]d` next diagnostic
- `[d` previous diagnostic
- `<leader>e` diagnostic under cursor
- `<leader>xx` diagnostics panel
- `<leader>xX` current-buffer diagnostics
- `<leader>xl` LSP Trouble panel
- `<leader>xq` quickfix Trouble panel

### Search/files

- `Ctrl+p` find files
- `<leader>sf` find files
- `<leader>sg` grep project
- `Ctrl+Shift+f` grep project (terminal support varies)
- `<leader>sd` search diagnostics
- `<leader><leader>` buffers
- `\\` Neo-tree reveal

### Formatting

- `<leader>f` format buffer/selection
- C/C++ formats automatically on save

### Builds / runs (Overseer)

- `F7` choose a build/task
- `<leader>br` choose task
- `<leader>bt` task panel
- `<leader>ba` action on a task
- `<leader>bl` restart last task
- `<leader>bg` GCC/G++ build current file
- `<leader>rr` run the executable produced from the current source filename
- `<leader>bm` Make build
- `<leader>bc` CMake configure Debug
- `<leader>bb` CMake build

`<leader>br` also exposes:

- C/C++ build current file
- C/C++ run current executable
- Make build / clean
- CMake configure / build / clean / run executable

Single-file C build:
`gcc file.c -std=c17 -Wall -Wextra -Wpedantic -g -o file`

Single-file C++ build:
`g++ file.cpp -std=c++20 -Wall -Wextra -Wpedantic -g -o file`

CMake configure uses:
`cmake -S . -B build -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=ON`

### Debugging (nvim-dap + CodeLLDB)

- `F5` start/continue
- `F9` toggle breakpoint
- `F10` step over
- `F11` step into
- `Shift+F11` step out
- `<leader>db` breakpoint
- `<leader>dB` conditional breakpoint
- `<leader>dc` continue
- `<leader>di` step into
- `<leader>do` step over
- `<leader>dO` step out
- `<leader>de` evaluate expression
- `<leader>dr` debug REPL
- `<leader>du` toggle debug UI
- `<leader>dt` terminate debugging

Compile with debug symbols (`-g`) before debugging. The supplied single-file and Debug CMake tasks do this appropriately.

## Recommended project file

Copy `extras/.clang-format.example` to a C/C++ project's root as `.clang-format` if you want an explicit project formatting policy.

## Testing without replacing your config

A safe test method is to give the config a separate Neovim app name:

```bash
mkdir -p ~/.config/nvim-cpp-test
cp -a /path/to/extracted/nvim/. ~/.config/nvim-cpp-test/
NVIM_APPNAME=nvim-cpp-test nvim
```

Your normal `~/.config/nvim` remains untouched.
