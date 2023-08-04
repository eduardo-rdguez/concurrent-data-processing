defmodule Sender do
  @moduledoc """
  Documentation for `Sender`.
  """

  @async_options [
    max_concurrency: 2,
    ordered: false,
    on_timeout: :kill_task
  ]

  def send_email(email) do
    Process.sleep(3_000)
    IO.puts("Email to #{email} sent")
    {:ok, "email_sent"}
  end

  def notify_all(emails) do
    emails
    |> Task.async_stream(&send_email/1, @async_options)
    |> Enum.to_list()
  end
end
