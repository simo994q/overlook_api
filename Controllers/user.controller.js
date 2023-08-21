import Users from '../Models/user.model.js'
import Groups from '../Models/group.model.js'
import UserGroupRel from '../Models/user-group-rel.model.js'
import Orgs from '../Models/org.model.js'
import { QueryParamsHandle } from '../Middleware/helpers.js'

// Definerer relation mellem user og org - one to many
Orgs.hasMany(Users)
Users.belongsTo(Orgs)

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
		const result = await Users.findAll({
			attributes: qp.attributes,
			order: [qp.sort_key],
			limit: qp.limit,
			include: {
				model: Orgs,
				attributes: ['id', 'name']
			},
			include: {
				model: Groups,
				attributes: ['id', 'name']
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
			res.json({ newId: model.id })
		} else {
			res.sendStatus(418)
		}
	}

	update = async (req, res) => {
		// Destructure assignment af form data fra request body
		const { id, firstname, lastname, email, password, org_id, groups } = req.body;
		// Tjekker felt data
		if(id && firstname && lastname && email && password && org_id) {
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
				msg: 'Record update' 
			})
		} else {
			res.sendStatus(418)
		}	
	}

	update_value = async (req, res) => {
		// Destructure assignment af id. 
		const { user_id, field, value } = req.body || 0
		// Tjekker felt data
		if(user_id) {
			try {

				const dataObj = {}
				dataObj[field] = value

				const model = await Users.update(dataObj,{ 
					where: { id: user_id },
					individualHooks: true
				})
				console.log('Antal opdaterede rækker:', model);
	
			} catch(err) {
				console.log(`Error: ${err}`);
			}

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
			await Users.destroy({ 
				where: { id: id }
			})
			res.sendStatus(200)
		}
		catch(err) {
			res.send(err)
		}
	}	
}

export default UserController