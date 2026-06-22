# dotfiles

My terminal: **Ghostty + tmux + zsh (Powerlevel10k)**.

## New machine
```sh
git clone https://github.com/SebaBoler/dotfiles ~/dotfiles
~/dotfiles/install.sh
```
`install.sh` installs Homebrew + packages (Brewfile), creates symlinks, sets up TPM and tmux plugins, and pulls the MesloLGS NF font.

## What's included
| | |
|---|---|
| Terminal | Ghostty (Catppuccin Mocha, MesloLGS NF) |
| Multiplexer | tmux + TPM (catppuccin, resurrect, continuum) |
| Prompt | Powerlevel10k |
| Navigation | fzf, zoxide (`z`), fd, ripgrep |
| Replacements | eza (`ls`), bat (`cat`), btop (`top`), git-delta |
| History | atuin (`Ctrl-R`), tldr |

## Files
- `.zshrc`, `.tmux.conf`, `.gitconfig`, `.p10k.zsh`
- `ghostty/config` → `~/.config/ghostty/config`
- `Brewfile`, `install.sh`

Files are **symlinks** into this repo — edit `~/.zshrc` and the change lands in the repo.
After editing: `git -C ~/dotfiles add -A && git -C ~/dotfiles commit -m "..." && git -C ~/dotfiles push`
