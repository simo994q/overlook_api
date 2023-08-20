import express from "express"
import dotenv from 'dotenv'
import { fileURLToPath } from 'url';
import path from 'path';

import InstallRouter from "./Routes/install.router.js"
import CoreRouter from "./Routes/core.router.js"
import AppRouter from "./Routes/app.router.js"

dotenv.config()

const port = process.env.PORT || 3000

const app = express()

app.use(express.urlencoded({ extended: true }))
const currentUrl = import.meta.url;
const currentPath = fileURLToPath(currentUrl);
const currentDir = path.dirname(currentPath);

// Define a route to serve static images
app.use('/images', express.static(path.join(currentDir, 'images')));

app.use(InstallRouter)
app.use(CoreRouter)
app.use(AppRouter)

app.listen(port, () => {
	console.log(`Server kører på http://localhost:${port}`);
})