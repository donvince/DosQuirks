@echo off

echo ReturnCode=0>>result.txt

echo ReturnCode=0 >>result.txt

(echo ReturnCode=0)>>result.txt

type result.txt

if exist result.txt del result.txt