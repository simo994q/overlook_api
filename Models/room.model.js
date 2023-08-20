import sequelize from '../Config/sequelize.config.js'
import { DataTypes, Model } from 'sequelize'

class Rooms extends Model {}

Rooms.init({
	id: {
		type: DataTypes.INTEGER,
		autoIncrement: true,
		allowNull: false,
		primaryKey: true
	},
	slug: {
		type: DataTypes.STRING,
		allowNull: false
	},
	title: {
		type: DataTypes.STRING,
		allowNull: false
	},
	description: {
		type: DataTypes.TEXT,
		allowNull: false
	},
	num_persons: {
		type: DataTypes.INTEGER,
		allowNull: false
	},
	area: {
		type: DataTypes.STRING,
		allowNull: false
	},
	day_price_normal: {
		type: DataTypes.INTEGER,
		allowNull: false
	},
	day_price_flex: {
		type: DataTypes.INTEGER,
		allowNull: false
	}
},{
	sequelize,
	modelName: 'room',
	underscored: true,
})

export default Rooms