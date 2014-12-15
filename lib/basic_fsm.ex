defmodule BasicFsm do
    use Fsm, initial_state: :stopped

    defstate stopped do             # opens the state scope

        defevent run do             # defines event
            IO.puts "From stopped to running"
            next_state(:running)    # 转换到下一个状态
        end

    end

    defstate running do

        defevent stop do
            IO.puts "From running to stopped"
            next_state(:stopped)
        end
    end
end