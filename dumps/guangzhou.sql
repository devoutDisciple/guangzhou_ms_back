/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : guangzhou

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 18/07/2019 00:58:33
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
  `shopid` int(11) NOT NULL,
  `role` int(11) DEFAULT '2' COMMENT '1 超级管理员 2 商家 3 待定',
  `is_delete` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '1 存在 2 删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account
-- ----------------------------
BEGIN;
INSERT INTO `account` VALUES (6, 'root', 'admin', -1, 2, '1');
INSERT INTO `account` VALUES (7, 'hello3', 'password', 11, 2, '1');
INSERT INTO `account` VALUES (8, 'hello', 'test', 12, 2, '1');
INSERT INTO `account` VALUES (11, 'fsdkjf', 'fjds', 15, 2, '1');
INSERT INTO `account` VALUES (12, 'fdsfggg', 'g', 16, 2, '1');
INSERT INTO `account` VALUES (13, 'hfgh', 'hg', 17, 2, '1');
INSERT INTO `account` VALUES (15, 'fdsjfk', 'fsdfds', 19, 2, '1');
INSERT INTO `account` VALUES (16, '刚发的', '刚发的广泛地', 20, 2, '1');
INSERT INTO `account` VALUES (17, 'dsf', 'fsd', 21, 2, '1');
INSERT INTO `account` VALUES (18, 'test', 'world', 22, 2, '1');
INSERT INTO `account` VALUES (19, 'test2', 'test', 25, 2, '1');
COMMIT;

-- ----------------------------
-- Table structure for campus
-- ----------------------------
DROP TABLE IF EXISTS `campus`;
CREATE TABLE `campus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL DEFAULT '学校名称',
  `floor` varchar(8000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '1',
  `is_delete` int(11) DEFAULT '1' COMMENT '1 存在 2 删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of campus
-- ----------------------------
BEGIN;
INSERT INTO `campus` VALUES (2, '广州大学2', '[{\"id\":1561646670938,\"pId\":null,\"name\":\"西校区\"},{\"id\":1561646671099,\"pId\":null,\"name\":\"西校区\"}]', 1, 1);
INSERT INTO `campus` VALUES (3, '广州大学3', '[{\"id\":1561646670938,\"pId\":null,\"name\":\"西校区\"},{\"id\":1561646671099,\"pId\":null,\"name\":\"西校区\"}]', 1, 1);
INSERT INTO `campus` VALUES (5, '广州大学5', '[{\"id\":1561646670938,\"pId\":null,\"name\":\"西校区\"},{\"id\":1561646671099,\"pId\":null,\"name\":\"西校区\"}]', 1, 1);
INSERT INTO `campus` VALUES (6, '广州大学6', '[{\"id\":1561646670938,\"pId\":null,\"name\":\"西校区\"},{\"id\":1561646671099,\"pId\":null,\"name\":\"西校区\"}]', 1, 1);
INSERT INTO `campus` VALUES (7, '广州大学7', '[{\"id\":1561646670938,\"pId\":null,\"name\":\"西校区\"},{\"id\":1561646671099,\"pId\":null,\"name\":\"西校区\"}]', 1, 1);
INSERT INTO `campus` VALUES (8, '北京大学', '[{\"id\":1562254242241,\"pId\":null,\"name\":\"第一校区\",\"children\":[{\"id\":103,\"pId\":1562254242241,\"name\":\"1号楼\"}]},{\"id\":1563105649935,\"pId\":null,\"name\":\"二小区\",\"children\":[{\"id\":103,\"pId\":1563105649935,\"name\":\"6号楼\"}]}]', 100, 1);
COMMIT;

-- ----------------------------
-- Table structure for car
-- ----------------------------
DROP TABLE IF EXISTS `car`;
CREATE TABLE `car` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `shop_id` int(11) NOT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `num` int(11) DEFAULT '1',
  `create_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_delete` int(11) NOT NULL DEFAULT '1' COMMENT '1 存在 2 删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car
-- ----------------------------
BEGIN;
INSERT INTO `car` VALUES (10, 'oKw4p450ND5YU2HMpFZ0iPoVtd-I', 1, 2, 3, '1560585466802', 1);
INSERT INTO `car` VALUES (11, 'oKw4p450ND5YU2HMpFZ0iPoVtd-I', 1, 3, 6, '1560585543599', 1);
INSERT INTO `car` VALUES (12, 'oKw4p450ND5YU2HMpFZ0iPoVtd-I', 2, 5, 2, '1560585553686', 1);
INSERT INTO `car` VALUES (13, 'oKw4p450ND5YU2HMpFZ0iPoVtd-I', 1, 1, 18, '1560608733068', 1);
COMMIT;

-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '收藏',
  `goods_id` int(11) DEFAULT NULL,
  `openid` varchar(255) DEFAULT NULL,
  `create_time` varchar(255) DEFAULT NULL,
  `is_delete` int(11) DEFAULT '1' COMMENT '1 存在 2 删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collection
-- ----------------------------
BEGIN;
INSERT INTO `collection` VALUES (5, 4, 'oah4447vOWQegN1z544JfDtqbZuY', '1560264126124', 1);
INSERT INTO `collection` VALUES (9, 2, 'oKw4p450ND5YU2HMpFZ0iPoVtd-I', '1560356940776', 1);
INSERT INTO `collection` VALUES (11, 4, 'oKw4p450ND5YU2HMpFZ0iPoVtd-I', '1560584307829', 1);
INSERT INTO `collection` VALUES (13, 1, 'oKw4p450ND5YU2HMpFZ0iPoVtd-I', '1560608725604', 1);
COMMIT;

-- ----------------------------
-- Table structure for evaluate
-- ----------------------------
DROP TABLE IF EXISTS `evaluate`;
CREATE TABLE `evaluate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL,
  `orderid` int(11) DEFAULT NULL COMMENT '订单id',
  `openid` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL COMMENT '用户名称',
  `avatarUrl` varchar(800) DEFAULT NULL COMMENT '用户头像',
  `desc` varchar(45) DEFAULT NULL,
  `shop_grade` varchar(45) DEFAULT NULL COMMENT '评分 1-5',
  `sender_grade` varchar(45) DEFAULT NULL COMMENT '骑手 评分 1-5',
  `create_time` bigint(45) DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT '1' COMMENT '1 存在 2删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COMMENT='评价';

