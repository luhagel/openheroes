defmodule OpenheroesWeb.ModalComponent do
  use OpenheroesWeb, :live_component

  @impl true
  def render(assigns) do
    ~L"""
    <div id="<%= @id %>" uk-modal
      phx-capture-click="close"
      phx-window-keydown="close"
      phx-key="escape"
      phx-target="#<%= @id %>"
      phx-page-loading>

      <div class="uk-modal-dialog uk-modal-body">
        <%= live_patch "", to: @return_to, class: "uk-modal-close" %>
        <%= live_component @socket, @component, @opts %>
      </div>
    </div>
    """
  end

  @impl true
  def handle_event("close", _, socket) do
    {:noreply, push_patch(socket, to: socket.assigns.return_to)}
  end
end
