defmodule HighScore do
  @default_score 0

  def new() do
    %{}
  end

  def add_player(scores, name, score \\ @default_score) do
    Map.put(scores, name, score)
  end

  def remove_player(scores, name) do
    Map.delete(scores, name)
  end

  def reset_score(scores, name) do
    Map.put(scores, name, @default_score)
  end

  def update_score(scores, name, score) do
    Map.update(scores, name, score, fn prev -> prev + score end)
  end

  # my own solution
  def get_players(scores) do
    scores
    |> Map.to_list()
    |> Enum.map(fn {key, _} -> key end)
  end

  '''
  after research, better solution
  def get_players(scores)
    Map.keys(scores)
  '''

  def get_players(_) do
    []
  end
end
