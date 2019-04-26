defmodule Banamex.Cajeros do
  @moduledoc """
  The Cajeros context.
  """

  import Ecto.Query, warn: false
  alias Banamex.Repo

  alias Banamex.Cajeros.Cajero

  @doc """
  Returns the list of cajeros.

  ## Examples

      iex> list_cajeros()
      [%Cajero{}, ...]

  """
  def list_cajeros do
    Repo.all(Cajero)
  end

  @doc """
  Gets a single cajero.

  Raises `Ecto.NoResultsError` if the Cajero does not exist.

  ## Examples

      iex> get_cajero!(123)
      %Cajero{}

      iex> get_cajero!(456)
      ** (Ecto.NoResultsError)

  """
  def get_cajero!(id), do: Repo.get!(Cajero, id)

  @doc """
  Creates a cajero.

  ## Examples

      iex> create_cajero(%{field: value})
      {:ok, %Cajero{}}

      iex> create_cajero(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_cajero(attrs \\ %{}) do
    %Cajero{}
    |> Cajero.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a cajero.

  ## Examples

      iex> update_cajero(cajero, %{field: new_value})
      {:ok, %Cajero{}}

      iex> update_cajero(cajero, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_cajero(%Cajero{} = cajero, attrs) do
    cajero
    |> Cajero.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Cajero.

  ## Examples

      iex> delete_cajero(cajero)
      {:ok, %Cajero{}}

      iex> delete_cajero(cajero)
      {:error, %Ecto.Changeset{}}

  """
  def delete_cajero(%Cajero{} = cajero) do
    Repo.delete(cajero)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking cajero changes.

  ## Examples

      iex> change_cajero(cajero)
      %Ecto.Changeset{source: %Cajero{}}

  """
  def change_cajero(%Cajero{} = cajero) do
    Cajero.changeset(cajero, %{})
  end
end
