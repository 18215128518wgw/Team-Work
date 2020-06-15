/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50730
Source Host           : localhost:3306
Source Database       : happyfarm

Target Server Type    : MYSQL
Target Server Version : 50730
File Encoding         : 65001

Date: 2020-06-14 21:15:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(10) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', '123456', '1');

-- ----------------------------
-- Table structure for cityuser
-- ----------------------------
DROP TABLE IF EXISTS `cityuser`;
CREATE TABLE `cityuser` (
  `id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `land1` varchar(255) DEFAULT NULL,
  `land1_endtime` varchar(255) DEFAULT NULL,
  `land2` varchar(255) DEFAULT NULL,
  `land2_endtime` varchar(255) DEFAULT NULL,
  `land3` varchar(255) DEFAULT NULL,
  `land3_endtime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cityuser
-- ----------------------------
INSERT INTO `cityuser` VALUES ('1', 'cityuser', '123456', '1', '2020-12-01', '2', '2020-12-01', '3', '2020-12-01');
INSERT INTO `cityuser` VALUES ('2', 'wgw', '123456', '1', '2021-08-12', null, null, null, null);

-- ----------------------------
-- Table structure for courier
-- ----------------------------
DROP TABLE IF EXISTS `courier`;
CREATE TABLE `courier` (
  `id` int(11) NOT NULL,
  `number` varchar(255) DEFAULT NULL,
  `price` int(10) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `start_time` varchar(255) DEFAULT NULL,
  `stop_time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of courier
-- ----------------------------
INSERT INTO `courier` VALUES ('1', '98765', '100', '甘肃省兰州市西北师范大学', '10086', '2020-06-14 15:23:23', '2020-06-16 12:23:46');

-- ----------------------------
-- Table structure for land
-- ----------------------------
DROP TABLE IF EXISTS `land`;
CREATE TABLE `land` (
  `id` int(11) NOT NULL,
  `size` int(11) DEFAULT NULL COMMENT '土地大小',
  `unit_price` int(11) DEFAULT NULL COMMENT '单价（/月）',
  `validtime` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL COMMENT '租界状态',
  `using_person` int(255) DEFAULT NULL COMMENT '使用人，这里是cityuser的id',
  `instruction` varchar(255) DEFAULT NULL COMMENT '土地简介',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of land
-- ----------------------------
INSERT INTO `land` VALUES ('1', '20', '200', '2022-12', '兰州市石头村123号右拐第二块', '1', '1', '一等一的上好黑土地，谁买谁知道');
INSERT INTO `land` VALUES ('2', '25', '230', '2022-12', '兰州市石头村7号屋后第二块', '1', '1', '土地肥沃，松软');
INSERT INTO `land` VALUES ('3', '23', '250', '2022-12', '兰州市石头村235号屋后第一块', '1', '1', '农家肥料浇灌，保产');
INSERT INTO `land` VALUES ('4', '15', '150', '2022-12', '兰州市石头村村口第三块', '1', '1', '绝无病虫以及农药污染');
INSERT INTO `land` VALUES ('5', '20', '300', '2022-12', '兰州市石头村村口第三块', '0', null, '土地支持全托管');

-- ----------------------------
-- Table structure for landuser
-- ----------------------------
DROP TABLE IF EXISTS `landuser`;
CREATE TABLE `landuser` (
  `id` int(10) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `landnum` varchar(255) DEFAULT NULL,
  `work_status` tinyint(4) DEFAULT NULL COMMENT '工作状态，1可接，0不接',
  `work_price` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of landuser
-- ----------------------------
INSERT INTO `landuser` VALUES ('1', '农户1', '123456', '1,2,3,4', '1', '50');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `order_type` int(10) DEFAULT NULL COMMENT '订单类型，例如土地订单或者帮种订单',
  `order_land_num` int(11) DEFAULT NULL COMMENT '订单所属土地号',
  `order_price` int(10) DEFAULT NULL,
  `order_content` varchar(255) DEFAULT NULL,
  `vegetables_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('1', '1', '5', '600', '种菜', '1');
INSERT INTO `order` VALUES ('2', '2', '1', '50', '让农户1帮我除草', null);

-- ----------------------------
-- Table structure for vegetables
-- ----------------------------
DROP TABLE IF EXISTS `vegetables`;
CREATE TABLE `vegetables` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` int(10) DEFAULT NULL COMMENT '生长时间，单位为月',
  `growth_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of vegetables
-- ----------------------------
INSERT INTO `vegetables` VALUES ('1', '包心菜', '20', '3');
INSERT INTO `vegetables` VALUES ('2', '土豆', '10', '4');
