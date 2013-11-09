#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#MaxHotkeysPerInterval 200

; -- Scroll Lock turns Dvorak on/off (Scroll Lock off = Dvorak on)
~ScrollLock::Suspend

;-- Suspend script when pressing windows or alt keys
~RWin::Suspend, On
~RWin UP::Suspend, Off
~LWin::Suspend, On
~LWin UP::Suspend, Off
~Ctrl::Suspend, On
~Ctrl UP::Suspend, Off
~Alt::Suspend, On
~Alt UP::Suspend, Off


; QWERTY to Dvorak mapping
-::[
=::]

q::'
w::,
e::.
r::p
t::y
y::f
u::g
i::c
o::r
p::l
[::/
]::=

;a::a
s::o
d::e
f::u
g::i
h::d
j::h
k::t
l::n
`;::s
'::-

z::`;
x::q
c::j
v::k
b::x
n::b
;m::m
,::w
.::v
/::z