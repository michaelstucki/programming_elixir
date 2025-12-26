defmodule People.Plug do
  import Plug.Conn

  def init(options) do
    # initialize options
    options
  end

  def call(conn, _opts) do
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, "Hello again from the People project!")
  end
end

# $ iex -S mix
# iex > Plug.Cowboy.http People.Plug, [] (module, options)
# browser: http://localhost:4000
# iex > r People.plug (recompile and reload)
