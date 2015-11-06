defmodule SlackPresence do
  use Application
  def start(_type, _args) do
    import Supervisor.Spec, warn: false
    IO.puts(System.get_env("SLACK_TOKEN"))
    children = [
      worker(Rtm, [System.get_env("SLACK_TOKEN"), []])
    ]
    IO.inspect children
    opts = [strategy: :one_for_one, name: SlackPresence.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
