@echo off&setlocal enabledelayedexpansion

IF NOT DEFINED SOURCE_DIR SET SOURCE_DIR="%1"
IF not exist "!SOURCE_DIR!" mkdir "!SOURCE_DIR!"&echo SOURCE_DIR: !SOURCE_DIR!
IF NOT DEFINED BUID_DIR SET BUID_DIR=d:\works
IF not exist "!BUID_DIR!" mkdir "!BUID_DIR!"&echo BUID_DIR: !BUID_DIR!
@echo 
@echo GITHUB_WORKSPACE: %GITHUB_WORKSPACE%
@dir %GITHUB_WORKSPACE% /a
@echo .........................
@echo PATH: [%PATH%]
@echo
@echo .........................
@cd /d "%GITHUB_WORKSPACE%\..\build"
@mkdir "%GITHUB_WORKSPACE%\..\build\app"
%~dp0symchk /r c:\windows\system32 /s SRV*%GITHUB_WORKSPACE%\..\build\app\*https://msdl.microsoft.com/download/symbols
@echo all environment:
@set
@echo
@echo .........................

