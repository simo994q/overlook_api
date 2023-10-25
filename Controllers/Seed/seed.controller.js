import fs from 'fs'
import csv from 'csv-parser'
import path from 'path';
import sequelize from '../../Config/sequelize.config.js';

import Org from '../../Models/System/org.model.js';
import Group from '../../Models/System/group.model.js';
import User from '../../Models/System/user.model.js';
import UserGroupRel from '../../Models/System/user-group-rel.model.js';

import { Image } from '../../Models/image.model.js';
import Country from '../../Models/country.model.js';
import City from '../../Models/city.model.js';
import Hotel from '../../Models/hotel.model.js';
import Room from '../../Models/room.model.js';
import HotelFacility from '../../Models/hotel-facility.model.js';
import HotelFacilityRel from '../../Models/hotel-facility-rel.model.js';
import RoomFacility from '../../Models/room-facility.model.js';
import RoomFacilityCategory from '../../Models/room-facility-category.model.js';
import RoomFacilityRel from '../../Models/room-facility-rel.model.js';
import HotelRoomRel from '../../Models/hotel-room-rel.model.js';
import RoomImageRel from '../../Models/room-image-rel.model.js';
import UserReview from '../../Models/review.model.js';
import Reservation from '../../Models/reservation.model.js';
import News from '../../Models/news.model.js';

/**
 * Controller for Seed Actions
 */
class SeedController {
	constructor() {
		console.log('Class Seed Controller: Running seeds');
	} 

	seed_from_csv = async () => {

		const transaction = await sequelize.transaction();

		try {
			let data;
			let handle;
		
			// Orgs
			data = await this.get_csv_data('orgs.csv')
			handle = await Org.bulkCreate(data, { transaction });

			// Groups
			data = await this.get_csv_data('groups.csv')
			handle = await Group.bulkCreate(data, { transaction });

			// User
			data = await this.get_csv_data('users.csv')
			handle = await User.bulkCreate(data, { transaction });

			// User Groups Relations
			data = await this.get_csv_data('user_group_rel.csv')
			handle = await UserGroupRel.bulkCreate(data, { transaction });


			////////////////////////////////

			// Images
			data = await this.get_csv_data('images.csv')
			handle = await Image.bulkCreate(data, { transaction });

			// Countries
			data = await this.get_csv_data('countries.csv')
			handle = await Country.bulkCreate(data, { transaction });

			// Cities
			data = await this.get_csv_data('cities.csv')
			handle = await City.bulkCreate(data, { transaction });

			// Hotels
			data = await this.get_csv_data('hotels.csv')
			handle = await Hotel.bulkCreate(data, { transaction });

			// Hotel Facilities
			data = await this.get_csv_data('hotel_facilities.csv')
			handle = await HotelFacility.bulkCreate(data, { transaction });

			// Hotel Facility Relations
			data = await this.get_csv_data('hotel_facility_rel.csv')
			handle = await HotelFacilityRel.bulkCreate(data, { transaction });

			// Rooms
			data = await this.get_csv_data('rooms.csv')
			handle = await Room.bulkCreate(data, { transaction });

			// Room Facility Categories
			data = await this.get_csv_data('room_facility_categories.csv')
			handle = await RoomFacilityCategory.bulkCreate(data, { transaction });

			// Room Facilities
			data = await this.get_csv_data('room_facilities.csv')
			handle = await RoomFacility.bulkCreate(data, { transaction });

			// Room Facility Relations
			data = await this.get_csv_data('room_facility_rel.csv')
			handle = await RoomFacilityRel.bulkCreate(data, { transaction });

			// Room Image Relations
			data = await this.get_csv_data('room_image_rel.csv')
			handle = await RoomImageRel.bulkCreate(data, { transaction });

			// Hotel Room Relations
			data = await this.get_csv_data('hotel_room_rel.csv')
			handle = await HotelRoomRel.bulkCreate(data, { transaction });

			// Hotel Room Relations
			data = await this.get_csv_data('user_reviews.csv')
			handle = await UserReview.bulkCreate(data, { transaction });

			// User Reservations
			data = await this.get_csv_data('user_reservations.csv')
			handle = await Reservation.bulkCreate(data, { transaction });

			// News
			data = await this.get_csv_data('news.csv')
			handle = await News.bulkCreate(data, { transaction });

			// Confirm transaction
			await transaction.commit();
		
			console.log('Seeding completed');
		} catch (error) {
			// Hvis der opstår en fejl, rul tilbage transaktionen
			await transaction.rollback();
			console.error('Seeding error:', error);
		}		
	}

	get_csv_data = async file => {
		const csvpath = path.resolve(`./Data/${file}`);
		const data = []

		return new Promise((resolve, reject) => {
			fs.createReadStream(csvpath)
			.pipe(csv())
			.on('data', row => {
				data.push(row)
			})
			.on('end', async () => {
				resolve(data);
			})
			.on('error', error => {
				reject(error)
			})
		}) 

	}
}

export default SeedController