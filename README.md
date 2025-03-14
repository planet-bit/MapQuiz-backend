# MapQuiz-backend

## 概要

MapQuiz-backendはExpressを使用しており、MapQuiz-frontendと連携してクイズ機能を提供します。

MapQuiz-backendでは、MySQLデータベースを使用して、クイズの問題や回答などのデータを管理します。データベースはDockerコンテナ内で管理され、docker-composeを使って環境が構築されます。

## 環境構築

### 必要なツール

- Node.js (推奨バージョン: v22.13.1)
- npm
- Docker

### インストール手順

1. リポジトリをクローン

   ```sh
   git clone https://github.com/planet-bit/MapQuiz-backend.git
   cd MapQuiz-backend
   ```

2. 環境変数を設定

   環境変数の設定には、リポジトリ内の `.env.sample` を参考にしてください。

   `.env.sample` をコピーして `.env` を作成

   ```sh
   cp .env.sample .env
   ```
3. 必要なパッケージをインストールします

   ```sh
   npm install
   ```

4. Dockerコンテナの起動

   ```sh
   docker-compose up -d
   ```

5. バックエンドアプリの確認

   コンテナが起動した後、Node.jsのバックエンドアプリケーションが実行されます。
   
   mapquiz-node-containerがポート番号3000でリッスンします。
   
   ブラウザでは、[http://localhost:3000](http://localhost:3000) を開いて、APIが動作していることを確認してください。
   

## API エンドポイント

| メソッド | エンドポイント      | 説明 |　　　　　例　　　　|
| ---- | -----------------     | ---------------------- |----------------------|
| GET  | /api/countries        | 国選択リストを取得 |
| GET  | /api/questions?countryCode={国名}  | 各国のクイズの問題を取得 |/api/questions?countryCode=ru
| GET  | /api/letters/:countryCode | 各国の文字情報を取得 | /api/letters/ru
| POST  | /auth/register        |アカウント登録 |　{ "email": "user@example.com", "password": "your-password" }
| POST  |  /auth/login  | ログイン用 |{ "email": "user@example.com", "password": "your-password" }
| GET  | /auth/me |認証トークンの確認|トークン（Authorizationヘッダー）で認証

## データベース

- MySQLを使用（docker-compose で管理可能）
- 初期データの投入はコンテナ起動時に自動で行われます。\
  database/dump.sqlが/docker-entrypoint-initdb.d/にマウントされ、コンテナ起動時に自動的に実行されます。

## フロントエンドの起動

バックエンドと連携するフロントエンドアプリケーションのセットアップについては、MapQuiz-frontend READMEを参照してください。
