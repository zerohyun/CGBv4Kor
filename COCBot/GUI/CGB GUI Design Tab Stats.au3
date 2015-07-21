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
;~ This dummy is used in btnStart and btnStop to disable/enable all labels, text, buttons etc. on all tabs.
;~ -------------------------------------------------------------
Global $LastControlToHide = GUICtrlCreateDummy()
Global $iPrevState[$LastControlToHide + 1]
;~ -------------------------------------------------------------

;~ -------------------------------------------------------------
;~ Stats Tab
;~ -------------------------------------------------------------
$tabStats = GUICtrlCreateTabItem("��Ż��Ȳ")
Local $x = 30, $y = 150
	$grpResourceOnStart = GUICtrlCreateGroup("�ʱ���Ȳ", $x - 20, $y - 20, 110, 105)
		$lblResultStatsTemp = GUICtrlCreateLabel("ù �����" & @CRLF & "����������" & @CRLF & "�Է��մϴ�.", $x - 5, $y + 5, 100, 65, BITOR($SS_LEFT, $BS_MULTILINE))
		GUICtrlCreateIcon ($pIconLib, $eIcnGold, $x + 60, $y, 16, 16)
		$lblResultGoldStart = GUICtrlCreateLabel("", $x, $y + 2, 55, 17, $SS_RIGHT)
			$txtTip = "�� ����� ������ '���'��"
			GUICtrlSetTip(-1, $txtTip)
		$y +=20
		GUICtrlCreateIcon ($pIconLib, $eIcnElixir, $x + 60, $y, 16, 16)
		$lblResultElixirStart = GUICtrlCreateLabel("", $x, $y + 2, 55, 17, $SS_RIGHT)
			$txtTip = "�� ����� ������ '������'��"
			GUICtrlSetTip(-1, $txtTip)
		$y +=20
		$picResultDEStart = GUICtrlCreateIcon ($pIconLib, $eIcnDark, $x + 60, $y, 16, 16)
		$lblResultDEStart = GUICtrlCreateLabel("", $x, $y + 2, 55, 17, $SS_RIGHT)
			$txtTip = "�� ����� ������ '��ũ������'��"
			GUICtrlSetTip(-1, $txtTip)
		$y +=20
		GUICtrlCreateIcon ($pIconLib, $eIcnTrophy, $x + 60, $y, 16, 16)
		$lblResultTrophyStart = GUICtrlCreateLabel("", $x, $y + 2, 55, 17, $SS_RIGHT)
			$txtTip = "�� ����� ������ 'Ʈ����'"
			GUICtrlSetTip(-1, $txtTip)
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	$x = 145
	$y = 150
	$grpLastAttack = GUICtrlCreateGroup("�ֱپ�Ż��Ȳ", $x - 20, $y - 20, 110, 105)
		$lblLastAttackTemp = GUICtrlCreateLabel("�� ���ݸ���" & @CRLF & "��Ż��Ȳ��" & @CRLF & "�ֽ�ȭ�Ͽ�" & @CRLF & "�Է��մϴ�.", $x - 5, $y + 5, 100, 65, BITOR($SS_LEFT, $BS_MULTILINE))
		GUICtrlCreateIcon ($pIconLib, $eIcnGold, $x + 60, $y, 16, 16)
		$lblGoldLastAttack = GUICtrlCreateLabel("", $x, $y + 2, 55, 17, $SS_RIGHT)
			$txtTip = "������ ���ݿ��� ȹ���� '���'��"
			GUICtrlSetTip(-1, $txtTip)
		$y +=20
		GUICtrlCreateIcon ($pIconLib, $eIcnElixir, $x + 60, $y, 16, 16)
		$lblElixirLastAttack = GUICtrlCreateLabel("", $x, $y + 2, 55, 17, $SS_RIGHT)
			$txtTip = "������ ���ݿ��� ȹ���� '������'��"
			GUICtrlSetTip(-1, $txtTip)
		$y +=20
		$picDarkLastAttack = GUICtrlCreateIcon ($pIconLib, $eIcnDark, $x + 60, $y, 16, 16)
		$lblDarkLastAttack = GUICtrlCreateLabel("", $x, $y + 2, 55, 17, $SS_RIGHT)
			$txtTip = "������ ���ݿ��� ȹ���� '��ũ������'��"
			GUICtrlSetTip(-1, $txtTip)
		$y +=20
		GUICtrlCreateIcon ($pIconLib, $eIcnTrophy, $x + 60, $y, 16, 16)
		$lblTrophyLastAttack = GUICtrlCreateLabel("", $x, $y + 2, 55, 17, $SS_RIGHT)
			$txtTip = "������ ���ݿ��� ȹ���� 'Ʈ����'"
			GUICtrlSetTip(-1, $txtTip)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$x = 260
	$y = 150
	$grpTotalLoot = GUICtrlCreateGroup("�Ѿ�Ż��Ȳ", $x - 20, $y - 20, 110, 105)
		$lblTotalLootTemp = GUICtrlCreateLabel("�� ���ݸ���" & @CRLF & "��Ż��Ȳ��" & @CRLF & "�ֽ�ȭ�Ͽ�" & @CRLF & "�Է��մϴ�.", $x - 5, $y + 5, 100, 65, BITOR($SS_LEFT, $BS_MULTILINE))
		GUICtrlCreateIcon ($pIconLib, $eIcnGold, $x + 60, $y, 16, 16)
		$lblGoldLoot =  GUICtrlCreateLabel("", $x - 5, $y + 2, 60, 17, $SS_RIGHT)
			$txtTip = "���ݱ��� ȹ���� �� '���'��" & @CRLF & "(���׷��̵忡 �Ҹ�� �ڿ��� ���ԵǾ� ��Ÿ���ϴ�.)"
			GUICtrlSetTip(-1, $txtTip)
		$y +=20
		GUICtrlCreateIcon ($pIconLib, $eIcnElixir, $x + 60, $y, 16, 16)
		$lblElixirLoot =  GUICtrlCreateLabel("", $x - 5, $y + 2, 60, 17, $SS_RIGHT)
			$txtTip = "���ݱ��� ȹ���� �� '������'��" & @CRLF & "(���׷��̵忡 �Ҹ�� �ڿ��� ���ԵǾ� ��Ÿ���ϴ�.)"
			GUICtrlSetTip(-1, $txtTip)
		$y +=20
		$picDarkLoot = GUICtrlCreateIcon ($pIconLib, $eIcnDark, $x + 60, $y, 16, 16)
		$lblDarkLoot =  GUICtrlCreateLabel("", $x - 5, $y + 2, 60, 17, $SS_RIGHT)
			$txtTip = "���ݱ��� ȹ���� �� '��ũ������'��" & @CRLF & "(���׷��̵忡 �Ҹ�� �ڿ��� ���ԵǾ� ��Ÿ���ϴ�.)"
			GUICtrlSetTip(-1, $txtTip)
		$y +=20
		GUICtrlCreateIcon ($pIconLib, $eIcnTrophy, $x + 60, $y, 16, 16)
		$lblTrophyLoot = GUICtrlCreateLabel("", $x - 5, $y + 2, 60, 17, $SS_RIGHT)
			$txtTip = "���ݱ��� ȹ���� �� 'Ʈ����'"
			GUICtrlSetTip(-1, $txtTip)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$x = 375
	$y = 150
	$grpHourlyStats = GUICtrlCreateGroup("���(/h)", $x - 20, $y - 20, 105, 105)
		$lblHourlyStatsTemp = GUICtrlCreateLabel("�� ���ݸ���" & @CRLF & "��Ż��Ȳ��" & @CRLF & "�ֽ�ȭ�Ͽ�" & @CRLF & "�Է��մϴ�.", $x - 5, $y + 5, 100, 65, BITOR($SS_LEFT, $BS_MULTILINE))
		GUICtrlCreateIcon ($pIconLib, $eIcnGold, $x + 60, $y, 16, 16)
			$lblHourlyStatsGold = GUICtrlCreateLabel("", $x, $y + 2, 55, 17, $SS_RIGHT)
			$txtTip = "�ð��� ��Ż�� '���'��"
			GUICtrlSetTip(-1, $txtTip)
		$y +=20
		GUICtrlCreateIcon ($pIconLib, $eIcnElixir, $x + 60, $y, 16, 16)
		$lblHourlyStatsElixir = GUICtrlCreateLabel("", $x, $y + 2, 55, 17, $SS_RIGHT)
			$txtTip = "�ð��� ��Ż�� '������'��"
			GUICtrlSetTip(-1, $txtTip)
		$y +=20
		$picHourlyStatsDark = GUICtrlCreateIcon ($pIconLib, $eIcnDark, $x + 60, $y, 16, 16)
		$lblHourlyStatsDark = GUICtrlCreateLabel("", $x, $y + 2, 55, 17, $SS_RIGHT)
			$txtTip = "�ð��� ��Ż�� '��ũ������'��"
			GUICtrlSetTip(-1, $txtTip)
		$y +=20
		GUICtrlCreateIcon ($pIconLib, $eIcnTrophy, $x + 60, $y, 16, 16)
		$lblHourlyStatsTrophy = GUICtrlCreateLabel("", $x, $y + 2, 55, 17, $SS_RIGHT)
			$txtTip = "�ð��� ȹ���� 'Ʈ����'"
			GUICtrlSetTip(-1, $txtTip)
    GUICtrlCreateGroup("", -99, -99, 1, 1)

	$x = 270
	$y = 240
