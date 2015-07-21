; #FUNCTION# ====================================================================================================================
; Name ..........: TestLanguage
; Description ...: This function tests if the game is in english language
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: Sardo (2015-06)
; Modified ......: Hervidero(2015)
;
; Remarks .......: This file is part of ClashGameBot. Copyright 2015
;                  ClashGameBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........:
; Example .......: No
; ===============================================================================================================================

Func TestLanguage()
	If $Runstate Then
		; test "builder" word top of sceen
		If getOcrLanguage(324,6) = "english"  Then
			Setlog("게임언어확인(English) : 확인성공", $COLOR_BLUE)
		Else
			SetLog("게임언어확인(English) : 다른언어입니다 영어(English)로 변경해주세요.", $COLOR_RED)
			btnStop()
		EndIf
	EndIf
EndFunc   ;==>TestLanguage
