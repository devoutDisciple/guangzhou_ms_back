const resultMessage = require("../util/resultMessage");
const Sequelize = require("sequelize");
const request = require("request");
let AppConfig = require("../util/AppConfig");
const Op = Sequelize.Op;
const sequelize = require("../dataSource/MysqlPoolClass");
const shop = require("../models/shop");
const ShopModel = shop(sequelize);
const account = require("../models/account");
const AccountModel = account(sequelize);

module.exports = {
	// 通过商店id获取商店数据
	getShopByShopid: async (req, res) => {
		try {
			let shop = await ShopModel.findOne({
				where: {
					id: req.query.id
				}
			});
			res.send(resultMessage.success(shop));
		} catch (error) {
			console.log(error);
			return res.send(resultMessage.error([]));
		}
	},
	// 获取所有商店列表
	getAllForSelect: async (req, res) => {
		try {
			let swiper = await ShopModel.findAll({
				where: {
					is_delete: {
						[Op.not]: ["2"]
					},
					campus: req.query.position
				},
				order: [
					// will return `name`  DESC 降序  ASC 升序
					["sort", "ASC"],
				]
			});
			let result = [];
			swiper.map(item => {
				let value = item.dataValues;
				let obj = {
					id: value.id,
					name: value.name,
				};
				result.push(obj);
			});
			res.send(resultMessage.success(result));
		} catch (error) {
			console.log(error);
			return res.send(resultMessage.error([]));
		}
	},
	// 获取所有商店信息
	getAll: async(req, res) => {
		try {
			let swiper = await ShopModel.findAll({
				where: {
					is_delete: {
						[Op.not]: ["2"]
					},
					campus: req.query.position
				},
				order: [
					// will return `name`  DESC 降序  ASC 升序
					["sort", "DESC"],
				]
			});
			let result = [];
			swiper.map(item => {
				let value = item.dataValues;
				result.push(value);
			});
			res.send(resultMessage.success(result));
		} catch (error) {
			console.log(error);
			return res.send(resultMessage.error([]));
		}
	},
	// 增加店铺
	addShop: async(req, res) => {
		try {
			let body = req.body;
			let {username, password} = body;
			let account = await AccountModel.findOne({
				where: {
					username: username
				}
			});
			if(account) return res.send(resultMessage.errorMsg("已有该用户"));
			let shop = await ShopModel.create(body);
			await AccountModel.create({username, password, shopid: shop.id, role: 2});
			res.send(resultMessage.success("success"));
		} catch (error) {
			console.log(error);
			return res.send(resultMessage.error([]));
		}
	},
	// 修改店铺
	updateShop: async(req, res) => {
		try {
			let body = req.body;
			await ShopModel.update(body, {
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
	// 开店或者关店
	closeOrOpen: async(req, res) => {
		try {
			let id = req.body.id, status = req.body.status;
			await ShopModel.update({
				status: status,
			},{
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
	// 删除店铺
	deleteShop: async(req, res) => {
		try {
			let id = req.body.id;
			await AccountModel.destroy({
				where: {
					shopid: id
				}
			});
			await ShopModel.destroy({
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
	// 获取小程序二维码
	getAccessCode: async(req, res) => {
		try {
			// 获取token
			// https://api.weixin.qq.com/cgi-bin/wxaapp/createwxaqrcode?access_token=ACCESS_TOKEN  AppConfig
			request
				.get(`https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=${AppConfig.appid}&secret=${AppConfig.AppSecret}`,
					function(error, response, body) {
						console.log(body, 111);
						body = JSON.parse(body);
						let access_token = body.access_token;
						console.log(access_token);
						// 获取二维码
						request({
							url: `https://api.weixin.qq.com/wxa/getwxacode?access_token=${access_token}`,
							method: "POST",
							json: true,
							headers: {
								"content-type": "application/json",
							},
							body: JSON.stringify({ path: "/pages/shop/shop?id=1"})
						},
						function(error, response, body) {
							console.log(body, 222);
							return res.send(resultMessage.success(body));
						});
					});

			// res.send(resultMessage.success("success"));
		} catch (error) {
			console.log(error);
			return res.send(resultMessage.error([]));
		}
	},
};
