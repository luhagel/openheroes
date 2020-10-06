defmodule Openheroes.Boons do
  @moduledoc """
  The Boons context.
  """

  import Ecto.Query, warn: false
  alias Openheroes.Repo

  alias Openheroes.Boons.Boon

  @doc """
  Returns the list of boons.

  ## Examples

      iex> list_boons()
      [%Boon{}, ...]

  """
  def list_boons do
    Repo.all(Boon)
  end

  @doc """
  Returns the list of boons.

  ## Examples

      iex> list_boons_by_name("test")
      [%Boon{}, ...]

  """
  def list_boons_by_name(name) do
    from(b in Boon, where: ilike(b.name, ^"%#{String.replace(name, "%", "\\%")}%"))
    |> Repo.all()
  end

  @doc """
  Gets a single boon.

  Raises `Ecto.NoResultsError` if the Boon does not exist.

  ## Examples

      iex> get_boon!(123)
      %Boon{}

      iex> get_boon!(456)
      ** (Ecto.NoResultsError)

  """
  def get_boon!(id), do: Repo.get!(Boon, id)

  @doc """
  Creates a boon.

  ## Examples

      iex> create_boon(%{field: value})
      {:ok, %Boon{}}

      iex> create_boon(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_boon(attrs \\ %{}) do
    %Boon{}
    |> Boon.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a boon.

  ## Examples

      iex> update_boon(boon, %{field: new_value})
      {:ok, %Boon{}}

      iex> update_boon(boon, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_boon(%Boon{} = boon, attrs) do
    boon
    |> Boon.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a boon.

  ## Examples

      iex> delete_boon(boon)
      {:ok, %Boon{}}

      iex> delete_boon(boon)
      {:error, %Ecto.Changeset{}}

  """
  def delete_boon(%Boon{} = boon) do
    Repo.delete(boon)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking boon changes.

  ## Examples

      iex> change_boon(boon)
      %Ecto.Changeset{data: %Boon{}}

  """
  def change_boon(%Boon{} = boon, attrs \\ %{}) do
    Boon.changeset(boon, attrs)
  end
end
