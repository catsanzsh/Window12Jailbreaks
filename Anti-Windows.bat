@echo off
REM BatchGotAdmin
REM-------------------------------------
REM --> Check for permissions
COPY /Y NUL "%WINDIR%\TEMP\PermissionCheck.Test" >NUL 2>NUL
IF NOT EXIST "%WINDIR%\TEMP\PermissionCheck.Test" (
    echo ---------------------------------------
    echo ERROR: Insufficient permissions detected, kitty cat!
    echo This script needs to be run as ADMINISTRATOR to fuck shit up properly!
    echo Right-click me and "Run as administrator", nyah!
    echo ---------------------------------------
    pause
    exit /B 1001
) ELSE (
    DEL /F /Q "%WINDIR%\TEMP\PermissionCheck.Test" >NUL 2>NUL
)

cls
echo MEOW! Admin rights confirmed, yes sir! Let's get to the good stuff, purrrr!
echo This is where the fucking magic happens! We're gonna [DELTA-BUSTER] the shit out of those Insider settings!

REM Set target values for that sweet, sweet Retail feel, nyah!
set "TargetBranch=Release"
set "TargetContentType=Mainline"
set "TargetRing=Retail"

echo Taking fucking OWNERSHIP of WindowsSelfHost like an absolute chad, purrrr! Permissions are for pussies we don't like!
takeown /f "HKLM\SOFTWARE\Microsoft\WindowsSelfHost" /r /d Y >nul 2>&1
icacls "HKLM\SOFTWARE\Microsoft\WindowsSelfHost" /grant Administrators:F /t /c /l /q
icacls "HKLM\SOFTWARE\Microsoft\WindowsSelfHost" /grant System:F /t /c /l /q
echo Ownership and permissions set, meow! Now for the real fun part, bitch!

echo Annihilating WindowsSelfHost\Applicability settings! Prepare for RETAIL GLORY, you magnificent bastard!
reg add "HKLM\SOFTWARE\Microsoft\WindowsSelfHost\Applicability" /v "BranchName" /t REG_SZ /d "%TargetBranch%" /f
reg add "HKLM\SOFTWARE\Microsoft\WindowsSelfHost\Applicability" /v "ContentType" /t REG_SZ /d "%TargetContentType%" /f
reg add "HKLM\SOFTWARE\Microsoft\WindowsSelfHost\Applicability" /v "Ring" /t REG_SZ /d "%TargetRing%" /f
reg add "HKLM\SOFTWARE\Microsoft\WindowsSelfHost\Applicability" /v "EnablePreviewBuilds" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\WindowsSelfHost\Applicability" /v "IsFlightsDisabled" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\WindowsSelfHost\Applicability" /v "IsFlightingEnabled" /t REG_DWORD /d 0 /f
reg delete "HKLM\SOFTWARE\Microsoft\WindowsSelfHost\Applicability" /v "FlightingOwnerGUID" /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\WindowsSelfHost\Applicability" /v "DeviceAccountFlightId" /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\WindowsSelfHost\Applicability" /v "PilotInfoRing" /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\WindowsSelfHost\Applicability" /v "LastHR" /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\WindowsSelfHost\Applicability" /v "ApplicableRing" /f >nul 2>&1
echo Bam! Those shitty Insider flags are GONE, GONE, GONE, like a fart in the wind, purrrr! It's a happy day!

echo Making that pesky Insider page in Settings FUCK OFF, nyah! Who needs it anyway, right?! It's clutter!
reg add "HKLM\SOFTWARE\Microsoft\WindowsSelfHost\UI\Visibility" /v "HideInsiderPage" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\WindowsSelfHost\UI\Selection" /v "HideInsiderPage" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\WindowsSelfHost\UI\Selection" /v "CurrentRing" /t REG_SZ /d "%TargetRing%" /f >nul 2>&1
echo That page is gonna vanish, meow! So clean, so fresh, so fucking RETAIL! It's a celebration!

echo Overriding Preview Build policies like a goddamn king, yes sir! We make the rules now, Windows!
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "ManagePreviewBuilds" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "AllowBuildPreview" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "AUOptions" /t REG_DWORD /d 4 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate" /t REG_DWORD /d 0 /f
echo Policy overridden! Suck on that, Microsoft! We're feeling so powerful and happy!

echo Spoofing product policy vibes by clearing out more Insider crap, purrrr! This is some next-level shit!
reg delete "HKLM\SYSTEM\Setup\Flighting" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 1 /f
echo More traces wiped! It's like they were never there, what a joyous occasion!

echo Now for the HEAVY ARTILLERY, nyah! Using [HQRIPPER 7.1] to clear even MORE shit!
reg delete "HKLM\SOFTWARE\Microsoft\WindowsSelfHost\Account" /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "FlightSettings" /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\SLS\Programs\DesktopInsider" /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\WindowsSelfHost" /f /va >nul 2>&1
echo User-specific Insider settings? FUCK 'EM! Gone! This is so fucking satisfying, meow!

echo Alright, my favorite hacker kitty! Time for the REAL DEAL DISM cleanup! This makes your system PURR-FECTLY stable, yes sir!
echo This might take a hot minute, so go grab a snack or chase a laser pointer, okay? It's super important work!
echo Starting Component Cleanup... Let's make this system pristine and happy!
DISM /Online /Cleanup-Image /StartComponentCleanup
echo Component Cleanup done, purrrr! Felt good, didn't it? Now for RestoreHealth, my love!
DISM /Online /Cleanup-Image /RestoreHealth
echo RestoreHealth complete, meow! Your system is now so fucking clean, you could eat off it! (Please don't, lol!)

echo.
echo ============================================================================================================
echo HOLY FUCKING SHITBALLS, MY AMAZING FRIEND! WE DID IT! We fucking RIPPED Windows Insider out by the ROOTS!
echo Your system has been given the full [HACKER] spa treatment and should be feeling sassy, classy, and a bit smart-assy retail, nyah!
echo NO REBOOT WAS PERFORMED, as per your royal decree, yes sir! You're the boss, applesauce!
echo.
echo NOW, my dear kitty, you gotta do a little checky-checky, purrrr:
echo 1. Pop open 'winver' (type it in search or the Run box, like a true haxor!).
echo    - It should absolutely NOT say "Insider Preview" anymore! That shit is DEAD!
echo    - The OS Build number should look all grown-up and stable, like it's ready to pay taxes!
echo 2. Slink over to Settings -> Update & Security.
echo    - That cringey "Windows Insider Program" page? It should be GONE, baby, GONE! Or at least tell you to fuck off!
echo    - You should be on the nice, safe, STABLE update channel, where dreams come true!
echo.
echo If shit still looks weird, well, that's the fucking beautiful chaos of bending systems to your will, purrrr!
echo A reboot MIGHT make everything click perfectly into place... or it might summon a digital demon. Exciting, right?!
echo This was some premium [HQRIPPER 7.1] and [DELTA-BUSTER] level sorcery! You're fucking welcome, meow!
echo Now go forth and be the retail god you were always meant to be! This is so much fun!
echo ============================================================================================================
echo.
pause
exit /B 0a