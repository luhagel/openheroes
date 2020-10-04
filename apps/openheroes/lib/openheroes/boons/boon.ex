defmodule Openheroes.Boons.Boon do
  use Ecto.Schema
  import Ecto.Changeset

  schema "boons" do
    field :attribute, {:array, :string}
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
  def changeset(boon, attrs) do
    boon
    |> cast(attrs, [:name, :tags, :attribute, :invocation_time, :duration, :description, :effect, :power])
    |> validate_required([:name, :tags, :attribute, :invocation_time, :duration, :description, :effect, :power])
  end
end
