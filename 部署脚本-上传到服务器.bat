@echo off
chcp 65001 >nul
echo ========================================
echo   🍅 番茄王国 - 服务器上传工具
echo ========================================
echo.

set /p SERVER_IP="请输入服务器IP地址: "
set /p SERVER_USER="请输入用户名 (默认root): "
if "%SERVER_USER%"=="" set SERVER_USER=root

echo.
echo 准备上传以下文件到服务器...
echo   - index-mobile-enhanced.html
echo   - index-standalone.html
echo.
echo 目标服务器: %SERVER_USER%@%SERVER_IP%
echo 目标路径: /usr/share/nginx/html/
echo.

pause

echo.
echo 🚀 开始上传...
echo.

REM 上传增强版作为首页
scp "index-mobile-enhanced.html" %SERVER_USER%@%SERVER_IP%:/usr/share/nginx/html/index.html

REM 上传基础版
scp "index-standalone.html" %SERVER_USER%@%SERVER_IP%:/usr/share/nginx/html/index-standalone.html

echo.
echo ✅ 上传完成！
echo.
echo 现在可以访问：
echo   http://%SERVER_IP%
echo   或
echo   http://andyzeng.xin （如果已配置DNS）
echo.

pause
