# MapQuiz-backend

## 概要

MapQuizアプリケーションのバックエンド部分です。このリポジトリはAPIの提供を担当し、フロントエンドと連携して地名のクイズを出題・解答・記録などを管理します。

## 環境構築

### 必要なツール

- Node.js (推奨バージョン: v22.13.1)
- npm
- Docker
- Docker Compose

### インストール手順

1. 必要なリポジトリをクローン

   ```sh
   git clone https://github.com/planet-bit/MapQuiz-frontend.git
   git clone https://github.com/planet-bit/MapQuiz-backend.git
   git clone https://github.com/planet-bit/MapQuiz-env.git
   ```

2. 環境変数ファイルの設定

   /MapQuiz-env/env.sampleにはサンプルのバックエンドの接続設定があります。
   
　 /MapQuiz-env/.env.sample を /MapQuiz-backend/.env にコピーします。

   ```sh
   cd MapQuiz-env
   cp .env.sample ../MapQuiz-backend/.env
   ```

3. Dockerコンテナの起動

   Docker Composeを使用して、すべてのコンテナ（バックエンド、フロントエンド、データベース）を立ち上げます。

   ```sh
   docker-compose up
   ```

   これにより、以下のコンテナが起動します：

   - mapquiz-app-container（フロントエンド、バックエンド）
   - mapquiz-mysql-container（データベース）

4. バックエンドアプリの確認

   コンテナが起動した後、Node.jsのバックエンドアプリケーションが実行されます。
   
   
   バックエンドへは、http://localhost:3000 を開いて、APIが動作していることを確認してください。

   フロントエンドへは http://localhost:5173 でアプリにアクセスできます。
   
   

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