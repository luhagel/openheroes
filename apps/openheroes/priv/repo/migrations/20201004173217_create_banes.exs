defmodule Openheroes.Repo.Migrations.CreateBanes do
  use Ecto.Migration

  def change do
    create table(:banes) do
      add :name, :string
      add :tags, {:array, :string}
      add :attack_attributes, {:array, :string}
      add :attack, {:array, :string}
      add :invocation_time, :string
      add :duration, :string
      add :description, :text
      add :effect, :text
      add :power, {:array, :integer}

      timestamps()
    end
  end
end
