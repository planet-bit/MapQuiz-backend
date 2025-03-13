const jwt = require("jsonwebtoken");

const authMiddleware = (req, res, next) => {
  const token = req.header("Authorization")?.replace("Bearer ", ""); // クッキーからトークンを取得

  if (!token) {
    return res.status(401).json({ error: "認証トークンがありません" });
  }

  try {
    const decoded = jwt.verify(token, process.env.SECRET_KEY);
    req.user = decoded;  // 認証されたユーザー情報をreq.userにセット
    next();  // 次のミドルウェアに進む
  } catch (error) {
    return res.status(401).json({ error: "無効なトークン" });
  }
};

module.exports = authMiddleware;
