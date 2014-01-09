for /R "directory" %%I in ("*.zip") do (
  "%ProgramFiles%\7-Zip\7z.exe" x -y -o"%%~dpnI" "%%~fI"
)

pause