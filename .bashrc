#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR="vim"
eval $(keychain --eval --quiet id_rsa id_rsa ~/.ssh/id_rsa)

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

source ~/.dotfiles/git-autocomplete.sh
eval "$(rbenv init -)"

# Rails
alias be="bundle exec"
alias rc="be rails console"
alias rs="be rails server"
alias rsp="rs -p"
alias berk="be rake"
function mgr {
  RAILS_ENV=${1-development} berk db:migrate
}

# Clipboard
alias pbcopy="xclip -selection clipboard"
alias pbpaste="xclip -selection clipboard -o"
