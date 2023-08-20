import sequelize from '../Config/sequelize.config.js'
import { DataTypes, Model } from 'sequelize'
import Users from './user.model.js'
import Hotels from './hotel.model.js'

class UserReviews extends Model {}

UserReviews.init({
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
			model: Users,
			key: 'id'
		}
	},
	hotel_id: {
		type: DataTypes.INTEGER,
		allowNull: false,
		references: {
			model: Hotels,
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

export default UserReviews