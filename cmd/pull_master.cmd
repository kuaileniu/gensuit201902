@echo off
chcp 65001

echo +-------------------------------------------------------+
echo ^|      北京智慧山信息技术有限公司   15652963646     ^|
echo +-------------------------------------------------------+
for /f %%i in ('chdir') do set pwd=%%i
cd ..

for /f %%i in ('chdir') do set pwd=%%i

echo %pwd%

echo "原分支为："
git branch


echo "远程所有分支"
git branch -a

git checkout master


echo "当前分支为："
git branch


git pull

echo "按任意键结束"
pause

