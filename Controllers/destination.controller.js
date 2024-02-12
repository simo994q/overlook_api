import sequelize from '../Config/sequelize.config.js'
import Country from '../Models/country.model.js'
import City from '../Models/city.model.js'
import { Image } from '../Models/image.model.js'
import Hotel from '../Models/hotel.model.js'
import HotelRoomsRel from '../Models/hotel-room-rel.model.js'
import Room from '../Models/room.model.js'
import RoomFacility from '../Models/room-facility.model.js'
import RoomFacilityRel from '../Models/room-facility-rel.model.js'
import RoomImageRel from '../Models/room-image-rel.model.js'
import HotelFacility from '../Models/hotel-facility.model.js'
import HotelFacilityRel from '../Models/hotel-facility-rel.model.js'

// Definerer relation mellem hotel og image - one to many
Country.belongsTo(Image, { foreignKey: 'image_id', as: 'CountryImage' })
City.belongsTo(Image, { foreignKey: 'image_id', as: 'CityImage' })
Hotel.belongsTo(Image, { foreignKey: 'image_id', as: 'HotelImage' })

City.belongsTo(Country, { foreignKey: 'country_id' })
Country.hasMany(City)

City.hasMany(Hotel)
Hotel.belongsTo(City)

Hotel.belongsToMany(Room, { through: HotelRoomsRel });
Room.belongsToMany(Hotel, { through: HotelRoomsRel });

Hotel.belongsToMany(HotelFacility, { through: HotelFacilityRel })
HotelFacility.belongsToMany(Hotel, { through: HotelFacilityRel })

Room.belongsToMany(RoomFacility, { through: RoomFacilityRel })
RoomFacility.belongsToMany(Room, { through: RoomFacilityRel })

Room.belongsToMany(Image, { through: RoomImageRel })
Image.belongsToMany(Room, { through: RoomImageRel })



/**
 * Controller foc City Actions
 */
export default class DestinationController {

	/**
	 * Method for list of destination countries
	 * @param {Object} req Express Request Object
	 * @param {Object} res Express Response Object
	 */
	list = async (req, res) => {

		try {
			// Eksekverer sequelize metode med management values
			const result = await Country.findAll({
				attributes: ['id', 'slug', 'name', 'description'],
				include: [{
					model: Image,
					attributes: [
						['filename', 'country_image_filename'],
						['title', 'country_image_title']
					],
					as: 'CountryImage'
				}]
			})
			// Udskriver resultat i json format
			res.json(result)
	} catch(err) {
		res.status(418).send({
			message: `Something went wrong: ${err}`
		})
	}
	}

