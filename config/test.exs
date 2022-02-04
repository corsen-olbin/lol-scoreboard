import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :lol_scoreboard, LolScoreboardWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "Qu2HhrW8eIV0LGyVEVesmNdFzNxjuqEQh2nUOoyGvNmw9nlt/GpxU8lHEZcopQ5Y",
  server: false

# In test we don't send emails.
config :lol_scoreboard, LolScoreboard.Mailer,
  adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
