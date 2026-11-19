@echo off
rem Stub E2E de TaskCodeTwo TASK-041 (F5-1): el contrato de argumentos de
rem ToolsaWeb (scripts\verificar.bat, lineas 68-79), sin sus pasos. Sin
rem argumentos es la completa; admite --selectiva, --pesada y --rapida; otro
rem argumento sale con 2. La completa sale en rojo si existe fallar.txt.
setlocal
cd /d "%~dp0.."
if "%~1"=="" goto :modo_completa
if not "%~2"=="" goto :argumentos_malos
if /i "%~1"=="--selectiva" goto :modo_selectiva
if /i "%~1"=="--pesada" goto :pesada
if /i "%~1"=="--rapida" goto :rapida
:argumentos_malos
echo [error] argumentos no validos: %*
exit /b 2
:modo_completa
echo stub ToolsaWeb: completa RAMA_BASE=%RAMA_BASE% TC2_PERFIL=%TC2_PERFIL%
if exist fallar.txt goto :rojo
echo stub ToolsaWeb: completa en verde
exit /b 0
:modo_selectiva
echo stub ToolsaWeb: selectiva RAMA_BASE=%RAMA_BASE%
exit /b 0
:pesada
echo stub ToolsaWeb: pesada TC2_PERFIL=%TC2_PERFIL%
exit /b 0
:rapida
echo stub ToolsaWeb: rapida
exit /b 0
:rojo
echo stub ToolsaWeb: fallar.txt presente, completa en rojo
exit /b 1
