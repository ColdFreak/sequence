defmodule Sequence.Stash do
  use GenServer

  def start_link(current_number) do
    result = {:ok, s_pid} = GenServer.start_link(__MODULE__, current_number)
    IO.puts "stash pid = #{inspect s_pid}"
    result
  end

  # 値をstashに保存する
  def save_value(pid, value) do
    GenServer.cast pid, {:save_value, value}
  end
  
  # 値をstashから取り出す
  def get_value(pid) do
    GenServer.call pid, {:get_value}
  end

  #####
  # GenServer implementation
  def handle_call({:get_value}, _from, current_value) do
    {:reply, current_value, current_value}
  end

  # ここは計算など行わない，単純な保存を行うだけ
  def handle_cast({:save_value, value }, _current_value) do
    {:noreply, value}
  end
end
