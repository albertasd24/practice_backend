import dotenv from 'dotenv'; // Import dotenv as an ES6 module
dotenv.config(); // Load .env file
import { join } from 'path';
import { dirname } from '../helper/dirname.js';

// Configurar NODE_ENV y cargar el archivo .env correspondiente
if (process.env.NODE_ENV === 'test') {
    dotenv.config({ path: join(dirname, "./config/.env.test") });
} else if (process.env.NODE_ENV === 'local') {
    dotenv.config({ path: join(dirname, "./config/.env.local") });
} else if (process.env.NODE_ENV === 'staging') {
    dotenv.config({ path: join(dirname, "./config/.env.staging") });
} else if (process.env.NODE_ENV === 'production') {
    dotenv.config({ path: join(dirname, "./config/.env.production") });
}

const config = {
    PORT: process.env.PORT,
    MYSQL_URI: process.env.PORT,
    APPLICATION_NAME: process.env.PORT,
    JWT_SECRET: process.env.PORT,
};

export default config;