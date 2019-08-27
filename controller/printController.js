const express = require("express");
const router = express.Router();
const printService = require("../services/printService");

// 添加打印机
router.post("/add", (req, res) => {
	printService.add(req, res);
});

// 打印订单
router.post("/printOrder", (req, res) => {
	printService.printOrder(req, res);
});


module.exports = router;
