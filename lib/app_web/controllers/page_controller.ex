defmodule AppWeb.PageController do
  use AppWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end

  def index(conn, _params) do
    state = "random_state_uid"

    oauth_microsoft_url = ElixirAuthMicrosoft.generate_oauth_url_authorize(conn, state)
    render(conn, :index, oauth_microsoft_url: oauth_microsoft_url)
  end
end
