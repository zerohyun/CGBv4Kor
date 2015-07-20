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
;~ Attack Advanced Tab
;~ -------------------------------------------------------------
 $tabAttackAdv = GUICtrlCreateTabItem("��޼���")
	Local $x = 30, $y = 150
	$grpAtkOptions = GUICtrlCreateGroup("���� �ɼ�", $x - 20, $y - 20, 450, 100)
		$chkAttackNow = GUICtrlCreateCheckbox("Attack Now!", $x, $y, -1, -1)
			$txtTip = "�� �ɼ��� ����ϸ� �������� ������ ""Attack Now!""��ư�� Ȱ��ȭ�˴ϴ�." & @CRLF & _
				"���� ������  �ش� ���ݼ�����('DeadBase' �Ǵ� 'LiveBase' �Ǵ� 'TH snipe')���� �����մϴ�" & @CRLF & _
				"""Attack Now!"" ��ư�� ������ �����˻��ÿ��� Ȱ��ȭ�˴ϴ�."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkAttackNow")
		$y +=20
		$lblAttackNow = GUICtrlCreateLabel("�߰� :", $x + 20, $y + 6, -1, -1, $SS_RIGHT)
			$txtTip = "�� �����ð��� �߰��Ͽ� �˻��ӵ��� ������ŵ�ϴ�."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$cmbAttackNowDelay = GUICtrlCreateCombo("", $x + 65, $y + 1, 35, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetData(-1, "5|4|3|2|1","3") ; default value 3
			GUICtrlSetState(-1, $GUI_DISABLE)
		$lblAttackNowSec = GUICtrlCreateLabel("���� �����ð�", $x + 100, $y + 6, -1, -1)
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$y +=22
		$chkAttackTH = GUICtrlCreateCheckbox("�ܰ��� ��ġ�� ����ȸ�� ����", $x, $y, -1, -1)
			GUICtrlSetTip(-1, "�� �ɼ��� ����ϸ� ����� ����ȸ���� �켱������ �����ϵ��� �����մϴ�. (���� �ٱ��ʿ� �ִ� ����ȸ��)" & @CRLF & _
			"TIP: ���� ����ȸ���� ����� �������� ã�� �ʹٸ� '�����˻�'���� ""�ܰ��� ��ġ�� ����ȸ��"" ������ Ȱ��ȭ �ϼ���.")
		$chkSnipeWhileTrain = GUICtrlCreateCheckbox("�����Ʒð� 'TH snipe.'�����", $x + 200, $y, -1, -1) ; Snipe While Train MOD by ChiefM3
			GUICtrlSetTip(-1, "������ �Ʒ��ϴ� ���� 'TH snipe.'��带 ����Ͽ� 'Ȧġ��'�� �����մϴ�.")
;		$y +=22
;		$chkLightSpell = GUICtrlCreateCheckbox("Hit Dark Elixir storage with Lightning Spell", $x, $y, -1, -1)
;			GUICtrlSetTip(-1, "Check this if you want to use lightning spells to steal Dark Elixir when bot meet Minimum Dark Elixir.")
;			GUICtrlSetOnEvent(-1, "GUILightSpell")
;		$y +=22
;  		$lbliLSpellQ = GUICtrlCreateLabel("Have:", $x + 20, $y + 4, -1, -1)
;			$txtTip = "Set the minimum amount of spells needed. Never attack with less."
;			GUICtrlSetTip(-1, $txtTip)
;			GUICtrlSetState(-1, $GUI_DISABLE)
;		$cmbiLSpellQ = GUICtrlCreateCombo("", $x + 50, $y + 1, 35, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
;			GUICtrlSetData(-1, "1|2|3|4|5", "3")
;			GUICtrlSetTip(-1, $txtTip)
;			GUICtrlSetState(-1, $GUI_DISABLE)
;		$lbliLSpellQ2 = GUICtrlCreateLabel("Lightning Spells ready before using this type of Attack.", $x + 90, $y + 4, -1, -1)
;			GUICtrlSetTip(-1, $txtTip)
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	Local $x = 25, $y = 260
	$grpAtkCombos = GUICtrlCreateGroup("�߰� ����", $x - 15, $y - 20, 225, 200)
		$chkBullyMode = GUICtrlCreateCheckbox("TH Bully. : ", $x, $y, -1, -1)
			$txtTip = "������ �˻��������ǿ� ""TH Bully""��带 �߰��մϴ�. (���� : 'Deadbase' �Ǵ� 'TH Bully')" & @CRLF & _
				"TH Bully: ������ �˻�Ƚ�� ���ĺ��� ����ȸ�������� ���� ������ ã�� �����մϴ�." & @CRLF & _
				"'Bully'�� ���� ""���ڸ� ��������""�Դϴ�. ��, ���������� ����ȸ���� ã�� ���� ��Ż�� �� �ֽ��ϴ�."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkBullyMode")
		$txtATBullyMode = GUICtrlCreateInput("150", $x + 85, $y, 35, -1, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "TH Bully : Ȱ��ȭ�� ���� �˻�Ƚ���� �Է��ϼ���."
			GUICtrlSetLimit(-1, 3)
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$lblATBullyMode = GUICtrlCreateLabel("�� �˻�����", $x + 125, $y + 5, -1, -1)
		$y +=25
		$lblATBullyMode = GUICtrlCreateLabel("����ȸ���ִ뷹�� :", $x + 5, $y + 3, -1, -1, $SS_RIGHT)
		$cmbYourTH = GUICtrlCreateCombo("", $x + 125, $y - 3, 50, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = "TH Bully : ������ ������ ����ȸ�� �ִ� ����"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetData(-1, "4-6|7|8|9|10", "4-6")
			GUICtrlSetState(-1, $GUI_DISABLE)
		$y += 24
		GUICtrlCreateLabel("������ ���ݼ��� :", $x + 5, $y, -1, -1, $SS_RIGHT)
		$txtTip = "TH Bully : ������ ���� �߽߰� ������ Base������"
			GUICtrlSetTip(-1, $txtTip)
		$y += 14
		$radUseDBAttack = GUICtrlCreateRadio("DeadBase", $x + 20, $y, -1, -1)
			GUICtrlSetTip(-1, "TH Bully : 'DeadBase' ���ݼ������� ����Ͽ� �����մϴ�.")
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$radUseLBAttack = GUICtrlCreateRadio("LiveBase", $x + 115, $y, -1, -1)
			GUICtrlSetTip(-1, "TH Bully : 'LiveBase' ���ݼ������� ����Ͽ� �����մϴ�.")
			GUICtrlSetState(-1, $GUI_DISABLE)
		$y += 27
		$chkTrophyMode = GUICtrlCreateCheckbox("TH Snipe. :", $x, $y, -1, -1)
			$txtTip = "������ �˻��������ǿ� ""TH Snipe""��带 �߰��մϴ�.( ���� : Deadbase �Ǵ� TH Snipe)" & @CRLF & _
							"TH snipe : �ϸ� 'Ȧġ��'�� ������ ���� �߽߰� ������ �����մϴ�."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkSnipeMode")
		$lblTHaddtiles = GUICtrlCreateLabel( "ĭ �̰�", $x + 125, $y + 5, -1, 17)
		$txtTip = "TH Snipe : �ܺ����κ��� ������ ����ŭ ������ �ִ� ����ȸ���� �˻��մϴ�."
			GUICtrlSetTip(-1, $txtTip)
		$txtTHaddtiles = GUICtrlCreateInput("1", $x + 85, $y, 35, - 1, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 3)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$y+=25
		$lblAttackTHType = GUICtrlCreateLabel("�������� :", $x, $y + 5, -1, 17, $SS_RIGHT)
		$cmbAttackTHType = GUICtrlCreateCombo("",  $x + 75, $y, 125, - 1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			GUICtrlSetData(-1, "Barch|Attack1:Normal|Attack2:eXtreme|Attack3:Gbarch|Attack4:SmartBarch|Attack5:MasterGiBAM", "Attack1:Normal")
			GUICtrlSetState(-1, $GUI_DISABLE)
		$y+=25
		$lblAttackBottomType = GUICtrlCreateLabel("��ä��� :", $x, $y + 5, -1, 17, $SS_RIGHT)
		$txtTip = "��ä��� : ���� �����ڸ��� ����ȸ���� �����ִ� ������ �����մϴ�."
			GUICtrlSetTip(-1, $txtTip)
		$cmbAttackbottomType = GUICtrlCreateCombo("",  $x + 75, $y, 125, - 1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
		$txtTip = "��ä��� : ���������� �����ϼ���."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetData(-1, "���ݾ���|Attack1:MaxZoomed|Attack2:ModerateZoomed|Attack3:SideAttack", "���ݾ���")
			GUICtrlSetState(-1, $GUI_DISABLE)
    GUICtrlCreateGroup("", -99, -99, 1, 1)

	Local $x = 260, $y = 260
	$grpDefenseFarming = GUICtrlCreateGroup("����Ż���", $x - 20, $y - 20, 220, 165)
		$chkUnbreakable = GUICtrlCreateCheckbox("'����'��� ���", $x, $y, -1, -1)
			$TxtTip = "�������� �� '����'������ ���Ͽ� ������ �����ϵ��� �����մϴ�." ;& @CRLF & "TIP: Set your trophy range on the Misc Tab to '600 - 800' for best results. WARNING: Doing so will DROP you Trophies!"
			GUICtrlSetTip(-1, $TxtTip)
			GUICtrlSetOnEvent(-1, "chkUnbreakable")
		$y += 23
		$lblUnbreakable1 = GUICtrlCreateLabel("���ð� :", $x + 10 , $y + 3, -1, -1, $SS_RIGHT)
		$txtUnbreakable = GUICtrlCreateInput("5", $x + 80, $y, 30, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$TxtTip = "������ �ð����� CoC�� �����ϰ� ������ ���ݿ��� �¸��ϵ��� ����մϴ�. (1-99 ��)"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 2)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$lblUnbreakable2 = GUICtrlCreateLabel("��", $x + 113, $y+3, -1, -1)
		$y += 28
		$lblUnBreakableFarm = GUICtrlCreateLabel("�������", $x + 25 , $y, -1, -1)
		$lblUnBreakableSave = GUICtrlCreateLabel("���Ȱ��", $x + 115 , $y, -1, -1)
		$y += 16
		$txtUnBrkMinGold = GUICtrlCreateInput("50000", $x + 20, $y, 58, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			GUICtrlSetTip(-1, "����Ż��带 �����ϱ� ���� '���' �ּҰ�, �� ���Ϸ� �������� �⺻��Ż���� ��ȯ�˴ϴ�." & @CRLF & "�˻� �Ǵ� ���׷��̵带 ���� �ʿ��� '���'���� �����ϼ���.")
			GUICtrlSetLimit(-1, 7)
			GUICtrlSetState(-1, $GUI_DISABLE)
		GUICtrlCreateIcon($pIconLib, $eIcnGold, $x + 80, $y + 2, 16, 16)
		$txtUnBrkMaxGold = GUICtrlCreateInput("600000", $x + 110, $y, 58, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			GUICtrlSetTip(-1, "����Ż���� ��ȯ�ϱ� ���� '���' �䱸�� " & @CRLF & "���׷��̵� �Ǵ� ������ �����ϵ��� '���'���� �Է��ϼ���.")
			GUICtrlSetLimit(-1, 7)
			GUICtrlSetState(-1, $GUI_DISABLE)
		GUICtrlCreateIcon($pIconLib, $eIcnGold, $x + 170, $y + 2, 16, 16)
		$y += 26
		$txtUnBrkMinElixir = GUICtrlCreateInput("50000", $x + 20, $y, 58, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			GUICtrlSetTip(-1, "����Ż��带 �����ϱ� ���� '������' �ּҰ�, �� ���Ϸ� �������� �⺻��Ż���� ��ȯ�˴ϴ�." & @CRLF & "�˻� �Ǵ� ���׷��̵带 ���� �ʿ��� '������'���� �����ϼ���.")
			GUICtrlSetLimit(-1, 7)
			GUICtrlSetState(-1, $GUI_DISABLE)
		GUICtrlCreateIcon($pIconLib, $eIcnElixir, $x + 80, $y, 16, 16)
		$txtUnBrkMaxElixir = GUICtrlCreateInput("600000", $x + 110, $y, 58, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			GUICtrlSetTip(-1, "����Ż���� ��ȯ�ϱ� ���� '������' �䱸�� " & @CRLF & "���׷��̵� �Ǵ� ������ �����ϵ��� '������'���� �Է��ϼ���.")
			GUICtrlSetLimit(-1, 7)
			GUICtrlSetState(-1, $GUI_DISABLE)
		GUICtrlCreateIcon($pIconLib, $eIcnElixir, $x + 170, $y, 16, 16)
		$y += 24
		$txtUnBrkMinDark = GUICtrlCreateInput("10000", $x + 20, $y, 58, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			GUICtrlSetTip(-1, "����Ż��带 �����ϱ� ���� '��ũ������' �ּҰ�, �� ���Ϸ� �������� �⺻��Ż���� ��ȯ�˴ϴ�." & @CRLF & "�˻� �Ǵ� ���׷��̵带 ���� �ʿ��� '��ũ������'���� �����ϼ���.")
			GUICtrlSetLimit(-1, 6)
			GUICtrlSetState(-1, $GUI_DISABLE)
		GUICtrlCreateIcon($pIconLib, $eIcnDark, $x + 80, $y, 16, 16)
		$txtUnBrkMaxDark = GUICtrlCreateInput("5000", $x + 110, $y, 58, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			GUICtrlSetTip(-1, "����Ż���� ��ȯ�ϱ� ���� '��ũ������' �䱸�� " & @CRLF & "���׷��̵� �Ǵ� ������ �����ϵ��� '��ũ������'���� �Է��ϼ���.")
			GUICtrlSetLimit(-1, 6)
			GUICtrlSetState(-1, $GUI_DISABLE)
		GUICtrlCreateIcon($pIconLib, $eIcnDark, $x + 170, $y, 16, 16)
    GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateTabItem("")
