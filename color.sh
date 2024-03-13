#!/usr/bin/env bash

#--Color Code;
Cls="\033[0m"       ;    White="\033[1;38m"
Red="\033[1;31m"    ;    Green="\033[1;32m"
Yellow="\033[1;33m" ;    Blue="\033[1;34m"
Purple="\033[1;35m" ;    Cyan_blue="\033[1;36m"

#--Cursor Hide and Show;
Hide_cur="\033[?25l"   ;   Show_cur="\033[?25h"


echoContent() {
    case $1 in
    # 红色
    "red")
        # shellcheck disable=SC2154
        ${echoType} "\033[31m${printN}$2 \033[0m"
        ;;
        # 天蓝色
    "skyBlue")
        ${echoType} "\033[1;36m${printN}$2 \033[0m"
        ;;
        # 绿色
    "green")
        ${echoType} "\033[32m${printN}$2 \033[0m"
        ;;
        # 白色
    "white")
        ${echoType} "\033[37m${printN}$2 \033[0m"
        ;;
    "magenta")
        ${echoType} "\033[31m${printN}$2 \033[0m"
        ;;
        # 黄色
    "yellow")
        ${echoType} "\033[33m${printN}$2 \033[0m"
        ;;
    esac
}

# status print
function _info() {
  printf "${GREEN}[信息] ${NC}"
  printf -- "%s" "$@"
  printf "\n"
}

function _warn() {
  printf "${YELLOW}[警告] ${NC}"
  printf -- "%s" "$@"
  printf "\n"
}

function _error() {
  printf "${RED}[错误] ${NC}"
  printf -- "%s" "$@"
  printf "\n"
  exit 1
}


Color_Text()
{
  echo -e " \e[0;$2m$1\e[0m"
}

Echo_Red()
{
  echo $(Color_Text "$1" "31")
}

Echo_Green()
{
  echo $(Color_Text "$1" "32")
}

Echo_Yellow()
{
  echo -n $(Color_Text "$1" "33")
}

Echo_Blue()
{
  echo $(Color_Text "$1" "34")
}

