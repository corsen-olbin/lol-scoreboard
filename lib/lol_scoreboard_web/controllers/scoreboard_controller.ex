defmodule LolScoreboardWeb.ScoreboardController do
  use LolScoreboardWeb, :controller

  alias LolScoreboard.DataFetcher

  def index(conn, _params) do

    case DataFetcher.fetch_allgamedata() do
      {:ok, body} -> render(conn, "scoreboard.html", scores: body)
      {:error, error} -> error
    end

  end
end
