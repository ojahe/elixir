defmodule HelloWeb.CreaturesComponent do
  use HelloWeb, :live_component

  def render(assigns) do
    ~L"""
    <div>
      <h2><%= @title %></h2>
      <div class="creatures">
        🐙 🐳 🦑 🐡 🐚 🐋 🐟 🦈 🐠 🦀 🐬
      </div>
      <%= live_patch "I'm outta air!",
            to: @return_to, class: "button" %>
    </div>
    """
  end
end
