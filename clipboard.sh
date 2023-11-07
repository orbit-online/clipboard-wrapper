#!/usr/bin/env bash

clipboard_copy() {
  if type pbcopy &>/dev/null; then
    pbcopy
  elif [[ $XDG_SESSION_TYPE = 'wayland' ]] && type wl-copy &>/dev/null; then
    wl-copy
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
    wl-paste
  elif [[ $XDG_SESSION_TYPE = 'x11' ]] && type xsel &>/dev/null; then
    xsel -bo
  elif type powershell.exe &>/dev/null; then
    powershell.exe -c Get-Clipboard | sed -z 's/\r\n/\n/g' | sed -z 's/\n$//g'
  else
    return 1
  fi
  return 0
}
