defmodule OpenheroesWeb.BoonLiveTest do
  use OpenheroesWeb.ConnCase

  import Phoenix.LiveViewTest

  alias Openheroes.Boons

  @create_attrs %{attribute: [], description: "some description", duration: "some duration", effect: "some effect", invocation_time: "some invocation_time", name: "some name", power: [], tags: []}
  @update_attrs %{attribute: [], description: "some updated description", duration: "some updated duration", effect: "some updated effect", invocation_time: "some updated invocation_time", name: "some updated name", power: [], tags: []}
  @invalid_attrs %{attribute: nil, description: nil, duration: nil, effect: nil, invocation_time: nil, name: nil, power: nil, tags: nil}

  defp fixture(:boon) do
    {:ok, boon} = Boons.create_boon(@create_attrs)
    boon
  end

  defp create_boon(_) do
    boon = fixture(:boon)
    %{boon: boon}
  end

  describe "Index" do
    setup [:create_boon]

    test "lists all boons", %{conn: conn, boon: boon} do
      {:ok, _index_live, html} = live(conn, Routes.boon_index_path(conn, :index))

      assert html =~ "Listing Boons"
      assert html =~ boon.attribute
    end

    test "saves new boon", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.boon_index_path(conn, :index))

      assert index_live |> element("a", "New Boon") |> render_click() =~
               "New Boon"

      assert_patch(index_live, Routes.boon_index_path(conn, :new))

      assert index_live
             |> form("#boon-form", boon: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#boon-form", boon: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.boon_index_path(conn, :index))

      assert html =~ "Boon created successfully"
      assert html =~ "some attribute"
    end

    test "updates boon in listing", %{conn: conn, boon: boon} do
      {:ok, index_live, _html} = live(conn, Routes.boon_index_path(conn, :index))

      assert index_live |> element("#boon-#{boon.id} a", "Edit") |> render_click() =~
               "Edit Boon"

      assert_patch(index_live, Routes.boon_index_path(conn, :edit, boon))

      assert index_live
             |> form("#boon-form", boon: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#boon-form", boon: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.boon_index_path(conn, :index))

      assert html =~ "Boon updated successfully"
      assert html =~ "some updated attribute"
    end

    test "deletes boon in listing", %{conn: conn, boon: boon} do
      {:ok, index_live, _html} = live(conn, Routes.boon_index_path(conn, :index))

      assert index_live |> element("#boon-#{boon.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#boon-#{boon.id}")
    end
  end

  describe "Show" do
    setup [:create_boon]

    test "displays boon", %{conn: conn, boon: boon} do
      {:ok, _show_live, html} = live(conn, Routes.boon_show_path(conn, :show, boon))

      assert html =~ "Show Boon"
      assert html =~ boon.attribute
    end

    test "updates boon within modal", %{conn: conn, boon: boon} do
      {:ok, show_live, _html} = live(conn, Routes.boon_show_path(conn, :show, boon))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Boon"

      assert_patch(show_live, Routes.boon_show_path(conn, :edit, boon))

      assert show_live
             |> form("#boon-form", boon: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#boon-form", boon: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.boon_show_path(conn, :show, boon))

      assert html =~ "Boon updated successfully"
      assert html =~ "some updated attribute"
    end
  end
end
