defmodule ExampleProject.Repo do
  use Ecto.Repo,
    otp_app: :example_project,
    adapter: Ecto.Adapters.Postgres
end
