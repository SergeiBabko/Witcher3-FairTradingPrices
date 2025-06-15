@echo off
setlocal enabledelayedexpansion

for %%F in ("csv\*.csv") do (
    w3strings.exe --encode "%%F" --force-ignore-id-space-check-i-know-what-i-am-doing
)

del /q "csv\*.w3strings.ws"

for %%F in ("csv\*.w3strings") do (
    set "filename=%%~nF"
    set "base=!filename:.csv=!"
    ren "%%F" "!base!.w3strings"
)

if not exist "..\content" mkdir "..\content"
move /y "csv\*.w3strings" "..\content\"

endlocal
pause
