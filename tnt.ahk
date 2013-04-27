;
; AutoHotkey Version: 1.x
; Language:       English
; Platform:       Win9x/NT
; Author:         A.N.Other <myemail@nowhere.com>
;
; Script Function:
;	Template script (you can customize this template by editing "ShellNew\Template.ahk" in your Windows folder)
;

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

F2::Reload
F1::

Loop 20 {
	SendInput, 4
	Send, {Space Down}
	sleep 300
	Send, {Space Up}
	MouseClick, right
	sleep 300
	Send, {Space Down}
	sleep 300
	Send, {Space Up}
	MouseClick, right
	sleep 100
	SendInput, 5
	sleep 300
	Send, {Space Down}
	sleep 300
	Send, {Space Up}
	MouseClick, right
	sleep 300
}