import { manejadorError } from "../helper/errors.js";

export class UsuarioController {
    constructor(usuarioService) {
        this.usuarioService = usuarioService
    }

    async obtenerUsuarios(req, res) {
        try {
            const usuarios = await this.usuarioService.obtenerUsuarios();
            return res.status(200).json(usuarios);
        } catch (error) {
            manejadorError(error, res);
        }
    }

}