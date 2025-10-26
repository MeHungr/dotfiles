# ============ Improved ls ============
if command -v eza &>/dev/null; then
    alias ls='eza --color=always --color-scale=all --color-scale-mode=gradient --icons=always --group-directories-first'
    alias tree='eza --color=always --color-scale=all --color-scale-mode=gradient --icons=always --group-directories-first --tree'
fi
# =====================================

# ============ Git aliases ============
alias gaa='git add --all'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'
# =====================================
