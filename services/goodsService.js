const resultMessage = require("../util/resultMessage");
const sequelize = require("../dataSource/MysqlPoolClass");
const goods = require("../models/goods");
const GoodsModel = goods(sequelize);
const AppConfig = require("../config/AppConfig");
const fs = require("fs"); // 引入fs模块
let preUrl = AppConfig.goodsPreUrl;
let goodsImgFilePath = AppConfig.goodsImgFilePath;
const shop = require("../models/shop");
let filePath = AppConfig.goodsImgFilePath;
const images = require("images");
const ShopModel = shop(sequelize);
GoodsModel.belongsTo(ShopModel, { foreignKey: "shopid", targetKey: "id", as: "shopDetail",});

module.exports = {
	// 获取同一家商店的所有食物
	getByShopId: async (req, res) => {
		let id = req.query.id;
		try {
			let goods = await GoodsModel.findAll({
				where: {
					shopid: id
				},
				order: [
					// will return `name`  DESC 降序  ASC 升序
					["sort", "DESC"],
				]
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

	// 获取商店食品的简介
	getDescGoodsByShopId: async (req, res) => {
		let shopid = req.query.shopid;
		try {
			let goods = await GoodsModel.findAll({
				where: {
					shopid: shopid
				},
				order: [
					// will return `name`  DESC 降序  ASC 升序
					["sort", "DESC"],
				]
			});
			let result = [];
			goods.map(item => {
				result.push({
					id: item.id,
					name: item.name
				});
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

	// 上传商品描述图片
	uploadDescImg: async (req, res, filename) => {
		try {
			let filePath = preUrl + filename;
			res.send(resultMessage.success(filePath));
			images(`${filePath}/${filename}`).save(`${filePath}/${filename}`, {
				quality : 20
			});
		} catch (error) {
			console.log(error);
			return res.send(resultMessage.error([]));
		}
	},

	// 新增商品
	add: async (req, res, filename) => {
		try {
			let body = req.body;
			let params = {
				name: body.name,
				title: body.title,
				desc: body.desc,
				price: body.price,
				package_cost: body.package_cost,
				today: body.today,
				sort: body.sort,
				shopid: body.shopid,
				sales: 0
			};
			filename ? params.url = preUrl + filename : null;
			await GoodsModel.create(params);
			res.send(resultMessage.success("success"));
			images(`${filePath}/${filename}`).save(`${filePath}/${filename}`, {
				quality : 20
			});
		} catch (error) {
			console.log(error);
			return res.send(resultMessage.error([]));
		}
	},

	// 修改商品
	update: async (req, res, filename) => {
		try {
			let body = req.body;
			let params = {
				name: body.name,
				title: body.title,
				desc: body.desc,
				price: body.price,
				package_cost: body.package_cost,
				today: body.today,
				sort: body.sort,
				shopid: body.shopid,
				sales: body.sales
			};
			filename ? params.url = preUrl + filename : null;
			await GoodsModel.update(params, {
				where: {
					id: req.body.id
				}
			});
			res.send(resultMessage.success("success"));
			images(`${filePath}/${filename}`).save(`${filePath}/${filename}`, {
				quality : 20
			});
		} catch (error) {
			console.log(error);
			return res.send(resultMessage.error([]));
		}
	},

	// 删除商品
	delete: async (req, res) => {
		try {
			let id = req.body.id;
			let goods = await GoodsModel.findOne({
				where: {
					id: id
				}
			});
			let url = goods.url, descList = JSON.parse(goods.desc);
			let filename = url.split(preUrl)[1];
			let filePath = goodsImgFilePath + "/" + filename;
			if(fs.existsSync(goodsImgFilePath + "/" + filename)) fs.unlinkSync(filePath);
			descList.map(item => {
				let filename = item.split(preUrl)[1];
				let filePath = goodsImgFilePath + "/" + filename;
				if(fs.existsSync(goodsImgFilePath + "/" + filename)) fs.unlinkSync(filePath);
			});
			await GoodsModel.destroy({
				where: {
					id: req.body.id
				}
			});
			res.send(resultMessage.success("success"));
		} catch (error) {
			console.log(error);
			return res.send(resultMessage.error([]));
		}
	},

	// 获取所有今日推荐商品
	getAllToday: async (req, res) => {
		try {
			let goods = await GoodsModel.findAll({
				where: {
					today: 1
				},
				include: [{
					model: ShopModel,
					as: "shopDetail",
				}],
				order: [
					["sort", "DESC"],
				]
			});
			let result = [];
			goods.map(item => {
				let obj = item.dataValues;
				result.push({
					id: obj.id,
					name: obj.name,
					shopid: obj.shopid,
					url: obj.url,
					shopName: obj.shopDetail.name
				});
			});
			res.send(resultMessage.success(result));
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
};
