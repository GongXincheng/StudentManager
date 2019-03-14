/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50132
 Source Host           : localhost:3306
 Source Schema         : student

 Target Server Type    : MySQL
 Target Server Version : 50132
 File Encoding         : 65001

 Date: 15/03/2019 00:26:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for accesscount
-- ----------------------------
DROP TABLE IF EXISTS `accesscount`;
CREATE TABLE `accesscount`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `count` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of accesscount
-- ----------------------------
INSERT INTO `accesscount` VALUES (4, '2018/05/01', 49);
INSERT INTO `accesscount` VALUES (5, '2018/05/02', 152);
INSERT INTO `accesscount` VALUES (6, '2018/05/03', 200);
INSERT INTO `accesscount` VALUES (7, '2018/05/04', 500);
INSERT INTO `accesscount` VALUES (8, '2018/05/05', 289);
INSERT INTO `accesscount` VALUES (9, '2018/05/06', 236);
INSERT INTO `accesscount` VALUES (10, '2018/05/07', 98);
INSERT INTO `accesscount` VALUES (11, '2018/05/08', 136);
INSERT INTO `accesscount` VALUES (12, '2018/05/09', 360);
INSERT INTO `accesscount` VALUES (13, '2018/05/10', 230);
INSERT INTO `accesscount` VALUES (14, '2018/05/11', 109);
INSERT INTO `accesscount` VALUES (15, '2019/03/14', 77);
INSERT INTO `accesscount` VALUES (16, '2019/03/15', 98);

