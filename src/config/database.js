import { PrismaClient } from "@prisma/client";

export const comprobarConexionBaseDeDatos = async () => {
    const prisma = new PrismaClient();
    await prisma.$connect(); // Intenta conectar
    await prisma.$disconnect(); // Desconecta inmediatamente, ya que solo necesitamos verificar la conexión
}