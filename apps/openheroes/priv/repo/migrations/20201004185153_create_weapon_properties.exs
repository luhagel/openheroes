defmodule Openheroes.Repo.Migrations.CreateWeaponProperties do
  use Ecto.Migration

  def change do
    create table(:weapon_properties) do
      add :name, :string
      add :description, :text

      timestamps()
    end

  end
end
