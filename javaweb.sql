/*
 Navicat Premium Data Transfer

 Source Server         : homework
 Source Server Type    : MySQL
 Source Server Version : 80025
 Source Host           : localhost:3306
 Source Schema         : javaweb

 Target Server Type    : MySQL
 Target Server Version : 80025
 File Encoding         : 65001

 Date: 17/12/2022 14:21:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for institution
-- ----------------------------
DROP TABLE IF EXISTS `institution`;
CREATE TABLE `institution`  (
  `wid` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `manager` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `tel` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `addr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`wid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of institution
-- ----------------------------
INSERT INTO `institution` VALUES (1, '北京林业大学', '张d', '18053326998', '1542764068@qq.com', '北京市海淀区', '12345678911');
INSERT INTO `institution` VALUES (2, '清华大学', '鹏飞', '19953326998', '1542764096@qq.com', '北京市海淀区', '985大学');
INSERT INTO `institution` VALUES (6, '北京大学', '陈成成', '12345678911', '1542764068@qq.com', 'dsadad', '985大学');
INSERT INTO `institution` VALUES (7, '中国人民大学', '田昊', '12345678911', '1542764068@qq.com', 'dsadad', '985大学');
INSERT INTO `institution` VALUES (9, '北京外国语大学', '李华', '18053326998', '1542764068@qq.com', '北京海淀', '重点大学');
INSERT INTO `institution` VALUES (10, '中国地质大学', '王五', '18053326998', '1542764068@qq.com', '北京海淀', '重点大学');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `rid` int(0) NOT NULL,
  `rolename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createtime` datetime(0) NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `notes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`rid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '系统管理员', NULL, NULL, NULL);
INSERT INTO `role` VALUES (2, '工作人员', NULL, NULL, NULL);
INSERT INTO `role` VALUES (3, '游客', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sample
-- ----------------------------
DROP TABLE IF EXISTS `sample`;
CREATE TABLE `sample`  (
  `sid` int(0) NOT NULL AUTO_INCREMENT,
  `belong` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `samplename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `findplace` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `findtime` datetime(0) NULL DEFAULT NULL,
  `material` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ofyear` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `person` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `logtime` datetime(0) NULL DEFAULT NULL,
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `open` int(0) NULL DEFAULT NULL,
  `borrow_state` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`sid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 123 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sample
-- ----------------------------
INSERT INTO `sample` VALUES (1, '北京大学', '秦兵马俑', '陕西西安', '1961-01-01 21:09:14', '陶土', '10世纪', '张三', '秦兵马俑就是以俑代人殉葬的典型，也是以俑代人殉葬的顶峰。秦俑之所以在规模、写实程度上达到如此的高度，除了工匠的智慧之外，还与历史上第一个封建皇帝秦始皇的意志分不开。', '2022-12-17 21:11:11', '/images/sample_images/de30a95a-f431-4eab-8aeb-7b5812ef3887.png', 1, 1);
INSERT INTO `sample` VALUES (2, '北京大学', '唐三彩', '北京', '1959-03-01 21:14:20', '彩陶', 'sdad', '李四', '唐三彩（Tang Tri-Color Glazed Ceramics [1]  ），中国古代陶瓷烧制工艺的珍品，全名唐代三彩釉陶器，是盛行于唐代的一种低温釉陶器，釉彩有黄、绿、白、褐、蓝、黑等色彩，而以黄、绿、白三色为主，所以人们习惯称之为“唐三彩”。因唐三彩最早、最多出土于洛阳，亦有“洛阳唐三彩”之称。', '2022-12-03 21:16:04', '/images/sample_images/5c15ce47-32d9-4cd6-8199-91ed8c725a27.png', 1, 1);
INSERT INTO `sample` VALUES (3, '北京大学', '青花瓷', '河北景德镇', '1964-01-01 21:17:05', '黏土', '14世纪', '王五', '青花瓷（blue and white porcelain），又称白地青花瓷，常简称青花，是中国瓷器的主流品种之一，属釉下彩瓷。', '2022-12-13 21:18:14', NULL, 1, 1);
INSERT INTO `sample` VALUES (5, '北京大学', '马踏飞燕', '山东', '2022-11-03 00:00:00', '青铜', '西周时期', '王业齐', '机读卡老师教的拉卡德', '2022-11-29 00:00:00', '/images/sample_images/9e0771e8-1276-457b-9d9f-11d739f302f3.jpg', 1, 1);
INSERT INTO `sample` VALUES (6, '北京大学', '上方宝剑', '山东', '2022-12-05 22:56:00', '青铜', '西周时期', '王业齐', NULL, '2022-12-02 22:56:00', '/images/sample_images/c172e61d-1654-42ae-90d4-c64b7682b104.png', 1, 1);
INSERT INTO `sample` VALUES (8, '北京林业大学', '灵魂摆渡', '西安', '2022-12-07 17:14:22', '青铜', '西周时期', '王业齐', '撒大大大是的撒的擦擦', '2022-12-07 17:14:33', '/images/sample_images/eb29c46b-f299-44db-bef8-41b8ac1bc88a.png', 1, 1);
INSERT INTO `sample` VALUES (9, '清华大学', '两弹一星', '罗布泊', '2022-11-28 21:58:41', '青铜', '西周时期', '王业齐', '非常珍贵', '2022-12-03 21:58:57', NULL, 0, 1);
INSERT INTO `sample` VALUES (10, '清华大学', '玄武石', '西藏', '2022-12-10 11:23:36', '石头', '西周时期', '王业齐', '非常珍贵，世界只有一个', '2022-12-10 11:24:02', '/images/sample_images/66315e19-05bd-4b93-a8f5-40031a4e34ef.png', 1, 1);
INSERT INTO `sample` VALUES (69, '北京林业大学', '八爪烧', '湖南', '1976-05-15 23:00:00', '香料', '21世纪', '张三', NULL, '2021-03-17 00:00:00', NULL, 1, 0);
INSERT INTO `sample` VALUES (70, '北京林业大学', '银杏叶', '北京', '2022-12-15 00:06:20', '树叶', '21世纪', '王业齐', NULL, '2022-12-15 00:06:38', NULL, 1, 0);
INSERT INTO `sample` VALUES (71, '北京林业大学', '北京胡同', '湖南', '1976-05-15 23:00:00', '北京石头', '23世纪', '张三', NULL, '2021-03-19 00:00:00', NULL, 1, 0);
INSERT INTO `sample` VALUES (72, '中国人民大学', '素纱单衣', '宁夏', '1977-05-16 23:00:00', '丝绸', '24世纪', '李四', NULL, '2021-03-20 00:00:00', NULL, 1, 1);
INSERT INTO `sample` VALUES (73, '中国人民大学', '越王勾践剑', '湖北', '1978-05-17 23:00:00', '北京石头', '25世纪', '李四', NULL, '2021-03-21 00:00:00', NULL, 1, 1);
INSERT INTO `sample` VALUES (74, '中国人民大学', '青铜面具', '湖北', '1979-05-18 23:00:00', '青铜', '26世纪', '李四', NULL, '2021-03-22 00:00:00', NULL, 1, 1);
INSERT INTO `sample` VALUES (75, '北京外国语大学', '四羊方尊', '湖北', '1979-05-19 23:00:00', '青铜', '27世纪', '李四', NULL, '2021-03-23 00:00:00', NULL, 1, 1);
INSERT INTO `sample` VALUES (76, '北京外国语大学', '古汉语词典北京', NULL, '1978-05-20 23:00:00', '纸', '28世纪', '李四', NULL, '2021-03-24 00:00:00', NULL, 1, 1);
INSERT INTO `sample` VALUES (79, '清华大学', '绿宝石头003', '湖南', '1976-05-15 23:00:00', '石头', '21世纪', '张三', 'null', '2021-03-17 00:00:00', '/images/sample_images/e2ac20e7-82b7-4990-9322-0d666b3a7ad9.jpg', 1, 0);
INSERT INTO `sample` VALUES (80, '清华大学', '紫宝石头004', '北京', '1976-05-15 23:00:00', '石头', '22世纪', '张三', 'null', '2021-03-18 00:00:00', '/images/sample_images/da89630b-4abc-47b0-bcb9-4867b13bb924.jpg', 1, 0);
INSERT INTO `sample` VALUES (81, '清华大学', '青铜面具005', '湖南', '1976-05-15 23:00:00', '青铜', '23世纪', '张三', 'null', '2021-03-19 00:00:00', '/images/sample_images/69e24651-96a4-4aee-aaa9-c83e82627e52.jpg', 1, 0);
INSERT INTO `sample` VALUES (82, '清华大学', '青铜面具006', '宁夏', '1977-05-16 23:00:00', '青铜', '24世纪', '李四', 'null', '2021-03-20 00:00:00', '/images/sample_images/d6146c85-96b7-4cac-b68a-0a12cac4d441.png', 1, 1);
INSERT INTO `sample` VALUES (83, '清华大学', '青铜面具007', '湖北', '1978-05-17 23:00:00', '青铜', '25世纪', '李四', 'null', '2021-03-21 00:00:00', '/images/sample_images/56313b5b-7d49-480b-be6a-79225121f2f0.png', 1, 1);
INSERT INTO `sample` VALUES (112, '清华大学', '陶瓷001', '山东', '2022-12-17 08:54:04', '陶瓷', '1999', '王业齐', '的撒多', '2022-12-17 08:54:19', NULL, 0, 1);
INSERT INTO `sample` VALUES (114, '清华大学', '金属001', '湖南', '1976-05-15 23:00:00', '金属', '20世纪', '张三', NULL, '2021-03-15 00:00:00', NULL, 1, 1);
INSERT INTO `sample` VALUES (115, '清华大学', '金属002', '四川', '1975-05-15 23:00:00', '金属', '20世纪', '张三', NULL, '2021-03-16 00:00:00', NULL, 1, 1);
INSERT INTO `sample` VALUES (116, '清华大学', '金属003', '湖南', '1976-05-15 23:00:00', '金属', '21世纪', '张三', NULL, '2021-03-17 00:00:00', NULL, 1, 1);
INSERT INTO `sample` VALUES (117, '清华大学', '金属004', '北京', '1976-05-15 23:00:00', '金属', '22世纪', '张三', NULL, '2021-03-18 00:00:00', NULL, 1, 1);
INSERT INTO `sample` VALUES (118, '清华大学', '金属005', '湖南', '1976-05-15 23:00:00', '金属', '23世纪', '张三', NULL, '2021-03-19 00:00:00', NULL, 1, 1);
INSERT INTO `sample` VALUES (119, '清华大学', '金属006', '宁夏', '1977-05-16 23:00:00', '金属', '24世纪', '李四', NULL, '2021-03-20 00:00:00', NULL, 1, 1);
INSERT INTO `sample` VALUES (120, '清华大学', '金属007', '湖北', '1978-05-17 23:00:00', '金属', '25世纪', '李四', NULL, '2021-03-21 00:00:00', NULL, 1, 1);
INSERT INTO `sample` VALUES (121, '清华大学', '金属008', '湖北', '1979-05-18 23:00:00', '金属', '26世纪', '李四', NULL, '2021-03-22 00:00:00', NULL, 1, 1);

-- ----------------------------
-- Table structure for sample_borrow
-- ----------------------------
DROP TABLE IF EXISTS `sample_borrow`;
CREATE TABLE `sample_borrow`  (
  `bid` int(0) NOT NULL AUTO_INCREMENT,
  `sid` int(0) NULL DEFAULT NULL,
  `belong` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `wid` int(0) NULL DEFAULT NULL,
  `borrow_time` datetime(0) NULL DEFAULT NULL,
  `back_time` datetime(0) NULL DEFAULT NULL,
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `person` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `tel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `plus` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `check_state` int(0) NULL DEFAULT NULL,
  `borrow_workplace` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`bid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sample_borrow
-- ----------------------------
INSERT INTO `sample_borrow` VALUES (36, 69, '北京林业大学', 0, '2022-12-17 10:01:17', '2022-12-17 10:02:22', '这是一个理由', '王业齐', '18053326995', 'JIE', 4, '清华大学');
INSERT INTO `sample_borrow` VALUES (37, 69, '北京林业大学', 0, NULL, NULL, '123', '王业齐', '18053326995', 'DSAD', 1, '清华大学');
INSERT INTO `sample_borrow` VALUES (38, 82, '清华大学', 0, '2022-12-17 11:24:22', '2022-12-17 11:26:17', '爱咋咋地', '王业齐', '18053326998', '的撒', 4, '北京林业大学');
INSERT INTO `sample_borrow` VALUES (39, 116, '清华大学', 0, '2022-12-17 11:25:16', '2022-12-17 13:55:38', '在', '王业齐', '18053326998', '阿打算', 4, '北京林业大学');
INSERT INTO `sample_borrow` VALUES (40, 8, '北京林业大学', 0, '2022-12-17 11:27:54', '2022-12-17 11:28:29', '这是一个理由', '李珑轩', '18053326995', 'sadasd', 4, '清华大学');
INSERT INTO `sample_borrow` VALUES (41, 71, '北京林业大学', 0, '2022-12-17 11:29:22', NULL, '这是一个理由', '王业齐', '18053326995', 'dasd', 2, '清华大学');
INSERT INTO `sample_borrow` VALUES (42, 69, '北京林业大学', 0, '2022-12-17 11:30:11', NULL, '这是一个理由', '王业齐', '18053326995', 'eqeqe', 3, '清华大学');
INSERT INTO `sample_borrow` VALUES (43, 114, '清华大学', 0, '2022-12-17 11:32:00', '2022-12-17 13:55:39', '爱咋咋地', '王业齐', '18053326998', '大声道', 4, '北京林业大学');
INSERT INTO `sample_borrow` VALUES (44, 119, '清华大学', 0, NULL, NULL, '爱咋咋地', '王业齐', '18053326998', '的撒多', 1, '北京林业大学');
INSERT INTO `sample_borrow` VALUES (45, 2, '北京大学', 0, NULL, NULL, '这是一个理由', '王业齐', '18053326995', 'fdsf', 1, '清华大学');
INSERT INTO `sample_borrow` VALUES (46, 114, '清华大学', 0, '2021-12-17 13:49:38', '2021-12-27 13:49:46', NULL, NULL, NULL, NULL, 4, '北京林业大学');
INSERT INTO `sample_borrow` VALUES (47, 114, '清华大学', 0, '2020-12-17 13:49:38', '2020-12-17 13:49:38', '这是一个理由', '王业齐', NULL, NULL, 4, '北京林业大学');
INSERT INTO `sample_borrow` VALUES (48, 114, '清华大学', 0, '2019-01-01 13:51:50', '2019-01-01 13:51:50', NULL, NULL, NULL, NULL, 4, '北京林业大学');
INSERT INTO `sample_borrow` VALUES (49, 114, '清华大学', 0, '2019-02-01 13:53:08', '2019-01-01 00:00:00', NULL, NULL, NULL, NULL, 4, '北京林业大学');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uid` int(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `workplace` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '/images/user_images/default.png',
  `realname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `register_state` int(0) NULL DEFAULT NULL,
  `tel` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `addr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `user_state` int(0) NULL DEFAULT NULL,
  `createtime` datetime(0) NULL DEFAULT NULL,
  `last_logintime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 172 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (110, 'admin', '123', 'bjfu', '/images/user_images/08c009a9-25fa-4f4f-bd9e-eb15dee1ba6a.jpg', '王业齐', '女', 1, '18053326995', '1542764068@qq.com', '北京海淀', 0, '2022-12-01 07:00:31', '2022-12-17 02:16:49');
INSERT INTO `user` VALUES (144, 'wyq', '123', '北京林业大学', '/images/user_images/default.png', '王业齐', '男', 1, '17123456781', '1542764068@qq.com', 'haidian', 1, '2022-12-03 09:08:40', '2022-12-15 12:06:59');
INSERT INTO `user` VALUES (154, '1234567', '123', '清华大学', '/images/user_images/661bcc5b-d764-4ced-bc3c-717fe2088e5e.jpg', '王业齐', '女', 1, '13345678911', '1542764068@qq.com', '北京海淀', 1, '2022-12-06 12:39:39', '2022-12-17 01:58:59');
INSERT INTO `user` VALUES (159, '190902103', '2103', '北京林业大学', NULL, '王五', '女', 1, '18053326998', '1542764068@qq.com', '北京海淀', 0, '2022-12-14 11:53:47', NULL);
INSERT INTO `user` VALUES (160, '111', '1234', NULL, '/images/user_images/8e935509-c7be-42ab-a199-b1edf9cac65b.png', '王业齐', '女', 1, '18053326998', '1542764068@qq.com', '北京海淀', 0, '2022-12-15 15:10:09', '2022-12-17 02:14:28');
INSERT INTO `user` VALUES (170, '190902101', '123', '北京林业大学', NULL, '王业齐', '男', 1, '18053326995', '1542764068@qq.com', '', 0, '2022-12-17 09:46:08', NULL);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `uid` int(0) NOT NULL,
  `rid` int(0) NOT NULL,
  PRIMARY KEY (`rid`, `uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (110, 1);
INSERT INTO `user_role` VALUES (144, 2);
INSERT INTO `user_role` VALUES (154, 2);
INSERT INTO `user_role` VALUES (159, 2);
INSERT INTO `user_role` VALUES (170, 2);
INSERT INTO `user_role` VALUES (160, 3);

SET FOREIGN_KEY_CHECKS = 1;
