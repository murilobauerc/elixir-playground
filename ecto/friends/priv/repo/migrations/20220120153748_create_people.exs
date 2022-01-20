defmodule Friends.Repo.Migrations.CreatePeople do
  use Ecto.Migration

  def change do
    create table(:people) do
      add :id, :string, null: false
      add :name, :string, null: false
      add :age, :integer, default: 0
    end
  end
end
