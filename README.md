# SsdpAutoConnect

When building simple elixir projects that run on raspberry pis or other devices I wanted to have them discover one-another and automatically connect via erlang distribution.
This project is a way for me to drop in a single dependency and a little it of configuration that will result in auto-discovering and auto-connecting devices.

> It's also handy to run on a laptop that will automatically discover and connect to any devices on your LAN

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `ssdp_auto_connect` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:ssdp_auto_connect, "~> 0.1.0"}]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/ssdp_auto_connect](https://hexdocs.pm/ssdp_auto_connect).

