# Observações

- Utilizei o banco postgres no projeto
- Criei uma migration para criar a abela de exemplo para testes chamada: financiamentos
- Criei uma migration com a criação da trigger e função de disparo de notificação no postgres que você encontra na pasta priv > repo > migrations

Depois de criar o banco, gerar as migrations e executar o projeto você poderá iniciar o terminal com "iex -S mix" e ao inserir ou modificar as colunas 'etapa' ou 'status' na tabela de financiamento, um evento irá ser disparado e você poderá ve-lo no log do seu terminal que está executando a aplicaçao.

Os passos abaixos padrão da documentação do elixir te ajudam a rodar o projeto.

# PhoenixDefault

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
