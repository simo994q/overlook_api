import sequelize from '../Config/sequelize.config.js'
import { DataTypes, Model } from 'sequelize'
import User from './System/user.model.js'
import Hotel from './hotel.model.js'
import Room from './room.model.js'

class Reservation extends Model {}

export default Reservation.init({
	id: {
		type: DataTypes.INTEGER,
		autoIncrement: true,
		allowNull: false,
		primaryKey: true
	},
	user_id: {
		type: DataTypes.INTEGER,
		allowNull: false,
		references: {
			model: User,
			key: 'id'
		}
	},
	hotel_id: {
		type: DataTypes.INTEGER,
		allowNull: false,
		references: {
			model: Hotel,
			key: 'id'
		}
	},
	room_id: {
		type: DataTypes.INTEGER,
		allowNull: false,
		references: {
			model: Room,
			key: 'id'
		}
	},
	is_flex: {
		type: DataTypes.INTEGER,
		allowNull: false
	},
	num_persons: {
		type: DataTypes.INTEGER,
		allowNull: false
	},
	checkin: {
		type: DataTypes.DATE,
		allowNull: false
	},
	checkout: {
		type: DataTypes.DATE,
		allowNull: false
	},
	firstname: {
		type: DataTypes.STRING,
		allowNull: false
	},
	lastname: {
		type: DataTypes.STRING,
		allowNull: false
	},
	email: {
		type: DataTypes.STRING,
		allowNull: false
	},
	phone: {
		type: DataTypes.STRING,
		allowNull: false
	},
	comment: {
		type: DataTypes.TEXT,
		allowNull: false
	}
},{
	sequelize,
	modelName: 'reservation',
	underscored: true,
})