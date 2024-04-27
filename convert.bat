@echo off
goto:$Main

:$Main
setlocal EnableExtensions
    git submodule update --init --recursive --checkout
    if errorlevel 1 (
      echo [ERROR] Failed to update submodules.
      goto:$MainError
    )
    echo [INFO] Updated submodules.

    call "%~dp0PNG-to-ICO\png_to_ico.bat" "%~dp0PNGs\drive_icons\"
    if errorlevel 1 goto:$MainError

    call "%~dp0PNG-to-ICO\png_to_ico.bat" "%~dp0PNGs\"
    if errorlevel 1 goto:$MainError

    goto:$MainDone
    :$MainError
        echo [ERROR] Failed to convert PNG to ICO.
        goto:$MainDone

    :$MainDone
endlocal & exit /b %ERRORLEVEL%
