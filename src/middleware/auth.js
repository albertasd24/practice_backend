import "dotenv/config"
export const generarToken=(id)=>{
    console.log("token",process.env.JWT_SECRET);
}