#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


; -- Scroll Lock turns QWERTY commands on/off (Scroll Lock off = QWERTY commands on)
~ScrollLock::Suspend

;----------------- CTRL + KEY
*^[::^-
*^]::^=

*^'::^q
*^,::^w
*^.::^e
*^p::^r
*^y::^t
*^f::^y
*^g::^u
*^c::^i
*^r::^o
*^l::^p
*^/::^[
*^=::^]

*^o::^s
*^e::^d
*^u::^f
*^i::^g
*^d::^h
*^h::^j
*^t::^k
*^n::^l
*^s::^`;
*^-::^'

*^`;::^z
*^q::^x
*^j::^c
*^k::^v
*^x::^b
*^b::^n
*^m::^m
*^w::^,
*^v::^.
*^z::^/

;----------------- ALT + KEY

*![::!-
*!]::!=

*!'::!q
*!,::!w
*!.::!e
*!p::!r
*!y::!t
*!f::!y
*!g::!u
*!c::!i
*!r::!o
*!l::!p
*!/::![
*!=::!]

*!o::!s
*!e::!d
*!u::!f
*!i::!g
*!d::!h
*!h::!j
*!t::!k
*!n::!l
*!s::!`;
*!-::!'

*!`;::!z
*!q::!x
*!j::!c
*!k::!v
*!x::!b
*!b::!n
*!m::!m
*!w::!,
*!v::!.
*!z::!/


;----------------- WINDOWS + KEY

*#[::#-
*#]::#=

*#'::#q
*#,::#w
*#.::#e
*#p::#r
*#y::#t
*#f::#y
*#g::#u
*#c::#i
*#r::#o
*#l::#p
*#/::#[
*#=::#]

*#o::#s
*#e::#d
*#u::#f
*#i::#g
*#d::#h
*#h::#j
*#t::#k
*#n::#l
*#s::#`;
*#-::#'

*#`;::#z
*#q::#x
*#j::#c
*#k::#v
*#x::#b
*#b::#n
*#m::#m
*#w::#,
*#v::#.
*#z::#/