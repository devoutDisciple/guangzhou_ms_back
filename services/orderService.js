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

	// 获取订单 通过商店id
	getListByShopid: async (req, res) => {
		let shopid = req.query.shopid;
		try {
			let list = await orderModel.findAll({
				where: {
					shopid: shopid
				},
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
				// let address = JSON.parse(item.userDetail.address) || [];
				// let userAddress = "";
				// address.map(point => {
				// 	if(point.default) userAddress = `${point.campus} ${point.floor}`;
				// });
				let obj = {
					id: item.id,
					total_price: item.total_price,
					discount_price: item.discount_price,
					order_time: item.order_time,
					status: item.status,
					username: item.userDetail.username,
					people: item.people,
					phone: item.phone,
					address: item.address,
					userPhone: item.userDetail.phone,
					orderList: item.order_list
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
	updateStatus: async (req, res) => {
		let body = req.body;
		try {
			await orderModel.update({status: body.status}, {
				where: {
					id: body.id
				}
			});
			res.send(resultMessage.success("success"));
		} catch (error) {
			console.log(error);
			return res.send(resultMessage.error([]));
		}
	},

	// 批量更改订单状态
	updateMoreStatus: async (req, res) => {
		let body = req.body;
		let data = body.data;
		try {
			await orderModel.bulkCreate( data, {updateOnDuplicate: ["status"]});
			res.send(resultMessage.success("success"));
		} catch (error) {
			console.log(error);
			return res.send(resultMessage.error([]));
		}
	},

	// 获取订单 所有订单
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

	// 获取商店的数据汇总
	getDataByShopid: async (req, res) => {
		let shopid = req.query.shopid;
		try {
			// 订单总量
			let orderNum = await orderModel.count({
				where: {
					shopid: shopid
				}
			});
			let orderPrice = await orderModel.sum("total_price", {
				where: {
					shopid: shopid
				}
			});
			// 今天订单数据汇总
			let todayNum = await sequelize.query("select count(id) as count from `order` where to_days(order_time) = to_days(now()) and shopid = ?",
				{ replacements: [shopid], type: sequelize.QueryTypes.SELECT });
			let todayMoney = await sequelize.query("select sum(total_price) as count from `order` where to_days(order_time) = to_days(now()) and shopid = ?",
				{ replacements: [shopid], type: sequelize.QueryTypes.SELECT });
			res.send(resultMessage.success({orderNum, orderPrice, todayNum, todayMoney}));
		} catch (error) {
			console.log(error);
			return res.send(resultMessage.error([]));
		}
	},

	// 获取全部的数据汇总
	getData: async (req, res) => {
		try {
			// 订单总量
			let orderNum = await orderModel.count();
			let orderPrice = await orderModel.sum("total_price");
			// 今天订单数据汇总
			let todayNum = await sequelize.query("select count(id) as count from `order` where to_days(order_time) = to_days(now())",
				{ type: sequelize.QueryTypes.SELECT });
			let todayMoney = await sequelize.query("select sum(total_price) as count from `order` where to_days(order_time) = to_days(now())",
				{ type: sequelize.QueryTypes.SELECT });
			res.send(resultMessage.success({orderNum, orderPrice, todayNum, todayMoney}));
		} catch (error) {
			console.log(error);
			return res.send(resultMessage.error([]));
		}
	},

	// 获取全部商店销售数量的汇总
	getSales: async (req, res) => {
		let type = req.query.type;
		// type可能为 1-本周数据 2-本月数据 3-全部数据
		let str = "";
		// 查询过去七天，以天为单位
		if(type == 1) {
			str = "select DATE_FORMAT(order_time,'%Y-%m-%d') days, count(id) count from `order` where DATE_SUB(CURDATE(), INTERVAL 7 DAY) <= date(order_time) group by days order by days DESC;";
		}
		// 查询过去一个月，以天为单位
		if(type == 2) {
			str = "select DATE_FORMAT(order_time,'%Y-%m-%d') days, count(id) count from `order` WHERE DATE_FORMAT(order_time, '%Y%m' ) = DATE_FORMAT(CURDATE( ),'%Y%m') group by days order by days DESC;";
		}
		// 查询全部数据
		if(type == 3) str = "select DATE_FORMAT(order_time,'%Y-%m-%d') days, count(id) count from `order` group by days order by days DESC;";
		try {
			sequelize.query(str, { type: sequelize.QueryTypes.SELECT }).then(function(projects) {
				res.send(resultMessage.success(projects));
			});
		} catch (error) {
			console.log(error);
			return res.send(resultMessage.error([]));
		}
	},

	// 获取商店销售数量的汇总
	getSalesByShopid: async (req, res) => {
		let shopid = req.query.shopid;
		let type = req.query.type;
		// type可能为 1-本周数据 2-本月数据 3-全部数据
		let str = "";
		// 查询过去七天，以天为单位
		if(type == 1) {
			str = "select DATE_FORMAT(order_time,'%Y-%m-%d') days, count(id) count from `order` where DATE_SUB(CURDATE(), INTERVAL 7 DAY) <= date(order_time) and shopid=? group by days order by days DESC;";
		}
		// 查询过去一个月，以天为单位
		if(type == 2) {
			str = "select DATE_FORMAT(order_time,'%Y-%m-%d') days, count(id) count from `order` WHERE DATE_FORMAT(order_time, '%Y%m' ) = DATE_FORMAT(CURDATE( ),'%Y%m') and shopid=? group by days order by days DESC;";
		}
		// 查询全部数据
		if(type == 3) str = "select DATE_FORMAT(order_time,'%Y-%m-%d') days, count(id) count from `order` where shopid = ? group by days order by days DESC;";
		try {
			sequelize.query(str, { replacements: [shopid], type: sequelize.QueryTypes.SELECT }).then(function(projects) {
				res.send(resultMessage.success(projects));
			});
		} catch (error) {
			console.log(error);
			return res.send(resultMessage.error([]));
		}
	},

	// 获取全部的销售额的数据汇总
	getMoney: async (req, res) => {
		let type = req.query.type;
		// type可能为 1-本周数据 2-本月数据 3-全部数据
		let str = "";
		// 查询过去七天，以天为单位
		if(type == 1) {
			str = "select DATE_FORMAT(order_time,'%Y-%m-%d') days, sum(total_price) as money from `order` where DATE_SUB(CURDATE(), INTERVAL 7 DAY) <= date(order_time) group by days order by days DESC;";
		}
		// 查询过去一个月，以天为单位
		if(type == 2) {
			str = "select DATE_FORMAT(order_time,'%Y-%m-%d') days, sum(total_price) as money from `order` WHERE DATE_FORMAT(order_time, '%Y%m' ) = DATE_FORMAT(CURDATE( ),'%Y%m') group by days order by days DESC;";
		}
		// 查询全部数据
		if(type == 3) str = "select DATE_FORMAT(order_time,'%Y-%m-%d') days, sum(total_price) as money from `order` group by days order by days DESC;";
		try {
			sequelize.query(str, { type: sequelize.QueryTypes.SELECT }).then(function(projects) {
				res.send(resultMessage.success(projects));
			});
		} catch (error) {
			console.log(error);
			return res.send(resultMessage.error([]));
		}
	},

	// 获取商店销售额的数据汇总
	getMoneyByShopid: async (req, res) => {
		let shopid = req.query.shopid;
		let type = req.query.type;
		// type可能为 1-本周数据 2-本月数据 3-全部数据
		let str = "";
		// 查询过去七天，以天为单位
		if(type == 1) {
			str = "select DATE_FORMAT(order_time,'%Y-%m-%d') days, sum(total_price) as money from `order` where DATE_SUB(CURDATE(), INTERVAL 7 DAY) <= date(order_time) and shopid=? group by days order by days DESC;";
		}
		// 查询过去一个月，以天为单位
		if(type == 2) {
			str = "select DATE_FORMAT(order_time,'%Y-%m-%d') days, sum(total_price) as money from `order` WHERE DATE_FORMAT(order_time, '%Y%m' ) = DATE_FORMAT(CURDATE( ),'%Y%m') and shopid=? group by days order by days DESC;";
		}
		// 查询全部数据
		if(type == 3) str = "select DATE_FORMAT(order_time,'%Y-%m-%d') days, sum(total_price) as money from `order` where shopid = ? group by days order by days DESC;";
		try {
			sequelize.query(str, { replacements: [shopid], type: sequelize.QueryTypes.SELECT }).then(function(projects) {
				res.send(resultMessage.success(projects));
			});
		} catch (error) {
			console.log(error);
			return res.send(resultMessage.error([]));
		}
	},
};
