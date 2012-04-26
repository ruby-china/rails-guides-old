# Ruby on Rails Guides 中文指南

如果你也想为 Ruby on Rails 社区出一份力就从这里开始吧！

http://guides.ruby-china.org

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

##### 翻译约定 

* 专有名词保持大写：HTML, HAML, SASS, REST...等等。

* 英文及数字夹在中文之间显得薄弱的关系，之间保留 1 格的空格：大家都来翻译 Rails 指南吧，Rails 目前版本为 3.2.2。

* 代码与文字之间保留1格：`` `rvm` 是 Ruby 的版本管控工具。``

由于没有照字母顺序排序的关系，建议你使用浏览器的搜索(`ctrl+F`, `cmd+F`)来寻找名词。

* 英文数字与中文之间要留空格。



** 约定翻译的名词：**

<table>
<tr>
	<th>原文</th>
	<th>中文</th>
</tr>
<tr>
	<td>class</td>
	<td>类别</td>
</tr>
<tr>
	<td>object</td>
	<td>对象</td>
</tr>
<tr>
	<td>instance</td>
	<td>实例</td>
</tr>
<tr>
	<td>instantiate</td>
	<td>实例化</td>
</tr>
<tr>
	<td>instance variable</td>
	<td>实例变量</td>
</tr>
<tr>
	<td>local variable</td>
	<td>局域变数</td>
</tr>
<tr>
	<td>inherit</td>
	<td>继承</td>
</tr>
<tr>
	<td>interface</td>
	<td>接口</td>
</tr>
<tr>
	<td>library</td>
	<td>函式库</td>
</tr>
<tr>
	<td>server</td>
	<td>服务器</td>
</tr>
<tr>
	<td>database</td>
	<td>数据库</td>
</tr>
<tr>
	<td>(database)table</td>
	<td>数据表</td>
</tr>
<tr>
	<td>code</td>
	<td>代码</td>
</tr>
<tr>
	<td>command-line</td>
	<td>命令行</td>
</tr>
<tr>
	<td>terminal</td>
	<td>终端机</td>
</tr>
<tr>
	<td>method</td>
	<td>方法</td>
</tr>
<tr>
	<td>application</td>
	<td>应用程序、应用</td>
</tr>
<tr>
	<td>framework</td>
	<td>框架</td>
</tr>
<tr>
	<td>template</td>
	<td>模版</td>
</tr>
<tr>
	<td>layout</td>
	<td>版型</td>
</tr>
<tr>
	<td>request</td>
	<td>请求</td>
</tr>
<tr>
	<td>timestamp</td>
	<td>时间戳章</td>
</tr>
<tr>
	<td>form</td>
	<td>表单</td>
</tr>
<tr>
	<td>array</td>
	<td>数组</td>
</tr>
<tr>
	<td>iterate</td>
	<td>迭代</td>
</tr>
<tr>
	<td>escaped</td>
	<td>逸出</td>
</tr>
<tr>
	<td>tag</td>
	<td>标签</td>
</tr>
<tr>
	<td>attribute</td>
	<td>属性</td>
</tr>
<tr>
	<td>routing</td>
	<td>路由</td>
</tr>
<tr>
	<td>collection</td>
	<td>集合</td>
</tr>
<tr>
	<td>macro</td>
	<td>宏</td>
</tr>
</table>

##### 保留不译的名词：

... 基本上 Rails、Ruby 有的特有名词，除了计算机科学中常见的词儿以外，在不造成读者困扰的情况下，尽量保持原汁原味。

<table>
<tr>
	<th>原文</th>
	<th>说明</th>
</tr>
<tr>
	<td>ActiveXXX</td>
	<td>比如 ActiveRecord</td>
</tr>
<tr>
	<td>resource</td>
	<td>资源</td>
</tr>
<tr>
	<td>partial</td>
	<td>片段的 view</td>
</tr>
<tr>
	<td>schema</td>
	<td>资料库纲要</td>
</tr>
<tr>
	<td>migration</td>
	<td>资料库迁移</td>
</tr>
<tr>
	<td>REST</td>
	<td></td>
</tr>
<tr>
	<td>helper</td>
	<td>辅助的 Ruby 代码</td>
</tr>
<tr>
	<td>scaffold</td>
	<td>鹰架</td>
</tr>
<tr>
	<td>mock</td>
	<td>行为驱动测试用词</td>
</tr>
<tr>
	<td>stub</td>
	<td>行为驱动测试用词</td>
</tr>
<tr>
	<td>param</td>
	<td>参数</td>
</tr>
<tr>
	<td>Rake</td>
	<td>任务</td>
</tr>
<tr>
	<td>Cucumber</td>
	<td>不是小黄瓜</td>
</tr>
<tr>
	<td>validator</td>
	<td>验证器</td>
</tr>

</table>


还有一些特殊的标记单词也不要翻译。
在这些标记单词后面的内容在生成 HTML 后会有特殊样式:

<table>
<tr>
    <td>WARNING</td>
    <td>警告</td>
</tr>
<tr>
    <td>TIP</td>
    <td>提示</td>
</tr>
<tr>
    <td>NOTE</td>
    <td>注意</td>
</tr>
</table>

##### 生成

使用命令 
 
`$> rake generate_guides_CN`
 

就可以生成 `source/CN` 文件夹下的所有 **markdown** 和 **textile** 文档到 **output/CN** 下。
后缀可以是 `.markdown` 或者 `.md` 或者 `.textile`。

### 部署

文档使用了 *capistrano* 来进行自动化部署。
在部署之前你需要修改 `config/deploy.rb`,设置你的用户名与决定部署的路径等。
之后只要每次运行

```

cap deploy:setup
cap deploy

```

即可自动完成.

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






