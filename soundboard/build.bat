@echo off
chcp 65001 >nul
echo ========================================
echo   音效助手 - 打包脚本
echo ========================================
echo.

echo [1/3] 检查依赖...
pip install -r requirements.txt -q
if %errorlevel% neq 0 (
    echo 依赖安装失败，请检查网络连接
    pause
    exit /b 1
)
echo 依赖安装完成
echo.

echo [2/3] 开始打包...
pyinstaller --noconfirm --onefile --windowed ^
    --name "音效助手" ^
    --hidden-import=pynput.keyboard._win32 ^
    --hidden-import=pynput.mouse._win32 ^
    main.py

if %errorlevel% neq 0 (
    echo 打包失败
    pause
    exit /b 1
)
echo.

echo [3/3] 打包完成！
echo 可执行文件位置: dist\音效助手.exe
echo.
pause
