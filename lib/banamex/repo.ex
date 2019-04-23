defmodule Banamex.Repo do
  use Ecto.Repo,
    otp_app: :banamex,
    adapter: Ecto.Adapters.Postgres
end
