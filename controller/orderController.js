const express = require("express");
const router = express.Router();
const orderService = require("../services/orderService");

// 获取订单通过
router.get("/getAll", (req, res) => {
	orderService.getAll(req, res);
});

// 获取订单通过openid  getList
router.get("/getListByOpenid", (req, res) => {
	orderService.getListByOpenid(req, res);
});

// 获取订单通过商店id getListByShopid
router.get("/getListByShopid", (req, res) => {
	orderService.getListByShopid(req, res);
});

// 改变订单状态
router.post("/updateStatus", (req, res) => {
	orderService.updateStatus(req, res);
});

// 批量更改订单状态  updateMoreStatus
router.post("/updateMoreStatus", (req, res) => {
	orderService.updateMoreStatus(req, res);
});

// 个人消费记录求和
router.get("/getAllMoneyByOpenid", (req, res) => {
	orderService.sumMoney(req, res);
});

// 商店数据汇总 getDataByShopid
router.get("/getDataByShopid", (req, res) => {
	orderService.getDataByShopid(req, res);
});

// 全部的数据汇总 getDataByShopid
router.get("/getData", (req, res) => {
	orderService.getData(req, res);
});

// 获取全部商店销售数量的汇总
router.get("/getSales", (req, res) => {
	orderService.getSales(req, res);
});

// 获取商店销售数量的汇总
router.get("/getSalesByShopid", (req, res) => {
	orderService.getSalesByShopid(req, res);
});

// 获取全部的销售额的数据汇总
router.get("/getMoney", (req, res) => {
	orderService.getMoney(req, res);
});

// 获取商店销售额的数据汇总
router.get("/getMoneyByShopid", (req, res) => {
	orderService.getMoneyByShopid(req, res);
});


module.exports = router;
