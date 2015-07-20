; #FUNCTION# ====================================================================================================================
; Name ..........: CGB GUI Control
; Description ...: This file Includes all functions to current GUI
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: GkevinOD (2014)
; Modified ......: Hervidero (2015)
; Remarks .......: This file is part of ClashGameBot. Copyright 2015
;                  ClashGameBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........:
; Example .......: No
; ===============================================================================================================================

Func btnLoots()
	Run("Explorer.exe " & $sProfilePath & "\" & $sCurrProfile & "\Loots")
EndFunc   ;==>btnLoots

Func btnLogs()
	Run("Explorer.exe " & $sProfilePath & "\" & $sCurrProfile & "\Logs")
EndFunc   ;==>btnLogs

Func btnResetStats()
	GUICtrlSetState($btnResetStats, $GUI_DISABLE)
	$FirstRun = 1
	$FirstAttack = 1
	$totalLootGold = 0
	$totalLootElixir = 0
	$totalLootDarkElixir = 0
	$totalLootTrophies = 0
	$totalLootZapAndRun = 0
	GUICtrlSetState($lblLastAttackTemp, $GUI_SHOW)
	GUICtrlSetState($lblTotalLootTemp, $GUI_SHOW)
	GUICtrlSetState($lblHourlyStatsTemp, $GUI_SHOW) ;; added for hourly stats
	GUICtrlSetData($lblresultruntime, "00:00:00")
	GUICtrlSetData($lblWallgoldmake, "0")
	$wallgoldmake = 0
	GUICtrlSetData($lblWallelixirmake, "0")
	$wallelixirmake = 0
	;GUICtrlSetData($lblresultoutofsync, "0")
	GUICtrlSetData($lblresulttrophiesdropped, "0")
	GUICtrlSetData($lblresultvillagesskipped, "0")
	GUICtrlSetData($lblresultvillagesattacked, "0")
	;GUICtrlSetData($lblZapAndRunHitCount, "0")
	;GUICtrlSetData($lblZapAndRunUsedLSpell, "0")
	;GUICtrlSetData($lblZapAndRunTotalDE, "0")
	GUICtrlSetData($lblGoldLastAttack, "")
	GUICtrlSetData($lblElixirLastAttack, "")
	GUICtrlSetData($lblDarkLastAttack, "")
	GUICtrlSetData($lblTrophyLastAttack, "")
	GUICtrlSetData($lblGoldLoot, "")
	GUICtrlSetData($lblElixirLoot, "")
	GUICtrlSetData($lblDarkLoot, "")
	GUICtrlSetData($lblTrophyLoot, "")
	GUICtrlSetData($lblHourlyStatsGold, "")
	GUICtrlSetData($lblHourlyStatsElixir, "")
	GUICtrlSetData($lblHourlyStatsDark, "")
	GUICtrlSetData($lblHourlyStatsTrophy, "")
	$iTimePassed = 0
	$sTimer = TimerInit()
	ReportStart()
	ReportCurrent()
EndFunc   ;==>btnResetStats