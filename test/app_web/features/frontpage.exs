defmodule AppWeb.FrontPageFeatureTest do
  use AppWeb.ConnCase
  use Wallaby.Feature
  import Wallaby.Query


  feature "Visit the frontpage as a visitor", %{session: session} do
    session
    |> visit("/")
    |> assert_has(css(".phx-hero", text: "To get started, login to your Microsoft Account"))
  end

  feature "Visit the frontpage as a logged in user", %{session: session} do
    session
    |> visit("/")
    |> assert_has(css(".phx-hero", text: "Welcome John Doe"))
  end
  
  defp visit_a_page_to_set_auth_cookie_for_wallaby(session, conn) do

    setup context do
      log_in(context)
    end

    session
    |> visit("/")
    |> set_cookie(
      @admin_cookie,
      conn.resp_cookies[@admin_cookie][:value]
    )
  end

end
