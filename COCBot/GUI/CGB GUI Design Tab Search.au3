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
;~ Search Tab
;~ -------------------------------------------------------------

$tabSearch = GUICtrlCreateTabItem("�����˻�")
	Local $x = 30, $y = 150
	$grpSearchMode = GUICtrlCreateGroup("�˻�����", $x - 20, $y - 20, 225, 55)
		$cmbSearchMode = GUICtrlCreateCombo("", $x , $y, 190, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = "Deadbase : �ݱ�/�����Ұ� ��������, ������ �ܰ����� ��κ��� ��Ż�� ������" & @CRLF & _
							"LiveBases: ����Ұ� ��������, ������ ���ʿ��� ��κ��� ��Ż�� ������" & @CRLF & "Dual Mode: �ΰ��� ������ ��� ã��, ���� �߰ߵǴ� ������ ������"
			GUICtrlSetData(-1, "DeadBase|LiveBase|DeadBase and LiveBase", "DeadBase")
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "cmbSearchMode")
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	$x = 260
	$grpAlert = GUICtrlCreateGroup("�˶�", $x - 20, $y - 20, 220, 55)
		$chkAlertSearch = GUICtrlCreateCheckbox("������ ���� ���� �˶�", $x, $y, -1, -1, $BS_MULTILINE)
			GUICtrlSetTip(-1, "������ ������ �߰ߵǸ� �˸����� �Բ� ǳ���������� ���������� ��Ÿ���ϴ�.")
			GUICtrlSetState(-1, $GUI_CHECKED)
#cs		$y += 21
		$btnSearchMode = GUICtrlCreateButton("Search Mode", $x + 90, $y, 100, 25)
			GUICtrlSetOnEvent(-1, "btnSearchMode")
