defmodule AppWeb.UserLoginLive do
  use AppWeb, :live_view

  def render(assigns) do
    ~H"""
    <div class="mx-auto max-w-sm font-jost">
      <.header class=" flex justify-center">
        <img src="/images/notebettrlogo.svg" />
      </.header>
      <div class="flex flex-col items-center justify-center bg-white shadow-lg rounded-md pb-6">
        <.simple_form for={@form} id="login_form" action={~p"/users/log_in"} phx-update="ignore">
          <p class="text-2xl text-center">Welcome back!</p>
          <.input field={@form[:email]} type="email" label="Email" required />
          <.input field={@form[:password]} type="password" label="Password" required />

          <:actions>
            <.input field={@form[:remember_me]} type="checkbox" label="Keep me logged in" />
            <.link href={~p"/users/reset_password"} class="text-sm font-semibold">
              Forgot your password?
            </.link>
          </:actions>
          <:actions>
            <.button
              phx-disable-with="Signing in..."
              class="mx-auto w-32 bg-pink text-white py-2 px-10"
            >
              Let's go!
            </.button>
          </:actions>
        </.simple_form>
      </div>
      <div class="mt-4 text-center">
        Don't have an account yet?
        <.link navigate={~p"/users/register"} class="font-semibold text-blue hover:underline">
          Get started here.
        </.link>
      </div>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    email = live_flash(socket.assigns.flash, :email)
    form = to_form(%{"email" => email}, as: "user")
    {:ok, assign(socket, form: form), temporary_assigns: [form: form]}
  end
end
