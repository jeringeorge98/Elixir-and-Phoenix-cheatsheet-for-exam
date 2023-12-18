defmodule Needforvelocity.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Needforvelocity.Accounts` context.
  """

  @doc """
  Generate a racer.
  """
  def racer_fixture(attrs \\ %{}) do
    {:ok, racer} =
      attrs
      |> Enum.into(%{
        boost: 42,
        points: 42,
        racer_id: "some racer_id",
        risk: 120.5,
        speed: 42
      })
      |> Needforvelocity.Accounts.create_racer()

    racer
  end
end
