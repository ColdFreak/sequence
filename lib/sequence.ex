defmodule Sequence do
  use Application #ここはapplication

  def start(_type, _args) do
    # Sequenceに定義されたスーパーバイザーのstart_linkを呼び出す
    # そのstart_link関数がSupervisor.start_linkを呼び出して，スーパーバイザ起動
    # 123をスーパーバイザーに渡す
    {:ok, _pid} = Sequence.Supervisor.start_link(123)
  end
end
