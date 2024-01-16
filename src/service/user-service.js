import {
  loginUserValidation,
  registerUserValidation,
  getUserValidation,
  updateUserValidation,
} from "../validation/user-validation.js";
import { prismaClient } from "../app/database.js";
import { validate } from "../validation/validation.js";
import bcrypt from "bcrypt";
import { v4 as uuid } from "uuid";
import { ResponseError } from "../error/response-error.js";

const register = async (request) => {
  const user = validate(registerUserValidation, request);

  const countUser = await prismaClient.user.count({
    where: {
      username: user.username,
    },
  });

  if (countUser === 1) {
    throw new ResponseError(400, "Username already exists");
  }

  user.password = await bcrypt.hash(user.password, 10);

  return prismaClient.user.create({
    data: user,
    select: {
      username: true,
      name: true,
      email: true,
    },
  });
};

const login = async (request) => {
  const loginRequest = validate(loginUserValidation, request);

  const user = await prismaClient.user.findUnique({
    where: {
      username: loginRequest.username,
    },
    select: {
      username: true,
      password: true,
    },
  });

  if (!user) {
    throw new ResponseError(401, "Username or password incorrect");
  }

  const isPasswordCorrect = await bcrypt.compare(
    loginRequest.password,
    user.password
  );

  if (!isPasswordCorrect) {
    throw new ResponseError(401, "Username or password incorrect");
  }

  const token = uuid().toString();

  return prismaClient.user.update({
    data: {
      token: token,
    },
    where: {
      username: user.username,
    },
    select: {
      token: true,
      role: true,
    },
  });
};

const getAllUsers = async () => {
  return prismaClient.user.findMany({
    select: {
      username: true,
      name: true,
      email: true,
      user_id: true,
      role: true,
    },
  });
};

const update = async (request) => {
  const user = validate(updateUserValidation, request);

  const totalUser = await prismaClient.user.count({
    where: {
      username: user.username,
    },
  });

  if (totalUser !== 1) {
    throw new ResponseError(404, "User not found");
  }

  const data = {};
  if (user.name) {
    data.name = user.name;
  }
  if (user.password) {
    data.password = await bcrypt.hash(user.password, 10);
  }
  if (user.email) {
    data.email = user.email;
  }
  if (user.role) {
    data.role = user.role;
  }

  return prismaClient.user.update({
    data: data,
    where: {
      username: user.username,
    },
    select: {
      username: true,
      name: true,
      email: true,
      role: true,
    },
  });
};

const logout = async (username) => {
  username = validate(getUserValidation, username);

  return prismaClient.user.update({
    data: {
      token: null,
    },
    where: {
      username: user.username,
    },
  });
};

export default { register, login, getAllUsers, update, logout };
