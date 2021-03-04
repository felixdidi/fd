#########################
# RUN AT TERMINAL START #
########################

# inform about location of customization script
echo "
Profile imported from ~/Documents/GitHub/fd/terminal/customizations.zsh
_______________________________________________________________________

"

# system info from archey (installed via homebrew)
archey

# colorscheme for user
PS1="%{%F{red}%}%n%{%f%}@%{%F{blue}%}%m %{%F{yellow}%}%~ %{%%%f%}%   "

# syntax highlighting (installed via homebrew)
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# auto-suggestions (installed via homebrew)
#source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# auto-complete
# https://github.com/marlonrichert/zsh-autocomplete
source "/Users/felixdietrich/Documents/GitHub/fd/terminal/scripts/zsh-autocomplete/zsh-autocomplete.plugin.zsh"

##################
# CUSTOM ALIASES #
##################

alias home="cd ~/Desktop"
alias docs="cd ~/Documents"

rstudio() {
	touch $1
	open -a RStudio $1
}
