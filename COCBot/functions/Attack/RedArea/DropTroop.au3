
Func DropTroop($troop, $nbSides, $number, $slotsPerEdge = 0, $indexToAttack = -1)
	$nameFunc = "[DropTroop]"
	debugRedArea($nameFunc & " IN ")
	debugRedArea("troop : [" & $troop & "] / nbSides : [" & $nbSides & "] / number : [" & $number & "] / slotsPerEdge [" & $slotsPerEdge & "]")


	If ($iChkRedArea[$iMatchMode]) Then
		If $slotsPerEdge = 0 Or $number < $slotsPerEdge Then $slotsPerEdge = $number
		If _Sleep(100) Then Return
		SelectDropTroop($troop) ;Select Troop
		If _Sleep(300) Then Return

		If $nbSides < 1 Then Return
		Local $nbTroopsLeft = $number
		If ($iChkSmartAttack[$iMatchMode][0] = 0 And $iChkSmartAttack[$iMatchMode][1] = 0 And $iChkSmartAttack[$iMatchMode][2] = 0) Then

			If $nbSides = 4 Then
				Local $edgesPixelToDrop = GetPixelDropTroop($troop, $number, $slotsPerEdge)

				For $i = 0 To $nbSides - 3
					Local $nbTroopsPerEdge = Round($nbTroopsLeft / ($nbSides - $i * 2))
					If ($number > 0 And $nbTroopsPerEdge = 0) Then $nbTroopsPerEdge = 1
					Local $listEdgesPixelToDrop[2] = [$edgesPixelToDrop[$i], $edgesPixelToDrop[$i + 2]]
					DropOnPixel($troop, $listEdgesPixelToDrop, $nbTroopsPerEdge, $slotsPerEdge)
					$nbTroopsLeft -= $nbTroopsPerEdge * 2
				Next
				Return
			EndIf


			For $i = 0 To $nbSides - 1

				If $nbSides = 1 Or ($nbSides = 3 And $i = 2) Then

					Local $nbTroopsPerEdge = Round($nbTroopsLeft / ($nbSides - $i))
					If ($number > 0 And $nbTroopsPerEdge = 0) Then $nbTroopsPerEdge = 1
					Local $edgesPixelToDrop = GetPixelDropTroop($troop, $nbTroopsPerEdge, $slotsPerEdge)
					Local $listEdgesPixelToDrop[1] = [$edgesPixelToDrop[$i]]
					DropOnPixel($troop, $listEdgesPixelToDrop, $nbTroopsPerEdge, $slotsPerEdge)
					$nbTroopsLeft -= $nbTroopsPerEdge
				ElseIf ($nbSides = 2 And $i = 0) Or ($nbSides = 3 And $i <> 1) Then
					Local $nbTroopsPerEdge = Round($nbTroopsLeft / ($nbSides - $i * 2))
					If ($number > 0 And $nbTroopsPerEdge = 0) Then $nbTroopsPerEdge = 1
					Local $edgesPixelToDrop = GetPixelDropTroop($troop, $nbTroopsPerEdge, $slotsPerEdge)
					Local $listEdgesPixelToDrop[2] = [$edgesPixelToDrop[$i + 3], $edgesPixelToDrop[$i + 1]]

					DropOnPixel($troop, $listEdgesPixelToDrop, $nbTroopsPerEdge, $slotsPerEdge)
					$nbTroopsLeft -= $nbTroopsPerEdge * 2
				EndIf
			Next
		Else
			Local $listEdgesPixelToDrop[0]
			If ($indexToAttack <> -1) Then
				Local $nbTroopsPerEdge = $number
				Local $maxElementNearCollector = $indexToAttack
				Local $startIndex = $indexToAttack
			Else
				Local $nbTroopsPerEdge = Round($number / UBound($PixelNearCollector))
				Local $maxElementNearCollector = UBound($PixelNearCollector) - 1
				Local $startIndex = 0
			EndIf
			If ($number > 0 And $nbTroopsPerEdge = 0) Then $nbTroopsPerEdge = 1
			For $i = $startIndex To $maxElementNearCollector
				$pixel = $PixelNearCollector[$i]
				ReDim $listEdgesPixelToDrop[UBound($listEdgesPixelToDrop) + 1]
				If ($troop = $eArch Or $troop = $eWiza Or $troop = $eMini) Then
					$listEdgesPixelToDrop[UBound($listEdgesPixelToDrop) - 1] = _FindPixelCloser($PixelRedAreaFurther, $pixel, 5)
				Else
					$listEdgesPixelToDrop[UBound($listEdgesPixelToDrop) - 1] = _FindPixelCloser($PixelRedArea, $pixel, 5)
				EndIf
			Next
			DropOnPixel($troop, $listEdgesPixelToDrop, $nbTroopsPerEdge, $slotsPerEdge)

		EndIf
	Else
		DropOnEdges($troop, $nbSides, $number, $slotsPerEdge)
	EndIf

	debugRedArea($nameFunc & " OUT ")

EndFunc   ;==>DropTroop

