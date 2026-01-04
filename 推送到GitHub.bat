@echo off
chcp 65001 >nul
echo ========================================
echo   🚀 推送到GitHub
echo ========================================
echo.
echo ⚠️ 注意：请先在GitHub上创建仓库！
echo.
echo 仓库名建议：haixing-kuang
echo （不能有空格，使用连字符）
echo.
echo ========================================
echo.

set /p GITHUB_URL="请输入你的GitHub仓库地址（如：https://github.com/用户名/haixing-kuang.git）: "

if "%GITHUB_URL%"=="" (
    echo.
    echo ❌ 未输入仓库地址！
    pause
    exit /b
)

echo.
echo 正在配置远程仓库...
git remote add origin %GITHUB_URL% 2>nul

if errorlevel 1 (
    echo.
    echo 远程仓库已存在，尝试更新...
    git remote set-url origin %GITHUB_URL%
)

echo.
echo ========================================
echo 开始推送...
echo ========================================
echo.

git push -u origin master

if errorlevel 1 (
    echo.
    echo ❌ 推送失败！
    echo.
    echo 可能的原因：
    echo 1. 需要登录GitHub账号
    echo 2. 仓库地址不正确
    echo 3. 没有推送权限
    echo.
    echo 请查看 GitHub上传步骤.txt 获取详细帮助
    echo.
    pause
    exit /b
)

echo.
echo ========================================
echo ✅ 推送成功！
echo ========================================
echo.
echo 现在可以访问你的GitHub仓库查看代码：
echo %GITHUB_URL:~0,-4%
echo.
echo 后续更新代码的命令：
echo   git add .
echo   git commit -m "更新说明"
echo   git push
echo.

pause
