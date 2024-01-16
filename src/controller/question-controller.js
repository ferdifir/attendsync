import questionService from "../service/question-service.js";

const create = async (req, res, next) => {
  try {
    const result = await questionService.create(req.body);
    res.status(201).json({
      status: "success",
      data: result,
    });
  } catch (error) {
    next(error);
  }
};

const getAllQuestions = async (req, res, next) => {
  try {
    const result = await questionService.getAllQuestions();
    res.status(200).json({
      status: "success",
      data: result,
    });
  } catch (error) {
    next(error);
  }
};

const update = async (req, res, next) => {
  try {
    const result = await questionService.update(req.body);
    res.status(200).json({
      status: "success",
      data: result,
    });
  } catch (error) {
    next(error);
  }
};

const deleteQuestion = async (req, res, next) => {
  try {
    const result = await questionService.deleteQuestion(req.body);
    res.status(204).end();
  } catch (error) {
    next(error);
  }
};

export default {
  create,
  getAllQuestions,
  update,
  deleteQuestion,
};
