#!/bin/bash

app() {
  __call_function __pre_app_subscriber
  source app.sh
  __run "$@"
  __call_function __post_app_subscriber
}

__run() {
  if [[ -f "${PWD}/.logo" ]]; then
    __print blue "$(cat ${PWD}/.logo)"
    echo "\n"
  fi

  if [[ "$1" == "" ]]; then
    __function_exists __help && __help || __print yellow "Add __help function to your bash script."
  elif type "__${1}" &>/dev/null; then
    eval "__${1} ${@:2}"
  else
    __print red "Method \"__${1}\" is not defined."
  fi
  echo "\n"
}

__function_exists() {
  declare -f -F $1 >/dev/null
  return $?
}

__call_function() {
  if __function_exists ${1}; then
    ${1}
  fi
}

__source_env_file() {
  export $(echo $(cat ${1} | sed 's/#.*//g' | xargs))
}

__print() {
  TEXT=${2}
  case ${1} in
  red)
    COLOR=${COLOR_RED}
    ;;
  green)
    COLOR=${COLOR_GREEN}
    ;;
  yellow)
    COLOR=${COLOR_YELLOW}
    ;;
  blue)
    COLOR=${COLOR_BLUE}
    ;;
  *)
    COLOR=${COLOR_BLACK}
    TEXT=${1}
    ;;
  esac

  echo -e "${COLOR}${TEXT}${ENDCOLOR}"
}

# constants
COLOR_BLACK="\e[30m"
COLOR_RED="\e[31m"
COLOR_GREEN="\e[32m"
COLOR_YELLOW="\e[33m"
COLOR_BLUE="\e[34m"
ENDCOLOR="\e[0m"
