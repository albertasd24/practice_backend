import express from "express";
import { dirname } from './helper/dirname.js';
import './config/index.js';
import routes from "./routes/index.js";
import { comprobarConexionBaseDeDatos } from "./config/database.js";
import { generarToken } from "./middleware/auth.js";

const PORT = process.env.PORT || 3000;
const app = express();

comprobarConexionBaseDeDatos()
    .then(() => {
        app.use(routes);
        app.listen(PORT, () => { console.log(`Servidor corriendo por el puerto ${PORT}`); })
        generarToken()
    })
    .catch(error => {
        console.error(`Error al conectar a la base de datos: ${error.message}`);
        process.exit(1); // Detiene la ejecución de la aplicación si la conexión falla
    });