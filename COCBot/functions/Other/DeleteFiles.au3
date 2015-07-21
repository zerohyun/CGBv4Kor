; #FUNCTION# ====================================================================================================================
; Name ..........: DeleteFiles
; Description ...: Delete files from a folder
; Syntax ........:
; Parameters ....: Folder with last caracther "\"  |   filter files   |  type of delete:0 delete file, 1: put into recycle bin
; Return values .: None
; Author ........: Sardo (2015-06)
; Modified ......:
;
; Needs..........: include <Date.au3> <File.au3> <FileConstants.au3> <MsgBoxConstants.au3>
; Remarks .......: This file is part of ClashGameBot. Copyright 2015
;                  ClashGameBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........:
; Example .......: Deletefiles("C:\Users\administrator\AppData\Local\Temp\", "*.*", 2,1) delete temp file >=2 days from now and put into recycle bin
; ===============================================================================================================================


Func Deletefiles($Folder, $Filter,$daydiff= 120,$type=0)
	  local $FileListName =  _FileListToArray ($Folder, $Filter, 1); list files to an array.
	  local $x , $t, $tmin =0
		 If NOT ( (Not IsArray($FileListName)) Or (@error = 1))  Then
			For $x = $FileListname[0] To 1 Step -1
			   Local $FileDate = FileGetTime($Folder &  $FileListName[$x])
			   If IsArray($FileDate) Then
				  Local $Date = $FileDate[0] & '/' & $FileDate[1] & '/' & $FileDate[2] & ' ' & $FileDate[3] & ':' & $FileDate[4] & ':' & $FileDate[5]
				  ;msgbox ("" , "" , " " & $FileListname[$x] & " ____ " & $Date & "_____" &  _DateDiff('D', $Date, _NowCalc()) )
				  If _DateDiff('D', $Date, _NowCalc()) < $DayDiff Then ContinueLoop
				  ;msgbox ("" , "" , "Delete " & $FileListname[$x] & " ____ " & $Date & "_____" &  _DateDiff('D', $Date, _NowCalc()) )
				  if $type = 0 then
					 FileDelete( $Folder & $FileListName[$x])
				  else
					 FileRecycle($Folder & $FileListName[$x])
				  EndIf
			   Else
				  Return False
			   EndIf
			Next
		 Else
			Return False
		 EndIf
	  Return True
EndFunc




















