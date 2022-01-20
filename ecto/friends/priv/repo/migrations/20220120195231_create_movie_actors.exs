defmodule Friends.Repo.Migrations.CreateMovieActors do
  use Ecto.Migration

  def change do
    create table(:movies_actors) do
      add :movie_id, references(:movies)
      add :actor_id, references(:actor)
    end

    create unique_index(:movie_actors, [:movie_id, :actor_id])
  end
end
