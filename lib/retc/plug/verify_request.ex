defmodule Retc.Plug.VerifyRequest do
  defmodule IncompleteRequestError do
    @moduledoc """
    Raised when a request is missing required parameters.
    """

    defexception message: ""
  end

  def init(options), do: options

  def call(%Plug.Conn{request_path: path} = conn, opts) do
    if path in opts[:path] do
      verify_request!(conn.params, opts[:fields])
    end

    conn
  end

  def verify_request!(params, fields) do
    verified =
      params
      |> Map.keys()
      |> contains_filelds?(fields)

    unless verified, do: raise(IncompleteRequestError)
  end

  defp contains_filelds?(keys, fields) do
    Enum.all?(fields, &(&1 in keys))
  end
end
