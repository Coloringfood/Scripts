#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;Windows must start with the match text
SetTitleMatchMode, 1
;Only do these if the active window's title starts with "Terraria"
#IfWinActive, Terraria
{
	Pause
	Option = 1
	StartedClick = 0

	while (true) {
		if (StartedClick == 0) {
			Click down
			startedClick = 1
		}

		if (Option == 1) {
			MouseMove, 10, 0, 0, R
			Sleep 50
			MouseMove, -10, 0, 0, R
			Sleep 50
		}

		else if (Option == 2) {
			MouseMove, 0, -15, 0, R
			Sleep 50
			MouseMove, 0, 30, 0, R
			Sleep 50
			MouseMove, 0, -15, 0, R
			Sleep 50
		}
	}

	NumpadDiv::
		Option = 1
		Pause, Off
	return

	NumpadMult::
		Option = 2
		Pause, Off
	return

	NumpadSub::
		if (StartedClick == 1) {
			Click up
			StartedClick = 0
		}

		Pause
	return
}
#IfWinActive
