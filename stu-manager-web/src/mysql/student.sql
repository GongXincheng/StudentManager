/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : student

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2018-05-12 17:09:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for accesscount
-- ----------------------------
DROP TABLE IF EXISTS `accesscount`;
CREATE TABLE `accesscount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(255) DEFAULT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for accessdetail
-- ----------------------------
DROP TABLE IF EXISTS `accessdetail`;
CREATE TABLE `accessdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(20) DEFAULT NULL,
  `ipLocation` varchar(255) DEFAULT NULL,
  `resourcePath` varchar(255) DEFAULT NULL,
  `comeDate` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=870 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for deptment
-- ----------------------------
DROP TABLE IF EXISTS `deptment`;
CREATE TABLE `deptment` (
  `deptId` int(11) NOT NULL AUTO_INCREMENT,
  `deptName` varchar(60) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `discription` varchar(500) DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`deptId`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for specialty
-- ----------------------------
DROP TABLE IF EXISTS `specialty`;
CREATE TABLE `specialty` (
  `speId` int(11) NOT NULL AUTO_INCREMENT,
  `speName` varchar(60) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `deptId` int(11) DEFAULT NULL,
  `deptName` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`speId`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for stu
-- ----------------------------
DROP TABLE IF EXISTS `stu`;
CREATE TABLE `stu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stuId` varchar(20) DEFAULT NULL,
  `stuName` varchar(50) DEFAULT NULL,
  `gender` int(1) DEFAULT NULL,
  `headPic` varchar(255) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `comeDate` datetime DEFAULT NULL,
  `speId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;
