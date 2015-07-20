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
; Misc Tab
;~ -------------------------------------------------------------
$tabMisc = GUICtrlCreateTabItem("��Ÿ����")
Local $x = 30, $y = 150
	$grpControls = GUICtrlCreateGroup("��������", $x - 20, $y - 20, 450, 50)
		$chkBotStop = GUICtrlCreateCheckbox("", $x - 5, $y, 16, 16)
			$txtTip = "������ �����ϰ� ���� �� �� �ɼ��� ����ϼ���" & @CRLF & "&(�׸���)" & @CRLF & "/(�Ǵ�)" & @CRLF & "F.(������)" & @CRLF & "M.(�ִ�ġ)"
			GUICtrlSetTip(-1, $txtTip)
		$cmbBotCommand = GUICtrlCreateCombo("", $x + 20, $y - 3, 90, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetData(-1, "��������|PC����|�������", "��������")
			$lblBotCond = GUICtrlCreateLabel("When...", $x + 125, $y, 45, 17)
		$cmbBotCond = GUICtrlCreateCombo("", $x + 175, $y - 3, 160, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetData(-1, "F.��� & F.���� & M.Ʈ����|F.��� & F.���� / M.Ʈ����|(F.��� / F.����) & M.Ʈ����|F.��� / F.���� / M.Ʈ����|F.��� & F.����|F.��� / F.����|F.��� & M.Ʈ����|F.���� & M.Ʈ����|F.��� / M.Ʈ����|F.���� / M.Ʈ����|F.���|F.����|M.Ʈ����|�����ð���|�����Ʒ�/Ŭ��������|Ŭ��������|�¶�������", "�����Ʒ�/Ŭ��������")
			GUICtrlSetOnEvent(-1, "cmbBotCond")
		$cmbHoursStop = GUICtrlCreateCombo("", $x + 335, $y - 3, 80, 35, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetData(-1, "-|1 Hour|2 Hours|3 Hours|4 Hours|5 Hours|6 Hours|7 Hours|8 Hours|9 Hours|10 Hours|11 Hours|12 Hours|13 Hours|14 Hours|15 Hours|16 Hours|17 Hours|18 Hours|19 Hours|20 Hours|21 Hours|22 Hours|23 Hours|24 Hours", "-")
			GUICtrlSetState (-1, $GUI_DISABLE)
	GUICtrlCreateGroup("", -99, -99, 1, 1)

Local $x = 30, $y = 205
	$grpControls = GUICtrlCreateGroup("������", $x - 20, $y - 20, 450, 65)
		$lblProfile = GUICtrlCreateLabel("���������� :", $x, $y, -1, -1)
		$cmbProfile = GUICtrlCreateCombo("01", $x + 75, $y - 5, 40, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
		$txtTip = "���� �ٸ� �������� ���� �������� ��ȯ�Ͽ� ����� �� �ֽ��ϴ�. �⺻����: 01" & @CRLF & "������/�������� ���丮 :" & @CRLF &  $sProfilePath
		GUICtrlSetTip(-1, $txtTip)
		GUICtrlSetData(-1, "02|03|04|05|06", "01")
		GUICtrlSetOnEvent(-1, "cmbProfile")
		$txtVillageName = GUICtrlCreateInput("MyVillage", $x + 120, $y - 4, 90, 18, BitOR($SS_CENTER, $ES_AUTOHSCROLL))
		GUICtrlSetLimit (-1, 20, 0)
		GUICtrlSetFont(-1, 9, 800, 1)
		GUICtrlSetTip(-1, "�����̸��� �Է��ϼ���.")
		GUICtrlSetOnEvent(-1, "txtVillageName")
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	Local $x = 30, $y = 275
	$grpMisc = GUICtrlCreateGroup("�缳ġ/�ڿ�����/������", $x -20, $y - 20 , 225, 100)
	;$grpTraps = GUICtrlCreateGroup("Traps, X-bows && Infernos", $x -20, $y - 20 , 225, 55)
		GUICtrlCreateIcon($pIconLib, $eIcnTrap, $x - 5, $y, 24, 24)
		GUICtrlCreateIcon($pIconLib, $eIcnXbow, $x + 20, $y, 24, 24)
		GUICtrlCreateIcon($pIconLib, $eIcnInferno, $x + 45, $y, 24, 24)
		$chkTrap = GUICtrlCreateCheckbox("�缳ġ/������", $x + 75, $y + 2, -1, -1)
			GUICtrlSetTip(-1, "������ �ִ� ��� ������ �缳ġ�ϰ�, ���� ���������̳� ���丣�� Ÿ���� �ִٸ� �������մϴ�.")
			GUICtrlSetOnEvent(-1, "chkTrap")
			_ArrayConcatenate($G, $D)
	;GUICtrlCreateGroup("", -99, -99, 1, 1)
	$y += 25
	;Local $x = 30, $y = 335
	;$grpCollect = GUICtrlCreateGroup("Collecting Resources", $x - 20, $y - 20 , 225, 60)
		GUICtrlCreateIcon($pIconLib, $eIcnMine, $x - 5, $y, 24, 24)
		GUICtrlCreateIcon($pIconLib, $eIcnCollector, $x + 20, $y, 24, 24)
		GUICtrlCreateIcon($pIconLib, $eIcnDrill, $x + 45, $y, 24, 24)
		$chkCollect = GUICtrlCreateCheckbox("�ڿ�����", $x + 75, $y + 2, -1, -1)
			$txtTip = "�ݱ�, ������������, ��ũ�����������ҿ��� �ڿ��� �����մϴ�."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_CHECKED)
	;GUICtrlCreateGroup("", -99, -99, 1, 1)
	$y += 25
	;Local $x = 30, $y = 400
	;$grpTombstones = GUICtrlCreateGroup("Clear Tombstones", $x - 20, $y - 20 , 225, 55)
		GUICtrlCreateIcon($pIconLib, $eIcnTombstone, $x + 20, $y, 24, 24)
		$chkTombstones = GUICtrlCreateCheckbox("������", $x + 75, $y + 2, -1, -1)
			$txtTip = "������ �������� ������ ���� �����մϴ�."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_UNCHECKED)
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	Local $x = 30, $y = 380
	$grpRestartMins = GUICtrlCreateGroup("�ڵ������", $x - 20, $y - 20 , 225, 75)
		$lblRestartMins = GUICtrlCreateLabel("�ڿ��������� ������, ����������� �ڿ��ּҰ�����", $x, $y, 100, 50, $BS_MULTILINE)
		$y -= 4
		$x +=105
		;$lblRestartGold = GUICtrlCreateLabel(">", $x + 112, $y, -1, -1)
		GUICtrlCreateIcon ($pIconLib, $eIcnGold, $x, $y - 5, 16, 16)
		$txtRestartGold = GUICtrlCreateInput("10000", $x + 20, $y - 5, 75, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "'���'�� �����Ͽ� �ߴܵ� ��� �ٽ� �����ϱ� ���� '���' �ּҰ�"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 7)
		$y += 20
		;$lblRestartElixir = GUICtrlCreateLabel(">", $x + 112, $y, -1, -1)
		GUICtrlCreateIcon ($pIconLib, $eIcnElixir, $x, $y - 5, 16, 16)
		$txtRestartElixir = GUICtrlCreateInput("25000", $x + 20, $y - 5, 75, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "'������'�� �����Ͽ� �ߴܵ� ��� �ٽ� �����ϱ� ���� '������' �ּҰ�"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 7)
		$y += 20
		;$lblRestartDark = GUICtrlCreateLabel(">", $x + 112, $y, -1, -1)
		GUICtrlCreateIcon ($pIconLib, $eIcnDark, $x, $y - 5, 16, 16)
		$txtRestartDark = GUICtrlCreateInput("500", $x + 20, $y - 5, 75, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "'��ũ������'�� �����Ͽ� �ߴܵ� ��� �ٽ� �����ϱ� ���� '��ũ������' �ּҰ�"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 6)
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	Local $x = 260, $y = 275
	$grpTrophy = GUICtrlCreateGroup("Ʈ���� ���� ����", $x - 20, $y - 20, 220, 65)
		GUICtrlCreateIcon($pIconLib, $eIcnTrophy, $x - 10, $y + 5, 24, 24)
		$lblTrophyRange = GUICtrlCreateLabel("Ʈ���� ���� :", $x + 20, $y, -1, -1)
		$txtdropTrophy = GUICtrlCreateInput("3000", $x + 110, $y - 5, 35, -1, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "�ּҰ� : �� ������ ���� ���� ���������� Ʈ���Ǹ� ����ϴ�."
			GUICtrlSetLimit(-1, 4)
			GUICtrlSetTip(-1, $txtTip)
		$lblDash = GUICtrlCreateLabel(" - ", $x + 146, $y, -1, -1)
		$txtMaxTrophy = GUICtrlCreateInput("3000", $x + 160, $y - 5, 35, -1, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "�ִ밪: �� ������ ū ���� ��� �Ǹ� �ڵ����� Ʈ���Ǹ� ���߱� �����մϴ�."
			GUICtrlSetLimit(-1, 4)
			GUICtrlSetTip(-1, $txtTip)
		$chkTrophyHeroes = GUICtrlCreateCheckbox("���� ���", $x + 20, $y + 20, -1, -1)
			$txtTip = "��밡���� ������ �ִٸ� ������ ����Ͽ� Ʈ���Ǹ� ����ϴ�."
			GUICtrlSetTip(-1, $txtTip)
		$chkTrophyAtkDead = GUICtrlCreateCheckbox("Atk DB", $x + 100, $y + 20, -1, -1)
			$txtTip = "Ʈ���Ǹ� ���߰� ������(���ʰ˻���) Dead base�� ������ �����մϴ�."
			GUICtrlSetTip(-1, $txtTip)
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	Local $x = 260, $y = 345
	$grpTimeWakeUp = GUICtrlCreateGroup("������ ����", $x - 20, $y - 20 , 220, 50)
		$lblTimeWakeUp = GUICtrlCreateLabel("�ٸ�������ӽ� ������ :", $x - 10, $y + 2, -1, -1)
		$txtTip = "�ٸ���⿡�� �������� ��� ������ �ð�(��) �Ŀ� �������� �մϴ�."
			GUICtrlSetTip(-1, $txtTip)
		$txtTimeWakeUp = GUICtrlCreateInput("120", $x + 128, $y - 1, 35, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 3)
		$lblTimeWakeUpSec = GUICtrlCreateLabel("�� ��", $x + 165, $y + 2, -1, -1)
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	Local $x = 260, $y = 400
	$grpVSDelay = GUICtrlCreateGroup("�˻�����", $x - 20, $y - 20, 220, 55)
		$txtTip = "���ݸ����� �˻��Ҷ� ���� ��ư�� ������ ������ ����� �ð��� ���մϴ�." & @CRLF & "����ȭ������ ���ٸ� �ð��� �÷��ּ���." & @CRLF & "�� �ɼ��� ��� ��Ȳ�� �ذ������� �ʽ��ϴ�."
		$lblVSDelay = GUICtrlCreateLabel("0", $x, $y, 12, 15, $SS_RIGHT)
			GUICtrlSetTip(-1, $txtTip)
		$lbltxtVSDelay = GUICtrlCreateLabel("��", $x + 15, $y, 45, -1)
		$sldVSDelay = GUICtrlCreateSlider($x + 55, $y - 2, 130, 25, BITOR($TBS_TOOLTIPS, $TBS_AUTOTICKS)) ;,
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetBkColor(-1, $COLOR_WHITE)
			_GUICtrlSlider_SetTipSide(-1, $TBTS_BOTTOM)
			_GUICtrlSlider_SetTicFreq(-1, 1)
			GUICtrlSetLimit(-1, 10, 0) ; change max/min value
			GUICtrlSetData(-1, 0) ; default value
			GUICtrlSetOnEvent(-1, "sldVSDelay")
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	Local $x = 30, $y = 460
	$grpLocateBuildings = GUICtrlCreateGroup("�ǹ���ġ��������", $x - 20, $y - 20, 450, 65)
		$btnLocateTownHall = GUICtrlCreateButton("Townhall", $x - 10, $y, 40, 40, $BS_ICON)
			GUICtrlSetImage(-1, $pIconLib, $eIcnTH10, 1)
			$txtTip = "����ȸ���� ��ġ�� �缳�� �մϴ�,"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_HIDE)
			GUICtrlSetOnEvent(-1, "btnLocateTownHall")
		$btnLocateClanCastle = GUICtrlCreateButton("Clan Castle", $x + 30, $y, 40, 40, $BS_ICON)
			GUICtrlSetOnEvent(-1, "btnLocateClanCastle")
			GUICtrlSetImage(-1, $pIconLib, $eIcnCC, 1)
			$txtTip = "Ŭ������ ��ġ�� �缳�� �մϴ�."
			GUICtrlSetTip(-1, $txtTip)
		$btnLocateArmyCamp = GUICtrlCreateButton("A.C.", $x + 70, $y, 40, 40, $BS_ICON)
			GUICtrlSetOnEvent(-1, "btnLocateArmyCamp")
			GUICtrlSetImage(-1, $pIconLib, $eIcnCamp, 1)
			$txtTip = "���ռ��� ��ġ�� �缳�� �մϴ�."
			GUICtrlSetTip(-1, $txtTip)
		$btnLocateBarracks = GUICtrlCreateButton("Bar.", $x + 110, $y, 40, 40, $BS_ICON)
			GUICtrlSetOnEvent(-1, "btnLocateBarracks")
			GUICtrlSetImage(-1, $pIconLib, $eIcnBarrack, 1)
			$txtTip = "�Ʒü��� ��ġ�� �缳�� �մϴ�."
			GUICtrlSetTip(-1, $txtTip)
	    $btnLocateSpellFactory = GUICtrlCreateButton("S.F.", $x + 150, $y, 40, 40, $BS_ICON)
			GUICtrlSetOnEvent(-1, "btnLocateSpellfactory")
			GUICtrlSetImage(-1, $pIconLib, $eIcnSpellFactory, 1)
			$txtTip = "�������ۼ��� ��ġ�� �缳�� �մϴ�."
			GUICtrlSetTip(-1, $txtTip)
			_ArrayConcatenate($G, $T)
		$btnLocateLaboratory = GUICtrlCreateButton("Lab.", $x + 190, $y, 40, 40, $BS_ICON)
			GUICtrlSetImage(-1, $pIconLib, $eIcnLaboratory)
			$txtTip = "�������� ��ġ�� �缳�� �մϴ�."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "btnLab")
		GUICtrlCreateGroup("", -99, -99, 1, 1)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateTabItem("")
