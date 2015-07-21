
; #FUNCTION# ====================================================================================================================
; Name ..........: LocateSpellFactory
; Description ...: Locates Spell Factory manually
; Syntax ........: LocateSpellFactory()
; Parameters ....:
; Return values .: None
; Author ........: saviart
; Modified ......: KnowJack (June 2015)
; Remarks .......: This file is part of ClashGameBot. Copyright 2015
;                  ClashGameBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........:
; Example .......: No
; ===============================================================================================================================
Func LocateSpellFactory()
	Local $stext, $MsgBox, $iStupid = 0, $iSilly = 0,  $sErrorText = ""

	SetLog("'마법연구소' 위치확인", $COLOR_BLUE)

	If _GetPixelColor($aTopLeftClient[0], $aTopLeftClient[1], True) <> Hex($aTopLeftClient[2], 6) And _GetPixelColor($aTopRightClient[0], $aTopRightClient[1], True) <> Hex($aTopRightClient[2], 6) Then
		Zoomout()
		Collect()
	EndIf

	While 1
		ClickP($aTopLeftClient)
		_ExtMsgBoxSet(1 + 64, $SS_CENTER, 0x004080, 0xFFFF00, 12, "verdana", 500)
		$stext = $sErrorText & @CRLF & "확인버튼을 누른 후 '마법제작소'를 클릭하세요." & @CRLF & @CRLF & _
		"클릭한 후 마우스를 너무 빨리 움직이지 마세요."& @CRLF & @CRLF & "맞는 건물인지 확인합니다." & @CRLF
		$MsgBox = _ExtMsgBox(0, "확인|취소", "'마법제작소' 위치확인", $stext, 15, $frmBot)
		If $MsgBox = 1 Then
			WinActivate($HWnD)
			$SFPos[0] = FindPos()[0]
			$SFPos[1] = FindPos()[1]
			If isInsideDiamond($SFPos) = False Then
				$iStupid += 1
				Select
					Case $iStupid = 1
						$sErrorText = "Spell Factory Location Not Valid!"&@CRLF
						SetLog("Location not valid, try again", $COLOR_RED)
						ContinueLoop
					Case $iStupid = 2
						$sErrorText = "Please try to click inside the grass field!" & @CRLF
						ContinueLoop
					Case $iStupid = 3
						$sErrorText = "This is not funny, why did you click @ (" & $SFPos[0] & "," & $SFPos[1] & ")?" & @CRLF & "  Please stop!" & @CRLF & @CRLF
						ContinueLoop
					Case $iStupid = 4
						$sErrorText = "Last Chance, DO NOT MAKE ME ANGRY, or" & @CRLF & "I will give ALL of your gold to Barbarian King," & @CRLF & "And ALL of your Gems to the Archer Queen!"& @CRLF
						ContinueLoop
					Case $iStupid > 4
						SetLog(" Operator Error - Bad Spell Factory Location: " & "(" & $SFPos[0] & "," &$SFPos[1] & ")", $COLOR_RED)
						ClickP($aTopLeftClient)
						Return False
					Case Else
						SetLog(" Operator Error - Bad Spell Factory Location: " & "(" & $SFPos[0] & "," &$SFPos[1] & ")", $COLOR_RED)
						$SFPos[0] = -1
						$SFPos[1] = -1
						ClickP($aTopLeftClient)
						Return False
				EndSelect
			EndIf
			$sSpellInfo = BuildingInfo(250, 520)
			If $sSpellInfo[0] > 1 Or $sSpellInfo[0] = "" Then
				If  StringInStr($sSpellInfo[1], "Spell") = 0 Then
					If $sSpellInfo[0] = "" Then
						$sLocMsg = "Nothing"
					Else
						$sLocMsg = $sSpellInfo[1]
					EndIf
					$iSilly += 1
					Select
						Case $iSilly = 1
							$sErrorText = "Wait, That is not the Spell Factory, It was a " & $sLocMsg & @CRLF
							ContinueLoop
						Case $iSilly = 2
							$sErrorText = "Quit joking, That was " & $sLocMsg & @CRLF
							ContinueLoop
						Case $iSilly = 3
							$sErrorText = "This is not funny, why did you click " & $sLocMsg & "? Please stop!" & @CRLF
							ContinueLoop
						Case $iSilly = 4
							$sErrorText = $sLocMsg&" ?!?!?!"&@CRLF&@CRLF&"Last Chance, DO NOT MAKE ME ANGRY, or" & @CRLF & "I will give ALL of your gold to Barbarian King," & @CRLF & "And ALL of your Gems to the Archer Queen!"& @CRLF
							ContinueLoop
						Case $iSilly > 4
							SetLog("Quit joking, Click the Army Camp, or restart bot and try again", $COLOR_RED)
							$SFPos[0] = -1
							$SFPos[1] = -1
							ClickP($aTopLeftClient)
							Return False
					EndSelect
				EndIf
			Else
				SetLog(" Operator Error - Bad Spell Factory Location: " & "(" & $SFPos[0] & "," & $SFPos[1] & ")", $COLOR_RED)
				$SFPos[0] = -1
				$SFPos[1] = -1
				ClickP($aTopLeftClient)
				Return False
			EndIf
			SetLog("마법제작소 : (" & $SFPos[0] & "," & $SFPos[1] & ")", $COLOR_GREEN)
		Else
			SetLog("'마법제작소' 위치확인 취소", $COLOR_BLUE)
			ClickP($aTopLeftClient)
			Return
		EndIf
		ExitLoop
	WEnd

	ClickP($aTopLeftClient, 2, 200, "#0208")

EndFunc   ;==>LocateSpellFactory
