const resultMessage = require("../util/resultMessage");
const Sequelize = require("sequelize");
const Op = Sequelize.Op;
const sequelize = require("../dataSource/MysqlPoolClass");
const swiper = require("../models/swiper");
const SwiperModel = swiper(sequelize);
const shop = require("../models/shop");
const shopModel = shop(sequelize);
const AppConfig = require("../config/AppConfig");
let preUrl = AppConfig.swiperPreUrl;

SwiperModel.belongsTo(shopModel, { foreignKey: "shopid", targetKey: "id", as: "shopDetail",});

module.exports = {
	getAll: async (req, res) => {
		try {
			let swiper = await SwiperModel.findAll({
				where: {
					is_delete: {
						[Op.not]: ["2"]
					},
					campus: req.query.position || ""
				},
				include: [{
					model: shopModel,
					as: "shopDetail",
				}],
				order: [
					// will return `name`  DESC 降序  ASC 升序
					["sort", "DESC"],
				]
			});
			let result = [];
			swiper.map(item => {
				let value = item.dataValues;
				let name = value.shopDetail.name;
				let obj = {
					id: value.id,
					campus: value.campus,
					shopid: value.shopid,
					url: value.url,
					shopName: name,
					sort: value.sort,
				};
				result.push(obj);
			});
			res.send(resultMessage.success(result));
		} catch (error) {
			console.log(error);
			return res.send(resultMessage.error([]));
		}
	},
	add: async (req, res, filePath) => {
		try {
			let body = req.body;
			let params = {
				shopid: 1,
				campus: body.campus,
				sort: body.sort,
			};
			filePath ? params.url = preUrl + filePath : null;
			await SwiperModel.create(params);
			res.send(resultMessage.success("success"));
		} catch (error) {
			console.log(error);
			return res.send(resultMessage.error([]));
		}
	},
	update: async (req, res, filePath) => {
		try {
			let body = req.body;
			let params = {
				shopid: body.shopid,
				sort: body.sort
			};
			filePath ? params.url = preUrl + filePath : null;
			await SwiperModel.update(params, {
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
	delete: async (req, res) => {
		try {
			await SwiperModel.destroy({
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
};
