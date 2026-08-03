@echo off
title Menu
color 0A

if exist euro.txt (
    set /p euro=<euro.txt
) else (
    set euro=0
)

if exist biz1.txt (
    set /p biz1=<biz1.txt
) else (
    set biz1=0
)

if exist biz2.txt (
    set /p biz2=<biz2.txt
) else (
    set biz2=0
)

if exist biz3.txt (
    set /p biz3=<biz3.txt
) else (
    set biz3=0
)

if exist biz4.txt (
    set /p biz4=<biz4.txt
) else (
    set biz4=0
)

if exist biz5.txt (
    set /p biz5=<biz5.txt
) else (
    set biz5=0
)

if exist hours.txt (
    set /p hours=<hours.txt
) else (
    set hours=0
)

if exist nickname.txt (
    set /p nickname=<nickname.txt
) else (
    set nickname=
)

if exist passport.txt (
    set /p passport=<passport.txt
) else (
    set passport=0
)

if exist exp.txt (
    set /p exp=<exp.txt
) else (
    set exp=0
)

if exist level.txt (
    set /p level=<level.txt
) else (
    set level=1
)

if exist bankrot.txt (
    set /p bankrot=<bankrot.txt
) else (
    set bankrot=0
)

if exist quest.txt (
    set /p quest=<quest.txt
) else (
    set quest=1
)

if exist job_count.txt (
    set /p job_count=<job_count.txt
) else (
    set job_count=0
)

if exist play_time.txt (
    set /p play_time=<play_time.txt
) else (
    set play_time=0
)

set job=0
set quest_done=0

:check_nickname
if "%nickname%"=="" goto set_nickname
goto start

:set_nickname
cls
echo ==============================
echo   WELCOME TO THE GAME!
echo   Please enter your nickname:
echo ==============================
set /p nickname="> "
if "%nickname%"=="" (
    echo Nickname cannot be empty!
    timeout /t 2 /nobreak >nul
    goto set_nickname
)
(echo %nickname%)>nickname.txt
goto start

:start
cls
echo ==============================
echo   ENTER COMMAND:
echo   /help  - info
echo   /robota - timer
echo   /ya - about
echo   /biz - business
echo   /bankrot - emergency loan
echo   /mer - passport
echo   /qwest - quests
echo ==============================
set /p input="> "

if "%input%"=="/help" goto help
if "%input%"=="/robota" goto robota
if "%input%"=="/ya" goto ya
if "%input%"=="/biz" goto biz
if "%input%"=="/bankrot" goto bankrot
if "%input%"=="/mer" goto mer
if "%input%"=="/qwest" goto qwest
echo Unknown command!
timeout /t 2 /nobreak >nul
goto start

:help
cls
echo ==============================
echo   COMMANDS:
echo   /robota - work
echo   /ya - profile
echo   /biz - business
echo   /bankrot - emergency loan
echo   /mer - passport
echo   /qwest - quests
echo   /reset - reset account (in /ya)
echo ==============================
pause
goto start

:robota
cls
echo ==============================
echo   WORK MENU:
echo   1 - Janitor - 10 sec (+50 Euro) [No passport]
echo   2 - Garbage collector - 60 sec (+300 Euro) [Passport, Lv2]
echo   3 - Loader - 60 sec (+1000 Euro) [Passport, Lv4]
echo   4 - PVZ worker - 90 sec (+2500 Euro) [Passport, Lv6]
echo   5 - Banker - 120 sec (+4000 Euro) [Passport, Lv8]
echo ==============================
set /p choice="> "

if "%choice%"=="1" goto job1
if "%choice%"=="2" goto job2
if "%choice%"=="3" goto job3
if "%choice%"=="4" goto job4
if "%choice%"=="5" goto job5
echo Invalid choice!
pause
goto robota

:job1
cls
echo Janitor work...
for /l %%i in (10,-1,1) do (
    cls
    echo %%i seconds left...
    timeout /t 1 /nobreak >nul
)
set /a euro=euro+50
set /a job_count=job_count+1
set /a play_time=play_time+10
(echo %euro%)>euro.txt
(echo %job_count%)>job_count.txt
(echo %play_time%)>play_time.txt
set /a exp=exp+5
(echo %exp%)>exp.txt
call :levelup
echo Work complete! +50 Euro, +5 EXP
echo Total: %euro% Euro
set /a hours=play_time/60
(echo %hours%)>hours.txt
pause
goto start

