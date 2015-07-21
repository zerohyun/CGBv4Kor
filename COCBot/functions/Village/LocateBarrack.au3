; #FUNCTION# ====================================================================================================================
; Name ..........: LocateBarrack
; Description ...:
; Syntax ........: LocateBarrack([$ArmyCamp = False])
; Parameters ....: $ArmyCamp            - [optional] Flag to set if locating army camp and not barrack Default is False.
; Return values .: None
; Author ........: Code Monkey #19
; Modified ......: KnowJack (June 2015)
; Remarks .......: This file is part of ClashGameBot. Copyright 2015
;                  ClashGameBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........:
; Example .......: No
; ===============================================================================================================================
Func LocateBarrack($ArmyCamp = False)
	Local $choice = "'훈련소'"
	Local $stext, $MsgBox, $iCount, $iStupid = 0, $iSilly = 0, $sErrorText = "", $sLocMsg = "", $sInfo, $sArmyInfo
	Local $aGetArmySize[3] = ["", "", ""]
	Local $sArmyInfo = ""

	If $ArmyCamp Then $choice = "'집합소'"
	SetLog($choice & " 위치확인", $COLOR_BLUE)

	If _GetPixelColor($aTopLeftClient[0], $aTopLeftClient[1], True) <> Hex($aTopLeftClient[2], 6) And _GetPixelColor($aTopRightClient[0], $aTopRightClient[1], True) <> Hex($aTopRightClient[2], 6) Then
		Zoomout()
		Collect()
	EndIf

	While 1
		ClickP($aTopLeftClient)
		_ExtMsgBoxSet(1 + 64, $SS_CENTER, 0x004080, 0xFFFF00, 12, "verdana", 500)
		$stext =  $sErrorText & @CRLF & "확인버튼을 누른 후 " & $choice & " 중 하나를 클릭하세요." & @CRLF & @CRLF & _
		"클릭한 후 마우스를 너무 빨리 움직이지 마세요."& @CRLF & @CRLF & "맞는 건물인지 확인합니다." & @CRLF
		$MsgBox = _ExtMsgBox(0, "확인|취소",$choice & " 위치확인", $stext, 15, $frmBot)
		If $MsgBox = 1 Then
			WinActivate($HWnD)
			If $ArmyCamp Then
				$ArmyPos[0] = FindPos()[0]
				$ArmyPos[1] = FindPos()[1]
				If _Sleep(1000) Then Return
				If isInsideDiamond($ArmyPos) = False Then
					$iStupid += 1
					Select
						Case $iStupid = 1
							$sErrorText = $choice & " Location Not Valid!"&@CRLF
							SetLog("Location not valid, try again", $COLOR_RED)
							ContinueLoop
						Case $iStupid = 2
							$sErrorText = "Please try to click inside the grass field!" & @CRLF
							ContinueLoop
						Case $iStupid = 3
							$sErrorText = "This is not funny, why did you click @ (" & $ArmyPos[0] & "," & $ArmyPos[1] & ")?" & @CRLF & "  Please stop!" & @CRLF
							ContinueLoop
						Case $iStupid = 4
							$sErrorText = "Last Chance, DO NOT MAKE ME ANGRY, or" & @CRLF & "I will give ALL of your gold to Barbarian King," & @CRLF & "And ALL of your Gems to the Archer Queen!"& @CRLF
							ContinueLoop
						Case $iStupid > 4
							SetLog(" Operator Error - Bad " & $choice & " Location: " & "(" & $ArmyPos[0] & "," & $ArmyPos[1] & ")", $COLOR_RED)
							ClickP($aTopLeftClient)
							Return False
						Case Else
							SetLog(" Operator Error - Bad " & $choice & " Location: " & "(" & $ArmyPos[0] & "," & $ArmyPos[1] & ")", $COLOR_RED)
							$ArmyPos[0] = -1
							$ArmyPos[1] = -1
							ClickP($aTopLeftClient)
							Return False
					EndSelect
				EndIf
				$sArmyInfo = BuildingInfo(250, 520)
				If $sArmyInfo[0] > 1 Or $sArmyInfo[0] = "" Then
					If  StringInStr($sArmyInfo[1], "Army") = 0 Then
						If $sArmyInfo[0] = "" Then
							$sLocMsg = "Nothing"
						Else
							$sLocMsg = $sArmyInfo[1]
						EndIf
						$iSilly += 1
						Select
							Case $iSilly = 1
								$sErrorText = "Wait, That is not a Army Camp?, It was a " & $sLocMsg & @CRLF
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
								$ArmyPos[0] = -1
								$ArmyPos[1] = -1
								ClickP($aTopLeftClient)
								Return False
						EndSelect
					EndIf
				Else
					SetLog(" Operator Error - Bad " & $choice & " Location: " & "(" & $ArmyPos[0] & "," & $ArmyPos[1] & ")", $COLOR_RED)
					$ArmyPos[0] = -1
					$ArmyPos[1] = -1
					ClickP($aTopLeftClient)
					Return False
				EndIf
				SetLog($choice & ": " & "(" & $ArmyPos[0] & "," & $ArmyPos[1] & ")", $COLOR_GREEN)
			Else
				$barrackPos[0] = FindPos()[0]
				$barrackPos[1] = FindPos()[1]
				If isInsideDiamond($barrackPos) = False Then
					$iStupid += 1
					Select
						Case $iStupid = 1
							$sErrorText = $choice & " Location Not Valid!"&@CRLF
							SetLog("Location not valid, try again", $COLOR_RED)
							ContinueLoop
						Case $iStupid = 2
							$sErrorText = "Please try to click inside the grass field!" & @CRLF
							ContinueLoop
						Case $iStupid = 3
							$sErrorText = "This is not funny, why did you click @ (" &$barrackPos[0] & "," & $barrackPos[1] & ")?  Please stop!" & @CRLF
							ContinueLoop
						Case $iStupid = 4
							$sErrorText = "Last Chance, DO NOT MAKE ME ANGRY, or" & @CRLF & "I will give ALL of your gold to Barbarian King," & @CRLF & "And ALL of your Gems to the Archer Queen!"& @CRLF
							ContinueLoop
						Case $iStupid > 4
							SetLog(" Operator Error - Bad  " & $choice & " Location: " & "(" & $barrackPos[0] & "," & $barrackPos[1] & ")", $COLOR_RED)
							ClickP($aTopLeftClient)
							Return False
						Case Else
							SetLog(" Operator Error - Bad " & $choice & " Location: " & "(" & $barrackPos[0] & "," & $barrackPos[1] & ")", $COLOR_RED)
							$barrackPos[0] = -1
							$barrackPos[1] = -1
							ClickP($aTopLeftClient)
							Return False
					EndSelect
				EndIf
				$sInfo = BuildingInfo(250, 520)
				If $sInfo[0] > 1 Or $sInfo[0] = "" Then
					If  StringInStr($sInfo[1], "Barr") = 0 Then
						If $sInfo[0] = "" Then
							$sLocMsg = "Nothing"
						Else
							$sLocMsg = $sInfo[1]
						EndIf
						$iSilly += 1
						Select
							Case $iSilly = 1
								$sErrorText = "Wait, That is not a Barracks?, It was a " & $sLocMsg & @CRLF
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
								SetLog("Quit joking, Click the Barracks, or restart bot and try again", $COLOR_RED)
								$barrackPos[0] = -1
								$barrackPos[1] = -1
								ClickP($aTopLeftClient)
								Return False
						EndSelect
					EndIf
				Else
					SetLog(" Operator Error - Bad " & $choice & " Location: " & "(" & $barrackPos[0] & "," & $barrackPos[1] & ")", $COLOR_RED)
					$barrackPos[0] = -1
					$barrackPos[1] = -1
					ClickP($aTopLeftClient)
					Return False
				EndIf
				SetLog($choice & " : (" & $barrackPos[0] & "," & $barrackPos[1] & ")", $COLOR_GREEN)
			EndIf
		Else
			SetLog($choice&" 위치확인 취소", $COLOR_BLUE)
			ClickP($aTopLeftClient)
			Return
		EndIf
		ExitLoop
	WEnd
	If $ArmyCamp Then
		$TotalCamp = 0 ; reset total camp number to get it updated
		_ExtMsgBoxSet(1 + 64, $SS_CENTER, 0x004080, 0xFFFF00, 12, "verdana", 500)
		$stext = "집합소의 숫자를 확인합니다. 마우스 커서를 블루스택 바깥쪽으로 이동시켜 주세요. 감사합니다!!"
		$MsgBox = _ExtMsgBox(48, "확인", "알림", $stext, 15, $frmBot)
		If _Sleep(1000) Then Return

		ClickP($aTopLeftClient) ;Click Away
		If _Sleep(100) Then Return

		Click($aArmyTrainButton[0], $aArmyTrainButton[1]) ;Click Army Camp
		If _Sleep(1000) Then Return

		$iCount = 0  ; reset loop counter
		$sArmyInfo = getArmyCampCap(212, 144) ; OCR read army trained and total
		If $debugSetlog = 1 Then Setlog("$sArmyInfo = " & $sArmyInfo, $COLOR_PURPLE)
		While $sArmyInfo = ""  ; In case the CC donations recieved msg are blocking, need to keep checking numbers for 10 seconds
			If _Sleep(2000) Then Return
			$sArmyInfo = getArmyCampCap(212, 144) ; OCR read army trained and total
			If $debugSetlog = 1 Then Setlog(" $sArmyInfo = " & $sArmyInfo, $COLOR_PURPLE)
			$iCount += 1
			If $iCount > 4 Then ExitLoop
		WEnd

		$aGetArmySize = StringSplit($sArmyInfo, "#") ; split the trained troop number from the total troop number
		If $debugSetlog = 1 Then Setlog("$aGetArmySize[0]= " & $aGetArmySize[0] & "$aGetArmySize[1]= " & $aGetArmySize[1] & "$aGetArmySize[2]= " & $aGetArmySize[2], $COLOR_PURPLE)
		If $aGetArmySize[0] > 1 Then ; check if the OCR was valid and returned both values
			$TotalCamp = Number($aGetArmySize[2])
			Setlog("$TotalCamp = " & $TotalCamp, $COLOR_GREEN)
		Else
			Setlog("Army size read error", $COLOR_RED) ; log if there is read error
		EndIf

		If $TotalCamp = 0 Then ; if Total camp size is still not set
			If $ichkTotalCampForced = 0 Then ; check if forced camp size set in expert tab
				$sInputbox = InputBox("Question", "Enter your total Army Camp capacity", "200", "", Default, Default, Default, Default, 0, $frmbot)
				$TotalCamp = Number($sInputbox)
				Setlog("Army Camp User input = " & $TotalCamp, $COLOR_RED) ; log if there is read error AND we ask the user to tell us.
			Else
				$TotalCamp = Number($iValueTotalCampForced)
			EndIf
		EndIf
	EndIf
	ClickP($aTopLeftClient, 1, 0, "#0206")

EndFunc   ;==>LocateBarrack
