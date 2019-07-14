const resultMessage = require("../util/resultMessage");
const sequelize = require("../dataSource/MysqlPoolClass");
const goods = require("../models/goods");
const GoodsModel = goods(sequelize);

module.exports = {
	// 获取同一家商店的所有食物
	getByShopId: async (req, res) => {
		let id = req.query.id;
		try {
			let goods = await GoodsModel.findAll({
				where: {
					shopid: id
				}
			});
			let result = [];
			goods.map(item => {
				result.push(item.dataValues);
			});
			res.send(resultMessage.success(result));
		} catch (error) {
			console.log(error);
			return res.send(resultMessage.error([]));
		}
	},
	// 更改商品的今日推荐
	updateToday: async (req, res) => {
		let params = req.query;
		try {
			await GoodsModel.update({today: params.type}, {
				where: {
					id: params.id
				}
			});
			res.send(resultMessage.success("success"));
		} catch (error) {
			console.log(error);
			return res.send(resultMessage.error([]));
		}
	},
	// 根据id获取商品详情
	getById: async (req, res) => {
		let id = req.query.id;
		try {
			let goods = await GoodsModel.findOne({
				where: {
					id: id
				}
			});
			res.send(resultMessage.success(goods));
		} catch (error) {
			console.log(error);
			return res.send(resultMessage.error([]));
		}
	},
	//  获取同个校园的全部商品
	getByCampus: async (req, res) => {
		try {
			let goods = await GoodsModel.findAll({
				where: {
					campus: req.query.position
				}
			});
			let result = [];
			goods.map(item => {
				result.push(item.dataValues);
			});
			res.send(resultMessage.success(result));
		} catch (error) {
			console.log(error);
			return res.send(resultMessage.error([]));
		}
	},
	// 根据商品id获取商品
	getByGoodsId: async (req, res) => {
		let id = req.query.id;
		try {
			let goods = await GoodsModel.findOne({
				where: {
					id: id
				}
			});
			res.send(resultMessage.success(goods));
		} catch (error) {
			console.log(error);
			return {};
		}
	},
	// 增加不同商品的销量
	addSales: async (req, res) => {
		let body = req.body;
		let goodIds = body.goodIds;
		try {
			goodIds.map(async (item) => {
				await GoodsModel.increment(["sales"], {
					by: item.num,
					where: {
						id: item.id
					}
				});
			});
			return "success";
		} catch (error) {
			console.log(error);
			return res.send(resultMessage.error([]));
		}
	}
};
