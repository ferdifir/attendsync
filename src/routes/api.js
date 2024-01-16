import express from 'express';
import userController from '../controller/user-controller.js';
import { authMiddleware } from '../middleware/auth-middleware.js';
import questionController from '../controller/question-controller.js';

const router = express.Router();
router.use(authMiddleware);
router.patch("/api/user", userController.update);
router.get("/api/user", userController.getAllUsers);
router.delete("/api/user", userController.logout);

router.post("/api/question", questionController.create);
router.get("/api/question", questionController.getAllQuestions);
router.put("/api/question", questionController.update);
router.delete("/api/question", questionController.deleteQuestion);

export { router };