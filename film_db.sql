/*
Navicat MySQL Data Transfer

Source Server         : local3309
Source Server Version : 50528
Source Host           : localhost:3309
Source Database       : film_db

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2016-04-06 17:51:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `film`
-- ----------------------------
DROP TABLE IF EXISTS `film`;
CREATE TABLE `film` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '影片ID',
  `fname` varchar(255) DEFAULT NULL COMMENT '影片名称',
  `orderKey` int(11) DEFAULT NULL COMMENT '排序的值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of film
-- ----------------------------
INSERT INTO `film` VALUES ('1', '新龙门客栈', '1');
INSERT INTO `film` VALUES ('2', '人间师格', '2');

-- ----------------------------
-- Table structure for `t_admin`
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `nickname` varchar(255) NOT NULL COMMENT '用户名',
  PRIMARY KEY (`nickname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('Jack');
INSERT INTO `t_admin` VALUES ('Jenny');
INSERT INTO `t_admin` VALUES ('Julius');
INSERT INTO `t_admin` VALUES ('Timon');

-- ----------------------------
-- Table structure for `t_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_log`;
CREATE TABLE `t_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(20) unsigned NOT NULL,
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建日期',
  `content` varchar(8000) NOT NULL DEFAULT '' COMMENT '日志内容',
  `operation` varchar(250) NOT NULL DEFAULT '' COMMENT '用户所做的操作',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_log
-- ----------------------------
