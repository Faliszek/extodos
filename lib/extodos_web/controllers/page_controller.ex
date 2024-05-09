defmodule ExtodosWeb.PageController do
  use ExtodosWeb, :controller

  def index(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    conn
    |> put_flash(:error, "Let's pretend we have an error.")
    |> render(:index, layout: false)
  end
end
