defmodule Retc do
  @sample_naf_msg ~s/{"dataType":"um","data":{"d":[{"networkId":"xsfmtua","owner":"ae582cfb-0864-4111-8f25-bbce7a4867a7","creator":"ae582cfb-0864-4111-8f25-bbce7a4867a7","lastOwnerTime":1721979564904.7,"template":"#remote-avatar","persistent":false,"parent":null,"components":{"6":{"x":18.000000000000036,"y":76.47495361781063,"z":1.003269929904919e-14}}}]}}"/

  def main() do
    IO.puts 'give socket_url, hub_sid and  msg as strting'
  end


  def main([ socket_url, hub_sid, ms]) do
    # preprocess
    ms = String.to_integer(ms)

    # run
    socket = connect_socket(socket_url)
    channel = join_channel(socket, hub_sid)
    send_msg(channel, ms)
  end

  def connect_socket(url) do
    opts = [url: url]
    {:ok, socket} = PhoenixClient.Socket.start_link(opts)
    socket
  end

  def join_channel(socket, hub_sid) do
    case PhoenixClient.Channel.join(socket, "hub:#{hub_sid}", %{"profile" => "retc"})do
      {:error, :socket_not_connected} -> join_channel(socket, hub_sid)
      {:ok, _res, channel} -> channel
    end
  end

  def send_msg(channel, ms) do
    Stream.iterate(0, &(&1 + 1)) |>
    Enum.map(fn i ->
      PhoenixClient.Channel.push(channel, "retc_event", %{num: i, retc_msg: @sample_naf_msg})
      :timer.sleep(ms)
    end)
    :ok
  end
end
