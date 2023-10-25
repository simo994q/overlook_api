import express from 'express'
import sequelize from '../Config/sequelize.config.js'

// Core Models
import UserModel from '../Models/System/user.model.js'
import GroupModel from '../Models/System/group.model.js'
import OrgModel from '../Models/System/org.model.js'

// App Models
import SeedController from '../Controllers/Seed/seed.controller.js'

const InstallRouter = express.Router()

InstallRouter.get('/install', async (req, res) => {
	const seeder = new SeedController() 
	try {
		await sequelize.sync({ force: true })
		await seeder.seed_from_csv()
		res.sendStatus(200)
	}
	catch(err) {
		res.send(err)
	}
})

export default InstallRouter