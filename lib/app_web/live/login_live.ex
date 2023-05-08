defmodule AppWeb.LoginLive do
  use AppWeb, :live_view

  def mount(_params, _session, socket) do
    socket = assign(socket, name: "Anna")
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <h1>Hello <%= @name %></h1>
    """
  end
end
