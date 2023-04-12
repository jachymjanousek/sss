#			   ____ ____ ____   			#
#			  / ___/ ___/ ___|  			#
#			  \___ \___ \___ \  			#
#			   ___) |__) |__) | 			#
#			  |____/____/____/  			#
# Simple super shell (SSS)
# Woltair
# Jachym Janousek <jachym.janousek@woltair.cz>
#
# This is set of aliases and functions that I use *daily* at Woltair.
# Feel free to use it, but please don't blame me if it breaks something.
# I am not responsible for any damage caused by those scripts and aliases.
# Use at your own risk.
#
# If you have any suggestions, please let me know.

# DISCLAIMER:
# whole SSS is dependent on oh-my-zsh git plugin and git aliases
# if you don't use oh-my-zsh, you should.
# if you don't use git aliases, you should.
# if you don't use git, you should.
# if you don't use zsh, you should.
# if you don't use shell, you should.
# if you don't use computer, you should.
# (sorry, not sorry)

# for conf in "$HOME/.config/zsh/SSS/"*.zsh; do
#   source "${conf}"
# done
# unset conf

source $HOME/.sss/aliases.zsh
source $HOME/.sss/functions.zsh

# tempbranch
alias tempdev="tempbranch dev"
alias tempprod="tempbranch prod production"

# gitsync
alias syncdev="gitsync dev"
alias syncprod="gitsync production"