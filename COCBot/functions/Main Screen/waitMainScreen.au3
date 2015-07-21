
; #FUNCTION# ====================================================================================================================
; Name ..........: waitMainScreen
; Description ...: Waits 5 minutes for the pixel of mainscreen to be located, checks for obstacles every 2 seconds.  After five minutes, will try to restart bluestacks.
; Syntax ........: waitMainScreen()
; Parameters ....:
; Return values .: None
; Author ........:
; Modified ......:
; Remarks .......: This file is part of ClashGameBot. Copyright 2015
;                  ClashGameBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........:
; Example .......: No
; ===============================================================================================================================
Func waitMainScreen() ;Waits for main screen to popup
	Local $iTried, $iCount
	SetLog("메인화면을 기다리는중...")
	For $i = 0 To 200 ;120*2000 = 3.5 Minutes
		_CaptureRegion()
		If _CheckPixel($aIsMain, $bNoCapturepixel) = False Then ;Checks for Main Screen
			If _Sleep(1000) Then Return
			If checkObstacles() Then $i +=1 ;See if there is anything in the way of mainscreen
		Else
			Return
		EndIf
	Next
	$iCount = 0
	While 1
		SetLog("CoC화면 확인에 실패했습니다. 블루스택을 재시작합니다.", $COLOR_RED)
		$iTimeTroops = 0
		ShellExecute(@ProgramFilesDir & "\BlueStacks\HD-Quit.exe")
		If _Sleep(10000) Then Return
		ShellExecute(@ProgramFilesDir & "\BlueStacks\HD-StartLauncher.exe")
		If _Sleep(10000) Then Return
		checkMainScreen()
		$iTried = 0
		Do
			If $iTried > 9  Then
				SetLog("블루스택을 시작 할 수 없습니다.", $COLOR_RED)
				ExitLoop
			EndIf
			If _Sleep(5000) Then Return
			$iTried += 1
		Until ControlGetHandle($Title, "", "BlueStacksApp1") <> 0
		$iCount += 1
		If $iCount = 2 Then
			SetLog("블루스택을 시작하지 못했습니다..", $COLOR_RED)
			Return
		EndIf
	WEnd
EndFunc   ;==>waitMainScreen
