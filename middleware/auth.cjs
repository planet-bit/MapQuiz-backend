const jwt = require("jsonwebtoken");

const authMiddleware = (req, res, next) => {

  // リクエストヘッダーの "Authorization" からトークンを取得
  const token = req.header("Authorization")?.replace("Bearer ", "");

  if (!token) {
    return res.status(401).json({ error: "認証トークンがありません" });
  }

  try {
    // トークンを検証し、デコードされたユーザー情報を取得
    const decoded = jwt.verify(token, process.env.SECRET_KEY);

    // トークンが期限切れの場合に特定のエラーメッセージを返す
    if (decoded.exp < Date.now() / 1000) {
      return res.status(401).json({ error: "トークンの有効期限が切れています" });
    }

    // 認証されたユーザー情報をreq.userにセット
    req.user = decoded;  // { id: user_id, user_name, role_id }

    next();  // トークンが正しい場合に、認証されたユーザーに関連する処理が行われる
  } catch (error) {
    // JWTの検証に失敗した場合、無効なトークンのエラーメッセージを返す
    return res.status(401).json({ error: "無効なトークン", details: error.message });
  }
};

// ミドルウェアをエクスポート（他のファイルで利用できるようにする）
module.exports = authMiddleware;
