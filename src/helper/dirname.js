import { fileURLToPath } from "url";
import path from "path";

const __filename = fileURLToPath(import.meta.url);
const dirname = path.join(__filename,"../../");
export { dirname };
