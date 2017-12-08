/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : sell

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2017-12-08 17:21:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for foods
-- ----------------------------
DROP TABLE IF EXISTS `foods`;
CREATE TABLE `foods` (
  `food_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `food_name` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `food_price` decimal(2,0) DEFAULT NULL COMMENT '商品现价',
  `food_oldPrice` decimal(2,0) DEFAULT NULL COMMENT '商品原价',
  `food_description` varchar(255) DEFAULT NULL COMMENT '商品描述',
  `food_sellCount` int(11) DEFAULT NULL COMMENT '销售数量',
  `food_info` varchar(255) DEFAULT NULL COMMENT '商品详细描述',
  `food_category` int(11) DEFAULT NULL COMMENT '商品分类',
  PRIMARY KEY (`food_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='商品表';

-- ----------------------------
-- Records of foods
-- ----------------------------

-- ----------------------------
-- Table structure for food_categories
-- ----------------------------
DROP TABLE IF EXISTS `food_categories`;
CREATE TABLE `food_categories` (
  `food_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `food_category_sell_id` int(11) DEFAULT NULL COMMENT '商家id',
  `food_category_name` varchar(100) DEFAULT NULL COMMENT '商品栏目名称',
  PRIMARY KEY (`food_category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='商品栏目表';

-- ----------------------------
-- Records of food_categories
-- ----------------------------

-- ----------------------------
-- Table structure for images
-- ----------------------------
DROP TABLE IF EXISTS `images`;
CREATE TABLE `images` (
  `image_id` int(11) NOT NULL AUTO_INCREMENT,
  `sell_id` int(11) DEFAULT NULL COMMENT '商家id',
  `image_pic` varchar(255) DEFAULT NULL COMMENT '图片路径',
  `image_type` tinyint(1) DEFAULT NULL COMMENT '图片类型 1-商家图片  2-商品图片',
  PRIMARY KEY (`image_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='图片表';

-- ----------------------------
-- Records of images
-- ----------------------------

-- ----------------------------
-- Table structure for ratings
-- ----------------------------
DROP TABLE IF EXISTS `ratings`;
CREATE TABLE `ratings` (
  `rating_id` int(11) DEFAULT NULL,
  `rating_username` varchar(100) DEFAULT NULL COMMENT '打分用户名',
  `rating_rateTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '打分时间',
  `rating_avatar` varchar(255) DEFAULT NULL COMMENT '用户头像地址',
  `rating_text` varchar(255) DEFAULT NULL COMMENT '打分留言'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='打分';

-- ----------------------------
-- Records of ratings
-- ----------------------------

-- ----------------------------
-- Table structure for sells
-- ----------------------------
DROP TABLE IF EXISTS `sells`;
CREATE TABLE `sells` (
  `sell_id` int(11) NOT NULL AUTO_INCREMENT,
  `sell_name` varchar(100) DEFAULT NULL COMMENT '商家名称',
  `sell_description` varchar(255) DEFAULT NULL COMMENT '商家描述',
  `sell_deliveryTime` int(3) DEFAULT NULL COMMENT '配送时间',
  `sell_score` decimal(2,0) DEFAULT NULL COMMENT '商家评分',
  `sell_serviceScore` decimal(2,0) DEFAULT NULL COMMENT '服务评分',
  `sell_foodScore` decimal(2,0) DEFAULT NULL COMMENT '商品评分',
  `sell_bulletin` varchar(255) DEFAULT NULL COMMENT '公告',
  `sell_avatar` varchar(255) DEFAULT NULL,
  `sell_office_start_time` varchar(5) DEFAULT NULL COMMENT '商家营业开始时间',
  `sell_office_end_time` varchar(5) DEFAULT NULL COMMENT '商家运营结束时间',
  `sell_address` varchar(255) DEFAULT NULL COMMENT '商家地址',
  `sell_invoice` tinyint(1) DEFAULT NULL COMMENT '商家发票 0-不支持 1支持',
  `sell_category` int(11) DEFAULT NULL COMMENT '商家类别',
  PRIMARY KEY (`sell_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='商家信息表';

-- ----------------------------
-- Records of sells
-- ----------------------------
INSERT INTO `sells` VALUES ('1', '粥品香坊（回龙观）', '蜂鸟专送', '38', '4', '4', '4', '69.2', 'http://static.galileo.xiaojukeji.com/static/tms/seller_avatar_256px.jpg', '10:00', '20:30', '北京市昌平区回龙观西大街龙观置业大厦底商B座102单元1340', '1', '2');

-- ----------------------------
-- Table structure for sell_category
-- ----------------------------
DROP TABLE IF EXISTS `sell_category`;
CREATE TABLE `sell_category` (
  `sell_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `sell_category_name` varchar(255) DEFAULT NULL,
  `sell_category_pid` int(11) DEFAULT NULL COMMENT '商家父级id',
  PRIMARY KEY (`sell_category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='商店类型';

-- ----------------------------
-- Records of sell_category
-- ----------------------------
INSERT INTO `sell_category` VALUES ('1', '其他菜系', '0');
INSERT INTO `sell_category` VALUES ('2', '包子粥店', '1');
