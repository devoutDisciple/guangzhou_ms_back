const express = require("express");
const router = express.Router();
const goodsService = require("../services/goodsService");
const multer  = require("multer");
const ObjectUtil = require("../util/ObjectUtil");
let AppConfig = require("../config/AppConfig");
let filePath = AppConfig.goodsImgFilePath;

let filename = "";
// 使用硬盘存储模式设置存放接收到的文件的路径以及文件名
var storage = multer.diskStorage({
	destination: function (req, file, cb) {
		// 接收到文件后输出的保存路径（若不存在则需要创建）
		cb(null, filePath);
	},
	filename: function (req, file, cb) {
		filename = ObjectUtil.getName() + "-" + Date.now() + ".jpg";
		// 将保存文件名设置为 时间戳 + 文件原始名，比如 151342376785-123.jpg
		cb(null, filename);
	}
});
let upload = multer({ dest: filePath, storage: storage });
// 使用硬盘存储模式设置存放接收到的文件的路径以及文件名
var storage2 = multer.diskStorage({
	destination: function (req, file, cb) {
		// 接收到文件后输出的保存路径（若不存在则需要创建）
		cb(null, filePath);
	},
	filename: function (req, file, cb) {
		filename = ObjectUtil.getName() + "-" + Date.now();
		// 将保存文件名设置为 时间戳 + 文件原始名，比如 151342376785-123.jpg
		cb(null, filename);
	}
});
let upload2 = multer({ dest: filePath, storage: storage2 });

// 上传描述图片
router.post("/uploadDescImg", upload.single("file"), (req, res) => {
	goodsService.uploadDescImg(req, res, filename);
});
// 根据商店id获取商品
router.get("/getByShopId", (req, res) => {
	goodsService.getByShopId(req, res);
});
// 更改今日推荐
router.get("/updateToday", (req, res) => {
	goodsService.updateToday(req, res);
});
// 新增商品
router.post("/add", upload2.single("file"), (req, res) => {
	goodsService.add(req, res, filename);
});
// 修改商品
router.post("/update", upload2.single("file"), (req, res) => {
	goodsService.update(req, res, filename);
});
// 删除商品
router.post("/delete", (req, res) => {
	goodsService.delete(req, res);
});
// 获取所有今日推荐商品
router.get("/getAllToday", (req, res) => {
	goodsService.getAllToday(req, res);
});


module.exports = router;
