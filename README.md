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

### `wl-clipboard` MIME types

In Linux wayland `wl-copy` infers a MIME type from the content using `xdg-mime`,
this can result in content not being pasteable (e.g. X.509 PEM certificates).
You can override that MIME type using the `$CLIPBOARD_MIME_TYPE` environment
variable when invoking `clipboard_copy`.  
This variable can also be used to select which MIME type you would like to use
when invoking `clipboard_paste`.
