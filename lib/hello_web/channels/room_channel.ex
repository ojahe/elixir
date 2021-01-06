defmodule HelloWeb.RoomChannel do
  use HelloWeb, :channel
  alias Hello.Repo
  alias Hello.Chat.Message
  @impl true
  def join("room:lobby", payload, socket) do
    if authorized?(payload) do
      #send(self(), :after_join)
      {:ok, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  def handle_in("ping", payload, socket) do
    {:reply, {:ok, payload}, socket}
  end

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  @impl true
  def handle_in("device_control", payload, socket) do
    #IO.puts(payload);
    %Message{}
    |>Message.changeset( payload)
    |> Repo.insert()
    broadcast(socket, "device_control", payload)
    {:reply, :ok, socket}
  end

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  @impl true
  def handle_in("device_status", payload, socket) do
    #IO.puts(payload);
    broadcast(socket, "device_status", payload)
    {:reply, :ok,socket}
  end
  @impl true
  def handle_in(_, payload, socket) do
    IO.puts(payload);
   end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end

  @impl true
  def handle_info(:after_join, socket) do
#    Hello.Chat.Message.get_messages()
#    |> Enum.each(fn msg ->
#      push(socket, "device_control", %{
#        device_id: msg.device_id,
#        todo: msg.todo,
#        result: msg.result
#      })
#    end)

    # :noreply
    {:noreply, socket}
  end

end
