@echo off
setlocal

:start
set /p Percorso="Inserisci il percorso dove eliminare i file .tmp: "
set "Percorso=%Percorso:"=%"

if not "%Percorso:~-1%"=="\" set "Percorso=%Percorso%\"

if not exist "%Percorso%" (
    echo Percorso non valido.
    pause
    goto start
)

echo.
echo Eliminazione dei file .tmp in %Percorso%...
del /q "%Percorso%*.tmp" 2>nul

echo Pulizia eseguita.
pause
goto start
