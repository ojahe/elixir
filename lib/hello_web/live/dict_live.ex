defmodule HelloWeb.Live.DictLive do
  use HelloWeb, :live_view

  alias Hello.Sys.Dictdata

  def mount(_params, _session, socket) do
    {:ok, socket, temporary_assigns: [donations: []]}
  end

  def handle_params(params, _url, socket) do
    pageNum = String.to_integer(params["pageNum"] || "1")
    pageSize = String.to_integer(params["pageSize"] || "10")
    orderByColumn = (params["orderByColumn"] || "id") |> String.to_atom()
    isAsc = (params["isAsc"] || "asc") |> String.to_atom()

    paginate_options = %{pageNum: pageNum, pageSize: pageSize}
    sort_options = %{orderByColumn: orderByColumn, isAsc: isAsc}
    donations = Hello.Sys.list_dictdatas(params)

    socket =
      assign(socket,
        options: Map.merge(paginate_options, sort_options),
        donations: donations
      )

    {:noreply, socket}
  end

  def handle_event("select-per-page", %{"pageSize" => pageSize}, socket) do
    pageSize = String.to_integer(pageSize)

    socket =
      push_patch(socket,
        to:
          Routes.live_path(
            socket,
            __MODULE__,
            pageNum: socket.assigns.options.pageNum,
            pageSize: pageSize,
            orderByColumn: socket.assigns.options.orderByColumn,
            isAsc: socket.assigns.options.isAsc
          )
      )

    {:noreply, socket}
  end

#  defp expires_class(donation) do
#    if Donations.almost_expired?(donation), do: "eat-now", else: "fresh"
#  end

  defp pagination_link(socket, text, pageNum, options, class) do
    live_patch(text,
      to:
        Routes.live_path(
          socket,
          __MODULE__,
          pageNum: pageNum,
          pageSize: options.pageSize,
          orderByColumn: options.orderByColumn,
          isAsc: options.isAsc
        ),
      class: class
    )
  end

  defp sort_link(socket, text, orderByColumn, options) do
    text =
      if orderByColumn == options.orderByColumn do
        text <> emoji(options.isAsc)
      else
        text
      end

    live_patch(text,
      to:
        Routes.live_path(
          socket,
          __MODULE__,
          orderByColumn: orderByColumn,
          isAsc: toggle_isAsc(options.isAsc),
          pageNum: options.pageNum,
          pageSize: options.pageSize
        )
    )
  end

  defp toggle_isAsc(:asc), do: :desc
  defp toggle_isAsc(:desc), do: :asc

  defp emoji(:asc), do: "👇"
  defp emoji(:desc), do: "👆"
end
