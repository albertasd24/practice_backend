import { PrismaClient } from '@prisma/client'
import { dirname } from './helper/dirname.js';

const prisma = new PrismaClient()
console.log(dirname);
async function main() {
    const users = await prisma.user.findMany({
        include: {
            profile: true
        }
    })
    await prisma.usuario.find
    console.log(users)
}
// DATABASE_URL="mysql://root:@localhost:3306/proyecto_c"
// main().then(async () => {
//     await prisma.$disconnect()
// })
//     .catch(async (e) => {
//         console.log(e);
//         await prisma.$disconnect()
//         process.exit(1)
//     })  