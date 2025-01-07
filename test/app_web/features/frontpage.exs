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
  
end
