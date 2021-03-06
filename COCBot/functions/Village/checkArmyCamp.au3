; #FUNCTION# ====================================================================================================================
; Name ..........: checkArmyCamp
; Description ...: Reads the size it the army camp, the number of troops trained, and
; Syntax ........: checkArmyCamp()
; Parameters ....:
; Return values .: None
; Author ........: Code Monkey #4,342
; Modified ......:
; Remarks .......: This file is part of ClashGameBot. Copyright 2015
;                  ClashGameBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........:
; Example .......: No
; ===============================================================================================================================

Func checkArmyCamp()
	Local $aGetArmySize[3] = ["", "", ""]
	Local $sArmyInfo = ""
	Local $sInputbox

	SetLog("'집합소'를 확인합니다.", $COLOR_BLUE)
	If _Sleep(100) Then Return

	ClickP($aTopLeftClient, 1, 0, "#0292") ;Click Away
	If _Sleep(100) Then Return

	Click($aArmyTrainButton[0], $aArmyTrainButton[1], 1, 0, "#0293") ;Click Army Camp
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
	If $aGetArmySize[0] > 1 Then ; check if the OCR was valid and returned both values
		$CurCamp = Number($aGetArmySize[1])
		If $debugSetlog = 1 Then Setlog("$CurCamp = " & $CurCamp, $COLOR_PURPLE)
		If $TotalCamp = 0 Then ; check if army camp size is already known
			$TotalCamp = Number($aGetArmySize[2])
		EndIf
		If $debugSetlog = 1 Then Setlog("$TotalCamp = " & $TotalCamp, $COLOR_PURPLE)
	Else
		Setlog("숫자확인오류 : 유닛을 바른 수량대로 훈련할 수 없습니다. ", $COLOR_RED) ; log if there is read error
		$CurCamp = 0
	EndIf

	If $TotalCamp = 0 Then ; if Total camp size is still not set
		If $ichkTotalCampForced = 0 Then ; check if forced camp size set in expert tab
			$sInputbox = InputBox("질문", "'집합소' 총 수용인원을 입력하세요.", "200", "", Default, Default, Default, Default, 0, $frmbot)
			$TotalCamp = Number($sInputbox)
			Setlog("'집합소' 수용인원 사용자 설정 = " & $TotalCamp, $COLOR_RED) ; log if there is read error AND we ask the user to tell us.
		Else
			$TotalCamp = Number($iValueTotalCampForced)
		EndIf
	EndIf
	If _Sleep(500) Then Return

	SetLog("'집합소' 총 수용인원 : " & $CurCamp & "/" & $TotalCamp)

	If ($CurCamp >= ($TotalCamp * $fulltroop / 100)) Then
		$fullArmy = True
	EndIf

	If ($CurCamp + 1) = $TotalCamp Then
		$fullArmy = True
	EndIf
		_WinAPI_DeleteObject($hBitmapFirst)
		Local $hBitmapFirst = _CaptureRegion2(140, 165, 705, 220)
		If $debugSetlog = 1 Then SetLog("$hBitmapFirst made")
		If _Sleep(250) Then Return
		If $debugSetlog = 1 Then SetLog("Calling CGBfunctions.dll/searchIdentifyTroopTrained ")

		Local $FullTemp = DllCall($LibDir & "\CGBfunctions.dll", "str", "searchIdentifyTroopTrained", "ptr", $hBitmapFirst)
		If $debugSetlog = 1 Then SetLog("Dll return $FullTemp :" & $FullTemp[0])
		Local $TroopTypeT = StringSplit($FullTemp[0], "#")
		If $debugSetlog = 1 Then SetLog("$Trooptype split # : " & $TroopTypeT[0])
		Local $TroopName = 0
		Local $TroopQ = 0
		If $debugSetlog = 1 Then SetLog("Start the Loop")

		For $i = 1 To $TroopTypeT[0]
			$TroopName = "Unknown"
			$TroopQ = "0"
			If _sleep(100) Then Return
			Local $Troops = StringSplit($TroopTypeT[$i], "|")
			If $debugSetlog = 1 Then SetLog("$TroopTypeT[$i] split : " & $i)

			If $Troops[1] = "Barbarian" Then
				$TroopQ = $Troops[3]
				$TroopName = "바바리안"
				If ($CurBarb = 0 And $FirstStart) Then $CurBarb -= $TroopQ

			ElseIf $Troops[1] = "Archer" Then
				$TroopQ = $Troops[3]
				$TroopName = "아처"
				If ($CurArch = 0 And $FirstStart) Then $CurArch -= $TroopQ

			ElseIf $Troops[1] = "Giant" Then
				$TroopQ = $Troops[3]
				$TroopName = "자이언트"
				If ($CurGiant = 0 And $FirstStart) Then $CurGiant -= $TroopQ

			ElseIf $Troops[1] = "Goblin" Then
				$TroopQ = $Troops[3]
				$TroopName = "고블린"
				If ($CurGobl = 0 And $FirstStart) Then $CurGobl -= $TroopQ

			ElseIf $Troops[1] = "WallBreaker" Then
				$TroopQ = $Troops[3]
				$TroopName = "해골돌격병"
				If ($CurWall = 0 And $FirstStart) Then $CurWall -= $TroopQ

			ElseIf $Troops[1] = "Balloon" Then
				$TroopQ = $Troops[3]
				$TroopName = "해골비행선"
				If ($CurBall = 0 And $FirstStart) Then $CurBall -= $TroopQ

			ElseIf $Troops[1] = "Healer" Then
				$TroopQ = $Troops[3]
				$TroopName = "치유사"
				If ($CurHeal = 0 And $FirstStart) Then $CurHeal -= $TroopQ

			ElseIf $Troops[1] = "Wizard" Then
				$TroopQ = $Troops[3]
				$TroopName = "마법사"
				If ($CurWiza = 0 And $FirstStart) Then $CurWiza -= $TroopQ

			ElseIf $Troops[1] = "Dragon" Then
				$TroopQ = $Troops[3]
				$TroopName = "드래곤"
				If ($CurDrag = 0 And $FirstStart) Then $CurDrag -= $TroopQ

			ElseIf $Troops[1] = "Pekka" Then
				$TroopQ = $Troops[3]
				$TroopName = "페카"
				If ($CurPekk = 0 And $FirstStart) Then $CurPekk -= $TroopQ

			ElseIf $Troops[1] = "Minion" Then
				$TroopQ = $Troops[3]
				$TroopName = "미니언"
				If ($CurMini = 0 And $FirstStart) Then $CurMini -= $TroopQ

			ElseIf $Troops[1] = "HogRider" Then
				$TroopQ = $Troops[3]
				$TroopName = "호그라이더"
				If ($CurHogs = 0 And $FirstStart) Then $CurHogs -= $TroopQ

			ElseIf $Troops[1] = "Valkyrie" Then
				$TroopQ = $Troops[3]
				$TroopName = "발키리"
				If ($CurValk = 0 And $FirstStart) Then $CurValk -= $TroopQ

			ElseIf $Troops[1] = "Golem" Then
				$TroopQ = $Troops[3]
				$TroopName = "골렘"
				If ($CurGole = 0 And $FirstStart) Then $CurGole -= $TroopQ

			ElseIf $Troops[1] = "Witch" Then
				$TroopQ = $Troops[3]
				$TroopName = "마녀"
				If ($CurWitc = 0 And $FirstStart) Then $CurWitc -= $TroopQ

			ElseIf $Troops[1] = "LavaHound" Then
				$TroopQ = $Troops[3]
				$TroopName = "라바하운드"
				If ($CurLava = 0 And $FirstStart) Then $CurLava -= $TroopQ

			EndIf

			If $TroopQ <> 0 Then SetLog("  - " & $TroopName & " : " & $TroopQ & " 마리 ")
		Next
	If Not $fullArmy And $FirstStart Then
		$ArmyComp = $CurCamp
	EndIf

	;call BarracksStatus() to read barracks num
	If $FirstStart then
		BarracksStatus(true)
	Else
		BarracksStatus(false)
	EndIf



	ClickP($aTopLeftClient, 1, 0, "#0295") ;Click Away
	$FirstCampView = True

EndFunc   ;==>checkArmyCamp