import sequelize from '../Config/sequelize.config.js'
import { DataTypes, Model } from 'sequelize'
import { Images } from './image.model.js'
import Rooms from './room.model.js'

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
			model: Rooms,
			key: 'id'
		}
	},
	image_id: {
		type: DataTypes.INTEGER,
		allowNull: false,
		references: {
			model: Images,
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