import Joi from "joi";

const registerUserValidation = Joi.object({
  name: Joi.string().required(),
  username: Joi.string().required(),
  email: Joi.string().email().required(),
  password: Joi.string().min(6).required(),
  role: Joi.string().required(),
});

const loginUserValidation = Joi.object({
  username: Joi.string().required(),
  password: Joi.string().min(6).required(),
});

export { registerUserValidation, loginUserValidation };
