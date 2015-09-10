/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50037
Source Host           : localhost:3306
Source Database       : jeecg

Target Server Type    : MYSQL
Target Server Version : 50037
File Encoding         : 65001

Date: 2011-12-31 13:47:09
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `jeecg_one_demo`
-- ----------------------------
DROP TABLE IF EXISTS `jeecg_one_demo`;
CREATE TABLE `jeecg_one_demo` (
  `OBID` varchar(36) NOT NULL default '' COMMENT '主键',
  `NAME` varchar(32) default NULL COMMENT '用户名',
  `AGE` int(4) default NULL COMMENT '年龄',
  `SALARY` decimal(10,2) default NULL COMMENT '工资',
  `BIRTHDAY` date default NULL COMMENT '生日',
  `REGISTER_DT` datetime default NULL COMMENT '注册时间',
  `CRTUSER` varchar(36) default NULL COMMENT '创建人ID',
  `CRTUSER_NAME` varchar(50) default NULL COMMENT '创建人',
  `CREATE_DT` datetime default NULL COMMENT '创建时间',
  PRIMARY KEY  (`OBID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jeecg_one_demo
-- ----------------------------
