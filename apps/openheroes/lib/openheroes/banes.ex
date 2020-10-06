defmodule Openheroes.Banes do
  @moduledoc """
  The Banes context.
  """

  import Ecto.Query, warn: false
  alias Openheroes.Repo

  alias Openheroes.Banes.Bane

  @doc """
  Returns the list of banes.

  ## Examples

      iex> list_banes()
      [%Bane{}, ...]

  """
  def list_banes do
    Repo.all(Bane)
  end

  @doc """
  Returns the list of banes.

  ## Examples

      iex> list_banes_by_name("test")
      [%Bane{}, ...]

  """
  def list_banes_by_name(name) do
    from(b in Bane, where: ilike(b.name, ^"%#{String.replace(name, "%", "\\%")}%"))
    |> Repo.all()
  end

  @doc """
  Gets a single bane.

  Raises `Ecto.NoResultsError` if the Bane does not exist.

  ## Examples

      iex> get_bane!(123)
      %Bane{}

      iex> get_bane!(456)
      ** (Ecto.NoResultsError)

  """
  def get_bane!(id), do: Repo.get!(Bane, id)

  @doc """
  Creates a bane.

  ## Examples

      iex> create_bane(%{field: value})
      {:ok, %Bane{}}

      iex> create_bane(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_bane(attrs \\ %{}) do
    %Bane{}
    |> Bane.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a bane.

  ## Examples

      iex> update_bane(bane, %{field: new_value})
      {:ok, %Bane{}}

      iex> update_bane(bane, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_bane(%Bane{} = bane, attrs) do
    bane
    |> Bane.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a bane.

  ## Examples

      iex> delete_bane(bane)
      {:ok, %Bane{}}

      iex> delete_bane(bane)
      {:error, %Ecto.Changeset{}}

  """
  def delete_bane(%Bane{} = bane) do
    Repo.delete(bane)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking bane changes.

  ## Examples

      iex> change_bane(bane)
      %Ecto.Changeset{data: %Bane{}}

  """
  def change_bane(%Bane{} = bane, attrs \\ %{}) do
    Bane.changeset(bane, attrs)
  end
end
