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
; Upgrades Tab
;~ -------------------------------------------------------------

$tabUpgrades = GUICtrlCreateTabItem("���׷��̵�")
Local $x = 30, $y = 150
	$Laboratory = GUICtrlCreateGroup("������", $x - 20, $y - 20, 450, 65)
		GUICtrlCreateIcon($pIconLib, $eIcnLaboratory, $x, $y, 32, 32)
		$chkLab = GUICtrlCreateCheckbox("�ڵ� ���׷��̵�", $x + 40, $y + 8, -1, -1)
			$txtTip = "�����Ҹ� ���Ͽ� �ڵ����� ���׷��̵带 �����մϴ�."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkLab")
		Local $sNames = "����|�ٹٸ���|��ó|���̾�Ʈ|���|�ذ񵹰ݺ�|�ذ���༱|������|ġ����|�巡��|��ī|��������|ȸ������|�г븶��|�̵�����|��������|������|��������|�żӸ���|�̴Ͼ�|ȣ�׶��̴�|��Ű��|��|����|����Ͽ��"
		$lblNextUpgrade = GUICtrlCreateLabel("�������� :", $x + 190, $y + 12, -1, -1)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$cmbLaboratory = GUICtrlCreateCombo("", $x + 250, $y + 8, 125, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			GUICtrlSetData(-1, $sNames,"����")
			$txtTip = "���巹�̵��� ������ �����ϼ���" & @CRLF & "������ ������ �����ʿ� ��Ÿ���ϴ�."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_DISABLE)
			GUICtrlSetOnEvent(-1, "cmbLab")
		$icnLabUpgrade = GUICtrlCreateIcon($pIconLib, $eIcnLaboratory, $x + 380, $y, 32, 32)
			GUICtrlSetState(-1, $GUI_HIDE)
		GUICtrlCreateGroup("", -99, -99, 1, 1)
	Local $x = 260, $y = 150

	Local $x = 30, $y = 215
	$grpUpgrade = GUICtrlCreateGroup("�ǹ� �� ����", $x - 20, $y - 15, 450, 180)
		$picUpgradeStatus[0]= GUICtrlCreateIcon($pIconLib, $eIcnRedLight, $x - 15, $y + 1, 16, 16)
			GUICtrlSetTip(-1, "���� = �������� ����" & @CRLF & "��� = �����Ϸ�, ���� ��" & @CRLF &"�ʷ� = ����Ϸ�","Ȯ�ι�� :")
		 $chkbxUpgrade[0] = GUICtrlCreateCheckbox(" Upgrade #1:", $x + 5, $y + 1, 90, 17)
			$txtTip = "'��ġ����'��ư�� ���� ���׷��̵� ������ ���� �� üũ�Ͽ� Ȱ��ȭ �ϼ���."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "btnchkbxUpgrade")
		 $lblUpgrade0PosX = GUICtrlCreateLabel("X. ", $x+100, $y+3, 15, 18)
			$txtUpgradeX[0] = GUICtrlCreateInput("", $x+115, $y-1, 31, 20, BitOR($ES_CENTER, $GUI_SS_DEFAULT_INPUT, $ES_READONLY, $ES_NUMBER))
		$lblUpgrade0PosY = GUICtrlCreateLabel("Y. ", $x+150, $y+3, 15, 18)
			$txtUpgradeY[0] = GUICtrlCreateInput("", $x+165, $y-1, 31, 20, BitOR($ES_CENTER, $GUI_SS_DEFAULT_INPUT, $ES_READONLY, $ES_NUMBER))
		$picUpgradeType[0]= GUICtrlCreateIcon($pIconLib, $eIcnBlank,$x+230, $y, 16, 16)
			$txtTip = "���׷��̵忡 �ʿ��� �ڿ�"
			GUICtrlSetTip(-1, $txtTip)
		$txtUpgradeValue[0] = GUICtrlCreateInput("", $x+248, $y-1, 65, 18, BitOR($ES_CENTER, $GUI_SS_DEFAULT_INPUT, $ES_READONLY, $ES_NUMBER))
		$btnLocateUpgrade = GUICtrlCreateButton("��ġ����", $x+330, $y-1, 95, 60, BitOR($BS_MULTILINE, $BS_VCENTER))
			$txtTip = "��ư�� ���� ������ ���ÿ� ���� ���׷��̵� �� �ǹ� �� ������ ������ ����ϴ�."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "btnLocateUpgrades")
		$btnResetUpgrade = GUICtrlCreateButton("�����ʱ�ȭ", $x+330, $y+65, 95, 60, BitOR($BS_MULTILINE, $BS_VCENTER))
			$txtTip = "������ �ʱ�ȭ �մϴ�."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "btnResetUpgrade")

		$y+=22
		$picUpgradeStatus[1]= GUICtrlCreateIcon($pIconLib, $eIcnRedLight, $x-15, $y + 1, 16, 16)
			GUICtrlSetTip(-1, "���� = �������� ����" & @CRLF & "��� = �����Ϸ�, ���� ��" & @CRLF &"�ʷ� = ����Ϸ�","Ȯ�ι�� :")
		$chkbxUpgrade[1] = GUICtrlCreateCheckbox(" Upgrade #2:", $x + 5, $y + 1, 90, 17)
			$txtTip = "'��ġ����'��ư�� ���� ���׷��̵� ������ ���� �� üũ�Ͽ� Ȱ��ȭ �ϼ���."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "btnchkbxUpgrade")
		$lblUpgrade1PosX = GUICtrlCreateLabel("X. ", $x+100, $y+3, 15, 18)
			$txtUpgradeX[1] = GUICtrlCreateInput("", $x+115, $y-1, 31, 20, BitOR($ES_CENTER, $GUI_SS_DEFAULT_INPUT, $ES_READONLY, $ES_NUMBER))
		$lblUpgrade1PosY = GUICtrlCreateLabel("Y. ", $x+150, $y+3, 15, 18)
			$txtUpgradeY[1] = GUICtrlCreateInput("", $x+165, $y-1, 31, 20, BitOR($ES_CENTER, $GUI_SS_DEFAULT_INPUT, $ES_READONLY, $ES_NUMBER))
		$picUpgradeType[1]= GUICtrlCreateIcon($pIconLib, $eIcnBlank,$x+230, $y, 16, 16)
			$txtTip = "���׷��̵忡 �ʿ��� �ڿ�"
			GUICtrlSetTip(-1, $txtTip)
		$txtUpgradeValue[1] = GUICtrlCreateInput("", $x+248, $y-1, 65, 18, BitOR($ES_CENTER, $GUI_SS_DEFAULT_INPUT, $ES_READONLY, $ES_NUMBER))

		$y+=22
		$picUpgradeStatus[2]= GUICtrlCreateIcon($pIconLib, $eIcnRedLight, $x - 15, $y + 1, 16, 16)
			GUICtrlSetTip(-1, "���� = �������� ����" & @CRLF & "��� = �����Ϸ�, ���� ��" & @CRLF &"�ʷ� = ����Ϸ�","Ȯ�ι�� :")
		$chkbxUpgrade[2] = GUICtrlCreateCheckbox(" Upgrade #3:", $x + 5, $y + 1,90, 17)
			$txtTip = "'��ġ����'��ư�� ���� ���׷��̵� ������ ���� �� üũ�Ͽ� Ȱ��ȭ �ϼ���."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "btnchkbxUpgrade")
		$lblUpgrade2PosX = GUICtrlCreateLabel("X. ", $x+100, $y+3, 15, 18)
			$txtUpgradeX[2] = GUICtrlCreateInput("", $x+115, $y-1, 31, 20, BitOR($ES_CENTER, $GUI_SS_DEFAULT_INPUT, $ES_READONLY, $ES_NUMBER))
		$lblUpgrade2PosY = GUICtrlCreateLabel("Y. ", $x+150, $y+3, 15, 18)
			$txtUpgradeY[2] = GUICtrlCreateInput("", $x+165, $y-1, 31, 20, BitOR($ES_CENTER, $GUI_SS_DEFAULT_INPUT, $ES_READONLY, $ES_NUMBER))
		$picUpgradeType[2]= GUICtrlCreateIcon($pIconLib, $eIcnBlank,$x+230, $y, 16, 16)
			$txtTip = "���׷��̵忡 �ʿ��� �ڿ�"
			GUICtrlSetTip(-1, $txtTip)
		$txtUpgradeValue[2] = GUICtrlCreateInput("", $x+248, $y-1, 65, 18, BitOR($ES_CENTER, $GUI_SS_DEFAULT_INPUT, $ES_READONLY, $ES_NUMBER))

		$y+=22
		$picUpgradeStatus[3]= GUICtrlCreateIcon($pIconLib, $eIcnRedLight,$x-15, $y + 1, 16, 16)
			GUICtrlSetTip(-1, "���� = �������� ����" & @CRLF & "��� = �����Ϸ�, ���� ��" & @CRLF &"�ʷ� = ����Ϸ�","Ȯ�ι�� :")
		$chkbxUpgrade[3] = GUICtrlCreateCheckbox(" Upgrade #4:", $x + 5, $y + 1, 90, 17)
			$txtTip = "'��ġ����'��ư�� ���� ���׷��̵� ������ ���� �� üũ�Ͽ� Ȱ��ȭ �ϼ���."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "btnchkbxUpgrade")
		$lblUpgrade3PosX = GUICtrlCreateLabel("X. ", $x+100, $y+3, 15, 18)
			 $txtUpgradeX[3] = GUICtrlCreateInput("", $x+115, $y-1, 31, 20, BitOR($ES_CENTER, $GUI_SS_DEFAULT_INPUT, $ES_READONLY, $ES_NUMBER))
		$lblUpgrade3PosY = GUICtrlCreateLabel("Y. ", $x+150, $y+3, 15, 18)
			 $txtUpgradeY[3] = GUICtrlCreateInput("", $x+165, $y-1, 31, 20, BitOR($ES_CENTER, $GUI_SS_DEFAULT_INPUT, $ES_READONLY, $ES_NUMBER))
		$picUpgradeType[3]= GUICtrlCreateIcon($pIconLib, $eIcnBlank,$x+230, $y, 16, 16)
			$txtTip = "���׷��̵忡 �ʿ��� �ڿ�"
			GUICtrlSetTip(-1, $txtTip)
		$txtUpgradeValue[3] = GUICtrlCreateInput("", $x+248, $y-1, 65, 18, BitOR($ES_CENTER, $GUI_SS_DEFAULT_INPUT, $ES_READONLY, $ES_NUMBER))

		$y+=22
		$picUpgradeStatus[4]= GUICtrlCreateIcon($pIconLib, $eIcnRedLight,$x-15, $y + 1, 16, 16)
			GUICtrlSetTip(-1, "���� = �������� ����" & @CRLF & "��� = �����Ϸ�, ���� ��" & @CRLF &"�ʷ� = ����Ϸ�","Ȯ�ι�� :")
		$chkbxUpgrade[4] = GUICtrlCreateCheckbox(" Upgrade #5:", $x + 5, $y + 1, 90, 17)
			$txtTip = "'��ġ����'��ư�� ���� ���׷��̵� ������ ���� �� üũ�Ͽ� Ȱ��ȭ �ϼ���."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "btnchkbxUpgrade")
		$lblUpgrade4PosX = GUICtrlCreateLabel("X. ", $x+100, $y+3, 15, 18)
			 $txtUpgradeX[4] = GUICtrlCreateInput("", $x+115, $y-1, 31, 20, BitOR($ES_CENTER, $GUI_SS_DEFAULT_INPUT, $ES_READONLY, $ES_NUMBER))
		$lblUpgrade4PosY = GUICtrlCreateLabel("Y. ", $x+150, $y+3, 15, 18)
			 $txtUpgradeY[4] = GUICtrlCreateInput("", $x+165, $y-1, 31, 20, BitOR($ES_CENTER, $GUI_SS_DEFAULT_INPUT, $ES_READONLY, $ES_NUMBER))
		$picUpgradeType[4]= GUICtrlCreateIcon($pIconLib, $eIcnBlank,$x+230, $y, 16, 16)
			$txtTip = "���׷��̵忡 �ʿ��� �ڿ�"
			GUICtrlSetTip(-1, $txtTip)
		$txtUpgradeValue[4] = GUICtrlCreateInput("", $x+248, $y-1, 65, 18, BitOR($ES_CENTER, $GUI_SS_DEFAULT_INPUT, $ES_READONLY, $ES_NUMBER))

		$y+=22
		$picUpgradeStatus[5]= GUICtrlCreateIcon($pIconLib, $eIcnRedLight,$x-15, $y + 1, 16, 16)
			GUICtrlSetTip(-1, "���� = �������� ����" & @CRLF & "��� = �����Ϸ�, ���� ��" & @CRLF &"�ʷ� = ����Ϸ�","Ȯ�ι�� :")
		$chkbxUpgrade[5] = GUICtrlCreateCheckbox(" Upgrade #6:", $x + 5, $y + 1, 90, 17)
			$txtTip = "'��ġ����'��ư�� ���� ���׷��̵� ������ ���� �� üũ�Ͽ� Ȱ��ȭ �ϼ���."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "btnchkbxUpgrade")
		$lblUpgrade5PosX = GUICtrlCreateLabel("X. ", $x+100, $y+3, 15, 18)
			 $txtUpgradeX[5] = GUICtrlCreateInput("", $x+115, $y-1, 31, 20, BitOR($ES_CENTER, $GUI_SS_DEFAULT_INPUT, $ES_READONLY, $ES_NUMBER))
		$lblUpgrade5PosY = GUICtrlCreateLabel("Y. ", $x+150, $y+3, 15, 18)
			 $txtUpgradeY[5] = GUICtrlCreateInput("", $x+165, $y-1, 31, 20, BitOR($ES_CENTER, $GUI_SS_DEFAULT_INPUT, $ES_READONLY, $ES_NUMBER))
		$picUpgradeType[5]= GUICtrlCreateIcon($pIconLib, $eIcnBlank, $x+230, $y, 16, 16)
			$txtTip = "���׷��̵忡 �ʿ��� �ڿ�"
			GUICtrlSetTip(-1, $txtTip)
		$txtUpgradeValue[5] = GUICtrlCreateInput("", $x+248, $y-1, 65, 18, BitOR($ES_CENTER, $GUI_SS_DEFAULT_INPUT, $ES_READONLY, $ES_NUMBER))

		$y+=27
		GUICtrlCreateIcon ($pIconLib, $eIcnGold, $x - 15, $y, 16, 16)
		$UpgrMinGold = GUICtrlCreateLabel("�ּҺ��� :", $x + 5, $y + 3, -1, -1)
		$txtUpgrMinGold = GUICtrlCreateInput("250000", $x + 65, $y - 2, 61, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			GUICtrlSetTip(-1, "����ҿ� ������ '���'���� �����ϼ���." & @CRLF & "������ �縸ŭ�� ������� �ʽ��ϴ�. �����˻��̳� �������׷��̵带 ���� �������� �����ϼ���.")
			GUICtrlSetLimit(-1, 7)
		GUICtrlCreateIcon ($pIconLib, $eIcnElixir, $x + 135, $y, 16, 16)
		$UpgrMinElixir = GUICtrlCreateLabel("�ּҺ��� :", $x + 155, $y + 3, -1, -1)
		$txtUpgrMinElixir = GUICtrlCreateInput("250000", $x + 215, $y - 2, 61, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			GUICtrlSetTip(-1, "����ҿ� ������ '������'���� �����ϼ���." & @CRLF & "������ �縸ŭ�� ������� �ʽ��ϴ�. ���� �Ʒ��̳� �������׷��̵带 ���� �������� �����ϼ���.")
			GUICtrlSetLimit(-1, 7)
		GUICtrlCreateIcon ($pIconLib, $eIcnDark, $x + 285, $y, 16, 16)
		$UpgrMinDark = GUICtrlCreateLabel("�ּҺ��� :", $x + 305, $y + 3, -1, -1)
		$txtUpgrMinDark= GUICtrlCreateInput("3000", $x + 365, $y - 2, 56, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			GUICtrlSetTip(-1, "����ҿ� ������ '��ũ������'���� �����ϼ���." & @CRLF & "������ �縸ŭ�� ������� �ʽ��ϴ�. ���� �Ʒ��� ���� �������� �����ϼ���.")
			GUICtrlSetLimit(-1, 6)
		GUICtrlCreateGroup("", -99, -99, 1, 1)

	Local $x = 30, $y = 405
		$grpWalls = GUICtrlCreateGroup("����", $x - 20, $y - 20, 450, 120)
		GUICtrlCreateIcon ($pIconLib, $eIcnWall, $x - 12, $y - 6, 24, 24)
		$chkWalls = GUICtrlCreateCheckbox("�������׷��̵�", $x + 18, $y-2, -1, -1)
			GUICtrlSetTip(-1, "�ڿ��� ����ϴٸ� ������ ���׷��̵� �մϴ�.")
			GUICtrlSetState(-1, $GUI_ENABLE)
			GUICtrlSetState(-1, $GUI_UNCHECKED)
			GUICtrlSetOnEvent(-1, "chkWalls")
			_ArrayConcatenate($G, $B)
		$UseGold = GUICtrlCreateRadio("��� ���", $x + 35, $y + 16, -1, -1)
			GUICtrlSetTip(-1, "��带 ����Ͽ� ������ ���׷��̵� �մϴ�." & @CRLF & "������ ������� ���׷��̵尡 �����մϴ�.")
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$UseElixir = GUICtrlCreateRadio("������ ���", $x + 35, $y + 34, -1, -1)
			GUICtrlSetTip(-1, "�������� ����Ͽ� ������ ���׷��̵� �մϴ�." & @CRLF & "�������� ���׷��̵尡 ������ �������� �����˴ϴ�.")
			GUICtrlSetState(-1, $GUI_DISABLE)
		$UseElixirGold = GUICtrlCreateRadio("1.������ 2.��� ���", $x + 35, $y + 52, -1, -1)
			GUICtrlSetTip(-1, "�������� ����Ͽ� ���׷��̵带 �õ��ϰ�, �������� ������� ���� ��� ���� ���׷��̵带 �մϴ�." & @CRLF & "�������� ���׷��̵尡 ������ �������� �����˴ϴ�.")
			GUICtrlSetState(-1, $GUI_DISABLE)
		GUICtrlCreateIcon ($pIconLib, $eIcnBuilder, $x - 12, $y + 72, 20, 20)
		$chkSaveWallBldr = GUICtrlCreateCheckbox("���� ����(1��) ����", $x+18, $y + 72, -1, -1)
			$TxtTip = "�������׷��̵� Ȥ�� ��Ÿ �ٸ� �۾��� ���Ͽ� ���� �Ѹ��� ���׷��̵忡 ������� �ʽ��ϴ�."
			GUICtrlSetTip(-1, $TxtTip)
			GUICtrlSetState(-1, $GUI_ENABLE)
			GUICtrlSetState(-1, $GUI_UNCHECKED)
			GUICtrlSetOnEvent(-1, "chkSaveWallBldr")
		$x += 220
		$lblWalls = GUICtrlCreateLabel("�˻��� �������� :", $x, $y+2, -1, -1)
		$cmbWalls = GUICtrlCreateCombo("", $x + 110, $y - 2, 61, 21, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL), $WS_EX_RIGHT)
			GUICtrlSetTip(-1, "������ ������ �´� ������ �˻��ϰ� �ϳ��� ���׷��̵带 �����մϴ�.")
			GUICtrlSetData(-1, "4   |5   |6   |7   |8   |9   |10   ", "4   ")
			GUICtrlSetState(-1, $GUI_DISABLE)
			GUICtrlSetOnEvent(-1, "cmbWalls")
			_ArrayConcatenate($G, $C)
		$lblTxtWallCost = GUICtrlCreateLabel("���׷��̵� ��� :", $x,  $y + 25, -1, -1)
			GUICtrlSetTip(-1, "���׷��̵忡 �ʿ��� ����� ��Ÿ���ϴ�." &@CRLF & "����� �ٸ��ٸ� ���������� �ٽ� �����ϼ���.")
		$lblWallCost = GUICtrlCreateLabel("30 000", $x + 110, $y + 25, 50, -1, $SS_RIGHT)
			GUICtrlCreateIcon ($pIconLib, $eIcnGold, $x, $y + 47, 16, 16)
		$WallMinGold = GUICtrlCreateLabel("��� ���� :", $x + 20, $y + 47, -1, -1)
		$txtWallMinGold = GUICtrlCreateInput("250000", $x + 110, $y + 45, 61, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			GUICtrlSetTip(-1, "Save this much Gold after the wall upgrade completes," & @CRLF & "Set this value to save Gold for other upgrades, or searching.")
			GUICtrlSetLimit(-1, 7)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$y +=2
		GUICtrlCreateIcon ($pIconLib, $eIcnElixir, $x, $y + 67, 16, 16)
		$WallMinElixir = GUICtrlCreateLabel("������ ���� :", $x + 20, $y + 70, -1, -1)
		$txtWallMinElixir = GUICtrlCreateInput("250000", $x + 110, $y + 65, 61, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			GUICtrlSetTip(-1, "Save this much Elixir after the wall upgrade completes," & @CRLF & "Set this value to save Elixir for other upgrades or troop making.")
			GUICtrlSetLimit(-1, 7)
			GUICtrlSetState(-1, $GUI_DISABLE)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	GUICtrlCreateTabItem("")
