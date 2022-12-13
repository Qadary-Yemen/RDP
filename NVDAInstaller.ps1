
echo Starting Setup Server to use with Screen Readers.
echo Developed By: QaYe<qadary.yemen@gmail.com>
echo Run Audio Service
start-service AudioSrv

echo Disable Defender
Set-ExecutionPolicy Unrestricted

Set-MpPreference -DisableRealtimeMonitoring $true
Set-MpPreference -SubmitSamplesConsent NeverSend
Set-MpPreference -MAPSReporting Disable

echo Downloading Requirements.
Invoke-WebRequest https://raw.githubusercontent.com/Qadary-Yemen/rdp/pro/Disable_blocking_of_downloaded_files.reg -OutFile Disable_blocking_of_downloaded_files.reg
regedit /s  Disable_blocking_of_downloaded_files.reg
Invoke-WebRequest https://www.nvaccess.org/files/nvda/releases/2022.3.2/nvda_2022.3.2.exe -OutFile NVDAInstaller.exe
Invoke-WebRequest "https://archive.org/download/nvdaconfigger_202212/NVDAConfigger.zip" -OutFile NVDAConfigger.zip
expand-Archive ./NVDAConfigger.zip
echo Installing NVDA
start ./NVDAInstaller.exe "--install --enable-start-on-logon=True"
echo  Adding ports Required to Firewall
netsh advfirewall firewall add rule name="NVDA TCP Port 6837" dir=in action=allow protocol=TCP localport=6837
netsh advfirewall firewall add rule name="NVDA UDP Port 6837" dir=in action=allow protocol=UDP localport=6837
netsh advfirewall firewall add rule name="MainServ TCP Port 8260" dir=in action=allow protocol=TCP localport=8260
netsh advfirewall firewall add rule name="MainServUDP Port 8260" dir=in action=allow protocol=UDP localport=8260

echo Setting NVDA
start ./NVDAConfigger/NVDAConfigger.exe
echo Copying Settings to System.
echo cp '~\AppData\Roaming\nvda\*' 'C:\Program Files (x86)\NVDA\systemConfig' -Force
echo Done.
