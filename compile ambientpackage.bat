@echo off 
title epic compile bro 
if "%~1" == "" exit
start C:\Users\Drgn\Desktop\"GSC Example Toolkit"\"GSC Compiler"\Compiler.exe %~1 
TIMEOUT /T 1
move /y _ambientpackage-compiled.gsc C:\"Program Files (x86)"\Steam\steamapps\common\"Call of Duty Black Ops II"\t6r\data\maps\mp\_ambientpackage.gsc 
TIMEOUT /T 1