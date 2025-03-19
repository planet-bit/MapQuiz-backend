const jwt = require("jsonwebtoken");

const authMiddleware = (req, res, next) => {

  // リクエストヘッダーの "Authorization" からトークンを取得
  // "Bearer {トークン}" という形式なので "Bearer " を取り除く
  const token = req.header("Authorization")?.replace("Bearer ", ""); 

  if (!token) {
    return res.status(401).json({ error: "認証トークンがありません" });
  }

  try {

    // トークンを検証し、デコードされたユーザー情報を取得
    const decoded = jwt.verify(token, process.env.SECRET_KEY);

    // 認証されたユーザー情報をreq.userにセット
    req.user = decoded;  // { id: user_id, email }

    next();  // トークンが正しい場合に、認証されたユーザーに関連する処理が行われる
  } catch (error) {
    return res.status(401).json({ error: "無効なトークン" });
  }
};

// ミドルウェアをエクスポート（他のファイルで利用できるようにする）
module.exports = authMiddleware;
