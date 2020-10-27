@echo off&setlocal enabledelayedexpansion

IF NOT DEFINED SOURCE_DIR SET SOURCE_DIR="%1"
IF not exist "!SOURCE_DIR!" mkdir "!SOURCE_DIR!"&echo SOURCE_DIR: !SOURCE_DIR!
IF NOT DEFINED BUID_DIR SET BUID_DIR=d:\works
IF not exist "!BUID_DIR!" mkdir "!BUID_DIR!"&echo BUID_DIR: !BUID_DIR!
if not defined MY_BITS @echo mozconfig32 or mozconfig64 not exist.&EXIT /B 4
if not defined LIBPORTABLE_PATH @echo Build libportable need this path.&EXIT /B 4
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

