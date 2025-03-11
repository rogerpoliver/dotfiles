# CodeWhisperer pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.pre.zsh"
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="/Users/rogerpoliver/.oh-my-zsh"
ZSH_THEME="spaceship"

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust \
    zdharma-continuum/fast-syntax-highlighting \
    romkatv/powerlevel10k \
    zsh-users/zsh-autosuggestions
    # marlonrichert/zsh-autocomplete \
### End of Zinit's installer chunk

. /opt/homebrew/opt/asdf/libexec/asdf.sh

# GPG Key
export GPG_TTY=$(tty)

# alias
# alias vim='nvim'
alias ls='eza --icons -1'
alias fd='find'
alias ds='duf'
alias zshrc='nvim ~/.zshrc'
alias cat='bat'

# Glow help
alias kitty-help='glow https://raw.githubusercontent.com/rogerpoliver/terminal-cheatsheet/main/kitty.md'

export EDITOR="nvim"
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source /Users/rogerpoliver/.config/broot/launcher/bash/br

# Tmux
alias tmux="TERM=screen-256color-bce tmux"
set -g default-terminal "xterm"

#Nvim config
alias nvim-chad="NVIM_APPNAME=NvChad nvim"
alias nvim-astro="NVIM_APPNAME=AstroNvim nvim"
alias vim="NVIM_APPNAME=AstroNvim nvim"
alias nvim="NVIM_APPNAME=AstroNvim nvim"

function nvims() {
  items=("default" "NvChad" "AstroNvim")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config='AstroNvim'
  fi
  NVIM_APPNAME=$config nvim $@
}

bindkey -s ^a "nvims\n"


### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/rogerpoliver/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

# ASDF
alias asdf-go-update='asdf reshim golang'
. ~/.asdf/plugins/golang/set-env.zsh