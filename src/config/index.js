import dotenv from 'dotenv'; // Import dotenv as an ES6 module
dotenv.config(); // Load .env file

import { join } from 'path';
import { dirname } from '../helper/dirname.js';

if (process.env.NODE_ENV !== "production") {
    if (process.env.NODE_ENV === "test") {
        dotenv.config({ path: join(dirname, "./test.env") }); // Load test.env if NODE_ENV is 'test'
    }
}

export default{
    PORT: process.env.PORT,
    MYSQL_URI: process.env.PORT,
    APLICATION_NAME: process.env.PORT,
    JWT_SECRET: process.env.PORT,
}