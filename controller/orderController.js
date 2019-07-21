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

// 个人消费记录求和
router.get("/getAllMoneyByOpenid", (req, res) => {
	orderService.sumMoney(req, res);
});


module.exports = router;
