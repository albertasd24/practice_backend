import { Router } from "express";
import { UsuarioController } from "../../controller/usuario.controller.js";
import { PrismaClient } from "@prisma/client";
import { UsuarioRepository } from "../../repository/UsuarioRepository.js";
import { UsuarioService } from "../../services/Usuario.service.js";

const router = Router();
const prisma = new PrismaClient();
const usuarioRepository = new UsuarioRepository(prisma);
const usuarioService = new UsuarioService(usuarioRepository);
const usuarioController = new UsuarioController(usuarioService);
router.get("/", usuarioController.obtenerUsuarios.bind(usuarioController));

export default router;