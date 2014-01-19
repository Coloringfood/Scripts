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
  ;Mouse down
  MouseClick, Left, , , , , D
  Running = 1
  while (Running == 1) {
    ;Move right 8px then left 8px
    MouseMove, 8, 0, 0, R
    Sleep 50
    MouseMove, -8, 0, 0, R
    Sleep 50
  }
  ;mouse up
  MouseClick, Left, , , , , U
return
 
c::
  Running = 1
  while (Running == 1) {
    MouseClick, Left, , , , 0
    Sleep 40
  }
return
 
:*b0:va::
  Running = 1
  while (Running != 0){
    Send {a down}
    Sleep 100
    Send {a up}
    Sleep 50
    MouseClick, Left
    Sleep 50
  }
return
 
:*b0:vd::
  Running = 1
  while (Running != 0){
    Send {d down}
    Sleep 100
    Send {d up}
    Sleep 50
    MouseClick, Left
    Sleep 50
  }
return
 
x::
  Running = 0
return
}
#IfWinActive