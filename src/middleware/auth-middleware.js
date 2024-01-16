import { prismaClient } from "../app/database";

export const authMiddleware = async (req, res, next) => {
  const token = req.get("Authorization");
  if (!token) {
    res.status(401).json({
      status: "error",
      message: "Unauthorized",
    });
    return;
  } else {
    const user = await prismaClient.user.findFirst({
      where: {
        token: token,
      },
    });
    if (!user) {
      res.status(401).json({
        status: "error",
        message: "Unauthorized",
      });
      return;
    } else {
      req.user = user;
      next();
    }
  }
};
