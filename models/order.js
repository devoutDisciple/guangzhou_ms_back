const Sequelize = require("sequelize");
module.exports = function(sequelize) {
	return sequelize.define("order", {
		id: {
			type: Sequelize.INTEGER(11),
			allowNull: false,
			primaryKey: true,
			autoIncrement: true
		},
		openid: {
			type: Sequelize.STRING(255),
			allowNull: false
		},
		people: {
			type: Sequelize.STRING(255),
			allowNull: false
		},
		phone: {
			type: Sequelize.STRING(255),
			allowNull: false
		},
		address: {
			type: Sequelize.STRING(255),
			allowNull: false
		},
		shopid: {
			type: Sequelize.INTEGER(11),
			allowNull: false
		},
		order_list: {
			type: Sequelize.STRING(10000),
			allowNull: false
		},
		send_price: {
			type: Sequelize.STRING(255),
			allowNull: false
		},
		package_cost: {
			type: Sequelize.STRING(255),
			allowNull: false
		},
		total_price: {
			type: Sequelize.STRING(255),
			allowNull: false
		},
		discount_price: {
			type: Sequelize.STRING(255),
			allowNull: false,
			defaultValue: "0"
		},
		desc: {
			type: Sequelize.STRING(45),
			allowNull: false
		},
		status: {
			type: Sequelize.STRING(45),
			allowNull: false,
			defaultValue: "1"
		},
		order_time: {
			type: Sequelize.DATE,
			allowNull: false
		},
		is_delete: {
			type: Sequelize.INTEGER(11),
			allowNull: false,
			defaultValue: "1"
		}
	}, {
		tableName: "order",
		timestamps: false
	});
};
