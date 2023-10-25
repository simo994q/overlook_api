import sequelize from "../../Config/sequelize.config.js";
import { DataTypes, Model } from "sequelize";
import User from "./user.model.js";
import Group from "./group.model.js";

class UserGroupRel extends Model{}

UserGroupRel.init({
	id: {
		type: DataTypes.INTEGER,
		autoIncrement: true,
		allowNull: false,
		primaryKey: true
	},
	group_id: {
		type: DataTypes.INTEGER,
		allowNull: false,
		references: {
			model: Group,
			key: 'id'
		}	
	},
	user_id: {
		type: DataTypes.INTEGER,
		allowNull: false,
		references: {
			model: User,
			key: 'id'
		}	

	}
}, {
	sequelize,
	modelName: 'user_group_rel',
	freezeTableName: true,
	timestamps: false,
	underscored: true
})

export default UserGroupRel