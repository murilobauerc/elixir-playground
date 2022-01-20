import Config

config :friends, Friends.Repo,
  database: "friends_repo",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"

config :friends, ecto_repos: [Friends.Repo]
# This will allow our application to run ecto mix commands from the commandline.
