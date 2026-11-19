@echo off
rem Stub E2E de TaskCodeTwo TASK-041 (F5-1): la forma de OpenDockTrading
rem (scripts\verificar.bat): no lee argumentos, corre sus pasos con :paso y
rem sale con 0 si todos pasan o con 1 en el primero que falla.
setlocal
cd /d "%~dp0..\.."
echo stub ODT: argumentos recibidos: [%*]
call :paso "paso uno" "cmd /c exit 0" || goto :fallo
call :paso "paso dos" "cmd /c exit 0" || goto :fallo
echo verificar: todo en verde
exit /b 0

:fallo
echo verificar: FALLA el paso %PASO%
exit /b 1

:paso
set "PASO=%~1"
echo == %PASO%
call %~2
if not "%errorlevel%"=="0" exit /b 1
exit /b 0
