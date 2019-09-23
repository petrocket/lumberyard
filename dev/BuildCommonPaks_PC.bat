@echo off

setlocal enabledelayedexpansion 

set ORIGINALDIRECTORY=%cd%
set BINFOLDER=Bin64vc141
set MYBATCHFILEDIRECTORY=%~dp0
cd "%MYBATCHFILEDIRECTORY%"

rem echo ----- Processing Assets Using Asset Processor Batch ----
rem .\%BINFOLDER%\AssetProcessorBatch.exe /gamefolder=treehouse /platforms=pc
rem IF ERRORLEVEL 1 GOTO AssetProcessingFailed

echo ----- Creating Packages ----
rem lowercase is intentional, since cache folders are lowercase on some platforms
rem .\%BINFOLDER%\rc\rc.exe /job=%BINFOLDER%\rc\RCJob_Generic_MakePaks.xml /p=pc /game=treehouse 
.\%BINFOLDER%\rc\rc.exe /job=%BINFOLDER%\rc\RCJob_Common_MakePaks.xml /p=pc /game=treehouse 
IF ERRORLEVEL 1 GOTO RCFailed

echo ----- Done -----
cd "%ORIGINALDIRECTORY%"
exit /b 0

:RCFailed
echo ---- RC PAK failed ----
cd "%ORIGINALDIRECTORY%"
exit /b 1

:AssetProcessingFailed
echo ---- ASSET PROCESSING FAILED ----
cd "%ORIGINALDIRECTORY%"
exit /b 1




