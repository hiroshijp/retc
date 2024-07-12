# retc

## about
reticulumの負荷テストをするためのWebSocketクライアント

## how
```
docker compose up -d

#
#コンテナへ入る
#

cd /code/retc
mix deps.get
iex -S mix

#
#iexを起動
#

socket = Retc.socket()
channel = Retc.join(socket, hub_sid)
```

## todo
- クライアントプロセスを任意の数起動する
- メッセージパッシングの間隔を指定できる