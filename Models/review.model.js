import sequelize from '../Config/sequelize.config.js'
import { DataTypes, Model } from 'sequelize'
import User from './System/user.model.js'
import Hotel from './hotel.model.js'

class UserReview extends Model {}

UserReview.init({
	id: {
		type: DataTypes.INTEGER,
		autoIncrement: true,
		allowNull: false,
		primaryKey: true
	},
	title: {
		type: DataTypes.STRING,
		allowNull: false
	},
	comment: {
		type: DataTypes.TEXT,
		allowNull: false
	},
	num_stars: {
		type: DataTypes.INTEGER,
		allowNull: false
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
	is_active: {
		type: DataTypes.BOOLEAN,
		allowNull: false
	}		
},{
	sequelize,
	modelName: 'user_review',
	underscored: true,
})

export default UserReview