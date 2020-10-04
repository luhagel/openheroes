defmodule OpenheroesWeb.BoonLive.Index do
  use OpenheroesWeb, :live_view

  alias Openheroes.Boons
  alias Openheroes.Boons.Boon

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :boons, list_boons())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Boon")
    |> assign(:boon, Boons.get_boon!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Boon")
    |> assign(:boon, %Boon{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Boons")
    |> assign(:boon, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    boon = Boons.get_boon!(id)
    {:ok, _} = Boons.delete_boon(boon)

    {:noreply, assign(socket, :boons, list_boons())}
  end

  defp list_boons do
    Boons.list_boons()
  end
end
