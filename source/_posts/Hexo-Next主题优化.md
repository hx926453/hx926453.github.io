---
title: Hexo-Next主题优化
copyright: ture
date: 2019-03-17 15:49:54
password:
tags: hexo
categories: next
top: 10
---

## 参考文章

[【持续更新】最全Hexo博客搭建+主题优化+插件配置+常用操作+错误分析](https://www.simon96.online/2018/10/12/hexo-tutorial/)

[hexo的next主题个性化教程:打造炫酷网站](http://shenzekun.cn/hexo%E7%9A%84next%E4%B8%BB%E9%A2%98%E4%B8%AA%E6%80%A7%E5%8C%96%E9%85%8D%E7%BD%AE%E6%95%99%E7%A8%8B.html)

[Hexo-NexT配置超炫网页效果](https://www.jianshu.com/p/9f0e90cc32c2)

## 选择布局

搜索 scheme

Muse - 默认 Scheme，这是 NexT 最初的版本，黑白主调，大量留白

![image](https://ws4.sinaimg.cn/large/005SfRvrgy1g15ut4agpcj31hc0qh42t.jpg)

Mist - Muse 的紧凑版本，整洁有序的单栏外观

![image](https://wx1.sinaimg.cn/large/005SfRvrgy1g15uuz9rebj31hc0qlaf9.jpg)Pisces - 双栏 Scheme，小家碧玉似的清新

![image](https://wx4.sinaimg.cn/large/005SfRvrgy1g15uw732ngj31hc0qj43y.jpg)

Gemini - 左侧网站信息及目录，块+片段结构布局cheme 的切换通过更改 主题配置文件，搜索 scheme 关键字。 你会看到有四行 scheme 的配置，将你需用启用的 scheme 前面注释 # 去除即可。

![image](https://wx3.sinaimg.cn/large/005SfRvrgy1g15uxi0eqhj31hc0qg7a2.jpg)

## 设置 菜单

菜单配置包括三个部分，第一是菜单项（名称和链接），第二是菜单项的显示文本，第三是菜单项对应的图标。 NexT 使用的是 Font Awesome 提供的图标， Font Awesome 提供了 600+ 的图标，可以满足绝大的多数的场景，同时无须担心在 Retina 屏幕下 图标模糊的问题。

编辑 主题配置文件，修改以下内容：

||后面对应图标

![image](https://wx3.sinaimg.cn/large/005SfRvrgy1g15v1ddqtmj30n407bmyb.jpg)

然后到主题的语言文件添加相应的民称![image](https://wx2.sinaimg.cn/large/005SfRvrgy1g15v58fh7jj30n407kaan.jpg)

## 设置标签、分类的界面

设置菜单那里，我设置了显示标签、分类、关于几个选项。如图：![image](https://wx1.sinaimg.cn/large/005SfRvrgy1g15uuz9rebj31hc0qlaf9.jpg)

但是点击进去，却报错：`Cannot GET /tags/`，不要慌，不能获取tags，创建一个就OK！

这里介绍创建page的语法：

`hexo new page 'name' # name分别为tags、categories `

这样就创建了pages。

在控制台输入以下命令：

```
hexo new page 'tags' #创建tags子目录
hexo new page 'categories' #创建categories子目录
```

在你的网站根目录下面的source文件夹会分别生成tags、categories以及about文件夹。

分别修改这tags和categories文件夹中的index.md文件，新增type属性，如下：

```
---
title: tags
date: 2018-01-04 11:45:41
type: tags
---
```

categories的修改类似。

当你新建一篇博文的时候，增加上tags和categories属性值，就能在tags和categories界面检索到你的文章了

## 添加背景图

在 themes/next/source/css/_custom/custom.styl 中添加如下代码：

```
body{
    background:url(/images/bg.jpg);
    background-size:cover;
    background-repeat:no-repeat;
    background-attachment:fixed;
    background-position:center;
}
```

## 修改Logo字体

在 `themes/next/source/css/_custom/custom.styl` 中添加如下代码：

```
@font-face {
    font-family: Zitiming;
    src: url('/fonts/Zitiming.ttf');
}
.site-title {
    font-size: 40px !important;
	font-family: 'Zitiming' !important;
}
```

其中字体文件在 `themes/next/source/fonts` 目录下，里面有个 `.gitkeep` 的隐藏文件，打开写入你要保留的字体文件，比如我的是就是写入 `Zitiming.ttf` ，具体字库自己从网上下载即可。

## 修改内容区域的宽度

编辑主题的 `source/css/_variables/custom.styl` 文件，新增变量：

```
// 修改成你期望的宽度
$content-desktop = 700px

// 当视窗超过 1600px 后的宽度
$content-desktop-large = 900px
```

## 网站标题栏背景颜色

打开 `themes/next/source/css/_custom/custom.styl` ,在里面写下如下代码：

```
.site-meta {
  background: $blue; //修改为自己喜欢的颜色
}
```

## 自定义鼠标样式

打开 `themes/next/source/css/_custom/custom.styl` ,在里面写下如下代码：

```
// 鼠标样式
  * {
      cursor: url("http://om8u46rmb.bkt.clouddn.com/sword2.ico"),auto!important
  }
  :active {
      cursor: url("http://om8u46rmb.bkt.clouddn.com/sword1.ico"),auto!important
  }
```

## 修改底部标签样式

- 修改`Blog\themes\next\layout\_macro\post.swig`中文件，`command+f`搜索`rel="tag">#`，将`#`替换成`<i class="fa fa-tag"></i>`。输入以下命令，查看效果：

  ```
  hexo clean
  hexo s
  ```

  ![](https://ws1.sinaimg.cn/large/005SfRvrgy1g1609os94vj30aq042741.jpg)

## 在文章末尾添加“文章结束”标记

- 在路径`Blog\themes\next\layout\_macro`文件夹中新建`passage-end-tag.swig`文件。

- 在passage-end-tag.swig添加以下内容，直接用文本编辑器打开，粘贴以下内容后保存

  ```
  <div>
      {% if not is_index %}
          <div style="text-align:center;color: #ccc;font-size:14px;">-------------本文结束<i class="fa fa-paw"></i>感谢您的阅读-------------</div>
      {% endif %}
  </div>
  ```

  

- 打开`Blog\themes\next\layout\_macro\post.swig`，在`post-body`之后，`post-footer`之前（**post-footer之前两个DIV**），添加以下代码：

  ```
  <div>
    {% if not is_index %}
      {% include 'passage-end-tag.swig' %}
    {% endif %}
  </div>
  ```

  

- 添加位置，如下图所示：![](https://ws1.sinaimg.cn/large/005SfRvrgy1g160b5icr4j30rs0ji3zk.jpg)

- 修改主题配置文件**_config.yml**，在末尾添加：

  ```
  # 文章末尾添加“本文结束”标记
  passage_end_tag:
    enabled: true
  ```

- 效果如下 ![](https://ws1.sinaimg.cn/large/005SfRvrgy1g160c9e5wfj30lw04w3ya.jpg)

## 在文章底部增加版权信息

- ------

- 在目录`Blog/themes/next/layout/_macro/`，添加文件 `my-copyright.swig`，内容如下：

  ```
  {% if page.copyright %}
  <div class="my_post_copyright">
    <script src="//cdn.bootcss.com/clipboard.js/1.5.10/clipboard.min.js"></script>
    
    <!-- JS库 sweetalert 可修改路径 -->
    <script src="https://cdn.bootcss.com/jquery/2.0.0/jquery.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <p><span>本文标题:</span><a href="{{ url_for(page.path) }}">{{ page.title }}</a></p>
    <p><span>文章作者:</span><a href="/" title="访问 {{ theme.author }} 的个人博客">{{ theme.author }}</a></p>
    <p><span>发布时间:</span>{{ page.date.format("YYYY年MM月DD日 - HH:MM") }}</p>
    <p><span>最后更新:</span>{{ page.updated.format("YYYY年MM月DD日 - HH:MM") }}</p>
    <p><span>原始链接:</span><a href="{{ url_for(page.path) }}" title="{{ page.title }}">{{ page.permalink }}</a>
      <span class="copy-path"  title="点击复制文章链接"><i class="fa fa-clipboard" data-clipboard-text="{{ page.permalink }}"  aria-label="复制成功！"></i></span>
    </p>
    <p><span>许可协议:</span><i class="fa fa-creative-commons"></i> <a rel="license" href="https://creativecommons.org/licenses/by-nc-nd/4.0/" target="_blank" title="Attribution-NonCommercial-NoDerivatives 4.0 International (CC BY-NC-ND 4.0)">署名-非商业性使用-禁止演绎 4.0 国际</a> 转载请保留原文链接及作者。</p>  
  </div>
  <script> 
      var clipboard = new Clipboard('.fa-clipboard');
      $(".fa-clipboard").click(function(){
        clipboard.on('success', function(){
          swal({   
            title: "",   
            text: '复制成功',
            icon: "success", 
            showConfirmButton: true
            });
      });
      });  
  </script>
  {% endif %}
  ```

  

- 在目录`Blog/themes/next/source/css/_common/components/post/`下添加文件`my-post-copyright.styl`，添加以下代码：

  ```
  .my_post_copyright {
    width: 85%;
    max-width: 45em;
    margin: 2.8em auto 0;
    padding: 0.5em 1.0em;
    border: 1px solid #d3d3d3;
    font-size: 0.93rem;
    line-height: 1.6em;
    word-break: break-all;
    background: rgba(255,255,255,0.4);
  }
  .my_post_copyright p{margin:0;}
  .my_post_copyright span {
    display: inline-block;
    width: 5.2em;
    color: #b5b5b5;
    font-weight: bold;
  }
  .my_post_copyright .raw {
    margin-left: 1em;
    width: 5em;
  }
  .my_post_copyright a {
    color: #808080;
    border-bottom:0;
  }
  .my_post_copyright a:hover {
    color: #a3d2a3;
    text-decoration: underline;
  }
  .my_post_copyright:hover .fa-clipboard {
    color: #000;
  }
  .my_post_copyright .post-url:hover {
    font-weight: normal;
  }
  .my_post_copyright .copy-path {
    margin-left: 1em;
    width: 1em;
    +mobile(){display:none;}
  }
  .my_post_copyright .copy-path:hover {
    color: #808080;
    cursor: pointer;
  }
  ```

  

- 修改`Blog/themes/next/layout/_macro/post.swig`，在如图位置添加以下代码：

  ```
  <div>
        {% if not is_index %}
          {% include 'my-copyright.swig' %}
        {% endif %}
  </div>
  ```

  ![](https://ws1.sinaimg.cn/large/005SfRvrgy1g16283pbo4j30n40oqgpw.jpg)

- 在`Blog/themes/next/source/css/_common/components/post/post.styl`文件最后加入下面的代码：

  ```
  @import "my-post-copyright"
  ```

  

- 在Markdown文章中加入`copyright : ture`：

  ```
  ---
  title: Hexo-NexT主题配置
  date: 2018-01-20 20:41:08
  categories: Hexo
  tags:
  - Hexo
  - NexT
  top: 100
  copyright: ture
  ---
  ```

  

- 配置根目录下的`_config.yml`文件，配置为：

  ```
  # URL
  ## If your site is put in a subdirectory, set url as 'http://yoursite.com/child' and root as '/child/'
  url: https://wenmobo.github.io/  //你的网站地址
  root: /
  permalink: :year/:month/:day/:title/
  permalink_defaults:
  ```

  效果如下![](https://ws1.sinaimg.cn/large/005SfRvrgy1g162aersxdj30q204mwes.jpg)


## 添加外链网易云音乐

- 打开[网易云音乐](http://music.163.com/#)，注册并登陆你的账号号，点击右上角进入我的主页：
  ![](https://ws1.sinaimg.cn/large/005SfRvrgy1g162bgd6a2j30by0em3yh.jpg)

- 选择一首你喜欢的歌曲或者创建一个喜欢的歌单，进入详情：

  ![](https://ws1.sinaimg.cn/large/005SfRvrgy1g162bthvv9j309y0dcq2y.jpg)

- 点击生成外链播放器![](https://ws1.sinaimg.cn/large/005SfRvrgy1g162c4mttqj30rs0ckt8x.jpg)

- 进入详情，设置喜欢的样式，拷贝代码：![](https://ws1.sinaimg.cn/large/005SfRvrgy1g162cgr26qj30rs0epq39.jpg)

- 将代码粘贴到一个合适的位置，我的粘贴在`Blog/themes/next/layout/_macro/sidebar.swig`文件下：

  ```
  <iframe frameborder="no" border="0" marginwidth="0" marginheight="0" width=310 height=110 src="//music.163.com/outchain/player?type=0&id=371085186&auto=1&height=90"></iframe>
  ```

  

- 效果如下：![](https://ws1.sinaimg.cn/large/005SfRvrgy1g162dklgvsj30i00yw74l.jpg)

## 设置头像并设置动画效果

在主题_config.yml中搜索avatar修改如下:

![image](https://ws1.sinaimg.cn/large/005SfRvrgy1g161qrxty0j30n40oqwiv.jpg)

## 修改代码块``自定义样式

- 打开`Blog\themes\next\source\css\_custom\custom.styl`，添加以下代码：

  ```
  // Custom styles.
  code {
      color: #ff7600;
      background: #fbf7f8;
      margin: 2px;
  }
  // 大代码块的自定义样式
  .highlight, pre {
      margin: 5px 0;
      padding: 5px;
      border-radius: 3px;
  }
  .highlight, code, pre {
      border: 1px solid #d6d6d6;
  }
  ```

  

## 侧边栏社交小图标设置

- 打开主题配置文件`_config.yml`，搜索`Social`，将你有的社交账号前面的`#`号去掉。格式为：

  `[社交平台名]: [社交地址] || [图标名称]`

  ```
  social:
    QQ: http://wpa.qq.com/msgrd?v=3&uin=1115144916&site=qq&menu=yes || qq
    微信: /images/weixin.png || weixin
    微博: https://weibo.com/u/5382366905 || weibo
    邮箱: http://mail.qq.com/cgi-bin/qm_share?t=qm_mailme&email=wqq6_-D09vfxgrOz7KGtrw || envelope
    #GitHub: https://github.com/yourname || github
    #E-Mail: mailto:yourname@gmail.com || envelope
    #Weibo: https://weibo.com/yourname || weibo
    #Google: https://plus.google.com/yourname || google
    #Twitter: https://twitter.com/yourname || twitter
    #FB Page: https://www.facebook.com/yourname || facebook
    #VK Group: https://vk.com/yourname || vk
    #StackOverflow: https://stackoverflow.com/yourname || stack-overflow
    #YouTube: https://youtube.com/yourname || youtube
    #Instagram: https://instagram.com/yourname || instagram
    #Skype: skype:yourname?call|chat || skype
  ```

  - 图标可以去[Font Awesome Icon](http://fontawesome.io/icons/)网站去找，找到后复制名字到相应的位置即可。

## 添加网页顶部进度加载条

- 编辑主题配置文件，`command+F`搜索`pace`，将其值改为`ture`就可以了，选择一款你喜欢的样式。

  ```
  # Progress bar in the top during page loading.
  pace: ture
  # Themes list:
  #pace-theme-big-counter
  #pace-theme-bounce
  #pace-theme-barber-shop
  #pace-theme-center-atom
  #pace-theme-center-circle
  #pace-theme-center-radar
  #pace-theme-center-simple
  #pace-theme-corner-indicator
  #pace-theme-fill-left
  #pace-theme-flash
  #pace-theme-loading-bar
  #pace-theme-mac-osx
  #pace-theme-minimal
  # For example
  # pace_theme: pace-theme-center-simple
  pace_theme: pace-theme-minimal
  ```

  

## 底部隐藏由Hexo强力驱动、主题--NexT.Mist

- 主题配置文件搜索`powered`修改如下

  ```
    powered:
      # Hexo link (Powered by Hexo).
      enable: false
      # Version info of Hexo after Hexo link (vX.X.X).
      version: false
    theme:
      # Theme & scheme info link (Theme - NexT.scheme).
      enable: false
      # Version info of NexT after scheme info (vX.X.X).
      version: false
  ```

  

## 添加DaoVoice在线联系

- 首先到[DaoVoice](https://www.daocloud.io/)注册账号，登录成过后，进入到后台管理，点击**应用设置——>安装到网站**查看安装代码和AppID。

- 将安装代码添加到`Blog/themes/next/layout/_partials/head.swig`中：

  ```
  {% if theme.daovoice %}
    <script>
    (function(i,s,o,g,r,a,m){i["DaoVoiceObject"]=r;i[r]=i[r]||function(){(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;a.charset="utf-8";m.parentNode.insertBefore(a,m)})(window,document,"script",('https:' == document.location.protocol ? 'https:' : 'http:') + "//widget.daovoice.io/widget/0f81ff2f.js","daovoice")
    daovoice('init', {
        app_id: "{{theme.daovoice_app_id}}"
      });
    daovoice('update');
    </script>
  {% endif %}
  ```

- 编辑主题配置文件，添加如下代码：

  ```
  # Online contact 
  daovoice: true
  daovoice_app_id: daovoice_app_id
  ```

​      效果图如下所示：![](https://ws1.sinaimg.cn/large/005SfRvrgy1g1622wrqjrj306a098jr5.jpg)

## 添加友链

- 编辑主题配置文件，如下配置即可：

  ```
  # Blog rolls
  links_icon: link
  links_title: 推荐阅读
  #links_layout: block
  links_layout: inline
  links:
    Swift 4: https://developer.apple.com/swift/
    Objective-C: https://developer.apple.com/documentation/objectivec
  ```

  



## 文章加密访问

###  方法一

打开 `themes/*/layout/_partials/head.swig`文件,在 <head></head>之前插入代码：

```
<script>
    (function(){
        if('{{ page.password }}'){
            if (prompt('请输入密码') !== '{{ page.password }}'){
                alert('密码错误');
                history.back();
            }
        }
    })();
</script>
```

写文章时加上`password: *`：

```
---
title: 2018
date: 2018-10-25 16:10:03
password: 123456
---
```

#### 存在问题

目前主要问题是：

- 丑。调用浏览器的UI，各个平台的样式不统一。
- 可能被破解。如果你的博客源码是存放在GitHub这样的开源库的话，那么恭喜你。别有用心之人可以通过查看你的GitHub仓库对应文章的md文件找到这个密码。

### 方法二（推荐）

安装插件：`npm install --save hexo-blog-encrypt`

1. 首先在 **站点配置文件** 中启用该插件:

   ```
   encrypt:
       enable: true
   ```

2. 然后在你的文章的头部添加上对应的字段，如 password, abstract, message

   ```
   ---
   title: 文章加密
   date: 2019-01-04T22:20:13.000Z
   category: 教程
   tags:
     - 博客
     - Hexo
   keywords: 博客文章密码
   password: TloveY
   abstract: 密码：TloveY
   message:  输入密码，查看文章
   ---
   ```

   - password: 是该博客加密使用的密码
   - abstract: 是该博客的摘要，会显示在博客的列表页
   - message: 这个是博客查看时，密码输入框上面的描述性文字

3. 如果你想对 TOC 也进行加密，则在 article.ejs 中将 TOC 的生成代码修改成如下：

   ```
   <% if(post.toc == true){ %>
           <div id="toc-div" class="toc-article" <% if (post.encrypt == true) { %>style="display:none" <% } %>>
               <strong class="toc-title">Index</strong>
               <% if (post.encrypt == true) { %>
                   <%- toc(post.origin) %>
               <% } else { %>
                   <%- toc(post.content) %>
               <% } %>
           </div>
       <% } %>
       <%- post.content %>
   ```

4. 然后使用 *hexo clean && hexo g && hexo s*，来查看效果。

#### 自定义

1. 如果你对默认的主题不满意，或者希望修改默认的提示和摘要内容，你可以添加如下配置在 **站点配置文件** 中。

   ```
   encrypt:
     enable: true
     default_abstract: 这是一篇加密文章，内容可能是个人情感宣泄或者收费技术。如果你确实想看，请与我联系。
     default_message: 输入密码，查看文章。
   ```

   这样，对于每一篇需要加密的文章就不必都在在头部添加 **abstract** 和 **message** 字段了，脚本会自动添加默认的内容填充。

2. 如果你希望对某一篇特定的文章做特殊处理（如本文的 **abstract** ，可以在对应文章的头部添加

   ```
   ---
   title: 文章加密
   date: 2019-01-04T22:20:13.000Z
   category: 教程
   tags:
     - 博客
     - Hexo
   keywords: 博客文章密码
   password: TloveY
   abstract: 密码：TloveY
   ---
   ```

   此时，博客头部的 **abstract** 会覆盖 **站点配置文件** 的 **default_abstract** 实现自定义。

## 实现点击出现桃心效果

1. 在`/themes/next/source/js/src`下新建文件`click.js`，接着把以下粘贴到`click.js`文件中。
   代码如下：
  ```
  !function(e,t,a){function n(){c(".heart{width: 10px;height: 10px;position: fixed;background: #f00;transform: rotate(45deg);-webkit-transform: rotate(45deg);-moz-transform: rotate(45deg);}.heart:after,.heart:before{content: '';width: inherit;height: inherit;background: inherit;border-radius: 50%;-webkit-border-radius: 50%;-moz-border-radius: 50%;position: fixed;}.heart:after{top: -5px;}.heart:before{left: -5px;}"),o(),r()}function r(){for(var e=0;e<d.length;e++)d[e].alpha<=0?(t.body.removeChild(d[e].el),d.splice(e,1)):(d[e].y--,d[e].scale+=.004,d[e].alpha-=.013,d[e].el.style.cssText="left:"+d[e].x+"px;top:"+d[e].y+"px;opacity:"+d[e].alpha+";transform:scale("+d[e].scale+","+d[e].scale+") rotate(45deg);background:"+d[e].color+";z-index:99999");requestAnimationFrame(r)}function o(){var t="function"==typeof e.onclick&&e.onclick;e.onclick=function(e){t&&t(),i(e)}}function i(e){var a=t.createElement("div");a.className="heart",d.push({el:a,x:e.clientX-5,y:e.clientY-5,scale:1,alpha:1,color:s()}),t.body.appendChild(a)}function c(e){var a=t.createElement("style");a.type="text/css";try{a.appendChild(t.createTextNode(e))}catch(t){a.styleSheet.cssText=e}t.getElementsByTagName("head")[0].appendChild(a)}function s(){return"rgb("+~~(255*Math.random())+","+~~(255*Math.random())+","+~~(255*Math.random())+")"}var d=[];e.requestAnimationFrame=function(){return e.requestAnimationFrame||e.webkitRequestAnimationFrame||e.mozRequestAnimationFrame||e.oRequestAnimationFrame||e.msRequestAnimationFrame||function(e){setTimeout(e,1e3/60)}}(),n()}(window,document);
  ```

2. 在`\themes\next\layout\_layout.swig`文件末尾添加：

```
<!-- 页面点击小红心 -->
<script type="text/javascript" src="/js/src/clicklove.js"></script>
```

## 实现点击爆炸效果

效果如图![](https://ws1.sinaimg.cn/large/005SfRvrgy1g15w0wbmawj30ri0pu74v.jpg)

1. 首先在`themes/next/source/js/src`里面建一个叫fireworks.js的文件，代码如下：

```
"use strict";function updateCoords(e){pointerX=(e.clientX||e.touches[0].clientX)-canvasEl.getBoundingClientRect().left,pointerY=e.clientY||e.touches[0].clientY-canvasEl.getBoundingClientRect().top}function setParticuleDirection(e){var t=anime.random(0,360)*Math.PI/180,a=anime.random(50,180),n=[-1,1][anime.random(0,1)]*a;return{x:e.x+n*Math.cos(t),y:e.y+n*Math.sin(t)}}function createParticule(e,t){var a={};return a.x=e,a.y=t,a.color=colors[anime.random(0,colors.length-1)],a.radius=anime.random(16,32),a.endPos=setParticuleDirection(a),a.draw=function(){ctx.beginPath(),ctx.arc(a.x,a.y,a.radius,0,2*Math.PI,!0),ctx.fillStyle=a.color,ctx.fill()},a}function createCircle(e,t){var a={};return a.x=e,a.y=t,a.color="#F00",a.radius=0.1,a.alpha=0.5,a.lineWidth=6,a.draw=function(){ctx.globalAlpha=a.alpha,ctx.beginPath(),ctx.arc(a.x,a.y,a.radius,0,2*Math.PI,!0),ctx.lineWidth=a.lineWidth,ctx.strokeStyle=a.color,ctx.stroke(),ctx.globalAlpha=1},a}function renderParticule(e){for(var t=0;t<e.animatables.length;t++){e.animatables[t].target.draw()}}function animateParticules(e,t){for(var a=createCircle(e,t),n=[],i=0;i<numberOfParticules;i++){n.push(createParticule(e,t))}anime.timeline().add({targets:n,x:function(e){return e.endPos.x},y:function(e){return e.endPos.y},radius:0.1,duration:anime.random(1200,1800),easing:"easeOutExpo",update:renderParticule}).add({targets:a,radius:anime.random(80,160),lineWidth:0,alpha:{value:0,easing:"linear",duration:anime.random(600,800)},duration:anime.random(1200,1800),easing:"easeOutExpo",update:renderParticule,offset:0})}function debounce(e,t){var a;return function(){var n=this,i=arguments;clearTimeout(a),a=setTimeout(function(){e.apply(n,i)},t)}}var canvasEl=document.querySelector(".fireworks");if(canvasEl){var ctx=canvasEl.getContext("2d"),numberOfParticules=30,pointerX=0,pointerY=0,tap="mousedown",colors=["#FF1461","#18FF92","#5A87FF","#FBF38C"],setCanvasSize=debounce(function(){canvasEl.width=2*window.innerWidth,canvasEl.height=2*window.innerHeight,canvasEl.style.width=window.innerWidth+"px",canvasEl.style.height=window.innerHeight+"px",canvasEl.getContext("2d").scale(2,2)},500),render=anime({duration:1/0,update:function(){ctx.clearRect(0,0,canvasEl.width,canvasEl.height)}});document.addEventListener(tap,function(e){"sidebar"!==e.target.id&&"toggle-sidebar"!==e.target.id&&"A"!==e.target.nodeName&&"IMG"!==e.target.nodeName&&(render.play(),updateCoords(e),animateParticules(pointerX,pointerY))},!1),setCanvasSize(),window.addEventListener("resize",setCanvasSize,!1)}"use strict";function updateCoords(e){pointerX=(e.clientX||e.touches[0].clientX)-canvasEl.getBoundingClientRect().left,pointerY=e.clientY||e.touches[0].clientY-canvasEl.getBoundingClientRect().top}function setParticuleDirection(e){var t=anime.random(0,360)*Math.PI/180,a=anime.random(50,180),n=[-1,1][anime.random(0,1)]*a;return{x:e.x+n*Math.cos(t),y:e.y+n*Math.sin(t)}}function createParticule(e,t){var a={};return a.x=e,a.y=t,a.color=colors[anime.random(0,colors.length-1)],a.radius=anime.random(16,32),a.endPos=setParticuleDirection(a),a.draw=function(){ctx.beginPath(),ctx.arc(a.x,a.y,a.radius,0,2*Math.PI,!0),ctx.fillStyle=a.color,ctx.fill()},a}function createCircle(e,t){var a={};return a.x=e,a.y=t,a.color="#F00",a.radius=0.1,a.alpha=0.5,a.lineWidth=6,a.draw=function(){ctx.globalAlpha=a.alpha,ctx.beginPath(),ctx.arc(a.x,a.y,a.radius,0,2*Math.PI,!0),ctx.lineWidth=a.lineWidth,ctx.strokeStyle=a.color,ctx.stroke(),ctx.globalAlpha=1},a}function renderParticule(e){for(var t=0;t<e.animatables.length;t++){e.animatables[t].target.draw()}}function animateParticules(e,t){for(var a=createCircle(e,t),n=[],i=0;i<numberOfParticules;i++){n.push(createParticule(e,t))}anime.timeline().add({targets:n,x:function(e){return e.endPos.x},y:function(e){return e.endPos.y},radius:0.1,duration:anime.random(1200,1800),easing:"easeOutExpo",update:renderParticule}).add({targets:a,radius:anime.random(80,160),lineWidth:0,alpha:{value:0,easing:"linear",duration:anime.random(600,800)},duration:anime.random(1200,1800),easing:"easeOutExpo",update:renderParticule,offset:0})}function debounce(e,t){var a;return function(){var n=this,i=arguments;clearTimeout(a),a=setTimeout(function(){e.apply(n,i)},t)}}var canvasEl=document.querySelector(".fireworks");if(canvasEl){var ctx=canvasEl.getContext("2d"),numberOfParticules=30,pointerX=0,pointerY=0,tap="mousedown",colors=["#FF1461","#18FF92","#5A87FF","#FBF38C"],setCanvasSize=debounce(function(){canvasEl.width=2*window.innerWidth,canvasEl.height=2*window.innerHeight,canvasEl.style.width=window.innerWidth+"px",canvasEl.style.height=window.innerHeight+"px",canvasEl.getContext("2d").scale(2,2)},500),render=anime({duration:1/0,update:function(){ctx.clearRect(0,0,canvasEl.width,canvasEl.height)}});document.addEventListener(tap,function(e){"sidebar"!==e.target.id&&"toggle-sidebar"!==e.target.id&&"A"!==e.target.nodeName&&"IMG"!==e.target.nodeName&&(render.play(),updateCoords(e),animateParticules(pointerX,pointerY))},!1),setCanvasSize(),window.addEventListener("resize",setCanvasSize,!1)};
```

2. 打开`themes/next/layout/_layout.swig`,在`</body>`上面写下如下代码：

```
{% if theme.fireworks %}
   <canvas class="fireworks" style="position: fixed;left: 0;top: 0;z-index: 1; pointer-events: none;" ></canvas> 
   <script type="text/javascript" src="//cdn.bootcss.com/animejs/2.2.0/anime.min.js"></script> 
   <script type="text/javascript" src="/js/src/fireworks.js"></script>
{% endif %}
```
3. 打开主题配置文件，在里面最后写下：

```
# Fireworks
fireworks: true静态资源压缩
```

## 静态资源压缩

在站点目录下： `npm install gulp -g`

1. 安装gulp插件：

```
npm install gulp-minify-css --save
npm install gulp-uglify --save
npm install gulp-htmlmin --save
npm install gulp-htmlclean --save
npm install gulp-imagemin --save
```

2. 在 `Hexo` 站点下新建 `gulpfile.js`文件，文件内容如下：

```
var gulp = require('gulp');
var minifycss = require('gulp-minify-css');
var uglify = require('gulp-uglify');
var htmlmin = require('gulp-htmlmin');
var htmlclean = require('gulp-htmlclean');
var imagemin = require('gulp-imagemin');
// 压缩css文件
gulp.task('minify-css', function() {
  return gulp.src('./public/**/*.css')
  .pipe(minifycss())
  .pipe(gulp.dest('./public'));
});
// 压缩html文件
gulp.task('minify-html', function() {
  return gulp.src('./public/**/*.html')
  .pipe(htmlclean())
  .pipe(htmlmin({
    removeComments: true,
    minifyJS: true,
    minifyCSS: true,
    minifyURLs: true,
  }))
  .pipe(gulp.dest('./public'))
});
// 压缩js文件
gulp.task('minify-js', function() {
    return gulp.src(['./public/**/.js','!./public/js/**/*min.js'])
        .pipe(uglify())
        .pipe(gulp.dest('./public'));
});
// 压缩 public/demo 目录内图片
gulp.task('minify-images', function() {
    gulp.src('./public/demo/**/*.*')
        .pipe(imagemin({
           optimizationLevel: 5, //类型：Number  默认：3  取值范围：0-7（优化等级）
           progressive: true, //类型：Boolean 默认：false 无损压缩jpg图片
           interlaced: false, //类型：Boolean 默认：false 隔行扫描gif进行渲染
           multipass: false, //类型：Boolean 默认：false 多次优化svg直到完全优化
        }))
        .pipe(gulp.dest('./public/uploads'));
});
// 默认任务
gulp.task('default', [
  'minify-html','minify-css','minify-js','minify-images'
]);
```

3. 只需要每次在执行 `generate` 命令后执行 `gulp` 就可以实现对静态资源的压缩，压缩完成后执行 `deploy` 命令同步到服务器：

```
hexo g
gulp
hexo d
```



## 博文置顶

1. 插件安装

```
$ npm uninstall hexo-generator-index --save
$ npm install hexo-generator-index-pin-top --save
```

2. 然后在需要置顶的文章的Front-matter中加上top即可：

```
---
title: 2018
date: 2018-10-25 16:10:03
top: 10
---
```
3. 设置置顶标志打开：/themes/*/layout/_macro/post.swig，定位到<div class="post-meta">标签下，插入如下代码：

```
  {% if post.top %}
         <i class="fa fa-thumb-tack"></i>
         <font color=7D26CD>置顶</font>
         <span class="post-meta-divider">|</span>
   {% endif %}
```

## 在右上角或者左上角实现fork me on github

1. 选择样式[GitHub Ribbons](https://blog.github.com/2008-12-19-github-ribbons/),
2. 修改图片跳转链接,将`<a href="https://github.com/you">`中的链接换为自己Github链接：
3. 打开 `themes/next/layout/_layout.swig` 文件，把代码复制到`<div class="headband"></div>`下面。

## 主页文章添加边框阴影效果

打开 `themes/next/source/css/_custom/custom.styl` ,向里面加代码:

```
// 主页文章添加阴影效果
.post {
   margin-top: 0px;
   margin-bottom: 60px;
   padding: 25px;
   -webkit-box-shadow: 0 0 5px rgba(202, 203, 203, .5);
   -moz-box-shadow: 0 0 5px rgba(202, 203, 204, .5);
}
```

## 显示当前浏览进度

修改`themes/next/_config.yml`，把 `false` 改为 `true`：

```
back2top:
  enable: true
  # Back to top in sidebar.
  sidebar: true
  # Scroll percent label in b2t button.
  scrollpercent: true
```

## 添加看板娘

1. 安装插件npm install --save hexo-helper-`live2d`

2. 安装你喜欢的模型 npm install --save live2d-widget-model-你喜欢的模型名字[模型预览](https://huaji8.top/post/live2d-plugin-2.0/)

   Epsilon2.1

   ![](https://ws1.sinaimg.cn/large/005SfRvrgy1g15wtjo2d5g30ez0klu0x.gif)

   Gantzert_Felixander

   ![](https://ws1.sinaimg.cn/large/005SfRvrgy1g15wvccr67g30ez09n1l0.gif)

   haru

   ![](https://ws1.sinaimg.cn/large/005SfRvrgy1g15wvw9hmig30ez0klqv6.gif)

   miku

   ![](https://ws1.sinaimg.cn/large/005SfRvrgy1g15wwykwbhg30ez0knqva.gif)

   shizuku

   ![](https://ws1.sinaimg.cn/large/005SfRvrgy1g15wxmmdarg30ez0klnpg.gif)

   z16

   ![](https://ws1.sinaimg.cn/large/005SfRvrgy1g15wy007djg30ez0kinpe.gif)

   koharu

   ![](https://ws1.sinaimg.cn/large/005SfRvrgy1g15wzfg6ytg309a0e3qv5.gif)

   

   

3. 在站点的`_config.yml` 文件添加配置.

```
live2d:
  enable: true
  scriptFrom: local
  pluginRootPath: live2dw/
  pluginJsPath: lib/
  pluginModelPath: assets/
  tagMode: false
  debug: false
  model:
    use: live2d-widget-model-你喜欢的模型名字
  display:
    position: right
    width: 150
    height: 300
  mobile:
    show: true
```

## 评论系统

|                                             | **推荐指数** |            优点             |        缺点        |
| :-----------------------------------------: | :----------: | :-------------------------: | :----------------: |
|      [Valine](https://valine.js.org/)       |      4       | 每天30000条评论，10GB的储存 |   作者评论无标识   |
|    [来必力/livere](https://livere.com/)     |      4       |        多种账号登录         |    评论无法导出    |
|    [畅言](http://changyan.kuaizhan.com/)    |      3       |            美观             |    必须备案域名    |
| [gitment](https://github.com/imsun/gitment) |      3       |            简洁             | 只能登陆github评论 |
|                   Disqus                    |      1       |                             |     需要翻*墙      |

### Valine

1. 获取APP ID 和 APP Key

   请先登录或注册 [LeanCloud](https://leancloud.cn/), 进入控制台后点击左下角创建应用，然后存储里创建一个Counter的Class

![image](https://wx4.sinaimg.cn/large/005SfRvrgy1g15zd7it80j30yw0ovmyt.jpg)

2. 选择左下角的`设置`>`应用Key`，然后就能看到你的`APP ID`和`APP Key`了。

![image](https://wx2.sinaimg.cn/large/005SfRvrgy1g15ze9181gj30z90sk0v5.jpg)

3. 填写APP ID 和 APP Key到主题配置文件`_config.yml`

   搜索`valine`将enable设置为true

![image](https://ws2.sinaimg.cn/large/005SfRvrgy1g15zjbc1c4j30n40oq437.jpg)

### 来必力/livere

1. 登陆 [来必力](https://livere.com/) 获取你的 LiveRe UID

2. 填写LiveRe UID到主题配置文件`_config.yml`

   ​	搜索`livere`去掉前面的#号，后面填上uid

### 畅言

1. 获取APP ID 和 APP Key
2. 请先登录或注册 [畅言](http://changyan.kuaizhan.com/), 点击“立即免费获取畅言”，
3. 新建站点，点击管理，点击评论插件>评论管理，
4. 点击后台总览，然后就能看到你的`APP ID`和`APP Key`了
5. 填写APP ID 和 APP Key到主题配置文件`_config.yml`
6. 运行`hexo g&&hexo d`推送到博客

### gitment

1. 安装插件：`npm i --save gitment`

2. 申请应用，在[New OAuth App](https://github.com/settings/applications/new)为你的博客应用一个密钥:

   ```
   Application name:随便写
   Homepage URL:这个也可以随意写,就写你的博客地址就行
   Application description:描述,也可以随意写
   Authorization callback URL:这个必须写你的博客地址
   ```

3. 编辑主题配置文件`themes/*/_config.yml`:

   ```
   # Gitment
   # Introduction: https://imsun.net/posts/gitment-introduction/
   gitment:
     enable: true
     mint: true # RECOMMEND, A mint on Gitment, to support count, language and proxy_gateway
     count: true # Show comments count in post meta area
     lazy: false # Comments lazy loading with a button
     cleanly: false # Hide 'Powered by ...' on footer, and more
     language: # Force language, or auto switch by theme
     github_user: {you github user id}
     github_repo: 公开的git仓库,评论会作为那个项目的issue
     client_id: {刚才申请的ClientID}
     client_secret: {刚才申请的Client Secret}
     proxy_gateway: # Address of api proxy, See: https://github.com/aimingoo/intersect
     redirect_protocol: # Protocol of redirect_uri with force_redirect_pro
   ```

   ### Disqus

   编辑 主题配置文件`themes/*/_config.yml`， 将 disqus 下的 enable 设定为 true，同时提供您的 shortname。count 用于指定是否显示评论数量。next7.0好像没有了

   ```
   disqus:
     enable: false
     shortname:
     count: true
   ```

   

   ## 数据统计

   |                       名称                        | **推荐指数** |                      优点                      |  缺点  |
   | :-----------------------------------------------: | ------------ | :--------------------------------------------: | :----: |
   | [不蒜子](http://ibruce.info/2015/04/04/busuanzi/) | 4            | 可直接将访问次数显示在您在网页上（也可不显示） | 只计数 |
   |                     百度统计                      | 3            |                                                | 收录慢 |

   ### 不蒜子

   编辑 主题配置文件 `themes/next/_config.yml`中的`busuanzi_count`的配置项即可。

   - 当`enable: true`时，代表开启全局开关。

   - 若`site_uv`（本站访客数）、`site_pv`（本站访客数）、`page_pv`（本文总阅读量）的值均为`false`时，不蒜子仅作记录而不会在页面上显示。

   - 在`\themesnext\layout_third-party\analytics\busuanzi-counter.swig`里添加本站访问量:

     ![image](https://ws2.sinaimg.cn/large/005SfRvrgy1g15zv2kxa3j30n40oqtb6.jpg)

   - 效果图如下![image](https://ws4.sinaimg.cn/large/005SfRvrgy1g15zxmyoqaj31hc04t75m.jpg)

   ### 百度统计

   1. 登录 [百度统计](http://tongji.baidu.com/)，定位到站点的代码获取页面
   2. 复制统计脚本 id，如图![](https://ws1.sinaimg.cn/large/005SfRvrgy1g15zzf629ij30ih06ot8v.jpg)
   3. 编辑 主题配置文件`themes/*/_config.yml`，修改字段 `google_analytics`，值设置成你的统计脚本 id。

## 内容分享服务

|                                                              | 推荐指数 | 优点 |             缺点              |
| :----------------------------------------------------------: | :------: | :--: | :---------------------------: |
|             [百度分享](http://share.baidu.com/)              |    4     | 稳定 |           不太美观            |
| [need-more-share2](https://github.com/revir/need-more-share2) |    4     | 美观 | 更新不及时（比如微信分享API） |

### 百度分享

​	编辑 主题配置文件，添加/修改字段 `baidushare`，值为 `true`即可。

```
# 百度分享服务
baidushare: true
```

### need-more-share2

编辑 主题配置文件，添加/修改字段 `needmoreshare2`，值为 `true`即可。

```
needmoreshare2:
  enable: true
```

打开CDN加速

![](https://ws1.sinaimg.cn/large/005SfRvrgy1g16045iv4rj30n40epdir.jpg)

## 搜索服务

|              | 推荐指数 |   优点   |  缺点  |
| :----------: | :------: | :------: | :----: |
| Local Search |    4     | 配置方便 |        |
|   Swiftype   |    2     |          | 需注册 |
|   Algolia    |    2     |          | 需注册 |

### Local Search

   添加百度/谷歌/本地 自定义站点内容搜索

1. 安装 `hexo-generator-searchdb`，在站点的根目录下执行以下命令：` npm install hexo-generator-searchdb --save`

2. 编辑 站点配置文件，新增以下内容到任意位置：

   ```
   search:
     path: search.xml
     field: post
     format: html
     limit: 10000
   ```

   

3. 编辑 主题配置文件，启用本地搜索功能：

   ```
   # Local search
   local_search:
     enable: true
   ```

## 问题解决

1. 博客集成来必力后，标签、分类、分类显示评论组件，这里需要隐藏,打开根目录，找到如下文件夹：![](https://ws1.sinaimg.cn/large/005SfRvrgy1g162en1yq4j30ma0ckaab.jpg)

2. 编辑**index.md**文件，添加**comments**将其值设为**false**:

   ```
   ---
   title: tags
   date: 2018-01-20 18:57:48
   type: "tags"
   comments: false
   ---
   ```

3. 然后执行，就没有评论框了：

   ```
   hexo clean
   hexo g
   hexo d
   ```



## 开启打赏功能

- 主题配置搜索`reward`修改为`true`

  ```
  reward:
    enable: true
    #comment: Donate comment here
    wechatpay: /images/ds_weixin.png
    alipay: /images/da_zhifubao.png
    #bitcoin: /images/bitcoin.jpg
  ```

  



## 总结

 	终于搭建好自己的小窝啦，这里是我的成果： [我的博客](http://xiongge.top)，从最开始无从下手，到一步步搭建起各种效果，自己还是挺有成就感的，虽然让自己折腾了好几天，但还是值得的，在搭建的过程中，自己也参考了很多优秀的博客，非常感谢博主的无私分享。如果以后有更多好看炫酷的效果，我也会在本篇博文中更新。如果你也想开始搭建自己的专属静态博客，就赶快行动吧！