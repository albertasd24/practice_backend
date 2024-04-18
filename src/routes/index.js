import { Router } from "express";
import usuariosRouter from "./v1/usuarios.route.js"
const router = Router();

const PREFIJO = "/api/v1";
router.use(`${PREFIJO}/usuarios`, usuariosRouter);

export default router;