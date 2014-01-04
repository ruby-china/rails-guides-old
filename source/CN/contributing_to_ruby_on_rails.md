为 Ruby on Rails 做贡献
=============================

这篇指南涵盖了让_你_成为 Ruby on Rails 框架开发的一部分的方法。在你读了之后，你应该熟悉：

* 使用 Github 来提出 issue（issue在这里指项目里的错误、任务、补丁等等。译者注）
* 克隆 master 分支和运行测试套件
* 帮助解决已有的 issue
* 贡献于 Ruby on Rails 文档
* 贡献于 Ruby on Rails 代码

Ruby on Rails 不是“别人”的框架。多年以来，成百上千的人们都在为 Ruby on Rails 做贡献，从一个单一的细节，到巨大的架构变化——这些都是为了让大家更好的使用 Ruby on Rails。即使你现在并不觉得自己能写代码或文档，你仍然可以为来做贡献，从提出 issue 到测试补丁。

--------------------------------------------------------------------------------

提出 Issue
------------------

Ruby on Rails 使用 [GitHub Issue Tracking](https://github.com/rails/rails/issues) 来管理 issue（主要指bug和新提交的代码）。如果你发现 Ruby on Rails 中的一个bug，你便可以从这里开始。你需要创建一个（免费的） Github 账号来提出 issue， 以及标注或创建 pull request。

NOTE：在Edge（当前正开发版本）中的 Ruby on Rails 里的 bug 最容易引起人们的注意。同时， Ruby on Rails 的核心团队会经常留意关于_Edge版本_的反馈信息。文章后面会讲到如何获取Edge版本。

### 创建 bug 报告

如果你发现 Ruby on Rails 中一个非安全漏洞的问题，请先在 Github 的 [Issues](https://github.com/rails/rails/issues) 中搜索这个问题是否已经被发现了。如果你发现没有 issue 提到这个问题，你可以[创建一个新的issue](https://github.com/rails/rails/issues/new)。（关于提出安全问题请参见下一节）

最简单的情况下，你的 issue 报告应该有标题和描述文字。但这是最简单的情况。你应该尽可能详细的描述这个问题。你需要至少给出一段样例代码来引出问题。更好的方法是用一段单元测试代码来展示预期的行为为什么没有发生。你的目标是让自己——以及别人——能重现这个问题并修复它。

然后，不要以为这就完事了！除非你发现一个“世界末日就要到来了”类型的 bug ，你创建 issue 的目的是希望那些同样发现此问题的人能和你一起修复它。不要以为 issue 会自动被解决或者自有人来解决它。创建 issue 多半是为了让你走上修复 bug 的道路，以及让别人回复你说“我也发现这个问题了”。

### 针对安全漏洞的特别解决办法

WARNING: 请不要把安全漏洞发布在 Github 公共的 issue 管理页面。[Rails 安全策略](http://rubyonrails.org/security) 详细说明了提出安全漏洞的程序。

### 功能需求怎么办？

请不要将你自己的“功能需求”放到 Github 的 issues 中来。如果你想让 Ruby on Rails 中添加新的功能，你应该自己写出这部分代码——或者说服他人和你一起完成这部分代码。后面的文章中会详述如何为 Ruby on Rails 打补丁。如果你在 Github Issues 中加入一个想要的功能又不给出实现代码，你只能等着这个 issue 很快被标注为“无效”。

如果你想在编写补丁代码前反馈一个功能，请发邮件到[Rails核心邮件列表](https://groups.google.com/forum/?fromgroups#!forum/rubyonrails-core)。你也许不会得到回复，那说明大家都不需要这个功能。你也许会发现有人也对这个功能感兴趣。你也许会得到“这个功能不行”的回复。但是，这个邮件列表才是一个正确的讨论新功能的地方。Github Issues 页面不是讨论新功能的好地方。

搭建开发环境
------------------------------------

从提出 bug 到帮助解决已有的 issue 或贡献你自己的代码到 Ruby on Rails 框架，你_必须_让你的代码通过 Rails 的测试套件。这一节中你会学到如何在你的计算机上搭建测试。

### 简单的办法

最简单和推荐的办法来搭建开发环境就是使用[Rails 开发工具箱](https://github.com/rails/rails-dev-box)。

### 难的办法
 
如果你没法使用 Rails 开发工具箱，请看上一节，请参见 [这篇文档](development_dependencies_install.html).

测试 Active Record
---------------------

你会这样仅使用 SQLite3 来测试 Active Record:

```bash
$ cd activerecord
$ bundle exec rake test_sqlite3
```

你也可以用别的数据库来测试，就像用 `sqlite3` 一样。task 分别是：

```bash
test_mysql
test_mysql2
test_postgresql
```

最后，

```bash
$ bundle exec rake test
```

会运行轮流运行这个四个。

你也可以分别运行其中的测试：

```bash
$ ARCONN=sqlite3 ruby -Itest test/cases/associations/has_many_associations_test.rb
```

你也可以调用 `test_jdbcmysql`, `test_jdbcsqlite3` 或者 `test_jdbcpostgresql`。请看`activerecord/RUNNING_UNIT_TESTS` 来了解如何使用其他数据库运行测试，或者参见文件`ci/travis.rb`来了解使用持续集成服务器来运行测试。

### 注意事项

测试套件运行时，warning 是打开的。Ruby on Rails 应该不会报告 warning，但是也许会有几个，有些事来自第三方函数库的。请忽略（或者修复！）它们，如果有的话，并提交是他们不报告 warning 的补丁。

在本文写作时（2010年12月），这些 warning 都是关于 Ruby 1.9 的。如果你知道你每一步在做什么并想看更多的输出信息，这里有个办法：

```bash
$ RUBYOPT=-W0 bundle exec rake test
```

### 旧版本的 Ruby on Rails

如果你想为旧版本的 Ruby on Rails 添加修复，你需要搭建老版本环境并在你的计算机本地切换分支。以下是一个切换到 3-0-stable 分支的例子：

```bash
$ git branch --track 3-0-stable origin/3-0-stable
$ git checkout 3-0-stable
```

TIP：你可以[将 Git 分支名显示在命令行](http://qugstart.com/blog/git-and-svn/add-colored-git-branch-name-to-your-shell-prompt/) 来更容易的看到你正工作在哪个版本的代码上。

帮助解决 issue
----------------------------------

提出 issue 后的下一步，是帮助核心团队解决现有的 issue。如果你在 Github 上读过 [每个人的 issues](https://github.com/rails/rails/issues) 列表，你会看到很多已经需要帮助的 issue。你如何帮忙呢？实际上有很多需要做：

### 检验 bug 报告

对初学者来说，检验 bug 报告很有帮助。你能在你的计算机上重现被发现的问题吗？如果可以，你便可以评论这条 issue 说你也发现同样的问题了。

如果 bug 报告表述不清晰，你能帮忙把它变准确些吗？也许你可以提供一些其他的信息来完善报告，或是去掉些在重现问题时不需要的步骤。

如果你发现一个没有测试的 bug 报告，贡献一个能测试出失败的测试是很有帮助的。这同样也是开始探索源代码的好办法：观察现有的测试文件会教你如何写自己的测试代码。新的测试是贡献补丁最好的方式，下面的“贡献到 Rails 源代码”中会讲到。

任何你可以帮助将 bug 报告变充分或把重现 bug的步骤变简单的举动都会帮助那些尝试修复 bug 的人——不管是不是你来修复这个 bug。

### 测试补丁

你也可以通过测试已经提交到 Ruby on Rails 的 Github 项目的 pull request 来做贡献。要应用某人的改动，你需要先创建一个单独的分支：

```bash
$ git checkout -b testing_branch
```

然后你可以用他们的远程分支来更新你的代码库。比如，Github 用户 JohnSmith 已经 fork 并 push 了他的代码到 “orange” 话题分支，远程地址是 https://github.com/JohnSmith/rails。

```bash
$ git remote add JohnSmith git://github.com/JohnSmith/rails.git
$ git pull JohnSmith orange
```

应用了他们的分支后，就可以测试了！有一些需要思考的问题：

* 代码变化能正常工作吗？
* 你对测试满意吗？你能看懂他们的测试吗？有什么没有测试到的吗？
* 文档覆盖面是否合适？文档还需要更新吗？
* 你喜欢这个代码实现吗？你还能把代码变得更美或者使运行速度更快吗？

如果你对 pull request 中的变更感到满意了，就在 Github 的 issue 下作出评论表示你同意。你的评论要表明你喜欢这个变更，喜欢它的什么。比如这样：

<blockquote>
我喜欢你在 generate_finder_sql 重构的代码——美观多了。测试也很好。
</blockquote>

如果你只是简单的评论“+1”，那么别的审查人员就不会认真理会你的评论。请表现出你花了精力在审查这个 pull request 上。

贡献于 Ruby on Rails 的文档
---------------------------------------

Ruby on Rails 有两个主要的文档：指南是帮助你学习 Ruby on Rails的，还有一个是 API 参考。

你可以帮忙将指南变得更通顺，一致或可读，补充信息，更正错误，纠正笔误，或更新到Edge Rails。如果要参与指南的翻译，请看[翻译 Rails 指南](https://wiki.github.com/lifo/docrails/translating-rails-guides).

如果你自信你做出的变更，你可以直接 push 到 [docrails](https://github.com/lifo/docrails)。 Docrails 是一个遵从 **公开提交策略** 的分支，具有公共写入权。Docrails上的提交仍然要被审查，但是这是在 push 之后发生的。 Docrails 会定期被合并到 master 分支，所以你会有效的编辑 Ruby on Rails 文档。

如果你不确定文档变更，你可以提交一个 issue 到 Github上的 [Rails](https://github.com/rails/rails/issues) 的 issue 控制系统。

当你在做文档时，请考虑[API 文档规范](api_documentation_guidelines.html) 和 [Ruby on Rails 指南规范](ruby_on_rails_guides_guidelines.html)。

NOTE：如前面所说，正确的代码补丁应该有自己的文档。Docrails 仅仅是单独出来的文档。

NOTE：为了有助于持续集成服务器的工作，你可以加入 [ci skip] 到文档的提交信息中，来避免重新生成整个项目。记住只能在纯文档变更提交中使用它。

WARNING：Docrails 有非常严格的策略：不允许改动代码，不管是多么微笑的改动。只有 RDoc 和指南可以通过 Docrails 来编辑。同样，变更记录（CHANGELOG）也不能在 Docrails 上被编辑。

贡献于 Ruby on Rails 代码
------------------------------

### 克隆 Rails 代码库

要贡献代码到 Rails，首先要做的是克隆代码库：

```bash
$ git clone git://github.com/rails/rails.git
```

并且建立单独的分支

```bash
$ cd rails
$ git checkout -b my_new_branch
```

分支用什么名字并不要紧，因为它仅仅存在于你的本地计算机上，和你个人的 Github 代码库中。它不会进入 Rails 的 Git 代码库。

### 编写你的代码

现在可以忙于添加和编辑代码了。你正在你的分支上，所以你可以随意写代码（你可以通过运行 `git branch -a` 来确认你在正确的分支上）。但是如果你打算提交你的变更到 Rails，请记住以下几点：

* 代码要正确
* 使用 Rails 的代码风格和 helper
* 通过整个测试套件
* 更新（周边）的文档，例子，以及指南：所有受你的贡献影响的部分

TIP：只是为了代码更美观，而对稳定性，功能，可测试性，可扩展性，灵活性没有实质改变的的变更一般不会被采纳。

### 遵从代码规定

Rails 代码遵从了一套简单的代码风格规范：

* 不使用Tab,使用两个空格（用于缩进）
* 没有末尾多余的空格。 空白行不应该有空格
* `private` 或 `protected` 后面要缩进
* 更多使用 `&&`/`||` 而不是 `and`/`or`
* 更多使用 `class << self` 而不是 `self.method` 来定义类方法
* 使用 `MyClass.my_method(my_arg)` 而不是 `my_method( my_arg )` 或 `my_method my_arg`
* 使用 `a = b` 而不是 `a=b`

以上只是建议——请根据自己情况使用。

### 更新 CHANGELOG

CHANGELOG 是每次发行版中一个重要的部分。它记录了每次 Rails 发新版本的变化。

如果你对 Rails 框架的功能做出了添加或删除，或者修复了 bug，或者添加了代码过期信息（deprecation），你应该在 CHANGELOG 中添加一条记录。重构和文档类修改一般不应该被放入 CHANGELOG。

一条 CHANGELOG 记录应该简述修改的部分，以及作者的名字。如果需要，你可以使用多行，并且附上样例代码，使用4格的缩进。如果一个修复与某条 issue 是相关的，你应该附上 issue 的编号。这里有一个 CHANGELOG 记录的例子：

```
*   概述简要说明了修改的部分。你可以使用多行，如果超过80个字符应该换行。样例代码也是可以的，如果需要的话

        class Foo
          def bar
            puts 'baz'
          end
        end
	 
    你可以在样例代码后继续写。也可以附上相关的 issue 编号。 GH#1234

    *你的名字*
```

你可以直接添加你的名字，如果你不需要提供样例代码，或者没有多行段落。否则，你的名字最好放在单独的一行。

### 整洁检查

你不应该是提交之前唯一看过你的代码的人。你至少知道一个其他的 Rails 开发者吧？把你的代码给他们看看，并寻求反馈。在正式把代码公开前私下这样做，是对代码的一次“冒烟测试”：如果你没有说服另一个开发者你的代码很美观的话，那你多半也没法说服 Rails 核心团队。

你也可以将 [RailsBridge BugMash](http://wiki.railsbridge.org/projects/railsbridge/wiki/BugMash) 作为一个利用团队力量来改进 Rails 的方法。这可以帮你起步，并在你第一次写补丁时帮你检查代码。

### 提交代码

当你对你的代码满意的时候，你需要把代码提交到 git:

```bash
$ git commit -a
```

这时，你的编辑器会弹出，你应该写上提交信息。格式良好的，描述性强的提交信息对于别人是很有帮助的，尤其是别人想知道你为什么做这次修改的时候。所以请你花点时间写好提交信息。

好的提交信息应该是以下格式的：

```
简述（最好不超过50个字）

更详细的描述，如果需要的话。每行应不超过72个字。
就算是你觉得很显然的事情，也尽量写的有描述性，因
为别人不一定觉得这很显然。如果这段代码与 bug 跟
踪器中某条记录有关，请也附上那个 bug 的描述信息。
这样别人就不用再去 bug 跟踪器看那段信息了。

描述可以是多行的，你也可以附上样例代码，使用4格缩进：

    class PostsController
      def index
        respond_with Post.limit(10)
      end
    end

你也可以使用列表符：

- 你可以使用短线(-)或星号(*)
- 同时，记得每72个字符要换行
```

TIP：注意在保证描述性强的前提下，将你的提交信息写的尽量简练。这可以简化未来的 cherry pick 过程，也可以保持 git 记录简洁。

### 更新 master 分支

很有可能在你修改代码时，有别人修改过 master 分支了。你要更新本地 master 分支：

```bash
$ git checkout master
$ git pull --rebase
```

现在重新应用你的补丁在最新的代码之上：

```bash
$ git checkout my_new_branch
$ git rebase master
```

没有冲突吧？测试都通过吧？你的修改还有必要吗？那就继续吧。

### Fork

> `Fork` 是 Github 中一个重要功能。本节 git 的操作较多，故 git 专业术语不做翻译。请自行查阅 git 相关资料。译者注。

转到 Rails [GitHub 仓库](https://github.com/rails/rails) 并点击右上角的 "Fork"。

添加一个新的远程分支到你的本地代码库：

```bash
$ git remote add mine git@github.com:<your user name>/rails.git
```

Push 你本地的改变到远程：

```bash
$ git push mine my_new_branch
```

你也许已经 clone 了你 fork 下来的仓库到你的计算机，然后想添加 Rails 官方仓库作为一个远程分支到你的本地。如果是这样，你需要做以下的事情：

在你 clone 的你fork下来的仓库中：

```bash
$ git remote add rails git://github.com/rails/rails.git
```

从官方仓库下载最新的提交和分支：

```bash
$ git fetch rails
```

合并新的内容：

```bash
$ git checkout master
$ git rebase rails/master
```

更新你fork的仓库：

```bash
$ git push origin master
```

如果你想更新别的分支：

```bash
$ git checkout branch_name
$ git rebase rails/branch_name
$ git push origin branch_name
```

### 提交一次 Pull Request

转到你Github上的Rails 仓库（比如 https://github.com/你的名字/rails）然后点击右上角的 "Pull Request"。

在branch一栏填上你的分支名（默认填写的是 master）然后点击 "Update Commit Range"。

确保在Commits分页里有你做的修改的信息。确保 "Files Changed" 里显示你修改过的文件。

填写一些更详细的信息，以及一个有意义的标题。完成后，点击 "Send Pull request"。Rails 核心团队将收到你做出了修改的提示。

### 获取反馈

现在你需要让别人来看你的补丁了，就像你看别人做的补丁一样。你可以使用 [rubyonrails-core 邮件列表](http://groups.google.com/group/rubyonrails-core/) 或者 Freenode IRC上的 #rails-contrib 频道。你也可以告诉你认识的 Rails 开发者。

### 需要的话，迭代开发

非常可能，你会收到让你修改代码的反馈信息。别灰心：参与一个活跃的开源项目的意义在于更好的利用社区的智慧。如果别人鼓励你修改你的代码，你就值得进一步修改你的代码后再次提交。如果反馈说你的改变不属于核心，那么你也可以考虑把它做成一个 gem。

### 漏洞修复

合并到 master 分支的修改会被计划放入下一个 Rails 发行版。不过有时直接放入老版本也是有意义的。一般来说，安全漏洞或 bug 修复都很适合直接添加到老版本，而新功能并不适合这么做。如果你不知道你的修改属于哪一类，最好是在提交以前咨询 Rails 团队的成员，以免你的努力白费。

对于简单的修复，最简单的方法是[从你的改变中提取一个 diff 应用到目标分支](http://ariejan.net/2009/10/26/how-to-create-and-apply-a-patch-with-git).

首先确保你的修改只与 master 分支不同：

```bash
$ git log master..HEAD
```

然后提取 diff：

```bash
$ git format-patch master --stdout > ~/my_changes.patch
```

切换到目标分支，应用你的修改：

```bash
$ git checkout -b my_backport_branch 3-2-stable
$ git apply ~/my_changes.patch
```

这种办法对于微小的改变很有效。但是，如果你的修改很复杂，或者代码和目标分支相差很多的，你需要做更多的工作。做漏洞修复的难度，不同情况下差距很大，有时甚至不值得去花功夫做。

当你解决了所有的代码冲突，并确保测试通过后，push 你的修改并为它新开一个 pull request。值得注意的是，老分支可能与 master 有不同的 build targets。可能的话，提交前，最好先在本地测试修复与 `.travis.yml` 中列出的 Ruby 版本的兼容性。

然后... 思考你下一个贡献吧！

Rails 贡献者
------------------

所有贡献者，无论是 master 分支的还是 docrails的，都会被列在[Rails 贡献者](http://contributors.rubyonrails.org)中。
