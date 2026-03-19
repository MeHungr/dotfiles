# SSH Keychain command (above instant prompt, since it asks for password)
eval $(keychain --quiet --eval ~/.ssh/mearchrkey)

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source $ZDOTDIR/zsh_keymap.zsh
source $ZDOTDIR/zsh_aliases.zsh
source $ZDOTDIR/themes/powerlevel10k/powerlevel10k.zsh-theme

# ============ Setup ============
# Options for zsh (man zshoptions)
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
zle_highlight=('paste:none')

# No beeping
setopt nobeep
# ===============================

# ============ History ============
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
HISTSIZE=500000
SAVEHIST=500000
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt BANG_HIST
# =================================

# ============ Plugins ============
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# =================================

# ============ Prompt ============
# autoload -Uz promptinit
# promptinit
# prompt suse
# ================================

# ============ PATH ============ 
export PATH=$PATH:$HOME/.local/bin
# Add go to path
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:/usr/local/go/bin
# ==============================

# ============ fpath ============
fpath+=("$HOME/.local/share/zsh/site-functions")
# ===============================

# ============ Completions ============
autoload -Uz compinit # Autocompletion
compinit # Also autocompletion
zstyle ':completion:*' menu select # Autocompletion with arrow keys
_comp_options+=(globdots) # Inlclude hidden files
# =====================================

# ============ History Searching ============ 
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
# ===========================================

# ============ User Config ============
bindkey -v # vi mode
bindkey -M viins 'jj' vi-cmd-mode # Add 'jj' keybind for entering cmd mode
# =====================================

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
