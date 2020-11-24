; ^ = Ctrl
; + = Shift
; ! = Alt
; # = Win

#SingleInstance, force

SetTitleMatchMode, 2

; Windows-----------------------------------------------------------------------
Home::Reload
End::ExitApp

;; allows snap with mouse
;^F24::Send #{Right}
;^F23::Send #{Left}

!w::!F4 ; closes active window
!x::WinMinimize, A ; minimises active window

#Escape::DllCall("PowrProf\SetSuspendState", "int", 0, "int", 0, "int", 0)

; Ableton Live------------------------------------------------------------------
#IfWinActive, ahk_class Ableton Live Window Class
; creates a new midi clip with looping off (uses \ keybind)
F1:: 
{
	Send ^+m
	Send \
	return
}

F2::Del

F3::0 ; disable selected
F4::^l ; loop selected
!a::^!l ; hides and shows the info view

; enters fullscreen
^+f::
{
	Send {F11}
	return
}

; searches for s and inserts it
load_from_find(s) {
	Send ^f
	Send %s%
	Sleep, 250
	Send {Down}
	Send {Enter}
	Sleep, 250
	Send ^f
	Send {Esc}
	return
}

NumpadEnd::load_from_find("eq eight") ; 1 on numpad
NumpadDown::load_from_find("utility") ; 2 on numpad etc
NumpadPgDn::load_from_find("pitch")
NumpadLeft::load_from_find("tuner")

; Google Chrome-----------------------------------------------------------------
#IfWinActive, ahk_exe chrome.exe
;close tabs to the right
F1::
{
	Send !+r
	return
}

;goes to homepage
F2::!Home

; Brave-----------------------------------------------------------------
#IfWinActive, ahk_exe brave.exe
;close tabs to the right
F1::
{
	Send !+r
	return
}

;goes to homepage
F2::!Home

; Visual Studio Code------------------------------------------------------------
#IfWinActive, ahk_exe Code.exe
;enable solarized dark
F1::
{
	Send, ^k
	Send, ^t
	Send, light
	Send, {Enter}
	return
}

;enable solarized light
F2::
{
	Send, ^k
	Send, ^t
	Send, solarized dark
	Send, {Enter}
	return
}

;fold all (level 1)
F3::
{
	Send, ^k
	Send, ^1
	return
}

;unfold all
F4::
{
	Send, ^k
	Send, ^j
	return
}

;multi line comment
^+/::
{
	send, /
	send, *
	send, *
	send, /
	send, {left}
	send, {left}
	send, {Space}
	send, {Space}
	send, {left}
	return
}

;renames files
^r::F2

^p::send, _data1.csv _output.txt < _inputs1.txt

; Visual Studio-----------------------------------------------------------------
#IfWinActive, ahk_exe devenv.exe
;creates a 120 char long string for making guideline
F12::
{
	Send //---------------------------------------------------------------------------------------------------------------------
	return
}

; Codelite----------------------------------------------------------------------
#IfWinActive, ahk_exe codelite.exe
F1::
{
	Send //---------------------------------------------------------------------------------------------------------------------
	return 
}

; Foxit Reader------------------------------------------------------------------
#IfWinActive, ahk_exe FOXITREADER.EXE
^f::
{
	Send {AltDown}
	Send {AltUp}
	Send c
	return
}

;change background
F1::
{
	Send ^k
	Send {Tab}
	Send {Space}
	Send {Enter}
	return
}

; Excel-------------------------------------------------------------------------
#IfWinActive, ahk_exe EXCEL.EXE
;expands all columns (must select top left element first)
F1::
{
	Send ^+8
	Send !h
	Send o
	Send i
	return
}

; Joplin------------------------------------------------------------------------
#IfWinActive, ahk_exe Joplin.exe

F1::
{
	send {F10}
	return
}

; Minecraft---------------------------------------------------------------------
#IfWinActive, ahk_exe javaw.exe
`::
{
	KeyDown := !KeyDown
	if (KeyDown) {
		SendInput {w down}
		SendInput {click down}
	} else {
		SendInput {w up}
		SendInput {click up}
	}
	return
}

+`::
{
	KeyDown := !KeyDown
	if (KeyDown) {    
		SendInput {click down}
	} else {
		SendInput {click up}
	}
	return
}

!+w::
{
	KeyDown := !KeyDown
	if (KeyDown) {  
		Send {Shift}  
		SendInput {w down}
	} else {
		SendInput {w up}
	}
	return
}

; reaper------------------------------------------------------------------------
#IfWinActive, ahk_exe reaper.exe
!a::
{
	Send ^m
	return
}

!x::
{
	Send ^!x
	return
}
