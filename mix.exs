defmodule Sequence.Mixfile do
  use Mix.Project

  def project do
    [app: :sequence,
     version: "0.0.1",
     elixir: "~> 1.2-dev",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger],
     mod: {Sequence, []},
     env: [initial_number: 457],
     registered: [:sequence]
    ] # 456はリスト`[456]`じゃない，Sequence.Serverエラー発生するから

  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:exrm, "~> 0.19.9"}
    ]
  end
end
