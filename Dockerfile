FROM elixir:latest

RUN mix local.hex --force && \
    mix local.rebar --force

RUN mkdir /app
WORKDIR /app

COPY mix.exs mix.lock ./

RUN mix deps.get

COPY . .

RUN mix do compile

CMD mix ecto.create && mix ecto.migrate && mix phx.server

EXPOSE 4000
