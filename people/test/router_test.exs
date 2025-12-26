defmodule RouterTest do
  use ExUnit.Case
  use Plug.Test

  @opts People.Router.init([])

  test "returns hello 'name'" do
    conn = conn(:get, "/hello/Izzy")
    conn = People.Router.call(conn, @opts)
    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "Hello Izzy!"
  end
end
