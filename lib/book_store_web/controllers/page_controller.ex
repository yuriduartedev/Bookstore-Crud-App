defmodule BookStoreWeb.PageController do
  use BookStoreWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
