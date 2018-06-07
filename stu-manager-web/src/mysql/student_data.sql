/*
Navicat MySQL Data Transfer

Source Server         : Server-Centos7
Source Server Version : 50721
Source Host           : 39.105.25.213:3306
Source Database       : student

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2018-05-11 02:40:07
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of accesscount
-- ----------------------------
INSERT INTO `accesscount` VALUES ('4', '2018/05/01', '49');
INSERT INTO `accesscount` VALUES ('5', '2018/05/02', '152');
INSERT INTO `accesscount` VALUES ('6', '2018/05/03', '200');
INSERT INTO `accesscount` VALUES ('7', '2018/05/04', '500');
INSERT INTO `accesscount` VALUES ('8', '2018/05/05', '289');
INSERT INTO `accesscount` VALUES ('9', '2018/05/06', '236');
INSERT INTO `accesscount` VALUES ('10', '2018/05/07', '98');
INSERT INTO `accesscount` VALUES ('11', '2018/05/08', '136');
INSERT INTO `accesscount` VALUES ('12', '2018/05/09', '360');
INSERT INTO `accesscount` VALUES ('13', '2018/05/10', '230');
INSERT INTO `accesscount` VALUES ('14', '2018/05/11', '109');

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
) ENGINE=InnoDB AUTO_INCREMENT=529 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of accessdetail
-- ----------------------------
INSERT INTO `accessdetail` VALUES ('492', '187.194.93.189', '', '/', '2018-05-11 01:24:52.131');
INSERT INTO `accessdetail` VALUES ('493', '187.194.93.189', '', '/', '2018-05-11 01:24:53.582');
INSERT INTO `accessdetail` VALUES ('494', '177.11.142.10', '', '/', '2018-05-11 01:29:56.779');
INSERT INTO `accessdetail` VALUES ('495', '187.155.134.144', '', '/', '2018-05-11 01:31:31.133');
INSERT INTO `accessdetail` VALUES ('496', '223.104.187.110', '', '/', '2018-05-11 01:31:54.779');
INSERT INTO `accessdetail` VALUES ('497', '223.104.187.110', '', '/', '2018-05-11 01:32:59.556');
INSERT INTO `accessdetail` VALUES ('498', '223.104.187.110', '', '/stu/stuList.html', '2018-05-11 01:33:06.244');
INSERT INTO `accessdetail` VALUES ('499', '223.104.187.110', '', '/', '2018-05-11 01:33:14.084');
INSERT INTO `accessdetail` VALUES ('500', '187.207.153.9', '', '/', '2018-05-11 01:36:01.533');
INSERT INTO `accessdetail` VALUES ('501', '223.104.187.110', '', '/', '2018-05-11 01:53:11');
INSERT INTO `accessdetail` VALUES ('502', '223.104.187.110', '', '/', '2018-05-11 01:58:11');
INSERT INTO `accessdetail` VALUES ('503', '223.104.187.110', '', '/', '2018-05-11 02:00:11');
INSERT INTO `accessdetail` VALUES ('504', '223.104.187.110', '', '/', '2018-05-11 02:05:11');
INSERT INTO `accessdetail` VALUES ('505', '223.104.187.110', '', '/dept/addDept.html', '2018-05-11 02:06:11');
INSERT INTO `accessdetail` VALUES ('506', '223.104.187.110', '', '/dept/addDept.html', '2018-05-11 02:07:11');
INSERT INTO `accessdetail` VALUES ('507', '223.104.187.110', '', '/dept/addDept.html', '2018-05-11 02:08:11');
INSERT INTO `accessdetail` VALUES ('508', '223.104.187.110', '', '/dept/addDept.html', '2018-05-11 02:09:11');
INSERT INTO `accessdetail` VALUES ('509', '223.104.187.110', '', '/spe/addSpe.html', '2018-05-11 02:12:11');
INSERT INTO `accessdetail` VALUES ('510', '223.104.187.110', '', '/spe/addSpe.html', '2018-05-11 02:13:11');
INSERT INTO `accessdetail` VALUES ('511', '223.104.187.110', '', '/spe/spetList.html', '2018-05-11 02:14:11');
INSERT INTO `accessdetail` VALUES ('512', '223.104.187.110', '', '/spe/addSpe.html', '2018-05-11 02:15:11');
INSERT INTO `accessdetail` VALUES ('513', '223.104.187.110', '', '/spe/addSpe.html', '2018-05-11 02:16:11');
INSERT INTO `accessdetail` VALUES ('514', '223.104.187.110', '', '/spe/addSpe.html', '2018-05-11 02:17:11');
INSERT INTO `accessdetail` VALUES ('515', '223.104.187.110', '', '/spe/addSpe.html', '2018-05-11 02:18:11');
INSERT INTO `accessdetail` VALUES ('516', '223.104.187.110', '', '/spe/addSpe.html', '2018-05-11 02:19:11');
INSERT INTO `accessdetail` VALUES ('517', '223.104.187.110', '', '/spe/addSpe.html', '2018-05-11 02:20:11');
INSERT INTO `accessdetail` VALUES ('518', '223.104.187.110', '', '/dept/deptList.html', '2018-05-11 02:21:11');
INSERT INTO `accessdetail` VALUES ('519', '223.104.187.110', '', '/stu/findStuById.action', '2018-05-11 02:22:11');
INSERT INTO `accessdetail` VALUES ('520', '223.104.187.110', '', '/stu/findSpeByDeptId.action', '2018-05-11 02:23:11');
INSERT INTO `accessdetail` VALUES ('521', '223.104.187.110', '', '/stu/stuList.html', '2018-05-11 02:24:11');
INSERT INTO `accessdetail` VALUES ('522', '223.104.187.110', '', '/stu/findSpeByDeptId.action', '2018-05-11 02:25:11');
INSERT INTO `accessdetail` VALUES ('523', '120.24.208.141', '', '/', '2018-05-11 02:25:11');
INSERT INTO `accessdetail` VALUES ('524', '223.104.187.110', '', '/stu/findStuById.action', '2018-05-11 02:26:11');
INSERT INTO `accessdetail` VALUES ('525', '223.104.187.110', '', '/', '2018-05-11 02:27:11');
INSERT INTO `accessdetail` VALUES ('526', '223.104.187.110', '', '/', '2018-05-11 02:31:11');
INSERT INTO `accessdetail` VALUES ('527', '223.104.187.110', '', '/', '2018-05-11 02:33:11');
INSERT INTO `accessdetail` VALUES ('528', '223.104.187.110', '', '/stu/addStuPage.html', '2018-05-11 02:34:11');

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
-- Records of deptment
-- ----------------------------
INSERT INTO `deptment` VALUES ('21', '计算机工程学院', '2018-05-11 02:06:01', '计算机工程学院', '2018-05-11 02:06:01');
INSERT INTO `deptment` VALUES ('22', '经济管理学院', '2018-05-11 02:06:52', '经济管理学院', '2018-05-11 02:06:52');
INSERT INTO `deptment` VALUES ('23', '信息与控制学院', '2018-05-11 02:07:50', '信息与控制学院', '2018-05-11 02:07:50');
INSERT INTO `deptment` VALUES ('24', '机电与车辆工程学院', '2018-05-11 02:08:12', '机电与车辆工程学院', '2018-05-11 02:08:12');
INSERT INTO `deptment` VALUES ('25', '数学与信息科学学院', '2018-05-11 02:08:31', '数学与信息科学学院', '2018-05-11 02:08:31');
INSERT INTO `deptment` VALUES ('26', '外国语学院', '2018-05-11 02:08:44', '外国语学院', '2018-05-11 02:08:44');
INSERT INTO `deptment` VALUES ('27', '物理与光电工程学院', '2018-05-11 02:09:03', '物理与光电工程学院', '2018-05-11 02:09:03');
INSERT INTO `deptment` VALUES ('28', '历史文化与旅游学院', '2018-05-11 02:09:25', '历史文化与旅游学院', '2018-05-11 02:09:25');

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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of specialty
-- ----------------------------
INSERT INTO `specialty` VALUES ('24', '计算机科学院技术', '2018-05-11 02:12:56', '计算机科学院技术', '21', '计算机工程学院');
INSERT INTO `specialty` VALUES ('25', '网络工程', '2018-05-11 02:13:12', '网络工程', '21', '计算机工程学院');
INSERT INTO `specialty` VALUES ('28', '通信工程', '2018-05-11 02:14:43', '通信工程', '21', '计算机工程学院');
INSERT INTO `specialty` VALUES ('29', '软件工程', '2018-05-11 02:14:59', '软件工程', '21', '计算机工程学院');
INSERT INTO `specialty` VALUES ('30', '会计学', '2018-05-11 02:15:17', '会计学', '22', '经济管理学院');
INSERT INTO `specialty` VALUES ('31', '市场营销', '2018-05-11 02:15:33', '市场营销', '22', '经济管理学院');
INSERT INTO `specialty` VALUES ('32', '经济与金融', '2018-05-11 02:15:52', '经济与金融', '22', '经济管理学院');
INSERT INTO `specialty` VALUES ('33', '自动化', '2018-05-11 02:16:55', '自动化', '23', '信息与控制学院');
INSERT INTO `specialty` VALUES ('34', '电子信息工程', '2018-05-11 02:17:06', '电子信息工程', '23', '信息与控制学院');
INSERT INTO `specialty` VALUES ('35', '历史学', '2018-05-11 02:17:27', '历史学', '28', '历史文化与旅游学院');
INSERT INTO `specialty` VALUES ('36', '旅游管理', '2018-05-11 02:17:41', '旅游管理', '28', '历史文化与旅游学院');
INSERT INTO `specialty` VALUES ('37', '物理学', '2018-05-11 02:17:57', '物理学', '27', '物理与光电工程学院');
INSERT INTO `specialty` VALUES ('38', '电子科学与技术', '2018-05-11 02:18:26', '电子科学与技术', '27', '物理与光电工程学院');
INSERT INTO `specialty` VALUES ('39', '工业设计', '2018-05-11 02:18:59', '工业设计', '24', '机电与车辆工程学院');
INSERT INTO `specialty` VALUES ('40', '机械设计制造及其自动化', '2018-05-11 02:19:18', '机械设计制造及其自动化', '24', '机电与车辆工程学院');
INSERT INTO `specialty` VALUES ('41', '车辆工程', '2018-05-11 02:19:30', '车辆工程', '24', '机电与车辆工程学院');
INSERT INTO `specialty` VALUES ('42', '统计学', '2018-05-11 02:19:52', '统计学', '25', '数学与信息科学学院');
INSERT INTO `specialty` VALUES ('43', '数学与应用数学', '2018-05-11 02:20:08', '数学与应用数学', '25', '数学与信息科学学院');

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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stu
-- ----------------------------
INSERT INTO `stu` VALUES ('34', '214124151', '2141232', '0', '/images/defaultHead.jpg', '2018-05-17 00:00:00', '2018-05-11 00:00:00', '24');
INSERT INTO `stu` VALUES ('35', '214123252', 'fdsfs', '0', '/images/defaultHead.jpg', '2018-05-23 00:00:00', '2018-05-16 00:00:00', '25');
INSERT INTO `stu` VALUES ('36', '124124578', 'asdadf', '0', '/images/defaultHead.jpg', '2018-05-04 00:00:00', '2018-05-25 00:00:00', '28');
INSERT INTO `stu` VALUES ('37', '42436558414', 'asdasdc', '0', '/images/defaultHead.jpg', '2018-05-16 00:00:00', '2018-05-23 00:00:00', '29');
INSERT INTO `stu` VALUES ('38', '215235346', 'asfasc', '1', '/images/defaultHead.jpg', '2018-05-10 00:00:00', '2018-05-17 00:00:00', '24');
INSERT INTO `stu` VALUES ('39', '2352352', 'tweg', '0', '/images/defaultHead.jpg', '2018-05-24 00:00:00', '2018-05-15 00:00:00', '30');
INSERT INTO `stu` VALUES ('40', '12412', '2352352', '1', '/images/defaultHead.jpg', '2018-05-24 00:00:00', '2018-05-18 00:00:00', '31');
INSERT INTO `stu` VALUES ('41', '236326346', 'sdgsdg', '0', '/images/defaultHead.jpg', '2018-05-10 00:00:00', '2018-05-30 00:00:00', '32');
INSERT INTO `stu` VALUES ('42', '12523688458', 'asdasd', '1', '/images/defaultHead.jpg', '2018-05-16 00:00:00', '2018-05-23 00:00:00', '30');
INSERT INTO `stu` VALUES ('43', '347457458', '63t43t3', '0', '/images/defaultHead.jpg', '2018-05-17 00:00:00', '2018-05-25 00:00:00', '33');
INSERT INTO `stu` VALUES ('44', '375869564', 'asfasf', '1', '/images/defaultHead.jpg', '2018-05-23 00:00:00', '2018-05-24 00:00:00', '34');
INSERT INTO `stu` VALUES ('45', '12547569867', '342532', '1', '/images/defaultHead.jpg', '2018-05-24 00:00:00', '2018-05-15 00:00:00', '39');
INSERT INTO `stu` VALUES ('46', '3263464', '7egweg', '0', '/images/defaultHead.jpg', '2018-05-17 00:00:00', '2018-05-24 00:00:00', '40');
INSERT INTO `stu` VALUES ('47', '1241251', '15125151', '1', '/images/defaultHead.jpg', '2018-05-24 00:00:00', '2018-05-15 00:00:00', '24');
INSERT INTO `stu` VALUES ('48', '25235235', '2352352', '0', '/images/defaultHead.jpg', '2018-05-10 00:00:00', '2018-05-09 00:00:00', '30');
INSERT INTO `stu` VALUES ('49', '325365474', 'wfsdgsd', '1', '/images/defaultHead.jpg', '2018-05-17 00:00:00', '2018-05-24 00:00:00', '37');
INSERT INTO `stu` VALUES ('50', '2364376595', '2352352', '1', '/images/defaultHead.jpg', '2018-05-23 00:00:00', '2018-05-31 00:00:00', '38');
