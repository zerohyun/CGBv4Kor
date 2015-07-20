;Checks for your Barrack, Dark Barrack or Spell Factory
; 2015-06 Sardo

Func isBarrack()
	;-----------------------------------------------------------------------------
	;If _ColorCheck(_GetPixelColor(218, 294, True), Hex(0xBBBBBB, 6), 10) Or _ColorCheck(_GetPixelColor(217, 297, True), Hex(0xF8AD20, 6), 10) Then
	;	Return True
	;EndIf
	;If _ColorCheck(_GetPixelColor(217, 318, True), Hex(0xFFBD21, 6), 20)  Then 		Return True
	For $i = 1 To 4
		If _ColorCheck(_GetPixelColor($btnpos[$i][0], $btnpos[$i][1], True), Hex(0xE8E8E0, 6), 10) Then
			If $debugSetlog = 1 Then SetLog("Barrack" & $i & " selected", $COLOR_PURPLE)
			Return True ;exit when  found
		EndIf
	Next

	If $debugSetlog = 1 Then SetLog("This is not a Barrack", $COLOR_PURPLE)
	Return False
EndFunc   ;==>isBarrack

Func isDarkBarrack()
	;_CaptureRegion()
	;-----------------------------------------------------------------------------
	;	If _ColorCheck(_GetPixelColor(639, 456, True), Hex(0xD7DBC8, 6), 10) Or _ColorCheck(_GetPixelColor(526, 419, True), Hex(0xC9CCBB, 6), 10) Then
	;	Return True
	;EndIf
	;If _ColorCheck(_GetPixelColor(219, 347, True), Hex(0x4884B0, 6), 20)  Then 		Return True ;dark barrack1
	For $i = 5 To 6
		If _ColorCheck(_GetPixelColor($btnpos[$i][0], $btnpos[$i][1], True), Hex(0xE8E8E0, 6), 10) Then
			If $debugSetlog = 1 Then SetLog("Dark Barrack" & $i - 4 & " selected", $COLOR_PURPLE)
			Return True ;exit when found
		EndIf
	Next
	If $debugSetlog = 1 Then SetLog("This is not a Dark Barrack", $COLOR_PURPLE)
	Return False
EndFunc   ;==>isDarkBarrack

Func isSpellFactory()
	;_CaptureRegion()
	;-----------------------------------------------------------------------------
	;If _ColorCheck(_GetPixelColor(717, 440, True), Hex(0x8F8D7E, 6), 10) Or _ColorCheck(_GetPixelColor(211, 324, True), Hex(0x0830E8, 6), 10) Then
	;	Return True
	;EndIf
	If _ColorCheck(_GetPixelColor($btnpos[7][0], $btnpos[7][1], True), Hex(0xE8E8E0, 6), 10) Then
		If $debugSetlog = 1 Then SetLog("Spell FactoryDark  selected")
		Return True ;Spell Factory
	EndIf
	Return False
EndFunc   ;==>isSpellFactory

Func isDarkSpellFactory()
	If _ColorCheck(_GetPixelColor($btnpos[8][0], $btnpos[8][1], True), Hex(0xE8E8E0, 6), 10) Then
		If $debugSetlog = 1 Then SetLog("Dark Spell Factory  selected")
		Return True ;dark Spell Factory
	EndIf
	Return False
EndFunc   ;==>isDarkSpellFactory
