# IIJmio用SIMクーポン残量チェッカー

IIJmio のSIMクーポンの残量をチェックして、100MB超過する毎にメール通知する。
エコプラン非対応。

## 使い方

必要なもの

- google client id
- google secret
- iijmio developer id (https://www.iijmio.jp/hdd/coupon/mioponapi.jsp)
- サーバー環境(herokuとか)

環境変数を設定

```
GOOGLE_APP_CLIENT_ID=hoge
GOOGLE_APP_SECRET=fuga
IIJMIO_DEVELOPER_ID=foo
IIJMIO_REDIRECT_URL=http://example.com/setting/iijmio_token
```

DBセットアップ

```
rails db:setup
rails db:migrate
```

サーバー起動

```
rails s
```

サービスにログインして設定

1. トップページにアクセス
2. Googleログイン
3. IIJmio のアクセストークンを設定


任意のタイミングで定期的に下記のコマンドを実行する。

```sh
rake cron:check_total_coupon_volume
```

実行時、前回のデータ量から100MB超過指定たらメール通知します。
