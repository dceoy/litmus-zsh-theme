#!/usr/bin/env zsh

setopt prompt_subst

if [[ -n "${SSH_CONNECTION:-}" ]]; then
  typeset -g _litmus_connection_color='magenta'
else
  typeset -g _litmus_connection_color='cyan'
fi

_litmus_git_prompt() {
  local branch

  branch="$(command git symbolic-ref --quiet --short HEAD 2>/dev/null)" || \
    branch="$(command git rev-parse --short HEAD 2>/dev/null)" || return
  branch="${branch//\%/%%}"

  if [[ -n "$(command git status --porcelain 2>/dev/null)" ]]; then
    print -nr -- "%F{${_litmus_connection_color}}${branch}%F{green}✗%f"
  else
    print -nr -- "%F{${_litmus_connection_color}}${branch}%F{blue}✔%f"
  fi
}

PROMPT="%B%F{blue}[%D{%Y-%m-%d} %D{%H:%M:%S}]%f%b %(?::%B)%F{${_litmus_connection_color}}%(!.#.$)%f%b "
RPROMPT="\$(_litmus_git_prompt) %(?::%B)%F{${_litmus_connection_color}}[%n@%m:%~]%f%b"
