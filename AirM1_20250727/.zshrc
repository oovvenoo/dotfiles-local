# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# 覆蓋 Oh My Zsh 的 g alias
unalias g 2>/dev/null

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# wen's setting
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=46'
export TERM="xterm-256color"
alias zrc="vim ~/.zshrc"
alias szrc="source ~/.zshrc"
alias vrc="vim ~/.vimrc" 
alias svrc="source ~/.vimrc" 
alias agn="vim ~/.oh-my-zsh/themes/agnoster.zsh-theme"

# documentary
alias lss="ls -lahtr"
alias c="clear"
alias cy="cd /Users/wen.chen/projects/cyberbiz.co"
alias lp="cd /Users/wen.chen/projects/lungpin-scripts"
alias dl="cd /Users/wen.chen/projects/download_invoices"
alias wab="cd /Users/wen.chen/projects/woocommerce-api-bridge"
alias ps="ps aux | grep"

# brew
alias bsl="brew services list"
alias bs="brew services start"
alias bst="brew services stop"

# claude
alias cml="claude mcp list"

# check and create pr comments
alias chpr="ruby app/jobs/presentation/check_pr_comments.rb"
alias crpr="ruby app/jobs/presentation/create_pr_comments.rb"
alias capr="ruby app/jobs/presentation/all_pr_comments.rb"
alias crts="ruby app/jobs/presentation/test.rb"

# rails
alias bi="bundle install"
alias bex="bundle exec"
alias ber="bundle exec rspec"
alias bec="bundle exec cucumber"
alias rs="rails server"
alias rc="rails console"
alias fs="foreman start"
alias rcp="rubocop"
alias becop="bundle exec rubocop"
alias r5="RAILS_NEXT=1"
alias br3='bin/rails s -p 3000'
alias p4='bundle exec puma -p 4000'
alias br5='bin/rails s -p 5000'
alias midev='rake db:migrate'
alias mites='rake db:migrate RAILS_ENV=test'

# gem parallel
alias pasp="bundle exec parallel_rspec"

# git
alias gck="git checkout"
alias gbl="git blame"
alias gs="git stash"
alias gspop="git stash pop"
alias gcl="git clone"

# yarn
alias yi="yarn install"
#alias adys='yarn start-ignore-ts'
alias adys='yarn --cwd frontend/admin start'
#alias shys='yarn serve'
alias shys='yarn --cwd frontend/shop serve'
alias chys='yarn --cwd frontend/checkout start'
alias posys='yarn --cwd frontend/pos start'
alias yb='yarn build'
alias clcheckout='script/build_frontend --namespace checkout --clear'
alias cladmin='script/build_frontend --namespace admin --clear'
alias clshop='script/build_frontend --namespace shop --clear'
alias bucheckout='script/build_frontend --namespace checkout'
alias buadmin='script/build_frontend --namespace admin'
alias bushop='script/build_frontend --namespace shop'

# cyberbiz projects
alias resq='QUEUE=* INTERVAL=1 bundle exec rake resque:work'
alias resqsch="bundle exec rake resque:scheduler"
alias siq='bundle exec sidekiq -C config/sidekiq.yml --environment development'
alias siqdev='bundle exec sidekiq -C config/sidekiq_development.yml --environment development'
alias unic='bundle exec unicorn -p 4000 -c config/development.unicorn.conf.rb'
alias awssta='aws ssm start-session --target i-021a4b4b3b8678d62'
alias awsprod='aws ssm start-session --target i-035b20439e7896d12 --profile prodaccess --region ap-northeast-1'
alias awscan='aws ssm start-session --target i-035b20439e7896d12 --profile canarydeployer --region ap-northeast-1'

# docker 
alias doup='docker-compose up -d'
alias dodn='docker-compose down'
alias dore='docker-compose down && docker-compose up -d'
alias doex='docker exec -it'
alias dops='docker ps'

alias ccu='npx ccusage@latest'

source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

eval "$(rbenv init - zsh)"
eval "$(pyenv init - zsh)"

export LC_ALL=en_US.UTF-8

export PATH="/opt/homebrew/opt/mysql@8.0/bin:$PATH"

export LDFLAGS="-L/opt/homebrew/opt/mysql@8.0/lib"
export CPPFLAGS="-I/opt/homebrew/opt/mysql@8.0/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/mysql@8.0/lib/pkgconfig"

# cyberbiz 專案
# Reference: rails/rails#38560
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
# zbar
export ZBAR_LIB="$(brew --prefix zbar)/lib/libzbar.dylib"

# docker
export PATH="/Applications/Docker.app/Contents/Resources/bin:$PATH"


export GOPATH="$HOME/go"; export GOROOT="$HOME/.go"; export PATH="$GOPATH/bin:$PATH"; # g-install: do NOT edit, see https://github.com/stefanmaric/g