Func DropTroop2($troop, $nbSides, $number, $slotsPerEdge = 0, $name = "")
	$nameFunc = "[DropTroop]"
	debugRedArea($nameFunc & " IN ")
	debugRedArea("troop : [" & $troop & "] / nbSides : [" & $nbSides & "] / number : [" & $number & "] / slotsPerEdge [" & $slotsPerEdge & "]")
	Local $listInfoPixelDropTroop[0]


	If ($iChkRedArea[$iMatchMode]) Then
		If $slotsPerEdge = 0 Or $number < $slotsPerEdge Then $slotsPerEdge = $number
		;If _Sleep(100) Then Return
		;SelectDropTroop($troop) ;Select Troop
		;If _Sleep(300) Then Return

		If $nbSides < 1 Then Return
		Local $nbTroopsLeft = $number
		Local $nbTroopsPerEdge = Round($nbTroopsLeft / $nbSides)
		If (($iChkSmartAttack[$iMatchMode][0] = 0 And $iChkSmartAttack[$iMatchMode][1] = 0 And $iChkSmartAttack[$iMatchMode][2] = 0) Or UBound($PixelNearCollector) = 0) Then
			If ($number > 0 And $nbTroopsPerEdge = 0) Then $nbTroopsPerEdge = 1
			If $nbSides = 4 Then
				ReDim $listInfoPixelDropTroop[UBound($listInfoPixelDropTroop) + 4]
				Local $listInfoPixelDropTroop = GetPixelDropTroop($troop, $number, $slotsPerEdge)

			Else
				For $i = 0 To $nbSides - 1
					If $nbSides = 1 Or ($nbSides = 3 And $i = 2) Then
						Local $edgesPixelToDrop = GetPixelDropTroop($troop, $nbTroopsPerEdge, $slotsPerEdge)
						ReDim $listInfoPixelDropTroop[UBound($listInfoPixelDropTroop) + 1]
						$listInfoPixelDropTroop[UBound($listInfoPixelDropTroop) - 1] = $edgesPixelToDrop[$i]
					ElseIf ($nbSides = 2 And $i = 0) Or ($nbSides = 3 And $i <> 1) Then
						Local $edgesPixelToDrop = GetPixelDropTroop($troop, $nbTroopsPerEdge, $slotsPerEdge)
						ReDim $listInfoPixelDropTroop[UBound($listInfoPixelDropTroop) + 2]
						$listInfoPixelDropTroop[UBound($listInfoPixelDropTroop) - 2] = $edgesPixelToDrop[$i + 3]
						$listInfoPixelDropTroop[UBound($listInfoPixelDropTroop) - 1] = $edgesPixelToDrop[$i + 1]
					EndIf
				Next
			EndIf



		Else
			Local $listEdgesPixelToDrop[0]

			Local $nbTroopsPerEdge = Round($number / UBound($PixelNearCollector))
			If ($number > 0 And $nbTroopsPerEdge = 0) Then $nbTroopsPerEdge = 1
			Local $maxElementNearCollector = UBound($PixelNearCollector) - 1
			Local $startIndex = 0
			Local $troopFurther = False
			If ($troop = $eArch Or $troop = $eWiza Or $troop = $eMini) Then
				$troopFurther = True
			EndIf
			Local $centerPixel[2] = [430, 313]
			For $i = $startIndex To $maxElementNearCollector
				$pixel = $PixelNearCollector[$i]
				ReDim $listInfoPixelDropTroop[UBound($listInfoPixelDropTroop) + 1]
				Local $arrPixelToSearch
				If ($pixel[0] < $centerPixel[0] And $pixel[1] < $centerPixel[1]) Then
					If ($troopFurther) Then
						$arrPixelToSearch = $PixelTopLeftFurther
					Else
						$arrPixelToSearch = $PixelTopLeft
					EndIf
				ElseIf ($pixel[0] < $centerPixel[0] And $pixel[1] > $centerPixel[1]) Then
					If ($troopFurther) Then
						$arrPixelToSearch = $PixelBottomLeftFurther
					Else
						$arrPixelToSearch = $PixelBottomLeft
					EndIf
				ElseIf ($pixel[0] > $centerPixel[0] And $pixel[1] > $centerPixel[1]) Then
					If ($troopFurther) Then
						$arrPixelToSearch = $PixelBottomRightFurther
					Else
						$arrPixelToSearch = $PixelBottomRight
					EndIf
				Else
					If ($troopFurther) Then
						$arrPixelToSearch = $PixelTopRightFurther
					Else
						$arrPixelToSearch = $PixelTopRight
					EndIf
				EndIf

				$listInfoPixelDropTroop[UBound($listInfoPixelDropTroop) - 1] = _FindPixelCloser($arrPixelToSearch, $pixel, 1)

			Next

		EndIf
	Else
		DropOnEdges($troop, $nbSides, $number, $slotsPerEdge)
	EndIf

	Local $infoDropTroop[6] = [$troop, $listInfoPixelDropTroop, $nbTroopsPerEdge, $slotsPerEdge, $number, $name]
	Return $infoDropTroop
	debugRedArea($nameFunc & " OUT ")

EndFunc   ;==>DropTroop2
