# Terminals

To add it to the taskbar:

Rename to terminals.exe, add to taskbar, Shift-rightclick, properties, edit back to terminals.ps1 and restore the name.

## Notes

Here is my script for opening Windows Terminal with multiple tabs, each running an application. This is likely to be a net time saver for me after about 6 years.

I'm using the path to the Windows Terminal Preview, in order to get some of its features. If you don't care, `wt.exe` should be fine.

`-p` is the name of the profile to use. I can't remember if the ones I use were built-in or defined manually.

The semi-colon is used to separate tab definitions. It needs to be escaped with the backtick.

A backtick is also used to wrap long lines.

`powershell -noexit dotnet` is used so you can exit the command without losing the tab.

It is possible to split tabs, but I don't do that.

Docs are here: https://learn.microsoft.com/en-us/windows/terminal/command-line-arguments?tabs=linux
