defmodule AppWeb.MicrosoftAuthController do
  use AppWeb, :controller

  @doc """
  `index/2` handles the callback from Google Auth API redirect.
  """
  def index(conn, %{"code" => code, "state" => state}) do

    # Perform state change here (to prevent CSRF)
    if state !== "random_state_uid" do
      # error handling
    end

    {:ok, token} = ElixirAuthMicrosoft.get_token(code, conn)
    {:ok, profile} = ElixirAuthMicrosoft.get_user_profile(token.access_token)

    conn
    |> put_view(AppWeb.PageHTML)
    |> render(:welcome, profile: profile)
  end
end
