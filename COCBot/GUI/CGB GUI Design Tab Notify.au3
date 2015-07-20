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
;~ Notify Tab
;~ -------------------------------------------------------------
$tabNotify = GUICtrlCreateTabItem("�˸�����")
	Local $x = 30, $y = 150
	$grpPushBullet = GUICtrlCreateGroup("PushBullet �˸�", $x - 20, $y - 20, 450, 375)
	$picPushBullet = GUICtrlCreateIcon ($pIconLib, $eIcnPushBullet, $x, $y, 32, 32)
	$chkPBenabled = GUICtrlCreateCheckbox("�����", $x + 40, $y)
		GUICtrlSetOnEvent(-1, "chkPBenabled")
		GUICtrlSetTip(-1, "PushBullet �����˸��� ����մϴ�.")
	$y += 22
	$chkPBRemote = GUICtrlCreateCheckbox("��������", $x + 40, $y)
		GUICtrlSetTip(-1, "Enables PushBullet Remote function")
		GUICtrlSetState(-1, $GUI_DISABLE)
	$y = 150
	$chkDeleteAllPushes = GUICtrlCreateCheckbox("���۽� �޼�������", $x + 160, $y)
		GUICtrlSetTip(-1, "���α׷� ����� ���� �޾Ҵ� ���� �˸��� ��� �����մϴ�.")
		GUICtrlSetState(-1, $GUI_DISABLE)
	$btnDeletePBmessages = GUICtrlCreateButton("���� ����", $x + 300, $y, 100, 20)
		GUICtrlSetTip(-1, "Pushbullet�� ���Ͽ� ���� ��� �޼����� ���� �����մϴ�.")
		GUICtrlSetOnEvent(-1, "btnDeletePBMessages")
		IF $btnColor then GUICtrlSetBkColor(-1, 0x5CAD85)
		GUICtrlSetState(-1, $GUI_DISABLE)
	$y += 22
	$chkDeleteOldPushes = GUICtrlCreateCheckbox("������ �޼�������", $x + 160, $y)
		GUICtrlSetTip(-1, "�����ð� ������ ���� �޼����� ��� �����մϴ�.")
		GUICtrlSetState(-1, $GUI_DISABLE)
		GUICtrlSetOnEvent(-1, "chkDeleteOldPushes")
	$cmbHoursPushBullet = GUICtrlCreateCombo("", $x + 300, $y, 100, 35, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
		GUICtrlSetTip(-1, "�ð��� ���� �޼����� �����մϴ�.")
		GUICtrlSetData(-1, "1 Hour|2 Hours|3 Hours|4 Hours|5 Hours|6 Hours|7 Hours|8 Hours|9 Hours|10 Hours|11 Hours|12 Hours|13 Hours|14 Hours|15 Hours|16 Hours|17 Hours|18 Hours|19 Hours|20 Hours|21 Hours|22 Hours|23 Hours|24 Hours", "-")
		GUICtrlSetState (-1, $GUI_DISABLE)
	$y += 30
	$lblPushBTokenValue = GUICtrlCreateLabel("Access Token:", $x, $y, -1, -1, $SS_RIGHT)
	$PushBTokenValue = GUICtrlCreateInput("", $x + 120, $y - 3, 280, 19)
		GUICtrlSetTip(-1, "'PushBullet.com'�α����� Setting>Account �������� �ִ� ��ū�� �Է��ϼ���.")
		GUICtrlSetState(-1, $GUI_DISABLE)
	$y += 25
	$lblOrigPush = GUICtrlCreateLabel("�����̸� :", $x, $y, -1, -1, $SS_RIGHT)
		$txtTip = "���� �̸��� �����ϼ��� - '��Ÿ����'���� '������' �׸񿡼� �� �� �ֽ��ϴ�."
		GUICtrlSetTip(-1, $txtTip)
	$OrigPushB = GUICtrlCreateLabel("", $x + 120, $y - 1, 280, 20, $SS_SUNKEN)
		GUICtrlSetBkColor(-1, 0xF0F0F0)
		GUICtrlSetTip(-1, $txtTip)
		GUICtrlSetState(-1, $GUI_DISABLE)
	$y += 25
	$lblNotifyWhen = GUICtrlCreateLabel("������ PushBullet�˸� :", $x, $y, -1, -1, $SS_RIGHT)
	$y += 15
	$chkAlertPBVMFound = GUICtrlCreateCheckbox("�˻�����", $x + 10, $y)
		GUICtrlSetTip(-1, "������ ������ �߰��ϸ� ��Ż���������� �Բ� �޼����� �����մϴ�.")
		GUICtrlSetState(-1, $GUI_DISABLE)
	$chkAlertPBLastRaid = GUICtrlCreateCheckbox("��Ż��Ȳ(����)", $x + 100, $y)
		GUICtrlSetTip(-1, "��Ż��Ȳ�� �����Ͽ� ������ �Բ� �����մϴ�.")
		GUICtrlSetState(-1, $GUI_DISABLE)
	$chkAlertPBLastRaidTxt = GUICtrlCreateCheckbox("��Ż��Ȳ(����)", $x + 210, $y, -1, -1)
		GUICtrlSetState(-1, $GUI_DISABLE)
		GUICtrlSetTip(-1, "��Ż��Ȳ�� �۷� ��Ÿ�� �����մϴ�.")
	$chkAlertPBCampFull = GUICtrlCreateCheckbox("���ռҰ���", $x + 315, $y, -1, -1)
		GUICtrlSetTip(-1, "���ռҰ� ���� á�� �� �޼����� �����մϴ�.")
		GUICtrlSetState(-1, $GUI_DISABLE)
	$y += 20
	$chkAlertPBWallUpgrade = GUICtrlCreateCheckbox("��������", $x + 10, $y, -1, -1)
		 GUICtrlSetTip(-1, "������ ���׷��̵� ���� ��� �޼����� �����մϴ�.")
		 GUICtrlSetState(-1, $GUI_DISABLE)
	$chkAlertPBOOS = GUICtrlCreateCheckbox("����ȭ����", $x + 100, $y, -1, -1)
		GUICtrlSetTip(-1, "������ ����ȭ ������ �߰����� ��� �޼����� �����մϴ�.")
		GUICtrlSetState(-1, $GUI_DISABLE)
	$chkAlertPBVBreak = GUICtrlCreateCheckbox("�޽�", $x + 210, $y, -1, -1)
		GUICtrlSetTip(-1, "�����ð� ������ �����Ͽ� �޽��� �ϰ� �Ǹ� �޼����� �����մϴ�.")
		GUICtrlSetState(-1, $GUI_DISABLE)
	$y += 20
	$chkAlertPBVillage = GUICtrlCreateCheckbox("��������", $x + 10, $y, -1, -1)
		GUICtrlSetTip(-1, "���������� �����մϴ�.")
		GUICtrlSetState(-1, $GUI_DISABLE)
	$chkAlertPBLastAttack = GUICtrlCreateCheckbox("�ֱپ�Ż����", $x + 100, $y, -1, -1)
		GUICtrlSetTip(-1, "�ֱپ�Ż��Ȳ�� �����մϴ�.")
		GUICtrlSetState(-1, $GUI_DISABLE)
	$chkAlertPBOtherDevice = GUICtrlCreateCheckbox("�ٸ��������", $x + 210, $y, -1, -1)
		GUICtrlSetTip(-1, "�ٸ� ��⿡�� �������� ��� �޼����� �����մϴ�.")
		GUICtrlSetState(-1, $GUI_DISABLE)
	$y = 350
	$lblgrppushbullet = GUICtrlCreateGroup("'PushBullet' �������� �ɼ�", $x - 10, $y - 20, 430, 170)
		$lblPBtext = "BOT HELP - ���� �� ������ �����ϴ�." & @CRLF & "" & @CRLF & "BOT DELETE  - ���� ���� ��� �޼����� �����մϴ�." & @CRLF & "" & @CRLF & _
			"BOT <�����̸�> RESTART" & @CRLF & "  <�����̸�>�� ������� 'Bot'�� ��罺���� ������մϴ�." & @CRLF & "" & @CRLF & "BOT <�����̸�> STOP" & @CRLF & "  <�����̸�>�� ������� 'Bot'�� �۾������մϴ�." & @CRLF & "" & @CRLF & _
			"BOT <�����̸�> PAUSE" & @CRLF & "  <�����̸�>�� ������� 'Bot'�� ������ŵ�ϴ�." & @CRLF & "" & @CRLF & "BOT <�����̸�> RESUME" & @CRLF & "  <�����̸�>�� ������� 'Bot'�� �簳�մϴ�." & @CRLF & "" & @CRLF & _
			"BOT <�����̸�> STATS" & @CRLF & "  <�����̸�>�� ���������� �����մϴ�." & @CRLF & "" & @CRLF & "BOT <�����̸�> LOG" & @CRLF & "  <�����̸�>�� ������� 'Bot'�� �ֱ� �α׸� �����մϴ�." & @CRLF & "" & @CRLF & _
			"BOT <�����̸�> LASTRAID" & @CRLF & "  <�����̸�>�� ������� 'Bot'�� �ֱپ�Ż������ �����մϴ�." & @CRLF & "" & @CRLF & "BOT <�����̸�> LASTRAIDTXT" & @CRLF & "   <�����̸�>�� ������� 'Bot'�� �ֱپ�Ż��Ȳ�� �����մϴ�." & @CRLF & "" & @CRLF & _
			"BOT <�����̸�> SCREENSHOT" & @CRLF & "  <�����̸�>�� ���� ������ �������� �����Ͽ� �����մϴ�."
		$lblPBdesc = GUICtrlCreateEdit( $lblPBtext, $x, $y,410, 140, BitOR($ES_MULTILINE, $ES_READONLY, $WS_VSCROLL))
			GUICtrlSetFont(-1,8.5)
			GUICtrlSetBkColor ( -1, $COLOR_WHITE)
		GUICtrlCreateGroup("", -99, -99, 1, 1)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateTabItem("")
