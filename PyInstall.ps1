[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

Invoke-WebRequest -Uri "https://www.python.org/ftp/python/3.7.0/python-3.7.0.exe" -OutFile "python-3.7.0.exe"
./python-3.7.0.exe /quiet InstallAllUsers=1 AssociateFiles=1 PrependPath=1 Shortcuts=1 Include_dev=1 Include_exe=1 Include_launcher=1 InstallLauncherAllUsers=1 Include_lib=1 Include_pip=1 Include_tcltk=1 Include_test=1 Include_tools=1
