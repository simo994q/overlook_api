import express from 'express'
import sequelize from '../Config/sequelize.config.js'
import UserModel from '../Models/user.model.js'
import GroupModel from '../Models/group.model.js'
import OrgModel from '../Models/org.model.js'
import Countries from '../Models/country.model.js'
import Cities from '../Models/city.model.js'
import Hotels from '../Models/hotel.model.js'
import HotelFacilities from '../Models/hotel-facility.model.js'
import Rooms from '../Models/hotel.model.js'
import RoomFacilities from '../Models/room-facility.model.js'
import RoomFacilityCategory from '../Models/room-facility-category.model.js'
import UserRatings from '../Models/rating.model.js'
import News from '../Models/news.model.js'
import { Images } from '../Models/image.model.js'

const InstallRouter = express.Router()

InstallRouter.get('/install', (req, res) => {
	try {
		sequelize.sync()
		res.sendStatus(200)
	}
	catch(err) {
		res.send(err)
	}
})

export default InstallRouter