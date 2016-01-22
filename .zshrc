#!/bin/zsh
# shortcut to this dotfiles path is $ZSH
export ZSH="$HOME/.dotfiles"

# your project folder that we can `c [tab]` to
export PROJECTS="$HOME/Code"

# all of our zsh files
typeset -U config_files
config_files=($ZSH/*/*.zsh)

# load the path files
source "$ZSH/homebrew/path.zsh"
for file in ${(M)config_files:#*/path.zsh}; do
  source "$file"
done

# setup antibody
antibody bundle < "$ZSH/antibody/bundles.txt"

# load everything but the path and completion files
for file in ${${config_files:#*/path.zsh}:#*/completion.zsh}; do
  source "$file"
done

# initialize autocomplete here, otherwise functions won't be loaded
autoload -U compinit && compinit

# load every completion after autocomplete loads
for file in ${(M)config_files:#*/completion.zsh}; do
  source "$file"
done

unset config_files

# use .localrc for SUPER SECRET CRAP that you don't
# want in your public, versioned repo.
[[ -a ~/.localrc ]] && source ~/.localrc
