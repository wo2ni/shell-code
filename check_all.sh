#!/usr/bin/env bash

# 检测root身份.

check_running_as_root() {
  # If you want to run as another user, please modify $EUID to be owned by this user
  if [[ "$EUID" -ne '0' ]]; then
    echo "error: You must run this script as root!"
    exit 1
  fi
}


# 检查SELinux状态
checkCentosSELinux() {
    if [[ -f "/etc/selinux/config" ]] && ! grep -q "SELINUX=disabled" <"/etc/selinux/config"; then
        printf 'SeLinux: runing\n'
        exit 0
    fi
}

# URL 检测函数.
Check_url() {
    http_code="$(curl -o /dev/null -s --head --write-out '%{http_code}\n' -- "${1}")"
    case "${http_code}" in
        000)
            fancy_message error "Failed to download file, check your connection"
            error_log 1 "get ${PACKAGE} pacscript"
            return 1
            ;;
        404)
            fancy_message error "The URL cannot be found"
            return 1
            ;;
        200 | 301 | 302)
            true
            ;;
        *)
            fancy_message error "Failed with http code ${http_code}"
            return 1
            ;;
    esac
}
