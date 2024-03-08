# -------------------------------------------------------------------------------
# --                          ZSH alias Configuration
# -------------------------------------------------------------------------------

function mkcd() { mkdir -p $1; cd $1;}
alias v='nvim'

# Core Shortcuts
alias rm='trash' # Use `trash` program instead of built-in irrecoverable way to delete nodes.
alias mv='mv --interactive --verbose' # Move nodes with interactive mode and extra verbosity.
alias cp='cp --interactive --verbose' # Copy nodes with interactive mode and extra verbosity.
alias ln='ln --interactive --verbose' # Link nodes with interactive mode and extra verbosity.
alias mkdir='mkdir -p' # Make missing parent directories when creating folders.
alias grep="grep --color='auto'" # Grep with colors.
alias du='du --max-depth=1 --si' # Display size of files and folders under current directory.
alias df='df --all --si --print-type' # Display all disk usage statistics with SI units and FS types.
alias l='eza --sort=changed --icons -la --git --git-ignore --ignore-glob=".DS_Store|__MACOSX|__pycache__"'
alias la='eza --group-directories-first --icons -la'
alias ll='eza --group-directories-first --icons -la --color-scale --time-style=long-iso --git --git-ignore --ignore-glob=".git|.DS_Store|__MACOSX|__pycache__"'
alias ll3='eza --group-directories-first --icons -la --git --git-ignore --ignore-glob=".git|.DS_Store|__MACOSX" -T -L3'
alias ll4='eza --group-directories-first --icons -la --git --git-ignore --ignore-glob=".git|.DS_Store|__MACOSX" -T -L4'
alias tree='eza --group-directories-first -T --icons'
# Moving around
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias .2='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

# chmod
alias 644='chmod 644'
alias 755='chmod 755'
alias 777='chmod 777'

# -------------------------------- #
# Node Package Manager
# -------------------------------- #
alias n="npm"
alias nd="npm run dev"
alias nb="npm run build"
alias p="pnpm"
alias pi="pnpm install"
alias nio="ni --prefer-offline"
alias s="nr start"
alias d="nr dev"
alias b="nr build"
alias lint="nr lint"
alias lintf="nr lint --fix"
alias re="nr release"

# Shorter commands for `Homebrew`.
alias bi='brew install'
alias br="brew uninstall"
alias bu="brew update && brew upgrade && brew cleanup"

#alias python=python3

# Clear DNS cache.
alias clear-dns-cache="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Empty the trash, the main HDD and on all mounted volumes,
# and clear Apple’s system logs to improve shell startup speed.

alias empty-trash="sudo rm -frv /Volumes/*/.Trashes; \
                   sudo rm -frv ~/.Trash; \
                   sudo rm -v /private/var/vm/sleepimage; \
                   sudo rm -frv /private/var/log/asl/*.asl; \
                   sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"
alias clean="sudo /opt/homebrew/bin/mac-cleanup"
alias cdtmp='cd mktemp -d `/tmp/kriszu-temp`'

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#             Update applications and CLTs.
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
alias u="sudo softwareupdate --install --all \
            && brew update \
            && brew upgrade \
            && brew cleanup"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#             Git
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Use github/hub
alias git=hub

# Go to project root
alias grt='cd "$(git rev-parse --show-toplevel)"'

alias gs='git status'
alias gp='git push'
alias gpf='git push --force'
alias gpft='git push --follow-tags'
alias gpl='git pull --rebase'
alias gcl='git clone'
alias gst='git stash'
alias grm='git rm'
alias gmv='git mv'

alias main='git checkout main'

alias gco='git checkout'
alias gcob='git checkout -b'

alias gb='git branch'
alias gbd='git branch -d'

alias grb='git rebase'
alias grbom='git rebase origin/master'
alias grbc='git rebase --continue'

alias gl='git log'
alias glo='git log --oneline --graph'

alias grh='git reset HEAD'
alias grh1='git reset HEAD~1'

alias ga='git add'
alias gA='git add -A'

alias gc='git commit'
alias gcm='git commit -m'
alias gca='git commit -a'
alias gcam='git add -A && git commit -m'
alias gfrb='git fetch origin && git rebase origin/master'

alias gxn='git clean -dn'
alias gx='git clean -df'

alias gsha='git rev-parse HEAD | pbcopy'
alias ghci='gh run list -L 1'

alias deps="npx taze -w"

unset key
