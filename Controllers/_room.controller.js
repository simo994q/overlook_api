import sequelize from '../Config/sequelize.config.js'
import Rooms from '../Models/room.model.js'
import { Images } from '../Models/image.model.js'
import RoomImages from '../Models/room-image-rel.model.js'
import RoomFacilities  from '../Models/room-facility.model.js'
import RoomFacilityRel from '../Models/room-facility-rel.model.js'
import RoomFacilityCategory from '../Models/room-facility-category.model.js'

// Definerer relation mellem værelser og billeder
Rooms.belongsToMany(Images, { through: RoomImages, foreignKey: { allowNull: false }, onDelete: 'CASCADE' });
Images.belongsToMany(Rooms, { through: RoomImages, foreignKey: { allowNull: false }, onDelete: 'CASCADE' });
RoomImages.belongsTo(Rooms, { through: RoomImages, foreignKey: { allowNull: false }, onDelete: 'CASCADE' });
RoomImages.belongsTo(Images, { through: RoomImages, foreignKey: { allowNull: false }, onDelete: 'CASCADE' });
Rooms.hasMany(RoomImages);
Images.hasMany(RoomImages);

// Definerer relation mellem værelser og faciliteter
Rooms.belongsToMany(RoomFacilities, { through: RoomFacilityRel, foreignKey: { allowNull: false }, onDelete: 'CASCADE' });
RoomFacilities.belongsToMany(Rooms, { through: RoomFacilityRel, foreignKey: { allowNull: false }, onDelete: 'CASCADE' });
RoomFacilityRel.belongsTo(Rooms, { through: RoomFacilityRel, foreignKey: { allowNull: false }, onDelete: 'CASCADE' });
RoomFacilityRel.belongsTo(RoomFacilities, { through: RoomFacilityRel, foreignKey: { allowNull: false }, onDelete: 'CASCADE' });
Rooms.hasMany(RoomFacilityRel);
RoomFacilities.hasMany(RoomFacilityRel);

RoomFacilities.belongsTo(RoomFacilityCategory)
RoomFacilityCategory.hasMany(RoomFacilities)

/**
 * Controller for Room Actions
 */
class RoomController {

	/**
	 * Method List
	 * @param {Object} req Express Request Object
	 * @param {Object} res Express Response Object
	 */
	list = async (req, res) => {
		// Destructure Assignment - optional list management
		let { sortkey, sortdir, limit, attributes } = req.query
		// Sætter array til sort og retning
		const order = [sortkey ? sortkey : 'id']
		order.push(sortdir || 'ASC')
		// Sætter limit antal
		limit = parseInt(limit) || 1000
		// Sætter attributter (table felter)
		const attr = attributes ? attributes.split(',') : new Array('id', 'title', 'num_persons', 'area')

		// Eksekverer sequelize metode med management values
		const result = await Rooms.findAll({
			attributes: attr,
			order: [order],
			limit: limit,
			include: {
				model: Images,
				attributes: ["id", [
					sequelize.fn(
						"CONCAT",
						"http://localhost:4000/images/",
						sequelize.col("filename")
					),
					"filename"]
				]
			}
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
		const result = await Rooms.findOne({
			attributes: ['id', 'title', 'description', 'num_persons', 'area', 'day_price_normal', 'day_price_flex'],
			include: [{
				model: Images,
				attributes: ["id", [
					sequelize.fn(
						"CONCAT",
						"http://localhost:4000/images/",
						sequelize.col("filename")
					),
					"filename"]
				]
			}, {
				model: RoomFacilities,
				attributes: ['title', 'room_facility_category_id']
			}],
			where: { id: id }

		}) 
		// Udskriver resultat i json format
		res.json(result)
	}

	facilities = async (req, res) => {
		const result = await RoomFacilities.findAll({
			attributes: ['id', 'title'],
			include: {
				model: RoomFacilityCategory
			}
		})
		res.json(result)
	}	

}
export default RoomController