defmodule HelloWeb.VolunteerComponent do
  use HelloWeb, :live_component

  alias Hello.Volunteers

  def render(assigns) do
    ~L"""
    <div class="volunteer <%= if @volunteer.checked_out, do: "out" %>"
          id="volunteer-<%= @volunteer.id %>">
      <div class="name">
        <%= @volunteer.name %>
      </div>
      <div class="phone">
        <img src="images/phone.svg">
        <%= @volunteer.phone %>
      </div>
      <div class="status">
        <button phx-click="toggle-status"
                phx-value-id="<%= @volunteer.id %>"
                phx-disable-with="Saving..."
                phx-target="<%= @myself %>">
          <%= if @volunteer.checked_out, do: "Check In", else: "Check Out" %>
        </button>
      </div>
    </div>
    """
  end

  def handle_event("toggle-status", %{"id" => id}, socket) do
    volunteer = Volunteers.get_volunteer!(id)

    {:ok, _volunteer} =
      Volunteers.update_volunteer(
        volunteer,
        %{checked_out: !volunteer.checked_out}
      )

    {:noreply, socket}
  end
end
