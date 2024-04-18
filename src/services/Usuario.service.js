import { NotFoundError } from "../helper/errors.js";

export class UsuarioService {
    constructor(usuarioRepository) {
        this.usuarioRepository = usuarioRepository;
    }

    async obtenerUsuarios() {
        const usuarios = await this.usuarioRepository.ObtenerTodosUsuarios();
        return usuarios;
    }

    async crearUsuario(usuarioData) {
        return await this.usuarioRepository.crearUsuario(usuarioData);
    }
}