defmodule Openheroes.Characters.Character do
  use Ecto.Schema
  import Ecto.Changeset

  schema "characters" do
    field :level, :integer
    field :name, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(character, attrs) do
    character
    |> cast(attrs, [:name, :level])
    |> validate_required([:name, :level])
  end
end
