defmodule Openheroes.Weapons.WeaponProperty do
  use Ecto.Schema
  import Ecto.Changeset

  schema "weapon_properties" do
    field :description, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(weapon_property, attrs) do
    weapon_property
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end
end
