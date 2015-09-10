/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50037
Source Host           : localhost:3306
Source Database       : easyssh

Target Server Type    : MYSQL
Target Server Version : 50037
File Encoding         : 65001

Date: 2011-12-31 16:06:55
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `jeecg_order_custom`
-- ----------------------------
DROP TABLE IF EXISTS `jeecg_order_custom`;
CREATE TABLE `jeecg_order_custom` (
  `OBID` varchar(36) NOT NULL,
  `GORDER_OBID` varchar(36) NOT NULL COMMENT '团购订单ID',
  `GO_ORDER_CODE` varchar(36) NOT NULL COMMENT '团购订单号',
  `GOC_CUS_NAME_EN` varchar(50) default NULL COMMENT '客户英文名',
  `GOC_CUS_NAME` varchar(50) default NULL COMMENT '姓名',
  `GOC_CUS_TYPE` varchar(3) default NULL COMMENT '人员类型',
  `GOC_SEX` varchar(2) default NULL COMMENT '性别',
  `GOC_IDCARD` varchar(32) default NULL COMMENT '身份证号',
  `GOC_BIRTHDAY` date default NULL COMMENT '出生日期',
  `GOC_PASSPORT_CODE` varchar(32) default NULL COMMENT '护照号',
  `GOC_PASSPORT_END_DATE` date default NULL COMMENT '护照有效期',
  `GOC_BUSS_CONTENT` varchar(100) default NULL COMMENT '业务',
  `GOC_ROOM_NUM` varchar(10) default NULL COMMENT '同住',
  `GOC_CONTENT` varchar(200) default NULL COMMENT '备注',
  `CRTUSER` varchar(36) default NULL COMMENT '创建人',
  `CRTUSER_NAME` varchar(32) default NULL COMMENT '创建人名字',
  `CREATE_DT` datetime default NULL COMMENT '创建时间',
  `MODIFIER` varchar(36) default NULL COMMENT '修改人',
  `MODIFIER_NAME` varchar(32) default NULL COMMENT '修改人名字',
  `MODIFY_DT` datetime default NULL COMMENT '修改时间',
  `DELFLAG` int(11) default '0' COMMENT '删除标记',
  `DEL_DT` datetime default NULL COMMENT '删除时间',
  PRIMARY KEY  (`OBID`,`GORDER_OBID`,`GO_ORDER_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='团购订单客户信息';

-- ----------------------------
-- Records of jeecg_order_custom
-- ----------------------------

-- ----------------------------
-- Table structure for `jeecg_order_main`
-- ----------------------------
DROP TABLE IF EXISTS `jeecg_order_main`;
CREATE TABLE `jeecg_order_main` (
  `OBID` varchar(36) NOT NULL COMMENT '主键',
  `GO_ORDER_CODE` varchar(36) NOT NULL COMMENT '订单号',
  `GODER_TYPE` varchar(2) default NULL COMMENT '订单类型 01:团单 02 单机票 03 单酒店 04 单签证 05 外拼 06 自由行',
  `GO_STATUS` varchar(2) default NULL COMMENT '订单团购状态 01:占位 02:已订 03::取消',
  `TOURISTID` varchar(36) default NULL COMMENT '旅行社ID',
  `AGENCY_ID` varchar(36) default NULL COMMENT '旅行社门店ID',
  `AGENCY_NAME` varchar(50) default NULL COMMENT '旅行社名称',
  `LINKMENID` varchar(36) default NULL COMMENT '联系人ID',
  `USERTYPE` varchar(1) default NULL COMMENT '顾客类型 : 1直客 2同行',
  `GO_CUS_NAME` varchar(50) default NULL COMMENT '客户',
  `GO_SALE_NAME` varchar(100) default NULL COMMENT '销售人',
  `GO_SALE_ID` varchar(36) default NULL COMMENT '销售人ID',
  `GO_CONTACT_NAME` varchar(50) default NULL COMMENT '联系人',
  `GO_ZONE_NO` varchar(6) default NULL COMMENT '区号',
  `GO_PHONE` varchar(20) default NULL COMMENT '电话',
  `GO_TELPHONE` varchar(20) default NULL COMMENT '手机',
  `GO_FACSIMILE` varchar(32) default NULL COMMENT '传真',
  `GO_MAIL` varchar(32) default NULL COMMENT '邮箱',
  `GO_ORDER_COUNT` int(11) default NULL COMMENT '订单人数',
  `GO_ALL_PRICE` decimal(10,2) default NULL COMMENT '总价(不含返款)',
  `GO_RETURN_PRICE` decimal(10,2) default NULL COMMENT '返款',
  `GO_CONTENT` varchar(200) default NULL COMMENT '备注',
  `AUDITOR_STATUS` varchar(2) default NULL COMMENT '审核状态 01:待审核 02:审核中 03:通过 04 驳回',
  `AUDITOR_OBID` varchar(36) default NULL COMMENT '审核人ID',
  `AUDITOR_NAME` varchar(50) default NULL COMMENT '审核人',
  `CRTUSER` varchar(36) default NULL COMMENT '创建人',
  `CRTUSER_NAME` varchar(32) default NULL COMMENT '创建人名字',
  `CREATE_DT` datetime default NULL COMMENT '创建时间',
  `MODIFIER` varchar(36) default NULL COMMENT '修改人',
  `MODIFIER_NAME` varchar(32) default NULL COMMENT '修改人名字',
  `MODIFY_DT` datetime default NULL COMMENT '修改时间',
  `DELFLAG` int(11) default '0' COMMENT '删除标记',
  `DEL_DT` datetime default NULL COMMENT '删除时间',
  PRIMARY KEY  (`OBID`,`GO_ORDER_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='团购订单表';

-- ----------------------------
-- Records of jeecg_order_main
-- ----------------------------

-- ----------------------------
-- Table structure for `jeecg_order_product`
-- ----------------------------
DROP TABLE IF EXISTS `jeecg_order_product`;
CREATE TABLE `jeecg_order_product` (
  `OBID` varchar(36) NOT NULL,
  `GORDER_OBID` varchar(36) NOT NULL COMMENT '团购订单ID',
  `GO_ORDER_CODE` varchar(36) NOT NULL COMMENT '团购订单号',
  `gop_product_type` varchar(3) NOT NULL COMMENT '服务项目类型',
  `GOP_PRODUCT_NAME` varchar(100) default NULL COMMENT '产品名称',
  `GOP_COUNT` int(11) default NULL COMMENT '个数',
  `GOP_UNIT` varchar(2) default NULL COMMENT '单位',
  `GOP_ONE_PRICE` decimal(10,2) default NULL COMMENT '单价',
  `GOP_SUM_PRICE` decimal(10,2) default NULL COMMENT '小计',
  `GOP_CONTENT` varchar(200) default NULL COMMENT '备注',
  `CRTUSER` varchar(36) default NULL COMMENT '创建人',
  `CRTUSER_NAME` varchar(32) default NULL COMMENT '创建人名字',
  `CREATE_DT` datetime default NULL COMMENT '创建时间',
  `MODIFIER` varchar(36) default NULL COMMENT '修改人',
  `MODIFIER_NAME` varchar(32) default NULL COMMENT '修改人名字',
  `MODIFY_DT` datetime default NULL COMMENT '修改时间',
  `DELFLAG` int(11) default '0' COMMENT '删除标记',
  `DEL_DT` datetime default NULL COMMENT '删除时间',
  PRIMARY KEY  (`OBID`,`GORDER_OBID`,`GO_ORDER_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='团购订单产品信息';

-- ----------------------------
-- Records of jeecg_order_product
-- ----------------------------
