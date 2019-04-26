defmodule Banamex.CallCenters do
  @moduledoc """
  The CallCenters context.
  """

  import Ecto.Query, warn: false
  alias Banamex.Repo

  alias Banamex.CallCenters.CallCenter

  @doc """
  Returns the list of callcenter.

  ## Examples

      iex> list_callcenter()
      [%CallCenter{}, ...]

  """
  def list_callcenter do
    Repo.all(CallCenter)
  end

  @doc """
  Gets a single call_center.

  Raises `Ecto.NoResultsError` if the Call center does not exist.

  ## Examples

      iex> get_call_center!(123)
      %CallCenter{}

      iex> get_call_center!(456)
      ** (Ecto.NoResultsError)

  """
  def get_call_center!(id), do: Repo.get!(CallCenter, id)

  @doc """
  Creates a call_center.

  ## Examples

      iex> create_call_center(%{field: value})
      {:ok, %CallCenter{}}

      iex> create_call_center(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_call_center(attrs \\ %{}) do
    %CallCenter{}
    |> CallCenter.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a call_center.

  ## Examples

      iex> update_call_center(call_center, %{field: new_value})
      {:ok, %CallCenter{}}

      iex> update_call_center(call_center, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_call_center(%CallCenter{} = call_center, attrs) do
    call_center
    |> CallCenter.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a CallCenter.

  ## Examples

      iex> delete_call_center(call_center)
      {:ok, %CallCenter{}}

      iex> delete_call_center(call_center)
      {:error, %Ecto.Changeset{}}

  """
  def delete_call_center(%CallCenter{} = call_center) do
    Repo.delete(call_center)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking call_center changes.

  ## Examples

      iex> change_call_center(call_center)
      %Ecto.Changeset{source: %CallCenter{}}

  """
  def change_call_center(%CallCenter{} = call_center) do
    CallCenter.changeset(call_center, %{})
  end
end
