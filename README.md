# MapQuiz Backend

## 概要

MapQuizのバックエンドはExpressを使用しており、フロントエンドと連携してクイズ機能を提供します。

## 環境構築

### 必要なツール

- Node.js (推奨バージョン: xx.xx.x)
- npm
- Docker (オプション: MySQLコンテナを使用する場合)

### インストール手順

1. リポジトリをクローン

   ```sh
   git clone https://github.com/planet-bit/MapQuiz-backend.git
   cd MapQuiz-backend
   ```

2. 依存関係をインストール

   ```sh
   npm install
   ```

3. 環境変数を設定\
   環境変数の設定には、リポジトリ内の `.env.sample` を参考にしてください。

   1. `.env.sample` をコピーして `.env` を作成


      ```sh
      cp .env.sample .env
      ```
   2. 必要に応じて `.env` を編集

   **注意:** `.env` ファイルは `.gitignore` に含まれているため、公開しないようにしてください。

4. サーバーを起動

   ```sh
   npm start
   ```

## API エンドポイント

| メソッド | エンドポイント      | 説明 |
| ---- | -----------------     | ---------------- |
| GET  | /api/countries        | 国選択リストを取得 |
| GET  | /api/questions        | クイズの問題を取得 |
| GET  | /api/letters/:country | 各国の文字情報を取得 |

## データベース

- MySQLを使用（docker-compose で管理可能）
- 初期データの投入は `database/dump.sql` を参照
