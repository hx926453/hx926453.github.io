---
title: Hexo添加文章时自动打开编辑器
copyright: ture
date: 2019-03-17 15:19:31
password:
tags: hexo
categories: hexo
top: 9
---
本文转载于  [博主： 夏末](https://notes.doublemine.me/2015-06-29-Hexo%E6%B7%BB%E5%8A%A0%E6%96%87%E7%AB%A0%E6%97%B6%E8%87%AA%E5%8A%A8%E6%89%93%E5%BC%80%E7%BC%96%E8%BE%91%E5%99%A8.html)

在Hexo中新建一篇博文非常简单，只需要在命令行中键入以下命令然后回车即可：
    `hexo new "The title of your blog"`
此后Hexo便会在Hexo的根目录的source文件夹下的_posts目录下自动帮你创建相应的md文件。然后我们打开该目录，找到刚刚Hexo自动生成的文件打开编辑即可。

但是当我们的博文比较多，这样我们就需要在成堆的Markdown文件中找到刚才自动生成的文件，这样做显然是一件比较痛苦的事情。

在访问Hexo的Github项目时，发现有类似的issue，Hexo作者也给出来解决办法，以下为作者原文：

ou can try to listen to the new event. For example:

```var spawn = require('child_process').exec;

// Hexo 2.x
    hexo.on('new', function(path){
            exec('vi', [path]);
    });

// Hexo 3
    hexo.on('new', function(data){
        exec('vi', [data.path]);
    });
```
根据作者给出的示例，一番折腾过后博主终于在自己的机器上实验成功了，下面给出操作步骤：
- 首先在Hexo目录下的scripts目录中创建一个JavaScript脚本文件。
- 如果没有这个scripts目录，则新建一个。
- scripts目录新建的JavaScript脚本文件可以任意取名。如: `auto open post.js`
- 通过这个脚本，我们用其来监听hexo new这个动作，并在检测到hexo new之后，执行编辑器打开的命令。
- 如果你是windows平台的Hexo用户，则将下列内容写入你的脚本：
```var spawn = require('child_process').exec;

// Hexo 2.x 用户复制这段
    hexo.on('new', function(path){
        spawn('start  "markdown编辑器绝对路径.exe" ' + path);
    });

// Hexo 3 用户复制这段
    hexo.on('new', function(data){
        spawn('start  "markdown编辑器绝对路径.exe" ' + data.path);
    });
```
- 如果你是Mac平台Hexo用户，则将下列内容写入你的脚本：
```var exec = require('child_process').exec;

// Hexo 2.x 用户复制这段
    hexo.on('new', function(path){
     exec('open -a "markdown编辑器绝对路径.app" ' + path);
    });
// Hexo 3 用户复制这段
    hexo.on('new', function(data){
        exec('open -a "markdown编辑器绝对路径.app" ' + data.path);
    });
```
- 保存并退出脚本之后，在命令行中键入：
`hexo new "auto open editor test"`
windows10会弹出选择默认的编辑器，选择使用的编辑就好了。