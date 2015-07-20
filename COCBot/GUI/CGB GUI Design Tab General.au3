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
Global $FirstControlToHide = GUICtrlCreateDummy()
;~ -------------------------------------------------------------

;~ -------------------------------------------------------
;~ General Tab
;~ -------------------------------------------------------

$tabGeneral = GUICtrlCreateTabItem("�α׹ڽ�")
Local $x = 30, $y = 150, $w = 450, $h = 170
	$txtLog = _GUICtrlRichEdit_Create($frmBot, _PadStringCenter(" BOT LOG ", 71, "="), $x - 20, $y - 20, $w, $h + 85, BitOR($ES_MULTILINE, $ES_READONLY, $WS_VSCROLL, 8912), $WS_EX_STATICEDGE)
	_GUICtrlRichEdit_SetFont($txtLog, 8, "Lucida Console")
	_GUICtrlRichEdit_AppendTextColor($txtLog, "" & @CRLF, _ColorConvert($Color_Black))
		_ArrayConcatenate($G, $A)
	$y += $h + 85
	$iDividerHeight = 4
	$divider = GUICtrlCreateLabel("", $x - 20, $y - 20, $w, $iDividerHeight, $SS_SUNKEN + $SS_BLACKRECT)
	GUICtrlSetCursor(-1, 11)
	GUICtrlSetResizing(-1, $GUI_DOCKTOP + $GUI_DOCKBOTTOM + $GUI_DOCKWIDTH + $GUI_DOCKLEFT)
	$y += $iDividerHeight
	$txtAtkLog = _GUICtrlRichEdit_Create($frmBot, "", $x - 20, $y - 20, $w, $h - 85, BitOR($ES_MULTILINE, $ES_READONLY, $WS_VSCROLL, 8912), $WS_EX_STATICEDGE)
	$y = 480
	$lblLog = GUICtrlCreateLabel("��Ÿ�� :", $x - 20, $y + 5, -1, -1)
	$cmbLog = GUICtrlCreateCombo("", $x + 30, $y, 180, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
		$txtTip = "������ �α׹�(BotLog/Atk.Log)�� ũ�⸦ �����մϴ�."
		GUICtrlSetTip(-1, $txtTip)
		GUICtrlSetData(-1, "��������(�߾Ӽ� �̿�)|����ũ��|BotLog(ŭ) / Atk.Log(����)|BotLog(����) / Atk.Log(ŭ)|Bot Log�� ����|Attack Log�� ����", "��������(�߾Ӽ� �̿�)")
		GUICtrlSetOnEvent(-1, "cmbLog")
	$btnAtkLogClear = GUICtrlCreateButton("Atk.Log û��", $x + 220, $y - 1, 100, 23)
		$txtTip = "Attack Logâ�� ���ϴ�."
		GUICtrlSetTip(-1, $txtTip)
		GUICtrlSetOnEvent(-1, "btnAtkLogClear")
		IF $btnColor Then GUICtrlSetBkColor(-1, 0x22C4F5)
	$btnAtkLogCopyClipboard = GUICtrlCreateButton("Atk.Log ����", $x + 320, $y - 1, 100, 23)
		$txtTip = "Atk.Log�� Clipboard�� �����մϴ�. (CTRL+C)"
		GUICtrlSetTip(-1, $txtTip)
		GUICtrlSetOnEvent(-1, "btnAtkLogCopyClipboard")
		IF $btnColor Then GUICtrlSetBkColor(-1, 0x22C4F5)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateTabItem("")
