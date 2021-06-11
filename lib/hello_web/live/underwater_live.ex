defmodule HelloWeb.Live.UnderwaterLive do
  use HelloWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def handle_params(params, _url, socket) do
    {:noreply, socket}
  end

  def render(assigns) do
    ~L"""
    <h1>Earth Is Super Watery</h1>
    <div id="underwater">
      <%= live_patch "🤿 Look Underwater 👀",
            to: Routes.underwater_path(@socket, :show_modal),
            class: "button" %>

      <%= if @live_action == :show_modal do %>
        <%= live_modal @socket,
              HelloWeb.CreaturesComponent,
              return_to: Routes.live_path(@socket, __MODULE__),
              title: "Sea Creatures" %>
      <% end %>
    </div>
    """
  end
end
