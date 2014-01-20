#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;Windows must start with the match text
SetTitleMatchMode, 1
;Only do these if the active window's title starts with "Terraria"
#IfWinActive, Terraria
{
z::
  Click down
  Running = 1
  while (Running == 1) {
    MouseMove, 10, 0, 0, R
    Sleep 50
    MouseMove, -10, 0, 0, R
    Sleep 50
  }
  Click up
return
 
x::
  Running = 0
return
}
#IfWinActive