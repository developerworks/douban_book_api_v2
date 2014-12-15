DoubanBookApiV2
===============

## 步骤

本文描述如何使用Elixir的httpotion模块调用豆瓣图书API获取图书信息.

    root@7bf32c349b69:~# mix new douban_book_api_v2
    * creating README.md
    * creating .gitignore
    * creating mix.exs
    * creating config
    * creating config/config.exs
    * creating lib
    * creating lib/douban_book_api_v2.ex
    * creating test
    * creating test/test_helper.exs
    * creating test/douban_book_api_v2_test.exs

    Your mix project was created successfully.
    You can use mix to compile it, test it, and more:

        cd douban_book_api_v2
        mix test

    Run `mix help` for more commands.


进入刚刚创建的目录`douban_book_api_v2`,编辑`mix.exs`,增加依赖模块:

修改函数`deps`为:

```
defp deps do
    [
        {:ibrowse, github: "cmullaparthi/ibrowse", tag: "v4.1.0"},
        {:jiffy, github: "davisp/jiffy"},
        {:httpotion, "~> 0.2.0"}
    ]
end
```

然后执行如下命令,下载依赖模块:

```
# cd douban_book_api_v2
# mix deps.get
```

注意很多依赖模块托管在Amazon S3上,可能被墙, 可使用如下命令穿墙:

```
export HTTP_PROXY=192.168.8.188:8580
export HTTPS_PROXY=192.168.8.188:8580
```

然后编译:

```
# mix compile
```

接着进入`iex`(Elixir交互式SHELL):

```
# iex -S mix
```
![获取图书信息](http://developerworks.github.io/assets/images/F228B9AD-80CE-4875-AFCB-49BF5446A67D.png)


## 示例代码

https://github.com/developerworks/douban_book_api_v2


## 参考资料

1. https://github.com/myfreeweb/httpotion
2. http://developers.douban.com/wiki/?title=book_v2#get_book
3. https://api.douban.com/v2/book/1041007
4. http://learnxinyminutes.com/docs/zh-cn/elixir-cn/


## 修订记录

- 2014-12-14 13:30
使用[ej][4]模块获取由[jiffy][1], [mochijson2][2], 或 [ejson][3] 返回的Erlang terms

![Javascript的访问方法和ej的访问方法对比](/assets/images/C2B21544-3DDE-48FF-A83E-229C5463790A.png)

```
# 把响应体解码为Erlang term
json = :jiffy.decode response.body
# 通过ej模块访问Erlang term
:ej.get({"author"}, josn)
```

```
iex(21)> :ej.get {"images", "small"}, json
"http://img3.douban.com/spic/s1990480.jpg"
iex(22)> :ej.get {"images", "large"}, json
"http://img3.douban.com/lpic/s1990480.jpg"
iex(23)> :ej.get {"images", "medium"}, json
"http://img3.douban.com/mpic/s1990480.jpg"
iex(24)> :ej.get {"images", "medium"}, json
"http://img3.douban.com/mpic/s1990480.jpg"
iex(25)> :ej.get {"images", "tags", 1}, json
:undefined
iex(26)> :ej.get {"images", "tags"}, json
:undefined
iex(27)> :ej.get {"tags"}, json
[{[{"count", 13368}, {"name", "哈利波特"}, {"title", "哈利波特"}]},
 {[{"count", 10741}, {"name", "J.K.罗琳"}, {"title", "J.K.罗琳"}]},
 {[{"count", 8892}, {"name", "魔幻"}, {"title", "魔幻"}]},
 {[{"count", 7741}, {"name", "小说"}, {"title", "小说"}]},
 {[{"count", 6536}, {"name", "英国"}, {"title", "英国"}]},
 {[{"count", 4591}, {"name", "外国文学"}, {"title", "外国文学"}]},
 {[{"count", 3871}, {"name", "哈利·波特"}, {"title", "哈利·波特"}]},
 {[{"count", 3871}, {"name", "哈利・波特"}, {"title", "哈利・波特"}]}]
iex(28)> :ej.get {"tags", 1}, json
{[{"count", 13368}, {"name", "哈利波特"}, {"title", "哈利波特"}]}
iex(29)> :ej.get {"tags", 1, "count"}, json
13368
iex(30)> :ej.get {"tags", 1, "name"}, json
"哈利波特"
iex(31)> :ej.get {"tags", 1, "title"}, json
"哈利波特"
iex(32)> :ej.get {"tags", 2, "title"}, json
"J.K.罗琳"
iex(33)> :ej.get {"tags", 3, "title"}, json
"魔幻"
iex(34)> :ej.get {"tags", 3, "count"}, json
8892
```

  [1]: https://github.com/davisp/jiffy
  [2]: https://github.com/mochi/mochiweb
  [3]: https://github.com/benoitc/ejson
  [4]: https://github.com/seth/ej