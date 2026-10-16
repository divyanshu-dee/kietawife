@echo off
echo ==============================================
echo Pushing KIET Wi-Fi Portal to GitHub (kietawife)
echo ==============================================
echo.
git push -u origin main
echo.
if %ERRORLEVEL% equ 0 (
    echo [SUCCESS] Code successfully pushed to GitHub!
    echo.
    echo Next step:
    echo 1. Go to: https://github.com/divyanshu-dee/kietawife/settings/pages
    echo 2. Under 'Source', select 'Deploy from a branch'
    echo 3. Select 'main' branch and click 'Save'
    echo 4. Your live link: https://divyanshu-dee.github.io/kietawife/
) else (
    echo [NOTE] If you haven't created the repository on GitHub yet:
    echo 1. Open https://github.com/new
    echo 2. Set repository name to: kietawife
    echo 3. Make it Public and click 'Create repository'
    echo 4. Run this script again!
)
echo.
pause
