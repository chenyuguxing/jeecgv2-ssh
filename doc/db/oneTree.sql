
SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `jeecg_tree_demo`
-- ----------------------------
DROP TABLE IF EXISTS `jeecg_tree_demo`;
CREATE TABLE `jeecg_tree_demo` (
  `obid` varchar(36) NOT NULL,
  `CICONCLS` varchar(255) default NULL,
  `CNAME` varchar(255) default NULL,
  `CSEQ` decimal(19,2) default NULL,
  `CURL` varchar(255) default NULL,
  `CPID` varchar(36) default NULL,
  PRIMARY KEY  (`obid`),
  KEY `FKA4449D0447A7F50` (`CPID`),
  CONSTRAINT `FKA4449D0447A7F50` FOREIGN KEY (`CPID`) REFERENCES `jeecg_tree_demo` (`obid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
