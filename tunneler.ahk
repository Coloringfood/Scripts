#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


; For this script to function properly: have your pick in slot 1, your building blocks in slot 2, and your torches in slot 3.  Note that it currently works as long as they are in order and you start with your pick selected as well, I had minor issues issuing number keypresses, will work on that later.  
; To start leftdig, press CTRL+F, to STOP leftdig, press and hold r.
; To start rightdig, press CTRL+G, to STOP rightdig, press and hold t.
; WARNING, no current window error checking, this WILL continue working outside your Terraria window, press the stop key and exit the script (or pause it and its hotkeys) before doing anything else.
; these are positions around your character sprite: change them to fit your resolution until i can get a proper function for that

GetCharOver()   
{
  CharOver = 283
  return CharOver
}

GetCharTop()
{
  CharTop = 302
  return CharTop
}

GetCharMid()
{
  CharMid = 317
  return CharMid
}

GetCharBot()
{
  CharBot = 339
  return CharBot
}

GetCharUnder()
{
  CharUnder = 354
  return CharUnder
}

GetCharLeft()   
{
  CharLeft = 387
  return CharLeft
}

GetCharRight()  
{
  CharRight = 420
  return CharRight
}

GetCharTwoLeft()
{
  CharTwoLeft = 357
  return CharTwoLeft
}

GetCharTwoRight()
{
  CharTwoRight = 445
  return CharTwoRight
}

GetWalkDistance()  ; how far your character walks, tweak as necessary
{
  WalkDistance = 275
  return WalkDistance
}

GetDigTime()   ; total time to dig
{
  DigTime = 1000
  return DigTime
}


GetSwitchTime()  ; necessary due to inability to queue keypresses in program, increase if you have switching issues, will look for a better way to do this
{
  SwitchTime = 320
  return SwitchTime
}


^F::
CharOver := GetCharOver()
CharTop := GetCharTop()
CharMid := GetCharMid()
CharBot := GetCharBot()
CharUnder := GetCharUnder()
CharLeft := GetCharLeft()
CharRight := GetCharRight()
WalkDistance := GetWalkDistance()
DigTime := GetDigTime()
SwitchTime := GetSwitchtime()
Loop
{
   Loop 10
   {
  	GetKeyState, breakfunction, r
  	if breakfunction = D
     	break
  	else
  	{
     	MouseClick, left,  CharLeft,  CharTop
     	Click down
     	Sleep, DigTime
     	Click up
     	MouseClick, left,  CharLeft,  CharMid
     	Click down
     	Sleep, DigTime
     	Click up
     	MouseClick, left,  CharLeft,  CharBot
     	Click down
     	Sleep, DigTime
     	Click up
     	GetKeyState, breakfunction, r
     	if breakfunction = D
        	break
     	else
     	{
        	Sleep, SwitchTime
        	Send, {WheelDown}
        	Sleep, 100
        	MouseClick, left, CharLeft, CharUnder
        	Click down
        	Sleep, 100
        	Click up
        	Sleep, SwitchTime
        	MouseClick, left, CharLeft, CharOver
        	Click down
        	Sleep, 100
        	Click up
        	Sleep, SwitchTime
        	Send, {WheelUp}
        	Sleep, 100
        	Send, {a down}
        	Sleep WalkDistance
        	Send, {a up}
     	}
  	}
   }
   if breakfunction = D
  	break
   else
  	PlaceTorchUnderL()
}
return

