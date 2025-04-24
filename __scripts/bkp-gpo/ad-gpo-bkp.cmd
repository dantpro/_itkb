@echo off

::cd %~dp0

:: Parameters ::::::::::::::::::::::::::::::::::::::::::::::::
::
Set domain='contoso.lab'
Set server='cnt-adc-1.contoso.lab'
Set path='C:\scripts\ad-gpo-bkp'
Set history='5'

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "%0.ps1"
::%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "%0.ps1 -domain %domain% -server %server% -path %path% -history %history%"
