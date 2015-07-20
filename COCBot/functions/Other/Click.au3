; #FUNCTION# ====================================================================================================================
; Name ..........: Click, PureClick, ClickP
; Description ...: Clicks the BS screen on desired location
; Syntax ........: Click($x, $y, $times, $speed)
; Parameters ....: $x, $y are mandatory, $times and $speed are optional
; Return values .: None
; Author ........: (2014)
; Modified ......: HungLe (may-2015)
; Remarks .......: This file is part of ClashGameBot. Copyright 2015
;                  ClashGameBot is distributed under the terms of the GNU GPL
; Related .......: checkMainscreen, isProblemAffect
; Link ..........:
; Example .......: No
; ===============================================================================================================================

Func Click($x, $y, $times = 1, $speed = 0, $debugtxt = "")
	If $debugClick = 1 Then
		Local $txt = _DecodeDebug($debugtxt)
		SetLog("Click " & $x & "," & $y & "," & $times & "," & $speed & " " & $debugtxt & $txt, $COLOR_ORANGE, "Verdana", "7.5", 0)
	EndIf
	If $times <> 1 Then
		For $i = 0 To ($times - 1)
			If isProblemAffect(True) Then checkMainScreen(False)
			ControlClick($Title, "", "", "left", "1", $x, $y)
			If _Sleep($speed, False) Then ExitLoop
		Next
	Else
		If isProblemAffect(True) Then checkMainScreen(False)
		ControlClick($Title, "", "", "left", "1", $x, $y)
	EndIf
EndFunc   ;==>Click

; ClickP : takes an array[2] (or array[4]) as a parameter [x,y]
Func ClickP($point, $howMuch = 1, $speed = 0, $debugtxt = "")
	Click($point[0], $point[1], $howMuch, $speed, $debugtxt)
EndFunc   ;==>ClickP

Func PureClick($x, $y, $times = 1, $speed = 0, $debugtxt = "")
	If $debugClick = 1 Then
		Local $txt = _DecodeDebug($debugtxt)
		SetLog("PureClick " & $x & "," & $y & "," & $times & "," & $speed & " " & $debugtxt & $txt, $COLOR_ORANGE, "Verdana", "7.5", 0)
	EndIf
	If $times <> 1 Then
		For $i = 0 To ($times - 1)
			ControlClick($Title, "", "", "left", "1", $x, $y)
			If _Sleep($speed, False) Then ExitLoop
		Next
	Else
		ControlClick($Title, "", "", "left", "1", $x, $y)
	EndIf
EndFunc   ;==>PureClick

; PureClickP : takes an array[2] (or array[4]) as a parameter [x,y]
Func PureClickP($point, $howMuch = 1, $speed = 0, $debugtxt = "")
	PureClick($point[0], $point[1], $howMuch, $speed, $debugtxt)
EndFunc   ;==>PureClickP

Func GemClick($x, $y, $times = 1, $speed = 0, $debugtxt = "")
	If $debugClick = 1 Then
		Local $txt = _DecodeDebug($debugtxt)
		SetLog("GemClick " & $x & "," & $y & "," & $times & "," & $speed & " " & $debugtxt & $txt, $COLOR_ORANGE, "Verdana", "7.5", 0)
	EndIf
	If $times <> 1 Then
		For $i = 0 To ($times - 1)
			If isGemOpen(True) Then Return False
			If isProblemAffect(True) Then checkMainScreen(False)
			ControlClick($Title, "", "", "left", "1", $x, $y)
			If isGemOpen(True) Then Return False
			If _Sleep($speed, False) Then ExitLoop
		Next
	Else
		If isGemOpen(True) Then Return False
		If isProblemAffect(True) Then checkMainScreen(False)
		ControlClick($Title, "", "", "left", "1", $x, $y)
		If isGemOpen(True) Then Return False
	EndIf
EndFunc   ;==>GemClick

; GemClickP : takes an array[2] (or array[4]) as a parameter [x,y]
Func GemClickP($point, $howMuch = 1, $speed = 0, $debugtxt = "")
	Return GemClick($point[0], $point[1], $howMuch, $speed, $debugtxt = "")
EndFunc   ;==>GemClickP

