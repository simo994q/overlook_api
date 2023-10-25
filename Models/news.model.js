import sequelize from '../Config/sequelize.config.js'
import { DataTypes, Model } from 'sequelize'
import { Image } from './image.model.js'

class News extends Model{}

News.init({
	id: {
		type: DataTypes.INTEGER,
		autoIncrement: true,
		allowNull: false,
		primaryKey: true
	},
	image_id: {
		type: DataTypes.INTEGER,
		allowNull: false,
		references: {
			model: Image,
			key: 'id'
		}
	},
	datetime: {
		type: DataTypes.INTEGER,
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
	content: {
		type: DataTypes.TEXT,
		allowNull: false
	}
}, {
	sequelize,
	modelName: 'news',
	underscored: true,
})

export default News