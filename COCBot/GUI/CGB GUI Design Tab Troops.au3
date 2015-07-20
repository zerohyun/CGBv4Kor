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
;~ Troops Tab
;~ -------------------------------------------------------------
$tabTroops = GUICtrlCreateTabItem("�����Ʒ�")
	Local $x = 30, $y = 150
	$grpTroopComp = GUICtrlCreateGroup("���� ����", $x - 20, $y - 20, 222, 55)
		$cmbTroopComp = GUICtrlCreateCombo("", $x - 5, $y, 190, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			GUICtrlSetTip(-1, "�Ʒ� ������ �����մϴ�." & @CRLF & "'�ƷüҺ�����' �Ǵ� '����ڼ���'���� ���� ���� �� �� �ֽ��ϴ�." & @CRLF & "'Preset'�� ������ ���ֺ����� �ڵ� �Ʒ��մϴ�" & @CRLF & "B(�ٹٸ���)/A(��ó)/G.G(���̾�Ʈ,���)/Wall(�ذ񵹰ݺ�)")
			GUICtrlSetOnEvent(-1, "cmbTroopComp")
			GUICtrlSetData(-1, "Preset: Archers|Preset: Barbarians|Preset: Goblins|Preset: B.Arch|Preset: B.A.G.G.|Preset: B.A.Giant|Preset: B.A.Goblin|Preset: B.A.G.G.Wall|�ƷüҺ�����|����ڼ���", "����ڼ���")
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	$x += 227
	$grpBarrackMode = GUICtrlCreateGroup("�ƷüҺ�����", $x - 20, $y -20, 223, 75)
		$lblBarrack1 = GUICtrlCreateLabel("1:", $x - 5, $y + 5, -1, -1)
		$cmbBarrack1 = GUICtrlCreateCombo("", $x + 10, $y, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			GUICtrlSetTip(-1, "1�� �Ʒüҿ��� ������ ������ �����մϴ�.")
			GUICtrlSetData(-1, "�ٹٸ���|��ó|���̾�Ʈ|���|�ذ񵹰ݺ�|�ذ���༱|������|ġ����|�巡��|��ī", "�ٹٸ���") ; "Barbarians|Archers|Giants|Goblins|WallBreakers|Balloons|Wizards|Healers|Dragons|Pekkas"
			GUICtrlSetState(-1, $GUI_DISABLE)
		$y += 2
		$lblBarrack2 = GUICtrlCreateLabel("2:", $x - 5, $y + 26, -1, -1)
		$cmbBarrack2 = GUICtrlCreateCombo("", $x + 10, $y + 21, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			GUICtrlSetTip(-1, "2�� �Ʒüҿ��� ������ ������ �����մϴ�.")
			GUICtrlSetData(-1, "�ٹٸ���|��ó|���̾�Ʈ|���|�ذ񵹰ݺ�|�ذ���༱|������|ġ����|�巡��|��ī", "��ó") ; "Barbarians|Archers|Giants|Goblins|WallBreakers|Balloons|Wizards|Healers|Dragons|Pekkas"
			GUICtrlSetState(-1, $GUI_DISABLE)
		$y -= 2
		$lblBarrack3 = GUICtrlCreateLabel("3:", $x + 100, $y + 5, -1, -1)
		$cmbBarrack3 = GUICtrlCreateCombo("", $x + 115, $y, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			GUICtrlSetTip(-1, "3�� �Ʒüҿ��� ������ ������ �����մϴ�.")
			GUICtrlSetData(-1, "�ٹٸ���|��ó|���̾�Ʈ|���|�ذ񵹰ݺ�|�ذ���༱|������|ġ����|�巡��|��ī", "��ó") ; "Barbarians|Archers|Giants|Goblins|WallBreakers|Balloons|Wizards|Healers|Dragons|Pekkas"
			GUICtrlSetState(-1, $GUI_DISABLE)
		$y += 2
		$lblBarrack4 = GUICtrlCreateLabel("4:", $x + 100, $y + 26, -1, -1)
		$cmbBarrack4 = GUICtrlCreateCombo("", $x + 115, $y + 21, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			GUICtrlSetTip(-1, "4�� �Ʒüҿ��� ������ ������ �����մϴ�.")
			GUICtrlSetData(-1, "�ٹٸ���|��ó|���̾�Ʈ|���|�ذ񵹰ݺ�|�ذ���༱|������|ġ����|�巡��|��ī", "���") ; "Barbarians|Archers|Giants|Goblins|WallBreakers|Balloons|Wizards|Healers|Dragons|Pekkas"
			GUICtrlSetState(-1, $GUI_DISABLE)
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	$y = 230
	$grpBoosterOptions = GUICtrlCreateGroup("���� �ɼ�", $x - 20, $y - 20, 223, 95)
	$y -= 5
		GUICtrlCreateIcon ($pIconLib, $eIcnTroops, $x, $y + 2, 16, 16)
	$lblFullTroop = GUICtrlCreateLabel("����/�����ο� �� :",$x + 25, $y + 5, -1, 17)
	$txtFullTroop = GUICtrlCreateInput("100",  $x + 150, $y, 35, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
		GUICtrlSetTip(-1, "'���ռ� �� �����ο� ��'�� �������� �ش� �ۼ�Ʈ��ŭ '�Ʒü� �ο���'�� ���ԵǸ� ������ �����մϴ�." & @CRLF & "'���ռ� �� ���� �ο� ��'�� 200�� �� '90'���� ������ 180(200*0.9)���� �ƷõǸ� ������ �����մϴ�")
		GUICtrlSetLimit(-1, 3)
	$lblFullTroop = GUICtrlCreateLabel("%",$x + 188, $y + 5, -1, 17)
	$y += 25
		GUICtrlCreateIcon ($pIconLib, $eIcnBarrackBoost, $x, $y + 2, 16, 16)
	$lblBoostBarracks = GUICtrlCreateLabel("�ƷüҰ���(ȸ):", $x + 25, $y + 5, -1, -1)
		$txtTip = "���!!! �� ����� ����ϸ� ������ ����Ͽ� ������ Ƚ����ŭ �ƷüҸ� ���ӽ�ŵ�ϴ�."
		GUICtrlSetTip(-1, $txtTip)
	$cmbBoostBarracks = GUICtrlCreateCombo("", $x + 150, $y, 35, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
		GUICtrlSetData(-1, "0|1|2|3|4|5", "0")
		GUICtrlSetTip(-1, $txtTip)
	$y += 25
	GUICtrlCreateIcon ($pIconLib, $eIcnSpellFactoryBoost, $x, $y + 2, 16, 16)
	$lblBoostSpellFactory = GUICtrlCreateLabel("�������ۼҰ���(ȸ):", $x + 25, $y + 5, -1, -1)
		$txtTip = "���!!! �� ����� ����ϸ� ������ ����Ͽ� ������ Ƚ����ŭ �������ۼҸ� ���ӽ�ŵ�ϴ�."
		GUICtrlSetTip(-1, $txtTip)
	$cmbBoostSpellFactory = GUICtrlCreateCombo("", $x + 150, $y, 35, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
		GUICtrlSetData(-1, "0|1|2|3|4|5", "0")
		GUICtrlSetTip(-1, $txtTip)
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	Local $x = 30, $y = 210
	$grpTroops = GUICtrlCreateGroup("����ڼ���(�⺻)", $x - 20, $y - 20, 222, 115)
		$y +=5
		GUICtrlCreateIcon ($pIconLib, $eIcnBarbarian, $x - 5, $y - 5, 24, 24)
		$lblBarbarians = GUICtrlCreateLabel("�ٹٸ��� :", $x + 25, $y, -1, -1)
		$txtNumBarb = GUICtrlCreateInput("30", $x + 130, $y - 5, 55, -1, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			GUICtrlSetTip(-1, "������ ������ŭ �ٹٸ����� �����մϴ�." & @CRLF & "'������'*'���ռ� �� �����ο�'/100")
			GUICtrlSetLimit(-1, 3)
			GUICtrlSetOnEvent(-1, "lblTotalCount")
		$lblPercentBarbarians = GUICtrlCreateLabel("%", $x + 188, $y, -1, -1)
		$y += 25
		GUICtrlCreateIcon ($pIconLib, $eIcnArcher, $x - 5, $y - 5, 24, 24)
		$lblArchers = GUICtrlCreateLabel("��ó :", $x + 25, $y, -1, -1)
		$txtNumArch = GUICtrlCreateInput("60", $x + 130, $y - 5, 55, -1, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			GUICtrlSetTip(-1, "������ ������ŭ ��ó�� �����մϴ�." & @CRLF & "'������'*'���ռ� �� �����ο�'/100")
			GUICtrlSetLimit(-1, 3)
			GUICtrlSetOnEvent(-1, "lblTotalCount")
		$lblPercentArchers = GUICtrlCreateLabel("%", $x + 188, $y, -1, -1)
		$y += 25
		GUICtrlCreateIcon ($pIconLib, $eIcnGoblin, $x - 5, $y - 5, 24, 24)
		$lblGoblins = GUICtrlCreateLabel("��� :", $x + 25, $y, -1, -1)
		$txtNumGobl = GUICtrlCreateInput("10", $x + 130, $y - 5, 55, -1, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			GUICtrlSetTip(-1, "������ ������ŭ ����� �����մϴ�." & @CRLF & "'������'*'���ռ� �� �����ο�'/100")
			GUICtrlSetLimit(-1, 3)
			GUICtrlSetOnEvent(-1, "lblTotalCount")
		$lblPercentGoblins = GUICtrlCreateLabel("%", $x + 188, $y, -1, -1)
		$y += 25
		$lblTotal = GUICtrlCreateLabel("Total :", $x + 85, $y - 4, -1, -1, $SS_RIGHT)
		$lblTotalCount = GUICtrlCreateLabel("100", $x + 130, $y - 5, 55, 15, $SS_CENTER)
			GUICtrlSetBkColor (-1, $COLOR_MONEYGREEN) ;lime, moneygreen
		$lblPercentTotal = GUICtrlCreateLabel("%", $x + 188, $y - 5, -1, -1)
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	Local $x = 30, $y = 330
	$grpOtherTroops = GUICtrlCreateGroup("����ڼ���(�߰�)", $x - 20, $y - 20, 222, 195)
		GUICtrlCreateIcon ($pIconLib, $eIcnGiant, $x - 5, $y - 5, 24, 24)
		$lblGiants = GUICtrlCreateLabel("���̾�Ʈ �Ʒ� :", $x + 25, $y, -1, -1)
		$txtNumGiant = GUICtrlCreateInput("4", $x + 130, $y - 5, 55, -1, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER))
			GUICtrlSetTip(-1, "�Ʒý�ų �ο����� �Է��ϼ���.")
			GUICtrlSetLimit(-1, 2)
		$y +=25
		GUICtrlCreateIcon ($pIconLib, $eIcnWallBreaker, $x - 5, $y - 5, 24, 24)
		$lblWallBreakers = GUICtrlCreateLabel("�ذ񵹰ݺ� �Ʒ� :", $x + 25, $y, -1, -1)
		$txtNumWall = GUICtrlCreateInput("4", $x + 130, $y - 5, 55, -1, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER))
			GUICtrlSetTip(-1, "Enter the No. of Wall Breakers to make.")
			GUICtrlSetLimit(-1, 3)
		$y +=25
		GUICtrlCreateIcon ($pIconLib, $eIcnBalloon, $x - 5, $y - 5, 24, 24)
		$lblBalloons = GUICtrlCreateLabel("�ذ���༱ �Ʒ� :", $x + 25, $y, -1, -1)
		$txtNumBall = GUICtrlCreateInput("0", $x + 130, $y - 5, 55, -1, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER))
			GUICtrlSetTip(-1, "�Ʒý�ų �ο����� �Է��ϼ���.")
			GUICtrlSetLimit(-1, 3)
		$y +=25
		GUICtrlCreateIcon ($pIconLib, $eIcnWizard, $x - 5, $y - 5, 24, 24)
		$lblWizards = GUICtrlCreateLabel("������ �Ʒ� :", $x + 25, $y, -1, -1)
		$txtNumWiza = GUICtrlCreateInput("0", $x + 130, $y - 5, 55, -1, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER))
			GUICtrlSetTip(-1, "�Ʒý�ų �ο����� �Է��ϼ���.")
			GUICtrlSetLimit(-1, 3)
		$y +=25
		GUICtrlCreateIcon ($pIconLib, $eIcnHealer, $x - 5, $y - 5, 24, 24)
		$lblHealers = GUICtrlCreateLabel("ġ���� �Ʒ� :", $x + 25, $y, -1, -1)
		$txtNumHeal = GUICtrlCreateInput("0", $x + 130, $y - 5, 55, -1, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER))
			GUICtrlSetTip(-1, "�Ʒý�ų �ο����� �Է��ϼ���.")
			GUICtrlSetLimit(-1, 3)
		$y +=25
		GUICtrlCreateIcon ($pIconLib, $eIcnDragon, $x - 5, $y - 5, 24, 24)
		$lblDragons = GUICtrlCreateLabel("�巡�� �Ʒ� :", $x + 25, $y, -1, -1)
		$txtNumDrag = GUICtrlCreateInput("0", $x + 130, $y - 5, 55, -1, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER))
			GUICtrlSetTip(-1, "�Ʒý�ų �ο����� �Է��ϼ���.")
			GUICtrlSetLimit(-1, 3)
		$y +=25
		GUICtrlCreateIcon ($pIconLib, $eIcnPekka, $x - 5, $y - 5, 24, 24)
		$lblPekka = GUICtrlCreateLabel("P.E.K.K.A. �Ʒ� :", $x + 25, $y, -1, -1)
		$txtNumPekk = GUICtrlCreateInput("0", $x + 130, $y - 5, 55, -1, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER))
			GUICtrlSetTip(-1, "�Ʒý�ų �ο����� �Է��ϼ���.")
			GUICtrlSetLimit(-1, 3)
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	$x +=  227
	$y = 330
	$grpDarkTroops = GUICtrlCreateGroup("����ڼ���(�����Ʒü�)", $x - 20, $y - 20, 223, 195)
		GUICtrlCreateIcon ($pIconLib, $eIcnMinion, $x - 5, $y - 5, 24, 24)
		$lblMinion = GUICtrlCreateLabel("�̴Ͼ� �Ʒ�:", $x + 25, $y, -1, -1)
		$txtNumMini = GUICtrlCreateInput("0", $x + 130, $y - 5, 55, -1, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER))
			GUICtrlSetTip(-1, "�Ʒý�ų �ο����� �Է��ϼ���.")
			GUICtrlSetLimit(-1, 3)
		$y +=25
		GUICtrlCreateIcon ($pIconLib, $eIcnHogRider, $x - 5, $y - 5, 24, 24)
		$lblHogRiders = GUICtrlCreateLabel("ȣ�׶��̴� �Ʒ� :", $x + 25, $y, -1, -1)
		$txtNumHogs = GUICtrlCreateInput("0", $x + 130, $y - 5, 55, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER))
			GUICtrlSetTip(-1, "�Ʒý�ų �ο����� �Է��ϼ���.")
			GUICtrlSetLimit(-1, 2)
		$y +=25
		GUICtrlCreateIcon ($pIconLib, $eIcnValkyrie, $x - 5, $y - 5, 24, 24)
		$lblValkyries = GUICtrlCreateLabel("��Ű�� �Ʒ� :", $x + 25, $y, -1, -1)
		$txtNumValk = GUICtrlCreateInput("0", $x + 130, $y - 5, 55, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER))
			GUICtrlSetTip(-1, "�Ʒý�ų �ο����� �Է��ϼ���.")
			GUICtrlSetLimit(-1, 2)
		$y +=25
		GUICtrlCreateIcon ($pIconLib, $eIcnGolem, $x - 5, $y - 5, 24, 24)
		$lblGolems = GUICtrlCreateLabel("�� �Ʒ� :", $x + 25, $y, -1, -1)
		$txtNumGole = GUICtrlCreateInput("0", $x + 130, $y - 5, 55, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER))
			GUICtrlSetTip(-1, "�Ʒý�ų �ο����� �Է��ϼ���.")
			GUICtrlSetLimit(-1, 2)
		$y +=25
		GUICtrlCreateIcon ($pIconLib, $eIcnWitch, $x - 5, $y - 5, 24, 24)
		$lblWitches = GUICtrlCreateLabel("���� �Ʒ�:", $x + 25, $y, -1, -1)
		$txtNumWitc = GUICtrlCreateInput("0", $x + 130, $y - 5, 55, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER))
			GUICtrlSetTip(-1, "�Ʒý�ų �ο����� �Է��ϼ���.")
			GUICtrlSetLimit(-1, 2)
		$y +=25
		GUICtrlCreateIcon ($pIconLib, $eIcnLavaHound, $x - 5, $y - 5, 24, 24)
		$lblLavaHounds = GUICtrlCreateLabel("����Ͽ�� �Ʒ� :", $x + 25, $y, -1, -1)
		$txtNumLava = GUICtrlCreateInput("0", $x + 130, $y - 5, 55, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER))
			GUICtrlSetTip(-1, "�Ʒý�ų �ο����� �Է��ϼ���.")
			GUICtrlSetLimit(-1, 2)

	GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateTabItem("")
