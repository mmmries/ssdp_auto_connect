defmodule SsdpAutoConnect do
  use Application
  import Supervisor.Spec, warn: false

  def start(_type, _args) do
    Nerves.SSDPServer.publish(Node.self, service_name)
    :inet_db.set_lookup([:file, :dns]) # prefer host entries to DNS lookup

    opts = [strategy: :one_for_one, name: SsdpAutoConnect.Supervisor]
    children = [worker(SsdpAutoConnect.Connector, [])]
    
    Supervisor.start_link(children, opts)
  end

  def discovery_interval do
    Application.get_env(:ssdp_auto_connect, :discovery_interval, 30_000)
  end

  def service_name do
    Application.get_env(:ssdp_auto_connect, :service_name, "ssdp_auto_connect._tcp")
  end
end
