#! /bin/bash

export SUDO_PS1="${Color_IWhite}${Color_On_Red}\u@\h: \W#${Color_NoColor} "

# TODO: Rewrite this to show the last two directories instead of shortening by length
shorten_path () {
  #arg: path to shorten (defaults to $PWD)
  path="${1:-$PWD}"
  shortened=$(echo "${path/#$HOME/\~}" | awk -F "/" '
    {if (length($0) > 35)
      {if (NF>4)
        print $1 "/" $2 "/.../" $(NF-1) "/" $NF;
      else if (NF>3)
        print $1 "/" $2 "/.../" $NF;
      else
        print $1 "/.../" $NF;
    } else
      print $0;}
  ')
  echo "${shortened}"
}

USER_HOST="[${Color_IGreen}\u${Color_NoColor}@${Color_IWhite}${Color_On_Red}\h${Color_NoColor}]"
STANDARD_PATH="${Color_Cyan}\w${Color_NoColor}"

git_prompt () {
  local git_branch r s symbol

  git_branch=$(git symbolic-ref HEAD 2>&1)
  r=$?
  if [ "$git_branch" = "fatal: ref HEAD is not a symbolic ref" ]; then 
    echo "${Color_Red}???${Color_NoColor} "

  elif [ $r -eq 0 ]; then
    git_branch="${git_branch#refs/heads/}"
    s=`git status`

    if grep -q "ahead of" <<<"$s"; then
      symbol="+"
    elif grep -q "behind" <<<"$s"; then
      symbol="-"
    elif grep -q "diverged" <<<"$s"; then
      symbol='!!'
    fi

    if grep -q "nothing to commit" <<<"$s"; then
      git_branch="(${Color_Green}$git_branch${Color_NoColor})"
      index_symbol=""
    elif grep -q -E "Untracked files|not staged" <<<"$s"; then
      git_branch="(${Color_Yellow}$git_branch${Color_NoColor})"
      index_symbol="?"
    elif grep -q "Changes to be committed" <<<"$s"; then
      git_branch="(${Color_Red}$git_branch${Color_NoColor})"
      index_symbol="!"
    fi

    [ -n "$git_branch" ] && echo "${Color_BYellow}${symbol}${index_symbol}${Color_NoColor}${git_branch}"
  fi
}


git_branch () {
  toplevel=$(git rev-parse --show-toplevel)
  echo "${Color_Purple}"$(basename "$toplevel")"${Color_NoColor}"
}


git_path () {
  toplevel="$(git rev-parse --show-toplevel)"
  cwd=$(pwd -P)
  shortened=-$([ "$toplevel" != "$cwd" ] && shorten_path "${cwd#$toplevel}")
  echo "${Color_Cyan}${shortened}${Color_NoColor}"
}


set_prompt () {
  gitstuff=$(git_prompt)
  if [ -n "$VIRTUAL_ENV" ]; then
    venv="${Color_Yellow}$(basename $VIRTUAL_ENV)${Color_NoColor} "
  else
    venv=""
  fi

  if [ -n "$gitstuff" ]; then
    prompt="$(git_branch) $(git_prompt)\n$USER_HOST $(git_path)"
  else
    prompt="$USER_HOST $STANDARD_PATH"
  fi
  export PS1="${venv}${prompt} \$ "
}


if [ -n "$PROMPT_COMMAND" ]; then
  PROMPT_COMMAND="$PROMPT_COMMAND; set_prompt"
else
  PROMPT_COMMAND="set_prompt"
fi

export PROMPT_DIRTRIM=2

# Set title if using xterm
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac
