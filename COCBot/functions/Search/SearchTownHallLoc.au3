
; #FUNCTION# ====================================================================================================================
; Name ..........: SearchTownHallLoc
; Description ...:
; Syntax ........: SearchTownHallLoc()
; Parameters ....:
; Return values .: None
; Author ........: Code Monkey #5
; Modified ......:
; Remarks .......: This file is part of ClashGameBot. Copyright 2015
;                  ClashGameBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........:
; Example .......: No
; ===============================================================================================================================
Func SearchTownHallLoc()
   If $searchTH <> "-" Then
 		 If FilterTH()=False Then Return False

	  For $i=0 to 20

		 If $Thx<114+$i*19+ceiling(($THaddtiles-2)/2*19) And $Thy<359-$i*14+ceiling(($THaddtiles-2)/2*14) Then
			$THi=$i
			$THside=0
			Return True
		 EndIf
		 If $Thx<117+$i*19+ceiling(($THaddtiles-2)/2*19) And $Thy>268+$i*14-floor(($THaddtiles-2)/2*14) Then
			$THi=$i
			$THside=1
			If $THi>15 And $BottomTHType = 0 Then Return False
			Return True
		 EndIf
		 If $Thx>743-$i*19-floor(($THaddtiles-2)/2*19) And $Thy<358-$i*14+ceiling(($THaddtiles-2)/2*14) Then
			$THi=$i
			$THside=2
			Return True
		 EndIf
		 If $Thx>742-$i*19-floor(($THaddtiles-2)/2*19) And $Thy>268+$i*14-floor(($THaddtiles-2)/2*14) Then
			$THi=$i
			$THside=3
			If $THi>15 And $BottomTHType = 0 Then Return False
			Return True
		 EndIf
		 Next
   EndIf
	Return False
EndFunc ;--- SearchTownHallLoc

Func FilterTH()
   	  For $i=0 to 20
		 If $Thx<52+$i*19 And $Thy<315-$i*14 Then Return False
		 If $Thx<52+$i*19 And $Thy>315+$i*14 Then Return False
 		 If $Thx>802-$i*19 And $Thy<315-$i*14 Then Return False
		 If $Thx>802-$i*19 And $Thy>315+$i*14 Then Return False
	  Next
			Return True
EndFunc

