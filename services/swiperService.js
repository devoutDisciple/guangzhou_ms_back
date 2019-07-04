const resultMessage = require("../util/resultMessage");
const Sequelize = require("sequelize");
const Op = Sequelize.Op;
const sequelize = require("../dataSource/MysqlPoolClass");
const swiper = require("../models/swiper");
const SwiperModel = swiper(sequelize);
const shop = require("../models/shop");
const shopModel = shop(sequelize);

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
					campus: value.campus,
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
	}
};
