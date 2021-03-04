#########################
# RUN AT TERMINAL START #
#########################

# system info from archey (installed via homebrew)
archey

# colorscheme for user
PS1="%{%F{red}%}%n%{%f%}@%{%F{blue}%}%m %{%F{yellow}%}%~ %{%%%f%}%  "

# syntax highlighting (installed via homebrew)
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# auto-suggestions (installed via homebrew)
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

##################
# CUSTOM ALIASES #
##################

alias home="cd ~/Desktop"
alias docs="cd ~/Documents"
}
