; #FUNCTION# ====================================================================================================================
; Name ..........: CheckWall()
; Description ...: This file Includes the detection of Walls for Upgrade
; Syntax ........:
; Parameters ....: None
; Return values .:
; Author ........: ProMac (2015), HungLe (2015)
; Modified ......:
; Remarks .......: This file is part of ClashGameBot. Copyright 2015
;                  ClashGameBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........:
; Example .......: No
; ===============================================================================================================================

Global $Wall[7][3]
Global $NoMoreWalls = 0

$Wall[0][0] = @ScriptDir & "\images\Walls\4_1.bmp"
$Wall[0][1] = @ScriptDir & "\images\Walls\4_2.bmp"
$Wall[0][2] = @ScriptDir & "\images\Walls\4.png"

$Wall[1][0] = @ScriptDir & "\images\Walls\5_1.bmp"
$Wall[1][1] = @ScriptDir & "\images\Walls\5_2.bmp"
$Wall[1][2] = @ScriptDir & "\images\Walls\5.png"

$Wall[2][0] = @ScriptDir & "\images\Walls\6_1.bmp"
$Wall[2][1] = @ScriptDir & "\images\Walls\6_2.bmp"
$Wall[2][2] = @ScriptDir & "\images\Walls\6.png"

$Wall[3][0] = @ScriptDir & "\images\Walls\7_1.bmp"
$Wall[3][1] = @ScriptDir & "\images\Walls\7_2.bmp"
$Wall[3][2] = @ScriptDir & "\images\Walls\7.png"

$Wall[4][0] = @ScriptDir & "\images\Walls\8_1.bmp"
$Wall[4][1] = @ScriptDir & "\images\Walls\8_2.bmp"
$Wall[4][2] = @ScriptDir & "\images\Walls\8.png"

$Wall[5][0] = @ScriptDir & "\images\Walls\9_1.bmp"
$Wall[5][1] = @ScriptDir & "\images\Walls\9_2.bmp"
$Wall[5][2] = @ScriptDir & "\images\Walls\9.png"

$Wall[6][0] = @ScriptDir & "\images\Walls\10_1.bmp"
$Wall[6][1] = @ScriptDir & "\images\Walls\10_2.bmp"
$Wall[6][2] = @ScriptDir & "\images\Walls\10.png"

Local $WallPos
Local $WallX, $WallY
;Local $HitPoints
;Local $HitPointsWall[7] = [900, 1400, 2000, 2500, 3000, 4000, 5500] ; HitPoint of each walls level

Func CheckWall()

	If _Sleep(500) Then Return

	_CaptureRegion()
	Local $listArrayPoint = ""
	$ToleranceHere = 20
	While $ToleranceHere < 91
		$ToleranceHere = $ToleranceHere + 10
			For $ImageIndex = 0 To 2
				$WallPos = _ImageSearch($Wall[$icmbWalls][$ImageIndex], 1, $WallX, $WallY, $ToleranceHere) ; Getting Wall Location
				If $WallPos = 1 Then
					If IsInsideDiamondXY($WallX, $WallY) = False Then ContinueLoop ; exclude area

					If Not checkPointDouble($listArrayPoint, $WallX, $WallY) Then
						$listArrayPoint = $listArrayPoint & $WallX & ";" & $WallY & "|"
					EndIf

					If $debugSetlog = 1 Then
						SetLog("Wall level: " & $icmbWalls + 4 & " � Position: [" & $WallX & "," & $WallY & "], Verifying..")
					Else
						SetLog("Wall level: " & $icmbWalls + 4 & ", Verifying..", $COLOR_GREEN)
					EndIf
					GemClick($WallX, $WallY,1,0,"#0122")
					If _Sleep(500) Then Return
					$sBldgName = getNameBuilding(250, 520) ; Get Unit name and level with OCR
					If $sBldgName = "" Then ; try a 2nd time after a short delay if slow PC
						If _Sleep(1000) Then Return
						$sBldgName = getNameBuilding(250, 520) ; Get Unit name and level with OCR
					EndIf
					If $debugSetlog = 1 Then Setlog("Read Wall String = " & $sBldgName, $COLOR_MAROON) ;debug
					$aString = StringSplit($sBldgName, "(") ; Spilt the name and building level
					If $aString[0] = 2 Then ; If we have name and level then use it
						If $debugSetlog = 1 Then Setlog("1st $aString = " & $aString[0] & ", " & $aString[1] & ", " & $aString[2], $COLOR_FUCHSIA) ;debug
						If $aString[2] <> "" Then ; check for bad read of level
							$sBldgLevel = $aString[2] ; store level text
							$aString = StringSplit($sBldgLevel, ")") ;split off the closing parenthesis
							If $aString[0] = 2 Then ; If we have "level XX" cleaned up
								If $debugSetlog = 1 Then Setlog("2nd $aString = " & $aString[0] & ", " & $aString[1] & ", " & $aString[2], $COLOR_FUCHSIA) ;debug
								If $aString[1] <> "" Then $sBldgLevel = $aString[1] ; store "level XX"
							EndIf
							$aString = StringSplit($sBldgLevel, " ") ;split off the level number
							If $aString[0] = 2 Then ; If we have level number then use it
								If $debugSetlog = 1 Then Setlog("3rd $aString = " & $aString[0] & ", " & $aString[1] & ", " & $aString[2], $COLOR_FUCHSIA) ;debug
								If $aString[2] <> "" And Number($aString[2]) = $icmbWalls + 4 Then Return True
							EndIf
						EndIf
					EndIf
					If _Sleep(250) Then Return
					;If HitPoints() Then Return True; CheckWallLv() = 1 And CheckWallWord() = 1
				EndIf
			Next
	WEnd

	SetLog("Cannot find Walls level " & $icmbWalls + 4 & ", function disabled ...", $COLOR_RED)
	$NoMoreWalls = 1
	Return False

