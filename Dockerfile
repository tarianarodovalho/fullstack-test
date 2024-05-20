# Use the official Elixir image as the base image
FROM elixir:1.14-alpine AS build

# Set the working directory inside the container
WORKDIR /app

# Install hex and rebar
RUN mix local.hex --force && \
    mix local.rebar --force

# Copy the mix.exs and mix.lock files to the container
COPY mix.exs mix.lock ./

# Install the project dependencies
RUN mix deps.get

# Copy the remaining application code to the container
COPY . .

# Compile the project
RUN mix compile

# Build the release
RUN mix release

# Create a new image with only the compiled release
FROM alpine:3.14 AS app

# Install OpenSSL and other required dependencies
RUN apk add --no-cache openssl ncurses-libs

# Set the working directory inside the container
WORKDIR /app

# Copy the compiled release from the build image
COPY --from=build /app/_build/prod/rel/inside_trading .

# Set the entrypoint command for the container
CMD ["bin/inside_trading", "start"]