:job2
if %passport%==0 (
    echo You need a passport! Use /mer
    pause
    goto robota
)
if %level% LSS 2 (
    echo Need level 2! Current level: %level%
    pause
    goto robota
)
cls
echo Garbage collector work...
for /l %%i in (60,-1,1) do (
    cls
    echo %%i seconds left...
    timeout /t 1 /nobreak >nul
)
set /a euro=euro+300
set /a job_count=job_count+1
set /a play_time=play_time+60
(echo %euro%)>euro.txt
(echo %job_count%)>job_count.txt
(echo %play_time%)>play_time.txt
set /a exp=exp+10
(echo %exp%)>exp.txt
call :levelup
echo Work complete! +300 Euro, +10 EXP
echo Total: %euro% Euro
set /a hours=play_time/60
(echo %hours%)>hours.txt
pause
goto start

:job3
if %passport%==0 (
    echo You need a passport! Use /mer
    pause
    goto robota
)
if %level% LSS 4 (
    echo Need level 4! Current level: %level%
    pause
    goto robota
)
cls
echo Loader work...
for /l %%i in (60,-1,1) do (
    cls
    echo %%i seconds left...
    timeout /t 1 /nobreak >nul
)
set /a euro=euro+1000
set /a job_count=job_count+1
set /a play_time=play_time+60
(echo %euro%)>euro.txt
(echo %job_count%)>job_count.txt
(echo %play_time%)>play_time.txt
set /a exp=exp+15
(echo %exp%)>exp.txt
call :levelup
echo Work complete! +1000 Euro, +15 EXP
echo Total: %euro% Euro
set /a hours=play_time/60
(echo %hours%)>hours.txt
pause
goto start

:job4
if %passport%==0 (
    echo You need a passport! Use /mer
    pause
    goto robota
)
if %level% LSS 6 (
    echo Need level 6! Current level: %level%
    pause
    goto robota
)
cls
echo PVZ worker work...
for /l %%i in (90,-1,1) do (
    cls
    echo %%i seconds left...
    timeout /t 1 /nobreak >nul
)
set /a euro=euro+2500
set /a job_count=job_count+1
set /a play_time=play_time+90
(echo %euro%)>euro.txt
(echo %job_count%)>job_count.txt
(echo %play_time%)>play_time.txt
set /a exp=exp+20
(echo %exp%)>exp.txt
call :levelup
echo Work complete! +2500 Euro, +20 EXP
echo Total: %euro% Euro
set /a hours=play_time/60
(echo %hours%)>hours.txt
pause
goto start

:job5
if %passport%==0 (
    echo You need a passport! Use /mer
    pause
    goto robota
)
if %level% LSS 8 (
    echo Need level 8! Current level: %level%
    pause
    goto robota
)
cls
echo Banker work...
for /l %%i in (120,-1,1) do (
    cls
    echo %%i seconds left...
    timeout /t 1 /nobreak >nul
)
set /a euro=euro+4000
set /a job_count=job_count+1
set /a play_time=play_time+120
(echo %euro%)>euro.txt
(echo %job_count%)>job_count.txt
(echo %play_time%)>play_time.txt
set /a exp=exp+25
(echo %exp%)>exp.txt
call :levelup
echo Work complete! +4000 Euro, +25 EXP
echo Total: %euro% Euro
set /a hours=play_time/60
(echo %hours%)>hours.txt
pause
goto start

:ya
cls
echo ==============================
echo   Nickname: %nickname%
echo   Level: %level%
set /a req_exp=level*100
echo   Experience: %exp% / %req_exp%
echo   Balance: %euro% Euro
set /a hours=play_time/60
echo   Hours in game: %hours%
set biz_status=NO
if %biz1%==1 set biz_status=YES
if %biz2%==1 set biz_status=YES
if %biz3%==1 set biz_status=YES
if %biz4%==1 set biz_status=YES
if %biz5%==1 set biz_status=YES
echo   Businesses: %biz_status%
echo   Passport: 
if %passport%==1 (echo   YES) else (echo   NO)
echo   Jobs done: %job_count%
echo ==============================
echo   Type /reset to reset account
echo ==============================
set /p input="> "

if "%input%"=="/reset" goto reset
pause
goto start

:reset
cls
echo ==============================
echo   ARE YOU SURE?
echo   This will delete ALL your progress!
echo   Type YES to confirm or anything else to cancel
echo ==============================
set /p confirm="> "

if not "%confirm%"=="YES" (
    echo Reset cancelled!
    pause
    goto start
)

