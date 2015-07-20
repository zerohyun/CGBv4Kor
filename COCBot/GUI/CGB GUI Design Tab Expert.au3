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
;~ Expert Tab
;~ -------------------------------------------------------------
$tabExpert = GUICtrlCreateTabItem("���μ���")
Local $x = 30, $y = 150
$grpOnLoadBot = GUICtrlCreateGroup("�����۾�", $x - 20, $y - 20, 205, 112)
$chkVersion = GUICtrlCreateCheckbox("�ֽŹ���Ȯ��", $x, $y, -1, -1)
$txtTip = "���α׷� ���ý� �ֽŹ����� Ȯ���մϴ�."
GUICtrlSetTip(-1, $txtTip)
GUICtrlSetState(-1, $GUI_CHECKED)
$y += 22
$chkDeleteLogs = GUICtrlCreateCheckbox("�α����ϻ��� :", $x, $y, -1, -1)
$txtTip = "������ �ð� ������ ������ �α������� �����մϴ�."
GUICtrlSetTip(-1, $txtTip)
GUICtrlSetOnEvent(-1, "chkDeleteLogs")
$txtDeleteLogsDays = GUICtrlCreateInput("7", $x + 120, $y, 25, -1, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetTip(-1, $txtTip)
GUICtrlSetLimit(-1, 2)
GUICtrlSetState(-1, $GUI_DISABLE)
$lblDeleteLogsDays = GUICtrlCreateLabel("��", $x + 150, $y + 4, 38, 15)
$y += 22
$chkDeleteTemp = GUICtrlCreateCheckbox("�ӽ����ϻ��� :", $x, $y, -1, -1)
$txtTip = "������ �ð� ������ ������ �ӽ�����(��Ĭ)�� �����մϴ�."
GUICtrlSetTip(-1, $txtTip)
GUICtrlSetOnEvent(-1, "chkDeleteTemp")
$txtDeleteTempDays = GUICtrlCreateInput("7", $x + 120, $y, 25, -1, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetTip(-1, $txtTip)
GUICtrlSetLimit(-1, 2)
GUICtrlSetState(-1, $GUI_DISABLE)
$lblDeleteTempDays = GUICtrlCreateLabel("��", $x + 150, $y + 4, 38, 15)
$y += 22
$chkDeleteLoots = GUICtrlCreateCheckbox("��Ż�̹������� :", $x, $y, -1, -1)
$txtTip = "������ �ð� ������ ������ ��Żȭ�� ���������� �����մϴ�."
GUICtrlSetTip(-1, $txtTip)
GUICtrlSetOnEvent(-1, "chkDeleteLoots")
$txtDeleteLootsDays = GUICtrlCreateInput("7", $x + 120, $y, 25, -1, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetTip(-1, $txtTip)
GUICtrlSetLimit(-1, 2)
GUICtrlSetState(-1, $GUI_DISABLE)
$lblDeleteLootsDays = GUICtrlCreateLabel("��", $x + 150, $y + 4, 38, 15)
GUICtrlCreateGroup("", -99, -99, 1, 1)


Local $x = 30, $y = 265
$grpOnStartBot = GUICtrlCreateGroup("�۾����ۼ���", $x - 20, $y - 20, 205, 115)
$chkAutostart = GUICtrlCreateCheckbox("�ڵ����� :", $x, $y, -1, -1)
GUICtrlSetTip(-1, "���α׷��� ����ǰ� ������ �ð� ���Ŀ� �ڵ����� �����մϴ�.")
GUICtrlSetOnEvent(-1, "chkAutostart")
$txtAutostartDelay = GUICtrlCreateInput("10", $x + 80, $y, 25, -1, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetState(-1, $GUI_DISABLE)
$lblAutostartSeconds = GUICtrlCreateLabel("�� ��", $x + 110, $y + 4, 38, 18)
$y += 22
$chkLanguage = GUICtrlCreateCheckbox("���Ӿ�� Ȯ��(EN)", $x, $y, -1, -1)
GUICtrlSetTip(-1, "���Ӿ� 'English'�� �����Ǿ��ִ��� Ȯ���մϴ�.")
GUICtrlSetState(-1, $GUI_CHECKED)
$y += 22
$chkDisposeWindows = GUICtrlCreateCheckbox("�ڵ�����", $x, $y, -1, -1)
$txtTip = "������ ȭ��󿡼� '���罺��(BS)'�� 'CGBâ(Bot)'�� ��ġ�� �����մϴ�."
GUICtrlSetOnEvent(-1, "chkDisposeWindows")
GUICtrlSetTip(-1, $txtTip)
GUICtrlSetLimit(-1, 2)
$lblOffset = GUICtrlCreateLabel("���� :", $x + 85, $y + 4, -1, -1)
$txtWAOffset = GUICtrlCreateInput("15", $x + 120, $y, 25, -1, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
$txtTip = "'���罺��(BS)'�� 'CGBâ(Bot)'�� ������ �����մϴ�."
GUICtrlSetTip(-1, $txtTip)
GUICtrlSetLimit(-1, 2)
$lblWAOffsetSeconds = GUICtrlCreateLabel("pixs", $x + 150, $y + 4, 38, 18)
$y += 23
$cmbDisposeWindowsCond = GUICtrlCreateCombo("", $x + 15, $y, 165, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "0,0: BS-Bot|0,0: Bot-BS|SNAP: BS ����|SNAP: BS �»��|SNAP: BS ���ϴ�|SNAP: BS ���ϴ�", "SNAP: BS ����")
$txtTip &= @CRLF & "0,0: �տ� �ִ� â�� ������ȭ�� �»������ �̵���Ű��, �ڿ� �ִ� â�� �� ���������� �̵���ŵ�ϴ�." & @CRLF & _
		"SNAP: ���罺�� â�� ��ġ�� Ȯ���Ͽ� Bot�� ��ġ�� ���� ������ ��ġ�� �̵� ��ŵ�ϴ�."
GUICtrlSetTip(-1, $txtTip)
GUICtrlSetState(-1, $GUI_DISABLE)
GUICtrlCreateGroup("", -99, -99, 1, 1)

Local $x = 30, $y = 385
$grpTiming = GUICtrlCreateGroup("Ÿ�̹�", $x - 20, $y - 20, 205, 50)
$lblTrainDelay = GUICtrlCreateLabel("�Ʒð��� :", $x, $y, -1, -1)
$lbltxtTrainITDelay = GUICtrlCreateLabel(" ", $x + 60, $y, 50, 50)
GUICtrlSetTip(-1, "�����PC�� ���Ͽ� �����Ʒð����� ������ŵ�ϴ�.")
$sldTrainITDelay = GUICtrlCreateSlider($x + 105, $y - 5, 70, 25, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS))
GUICtrlSetTip(-1, "�����PC�� ���Ͽ� �����Ʒð����� ������ŵ�ϴ�.")
GUICtrlSetBkColor(-1, $COLOR_WHITE)
_GUICtrlSlider_SetTipSide(-1, $TBTS_BOTTOM)
_GUICtrlSlider_SetTicFreq(-100, 100)
GUICtrlSetLimit(-1, 500, 20) ; change max/min value
GUICtrlSetData(-1, 20) ; default value
GUICtrlSetOnEvent(-1, "sldTrainITDelay")
GUICtrlCreateGroup("", -99, -99, 1, 1)

Local $x = 30, $y = 435
$grpDebug = GUICtrlCreateGroup("Debug", $x - 20, $y - 20, 205, 90)
$chkDebugClick = GUICtrlCreateCheckbox("Ŭ����ǥ Ȯ��", $x, $y, -1, -1)
GUICtrlSetTip(-1, "Debug: �α׿� Ŭ���ϴ� ��ǥ(x,y)�� ����մϴ�.")
GUICtrlCreateGroup("", -99, -99, 1, 1)

Local $x = 240, $y = 150
$grpScheduler = GUICtrlCreateGroup("Ŭ�� �����췯", $x - 20, $y - 20, 240, 235)
$chkDonateHours = GUICtrlCreateCheckbox("�������� �ð�����", $x, $y)
GUICtrlSetOnEvent(-1, "chkDonateHours")
$y += 20
$lbDonateHours1 = GUICtrlCreateLabel(" 0", $x + 30, $y)
GUICtrlSetState(-1, $GUI_DISABLE)
$lbDonateHours2 = GUICtrlCreateLabel(" 1", $x + 45, $y)
GUICtrlSetState(-1, $GUI_DISABLE)
$lbDonateHours3 = GUICtrlCreateLabel(" 2", $x + 60, $y)
GUICtrlSetState(-1, $GUI_DISABLE)
$lbDonateHours4 = GUICtrlCreateLabel(" 3", $x + 75, $y)
GUICtrlSetState(-1, $GUI_DISABLE)
$lbDonateHours5 = GUICtrlCreateLabel(" 4", $x + 90, $y)
GUICtrlSetState(-1, $GUI_DISABLE)
$lbDonateHours6 = GUICtrlCreateLabel(" 5", $x + 105, $y)
GUICtrlSetState(-1, $GUI_DISABLE)
$lbDonateHours7 = GUICtrlCreateLabel(" 6", $x + 120, $y)
GUICtrlSetState(-1, $GUI_DISABLE)
$lbDonateHours8 = GUICtrlCreateLabel(" 7", $x + 135, $y)
GUICtrlSetState(-1, $GUI_DISABLE)
$lbDonateHours9 = GUICtrlCreateLabel(" 8", $x + 150, $y)
GUICtrlSetState(-1, $GUI_DISABLE)
$lbDonateHours10 = GUICtrlCreateLabel(" 9", $x + 165, $y)
GUICtrlSetState(-1, $GUI_DISABLE)
$lbDonateHours11 = GUICtrlCreateLabel("10", $x + 180, $y)
GUICtrlSetState(-1, $GUI_DISABLE)
$lbDonateHours12 = GUICtrlCreateLabel("11", $x + 195, $y)
GUICtrlSetState(-1, $GUI_DISABLE)
$y += 15
$chkDonateHours0 = GUICtrlCreateCheckbox("", $x + 30, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$chkDonateHours1 = GUICtrlCreateCheckbox("", $x + 45, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$chkDonateHours2 = GUICtrlCreateCheckbox("", $x + 60, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$chkDonateHours3 = GUICtrlCreateCheckbox("", $x + 75, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$chkDonateHours4 = GUICtrlCreateCheckbox("", $x + 90, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$chkDonateHours5 = GUICtrlCreateCheckbox("", $x + 105, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$chkDonateHours6 = GUICtrlCreateCheckbox("", $x + 120, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$chkDonateHours7 = GUICtrlCreateCheckbox("", $x + 135, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$chkDonateHours8 = GUICtrlCreateCheckbox("", $x + 150, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$chkDonateHours9 = GUICtrlCreateCheckbox("", $x + 165, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$chkDonateHours10 = GUICtrlCreateCheckbox("", $x + 180, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$chkDonateHours11 = GUICtrlCreateCheckbox("", $x + 195, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$lbDonateHoursAM = GUICtrlCreateLabel("AM", $x + 10, $y + 2)
GUICtrlSetState(-1, $GUI_DISABLE)
$y += 15
$chkDonateHours12 = GUICtrlCreateCheckbox("", $x + 30, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$chkDonateHours13 = GUICtrlCreateCheckbox("", $x + 45, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$chkDonateHours14 = GUICtrlCreateCheckbox("", $x + 60, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$chkDonateHours15 = GUICtrlCreateCheckbox("", $x + 75, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$chkDonateHours16 = GUICtrlCreateCheckbox("", $x + 90, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$chkDonateHours17 = GUICtrlCreateCheckbox("", $x + 105, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$chkDonateHours18 = GUICtrlCreateCheckbox("", $x + 120, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$chkDonateHours19 = GUICtrlCreateCheckbox("", $x + 135, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$chkDonateHours20 = GUICtrlCreateCheckbox("", $x + 150, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$chkDonateHours21 = GUICtrlCreateCheckbox("", $x + 165, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$chkDonateHours22 = GUICtrlCreateCheckbox("", $x + 180, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$chkDonateHours23 = GUICtrlCreateCheckbox("", $x + 195, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$lbDonateHoursPM = GUICtrlCreateLabel("PM", $x + 10, $y + 2)
GUICtrlSetState(-1, $GUI_DISABLE)
$y += 22
$chkRequestCCHours = GUICtrlCreateCheckbox("���ֿ�û �ð�����", $x, $y)
GUICtrlSetOnEvent(-1, "chkRequestCCHours")
$y += 20
$lbRequestCCHours1 = GUICtrlCreateLabel(" 0", $x + 30, $y)
GUICtrlSetState(-1, $GUI_DISABLE)
$lbRequestCCHours2 = GUICtrlCreateLabel(" 1", $x + 45, $y)
GUICtrlSetState(-1, $GUI_DISABLE)
$lbRequestCCHours3 = GUICtrlCreateLabel(" 2", $x + 60, $y)
GUICtrlSetState(-1, $GUI_DISABLE)
$lbRequestCCHours4 = GUICtrlCreateLabel(" 3", $x + 75, $y)
GUICtrlSetState(-1, $GUI_DISABLE)
$lbRequestCCHours5 = GUICtrlCreateLabel(" 4", $x + 90, $y)
GUICtrlSetState(-1, $GUI_DISABLE)
$lbRequestCCHours6 = GUICtrlCreateLabel(" 5", $x + 105, $y)
GUICtrlSetState(-1, $GUI_DISABLE)
$lbRequestCCHours7 = GUICtrlCreateLabel(" 6", $x + 120, $y)
GUICtrlSetState(-1, $GUI_DISABLE)
$lbRequestCCHours8 = GUICtrlCreateLabel(" 7", $x + 135, $y)
GUICtrlSetState(-1, $GUI_DISABLE)
$lbRequestCCHours9 = GUICtrlCreateLabel(" 8", $x + 150, $y)
GUICtrlSetState(-1, $GUI_DISABLE)
$lbRequestCCHours10 = GUICtrlCreateLabel(" 9", $x + 165, $y)
GUICtrlSetState(-1, $GUI_DISABLE)
$lbRequestCCHours11 = GUICtrlCreateLabel("10", $x + 180, $y)
GUICtrlSetState(-1, $GUI_DISABLE)
$lbRequestCCHours12 = GUICtrlCreateLabel("11", $x + 195, $y)
GUICtrlSetState(-1, $GUI_DISABLE)
$y += 15
$chkRequestCCHours0 = GUICtrlCreateCheckbox("", $x + 30, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$chkRequestCCHours1 = GUICtrlCreateCheckbox("", $x + 45, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$chkRequestCCHours2 = GUICtrlCreateCheckbox("", $x + 60, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$chkRequestCCHours3 = GUICtrlCreateCheckbox("", $x + 75, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$chkRequestCCHours4 = GUICtrlCreateCheckbox("", $x + 90, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$chkRequestCCHours5 = GUICtrlCreateCheckbox("", $x + 105, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$chkRequestCCHours6 = GUICtrlCreateCheckbox("", $x + 120, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$chkRequestCCHours7 = GUICtrlCreateCheckbox("", $x + 135, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$chkRequestCCHours8 = GUICtrlCreateCheckbox("", $x + 150, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$chkRequestCCHours9 = GUICtrlCreateCheckbox("", $x + 165, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$chkRequestCCHours10 = GUICtrlCreateCheckbox("", $x + 180, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$chkRequestCCHours11 = GUICtrlCreateCheckbox("", $x + 195, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$lbRequestCCHoursAM = GUICtrlCreateLabel("AM", $x + 10, $y + 2)
GUICtrlSetState(-1, $GUI_DISABLE)
$y += 15
$chkRequestCCHours12 = GUICtrlCreateCheckbox("", $x + 30, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$chkRequestCCHours13 = GUICtrlCreateCheckbox("", $x + 45, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$chkRequestCCHours14 = GUICtrlCreateCheckbox("", $x + 60, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$chkRequestCCHours15 = GUICtrlCreateCheckbox("", $x + 75, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$chkRequestCCHours16 = GUICtrlCreateCheckbox("", $x + 90, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$chkRequestCCHours17 = GUICtrlCreateCheckbox("", $x + 105, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$chkRequestCCHours18 = GUICtrlCreateCheckbox("", $x + 120, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$chkRequestCCHours19 = GUICtrlCreateCheckbox("", $x + 135, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$chkRequestCCHours20 = GUICtrlCreateCheckbox("", $x + 150, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$chkRequestCCHours21 = GUICtrlCreateCheckbox("", $x + 165, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$chkRequestCCHours22 = GUICtrlCreateCheckbox("", $x + 180, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$chkRequestCCHours23 = GUICtrlCreateCheckbox("", $x + 195, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$lbRequestCCHoursPM = GUICtrlCreateLabel("PM", $x + 10, $y + 2)
GUICtrlSetState(-1, $GUI_DISABLE)
$y += 22
$chkDropCCHours = GUICtrlCreateCheckbox("Ŭ���� ��� �ð�����", $x, $y)
GUICtrlSetOnEvent(-1, "chkDropCCHours")
$y += 20
$lbDropCCHours1 = GUICtrlCreateLabel(" 0", $x + 30, $y)
GUICtrlSetState(-1, $GUI_DISABLE)
$lbDropCCHours2 = GUICtrlCreateLabel(" 1", $x + 45, $y)
GUICtrlSetState(-1, $GUI_DISABLE)
$lbDropCCHours3 = GUICtrlCreateLabel(" 2", $x + 60, $y)
GUICtrlSetState(-1, $GUI_DISABLE)
$lbDropCCHours4 = GUICtrlCreateLabel(" 3", $x + 75, $y)
GUICtrlSetState(-1, $GUI_DISABLE)
$lbDropCCHours5 = GUICtrlCreateLabel(" 4", $x + 90, $y)
GUICtrlSetState(-1, $GUI_DISABLE)
$lbDropCCHours6 = GUICtrlCreateLabel(" 5", $x + 105, $y)
GUICtrlSetState(-1, $GUI_DISABLE)
$lbDropCCHours7 = GUICtrlCreateLabel(" 6", $x + 120, $y)
GUICtrlSetState(-1, $GUI_DISABLE)
$lbDropCCHours8 = GUICtrlCreateLabel(" 7", $x + 135, $y)
GUICtrlSetState(-1, $GUI_DISABLE)
$lbDropCCHours9 = GUICtrlCreateLabel(" 8", $x + 150, $y)
GUICtrlSetState(-1, $GUI_DISABLE)
$lbDropCCHours10 = GUICtrlCreateLabel(" 9", $x + 165, $y)
GUICtrlSetState(-1, $GUI_DISABLE)
$lbDropCCHours11 = GUICtrlCreateLabel("10", $x + 180, $y)
GUICtrlSetState(-1, $GUI_DISABLE)
$lbDropCCHours12 = GUICtrlCreateLabel("11", $x + 195, $y)
GUICtrlSetState(-1, $GUI_DISABLE)
$y += 15
$chkDropCCHours0 = GUICtrlCreateCheckbox("", $x + 30, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$chkDropCCHours1 = GUICtrlCreateCheckbox("", $x + 45, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$chkDropCCHours2 = GUICtrlCreateCheckbox("", $x + 60, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$chkDropCCHours3 = GUICtrlCreateCheckbox("", $x + 75, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$chkDropCCHours4 = GUICtrlCreateCheckbox("", $x + 90, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$chkDropCCHours5 = GUICtrlCreateCheckbox("", $x + 105, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$chkDropCCHours6 = GUICtrlCreateCheckbox("", $x + 120, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$chkDropCCHours7 = GUICtrlCreateCheckbox("", $x + 135, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$chkDropCCHours8 = GUICtrlCreateCheckbox("", $x + 150, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$chkDropCCHours9 = GUICtrlCreateCheckbox("", $x + 165, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$chkDropCCHours10 = GUICtrlCreateCheckbox("", $x + 180, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$chkDropCCHours11 = GUICtrlCreateCheckbox("", $x + 195, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$lbDropCCHoursAM = GUICtrlCreateLabel("AM", $x + 10, $y + 2)
GUICtrlSetState(-1, $GUI_DISABLE)
$y += 15
$chkDropCCHours12 = GUICtrlCreateCheckbox("", $x + 30, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$chkDropCCHours13 = GUICtrlCreateCheckbox("", $x + 45, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$chkDropCCHours14 = GUICtrlCreateCheckbox("", $x + 60, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$chkDropCCHours15 = GUICtrlCreateCheckbox("", $x + 75, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$chkDropCCHours16 = GUICtrlCreateCheckbox("", $x + 90, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$chkDropCCHours17 = GUICtrlCreateCheckbox("", $x + 105, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$chkDropCCHours18 = GUICtrlCreateCheckbox("", $x + 120, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$chkDropCCHours19 = GUICtrlCreateCheckbox("", $x + 135, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$chkDropCCHours20 = GUICtrlCreateCheckbox("", $x + 150, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$chkDropCCHours21 = GUICtrlCreateCheckbox("", $x + 165, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$chkDropCCHours22 = GUICtrlCreateCheckbox("", $x + 180, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$chkDropCCHours23 = GUICtrlCreateCheckbox("", $x + 195, $y, 15, 15)
GUICtrlSetState(-1, $GUI_CHECKED + $GUI_DISABLE)
$lbDropCCHoursPM = GUICtrlCreateLabel("PM", $x + 10, $y + 2)
GUICtrlSetState(-1, $GUI_DISABLE)
GUICtrlCreateGroup("", -99, -99, 1, 1)

Local $x = 240, $y = 390
$grpOtherExpert = GUICtrlCreateGroup("��Ÿ�ɼ�", $x - 20, $y - 20, 240, 65)
$chkTotalCampForced = GUICtrlCreateCheckbox("���ռ��ο� �������� :", $x, $y, -1, -1)
GUICtrlSetOnEvent(-1, "chkTotalCampForced")
GUICtrlSetTip(-1, "�����ο��� Ȯ�ε��� ���� ��츦 ���Ͽ� ���ռ� �ο��� ������ �����մϴ�.")
$txtTotalCampForced = GUICtrlCreateInput("200", $x + 145, $y, 35, -1, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetLimit(-1, 3)
GUICtrlSetState(-1, $GUI_DISABLE)
$y += 22
GUICtrlCreateGroup("", -99, -99, 1, 1)

Local $x = 240, $y = 460
$grpOtherExpert = GUICtrlCreateGroup("'��Ĭ' �ɼ�", $x - 20, $y - 20, 240, 65)
$chkScreenshotType = GUICtrlCreateCheckbox("PNG���Ϸ� ����", $x, $y, -1, -1)
GUICtrlSetOnEvent(-1, "chkScreenshotType")
$y += 22
$chkScreenshotHideName = GUICtrlCreateCheckbox("�����̸��� Ŭ���̸� ����", $x, $y, -1, -1)
GUICtrlSetOnEvent(-1, "chkScreenshotHideName")
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateTabItem("")
