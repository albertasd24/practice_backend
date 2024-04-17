import { PrismaClient } from "@prisma/client";

export default class UsuarioModel {
    conexionBaseDatos;
    constructor() {
        this.conexionBaseDatos = PrismaClient();
    }
}