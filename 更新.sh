#/bin/bash
echo =============更新并备份==============
git add .
git commit -m "更新博客并备份"
git push origin hexo
hexo -g d