/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : quesong

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 28/06/2019 01:10:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` int(10) NOT NULL DEFAULT '2' COMMENT '1 超级管理员 2 商家 3 待定',
  `is_delete` int(11) DEFAULT '1' COMMENT '1 存在 2 删除',
  PRIMARY KEY (`id`,`username`,`password`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account
-- ----------------------------
BEGIN;
INSERT INTO `account` VALUES (1, 'root', 'admin', 1, 1);
INSERT INTO `account` VALUES (2, 'test', 'test', 2, 1);
COMMIT;

-- ----------------------------
-- Table structure for campus
-- ----------------------------
DROP TABLE IF EXISTS `campus`;
CREATE TABLE `campus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL DEFAULT '学校名称',
  `floor` varchar(8000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '[]',
  `sort` int(11) NOT NULL DEFAULT '1',
  `is_delete` int(11) DEFAULT '1' COMMENT '1 存在 2 删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of campus
-- ----------------------------
BEGIN;
INSERT INTO `campus` VALUES (1, '清华大学', '[]', 100, 1);
INSERT INTO `campus` VALUES (2, '北京大学', '[]', 12, 1);
INSERT INTO `campus` VALUES (3, '复旦大学', '[]', 1, 1);
INSERT INTO `campus` VALUES (4, '上海交通大学', '[]', 7, 1);
INSERT INTO `campus` VALUES (5, '浙江大学', '[]', 46, 1);
INSERT INTO `campus` VALUES (6, '上海大学', '[]', 1, 1);
INSERT INTO `campus` VALUES (7, '上海第一大学', '[]', 1, 1);
INSERT INTO `campus` VALUES (10, 'fdssdfg', '[{\"id\":1561646670938,\"pId\":null,\"name\":\"西校区\"},{\"id\":1561646671099,\"pId\":null,\"name\":\"西校区\"}]', 23, 1);
INSERT INTO `campus` VALUES (16, '333', '[{\"id\":1561648710072,\"pId\":null,\"name\":\"北广场\",\"children\":[{\"id\":104,\"pId\":1561648710072,\"name\":\"1号楼\"},{\"id\":105,\"pId\":1561648710072,\"name\":\"6号楼\"},{\"id\":106,\"pId\":1561648710072,\"name\":\"8号楼\"}]},{\"id\":1561648710385,\"pId\":null,\"name\":\"西校区\"},{\"id\":1561648726229,\"pId\":null,\"name\":\"西校区\"},{\"id\":1561648726594,\"pId\":null,\"name\":\"西校区\"}]', 33, 1);
INSERT INTO `campus` VALUES (17, 'test2', '[{\"id\":1561649677774,\"pId\":null,\"name\":\"西校区\"},{\"id\":1561649677941,\"pId\":null,\"name\":\"西校区\"}]', 1231, 1);
INSERT INTO `campus` VALUES (18, 'hello', '[{\"id\":1561650507544,\"pId\":null,\"name\":\"西校区\"},{\"id\":1561650507712,\"pId\":null,\"name\":\"西校区\"}]', 1234, 1);
COMMIT;

-- ----------------------------
-- Table structure for evaluate
-- ----------------------------
DROP TABLE IF EXISTS `evaluate`;
CREATE TABLE `evaluate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shopid` int(11) DEFAULT NULL,
  `orderid` int(11) DEFAULT NULL COMMENT '订单id',
  `openid` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL COMMENT '用户名称',
  `avatarUrl` varchar(800) DEFAULT NULL COMMENT '用户头像',
  `desc` varchar(45) DEFAULT NULL,
  `shop_grade` varchar(45) DEFAULT NULL COMMENT '评分 1-5',
  `sender_grade` varchar(45) DEFAULT NULL COMMENT '骑手 评分 1-5',
  `create_time` varchar(45) DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT '1' COMMENT '1 存在 2删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='评价';

-- ----------------------------
-- Records of evaluate
-- ----------------------------
BEGIN;
INSERT INTO `evaluate` VALUES (18, 1, 64, 'oah4447vOWQegN1z544JfDtqbZuY', '「？....！』', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJibwnzh0pHtTsXFNbFcdnaWW2MztibPkwQ6ZSYpxuPjV30rfXGbxrkiaMxGPAQWyycO9vV2A4lD52Qg/132', '123', '5', '3', '1559467445972', 1);
INSERT INTO `evaluate` VALUES (19, 1, 65, 'oah4447vOWQegN1z544JfDtqbZuY', '「？....！』', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJibwnzh0pHtTsXFNbFcdnaWW2MztibPkwQ6ZSYpxuPjV30rfXGbxrkiaMxGPAQWyycO9vV2A4lD52Qg/132', '风发的撒', '5', '4', '1559471321245', 1);
INSERT INTO `evaluate` VALUES (20, 2, 66, 'oah4447vOWQegN1z544JfDtqbZuY', '「？....！』', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJibwnzh0pHtTsXFNbFcdnaWW2MztibPkwQ6ZSYpxuPjV30rfXGbxrkiaMxGPAQWyycO9vV2A4lD52Qg/132', '哈哈哈哈', '3', '4', '1559471453204', 1);
INSERT INTO `evaluate` VALUES (21, 2, 67, 'oah4447vOWQegN1z544JfDtqbZuY', '「？....！』', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJibwnzh0pHtTsXFNbFcdnaWW2MztibPkwQ6ZSYpxuPjV30rfXGbxrkiaMxGPAQWyycO9vV2A4lD52Qg/132', '反倒是', '5', '4', '1559481185034', 1);
INSERT INTO `evaluate` VALUES (22, 1, 71, 'oah4447vOWQegN1z544JfDtqbZuY', '「？....！』', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJibwnzh0pHtTsXFNbFcdnaWW2MztibPkwQ6ZSYpxuPjV30rfXGbxrkiaMxGPAQWyycO9vV2A4lD52Qg/132', 'ghj', '5', '4', '1559482336512', 1);
INSERT INTO `evaluate` VALUES (23, 1, 74, 'oah4447vOWQegN1z544JfDtqbZuY', '「？....！』', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJibwnzh0pHtTsXFNbFcdnaWW2MztibPkwQ6ZSYpxuPjV30rfXGbxrkiaMxGPAQWyycO9vV2A4lD52Qg/132', '很好，很好吃', '5', '4', '1559484657379', 1);
INSERT INTO `evaluate` VALUES (24, 1, 75, 'oah4447vOWQegN1z544JfDtqbZuY', '「？....！』', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJibwnzh0pHtTsXFNbFcdnaWW2MztibPkwQ6ZSYpxuPjV30rfXGbxrkiaMxGPAQWyycO9vV2A4lD52Qg/132', '第三方', '5', '3', '1559488171371', 1);
INSERT INTO `evaluate` VALUES (25, 1, 73, 'oah4447vOWQegN1z544JfDtqbZuY', '「？....！』', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJibwnzh0pHtTsXFNbFcdnaWW2MztibPkwQ6ZSYpxuPjV30rfXGbxrkiaMxGPAQWyycO9vV2A4lD52Qg/132', '反倒是', '5', '4', '1559489482202', 1);
INSERT INTO `evaluate` VALUES (26, 1, 77, 'oah4447vOWQegN1z544JfDtqbZuY', '「？....！』', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJibwnzh0pHtTsXFNbFcdnaWW2MztibPkwQ6ZSYpxuPjV30rfXGbxrkiaMxGPAQWyycO9vV2A4lD52Qg/132', 'hello', '5', '3', '1559568973370', 1);
INSERT INTO `evaluate` VALUES (27, 1, 76, 'oah4447vOWQegN1z544JfDtqbZuY', '「？....！』', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJibwnzh0pHtTsXFNbFcdnaWW2MztibPkwQ6ZSYpxuPjV30rfXGbxrkiaMxGPAQWyycO9vV2A4lD52Qg/132', '', '2', '3', '1559569005474', 1);
INSERT INTO `evaluate` VALUES (28, 1, 98, 'oah4447vOWQegN1z544JfDtqbZuY', '小程序个人开发者', 'https://wx.qlogo.cn/mmopen/vi_32/QxzsUdMRx2SaibYW6Sx4wfna7yLKfQ8ZEwuf5dfkwQqCA3x0tFibM8LC9wPkfW09RjibVx294CJMMKoclFOfCQdlA/132', '认为', '5', '3', '1560658664437', 1);
COMMIT;

-- ----------------------------
-- Table structure for free
-- ----------------------------
DROP TABLE IF EXISTS `free`;
CREATE TABLE `free` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `campus` varchar(45) DEFAULT NULL,
  `sort` int(11) DEFAULT '1',
  `total` int(11) DEFAULT NULL COMMENT '总数',
  `is_delete` int(11) DEFAULT '1' COMMENT '1-存在 2-删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `id_idx1` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='免费霸王餐';

-- ----------------------------
-- Records of free
-- ----------------------------
BEGIN;
INSERT INTO `free` VALUES (1, 1, 1, '清华大学', 1, 49, 1);
INSERT INTO `free` VALUES (2, 2, 1, '清华大学', 1, 30, 1);
INSERT INTO `free` VALUES (3, 3, 1, '清华大学', 1, 0, 1);
INSERT INTO `free` VALUES (4, 4, 2, '北京大学', 2, 60, 1);
COMMIT;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `url` varchar(255) NOT NULL COMMENT '图片url',
  `desc` varchar(45) DEFAULT NULL COMMENT '描述',
  `sales` int(11) DEFAULT '0' COMMENT '月售',
  `price` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '价格',
  `discount` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '以前价格',
  `shopid` varchar(45) NOT NULL COMMENT '所属商家id',
  `type` varchar(45) DEFAULT NULL COMMENT '所属类别',
  `package_cost` varchar(45) DEFAULT NULL COMMENT '餐盒费用',
  `specification` varchar(800) DEFAULT NULL COMMENT '规格',
  `is_delete` int(11) DEFAULT '1' COMMENT '1 存在 2 删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
BEGIN;
INSERT INTO `goods` VALUES (1, '肉末茄子', 'https://quesong.top/attachment/images/2/2019/05/ToZ63oc5758n77CBzKYNY7kn353J6K.jpeg', '好吃的茄子', 116, '1', '75', '1', '套餐', '1', '', 1);
INSERT INTO `goods` VALUES (2, '腐竹烧肉', 'https://quesong.top/attachment/images/2/2019/05/aOYv8EX29S4yO8xxM8osv3UVO8IhVO.jpeg', '好吃的腐竹烧肉', 8, '20', '100', '1', '盖饭', '2', NULL, 1);
INSERT INTO `goods` VALUES (3, '回锅肉', 'https://quesong.top/attachment/images/2/2019/05/ToZ63oc5758n77CBzKYNY7kn353J6K.jpeg', '好吃的回锅肉', 117, '20', '80', '1', '套餐', '3', NULL, 1);
INSERT INTO `goods` VALUES (4, '蒜薹肉丝', 'https://quesong.top/attachment/images/2/2019/05/ToZ63oc5758n77CBzKYNY7kn353J6K.jpeg', 'nice', 31, '50', '65', '2', '盖浇饭', '3', NULL, 1);
COMMIT;

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) NOT NULL,
  `shop_detail` varchar(500) NOT NULL,
  `order_list` varchar(10000) NOT NULL COMMENT '商品id',
  `desc` varchar(45) DEFAULT NULL COMMENT '备注',
  `total_price` int(11) DEFAULT NULL COMMENT '总价',
  `discount_price` int(11) DEFAULT NULL,
  `order_time` varchar(45) DEFAULT NULL COMMENT '下单时间',
  `status` varchar(45) DEFAULT '5' COMMENT '1-未支付 2-商家未接单 3-商家接单 4-派送中 5-订单完成 6-已取消 7-已评价',
  `is_delete` int(11) DEFAULT '1' COMMENT '1 存在 2 删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------
BEGIN;
INSERT INTO `order` VALUES (71, 'oah4447vOWQegN1z544JfDtqbZuY', '{\"id\":1,\"name\":\"一点点奶茶\",\"address\":null,\"url\":\"https://quesong.top/attachment/images/2/2019/05/jAT1cacd9TeX82Ww2aWA5waiKizE0r.jpeg\",\"package_cost\":1,\"send_price\":\"3\"}', '[{\"id\":1,\"name\":\"肉末茄子\",\"url\":\"https://quesong.top/attachment/images/2/2019/05/ToZ63oc5758n77CBzKYNY7kn353J6K.jpeg\",\"desc\":\"好吃的茄子\",\"sales\":60,\"price\":10,\"discount\":75,\"shopid\":\"1\",\"type\":\"套餐\",\"package_cost\":\"1\",\"specification\":\"\",\"is_delete\":1,\"num\":7}]', NULL, 66, 8, '1559482317331', '7', 1);
INSERT INTO `order` VALUES (72, 'oah4447vOWQegN1z544JfDtqbZuY', '{\"id\":1,\"name\":\"一点点奶茶\",\"address\":null,\"url\":\"https://quesong.top/attachment/images/2/2019/05/jAT1cacd9TeX82Ww2aWA5waiKizE0r.jpeg\",\"package_cost\":1,\"send_price\":\"3\"}', '[{\"id\":1,\"name\":\"肉末茄子\",\"url\":\"https://quesong.top/attachment/images/2/2019/05/ToZ63oc5758n77CBzKYNY7kn353J6K.jpeg\",\"desc\":\"好吃的茄子\",\"sales\":67,\"price\":10,\"discount\":75,\"shopid\":\"1\",\"type\":\"套餐\",\"package_cost\":\"1\",\"specification\":\"\",\"is_delete\":1,\"num\":3},{\"id\":3,\"name\":\"回锅肉\",\"url\":\"https://quesong.top/attachment/images/2/2019/05/ToZ63oc5758n77CBzKYNY7kn353J6K.jpeg\",\"desc\":\"好吃的回锅肉\",\"sales\":103,\"price\":20,\"discount\":80,\"shopid\":\"1\",\"type\":\"套餐\",\"package_cost\":\"3\",\"specification\":null,\"is_delete\":1,\"num\":4}]', '', 94, 20, '1559484122740', '5', 1);
INSERT INTO `order` VALUES (73, 'oah4447vOWQegN1z544JfDtqbZuY', '{\"id\":1,\"name\":\"一点点奶茶\",\"address\":null,\"url\":\"https://quesong.top/attachment/images/2/2019/05/jAT1cacd9TeX82Ww2aWA5waiKizE0r.jpeg\",\"package_cost\":1,\"send_price\":\"3\"}', '[{\"id\":1,\"name\":\"肉末茄子\",\"url\":\"https://quesong.top/attachment/images/2/2019/05/ToZ63oc5758n77CBzKYNY7kn353J6K.jpeg\",\"desc\":\"好吃的茄子\",\"sales\":70,\"price\":10,\"discount\":75,\"shopid\":\"1\",\"type\":\"套餐\",\"package_cost\":\"1\",\"specification\":\"\",\"is_delete\":1,\"num\":9}]', 'hello text', 86, 8, '1559484152923', '7', 1);
INSERT INTO `order` VALUES (74, 'oah4447vOWQegN1z544JfDtqbZuY', '{\"id\":1,\"name\":\"一点点奶茶\",\"address\":null,\"url\":\"https://quesong.top/attachment/images/2/2019/05/jAT1cacd9TeX82Ww2aWA5waiKizE0r.jpeg\",\"package_cost\":1,\"send_price\":\"3\"}', '[{\"id\":1,\"name\":\"肉末茄子\",\"url\":\"https://quesong.top/attachment/images/2/2019/05/ToZ63oc5758n77CBzKYNY7kn353J6K.jpeg\",\"desc\":\"好吃的茄子\",\"sales\":79,\"price\":10,\"discount\":75,\"shopid\":\"1\",\"type\":\"套餐\",\"package_cost\":\"1\",\"specification\":\"\",\"is_delete\":1,\"num\":9}]', 'fdfdghg', 86, 8, '1559484586206', '7', 1);
INSERT INTO `order` VALUES (75, 'oah4447vOWQegN1z544JfDtqbZuY', '{\"id\":1,\"name\":\"一点点奶茶\",\"address\":null,\"url\":\"https://quesong.top/attachment/images/2/2019/05/jAT1cacd9TeX82Ww2aWA5waiKizE0r.jpeg\",\"package_cost\":1,\"send_price\":\"3\"}', '[{\"id\":1,\"name\":\"肉末茄子\",\"url\":\"https://quesong.top/attachment/images/2/2019/05/ToZ63oc5758n77CBzKYNY7kn353J6K.jpeg\",\"desc\":\"好吃的茄子\",\"sales\":88,\"price\":10,\"discount\":75,\"shopid\":\"1\",\"type\":\"套餐\",\"package_cost\":\"1\",\"specification\":\"\",\"is_delete\":1,\"num\":7}]', '要中辣', 66, 8, '1559488160966', '7', 1);
INSERT INTO `order` VALUES (76, 'oah4447vOWQegN1z544JfDtqbZuY', '{\"id\":1,\"name\":\"一点点奶茶\",\"address\":null,\"url\":\"https://quesong.top/attachment/images/2/2019/05/jAT1cacd9TeX82Ww2aWA5waiKizE0r.jpeg\",\"package_cost\":1,\"send_price\":\"3\"}', '[{\"id\":1,\"name\":\"肉末茄子\",\"url\":\"https://quesong.top/attachment/images/2/2019/05/ToZ63oc5758n77CBzKYNY7kn353J6K.jpeg\",\"desc\":\"好吃的茄子\",\"sales\":95,\"price\":10,\"discount\":75,\"shopid\":\"1\",\"type\":\"套餐\",\"package_cost\":\"1\",\"specification\":\"\",\"is_delete\":1,\"num\":5},{\"id\":3,\"name\":\"回锅肉\",\"url\":\"https://quesong.top/attachment/images/2/2019/05/ToZ63oc5758n77CBzKYNY7kn353J6K.jpeg\",\"desc\":\"好吃的回锅肉\",\"sales\":107,\"price\":20,\"discount\":80,\"shopid\":\"1\",\"type\":\"套餐\",\"package_cost\":\"3\",\"specification\":null,\"is_delete\":1,\"num\":4}]', '发的发的是', 114, 20, '1559489474215', '7', 1);
INSERT INTO `order` VALUES (77, 'oah4447vOWQegN1z544JfDtqbZuY', '{\"id\":1,\"name\":\"一点点奶茶\",\"address\":null,\"url\":\"https://quesong.top/attachment/images/2/2019/05/jAT1cacd9TeX82Ww2aWA5waiKizE0r.jpeg\",\"package_cost\":0,\"send_price\":0}', '[{\"id\":3,\"name\":\"回锅肉\",\"url\":\"https://quesong.top/attachment/images/2/2019/05/ToZ63oc5758n77CBzKYNY7kn353J6K.jpeg\",\"desc\":\"好吃的回锅肉\",\"sales\":111,\"price\":0,\"discount\":80,\"shopid\":\"1\",\"type\":\"套餐\",\"package_cost\":0,\"specification\":null,\"is_delete\":1,\"num\":1}]', '', 0, 0, '1559568787776', '7', 1);
INSERT INTO `order` VALUES (78, 'oah4447vOWQegN1z544JfDtqbZuY', '{\"id\":1,\"name\":\"一点点奶茶\",\"address\":null,\"url\":\"https://quesong.top/attachment/images/2/2019/05/jAT1cacd9TeX82Ww2aWA5waiKizE0r.jpeg\",\"package_cost\":0,\"send_price\":0}', '[{\"id\":1,\"name\":\"肉末茄子\",\"url\":\"https://quesong.top/attachment/images/2/2019/05/ToZ63oc5758n77CBzKYNY7kn353J6K.jpeg\",\"desc\":\"好吃的茄子\",\"sales\":100,\"price\":0,\"discount\":75,\"shopid\":\"1\",\"type\":\"套餐\",\"package_cost\":0,\"specification\":\"\",\"is_delete\":1,\"num\":1}]', '', 0, 0, '1559571182122', '5', 1);
INSERT INTO `order` VALUES (79, 'oah4447vOWQegN1z544JfDtqbZuY', '{\"id\":1,\"name\":\"一点点奶茶\",\"address\":null,\"url\":\"https://quesong.top/attachment/images/2/2019/05/jAT1cacd9TeX82Ww2aWA5waiKizE0r.jpeg\",\"package_cost\":0,\"send_price\":0}', '[{\"id\":1,\"name\":\"肉末茄子\",\"url\":\"https://quesong.top/attachment/images/2/2019/05/ToZ63oc5758n77CBzKYNY7kn353J6K.jpeg\",\"desc\":\"好吃的茄子\",\"sales\":100,\"price\":0,\"discount\":75,\"shopid\":\"1\",\"type\":\"套餐\",\"package_cost\":0,\"specification\":\"\",\"is_delete\":1,\"num\":1}]', '', 0, 0, '1559571183794', '5', 1);
INSERT INTO `order` VALUES (80, 'oah4447vOWQegN1z544JfDtqbZuY', '{\"id\":1,\"name\":\"一点点奶茶\",\"address\":null,\"url\":\"https://quesong.top/attachment/images/2/2019/05/jAT1cacd9TeX82Ww2aWA5waiKizE0r.jpeg\",\"package_cost\":0,\"send_price\":0}', '[{\"id\":1,\"name\":\"肉末茄子\",\"url\":\"https://quesong.top/attachment/images/2/2019/05/ToZ63oc5758n77CBzKYNY7kn353J6K.jpeg\",\"desc\":\"好吃的茄子\",\"sales\":100,\"price\":0,\"discount\":75,\"shopid\":\"1\",\"type\":\"套餐\",\"package_cost\":0,\"specification\":\"\",\"is_delete\":1,\"num\":1}]', '', 0, 0, '1559571185615', '5', 1);
INSERT INTO `order` VALUES (81, 'oah4447vOWQegN1z544JfDtqbZuY', '{\"id\":1,\"name\":\"一点点奶茶\",\"address\":null,\"url\":\"https://quesong.top/attachment/images/2/2019/05/jAT1cacd9TeX82Ww2aWA5waiKizE0r.jpeg\",\"package_cost\":0,\"send_price\":0}', '[{\"id\":1,\"name\":\"肉末茄子\",\"url\":\"https://quesong.top/attachment/images/2/2019/05/ToZ63oc5758n77CBzKYNY7kn353J6K.jpeg\",\"desc\":\"好吃的茄子\",\"sales\":100,\"price\":0,\"discount\":75,\"shopid\":\"1\",\"type\":\"套餐\",\"package_cost\":0,\"specification\":\"\",\"is_delete\":1,\"num\":1}]', '', 0, 0, '1559571185791', '5', 1);
INSERT INTO `order` VALUES (82, 'oah4447vOWQegN1z544JfDtqbZuY', '{\"id\":1,\"name\":\"一点点奶茶\",\"address\":null,\"url\":\"https://quesong.top/attachment/images/2/2019/05/jAT1cacd9TeX82Ww2aWA5waiKizE0r.jpeg\",\"package_cost\":0,\"send_price\":0}', '[{\"id\":1,\"name\":\"肉末茄子\",\"url\":\"https://quesong.top/attachment/images/2/2019/05/ToZ63oc5758n77CBzKYNY7kn353J6K.jpeg\",\"desc\":\"好吃的茄子\",\"sales\":100,\"price\":0,\"discount\":75,\"shopid\":\"1\",\"type\":\"套餐\",\"package_cost\":0,\"specification\":\"\",\"is_delete\":1,\"num\":1}]', '', 0, 0, '1559571185960', '5', 1);
INSERT INTO `order` VALUES (83, 'oah4447vOWQegN1z544JfDtqbZuY', '{\"id\":1,\"name\":\"一点点奶茶\",\"address\":null,\"url\":\"https://quesong.top/attachment/images/2/2019/05/jAT1cacd9TeX82Ww2aWA5waiKizE0r.jpeg\",\"package_cost\":0,\"send_price\":0}', '[{\"id\":1,\"name\":\"肉末茄子\",\"url\":\"https://quesong.top/attachment/images/2/2019/05/ToZ63oc5758n77CBzKYNY7kn353J6K.jpeg\",\"desc\":\"好吃的茄子\",\"sales\":105,\"price\":0,\"discount\":75,\"shopid\":\"1\",\"type\":\"套餐\",\"package_cost\":0,\"specification\":\"\",\"is_delete\":1,\"num\":1}]', '', 0, 0, '1559571211879', '5', 1);
INSERT INTO `order` VALUES (84, 'oah4447vOWQegN1z544JfDtqbZuY', '{\"id\":1,\"name\":\"一点点奶茶\",\"address\":null,\"url\":\"https://quesong.top/attachment/images/2/2019/05/jAT1cacd9TeX82Ww2aWA5waiKizE0r.jpeg\",\"package_cost\":0,\"send_price\":0}', '[{\"id\":1,\"name\":\"肉末茄子\",\"url\":\"https://quesong.top/attachment/images/2/2019/05/ToZ63oc5758n77CBzKYNY7kn353J6K.jpeg\",\"desc\":\"好吃的茄子\",\"sales\":105,\"price\":0,\"discount\":75,\"shopid\":\"1\",\"type\":\"套餐\",\"package_cost\":0,\"specification\":\"\",\"is_delete\":1,\"num\":1}]', '', 0, 0, '1559571272448', '5', 1);
INSERT INTO `order` VALUES (85, 'oah4447vOWQegN1z544JfDtqbZuY', '{\"id\":1,\"name\":\"一点点奶茶\",\"address\":null,\"url\":\"https://quesong.top/attachment/images/2/2019/05/jAT1cacd9TeX82Ww2aWA5waiKizE0r.jpeg\",\"package_cost\":0,\"send_price\":0}', '[{\"id\":1,\"name\":\"肉末茄子\",\"url\":\"https://quesong.top/attachment/images/2/2019/05/ToZ63oc5758n77CBzKYNY7kn353J6K.jpeg\",\"desc\":\"好吃的茄子\",\"sales\":107,\"price\":0,\"discount\":75,\"shopid\":\"1\",\"type\":\"套餐\",\"package_cost\":0,\"specification\":\"\",\"is_delete\":1,\"num\":1}]', '', 0, 0, '1559571313266', '5', 1);
INSERT INTO `order` VALUES (86, 'oah4447vOWQegN1z544JfDtqbZuY', '{\"id\":1,\"name\":\"一点点奶茶\",\"address\":null,\"url\":\"https://quesong.top/attachment/images/2/2019/05/jAT1cacd9TeX82Ww2aWA5waiKizE0r.jpeg\",\"package_cost\":0,\"send_price\":0}', '[{\"id\":1,\"name\":\"肉末茄子\",\"url\":\"https://quesong.top/attachment/images/2/2019/05/ToZ63oc5758n77CBzKYNY7kn353J6K.jpeg\",\"desc\":\"好吃的茄子\",\"sales\":108,\"price\":0,\"discount\":75,\"shopid\":\"1\",\"type\":\"套餐\",\"package_cost\":0,\"specification\":\"\",\"is_delete\":1,\"num\":1}]', '', 0, 0, '1559571410112', '5', 1);
INSERT INTO `order` VALUES (87, 'oah4447vOWQegN1z544JfDtqbZuY', '{\"id\":1,\"name\":\"一点点奶茶\",\"address\":null,\"url\":\"https://quesong.top/attachment/images/2/2019/05/jAT1cacd9TeX82Ww2aWA5waiKizE0r.jpeg\",\"package_cost\":0,\"send_price\":0}', '[{\"id\":2,\"name\":\"腐竹烧肉\",\"url\":\"https://quesong.top/attachment/images/2/2019/05/aOYv8EX29S4yO8xxM8osv3UVO8IhVO.jpeg\",\"desc\":\"好吃的腐竹烧肉\",\"sales\":5,\"price\":0,\"discount\":100,\"shopid\":\"1\",\"type\":\"盖饭\",\"package_cost\":0,\"specification\":null,\"is_delete\":1,\"num\":1}]', '', 0, 0, '1559571470810', '5', 1);
INSERT INTO `order` VALUES (88, 'oah4447vOWQegN1z544JfDtqbZuY', '{\"id\":1,\"name\":\"一点点奶茶\",\"address\":null,\"url\":\"https://quesong.top/attachment/images/2/2019/05/jAT1cacd9TeX82Ww2aWA5waiKizE0r.jpeg\",\"package_cost\":0,\"send_price\":0}', '[{\"id\":2,\"name\":\"腐竹烧肉\",\"url\":\"https://quesong.top/attachment/images/2/2019/05/aOYv8EX29S4yO8xxM8osv3UVO8IhVO.jpeg\",\"desc\":\"好吃的腐竹烧肉\",\"sales\":6,\"price\":0,\"discount\":100,\"shopid\":\"1\",\"type\":\"盖饭\",\"package_cost\":0,\"specification\":null,\"is_delete\":1,\"num\":1}]', '', 0, 0, '1559571541705', '5', 1);
INSERT INTO `order` VALUES (89, 'oah4447vOWQegN1z544JfDtqbZuY', '{\"id\":1,\"name\":\"一点点奶茶\",\"address\":null,\"url\":\"https://quesong.top/attachment/images/2/2019/05/jAT1cacd9TeX82Ww2aWA5waiKizE0r.jpeg\",\"package_cost\":0,\"send_price\":0}', '[{\"id\":2,\"name\":\"腐竹烧肉\",\"url\":\"https://quesong.top/attachment/images/2/2019/05/aOYv8EX29S4yO8xxM8osv3UVO8IhVO.jpeg\",\"desc\":\"好吃的腐竹烧肉\",\"sales\":7,\"price\":0,\"discount\":100,\"shopid\":\"1\",\"type\":\"盖饭\",\"package_cost\":0,\"specification\":null,\"is_delete\":1,\"num\":1}]', '', 0, 0, '1559571552552', '5', 1);
INSERT INTO `order` VALUES (91, 'oah4447vOWQegN1z544JfDtqbZuY', '{\"id\":1,\"name\":\"一点点奶茶\",\"address\":null,\"url\":\"https://quesong.top/attachment/images/2/2019/05/jAT1cacd9TeX82Ww2aWA5waiKizE0r.jpeg\",\"package_cost\":0,\"send_price\":0}', '[{\"id\":3,\"name\":\"回锅肉\",\"url\":\"https://quesong.top/attachment/images/2/2019/05/ToZ63oc5758n77CBzKYNY7kn353J6K.jpeg\",\"desc\":\"好吃的回锅肉\",\"sales\":112,\"price\":0,\"discount\":80,\"shopid\":\"1\",\"type\":\"套餐\",\"package_cost\":0,\"specification\":null,\"is_delete\":1,\"num\":1}]', '', 0, 0, '1559571888817', '5', 1);
INSERT INTO `order` VALUES (92, 'oah4447vOWQegN1z544JfDtqbZuY', '{\"id\":1,\"name\":\"一点点奶茶\",\"address\":null,\"url\":\"https://quesong.top/attachment/images/2/2019/05/jAT1cacd9TeX82Ww2aWA5waiKizE0r.jpeg\",\"package_cost\":1,\"send_price\":\"3\"}', '[{\"id\":1,\"name\":\"肉末茄子\",\"url\":\"https://quesong.top/attachment/images/2/2019/05/ToZ63oc5758n77CBzKYNY7kn353J6K.jpeg\",\"desc\":\"好吃的茄子\",\"sales\":109,\"price\":10,\"discount\":75,\"shopid\":\"1\",\"type\":\"套餐\",\"package_cost\":\"1\",\"specification\":\"\",\"is_delete\":1,\"num\":1}]', '', 14, 0, '1559582278424', '5', 1);
INSERT INTO `order` VALUES (93, 'oah4447vOWQegN1z544JfDtqbZuY', '{\"id\":1,\"name\":\"一点点奶茶\",\"address\":null,\"url\":\"https://quesong.top/attachment/images/2/2019/05/jAT1cacd9TeX82Ww2aWA5waiKizE0r.jpeg\",\"package_cost\":1,\"send_price\":\"3\"}', '[{\"id\":1,\"name\":\"肉末茄子\",\"url\":\"https://quesong.top/attachment/images/2/2019/05/ToZ63oc5758n77CBzKYNY7kn353J6K.jpeg\",\"desc\":\"好吃的茄子\",\"sales\":110,\"price\":10,\"discount\":75,\"shopid\":\"1\",\"type\":\"套餐\",\"package_cost\":\"1\",\"specification\":\"\",\"is_delete\":1,\"num\":1}]', '', 14, 0, '1559582367511', '5', 1);
INSERT INTO `order` VALUES (94, 'oah4447vOWQegN1z544JfDtqbZuY', '{\"id\":1,\"name\":\"一点点奶茶\",\"address\":null,\"url\":\"https://quesong.top/attachment/images/2/2019/05/jAT1cacd9TeX82Ww2aWA5waiKizE0r.jpeg\",\"package_cost\":1,\"send_price\":\"3\"}', '[{\"id\":1,\"name\":\"肉末茄子\",\"url\":\"https://quesong.top/attachment/images/2/2019/05/ToZ63oc5758n77CBzKYNY7kn353J6K.jpeg\",\"desc\":\"好吃的茄子\",\"sales\":111,\"price\":10,\"discount\":75,\"shopid\":\"1\",\"type\":\"套餐\",\"package_cost\":\"1\",\"specification\":\"\",\"is_delete\":1,\"num\":1}]', '', 14, 0, '1559582494882', '5', 1);
INSERT INTO `order` VALUES (95, 'oah4447vOWQegN1z544JfDtqbZuY', '{\"id\":1,\"name\":\"一点点奶茶\",\"address\":null,\"url\":\"https://quesong.top/attachment/images/2/2019/05/jAT1cacd9TeX82Ww2aWA5waiKizE0r.jpeg\",\"package_cost\":1,\"send_price\":\"3\"}', '[{\"id\":1,\"name\":\"肉末茄子\",\"url\":\"https://quesong.top/attachment/images/2/2019/05/ToZ63oc5758n77CBzKYNY7kn353J6K.jpeg\",\"desc\":\"好吃的茄子\",\"sales\":112,\"price\":10,\"discount\":75,\"shopid\":\"1\",\"type\":\"套餐\",\"package_cost\":\"1\",\"specification\":\"\",\"is_delete\":1,\"num\":1}]', '', 14, 0, '1559582565395', '5', 1);
INSERT INTO `order` VALUES (96, 'oah4447vOWQegN1z544JfDtqbZuY', '{\"id\":1,\"name\":\"一点点奶茶\",\"address\":null,\"url\":\"https://quesong.top/attachment/images/2/2019/05/jAT1cacd9TeX82Ww2aWA5waiKizE0r.jpeg\",\"package_cost\":1,\"send_price\":\"3\"}', '[{\"id\":1,\"name\":\"肉末茄子\",\"url\":\"https://quesong.top/attachment/images/2/2019/05/ToZ63oc5758n77CBzKYNY7kn353J6K.jpeg\",\"desc\":\"好吃的茄子\",\"sales\":113,\"price\":10,\"discount\":75,\"shopid\":\"1\",\"type\":\"套餐\",\"package_cost\":\"1\",\"specification\":\"\",\"is_delete\":1,\"num\":1}]', '', 14, 0, '1559582618140', '5', 1);
INSERT INTO `order` VALUES (97, 'oah4447vOWQegN1z544JfDtqbZuY', '{\"id\":1,\"name\":\"一点点奶茶\",\"address\":null,\"url\":\"https://quesong.top/attachment/images/2/2019/05/jAT1cacd9TeX82Ww2aWA5waiKizE0r.jpeg\",\"package_cost\":1,\"send_price\":\"3\"}', '[{\"id\":1,\"name\":\"肉末茄子\",\"url\":\"https://quesong.top/attachment/images/2/2019/05/ToZ63oc5758n77CBzKYNY7kn353J6K.jpeg\",\"desc\":\"好吃的茄子\",\"sales\":114,\"price\":10,\"discount\":75,\"shopid\":\"1\",\"type\":\"套餐\",\"package_cost\":\"1\",\"specification\":\"\",\"is_delete\":1,\"num\":1}]', '', 14, 0, '1559582823611', '5', 1);
INSERT INTO `order` VALUES (98, 'oah4447vOWQegN1z544JfDtqbZuY', '{\"id\":1,\"name\":\"一点点奶茶\",\"address\":null,\"url\":\"https://quesong.top/attachment/images/2/2019/05/jAT1cacd9TeX82Ww2aWA5waiKizE0r.jpeg\",\"package_cost\":1,\"send_price\":\"3\"}', '[{\"id\":1,\"name\":\"肉末茄子\",\"url\":\"https://quesong.top/attachment/images/2/2019/05/ToZ63oc5758n77CBzKYNY7kn353J6K.jpeg\",\"desc\":\"好吃的茄子\",\"sales\":115,\"price\":10,\"discount\":75,\"shopid\":\"1\",\"type\":\"套餐\",\"package_cost\":\"1\",\"specification\":\"\",\"is_delete\":1,\"num\":1},{\"id\":3,\"name\":\"回锅肉\",\"url\":\"https://quesong.top/attachment/images/2/2019/05/ToZ63oc5758n77CBzKYNY7kn353J6K.jpeg\",\"desc\":\"好吃的回锅肉\",\"sales\":113,\"price\":20,\"discount\":80,\"shopid\":\"1\",\"type\":\"套餐\",\"package_cost\":\"3\",\"specification\":null,\"is_delete\":1,\"num\":4}]', '', 86, 8, '1560658655749', '7', 1);
COMMIT;

-- ----------------------------
-- Table structure for shop
-- ----------------------------
DROP TABLE IF EXISTS `shop`;
CREATE TABLE `shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL COMMENT '商家名称',
  `url` varchar(255) DEFAULT NULL,
  `typeid` int(11) NOT NULL DEFAULT '1' COMMENT '所属分类，默认属于第一类',
  `address` varchar(500) DEFAULT NULL COMMENT '商家地址',
  `campus` varchar(45) DEFAULT '1' COMMENT '校园信息',
  `sales` int(11) DEFAULT NULL COMMENT '月售',
  `desc` varchar(45) DEFAULT NULL COMMENT '商家描述，限定二十个字',
  `start_price` varchar(45) NOT NULL DEFAULT '0' COMMENT '多少钱起送',
  `send_price` varchar(45) NOT NULL DEFAULT '0' COMMENT '配送费\n',
  `special` varchar(800) DEFAULT NULL COMMENT '优惠 满减',
  `start_time` varchar(255) DEFAULT NULL COMMENT '开业时间',
  `end_time` varchar(255) DEFAULT NULL COMMENT '关门时间',
  `username` varchar(45) DEFAULT NULL COMMENT '登录该商家的用户名',
  `password` varchar(45) DEFAULT NULL COMMENT '登录该商家的账号密码',
  `package_cost` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '餐盒费',
  `sort` int(11) DEFAULT '1' COMMENT '排序',
  `is_delete` int(11) DEFAULT '1' COMMENT '1 存在 2 删除',
  `invite` int(11) DEFAULT NULL COMMENT '1 支持自取 2 不支持自取',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='商家';

-- ----------------------------
-- Records of shop
-- ----------------------------
BEGIN;
INSERT INTO `shop` VALUES (1, '一点点奶茶', 'https://quesong.top/attachment/images/2/2019/05/jAT1cacd9TeX82Ww2aWA5waiKizE0r.jpeg', 2, NULL, '清华大学', 82, '好喝的奶茶', '0', '0', 'origin=30,discount=5@@origin=50,discount=8@@origin=100,discount=20', NULL, NULL, NULL, NULL, '0', 1, 1, NULL);
INSERT INTO `shop` VALUES (2, '二食堂川湘风情盖浇饭', 'https://quesong.top/attachment/images/2/2019/05/kPDQAiP3DKE1aUdAEWWKUwEHKdKUad.jpeg', 2, NULL, '北京大学', 55, '北京大学二食堂', '30', '20', 'origin=50,discount=10@@origin=80,discount=18', NULL, NULL, NULL, NULL, '2', 1, 1, NULL);
COMMIT;

-- ----------------------------
-- Table structure for swiper
-- ----------------------------
DROP TABLE IF EXISTS `swiper`;
CREATE TABLE `swiper` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `shopid` varchar(45) DEFAULT NULL COMMENT '商店id',
  `campus` varchar(45) DEFAULT NULL COMMENT '所属校园',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `is_delete` int(11) DEFAULT '1' COMMENT '1 存在 2 删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of swiper
-- ----------------------------
BEGIN;
INSERT INTO `swiper` VALUES (1, 'https://quesong.top/attachment/images/2/2019/05/TBT4K9NbZu4KbV02vKxvkRN4D7B0Y6.jpg', '1', '清华大学', 6, 1);
INSERT INTO `swiper` VALUES (2, 'https://quesong.top/attachment/images/2/2019/05/DupPq4LuslujS2Ws2uETSWkwu8UfKu.jpg', '1', '北京大学', 2, 1);
INSERT INTO `swiper` VALUES (3, 'https://quesong.top/attachment/images/2/2019/05/sU2ruU5USkH45LH5OZ2Uxz6lb1uR28.jpg', '2', '北京大学', 3, 1);
INSERT INTO `swiper` VALUES (4, 'https://quesong.top/attachment/images/2/2019/05/x9x2652Ng7K255Dh5q6F5xqCwX5xh8.jpg', '1', '清华大学', 4, 1);
INSERT INTO `swiper` VALUES (5, 'https://quesong.top/attachment/images/2/2019/04/XUll8nDpp68oy88NVIV66nL8LPWpwE.jpg', '1', '清华大学', 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for time
-- ----------------------------
DROP TABLE IF EXISTS `time`;
CREATE TABLE `time` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `campus` varchar(45) NOT NULL,
  `total` int(11) NOT NULL,
  `sort` int(11) DEFAULT NULL,
  `start_time` varchar(45) NOT NULL,
  `end_time` varchar(45) NOT NULL,
  `is_delete` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='限时抢购';

-- ----------------------------
-- Records of time
-- ----------------------------
BEGIN;
INSERT INTO `time` VALUES (1, 1, 1, '清华大学', 14, 1, '1559318400000', '1559750400000', 1);
COMMIT;

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT '美食' COMMENT '分类',
  `url` varchar(255) DEFAULT NULL,
  `campus` varchar(45) DEFAULT NULL COMMENT '所属校园',
  `sort` int(11) DEFAULT '1',
  `is_delete` int(11) DEFAULT '1' COMMENT '1 存在 2 删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of type
-- ----------------------------
BEGIN;
INSERT INTO `type` VALUES (1, '美食', 'https://quesong.top/attachment/images/2/2019/05/cWRam4A13LEZ434qMVWhqwv1MtZRM3.jpeg', '清华大学', 1, 1);
INSERT INTO `type` VALUES (2, '奶茶', 'https://quesong.top/attachment/images/2/2019/05/CVK0XEzxPEMHV0ppd2lePDP0Mex28Z.jpg', '北京大学', 4, 1);
INSERT INTO `type` VALUES (3, '水果', 'https://quesong.top/attachment/images/2/2019/05/lt971p57Lpfc1L8xxm85fB0795uc95.jpeg', '北京大学', 8, 1);
INSERT INTO `type` VALUES (4, '超市', 'https://quesong.top/attachment/images/2/2019/05/kPDQAiP3DKE1aUdAEWWKUwEHKdKUad.jpeg', '清华大学', 5, 1);
INSERT INTO `type` VALUES (5, '沙拉', 'https://quesong.top/attachment/images/2/2019/05/kPDQAiP3DKE1aUdAEWWKUwEHKdKUad.jpeg', '清华大学', 2, 1);
INSERT INTO `type` VALUES (6, '飞机', 'https://quesong.top/attachment/images/2/2019/05/kPDQAiP3DKE1aUdAEWWKUwEHKdKUad.jpeg', '清华大学', 6, 1);
INSERT INTO `type` VALUES (7, '奶茶', 'https://quesong.top/attachment/images/2/2019/05/kPDQAiP3DKE1aUdAEWWKUwEHKdKUad.jpeg', '清华大学', 7, 1);
INSERT INTO `type` VALUES (8, '热饮', 'https://quesong.top/attachment/images/2/2019/05/kPDQAiP3DKE1aUdAEWWKUwEHKdKUad.jpeg', '清华大学', 8, 1);
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) NOT NULL COMMENT '用户的唯一标示',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `avatarUrl` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `sex` varchar(45) DEFAULT NULL COMMENT '1 男同学 2 女同学',
  `username` varchar(45) DEFAULT NULL,
  `address` varchar(10000) DEFAULT NULL COMMENT '校外地址',
  `is_delete` int(11) DEFAULT '1' COMMENT '1 存在 2 删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `openid_UNIQUE` (`openid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (5, 'oah4447vOWQegN1z544JfDtqbZuY', '「？....！』', '', '1111', '1', 'zhang', '[{\"isSchool\":true,\"campus\":\"上海 上海 北京大学\",\"floor\":\"宿舍楼 2号楼\",\"home\":\"222\",\"username\":\"test1\",\"sex\":\"1\",\"phone\":\"15200000\",\"otherPhone\":\"1530000\",\"default\":true},{\"isSchool\":false,\"family\":\"校外三里屯发顺丰\",\"table\":\"123\",\"username\":\"女同学232\",\"sex\":\"2\",\"phone\":\"18200000\",\"otherPhone\":\"17900000\",\"default\":false},{\"isSchool\":false,\"family\":\"放松放松\",\"table\":\"防守打法\",\"username\":\"testfdsfds\",\"sex\":\"1\",\"phone\":\"1561111\",\"otherPhone\":\"1572222\",\"default\":false}]', 1);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
