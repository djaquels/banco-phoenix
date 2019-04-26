defmodule Banamex.Cuentas do
  @moduledoc """
  The Cuentas context.
  """

  import Ecto.Query, warn: false
  alias Banamex.Repo

  alias Banamex.Cuentas.Cuenta

  @doc """
  Returns the list of cuentas.

  ## Examples

      iex> list_cuentas()
      [%Cuenta{}, ...]

  """
  def list_cuentas do
    Repo.all(Cuenta)
  end

  @doc """
  Gets a single cuenta.

  Raises `Ecto.NoResultsError` if the Cuenta does not exist.

  ## Examples

      iex> get_cuenta!(123)
      %Cuenta{}

      iex> get_cuenta!(456)
      ** (Ecto.NoResultsError)

  """
  def get_cuenta!(id), do: Repo.get!(Cuenta, id)

  @doc """
  Creates a cuenta.

  ## Examples

      iex> create_cuenta(%{field: value})
      {:ok, %Cuenta{}}

      iex> create_cuenta(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_cuenta(attrs \\ %{}) do
    %Cuenta{}
    |> Cuenta.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a cuenta.

  ## Examples

      iex> update_cuenta(cuenta, %{field: new_value})
      {:ok, %Cuenta{}}

      iex> update_cuenta(cuenta, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_cuenta(%Cuenta{} = cuenta, attrs) do
    cuenta
    |> Cuenta.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Cuenta.

  ## Examples

      iex> delete_cuenta(cuenta)
      {:ok, %Cuenta{}}

      iex> delete_cuenta(cuenta)
      {:error, %Ecto.Changeset{}}

  """
  def delete_cuenta(%Cuenta{} = cuenta) do
    Repo.delete(cuenta)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking cuenta changes.

  ## Examples

      iex> change_cuenta(cuenta)
      %Ecto.Changeset{source: %Cuenta{}}

  """
  def change_cuenta(%Cuenta{} = cuenta) do
    Cuenta.changeset(cuenta, %{})
  end
end
