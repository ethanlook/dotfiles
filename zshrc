# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"
# ZSH_THEME="afowler"
# ZSH_THEME="gallifrey"

export NVM_DIR="/Users/ethanlook/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

setopt auto_name_dirs

togif() {
  WIDTH=$(ffprobe -v error -show_entries stream=width -of csv=p=0:s=x $1)
  ffmpeg -y -i $1 -vf fps=24,scale=$WIDTH:-1:flags=lanczos,palettegen $1.palette.png;
  ffmpeg -i $1 -i $1.palette.png -filter_complex "fps=24,scale=$WIDTH:-1:flags=lanczos[x];[x][1:v]paletteuse" $1.gif
  rm $1.palette.png
}

# alias scope="/Applications/Kaleidoscope.app/Contents/MacOS/Kaleidoscope"

# alias closure="java -jar /Users/jrundquist/src/external/google/closure-compiler/build/compiler.jar"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under

# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:$HOME/.brew/bin
export PATH=${HOME}/homebrew/bin:$PATH
export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:/opt/local/bin:/usr/local/mysql/bin
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin
export PATH="$PATH:$(go env GOPATH)/bin"

chrome () {
  /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome $* 2>&1 &
}

# This way the completion script does not have to parse Bazel's options
# repeatedly.  The directory in cache-path must be created manually.
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

ulimit -n 10240

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
