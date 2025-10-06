# SSH Keychain command (above instant prompt, since it asks for password)
eval $(keychain --quiet --eval ~/.ssh/mearchrkey)

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source $ZDOTDIR/zsh_keymap.zsh
source $ZDOTDIR/themes/powerlevel10k/powerlevel10k.zsh-theme

# ============ Setup ============
# Options for zsh (man zshoptions)
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
zle_highlight=('paste:none')

# No beeping
setopt nobeep
# ===============================

# ============ Plugins ============
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# =================================

# ============ Prompt ============
# autoload -Uz promptinit
# promptinit
# prompt suse
# ================================

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

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
