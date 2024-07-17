defmodule Retc.Worker do
  use GenServer, restart: :temporary

  require Logger


  def start_link([url, hub_sid]) do
    GenServer.start_link(__MODULE__, [url, hub_sid], name: __MODULE__)
  end



  # callback to init
  def init([url, hub_sid]) do

    socket = Retc.connect_socket(url)
    channel = Retc.join_channel(socket, hub_sid)
    Retc.send_msg(channel, "Hello, World!", 400)

    {:ok, [url, hub_sid]}
  end
end
