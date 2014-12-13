DoubanBookApiV2
===============

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

## 参考资料

1. https://github.com/myfreeweb/httpotion
2. http://developers.douban.com/wiki/?title=book_v2#get_book
3. https://api.douban.com/v2/book/1041007
4. http://learnxinyminutes.com/docs/zh-cn/elixir-cn/
