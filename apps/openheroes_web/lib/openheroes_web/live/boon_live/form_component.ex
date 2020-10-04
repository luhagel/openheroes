defmodule OpenheroesWeb.BoonLive.FormComponent do
  use OpenheroesWeb, :live_component

  alias Openheroes.Boons

  @impl true
  def update(%{boon: boon} = assigns, socket) do
    changeset = Boons.change_boon(boon)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"boon" => boon_params}, socket) do
    changeset =
      socket.assigns.boon
      |> Boons.change_boon(boon_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"boon" => boon_params}, socket) do
    save_boon(socket, socket.assigns.action, boon_params)
  end

  defp save_boon(socket, :edit, boon_params) do
    case Boons.update_boon(socket.assigns.boon, boon_params) do
      {:ok, _boon} ->
        {:noreply,
         socket
         |> put_flash(:info, "Boon updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_boon(socket, :new, boon_params) do
    case Boons.create_boon(boon_params) do
      {:ok, _boon} ->
        {:noreply,
         socket
         |> put_flash(:info, "Boon created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
