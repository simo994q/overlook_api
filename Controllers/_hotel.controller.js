import Hotels from '../Models/hotel.model.js'
import Cities from '../Models/city.model.js'
import { Images } from '../Models/image.model.js'
import sequelize from '../Config/sequelize.config.js'
import HotelFacilities from '../Models/hotel-facility.model.js'
import HotelFacilityRel from '../Models/hotel-facility-rel.model.js'
import Rooms from '../Models/room.model.js'
import HotelRoomRel from '../Models/hotel-room-rel.model.js'

// Definerer relation mellem by og hotel - one to many
Cities.hasMany(Hotels)
Hotels.belongsTo(Cities)

// Definerer relation mellem hotel og image - one to many
Images.hasMany(Hotels)
Hotels.belongsTo(Images)

// Definerer relation mellem hotel og værelser
Hotels.belongsToMany(HotelFacilities, { through: HotelFacilityRel });
HotelFacilities.belongsToMany(Hotels, { through: HotelFacilityRel });
HotelFacilityRel.belongsTo(Hotels, { through: HotelFacilityRel });
HotelFacilityRel.belongsTo(HotelFacilities, { through: HotelFacilityRel });
Hotels.hasMany(HotelFacilityRel);
HotelFacilities.hasMany(HotelFacilityRel);

// Definerer relation mellem hotel og værelser
Hotels.belongsToMany(Rooms, { through: HotelRoomRel });
Rooms.belongsToMany(Hotels, { through: HotelRoomRel });
HotelRoomRel.belongsTo(Hotels, { through: HotelRoomRel });
HotelRoomRel.belongsTo(Rooms, { through: HotelRoomRel });
Hotels.hasMany(HotelRoomRel);
Rooms.hasMany(HotelRoomRel);

/**
 * Controller for Hotel Actions
 */
class HotelController {

	/**
	 * Method List
	 * @param {Object} req Express Request Object
	 * @param {Object} res Express Response Object
	 */
	list = async (req, res) => {
		const { city_id } = req.params || 0
		// Destructure Assignment - optional list management
		let { sortkey, sortdir, limit, attributes } = req.query
		// Sætter array til sort og retning
		const order = [sortkey ? sortkey : 'id']
		order.push(sortdir || 'ASC')
		// Sætter limit antal
		limit = parseInt(limit) || 1000
		// Sætter attributter (table felter)
		const attr = attributes ? attributes.split(',') : new Array('id', 'title', 'teaser')

		// Eksekverer sequelize metode med management values
		const result = await Hotels.findAll({
			attributes: attr,
			order: [order],
			limit: limit,
			where: { city_id: city_id },
			include: [
			{
				model: Images,
				attributes: ["id",
				[
				sequelize.fn(
					"CONCAT",
					"http://localhost:4000/images/",
					sequelize.col("filename")
				),
				"filename",
				]
			]}]
		})
		// Udskriver resultat i json format
		res.json(result)
	}

	/**
	 * Method Details
	 * @param {Object} req Express Request Object
	 * @param {Object} res Express Response Object
	 */
	details = async (req, res) => {
		// Destructure assignment af id. 
		const { id } = req.params || 0
		// Eksekverer sequelize metode med attributter og where clause
		const result = await Hotels.findOne({
			attributes: ['id', 'title', 'teaser', 'description', 'city_id', 'phone', 'num_stars', 'image_id'],
			include: [{
				model: Cities,
				attributes: ['id', 'name', 'description', 'country_id'],
			}, {
				model: Images,
				attributes: ["id",
				[
				sequelize.fn(
					"CONCAT",
					"http://localhost:4000/images/",
					sequelize.col("filename")
				),
				"filename",
				]
				]
			}, {
				model: Rooms,
			}, {
				model: HotelFacilities,
				attributes: ['id', 'title']
			}],
			where: { id: id }

		})
		// Udskriver resultat i json format
		res.json(result)
	}

	facilities = async (req, res) => {
		const result = await HotelFacilities.findAll({
			attributes: ['id', 'title']
		})
		res.json(result)
	}

}
export default HotelController