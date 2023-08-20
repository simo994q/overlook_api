import sequelize from '../Config/sequelize.config.js'
import { DataTypes, Model } from 'sequelize'

class RoomFacilityCategory extends Model{}

RoomFacilityCategory.init({
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
	modelName: 'room_facility_category',
	underscored: true,
})

export default RoomFacilityCategory