defmodule HighScore do
  @_initial_scores_map %{}
  @_initial_score 0

  def new(), do: @_initial_scores_map

  def add_player(scores, name, score \\ @_initial_score), do: Map.put(scores, name, score)

  def remove_player(scores, name), do: Map.delete(scores, name)

  def reset_score(scores \\ @_initial_scores_map, name),
    do: add_player(scores, name)

  def update_score(scores, name, score \\ @_initial_score),
    do: Map.update(scores, name, score, &(&1 + score))

  def get_players(scores), do: Map.keys(scores)
end
