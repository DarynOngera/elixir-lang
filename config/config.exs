import Config

config :crud_app, Crud.Repo,
  database: "crud_repo",
  username: "ongera",
  password: "Winger2004!",
  hostname: "localhost"

config :crud_app, ecto_repos: [Crud.Repo]
