defmodule Openheroes.Repo.Migrations.CreateBoons do
  use Ecto.Migration

  def change do
    create table(:boons) do
      add :name, :string
      add :tags, {:array, :string}
      add :attribute, {:array, :string}
      add :invocation_time, :string
      add :duration, :string
      add :description, :text
      add :effect, :text
      add :power, {:array, :integer}

      timestamps()
    end
  end
end