del euro.txt 2>nul
del biz1.txt 2>nul
del biz2.txt 2>nul
del biz3.txt 2>nul
del biz4.txt 2>nul
del biz5.txt 2>nul
del hours.txt 2>nul
del nickname.txt 2>nul
del passport.txt 2>nul
del exp.txt 2>nul
del level.txt 2>nul
del bankrot.txt 2>nul
del quest.txt 2>nul
del job_count.txt 2>nul
del play_time.txt 2>nul

set euro=0
set biz1=0
set biz2=0
set biz3=0
set biz4=0
set biz5=0
set hours=0
set nickname=
set passport=0
set exp=0
set level=1
set bankrot=0
set quest=1
set job_count=0
set play_time=0

echo ==============================
echo   ACCOUNT RESET SUCCESSFUL!
echo   Restarting...
echo ==============================
timeout /t 3 /nobreak >nul
goto check_nickname

:biz
cls
echo ==============================
echo   BUSINESS MENU:
echo   1 - Raspberry yard - 3 Euro, +30/hour [%biz1% owned]
echo   2 - Grocery store - 30000 Euro, +2000/hour [%biz2% owned]
echo   3 - Crypto company - 1.000.000 Euro, +100000/hour [%biz3% owned]
echo   4 - Tech store - 500.000 Euro, +50000/hour [%biz4% owned]
echo   5 - Pyaterochka - 380.000 Euro, +11000/hour [%biz5% owned]
echo ==============================
set /p choice="> "

if "%choice%"=="1" goto biz1
if "%choice%"=="2" goto biz2
if "%choice%"=="3" goto biz3
if "%choice%"=="4" goto biz4
if "%choice%"=="5" goto biz5
echo Invalid choice!
pause
goto biz

:biz1
if %biz1%==1 (
    echo You already own this!
    pause
    goto biz
)
if %euro% LSS 3 (
    echo Not enough money! Need 3 Euro, you have %euro%
    pause
    goto biz
)
set /a euro=euro-3
(echo %euro%)>euro.txt
set biz1=1
(echo 1)>biz1.txt
echo You bought Raspberry yard! -3 Euro
pause
goto start

:biz2
if %biz2%==1 (
    echo You already own this!
    pause
    goto biz
)
if %euro% LSS 30000 (
    echo Not enough money! Need 30000 Euro, you have %euro%
    pause
    goto biz
)
set /a euro=euro-30000
(echo %euro%)>euro.txt
set biz2=1
(echo 1)>biz2.txt
echo You bought Grocery store! -30000 Euro
pause
goto start

:biz3
if %biz3%==1 (
    echo You already own this!
    pause
    goto biz
)
if %euro% LSS 1000000 (
    echo Not enough money! Need 1.000.000 Euro, you have %euro%
    pause
    goto biz
)
set /a euro=euro-1000000
(echo %euro%)>euro.txt
set biz3=1
(echo 1)>biz3.txt
echo You bought Crypto company! -1.000.000 Euro
pause
goto start

:biz4
if %biz4%==1 (
    echo You already own this!
    pause
    goto biz
)
if %euro% LSS 500000 (
    echo Not enough money! Need 500.000 Euro, you have %euro%
    pause
    goto biz
)
set /a euro=euro-500000
(echo %euro%)>euro.txt
set biz4=1
(echo 1)>biz4.txt
echo You bought Tech store! -500.000 Euro
pause
goto start

:biz5
if %biz5%==1 (
    echo You already own this!
    pause
    goto biz
)
if %euro% LSS 380000 (
    echo Not enough money! Need 380.000 Euro, you have %euro%
    pause
    goto biz
)
set /a euro=euro-380000
(echo %euro%)>euro.txt
set biz5=1
(echo 1)>biz5.txt
echo You bought Pyaterochka! -380.000 Euro
pause
goto start

:bankrot
cls
echo ==============================
echo   EMERGENCY LOAN (BANKROT)
echo ==============================
if %euro% GTR 0 (
    echo You still have money! Bankrot only for players with 0 Euro
    echo Current balance: %euro% Euro
    pause
    goto start
)
if %bankrot%==1 (
    echo You already used Bankrot once!
    pause
    goto start
)
echo You have 0 Euro. Take 10000 Euro loan?
echo Type YES to confirm or anything else to cancel
set /p confirm="> "

if not "%confirm%"=="YES" (
    echo Cancelled!
    pause
    goto start
)

set /a euro=euro+10000
(echo %euro%)>euro.txt
set bankrot=1
(echo 1)>bankrot.txt
echo You received 10000 Euro! (One-time loan)
pause
goto start

