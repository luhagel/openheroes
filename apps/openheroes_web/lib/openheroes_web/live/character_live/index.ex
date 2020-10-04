defmodule OpenheroesWeb.CharacterLive.Index do
  use OpenheroesWeb, :live_view

  alias Openheroes.Characters
  alias Openheroes.Characters.Character

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :characters, list_characters())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Character")
    |> assign(:character, Characters.get_character!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Character")
    |> assign(:character, %Character{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Characters")
    |> assign(:character, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    character = Characters.get_character!(id)
    {:ok, _} = Characters.delete_character(character)

    {:noreply, assign(socket, :characters, list_characters())}
  end

  defp list_characters do
    Characters.list_characters()
  end
end
