defmodule BanamexWeb.PageController do
  use BanamexWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
