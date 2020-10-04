defmodule Openheroes.BoonsTest do
  use Openheroes.DataCase

  alias Openheroes.Boons

  describe "boons" do
    alias Openheroes.Boons.Boon

    @valid_attrs %{attribute: [], description: "some description", duration: "some duration", effect: "some effect", invocation_time: "some invocation_time", name: "some name", power: [], tags: []}
    @update_attrs %{attribute: [], description: "some updated description", duration: "some updated duration", effect: "some updated effect", invocation_time: "some updated invocation_time", name: "some updated name", power: [], tags: []}
    @invalid_attrs %{attribute: nil, description: nil, duration: nil, effect: nil, invocation_time: nil, name: nil, power: nil, tags: nil}

    def boon_fixture(attrs \\ %{}) do
      {:ok, boon} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Boons.create_boon()

      boon
    end

    test "list_boons/0 returns all boons" do
      boon = boon_fixture()
      assert Boons.list_boons() == [boon]
    end

    test "get_boon!/1 returns the boon with given id" do
      boon = boon_fixture()
      assert Boons.get_boon!(boon.id) == boon
    end

    test "create_boon/1 with valid data creates a boon" do
      assert {:ok, %Boon{} = boon} = Boons.create_boon(@valid_attrs)
      assert boon.attribute == []
      assert boon.description == "some description"
      assert boon.duration == "some duration"
      assert boon.effect == "some effect"
      assert boon.invocation_time == "some invocation_time"
      assert boon.name == "some name"
      assert boon.power == []
      assert boon.tags == []
    end

    test "create_boon/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Boons.create_boon(@invalid_attrs)
    end

    test "update_boon/2 with valid data updates the boon" do
      boon = boon_fixture()
      assert {:ok, %Boon{} = boon} = Boons.update_boon(boon, @update_attrs)
      assert boon.attribute == []
      assert boon.description == "some updated description"
      assert boon.duration == "some updated duration"
      assert boon.effect == "some updated effect"
      assert boon.invocation_time == "some updated invocation_time"
      assert boon.name == "some updated name"
      assert boon.power == []
      assert boon.tags == []
    end

    test "update_boon/2 with invalid data returns error changeset" do
      boon = boon_fixture()
      assert {:error, %Ecto.Changeset{}} = Boons.update_boon(boon, @invalid_attrs)
      assert boon == Boons.get_boon!(boon.id)
    end

    test "delete_boon/1 deletes the boon" do
      boon = boon_fixture()
      assert {:ok, %Boon{}} = Boons.delete_boon(boon)
      assert_raise Ecto.NoResultsError, fn -> Boons.get_boon!(boon.id) end
    end

    test "change_boon/1 returns a boon changeset" do
      boon = boon_fixture()
      assert %Ecto.Changeset{} = Boons.change_boon(boon)
    end
  end
end
