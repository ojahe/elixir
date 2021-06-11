defmodule HelloWeb.ModalComponent do
  use HelloWeb, :live_component

  def render(assigns) do
    ~L"""
    <div class="phx-modal"
         phx-window-keydown="close"
         phx-key="escape"
         phx-capture-click="close"
         phx-target="<%= @myself %>">
      <div class="phx-modal-content">
        <%= live_patch raw("&times;"),
              to: @return_to,
              class: "phx-modal-close" %>
        <%= live_component @socket, @component, @opts %>
      </div>
    </div>
    """
  end

  def handle_event("close", _, socket) do
    {:noreply, push_patch(socket, to: socket.assigns.return_to)}
  end
end
