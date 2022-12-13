
cd C:\Users\runneradmin

echo Setup SSHTunnel
Invoke-WebRequest https://raw.githubusercontent.com/Qadary-Yemen/RDP/Pro/ssh.zip -OutFile ssh.zip
Expand-Archive ssh.zip ".ssh"
echo Starting Tunnel on SSH
ssh -i .ssh/QaYe.GitServer.pem QaYe.GitServer@QaYe-22388.portmap.io -N -R 22388:localhost:3389 -v keys
echo Tunnel has been Stopped!
pause