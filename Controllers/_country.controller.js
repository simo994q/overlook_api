import sequelize from '../Config/sequelize.config.js'
import Countries from '../Models/country.model.js'
import Cities from '../Models/city.model.js'
import { Images } from '../Models/image.model.js'

// Definerer relation mellem hotel og image - one to many
Images.hasMany(Countries)
Countries.belongsTo(Images)

// Definerer relation mellem hotel og image - one to many
Countries.hasMany(Cities)
Cities.belongsTo(Countries)


/**
 * Controller foc City Actions
 */
class CountryController {

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
		const attr = attributes ? attributes.split(',') : new Array('id', 'name', 'description')

		// Eksekverer sequelize metode med management values
		const result = await Countries.findAll({
			attributes: attr,
			order: [order],
			limit: limit,
			include: [{
				model: Images,
				attributes: ['title', [sequelize.fn('CONCAT', 'http://localhost:4000/images/', sequelize.col('filename')), 'filename']]
			}]
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
		const result = await Countries.findOne({
			attributes: ['id', 'name', 'description', 'image_id'],
			include: [
				{
					model: Cities,
					attributes: [
						'id','name', 'description', 'image_id',
					]
				},{
					model: Images,
					attributes: [
						'title', 
						[sequelize.fn('CONCAT', 'http://localhost:4000/images/', sequelize.col('filename')), 'filename']
					]
				}]
			,
			where: { id: id }
		})
		// Udskriver resultat i json format
		res.json(result)
	}

}

export default CountryController