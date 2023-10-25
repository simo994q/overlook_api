import sequelize from '../Config/sequelize.config.js'
import { DataTypes, Model } from 'sequelize'
import { Image } from './image.model.js'
import Room from './room.model.js'

class RoomImageRel extends Model {}

RoomImageRel.init({
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
	image_id: {
		type: DataTypes.INTEGER,
		allowNull: false,
		references: {
			model: Image,
			key: 'id'
		}
	},
	order_num: {
		type: DataTypes.INTEGER,
		allowNull: false
	}
},{
	sequelize,
	modelName: 'room_image_rel',
	freezeTableName: true,
	underscored: true,
	timestamps: false
})

export default RoomImageRel