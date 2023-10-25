import sequelize from '../Config/sequelize.config.js'
import { DataTypes, Model } from 'sequelize'

class Image extends Model{}

Image.init({
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
	filename: {
		type: DataTypes.STRING,
		allowNull: false
	}
}, {
	sequelize,
	modelName: 'image',
	underscored: true,
})

export { Image }