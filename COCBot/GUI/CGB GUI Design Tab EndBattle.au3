; #FUNCTION# ====================================================================================================================
; Name ..........: CGB GUI Design
; Description ...: This file Includes GUI Design
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: GKevinOD (2014)
; Modified ......: DkEd, Hervidero (2015)
; Remarks .......: This file is part of ClashGameBot. Copyright 2015
;                  ClashGameBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........:
; Example .......: No
; ===============================================================================================================================

;~ -------------------------------------------------------------
;~ End Battle
;~ -------------------------------------------------------------
$tabEndBattle = GUICtrlCreateTabItem("��������")
   Local $x = 30, $y = 150
	$grpBattleOptions = GUICtrlCreateGroup("��������", $x - 20, $y - 20, 450, 170)
		$chkTimeStopAtk = GUICtrlCreateCheckbox("��Ż�� �ڿ��� ���ҵ��� ������ :",$x, $y, -1, -1)
			$txtTip = "������ �ð����� ��Ż�� �ڿ��� ���̻� ���ҵ��� ������ ������ �����մϴ�." & @CRLF & "��� ������ ���Եǰ��� ī��Ʈ�� �����ϰ�, ��ȭ�� �����Ǹ� �ٽ� ī��Ʈ �մϴ�. "
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkTimeStopAtk")
			GUICtrlSetState(-1, $GUI_CHECKED)
		$txtTimeStopAtk = GUICtrlCreateInput("20", $x + 197, $y + 1, 30, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			;GUICtrlSetData(-1, 10) ; default value
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 2)
		$lblTimeStopAtk = GUICtrlCreateLabel("�� �� ����", $x + 230, $y + 3, -1, -1)
   $y += 25
		$chkTimeStopAtk2 = GUICtrlCreateCheckbox("��Ż�� �ڿ��� ������ �����϶� :",$x, $y, -1, -1)
			$txtTip = "������ �ð����� ��Ż�� �ڿ��� ���̻� ���ҵ��� ������ ������ �����մϴ�." & @CRLF & "��� ������ ���Եǰ��� ī��Ʈ�� �����ϰ�, ��ȭ�� �����Ǹ� �ٽ� ī��Ʈ �մϴ�. "
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkTimeStopAtk2")
			GUICtrlSetState(-1, $GUI_UNCHECKED)
		$txtTimeStopAtk2 = GUICtrlCreateInput("5", $x + 197, $y + 1, 30, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 2)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$lblTimeStopAtk2 = GUICtrlCreateLabel("�� �� ����", $x + 230, $y + 3, -1, -1)
	$y += 23
		$lblMinRerourcesAtk2 = GUICtrlCreateLabel("��Ż�����ڿ� :", $x + 40 , $y + 4, -1, -1)
		$lblMinGoldStopAtk2 = GUICtrlCreateLabel("", $x + 150 , $y + 2, -1, -1)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$txtMinGoldStopAtk2 = GUICtrlCreateInput("2000", $x + 130, $y , 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "'���'�� �� �����϶� ������ �ð� ���� ������ �����մϴ�."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 6)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$picMinGoldStopAtk2 = GUICtrlCreateIcon($pIconLib, $eIcnGold, $x + 182, $y, 16, 16)
			GUICtrlSetTip(-1, $txtTip)

		$lblMinElixirStopAtk2 = GUICtrlCreateLabel(", ", $x + 205, $y + 2, -1, -1)
			$txtTip = "'������'�� �� �����϶� ������ �ð� ���� ������ �����մϴ�."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$txtMinElixirStopAtk2 = GUICtrlCreateInput("2000", $x + 215, $y , 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 6)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$picMinElixirStopAtk2 = GUICtrlCreateIcon($pIconLib, $eIcnElixir, $x + 267, $y, 16, 16)
			GUICtrlSetTip(-1, $txtTip)

		$lblMinDarkElixirStopAtk2 = GUICtrlCreateLabel("�׸���", $x +290 , $y +4, -1, -1)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$txtMinDarkElixirStopAtk2 = GUICtrlCreateInput("50", $x + 330, $y , 40, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "'��ũ������'�� �� �����϶� ������ �ð� ���� ������ �����մϴ�."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 5)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$picMinDarkElixirStopAtk2 = GUICtrlCreateIcon($pIconLib, $eIcnDark, $x + 372, $y, 16, 16)
			GUICtrlSetTip(-1, $txtTip)
	$y += 20
		$chkEndNoResources = GUICtrlCreateCheckbox("��Ż�� �ڿ��� ����", $x , $y , -1, -1)
			$txtTip = "��Ż ������ �ڿ��� ��� ȹ���Ͽ� ���̻� ��Ż�� �ڿ��� ������ ������ �����մϴ�."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_ENABLE)
	$y += 30
		$chkEndOneStar = GUICtrlCreateCheckbox("�� �ϳ��� ������� :", $x, $y , -1, -1)
			$txtTip = "�������� '��' �ϳ��� ��� �¸��� Ȯ���� ���� ������ �����մϴ�."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_ENABLE)
		$picEndOneStar = GUICtrlCreateIcon($pIconLib, $eIcnSilverStar, $x + 135, $y, 16, 16)
			GUICtrlSetTip(-1, $txtTip)
	$y += 20
		$chkEndTwoStars = GUICtrlCreateCheckbox("�� �ΰ��� ������� :", $x, $y, -1, -1)
			$txtTip = "�������� '��' �ΰ��� ��ԵǸ� ������ �����մϴ�."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_ENABLE)
		$picEndTwoStar = GUICtrlCreateIcon($pIconLib, $eIcnSilverStar, $x + 135, $y, 16, 16)
		$picEndTwoStar2 = GUICtrlCreateIcon($pIconLib, $eIcnSilverStar, $x + 152, $y, 16, 16)
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	Local $x = 30, $y = 325
	$grpLootSnapshot = GUICtrlCreateGroup("��Ż��Ȳ����", $x - 20, $y - 20, 450, 50)
		$chkTakeLootSS = GUICtrlCreateCheckbox("��Ż��Ȳ����", $x, $y, -1, -1)
			GUICtrlSetTip(-1, "��Ż��Ȳ�� ĸ���Ͽ� �����մϴ�.")
			GUICtrlSetState(-1, $GUI_CHECKED)
		$chkScreenshotLootInfo = GUICtrlCreateCheckbox("��Ż�����߰�", $x + 200 , $y , -1, -1)
			GUICtrlSetTip(-1, "���ϸ� ��Ż������ �߰��մϴ�.")
	GUICtrlCreateGroup("", -99, -99, 1, 1)

