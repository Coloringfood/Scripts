for /R "directory" %%I in ("*.rar") do (
  "%ProgramFiles%\7-Zip\7z.exe" x -y -o"%%~dpnI" "%%~fI"
)

pause