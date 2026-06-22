# dotfiles

Mój terminal: **Ghostty + tmux + zsh (Powerlevel10k)**.

## Nowy komputer
```sh
git clone https://github.com/<user>/dotfiles ~/dotfiles
~/dotfiles/install.sh
```
`install.sh` instaluje Homebrew + pakiety (Brewfile), tworzy symlinki, stawia TPM i pluginy tmux, dociąga czcionkę MesloLGS NF.

## Co jest w zestawie
| | |
|---|---|
| Terminal | Ghostty (Catppuccin Mocha, MesloLGS NF) |
| Multiplexer | tmux + TPM (catppuccin, resurrect, continuum) |
| Prompt | Powerlevel10k |
| Nawigacja | fzf, zoxide (`z`), fd, ripgrep |
| Zamienniki | eza (`ls`), bat (`cat`), btop (`top`), git-delta |
| Historia | atuin (`Ctrl-R`), tldr |

## Pliki
- `.zshrc`, `.tmux.conf`, `.gitconfig`, `.p10k.zsh`
- `ghostty/config` → `~/.config/ghostty/config`
- `Brewfile`, `install.sh`

Pliki są **symlinkami** do tego repo — edytujesz w `~/.zshrc`, zmiana ląduje w repo.
Po edycji: `git -C ~/dotfiles add -A && git -C ~/dotfiles commit -m "..." && git -C ~/dotfiles push`
