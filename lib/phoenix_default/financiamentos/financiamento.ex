defmodule PhoenixDefault.Financiamento do
  use Ecto.Schema

  schema "financiamentos" do
    field(:status, :string)
    field(:etapa, :string)
  end
end
