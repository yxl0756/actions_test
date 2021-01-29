@echo off&setlocal enabledelayedexpansion

IF NOT DEFINED SOURCE_DIR SET SOURCE_DIR="%1"
IF not exist "!SOURCE_DIR!" mkdir "!SOURCE_DIR!"&echo SOURCE_DIR: !SOURCE_DIR!
IF NOT DEFINED BUID_DIR SET BUID_DIR=d:\works
IF not exist "!BUID_DIR!" mkdir "!BUID_DIR!"&echo BUID_DIR: !BUID_DIR!
if not defined MY_BITS @echo mozconfig32 or mozconfig64 not exist.&EXIT /B 4
echo %MY_BITS%
if not defined LIBPORTABLE_PATH @echo Build libportable need this path.&EXIT /B 4
echo %LIBPORTABLE_PATH%
if not defined VC_REDISTDIR @echo VC_REDISTDIR not defined..&EXIT /B 4
echo %VC_REDISTDIR%
clang --version
IF not ERRORLEVEL 0 @echo clang not in PATH.&EXIT /B 4
@echo 
@echo GITHUB_WORKSPACE: %GITHUB_WORKSPACE%
@dir %GITHUB_WORKSPACE% /a
@echo .........................
@echo PATH: [%PATH%]
@echo
@echo .........................
@cd /d "!BUID_DIR!"
@git config --global http.postBuffer 524288000
@git config --global http.lowSpeedLimit 0
@git config --global http.lowSpeedTime 999999
@git clone https://gitee.com/libportable/mozillabuild.git mozillabuild-src
@cd /d "!BUID_DIR!\mozillabuild-src"
@if exist bin.7z 7z x bin.7z -aoa -o!BUID_DIR!
@if not exist "!BUID_DIR!\mozillabuild\bin" @echo mozbin not exist&EXIT /B 4
@cd /d "%GITHUB_WORKSPACE%\..\build"
@mkdir "%GITHUB_WORKSPACE%\..\build\app"
@echo all environment:
@set
@echo
@echo .........................

