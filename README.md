# SsdpAutoConnect

When building simple elixir projects that run on raspberry pis or other devices I wanted to have them discover one-another and automatically connect via erlang distribution.
This project is a way for me to drop in a single dependency and a little it of configuration that will result in auto-discovering and auto-connecting devices.

> It's also handy to run on a laptop that will automatically discover and connect to any devices on your LAN

## How To Use

For simple cases just add this library to your mix file, add a `config :ssdp_auto_connect, :service_name, "my_service._tcp"` line t your configuration.
Then just start each of your nodes with a `--sname somethingunique` and give them all the same cookie.
As long as their multicast messages reach one another they will attempt to connect.

This library also works if you start your erlang process with `--name` using fully-qualified names, just make sure you have at least two parts to your name so erlang will know that it's intended as a fully-qualified name. (eg. `name@something.local`)

## How It Works

This library uses the SSDP protocol to multicast messages around a LAN looking for other services. When you configure your service name a suprvised process wakes up every 30 seconds and multicasts across the LAN to look for other nodes with that same service name.

Each time we discover another node with the same service name we add a host entry for them. Host entries are sort of like adding an entry to your `/etc/hosts` file, except it only affects DNS for your erlang process. Then it attempts to `Node.connect` to your node and since it just made a hsot entry erlang will know how to route the messsage correctly.

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

