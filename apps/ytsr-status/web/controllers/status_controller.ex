defmodule YtsrStatus.Web.StatusController do  
  use YtsrStatus.Web, :controller

  def index(conn, %{"isrcs" => isrcs}) do
    response = String.split(isrcs, ",")
    |> Deliveries.YouTube.Status.status_for
    case response do
      {:ok, %{"items" => items}} ->
        render(conn, "index.json", distributions:  items)

      {:ok, body} ->
        render(conn, "index.json", distributions: [])
      
      {:error, body} ->
        conn
        |> render("400.json", errors: body["error"])
    end
  end
end  