:mer
cls
echo ==============================
echo   PASSPORT OFFICE
echo ==============================
if %passport%==1 (
    echo You already have a passport!
    pause
    goto start
)
if %euro% LSS 500 (
    echo You need 500 Euro for passport! You have %euro%
    pause
    goto start
)
set /a euro=euro-500
(echo %euro%)>euro.txt
set passport=1
(echo 1)>passport.txt
set /a exp=exp+50
(echo %exp%)>exp.txt
call :levelup
echo Passport acquired! -500 Euro, +50 EXP
pause
goto start

:qwest
cls
echo ==============================
echo   QUESTS
echo ==============================

if %quest%==1 (
    echo 1 - Play 5 minutes - 10 EXP
    echo 2 - Work 2 shifts - 50 EXP
    echo 3 - Get passport - 500 EXP
)

if %quest%==2 (
    echo 1 - Play 10+ minutes - 40 EXP
    echo 2 - Work 2 shifts - 39 EXP
    echo 3 - Buy business - 110 EXP
)

if %quest%==3 (
    echo 1 - Play up to 5 minutes - 50 EXP
    echo 2 - Work 2 minutes - 38 EXP
    echo 3 - Buy business - 120 EXP
)

echo ==============================
echo   Select quest to complete (type 1, 2 or 3):
set /p qchoice="> "

if "%qchoice%"=="1" goto quest1
if "%qchoice%"=="2" goto quest2
if "%qchoice%"=="3" goto quest3
echo Invalid choice!
pause
goto qwest

:quest1
if %quest%==1 (
    if %play_time% LSS 300 (
        echo You need to play 5 minutes! Current: %play_time% seconds
        pause
        goto qwest
    )
    set /a exp=exp+10
    (echo %exp%)>exp.txt
    echo +10 EXP!
)
if %quest%==2 (
    if %job_count% LSS 2 (
        echo You need to work 2 shifts! Current: %job_count%
        pause
        goto qwest
    )
    set /a exp=exp+40
    (echo %exp%)>exp.txt
    echo +40 EXP!
)
if %quest%==3 (
    if %play_time% LSS 300 (
        echo You need to play 5 minutes! Current: %play_time% seconds
        pause
        goto qwest
    )
    set /a exp=exp+50
    (echo %exp%)>exp.txt
    echo +50 EXP!
)
call :levelup
set /a quest=quest+1
if %quest% GTR 3 set quest=1
(echo %quest%)>quest.txt
echo Quest completed!
pause
goto start

:quest2
if %quest%==1 (
    if %play_time% LSS 600 (
        echo You need to play 10 minutes! Current: %play_time% seconds
        pause
        goto qwest
    )
    set /a exp=exp+40
    (echo %exp%)>exp.txt
    echo +40 EXP!
)
if %quest%==2 (
    if %job_count% LSS 2 (
        echo You need to work 2 shifts! Current: %job_count%
        pause
        goto qwest
    )
    set /a exp=exp+39
    (echo %exp%)>exp.txt
    echo +39 EXP!
)
if %quest%==3 (
    if %biz1%==0 (
        echo You need to buy a business!
        pause
        goto qwest
    )
    set /a exp=exp+110
    (echo %exp%)>exp.txt
    echo +110 EXP!
)
call :levelup
set /a quest=quest+1
if %quest% GTR 3 set quest=1
(echo %quest%)>quest.txt
echo Quest completed!
pause
goto start

:quest3
if %quest%==1 (
    if %play_time% LSS 300 (
        echo You need to play 5 minutes! Current: %play_time% seconds
        pause
        goto qwest
    )
    set /a exp=exp+50
    (echo %exp%)>exp.txt
    echo +50 EXP!
)
if %quest%==2 (
    if %play_time% LSS 120 (
        echo You need to work 2 minutes! Current: %play_time% seconds
        pause
        goto qwest
    )
    set /a exp=exp+38
    (echo %exp%)>exp.txt
    echo +38 EXP!
)
if %quest%==3 (
    if %biz1%==0 (
        echo You need to buy a business!
        pause
        goto qwest
    )
    set /a exp=exp+120
    (echo %exp%)>exp.txt
    echo +120 EXP!
)
call :levelup
set /a quest=quest+1
if %quest% GTR 3 set quest=1
(echo %quest%)>quest.txt
echo Quest completed!
pause
goto start

:levelup
set /a req_exp=level*100
if %exp% GEQ %req_exp% (
    set /a level=level+1
    (echo %level%)>level.txt
    echo ==============================
    echo   LEVEL UP! Now level %level%!
    echo ==============================
    timeout /t 2 /nobreak >nul
)
goto :eof