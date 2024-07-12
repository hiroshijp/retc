ARG ALPINE_VERSION=3.16.2
ARG ELIXIR_VERSION=1.14.3
ARG ERLANG_VERSION=23.3.4.18
FROM hexpm/elixir:${ELIXIR_VERSION}-erlang-${ERLANG_VERSION}-alpine-${ALPINE_VERSION}  

RUN mix do local.hex --force, local.rebar --force
RUN apk add --no-cache git inotify-tools 