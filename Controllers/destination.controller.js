import sequelize from '../Config/sequelize.config.js'
import Countries from '../Models/country.model.js'
import Cities from '../Models/city.model.js'
import { Images } from '../Models/image.model.js'
import Hotels from '../Models/hotel.model.js'
import HotelRoomsRel from '../Models/hotel-room-rel.model.js'
import Rooms from '../Models/room.model.js'
import RoomFacilities from '../Models/room-facility.model.js'
import RoomFacilityRel from '../Models/room-facility-rel.model.js'
import RoomImageRel from '../Models/room-image-rel.model.js'
import HotelFacilities from '../Models/hotel-facility.model.js'
import HotelFacilityRel from '../Models/hotel-facility-rel.model.js'

// Definerer relation mellem hotel og image - one to many
Countries.belongsTo(Images, { foreignKey: 'image_id', as: 'CountryImage' })
Cities.belongsTo(Images, { foreignKey: 'image_id', as: 'CityImage' })
Hotels.belongsTo(Images, { foreignKey: 'image_id', as: 'HotelImage' })

Cities.belongsTo(Countries, { foreignKey: 'country_id' })
Countries.hasMany(Cities)

Cities.hasMany(Hotels)
Hotels.belongsTo(Cities)

Hotels.belongsToMany(Rooms, { through: HotelRoomsRel });
Rooms.belongsToMany(Hotels, { through: HotelRoomsRel });

Hotels.belongsToMany(HotelFacilities, { through: HotelFacilityRel })
HotelFacilities.belongsToMany(Hotels, { through: HotelFacilityRel })

Rooms.belongsToMany(RoomFacilities, { through: RoomFacilityRel })
RoomFacilities.belongsToMany(Rooms, { through: RoomFacilityRel })

Rooms.belongsToMany(Images, { through: RoomImageRel })
Images.belongsToMany(Rooms, { through: RoomImageRel })



/**
 * Controller foc City Actions
 */
class DestinationController {

	/**
	 * Method for list of destination countries
	 * @param {Object} req Express Request Object
	 * @param {Object} res Express Response Object
	 */
	list = async (req, res) => {
		// Eksekverer sequelize metode med management values
		const result = await Countries.findAll({
			attributes: ['id', 'slug', 'name', 'description'],
			include: [{
				model: Images,
				attributes: [
					['filename', 'country_image_filename'],
					['title', 'country_image_title']
				],
				as: 'CountryImage'
			}]
		})
		// Udskriver resultat i json format
		res.json(result)
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

			const result = await Countries.findOne({
				attributes: [
					['id', 'country_id'], 
					'slug', 
					'name', 
					'description'
				],
				include: [{
					model: Images,
					attributes: [
						['filename', 'country_image_filename'],
						['title', 'country_image_title']
					],
					as: 'CountryImage'
				},
				{
					model: Cities,
					attributes: [
						['id', 'city_id'], 
						'slug', 
						'name', 
						'image_id'
					],
					include: {
						model: Images,
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

			const result = await Countries.findOne({
				attributes: [
					['id', 'country_id'], 
					'slug', 
					'name', 
					'description'
				],
				include: [{
					model: Images,
					attributes: [
						['filename', 'country_image_filename'],
						['title', 'country_image_title'],
					],
					as: 'CountryImage'
				},
				{
					model: Cities,
					attributes: [
						['id', 'city_id'], 
						'slug', 
						'name',
						'description'
					],
					include: [{
						model: Images,
						attributes: [
							['filename', 'city_image_filename'],
							['title', 'city_image_title']
						],
						as: 'CityImage'
					}, {
						model: Hotels,
						attributes: [
							['id', 'hotel_id'], 
							'slug', 
							'title'
						],
						include: {
							model: Images,
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

			const result = await Countries.findOne({
				attributes: [
					['id', 'country_id'], 
					'slug', 
					'name', 
					'description'
				],
				include: [{
					model: Images,
					attributes: [
						['filename', 'country_image_filename'],
						['title', 'country_image_title']
					],
					as: 'CountryImage'
				},
				{
					model: Cities,
					attributes: [
						['id', 'city_id'], 
						'slug', 
						'name',
						'description'

					],
					include: [{
						model: Images,
						attributes: [
							['filename', 'city_image_filename'],
							['title', 'city_image_title']
						],
						as: 'CityImage'
					}, {
						model: Hotels,
						attributes: [
							['id', 'hotel_id'], 
							'slug', 
							'title',
							'description'

						],
						include: [{
							model: Images,
							attributes: [
								['filename', 'hotel_image_filename'],
								['title', 'hotel_image_title']
							],
							as: 'HotelImage'
						}, {
							model: HotelFacilities,
							attributes: [
								'title'
							]
						
						}, {
							model: Rooms,
							attributes: [
								['id', 'room_id'], 
								'title', 
								'description', 
								'num_persons', 
								'area', 
								'day_price_normal', 
								'day_price_flex'
							],
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

			const result = await Countries.findOne({
				attributes: [
					['id', 'country_id'], 
					'slug', 
					'name', 
					'description'
				],
				include: [{
					model: Images,
					attributes: [
						['filename', 'country_image_filename'],
						['title', 'country_image_title']
					],
					as: 'CountryImage'
				},
				{
					model: Cities,
					attributes: [
						['id', 'city_id'], 
						'slug', 
						'name',
						'description'

					],
					include: [{
						model: Images,
						attributes: [
							['filename', 'city_image_filename'],
							['title', 'city_image_title']
						],
						as: 'CityImage'
					}, {
						model: Hotels,
						attributes: [
							['id', 'hotel_id'], 
							'slug', 
							'title',
							'description'

						],
						include: [{
							model: Images,
							attributes: [
								['filename', 'hotel_image_filename'],
								['title', 'hotel_image_title']
							],
							as: 'HotelImage'
						}, {
							model: HotelFacilities,
							attributes: [
								'title'
							]
						
						}, {
							model: Rooms,
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
								model: RoomFacilities,
								attributes: ['title']
							},
			{
								model: RoomFacilities,
								attributes: ['title']
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

export default DestinationController