@echo off
schtasks /create /tn "websiteprank" /tr "\"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe\" http://www.randomwebsite.com/cgi-bin/random.pl" /sc MINUTE /mo 10