EndFunc   ;==>CheckWall

Func checkPointDouble($listArrayPoint, $xPoint, $yPoint)
	Local $ArrayPoints = StringSplit($listArrayPoint, "|")
	For $i = 1 To $ArrayPoints[0]
		If $ArrayPoints[$i] <> "" Then
			$pixel = StringSplit($ArrayPoints[$i], ";")
			If (Abs($xPoint - $pixel[1]) < 5 Or Abs($yPoint - $pixel[2]) < 5) Then Return True
		EndIf
	Next
	Return False
EndFunc   ;==>checkPointDouble

#cs
Func HitPoints()

	Local $offColors[3][3] = [[0xD6714B, 47, 37], [0xF0E850, 70, 0], [0xF4F8F2, 79, 0]] ; 2nd pixel brown hammer, 3rd pixel gold, 4th pixel edge of button
	Global $ButtonPixel = _MultiPixelSearch(240, 563, 670, 650, 1, 1, Hex(0xF3F3F1, 6), $offColors, 30) ; first gray/white pixel of button

	If IsArray($ButtonPixel) Then
		If $debugSetlog = 1 Then
			Setlog("ButtonPixel = " & $ButtonPixel[0] & ", " & $ButtonPixel[1], $COLOR_PURPLE) ;Debug
			Setlog("Color #1: " & _GetPixelColor($ButtonPixel[0], $ButtonPixel[1], True) & ", #2: " & _GetPixelColor($ButtonPixel[0] + 47, $ButtonPixel[1] + 37, True) & ", #3: " & _GetPixelColor($ButtonPixel[0] + 70, $ButtonPixel[1], True) & ", #4: " & _GetPixelColor($ButtonPixel[0] + 79, $ButtonPixel[1], True), $COLOR_PURPLE)
		EndIf
		Click($ButtonPixel[0] + 20, $ButtonPixel[1] + 20,1,0,"#0123") ; Click Upgrade Gold Button
		If _Sleep(1000) Then Return
		_CaptureRegion()
		$HitPoints = Number(getOther(504, 193, "Hitpoints"))
		SetLog("~ Verify HitPoints:" & _NumberFormat($HitPoints))

		If $HitPointsWall[$icmbWalls] = $HitPoints Then
			SetLog("~ Wall HitPoints Correct.", $COLOR_GREEN)
			Click(1, 1,1,0,"#0124")
			If _Sleep(500) Then Return
			Return True
		Else
			SetLog("~ Wall HitPoints Incorrect! Not a Wall or wrong level.", $COLOR_RED)
			Click(1, 1, 2,0,"#0139")
			If _Sleep(500) Then Return
			Return False
		EndIf
	Else
		Setlog("No Upgrade Gold Button to check HitPoints, is not a Wall...", $COLOR_RED)
		Click(1, 1, 2,0,"#0125")
		If _Sleep(500) Then Return
		Return False
	EndIf

EndFunc   ;==>HitPoints
#ce