#/bin/bash
echo ============ push==> Github ==============
git remote add origin git@github.com:hx926453/hx926453.github.io.git
git add .

echo ============ 提交配置文件 ==============
git commit -m "提交hexo配置文件"
echo ============ 新建分支并切换 ==============
git branch hexo
git checkout hexo
echo ============ push==> Github ==============
git push origin hexo