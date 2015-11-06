defmodule Rtm do
  use Slack

  def init(initial_state, slack) do
    IO.puts "Connected as #{slack.me.name}"
    {:ok, initial_state}
  end

  def handle_message(message = %{type: "presence_change", presence: presence}, slack, state) do
    if message.user == System.get_env("SLACK_USER_ID") do
      send_message("Eric is #{presence}", System.get_env("SLACK_CHANNEL_ID"), slack)
    end
    {:ok, state}
  end

  def handle_message(message, _slack, state) do
    {:ok, state}
  end
end
