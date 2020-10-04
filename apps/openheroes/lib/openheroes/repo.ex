defmodule Openheroes.Repo do
  use Ecto.Repo,
    otp_app: :openheroes,
    adapter: Ecto.Adapters.Postgres
end
