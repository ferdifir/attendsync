import { createQuestionValidation } from "../validation/question-validation.js";

const create = async (request) => {
  const question = validate(createQuestionValidation, request);

  return prismaClient.question.create({
    data: question,
    select: {
      question_code: true,
      question_text: true,
    },
  });
};

const getAllQuestions = async () => {
  return prismaClient.question.findMany({
    select: {
      question_code: true,
      question_text: true,
    },
  });
};

const update = async (request) => {
  const question = validate(createQuestionValidation, request);

  return prismaClient.question.update({
    data: question,
    where: {
      question_code: question.question_code,
    },
    select: {
      question_code: true,
      question_text: true,
    },
  });
};

const deleteQuestion = async (request) => {
  const question = validate(createQuestionValidation, request);

  return prismaClient.question.delete({
    where: {
      question_code: question.question_code,
    },
  });
};

export default {
  create,
  getAllQuestions,
  update,
    deleteQuestion,
};
