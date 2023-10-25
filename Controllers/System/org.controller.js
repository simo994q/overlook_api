import { QueryParamsHandle } from '../../Middleware/helpers.js'
import Org from '../../Models/System/org.model.js'

/**
 * Controller for Org Actions
 */
class OrgController {

	/**
	 * Method List
	 * @param {Object} req Express Request Object
	 * @param {Object} res Express Response Object
	 */
	list = async (req, res) => {		
		const qp = QueryParamsHandle(req, 'id, name, longtitude, latitude')

		try {
			const result = await Org.findAll({
				attributes: qp.attributes,
				order: [qp.sort_key],
				limit: qp.limit
			})
			// Udskriver resultat i json format
			res.json(result)								
		} catch (error) {
			res.status(418).send({
				message: `Could not get org list: ${error}`
			})												
		}

	}

	/**
	 * Method Details
	 * @param {Object} req Express Request Object
	 * @param {Object} res Express Response Object
	 */
	details = async (req, res) => {
		// Destructure assignment af id. 
		const { id } = req.params || 0

		if(id) {
			try {
				// Eksekverer sequelize metode med attributter og where clause
				const result = await Org.findOne({
					attributes: [
						'id', 
						'name', 
						'address', 
						'zipcode', 
						'city', 
						'country', 
						'longtitude', 
						'latitude', 
						'createdAt', 
						'updatedAt'
					],
					where: { id: id }
				})
				// Udskriver resultat i json format
				res.json(result)
				
			} catch (error) {
				res.status(418).send({
					message: `Could not get org details: ${error}`
				})																	
			}
		} else {
			res.status(403).send({
				message: 'Wrong parameter values'
			})
		}
	}

	/**
	 * Method Details
	 * @param {Object} req Express Request Object
	 * @param {Object} res Express Response Object
	 */
	create = async (req, res) => {
		// Destructure assignment af form data fra request body
		const { name, address, zipcode, city, country } = req.body;
		// Tjekker felt data
		if(name && address && zipcode && city) {
			try {
				// Opretter record
				const model = await Org.create(req.body)
				// Sender nyt id som json object
				return res.json({
					message: `Record created`,
					newId: model.id
				})
			} catch (error) {
				res.status(418).send({
					message: `Could not create record: ${error}`
				})																					
			}
			// Opretter record
			const model = await Org.create(req.body)
			// Sender nyt id som json object
			res.json({ newId: model.id })
		} else {
			res.status(403).send({
				message: 'Wrong parameter values'
			})
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
		const { name, address, zipcode, city, country } = req.body;

		// Tjekker felt data
		if(id && name && address && zipcode && city) {

			try {
				// Opretter record
				const model = await Org.update(req.body, {
					where: { id: id },
					individualHooks: true
				})
				// Sender nyt id som json object
				return res.json({
					message: `Record updated`
				})				
			} catch (error) {
				res.status(418).send({
					message: `Could not update record: ${error}`
				})																					
			}
		} else {
			res.status(403).send({
				message: 'Wrong parameter values'
			})
		}	
	}

	/**
	 * Method Remove
	 * @param {object} req Request Object
	 * @param {object} res Response Object
	 */	
	remove = async (req, res) => {
		const { id } = re.params
		
		if(id) {
			try {
				await Org.destroy({ 
					where: { id: req.params.id }
				})
				return res.status(200).send({
					message: `Record deleted`
				})
			}
			catch(err) {
				res.status(418).send({
					message: `Could not delete record: ${error}`
				})																	

			}	
		} else {
			res.status(403).send({
				message: 'Wrong parameter values'
			})			
		}
	}		
}

export default OrgController