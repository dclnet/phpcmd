@echo off
@setlocal
set CMD_PHP_PATH=%~dp0
if "%PHP_COMMAND%" == "" set PHP_COMMAND=php.exe
"%PHP_COMMAND%" "%CMD_PHP_PATH%cmd" %*
@endlocal