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

;~ ------------------------------------------------------
;~ Lower part visible on all Tabs
;~ ------------------------------------------------------
;Local $btnColor = True
Local $btnColor = False

;~ Buttons
Local $x = 15, $y = 525
$grpButtons = GUICtrlCreateGroup("�������(https://gamebot.org)", $x - 5, $y - 10, 190, 85)
	$btnStart = GUICtrlCreateButton("����", $x, $y + 2 +5, 90, 40-5)
		GUICtrlSetOnEvent(-1, "btnStart")
		IF $btnColor then GUICtrlSetBkColor(-1, 0x5CAD85)
	$btnStop = GUICtrlCreateButton("����", -1, -1, 90, 40-5)
		GUICtrlSetOnEvent(-1, "btnStop")
		IF $btnColor then GUICtrlSetBkColor(-1, 0xDB4D4D)
		GUICtrlSetState(-1, $GUI_HIDE)
 	$btnPause = GUICtrlCreateButton("����", $x + 90, -1, 90, 40-5)
		$txtTip = "��ư�� ������ ""�簳""��ư�� ���������� ��� �ൿ�� �����մϴ�."
		GUICtrlSetTip(-1, $txtTip)
		GUICtrlSetOnEvent(-1, "btnPause")
 		IF $btnColor then GUICtrlSetBkColor(-1,  0xFFA500)
		GUICtrlSetState(-1, $GUI_HIDE)
	$btnResume = GUICtrlCreateButton("�簳", -1, -1, 90, 40-5)
 		$txtTip = "��ư�� ���� �۾��� �̾���ϴ�."
		GUICtrlSetTip(-1, $txtTip)
		GUICtrlSetOnEvent(-1, "btnResume")
		IF $btnColor then GUICtrlSetBkColor(-1,  0xFFA500)
		GUICtrlSetState(-1, $GUI_HIDE)
	$btnMakeScreenshot = GUICtrlCreateButton("��Ĭ", $x , $y + 45, 40, -1)
		$txtTip = "���� ȭ���� �����մϴ�. ��ġ : ""Profiles\Num\Temp\"""
		GUICtrlSetTip(-1, $txtTip)
		GUICtrlSetOnEvent(-1, "btnMakeScreenshot")
		IF $btnColor then GUICtrlSetBkColor(-1, 0x5CAD85)
	$btnHide = GUICtrlCreateButton("�����", $x + 40, $y + 45, 50, -1)
		$txtTip = "��罺���� ȭ�� ������ �̵���ŵ�ϴ�." & @CRLF & "(�ּ�ȭ���� �ʰ� �����)"
		GUICtrlSetTip(-1, $txtTip)
		GUICtrlSetOnEvent(-1, "btnHide")
		IF $btnColor Then GUICtrlSetBkColor(-1, 0x22C4F5)
		GUICtrlSetState(-1, $GUI_DISABLE)
	$chkBackground = GUICtrlCreateCheckbox("��Ȱ��" , $x + 100, $y + 48, 60, 20, BITOR($BS_MULTILINE, $BS_CENTER))
		$txtTip = "���� ��Ȱ������ ����մϴ�." & @CRLF & "�� ����� ����ϸ� ��罺�� ""�����""�� ����� �� �ֽ��ϴ�."
		;GUICtrlSetFont(-1, 7)
		GUICtrlSetTip(-1, $txtTip)
		GUICtrlSetOnEvent(-1, "chkBackground")
		GUICtrlSetState(-1, $GUI_UNCHECKED)
	$btnAttackNowDB = GUICtrlCreateButton("DB Attack!", $x + 190, $y - 4, 60, -1)
		GUICtrlSetOnEvent(-1, "btnAttackNowDB")
		GUICtrlSetState(-1, $GUI_HIDE)
	$btnAttackNowLB = GUICtrlCreateButton("LB Attack!", $x + 190, $y + 23, 60, -1)
		GUICtrlSetOnEvent(-1, "btnAttackNowLB")
		GUICtrlSetState(-1, $GUI_HIDE)
	$btnAttackNowTS = GUICtrlCreateButton("Ȧġ��!", $x + 190, $y + 50, 60, -1)
		GUICtrlSetOnEvent(-1, "btnAttackNowTS")
		GUICtrlSetState(-1, $GUI_HIDE)
GUICtrlCreateGroup("", -99, -99, 1, 1)

$pic2arrow = GUICtrlCreatePic(@ScriptDir & "\Icons\2arrow.jpg", $x + 187, $y + 10, 50, 45)
$lblVersion = GUICtrlCreateLabel($sBotVersion, 205, $y + 60, 60, 17, $SS_CENTER)
	GUICtrlSetColor(-1, $COLOR_MEDGRAY)

;~ Village
Local $x = 290, $y = 535
$grpVillage = GUICtrlCreateGroup("����", $x - 20, $y - 20, 190, 85)
	$lblResultGoldNow = GUICtrlCreateLabel("", $x, $y + 2, 50, 15, $SS_RIGHT)
	$picResultGoldNow = GUICtrlCreateIcon ($pIconLib, $eIcnGold, $x + 60, $y, 16, 16)
		GUICtrlSetState(-1, $GUI_HIDE)
	$picResultGoldTemp = GUICtrlCreateIcon ($pIconLib, $eIcnGold, $x - 5, $y, 16, 16)
	$lblResultElixirNow = GUICtrlCreateLabel("", $x, $y + 22, 50, 15, $SS_RIGHT)
	$picResultElixirNow = GUICtrlCreateIcon ($pIconLib, $eIcnElixir, $x + 60, $y + 20, 16, 16)
		GUICtrlSetState(-1, $GUI_HIDE)
	$picResultElixirTemp = GUICtrlCreateIcon ($pIconLib, $eIcnElixir, $x - 5, $y + 20, 16, 16)
	$lblResultDENow = GUICtrlCreateLabel("", $x, $y + 42, 50, 15, $SS_RIGHT)
	$picResultDENow = GUICtrlCreateIcon ($pIconLib, $eIcnDark, $x + 60, $y + 40, 16, 16)
		GUICtrlSetState(-1, $GUI_HIDE)
	$picResultDETemp = GUICtrlCreateIcon ($pIconLib, $eIcnDark, $x - 5, $y + 40, 16, 16)
	$x += 80
	$lblResultTrophyNow = GUICtrlCreateLabel("", $x, $y + 2, 50, 15, $SS_RIGHT)
	$picResultTrophyNow = GUICtrlCreateIcon ($pIconLib, $eIcnTrophy, $x + 59, $y , 16, 16)
	$lblResultBuilderNow = GUICtrlCreateLabel("", $x, $y + 22, 50, 15, $SS_RIGHT)
	$picResultBuilderNow = GUICtrlCreateIcon ($pIconLib, $eIcnBuilder, $x + 59, $y + 20, 16, 16)
	$lblResultGemNow = GUICtrlCreateLabel("", $x, $y + 42, 50, 15, $SS_RIGHT)
	$picResultGemNow = GUICtrlCreateIcon ($pIconLib, $eIcnGem, $x + 60, $y + 40, 16, 16)
	$x = 290
	$lblVillageReportTemp = GUICtrlCreateLabel("ù �����" & @CRLF & "����������" & @CRLF & "�Է��մϴ�.", $x + 27, $y + 5, 100, 45, BITOR($SS_LEFT,$BS_MULTILINE))
GUICtrlCreateGroup("", -99, -99, 1, 1)
