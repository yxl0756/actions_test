@echo off&setlocal enabledelayedexpansion

IF NOT DEFINED SOURCE_DIR SET SOURCE_DIR="%1"
IF not exist "!SOURCE_DIR!" mkdir "!SOURCE_DIR!"&echo SOURCE_DIR: !SOURCE_DIR!
IF NOT DEFINED BUID_DIR SET BUID_DIR=d:\works
IF not exist "!BUID_DIR!" mkdir "!BUID_DIR!"&echo BUID_DIR: !BUID_DIR!
@echo 
@echo GITHUB_WORKSPACE: %GITHUB_WORKSPACE%
@dir %GITHUB_WORKSPACE% /a
@echo
call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\VC\Auxiliary\Build\vcvars64"
@echo .........................
@set PATH=%PATH%;!BUID_DIR!\mozillabuild\bin;!BUID_DIR!\mozillabuild\clang\bin
@echo PATH: [%PATH%]
@IF NOT DEFINED LIBPORTABLE_PATH echo not defined LIBPORTABLE_PATH&exit /B 4
@IF NOT DEFINED MY_BITS echo not defined MY_BITS&exit /B 4
@echo "LIBPORTABLE_PATH: %LIBPORTABLE_PATH%"
@echo "MY_BITS: %MY_BITS%"
@cd /d "!BUID_DIR!"
::@cd /d "!SOURCE_DIR!"
::@git clone --depth=1 https://github.com/adonais/libportable.git libportable-src
::@echo libportable-src:
::@dir "!SOURCE_DIR!\libportable-src" /a
::@del /q !BUID_DIR!\*.gz !BUID_DIR!\*.7z
::@dir "!BUID_DIR!" /a
::@cd /d "!SOURCE_DIR!\libportable-src"
::nmake -f Makefile.msvc clean
::nmake -f Makefile.msvc install
::@if not "%errorlevel%" == "0" exit /B %errorlevel%

@echo .........................
@echo msvc version:
dir "C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\VC\Redist\MSVC" /a
dir "C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\VC\Redist\MSVC\14.25.28508\x64" /a
@echo windows sdk dll:
dir "c:\Program Files (x86)\Windows Kits\10\Redist\ucrt\DLLs\x64" /a
@echo all environment:
@set
