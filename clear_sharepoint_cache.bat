cd "%APPDATA%\Microsoft\Web Server Extensions\Cache"
del *.web /S /Q "%APPDATA%\Microsoft\Web Server Extensions\Cache"

cd "%USERPROFILE%\AppData\Local\Microsoft\WebsiteCache\"

rmdir /S /Q "%USERPROFILE%\AppData\Local\Microsoft\WebsiteCache\."

mkdir "%USERPROFILE%\AppData\Local\Microsoft\WebsiteCache"

dir "%APPDATA%\Microsoft\Web Server Extensions\Cache"
dir "%USERPROFILE%\AppData\Local\Microsoft\WebsiteCache"

pause