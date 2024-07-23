defmodule Retc do

  def main([ socket_url, hub_sid, msg ]) do
    socket = connect_socket(socket_url)
    channel = join_channel(socket, hub_sid)
    send_msg(channel, msg, 400)
  end

  def connect_socket(url) do
    opts = [url: url]
    {:ok, socket} = PhoenixClient.Socket.start_link(opts)
    socket
  end

  def join_channel(socket, hub_sid) do
    case PhoenixClient.Channel.join(socket, "hub:#{hub_sid}", %{"profile" => "hub_logger"})do
      {:error, :socket_not_connected} -> join_channel(socket, hub_sid)
      {:ok, _res, channel} -> channel
    end
  end

  @spec send_msg(any(), any(), integer()) :: :ok
  def send_msg(channel, msg, times, interval_ms \\ 25) do
    for i <- 1..times do
      PhoenixClient.Channel.push(channel, "retc", %{helloworld: msg, i: i})
      :timer.sleep(interval_ms)
    end
    :ok
  end
end
