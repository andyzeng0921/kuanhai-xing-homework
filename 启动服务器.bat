@echo off
chcp 65001
echo.
echo ========================================
echo   🍅 番茄王国服务器启动工具
echo ========================================
echo.
echo 正在启动服务器，请稍候...
echo.

python -m http.server 8080

pause
