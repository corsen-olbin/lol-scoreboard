defmodule LolScoreboardWeb.ScoreboardLive do
  # In Phoenix v1.6+ apps, the line below should be: use MyAppWeb, :live_view
  use LolScoreboardWeb, :live_view

  alias LolScoreboard.DataFetcher

  def render(assigns) do
    case assigns.scores do
      :none -> Phoenix.View.render(LolScoreboardWeb.WaitingView, "waiting.html", assigns)
      _ -> Phoenix.View.render(LolScoreboardWeb.ScoreboardView, "scoreboard.html", assigns)
    end
  end

  def mount(_params, _session, socket) do
    if connected?(socket), do: Process.send_after(self(), :update, 2000)

    case DataFetcher.fetch_allgamedata() do
      {:ok, body} -> {:ok, assign(socket, :scores, body)}
      _ -> {:ok, assign(socket, :scores, :none)}
    end
  end

  def handle_info(:update, socket) do
    case DataFetcher.fetch_allgamedata() do
      {:ok, body} -> handle_update(socket, body)
      _ -> handle_not_in_game(socket)
    end

  end

  defp handle_update(socket, body) do
    Process.send_after(self(), :update, 2000)
    {:noreply, assign(socket, :scores, body)}
  end

  defp handle_not_in_game(socket) do
    Process.send_after(self(), :update, 10000)
    {:noreply, assign(socket, :scores, :none)}
  end
end
