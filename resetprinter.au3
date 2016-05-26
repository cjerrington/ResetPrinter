#pragma compile(Out, reset printer.exe)
; Uncomment to use the following icon. Make sure the file path is correct and matches the installation of your AutoIt install path.
#pragma compile(Icon, printer.ico)
#pragma compile(Compatibility, win7)
#pragma compile(UPX, False)
#pragma compile(FileDescription, Reset printer queue)
#pragma compile(ProductName, Reset Printer queue)
#pragma compile(ProductVersion, 1.1)
#pragma compile(FileVersion, 1.1.0.1, 1.1.1.1)
#pragma compile(LegalCopyright, © Clayton Errington)
#pragma compile(LegalTrademarks, 'None')
#pragma compile(CompanyName, 'Clayton Erington & Co')

#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>

#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("Reset Printer Queue", 291, 186, 875, 410)
$StatusBar1 = _GUICtrlStatusBar_Create($Form1)
_GUICtrlStatusBar_SetSimple($StatusBar1)
_GUICtrlStatusBar_SetText($StatusBar1, "Created by Clayton Errington")
_GUICtrlStatusBar_SetMinHeight($StatusBar1, 25)
$sResetqueue = GUICtrlCreateButton("Reset Printer", 64, 65, 161, 65)
GUICtrlSetFont(-1, 15, 800, 0, "MS Sans Serif")
$Label1 = GUICtrlCreateLabel("This program will stop print services, delete items in" & @CRLF & " the print queue, and start the print services again.", 16, 16, 246, 50)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

 Do
   $msg = GUIGetMsg()
	Select
	   Case $msg = $sResetqueue
		  ResetPrinter()
	   Case $msg = $GUI_EVENT_CLOSE
		  Exit
    EndSelect
Until $msg = $GUI_EVENT_CLOSE

Func ResetPrinter()
   ProgressOn("Reset Printer Queue", "Reset Printer Queue", "Working...")
   RunWait(@ComSpec & " /c " & "net stop spooler", @WindowsDir, @SW_HIDE)
   Sleep(1000)
   ProgressSet(33, "Print Spooler Stopped...")
   RunWait(@ComSpec & " /c " & "del /Q /F C:\Windows\System32\spool\PRINTERS\*.* ", @WindowsDir, @SW_HIDE)
   Sleep(1000)
   ProgressSet(66, "Print queue Deleted...")
   RunWait(@ComSpec & " /c " & "net start spooler", @WindowsDir, @SW_HIDE)
   Sleep(1000)
   ProgressSet(90, "Print Spooler Restarted...")
   Sleep(1000)
   ProgressSet(100, "Done", "Complete")
   Sleep(750)
   ProgressOff()
   MsgBox(0,"Reset Printer Queue","Printer Spooler and files have been deleted.",10)
EndFunc
