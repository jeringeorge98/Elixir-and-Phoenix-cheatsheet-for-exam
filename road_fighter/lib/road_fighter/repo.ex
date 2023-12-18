defmodule RoadFighter.Repo do
  use Ecto.Repo,
    otp_app: :road_fighter,
    adapter: Ecto.Adapters.Postgres
end