Func _DecodeDebug($message)
	Local $separator = " | "
	Switch $message
		; AWAY CLICKS
		Case "#0112", "#0113", "#0115", "#0140", "#0141", "#0142", "#0143", "#0199", "#0328", "#0201", "#0204", "#0205", "#0206", "#0327", "#0207", "#0208", "#0209", "#0210", "#0211"
			Return $separator & "Away"
		Case "#0214", "#0215", "#0216", "#0217", "#0218", "#0219", "#0220", "#0221", "#0235", "#0242", "#0267", "#0268", "#0291", "#0292", "#0295", "#0298", "#0300", "#0301", "#0302"
			Return $separator & "Away"
		Case "#0303", "#0306", "#0308", "#0309", "#0310", "#0311", "#0312", "#0319", "#0333", "#0252", "#0257", "#0139", "#0125", "#0251"
			Return $separator & "Away"
		Case "#0121", "#0124", "#0133", "#0157", "#0161", "#0165", "#0166", "#0167", "#0170", "#0171", "#0176", "#0224", "#0234", "#0265", "#0313", "#0314", "#0319", "#0332", "#0329"
			Return $separator & "Away"
			; ATTACK TH
		Case "#0001"
			Return $separator & "AtkTH - Select Barbarian"
		Case "#0002", "#0006"
			Return $separator & "AtkTH - Barbarian Bottom Left"
		Case "#0003", "#0007"
			Return $separator & "AtkTH - Barbarian Bottom Right"
		Case "#0004", "#0008"
			Return $separator & "AtkTH - Barbarian Top Right"
		Case "#0005", "#0009"
			Return $separator & "AtkTH - Barbarian Top Left"
		Case "#0010"
			Return $separator & "AtkTH - Select Archer"
		Case "#0011", "#0015"
			Return $separator & "AtkTH - Arcer Bottom Left"
		Case "#0012", "#0016"
			Return $separator & "AtkTH - Arcer Bottom Right"
		Case "#0013", "#0017"
			Return $separator & "AtkTH - Arcer Top Right"
		Case "#0014", "#0018"
			Return $separator & "AtkTH - Arcer Top Left"
		Case "#0155"
			Return $separator & "Attack - Next Button"
		Case "#0221"
			Return $separator & "Open Profile Page"
			;COLLECT
		Case "#0331"
			Return $separator & "Collect resources"
		Case "#0330"
			Return $separator & "Collect resources*"
			;TRAIN
		Case "#0266"
			Return $separator & "Train - TrainIT Selected Troop"
		Case "#0269"
			Return $separator & "Train - Open Barrack"
		Case "#0270"
			Return $separator & "Train - Train Troops button"
		Case "#0271"
			Return $separator & "Train - Next Button "
		Case "#0272", "#0286", "#0289", "#0325"
			Return $separator & "Train - Prev Button "
		Case "#0273", "#0284", "#0285", "#0287", "#0288"
			Return $separator & "Train - Remove Troops"
		Case "#0274"
			Return $separator & "Train - Train Barbarian"
		Case "#0275"
			Return $separator & "Train - Train Archer"
		Case "#0276"
			Return $separator & "Train - Train Giant"
		Case "#0277"
			Return $separator & "Train - Train Goblin"
		Case "#0278"
			Return $separator & "Train - Train Wall Breaker"
		Case "#0279"
			Return $separator & "Train - Train Balloon"
		Case "#0280"
			Return $separator & "Train - Train Wizard"
		Case "#0281"
			Return $separator & "Train - Train Healer"
		Case "#0282"
			Return $separator & "Train - Train Dragon"
		Case "#0283"
			Return $separator & "Train - Train P.E.K.K.A."
		Case "#0290"
			Return $separator & "Train - GemClick Spell"
		Case "#0293"
			Return $separator & "Train - Click Army Camp"
		Case "#0294"
			Return $separator & "Train - Open Info Army Camp"
			;DONATE
		Case "#0168"
			Return $separator & "Donate - Open Chat"
		Case "#0169"
			Return $separator & "Donate - Select Clan Tab"
		Case "#0172"
			Return $separator & "Donate - Scroll"
		Case "#0173"
			Return $separator & "Donate - Click Chat"
		Case "#0174"
			Return $separator & "Donate - Donate Selected Troop"
		Case "#0175"
			Return $separator & "Donate - Donate Selected Troop"
			;TEST LANGUAGE
		Case "#0144"
			Return $separator & "ChkLang - Config Button"
		Case "#0145", "#0146", "#0147", "#0148"
			Return $separator & "ChkLang - Close Page"
			;PROFILE REPORT
		Case "#0222"
			Return $separator & "Profile - Profile Button"
		Case "#0223"
			Return $separator & "Profile - Close Page"
			;REARM
		Case "#0225"
			Return $separator & "Rearm - Click Town Hall"
		Case "#0326", "#0228"
			Return $separator & "Rearm - Click Rearm Button"
		Case "#0226", "#0229"
			Return $separator & "Rearm - Click Rearm"
		Case "#0227", "#0230", "#0233"
			Return $separator & "Rearm - Close Gem Spend Window"
		Case "#0231"
			Return $separator & "Rearm - Click Inferno Button"
		Case "#0232"
			Return $separator & "Rearm - Inferno Button"
			;REQUEST CC
		Case "#0250"
			Return $separator & "Request - Click Castle Clan"
		Case "#0253"
			Return $separator & "Request - Click Request Button"
		Case "#0254", "#0255"
			Return $separator & "Request - Click Select Text For Request"
		Case "#0256"
			Return $separator & "Request - Click Send Request"


		Case "#0000"
			Return $separator & " "

		Case Else
			Return ""
	EndSwitch
EndFunc   ;==>_DecodeDebug

