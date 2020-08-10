defmodule LogLacWeb.PageController do
  use LogLacWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
