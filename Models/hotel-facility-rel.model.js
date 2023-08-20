import sequelize from "../Config/sequelize.config.js";
import { DataTypes, Model } from "sequelize";
import Hotels from "./hotel.model.js";
import HotelFacilities from "./hotel-facility.model.js";

class HotelFacilityRel extends Model{}

HotelFacilityRel.init({
	id: {
		type: DataTypes.INTEGER,
		autoIncrement: true,
		allowNull: false,
		primaryKey: true
	},
	hotel_id: {
		type: DataTypes.INTEGER,
		allowNull: false,
		references: {
			model: Hotels,
			key: 'id'
		}	
	},
	hotel_facility_id: {
		type: DataTypes.INTEGER,
		allowNull: false,
		references: {
			model: HotelFacilities,
			key: 'id'
		}	

	}
}, {
	sequelize,
	modelName: 'hotel_facility_rel',
	freezeTableName: true,
	underscored: true,
	timestamps: false
})

export default HotelFacilityRel