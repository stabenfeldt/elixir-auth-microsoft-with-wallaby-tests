defmodule AppWeb.FrontPageFeatureTest do
  use ExUnit.Case, async: true
  use Wallaby.Feature
  import Wallaby.Query


  feature "should render as expected", %{session: session} do
    session
    |> visit("/")
    |> assert_has(css(".phx-hero", text: "To get started, login to your Microsoft Account"))
  end
end