-- ----------------------------
-- Table structure for accessdetail
-- ----------------------------
DROP TABLE IF EXISTS `accessdetail`;
CREATE TABLE `accessdetail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ipLocation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `resourcePath` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `comeDate` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 709 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of accessdetail
-- ----------------------------
INSERT INTO `accessdetail` VALUES (492, '187.194.93.189', '', '/', '2018-05-11 01:24:52.131');
INSERT INTO `accessdetail` VALUES (493, '187.194.93.189', '', '/', '2018-05-11 01:24:53.582');
INSERT INTO `accessdetail` VALUES (494, '177.11.142.10', '', '/', '2018-05-11 01:29:56.779');
INSERT INTO `accessdetail` VALUES (495, '187.155.134.144', '', '/', '2018-05-11 01:31:31.133');
INSERT INTO `accessdetail` VALUES (496, '223.104.187.110', '', '/', '2018-05-11 01:31:54.779');
INSERT INTO `accessdetail` VALUES (497, '223.104.187.110', '', '/', '2018-05-11 01:32:59.556');
INSERT INTO `accessdetail` VALUES (498, '223.104.187.110', '', '/stu/stuList.html', '2018-05-11 01:33:06.244');
INSERT INTO `accessdetail` VALUES (499, '223.104.187.110', '', '/', '2018-05-11 01:33:14.084');
INSERT INTO `accessdetail` VALUES (500, '187.207.153.9', '', '/', '2018-05-11 01:36:01.533');
INSERT INTO `accessdetail` VALUES (501, '223.104.187.110', '', '/', '2018-05-11 01:53:11');
INSERT INTO `accessdetail` VALUES (502, '223.104.187.110', '', '/', '2018-05-11 01:58:11');
INSERT INTO `accessdetail` VALUES (503, '223.104.187.110', '', '/', '2018-05-11 02:00:11');
INSERT INTO `accessdetail` VALUES (504, '223.104.187.110', '', '/', '2018-05-11 02:05:11');
INSERT INTO `accessdetail` VALUES (505, '223.104.187.110', '', '/dept/addDept.html', '2018-05-11 02:06:11');
INSERT INTO `accessdetail` VALUES (506, '223.104.187.110', '', '/dept/addDept.html', '2018-05-11 02:07:11');
INSERT INTO `accessdetail` VALUES (507, '223.104.187.110', '', '/dept/addDept.html', '2018-05-11 02:08:11');
INSERT INTO `accessdetail` VALUES (508, '223.104.187.110', '', '/dept/addDept.html', '2018-05-11 02:09:11');
INSERT INTO `accessdetail` VALUES (509, '223.104.187.110', '', '/spe/addSpe.html', '2018-05-11 02:12:11');
INSERT INTO `accessdetail` VALUES (510, '223.104.187.110', '', '/spe/addSpe.html', '2018-05-11 02:13:11');
INSERT INTO `accessdetail` VALUES (511, '223.104.187.110', '', '/spe/spetList.html', '2018-05-11 02:14:11');
INSERT INTO `accessdetail` VALUES (512, '223.104.187.110', '', '/spe/addSpe.html', '2018-05-11 02:15:11');
INSERT INTO `accessdetail` VALUES (513, '223.104.187.110', '', '/spe/addSpe.html', '2018-05-11 02:16:11');
INSERT INTO `accessdetail` VALUES (514, '223.104.187.110', '', '/spe/addSpe.html', '2018-05-11 02:17:11');
INSERT INTO `accessdetail` VALUES (515, '223.104.187.110', '', '/spe/addSpe.html', '2018-05-11 02:18:11');
INSERT INTO `accessdetail` VALUES (516, '223.104.187.110', '', '/spe/addSpe.html', '2018-05-11 02:19:11');
INSERT INTO `accessdetail` VALUES (517, '223.104.187.110', '', '/spe/addSpe.html', '2018-05-11 02:20:11');
INSERT INTO `accessdetail` VALUES (518, '223.104.187.110', '', '/dept/deptList.html', '2018-05-11 02:21:11');
INSERT INTO `accessdetail` VALUES (519, '223.104.187.110', '', '/stu/findStuById.action', '2018-05-11 02:22:11');
INSERT INTO `accessdetail` VALUES (520, '223.104.187.110', '', '/stu/findSpeByDeptId.action', '2018-05-11 02:23:11');
INSERT INTO `accessdetail` VALUES (521, '223.104.187.110', '', '/stu/stuList.html', '2018-05-11 02:24:11');
INSERT INTO `accessdetail` VALUES (522, '223.104.187.110', '', '/stu/findSpeByDeptId.action', '2018-05-11 02:25:11');
INSERT INTO `accessdetail` VALUES (523, '120.24.208.141', '', '/', '2018-05-11 02:25:11');
INSERT INTO `accessdetail` VALUES (524, '223.104.187.110', '', '/stu/findStuById.action', '2018-05-11 02:26:11');
INSERT INTO `accessdetail` VALUES (525, '223.104.187.110', '', '/', '2018-05-11 02:27:11');
INSERT INTO `accessdetail` VALUES (526, '223.104.187.110', '', '/', '2018-05-11 02:31:11');
INSERT INTO `accessdetail` VALUES (527, '223.104.187.110', '', '/', '2018-05-11 02:33:11');
INSERT INTO `accessdetail` VALUES (528, '223.104.187.110', '', '/stu/addStuPage.html', '2018-05-11 02:34:11');
INSERT INTO `accessdetail` VALUES (529, '0:0:0:0:0:0:0:1', '', '/', '2019-03-14 21:58:31');
INSERT INTO `accessdetail` VALUES (530, '127.0.0.1', 'XX-XX-内网IP', '/', '2019-03-14 22:08:12');
INSERT INTO `accessdetail` VALUES (531, '0:0:0:0:0:0:0:1', '', '/', '2019-03-14 22:08:15');
INSERT INTO `accessdetail` VALUES (532, '0:0:0:0:0:0:0:1', '', '/', '2019-03-14 22:08:54');
INSERT INTO `accessdetail` VALUES (533, '0:0:0:0:0:0:0:1', '', '/dept/deptList.html', '2019-03-14 22:08:57');
INSERT INTO `accessdetail` VALUES (534, '127.0.0.1', 'XX-XX-内网IP', '/', '2019-03-14 22:09:10');
INSERT INTO `accessdetail` VALUES (535, '127.0.0.1', 'XX-XX-内网IP', '/', '2019-03-14 22:28:58');
INSERT INTO `accessdetail` VALUES (536, '127.0.0.1', '', '/', '2019-03-14 22:29:06');
INSERT INTO `accessdetail` VALUES (537, '127.0.0.1', '', '/spe/spetList.html', '2019-03-14 22:29:38');
INSERT INTO `accessdetail` VALUES (538, '127.0.0.1', '', '/stu/stuList.html', '2019-03-14 22:29:46');
INSERT INTO `accessdetail` VALUES (539, '127.0.0.1', 'XX-XX-内网IP', '/', '2019-03-14 22:30:14');
INSERT INTO `accessdetail` VALUES (540, '127.0.0.1', 'XX-XX-内网IP', '/spe/spetList.html', '2019-03-14 22:30:17');
INSERT INTO `accessdetail` VALUES (541, '127.0.0.1', 'XX-XX-内网IP', '/dept/deptList.html', '2019-03-14 22:30:19');
INSERT INTO `accessdetail` VALUES (542, '127.0.0.1', 'XX-XX-内网IP', '/dept/editById.action', '2019-03-14 22:30:22');
INSERT INTO `accessdetail` VALUES (543, '127.0.0.1', 'XX-XX-内网IP', '/dept/updateDept.html', '2019-03-14 22:30:25');
INSERT INTO `accessdetail` VALUES (544, '127.0.0.1', 'XX-XX-内网IP', '/dept/deptList.html', '2019-03-14 22:30:25');
INSERT INTO `accessdetail` VALUES (545, '127.0.0.1', '', '/spe/spetList.html', '2019-03-14 22:30:31');
INSERT INTO `accessdetail` VALUES (546, '127.0.0.1', '', '/', '2019-03-14 22:32:13');
INSERT INTO `accessdetail` VALUES (547, '127.0.0.1', '', '/', '2019-03-14 22:32:48');
INSERT INTO `accessdetail` VALUES (548, '127.0.0.1', '', '/', '2019-03-14 22:32:52');
INSERT INTO `accessdetail` VALUES (549, '127.0.0.1', '', '/', '2019-03-14 22:33:21');
INSERT INTO `accessdetail` VALUES (550, '127.0.0.1', 'XX-XX-内网IP', '/', '2019-03-14 22:33:28');
INSERT INTO `accessdetail` VALUES (551, '127.0.0.1', '', '/', '2019-03-14 22:33:59');
INSERT INTO `accessdetail` VALUES (552, '127.0.0.1', 'XX-XX-内网IP', '/spe/spetList.html', '2019-03-14 22:34:10');
INSERT INTO `accessdetail` VALUES (553, '127.0.0.1', '', '/', '2019-03-14 22:34:24');
INSERT INTO `accessdetail` VALUES (554, '127.0.0.1', '', '/stu/stuList.html', '2019-03-14 22:34:27');
INSERT INTO `accessdetail` VALUES (555, '127.0.0.1', '', '/dept/deptList.html', '2019-03-14 22:34:28');
INSERT INTO `accessdetail` VALUES (556, '127.0.0.1', '', '/spe/spetList.html', '2019-03-14 22:34:58');
INSERT INTO `accessdetail` VALUES (557, '127.0.0.1', '', '/spe/findSpeBySpeId.action', '2019-03-14 22:35:24');
INSERT INTO `accessdetail` VALUES (558, '127.0.0.1', '', '/spe/findSpeBySpeId.action', '2019-03-14 22:35:35');
INSERT INTO `accessdetail` VALUES (559, '127.0.0.1', '', '/', '2019-03-14 22:38:05');
INSERT INTO `accessdetail` VALUES (560, '127.0.0.1', '', '/spe/spetList.html', '2019-03-14 22:38:19');
INSERT INTO `accessdetail` VALUES (561, '127.0.0.1', '', '/dept/deptList.html', '2019-03-14 22:38:22');
INSERT INTO `accessdetail` VALUES (562, '127.0.0.1', '', '/spe/spetList.html', '2019-03-14 22:38:23');
INSERT INTO `accessdetail` VALUES (563, '127.0.0.1', '', '/', '2019-03-14 22:38:24');
INSERT INTO `accessdetail` VALUES (564, '127.0.0.1', '', '/', '2019-03-14 22:38:31');
INSERT INTO `accessdetail` VALUES (565, '127.0.0.1', '', '/dept/deptList.html', '2019-03-14 22:39:01');
INSERT INTO `accessdetail` VALUES (566, '127.0.0.1', '', '/dept/addDept.html', '2019-03-14 22:41:42');
INSERT INTO `accessdetail` VALUES (567, '127.0.0.1', '', '/dept/addDept.html', '2019-03-14 22:41:47');
INSERT INTO `accessdetail` VALUES (568, '127.0.0.1', '', '/dept/deptList.html', '2019-03-14 22:41:50');
INSERT INTO `accessdetail` VALUES (569, '127.0.0.1', 'XX-XX-内网IP', '/', '2019-03-14 22:41:58');
INSERT INTO `accessdetail` VALUES (570, '127.0.0.1', 'XX-XX-内网IP', '/dept/deptList.html', '2019-03-14 22:42:02');
INSERT INTO `accessdetail` VALUES (571, '127.0.0.1', 'XX-XX-内网IP', '/spe/spetList.html', '2019-03-14 22:42:03');
INSERT INTO `accessdetail` VALUES (572, '127.0.0.1', 'XX-XX-内网IP', '/', '2019-03-14 22:42:05');
INSERT INTO `accessdetail` VALUES (573, '127.0.0.1', '', '/spe/spetList.html', '2019-03-14 22:42:12');
INSERT INTO `accessdetail` VALUES (574, '127.0.0.1', 'XX-XX-内网IP', '/spe/spetList.html', '2019-03-14 22:43:06');
INSERT INTO `accessdetail` VALUES (575, '127.0.0.1', 'XX-XX-内网IP', '/', '2019-03-14 22:43:07');
INSERT INTO `accessdetail` VALUES (576, '127.0.0.1', 'XX-XX-内网IP', '/', '2019-03-14 22:43:10');
INSERT INTO `accessdetail` VALUES (577, '127.0.0.1', '', '/spe/spetList.html', '2019-03-14 22:43:14');
INSERT INTO `accessdetail` VALUES (578, '0:0:0:0:0:0:0:1', '', '/', '2019-03-14 23:45:09');
INSERT INTO `accessdetail` VALUES (579, '0:0:0:0:0:0:0:1', '', '/dept/deptList.html', '2019-03-14 23:45:13');
INSERT INTO `accessdetail` VALUES (580, '0:0:0:0:0:0:0:1', '', '/spe/spetList.html', '2019-03-14 23:45:15');
INSERT INTO `accessdetail` VALUES (581, '127.0.0.1', 'XX-XX-内网IP', '/', '2019-03-14 23:45:18');
INSERT INTO `accessdetail` VALUES (582, '127.0.0.1', 'XX-XX-内网IP', '/', '2019-03-14 23:47:13');
INSERT INTO `accessdetail` VALUES (583, '127.0.0.1', 'XX-XX-内网IP', '/spe/spetList.html', '2019-03-14 23:58:52');
INSERT INTO `accessdetail` VALUES (584, '127.0.0.1', 'XX-XX-内网IP', '/', '2019-03-14 23:58:54');
INSERT INTO `accessdetail` VALUES (585, '127.0.0.1', 'XX-XX-内网IP', '/back/chart/getAccessChart.action', '2019-03-14 23:58:56');
INSERT INTO `accessdetail` VALUES (586, '127.0.0.1', 'XX-XX-内网IP', '/back/chart/getDeptChart.action', '2019-03-14 23:58:58');
INSERT INTO `accessdetail` VALUES (587, '127.0.0.1', 'XX-XX-内网IP', '/back/chart/getSpeChart.action', '2019-03-14 23:59:00');
INSERT INTO `accessdetail` VALUES (588, '127.0.0.1', 'XX-XX-内网IP', '/back/userList.html', '2019-03-14 23:59:01');
INSERT INTO `accessdetail` VALUES (589, '127.0.0.1', '', '/back/accessList.html', '2019-03-14 23:59:06');
INSERT INTO `accessdetail` VALUES (590, '127.0.0.1', 'XX-XX-内网IP', '/', '2019-03-14 23:59:12');
INSERT INTO `accessdetail` VALUES (591, '127.0.0.1', 'XX-XX-内网IP', '/stu/stuList.html', '2019-03-14 23:59:16');
INSERT INTO `accessdetail` VALUES (592, '127.0.0.1', 'XX-XX-内网IP', '/stu/findStuByStuId.action', '2019-03-14 23:59:19');
INSERT INTO `accessdetail` VALUES (593, '127.0.0.1', 'XX-XX-内网IP', '/stu/updateStudent.action', '2019-03-14 23:59:24');
INSERT INTO `accessdetail` VALUES (594, '127.0.0.1', 'XX-XX-内网IP', '/stu/stuList.html', '2019-03-14 23:59:25');
INSERT INTO `accessdetail` VALUES (595, '127.0.0.1', 'XX-XX-内网IP', '/stu/findStuByStuId.action', '2019-03-14 23:59:28');
INSERT INTO `accessdetail` VALUES (596, '127.0.0.1', 'XX-XX-内网IP', '/stu/findStuByStuId.action', '2019-03-14 23:59:32');
INSERT INTO `accessdetail` VALUES (597, '127.0.0.1', 'XX-XX-内网IP', '/stu/updateStudent.action', '2019-03-14 23:59:34');
INSERT INTO `accessdetail` VALUES (598, '127.0.0.1', 'XX-XX-内网IP', '/stu/stuList.html', '2019-03-14 23:59:36');
INSERT INTO `accessdetail` VALUES (599, '127.0.0.1', '', '/stu/findStuByStuId.action', '2019-03-14 23:59:41');
INSERT INTO `accessdetail` VALUES (600, '127.0.0.1', 'XX-XX-内网IP', '/stu/deleteStu.action', '2019-03-14 23:59:49');
INSERT INTO `accessdetail` VALUES (601, '127.0.0.1', 'XX-XX-内网IP', '/stu/stuList.html', '2019-03-14 23:59:52');
INSERT INTO `accessdetail` VALUES (602, '127.0.0.1', 'XX-XX-内网IP', '/', '2019-03-14 23:59:54');
INSERT INTO `accessdetail` VALUES (603, '127.0.0.1', 'XX-XX-内网IP', '/back/chart/getAccessChart.action', '2019-03-14 23:59:55');
INSERT INTO `accessdetail` VALUES (604, '127.0.0.1', 'XX-XX-内网IP', '/back/chartList.html', '2019-03-14 23:59:57');
INSERT INTO `accessdetail` VALUES (605, '127.0.0.1', 'XX-XX-内网IP', '/back/accessList.html', '2019-03-14 23:59:58');
INSERT INTO `accessdetail` VALUES (606, '127.0.0.1', '', '/back/chartList.html', '2019-03-15 00:00:01');
INSERT INTO `accessdetail` VALUES (607, '127.0.0.1', 'XX-XX-内网IP', '/back/chart/getAccessChart.action', '2019-03-15 00:00:01');
INSERT INTO `accessdetail` VALUES (608, '127.0.0.1', '', '/back/chart/getDeptChart.action', '2019-03-15 00:00:03');
INSERT INTO `accessdetail` VALUES (609, '127.0.0.1', 'XX-XX-内网IP', '/back/chart/getSpeChart.action', '2019-03-15 00:00:04');
INSERT INTO `accessdetail` VALUES (610, '127.0.0.1', 'XX-XX-内网IP', '/', '2019-03-15 00:01:17');
INSERT INTO `accessdetail` VALUES (611, '127.0.0.1', 'XX-XX-内网IP', '/back/chart/getDeptChart.action', '2019-03-15 00:01:31');
INSERT INTO `accessdetail` VALUES (612, '127.0.0.1', 'XX-XX-内网IP', '/back/chart/getSpeChart.action', '2019-03-15 00:01:32');
INSERT INTO `accessdetail` VALUES (613, '127.0.0.1', 'XX-XX-内网IP', '/back/chart/getAccessChart.action', '2019-03-15 00:01:32');
INSERT INTO `accessdetail` VALUES (614, '127.0.0.1', 'XX-XX-内网IP', '/', '2019-03-15 00:01:33');
INSERT INTO `accessdetail` VALUES (615, '127.0.0.1', 'XX-XX-内网IP', '/back/chart/getAccessChart.action', '2019-03-15 00:01:48');
INSERT INTO `accessdetail` VALUES (616, '127.0.0.1', 'XX-XX-内网IP', '/', '2019-03-15 00:02:37');
INSERT INTO `accessdetail` VALUES (617, '127.0.0.1', '', '/back/chart/getAccessChart.action', '2019-03-15 00:02:37');
INSERT INTO `accessdetail` VALUES (618, '127.0.0.1', 'XX-XX-内网IP', '/back/chart/getDeptChart.action', '2019-03-15 00:02:54');
INSERT INTO `accessdetail` VALUES (619, '127.0.0.1', 'XX-XX-内网IP', '/back/chart/getAccessChart.action', '2019-03-15 00:02:55');
INSERT INTO `accessdetail` VALUES (620, '127.0.0.1', '', '/', '2019-03-15 00:02:55');
INSERT INTO `accessdetail` VALUES (621, '127.0.0.1', 'XX-XX-内网IP', '/back/chart/getSpeChart.action', '2019-03-15 00:02:57');
INSERT INTO `accessdetail` VALUES (622, '127.0.0.1', 'XX-XX-内网IP', '/back/userList.html', '2019-03-15 00:02:59');
INSERT INTO `accessdetail` VALUES (623, '127.0.0.1', 'XX-XX-内网IP', '/', '2019-03-15 00:03:00');
INSERT INTO `accessdetail` VALUES (624, '127.0.0.1', 'XX-XX-内网IP', '/', '2019-03-15 00:03:14');
INSERT INTO `accessdetail` VALUES (625, '127.0.0.1', 'XX-XX-内网IP', '/back/chart/getAccessChart.action', '2019-03-15 00:03:14');
INSERT INTO `accessdetail` VALUES (626, '127.0.0.1', 'XX-XX-内网IP', '/back/chart/getDeptChart.action', '2019-03-15 00:03:16');
INSERT INTO `accessdetail` VALUES (627, '127.0.0.1', 'XX-XX-内网IP', '/back/chart/getSpeChart.action', '2019-03-15 00:03:17');
INSERT INTO `accessdetail` VALUES (628, '127.0.0.1', 'XX-XX-内网IP', '/back/userList.html', '2019-03-15 00:03:19');
INSERT INTO `accessdetail` VALUES (629, '127.0.0.1', 'XX-XX-内网IP', '/', '2019-03-15 00:03:20');
INSERT INTO `accessdetail` VALUES (630, '127.0.0.1', '', '/spe/spetList.html', '2019-03-15 00:04:26');
INSERT INTO `accessdetail` VALUES (631, '127.0.0.1', 'XX-XX-内网IP', '/', '2019-03-15 00:04:29');
INSERT INTO `accessdetail` VALUES (632, '127.0.0.1', 'XX-XX-内网IP', '/', '2019-03-15 00:04:30');
INSERT INTO `accessdetail` VALUES (633, '127.0.0.1', 'XX-XX-内网IP', '/dept/deptList.html', '2019-03-15 00:04:30');
INSERT INTO `accessdetail` VALUES (634, '127.0.0.1', 'XX-XX-内网IP', '/spe/spetList.html', '2019-03-15 00:04:31');
INSERT INTO `accessdetail` VALUES (635, '127.0.0.1', 'XX-XX-内网IP', '/back/chart/getAccessChart.action', '2019-03-15 00:04:32');
INSERT INTO `accessdetail` VALUES (636, '127.0.0.1', '', '/', '2019-03-15 00:04:32');
INSERT INTO `accessdetail` VALUES (637, '127.0.0.1', 'XX-XX-内网IP', '/stu/stuList.html', '2019-03-15 00:04:33');
INSERT INTO `accessdetail` VALUES (638, '127.0.0.1', '', '/', '2019-03-15 00:04:33');
INSERT INTO `accessdetail` VALUES (639, '127.0.0.1', '', '/back/chartList.html', '2019-03-15 00:04:33');
INSERT INTO `accessdetail` VALUES (640, '127.0.0.1', '', '/back/accessList.html', '2019-03-15 00:04:36');
INSERT INTO `accessdetail` VALUES (641, '127.0.0.1', '', '/back/accessList.html', '2019-03-15 00:04:56');
INSERT INTO `accessdetail` VALUES (642, '127.0.0.1', 'XX-XX-内网IP', '/', '2019-03-15 00:05:35');
INSERT INTO `accessdetail` VALUES (643, '127.0.0.1', 'XX-XX-内网IP', '/back/userList.html', '2019-03-15 00:05:35');
INSERT INTO `accessdetail` VALUES (644, '127.0.0.1', '', '/back/userList.html', '2019-03-15 00:05:35');
INSERT INTO `accessdetail` VALUES (645, '127.0.0.1', '', '/', '2019-03-15 00:05:40');
INSERT INTO `accessdetail` VALUES (646, '127.0.0.1', '', '/back/userList.html', '2019-03-15 00:05:42');
INSERT INTO `accessdetail` VALUES (647, '127.0.0.1', '', '/', '2019-03-15 00:05:42');
INSERT INTO `accessdetail` VALUES (648, '127.0.0.1', '', '/', '2019-03-15 00:05:44');
INSERT INTO `accessdetail` VALUES (649, '127.0.0.1', '', '/back/accessList.html', '2019-03-15 00:05:46');
INSERT INTO `accessdetail` VALUES (650, '127.0.0.1', '', '/back/accessList.html', '2019-03-15 00:05:48');
INSERT INTO `accessdetail` VALUES (651, '127.0.0.1', '', '/', '2019-03-15 00:05:48');
INSERT INTO `accessdetail` VALUES (652, '127.0.0.1', '', '/', '2019-03-15 00:05:50');
INSERT INTO `accessdetail` VALUES (653, '127.0.0.1', '', '/back/userList.html', '2019-03-15 00:05:59');
INSERT INTO `accessdetail` VALUES (654, '127.0.0.1', '', '/back/chartList.html', '2019-03-15 00:06:00');
INSERT INTO `accessdetail` VALUES (655, '127.0.0.1', '', '/back/accessList.html', '2019-03-15 00:06:13');
INSERT INTO `accessdetail` VALUES (656, '127.0.0.1', 'XX-XX-内网IP', '/', '2019-03-15 00:09:18');
INSERT INTO `accessdetail` VALUES (657, '127.0.0.1', 'XX-XX-内网IP', '/spe/spetList.html', '2019-03-15 00:09:28');
INSERT INTO `accessdetail` VALUES (658, '127.0.0.1', 'XX-XX-内网IP', '/stu/stuList.html', '2019-03-15 00:09:31');
INSERT INTO `accessdetail` VALUES (659, '127.0.0.1', 'XX-XX-内网IP', '/stu/addStuPage.html', '2019-03-15 00:09:35');
INSERT INTO `accessdetail` VALUES (660, '127.0.0.1', 'XX-XX-内网IP', '/', '2019-03-15 00:09:39');
INSERT INTO `accessdetail` VALUES (661, '127.0.0.1', 'XX-XX-内网IP', '/stu/stuList.html', '2019-03-15 00:09:41');
INSERT INTO `accessdetail` VALUES (662, '127.0.0.1', '', '/stu/exportData.html', '2019-03-15 00:09:45');
INSERT INTO `accessdetail` VALUES (663, '127.0.0.1', '', '/stu/stuList.html', '2019-03-15 00:10:00');
INSERT INTO `accessdetail` VALUES (664, '127.0.0.1', 'XX-XX-内网IP', '/', '2019-03-15 00:10:03');
INSERT INTO `accessdetail` VALUES (665, '127.0.0.1', 'XX-XX-内网IP', '/dept/deptList.html', '2019-03-15 00:10:04');
INSERT INTO `accessdetail` VALUES (666, '127.0.0.1', 'XX-XX-内网IP', '/spe/spetList.html', '2019-03-15 00:10:14');
INSERT INTO `accessdetail` VALUES (667, '127.0.0.1', 'XX-XX-内网IP', '/spe/findSpeBySpeId.action', '2019-03-15 00:10:17');
INSERT INTO `accessdetail` VALUES (668, '127.0.0.1', 'XX-XX-内网IP', '/spe/findSpeBySpeId.action', '2019-03-15 00:10:24');
INSERT INTO `accessdetail` VALUES (669, '127.0.0.1', 'XX-XX-内网IP', '/spe/updateSpe.action', '2019-03-15 00:10:36');
INSERT INTO `accessdetail` VALUES (670, '127.0.0.1', 'XX-XX-内网IP', '/spe/spetList.html', '2019-03-15 00:10:37');
INSERT INTO `accessdetail` VALUES (671, '127.0.0.1', '', '/spe/spetList.html', '2019-03-15 00:10:48');
INSERT INTO `accessdetail` VALUES (672, '127.0.0.1', 'XX-XX-内网IP', '/stu/stuList.html', '2019-03-15 00:10:53');
INSERT INTO `accessdetail` VALUES (673, '127.0.0.1', 'XX-XX-内网IP', '/stu/findStuByStuId.action', '2019-03-15 00:10:58');
INSERT INTO `accessdetail` VALUES (674, '127.0.0.1', 'XX-XX-内网IP', '/stu/findStuByStuId.action', '2019-03-15 00:11:05');
INSERT INTO `accessdetail` VALUES (675, '127.0.0.1', 'XX-XX-内网IP', '/', '2019-03-15 00:11:14');
INSERT INTO `accessdetail` VALUES (676, '127.0.0.1', '', '/back/chart/getAccessChart.action', '2019-03-15 00:11:15');
INSERT INTO `accessdetail` VALUES (677, '127.0.0.1', 'XX-XX-内网IP', '/back/chart/getDeptChart.action', '2019-03-15 00:11:26');
INSERT INTO `accessdetail` VALUES (678, '127.0.0.1', 'XX-XX-内网IP', '/back/chart/getSpeChart.action', '2019-03-15 00:11:36');
INSERT INTO `accessdetail` VALUES (679, '127.0.0.1', 'XX-XX-内网IP', '/back/chart/getDeptChart.action', '2019-03-15 00:12:12');
INSERT INTO `accessdetail` VALUES (680, '127.0.0.1', '', '/back/accessList.html', '2019-03-15 00:12:13');
INSERT INTO `accessdetail` VALUES (681, '127.0.0.1', 'XX-XX-内网IP', '/', '2019-03-15 00:13:04');
INSERT INTO `accessdetail` VALUES (682, '127.0.0.1', 'XX-XX-内网IP', '/stu/addStuPage.html', '2019-03-15 00:13:08');
INSERT INTO `accessdetail` VALUES (683, '127.0.0.1', 'XX-XX-内网IP', '/stu/findSpeByDeptId.action', '2019-03-15 00:13:12');
INSERT INTO `accessdetail` VALUES (684, '127.0.0.1', 'XX-XX-内网IP', '/', '2019-03-15 00:13:30');
INSERT INTO `accessdetail` VALUES (685, '127.0.0.1', 'XX-XX-内网IP', '/dept/deptList.html', '2019-03-15 00:13:32');
INSERT INTO `accessdetail` VALUES (686, '127.0.0.1', 'XX-XX-内网IP', '/back/chart/getAccessChart.action', '2019-03-15 00:13:34');
INSERT INTO `accessdetail` VALUES (687, '127.0.0.1', 'XX-XX-内网IP', '/back/chart/getDeptChart.action', '2019-03-15 00:13:35');
INSERT INTO `accessdetail` VALUES (688, '127.0.0.1', '', '/', '2019-03-15 00:13:42');
INSERT INTO `accessdetail` VALUES (689, '127.0.0.1', 'XX-XX-内网IP', '/back/chart/getAccessChart.action', '2019-03-15 00:13:42');
INSERT INTO `accessdetail` VALUES (690, '127.0.0.1', 'XX-XX-内网IP', '/dept/deptList.html', '2019-03-15 00:15:31');
INSERT INTO `accessdetail` VALUES (691, '127.0.0.1', 'XX-XX-内网IP', '/dept/editById.action', '2019-03-15 00:15:35');
INSERT INTO `accessdetail` VALUES (692, '127.0.0.1', 'XX-XX-内网IP', '/spe/spetList.html', '2019-03-15 00:15:38');
INSERT INTO `accessdetail` VALUES (693, '127.0.0.1', 'XX-XX-内网IP', '/', '2019-03-15 00:15:55');
INSERT INTO `accessdetail` VALUES (694, '127.0.0.1', 'XX-XX-内网IP', '/dept/deptList.html', '2019-03-15 00:16:10');
INSERT INTO `accessdetail` VALUES (695, '127.0.0.1', 'XX-XX-内网IP', '/dept/editById.action', '2019-03-15 00:16:19');
INSERT INTO `accessdetail` VALUES (696, '127.0.0.1', 'XX-XX-内网IP', '/', '2019-03-15 00:16:32');
INSERT INTO `accessdetail` VALUES (697, '127.0.0.1', 'XX-XX-内网IP', '/spe/spetList.html', '2019-03-15 00:16:35');
INSERT INTO `accessdetail` VALUES (698, '127.0.0.1', 'XX-XX-内网IP', '/spe/findSpeBySpeId.action', '2019-03-15 00:16:38');
INSERT INTO `accessdetail` VALUES (699, '127.0.0.1', 'XX-XX-内网IP', '/dept/editById.action', '2019-03-15 00:16:38');
INSERT INTO `accessdetail` VALUES (700, '127.0.0.1', 'XX-XX-内网IP', '/', '2019-03-15 00:16:44');
INSERT INTO `accessdetail` VALUES (701, '127.0.0.1', 'XX-XX-内网IP', '/back/chart/getAccessChart.action', '2019-03-15 00:16:48');
INSERT INTO `accessdetail` VALUES (702, '127.0.0.1', 'XX-XX-内网IP', '/', '2019-03-15 00:17:55');
INSERT INTO `accessdetail` VALUES (703, '127.0.0.1', 'XX-XX-内网IP', '/stu/stuList.html', '2019-03-15 00:18:13');
INSERT INTO `accessdetail` VALUES (704, '127.0.0.1', 'XX-XX-内网IP', '/stu/stuList.html', '2019-03-15 00:18:22');
INSERT INTO `accessdetail` VALUES (705, '127.0.0.1', 'XX-XX-内网IP', '/stu/findSpeByDeptId.action', '2019-03-15 00:18:27');
INSERT INTO `accessdetail` VALUES (706, '127.0.0.1', '', '/stu/stuList.html', '2019-03-15 00:18:33');
INSERT INTO `accessdetail` VALUES (707, '127.0.0.1', 'XX-XX-内网IP', '/stu/findSpeByDeptId.action', '2019-03-15 00:18:35');
INSERT INTO `accessdetail` VALUES (708, '127.0.0.1', 'XX-XX-内网IP', '/stu/addStuPage.html', '2019-03-15 00:18:45');

-- ----------------------------
-- Table structure for deptment
-- ----------------------------
DROP TABLE IF EXISTS `deptment`;
CREATE TABLE `deptment`  (
  `deptId` int(11) NOT NULL AUTO_INCREMENT,
  `deptName` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createDate` datetime NULL DEFAULT NULL,
  `discription` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `updateDate` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`deptId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of deptment
-- ----------------------------
INSERT INTO `deptment` VALUES (21, '计算机工程学院', '2018-05-11 02:06:01', '计算机工程学院', '2018-05-11 02:06:01');
INSERT INTO `deptment` VALUES (22, '经济管理学院', '2018-05-11 02:06:52', '经济管理学院x', '2019-03-14 22:30:25');
INSERT INTO `deptment` VALUES (23, '信息与控制学院', '2018-05-11 02:07:50', '信息与控制学院', '2018-05-11 02:07:50');
INSERT INTO `deptment` VALUES (24, '机电与车辆工程学院', '2018-05-11 02:08:12', '机电与车辆工程学院', '2018-05-11 02:08:12');
INSERT INTO `deptment` VALUES (25, '数学与信息科学学院', '2018-05-11 02:08:31', '数学与信息科学学院', '2018-05-11 02:08:31');
INSERT INTO `deptment` VALUES (26, '外国语学院', '2018-05-11 02:08:44', '外国语学院', '2018-05-11 02:08:44');
INSERT INTO `deptment` VALUES (27, '物理与光电工程学院', '2018-05-11 02:09:03', '物理与光电工程学院', '2018-05-11 02:09:03');
INSERT INTO `deptment` VALUES (28, '历史文化与旅游学院', '2018-05-11 02:09:25', '历史文化与旅游学院', '2018-05-11 02:09:25');
INSERT INTO `deptment` VALUES (29, '213124', '2019-03-14 22:41:42', '2131231231', '2019-03-14 22:41:42');
INSERT INTO `deptment` VALUES (30, '213124', '2019-03-14 22:41:47', '2131231231', '2019-03-14 22:41:47');

-- ----------------------------
-- Table structure for specialty
-- ----------------------------
DROP TABLE IF EXISTS `specialty`;
CREATE TABLE `specialty`  (
  `speId` int(11) NOT NULL AUTO_INCREMENT,
  `speName` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createDate` datetime NULL DEFAULT NULL,
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `deptId` int(11) NULL DEFAULT NULL,
  `deptName` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`speId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of specialty
-- ----------------------------
INSERT INTO `specialty` VALUES (24, '计算机科学与技术', '2018-05-11 02:12:56', '计算机科学与技术', 21, '计算机工程学院');
INSERT INTO `specialty` VALUES (25, '网络工程', '2018-05-11 02:13:12', '网络工程', 21, '计算机工程学院');
INSERT INTO `specialty` VALUES (28, '通信工程', '2018-05-11 02:14:43', '通信工程', 21, '计算机工程学院');
INSERT INTO `specialty` VALUES (29, '软件工程', '2018-05-11 02:14:59', '软件工程', 21, '计算机工程学院');
INSERT INTO `specialty` VALUES (30, '会计学', '2018-05-11 02:15:17', '会计学', 22, '经济管理学院');
INSERT INTO `specialty` VALUES (31, '市场营销', '2018-05-11 02:15:33', '市场营销', 22, '经济管理学院');
INSERT INTO `specialty` VALUES (32, '经济与金融', '2018-05-11 02:15:52', '经济与金融', 22, '经济管理学院');
INSERT INTO `specialty` VALUES (33, '自动化', '2018-05-11 02:16:55', '自动化', 23, '信息与控制学院');
INSERT INTO `specialty` VALUES (34, '电子信息工程', '2018-05-11 02:17:06', '电子信息工程', 23, '信息与控制学院');
INSERT INTO `specialty` VALUES (35, '历史学', '2018-05-11 02:17:27', '历史学', 28, '历史文化与旅游学院');
INSERT INTO `specialty` VALUES (36, '旅游管理', '2018-05-11 02:17:41', '旅游管理', 28, '历史文化与旅游学院');
INSERT INTO `specialty` VALUES (37, '物理学', '2018-05-11 02:17:57', '物理学', 27, '物理与光电工程学院');
INSERT INTO `specialty` VALUES (38, '电子科学与技术', '2018-05-11 02:18:26', '电子科学与技术', 27, '物理与光电工程学院');
INSERT INTO `specialty` VALUES (39, '工业设计', '2018-05-11 02:18:59', '工业设计', 24, '机电与车辆工程学院');
INSERT INTO `specialty` VALUES (40, '机械设计制造及其自动化', '2018-05-11 02:19:18', '机械设计制造及其自动化', 24, '机电与车辆工程学院');
INSERT INTO `specialty` VALUES (41, '车辆工程', '2018-05-11 02:19:30', '车辆工程', 24, '机电与车辆工程学院');
INSERT INTO `specialty` VALUES (42, '统计学', '2018-05-11 02:19:52', '统计学', 25, '数学与信息科学学院');
INSERT INTO `specialty` VALUES (43, '数学与应用数学', '2018-05-11 02:20:08', '数学与应用数学', 25, '数学与信息科学学院');

-- ----------------------------
-- Table structure for stu
-- ----------------------------
DROP TABLE IF EXISTS `stu`;
CREATE TABLE `stu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stuId` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stuName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gender` int(1) NULL DEFAULT NULL,
  `headPic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birthday` datetime NULL DEFAULT NULL,
  `comeDate` datetime NULL DEFAULT NULL,
  `speId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of stu
-- ----------------------------
INSERT INTO `stu` VALUES (34, '214124151', '2141232', 0, '/images/defaultHead.jpg', '2018-05-17 00:00:00', '2018-05-11 00:00:00', 24);
INSERT INTO `stu` VALUES (35, '214123252', 'fdsfs', 0, '/images/defaultHead.jpg', '2018-05-23 00:00:00', '2018-05-16 00:00:00', 25);
INSERT INTO `stu` VALUES (36, '124124578', 'asdadf', 0, '/images/defaultHead.jpg', '2018-05-04 00:00:00', '2018-05-25 00:00:00', 28);
INSERT INTO `stu` VALUES (38, '215235346', 'asfasc', 1, '/images/defaultHead.jpg', '2018-05-10 00:00:00', '2018-05-17 00:00:00', 24);
INSERT INTO `stu` VALUES (39, '2352352', 'tweg', 0, '/images/defaultHead.jpg', '2018-05-24 00:00:00', '2018-05-15 00:00:00', 30);
INSERT INTO `stu` VALUES (40, '12412', '2352352', 1, '/images/defaultHead.jpg', '2018-05-24 00:00:00', '2018-05-18 00:00:00', 31);
INSERT INTO `stu` VALUES (41, '236326346', 'sdgsdg', 0, '/images/defaultHead.jpg', '2018-05-10 00:00:00', '2018-05-30 00:00:00', 32);
INSERT INTO `stu` VALUES (42, '12523688458', 'asdasd', 1, '/images/defaultHead.jpg', '2018-05-16 00:00:00', '2018-05-23 00:00:00', 30);
INSERT INTO `stu` VALUES (43, '347457458', '63t43t3', 0, '/images/defaultHead.jpg', '2018-05-17 00:00:00', '2018-05-25 00:00:00', 33);
INSERT INTO `stu` VALUES (44, '375869564', 'asfasf', 1, '/images/defaultHead.jpg', '2018-05-23 00:00:00', '2018-05-24 00:00:00', 34);
INSERT INTO `stu` VALUES (45, '12547569867', '342532', 1, '/images/defaultHead.jpg', '2018-05-24 00:00:00', '2018-05-15 00:00:00', 39);
INSERT INTO `stu` VALUES (46, '3263464', '7egweg', 0, '/images/defaultHead.jpg', '2018-05-17 00:00:00', '2018-05-24 00:00:00', 40);
INSERT INTO `stu` VALUES (47, '1241251', '15125151', 1, '/images/defaultHead.jpg', '2018-05-24 00:00:00', '2018-05-15 00:00:00', 24);
INSERT INTO `stu` VALUES (48, '25235235', '2352352', 0, '/images/defaultHead.jpg', '2018-05-10 00:00:00', '2018-05-09 00:00:00', 30);
INSERT INTO `stu` VALUES (49, '325365474', 'wfsdgsd', 1, '/images/defaultHead.jpg', '2018-05-17 00:00:00', '2018-05-24 00:00:00', 37);
INSERT INTO `stu` VALUES (50, '2364376595', '2352352', 1, '/images/defaultHead.jpg', '2018-05-23 00:00:00', '2018-05-31 00:00:00', 38);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gender` int(2) NULL DEFAULT NULL,
  `telephone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `headPic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sign` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `registDate` datetime NULL DEFAULT NULL,
  `lastLoginDate` datetime NULL DEFAULT NULL,
  `loginNum` int(20) NULL DEFAULT NULL,
  `role` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'admin', 1, '13563274342', '757853223@qq.com', 'http://www.gxc.com:9999/admin/20190314_235450.jpg', 'xxx', 'xxxxxx', '2019-03-14 23:47:01', '2019-03-15 00:14:15', 3, 0);

SET FOREIGN_KEY_CHECKS = 1;
