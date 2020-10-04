defmodule OpenheroesWeb.BaneLive.FormComponent do
  use OpenheroesWeb, :live_component

  alias Openheroes.Banes

  @impl true
  def update(%{bane: bane} = assigns, socket) do
    changeset = Banes.change_bane(bane)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"bane" => bane_params}, socket) do
    changeset =
      socket.assigns.bane
      |> Banes.change_bane(bane_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"bane" => bane_params}, socket) do
    save_bane(socket, socket.assigns.action, bane_params)
  end

  defp save_bane(socket, :edit, bane_params) do
    case Banes.update_bane(socket.assigns.bane, bane_params) do
      {:ok, _bane} ->
        {:noreply,
         socket
         |> put_flash(:info, "Bane updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_bane(socket, :new, bane_params) do
    case Banes.create_bane(bane_params) do
      {:ok, _bane} ->
        {:noreply,
         socket
         |> put_flash(:info, "Bane created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
