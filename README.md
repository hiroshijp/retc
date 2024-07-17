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

docker compose up --scale app=10
```

## todo
- クライアントプロセスを任意の数起動する
- メッセージパッシングの間隔を指定できる

## 起動時に渡すパラメーター
ビルド
- 接続先ホスト

デプロイ
- コンテナ数
- 接続先ホスト
- hub_sid
- retc-{ No.X }
- 送信数
- 間隔
