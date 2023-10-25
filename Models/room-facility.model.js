import sequelize from '../Config/sequelize.config.js'
import { DataTypes, Model } from 'sequelize'
import RoomFacilityCategory from './room-facility-category.model.js'

class RoomFacility extends Model{}

RoomFacility.init({
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
	room_facility_category_id: {
		type: DataTypes.INTEGER,
		allowNull: false,
		references: {
			model: RoomFacilityCategory,
			key: 'id'
		}
	}
}, {
	sequelize,
	modelName: 'room_facility',
	underscored: true,
})

export default RoomFacility