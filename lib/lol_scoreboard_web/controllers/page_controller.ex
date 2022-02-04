defmodule LolScoreboardWeb.PageController do
  use LolScoreboardWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
