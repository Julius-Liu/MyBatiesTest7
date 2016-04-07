/*
Navicat MySQL Data Transfer

Source Server         : local3309
Source Server Version : 50528
Source Host           : localhost:3309
Source Database       : film_db

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2016-04-07 17:41:52
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of film
-- ----------------------------
INSERT INTO `film` VALUES ('1', '新龙门客栈', '1');
INSERT INTO `film` VALUES ('2', '人间师格', '2');
INSERT INTO `film` VALUES ('3', '?????', null);
INSERT INTO `film` VALUES ('4', '彗星来的那一夜', null);
INSERT INTO `film` VALUES ('5', '盲井', null);
INSERT INTO `film` VALUES ('6', '?', null);
INSERT INTO `film` VALUES ('7', '港囧', null);

-- ----------------------------
-- Table structure for `t_admin`
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `id` int(11) NOT NULL,
  `nickname` varchar(255) NOT NULL COMMENT '用户名',
  `passwd` varchar(255) NOT NULL COMMENT '密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('1', 'Jack', '123123');
INSERT INTO `t_admin` VALUES ('2', 'Jenny', '123123');
INSERT INTO `t_admin` VALUES ('3', 'Julius', '123123');
INSERT INTO `t_admin` VALUES ('4', 'Timon', '123123');

-- ----------------------------
-- Table structure for `t_group`
-- ----------------------------
DROP TABLE IF EXISTS `t_group`;
CREATE TABLE `t_group` (
  `id` int(11) NOT NULL COMMENT 'id',
  `groupname` varchar(255) DEFAULT NULL COMMENT '组名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_group
-- ----------------------------
INSERT INTO `t_group` VALUES ('1', '组别1');
INSERT INTO `t_group` VALUES ('2', '组别2');
INSERT INTO `t_group` VALUES ('3', '组别3');

-- ----------------------------
-- Table structure for `t_group_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_group_role`;
CREATE TABLE `t_group_role` (
  `groupid` int(11) NOT NULL DEFAULT '0',
  `content` varchar(255) DEFAULT NULL,
  `roleid` int(11) DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_group_role
-- ----------------------------
INSERT INTO `t_group_role` VALUES ('1', '这里是1', '1');
INSERT INTO `t_group_role` VALUES ('2', '这里是2', '2');
INSERT INTO `t_group_role` VALUES ('3', '这里是3', '3');

-- ----------------------------
-- Table structure for `t_group_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_group_user`;
CREATE TABLE `t_group_user` (
  `groupid` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_group_user
-- ----------------------------
INSERT INTO `t_group_user` VALUES ('1', '1');
INSERT INTO `t_group_user` VALUES ('2', '2');
INSERT INTO `t_group_user` VALUES ('3', '3');
INSERT INTO `t_group_user` VALUES ('4', '4');

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_log
-- ----------------------------
INSERT INTO `t_log` VALUES ('4', '3', '2016-04-06 23:01:17', '?Julius', '??');
INSERT INTO `t_log` VALUES ('5', '3', '2016-04-06 23:04:26', '?Julius', '??');
INSERT INTO `t_log` VALUES ('6', '3', '2016-04-07 09:57:12', '?Julius', '??');
INSERT INTO `t_log` VALUES ('7', '3', '2016-04-07 10:00:59', 'insertFilm[??1????Film???(getFname : ?????)]', '??');
INSERT INTO `t_log` VALUES ('8', '3', '2016-04-07 11:02:48', '管理员Julius', '登录');
INSERT INTO `t_log` VALUES ('9', '3', '2016-04-07 11:03:08', 'insertFilm[参数1，类型：Film，值：(getFname : 彗星来的那一夜)]', '添加');
INSERT INTO `t_log` VALUES ('10', '3', '2016-04-07 11:06:52', '管理员Julius', '登录');
INSERT INTO `t_log` VALUES ('11', '3', '2016-04-07 11:07:09', 'insertFilm[参数1，类型：Film，值：(getFname : 盲井)]', '添加');
INSERT INTO `t_log` VALUES ('12', '3', '2016-04-07 11:09:09', '???Julius', '??');
INSERT INTO `t_log` VALUES ('13', '3', '2016-04-07 11:09:30', 'insertFilm[??1????Film???(getFname : ?)]', '??');
INSERT INTO `t_log` VALUES ('14', '3', '2016-04-07 11:12:53', '管理员Julius', '登录');
INSERT INTO `t_log` VALUES ('15', '3', '2016-04-07 11:13:12', 'insertFilm[参数1，类型：Film，值：(getFname : 港囧)]', '添加');

-- ----------------------------
-- Table structure for `t_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` int(11) NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', 'ROLE_ADMIN');
INSERT INTO `t_role` VALUES ('2', 'ROLE_UPDATE_FILM');
INSERT INTO `t_role` VALUES ('3', 'ROLE_DELETE_FILM');
INSERT INTO `t_role` VALUES ('4', 'ROLE_ADD_FILM');

-- ----------------------------
-- Table structure for `t_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `userid` int(11) NOT NULL,
  `roleid` int(11) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES ('1', '1');
INSERT INTO `t_user_role` VALUES ('2', '2');
INSERT INTO `t_user_role` VALUES ('3', '3');
INSERT INTO `t_user_role` VALUES ('4', '4');
