#!/usr/bin/env bash
set -eo pipefail; shopt -s inherit_errexit
source "$(dirname "$(realpath "${BASH_SOURCE[0]}")")/clipboard.sh"
clipboard_copy
