# Sequence

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add sequence to your list of dependencies in `mix.exs`:

        def deps do
          [{:sequence, "~> 0.0.1"}]
        end

  2. Ensure sequence is started before your application:

        def application do
          [applications: [:sequence]]
        end

## Usage 

```
iex(1)> Sequence.Server.increment_number 5
:ok
iex(2)> Sequence.Server.next_number
128
iex(3)> Sequence.Server.increment_number "crash"
:ok
server pid = #PID<0.95.0>
iex(4)>
17:47:06.340 [error] GenServer Sequence.Server terminating
** (ArithmeticError) bad argument in arithmetic expression
    (sequence) lib/sequence/server.ex:35: Sequence.Server.handle_cast/2
    (stdlib) gen_server.erl:615: :gen_server.try_dispatch/4
    (stdlib) gen_server.erl:681: :gen_server.handle_msg/5
    (stdlib) proc_lib.erl:239: :proc_lib.init_p_do_apply/3
Last message: {:"$gen_cast", {:increment_number, "crash"}}
State: {129, #PID<0.88.0>}

nil
iex(5)> Sequence.Server.next_number
129
```


