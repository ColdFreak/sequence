defmodule Sequence do
  use Application #ここはapplication

  def start(_type, initial_number) do
    # Sequenceに定義されたスーパーバイザーのstart_linkを呼び出す
    # そのstart_link関数がSupervisor.start_linkを呼び出して，スーパーバイザ起動
    # 123をスーパーバイザーに渡す
    {:ok, _pid} = Sequence.Supervisor.start_link(Application.get_env(:sequence, :initial_number))
  end
end
