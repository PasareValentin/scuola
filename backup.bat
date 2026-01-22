@echo off
setlocal ENABLEDELAYEDEXPANSION

:START
echo.
set /p SOURCE="Inserisci il percorso o il disco per il backup (es. C:\) : "
set "SOURCE=%SOURCE:"=%"

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

set /p DEST="Inserisci il percorso di destinazione del backup: "
set "DEST=%DEST:"=%"
if not "%DEST:~-1%"=="\" set "DEST=%DEST%\"

if not exist "%DEST%" (
    echo La cartella di destinazione non esiste. Creazione in corso...
    mkdir "%DEST%"
)

set DATA=%DATE:~-4%%DATE:~3,2%%DATE:~0,2%

echo.
echo Avvio backup con XCOPY...
echo Da: %SOURCE%
echo A : %DEST%
echo.

REM Parametri XCOPY:
REM /S (Sottocartelle) /E (Includi vuote) /I (Se dest non esiste, assumi sia cartella)
REM /H (File nascosti) /K (Copia attributi) /Y (Sovrascrivi senza chiedere)
REM /C (Continua anche in caso di errore)

xcopy "%SOURCE%*" "%DEST%" /S /E /I /H /K /Y /C > "%DEST%backup_%DATA%.log"

echo.
echo Backup completato.
pause
goto START
