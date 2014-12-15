defmodule DoubanBookApiV2 do
    use HTTPotion.Base

    @doc """
    通过图书ID获取图书的URL
    参数`book_id`可以直接传递整数作为参数,也可以传递字符串
    """
    def process_url(book_id) do
        if is_integer(book_id) do
            book_id = Integer.to_string(book_id)
        end
        "http://api.douban.com/v2/book/" <> book_id
    end

    @doc """
    通过图书ID获取图书信息, 返回类型为包含图书信息的`Map`

    Map定义如下

    ```
    %{
        rating: rating,                 # 评分
        subtitle: subtitle,             # 子标题
        author: author,                 # 作者
        pubdate: pubdate,               # 出版日期
        tags: tags,                     # 标签
        origin_title: origin_title,     # 原标题
        image: image,                   # 封面
        binding: binding,               # 装订
        translator: translator,         # 译者
        catalog: catalog,               # 分类
        pages: pages,                   # 页数
        images: images,                 # 图片
        alt: alt,                       # Web链接地址
        id: id,                         # 图书ID
        publisher: publisher,           # 出版社
        isbn10: isbn10,                 # 10位ISBN编号
        isbn13: isbn13,                 # 13位ISBN编号
        title: title,                   # 书名
        url: url,                       # API调用地址
        alt_title: alt_title,           #
        author_intro: author_intro,     # 作者信息
        summary: summary,               # 图书摘要
        price: price                    # 定价
    }
    ```

    ```
    DoubanBookApiV2.start
    book = DoubanBookApiV2.get_book(1041007)
    ```
    """
    def get_book(book_id) do
        url = process_url(book_id)
        IO.puts "Getting data from #{url}"
        response = HTTPotion.get(url, [], [:timeout, 15000])

        json = :jiffy.decode response.body
        {[
            {"rating", rating},
            {"subtitle", subtitle},
            {"author", author},
            {"pubdate", pubdate},
            {"tags", tags},
            {"origin_title", origin_title},
            {"image", image},
            {"binding", binding},
            {"translator", translator},
            {"catalog", catalog},
            {"pages", pages},
            {"images", images},
            {"alt", alt},
            {"id", id},
            {"publisher", publisher},
            {"isbn10", isbn10},
            {"isbn13", isbn13},
            {"title", title},
            {"url", url},
            {"alt_title", alt_title},
            {"author_intro", author_intro},
            {"summary", summary},
            {"price", price}
        ]} = json
        %{
            rating: rating,
            subtitle: subtitle,
            author: author,
            pubdate: pubdate,
            tags: tags,
            origin_title: origin_title,
            image: image,
            binding: binding,
            translator: translator,
            catalog: catalog,
            pages: pages,
            images: images,
            alt: alt,
            id: id,
            publisher: publisher,
            isbn10: isbn10,
            isbn13: isbn13,
            title: title,
            url: url,
            alt_title: alt_title,
            author_intro: author_intro,
            summary: summary,
            price: price,
            json: json
        }
    end
end
