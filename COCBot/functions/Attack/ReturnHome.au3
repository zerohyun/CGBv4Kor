; #FUNCTION# ====================================================================================================================
; Name ..........: ReturnHome
; Description ...: Returns home when in battle, will take screenshot and check for gold/elixir change unless specified not to.
; Syntax ........: ReturnHome([$TakeSS = 1[, $GoldChangeCheck = True]])
; Parameters ....: $TakeSS              - [optional] flag for saving a snapshot of the winning loot. Default is 1.
;                  $GoldChangeCheck     - [optional] an unknown value. Default is True.
; Return values .: None
; Author ........:
; Modified ......: KnowJack (June 2015)
; Remarks .......: This file is part of ClashGameBot. Copyright 2015
;                  ClashGameBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........:
; Example .......: No
; ===============================================================================================================================
Func ReturnHome($TakeSS = 1, $GoldChangeCheck = True) ;Return main screen

	Local $counter = 0
	Local $hBitmap_Scaled

	If $GoldChangeCheck = True Then
		SetLog("Checking if the battle has finished", $COLOR_BLUE)
		While GoldElixirChangeEBO()
			If _Sleep(1000) Then Return
		WEnd

		;If Heroes were not activated: Hero Ability activation before End of Battle to restore health
		If ($checkKPower = True Or $checkQPower = True) And $iActivateKQCondition = "Auto" Then
			;_CaptureRegion()
			If _ColorCheck(_GetPixelColor(363, 548, True), Hex(0x78C11C, 6), 20) = False And _ColorCheck(_GetPixelColor(497, 548, True), Hex(0x79C326, 6), 20) = False Then ; If not already at Return Homescreen
				If $checkKPower = True Then
					SetLog("Activating King's power to restore some health before EndBattle", $COLOR_BLUE)
					SelectDropTroop($King) ;If King was not activated: Boost King before EndBattle to restore some health
				EndIf
				If $checkQPower = True Then
					SetLog("Activating Queen's power to restore some health before EndBattle", $COLOR_BLUE)
					SelectDropTroop($Queen) ;If Queen was not activated: Boost Queen before EndBattle to restore some health
				EndIf
			EndIf
		EndIf
	EndIf

	$checkKPower = False
	$checkQPower = False

	If $OptTrophyMode = 1 And _GUICtrlComboBox_GetCurSel($cmbTroopComp) = 9 Then $FirstStart = True ;reset barracks upon return when TH sniping w/custom army

	SetLog("Returning Home", $COLOR_BLUE)
	If $RunState = False Then Return
	ClickP($aSurrenderButton, 1, 0, "#0099") ;Click Surrender
	If _Sleep(500) Then Return
	ClickP($aConfirmSurrender, 1, 0, "#0100") ;Click Confirm
	If _Sleep(500) Then Return
	TrayTip($sBotTitle, "", BitOR($TIP_ICONASTERISK, $TIP_NOSOUND)) ; clear village search match found message

	If $GoldChangeCheck = True Then
		$counter = 0
		While _ColorCheck(_GetPixelColor(363, 548, True), Hex(0x78C11C, 6), 20) = False And _ColorCheck(_GetPixelColor(497, 548, True), Hex(0x79C326, 6), 20) = False ; test for Return Home Button
			If _Sleep(500) Then ExitLoop
			$counter += 1
			If $counter > 40 Then ExitLoop
		WEnd
		If _Sleep(2500) Then Return ; wait for all report details
		_CaptureRegion(0, 0, 860, 675)
		AttackReport()
		GUICtrlSetData($lblresultvillagesattacked, GUICtrlRead($lblresultvillagesattacked) + 1)
	EndIf

	If $TakeSS = 1 And $GoldChangeCheck = True Then
		SetLog("Taking snapshot of your loot", $COLOR_GREEN)
		Local $Date = @YEAR & "-" & @MON & "-" & @MDAY
		Local $Time = @HOUR & "." & @MIN
		_CaptureRegion(0, 0, 860, 675)
		$hBitmap_Scaled = _GDIPlus_ImageResize($hBitmap, _GDIPlus_ImageGetWidth($hBitmap) / 2, _GDIPlus_ImageGetHeight($hBitmap) / 2) ;resize image
		; screenshot filename according with new options around filenames
		If $ScreenshotLootInfo = 1 Then
			$LootFileName = $Date & "_" & $Time & " G" & $lootGold & " E" & $lootElixir & " DE" & $lootDarkElixir & " T" & $lootTrophies & " S" & StringFormat("%s", $SearchCount) & ".jpg"
		Else
			$LootFileName = $Date & "_" & $Time & ".jpg"
		EndIf
		_GDIPlus_ImageSaveToFile($hBitmap_Scaled, $dirLoots & $LootFileName)
		_GDIPlus_ImageDispose($hBitmap_Scaled)
	EndIf

	;push images if requested..
	If $GoldChangeCheck = True Then
		PushMsg("LastRaid")
		PushMsg("LastRaidTxt")
	EndIf

	ClickP($aReturnHomeButton, 1, 0, "#0101") ;Click Return Home Button

	$counter = 0
	While 1
		If _Sleep(2000) Then Return
		_CaptureRegion()
		If _ColorCheck(_GetPixelColor(284, 28), Hex(0x41B1CD, 6), 20) Then
			_GUICtrlEdit_SetText($txtLog, _PadStringCenter(" BOT LOG ", 71, "="))
			_GUICtrlRichEdit_SetFont($txtLog, 6, "Lucida Console")
			_GUICtrlRichEdit_AppendTextColor($txtLog, "" & @CRLF, _ColorConvert($Color_Black))
			Return
		EndIf

		$counter += 1

		If $counter >= 50 Or isProblemAffect(True) Then
			SetLog("Cannot return home.", $COLOR_RED)
			checkMainScreen()
			Return
		EndIf
	WEnd
EndFunc   ;==>ReturnHome
