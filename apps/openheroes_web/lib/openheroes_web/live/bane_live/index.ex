defmodule OpenheroesWeb.BaneLive.Index do
  use OpenheroesWeb, :live_view

  alias Openheroes.Banes
  alias Openheroes.Banes.Bane

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :banes, list_banes())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Bane")
    |> assign(:bane, Banes.get_bane!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Bane")
    |> assign(:bane, %Bane{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Banes")
    |> assign(:bane, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    bane = Banes.get_bane!(id)
    {:ok, _} = Banes.delete_bane(bane)

    {:noreply, assign(socket, :banes, list_banes())}
  end

  def handle_event("search", %{"search_field" => %{"query" => query}}, socket) do
    filtered_banes = Banes.list_banes_by_name(query)

    {:noreply, assign(socket, :banes, filtered_banes)}
  end

  defp list_banes do
    Banes.list_banes()
  end
end
