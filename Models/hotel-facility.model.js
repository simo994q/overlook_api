import sequelize from '../Config/sequelize.config.js'
import { DataTypes, Model } from 'sequelize'

class HotelFacility extends Model{}

HotelFacility.init({
	id: {
		type: DataTypes.INTEGER,
		autoIncrement: true,
		allowNull: false,
		primaryKey: true
	},
	title: {
		type: DataTypes.STRING,
		allowNull: false
	}
}, {
	sequelize,
	modelName: 'hotel_facility',
	underscored: true,
})

export default HotelFacility