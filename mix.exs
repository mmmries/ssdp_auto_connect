defmodule SsdpAutoConnect.Mixfile do
  use Mix.Project

  def project do
    [
      app: :ssdp_auto_connect,
      version: "0.1.0",
      elixir: "~> 1.4",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps(),
      package: package(),
      description: "A package to automatically discover and connect to other erlang/elixir nodes on the LAN",
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {SsdpAutoConnect, []},
    ]
  end

  defp deps do
    [
      {:nerves_ssdp_server, "~> 0.2"},
      {:nerves_ssdp_client, "~> 0.1"},
      {:ex_doc, "~> 0.15.0", only: :dev},
    ]
  end

  defp package do
    [
      licenses: ["MIT"],
      maintainers: ["Michael Ries"],
      links: %{
        "github" => "https://github.com/mmmries/ssdp_auto_connect",
      },
    ]
  end
end
