@echo off
setlocal

echo Pulizia file temporanei...

del /q /f "%TEMP%\*" 2>nul
for /d %%D in ("%TEMP%\*") do rd /s /q "%%D" 2>nul

del /q /f "C:\Windows\Temp\*" 2>nul
for /d %%D in ("C:\Windows\Temp\*") do rd /s /q "%%D" 2>nul

echo File temporanei eliminati.
echo.

set SOURCE=J:\

set DESKTOP=%USERPROFILE%\Desktop
set BACKUPDIR=%DESKTOP%\Backup_J

if not exist "%BACKUPDIR%" mkdir "%BACKUPDIR%"

REM Data per il log
set DATA=%DATE:~-4%%DATE:~3,2%%DATE:~0,2%

echo Avvio backup automatico...
echo Da: %SOURCE%
echo A : %BACKUPDIR%
echo.

xcopy "%SOURCE%*" "%BACKUPDIR%\" /S /E /I /H /K /Y /C > "%BACKUPDIR%\backup_%DATA%.log"

echo.
echo Backup completato con successo.
pause

