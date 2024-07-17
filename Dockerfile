FROM elixir:1.15.8-otp-26-alpine

RUN mix do local.hex --force, local.rebar --force
RUN apk add --no-cache git

# TODO: ビルドまでのコマンドを追加する
