
; #FUNCTION# ====================================================================================================================
; Name ..........: VillageSearch
; Description ...: Searches for a village that until meets conditions
; Syntax ........: VillageSearch()
; Parameters ....:
; Return values .: None
; Author ........: Code Monkey #6
; Modified ......: KGNS (June 2015)
; Remarks .......:This file is part of ClashGameBot. Copyright 2015
;                  ClashGameBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........:
; Example .......: No
; ===============================================================================================================================
Func VillageSearch() ;Control for searching a village that meets conditions
	$iSkipped = 0

	If $Is_ClientSyncError = False Then
		For $i = 0 to $iModeCount - 1
			$iAimGold[$i] = $iMinGold[$i]
			$iAimElixir[$i] = $iMinElixir[$i]
			$iAimGoldPlusElixir[$i] = $iMinGoldPlusElixir[$i]
			$iAimDark[$i] = $iMinDark[$i]
			$iAimTrophy[$i] = $iMinTrophy[$i]
		Next
	EndIf

$Is_ClientSyncError = True
	_WinAPI_EmptyWorkingSet(WinGetProcess($Title))

	If _Sleep(1000) Then Return
	$Is_ClientSyncError = True

;	; Check Break Shield button again
;	If _CheckPixel($aBreakShield, $bCapturePixel) Then
;		ClickP($aBreakShield, 1, 0, "#0154");Click Okay To Break Shield
;	EndIf

	For $x = 0 To $iModeCount - 1
		If $x = $iCmbSearchMode Or $iCmbSearchMode = 2 Then

			SetLog(_PadStringCenter("검색설정 : " & $sModeText[$x] & " ", 54, "="), $COLOR_BLUE)

			Local $MeetGxEtext = "", $MeetGorEtext = "", $MeetGplusEtext = "", $MeetDEtext = "", $MeetTrophytext = "", $MeetTHtext = "", $MeetTHOtext = "", $MeetWeakBasetext = "", $EnabledAftertext = ""

			SetLog(_PadStringCenter(" 검색조건 ", 50, "~"), $COLOR_BLUE)

			If $iCmbMeetGE[$x] = 0 Then $MeetGxEtext = "'골드' 와 '엘릭서'"
			If $iCmbMeetGE[$x] = 1 Then $MeetGorEtext = "'골드' 또는 '엘릭서'"
			If $iCmbMeetGE[$x] = 2 Then $MeetGplusEtext = "'골드'+'엘릭서'"
			If $iChkMeetDE[$x] = 1 Then $MeetDEtext = ", 다크엘릭서"
			If $iChkMeetTrophy[$x] = 1 Then $MeetTrophytext = ", 트로피"
			If $iChkMeetTH[$x] = 1 Then $MeetTHtext = "마을회관레벨 : " & $iMaxTH[$x] & " ," ;$icmbTH
			If $iChkMeetTHO[$x] = 1 Then $MeetTHOtext = "외곽에위치한마을회관"
			If $iChkWeakBase[$x] = 1 Then $MeetWeakBasetext = "Weak Base(박격포: " & $iCmbWeakMortar[$x] & ", 마법사타워: " & $iCmbWeakWizTower[$x] & ") , "
			If $iChkEnableAfter[$x] = 1 Then $EnabledAftertext = $iEnableAfterCount[$x] & " 번 검색후 활성화"

			SetLog($MeetGxEtext & $MeetGorEtext & $MeetGplusEtext & $MeetDEtext & $MeetTrophytext)
			if $MeetTHtext <> "" or $MeetTHOtext<>"" Then
				SetLog($MeetTHtext & $MeetTHOtext)
			EndIf
			if $MeetWeakBasetext <> "" or $EnabledAftertext <> "" Then
				SetLog($MeetWeakBasetext & $EnabledAftertext)
			EndIf

			If $iChkMeetOne[$x] = 1 Then SetLog("하나만걸려라")

			SetLog(_PadStringCenter("자원 설정값 ", 50, "~"), $COLOR_BLUE)
			If $iChkMeetTH[$x] = 1 Then $iAimTHtext[$x] = " [TH]:" & StringFormat("%2s", $iMaxTH[$x]) ;$icmbTH
			If $iChkMeetTHO[$x] = 1 Then $iAimTHtext[$x] &= ", Out"



			If $iCmbMeetGE[$x] = 2 Then
				SetLog("Aim:           [G+E]:" & StringFormat("%7s", $iAimGoldPlusElixir[$x]) & " [D]:" & StringFormat("%5s", $iAimDark[$x]) & " [T]:" & StringFormat("%2s", $iAimTrophy[$x]) & $iAimTHtext[$x], $COLOR_GREEN, "Lucida Console", 7.5)
			Else
				SetLog("Aim: [G]:" & StringFormat("%7s", $iAimGold[$x]) & " [E]:" & StringFormat("%7s", $iAimElixir[$x]) & " [D]:" & StringFormat("%5s", $iAimDark[$x]) & " [T]:" & StringFormat("%2s", $iAimTrophy[$x]) & $iAimTHtext[$x], $COLOR_GREEN, "Lucida Console", 7.5)
			EndIf

		EndIf
	Next

	If $OptBullyMode + $OptTrophyMode + $chkATH > 0 Then
		SetLog(_PadStringCenter("고급설정", 50, "~"), $COLOR_BLUE)
		Local $YourTHText = "", $AttackTHTypeText = "", $chkATHText = "", $OptTrophyModeText = ""

		If $OptBullyMode = 1 Then
			For $i = 0 To 4
				If $YourTH = $i Then $YourTHText = "TH" & $THText[$i]
			Next
		EndIf

		If $OptBullyMode = 1 Then SetLog("THBully Combo @" & $ATBullyMode & " 번 검색이후, " & $YourTHText)

		If $OptTrophyMode = 1 And $AttackTHType = 0 Then $AttackTHTypeText = ", Barch"
		If $OptTrophyMode = 1 And $AttackTHType = 1 Then $AttackTHTypeText = ", Attack1:Normal"
		If $OptTrophyMode = 1 And $AttackTHType = 2 Then $AttackTHTypeText = ", Attack2:Extreme"
		If $OptTrophyMode = 1 And $AttackTHType = 3 Then $AttackTHTypeText = ", Attack3:Gbarch"
		If $OptTrophyMode = 1 And $AttackTHType = 4 Then $AttackTHTypeText = ", Attack4:SmartBarch"
		If $OptTrophyMode = 1 And $AttackTHType = 5 Then $AttackTHTypeText = ", Attack5:MasterGiBAM"
		If $OptTrophyMode = 1 Then $OptTrophyModeText = "THSnipe Combo, " & $THaddtiles & " Tile(s), "
		If $OptTrophyMode = 1 Or $chkATH = 1 Then SetLog($OptTrophyModeText & $chkATHText & $AttackTHTypeText)
	EndIf

	SetLog(_StringRepeat("=", 50), $COLOR_BLUE)

	If $iChkAttackNow = 1 Then
		GUICtrlSetState($btnAttackNowDB, $GUI_SHOW)
		GUICtrlSetState($btnAttackNowLB, $GUI_SHOW)
		GUICtrlSetState($btnAttackNowTS, $GUI_SHOW)
		GUICtrlSetState($pic2arrow, $GUI_HIDE)
		GUICtrlSetState($lblVersion, $GUI_HIDE)
	EndIf

	If $Is_ClientSyncError = False Then
		$SearchCount = 0
	EndIf

	While 1
		If $iVSDelay > 0 Then
			If _Sleep(1000 * $iVSDelay) Then Return
		EndIf

		If $Restart = True Then Return ; exit func
		GetResources() ;Reads Resource Values
		If $Restart = True Then Return ; exit func
		$bBtnAttackNowPressed = False
		;If $bBtnAttackNowPressed = True Then ExitLoop

		If Mod(($iSkipped + 1), 100) = 0 Then
			_WinAPI_EmptyWorkingSet(WinGetProcess($Title)) ; reduce BS memory
			If _Sleep(1000) Then Return
			If CheckZoomOut() = False Then Return
		EndIf

		Local $noMatchTxt = ""
		Local $dbBase = False
		Local $matchDB = False
		Local $matchLB = False
		Local $isWeakBase[$iModeCount]
		; break every 10 searches when Snipe While Train MOD is activated
		If $isSnipeWhileTrain And $iSkipped > 13 Then
			Click(62, 519) ; Click End Battle to return home
			$haltSearch = True ; To Prevent Initiation of Attack
			SetLog(_PadStringCenter("검색중지", 50, "~"), $COLOR_GREEN)
			ExitLoop
		EndIf
		For $x = 0 To $iModeCount - 1
			$isWeakBase[$x] = False
			If ($x = $iCmbSearchMode Or $iCmbSearchMode = 2) And $iChkWeakBase[$x] = 1 Then
				_WinAPI_DeleteObject($hBitmapFirst)
				$hBitmapFirst = _CaptureRegion2()
				Local $resultHere = DllCall($pFuncLib, "str", "CheckConditionForWeakBase", "ptr", $hBitmapFirst, "int", ($iCmbWeakMortar[$x] + 1), "int", ($iCmbWeakWizTower[$x] + 1), "int", 10)
				If $resultHere[0] = "Y" Then
					$isWeakBase[$x] = True
				EndIf
			EndIf
		Next
		If $iCmbSearchMode = 0 Then
			$matchDB = CompareResources($DB, $isWeakBase[$DB])
		ElseIf $iCmbSearchMode = 1 Then
			$matchLB = CompareResources($LB, $isWeakBase[$LB])
		Else
			If IsSearchModeActive($DB) Then $matchDB = CompareResources($DB, $isWeakBase[$DB])
			If IsSearchModeActive($LB) Then $matchLB = CompareResources($LB, $isWeakBase[$LB])
		EndIf
		If $matchDB Or $matchLB Then
			$dbBase = checkDeadBase()
		EndIf
		If $matchDB And $dbBase Then
			SetLog(_PadStringCenter(" 검색성공 : Dead Base ", 50, "~"), $COLOR_GREEN)
			$iMatchMode = $DB
			ExitLoop
		ElseIf $matchLB And Not $dbBase Then
			SetLog(_PadStringCenter(" 검색성공 : Live Base ", 50, "~"), $COLOR_GREEN)
			$iMatchMode = $LB
			ExitLoop
		ElseIf $matchLB Or $matchDB Then
			If $OptBullyMode = 1 And ($SearchCount >= $ATBullyMode) Then
				If $SearchTHLResult = 1 Then
					SetLog(_PadStringCenter(" 검색성공 : TH Bully Level ", 50, "~"), $COLOR_GREEN)
					$iMatchMode = $iTHBullyAttackMode
					ExitLoop
				EndIf
			EndIf
		EndIf
		;If $bBtnAttackNowPressed = True Then ExitLoop
		If $OptTrophyMode = 1 Then ;Enables Triple Mode Settings ;---compare resources
			If SearchTownHallLoc() Then ; attack this base anyway because outside TH found to snipe
				SetLog(_PadStringCenter(" 검색성공 : 외곽에 위치한 마을회관  ", 50, "~"), $COLOR_GREEN)
				$iMatchMode = $TS
				ExitLoop
			EndIf
		EndIf
		;If $bBtnAttackNowPressed = True Then ExitLoop
		For $x = 0 To $iModeCount - 1
			If ($x = $iCmbSearchMode Or $iCmbSearchMode = 2) And $iChkWeakBase[$x] = 1 And Not $isWeakBase[$x] Then
				$noMatchTxt &= ", Weak Base가 아닙니다(for " & $sModeText[$x] & ")"
			EndIf
		Next
		If $matchDB And Not $dbBase Then
			$noMatchTxt &= $sModeText[$DB] & "가 아닙니다"
		ElseIf $matchLB And $dbBase Then
			$noMatchTxt &= $sModeText[$LB] & "가 아닙니다"
		EndIf
 		If $noMatchTxt <> "" Then
			SetLog(_PadStringCenter(" " & $noMatchTxt & " ", 50, "~"), $COLOR_PURPLE)
		EndIf
		;If $bBtnAttackNowPressed = True Then ExitLoop
		If $iChkAttackNow = 1 Then
			If _Sleep(1000 * $iAttackNowDelay) Then Return ; add human reaction time on AttackNow button function
		EndIf
		If $bBtnAttackNowPressed = True Then ExitLoop
		Click(825, 527,1,0,"#0155") ;Click Next
		If _Sleep(500) Then Return
		If isGemOpen(True) = True Then
			Setlog(" 검색을 계속하기 위한 골드가 부족합니다. ", $COLOR_RED)
			Click(585, 252,1,0,"#0156")  ; Click close gem window "X"
			$OutOfGold = 1  ; Set flag for out of gold to search for attack
			Return
		EndIf
		$iSkipped = $iSkipped + 1
		GUICtrlSetData($lblresultvillagesskipped, GUICtrlRead($lblresultvillagesskipped) + 1)
	WEnd

	If $bBtnAttackNowPressed = True Then
		Setlog(_PadStringCenter(" Attack Now! 버튼 사용 ", 50, "~"), $COLOR_GREEN)
		$Is_ClientSyncError = False
	EndIf

	If $iChkAttackNow = 1 Then
		GUICtrlSetState($btnAttackNowDB, $GUI_HIDE)
		GUICtrlSetState($btnAttackNowLB, $GUI_HIDE)
		GUICtrlSetState($btnAttackNowTS, $GUI_HIDE)
		GUICtrlSetState($pic2arrow, $GUI_SHOW)
		GUICtrlSetState($lblVersion, $GUI_SHOW)
		$bBtnAttackNowPressed = False
	EndIf

	If $AlertSearch = 1 Then
		TrayTip($sModeText[$iMatchMode] & " 검색성공!", $SearchCount &" 번 검색; Gold: " & $searchGold & "; Elixir: " & $searchElixir & "; Dark: " & $searchDark & "; Trophy: " & $searchTrophy, "", 0)
		If FileExists(@WindowsDir & "\media\Festival\Windows Exclamation.wav") Then
			SoundPlay(@WindowsDir & "\media\Festival\Windows Exclamation.wav", 1)
		ElseIf FileExists(@WindowsDir & "\media\Windows Exclamation.wav") Then
			SoundPlay(@WindowsDir & "\media\Windows Exclamation.wav", 1)
		EndIf
	EndIf

	SetLog(_PadStringCenter(" 검색 성공 ", 50, "="), $COLOR_BLUE)
	PushMsg("MatchFound")
	$Is_ClientSyncError = False
	;$SearchCount = 0

	; TH Detection Check Once Conditions
	If $OptBullyMode = 0 And $OptTrophyMode = 0 And $iChkMeetTH[$iMatchMode] = 0 And $iChkMeetTHO[$iMatchMode] = 0 And $chkATH = 1 Then
		$searchTH = checkTownhallADV()
		If SearchTownHallLoc() = False And $searchTH <> "-" Then
			SetLog("Checking Townhall location: TH is inside, skip Attack TH")
		ElseIf $searchTH <> "-" Then
			SetLog("Checking Townhall location: TH is outside, Attacking Townhall!")
		Else
			SetLog("Checking Townhall location: Could not locate TH, skipping attack TH...")
		EndIf
	EndIf

;~	_WinAPI_EmptyWorkingSet(WinGetProcess($Title)) ; reduce BS Memory

;~	readConfig()
	_BlockInputEx(0, "", "", $HWnD) ; block all keyboard keys

	$Is_ClientSyncError = False

EndFunc   ;==>VillageSearch

Func IsSearchModeActive($pMode)
	If $iChkEnableAfter[$pMode] = 0 Then Return True
	If $SearchCount = $iEnableAfterCount[$pMode] Then SetLog(_PadStringCenter(" " & $sModeText[$pMode] & " 검색조건 활성화 ", 50, "~"), $COLOR_BLUE)
	If $SearchCount >= $iEnableAfterCount[$pMode] Then Return True
	Return False
EndFunc
