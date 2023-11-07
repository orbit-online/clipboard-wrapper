#!/usr/bin/env bash

# shellcheck source=clipboard.sh
source "$(upkg root "${BASH_SOURCE[0]}")/clipboard.sh"
clipboard_copy
