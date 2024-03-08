
#==============================================================#
#                       function                               #
#==============================================================#

# -------------------------------- #
# Directories
#
# I put
# `~/i` for my projects
# `~/f` for forks
# `~/r` for reproductions
# -------------------------------- #

function i() {
  cd ~/i/$1
}

function repro() {
  cd ~/r/$1
}

function forks() {
  cd ~/f/$1
}

function dir() {
  mkdir $1 && cd $1
}

function clone() {
  if [[ -z $2 ]] then
    git clone "$@" && cd "$(basename "$1" .git)"
  else
    git clone "$@" && cd "$2"
  fi
}

# Clone to ~/i and cd to it
function ci() {
  i && clone "$@" && code-insiders . && cd ~2
}

function cr() {
  repros && clone "$@" && code-insiders . && cd ~2
}

function clonef() {
  forks && clone "$@" && code-insiders . && cd ~2
}

function codei() {
  i && code-insiders "$@" && cd -
}


function zsh-startuptime-slower-than-default() {
	local time_rc
	time_rc=$((TIMEFMT="%mE"; time zsh -i -c exit) &> /dev/stdout)
	# time_norc=$((TIMEFMT="%mE"; time zsh -df -i -c exit) &> /dev/stdout)
	# compinit is slow
	local time_norc
	time_norc=$((TIMEFMT="%mE"; time zsh -df -i -c "autoload -Uz compinit && compinit -C; exit") &> /dev/stdout)
	echo "my zshrc: ${time_rc}\ndefault zsh: ${time_norc}\n"

	local result
	result=$(scale=3 echo "${time_rc%ms} / ${time_norc%ms}" | bc)
	echo "${result}x slower your zsh than the default."
}

timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}
