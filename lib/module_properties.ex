defmodule H do
    def on_def(_env, kind, name, args, guards, body) do
        IO.puts "Defining #{kind} named #{name} with args:"
        IO.inspect args
        IO.puts "and guards"
        IO.inspect guards
        IO.puts "and body"
        IO.puts Macro.to_string(body)
    end
end

defmodule M do
    @moduledoc """
    http://segmentfault.com/blog/lds/1190000000592316#articleHeader8

    @on_definition

    用于当前模块的函数或者宏定义时调用hook, 参数是模块名或者元组{, }. 函数接受6个参数：

    - 模块环境变量
    - 类型: `:def`, `:defp`, `:defmacro`, or `:defmacrop`
    - function/macro 名字
    - 参数列表
    - 函数guard列表

    @on_definition 只会调用函数，不会调用宏，即@on_definition 的 参数是函数。
    未指定函数时， 会 调用`__on_definition__/6`函数。

      defmodule H do
        def on_def(_env, kind, name, args, guards, body) do
          IO.puts "Defining #{kind} named #{name} with args:"
          IO.inspect args
          IO.puts "and guards"
          IO.inspect guards
          IO.puts "and body"
          IO.puts Macro.to_string(body)
        end
      end

      defmodule M do
        @on_definition {H, :on_def}

        def hello(arg) when is_binary(arg) or is_list(arg) do
          "Hello" <> to_string(arg)
        end

        def hello(_) do
          :ok
        end
      end

    """
    @on_definition {H, :on_def}

    def hello(arg) when is_binary(arg) or is_list(arg) do
        "Hello" <> to_string(arg)
    end

    def hello(_) do
        :ok
    end
end