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

const getUserValidation = Joi.string().max(100).required();

const updateUserValidation = Joi.object({
  username: Joi.string().required(),
  name: Joi.string().optional(),
  password: Joi.string().min(6).optional(),
  email: Joi.string().email().optional(),
  role: Joi.string().optional(),
});

export { registerUserValidation, loginUserValidation, getUserValidation, updateUserValidation };
