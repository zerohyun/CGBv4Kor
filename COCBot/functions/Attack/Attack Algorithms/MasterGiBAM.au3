Func MasterGiBAM()

 ;SetLog($thinfo)
		Setlog("'Ȧġ��'!! MasterGiBAM��� - 1. ��ó", $COLOR_BLUE)
	   AttackTHGrid($eArch,3,3,2000,1,4,0) ; deploys 9 archers

 ;check for one star
local $count = 0
While $count < 35
 If _Sleep(1000) Then Return

 If _ColorCheck(_GetPixelColor($aWonOneStar[0],$aWonOneStar[1], True), Hex($aWonOneStar[2], 6), $aWonOneStar[3]) Then ;exit if 1 star
			SetLog("'����ȸ��'�� �ı��߽��ϴ�!")
	If _Sleep(1500) Then Return ;wait 1.5 seconds... antiban purpose...
	Return ;exit if you get a star
 EndIf
 $count+=1
WEnd
;end check for one star

		Setlog("'Ȧġ��'!! MasterGiBAM��� - 2. ���̾�Ʈ/�ٹٸ���/��ó/�̴Ͼ�", $COLOR_BLUE)
       AttackTHGrid($eGiant,2,1,2500,1,4,0) ; deploys 2 giants as meat shield
;Check for one star
If _ColorCheck(_GetPixelColor($aWonOneStar[0],$aWonOneStar[1], True), Hex($aWonOneStar[2], 6), $aWonOneStar[3]) Then ;exit if 1 star
			SetLog("'����ȸ��'�� �ı��߽��ϴ�!")
If _Sleep(1500) Then Return ;wait 1.5 seconds... antiban purpose...
Return ;exit if you get a star
EndIf
;end check for one star

	   AttackTHGrid($eGole,1,2,1000,2,4,0) ; deploys 2 goelms
;Check for one star
If _ColorCheck(_GetPixelColor($aWonOneStar[0],$aWonOneStar[1], True), Hex($aWonOneStar[2], 6), $aWonOneStar[3]) Then ;exit if 1 star
			SetLog("'����ȸ��'�� �ı��߽��ϴ�!")
If _Sleep(1500) Then Return ;wait 1.5 seconds... antiban purpose...
Return ;exit if you get a star
EndIf
;end check for one star

	   AttackTHGrid($eHogs,5,2,1000,2,4,0) ; deploys 10 hogs
;Check for one star
If _ColorCheck(_GetPixelColor($aWonOneStar[0],$aWonOneStar[1], True), Hex($aWonOneStar[2], 6), $aWonOneStar[3]) Then ;exit if 1 star
			SetLog("'����ȸ��'�� �ı��߽��ϴ�!")
If _Sleep(1500) Then Return ;wait 1.5 seconds... antiban purpose...
Return ;exit if you get a star
EndIf
;end check for one star

       AttackTHGrid($eGiant,5,4,2500,2,4,0) ; deploys 20 giants To Protect PAM pulse
;Check for one star
If _ColorCheck(_GetPixelColor($aWonOneStar[0],$aWonOneStar[1], True), Hex($aWonOneStar[2], 6), $aWonOneStar[3]) Then ;exit if 1 star
			SetLog("'����ȸ��'�� �ı��߽��ϴ�!")
If _Sleep(1500) Then Return ;wait 1.5 seconds... antiban purpose...
Return ;exit if you get a star
EndIf
;end check for one star

       AttackTHGrid($eBarb,5,3,2000,1,4,0) ; deploys 15 barbarians
;Check for one star
If _ColorCheck(_GetPixelColor($aWonOneStar[0],$aWonOneStar[1], True), Hex($aWonOneStar[2], 6), $aWonOneStar[3]) Then ;exit if 1 star
			SetLog("'����ȸ��'�� �ı��߽��ϴ�!")
If _Sleep(1500) Then Return ;wait 1.5 seconds... antiban purpose...
Return ;exit if you get a star
EndIf
;end check for one star

	   AttackTHGrid($eArch,5,4,2000,2,4,0) ; deploys 20 archers

;check for one star
 $count = 0
