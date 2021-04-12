:: setup.bat
:: Link emacs configurations for windows
::
:: Usage:
:: > setup.bat
::
:: NOTE: Creating soft links requires admin privileges.
ECHO OFF
ECHO == Emacs settings installer ==


SET SCRIPT_PATH=%~dp0

:: emacs.d folder
SET EMACSD_PATH=C:%HOMEPATH%\.emacs.d
:: SET EMACSD_PATH=C:\Users\bahamondes\.emacs.d

:: dotfiles emacs sources 
SET DOT_PATH=%SCRIPT_PATH%
:: SET DOT_PATH=C:\Users\bahamondes\.dotfiles\emacs

:: Links to prepare
SET DOT_INIT=%DOT_PATH%\init.el
SET EMACSD_INIT=%EMACSD_PATH%\init.el
SET EMACSD_DOT_LINK=%EMACSD_PATH%\mp


ECHO Using variables:
ECHO - EMACSD_PATH=%EMACSD_PATH%
ECHO - DOT_PATH=%DOT_PATH%
ECHO - DOT_INIT=%DOT_INIT%
ECHO - EMACSD_INIT=%EMACSD_INIT%
ECHO - EMACSD_DOT_LINK=%EMACSD_DOT_LINK%

:: Create emacs.d folder if missing
ECHO - Creating '%EMACSD_PATH%' dir.
IF NOT EXIST "%EMACSD_PATH%" MKDIR %EMACSD_PATH%

:: Create soft link for mp folder
ECHO - Linking emacs system from '%DOT_PATH%' to '%EMACSD_DOT_LINK%'.
:: DEL /P %EMACSD_DOT_LINK%  :: Is this OK?
MKLINK /D %EMACSD_DOT_LINK% %DOT_PATH%


:: Create soft link for init file
ECHO - Linking emacs entry point from '%DOT_INIT%' to '%EMACSD_INIT%' file.
:: IF EXIST %EMACSD_INIT% DEL /P %EMACSD_INIT%
MKLINK %EMACSD_INIT% %DOT_INIT%

DIR %EMACSD_PATH%

ECHO - OK -
