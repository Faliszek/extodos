defmodule ExtodosWeb.HelloController do
  use ExtodosWeb, :controller

  def index(conn, _params) do
    render(conn, :index)
  end

  def show(conn, %{"messenger" => "weronika"} = payload) do
    json(conn, payload)
  end

  def show(conn, %{"messenger" => messenger}) do
    render(conn, :show, messenger: messenger)
  end
end
