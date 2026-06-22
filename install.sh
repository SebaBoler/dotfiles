#!/usr/bin/env bash
# Bootstrap on a new Mac:  git clone <repo> ~/dotfiles && ~/dotfiles/install.sh
set -euo pipefail
DF="$(cd "$(dirname "$0")" && pwd)"

# 1. Homebrew
if ! command -v brew >/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# 2. Packages
brew bundle --file="$DF/Brewfile"

# 3. Symlinks (existing files backed up to *.bak)
link() { [ -e "$1" ] && [ ! -L "$1" ] && mv "$1" "$1.bak"; mkdir -p "$(dirname "$1")"; ln -sf "$2" "$1"; }
link ~/.zshrc                "$DF/.zshrc"
link ~/.tmux.conf           "$DF/.tmux.conf"
link ~/.gitconfig           "$DF/.gitconfig"
link ~/.p10k.zsh            "$DF/.p10k.zsh"
link ~/.config/ghostty/config "$DF/ghostty/config"

# 4. TPM + tmux plugins
[ -d ~/.tmux/plugins/tpm ] || git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins || true

# 5. Font (required by p10k)
brew install --cask font-meslo-lg-nerd-font || true

echo "✅ Done. Reopen Ghostty."
