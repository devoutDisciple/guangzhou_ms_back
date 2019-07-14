const express = require("express");
const router = express.Router();
const evaluateService = require("../services/evaluateService");

// 根据商店id获取评价
router.get("/getEvaluateByGoodsId", (req, res) => {
	evaluateService.getEvaluateByGoodsId(req, res);
});

// 获取用户评价 getEvaluateByOpenid
router.get("/getEvaluateByOpenid", (req, res) => {
	evaluateService.getEvaluateByOpenid(req, res);
});

module.exports = router;
