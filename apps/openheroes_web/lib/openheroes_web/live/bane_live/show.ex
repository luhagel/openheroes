defmodule OpenheroesWeb.BaneLive.Show do
  use OpenheroesWeb, :live_view

  alias Openheroes.Banes

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:bane, Banes.get_bane!(id))}
  end

  defp page_title(:show), do: "Show Bane"
  defp page_title(:edit), do: "Edit Bane"
end
