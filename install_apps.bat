@echo off
echo Starting app installations...

:: %~dp0 refers to the drive and path of the currently running .bat file.
:: Apps_installers is the sub folder containing the installers
cd /d "%~dp0Apps_installers"

:: EXE installers (silent flags vary by app)
start /wait "" "7z2409-x64.exe" /S
start /wait "" "AcroRdrDC2500120577_en_US.exe" /sAll
start /wait "" "ChromeSetup.exe" /silent /install
start /wait "" "Firefox-Installer.exe" /silent /install
start /wait "" "Linkus-lite-win-setup.exe" /S
start /wait "" "MSTeamsSetup.exe" /quiet
start /wait "" "Office365EntSetup.exe" /configure config.xml
start /wait "" "ZoomInstallerFull.exe" /quiet


:: MSI installers
msiexec /i "AnyDesk.msi" /qn /norestart
msiexec /i "MomSmartClient_x64.msi_windows_x64_2024.3.2.3.msi" /qn /norestart
msiexec /i "pdfsam-5.1.3.msi" /qn /norestart

echo Installing VPN tools...

:: Change directory to the VPN folder
cd /d "%~dp0VPN"
:: Install VPN
start /wait "" "FortiClientVPN.exe" /quiet

echo All installations completed.

pause
