defmodule HttpoisonPact do
  @moduledoc """
  A simple HTTPoison / Hackney implementation of the HTTPact.Client behaviour.
  """
  @behaviour HTTPact.Client

  @doc """
  Executes an HTTPact.Request with HTTPoison and converts the HTTPoison.Response into an HTTPact.Response
  """
  def execute(%HTTPact.Request{
    method: method,
    path: path,
    body: body,
    headers: headers,
  }) do
    with {:ok, _} <- HTTPoison.start() do
      case method do
        :get    ->
          HTTPoison.get(path, body, headers)
        :post   ->
          HTTPoison.post(path, body, headers)
        :put    ->
          HTTPoison.put(path, body, headers)
        :patch  ->
          HTTPoison.patch(path, body, headers)
        :delete ->
          HTTPoison.delete(path, body, headers)
        :option ->
          HTTPoison.options(path, body, headers)
        :head   ->
          HTTPoison.head(path, body, headers)
      end
      |> convert_response()
    end
  end

  defp convert_response({:ok, %HTTPoison.Response{
    body: body, status_code: status, headers: headers,
  }}) do
    {:ok, %HTTPact.Response{
      body: body, status: status, headers: headers,
    }}
  end
  defp convert_response({:error, error}), do: {:error, error}
end
