
defmodule PhoenixDefaultWeb.Listener do
  use GenServer
  require Logger

  def child_spec(opts) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, [opts]}
    }
  end

  def start_link(opts \\ []),
    do: GenServer.start_link(__MODULE__, opts)

  @impl true
  def init(opts) do
    with {:ok, _pid, _ref} <- PhoenixDefault.Repo.listen("financing_changed") do
      {:ok, opts}
    else
      error -> {:stop, error}
    end
  end


  @impl true
  def handle_info({:notification, _pid, _ref, "financing_changed", payload}, _state) do
    with {:ok, data} <- Jason.decode(payload, keys: :atoms) do
      data
      |> inspect()
      |> Logger.info()

      {:noreply, :event_handled}
    else
      error -> {:stop, error, []}
    end
  end
end
