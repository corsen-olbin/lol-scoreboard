defmodule LolScoreboardWeb.ScoreboardView do
  use LolScoreboardWeb, :view

  def team_order(players) do
    Enum.filter(players, fn x -> x["team"] == "ORDER" end)
  end

  def team_chaos(players) do
    Enum.filter(players, fn x -> x["team"] == "CHAOS" end)
  end

  def player_kda(scores), do: "#{scores["kills"]}/#{scores["deaths"]}/#{scores["assists"]}"

  def champ_square_img(raw_champ_name) do
    champ_name = String.slice(raw_champ_name, 27..100)
    "http://ddragon.leagueoflegends.com/cdn/12.3.1/img/champion/#{champ_name}.png"
  end

  def item_square_img(item_id) do
    "http://ddragon.leagueoflegends.com/cdn/12.3.1/img/item/#{item_id}.png"
  end

  def time() do
    DateTime.now!("Etc/UTC") |> to_string()

  end
end
