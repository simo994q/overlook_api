import sequelize from "../Config/sequelize.config.js";
import { DataTypes, Model } from "sequelize";
import HotelFacility from "./hotel-facility.model.js";
import Room from "./room.model.js";

class RoomFacilityRel extends Model{}

RoomFacilityRel.init({
	id: {
		type: DataTypes.INTEGER,
		autoIncrement: true,
		allowNull: false,
		primaryKey: true
	},
	room_id: {
		type: DataTypes.INTEGER,
		allowNull: false,
		references: {
			model: Room,
			key: 'id'
		}	
	},
	room_facility_id: {
		type: DataTypes.INTEGER,
		allowNull: false,
		references: {
			model: HotelFacility,
			key: 'id'
		}	
	}

}, {
	sequelize,
	modelName: 'room_facility_rel',
	freezeTableName: true,
	underscored: true,
	timestamps: false,
})

export default RoomFacilityRel