-- ----------------------------
-- Records of evaluate
-- ----------------------------
BEGIN;
INSERT INTO `evaluate` VALUES (18, 1, 64, 'oah4447vOWQegN1z544JfDtqbZuY', '「？....！』', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJibwnzh0pHtTsXFNbFcdnaWW2MztibPkwQ6ZSYpxuPjV30rfXGbxrkiaMxGPAQWyycO9vV2A4lD52Qg/132', '123', '5', '3', 1563105059478, 1);
INSERT INTO `evaluate` VALUES (19, 1, 65, 'oah4447vOWQegN1z544JfDtqbZuY', '「？....！』', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJibwnzh0pHtTsXFNbFcdnaWW2MztibPkwQ6ZSYpxuPjV30rfXGbxrkiaMxGPAQWyycO9vV2A4lD52Qg/132', '风发的撒', '5', '4', 1559471321245, 1);
INSERT INTO `evaluate` VALUES (20, 2, 66, 'oah4447vOWQegN1z544JfDtqbZuY', '「？....！』', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJibwnzh0pHtTsXFNbFcdnaWW2MztibPkwQ6ZSYpxuPjV30rfXGbxrkiaMxGPAQWyycO9vV2A4lD52Qg/132', '哈哈哈哈', '3', '4', 1559471453204, 1);
INSERT INTO `evaluate` VALUES (21, 2, 67, 'oah4447vOWQegN1z544JfDtqbZuY', '「？....！』', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJibwnzh0pHtTsXFNbFcdnaWW2MztibPkwQ6ZSYpxuPjV30rfXGbxrkiaMxGPAQWyycO9vV2A4lD52Qg/132', '反倒是', '5', '4', 1559481185034, 1);
INSERT INTO `evaluate` VALUES (22, 1, 71, 'oah4447vOWQegN1z544JfDtqbZuY', '「？....！』', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJibwnzh0pHtTsXFNbFcdnaWW2MztibPkwQ6ZSYpxuPjV30rfXGbxrkiaMxGPAQWyycO9vV2A4lD52Qg/132', 'ghj', '5', '4', 1559482336512, 1);
INSERT INTO `evaluate` VALUES (23, 1, 74, 'oah4447vOWQegN1z544JfDtqbZuY', '「？....！』', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJibwnzh0pHtTsXFNbFcdnaWW2MztibPkwQ6ZSYpxuPjV30rfXGbxrkiaMxGPAQWyycO9vV2A4lD52Qg/132', '很好，很好吃', '5', '4', 1559484657379, 1);
INSERT INTO `evaluate` VALUES (24, 1, 75, 'oah4447vOWQegN1z544JfDtqbZuY', '「？....！』', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJibwnzh0pHtTsXFNbFcdnaWW2MztibPkwQ6ZSYpxuPjV30rfXGbxrkiaMxGPAQWyycO9vV2A4lD52Qg/132', '第三方', '5', '3', 1559488171371, 1);
INSERT INTO `evaluate` VALUES (25, 1, 73, 'oah4447vOWQegN1z544JfDtqbZuY', '「？....！』', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJibwnzh0pHtTsXFNbFcdnaWW2MztibPkwQ6ZSYpxuPjV30rfXGbxrkiaMxGPAQWyycO9vV2A4lD52Qg/132', '反倒是', '5', '4', 1559489482202, 1);
INSERT INTO `evaluate` VALUES (26, 1, 77, 'oah4447vOWQegN1z544JfDtqbZuY', '「？....！』', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJibwnzh0pHtTsXFNbFcdnaWW2MztibPkwQ6ZSYpxuPjV30rfXGbxrkiaMxGPAQWyycO9vV2A4lD52Qg/132', 'hello', '5', '3', 1559568973370, 1);
INSERT INTO `evaluate` VALUES (27, 1, 76, 'oah4447vOWQegN1z544JfDtqbZuY', '「？....！』', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJibwnzh0pHtTsXFNbFcdnaWW2MztibPkwQ6ZSYpxuPjV30rfXGbxrkiaMxGPAQWyycO9vV2A4lD52Qg/132', '', '2', '3', 1559569005474, 1);
INSERT INTO `evaluate` VALUES (28, 1, 97, 'oah4447vOWQegN1z544JfDtqbZuY', '「？....！』', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJibwnzh0pHtTsXFNbFcdnaWW2MztibPkwQ6ZSYpxuPjV30rfXGbxrkiaMxGPAQWyycO9vV2A4lD52Qg/132', 'dasd', '4', '2', 1560086447842, 1);
INSERT INTO `evaluate` VALUES (29, 1, 97, 'oah4447vOWQegN1z544JfDtqbZuY', '「？....！』', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJibwnzh0pHtTsXFNbFcdnaWW2MztibPkwQ6ZSYpxuPjV30rfXGbxrkiaMxGPAQWyycO9vV2A4lD52Qg/132', 'dasd', '4', '2', 1560086450298, 1);
INSERT INTO `evaluate` VALUES (30, 1, 126, 'oKw4p450ND5YU2HMpFZ0iPoVtd-I', '小程序个人开发者', 'https://wx.qlogo.cn/mmopen/vi_32/QxzsUdMRx2QXe0MO8q3iaOvFkXcaOicadegAhgt7ynJwPjh3xF66RGx82VuJib02bCevTrXfdibAbSy4cRlW0icEsDw/132', 'wretretr', '5', '4', 1560607760727, 1);
INSERT INTO `evaluate` VALUES (31, 1, 126, 'oKw4p450ND5YU2HMpFZ0iPoVtd-I', '小程序个人开发者', 'https://wx.qlogo.cn/mmopen/vi_32/QxzsUdMRx2QXe0MO8q3iaOvFkXcaOicadegAhgt7ynJwPjh3xF66RGx82VuJib02bCevTrXfdibAbSy4cRlW0icEsDw/132', 'wretretr', '5', '4', 1560607761924, 1);
INSERT INTO `evaluate` VALUES (32, 1, 126, 'oKw4p450ND5YU2HMpFZ0iPoVtd-I', '小程序个人开发者', 'https://wx.qlogo.cn/mmopen/vi_32/QxzsUdMRx2QXe0MO8q3iaOvFkXcaOicadegAhgt7ynJwPjh3xF66RGx82VuJib02bCevTrXfdibAbSy4cRlW0icEsDw/132', 'wretretr', '5', '4', 1560607762101, 1);
INSERT INTO `evaluate` VALUES (33, 1, 126, 'oKw4p450ND5YU2HMpFZ0iPoVtd-I', '小程序个人开发者', 'https://wx.qlogo.cn/mmopen/vi_32/QxzsUdMRx2QXe0MO8q3iaOvFkXcaOicadegAhgt7ynJwPjh3xF66RGx82VuJib02bCevTrXfdibAbSy4cRlW0icEsDw/132', 'wretretr', '5', '4', 1560607762261, 1);
INSERT INTO `evaluate` VALUES (34, 1, 126, 'oKw4p450ND5YU2HMpFZ0iPoVtd-I', '小程序个人开发者', 'https://wx.qlogo.cn/mmopen/vi_32/QxzsUdMRx2QXe0MO8q3iaOvFkXcaOicadegAhgt7ynJwPjh3xF66RGx82VuJib02bCevTrXfdibAbSy4cRlW0icEsDw/132', 'wretretr', '5', '4', 1560607762674, 1);
INSERT INTO `evaluate` VALUES (35, 1, 126, 'oKw4p450ND5YU2HMpFZ0iPoVtd-I', '小程序个人开发者', 'https://wx.qlogo.cn/mmopen/vi_32/QxzsUdMRx2QXe0MO8q3iaOvFkXcaOicadegAhgt7ynJwPjh3xF66RGx82VuJib02bCevTrXfdibAbSy4cRlW0icEsDw/132', 'wretretr', '5', '4', 1560607762834, 1);
INSERT INTO `evaluate` VALUES (36, 1, 126, 'oKw4p450ND5YU2HMpFZ0iPoVtd-I', '小程序个人开发者', 'https://wx.qlogo.cn/mmopen/vi_32/QxzsUdMRx2QXe0MO8q3iaOvFkXcaOicadegAhgt7ynJwPjh3xF66RGx82VuJib02bCevTrXfdibAbSy4cRlW0icEsDw/132', 'wretretr', '5', '4', 1560607762986, 1);
INSERT INTO `evaluate` VALUES (37, 1, 126, 'oKw4p450ND5YU2HMpFZ0iPoVtd-I', '小程序个人开发者', 'https://wx.qlogo.cn/mmopen/vi_32/QxzsUdMRx2QXe0MO8q3iaOvFkXcaOicadegAhgt7ynJwPjh3xF66RGx82VuJib02bCevTrXfdibAbSy4cRlW0icEsDw/132', 'wretretr', '5', '4', 1560607763157, 1);
INSERT INTO `evaluate` VALUES (38, 1, 126, 'oKw4p450ND5YU2HMpFZ0iPoVtd-I', '小程序个人开发者', 'https://wx.qlogo.cn/mmopen/vi_32/QxzsUdMRx2QXe0MO8q3iaOvFkXcaOicadegAhgt7ynJwPjh3xF66RGx82VuJib02bCevTrXfdibAbSy4cRlW0icEsDw/132', 'wretretr', '5', '4', 1560607766780, 1);
INSERT INTO `evaluate` VALUES (39, 1, 126, 'oKw4p450ND5YU2HMpFZ0iPoVtd-I', '小程序个人开发者', 'https://wx.qlogo.cn/mmopen/vi_32/QxzsUdMRx2QXe0MO8q3iaOvFkXcaOicadegAhgt7ynJwPjh3xF66RGx82VuJib02bCevTrXfdibAbSy4cRlW0icEsDw/132', 'wretretr', '5', '4', 1560607768818, 1);
INSERT INTO `evaluate` VALUES (40, 2, 125, 'oKw4p450ND5YU2HMpFZ0iPoVtd-I', '小程序个人开发者', 'https://wx.qlogo.cn/mmopen/vi_32/QxzsUdMRx2QXe0MO8q3iaOvFkXcaOicadegAhgt7ynJwPjh3xF66RGx82VuJib02bCevTrXfdibAbSy4cRlW0icEsDw/132', '', '4', '3', 1560608400207, 1);
INSERT INTO `evaluate` VALUES (41, 2, 125, 'oKw4p450ND5YU2HMpFZ0iPoVtd-I', '小程序个人开发者', 'https://wx.qlogo.cn/mmopen/vi_32/QxzsUdMRx2QXe0MO8q3iaOvFkXcaOicadegAhgt7ynJwPjh3xF66RGx82VuJib02bCevTrXfdibAbSy4cRlW0icEsDw/132', '', '4', '3', 1560608403325, 1);
INSERT INTO `evaluate` VALUES (42, 1, 124, 'oKw4p450ND5YU2HMpFZ0iPoVtd-I', '小程序个人开发者', 'https://wx.qlogo.cn/mmopen/vi_32/QxzsUdMRx2QXe0MO8q3iaOvFkXcaOicadegAhgt7ynJwPjh3xF66RGx82VuJib02bCevTrXfdibAbSy4cRlW0icEsDw/132', 'gfgdgf', '4', '3', 1560608467855, 1);
INSERT INTO `evaluate` VALUES (43, 1, 123, 'oKw4p450ND5YU2HMpFZ0iPoVtd-I', '小程序个人开发者', 'https://wx.qlogo.cn/mmopen/vi_32/QxzsUdMRx2QXe0MO8q3iaOvFkXcaOicadegAhgt7ynJwPjh3xF66RGx82VuJib02bCevTrXfdibAbSy4cRlW0icEsDw/132', 'ggdfg', '1', '4', 1560608509380, 1);
INSERT INTO `evaluate` VALUES (44, 1, 127, 'oKw4p450ND5YU2HMpFZ0iPoVtd-I', '小程序个人开发者', 'https://wx.qlogo.cn/mmopen/vi_32/QxzsUdMRx2QXe0MO8q3iaOvFkXcaOicadegAhgt7ynJwPjh3xF66RGx82VuJib02bCevTrXfdibAbSy4cRlW0icEsDw/132', 'fjlsdf', '5', '4', 1560617874295, 1);
INSERT INTO `evaluate` VALUES (45, 1, 122, 'oKw4p450ND5YU2HMpFZ0iPoVtd-I', '小程序个人开发者', 'https://wx.qlogo.cn/mmopen/vi_32/QxzsUdMRx2QXe0MO8q3iaOvFkXcaOicadegAhgt7ynJwPjh3xF66RGx82VuJib02bCevTrXfdibAbSy4cRlW0icEsDw/132', 'thhf', '5', '4', 1560617910412, 1);
COMMIT;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `title` varchar(800) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `url` varchar(255) NOT NULL COMMENT '图片url',
  `desc` varchar(8000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  `sales` int(11) DEFAULT '0' COMMENT '月售',
  `price` varchar(11) DEFAULT '0' COMMENT '价格',
  `shopid` varchar(45) NOT NULL COMMENT '所属商家id',
  `package_cost` varchar(45) DEFAULT NULL COMMENT '餐盒费用',
  `specification` varchar(800) DEFAULT NULL COMMENT '规格',
  `today` int(11) DEFAULT '2' COMMENT '1 今日推荐 2 否',
  `sort` int(11) DEFAULT '1',
  `is_delete` int(11) DEFAULT '1' COMMENT '1 存在 2 删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
BEGIN;
INSERT INTO `goods` VALUES (1, '肉末茄子', '好吃的茄子', 'https://www.bws666.com/3.jpg', '[\"https://quesong.top/attachment/images/2/2019/05/ToZ63oc5758n77CBzKYNY7kn353J6K.jpeg\",\"https://quesong.top/attachment/images/2/2019/05/aOYv8EX29S4yO8xxM8osv3UVO8IhVO.jpeg\",\"https://quesong.top/attachment/images/2/2019/05/ToZ63oc5758n77CBzKYNY7kn353J6K.jpeg\",\"https://quesong.top/attachment/images/2/2019/05/ToZ63oc5758n77CBzKYNY7kn353J6K.jpeg\",\"https://quesong.top/attachment/images/2/2019/05/ToZ63oc5758n77CBzKYNY7kn353J6K.jpeg\",\"https://quesong.top/attachment/images/2/2019/05/ToZ63oc5758n77CBzKYNY7kn353J6K.jpeg\"]', 2, '0.01', '1', '1', '', 1, 1, 1);
INSERT INTO `goods` VALUES (2, '腐竹烧肉', '好吃的肉', 'https://www.bws666.com/3.jpg', '[\"https://quesong.top/attachment/images/2/2019/05/aOYv8EX29S4yO8xxM8osv3UVO8IhVO.jpeg\",\"https://quesong.top/attachment/images/2/2019/05/ToZ63oc5758n77CBzKYNY7kn353J6K.jpeg\",\"https://quesong.top/attachment/images/2/2019/05/ToZ63oc5758n77CBzKYNY7kn353J6K.jpeg\",\"https://quesong.top/attachment/images/2/2019/05/ToZ63oc5758n77CBzKYNY7kn353J6K.jpeg\"]', 51, '20', '1', '2', NULL, 2, 1, 1);
INSERT INTO `goods` VALUES (3, '回锅肉回锅肉回锅肉回锅肉回锅肉回锅肉', '范德萨范德萨', 'https://www.bws666.com/3.jpg', '[\"https://quesong.top/attachment/images/2/2019/05/ToZ63oc5758n77CBzKYNY7kn353J6K.jpeg\",\"https://quesong.top/attachment/images/2/2019/05/ToZ63oc5758n77CBzKYNY7kn353J6K.jpeg\"]', 113, '20', '1', '3', NULL, 1, 1, 1);
INSERT INTO `goods` VALUES (4, '蒜薹肉丝蒜薹肉丝蒜薹肉丝蒜薹肉丝蒜薹肉丝蒜薹肉丝蒜薹肉丝', '韩国锦湖感觉很高', 'https://www.bws666.com/3.jpg', '[\"https://quesong.top/attachment/images/2/2019/05/ToZ63oc5758n77CBzKYNY7kn353J6K.jpeg\"]', 31, '50', '1', '3', NULL, 2, 1, 1);
INSERT INTO `goods` VALUES (5, '红烧肉红烧肉红烧肉红烧肉红烧肉红烧肉红烧肉红烧肉', '个梵蒂冈梵蒂冈', 'https://www.bws666.com/3.jpg', '[\"https://quesong.top/attachment/images/2/2019/05/ToZ63oc5758n77CBzKYNY7kn353J6K.jpeg\"]', 213, '320', '1', '2', NULL, 2, 1, 1);
INSERT INTO `goods` VALUES (55, 'name', '21', 'http://localhost:3001/goods/0XO2CMEZTCMX-1563199547942', 'http://localhost:3001/goods/XPOYA5L5UTLP-1563199546428.jpg', 0, '1', '1', '21', NULL, 1, 2, 1);
INSERT INTO `goods` VALUES (59, 'test3', '12', 'http://localhost:3001/goods/O9V41R425SQC-1563207276670', '[\"http://localhost:3001/goods/GDVY0NJT5DXF-1563205100347.jpg\"]', 0, '100', '1', '21', NULL, 1, 26, 1);
INSERT INTO `goods` VALUES (60, 'test3', '12', 'http://localhost:3001/goods/5NN6X4YA5ABZ-1563206469933', '[\"http://localhost:3001/goods/3D02E2J1LVHD-1563206459090.jpg\"]', 0, '1', '1', '21', NULL, 1, 21, 1);
COMMIT;

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) NOT NULL,
  `order_list` varchar(10000) NOT NULL COMMENT '商品id',
  `desc` varchar(45) DEFAULT NULL COMMENT '备注',
  `total_price` int(11) DEFAULT NULL COMMENT '总价',
  `discount_price` int(11) DEFAULT '0',
  `order_time` bigint(45) DEFAULT NULL COMMENT '下单时间',
  `status` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '5' COMMENT '1-未支付 2-商家未接单 3-商家接单 4-派送中 5-订单完成 6-已取消 7-已评价',
  `is_delete` int(11) DEFAULT '1' COMMENT '1 存在 2 删除',
  PRIMARY KEY (`id`,`status`) USING BTREE,
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------
BEGIN;
INSERT INTO `order` VALUES (118, 'oKw4p450ND5YU2HMpFZ0iPoVtd-I', '[{\"name\":\"腐竹烧肉\",\"goods_id\":1,\"shopid\":\"1\",\"sales\":51,\"price\":\"20\",\"discount\":\"100\",\"num\":1}]', '', 20, 0, 1560594967853, '5', 1);
INSERT INTO `order` VALUES (119, 'oKw4p450ND5YU2HMpFZ0iPoVtd-I', '[{\"name\":\"腐竹烧肉腐竹烧肉腐竹烧肉腐竹烧肉腐竹烧肉腐竹烧肉腐竹烧肉腐竹烧肉\",\"goods_id\":1,\"shopid\":\"1\",\"sales\":51,\"price\":\"20\",\"discount\":\"100\",\"num\":1}]', '', 20, 0, 1560595107077, '5', 1);
INSERT INTO `order` VALUES (120, 'oKw4p450ND5YU2HMpFZ0iPoVtd-I', '[{\"name\":\"腐竹烧肉腐竹烧肉腐竹烧肉腐竹烧肉腐竹烧肉腐竹烧肉腐竹烧肉腐竹烧肉\",\"goods_id\":1,\"shopid\":\"1\",\"sales\":51,\"price\":\"20\",\"discount\":\"100\",\"num\":1}]', '', 0, 0, 1560606927651, '5', 1);
INSERT INTO `order` VALUES (121, 'oKw4p450ND5YU2HMpFZ0iPoVtd-I', '[{\"name\":\"腐竹烧肉腐竹烧肉腐竹烧肉腐竹烧肉腐竹烧肉腐竹烧肉腐竹烧肉腐竹烧肉\",\"goods_id\":1,\"shopid\":\"1\",\"sales\":51,\"price\":\"20\",\"discount\":\"100\",\"num\":1}]', '', 0, 0, 1560606949514, '5', 1);
INSERT INTO `order` VALUES (122, 'oKw4p450ND5YU2HMpFZ0iPoVtd-I', '[{\"name\":\"腐竹烧肉腐竹烧肉腐竹烧肉腐竹烧肉腐竹烧肉腐竹烧肉腐竹烧肉腐竹烧肉\",\"goods_id\":1,\"shopid\":\"1\",\"sales\":51,\"price\":\"20\",\"discount\":\"100\",\"num\":1}]', '', 0, 0, 1560606995975, '7', 1);
INSERT INTO `order` VALUES (123, 'oKw4p450ND5YU2HMpFZ0iPoVtd-I', '[{\"name\":\"腐竹烧肉腐竹烧肉腐竹烧肉腐竹烧肉腐竹烧肉腐竹烧肉腐竹烧肉腐竹烧肉\",\"goods_id\":1,\"shopid\":\"1\",\"sales\":51,\"price\":\"20\",\"discount\":\"100\",\"num\":1}]', '', 0, 0, 1560607016810, '7', 1);
INSERT INTO `order` VALUES (124, 'oKw4p450ND5YU2HMpFZ0iPoVtd-I', '[{\"name\":\"腐竹烧肉腐竹烧肉腐竹烧肉腐竹烧肉腐竹烧肉腐竹烧肉腐竹烧肉腐竹烧肉\",\"goods_id\":1,\"shopid\":\"1\",\"sales\":51,\"price\":\"20\",\"discount\":\"100\",\"num\":1}]', '', 20, 0, 1560607220062, '7', 1);
INSERT INTO `order` VALUES (125, 'oKw4p450ND5YU2HMpFZ0iPoVtd-I', '[{\"name\":\"腐竹烧肉腐竹烧肉腐竹烧肉腐竹烧肉腐竹烧肉腐竹烧肉腐竹烧肉腐竹烧肉\",\"goods_id\":1,\"shopid\":\"1\",\"sales\":51,\"price\":\"20\",\"discount\":\"100\",\"num\":1}]', '', 2262, 0, 1560607512882, '7', 1);
INSERT INTO `order` VALUES (126, 'oKw4p450ND5YU2HMpFZ0iPoVtd-I', '[{\"name\":\"腐竹烧肉腐竹烧肉腐竹烧肉腐竹烧肉腐竹烧肉腐竹烧肉腐竹烧肉腐竹烧肉\",\"goods_id\":1,\"shopid\":\"1\",\"sales\":51,\"price\":\"20\",\"discount\":\"100\",\"num\":1}]', '', 240, 0, 1560607512883, '7', 1);
INSERT INTO `order` VALUES (127, 'oKw4p450ND5YU2HMpFZ0iPoVtd-I', '[{\"name\":\"腐竹烧肉腐竹烧肉腐竹烧肉腐竹烧肉腐竹烧肉腐竹烧肉腐竹烧肉腐竹烧肉\",\"goods_id\":1,\"shopid\":\"1\",\"sales\":51,\"price\":\"20\",\"discount\":\"100\",\"num\":1}]', '', 0, 0, 1560617862130, '7', 1);
COMMIT;

-- ----------------------------
-- Table structure for shop
-- ----------------------------
DROP TABLE IF EXISTS `shop`;
CREATE TABLE `shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL COMMENT '商家名称',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1 存在 2 删除',
  `typeid` int(11) NOT NULL DEFAULT '1' COMMENT '所属分类，默认属于第一类',
  `address` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '地址' COMMENT '商家地址',
  `campus` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '北京大学' COMMENT '校园信息',
  `sales` int(11) DEFAULT '0' COMMENT '月售',
  `desc` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '地址' COMMENT '商家描述，限定二十个字',
  `start_price` int(11) NOT NULL DEFAULT '0' COMMENT '多少钱起送',
  `send_price` int(11) NOT NULL DEFAULT '0' COMMENT '配送费\n',
  `special` varchar(800) DEFAULT NULL COMMENT '优惠 满减',
  `start_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '00:00' COMMENT '开业时间',
  `end_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '23:59' COMMENT '关门时间',
  `invite` int(11) DEFAULT NULL COMMENT '1 支持自取 2 不支持自取',
  `sort` int(11) DEFAULT '1' COMMENT '排序',
  `is_delete` int(11) DEFAULT '1' COMMENT '1 存在 2 删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='商家';

-- ----------------------------
-- Records of shop
-- ----------------------------
BEGIN;
INSERT INTO `shop` VALUES (1, '一点点奶茶', 1, 1, '地址', '北京大学', 0, '地址', 0, 0, NULL, '00:00', '23:59', NULL, 1, 1);
INSERT INTO `shop` VALUES (2, 'test', 2, 1, '北京市西湖区', '北京大学', 0, '描述', 38, 30, NULL, '15:26', '18:28', NULL, 38, 1);
INSERT INTO `shop` VALUES (3, 'test', 1, 1, '北京市西湖区', '北京大学', 0, '描述', 38, 30, NULL, '15:26', '18:28', NULL, 38, 1);
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of swiper
-- ----------------------------
BEGIN;
INSERT INTO `swiper` VALUES (1, 'https://www.bws666.com/1.jpg', '1', '北京大学', 6, 1);
INSERT INTO `swiper` VALUES (2, 'https://www.bws666.com/2.jpg', '1', '北京大学', 2, 1);
INSERT INTO `swiper` VALUES (3, 'https://www.bws666.com/3.jpg', '2', '北京大学', 3, 1);
INSERT INTO `swiper` VALUES (4, 'http://localhost:3001/45TZRM3M6N90-1562850613400', '2', '北京大学', 4, 1);
INSERT INTO `swiper` VALUES (5, 'https://www.bws666.com/4.jpg', '2', '北京大学', 1, 1);
INSERT INTO `swiper` VALUES (25, 'http://localhost:3001/ILYCZ7PE0EKQ-1563195088362', '1', '北京大学', 43, 1);
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
  `username` varchar(45) DEFAULT NULL,
  `address` varchar(10000) DEFAULT NULL COMMENT '校外地址',
  `create_time` datetime(6) DEFAULT NULL,
  `is_delete` int(11) DEFAULT '1' COMMENT '1 存在 2 删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `openid_UNIQUE` (`openid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (7, 'oKw4p450ND5YU2HMpFZ0iPoVtd-I', NULL, NULL, '1232321', 'zhangzhen', '[{\"username\":\"zhangzhen\",\"phone\":\"1232321\",\"campus\":\"广州市 北京大学\",\"floor\":\"暂无取餐点\",\"default\":true}]', '2019-07-16 02:21:21.000000', 1);
INSERT INTO `user` VALUES (8, 'jdhfj', NULL, NULL, NULL, NULL, NULL, '2019-07-17 00:53:30.000000', 1);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
