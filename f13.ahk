#NoEnv
#Singleinstance, Force
CoordMode, Mouse, Screen
SetKeyDelay, 50, 50

OKLocated := 0

F1::
	MouseGetPos, x1, y1
	Loop 12 {
		MouseMove, x1, y1
		Click
		num := A_Index + 12
		Sleep 250
		Send % "{F" num "}"
		if (OKLocated){
			MouseClick, Left, x2, y2
		} else {
			; Wait for user to click OK
			KeyWait, LButton, D
			KeyWait, LButton
			; Record coords
			MouseGetPos, x2, y2
			OKLocated := 1
		}
	}
	return