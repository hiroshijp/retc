defmodule Retc do

  def socket() do
    opts = [url: "wss://host.docker.internal:4000/socket/websocket?vsn=2.0.0"]
    {:ok, socket} = PhoenixClient.Socket.start_link(opts)
    socket
  end

  def join(socket, hub_sid) do
    {:ok, _res, channel} = PhoenixClient.Channel.join(socket, "hub:#{hub_sid}", %{"profile" => "hub_logger"})
    channel
  end

  def send(channel, msg \\  %{hello: :world}) do
    PhoenixClient.Channel.push(channel, "new:msg", msg)
    :ok
  end
end
