defmodule HelloWeb.HeaderComponent do
  use HelloWeb, :live_component

  def render(assigns) do
    ~L"""
    <h1 class="mb-2">
      <%= @title %>
    </h1>
    <h2 class="text-center text-2xl text-gray-500 mb-8">
      <%= @subtitle %>
    </h2>
    """
  end
end
