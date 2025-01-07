defmodule AppWeb.TestHelpers do
  import Wallaby.Browser
  use Wallaby.DSL

  @secret_key_base "secret_key_base"

  def log_in(%{session: session} = _context) do

    # This is the profile data normally returned by ElixirAuthMicrosoft.get_user_profile(token.access_token)
    # Implemented in the MicrosoftAuthController
    profile = %{
      id: "123",
      mail: "John.Doe@example.com",
      userPrincipalName: "John.Doe@example.com",
      displayName: "John.Doe",
      "@odata.context": "https://graph.microsoft.com/v1.0/$metadata#users/$entity",
      businessPhones: ["+47 955 22 44"],
      givenName: "John",
      surname: "Doe",
      jobTitle: "Software Craftsman",
      officeLocation: "Oslo"
    }

    conn =
      %Plug.Conn{secret_key_base: @secret_key_base}
      |> Plug.Conn.put_resp_cookie(:profile, profile)

    session
    |> visit("/")
    |> set_cookie(:profile, conn.resp_cookies[:profile][:value])

    {:ok, %{session: session}}
  end
end
