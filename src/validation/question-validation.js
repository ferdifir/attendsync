import Joi from "joi";

const createQuestionValidation = Joi.object({
  question_code: Joi.string().required(),
  question_text: Joi.string().required(),
});

export { createQuestionValidation };