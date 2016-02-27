ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Junkiex.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Junkiex.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Junkiex.Repo)

