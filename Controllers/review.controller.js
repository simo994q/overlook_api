import dotenv from "dotenv" // Credentials
import Hotels from '../Models/hotel.model.js'
import UserReviews from '../Models/review.model.js'
import Users from '../Models/user.model.js'
import jwt from "jsonwebtoken"
import sequelize from "../Config/sequelize.config.js"

dotenv.config()

// Definerer relation mellem reservation og bruger
Users.hasMany(UserReviews)
UserReviews.belongsTo(Users)

// Definerer relation mellem reservation og hotel
Hotels.hasMany(UserReviews)
UserReviews.belongsTo(Hotels)

/**
 * Controller for Org Actions
 */
class ReviewController {

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
		const attr = attributes ? attributes.split(',') : new Array('id', 'title', 'created_at')

		// Eksekverer sequelize metode med management values
		const result = await UserReviews.findAll({
			attributes: attr,
			order: [order],
			limit: limit,
			include: {
				model: Users,
				attributes: ['firstname', 'lastname', 'email']
			}
		})
		// Udskriver resultat i json format
		res.json(result)
	}

	/**
	 * Method List By Hotel
	 * @param {Object} req Express Request Object
	 * @param {Object} res Express Response Object
	 */
	list_by_hotel = async (req, res) => {
		// Destructure Assignment - get hotel_id from url params
		const { hotel_id } = req.params
		// Destructure Assignment - optional list management
		let { sortkey, sortdir, limit, attributes } = req.query
		// Sætter array til sort og retning
		const order = [sortkey ? sortkey : 'id']
		order.push(sortdir || 'ASC')
		// Sætter limit antal
		limit = parseInt(limit) || 1000
		// Sætter attributter (table felter)
		const attr = attributes ? attributes.split(',') : new Array('id', 'title', 'created_at')

		// Eksekverer sequelize metode med management values
		const result = await UserReviews.findAll({
			attributes: attr,
			order: [order],
			limit: limit,
			include: {
				model: Users,
				attributes: ['firstname', 'lastname', 'email']
			},
			where: { hotel_id: hotel_id }
		})
		// Udskriver resultat i json format
		res.json(result)
	}

	/**
	 * Method Calculate
	 * Calculates the average number of stars 
	 * @param {Object} req Express Request Object
	 * @param {Object} res Express Response Object
	 */
	average_by_hotel = async (req, res) => {
		// Destructure assignment af id. 
		const { hotel_id } = req.params
		// Eksekverer sequelize metode med attributter og where clause

		const result = await UserReviews.findOne({
			attributes: [
				[sequelize.fn('SUM', sequelize.col('num_stars')), 'stars'],
				[sequelize.fn('COUNT', sequelize.col('user_id')), 'users'],
				[sequelize.literal('SUM(num_stars) / COUNT(user_id)'), 'average_num_stars']
			],
			where: { hotel_id: hotel_id }
		})
		// Udskriver resultat i json format
		console.log(result);
		res.json(result)
	}

	/**
	 * Method Create
	 * @param {Object} req Express Request Object
	 * @param {Object} res Express Response Object
	 */
	create = async (req, res) => {
		// Henter access token fra auth header
		const bearerHeader = req.headers["authorization"]
		const access_token = bearerHeader.substr(7) // Remove "Bearer "

		// Decode token str
        const { id: user_id } = jwt.decode(
            access_token,
            process.env.TOKEN_REFRESH_KEY
    	).data

		// Destructure assignment af form data fra request body
		const { hotel_id, title, comment, num_stars, is_active  } = req.body;

		// Tjekker felt data
		if(user_id && hotel_id && title && comment && num_stars && is_active) {
			const formdata = {
				user_id: user_id,
				hotel_id: hotel_id,
				title: title,
				comment: comment,
				num_stars: num_stars,
				is_active: is_active,
			}
	
			// Opretter record
			const model = await UserReviews.create(formdata)
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
		const { name, address, zipcode, city, country } = req.body;
		// Tjekker felt data
		if(id && name && address && zipcode && city) {
			// Opretter record
			const model = await UserRatings.update(req.body, {
				where: { id: id },
				individualHooks: true
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
			await UserReviews.destroy({ 
				where: { id: id }
			})
			res.sendStatus(200)
		}
		catch(err) {
			res.send(err)
		}
	}		
}

export default ReviewController