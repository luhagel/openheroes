defmodule Openheroes.Banes.Bane do
  use Ecto.Schema
  import Ecto.Changeset

  schema "banes" do
    field :attack, {:array, :string}
    field :attack_attributes, {:array, :string}
    field :description, :string
    field :duration, :string
    field :effect, :string
    field :invocation_time, :string
    field :name, :string
    field :power, {:array, :integer}
    field :tags, {:array, :string}

    timestamps()
  end

  @doc false
  def changeset(bane, attrs) do
    bane
    |> cast(attrs, [:name, :tags, :attack_attributes, :attack, :invocation_time, :duration, :description, :effect, :power])
    |> validate_required([:name, :tags, :attack_attributes, :attack, :invocation_time, :duration, :description, :effect, :power])
  end
end
