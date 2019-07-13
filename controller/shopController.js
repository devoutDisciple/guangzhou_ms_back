const express = require("express");
const router = express.Router();
const shopService = require("../services/shopService");

// 获取所有商店信息为了下拉框
router.get("/getAllForSelect", (req, res) => {
	shopService.getAllForSelect(req, res);
});

// 获取所有商店信息
router.get("/all", (req, res) => {
	shopService.getAll(req, res);
});

// 根据商店id获取商店
router.post("/add", (req, res) => {
	shopService.addShop(req, res);
});

// 删除商店
router.post("/delete", (req, res) => {
	shopService.deleteShop(req, res);
});

// 确认开店或者关店
router.post("/closeOrOpen", (req, res) => {
	shopService.closeOrOpen(req, res);
});

// 修改店铺
router.post("/update", (req, res) => {
	shopService.updateShop(req, res);
});



module.exports = router;
