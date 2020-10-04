defmodule OpenheroesWeb.PageLiveTest do
  use OpenheroesWeb.ConnCase

  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/")
    assert disconnected_html =~ "Welcome to OpenHmix eroes!"
    assert render(page_live) =~ "Welcome to OpenHmix eroes!"
  end
end
