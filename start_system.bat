@echo off

IF EXIST .\venv\ GOTO install
python -m virtualenv venv

:install
IF [%1] == [--skip-install] GOTO run
venv\Scripts\pip install -U -r requirements.txt

:run
venv\Scripts\python ./bootstrap.py

REM The bot uses non-zero exit codes to signal state.
REM The bot will restart until it returns an exit code of zero.
if %errorlevel% == 0 goto end

timeout /t 1
goto :install

:end
pause
exit
