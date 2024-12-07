@shift /0
@echo off
chcp 65001 >nul
title Nitro Generator - M1
mode 80, 28
:menu
cls
echo.
echo.
echo.
echo                    [33m       .▄▄ · ▄▄▄▄▄ ▄▄▄· ▄▄▄  
echo                    [93m       ▐█ ▀. •██  ▐█ ▀█ ▀▄ █·
echo                    [33m       ▄▀▀▀█▄ ▐█.▪▄█▀▀█ ▐▀▀▄ 
echo                    [97m       ▐█▄▪▐█ ▐█▌·▐█ ▪▐▌▐█•█▌
echo                    [97m        ▀▀▀▀  ▀▀▀  ▀  ▀ .▀  ▀
echo.
echo.
echo.
echo.
ping localhost -n 1 >nul
echo     [90;1m#═╦═══════»[0m  [92m[Generate Nitro Codes][0m [95m[1][0m
ping localhost -n 1 >nul
echo       [90;1m╚════════»[0m  [92m[Exit][0m  [95m[2][0m
echo.
echo.
echo.

set /p choice=Enter your choice: 
color 6
if "%choice%"=="1" goto generate_nitro_codes
if "%choice%"=="2" goto exit

:generate_nitro_codes
cls
echo Generating Discord Nitro Codes...

setlocal enabledelayedexpansion

set "characters=ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
set "num_codes=10"
set "code_length=16"

for /l %%i in (1,1,%num_codes%) do (
    set "code="
    for /l %%j in (1,1,%code_length%) do (
        set /a "rand=!random! %% 36"
        for %%k in (!rand!) do (
            set "code=!code!!characters:~%%k,1!"
        )
    )
    echo https://discord.gift/!code!
)

endlocal

pause
goto menu

:exit
exit