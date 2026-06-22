# tmux: auto-attach do sesji "main" (lub utwórz), tylko w Ghostty, bez zagnieżdżania
if [[ -z "$TMUX" && -n "$GHOSTTY_RESOURCES_DIR" ]]; then
  tmux new-session -A -s main
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# bun completions
[ -s "/Users/sebastianpietrzak/.bun/_bun" ] && source "/Users/sebastianpietrzak/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# add the nvm path
export NVM_DIR="$HOME/.nvm"
# load the nvm script every time you open the terminal
source $(brew --prefix nvm)/nvm.sh
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# Added by Windsurf
export PATH="/Users/sebastianpietrzak/.codeium/windsurf/bin:$PATH"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/sebastianpietrzak/.lmstudio/bin"

. "$HOME/.local/bin/env"

source $HOME/.local/bin/env
export API_TIMEOUT_MS=600000

# pnpm
export PNPM_HOME="/Users/sebastianpietrzak/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
export PATH=$PATH:$HOME/.maestro/bin
export PATH=$PATH:$HOME/.maestro/bin

# Added by Windsurf
export PATH="/Users/sebastianpietrzak/.codeium/windsurf/bin:$PATH"

# Added by Antigravity
export PATH="/Users/sebastianpietrzak/.antigravity/antigravity/bin:$PATH"

alias claude-mem='bun "/Users/sebastianpietrzak/.claude/plugins/marketplaces/thedotmack/plugin/scripts/worker-service.cjs"'

# Claude Status Bar Monitor
alias cs='claude-statusbar'
alias cstatus='claude-statusbar'

# Added by Antigravity IDE
export PATH="/Users/sebastianpietrzak/.antigravity-ide/antigravity-ide/bin:$PATH"

# Android / EAS local builds (knf-exam: `eas build -p android --local`)
# JAVA_HOME pinuje JDK 17 (Android/Gradle nie lubi 21/24). Jeśli inny projekt
# potrzebuje nowszej Javy — zakomentuj poniższą linię JAVA_HOME.
export JAVA_HOME="/opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home"
export ANDROID_HOME="$HOME/Library/Android/sdk"
export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"
export PATH="$JAVA_HOME/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator:$PATH"

# --- CLI tools (fzf, zoxide, eza, zsh plugins) ---
source <(fzf --zsh)                       # fzf: Ctrl-R history, Ctrl-T files, Alt-C cd
eval "$(zoxide init zsh)"                 # zoxide: `z <dir>` smart cd
alias ls='eza --group-directories-first'  # eza zamiast ls
alias ll='eza -lah --git --group-directories-first'
alias tree='eza --tree'

# fzf używa fd (szybsze) + podgląd przez bat
export FZF_DEFAULT_COMMAND='fd --hidden --strip-cwd-prefix --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always {}'"
export FZF_ALT_C_COMMAND='fd --type=d --hidden --exclude .git'

alias cat='bat --paging=never'            # bat zamiast cat (kolory, numery linii)
alias top='btop'                          # btop zamiast top

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh  # musi być ostatni
eval "$(atuin init zsh)"                   # atuin: lepsza historia (Ctrl-R), po highlightingu
