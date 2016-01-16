defmodule Sequence.SubSupervisor do
  use Supervisor

  def start_link(stash_pid) do
    result = {:ok, sub_sup_pid} = Supervisor.start_link(__MODULE__, stash_pid)
    IO.puts "sub sup pid = #{inspect sub_sup_pid}"
    result
  end

  def init(stash_pid) do
    child_processes = [worker(Sequence.Server, [stash_pid]) ]
    supervise child_processes, strategy: :one_for_one
  end
end
