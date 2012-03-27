# Ruby on Rails Guides 中文指南

如果你也想为 Ruby on Rails 社区出一份力就从这里开始吧！
 
## Rails Guides 中文
 
Rails Guides 中文是由 [docrails](https://github.com/lifo/docrails) 中的 guides 修改而来，你可以在[这里](http://guides.rubyonrails.org) 找到官方的原版 Ruby on Rails Guides。Rails Guides 中文目前开源的共享在 [github](https://github.com/RubyChinaTranslation/rails-guides-china)上，你可以根据协议使用并且修改它，Rails Guides 中文希望能为任何热爱 Ruby on Rails 的朋友提供一个共享的文档平台，文章的作者对文章保有一切权利。

### 加入翻译

目前首页的文章大都是出自 [Rails Guides](http://guides.rubyonrails.org)，尚未完全翻译，你可以按照以下的步骤进行认领提交。在认领之前，你需要先到我们的 [github](https://github.com/RubyChinaTranslation/rails-guides-china) 上 fork 一份， 建议使用 textile 进行写作。 

#### 认领制度

不管你是要翻译原有文章，还是希望添加一些你觉得非常有用的译文，都应该在翻译之前进行翻译认领来保证没有人和你重复工作。很简单，只要在 `source/documents_CN.yaml` 中找到或者加入你想翻译的文章的资料，

加入：

```
work_in_progress: true
contributor: +your_github_acount+
```  

之后，发个 `pull request` 过来就代表你成功的占到了一个坑，你可以开始慢慢的翻译自己的文章了。

你可以在 contributor 一栏中加入自己的 github 用户名，以便其他人可以联系到你。另外如果你占坑太久你的占位可能会被取消。尽量在半个月内完成你的工作。 

#### 关于写作

Rails Guides 中文用了一些关键字来让你的文章生成更加便捷。

##### Markdown 和 Textile

你可以自行选择使用 Markdown 或者 Textile 语法进行编写，你可以在这两个地方找到他们的基本语法规则。

* [markdown 语法](http://markdown.tw/)

* [textile 语法](http://redcloth.org/textile)

**由于 markdown 没有提供设置 id 的内建语法，生成的目录无法产生链接，我会尽快修复**。

##### 概要

每篇文章都必须要有一个 `h2` 的大题目和一份概要，并且以 `endprologue.` 结尾，在 `endprologue.` 关键字之前的部分将会生成文章的顶部部分。 

##### 标题和目录

除了题目的 `h2` (只能用一个)以外你可以用 `h3` ~ `h6` 来让你的文章看起来更有章法，脚本会自动的为你的标题添加 id 和章节索引。

##### 标签

除了提供的 markdown 或者 textile 语法支持，还有一些额外的处理，以这些词开头的段落（关键词后面要跟上一个冒号）将会处理成代标签的文本块。

##### 特殊字符

你如果想要显示一些特殊字符，你可以在字符的两边分别加上一个加号 `+`，加号中间的部分将会被 textile或者markdown跳过处理。特殊字元参照markdown或者textile语法中的相应部分。

* [markdown跳脱字元](http://markdown.tw/#backslash)

* [textile内建安全输出](http://redcloth.org/textile/html-integration-and-escapement/#no-textile)

##### 代码

你可以用一对关闭的标签号 \<xxx\> 和 \</xxx\> 包围你的代码来为你提供对应的语法高亮和代码块效果。

xxx包括以下关键字：

* yaml
* shell
* ruby
* erb
* html
* sql
* plain

##### 文章与链接

在  `source/` 下面的 `documents_CN.ymal` 标注出了所有首页的文章和首页索引，当你写完了一篇文章你可以在那里加入自己的文章的介绍，工作进度，从属类别，标题等来让首页可以链接到你的文章。

例如：

    name: 控制器
    documents:   
    name: Action Controller Overview
    url: action_controller_overview.html（你的文件名）
    work_in_progress: true #如果加入这一栏说明你正在更新或者对他进行写作
    contributor: ME #这里可以写上你的 github 帐号名	
    description:  这里是描述
     
##### 生成

使用命令 
 
`$> rake generate_guides_CN`
 

就可以生成 `source/CN` 文件夹下的所有 **markdown** 和 **textile** 文档到 **output/CN** 下。
后缀可以是 `.markdown` 或者 `.md` 或者 `.textile`。

### 建议与反馈

欢迎任何建议！直接开一个 [github issues](https://github.com/RubyChinaTranslation/rails-guides-china/issues) 就可以了，当然你也可以跑到 [Ruby China](http://ruby-china.org) 社区上面去吐槽，我想这问题不大～

### 勘误 

有翻译就有错误或者语义不清的情况，希望大家有爱一点，别太固执，在有错误或者认为翻译不周的时候你可以开一个 [issue](https://github.com/RubyChinaTranslation/rails-guides-china/issues) 提出，当然更好的方法是直接密翻译者提醒其修改或者 fork 翻译者一份进行修改提交。除非是明显的错误（错别字或者语法错误），我们会坚持 **译者的权利**，请不要提交一份修改别人翻译的 commit。 

如果你发现文档已经过时了，你也可以提出 **issue** 来修正，我们会提醒翻译者进行翻修，并对读者提出警告的。

### 感谢

感谢有爱的 Ruby 社区，感谢[各路大神](http://guides.rubyonrails.org/credits.html)为我们分享的文档，感谢每一个热爱并支持 Ruby on Rails 的朋友。

### 译文来源

https://github.com/lifo/docrails

### 译文协议

[内容采用创用 CC 授权释出](http://creativecommons.org/licenses/by-nc-sa/2.5/cn/)

![Creative Commons License](http://i.creativecommons.org/l/by-nc-sa/2.5/cn/88x31.png)

有什么问题可以联系我<mailto:cool.zhikai@gmail.com>.
