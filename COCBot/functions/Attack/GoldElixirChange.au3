
;==========================================================================
; Function name: GoldElixirChange
; Authored by:
; Edited by: Samota,
;
; Description: Checks if the gold/elixir changes values within 20 seconds, Returns True if changed. Also
; checks every 5 seconds if gold/elixir = "", meaning battle is over. If either condition is met, return
; false.
;
; Notes: If all troops are used, the battle will end when they are all dead, the timer runs out, or the
; base has been 3-starred. When the battle ends, it is detected within 5 seconds, otherwise it takes up
; to 20 seconds.
;
;==========================================================================
Func GoldElixirChange()
	Local $Gold1, $Gold2
	Local $GoldChange, $ElixirChange
	Local $Elixir1, $Elixir2
	SetLog("전투를 종료하기 위한 확인", $COLOR_BLUE)
	While 1
		$Gold1 = getGoldVillageSearch(48, 68)
		$Elixir1 = getElixirVillageSearch(48, 68 + 28)

		Local $iBegin = TimerInit(), $x = $sTimeStopAtk * 1000
		While TimerDiff($iBegin) < $x
			CheckHeroesHealth()
			If $checkKPower Or $checkQPower Then
				If _Sleep(500) Then Return
			Else
				If _Sleep(1000) Then Return
			EndIf

			$Gold2 = getGoldVillageSearch(48, 68)

			If $Gold2 = "" Then
				If _Sleep(500) Then Return
				$Gold2 = getGoldVillageSearch(48, 68)
			EndIf
			$Elixir2 = getElixirVillageSearch(48, 68 + 28)


			If $Gold2 <> "" Or $Elixir2 <> "" Then
				$GoldChange = $Gold2
				$ElixirChange = $Elixir2
			EndIf

			If ($Gold2 = "" And $Elixir2 = "") Then
				If _Sleep(500) Then Return

				If getGoldVillageSearch(48, 68) = "" And getElixirVillageSearch(48, 68 + 28) = "" Then
					SetLog("전투가 끝났습니다.", $COLOR_GREEN)
					ExitLoop
				EndIf


			EndIf
			;If (GUICtrlRead($cmbBoostBarracks) > 0) And ($boostsEnabled = 1) Then $x = $sTimeStopAtk*1000
		WEnd
		If ($Gold1 = $Gold2 And $Elixir1 = $Elixir2) Or ($Gold2 = "" And $Elixir2 = "") Then
			GUICtrlSetData($lblresultvillagesattacked, GUICtrlRead($lblresultvillagesattacked) + 1)
			Return False
		Else
			SetLog("약탈중입니다.", $COLOR_GREEN)
			Return True
		EndIf
		ExitLoop
	WEnd
EndFunc   ;==>GoldElixirChange