Local $x = 30, $y = 380
	$grpResources = GUICtrlCreateGroup("�����������", $x - 20, $y - 20, 450, 145)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$chkShareAttack = GUICtrlCreateCheckbox("���� ���� ���", $x, $y, -1, -1)
			$TxtTip = "Ŭ��ä��â�� ���Ͽ� ���� ������ �����մϴ�."
			GUICtrlSetTip(-1, $TxtTip)
			GUICtrlSetOnEvent(-1, "chkShareAttack")
		$x = 120
		$y += 30
		$lblShareMinGold = GUICtrlCreateLabel("��Ż�� �ڿ� : ", $x - 80 , $y, -1, -1)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$txtShareMinGold = GUICtrlCreateInput("300000", $x + 5 , $y - 2, 60, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "ȹ���� '���'���� �� �̻��� �� ������ �����մϴ�."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 6)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$picShareLootGold = GUICtrlCreateIcon($pIconLib, $eIcnGold, $x + 67, $y, 16, 16)
		$y += 22
		$lblShareMinElixir = GUICtrlCreateLabel("", $x, $y, -1, -1)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$txtShareMinElixir = GUICtrlCreateInput("300000", $x + 5, $y - 2, 60, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "ȹ���� '������'���� �� �̻��� �� ������ �����մϴ�."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 6)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$picShareLootElixir = GUICtrlCreateIcon($pIconLib, $eIcnElixir, $x + 67, $y, 16, 16)
		$y += 22
		$lblShareMinDark = GUICtrlCreateLabel("", $x, $y, -1, -1)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$txtShareMinDark = GUICtrlCreateInput("0", $x + 5, $y - 2, 60, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "ȹ���� '��ũ������'���� �� �̻��� �� ������ �����մϴ�."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 5)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$picShareLootDarkElixir = GUICtrlCreateIcon($pIconLib, $eIcnDark, $x + 67, $y, 16, 16)
	Local $x = 240, $y = 380
		$lblShareMessage = GUICtrlCreateLabel("���� �޼��� ���� :", $x , $y -2 , -1, -1)
			GUICtrlSetState(-1, $GUI_DISABLE)
	    $y += 27
		$txtShareMessage = GUICtrlCreateEdit("", $x, $y - 10 , 205, 80, BitOR($ES_WANTRETURN, $ES_CENTER, $ES_AUTOVSCROLL))
			GUICtrlSetData(-1, StringFormat("Nice\r\nGood\r\nThanks\r\nWowwww"))
			GUICtrlSetState(-1, $GUI_DISABLE)
			GUICtrlSetTip(-1, "������ �����Ҷ� �� �޼����� ����Ͽ� �����մϴ�.")
	    $y += 73
	GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateTabItem("")
