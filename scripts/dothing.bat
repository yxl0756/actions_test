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
@cd /d "!SOURCE_DIR!"
@git clone --depth=1 https://cppinfo@git.code.sf.net/p/libportable/gitweb mozillabuild-src
@cd /d "!SOURCE_DIR!\mozillabuild-src"
@if exist bin.7z 7z x bin.7z -aoa -o!BUID_DIR!
@if exist clang-msvc-9.0.1.7z 7z x clang-msvc-9.0.1.7z -aoa -o!BUID_DIR!
@if exist nodejs.7z 7z x nodejs.7z -aoa -o!BUID_DIR!
@if exist nsis301.7z 7z x nsis301.7z -aoa -o!BUID_DIR!
@if exist kdiff3.7z 7z x kdiff3.7z -aoa -o!BUID_DIR!
@if exist rust-1.43.1.7z 7z x rust-1.43.1.7z -aoa -o!BUID_DIR!
@if exist rust-tools.7z 7z x rust-tools.7z -aoa -o!BUID_DIR!
@if exist python-2.7.18.7z 7z x python-2.7.18.7z -aoa -o!BUID_DIR!
@if exist python-3.7.7.7z 7z x python-3.7.7.7z -aoa -o!BUID_DIR!\mozillabuild
@if exist msys2-20200605.7z 7z x msys2-20200605.7z -aoa -o!BUID_DIR!\mozillabuild
@if exist msys2do.7z 7z x msys2do.7z -aoa -o!BUID_DIR!

@if not exist "!BUID_DIR!\mozillabuild\clang" @echo clang not exist&EXIT /B 4
@if not exist "!BUID_DIR!\mozillabuild\msys2" @echo msys not exist&EXIT /B 4
@if not exist "!BUID_DIR!\mozillabuild\nodejs" @echo nodejs not exist&EXIT /B 4
@if not exist "!BUID_DIR!\mozillabuild\rust" @echo rust not exist&EXIT /B 4
@if not exist "!BUID_DIR!\mozillabuild\python" @echo python not exist&EXIT /B 4
@if not exist "!BUID_DIR!\mozillabuild\python3" @echo python3 not exist&EXIT /B 4
@if not exist "!BUID_DIR!\mozillabuild\msys2do.exe" @echo msysdo not exist&EXIT /B 4
@echo .........................
@echo msvc version:
dir "C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\VC\Redist\MSVC" /a
dir "C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\VC\Redist\MSVC\14.25.28508\x64" /a
@echo windows sdk dll:
dir "c:\Program Files (x86)\Windows Kits\10\Redist\ucrt\DLLs\x64" /a
@echo all environment:
@set
@echo
@echo .........................
!BUID_DIR!\mozillabuild\msys2do.exe ls -la /d/works/mozillabuild

