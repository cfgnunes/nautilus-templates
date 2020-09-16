#!/usr/bin/env bash

# <description script>
#
# Autor: Cristiano Fraga G. Nunes
# E-mail: cfgnunes@gmail.com

set -o errexit  # Abort on nonzero exitstatus
set -o nounset  # Abort on unbound variable
set -o pipefail # Abort on errors within pipes

SCRIPT_NAME=$(basename "$0")
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

_main() {
    _run_as_sudo

    _log "Hello, World!"
    _log "My script dir is $SCRIPT_DIR!"
}

_log() {
    STR_MESSAGE="$1"

    logger -s "[$SCRIPT_NAME] $STR_MESSAGE"
}

_get_command_path() {
    COMMAND="$1"

    COMMAND_PATH=$(command -v "$COMMAND") &>/dev/null || true
    echo "$COMMAND_PATH"
}

_run_as_sudo() {
    if ((EUID != 0)); then
        if [ -n "$(_get_command_path 'sudo')" ]; then
            sudo --preserve-env "$0"
        elif [ -n "$(_get_command_path 'gksu')" ]; then
            gksu --preserve-env "$0"
        else
            _log "You must run $SCRIPT_NAME as root."
        fi
        exit 1
    fi
}

_main "$@"
