import Groups from '../Models/group.model.js'
import { QueryParamsHandle } from '../Middleware/helpers.js'

/**
 * Controller for UserGroup Actions
 */
class GroupController {

	/**
	 * Method List
	 * @param {Object} req Express Request Object
	 * @param {Object} res Express Response Object
	 */
	list = async (req, res) => {
		// Indhenter parametre fra request objekt
		const qp = QueryParamsHandle(req, 'id, name')

		// Eksekverer sequelize metode med management values
		const result = await Groups.findAll({
			attributes: qp.attributes,
			order: [qp.sort_key],
			limit: qp.limit
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
		const result = await Groups.findOne({
			attributes: ['id', 'name', 'description', 'is_active', 'createdAt', 'updatedAt'],
			where: { id: id }
		})
		// Udskriver resultat i json format
		res.json(result)
	}

	/**
	 * Method Create
	 * @param {Object} req Express Request Object
	 * @param {Object} res Express Response Object
	 */
	create = async (req, res) => {
		// Destructure assignment af form data fra request body
		const { name, description, is_active } = req.body;
		// Tjekker felt data
		if(name && description && is_active) {
			// Opretter record
			const model = await Groups.create(req.body)
			// Sender nyt id som json object
			res.json({ newId: model.id })
		} else {
			res.sendStatus(418)
		}
	}

	/**
	 * Method Update
	 * @param {*} req 
	 * @param {*} res 
	 */
	update = async (req, res) => {
		// Destructure assignment af id. 
		const { id } = req.params || 0
		// Destructure assignment af form data fra request body
		const { name, description, is_active } = req.body;
		// Tjekker felt data
		if(id && name && description && is_active) {
			// Opretter record
			const model = await Groups.update(req.body, {
				where: { id: id }
			})
			// Sender nyt id som json object
			res.json({ 
				msg: 'Record update' 
			})
		} else {
			res.sendStatus(418)
		}	
	}

	/**
	 * Method Remove
	 * @param {object} req Request Object
	 * @param {object} res Response Object
	 */	
	remove = async (req, res) => {
		const { id } = req.body
		try {
			await Groups.destroy({ 
				where: { id: id }
			})
			res.sendStatus(200)
		}
		catch(err) {
			res.send(err)
		}
	}	
}

export default GroupController