While $count < 5
 If _Sleep(1000) Then Return

 If _ColorCheck(_GetPixelColor($aWonOneStar[0],$aWonOneStar[1], True), Hex($aWonOneStar[2], 6), $aWonOneStar[3]) Then ;exit if 1 star
			SetLog("'����ȸ��'�� �ı��߽��ϴ�!")
	If _Sleep(1500) Then Return ;wait 1.5 seconds... antiban purpose...
	Return ;exit if you get a star
 EndIf
 $count+=1
WEnd
;end check for one star

	   AttackTHGrid($eBarb,6,5,2000,2,4,0) ; deploys 30 barbarians
;Check for one star
If _ColorCheck(_GetPixelColor($aWonOneStar[0],$aWonOneStar[1], True), Hex($aWonOneStar[2], 6), $aWonOneStar[3]) Then ;exit if 1 star
			SetLog("'����ȸ��'�� �ı��߽��ϴ�!")
If _Sleep(1500) Then Return ;wait 1.5 seconds... antiban purpose...
Return ;exit if you get a star
EndIf
;end check for one star

	   AttackTHGrid($eArch,6,10,2000,3,4,0) ; deploys 60 archers
;Check for one star
If _ColorCheck(_GetPixelColor($aWonOneStar[0],$aWonOneStar[1], True), Hex($aWonOneStar[2], 6), $aWonOneStar[3]) Then ;exit if 1 star
			SetLog("'����ȸ��'�� �ı��߽��ϴ�!")
If _Sleep(1500) Then Return ;wait 1.5 seconds... antiban purpose...
Return ;exit if you get a star
EndIf
;end check for one star

	   AttackTHGrid($eMini,5,2,2000,1,1,1) ; deploys 10 minions with heros


;check for one star
 $count = 0
While $count < 20
 If _Sleep(1000) Then Return

 If _ColorCheck(_GetPixelColor($aWonOneStar[0],$aWonOneStar[1], True), Hex($aWonOneStar[2], 6), $aWonOneStar[3]) Then ;exit if 1 star
			SetLog("'����ȸ��'�� �ı��߽��ϴ�!")
	If _Sleep(1500) Then Return ;wait 1.5 seconds... antiban purpose...
	Return ;exit if you get a star
 EndIf
 $count+=1
WEnd
;end check for one star

		Setlog("'Ȧġ��'!! MasterGiBAM��� - 3. ��� ����", $COLOR_BLUE)

For $i = $eGole To $eLava ; Deploy Remaining troops
 AttackTHGrid($i,5,2,2000,0,4,0)
Next

;Check for one star
If _ColorCheck(_GetPixelColor($aWonOneStar[0],$aWonOneStar[1], True), Hex($aWonOneStar[2], 6), $aWonOneStar[3]) Then ;exit if 1 star
			SetLog("'����ȸ��'�� �ı��߽��ϴ�!")
If _Sleep(1500) Then Return ;wait 1.5 seconds... antiban purpose...
Return ;exit if you get a star
EndIf
;end check for one star

For $i = $eGiant To $eValk ; Deploy Remaining troops
 AttackTHGrid($i,6,5,2000,0,4,0)
Next

;Check for one star
If _ColorCheck(_GetPixelColor($aWonOneStar[0],$aWonOneStar[1], True), Hex($aWonOneStar[2], 6), $aWonOneStar[3]) Then ;exit if 1 star
			SetLog("'����ȸ��'�� �ı��߽��ϴ�!")
If _Sleep(1500) Then Return ;wait 1.5 seconds... antiban purpose...
Return ;exit if you get a star
EndIf
;end check for one star

For $i = $eBarb To $eArch ; Deploy Remaining Barb,archers
 AttackTHGrid($i,5,15,2000,0,4,0)
Next

;Check for one star
If _ColorCheck(_GetPixelColor($aWonOneStar[0],$aWonOneStar[1], True), Hex($aWonOneStar[2], 6), $aWonOneStar[3]) Then ;exit if 1 star
			SetLog("'����ȸ��'�� �ı��߽��ϴ�!")
If _Sleep(1500) Then Return ;wait 1.5 seconds... antiban purpose...
Return ;exit if you get a star
EndIf
;end check for one star

If _Sleep(100) Then Return
		SetLog("~ ��� ������ ������ ���ԵǾ����ϴ�. ������ ��ĥ������ ����մϴ�.", $COLOR_GREEN)

EndFunc