# MapQuiz-backend

## 概要

MapQuizアプリケーションのバックエンド部分です。このリポジトリはAPIの提供を担当し、フロントエンドと連携して地名のクイズを出題・解答・記録などを管理します。

## 環境構築

### 必要なツール

- Node.js (推奨バージョン: v22.13.1)
- npm
- Docker

### インストール手順

1. リポジトリをクローンします

   ```sh
   git clone https://github.com/planet-bit/MapQuiz-backend.git
   cd MapQuiz-backend
   ```

2. 必要なパッケージをインストールします

   ```sh
   npm install
   ```


3. 環境変数ファイルの設定

   env.sampleにはサンプルのバックエンドの接続設定が格納されています。
   
   まず .env.sample を .env にコピーして、必要に応じて設定を編集します。


   ```sh
   cp env.backend.sample .env.backend
   ```


4. MapQuiz-envリポジトリからDockerコンテナを立ち上げます

   envリポジトリ内のdocker-compose.ymlファイルを使用して、バックエンド、データベースを一度にセットアップします。

   MapQuiz-envリポジトリをクローンし、必要な設定を行った後にコンテナを起動します：

   ```sh
   cd ..
   git clone https://github.com/planet-bit/MapQuiz-env.git
   cd MapQuiz-env
   cp env.db.sample .env.db
   npm install
   docker-compose up
   ```

   これで、mapquiz-node-container（バックエンド）、mapquiz-mysql-container（データベース）などが立ち上がります。


5. バックエンドアプリの確認

   コンテナが起動した後、Node.jsのバックエンドアプリケーションが実行されます。
   
   mapquiz-node-containerがポート番号3000でリッスンします。
   
   ブラウザでは、[http://localhost:3000](http://localhost:3000) を開いて、APIが動作していることを確認してください。
   

## 設定
バックエンドの設定（データベース接続、環境変数など）は、envリポジトリで管理されています。バックエンドが依存する環境設定がenvに含まれているため、必ず確認し、適切に設定してください。


## API エンドポイント

| メソッド | エンドポイント | 説明          |　　　　　例　　　　|
| ---- | ---------------| ---------------------- |----------------------|
| GET  | /api/countries        | 国選択リストを取得 |
| GET  | /api/questions?countryCode={国名}  | 各国のクイズの問題を取得 |/api/questions?countryCode=ru
| GET  | /api/letters/:countryCode | 各国の文字情報を取得 | /api/letters/ru
| POST  | /auth/register        |アカウント登録 |　{ "email": "user@example.com", "password": "password" }
| POST  |  /auth/login  | ログイン用 |{ "email": "user@example.com", "password": "password" }
| GET  | /auth/me |認証トークンの確認|トークン（Authorizationヘッダー）で認証
| POST| /api/straks/update | 連続正解記録の管理 | {"user_id": 14,"game_type": "letter","country_code": "kr","streak": 8,"correct_answers": 8}
## データベース

- MySQLを使用
- 初期データの投入はコンテナ起動時に自動で行われます。\
  database/dump.sqlが/docker-entrypoint-initdb.d/にマウントされ、コンテナ起動時に自動的に実行されます。

## フロントエンドの起動

バックエンドと連携するフロントエンドアプリケーションのセットアップについては、MapQuiz-frontend READMEを参照してください。