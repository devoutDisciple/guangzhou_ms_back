const Sequelize = require("sequelize");
module.exports = function(sequelize) {
	return sequelize.define("order", {
		id: {
			type: Sequelize.INTEGER(11),
			allowNull: false,
			primaryKey: true
		},
		openid: {
			type: Sequelize.STRING(255),
			allowNull: true
		},
		people: {
			type: Sequelize.STRING(255),
			allowNull: true
		},
		phone: {
			type: Sequelize.STRING(255),
			allowNull: true
		},
		address: {
			type: Sequelize.STRING(255),
			allowNull: true
		},
		shopid: {
			type: Sequelize.INTEGER(11),
			allowNull: true
		},
		order_list: {
			type: Sequelize.STRING(10000),
			allowNull: true
		},
		send_price: {
			type: Sequelize.STRING(255),
			allowNull: true
		},
		package_cost: {
			type: Sequelize.STRING(255),
			allowNull: true
		},
		total_price: {
			type: Sequelize.STRING(255),
			allowNull: true
		},
		discount_price: {
			type: Sequelize.STRING(255),
			allowNull: true,
			defaultValue: "0"
		},
		desc: {
			type: Sequelize.STRING(45),
			allowNull: true
		},
		print: {
			type: Sequelize.INTEGER(255),
			allowNull: true,
			defaultValue: "1"
		},
		status: {
			type: Sequelize.STRING(45),
			allowNull: true,
			defaultValue: "1"
		},
		order_time: {
			type: Sequelize.DATE,
			allowNull: true
		},
		is_delete: {
			type: Sequelize.INTEGER(11),
			allowNull: true,
			defaultValue: "1"
		}
	}, {
		tableName: "order",
		timestamps: false
	});
};
