const Sequelize = require("sequelize");
module.exports = function(sequelize) {
	return sequelize.define("account", {
		id: {
			type: Sequelize.INTEGER(11),
			allowNull: false,
			primaryKey: true,
			autoIncrement: true
		},
		username: {
			type: Sequelize.STRING(255),
			allowNull: true,
			primaryKey: true
		},
		password: {
			type: Sequelize.STRING(255),
			allowNull: true,
			primaryKey: true
		},
		shopid: {
			type: Sequelize.INTEGER(11),
			allowNull: true,
		},
		role: {
			type: Sequelize.INTEGER(10),
			allowNull: true,
			defaultValue: "2"
		},
		is_delete: {
			type: Sequelize.INTEGER(11),
			allowNull: true,
			defaultValue: "1"
		}
	}, {
		tableName: "account",
		timestamps: false
	});
};
