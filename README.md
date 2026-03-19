# OACS Dotfiles Repository

## Repository Overview

macOS-focused dotfiles for Oscar C (oacs), managing development environment configurations. Linux/Wayland configs are preserved in the `archive/pre-cleanup` branch.

## Repository Structure

```
.dotfiles/
├── config/                     # Configuration files for $XDG_CONFIG_HOME
│   ├── aerospace/             # macOS window management
│   ├── kanata/                # Keyboard remapping
│   ├── nvim/                  # Neovim configuration
│   ├── starship.toml          # Cross-shell prompt
│   ├── tmux/                  # Terminal multiplexer
│   ├── zathura/               # PDF viewer
│   └── zsh/                   # Zsh shell configuration
├── scripts/                    # Utility scripts
│   ├── git-clone-barebones    # Git repository cloning
│   ├── install                # Main installation script
│   ├── load                   # Configuration loading script
│   ├── start-dev-environment.sh # Development environment startup
│   ├── ta                     # Project launcher script
│   └── tmux_sessions          # Tmux session management
├── home.docker-compose.yml    # Docker Compose configuration
├── nvim-maps                  # Neovim key mappings reference
├── stylua.toml                # Lua code formatter configuration
└── README.md                  # This file
```

## Key Technologies & Tools

### Terminal & Shell
- **Zsh**: Primary shell with Oh My Zsh framework
- **Ghostty**: Terminal emulator
- **Tmux**: Terminal multiplexer with custom session management
- **Starship**: Cross-shell prompt with custom symbols

### Development Environment
- **Neovim**: Modern Vim with Lazy.nvim plugin manager + blink.cmp
- **Git**: Enhanced with Delta diff tool and custom aliases
- **Node.js**: PNPM package manager
- **Python**: Pyenv for version management
- **Rust**: Toolchain configuration
- **Docker**: Containerization support

### Desktop Environment (macOS)
- **Aerospace**: macOS window management
- **Kanata**: Keyboard remapping

### Automation & Scripts
- **Custom Scripts**: Project management, environment setup
- **Git Hooks**: Automated workflows

## Configuration Details

### Neovim Setup
- **Plugin Manager**: Lazy.nvim
- **Configuration**: Modular Lua setup in `lua/oacs/`
- **Completion**: blink.cmp
- **Key Plugins**: LSP (angularls, ts_ls, lua_ls), Treesitter, Telescope, Harpoon, Supermaven
- **Theme**: Catppuccin
- **File**: `config/nvim/init.lua`

### Git Configuration
- **Diff Tool**: Delta with Catppuccin theme
- **External Diff**: Difftastic
- **GitHub Integration**: CLI authentication
- **Aliases**: Custom shortcuts for common operations
- **File**: `config/.gitconfig`

### Shell Configuration
- **Zsh**: Oh My Zsh with custom plugins
- **Environment**: Pyenv, Zoxide, PNPM integration
- **Aliases**: `vim` → `nvim`, `python` → `python3`
- **File**: `config/zsh/.zshrc`

## Installation & Usage

### Prerequisites
- macOS
- Git
- Basic development tools (Homebrew)

### Quick Setup
1. Clone the repository
2. Run `scripts/install` for dependencies
3. Run `scripts/load` to symlink configurations
4. Restart terminal/shell

### Development Environment
- Use `scripts/start-dev-environment.sh` for full dev setup
- Includes Docker, PM2, and AWS SSO login
- Automated workspace initialization

## Key Scripts

### `scripts/ta`
Project launcher that:
- Lists projects from `~/dev` directory
- Creates tmux sessions with project-specific layouts
- Supports custom project configurations

### `scripts/tmux_sessions`
Creates predefined tmux sessions for:
- Workspace management
- Multi-window development setup
- Project-specific window layouts

### `scripts/start-dev-environment.sh`
Comprehensive development environment startup:
- Docker Desktop initialization
- Container orchestration
- PM2 process management
- AWS SSO authentication

## Customization

### Adding New Configurations
1. Add config files to `config/` directory
2. Update `scripts/load` to create symlinks
3. Test with `scripts/load`

### Modifying Neovim
- Edit files in `config/nvim/lua/oacs/`
- Use Lazy.nvim for plugin management
- Configuration is modular and well-organized

### Shell Customization
- Modify `config/zsh/.zshrc` for Zsh
- Customize `config/starship.toml` for prompt

## Dependencies

### Required Packages
- Git, Zsh, Tmux
- Neovim, Node.js, Python
- Docker, PM2 (for dev environment)
- Fonts: FiraCode Nerd Font

## Archived Configs

Linux/Wayland configs (hypr, rofi, waybar), alternative terminals (alacritty, kitty, wezterm), and alternative shells (fish, bash, omf) are preserved in the `archive/pre-cleanup` branch.

---

**Note for LLMs**: macOS-only dotfiles. Neovim uses blink.cmp for completion (migrated from nvim-cmp/LuaSnip). Active LSPs: angularls, ts_ls, lua_ls. Plugin manager: Lazy.nvim. Theme: Catppuccin.
