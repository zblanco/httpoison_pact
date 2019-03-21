defmodule HttpoisonPactTest do
  use ExUnit.Case
  doctest HttpoisonPact

  test "can make a simple request against google.com" do
    request = %HTTPact.Request{
      method: :get,
      headers: [{"Content-Type", "text/html; charset=utf-8"}],
      path: "https://www.google.com",
      http_client: HttpoisonPact,
    }

    {:ok, response} = HTTPact.execute(request)

    assert response.status == 200
    assert response.body != nil
  end
end
