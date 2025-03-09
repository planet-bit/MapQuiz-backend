# Node.js の公式イメージを使う（バージョンは適宜変更）
FROM node:18

# 作業ディレクトリを設定
WORKDIR /app

# package.json と package-lock.json をコピー
COPY package*.json ./

# 依存関係をインストール
RUN npm install


# ソースコードをコンテナ内にコピーする
COPY . /app


# サーバーを公開するポート（Expressのデフォルトは 3000）
EXPOSE 3000

# アプリケーションの起動
CMD ["npm", "run", "dev"]
