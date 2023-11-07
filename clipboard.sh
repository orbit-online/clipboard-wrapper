#!/usr/bin/env bash

clipboard_copy() {
  if type pbcopy &>/dev/null; then
    pbcopy
  elif [[ $XDG_SESSION_TYPE = 'wayland' ]] && type wl-copy &>/dev/null; then
    if [[ -n $CLIPBOARD_MIME_TYPE ]]; then
      wl-copy --type "$CLIPBOARD_MIME_TYPE"
    else
      wl-copy
    fi
  elif [[ $XDG_SESSION_TYPE = 'x11' ]] && type xsel &>/dev/null; then
    xsel -bi
  elif type clip.exe &>/dev/null; then
    clip.exe
  else
    return 1
  fi
  return 0
}

clipboard_paste() {
  if type pbpaste &>/dev/null; then
    pbpaste
  elif [[ $XDG_SESSION_TYPE = 'wayland' ]] && type wl-paste &>/dev/null; then
    if [[ -n $CLIPBOARD_MIME_TYPE ]]; then
      wl-paste --type "$CLIPBOARD_MIME_TYPE"
    else
      wl-paste
    fi
  elif [[ $XDG_SESSION_TYPE = 'x11' ]] && type xsel &>/dev/null; then
    xsel -bo
  elif type powershell.exe &>/dev/null; then
    powershell.exe -c Get-Clipboard | sed -z 's/\r\n/\n/g' | sed -z 's/\n$//g'
  else
    return 1
  fi
  return 0
}
