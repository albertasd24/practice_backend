export class UsuarioRepository{
    constructor(prisma) {
        this.prisma = prisma;
      }
      
      async ObtenerTodosUsuarios() {
        return await this.prisma.usuario.findMany();
      }

      async crearUsuario(data) {
        return await this.prisma.usuario.create({ data });
      }
    
      async ObtenerUsuarioId(id) {
        return await this.prisma.usuario.findUnique({ where: { id } });
      }
    
      async actualizarUsuario(id, data) {
        return await this.prisma.usuario.update({ where: { id }, data });
      }
    
      async eliminarUsuario(id) {
        return await this.prisma.usuario.delete({ where: { id } });
      }
    
}
