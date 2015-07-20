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
; Attack Basics Tab
;~ -------------------------------------------------------------

$tabAttack = GUICtrlCreateTabItem("���ݼ���")
	Local $x = 30, $y = 150
	$grpDeadBaseDeploy = GUICtrlCreateGroup("DeadBase ����", $x - 20, $y - 20, 225, 245);95)
		$lblDBDeploy = GUICtrlCreateLabel("���ݹ��� :", $x - 5, $y + 5, -1, -1)
		$cmbDBDeploy = GUICtrlCreateCombo("", $x + 60, $y, 120, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			GUICtrlSetTip(-1, "�� �������� ���� : ���� ���ʱ��� ���� �� �ֽ��ϴ�." & @CRLF & "�� �������� ���� :  ���� ���ʱ��� ���� �� �ֽ��ϴ�." & @CRLF & _
			"�� �������� ���� : �ܰ� �ǹ��� �����ϰ� �Ϻδ� ���� ������ ���մϴ�." & @CRLF & _
			"��� �������� ���� : ��κ��� �ܰ� �ǹ��� ���ʶ߸� �� �ֽ��ϴ�." & @CRLF & _
			"�׼հ������ : ���������� ������ ������ �ѹ��� �����մϴ�.", "������ ������ �����ϼ���.")
			GUICtrlSetData(-1, "�� ����|�� ����|�� ����|��� ����|�׼հ������", "��� ����")
		$y += 25
		$lblDBSelectTroop = GUICtrlCreateLabel("������� :",$x - 5, $y + 5, -1 , -1)
		$cmbDBSelectTroop = GUICtrlCreateCombo("", $x + 60, $y, 120, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			GUICtrlSetData(-1, "���λ��|�Ʒü����ָ�|�ٹٸ��ȸ�|��ó��|�ٹ�,��ó|�ٹ�,���|��ó,���|�ٹ�,��ó,����|�ٹ�,��ó,���,����|�ٹ�,��ó,ȣ��|�ٹ�,��ó,�̴Ͼ�", "���λ��")
		$y += 25
		$lblDBUnitDelay = GUICtrlCreateLabel("Delay(Unit/Wave):", $x - 5, $y + 5, -1, -1)
			$txtTip = "�����ϴ� ���ֻ����� ������ �����մϴ�." & @CRLF & "1 (����) = ���ó�� ����, 10 (����) = ���ó�� ����" & @CRLF & "Random : ���� ���ó�� ���� �� �ֵ��� ������ �����մϴ�."
			GUICtrlSetTip(-1, $txtTip)
		$cmbDBUnitDelay = GUICtrlCreateCombo("", $x + 105, $y, 36, 21, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetData(-1, "1|2|3|4|5|6|7|8|9|10", "5")
		;$lblDBWaveDelay = GUICtrlCreateLabel("ȸ�� :", $x + 100, $y + 5, -1, -1)
		;	GUICtrlSetTip(-1, $txtTip)
		$cmbDBWaveDelay = GUICtrlCreateCombo("", $x + 145, $y, 36, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetData(-1, "1|2|3|4|5|6|7|8|9|10", "5")
		$y += 22
		$chkDBRandomSpeedAtk = GUICtrlCreateCheckbox("Random", $x - 5, $y, -1, -1)
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkDBRandomSpeedAtk")
	$y = 245
		$chkDBSmartAttackRedArea = GUICtrlCreateCheckbox("Smart Attack", $x - 5, $y, -1, -1)
			$txtTip = "�� ����� ����ϸ� ���ݽ� �ܰ��� �������� ã�� �� ��ó�� ������ �����մϴ�."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetOnEvent(-1, "chkDBSmartAttackRedArea")
		$y += 22
		$lblDBSmartDeploy = GUICtrlCreateLabel("�������� :", $x, $y + 5, -1, -1)
			$txtTip = "������ �����ϱ� ���� ����� �����ϼ���." & @CRLF & _
				"Type 1: �Ѱ��� ������ ������ ���ݹ������� �����ϰ�, �ٸ� �������� ��ü�մϴ�. " & @CRLF & _
				"Type 2: ���� ������ �ϳ��� ���⿡ �����ϰ�, �ٸ� �������� �����մϴ�."
			GUICtrlSetTip(-1, $txtTip)
		$cmbDBSmartDeploy = GUICtrlCreateCombo("", $x + 60, $y, 120, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			GUICtrlSetData(-1, "���ֱ�ü����|���⺯�����", "���ֱ�ü����")
			GUICtrlSetTip(-1, $txtTip)
		$y += 26
		$chkDbAttackNearGoldMine = GUICtrlCreateCheckbox("Mine", $x + 20, $y, 17, 17)
			$txtTip = "�ݱ� ��ó�� ������ �����մϴ�."
			GUICtrlSetTip(-1, $txtTip)
		$picDBAttackNearGoldMine = GUICtrlCreateIcon($pIconLib, $eIcnMine, $x + 40 , $y - 3 , 24, 24)
			GUICtrlSetTip(-1, $txtTip)
		$x += 75
		$chkDBAttackNearElixirCollector = GUICtrlCreateCheckbox("", $x, $y, 17, 17)
			$txtTip = "������ ������ ��ó�� ������ �����մϴ�."
			GUICtrlSetTip(-1, $txtTip)
		$picDBAttackNearElixirCollector = GUICtrlCreateIcon($pIconLib, $eIcnCollector, $x + 20 , $y - 3 , 24, 24)
			GUICtrlSetTip(-1, $txtTip)
 		$x += 55
  		$chkDBAttackNearDarkElixirDrill = GUICtrlCreateCheckbox("", $x, $y, 17, 17)
			$txtTip = "��ũ������ ������ ��ó�� ������ �����մϴ�."
 			GUICtrlSetTip(-1, $txtTip)
		$picDBAttackNearDarkElixirDrill = GUICtrlCreateIcon($pIconLib, $eIcnDrill, $x + 20 , $y - 3, 24, 24)
 			GUICtrlSetTip(-1, $txtTip)
	Local $x = 25, $y = 320
		GUICtrlCreateIcon($pIconLib, $eIcnKing, $x, $y, 20, 20)
		$chkDBKingAttack = GUICtrlCreateCheckbox("ŷ ���", $x + 25, $y, -1, -1)
			$txtTip = "�ٹٸ���ŷ�� ����մϴ�."
			GUICtrlSetTip(-1, $txtTip)
		$x += 100
		GUICtrlCreateIcon($pIconLib, $eIcnQueen, $x, $y, 20, 20)
		$chkDBQueenAttack = GUICtrlCreateCheckbox("�� ���", $x + 25, $y, -1, -1)
			$txtTip = "��ó���� ����մϴ�."
			GUICtrlSetTip(-1, $txtTip)
		$x -=100
		$y += 27
		GUICtrlCreateIcon($pIconLib, $eIcnCC, $x, $y, 20, 20)
		$chkDBDropCC = GUICtrlCreateCheckbox("Ŭ���� ���", $x +  25, $y, -1, -1)
			GUICtrlSetTip(-1, "Ŭ������ ����մϴ�.")
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	Local $x = 260, $y = 150
	$grpLiveBaseDeploy = GUICtrlCreateGroup("LiveBase ����", $x - 20, $y - 20, 220, 245);95)
		$lblABDeploy = GUICtrlCreateLabel("���ݹ��� :", $x -5, $y + 5, -1, -1)
		$cmbABDeploy = GUICtrlCreateCombo("", $x + 60, $y, 120, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			GUICtrlSetTip(-1, "�� �������� ���� : ���� ���ʱ��� ���� �� �ֽ��ϴ�." & @CRLF & "�� �������� ���� :  ���� ���ʱ��� ���� �� �ֽ��ϴ�." & @CRLF & _
			"�� �������� ���� : �ܰ� �ǹ��� �����ϰ� �Ϻδ� ���� ������ ���մϴ�." & @CRLF & _
			"��� �������� ���� : ��κ��� �ܰ� �ǹ��� ���ʶ߸� �� �ֽ��ϴ�." & @CRLF & _
			"�׼հ������ : ���������� ������ ������ �ѹ��� �����մϴ�.", "������ ������ �����ϼ���.")
			GUICtrlSetData(-1, "�� ����|�� ����|�� ����|��� ����|�׼հ������", "��� ����")
		$y += 25
		$lblABSelectTroop = GUICtrlCreateLabel("������� :",$x - 5, $y + 5, -1 , -1)
		$cmbABSelectTroop = GUICtrlCreateCombo("", $x + 60, $y, 120, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			GUICtrlSetData(-1, "���λ��|�Ʒü����ָ�|�ٹٸ��ȸ�|��ó��|�ٹ�,��ó|�ٹ�,���|��ó,���|�ٹ�,��ó,����|�ٹ�,��ó,���,����|�ٹ�,��ó,ȣ��|�ٹ�,��ó,�̴Ͼ�", "���λ��")
		$y += 25
		$lblABUnitDelay = GUICtrlCreateLabel("Delay(Unit/Wave):", $x - 5, $y + 5, -1, -1)
			$txtTip = "�����ϴ� ���ֻ����� ������ �����մϴ�." & @CRLF & "1 (����) = ���ó�� ����, 10 (����) = ���ó�� ����" & @CRLF & "Random : ���� ���ó�� ���� �� �ֵ��� ������ �����մϴ�."
			GUICtrlSetTip(-1, $txtTip)
		$cmbABUnitDelay = GUICtrlCreateCombo("", $x + 105, $y, 36, 21, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetData(-1, "1|2|3|4|5|6|7|8|9|10", "5")
		;$lblABWaveDelay = GUICtrlCreateLabel("Wave:", $x + 105, $y + 5, -1, -1)
		;	GUICtrlSetTip(-1, $txtTip)
		$cmbABWaveDelay = GUICtrlCreateCombo("", $x + 145, $y, 36, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetData(-1, "1|2|3|4|5|6|7|8|9|10", "5")
		$y += 22
		$chkABRandomSpeedAtk = GUICtrlCreateCheckbox("Random", $x - 5, $y, -1, -1)
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkABRandomSpeedAtk")
	$y = 245
		$chkABSmartAttackRedArea = GUICtrlCreateCheckbox("Smart Attack", $x - 5, $y, -1, -1)
			$txtTip = "�� ����� ����ϸ� ���ݽ� �ܰ��� �������� ã�� �� ��ó�� ������ �����մϴ�."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetOnEvent(-1, "chkABSmartAttackRedArea")
		$y += 22
		$lblABSmartDeploy = GUICtrlCreateLabel("�������� :", $x, $y + 5, -1, -1)
			$txtTip = "������ �����ϱ� ���� ����� �����ϼ���." & @CRLF & _
				"Type 1: �Ѱ��� ������ ������ ���ݹ������� �����ϰ�, �ٸ� �������� ��ü�մϴ�. " & @CRLF & _
				"Type 2: ���� ������ �ϳ��� ���⿡ �����ϰ�, �ٸ� �������� �����մϴ�."
			GUICtrlSetTip(-1, $txtTip)
		$cmbABSmartDeploy = GUICtrlCreateCombo("", $x + 60, $y, 120, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			GUICtrlSetData(-1, "���ֱ�ü����|���⺯�����", "���ֱ�ü����")
			GUICtrlSetTip(-1, $txtTip)
		$y += 26
		$chkABAttackNearGoldMine = GUICtrlCreateCheckbox("", $x + 20, $y, 17, 17)
			$txtTip = "�ݱ� ��ó�� ������ �����մϴ�."
			GUICtrlSetTip(-1, $txtTip)
		$picABAttackNearGoldMine = GUICtrlCreateIcon($pIconLib, $eIcnMine, $x + 40 , $y - 3 , 24, 24)
			GUICtrlSetTip(-1, $txtTip)
		$x += 75
		$chkABAttackNearElixirCollector = GUICtrlCreateCheckbox("", $x, $y, 17, 17)
			$txtTip = "������ ������ ��ó�� ������ �����մϴ�."
			GUICtrlSetTip(-1, $txtTip)
		$picABAttackNearElixirCollector = GUICtrlCreateIcon($pIconLib, $eIcnCollector, $x + 20 , $y - 3 , 24, 24)
			GUICtrlSetTip(-1, $txtTip)
 		$x += 55
  		$chkABAttackNearDarkElixirDrill = GUICtrlCreateCheckbox("", $x, $y, 17, 17)
			$txtTip = "��ũ������ ������ ��ó�� ������ �����մϴ�."
 			GUICtrlSetTip(-1, $txtTip)
		$picABAttackNearDarkElixirDrill = GUICtrlCreateIcon($pIconLib, $eIcnDrill, $x + 20 , $y - 3, 24, 24)
 			GUICtrlSetTip(-1, $txtTip)
	Local $x = 255, $y = 320
		GUICtrlCreateIcon($pIconLib, $eIcnKing, $x, $y, 20, 20)
		$chkABKingAttack = GUICtrlCreateCheckbox("ŷ ���", $x + 25, $y, -1, -1)
			$txtTip = "�ٹٸ���ŷ�� ����մϴ�."
			GUICtrlSetTip(-1, $txtTip)
		$x += 100
		GUICtrlCreateIcon($pIconLib, $eIcnQueen, $x, $y, 20, 20)
		$chkABQueenAttack = GUICtrlCreateCheckbox("�� ���", $x + 25, $y, -1, -1)
			$txtTip = "��ó���� ����մϴ�."
			GUICtrlSetTip(-1, $txtTip)
		$x -= 100
		$y += 27
		GUICtrlCreateIcon($pIconLib, $eIcnCC, $x, $y, 20, 20)
		$chkABDropCC = GUICtrlCreateCheckbox("Ŭ���� ���", $x + 25, $y, -1, -1)
			GUICtrlSetTip(-1, "Ŭ������ ����մϴ�.")
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	Local $x = 30, $y = 400
	$grpClanCastleBal = GUICtrlCreateGroup("Ŭ�� ����/��û���� ����", $x - 20, $y - 20, 450, 45)
		;GUICtrlCreateLabel("", $x - 18, $y - 7, 106, 85) ; fake label to hide group border from DB and LB setting groups
		;GUICtrlSetBkColor (-1, $COLOR_WHITE)
		;GUICtrlSetState (-1, $GUI_DISABLE)
		GUICtrlCreateIcon($pIconLib, $eIcnCC, $x, $y - 5, 24, 24)
		$x += 40
		$chkUseCCBalanced = GUICtrlCreateCheckbox("����/��û��", $x, $y, -1, -1)
			GUICtrlSetState(-1, $GUI_UNCHECKED)
			GUICtrlSetTip(-1, "Ŭ������ ����Ҷ� ����� ����/��û ������ Ȯ���մϴ�.")
			GUICtrlSetOnEvent(-1, "chkBalanceDR")
		$x += 100
		$cmbCCDonated = GUICtrlCreateCombo("",  $x - 5, $y - 3, 30, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			GUICtrlSetTip(-1, "������ ����")
			GUICtrlSetData(-1, "1|2|3|4|5", "1")
			GUICtrlSetState(-1, $GUI_DISABLE)
			GUICtrlSetOnEvent(-1, "cmbBalanceDR")
		$lblDRRatio = GUICtrlCreateLabel("/", $x + 31, $y + 2, -1, -1)
			$txtTip = "����/��û ����" & @CRLF & "1/1 : ������ ���ּ� = �������� ���ּ�" & @CRLF & "1/2 : ������ ���ּ� = �������� ���ּ��� ����"
			GUICtrlSetTip(-1, $txtTip)
		$cmbCCReceived = GUICtrlCreateCombo("", $x + 44, $y - 3, 30, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			GUICtrlSetTip(-1, "�������� ����")
			GUICtrlSetData(-1, "1|2|3|4|5", "1")
			GUICtrlSetState(-1, $GUI_DISABLE)
			GUICtrlSetOnEvent(-1, "cmbBalanceDR")
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	Local $x = 30, $y = 450
	$grpRoyalAbilities = GUICtrlCreateGroup("������ų", $x - 20, $y - 20, 450, 75)
		GUICtrlCreatePic (@ScriptDir & "\Icons\KingAbility.jpg", $x, $y - 3, 30, 47)
		GUICtrlCreatePic (@ScriptDir & "\Icons\QueenAbility.jpg", $x + 30, $y - 3, 30, 47)
		$x += 75
		$radManAbilities = GUICtrlCreateRadio("������ �ð��� ���� �Ŀ� ����մϴ�.", $x, $y + 3, -1, -1)
			$txtTip = "�ð��� ���� �� ������ų�� Ȱ��ȭ �մϴ�." & @CRLF & "�� ������ ���ÿ� ��ų�� ����ϰ� �˴ϴ�."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_CHECKED)
		$radAutoAbilities = GUICtrlCreateRadio("������ �������� �� ����մϴ�.", $x, $y + 25, -1, -1)
		$txtTip = "������ �������� �� ����մϴ�." & @CRLF & "���� ������ ü���� Ȯ���ϰ� ��ų�� ���� �ٸ� �ñ⿡ ����ϰ� �˴ϴ�."
		GUICtrlSetTip(-1, $txtTip)
		$txtManAbilities = GUICtrlCreateInput("9", $x + 240, $y + 2, 30, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "������ų�� Ȱ��ȭ��ų �ð��� �Է��ϼ���. ������ ������ �������� ����մϴ�."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 2)
		$lblRoyalAbilitiesSec = GUICtrlCreateLabel("��", $x + 275, $y + 7, -1, -1)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateTabItem("")
