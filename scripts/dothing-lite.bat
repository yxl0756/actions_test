@echo off&setlocal enabledelayedexpansion

IF NOT DEFINED SOURCE_DIR SET SOURCE_DIR="%1"
IF not exist "!SOURCE_DIR!" mkdir "!SOURCE_DIR!"&echo SOURCE_DIR: !SOURCE_DIR!
IF NOT DEFINED BUID_DIR SET BUID_DIR=d:\works
IF not exist "!BUID_DIR!" mkdir "!BUID_DIR!"&echo BUID_DIR: !BUID_DIR!
if not defined MY_BITS @echo mozconfig32 or mozconfig64 not exist.&EXIT /B 4
echo %MY_BITS%
if not defined LIBPORTABLE_PATH @echo Build libportable need this path.&EXIT /B 4
echo %LIBPORTABLE_PATH%
if %MY_BITS% == win32 @echo we build win32&call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\VC\Auxiliary\Build\vcvars32"
if %MY_BITS% == win64 @echo we build win64&call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\VC\Auxiliary\Build\vcvars64"
echo VC_REDISTDIR=%VCToolsRedistDir% >> %GITHUB_ENV%

@echo 
@echo GITHUB_WORKSPACE: %GITHUB_WORKSPACE%
@dir %GITHUB_WORKSPACE% /a
@echo .........................
@echo PATH: [%PATH%]
@echo
@echo .........................
@cd /d "%GITHUB_WORKSPACE%\..\build"
@mkdir "%GITHUB_WORKSPACE%\..\build\app"
@echo all environment:
@set
@echo
@echo .........................

