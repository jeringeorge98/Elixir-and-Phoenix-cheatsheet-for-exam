defmodule Needforvelocity.AccountsTest do
  use Needforvelocity.DataCase

  alias Needforvelocity.Accounts

  describe "racer" do
    alias Needforvelocity.Accounts.Racer

    import Needforvelocity.AccountsFixtures

    @invalid_attrs %{speed: nil, racer_id: nil, boost: nil, risk: nil, points: nil}

    test "list_racer/0 returns all racer" do
      racer = racer_fixture()
      assert Accounts.list_racer() == [racer]
    end

    test "get_racer!/1 returns the racer with given id" do
      racer = racer_fixture()
      assert Accounts.get_racer!(racer.id) == racer
    end

    test "create_racer/1 with valid data creates a racer" do
      valid_attrs = %{speed: 42, racer_id: "some racer_id", boost: 42, risk: 120.5, points: 42}

      assert {:ok, %Racer{} = racer} = Accounts.create_racer(valid_attrs)
      assert racer.speed == 42
      assert racer.racer_id == "some racer_id"
      assert racer.boost == 42
      assert racer.risk == 120.5
      assert racer.points == 42
    end

    test "create_racer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_racer(@invalid_attrs)
    end

    test "update_racer/2 with valid data updates the racer" do
      racer = racer_fixture()
      update_attrs = %{speed: 43, racer_id: "some updated racer_id", boost: 43, risk: 456.7, points: 43}

      assert {:ok, %Racer{} = racer} = Accounts.update_racer(racer, update_attrs)
      assert racer.speed == 43
      assert racer.racer_id == "some updated racer_id"
      assert racer.boost == 43
      assert racer.risk == 456.7
      assert racer.points == 43
    end

    test "update_racer/2 with invalid data returns error changeset" do
      racer = racer_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_racer(racer, @invalid_attrs)
      assert racer == Accounts.get_racer!(racer.id)
    end

    test "delete_racer/1 deletes the racer" do
      racer = racer_fixture()
      assert {:ok, %Racer{}} = Accounts.delete_racer(racer)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_racer!(racer.id) end
    end

    test "change_racer/1 returns a racer changeset" do
      racer = racer_fixture()
      assert %Ecto.Changeset{} = Accounts.change_racer(racer)
    end
  end
end
