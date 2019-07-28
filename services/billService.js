const resultMessage = require("../util/resultMessage");
const sequelize = require("../dataSource/MysqlPoolClass");
const Sequelize = require("sequelize");
const Op = Sequelize.Op;
const bill = require("../models/bill");
const billModel = bill(sequelize);
const order = require("../models/order");
const orderModel = order(sequelize);
const PayUtil = require("../util/PayUtil");

module.exports = {
	// 查看商店提现金额
	getBillMoneyReadyByShopid: async (req, res) => {
		try {
			let shopid = req.query.shopid;
			// 商店总金额
			let allMoney = await orderModel.sum("total_price", {
				where: {
					shopid: shopid
				}
			});
			// 已经提现金额
			let alreadyMoney = await billModel.sum("money", {
				where: {
					shop_id: shopid,
					status: {
						[Op.not]: ["2"]
					},
				}
			});
			// 剩余可提现金额
			let resMoney = Number(allMoney) - Number(alreadyMoney);
			res.send(resultMessage.success({
				alreadyMoney, resMoney
			}));
		} catch (error) {
			console.log(error);
			return res.send(resultMessage.error([]));
		}
	},
	// 提交提现
	addBill: async (req, res) => {
		try {
			let body = req.body;
			body.code = PayUtil.getNonceStr();
			await billModel.create(body);
			res.send(resultMessage.success("success"));
		} catch (error) {
			console.log(error);
			return res.send(resultMessage.error([]));
		}
	},
	// 获取商店的提现记录
	getAllByShopid: async (req, res) => {
		try {
			let shop_id = req.query.shop_id;
			let result = await billModel.findAll({
				where: {
					shop_id: shop_id
				},
				order: [
					// will return `name`  DESC 降序  ASC 升序
					["create_time", "DESC"],
				]
			});
			res.send(resultMessage.success(result));
		} catch (error) {
			console.log(error);
			return res.send(resultMessage.error([]));
		}
	},
	// 修改订单状态
	modifyBillById: async (req, res) => {
		try {
			let {id, status} = req.body;
			await billModel.update({status: status}, {
				where: {
					id: id
				}
			});
			res.send(resultMessage.success("success"));
		} catch (error) {
			console.log(error);
			return res.send(resultMessage.error([]));
		}
	},
};
