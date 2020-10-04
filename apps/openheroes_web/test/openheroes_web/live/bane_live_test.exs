defmodule OpenheroesWeb.BaneLiveTest do
  use OpenheroesWeb.ConnCase

  import Phoenix.LiveViewTest

  alias Openheroes.Banes

  @create_attrs %{attack: [], attack_attributes: [], description: "some description", duration: "some duration", effect: "some effect", invocation_time: "some invocation_time", name: "some name", power: [], tags: []}
  @update_attrs %{attack: [], attack_attributes: [], description: "some updated description", duration: "some updated duration", effect: "some updated effect", invocation_time: "some updated invocation_time", name: "some updated name", power: [], tags: []}
  @invalid_attrs %{attack: nil, attack_attributes: nil, description: nil, duration: nil, effect: nil, invocation_time: nil, name: nil, power: nil, tags: nil}

  defp fixture(:bane) do
    {:ok, bane} = Banes.create_bane(@create_attrs)
    bane
  end

  defp create_bane(_) do
    bane = fixture(:bane)
    %{bane: bane}
  end

  describe "Index" do
    setup [:create_bane]

    test "lists all banes", %{conn: conn, bane: bane} do
      {:ok, _index_live, html} = live(conn, Routes.bane_index_path(conn, :index))

      assert html =~ "Listing Banes"
      assert html =~ bane.attack
    end

    test "saves new bane", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.bane_index_path(conn, :index))

      assert index_live |> element("a", "New Bane") |> render_click() =~
               "New Bane"

      assert_patch(index_live, Routes.bane_index_path(conn, :new))

      assert index_live
             |> form("#bane-form", bane: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#bane-form", bane: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.bane_index_path(conn, :index))

      assert html =~ "Bane created successfully"
      assert html =~ "some attack"
    end

    test "updates bane in listing", %{conn: conn, bane: bane} do
      {:ok, index_live, _html} = live(conn, Routes.bane_index_path(conn, :index))

      assert index_live |> element("#bane-#{bane.id} a", "Edit") |> render_click() =~
               "Edit Bane"

      assert_patch(index_live, Routes.bane_index_path(conn, :edit, bane))

      assert index_live
             |> form("#bane-form", bane: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#bane-form", bane: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.bane_index_path(conn, :index))

      assert html =~ "Bane updated successfully"
      assert html =~ "some updated attack"
    end

    test "deletes bane in listing", %{conn: conn, bane: bane} do
      {:ok, index_live, _html} = live(conn, Routes.bane_index_path(conn, :index))

      assert index_live |> element("#bane-#{bane.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#bane-#{bane.id}")
    end
  end

  describe "Show" do
    setup [:create_bane]

    test "displays bane", %{conn: conn, bane: bane} do
      {:ok, _show_live, html} = live(conn, Routes.bane_show_path(conn, :show, bane))

      assert html =~ "Show Bane"
      assert html =~ bane.attack
    end

    test "updates bane within modal", %{conn: conn, bane: bane} do
      {:ok, show_live, _html} = live(conn, Routes.bane_show_path(conn, :show, bane))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Bane"

      assert_patch(show_live, Routes.bane_show_path(conn, :edit, bane))

      assert show_live
             |> form("#bane-form", bane: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#bane-form", bane: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.bane_show_path(conn, :show, bane))

      assert html =~ "Bane updated successfully"
      assert html =~ "some updated attack"
    end
  end
end
