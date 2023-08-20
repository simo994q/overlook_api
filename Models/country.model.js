import sequelize from '../Config/sequelize.config.js'
import { DataTypes, Model } from 'sequelize'
import { Images } from './image.model.js'

class Countries extends Model{}

Countries.init({
	id: {
		type: DataTypes.INTEGER,
		autoIncrement: true,
		allowNull: false,
		primaryKey: true
	},
	name: {
		type: DataTypes.STRING,
		allowNull: false
	},
	slug: {
		type: DataTypes.STRING,
		allowNull: false
	},
	description: {
		type: DataTypes.TEXT,
		allowNull: false
	},
	image_id: {
		type: DataTypes.INTEGER,
		allowNull: false,
		references: {
			model: Images,
			key: 'id'
		}
	}
}, {
	sequelize,
	modelName: 'country',
	underscored: true,
})

export default Countries