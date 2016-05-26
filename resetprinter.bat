@echo off 
rem stop spooler 
net stop spooler 
rem pause 4 seconds and save to c:\a.txt
ping -n 4 127.0.0.1 > c:\a.txt
rem delete print jobs 
echo deleting items in print cue...
del /Q /F C:\Windows\System32\spool\PRINTERS\*.* 
rem pause 4 seconds and save to c:\a.txt
ping -n 4 127.0.0.1 > c:\a.txt
rem start spooler 
net start spooler 
echo Finished and window should close on its own! 
rem timeout for 5 seconds
timeout 5 > c:\a.txt
rem delete c:\a.txt
del /Q /F c:\a.txt
cls
exit
