@echo off

:loop  
	rand.exe %random% > in.txt
	main.exe < in.txt > my.txt
	std.exe < in.txt > std.txt
	fc my.txt std.txt
if not errorlevel 1 goto loop  
pause
goto loop