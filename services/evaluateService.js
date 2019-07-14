const resultMessage = require("../util/resultMessage");
const sequelize = require("../dataSource/MysqlPoolClass");
const evaluate = require("../models/evaluate");
const evaluateModel = evaluate(sequelize);

module.exports = {
	// 通过用户openid查看该用户评价列表
	getEvaluateByOpenid: async (req, res) => {
		try {
			// 获取评价
			let evaluates = await evaluateModel.findAll({
				where: {
					openid: req.query.openid
				},
				order: [
					["create_time", "DESC"],
				],
			});
			let result = [];
			evaluates.map(item => {
				result.push({
					goods_id: item.goods_id,
					desc: item.desc,
					shop_grade: item.shop_grade,
					sender_grade: item.sender_grade,
					create_time: item.create_time
				});
			});
			res.send(resultMessage.success(result));
		} catch (error) {
			console.log(error);
			return res.send(resultMessage.error([]));
		}
	},
	// 根据商店id获取评价
	getEvaluateByGoodsId: async (req, res) => {
		let goods_id = req.query.goods_id;
		try {
			// 获取评价
			let evaluates = await evaluateModel.findAll({
				where: {
					goods_id: goods_id
				},
				order: [
					// will return `name`  DESC 降序  ASC 升序
					["create_time", "DESC"],
				],
			});
			// 获取评价平均值
			let sumEvaluate = await evaluateModel.sum("shop_grade", {
				where: {
					goods_id: goods_id
				}
			});
			console.log(sumEvaluate);
			let result = [];
			evaluates.map(item => {
				result.push(item.dataValues);
			});
			res.send(resultMessage.success({
				sumEvaluate,
				result
			}));
		} catch (error) {
			console.log(error);
			return res.send(resultMessage.error([]));
		}
	},

};
