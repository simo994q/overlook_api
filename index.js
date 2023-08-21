import express from "express"
import dotenv from 'dotenv'
import { fileURLToPath } from 'url';
import path from 'path';
import cors from "cors"

import InstallRouter from "./Routes/install.router.js"
import CoreRouter from "./Routes/core.router.js"
import AppRouter from "./Routes/app.router.js"

dotenv.config()

const port = process.env.PORT || 3000

const app = express()

// App settings som sikrer at vi kan tilgå form data via request body
app.use(express.urlencoded({ extended: true }))
app.use(express.json())
app.use(cors())

// App Settings som sikrer CORS adgang via browser
app.use((req, res, next) => {
	// res.append('Access-Control-Allow-Origin', ['*']);
	res.append('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE');
	res.append('Access-Control-Allow-Credentials', true);
	res.append('Access-Control-Allow-Headers', 'Content-Type');
	next();
})

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