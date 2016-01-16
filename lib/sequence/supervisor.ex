defmodule Sequence.Supervisor do
  use Supervisor # ここはSupervisor

  def start_link(initial_number) do
    result = {:ok, sup} = Supervisor.start_link(__MODULE__, [initial_number])
    IO.puts "sup = #{inspect sup}"
    # 1) stashを起動
    # 2) subsupervisorを起動
    # これらを起動するために一番上のsupervisorのpidを知る必要
    start_workers_res = start_workers(sup, initial_number)
    IO.puts "start_workers_res = #{inspect start_workers_res}"
    result
  end

  def start_workers(sup, initial_number) do
    # stashのpidをsubsupervisorに渡す
    {:ok, stash} = Supervisor.start_child(sup, worker(Sequence.Stash, [initial_number]))
    Supervisor.start_child(sup, supervisor(Sequence.SubSupervisor, [stash]))
  end

  # init/1 must return a supervision 
  # specification which can be created 
  # with the help of Supervisor.Spec module
  # init/1はもともと下のような形
  # def init(:ok) do
  #   children = [
  #     worker(KV.Registry, [KV.Registry])
  #    ]
  #    supervise(children, strategy: :one_for_one)
  # end
  # 下の定義だとただsupervisorを起動して，子を起動しない
  # 空のsupervisorだけを起動
  # そしてstart_worker中のstart_childを使って，
  # stashとsub superviosrを起動する
  def init(_) do
    supervise [], strategy: :one_for_one
  end
end