	/**
	 * Method for destination details
	 * Takes slugs as identifiers for country, city and hotel
	 * Builds the queries from the params structure
	 * @param {*} req 
	 * @param {*} res 
	 * @returns data array
	 */
	details = async (req, res) => {
		// Divides params string into an array
		const arrParams = req.params.destination.split('/')

		// Builds queries from array length
		// 1: Country details with city list
		// 2: Country & city details with hotel list
		// 3: Country, city & hotel details with room list
		if(arrParams.length === 1) {
			const [ country ] = arrParams

			const result = await Country.findOne({
				attributes: [
					['id', 'country_id'], 
					'slug', 
					'name', 
					'description'
				],
				include: [{
					model: Image,
					attributes: [
						['filename', 'country_image_filename'],
						['title', 'country_image_title']
					],
					as: 'CountryImage'
				},
				{
					model: City,
					attributes: [
						['id', 'city_id'], 
						'slug', 
						'name', 
						'image_id'
					],
					include: {
						model: Image,
						attributes: [
							['filename', 'city_image_filename'],
							['title', 'city_image_title']
						],
						as: 'CityImage'
					}
						
				}],
				where: { slug: country }	
			})
			return res.json(result)
		}

		// 2: Country & city details with hotel list
		if(arrParams.length === 2) {
			const [ country, city ] = arrParams

			const result = await Country.findOne({
				attributes: [
					['id', 'country_id'], 
					'slug', 
					'name', 
					'description'
				],
				include: [{
					model: Image,
					attributes: [
						['filename', 'country_image_filename'],
						['title', 'country_image_title'],
					],
					as: 'CountryImage'
				},
				{
					model: City,
					attributes: [
						['id', 'city_id'], 
						'slug', 
						'name',
						'description'
					],
					include: [{
						model: Image,
						attributes: [
							['filename', 'city_image_filename'],
							['title', 'city_image_title']
						],
						as: 'CityImage'
					}, {
						model: Hotel,
						attributes: [
							['id', 'hotel_id'], 
							'slug', 
							'title'
						],
						include: {
							model: Image,
							attributes: [
								['filename', 'hotel_image_filename'],
								['title', 'hotel_image_title']
							],
							as: 'HotelImage'
						}
					}],
					where: { slug: city }
						
				}],
				where: { slug: country }	
			})
			return res.json(result)
		}

		// 3: Country, city & hotel details with room list
		if(arrParams.length === 3) {
			const [ country, city, hotel ] = arrParams

			const result = await Country.findOne({
				attributes: [
					['id', 'country_id'], 
					'slug', 
					'name', 
					'description'
				],
				include: [{
					model: Image,
					attributes: [
						['filename', 'country_image_filename'],
						['title', 'country_image_title']
					],
					as: 'CountryImage'
				},
				{
					model: City,
					attributes: [
						['id', 'city_id'], 
						'slug', 
						'name',
						'description'

					],
					include: [{
						model: Image,
						attributes: [
							['filename', 'city_image_filename'],
							['title', 'city_image_title']
						],
						as: 'CityImage'
					}, {
						model: Hotel,
						attributes: [
							['id', 'hotel_id'], 
							'slug', 
							'title',
							'description',
							"address",
							"phone"

						],
						include: [{
							model: Image,
							attributes: [
								['filename', 'hotel_image_filename'],
								['title', 'hotel_image_title']
							],
							as: 'HotelImage'
						}, {
							model: HotelFacility,
							attributes: [
								'title'
							]
						
						}, {
							model: Room,
							attributes: [
								['id', 'room_id'], 
								'title', 
								'description', 
								'num_persons', 
								'area', 
								'day_price_normal', 
								'day_price_flex',
							],
							include: [
								{
									model: Image,
									attributes: [
										"filename",
										"title"
									]
								}
							]
						}],
						where: { slug: hotel }
					}],
					where: { slug: city }
				}],
				where: { slug: country }	
			})
			return res.json(result)
		}

		// 4: Country, city, hotel and room details
		if(arrParams.length === 4) {
			const [ country, city, hotel, room ] = arrParams

			const result = await Country.findOne({
				attributes: [
					['id', 'country_id'], 
					'slug', 
					'name', 
					'description'
				],
				include: [{
					model: Image,
					attributes: [
						['filename', 'country_image_filename'],
						['title', 'country_image_title']
					],
					as: 'CountryImage'
				},
				{
					model: City,
					attributes: [
						['id', 'city_id'], 
						'slug', 
						'name',
						'description'

					],
					include: [{
						model: Image,
						attributes: [
							['filename', 'city_image_filename'],
							['title', 'city_image_title']
						],
						as: 'CityImage'
					}, {
						model: Hotel,
						attributes: [
							['id', 'hotel_id'], 
							'slug', 
							'title',
							'description'

						],
						include: [{
							model: Image,
							attributes: [
								['filename', 'hotel_image_filename'],
								['title', 'hotel_image_title']
							],
							as: 'HotelImage'
						}, {
							model: HotelFacility,
							attributes: [
								'title'
							]
						
						}, {
							model: Room,
							attributes: [
								['id', 'room_id'], 
								'title', 
								'description', 
								'num_persons', 
								'area', 
								'day_price_normal', 
								'day_price_flex'
							],
							include: [{
								model: RoomFacility,
									attributes: [
										'title'
									]
								},
							],
							where: { slug: room }
						}],
						where: { slug: hotel }
					}],
					where: { slug: city }
				}],
				where: { slug: country }	
			})
			return res.json(result)
		}
	}
}