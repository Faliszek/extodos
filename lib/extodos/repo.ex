defmodule Extodos.Repo do
  use Ecto.Repo,
    otp_app: :extodos,
    adapter: Ecto.Adapters.Postgres
end
