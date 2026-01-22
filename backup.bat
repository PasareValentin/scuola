@echo off
setlocal ENABLEDELAYEDEXPANSION

:START
echo.
set /p SOURCE="Inserisci il percorso o il disco per il backup (es. C:\) : "
set "SOURCE=%SOURCE:"=%"

REM Aggiunge \ finale se manca
if not "%SOURCE:~-1%"=="\" set "SOURCE=%SOURCE%\"

if not exist "%SOURCE%" (
    echo Percorso non valido, riprova.
    pause
    goto START
)

echo.
echo Hai inserito il seguente percorso:
echo   %SOURCE%
echo.

choice /M "Confermi l'avvio del backup?"
if errorlevel 2 (
    echo Operazione annullata dall'utente.
    pause
    goto START
)

REM DESTINAZIONE BACKUP
set /p DEST="Inserisci il percorso di destinazione del backup: "
set "DEST=%DEST:"=%"

if not "%DEST:~-1%"=="\" set "DEST=%DEST%\"

if not exist "%DEST%" (
    echo La cartella di destinazione non esiste. Creazione in corso...
    mkdir "%DEST%"
)

REM DATA PER LOG
set DATA=%DATE:~-4%%DATE:~3,2%%DATE:~0,2%

echo.
echo Avvio backup...
echo Da: %SOURCE%
echo A : %DEST%
echo.

robocopy "%SOURCE%" "%DEST%" ^
 /E ^
 /COPYALL ^
 /R:3 ^
 /W:5 ^
 /XJ ^
 /LOG:"%DEST%backup_%DATA%.log"

echo.
echo Backup completato.
pause
goto
