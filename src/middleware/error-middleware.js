import { ResponseError } from "../error/response-error.js";

const errorMiddleware = async (err, req, res, next) => {
  if (!err) {
    next();
    return;
  }
  if (err instanceof ResponseError) {
    res
      .status(err.status)
      .json({
        status: "error",
        message: err.message,
      })
      .end();
  } else {
    console.error("Error: ", err);
    res
      .status(500)
      .json({
        status: "error",
        message: "Internal Server Error",
      })
      .end();
  }
};

export { errorMiddleware };
