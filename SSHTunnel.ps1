echo setting  workDirs 
cd C:\Users\runneradmin
mkdir .ssh
cd .ssh
echo Setup SSHTunnel
ssh-keygen.exe -f QaYe.GitServer -q -P '""'

echo deleting Public Key.
del -path QaYe.GitServer.pub
echo replace PRIVATE Key.

echo "-----BEGIN RSA PRIVATE KEY-----
MIIEowIBAAKCAQEAxuSiKGhKxLJI26H4+26zd4LwgRVWtrUieBeyOZ/y+A2gCcXL
HH5qbiVyNBmA9pEBBhypWCBE3FNW376l1AQIda991k/6HFHSP9H3UscK3hMkNIeD
XSHLjbqIZmra42DPv9+KK2MTr1WZf632GvWq3UZseltloXc28C+jndwJKoX+O4yy
YHQJS0XzNoM0B2ZPijDozBz2rzfWA/LzPDAxq7DDqCO3Eo/lnW8P51R4mgzykcci
CjRq37jkFtfQcuJMgDsQr3IMY93trX/SvTPgPZtHEWe2Eew7wJMA6GvfHj9RlVeY
fBTLGZ4eBAOTqpUyEWnxgT34avJeNOz9r05aNQIDAQABAoIBAGVYRtB0I/UKK1nO
tMHZbJUvIUGFEARVU9UBrgzy1alTuAKCyLYiLDUn24N0o2QACxeELz36Y1wpExE7
YeAglfbxjxtO8VDQ2GMwp+eECKOT+VTS4DrqZ4A2Vh5pwFMwF2vbidoFyBgFdAu9
JrQiDghmRAws2iJmTpYgkCx13C3P5jxncEFi2Ch/+ZAn1ljvFh3K3bjHKwLvQc+5
hu3mn0T3CwQVScJ75bYgf1RI6vBUtWOI83NTtt6F4vIVOkRoYxoBQbNnY1smH/pL
TJJUoCC0Zxtws3e8BvAZUU3kBGFOXdfrQvtKnB2aNlf1Er/8to37AKCvTCV6RG0R
CWq+xEECgYEA9NK3DTTErmxbF6cHd2XeqyOXWTG1LIItLa1tFleJjqbmDQKGp6+W
fY53dq4PUBekq+oiQJ8QWvFOG5xWTbJUCeYRyKQKvqX0eiVVujrQXNm2igX5OrHn
Vf7nm5Ex+MmRWBWQlP+9RyHaeqoF0PG+5OOPwquZ2afiw/lajfys7B0CgYEAz/kg
nTT7rn8+fmbTxRagGqpzwXdB59+Y31OhVT06VlSrb6aTvUj1U57fZLCg7UGxeTvL
pdnoBS6Dyzkk01coaa5CRmYhagaDbELiXZVQjyue4wnuNOfJ6OYM9WRPRUW1sXOQ
iCJ/uIZN32fyq4wOYdN9AVDhjKv7pAzj0Lx82vkCgYEAw9hUSqItvAI+FHuvQ1og
d/LuvZFAByzTiziyjS7VgWINodaldTrHPgVbl3rCESX4uvV/FQaphLaH7xpvB5Ri
GdEL5N8lIUGMgrGfFGy8Baq7lUoWB1gNYQOarx3FRemo9Te7AxZZia+RIJMmN/FK
7bsEY4v2dOESTAcK445/nhkCgYA0i27wCSjlh4SUjwpGK1c8JYCliqn+GYIYOpry
XEvW8AF4bg+5rSs+e09Zsz6VcxmR1ce4GXwDgyMNP1zMgKLXQI3CF5+tmAOwYJ2s
o0L9SToVhrbGayGaVDVF8pgMmnYzZU1I995pEpWuMicfrH0dvj9BC9xQnEsxwYf1
fwnUkQKBgGrAKq5eXLQ4wy5tpl884lE9paxbEyfuSNju0H2MP3JZbk0DVaZShguE
nBQgsouUfDtY8JRg935hY016XDn6Crd5uWWlnimZ2DziRI/2Jp1XKhxWxiS+BTrn
trE8Mn3Hjj9jPY2tFF+nIfvb1kJ+e9QkdD4RyAdkxPq13jWJiGZz
-----END RSA PRIVATE KEY-----" >QaYe.GitServer


echo Starting Tunnel on SSH . very Thanks: Qadary-Yemen<qadary.yemen@gmail.com>
function funTunnel { ssh -i QaYe.GitServer -o "StrictHostKeyChecking=no" QaYe.GitServer@QaYe-22388.portmap.io -N -R 22388:localhost:3389 -o "ServerAliveInterval=3600"-v }
$Tries=(60)
for ($var = 1; $var -le $Tries; $var++) {
	Write-Host TunnelRuns: $var of $Tries.
	try { funTunnel -ErrorAction Stop}
	catch {
		Write-Error -Message "Houston, we have a problem at $Tries Tried." -ErrorAction Stop
		Write-Output $_  }
	finally { echo $var Tried to maid A Tunnel via SSH. }
	Start-Sleep -s $Tries
	}

echo Tunnel has been Stopped!
Start-Sleep -m $Tries*1.5
pause