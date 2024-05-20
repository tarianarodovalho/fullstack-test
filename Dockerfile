# Build Stage
FROM elixir:1.14-alpine AS build
WORKDIR /app
RUN mix local.hex --force && \
    mix local.rebar --force
COPY mix.exs mix.lock ./
RUN mix deps.get
COPY . .
RUN mix compile
RUN mix release || (echo "Release failed" && exit 1)

# Application Stage
FROM alpine:3.14 AS app
RUN apk add --no-cache openssl ncurses-libs
WORKDIR /app
COPY --from=build /app/_build/prod/rel/inside_trading .
CMD ["./bin/inside_trading", "start"]
