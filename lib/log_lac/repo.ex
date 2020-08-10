defmodule LogLac.Repo do
  use Ecto.Repo,
    otp_app: :log_lac,
    adapter: Ecto.Adapters.Postgres
end
