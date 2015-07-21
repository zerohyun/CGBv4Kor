Func UpgradeWall()

	If $NoMoreWalls = 1 Then Return

	If GUICtrlRead($chkWalls) = $GUI_CHECKED Then
		If $FreeBuilder > 0 Then
			SetLog("성벽업그레이드를 진행합니다.", $COLOR_BLUE)
			Click(1, 1,1,0,"#0313") ; click away
			$itxtWallMinGold = GUICtrlRead($txtWallMinGold)
			$itxtWallMinElixir = GUICtrlRead($txtWallMinElixir)

			Local $MinWallGold = Number($GoldCount - $Wallcost) > Number($itxtWallMinGold) ; Check if enough Gold
			Local $MinWallElixir = Number($ElixirCount - $Wallcost) > Number($itxtWallMinElixir) ; Check if enough Elixir

			If GUICtrlRead($UseGold) = $GUI_CHECKED Then
				$iUseStorage = 1
			ElseIf GUICtrlRead($UseElixir) = $GUI_CHECKED Then
				$iUseStorage = 2
			ElseIf GUICtrlRead($UseElixirGold) = $GUI_CHECKED Then
				$iUseStorage = 3
			EndIf

			Switch $iUseStorage
				Case 1
					If $MinWallGold Then
						SetLog("'골드'를 사용하여 업그레이드를 진행합니다.", $COLOR_GREEN)
						If CheckWall() Then UpgradeWallGold()
					Else
						SetLog("업그레이드에 필요한 '골드'양이 부족합니다.", $COLOR_RED)
					EndIf
				Case 2
					If $MinWallElixir Then
						Setlog("'엘릭서'를 사용하여 업그레이드를 진행합니다.", $COLOR_GREEN)
						If CheckWall() Then UpgradeWallElixir()
					Else
						Setlog("업그레이드에 필요한'엘릭서'양이 부족합니다.", $COLOR_RED)
					EndIf
				Case 3
					If $MinWallElixir Then
						SetLog("'엘릭서'를 사용하여 업그레이드를 진행합니다.", $COLOR_GREEN)
						If CheckWall() And Not UpgradeWallElixir() Then
							SetLog("'엘릭서'가 부족합니다. '골드'를 사용하여 업그레이드를 진행합니다.", $COLOR_RED)
							UpgradeWallGold()
						EndIf
					Else
						SetLog("'엘릭서'가 부족합니다. '골드'를 사용하여 업그레이드를 진행합니다.", $COLOR_RED)
						If $MinWallGold Then
							If CheckWall() Then UpgradeWallGold()
						Else
							Setlog("'골드'가 부족합니다. 업그레이드를 하지 못했습니다.", $COLOR_RED)
						EndIf
					EndIf
			EndSwitch
			Click(1, 1,1,0,"#0314") ; click away
			Click(820, 40,1,0,"#0315") ; Close Builder/Shop if open by accident
		Else
			SetLog("쉬는장인이 부족하여 업그레이드를 진행하지 않습니다.", $COLOR_RED)
		EndIf
	EndIf

EndFunc   ;==>UpgradeWall

Func UpgradeWallGold()

	;Click($WallxLOC, $WallyLOC)
	If _Sleep(600) Then Return

	Local $offColors[3][3] = [[0xD6714B, 47, 37], [0xF0E850, 70, 0], [0xF4F8F2, 79, 0]] ; 2nd pixel brown hammer, 3rd pixel gold, 4th pixel edge of button
	Global $ButtonPixel = _MultiPixelSearch(240, 563, 670, 650, 1, 1, Hex(0xF3F3F1, 6), $offColors, 30) ; first gray/white pixel of button
	If IsArray($ButtonPixel) Then
		If $debugSetlog = 1 Then
			Setlog("ButtonPixel = " & $ButtonPixel[0] & ", " & $ButtonPixel[1], $COLOR_PURPLE) ;Debug
			Setlog("Color #1: " & _GetPixelColor($ButtonPixel[0], $ButtonPixel[1], True) & ", #2: " & _GetPixelColor($ButtonPixel[0] + 47, $ButtonPixel[1] + 37, True) & ", #3: " & _GetPixelColor($ButtonPixel[0] + 70, $ButtonPixel[1], True) & ", #4: " & _GetPixelColor($ButtonPixel[0] + 79, $ButtonPixel[1], True), $COLOR_PURPLE)
		EndIf
		Click($ButtonPixel[0] + 20, $ButtonPixel[1] + 20,1,0,"#0316") ; Click Upgrade Gold Button
		If _Sleep(1000) Then Return
		_CaptureRegion()
		If _ColorCheck(_GetPixelColor(685, 150), Hex(0xE1090E, 6), 20) Then ; wall upgrade window red x
			If isNoUpgradeLoot(False) = True Then
				SetLog("Upgrade stopped due no loot", $COLOR_RED)
				Return False
			Endif
			Click(440, 480,1,0,"#0317")
			If _Sleep(500) Then Return
			SetLog("성벽업그레이드 성공(골드)", $COLOR_GREEN)
			PushMsg("UpgradeWithGold")
			$wallgoldmake = $wallgoldmake + 1
			GUICtrlSetData($lblWallgoldmake, $wallgoldmake)
			Return True
		EndIf
	Else
		Setlog("'골드'업그레이드 버튼이 없습니다.", $COLOR_RED)
		Pushmsg("NowUpgradeGoldButton")
		Return False
	EndIf

EndFunc   ;==>UpgradeWallGold

Func UpgradeWallElixir()

	;Click($WallxLOC, $WallyLOC)
	If _Sleep(600) Then Return

	Local $offColors[3][3] = [[0xBC5B31, 38, 32], [0xF84CF9, 72, 0], [0xF5F9F2, 79, 0]] ; 2nd pixel brown hammer, 3rd pixel gold, 4th pixel edge of button
	Global $ButtonPixel = _MultiPixelSearch(240, 563, 670, 650, 1, 1, Hex(0xF4F7F2, 6), $offColors, 30) ; first gray/white pixel of button
	If IsArray($ButtonPixel) Then
		Click($ButtonPixel[0] + 20, $ButtonPixel[1] + 20,1,0,"#0322") ; Click Upgrade Elixir Button
		If _Sleep(1000) Then Return
		_CaptureRegion()
		If _ColorCheck(_GetPixelColor(685, 150), Hex(0xE1090E, 6), 20) Then
			If isNoUpgradeLoot(False) = True Then
				SetLog("Upgrade stopped due to insufficient loot", $COLOR_RED)
				Return False
			Endif
			Click(440, 480,1,0,"#0318")
			If _Sleep(500) Then Return
			SetLog("성벽업그레이드 성공(엘릭서)", $COLOR_GREEN)
			PushMsg("UpgradeWithElixir")
			$wallelixirmake = $wallelixirmake + 1
			GUICtrlSetData($lblWallelixirmake, $wallelixirmake)
			Return True
		EndIf
	Else
		Setlog("'엘릭서'업그레이드 버튼이 없습니다.", $COLOR_RED)
		Pushmsg("NowUpgradeElixirButton")
		Return False
	EndIf

EndFunc   ;==>UpgradeWallElixir
