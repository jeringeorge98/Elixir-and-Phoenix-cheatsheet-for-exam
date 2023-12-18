defmodule Needforvelocity.Repo do
  use Ecto.Repo,
    otp_app: :needforvelocity,
    adapter: Ecto.Adapters.Postgres
end
