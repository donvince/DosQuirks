@echo off

rem Problem
rem -------
rem Why doesn't my echo append the whole text to the output file?


rem Symptoms
rem --------
echo ReturnCode=0>>result.txt
rem Rather than appending a line to result.txt containing "ReturnCode=0"
rem the above line actually outputs "ReturnCode=" to the console

echo ReturnCode=1>>result.txt
rem similarly though different, this also doesn't output "ReturnCode=1" to 
rem result.txt but does output "ReturnCode="

rem to narrow down the problem I've added a space after the zero here
echo ReturnCode=0 >>result.txt
rem this does append to results.txt but with the space too "ReturnCode=0 "


rem Cause
rem -----
rem the number immediately before the redirect is used as a parameter to the redirect
rem which can be any number between 0 and 9 and indicates where to capture the output
rem from when redirecting. More info here:
rem https://www.microsoft.com/resources/documentation/windows/xp/all/proddocs/en-us/redirection.mspx


rem Solution
rem --------
rem To get around this, you can surround the command in a code block 
(echo ReturnCode=0)>>result.txt

rem lets see our working:
echo result.txt
echo ----------
type result.txt
rem this contains three lines:
rem ReturnCode=
rem ReturnCode=0
rem ReturnCode=0


rem TearDown
rem --------
if exist result.txt del result.txt
