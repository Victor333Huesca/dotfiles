# System wide configuration for Windows

## Terminal

### Configuration

The new [Windows Terminal](https://github.com/microsoft/terminal) is highly customizable and allow both cosmetic
changes as well as more functionnal features. All modifications are done via a __json__ file stored under the
__Windows Terminal__ AppData directory (i.e. `C:\Users\<User>\AppData\Local\Packages\Microsoft.WindowsTerminalPreview_8wekyb3d8bbwe\LocalState\settings.json`).

A custom config is provided as part of the dotfiles repo. In order to use it, one need to copy the `.terminal`
directory in the __windows user home__ (`%USERPROFILE%`) in addition to copy the settins in its __AppData__ location.
