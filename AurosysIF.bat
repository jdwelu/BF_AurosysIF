@echo off

REM I needed to create a batch file that will grab an interface number after a server restart and reset the routing.

REM Create the routing table file.
route print > route.txt

REM Parse the third line in the routing table file.
findstr /n . route.txt | findstr "^[3]:" > route1.txt

REM Set the parsed string to a variable for further processing.
set /p theVAR= < route1.txt

REM Checking the variable is correct.
echo.
echo.%theVAR%

timeout 5
cls

REM Grabbing the interface number from the string (skip 3, grab next 2).
set IFnum=%theVAR:~3,2%

REM Checking I got the whole interface number.
echo.
echo.%IFnum%
REM I was concerned with a smaller than two digit number that a space may throw an error.
echo.
set IFnum=%IFnum: =%
echo.%IFnum%

timeout 5
cls

REM These 3 lines were a test before creating the batch file
echo.
echo Okay! your Interface Number is %IFnum% , right? 

timeout 5
cls

REM Building the complete batch file
echo.
echo Creating your new batch file!!!

echo @echo off > IFchange.bat
echo REM IF is for Adapter #2 >> IFchange.bat
echo route delete XX.XX.XXX.X >> IFchange.bat
echo route delete XXX.XX.X.X >> IFchange.bat
echo route -p add XXX.XX.X.X MASK 255.255.255.0 XX.X.XXX.XX IF %IFnum% >> IFchange.bat
echo route -p add XX.XX.XXX.X MASK 255.255.255.0 XX.X.XXX.XX IF %IFnum% >> IFchange.bat

timeout 5
cls

REM This is where you would run the batch file to redo the routing
REM IFchange.bat





 