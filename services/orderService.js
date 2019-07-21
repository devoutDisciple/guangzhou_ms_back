const resultMessage = require("../util/resultMessage");
const sequelize = require("../dataSource/MysqlPoolClass");
const order = require("../models/order");
const orderModel = order(sequelize);
const user = require("../models/user");
const UserModel = user(sequelize);
orderModel.belongsTo(UserModel, { foreignKey: "openid", targetKey: "openid", as: "userDetail",});


module.exports = {
	// // 根据用户查询所有消费金额
	sumMoney: async (req, res) => {
		try {
			let openid = req.query.openid;
			let money = await orderModel.sum("total_price", {
				where: {
					openid
				}
			});
			console.log(money);
			if(!money) money = 0;
			return res.send(resultMessage.success(money));
		} catch (error) {
			console.log(error);
			return res.send(resultMessage.error([]));
		}
	},
	// 获取订单 通过 openid
	getListByOpenid: async (req, res) => {
		let openid = req.query.openid;
		try {
			let list = await orderModel.findAll({
				where: {
					openid: openid
				},
				order: [
					["order_time", "DESC"],
				]
			});
			let result = [];
			list.map(item => {
				let obj = {
					id: item.id,
					total_price: item.total_price,
					discount_price: item.discount_price,
					order_time: item.order_time,
					status: item.status,
				};
				result.push(obj);
			});
			res.send(resultMessage.success(result));
		} catch (error) {
			console.log(error);
			return res.send(resultMessage.error([]));
		}
	},

	// 增加订单
	addOrder: async (req, res) => {
		try {
			let body = req.body;
			let orderList = JSON.parse(body.orderList);
			console.log(orderList.length);
			await orderList.map(async (item) => {
				await orderModel.create({
					openid: body.openid,
					shop_detail: JSON.stringify(item.shopDetail),
					order_list: JSON.stringify(item.goods),
					desc: item.comment,
					total_price: item.totalPrice,
					order_time: (new Date()).getTime()
				});
			});
			return res.send(resultMessage.success([]));
		} catch (error) {
			console.log(error);
			return res.send(resultMessage.error([]));
		}
	},

	// 更改订单的状态
	updateStatus: async (req, res, params) => {
		// let body = req.body;
		try {
			// await evaluateModel.create(body);
			await orderModel.update({status: params.status}, {
				where: {
					id: params.orderid
				}
			});
			res.send(resultMessage.success([]));
		} catch (error) {
			console.log(error);
			return res.send(resultMessage.error([]));
		}
	},
	// 获取订单
	getAll: async (req, res) => {
		try {
			let list = await orderModel.findAll({
				include: [{
					model: UserModel,
					as: "userDetail",
				}],
				order: [
					["order_time", "DESC"],
				]
			});
			let result = [];
			list.map(item => {
				let obj = {
					id: item.id,
					total_price: item.total_price,
					discount_price: item.discount_price,
					order_time: item.order_time,
					status: item.status,
					openid: item.openid,
					username: item.userDetail.username,
					phone: item.userDetail.phone
				};
				result.push(obj);
			});
			res.send(resultMessage.success(result));
		} catch (error) {
			console.log(error);
			return res.send(resultMessage.error([]));
		}
	},
};
