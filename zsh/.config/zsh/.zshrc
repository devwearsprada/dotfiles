# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename "$XDG_CONFIG_HOME/zsh/.zshrc"

autoload -Uz compinit
compinit
# End of lines added by compinstall

# XDG
export XDG_DATA_HOME="$HOME"/.local/share
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_STATE_HOME="$HOME"/.local/state
export XDG_CACHE_HOME="$HOME"/.cache

# Config
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export ZDOTDIR="$XDG_CONFIG_HOME"/zsh
export HISTFILE="$XDG_STATE_HOME"/zsh/history
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
export GVIMINIT='let $MYGVIMRC = !has("nvim") ? "$XDG_CONFIG_HOME/vim/gvimrc" : "$XDG_CONFIG_HOME/nvim/init.gvim" | so $MYGVIMRC'
export VIMINIT='let $MYVIMRC = !has("nvim") ? "$XDG_CONFIG_HOME/vim/vimrc" : "$XDG_CONFIG_HOME/nvim/init.vim" | so $MYVIMRC'
# Wget file
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"
# SSH
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"

# Path to oh-my-zsh
export ZSH="$XDG_DATA_HOME/oh-my-zsh" 
# Theme to load
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
# Plugins to load 
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

plugins=(
  git 
  zsh-history-substring-search
  zsh-autosuggestions 
  zsh-syntax-highlighting
)

# Keybinds for history search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

source $ZSH/oh-my-zsh.sh


#Start X
[ ! "$DISPLAY" ] && exec startx $XINITRC

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
