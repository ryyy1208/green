@echo off
chcp 65001
REM -----------------------------------------------------------------
REM                  自动 GitHub 提交脚本
REM -----------------------------------------------------------------
REM 使用前请务必修改下面的 "repository_path" 为你的真实仓库路径！
REM 例如: SET repository_path="D:\CyberTools\github_green"
REM -----------------------------------------------------------------

SET repository_path="D:\CyberTools\github_green"

REM -----------------------------------------------------------------
REM          --- 下面的代码通常无需修改 ---
REM -----------------------------------------------------------------

echo.
echo =======================================================
echo               开始执行 GitHub 自动提交
echo =======================================================
echo.

REM 切换到你的 Git 仓库目录
cd /d %repository_path%

REM 检查是否成功切换目录
IF %ERRORLEVEL% NEQ 0 (
    echo 错误: 无法找到仓库路径 "%repository_path%"。
    echo 请检查路径是否正确。
    pause
    exit /b
)

echo 当前工作目录: %cd%
echo.

echo 正在添加所有文件到暂存区...
git add .
echo.

echo 正在生成提交信息...
set "commitMessage=Automated daily commit: %date% %time%"
echo 提交信息: "%commitMessage%"
echo.

echo 正在提交更改...
git commit -m "%commitMessage%"
echo.

echo 正在推送到远程仓库...
git push
echo.

echo =======================================================
echo                  所有操作执行完毕!
echo =======================================================
echo.

REM 如果是手动运行，取消下面这行注释可以看到最终结果
REM pause