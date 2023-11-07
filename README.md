# Clipboard wrapper

There's `pbcopy/paste` in MacOS, `xsel` and `wl-copy/paste` in Linux, and
`clip.exe`/`powershell.exe -c Get-Clipboard` in WSL. This tool selects whichever
command is appropriate.

You don't get to specify which "clipboard" you're copying to or pasting from,
it's going to whichever is used when you press `Ctrl+C`/`Ctrl+V` in programs
with a GUI.

## Installation

With [μpkg](https://github.com/orbit-online/upkg)

```
upkg install -g orbit-online/clipboard-wrapper@<VERSION>
```

## Usage

There are two commands: `clipboard_copy` and `clipboard_paste`.  
They operate on stdin and stdout respectively. You can also source
`clipboard.sh` to use them as functions instead.
