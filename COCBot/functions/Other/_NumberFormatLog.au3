
Func _NumberFormatLog($Number)

If $Number = "" then Return ""
If $Number = "0" then Return "0"
local $Numbertofix

If StringLeft($Number, 1) = "-" Then
	$Numbertofix = "- " & StringRegExpReplace(StringTrimLeft($Number, 1), "(\A\d{1,3}(?=(\d{3})+\z)|\d{3}(?=\d))", "\1 ")
Else
	$Numbertofix = StringRegExpReplace($Number, "(\A\d{1,3}(?=(\d{3})+\z)|\d{3}(?=\d))", "\1 ")
EndIf


local $SeparateArray = StringSplit($Numbertofix," ")
local $SpacedLog = ""


If $SeparateArray[0] = 3 then
$SpacedLog = $SeparateArray[3] & " " & $SeparateArray[2] & " " & $SeparateArray[1]
EndIf

If $SeparateArray[0] =2 then
$SpacedLog = $SeparateArray[2] & " " & $SeparateArray[1]
EndIf

If $SeparateArray[0] =1 then
$SpacedLog = $Numbertofix
EndIf

return $SpacedLog

EndFunc