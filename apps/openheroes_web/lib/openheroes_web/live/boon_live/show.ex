defmodule OpenheroesWeb.BoonLive.Show do
  use OpenheroesWeb, :live_view

  alias Openheroes.Boons

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:boon, Boons.get_boon!(id))}
  end

  defp page_title(:show), do: "Show Boon"
  defp page_title(:edit), do: "Edit Boon"
end
