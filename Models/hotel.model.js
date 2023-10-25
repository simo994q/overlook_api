import sequelize from '../Config/sequelize.config.js'
import { DataTypes, Model } from 'sequelize'
import City from './city.model.js'
import { Image } from './image.model.js'

class Hotel extends Model {}

Hotel.init({
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
	teaser: {
		type: DataTypes.TEXT,
		allowNull: false
	},
	description: {
		type: DataTypes.TEXT,
		allowNull: false
	},
	address: {
		type: DataTypes.STRING,
		allowNull: false
	},
	city_id: {
		type: DataTypes.INTEGER,
		allowNull: false,
		references: {
			model: City,
			key: 'id'
		}
	},
	phone: {
		type: DataTypes.STRING,
		allowNull: false
	},
	num_stars: {
		type: DataTypes.INTEGER,
		allowNull: false
	},
	image_id: {
		type: DataTypes.INTEGER,
		allowNull: false,
		references: {
			model: Image,
			key: 'id'
		}
	}
},{
	sequelize,
	modelName: 'hotel',
	underscored: true,
})

export default Hotel