#ce			GUICtrlSetTip(-1, "Does not attack. Searches for a Village that meets conditions.")
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	Local $x = 30, $y = 210
	$grpDeadBaseConditions = GUICtrlCreateGroup("DeadBase ����", $x - 20, $y - 20, 225, 255)
		$chkDBEnableAfter = GUICtrlCreateCheckbox("Base���Ǻ���:", $x, $y, -1, -1)
			$txtTip = "ó������ LiveBase�� �˻��ϰ�, ������ Ƚ�� ���ĺ��� DeadBase�� �˻��մϴ�."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkDBEnableAfter")
			GUICtrlSetState(-1, $GUI_HIDE)
		$txtDBEnableAfter = GUICtrlCreateInput("150", $x + 100, $y, 40, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "���Ȱ��ȭ�� ���� �˻�Ƚ��"
			GUICtrlSetLimit(-1, 3)
			GUICtrlSetTip(-1, $txtTip)
			_GUICtrlEdit_SetReadOnly(-1, True)
			GUICtrlSetState(-1, $GUI_HIDE)
		$lblDBEnableAfter = GUICtrlCreateLabel("�� �˻� ��", $x + 140, $y + 4, -1, -1)
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_HIDE)
		$y += 21
		$cmbDBMeetGE = GUICtrlCreateCombo("", $x , $y, 65, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = "�������� �����ϴ� ������ ã���ϴ�. Gold ""And/Or/Plus"" Elixir" & @CRLF & "AND: �ΰ��� �������� ��� ������ ��, Gold ""and"" Elixir" & @CRLF & "OR: �ΰ��� ������ �� �ϳ��̻��� ������ ��, Gold ""or"" Elixir." _
			& @CRLF & "+ (PLUS): Gold �� Elixir ���� ���� ���� ������ ��"
			GUICtrlSetData(-1, "G And E|G Or E|G + E", "G And E")
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "cmbDBGoldElixir")
		$txtDBMinGold = GUICtrlCreateInput("80000", $x + 80, $y, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "������ ������ ��� �ּҰ�"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 6)
		$picDBMinGold = GUICtrlCreateIcon($pIconLib, $eIcnGold, $x + 131, $y, 16, 16)
			GUICtrlSetTip(-1, $txtTip)
		$y += 21
		$txtDBMinElixir = GUICtrlCreateInput("80000", $x + 80, $y, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "������ ������ ������ �ּҰ�"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 6)
		$picDBMinElixir = GUICtrlCreateIcon($pIconLib, $eIcnElixir, $x + 131, $y, 16, 16)
			GUICtrlSetTip(-1, $txtTip)
		$y -= 21
		$txtDBMinGoldPlusElixir = GUICtrlCreateInput("160000", $x + 80, $y, 50, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "������ ������ ���� �������� ���� �ּҰ�"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 6)
			GUICtrlSetState (-1, $GUI_HIDE)
		$picDBMinGPEGold = GUICtrlCreateIcon($pIconLib, $eIcnGold, $x + 131, $y + 1, 16, 16)
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState (-1, $GUI_HIDE)
		$lblDBMinGPE = GUICtrlCreateLabel("+", $x + 148, $y + 4, -1, -1)
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState (-1, $GUI_HIDE)
		$picDBMinGPEElixir = GUICtrlCreateIcon($pIconLib, $eIcnElixir, $x + 155, $y + 1, 16, 16)
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState (-1, $GUI_HIDE)
		$y += 41
		$chkDBMeetDE = GUICtrlCreateCheckbox("��ũ������", $x , $y, -1, -1)
			$txtTip = "�˻����ǿ� ��ũ������ �ּҰ��� �߰��մϴ�."
			GUICtrlSetOnEvent(-1, "chkDBMeetDE")
			GUICtrlSetTip(-1, $txtTip)
		$txtDBMinDarkElixir = GUICtrlCreateInput("0", $x + 80, $y, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "������ ������ ��ũ������ �ּҰ�"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 5)
			_GUICtrlEdit_SetReadOnly(-1, True)
		$picDBMinDarkElixir = GUICtrlCreateIcon($pIconLib, $eIcnDark, $x + 131, $y, 16, 16)
			GUICtrlSetTip(-1, $txtTip)
		$y += 21
		$chkDBMeetTrophy = GUICtrlCreateCheckbox("Ʈ����", $x, $y, -1, -1)
			$txtTip = "�˻����ǿ� Ʈ���� �ּҰ��� �߰��մϴ�."
			GUICtrlSetOnEvent(-1, "chkDBMeetTrophy")
			GUICtrlSetTip(-1, $txtTip)
		$txtDBMinTrophy = GUICtrlCreateInput("0", $x + 80, $y, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "������ �������� ������ �ִ� Ʈ���� �ּҰ�"
			GUICtrlSetTip(-1, $txtTip)
			_GUICtrlEdit_SetReadOnly(-1, True)
			GUICtrlSetLimit(-1, 2)
		$picDBMinTrophies = GUICtrlCreateIcon($pIconLib, $eIcnTrophy, $x + 131, $y, 16, 16)
			GUICtrlSetTip(-1, $txtTip)
		$y += 21
		$chkDBMeetTH = GUICtrlCreateCheckbox("����ȸ��", $x, $y, -1, -1)
			$txtTip = "�˻����ǿ� ����ȸ�� �ִ뷹���� �߰��մϴ�."
			GUICtrlSetOnEvent(-1, "chkDBMeetTH")
			GUICtrlSetTip(-1, $txtTip)
		$cmbDBTH = GUICtrlCreateCombo("", $x + 80, $y - 1, 50, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = "������ ������ ����ȸ�� �ִ뷹��"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_DISABLE)
			GUICtrlSetData(-1, "4-6|7|8|9|10", "4-6")
		$picDBMaxTH1 = GUICtrlCreateIcon($pIconLib, $eIcnTH1, $x + 131, $y - 3, 24, 24)
			GUICtrlSetTip(-1, $txtTip)
		$lblDBMaxTH = GUICtrlCreateLabel("-", $x + 156, $y + 1, -1, -1)
			GUICtrlSetTip(-1, $txtTip)
		$picDBMaxTH10 = GUICtrlCreateIcon($pIconLib, $eIcnTH10, $x + 160, $y - 3, 24, 24)
			GUICtrlSetTip(-1, $txtTip)
		$y += 21
		$chkDBMeetTHO = GUICtrlCreateCheckbox("�ܰ��� ��ġ�� ����ȸ��", $x, $y, -1, -1)
			$txtTip = "����ȸ���� �ܰ��� ����� ������ �˻��մϴ�. (�����ۿ� ��ġ��)"
			GUICtrlSetTip(-1, $txtTip)
		$y += 21
		$chkDBWeakBase = GUICtrlCreateCheckbox("WeakBase", $x, $y, -1, -1)
			$txtTip = "���ǹ��� ���� ������ �˻��մϴ�."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkDBWeakBase")
		$cmbDBWeakMortar = GUICtrlCreateCombo("", $x + 80, $y, 50, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = "������ ������ �ڰ��� �ִ뷹��"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetData(-1, "-|Lvl 1|Lvl 2|Lvl 3|Lvl 4|Lvl 5|Lvl 6|Lvl 7|Lvl 8", "Lvl 5")
			GUICtrlSetState(-1, $GUI_DISABLE)
		$picDBWeakMortar = GUICtrlCreateIcon($pIconLib, $eIcnMortar, $x + 131, $y - 3, 24, 24)
			GUICtrlSetTip(-1, $txtTip)
		$y +=23
		$cmbDBWeakWizTower = GUICtrlCreateCombo("", $x + 80, $y, 50, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = "������ ������ ������Ÿ�� �ִ뷹��"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetData(-1, "-|Lvl 1|Lvl 2|Lvl 3|Lvl 4|Lvl 5|Lvl 6|Lvl 7|Lvl 8", "Lvl 4")
			GUICtrlSetState(-1, $GUI_DISABLE)
		$picDBWeakWizTower = GUICtrlCreateIcon($pIconLib, $eIcnWizTower, $x + 131, $y - 2, 24, 24)
			GUICtrlSetTip(-1, $txtTip)
		$y += 30
		$chkDBMeetOne = GUICtrlCreateCheckbox("�ϳ����ɷ���", $x, $y, -1, -1)
			$txtTip = "������ ������ �Ѱ��� �̻� �����ϴ� ������ �����մϴ�."
			GUICtrlSetTip(-1, $txtTip)
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	Local $x = 260, $y = 210
	$grpLiveBaseConditions = GUICtrlCreateGroup("LiveBase ����", $x - 20, $y - 20, 220, 255)
		$chkABEnableAfter = GUICtrlCreateCheckbox("Base���Ǻ���:", $x, $y, -1, -1)
			$txtTip = "ó������ DeadBase�� �˻��ϰ�, ������ Ƚ�� ���ĺ��� LiveBase�� �˻��մϴ�."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkABEnableAfter")
			GUICtrlSetState(-1, $GUI_HIDE)
		$txtABEnableAfter = GUICtrlCreateInput("150", $x + 100, $y, 40, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "���Ȱ��ȭ�� ���� �˻�Ƚ��"
			GUICtrlSetLimit(-1, 3)
			GUICtrlSetTip(-1, $txtTip)
			_GUICtrlEdit_SetReadOnly(-1, True)
			GUICtrlSetState(-1, $GUI_HIDE)
		$lblABEnableAfter = GUICtrlCreateLabel("�� �˻� ��", $x + 140, $y + 4, -1, -1)
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_HIDE)
		$y += 21
		$cmbABMeetGE = GUICtrlCreateCombo("", $x , $y, 65, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = "�������� �����ϴ� ������ ã���ϴ�. Gold ""And/Or/Plus"" Elixir" & @CRLF & "AND: �ΰ��� �������� ��� ������ ��, Gold ""and"" Elixir" & @CRLF & "OR: �ΰ��� ������ �� �ϳ��̻��� ������ ��, Gold ""or"" Elixir." _
			& @CRLF & "+ (PLUS): Gold �� Elixir ���� ���� ���� ������ ��"
			GUICtrlSetData(-1, "G And E|G Or E|G + E", "G + E")
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "cmbABGoldElixir")
		$txtABMinGold = GUICtrlCreateInput("80000", $x + 80, $y, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "������ ������ ��� �ּҰ�"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 6)
			GUICtrlSetState (-1, $GUI_HIDE)
		$picABMinGold = GUICtrlCreateIcon($pIconLib, $eIcnGold, $x + 131, $y, 16, 16)
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState (-1, $GUI_HIDE)
		$y += 21
		$txtABMinElixir = GUICtrlCreateInput("80000", $x + 80, $y, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "������ ������ ������ �ּҰ�"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 6)
			GUICtrlSetState (-1, $GUI_HIDE)
		$picABMinElixir = GUICtrlCreateIcon($pIconLib, $eIcnElixir, $x + 131, $y, 16, 16)
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState (-1, $GUI_HIDE)
		$y -= 21
		$txtABMinGoldPlusElixir = GUICtrlCreateInput("160000", $x + 80, $y, 50, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
		$txtTip = "������ ������ ���� �������� ���� �ּҰ�"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 6)
		$picABMinGPEGold = GUICtrlCreateIcon($pIconLib, $eIcnGold, $x + 131, $y + 1, 16, 16)
			GUICtrlSetTip(-1, $txtTip)
		$lblABMinGPE = GUICtrlCreateLabel("+", $x + 148, $y +4, -1, -1)
			GUICtrlSetTip(-1, $txtTip)
		$picABMinGPEElixir = GUICtrlCreateIcon($pIconLib, $eIcnElixir, $x + 155, $y + 1, 16, 16)
			GUICtrlSetTip(-1, $txtTip)
		$y += 41
		$chkABMeetDE = GUICtrlCreateCheckbox("��ũ������", $x , $y, -1, -1)
			$txtTip = "�˻����ǿ� ��ũ������ �ּҰ��� �߰��մϴ�."
			GUICtrlSetOnEvent(-1, "chkABMeetDE")
			GUICtrlSetTip(-1, $txtTip)
		$txtABMinDarkElixir = GUICtrlCreateInput("0", $x + 80, $y, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "������ ������ ��ũ������ �ּҰ�"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 5)
			_GUICtrlEdit_SetReadOnly(-1, True)
		$picABMinDarkElixir = GUICtrlCreateIcon($pIconLib, $eIcnDark, $x + 131, $y, 16, 16)
			GUICtrlSetTip(-1, $txtTip)
		$y += 21
		$chkABMeetTrophy = GUICtrlCreateCheckbox("Ʈ����", $x, $y, -1, -1)
			$txtTip = "�˻����ǿ� Ʈ���� �ּҰ��� �߰��մϴ�."
			GUICtrlSetOnEvent(-1, "chkABMeetTrophy")
			GUICtrlSetTip(-1, $txtTip)
		$txtABMinTrophy = GUICtrlCreateInput("0", $x + 80, $y, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "������ �������� ������ �ִ� Ʈ���� �ּҰ�"
			GUICtrlSetTip(-1, $txtTip)
			_GUICtrlEdit_SetReadOnly(-1, True)
			GUICtrlSetLimit(-1, 2)
		$picABMinTrophies = GUICtrlCreateIcon($pIconLib, $eIcnTrophy, $x + 131, $y, 16, 16)
			GUICtrlSetTip(-1, $txtTip)
		$y += 21
		$chkABMeetTH = GUICtrlCreateCheckbox("����ȸ��", $x, $y, -1, -1)
			$txtTip = "�˻����ǿ� ����ȸ�� �ִ뷹���� �߰��մϴ�."
			GUICtrlSetOnEvent(-1, "chkABMeetTH")
			GUICtrlSetTip(-1, $txtTip)
		$cmbABTH = GUICtrlCreateCombo("", $x + 80, $y - 1, 50, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = "������ ������ ����ȸ�� �ִ뷹��"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_DISABLE)
			GUICtrlSetData(-1, "4-6|7|8|9|10", "4-6")
		$picABMaxTH1 = GUICtrlCreateIcon($pIconLib, $eIcnTH1, $x + 131, $y - 3, 24, 24)
			GUICtrlSetTip(-1, $txtTip)
		$lblABMaxTH = GUICtrlCreateLabel("-", $x + 156, $y + 1, -1, -1)
			GUICtrlSetTip(-1, $txtTip)
		$picABMaxTH10 = GUICtrlCreateIcon($pIconLib, $eIcnTH10, $x + 160, $y - 3, 24, 24)
			GUICtrlSetTip(-1, $txtTip)
		$y += 21
		$chkABMeetTHO = GUICtrlCreateCheckbox("�ܰ��� ��ġ�� ����ȸ��", $x, $y, -1, -1)
			$txtTip = "����ȸ���� �ܰ��� ����� ������ �˻��մϴ�. (�����ۿ� ��ġ��)"
			GUICtrlSetTip(-1, $txtTip)
		$y += 21
		$chkABWeakBase = GUICtrlCreateCheckbox("WeakBase", $x, $y, -1, -1)
			$txtTip = "���ǹ��� ���� ������ �˻��մϴ�."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkABWeakBase")
		$cmbABWeakMortar = GUICtrlCreateCombo("", $x + 80, $y, 50, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = "������ ������ �ڰ��� �ִ뷹��"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetData(-1, "-|Lvl 1|Lvl 2|Lvl 3|Lvl 4|Lvl 5|Lvl 6|Lvl 7|Lvl 8", "Lvl 5")
			GUICtrlSetState(-1, $GUI_DISABLE)
		$picABWeakMortar = GUICtrlCreateIcon($pIconLib, $eIcnMortar, $x + 131, $y - 3, 24, 24)
			GUICtrlSetTip(-1, $txtTip)
		$y +=23
		$cmbABWeakWizTower = GUICtrlCreateCombo("", $x + 80, $y, 50, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = "������ ������ ������Ÿ�� �ִ뷹��"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetData(-1, "-|Lvl 1|Lvl 2|Lvl 3|Lvl 4|Lvl 5|Lvl 6|Lvl 7|Lvl 8", "Lvl 4")
			GUICtrlSetState(-1, $GUI_DISABLE)
		$picABWeakWizTower = GUICtrlCreateIcon($pIconLib, $eIcnWizTower, $x + 131, $y - 2, 24, 24)
			GUICtrlSetTip(-1, $txtTip)
		$y += 30
		$chkABMeetOne = GUICtrlCreateCheckbox("�ϳ����ɷ���", $x, $y, -1, -1)
			$txtTip = "������ ������ �Ѱ��� �̻� �����ϴ� ������ �����մϴ�."
			GUICtrlSetTip(-1, $txtTip)
		For $i = $cmbABMeetGE To $chkABMeetOne
			GUICtrlSetState($i, $GUI_DISABLE)
		Next
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	Local $x = 30, $y = 470
	$grpSearchReduction = GUICtrlCreateGroup("���������", $x - 20, $y - 20, 450, 55)
		$chkSearchReduction = GUICtrlCreateCheckbox("�ڵ���� :", $x , $y, -1, -1)
			$txtTip = "�� �ɼ��� Ȱ��ȭ �ϸ� �Ź� ������ Ƚ����ŭ �˻� ���� �ڵ����� �˻����� ���� �˻��մϴ�."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetOnEvent(-1, "chkSearchReduction")
		$txtSearchReduceCount = GUICtrlCreateInput("20", $x + 80, $y, 35, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "�������� ���߱� ���� �˻� Ƚ���� �Է��ϼ���."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 3)
		$lblSearchReduceCount = GUICtrlCreateLabel("�� �˻�����", $x + 120, $y + 3, -1, -1)
		$x += 200
		$y -= 9
		$lblSearchReduceGold = GUICtrlCreateLabel("-", $x - 5, $y + 3, -1, 17)
			$txtTip = "�Է��� ����ŭ ��� �������� ���缭 �˻��մϴ�."
			GUICtrlSetTip(-1, $txtTip)
		$txtSearchReduceGold = GUICtrlCreateInput("2000", $x + 5, $y, 40, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 5)
		$picSearchReduceGold = GUICtrlCreateIcon($pIconLib, $eIcnGold, $x + 46, $y, 16, 16)
			GUICtrlSetTip(-1, $txtTip)
		$y += 21
		$lblSearchReduceElixir = GUICtrlCreateLabel("-", $x - 5, $y + 3, -1, 17)
			$txtTip = "�Է��� ����ŭ ������ �������� ���缭 �˻��մϴ�."
			GUICtrlSetTip(-1, $txtTip)
		$txtSearchReduceElixir = GUICtrlCreateInput("2000", $x + 5, $y, 40, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 5)
		$picSearchReduceElixir = GUICtrlCreateIcon($pIconLib, $eIcnElixir, $x + 46, $y, 16, 16)
			GUICtrlSetTip(-1, $txtTip)
		$x += 75
		$y -= 10
		$lblSearchReduceGoldPlusElixir = GUICtrlCreateLabel("-", $x - 5, $y + 3, -1, 17)
			$txtTip = "�Է��� ����ŭ ���� �������� ���� �������� ���缭 �˻��մϴ�."
			GUICtrlSetTip(-1, $txtTip)
		$txtSearchReduceGoldPlusElixir = GUICtrlCreateInput("4000", $x + 5, $y, 40, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 5)
		$picSearchReduceGPEGold = GUICtrlCreateIcon($pIconLib, $eIcnGold, $x + 46, $y + 1, 16, 16)
			GUICtrlSetTip(-1, $txtTip)
		$lblSearchReduceGPE = GUICtrlCreateLabel("+", $x + 62, $y + 3, -1, -1)
			GUICtrlSetTip(-1, $txtTip)
		$picSearchReduceGPEElixir = GUICtrlCreateIcon($pIconLib, $eIcnElixir, $x + 69, $y + 1, 16, 16)
			GUICtrlSetTip(-1, $txtTip)
		$x += 95
		$y -= 11
		$lblSearchReduceDark = GUICtrlCreateLabel("-", $x - 5, $y + 3, -1, 17)
			$txtTip = "�Է��� ����ŭ ��ũ������ �������� ���缭 �˻��մϴ�."
			GUICtrlSetTip(-1, $txtTip)
		$txtSearchReduceDark = GUICtrlCreateInput("100", $x + 5, $y, 35, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 3)
		$picSearchReduceDark = GUICtrlCreateIcon($pIconLib, $eIcnDark, $x + 41, $y, 16, 16)
			GUICtrlSetTip(-1, $txtTip)
		$y += 21
		$lblSearchReduceTrophy = GUICtrlCreateLabel("-", $x - 5, $y + 3, -1, 17)
			$txtTip = "�Է��� ����ŭ Ʈ���� �������� ���缭 �˻��մϴ�."
			GUICtrlSetTip(-1, $txtTip)
		$txtSearchReduceTrophy = GUICtrlCreateInput("2", $x + 5, $y, 35, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 1)
		$picSearchReduceTrophy = GUICtrlCreateIcon($pIconLib, $eIcnTrophy, $x + 41, $y, 16, 16)
			GUICtrlSetTip(-1, $txtTip)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateTabItem("")
