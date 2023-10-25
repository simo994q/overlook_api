import Users from '../../Models/System/user.model.js'
import Groups from '../../Models/System/group.model.js'
import UserGroupRel from '../../Models/System/user-group-rel.model.js'
import Org from '../../Models/System/org.model.js'
import { QueryParamsHandle } from '../../Middleware/helpers.js'

// Definerer relation mellem user og org - one to many
Org.hasMany(Users)
Users.belongsTo(Org)

// Definerer relation mellem user og usergroups - many to many

Users.belongsToMany(Groups, { through: UserGroupRel });
Groups.belongsToMany(Users, { through: UserGroupRel });

/**
 * Controller for User Actions
 */
class UserController {

	/**
	 * Method List
	 * @param {Object} req Express Request Object
	 * @param {Object} res Express Response Object
	 */
	list = async (req, res) => {
		// Indhenter parametre fra request objekt
		const qp = QueryParamsHandle(req, 'id, firstname, lastname')

		// Eksekverer sequelize metode med management values
		try {
			const result = await Users.findAll({
				attributes: qp.attributes,
				order: [qp.sort_key],
				limit: qp.limit,
				include: {
					model: Org,
					attributes: ['id', 'name']
				},
				include: {
					model: Groups,
					attributes: ['id', 'name']
				}
			})
			// Udskriver resultat i json format
			res.json(result)				
		} catch (error) {
			res.status(418).send({
				message: `Could not get user list: ${error}`
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
				const result = await Users.findOne({
					attributes: [
						'id', 
						'firstname', 
						'lastname', 
						'email', 
						'is_active', 
						'createdAt', 
						'updatedAt'
					],
					where: { id: id }
				})
				// Udskriver resultat i json format
				res.json(result)				
			} catch (error) {
				res.status(418).send({
					message: `Could not get user details: ${error}`
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
		const { firstname, lastname, email, password, org_id, refresh_token, groups } = req.body;

		// Tjekker felt data
		if(firstname && lastname && email && password && org_id) {
			
			try {
				// Opretter record
				const model = await Users.create(req.body)

				if(groups) {
					groups.split(',').map(value => {
						const values = {
							group_id: +value,
							user_id: model.id
						}
						UserGroupRel.create(values)
						
					})
				}
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
		} else {
			res.status(403).send({
				message: 'Wrong parameter values'
			})
		}
	}

	update = async (req, res) => {
		const { id } = req.params
		// Destructure assignment af form data fra request body
		const { firstname, lastname, email, password, org_id, groups } = req.body;
		// Tjekker felt data
		if(id && firstname && lastname && email && password && org_id) {

			try {
				// Opretter record
				const model = await Users.update(req.body, {
					where: { id: id },
					individualHooks: true
				})

				if(groups) {
					groups.split(',').map(value => {
						const values = {
							group_id: +value,
							user_id: model.id
						}
						UserGroupRel.create(values)
						
					})
				}			
				// Sender nyt id som json object
				res.json({ 
					message: 'Record updated' 
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

	update_value = async (req, res) => {
		// Destructure assignment af id. 
		const { user_id, field, value } = req.body || 0
		// Tjekker felt data
		if(user_id, field, value) {
			try {
				const dataObj = {}
				dataObj[field] = value

				const model = await Users.update(dataObj,{ 
					where: { id: user_id },
					individualHooks: true
				})
				res.json({ 
					msg: 'Record update' 
				})
			} catch(error) {
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
		const { id } = req.params

		try {
			await Users.destroy({ 
				where: { id: id }
			})
			res.status(200).send({
				message: `Record deleted`
			})
		}
		catch(err) {
			res.status(403).send({
				message: 'Wrong parameter values'
			})
		}
	}	
}

export default UserController