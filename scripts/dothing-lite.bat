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
@echo msvc version:
dir "C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\VC\Redist\MSVC" /a
@echo windows sdk dll:
dir "c:\Program Files (x86)\Windows Kits\10\Redist\ucrt\DLLs\x64" /a
@echo all environment:
@set
@echo
@echo .........................