#cs $btnMoreStats = GUICtrlCreateButton ("�߰���Ȳ", $x, $y, 60,21)
		GUICtrlSetState(-1, $GUI_DISABLE)
	$x += 60
	$btnExportCSV = GUICtrlCreateButton (".CSV����", $x, $y, 60,21)
		GUICtrlSetState(-1, $GUI_DISABLE)
#ce
	$btnResetStats = GUICtrlCreateButton ("��Ȳ�ʱ�ȭ", $x-5, $y, 70,21)
		GUICtrlSetOnEvent(-1, "btnResetStats")
		GUICtrlSetTip(-1, "��� ��Ȳ�� �ʱ�ȭ �մϴ�.")
		GUICtrlSetState(-1, $GUI_DISABLE)
	$x += 65
	$btnLoots = GUICtrlCreateButton ("Loots", $x, $y, 60,21)
    GUICtrlSetOnEvent(-1, "btnLoots")
	$x += 60
    $btnLogs = GUICtrlCreateButton ("Logs", $x, $y, 60,21)
        GUICtrlSetOnEvent(-1, "btnLogs")

	$x = 30
	$y = 280
	$grpStatsMisc = GUICtrlCreateGroup("��Ÿ��Ȳ", $x - 20, $y - 20, 450, 60)
		$y -=2
		GUICtrlCreateIcon ($pIconLib, $eIcnTH1, $x - 10, $y + 7, 24, 24)
		GUICtrlCreateIcon ($pIconLib, $eIcnTH10, $x + 16, $y + 7, 24, 24)
        $lblvillagesattacked = GUICtrlCreateLabel("���� :", $x + 45, $y + 2, -1, 17)
        $lblresultvillagesattacked = GUICtrlCreateLabel("0", $x + 65, $y + 2, 60, 17, $SS_RIGHT)
			$txtTip = "������ ������ ��"
			GUICtrlSetTip(-1, $txtTip)
		$y += 17
        $lblvillagesskipped = GUICtrlCreateLabel("��ŵ :", $x + 45, $y + 2, -1, 17)
        $lblresultvillagesskipped = GUICtrlCreateLabel("0", $x + 65, $y + 2, 60, 17, $SS_RIGHT)
			$txtTip = "�������� �ʰ� ��ŵ�� ������ ��"
			GUICtrlSetTip(-1, $txtTip)
		$x = 175
		$y = 278
		GUICtrlCreateIcon ($pIconLib, $eIcnTrophy, $x, $y, 16, 16)
        $lbltrophiesdropped = GUICtrlCreateLabel("Ʈ���� :", $x + 20, $y + 2, -1, 17)
        $lblresulttrophiesdropped = GUICtrlCreateLabel("0", $x + 95, $y + 2, 30, 17, $SS_RIGHT)
			$txtTip = "'Ʈ����' ���� ��"
			GUICtrlSetTip(-1, $txtTip)
        $y += 17
        GUICtrlCreateIcon ($pIconLib, $eIcnHourGlass, $x, $y, 16, 16)
        $lblruntime = GUICtrlCreateLabel("����ð� : ", $x + 20, $y + 2, -1, 17)
        $lblresultruntime = GUICtrlCreateLabel("00:00:00", $x + 65, $y + 2, 60, 17, $SS_RIGHT)
			$txtTip = "���α׷� ���� �ð�"
			GUICtrlSetTip(-1, $txtTip)
		$x = 330
		$y = 278
		GUICtrlCreateIcon ($pIconLib, $eIcnWall, $x - 7, $y + 7, 24, 24)
        $lblwallbygold = GUICtrlCreateLabel("'���'��� :", $x + 20, $y + 2, -1, 17)
		$lblWallgoldmake =  GUICtrlCreateLabel("0", $x + 55, $y + 2, 60, 17, $SS_RIGHT)
			$txtTip = "'���'�� ����Ͽ� ���׷��̵��� ������ ��"
			GUICtrlSetTip(-1, $txtTip)
		$y += 17
		$lblwallbyelixir = GUICtrlCreateLabel("'������'��� :", $x + 20, $y + 2, -1, 17)
		$lblWallelixirmake =  GUICtrlCreateLabel("0", $x + 55, $y + 2, 60, 17, $SS_RIGHT)
			$txtTip = "'������'�� ����Ͽ� ���׷��̵��� ������ ��"
			GUICtrlSetTip(-1, $txtTip)
        ;$lbloutofsync = GUICtrlCreateLabel("Out Of Sync :", 260, 263, 100, 17) ; another stats next post
        ;$lblresultoutofsync = GUICtrlCreateLabel("0", 380, 263, 60, 17, $SS_RIGHT) ; another stats next post
	GUICtrlCreateGroup("", -99, -99, 1, 1)
