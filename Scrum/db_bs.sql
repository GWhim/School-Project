/*
 Navicat Premium Data Transfer

 Source Server         : 毕设
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : db_bs

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 09/06/2021 15:14:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bug
-- ----------------------------
DROP TABLE IF EXISTS `bug`;
CREATE TABLE `bug`  (
  `id` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `version_id` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `creatuser` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createtime` timestamp NULL DEFAULT NULL,
  `status` int(255) NULL DEFAULT NULL COMMENT '0-未解决 1-解决 2-已转发 3-已关闭',
  `user_id` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bug_id` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `endtime` timestamp NULL DEFAULT NULL,
  `enduser` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `des` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bug
-- ----------------------------
INSERT INTO `bug` VALUES ('07c5e661bc4911eb964af48e38f91fc1', 'dd2349332d0d40f5901bd6f8f882f3eb', '1', '2021-05-24 12:30:56', 2, '4', '112bfa2fbc4911eb964af48e38f91fc1', '2021-05-24 12:31:11', '1', '324');
INSERT INTO `bug` VALUES ('0c6f3da2ad7711ebabc1f48e38f91fc1', '1', '0', '2021-05-05 15:53:42', 0, '1', NULL, NULL, NULL, '描述');
INSERT INTO `bug` VALUES ('1', '0', '0', '2021-04-21 13:21:00', 1, '0', NULL, '2021-04-21 13:25:00', '0', '描述');
INSERT INTO `bug` VALUES ('112bfa2fbc4911eb964af48e38f91fc1', 'dd2349332d0d40f5901bd6f8f882f3eb', '1', '2021-05-24 12:31:12', 2, '3', '4aca24a8bc4911eb964af48e38f91fc1', '2021-05-24 12:32:48', '3', '324');
INSERT INTO `bug` VALUES ('2', '1', '0', '2021-04-24 12:32:30', 2, '0', '73ef8f91ad7c11ebabc1f48e38f91fc1', '2021-05-05 16:32:07', '1', '描述');
INSERT INTO `bug` VALUES ('213459efbc4a11eb964af48e38f91fc1', 'dd2349332d0d40f5901bd6f8f882f3eb', '3', '2021-05-24 12:38:48', 0, '2', NULL, NULL, NULL, '6');
INSERT INTO `bug` VALUES ('3', '1', '0', '2021-04-22 13:21:00', 1, '0', NULL, '2021-04-22 15:25:00', '0', '描述');
INSERT INTO `bug` VALUES ('4', '1', '0', '2021-04-22 13:21:00', 1, '0', NULL, '2021-04-22 15:25:00', '0', '描述');
INSERT INTO `bug` VALUES ('4aca24a8bc4911eb964af48e38f91fc1', 'dd2349332d0d40f5901bd6f8f882f3eb', '3', '2021-05-24 12:32:48', 0, '1', NULL, NULL, NULL, '324');
INSERT INTO `bug` VALUES ('5', '1', '0', '2021-04-22 13:21:00', 2, '3', '0c6f3da2ad7711ebabc1f48e38f91fc1', '2021-05-05 15:53:26', '0', '描述');
INSERT INTO `bug` VALUES ('5f5034edbc4711eb964af48e38f91fc1', 'dd2349332d0d40f5901bd6f8f882f3eb', '1', '2021-05-24 12:19:04', 1, '3', NULL, '2021-05-24 12:21:13', '1', '001');
INSERT INTO `bug` VALUES ('73ef8f91ad7c11ebabc1f48e38f91fc1', '1', '1', '2021-05-05 16:32:20', 0, '3', NULL, NULL, NULL, '描述');
INSERT INTO `bug` VALUES ('8488d62abc4611eb964af48e38f91fc1', '701decfa0496446e926e55d4675e78e1', '1', '2021-05-24 12:12:57', 3, '3', NULL, '2021-05-24 12:18:39', '1', '缺陷测试');
INSERT INTO `bug` VALUES ('b068d71fbc4911eb964af48e38f91fc1', 'dd2349332d0d40f5901bd6f8f882f3eb', '3', '2021-05-24 12:35:39', 0, '4', NULL, NULL, NULL, '3333');
INSERT INTO `bug` VALUES ('b6aa84f3bc4711eb964af48e38f91fc1', 'dd2349332d0d40f5901bd6f8f882f3eb', '1', '2021-05-24 12:21:30', 2, '3', '07c5e661bc4911eb964af48e38f91fc1', '2021-05-24 12:30:56', '1', '324');
INSERT INTO `bug` VALUES ('f90b80abbd0411eb964af48e38f91fc1', 'd42808241f4c484bb9b0a241acf820d7', '1', '2021-05-25 10:56:09', 0, '3', NULL, NULL, NULL, '33333333333');

-- ----------------------------
-- Table structure for czjl
-- ----------------------------
DROP TABLE IF EXISTS `czjl`;
CREATE TABLE `czjl`  (
  `id` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `des` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createtime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of czjl
-- ----------------------------
INSERT INTO `czjl` VALUES ('0', '0', 'Gwhim', '解决了BUG：这是BUG名', '2021-04-22 09:14:00');
INSERT INTO `czjl` VALUES ('1', '0', 'Gwhim', '解决了BUG：这是BUG名', '2021-04-22 09:55:00');
INSERT INTO `czjl` VALUES ('15c8c8baad7711ebabc1f48e38f91fc1', '0', 'Gwhim', '从【开发】转接给【项目经理】4个任务/BUG', '2021-05-05 15:53:42');
INSERT INTO `czjl` VALUES ('2', '0', 'Gwhim', '解决了BUG：这是BUG名', '2021-04-21 09:55:00');
INSERT INTO `czjl` VALUES ('3', '0', 'Gwhim', '解决了BUG：这是BUG名', '2021-04-01 09:55:00');
INSERT INTO `czjl` VALUES ('31fca439a4b611ebb847f48e38f91fc1', '0', 'Gwhim', '从【测试】转接给【Gwhim】 2个任务/BUG', '2021-04-24 12:32:30');
INSERT INTO `czjl` VALUES ('3274dae4a4cb11ebb847f48e38f91fc1', '0', 'Gwhim', '给项目【GGG2 0.0】移除了成员【第二个开发】', '2021-04-24 15:02:50');
INSERT INTO `czjl` VALUES ('341a9ecea4cb11ebb847f48e38f91fc1', '0', 'Gwhim', '给项目【GGG2 0.0】添加了新成员【第二个开发】', '2021-04-24 15:02:53');
INSERT INTO `czjl` VALUES ('3729fe7fa4cb11ebb847f48e38f91fc1', '0', 'Gwhim', '给项目【GGG2 0.0】添加了新成员【测试】', '2021-04-24 15:02:58');
INSERT INTO `czjl` VALUES ('373814b4a4cb11ebb847f48e38f91fc1', '0', 'Gwhim', '给项目【GGG2 0.0】添加了新成员【测试】', '2021-04-24 15:02:58');
INSERT INTO `czjl` VALUES ('37437e6aa4cb11ebb847f48e38f91fc1', '0', 'Gwhim', '给项目【GGG2 0.0】添加了新成员【测试】', '2021-04-24 15:02:58');
INSERT INTO `czjl` VALUES ('376d61d2a4cb11ebb847f48e38f91fc1', '0', 'Gwhim', '给项目【GGG2 0.0】添加了新成员【测试】', '2021-04-24 15:02:59');
INSERT INTO `czjl` VALUES ('4b28a7a1a4ca11ebb847f48e38f91fc1', '0', 'Gwhim', '给项目【GGG2 0.0】添加了新成员【第二个开发】', '2021-04-24 14:56:22');
INSERT INTO `czjl` VALUES ('4b28d129a4ca11ebb847f48e38f91fc1', '0', 'Gwhim', '给项目【GGG2 0.0】添加了新成员【测试】', '2021-04-24 14:56:22');
INSERT INTO `czjl` VALUES ('4b28d648a4ca11ebb847f48e38f91fc1', '0', 'Gwhim', '给项目【GGG2 0.0】添加了新成员【开发】', '2021-04-24 14:56:22');
INSERT INTO `czjl` VALUES ('4b28d8e4a4ca11ebb847f48e38f91fc1', '0', 'Gwhim', '给项目【GGG2 0.0】添加了新成员【需求】', '2021-04-24 14:56:22');
INSERT INTO `czjl` VALUES ('4b28dd19a4ca11ebb847f48e38f91fc1', '0', 'Gwhim', '给项目【GGG2 0.0】添加了新成员【项目经理】', '2021-04-24 14:56:22');
INSERT INTO `czjl` VALUES ('4b4101bda4ca11ebb847f48e38f91fc1', '0', 'Gwhim', '给项目【GGG2 0.0】添加了新成员【第二个开发】', '2021-04-24 14:56:23');
INSERT INTO `czjl` VALUES ('4b41da8da4ca11ebb847f48e38f91fc1', '0', 'Gwhim', '给项目【GGG2 0.0】添加了新成员【测试】', '2021-04-24 14:56:23');
INSERT INTO `czjl` VALUES ('4b41dcdca4ca11ebb847f48e38f91fc1', '0', 'Gwhim', '给项目【GGG2 0.0】添加了新成员【开发】', '2021-04-24 14:56:23');
INSERT INTO `czjl` VALUES ('4b41ddfaa4ca11ebb847f48e38f91fc1', '0', 'Gwhim', '给项目【GGG2 0.0】添加了新成员【需求】', '2021-04-24 14:56:23');
INSERT INTO `czjl` VALUES ('4b41df19a4ca11ebb847f48e38f91fc1', '0', 'Gwhim', '给项目【GGG2 0.0】添加了新成员【项目经理】', '2021-04-24 14:56:23');
INSERT INTO `czjl` VALUES ('525993e9a8ce11ebabc1f48e38f91fc1', '0', 'Gwhim', '给项目【Gtwo】添加了新迭代', '2021-04-29 17:35:58');
INSERT INTO `czjl` VALUES ('5401340ba4ca11ebb847f48e38f91fc1', '0', 'Gwhim', '给项目【GGG2 0.0】移除了成员【第二个开发】', '2021-04-24 14:56:37');
INSERT INTO `czjl` VALUES ('551ca11ea4ca11ebb847f48e38f91fc1', '0', 'Gwhim', '给项目【GGG2 0.0】移除了成员【测试】', '2021-04-24 14:56:39');
INSERT INTO `czjl` VALUES ('56fc811ba4ca11ebb847f48e38f91fc1', '0', 'Gwhim', '给项目【GGG2 0.0】移除了成员【开发】', '2021-04-24 14:56:42');
INSERT INTO `czjl` VALUES ('58436c3ca4ca11ebb847f48e38f91fc1', '0', 'Gwhim', '给项目【GGG2 0.0】移除了成员【需求】', '2021-04-24 14:56:44');
INSERT INTO `czjl` VALUES ('59cc2d1ba4ca11ebb847f48e38f91fc1', '0', 'Gwhim', '给项目【GGG2 0.0】移除了成员【项目经理】', '2021-04-24 14:56:47');
INSERT INTO `czjl` VALUES ('5b18f59ea4cc11ebb847f48e38f91fc1', '0', 'Gwhim', '给项目【GGG2 0.0】移除了成员【需求】', '2021-04-24 15:11:08');
INSERT INTO `czjl` VALUES ('5deb8a43a4cc11ebb847f48e38f91fc1', '0', 'Gwhim', '给项目【GGG2 0.0】添加了新成员【需求】', '2021-04-24 15:11:13');
INSERT INTO `czjl` VALUES ('5e744756a4ca11ebb847f48e38f91fc1', '0', 'Gwhim', '给项目【GGG2 0.0】添加了新成员【项目经理】', '2021-04-24 14:56:55');
INSERT INTO `czjl` VALUES ('5e751f53a4ca11ebb847f48e38f91fc1', '0', 'Gwhim', '给项目【GGG2 0.0】添加了新成员【开发】', '2021-04-24 14:56:55');
INSERT INTO `czjl` VALUES ('5e752294a4ca11ebb847f48e38f91fc1', '0', 'Gwhim', '给项目【GGG2 0.0】添加了新成员【需求】', '2021-04-24 14:56:55');
INSERT INTO `czjl` VALUES ('5e7523b2a4ca11ebb847f48e38f91fc1', '0', 'Gwhim', '给项目【GGG2 0.0】添加了新成员【测试】', '2021-04-24 14:56:55');
INSERT INTO `czjl` VALUES ('5e7538a4a4ca11ebb847f48e38f91fc1', '0', 'Gwhim', '给项目【GGG2 0.0】添加了新成员【第二个开发】', '2021-04-24 14:56:55');
INSERT INTO `czjl` VALUES ('6328ba27a4cc11ebb847f48e38f91fc1', '0', 'Gwhim', '给项目【GGG2 0.0】移除了成员【开发】', '2021-04-24 15:11:22');
INSERT INTO `czjl` VALUES ('63db6a22a4cc11ebb847f48e38f91fc1', '0', 'Gwhim', '给项目【GGG2 0.0】移除了成员【需求】', '2021-04-24 15:11:23');
INSERT INTO `czjl` VALUES ('65d4c0bda4cc11ebb847f48e38f91fc1', '0', 'Gwhim', '给项目【GGG2 0.0】添加了新成员【开发】', '2021-04-24 15:11:26');
INSERT INTO `czjl` VALUES ('65d4c618a4cc11ebb847f48e38f91fc1', '0', 'Gwhim', '给项目【GGG2 0.0】添加了新成员【需求】', '2021-04-24 15:11:26');
INSERT INTO `czjl` VALUES ('6608d17bad7411ebabc1f48e38f91fc1', '0', 'Gwhim', '从【项目经理】转接给【Gwhim】1个任务/BUG', '2021-05-05 15:34:28');
INSERT INTO `czjl` VALUES ('745e2004a4cb11ebb847f48e38f91fc1', '0', 'Gwhim', '给项目【GGG2 0.0】添加了新成员【需求】', '2021-04-24 15:04:41');
INSERT INTO `czjl` VALUES ('745e3908a4cb11ebb847f48e38f91fc1', '0', 'Gwhim', '给项目【GGG2 0.0】添加了新成员【开发】', '2021-04-24 15:04:41');
INSERT INTO `czjl` VALUES ('745e3c4da4cb11ebb847f48e38f91fc1', '0', 'Gwhim', '给项目【GGG2 0.0】添加了新成员【项目经理】', '2021-04-24 15:04:41');
INSERT INTO `czjl` VALUES ('745e3d98a4cb11ebb847f48e38f91fc1', '0', 'Gwhim', '给项目【GGG2 0.0】添加了新成员【测试】', '2021-04-24 15:04:41');
INSERT INTO `czjl` VALUES ('745e3ee6a4cb11ebb847f48e38f91fc1', '0', 'Gwhim', '给项目【GGG2 0.0】添加了新成员【第二个开发】', '2021-04-24 15:04:41');
INSERT INTO `czjl` VALUES ('78755c8ba4bb11ebb847f48e38f91fc1', '0', 'Gwhim', '从项目【GGG0.1】移除了成员【测试】', '2021-04-24 13:10:16');
INSERT INTO `czjl` VALUES ('78cbb2acad6b11ebabc1f48e38f91fc1', '0', 'Gwhim', '从【Gwhim】转接给【项目经理】1个任务/BUG', '2021-05-05 14:30:34');
INSERT INTO `czjl` VALUES ('7b4eaff5ad7c11ebabc1f48e38f91fc1', '1', '项目经理', '从【Gwhim】转接给【开发】2个任务/BUG', '2021-05-05 16:32:20');
INSERT INTO `czjl` VALUES ('83399821ad6b11ebabc1f48e38f91fc1', '0', 'Gwhim', '从【项目经理】转接给【Gwhim】1个任务/BUG', '2021-05-05 14:30:52');
INSERT INTO `czjl` VALUES ('83c335e3ad7c11ebabc1f48e38f91fc1', '1', '项目经理', '从项目【GGG0.1】移除了成员【Gwhim】', '2021-05-05 16:32:34');
INSERT INTO `czjl` VALUES ('842e8b91a4ca11ebb847f48e38f91fc1', '0', 'Gwhim', '给项目【GGG2 0.0】移除了成员【第二个开发】', '2021-04-24 14:57:58');
INSERT INTO `czjl` VALUES ('84e429f6a4ca11ebb847f48e38f91fc1', '0', 'Gwhim', '给项目【GGG2 0.0】移除了成员【第二个开发】', '2021-04-24 14:57:59');
INSERT INTO `czjl` VALUES ('8542749aad7611ebabc1f48e38f91fc1', '0', 'Gwhim', '从【项目经理】转接给【开发】1个任务/BUG', '2021-05-05 15:49:40');
INSERT INTO `czjl` VALUES ('85ebba71a4ca11ebb847f48e38f91fc1', '0', 'Gwhim', '给项目【GGG2 0.0】移除了成员【测试】', '2021-04-24 14:58:01');
INSERT INTO `czjl` VALUES ('86d09d69a4ca11ebb847f48e38f91fc1', '0', 'Gwhim', '给项目【GGG2 0.0】移除了成员【开发】', '2021-04-24 14:58:02');
INSERT INTO `czjl` VALUES ('87fe745ba4ca11ebb847f48e38f91fc1', '0', 'Gwhim', '给项目【GGG2 0.0】移除了成员【需求】', '2021-04-24 14:58:04');
INSERT INTO `czjl` VALUES ('88f2b391a4ca11ebb847f48e38f91fc1', '0', 'Gwhim', '给项目【GGG2 0.0】移除了成员【项目经理】', '2021-04-24 14:58:06');
INSERT INTO `czjl` VALUES ('8b67b683a8bd11ebabc1f48e38f91fc1', '1', '项目经理', '给项目【999】添加了新成员【测试】', '2021-04-29 15:35:52');
INSERT INTO `czjl` VALUES ('8b6892d7a8bd11ebabc1f48e38f91fc1', '1', '项目经理', '给项目【999】添加了新成员【Gwhim】', '2021-04-29 15:35:52');
INSERT INTO `czjl` VALUES ('8dacff58a4ca11ebb847f48e38f91fc1', '0', 'Gwhim', '给项目【GGG2 0.0】添加了新成员【需求】', '2021-04-24 14:58:14');
INSERT INTO `czjl` VALUES ('8dad05daa4ca11ebb847f48e38f91fc1', '0', 'Gwhim', '给项目【GGG2 0.0】添加了新成员【开发】', '2021-04-24 14:58:14');
INSERT INTO `czjl` VALUES ('8dad0757a4ca11ebb847f48e38f91fc1', '0', 'Gwhim', '给项目【GGG2 0.0】添加了新成员【测试】', '2021-04-24 14:58:14');
INSERT INTO `czjl` VALUES ('8dad092ca4ca11ebb847f48e38f91fc1', '0', 'Gwhim', '给项目【GGG2 0.0】添加了新成员【第二个开发】', '2021-04-24 14:58:14');
INSERT INTO `czjl` VALUES ('8dad0a43a4ca11ebb847f48e38f91fc1', '0', 'Gwhim', '给项目【GGG2 0.0】添加了新成员【项目经理】', '2021-04-24 14:58:14');
INSERT INTO `czjl` VALUES ('96e0301bad7411ebabc1f48e38f91fc1', '0', 'Gwhim', '从【Gwhim】转接给【项目经理】1个任务/BUG', '2021-05-05 15:35:50');
INSERT INTO `czjl` VALUES ('9afcb992aff311eb964af48e38f91fc1', '1', '项目经理', '关闭了项目【Gtwo】', '2021-05-08 19:50:21');
INSERT INTO `czjl` VALUES ('ab7f4950bae611eb964af48e38f91fc1', '1', '项目经理', '添加新项目【1】', '2021-05-22 18:14:30');
INSERT INTO `czjl` VALUES ('b1a33979bae611eb964af48e38f91fc1', '1', '项目经理', '关闭了项目【1】', '2021-05-22 18:14:40');
INSERT INTO `czjl` VALUES ('b2216d13a4ca11ebb847f48e38f91fc1', '0', 'Gwhim', '给项目【GGG2 0.0】移除了成员【第二个开发】', '2021-04-24 14:59:15');
INSERT INTO `czjl` VALUES ('b2f90a3aa4ca11ebb847f48e38f91fc1', '0', 'Gwhim', '给项目【GGG2 0.0】移除了成员【测试】', '2021-04-24 14:59:17');
INSERT INTO `czjl` VALUES ('b4f3b8cba4ca11ebb847f48e38f91fc1', '0', 'Gwhim', '给项目【GGG2 0.0】移除了成员【开发】', '2021-04-24 14:59:20');
INSERT INTO `czjl` VALUES ('b5dd5c8ea4ca11ebb847f48e38f91fc1', '0', 'Gwhim', '给项目【GGG2 0.0】移除了成员【需求】', '2021-04-24 14:59:21');
INSERT INTO `czjl` VALUES ('b79cb805a4ca11ebb847f48e38f91fc1', '0', 'Gwhim', '给项目【GGG2 0.0】添加了新成员【需求】', '2021-04-24 14:59:24');
INSERT INTO `czjl` VALUES ('b79cb884a4ca11ebb847f48e38f91fc1', '0', 'Gwhim', '给项目【GGG2 0.0】添加了新成员【需求】', '2021-04-24 14:59:24');
INSERT INTO `czjl` VALUES ('bb7e6b99a4ca11ebb847f48e38f91fc1', '0', 'Gwhim', '给项目【GGG2 0.0】添加了新成员【第二个开发】', '2021-04-24 14:59:31');
INSERT INTO `czjl` VALUES ('bcbfd5a0a4ba11ebb847f48e38f91fc1', '0', 'Gwhim', '给项目【GGG0.1】添加了新成员【测试】', '2021-04-24 13:05:01');
INSERT INTO `czjl` VALUES ('bcc00ec6a4ba11ebb847f48e38f91fc1', '0', 'Gwhim', '给项目【GGG0.1】添加了新成员【第二个开发】', '2021-04-24 13:05:01');
INSERT INTO `czjl` VALUES ('bf2a913daf1311eb964af48e38f91fc1', '1', '项目经理', '给项目【GGG】添加了新迭代', '2021-05-07 17:08:11');
INSERT INTO `czjl` VALUES ('c0bb8c70a4ca11ebb847f48e38f91fc1', '0', 'Gwhim', '给项目【GGG2 0.0】添加了新成员【测试】', '2021-04-24 14:59:40');
INSERT INTO `czjl` VALUES ('c56a7737a4ca11ebb847f48e38f91fc1', '0', 'Gwhim', '给项目【GGG2 0.0】移除了成员【第二个开发】', '2021-04-24 14:59:47');
INSERT INTO `czjl` VALUES ('c67d4f22a4ca11ebb847f48e38f91fc1', '0', 'Gwhim', '给项目【GGG2 0.0】移除了成员【测试】', '2021-04-24 14:59:49');
INSERT INTO `czjl` VALUES ('c782df1fa4ca11ebb847f48e38f91fc1', '0', 'Gwhim', '给项目【GGG2 0.0】移除了成员【需求】', '2021-04-24 14:59:51');
INSERT INTO `czjl` VALUES ('ca09a7e5a4ca11ebb847f48e38f91fc1', '0', 'Gwhim', '给项目【GGG2 0.0】添加了新成员【开发】', '2021-04-24 14:59:55');
INSERT INTO `czjl` VALUES ('ca0a7ac7a4ca11ebb847f48e38f91fc1', '0', 'Gwhim', '给项目【GGG2 0.0】添加了新成员【需求】', '2021-04-24 14:59:55');
INSERT INTO `czjl` VALUES ('cb2e29d6ad7c11ebabc1f48e38f91fc1', '1', '项目经理', '给项目【6人团队】添加了新成员【需求】', '2021-05-05 16:34:34');
INSERT INTO `czjl` VALUES ('cb2e2f3dad7c11ebabc1f48e38f91fc1', '1', '项目经理', '给项目【6人团队】添加了新成员【第二个测试】', '2021-05-05 16:34:34');
INSERT INTO `czjl` VALUES ('ce02d18ba4ca11ebb847f48e38f91fc1', '0', 'Gwhim', '给项目【GGG2 0.0】添加了新成员【第二个开发】', '2021-04-24 15:00:02');
INSERT INTO `czjl` VALUES ('ce3de09ba4ca11ebb847f48e38f91fc1', '0', 'Gwhim', '给项目【GGG2 0.0】添加了新成员【第二个开发】', '2021-04-24 15:00:02');
INSERT INTO `czjl` VALUES ('ce54a9c1a4ca11ebb847f48e38f91fc1', '0', 'Gwhim', '给项目【GGG2 0.0】添加了新成员【第二个开发】', '2021-04-24 15:00:02');
INSERT INTO `czjl` VALUES ('cfa0f516c10311ebbc49f48e38f91fc1', '1', '项目经理', '从项目【6人团队】移除了成员【第二个测试】', '2021-05-30 12:59:00');
INSERT INTO `czjl` VALUES ('f588959bad9d11ebabc1f48e38f91fc1', '1', '项目经理', '给项目【Gtwo】添加了新迭代', '2021-05-05 20:31:53');
INSERT INTO `czjl` VALUES ('f5c98f6aad9d11ebabc1f48e38f91fc1', '1', '项目经理', '给项目【Gtwo】添加了新迭代', '2021-05-05 20:31:53');

-- ----------------------------
-- Table structure for demand
-- ----------------------------
DROP TABLE IF EXISTS `demand`;
CREATE TABLE `demand`  (
  `id` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `file_id` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `version_id` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of demand
-- ----------------------------
INSERT INTO `demand` VALUES ('16fd2653bc3c11eb964af48e38f91fc1', '4ef30a4fd2cc469b95fc7cb9bca91164', 'dd2349332d0d40f5901bd6f8f882f3eb');
INSERT INTO `demand` VALUES ('35b52cb1b77c11eb964af48e38f91fc1', '3b9bd9c280ea4d9c8810e333d3398d3f', 'dd2349332d0d40f5901bd6f8f882f3eb');
INSERT INTO `demand` VALUES ('493df5f0b77e11eb964af48e38f91fc1', 'f1ad15fd11b24bb49434f439810b9c26', 'dd2349332d0d40f5901bd6f8f882f3eb');
INSERT INTO `demand` VALUES ('6b2340e1c33911ebbc49f48e38f91fc1', 'a8d90c6e4ad0403585e7e4e750c20eb7', '701decfa0496446e926e55d4675e78e1');
INSERT INTO `demand` VALUES ('7755d227b78011eb964af48e38f91fc1', '3a2cfd0041d0458f8b14c148f2c752b6', 'dd2349332d0d40f5901bd6f8f882f3eb');
INSERT INTO `demand` VALUES ('b446add8b77e11eb964af48e38f91fc1', '8bc3ef40676345109fda8759fbd541ef', 'dd2349332d0d40f5901bd6f8f882f3eb');
INSERT INTO `demand` VALUES ('bb0ac4e0c07111ebbc49f48e38f91fc1', 'd88c6cb1514246d8bb28278fd362de64', '701decfa0496446e926e55d4675e78e1');
INSERT INTO `demand` VALUES ('bef6d52eb77f11eb964af48e38f91fc1', '2e3672d6332a40a89ff07839ae1530d2', 'dd2349332d0d40f5901bd6f8f882f3eb');
INSERT INTO `demand` VALUES ('c7d4a3dfb77c11eb964af48e38f91fc1', 'df84f717f4084ec3843d7f9201e38dea', 'dd2349332d0d40f5901bd6f8f882f3eb');
INSERT INTO `demand` VALUES ('d93660edb78011eb964af48e38f91fc1', '195b9a184bfb49848a34c15f47a67b6e', 'dd2349332d0d40f5901bd6f8f882f3eb');
INSERT INTO `demand` VALUES ('e910d2c6b77c11eb964af48e38f91fc1', 'c1eeb8aa465944028df51a89f9422563', 'dd2349332d0d40f5901bd6f8f882f3eb');
INSERT INTO `demand` VALUES ('f3535538b77f11eb964af48e38f91fc1', '55b08592ac774bf29c00a1106e9c10eb', 'dd2349332d0d40f5901bd6f8f882f3eb');

-- ----------------------------
-- Table structure for demand_item
-- ----------------------------
DROP TABLE IF EXISTS `demand_item`;
CREATE TABLE `demand_item`  (
  `id` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `version_id` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createuser_id` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createtime` timestamp NULL DEFAULT NULL,
  `status` int(255) NULL DEFAULT NULL COMMENT '0-未生效，1-已生效未验证，2-已验证',
  `enduser_id` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `endtime` timestamp NULL DEFAULT NULL,
  `des` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `demand_id` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of demand_item
-- ----------------------------
INSERT INTO `demand_item` VALUES ('1', '1', '1', NULL, 1, '1', NULL, '1', '1', NULL);
INSERT INTO `demand_item` VALUES ('19ec7324bb7411eb964af48e38f91fc1', 'dd2349332d0d40f5901bd6f8f882f3eb', '1', '2021-05-23 11:06:49', 2, '1', '2021-05-23 11:13:44', 'scope.rowscope.rowscope.rowscope.rowscope.rowscope.rowscope.rowscope.rowscope.rowscope.rowscope.rowscope.rowscope.rowscope.rowscope.rowscope.row', 'd93660edb78011eb964af48e38f91fc1', '3');
INSERT INTO `demand_item` VALUES ('1b4f2922bb7511eb964af48e38f91fc1', 'dd2349332d0d40f5901bd6f8f882f3eb', '1', '2021-05-23 11:14:01', 1, '', NULL, '44444', 'd93660edb78011eb964af48e38f91fc1', '44');
INSERT INTO `demand_item` VALUES ('1fcca330bb7511eb964af48e38f91fc1', 'dd2349332d0d40f5901bd6f8f882f3eb', '1', '2021-05-23 11:14:08', 1, '', NULL, '44444afasf', 'd93660edb78011eb964af48e38f91fc1', '44asd');
INSERT INTO `demand_item` VALUES ('8f4be900c34011ebbc49f48e38f91fc1', '701decfa0496446e926e55d4675e78e1', '1', '2021-06-02 09:18:31', 1, '', NULL, '1', '6b2340e1c33911ebbc49f48e38f91fc1', '1');
INSERT INTO `demand_item` VALUES ('989815fec07611ebbc49f48e38f91fc1', '701decfa0496446e926e55d4675e78e1', '1', '2021-05-29 20:08:17', 1, '', NULL, '新增1的描述？？？？？？？？？？？？？？？', 'bb0ac4e0c07111ebbc49f48e38f91fc1', '新增1');
INSERT INTO `demand_item` VALUES ('a80e7b0cc33911ebbc49f48e38f91fc1', '701decfa0496446e926e55d4675e78e1', '1', '2021-06-02 08:29:06', 0, '1', '2021-06-02 09:16:45', 'aaaaaa', '6b2340e1c33911ebbc49f48e38f91fc1', 'a条目');
INSERT INTO `demand_item` VALUES ('cf278dcfbaf211eb964af48e38f91fc1', 'dd2349332d0d40f5901bd6f8f882f3eb', '1', '2021-05-22 19:41:24', 0, '1', '2021-05-23 11:04:40', '2', 'd93660edb78011eb964af48e38f91fc1', '2');

-- ----------------------------
-- Table structure for file
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file`  (
  `id` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `orthername` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '存在服务器的名字',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '存储路径',
  `user_id` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` int(255) NULL DEFAULT NULL COMMENT '0-失效，1需求，2-测试',
  `createtime` timestamp NULL DEFAULT NULL,
  `version_id` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of file
-- ----------------------------
INSERT INTO `file` VALUES ('195b9a184bfb49848a34c15f47a67b6e', '中期报告 软件1702 Gwhim 1711030209.doc', '1621304923685中期报告 软件1702 Gwhim 1711030209.doc', 'E:/wjsq/xq/', '1', 1, '2021-05-18 02:28:44', 'dd2349332d0d40f5901bd6f8f882f3eb');
INSERT INTO `file` VALUES ('2e3672d6332a40a89ff07839ae1530d2', 'btn.png', '1621304450103btn.png', 'E:/wjsq/xq/', '1', 1, '2021-05-18 02:20:50', 'dd2349332d0d40f5901bd6f8f882f3eb');
INSERT INTO `file` VALUES ('3a2cfd0041d0458f8b14c148f2c752b6', '进度.doc', '1621304759466进度.doc', 'E:/wjsq/xq/', '1', 1, '2021-05-18 02:25:59', 'dd2349332d0d40f5901bd6f8f882f3eb');
INSERT INTO `file` VALUES ('3b9bd9c280ea4d9c8810e333d3398d3f', 'btn2.png', '1621302894951btn2.png', 'E:/wjsq/xq/', '1', 1, '2021-05-18 01:54:55', 'dd2349332d0d40f5901bd6f8f882f3eb');
INSERT INTO `file` VALUES ('405cc044c3cb4403b4918c01c913d403', '测试用例.doc', '1622593271060测试用例.doc', 'E:/wjsq/cs/', '1', 2, '2021-06-02 00:21:11', '701decfa0496446e926e55d4675e78e1');
INSERT INTO `file` VALUES ('4ef30a4fd2cc469b95fc7cb9bca91164', '给小宝贝的机密.doc', '1621825062786给小宝贝的机密.doc', 'E:/wjsq/xq/', '1', 1, '2021-05-24 02:57:43', 'dd2349332d0d40f5901bd6f8f882f3eb');
INSERT INTO `file` VALUES ('55b08592ac774bf29c00a1106e9c10eb', 'QQ图片20210430204757.png', '1621304537988QQ图片20210430204757.png', 'E:/wjsq/xq/', '1', 1, '2021-05-18 02:22:18', 'dd2349332d0d40f5901bd6f8f882f3eb');
INSERT INTO `file` VALUES ('8bc3ef40676345109fda8759fbd541ef', '给小宝贝的机密.doc', '1621304002716给小宝贝的机密.doc', 'E:/wjsq/xq/', '1', 1, '2021-05-18 02:13:23', 'dd2349332d0d40f5901bd6f8f882f3eb');
INSERT INTO `file` VALUES ('a8d90c6e4ad0403585e7e4e750c20eb7', 'aaa1.doc', '1622593643730aaa1.doc', 'E:/wjsq/xq/', '1', 1, '2021-06-02 00:27:24', '701decfa0496446e926e55d4675e78e1');
INSERT INTO `file` VALUES ('bf25247078e542fbbf72b239cd5a90c3', '给小宝贝的机密.doc', '1621825112252给小宝贝的机密.doc', 'E:/wjsq/cs/', '1', 2, '2021-05-24 02:58:32', 'dd2349332d0d40f5901bd6f8f882f3eb');
INSERT INTO `file` VALUES ('c1eeb8aa465944028df51a89f9422563', 'QQ截图20210430205456.png', '1621303232308QQ截图20210430205456.png', 'E:/wjsq/xq/', '1', 1, '2021-05-18 02:00:32', 'dd2349332d0d40f5901bd6f8f882f3eb');
INSERT INTO `file` VALUES ('df84f717f4084ec3843d7f9201e38dea', 'btn.png', '1621303176547btn.png', 'E:/wjsq/xq/', '1', 1, '2021-05-18 01:59:37', 'dd2349332d0d40f5901bd6f8f882f3eb');

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project`  (
  `id` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dec` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createuser_id` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createtime` timestamp NULL DEFAULT NULL,
  `enduser_id` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `endtime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('0', 'GGG', '这是一个测试项目', '0', '2021-04-18 11:37:00', NULL, NULL);
INSERT INTO `project` VALUES ('1', 'Gtwo', '这是第二个测试项目', '0', '2021-04-22 11:37:00', '1', '2021-05-08 19:50:20');
INSERT INTO `project` VALUES ('2', 'G3', '这是第三个测试项目', '0', '2021-04-20 11:37:00', NULL, NULL);
INSERT INTO `project` VALUES ('30c00e8e6a9b48778c27a623ff570798', '小g', '这是add的测试', '0', '2021-04-28 16:06:31', NULL, NULL);
INSERT INTO `project` VALUES ('430e2b4a014c40fc87701f1185316aef', '1', '1', '1', '2021-05-22 18:14:30', '1', '2021-05-22 18:14:40');
INSERT INTO `project` VALUES ('c4ebe75ea8c54225ace76a6df931d4d3', '这是项目经理的第一个项目', '一个随便的描述', '1', '2021-04-28 16:08:59', NULL, NULL);
INSERT INTO `project` VALUES ('c6ef843a871a4dd9be485394fc0e3224', '1', '2', '0', '2021-04-28 16:00:17', '1', '2021-04-29 17:06:46');
INSERT INTO `project` VALUES ('d8004412cdd64fd8b437dc20ce013d6f', '项目经理2', '项目经理2', '1', '2021-04-28 16:15:40', NULL, NULL);

-- ----------------------------
-- Table structure for team
-- ----------------------------
DROP TABLE IF EXISTS `team`;
CREATE TABLE `team`  (
  `id` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `version_id` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sfyx` int(11) NULL DEFAULT NULL COMMENT '0-无效 1-有效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of team
-- ----------------------------
INSERT INTO `team` VALUES ('0', '0', '0', 1);
INSERT INTO `team` VALUES ('1', '1', '0', 0);
INSERT INTO `team` VALUES ('11', '2', '0', 1);
INSERT INTO `team` VALUES ('11c41b3fa8ce11ebabc1f48e38f91fc1', 'c3d8b30c1cc14f40bc9e5e9d535a3124', '5', 1);
INSERT INTO `team` VALUES ('11c466a8a8ce11ebabc1f48e38f91fc1', 'c3d8b30c1cc14f40bc9e5e9d535a3124', '4', 1);
INSERT INTO `team` VALUES ('11c46b05a8ce11ebabc1f48e38f91fc1', 'c3d8b30c1cc14f40bc9e5e9d535a3124', '3', 1);
INSERT INTO `team` VALUES ('11c46ed3a8ce11ebabc1f48e38f91fc1', 'c3d8b30c1cc14f40bc9e5e9d535a3124', '1', 1);
INSERT INTO `team` VALUES ('16ba69dca3d211ebb847f48e38f91fc1', '1', '1', 1);
INSERT INTO `team` VALUES ('2', '1', '3', 1);
INSERT INTO `team` VALUES ('3', '0', '1', 1);
INSERT INTO `team` VALUES ('41ef5174a8bd11ebabc1f48e38f91fc1', '37d894e5f1c0433b9a0ee5bc717174e6', '3', 1);
INSERT INTO `team` VALUES ('41f04fa2a8bd11ebabc1f48e38f91fc1', '37d894e5f1c0433b9a0ee5bc717174e6', '5', 1);
INSERT INTO `team` VALUES ('41f0516ba8bd11ebabc1f48e38f91fc1', '37d894e5f1c0433b9a0ee5bc717174e6', '2', 1);
INSERT INTO `team` VALUES ('41f051daa8bd11ebabc1f48e38f91fc1', '37d894e5f1c0433b9a0ee5bc717174e6', '1', 1);
INSERT INTO `team` VALUES ('524a1ea7a8ce11ebabc1f48e38f91fc1', '9e5b130fb80f42fb9542964c3bca019f', '5', 1);
INSERT INTO `team` VALUES ('524a3aa2a8ce11ebabc1f48e38f91fc1', '9e5b130fb80f42fb9542964c3bca019f', '4', 1);
INSERT INTO `team` VALUES ('524a3b8ea8ce11ebabc1f48e38f91fc1', '9e5b130fb80f42fb9542964c3bca019f', '3', 1);
INSERT INTO `team` VALUES ('524a3c0ca8ce11ebabc1f48e38f91fc1', '9e5b130fb80f42fb9542964c3bca019f', '1', 1);
INSERT INTO `team` VALUES ('524a3d1ca8ce11ebabc1f48e38f91fc1', '9e5b130fb80f42fb9542964c3bca019f', '2', 1);
INSERT INTO `team` VALUES ('6', '6', '6', 1);
INSERT INTO `team` VALUES ('8b5665e0a8bd11ebabc1f48e38f91fc1', '37d894e5f1c0433b9a0ee5bc717174e6', '4', 1);
INSERT INTO `team` VALUES ('8b566caea8bd11ebabc1f48e38f91fc1', '37d894e5f1c0433b9a0ee5bc717174e6', '0', 1);
INSERT INTO `team` VALUES ('9193fc38a8be11ebabc1f48e38f91fc1', 'dd2349332d0d40f5901bd6f8f882f3eb', '1', 1);
INSERT INTO `team` VALUES ('9194cfa2a8be11ebabc1f48e38f91fc1', 'dd2349332d0d40f5901bd6f8f882f3eb', '4', 1);
INSERT INTO `team` VALUES ('9194d0cea8be11ebabc1f48e38f91fc1', 'dd2349332d0d40f5901bd6f8f882f3eb', '3', 1);
INSERT INTO `team` VALUES ('a33de688a7f811ebabc1f48e38f91fc1', '3632a0ebc0ff4175bc7e49ca7adda6ba', '5', 1);
INSERT INTO `team` VALUES ('ab7007e9bae611eb964af48e38f91fc1', '031709e160f043ad98c75daa882aef84', '3', 1);
INSERT INTO `team` VALUES ('be772b8fa8ba11ebabc1f48e38f91fc1', '236f0cba9d3f47388747a9b212face3b', '3', 1);
INSERT INTO `team` VALUES ('be780f6fa8ba11ebabc1f48e38f91fc1', '236f0cba9d3f47388747a9b212face3b', '4', 1);
INSERT INTO `team` VALUES ('be7823f2a8ba11ebabc1f48e38f91fc1', '236f0cba9d3f47388747a9b212face3b', '5', 1);
INSERT INTO `team` VALUES ('be7824dca8ba11ebabc1f48e38f91fc1', '236f0cba9d3f47388747a9b212face3b', '2', 1);
INSERT INTO `team` VALUES ('be78257da8ba11ebabc1f48e38f91fc1', '236f0cba9d3f47388747a9b212face3b', '1', 1);
INSERT INTO `team` VALUES ('bf1c3c02af1311eb964af48e38f91fc1', '701decfa0496446e926e55d4675e78e1', '1', 1);
INSERT INTO `team` VALUES ('bf1c4398af1311eb964af48e38f91fc1', '701decfa0496446e926e55d4675e78e1', '3', 1);
INSERT INTO `team` VALUES ('bf1c44c8af1311eb964af48e38f91fc1', '701decfa0496446e926e55d4675e78e1', '4', 1);
INSERT INTO `team` VALUES ('bf1c4567af1311eb964af48e38f91fc1', '701decfa0496446e926e55d4675e78e1', '2', 1);
INSERT INTO `team` VALUES ('c4a1925da7f711ebabc1f48e38f91fc1', 'f6b3fd153f9b4577a81bf41e58753b33', '3', 1);
INSERT INTO `team` VALUES ('c4a1963ea7f711ebabc1f48e38f91fc1', 'f6b3fd153f9b4577a81bf41e58753b33', '4', 1);
INSERT INTO `team` VALUES ('c4a19701a7f711ebabc1f48e38f91fc1', 'f6b3fd153f9b4577a81bf41e58753b33', '5', 1);
INSERT INTO `team` VALUES ('c4a1975ea7f711ebabc1f48e38f91fc1', 'f6b3fd153f9b4577a81bf41e58753b33', '2', 1);
INSERT INTO `team` VALUES ('cb20e141ad7c11ebabc1f48e38f91fc1', 'dd2349332d0d40f5901bd6f8f882f3eb', '2', 1);
INSERT INTO `team` VALUES ('cb2139b8ad7c11ebabc1f48e38f91fc1', 'dd2349332d0d40f5901bd6f8f882f3eb', '5', 0);
INSERT INTO `team` VALUES ('ea983f30a7f911ebabc1f48e38f91fc1', '500beebd0aab4302a96edd671211c786', '5', 1);
INSERT INTO `team` VALUES ('ea9859eda7f911ebabc1f48e38f91fc1', '500beebd0aab4302a96edd671211c786', '1', 1);
INSERT INTO `team` VALUES ('ea985bbda7f911ebabc1f48e38f91fc1', '500beebd0aab4302a96edd671211c786', '2', 1);
INSERT INTO `team` VALUES ('f56f09f2ad9d11ebabc1f48e38f91fc1', '13f52411d5cf4c64b3443408373dbba3', '5', 1);
INSERT INTO `team` VALUES ('f56f227ead9d11ebabc1f48e38f91fc1', '13f52411d5cf4c64b3443408373dbba3', '4', 1);
INSERT INTO `team` VALUES ('f56f3326ad9d11ebabc1f48e38f91fc1', '13f52411d5cf4c64b3443408373dbba3', '3', 1);
INSERT INTO `team` VALUES ('f56f3412ad9d11ebabc1f48e38f91fc1', '13f52411d5cf4c64b3443408373dbba3', '2', 1);
INSERT INTO `team` VALUES ('f5b404a8ad9d11ebabc1f48e38f91fc1', '78872cfccc6d4f4789a12e9926925744', '5', 1);
INSERT INTO `team` VALUES ('f5b53060ad9d11ebabc1f48e38f91fc1', '78872cfccc6d4f4789a12e9926925744', '4', 1);
INSERT INTO `team` VALUES ('f5b53d49ad9d11ebabc1f48e38f91fc1', '78872cfccc6d4f4789a12e9926925744', '3', 1);
INSERT INTO `team` VALUES ('f5b53ec0ad9d11ebabc1f48e38f91fc1', '78872cfccc6d4f4789a12e9926925744', '2', 1);
INSERT INTO `team` VALUES ('fbead1c7a7f811ebabc1f48e38f91fc1', 'd42808241f4c484bb9b0a241acf820d7', '3', 1);
INSERT INTO `team` VALUES ('fbeada3ea7f811ebabc1f48e38f91fc1', 'd42808241f4c484bb9b0a241acf820d7', '5', 1);
INSERT INTO `team` VALUES ('fbeadb71a7f811ebabc1f48e38f91fc1', 'd42808241f4c484bb9b0a241acf820d7', '2', 1);
INSERT INTO `team` VALUES ('fbeadc6ea7f811ebabc1f48e38f91fc1', 'd42808241f4c484bb9b0a241acf820d7', '1', 1);

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test`  (
  `id` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `file_id` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `version_id` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES ('8cfa5c9fc33811ebbc49f48e38f91fc1', '405cc044c3cb4403b4918c01c913d403', '701decfa0496446e926e55d4675e78e1');

-- ----------------------------
-- Table structure for test_item
-- ----------------------------
DROP TABLE IF EXISTS `test_item`;
CREATE TABLE `test_item`  (
  `id` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `version_id` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createuser_id` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createtime` timestamp NULL DEFAULT NULL,
  `status` int(255) NULL DEFAULT NULL COMMENT '0-未生效，1-已生效未验证，2-已验证',
  `enduser_id` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `endtime` timestamp NULL DEFAULT NULL,
  `des` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `test_id` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test_item
-- ----------------------------
INSERT INTO `test_item` VALUES ('12fd7fb3c33911ebbc49f48e38f91fc1', '701decfa0496446e926e55d4675e78e1', '1', '2021-06-02 08:24:56', 1, '', NULL, '？？', '8cfa5c9fc33811ebbc49f48e38f91fc1', '测试条目1');
INSERT INTO `test_item` VALUES ('3c27e2cabc3d11eb964af48e38f91fc1', 'dd2349332d0d40f5901bd6f8f882f3eb', '1', '2021-05-24 11:06:30', 1, '', NULL, '收神圣', '22be0dd1bc3c11eb964af48e38f91fc1', '啊啊啊');
INSERT INTO `test_item` VALUES ('4fbd09f9c07b11ebbc49f48e38f91fc1', '701decfa0496446e926e55d4675e78e1', '1', '2021-05-29 20:42:03', 1, '', NULL, '详情！！？？', '80bb6aa8c07a11ebbc49f48e38f91fc1', '测试条目1');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `identity` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1-项目经理 2-需求 3-开发 4-测试',
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号名',
  `pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录状态 0-未登录 1-在线 2-未审批',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('0', 'Gwhim', '0', '0', '0', '0');
INSERT INTO `user` VALUES ('1', '项目经理', '1', '1', '1', '0');
INSERT INTO `user` VALUES ('2', '需求', '2', '2', '2', '0');
INSERT INTO `user` VALUES ('3', '开发', '3', '3', '3', '0');
INSERT INTO `user` VALUES ('4', '测试', '4', '4', '4', '0');
INSERT INTO `user` VALUES ('5', '第二个测试', '4', '5', '5', '0');

-- ----------------------------
-- Table structure for version
-- ----------------------------
DROP TABLE IF EXISTS `version`;
CREATE TABLE `version`  (
  `id` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `project_id` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(255) NULL DEFAULT NULL COMMENT '0-已关闭 1-正在进行 2-已迭代',
  `createtime` timestamp NULL DEFAULT NULL,
  `creatuser_id` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `enduser_id` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `endtime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of version
-- ----------------------------
INSERT INTO `version` VALUES ('0', '0', 'GGG0.0', 2, '2021-04-18 11:37:00', '0', NULL, NULL);
INSERT INTO `version` VALUES ('031709e160f043ad98c75daa882aef84', '430e2b4a014c40fc87701f1185316aef', '1', 0, '2021-05-22 18:14:30', '1', '1', '2021-05-22 18:14:40');
INSERT INTO `version` VALUES ('1', '0', 'GGG0.1', 2, '2021-04-22 11:37:00', '0', '1', '2021-05-07 17:08:10');
INSERT INTO `version` VALUES ('13f52411d5cf4c64b3443408373dbba3', '1', 'G4', 0, '2021-05-05 20:31:53', '1', '1', '2021-05-08 19:50:21');
INSERT INTO `version` VALUES ('2', '1', 'GGG2 0.0', 2, '2021-04-22 11:37:00', '0', 'c6ef843a871a4dd9be485394fc0e3224', '2021-04-29 16:54:21');
INSERT INTO `version` VALUES ('236f0cba9d3f47388747a9b212face3b', 'c6ef843a871a4dd9be485394fc0e3224', '886', 2, '2021-04-29 15:15:47', '0', '1', '2021-04-29 15:33:49');
INSERT INTO `version` VALUES ('3', '2', 'G3.0', 1, '2021-04-22 11:37:00', '0', NULL, NULL);
INSERT INTO `version` VALUES ('3632a0ebc0ff4175bc7e49ca7adda6ba', '30c00e8e6a9b48778c27a623ff570798', '这是add的测试', 1, '2021-04-28 16:06:31', '0', NULL, NULL);
INSERT INTO `version` VALUES ('37d894e5f1c0433b9a0ee5bc717174e6', 'c6ef843a871a4dd9be485394fc0e3224', '999', 0, '2021-04-29 15:33:49', '1', '1', '2021-04-29 17:06:46');
INSERT INTO `version` VALUES ('500beebd0aab4302a96edd671211c786', 'd8004412cdd64fd8b437dc20ce013d6f', '项目经理2.0', 2, '2021-04-28 16:15:40', '1', '1', '2021-04-29 15:43:12');
INSERT INTO `version` VALUES ('701decfa0496446e926e55d4675e78e1', '0', 'GGG0.2', 1, '2021-05-07 17:08:10', '1', NULL, NULL);
INSERT INTO `version` VALUES ('78872cfccc6d4f4789a12e9926925744', '1', 'G4', 2, '2021-05-05 20:31:53', '1', '1', '2021-05-05 20:31:54');
INSERT INTO `version` VALUES ('9e5b130fb80f42fb9542964c3bca019f', '1', 'Gthree', 2, '2021-04-29 17:35:58', '0', '1', '2021-05-05 20:31:53');
INSERT INTO `version` VALUES ('c3d8b30c1cc14f40bc9e5e9d535a3124', '1', 'GGG', 2, '2021-04-29 17:34:09', '0', '0', '2021-04-29 17:35:58');
INSERT INTO `version` VALUES ('d42808241f4c484bb9b0a241acf820d7', 'c4ebe75ea8c54225ace76a6df931d4d3', '一个随便的迭代名', 1, '2021-04-28 16:09:00', '1', NULL, NULL);
INSERT INTO `version` VALUES ('dd2349332d0d40f5901bd6f8f882f3eb', 'd8004412cdd64fd8b437dc20ce013d6f', '6人团队', 1, '2021-04-29 15:43:12', '1', NULL, NULL);
INSERT INTO `version` VALUES ('f6b3fd153f9b4577a81bf41e58753b33', 'c6ef843a871a4dd9be485394fc0e3224', '3', 2, '2021-04-28 16:00:17', '0', '0', '2021-04-29 15:15:47');

-- ----------------------------
-- Table structure for work
-- ----------------------------
DROP TABLE IF EXISTS `work`;
CREATE TABLE `work`  (
  `id` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `version_id` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createuser_id` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `des` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `work_id` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0-已关闭1-进行中2-已完成3-已转发',
  `createtime` timestamp NULL DEFAULT NULL,
  `enduser_id` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `endtime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of work
-- ----------------------------
INSERT INTO `work` VALUES ('0', '0', '0', '0', '这个第一个任务，由0指派给0', NULL, '1', '2021-04-21 12:43:00', NULL, NULL);
INSERT INTO `work` VALUES ('0c3ab304ad7711ebabc1f48e38f91fc1', '1', '1', '0', '这是给项目经理的任务', NULL, '1', '2021-05-05 15:53:38', NULL, NULL);
INSERT INTO `work` VALUES ('0c4db77ead7711ebabc1f48e38f91fc1', '1', '1', '0', '001', '28ad244dad7a11ebabc1f48e38f91fc1', '3', '2021-05-05 15:53:39', '0', '2021-05-05 16:15:42');
INSERT INTO `work` VALUES ('0c5cfb25ad7711ebabc1f48e38f91fc1', '1', '1', '0', '002', '4ba74f6ead7a11ebabc1f48e38f91fc1', '3', '2021-05-05 15:53:40', '0', '2021-05-05 16:16:41');
INSERT INTO `work` VALUES ('1', '0', '0', '0', '这是第二个任务，0指0,0完成', NULL, '2', '2021-04-21 12:43:00', '0', '2021-04-21 12:43:00');
INSERT INTO `work` VALUES ('1906ac8eaff211eb964af48e38f91fc1', 'dd2349332d0d40f5901bd6f8f882f3eb', '3', '1', '111111', NULL, '2', '2021-05-08 19:39:33', '1', '2021-05-08 19:39:43');
INSERT INTO `work` VALUES ('1e08343bbc4911eb964af48e38f91fc1', 'dd2349332d0d40f5901bd6f8f882f3eb', '3', '1', '啊啊啊啊啊', NULL, '1', '2021-05-24 12:31:33', NULL, NULL);
INSERT INTO `work` VALUES ('2', '1', '0', '0', '这是第二个任务，0指0', '73dbe36bad7c11ebabc1f48e38f91fc1', '3', '2021-05-05 14:30:52', '1', '2021-05-05 16:32:07');
INSERT INTO `work` VALUES ('233d9a2cbc4911eb964af48e38f91fc1', '701decfa0496446e926e55d4675e78e1', '1', '1', 'GGG0.2的任务', NULL, '1', '2021-05-24 12:31:42', NULL, NULL);
INSERT INTO `work` VALUES ('28ad244dad7a11ebabc1f48e38f91fc1', '1', '3', '0', '001', NULL, '1', '2021-05-05 16:15:52', NULL, NULL);
INSERT INTO `work` VALUES ('3', '1', '0', '0', '这是第二个任务，0指0,0完成', NULL, '2', '2021-04-22 12:43:00', '0', '2021-04-22 12:43:00');
INSERT INTO `work` VALUES ('4a836701aff511eb964af48e38f91fc1', '701decfa0496446e926e55d4675e78e1', '3', '1', '1123123', NULL, '0', '2021-05-08 20:02:25', '1', '2021-05-08 20:05:00');
INSERT INTO `work` VALUES ('4ba74f6ead7a11ebabc1f48e38f91fc1', '1', '3', '0', '002', NULL, '0', '2021-05-05 16:16:42', '0', '2021-05-05 16:28:02');
INSERT INTO `work` VALUES ('5039f772aff411eb964af48e38f91fc1', '701decfa0496446e926e55d4675e78e1', '4', '1', 'GGG0.2的任务', '233d9a2cbc4911eb964af48e38f91fc1', '3', '2021-05-08 19:55:25', '1', '2021-05-24 12:31:42');
INSERT INTO `work` VALUES ('58411446ad7411ebabc1f48e38f91fc1', '1', '0', '0', '这是给项目经理的任务', '928d27b1ad7411ebabc1f48e38f91fc1', '3', '2021-05-05 15:34:21', '0', '2021-05-05 15:35:43');
INSERT INTO `work` VALUES ('584f645eaff411eb964af48e38f91fc1', '701decfa0496446e926e55d4675e78e1', '3', '1', '1112', NULL, '2', '2021-05-08 19:55:38', '1', '2021-05-08 20:04:44');
INSERT INTO `work` VALUES ('73dbe36bad7c11ebabc1f48e38f91fc1', '1', '3', '1', '这是第二个任务，0指0', NULL, '1', '2021-05-05 16:32:20', NULL, NULL);
INSERT INTO `work` VALUES ('822af517ad7611ebabc1f48e38f91fc1', '1', '3', '0', '这是给项目经理的任务', '0c3ab304ad7711ebabc1f48e38f91fc1', '3', '2021-05-05 15:49:39', '0', '2021-05-05 15:53:26');
INSERT INTO `work` VALUES ('90a3a60fad6511ebabc1f48e38f91fc1', '1', '3', '0', '111', NULL, '2', '2021-05-05 13:48:17', '0', '2021-05-05 13:48:20');
INSERT INTO `work` VALUES ('928d27b1ad7411ebabc1f48e38f91fc1', '1', '1', '0', '这是给项目经理的任务', '822af517ad7611ebabc1f48e38f91fc1', '3', '2021-05-05 15:35:49', '0', '2021-05-05 15:49:34');
INSERT INTO `work` VALUES ('adec0c45ad7611ebabc1f48e38f91fc1', '1', '3', '0', '001', '0c4db77ead7711ebabc1f48e38f91fc1', '3', '2021-05-05 15:50:48', '0', '2021-05-05 15:53:26');
INSERT INTO `work` VALUES ('b256ebbcad7611ebabc1f48e38f91fc1', '1', '3', '0', '002', '0c5cfb25ad7711ebabc1f48e38f91fc1', '3', '2021-05-05 15:50:55', '0', '2021-05-05 15:53:26');
INSERT INTO `work` VALUES ('bb6cc545ad7c11ebabc1f48e38f91fc1', 'dd2349332d0d40f5901bd6f8f882f3eb', '1', '1', '啊啊啊啊啊', '1e08343bbc4911eb964af48e38f91fc1', '3', '2021-05-05 16:34:07', '1', '2021-05-24 12:31:33');
INSERT INTO `work` VALUES ('dd4fbb9caf1311eb964af48e38f91fc1', '701decfa0496446e926e55d4675e78e1', '1', '1', 'GGG0.2的任务', 'ff5d8a1eaff211eb964af48e38f91fc1', '3', '2021-05-07 17:09:01', '1', '2021-05-08 19:46:00');
INSERT INTO `work` VALUES ('e5fd9dd7aff511eb964af48e38f91fc1', '701decfa0496446e926e55d4675e78e1', '3', '1', '55', NULL, '0', '2021-05-08 20:06:45', '1', '2021-05-08 20:08:08');
INSERT INTO `work` VALUES ('f8b1c00fad6411ebabc1f48e38f91fc1', '1', '1', '0', '这是给项目经理的任务', '58411446ad7411ebabc1f48e38f91fc1', '3', '2021-05-05 13:44:02', '0', '2021-05-05 15:34:05');
INSERT INTO `work` VALUES ('ff5d8a1eaff211eb964af48e38f91fc1', '701decfa0496446e926e55d4675e78e1', '3', '1', 'GGG0.2的任务', '5039f772aff411eb964af48e38f91fc1', '3', '2021-05-08 19:46:00', '1', '2021-05-08 19:55:25');

SET FOREIGN_KEY_CHECKS = 1;
