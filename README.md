# retc

## about
reticulumの負荷テストをするためのWebSocketクライアント

## how

### dev
```
$ docker compose up dev -d
```

### prod

`docker-compose.yaml`のcommandの引数を編集
```
& docker compose up prod --scale prod=${ クライアント数 }
```
## todo
- 頻度を与えて無限ループにする
- メッセージの中身を考える
- 複数コンテナを起動したときメッセージにどのコンテナから来たものか記述する