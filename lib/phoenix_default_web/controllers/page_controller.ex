defmodule PhoenixDefaultWeb.PageController do
  use PhoenixDefaultWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