^G::
CharOver := GetCharOver()
CharTop := GetCharTop()
CharMid := GetCharMid()
CharBot := GetCharBot()
CharUnder := GetCharUnder()
CharLeft := GetCharLeft()
CharRight := GetCharRight()
WalkDistance := GetWalkDistance()
DigTime := GetDigTime()
SwitchTime := GetSwitchTime()
Loop 10
{
   Loop 10
   {
  	GetKeyState, breakfunction, t
  	if breakfunction = D
     	break
  	else
  	{
     	MouseClick, left,  CharRight,  CharTop
     	Click down
     	Sleep, DigTime
     	Click up
     	MouseClick, left,  CharRight,  CharMid
     	Click down
     	Sleep, DigTime
     	Click up
     	MouseClick, left,  CharRight,  CharBot
     	Click down
     	Sleep, DigTime
     	click up
     	GetKeyState, breakfunction, t
     	if breakfunction = D
        	break
     	else
     	{
        	Sleep, SwitchTime
        	Send, {WheelDown}
        	Sleep, 100
        	MouseClick, left, 420, 354
        	Click down
        	Sleep, 100
        	Click up
        	Sleep, SwitchTime
        	MouseClick, left, 420, 283
        	Click down
        	Sleep, 100
        	Click up
        	Sleep, SwitchTime
        	Send, {WheelUp}
        	Sleep, 100
        	Send, {d down}
        	Sleep WalkDistance
        	Send, {d up}
     	}
  	}
   }
GetKeyState, breakfunction, t
   if breakfunction = D
  	break
   else
  	PlaceTorchUnderR()
}
return

PlaceTorchUnderR()
{
  CharOver := GetCharOver()
  CharBot:= GetCharBot()
  CharUnder := GetCharUnder()
  CharLeft := GetCharLeft()
  CharRight := GetCharRight()
  CharTwoRight := GetCharTwoRight()
  DigTime := GetDigTime()
  SwitchTime := GetSwitchTime()
  Sleep SwitchTime
  Send, {WheelDown} 	;move to block
  Sleep, SwitchTime
  MouseClick, left, CharRight, CharUnder 	;place block right/under
  Click down
  Sleep 100
  MouseMove, CharTwoRight, CharUnder, 20   	;continue out
  MouseMove, CharTwoRight, CharBot, 20	;place stopper for re-sync in case of speed slightly too high
  Sleep 100
  Click up
 
  Sleep SwitchTime
  Send, {WheelUp}         	;move to pick
  Sleep, SwitchTime
  MouseClick, left, CharLeft, CharUnder	;dig out left/under
  Click down
  Sleep, DigTime
  Click up
  Sleep, SwitchTime
  Send, {WheelDown}       	;move to block
  Sleep, SwitchTime
  Send, {WheelDown}       	;move to torch
  Sleep, SwitchTime
  MouseClick, left, CharLeft, CharUnder	;place torch left/under
  Click down
  Sleep, 100
  Click up
  Sleep, SwitchTime
  Send, {WheelUp}           	;move to block
  Sleep, SwitchTime
  Send, {WheelUp}           	;move to pick
  Sleep, SwitchTime
  return
}

PlaceTorchUnderL()
{
  CharOver := GetCharOver()
  CharBot := GetCharBot()
  CharUnder := GetCharUnder()
  CharLeft := GetCharLeft()
  CharRight := GetCharRight()
  CharTwoLeft := GetCharTwoLeft()
  DigTime := GetDigTime()
  SwitchTime := GetSwitchTime()
  Sleep SwitchTime
  Send, {WheelDown} 	;move to block
  Sleep, SwitchTime
  MouseClick, left, CharLeft, CharUnder 	;place block left/under
  Click down
  Sleep 100
  MouseMove, CharTwoLeft, CharUnder, 20   	;continue out
  MouseMove, CharTwoLeft, CharBot, 20	;place stopper for re-sync in case of speed too high
  Sleep 100
  Click up
  Sleep SwitchTime
  Send, {WheelUp}         	;move to pick
  Sleep, SwitchTime
  MouseClick, left, CharRight, CharUnder	;dig out right/under
  Click down
  Sleep, DigTime
  Click up
  Sleep, SwitchTime
  Send, {WheelDown}       	;move to block
  Sleep, SwitchTime
  Send, {WheelDown}       	;move to torch
  Sleep, SwitchTime
  MouseClick, left, CharRight, CharUnder	;place torch right/under
  Click down
  Sleep, 100
  Click up
  Sleep, SwitchTime
  Send, {WheelUp}           	;move to block
  Sleep, SwitchTime
  Send, {WheelUp}           	;move to pick
  Sleep, SwitchTime
  return
}