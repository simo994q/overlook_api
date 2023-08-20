import sequelize from '../Config/sequelize.config.js'
import { DataTypes, Model } from 'sequelize'
import Users from './user.model.js'
import Hotels from './hotel.model.js'

class UserRatings extends Model {}

UserRatings.init({
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
	num_stars: {
		type: DataTypes.INTEGER,
		allowNull: false
	},
	comment: {
		type: DataTypes.STRING,
		allowNull: false
	}
},{
	sequelize,
	modelName: 'user_rating',
	underscored: true,
})

export default UserRatings