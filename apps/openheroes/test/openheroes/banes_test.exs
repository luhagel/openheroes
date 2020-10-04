defmodule Openheroes.BanesTest do
  use Openheroes.DataCase

  alias Openheroes.Banes

  describe "banes" do
    alias Openheroes.Banes.Bane

    @valid_attrs %{attack: [], attack_attributes: [], description: "some description", duration: "some duration", effect: "some effect", invocation_time: "some invocation_time", name: "some name", power: [], tags: []}
    @update_attrs %{attack: [], attack_attributes: [], description: "some updated description", duration: "some updated duration", effect: "some updated effect", invocation_time: "some updated invocation_time", name: "some updated name", power: [], tags: []}
    @invalid_attrs %{attack: nil, attack_attributes: nil, description: nil, duration: nil, effect: nil, invocation_time: nil, name: nil, power: nil, tags: nil}

    def bane_fixture(attrs \\ %{}) do
      {:ok, bane} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Banes.create_bane()

      bane
    end

    test "list_banes/0 returns all banes" do
      bane = bane_fixture()
      assert Banes.list_banes() == [bane]
    end

    test "get_bane!/1 returns the bane with given id" do
      bane = bane_fixture()
      assert Banes.get_bane!(bane.id) == bane
    end

    test "create_bane/1 with valid data creates a bane" do
      assert {:ok, %Bane{} = bane} = Banes.create_bane(@valid_attrs)
      assert bane.attack == []
      assert bane.attack_attributes == []
      assert bane.description == "some description"
      assert bane.duration == "some duration"
      assert bane.effect == "some effect"
      assert bane.invocation_time == "some invocation_time"
      assert bane.name == "some name"
      assert bane.power == []
      assert bane.tags == []
    end

    test "create_bane/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Banes.create_bane(@invalid_attrs)
    end

    test "update_bane/2 with valid data updates the bane" do
      bane = bane_fixture()
      assert {:ok, %Bane{} = bane} = Banes.update_bane(bane, @update_attrs)
      assert bane.attack == []
      assert bane.attack_attributes == []
      assert bane.description == "some updated description"
      assert bane.duration == "some updated duration"
      assert bane.effect == "some updated effect"
      assert bane.invocation_time == "some updated invocation_time"
      assert bane.name == "some updated name"
      assert bane.power == []
      assert bane.tags == []
    end

    test "update_bane/2 with invalid data returns error changeset" do
      bane = bane_fixture()
      assert {:error, %Ecto.Changeset{}} = Banes.update_bane(bane, @invalid_attrs)
      assert bane == Banes.get_bane!(bane.id)
    end

    test "delete_bane/1 deletes the bane" do
      bane = bane_fixture()
      assert {:ok, %Bane{}} = Banes.delete_bane(bane)
      assert_raise Ecto.NoResultsError, fn -> Banes.get_bane!(bane.id) end
    end

    test "change_bane/1 returns a bane changeset" do
      bane = bane_fixture()
      assert %Ecto.Changeset{} = Banes.change_bane(bane)
    end
  end
end
