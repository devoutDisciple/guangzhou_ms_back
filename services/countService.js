const resultMessage = require("../util/resultMessage");
const sequelize = require("../dataSource/MysqlPoolClass");
const Sequelize = require("sequelize");
const Op = Sequelize.Op;
const user = require("../models/user");
const userModel = user(sequelize);
const order = require("../models/order");
const orderModel = order(sequelize);
const shop = require("../models/shop");
const shopModel = shop(sequelize);

module.exports = {
	// 获取会员总量, 销售额，订单，商铺量
	getCount: async (req, res) => {
		try {
			// 获取用户数量
			let users = await userModel.count({
				where: {
					is_delete: {
						[Op.not]: ["2"]
					},
				}
			});
			let orders = await orderModel.count({
				where: {
					is_delete: {
						[Op.not]: ["2"]
					},
				}
			});
			let orderMoney = await orderModel.sum("total_price" ,{
				where: {
					is_delete: {
						[Op.not]: ["2"]
					},
				}
			});
			let shops = await shopModel.count({
				where: {
					is_delete: {
						[Op.not]: ["2"]
					},
				}
			});
			res.send(resultMessage.success({
				userNum: users,
				orders: orders,
				orderMoney: orderMoney,
				shops: shops
			}));
		} catch (error) {
			console.log(error);
			return res.send(resultMessage.error({}));
		}
	},

};
