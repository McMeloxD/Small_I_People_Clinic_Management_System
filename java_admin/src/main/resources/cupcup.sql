/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50619
 Source Host           : localhost:3306
 Source Schema         : cupcup

 Target Server Type    : MySQL
 Target Server Version : 50619
 File Encoding         : 65001

 Date: 31/07/2024 20:28:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for additional_charge
-- ----------------------------
DROP TABLE IF EXISTS `additional_charge`;
CREATE TABLE `additional_charge`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '附加费序号',
  `addition_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '附加类型',
  `addition_num` int(11) NOT NULL COMMENT '数量',
  `addition_price` double(10, 2) NOT NULL COMMENT '价格',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of additional_charge
-- ----------------------------
INSERT INTO `additional_charge` VALUES (1, '注射费', 1, 3.00);
INSERT INTO `additional_charge` VALUES (2, '材料费', 1, 4.00);
INSERT INTO `additional_charge` VALUES (3, '处理费', 1, 6.00);
INSERT INTO `additional_charge` VALUES (4, '诊疗费', 1, 8.00);

-- ----------------------------
-- Table structure for appointments
-- ----------------------------
DROP TABLE IF EXISTS `appointments`;
CREATE TABLE `appointments`  (
  `appointment_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NULL DEFAULT NULL,
  `appointment_date` date NULL DEFAULT NULL,
  `doctor_name` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`appointment_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of appointments
-- ----------------------------
INSERT INTO `appointments` VALUES (4, 4, '2024-08-01', '李伟');
INSERT INTO `appointments` VALUES (5, 5, '2024-07-31', 'Dr. Zhou');
INSERT INTO `appointments` VALUES (6, 6, '2024-08-02', 'Dr. Wu');
INSERT INTO `appointments` VALUES (7, 7, '2024-08-03', 'Dr. Sun77777');
INSERT INTO `appointments` VALUES (8, 8, '2024-08-04', 'Dr. Zhu');
INSERT INTO `appointments` VALUES (9, 9, '2024-08-05', 'Dr. Chen');
INSERT INTO `appointments` VALUES (10, 10, '2024-08-06', 'Dr. Huang');
INSERT INTO `appointments` VALUES (11, 11, '2024-08-07', 'Dr. Liu');
INSERT INTO `appointments` VALUES (12, 12, '2024-08-08', 'Dr. Liang');
INSERT INTO `appointments` VALUES (13, 13, '2024-08-09', 'Dr. Xu');
INSERT INTO `appointments` VALUES (14, 14, '2024-08-10', 'Dr. Shao');
INSERT INTO `appointments` VALUES (15, 15, '2024-08-11', 'Dr. Ma');
INSERT INTO `appointments` VALUES (16, 16, '2024-08-12', 'Dr. Lin');
INSERT INTO `appointments` VALUES (17, 17, '2024-08-13', 'Dr. Pan');
INSERT INTO `appointments` VALUES (18, 18, '2024-08-14', 'Dr. Guo');
INSERT INTO `appointments` VALUES (19, 19, '2024-08-15', 'Dr. Cai');
INSERT INTO `appointments` VALUES (20, 20, '2024-08-16', 'Dr. Duan');

-- ----------------------------
-- Table structure for charge_administration
-- ----------------------------
DROP TABLE IF EXISTS `charge_administration`;
CREATE TABLE `charge_administration`  (
  `buill_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `order_number` int(11) NULL DEFAULT NULL COMMENT '订单编号',
  `order_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '订单类型',
  `patient_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '患者姓名',
  `patient_sex` int(11) NULL DEFAULT NULL COMMENT '患者性别(1男,2女)',
  `patient_age` int(11) NULL DEFAULT NULL COMMENT '患者年龄',
  `patient_contact` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '患者联系方式',
  `department` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '科室',
  `doctor_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '接诊医生',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `amount_receivable` double(10, 2) NULL DEFAULT NULL COMMENT '应收金额',
  `receive_amount` double(10, 2) NULL DEFAULT NULL COMMENT '实收金额',
  `payment_method` int(11) NULL DEFAULT NULL COMMENT '支付方式（1现金，2支付宝，3微信）',
  `charging_state` int(11) NULL DEFAULT NULL COMMENT '收费状态（1未收费，2.已收费，3已退费）',
  `return_fee` double(10, 2) NULL DEFAULT NULL COMMENT '退费金额',
  PRIMARY KEY (`buill_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 69 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of charge_administration
-- ----------------------------
INSERT INTO `charge_administration` VALUES (1, 201926, '挂号', '老李666', 1, 18, '17754138769', '全科', '王冕', '2024-07-21 18:37:02', 100.00, 95.00, 2, 3, 15.00);
INSERT INTO `charge_administration` VALUES (2, 201927, '处方开立', '老姬', 2, 18, '17754138773', '全科', '王冕', '2024-07-08 18:41:38', 99999.00, 959.00, 3, 3, 15.00);
INSERT INTO `charge_administration` VALUES (3, 201928, '药品零售', '老张', 1, 18, '17754138773', '全科', '王冕', '2024-07-12 18:42:41', 100.00, 95.00, 3, 3, 15.00);
INSERT INTO `charge_administration` VALUES (7, 201929, '处方开立', '张三', 2, 35, '13912345678', '内科', '李医生', '2024-07-24 10:00:00', 1501.00, 15.00, 3, 3, 78.00);
INSERT INTO `charge_administration` VALUES (8, 201930, '药品零售', '李四', 1, 28, '13698765432', '影像科', '王医生', '2024-07-24 11:30:00', 280.00, 280.50, 2, 1, 12.00);
INSERT INTO `charge_administration` VALUES (13, 201935, '处方开立', '刘先生', 1, 21, '18987654321', '老年科', '吴医生', '2024-07-26 10:30:00', 180.00, 180.00, 1, 3, 45.00);
INSERT INTO `charge_administration` VALUES (15, 201937, '处方开立', '刘大哥', 1, 55, '13245678901', '外科', '朱医生', '2024-07-27 11:00:00', 1200.00, 1200.00, 3, 3, 43.00);
INSERT INTO `charge_administration` VALUES (20, 201942, '药品零售', '赵大爷', 1, 70, '18012345678', '老年科', '吴医生', '2024-07-29 10:15:00', 150.00, 150.00, 2, 3, 41.00);
INSERT INTO `charge_administration` VALUES (21, 201943, '挂号', '刘小姐', 2, 33, '13312345678', '检验科', '钱医生', '2024-07-29 14:30:00', 380.50, 380.50, 3, 3, 16.00);
INSERT INTO `charge_administration` VALUES (25, 201947, '挂号', '王先生', 1, 39, '13765432109', '影像科', '王医生', '2024-07-31 12:00:00', 260.00, 260.00, 2, 3, 44.00);
INSERT INTO `charge_administration` VALUES (42, 201948, '药品零售', '崔样', 1, 15, '15369856321', '全科', '李四', '2024-07-25 19:44:25', 156.00, 126.00, 1, 1, 0.00);
INSERT INTO `charge_administration` VALUES (46, 201950, '药品零售', '老姬3', 1, 15, '123', '全科', '让他', '2024-07-25 20:14:04', 1.00, 12.00, 1, 1, 0.00);
INSERT INTO `charge_administration` VALUES (47, 201951, '药品零售', '老姬3', 1, 15, '123', '全科', '让他', '2024-07-25 20:14:24', 1.00, 12.00, 1, 1, 0.00);
INSERT INTO `charge_administration` VALUES (48, 201952, '药品零售', '老姬3', 2, 15, '123', '全科', '让他', '2024-07-25 20:16:41', 1.00, 12.00, 1, 1, 0.00);
INSERT INTO `charge_administration` VALUES (49, 10001, '挂号', '张三', 1, 35, '13800000001', '内科', '王大夫', '2024-07-24 10:00:00', 200.00, 200.00, 2, 3, 0.00);
INSERT INTO `charge_administration` VALUES (50, 10002, '挂号', '李四', 2, 28, '13800000002', '眼科', '刘大夫', '2024-07-24 11:00:00', 150.00, 150.00, 3, 3, 0.00);
INSERT INTO `charge_administration` VALUES (51, 10003, '处方开立', '王五', 1, 45, '13800000003', '外科', '赵大夫', '2024-07-24 12:00:00', 1200.00, 1200.00, 1, 3, 0.00);
INSERT INTO `charge_administration` VALUES (52, 10004, '药品零售', '陈六', 2, 30, '13800000004', '内科', '孙大夫', '2024-07-24 13:00:00', 180.00, 180.00, 3, 3, 0.00);
INSERT INTO `charge_administration` VALUES (53, 10005, '挂号', '周七', 1, 50, '13800000005', '骨科', '吴大夫', '2024-07-24 14:00:00', 250.00, 250.00, 1, 2, 0.00);
INSERT INTO `charge_administration` VALUES (54, 10006, '药品零售', '郑八', 1, 60, '13800000006', '心内科', '钱大夫', '2024-07-24 15:00:00', 1500.00, 1500.00, 1, 2, NULL);
INSERT INTO `charge_administration` VALUES (55, 10007, '药品零售', '王九', 2, 32, '13800000007', '皮肤科', '孙大夫', '2024-07-24 16:00:00', 120.00, 120.00, 3, 2, NULL);
INSERT INTO `charge_administration` VALUES (56, 10008, '挂号', '陈十', 1, 40, '13800000008', '耳鼻喉科', '周大夫', '2024-07-24 17:00:00', 180.00, 180.00, 2, 2, NULL);
INSERT INTO `charge_administration` VALUES (57, 10009, '处方开立', '林十一', 2, 55, '13800000009', '妇科', '吴大夫', '2024-07-24 18:00:00', 1000.00, 1000.00, 3, 2, NULL);
INSERT INTO `charge_administration` VALUES (58, 10010, '挂号', '赵十二', 1, 42, '13800000010', '儿科', '郑大夫', '2024-07-24 19:00:00', 80.00, 80.00, 2, 2, NULL);
INSERT INTO `charge_administration` VALUES (59, 10011, '药品零售', '郭十三', 2, 29, '13800000011', '口腔科', '王大夫', '2024-07-24 20:00:00', 200.00, 200.00, 3, 2, NULL);
INSERT INTO `charge_administration` VALUES (60, 10012, '处方开立', '孙十四', 1, 58, '13800000012', '神经科', '刘大夫', '2024-07-24 21:00:00', 1300.00, 1300.00, 1, 2, NULL);
INSERT INTO `charge_administration` VALUES (61, 10013, '药品零售', '黄十五', 2, 38, '13800000013', '眼科', '赵大夫', '2024-07-24 22:00:00', 150.00, 150.00, 2, 2, NULL);
INSERT INTO `charge_administration` VALUES (62, 10014, '挂号', '陈十六', 1, 44, '13800000014', '骨科', '孙大夫', '2024-07-24 23:00:00', 250.00, 250.00, 3, 2, NULL);
INSERT INTO `charge_administration` VALUES (63, 10015, '药品零售', '周十七', 2, 52, '13800000015', '内分泌科', '吴大夫', '2024-07-25 00:00:00', 1400.00, 1400.00, 2, 2, NULL);
INSERT INTO `charge_administration` VALUES (64, 10016, '挂号', '吴十八', 1, 36, '13800000016', '皮肤科', '钱大夫', '2024-07-25 01:00:00', 120.00, 120.00, 3, 2, NULL);
INSERT INTO `charge_administration` VALUES (65, 10017, '处方开立', '郑十九', 2, 30, '13800000017', '眼科', '孙大夫', '2024-07-25 02:00:00', 150.00, 150.00, 2, 2, NULL);
INSERT INTO `charge_administration` VALUES (66, 10018, '药品零售', '王二十', 1, 55, '13800000018', '外科', '周大夫', '2024-07-25 03:00:00', 1200.00, 1200.00, 1, 2, NULL);
INSERT INTO `charge_administration` VALUES (67, 10019, '挂号', '李二十一', 2, 40, '13800000019', '内科', '吴大夫', '2024-07-25 04:00:00', 180.00, 180.00, 3, 2, NULL);
INSERT INTO `charge_administration` VALUES (68, 10020, '挂号', '张二十二', 1, 45, '13800000020', '骨科', '郑大夫', '2024-07-25 05:00:00', 250.00, 250.00, 2, 2, NULL);

-- ----------------------------
-- Table structure for departments
-- ----------------------------
DROP TABLE IF EXISTS `departments`;
CREATE TABLE `departments`  (
  `departments_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `departments_id_card` int(20) NULL DEFAULT NULL COMMENT '科室编号',
  `departments_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室名称',
  `departments_text` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室简介',
  `departments_create_time` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `departments_create_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人员',
  `departments_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室状态',
  PRIMARY KEY (`departments_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of departments
-- ----------------------------
INSERT INTO `departments` VALUES (2, 1022, '内科', '专注于内部疾病的诊断和治疗。', '2024-07-26 10:05:00', '管理员2', '启用');
INSERT INTO `departments` VALUES (3, 103, '外科', '专注于外部疾病和手术的治疗。', '2024-07-26 10:10:00', '管理员1', '启用');
INSERT INTO `departments` VALUES (4, 104, '全科', '提供全面的医疗服务。', '2024-07-26 10:15:00', '管理员3', '启用');
INSERT INTO `departments` VALUES (5, 105, '内科', '专注于内部疾病的诊断和治疗。', '2024-07-26 10:20:00', '管理员2', '启用');
INSERT INTO `departments` VALUES (6, 106, '外科', '专注于外部疾病和手术的治疗。', '2024-07-26 10:25:00', '管理员1', '启用');
INSERT INTO `departments` VALUES (7, 107, '全科', '提供全面的医疗服务。', '2024-07-26 10:30:00', '管理员3', '启用');
INSERT INTO `departments` VALUES (8, 108, '内科', '专注于内部疾病的诊断和治疗。', '2024-07-26 10:35:00', '管理员2', '启用');
INSERT INTO `departments` VALUES (9, 109, '外科', '专注于外部疾病和手术的治疗。', '2024-07-26 10:40:00', '管理员1', '启用');
INSERT INTO `departments` VALUES (10, 110, '全科', '提供全面的医疗服务。', '2024-07-26 10:45:00', '管理员3', '启用');
INSERT INTO `departments` VALUES (11, 111, '内科', '专注于内部疾病的诊断和治疗。', '2024-07-26 10:50:00', '管理员2', '启用');
INSERT INTO `departments` VALUES (12, 112, '外科', '专注于外部疾病和手术的治疗。', '2024-07-26 10:55:00', '管理员1', '启用');
INSERT INTO `departments` VALUES (13, 113, '全科', '提供全面的医疗服务。', '2024-07-26 11:00:00', '管理员3', '启用');
INSERT INTO `departments` VALUES (14, 114, '内科', '专注于内部疾病的诊断和治疗。', '2024-07-26 11:05:00', '管理员2', '启用');
INSERT INTO `departments` VALUES (15, 115, '外科', '专注于外部疾病和手术的治疗。', '2024-07-26 11:10:00', '管理员1', '启用');
INSERT INTO `departments` VALUES (16, 116, '全科', '提供全面的医疗服务。', '2024-07-26 11:15:00', '管理员3', '启用');
INSERT INTO `departments` VALUES (17, 117, '内科', '专注于内部疾病的诊断和治疗。', '2024-07-26 11:20:00', '管理员2', '启用');
INSERT INTO `departments` VALUES (18, 118, '外科', '专注于外部疾病和手术的治疗。', '2024-07-26 11:25:00', '管理员1', '启用');
INSERT INTO `departments` VALUES (19, 119, '全科', '提供全面的医疗服务。', '2024-07-26 11:30:00', '管理员3', '启用');
INSERT INTO `departments` VALUES (20, 120, '内科', '专注于内部疾病的诊断和治疗。', '2024-07-26 11:35:00', '管理员2', '启用');
INSERT INTO `departments` VALUES (21, 121, '外科', '专注于外部疾病和手术的治疗。', '2024-07-26 11:40:00', '管理员1', '启用');
INSERT INTO `departments` VALUES (22, 122, '全科', '提供全面的医疗服务。', '2024-07-26 11:45:00', '管理员3', '启用');
INSERT INTO `departments` VALUES (23, 123, '内科', '专注于内部疾病的诊断和治疗。', '2024-07-26 11:50:00', '管理员2', '启用');
INSERT INTO `departments` VALUES (24, 124, '外科', '专注于外部疾病和手术的治疗。', '2024-07-26 11:55:00', '管理员1', '启用');
INSERT INTO `departments` VALUES (25, 125, '全科', '提供全面的医疗服务。', '2024-07-26 12:00:00', '管理员3', '启用');
INSERT INTO `departments` VALUES (26, 126, '内科', '专注于内部疾病的诊断和治疗。', '2024-07-26 12:05:00', '管理员2', '启用');
INSERT INTO `departments` VALUES (27, 127, '外科', '专注于外部疾病和手术的治疗。', '2024-07-26 12:10:00', '管理员1', '启用');
INSERT INTO `departments` VALUES (28, 128, '全科', '提供全面的医疗服务。', '2024-07-26 12:15:00', '管理员3', '启用');
INSERT INTO `departments` VALUES (29, 129, '内科', '专注于内部疾病的诊断和治疗。', '2024-07-26 12:20:00', '管理员2', '启用');
INSERT INTO `departments` VALUES (30, 130, '外科', '专注于外部疾病和手术的治疗。', '2024-07-26 12:25:00', '管理员1', '启用');
INSERT INTO `departments` VALUES (31, 131, '全科', '提供全面的医疗服务。', '2024-07-26 12:30:00', '管理员3', '启用');
INSERT INTO `departments` VALUES (32, 132, '内科', '专注于内部疾病的诊断和治疗。', '2024-07-26 12:35:00', '管理员2', '启用');
INSERT INTO `departments` VALUES (33, 133, '外科', '专注于外部疾病和手术的治疗。', '2024-07-26 12:40:00', '管理员1', '启用');
INSERT INTO `departments` VALUES (34, 134, '全科', '提供全面的医疗服务。', '2024-07-26 12:45:00', '管理员3', '启用');
INSERT INTO `departments` VALUES (35, 135, '内科', '专注于内部疾病的诊断和治疗。', '2024-07-26 12:50:00', '管理员2', '启用');
INSERT INTO `departments` VALUES (36, 136, '外科', '专注于外部疾病和手术的治疗。', '2024-07-26 12:55:00', '管理员1', '启用');
INSERT INTO `departments` VALUES (37, 137, '全科', '提供全面的医疗服务。', '2024-07-26 13:00:00', '管理员3', '启用');
INSERT INTO `departments` VALUES (38, 138, '内科', '专注于内部疾病的诊断和治疗。', '2024-07-26 13:05:00', '管理员2', '启用');
INSERT INTO `departments` VALUES (39, 139, '外科', '专注于外部疾病和手术的治疗。', '2024-07-26 13:10:00', '管理员1', '启用');
INSERT INTO `departments` VALUES (40, 140, '全科', '提供全面的医疗服务。', '2024-07-26 13:15:00', '管理员3', '启用');
INSERT INTO `departments` VALUES (41, 101, '外科', '文杰科室,值得信赖', '2024-07-01T16:01:00.000Z', '文杰主任', NULL);

-- ----------------------------
-- Table structure for details
-- ----------------------------
DROP TABLE IF EXISTS `details`;
CREATE TABLE `details`  (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `fee_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '收费名称',
  `unit_price` double(10, 2) NULL DEFAULT NULL COMMENT '单价',
  `num` int(20) NULL DEFAULT NULL COMMENT '数量',
  `unit` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '单位',
  `retail_amount` double(10, 2) NULL DEFAULT NULL COMMENT '零售金额',
  `discount` double(10, 2) NULL DEFAULT NULL COMMENT '折扣',
  `discount_amount` double(10, 2) NULL DEFAULT NULL COMMENT '折后金额',
  `patient_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '患者姓名',
  `patient_card` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '患者卡号',
  `patient_age` int(10) NULL DEFAULT NULL COMMENT '患者年龄',
  `dob` date NULL DEFAULT NULL COMMENT '患者出生日期',
  `patient_sex` int(11) NULL DEFAULT NULL COMMENT '患者性别(1男，2女)',
  `patient_contact` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '患者联系方式',
  `id_card_num` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '患者身份证号码',
  `specification` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '规格（例6g*11袋每盒）',
  `total_prices` double(10, 2) NULL DEFAULT NULL COMMENT '总价',
  `operator` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '操作员',
  `add_fee` double(10, 2) NULL DEFAULT NULL COMMENT '附加费用',
  `balance` double(10, 2) NULL DEFAULT NULL COMMENT '账户余额',
  `mark` double(50, 2) NULL DEFAULT NULL COMMENT '积分',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of details
-- ----------------------------

-- ----------------------------
-- Table structure for doctor
-- ----------------------------
DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor`  (
  `doctor_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '医生id',
  `doctor_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '医生姓名',
  `doctor_age` int(11) NOT NULL COMMENT '医生年龄',
  `departments` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '科室',
  `contact` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '联系方式',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '邮箱',
  `id_card_num` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '身份证号码',
  `position` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '职位（类似于护士长这种）',
  `doctor_address` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '地址',
  `role` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '角色（类似于医生、护士）',
  `job_number` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '员工工号（登录凭证）',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '密码',
  `state` int(11) NOT NULL COMMENT '员工状态（1上班，2未上班）',
  `doctor_sex` int(11) NULL DEFAULT NULL COMMENT '医生性别',
  PRIMARY KEY (`doctor_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of doctor
-- ----------------------------
INSERT INTO `doctor` VALUES (1, '文杰主任', 18, '全科', '911', '', '410325199901016666', NULL, NULL, '主任', '', '', 1, NULL);
INSERT INTO `doctor` VALUES (2, '阿朱姐姐', 21, '妇科', '555', NULL, '1', NULL, NULL, '主任助理', NULL, NULL, 1, NULL);
INSERT INTO `doctor` VALUES (3, '张医生', 18, '内科', '11', NULL, '1', NULL, NULL, '1', NULL, NULL, 1, NULL);
INSERT INTO `doctor` VALUES (4, '王医生', 1, '眼科', '1', NULL, '1', NULL, NULL, '1', NULL, NULL, 1, NULL);
INSERT INTO `doctor` VALUES (5, '李医生', 1, '儿科', '1', NULL, '1', NULL, NULL, '1', NULL, NULL, 1, NULL);
INSERT INTO `doctor` VALUES (6, '刘医生', 1, '外科', '1', NULL, '1', NULL, NULL, '1', NULL, NULL, 1, NULL);
INSERT INTO `doctor` VALUES (7, '陈医生', 1, '全科', '1', NULL, '1', NULL, NULL, '1', NULL, NULL, 1, NULL);

-- ----------------------------
-- Table structure for employees
-- ----------------------------
DROP TABLE IF EXISTS `employees`;
CREATE TABLE `employees`  (
  `employees_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `employees_id_card` int(20) NULL DEFAULT NULL COMMENT '工号ID',
  `employees_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '员工姓名',
  `employees_sex` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '员工性别(1,男2,女)',
  `employees_age` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '员工年龄',
  `employees_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电话号码',
  `employees_clinic` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '诊所',
  `departments_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室',
  `role_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色',
  `employees_create_time` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `employees_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人员',
  `employees_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '员工状态(为开关状态)',
  PRIMARY KEY (`employees_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of employees
-- ----------------------------
INSERT INTO `employees` VALUES (1, 100011, '张z11', '1', '30', '13812345678', '诊所A', '内科', '医生', '2024-07-25 10:00:00', '管理员A', '在职');
INSERT INTO `employees` VALUES (2, 10001, '张z1', '1', '30', '13812345678', '诊所A', '内科', '医生', '2024-07-25 10:00:00', '管理员A', '在职');
INSERT INTO `employees` VALUES (3, 10001, '张z', '1', '30', '13812345678', '诊所A', '内科', '医生', '2024-07-25 10:00:00', '管理员A', '在职');
INSERT INTO `employees` VALUES (4, 10001, '张z', '1', '30', '13812345678', '诊所A', '内科', '医生', '2024-07-25 10:00:00', '管理员A', '在职');
INSERT INTO `employees` VALUES (7, 10001, '张z1', '1', '30', '13812345678', '诊所A', '内科', '医生', '2024-07-25 10:00:00', '管理员A', '在职');
INSERT INTO `employees` VALUES (8, 10001, '张z', '1', '30', '13812345678', '诊所A', '内科', '医生', '2024-07-25 10:00:00', '管理员A', '在职');
INSERT INTO `employees` VALUES (9, 10001, '张z', '1', '30', '13812345678', '诊所A', '内科', '医生', '2024-07-25 10:00:00', '管理员A', '在职');
INSERT INTO `employees` VALUES (10, 10001, '张z', '1', '30', '13812345678', '诊所A', '内科', '医生', '2024-07-25 10:00:00', '管理员A', '在职');
INSERT INTO `employees` VALUES (11, 10001, '张z', '1', '30', '13812345678', '诊所A', '内科', '医生', '2024-07-25 10:00:00', '管理员A', '在职');
INSERT INTO `employees` VALUES (12, 10001, '张z', '1', '30', '13812345678', '诊所A', '内科', '医生', '2024-07-25 10:00:00', '管理员A', '在职');
INSERT INTO `employees` VALUES (13, 10001, '张z', '1', '30', '13812345678', '诊所A', '内科', '医生', '2024-07-25 10:00:00', '管理员A', '在职');
INSERT INTO `employees` VALUES (14, 10001, '张z', '1', '30', '13812345678', '诊所A', '内科', '医生', '2024-07-25 10:00:00', '管理员A', '在职');
INSERT INTO `employees` VALUES (15, 10001, '张z', '1', '30', '13812345678', '诊所A', '内科', '医生', '2024-07-25 10:00:00', '管理员A', '在职');
INSERT INTO `employees` VALUES (16, 10001, '张z', '1', '30', '13812345678', '诊所A', '内科', '医生', '2024-07-25 10:00:00', '管理员A', '在职');
INSERT INTO `employees` VALUES (17, 10001, '张z', '1', '30', '13812345678', '诊所A', '内科', '医生', '2024-07-25 10:00:00', '管理员A', '在职');
INSERT INTO `employees` VALUES (18, 10001, '张z', '1', '30', '13812345678', '诊所A', '内科', '医生', '2024-07-25 10:00:00', '管理员A', '在职');
INSERT INTO `employees` VALUES (19, 10001, '张z', '1', '30', '13812345678', '诊所A', '内科', '医生', '2024-07-25 10:00:00', '管理员A', '在职');
INSERT INTO `employees` VALUES (20, 10001, '张z', '1', '30', '13812345678', '诊所A', '内科', '医生', '2024-07-25 10:00:00', '管理员A', '在职');
INSERT INTO `employees` VALUES (21, 10001, '张z1', '1', '30', '13812345678', '诊所A', '内科', '医生', '2024-07-25 10:00:00', '管理员A', NULL);
INSERT INTO `employees` VALUES (22, 11, '11', '2', '11', '11', '11', '11', '1', '2024-07-23 00:00:00', '11', NULL);
INSERT INTO `employees` VALUES (23, 1111111, '11', '2', '111', '111', '11', '11', '11', '2024-07-24 00:00:00', '11', NULL);
INSERT INTO `employees` VALUES (24, 1111, '刘胜明', '1', '15', '11', '11', '精神科', '病人', '2024-07-16 00:00:00', '刘兵', NULL);

-- ----------------------------
-- Table structure for inventory_count
-- ----------------------------
DROP TABLE IF EXISTS `inventory_count`;
CREATE TABLE `inventory_count`  (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `inventory_numbers` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '盘点单号',
  `inventory_date` datetime(0) NOT NULL COMMENT '盘点日期',
  `make_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '制单人',
  `inventory_state` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '盘点状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of inventory_count
-- ----------------------------

-- ----------------------------
-- Table structure for inventory_management
-- ----------------------------
DROP TABLE IF EXISTS `inventory_management`;
CREATE TABLE `inventory_management`  (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `drug_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '药品编码',
  `location_number` int(50) NOT NULL COMMENT '货位号',
  `drug_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '药品名字',
  `category` int(11) NOT NULL COMMENT '处方类别（1中药，2西药）',
  `specifications` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '规格',
  `medicine_type` int(11) NOT NULL COMMENT '药品剂型（1注射类，2口服类，3外用类）',
  `manufactor` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '厂家',
  `inventory` int(20) NOT NULL COMMENT '库存',
  `purchase_amount` double(10, 2) NOT NULL COMMENT '采购金额',
  `retail_amount` double(10, 2) NOT NULL COMMENT '零售金额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of inventory_management
-- ----------------------------

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operateUser` varchar(600) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作人',
  `operateName` varchar(600) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行的操作',
  `className` varchar(600) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作的类名',
  `methodName` varchar(600) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作的方法',
  `operateTime` datetime(0) NULL DEFAULT NULL COMMENT '操作的时间',
  `result` varchar(600) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作的结果',
  `costTime` int(11) NULL DEFAULT NULL COMMENT '操作耗时',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 274 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES (23, 'pw', '退出', 'com.example.controller.SysUserController.SysUserController', 'logout', '2024-07-26 12:41:49', '\"成功\"', 0);
INSERT INTO `log` VALUES (24, 'pw', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-26 12:53:51', '\"成功\"', 42);
INSERT INTO `log` VALUES (25, 'pw', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-26 12:54:14', '\"成功\"', 23);
INSERT INTO `log` VALUES (26, 'pw', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-26 12:57:23', '\"成功\"', 22);
INSERT INTO `log` VALUES (27, 'pw', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-26 12:57:28', '\"成功\"', 20);
INSERT INTO `log` VALUES (28, 'pw', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-26 12:57:30', '\"成功\"', 19);
INSERT INTO `log` VALUES (29, 'pw', '收费', 'com.example.controller.MercuryController.TemporaryDrugController', 'clearDrug', '2024-07-26 12:58:08', '\"成功\"', 44);
INSERT INTO `log` VALUES (30, 'pw', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-26 12:58:22', '\"成功\"', 20);
INSERT INTO `log` VALUES (31, 'pw', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-26 12:58:30', '\"成功\"', 19);
INSERT INTO `log` VALUES (32, 'pw', '收费', 'com.example.controller.MercuryController.TemporaryDrugController', 'clearDrug', '2024-07-26 13:00:08', '\"成功\"', 63);
INSERT INTO `log` VALUES (33, 'pw', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-26 13:01:31', '\"成功\"', 26);
INSERT INTO `log` VALUES (34, 'pw', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-26 13:01:45', '\"成功\"', 26);
INSERT INTO `log` VALUES (35, 'pw', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-26 13:01:56', '\"成功\"', 24);
INSERT INTO `log` VALUES (36, 'pw', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-26 13:02:40', '\"成功\"', 20);
INSERT INTO `log` VALUES (37, 'pw', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-26 13:02:43', '\"成功\"', 19);
INSERT INTO `log` VALUES (38, 'pw', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-26 13:03:02', '\"成功\"', 20);
INSERT INTO `log` VALUES (39, 'pw', '查全部收费管理', 'com.example.controller.CXKController.chargeController', 'findAll', '2024-07-26 13:03:04', '\"成功\"', 46);
INSERT INTO `log` VALUES (40, 'pw', '查全部收费管理', 'com.example.controller.CXKController.chargeController', 'findAll', '2024-07-26 13:03:09', '\"成功\"', 40);
INSERT INTO `log` VALUES (41, 'pw', '查全部收费管理', 'com.example.controller.CXKController.chargeController', 'findAll', '2024-07-26 13:03:11', '\"成功\"', 38);
INSERT INTO `log` VALUES (42, 'pw', '查全部收费管理', 'com.example.controller.CXKController.chargeController', 'findAll', '2024-07-26 13:03:13', '\"成功\"', 47);
INSERT INTO `log` VALUES (43, 'pw', '查全部收费管理', 'com.example.controller.CXKController.chargeController', 'findAll', '2024-07-26 13:03:14', '\"成功\"', 38);
INSERT INTO `log` VALUES (44, 'pw', '查全部收费管理', 'com.example.controller.CXKController.chargeController', 'findAll', '2024-07-26 13:03:19', '\"成功\"', 37);
INSERT INTO `log` VALUES (45, 'pw', '查全部收费管理', 'com.example.controller.CXKController.chargeController', 'findAll', '2024-07-26 13:03:25', '\"成功\"', 38);
INSERT INTO `log` VALUES (46, 'pw', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-26 13:03:28', '\"成功\"', 20);
INSERT INTO `log` VALUES (47, 'pw', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-26 13:03:32', '\"成功\"', 19);
INSERT INTO `log` VALUES (48, 'pw', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-26 13:03:36', '\"成功\"', 19);
INSERT INTO `log` VALUES (49, 'pw', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-26 13:03:41', '\"成功\"', 18);
INSERT INTO `log` VALUES (50, 'pw', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-26 13:03:47', '\"成功\"', 20);
INSERT INTO `log` VALUES (51, 'pw', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-26 13:03:53', '\"成功\"', 20);
INSERT INTO `log` VALUES (52, 'pw', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-26 13:04:08', '\"成功\"', 21);
INSERT INTO `log` VALUES (53, 'pw', '收费', 'com.example.controller.MercuryController.TemporaryDrugController', 'clearDrug', '2024-07-26 13:05:03', '\"成功\"', 42);
INSERT INTO `log` VALUES (54, 'pw', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-26 13:20:18', '\"成功\"', 39);
INSERT INTO `log` VALUES (55, 'wj', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-26 13:39:49', '\"成功\"', 67);
INSERT INTO `log` VALUES (56, 'pw', '查全部收费管理', 'com.example.controller.CXKController.chargeController', 'findAll', '2024-07-26 13:51:28', '\"成功\"', 289);
INSERT INTO `log` VALUES (57, 'pw', '查全部收费管理', 'com.example.controller.CXKController.chargeController', 'findAll', '2024-07-26 13:51:30', '\"成功\"', 276);
INSERT INTO `log` VALUES (58, 'pw', '查全部收费管理', 'com.example.controller.CXKController.chargeController', 'findAll', '2024-07-26 13:51:31', '\"成功\"', 803);
INSERT INTO `log` VALUES (59, 'pw', '查全部收费管理', 'com.example.controller.CXKController.chargeController', 'findAll', '2024-07-26 13:51:41', '\"成功\"', 277);
INSERT INTO `log` VALUES (60, 'pw', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-26 13:51:43', '\"成功\"', 131);
INSERT INTO `log` VALUES (61, 'pw', '查全部收费管理', 'com.example.controller.CXKController.chargeController', 'findAll', '2024-07-26 13:56:49', '\"成功\"', 43);
INSERT INTO `log` VALUES (62, 'pw', '查全部收费管理', 'com.example.controller.CXKController.chargeController', 'findAll', '2024-07-26 13:56:50', '\"成功\"', 42);
INSERT INTO `log` VALUES (63, 'pw', '查全部收费管理', 'com.example.controller.CXKController.chargeController', 'findAll', '2024-07-26 13:56:50', '\"成功\"', 42);
INSERT INTO `log` VALUES (64, 'pw', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-26 14:01:46', '\"成功\"', 28);
INSERT INTO `log` VALUES (65, 'pw', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-26 15:05:43', '\"成功\"', 22);
INSERT INTO `log` VALUES (66, 'pw', '收费', 'com.example.controller.MercuryController.TemporaryDrugController', 'clearDrug', '2024-07-26 15:06:06', '\"成功\"', 55);
INSERT INTO `log` VALUES (67, 'pw', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-26 15:06:16', '\"成功\"', 21);
INSERT INTO `log` VALUES (68, 'pw', '收费', 'com.example.controller.MercuryController.TemporaryDrugController', 'clearDrug', '2024-07-26 15:06:33', '\"成功\"', 43);
INSERT INTO `log` VALUES (69, 'wj', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-26 15:43:46', '\"成功\"', 131);
INSERT INTO `log` VALUES (70, 'wj', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-26 15:43:52', '\"成功\"', 91);
INSERT INTO `log` VALUES (71, 'wj', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-26 15:56:17', '\"成功\"', 104);
INSERT INTO `log` VALUES (72, 'wj', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-26 15:58:00', '\"成功\"', 109);
INSERT INTO `log` VALUES (73, 'wj', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-26 15:58:47', '\"成功\"', 84);
INSERT INTO `log` VALUES (74, 'wj', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-26 16:06:51', '\"成功\"', 166);
INSERT INTO `log` VALUES (75, 'wj', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-26 16:07:40', '\"成功\"', 42);
INSERT INTO `log` VALUES (76, 'wj', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-26 16:25:31', '\"成功\"', 154);
INSERT INTO `log` VALUES (77, 'wj', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-26 16:26:30', '\"成功\"', 74);
INSERT INTO `log` VALUES (78, 'pw', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-26 16:29:37', '\"成功\"', 29);
INSERT INTO `log` VALUES (79, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:29:44', '\"成功\"', 64);
INSERT INTO `log` VALUES (80, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:29:44', '\"成功\"', 109);
INSERT INTO `log` VALUES (81, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:29:44', '\"成功\"', 152);
INSERT INTO `log` VALUES (82, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:29:44', '\"成功\"', 195);
INSERT INTO `log` VALUES (83, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:29:44', '\"成功\"', 238);
INSERT INTO `log` VALUES (84, 'pw', '开药患者记录', 'com.example.controller.MercuryController.TemporaryInfoController', 'addTemPatient', '2024-07-26 16:29:49', '\"成功\"', 47);
INSERT INTO `log` VALUES (85, 'pw', '收费操作', 'com.example.controller.MercuryController.TemporaryDrugController', 'clearDrug', '2024-07-26 16:30:48', '\"成功\"', 65);
INSERT INTO `log` VALUES (86, 'wj', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-26 16:34:05', '\"成功\"', 246);
INSERT INTO `log` VALUES (87, 'pw', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-26 16:35:54', '\"成功\"', 58);
INSERT INTO `log` VALUES (88, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:35:58', '\"成功\"', 45);
INSERT INTO `log` VALUES (89, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:35:59', '\"成功\"', 68);
INSERT INTO `log` VALUES (90, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:35:59', '\"成功\"', 72);
INSERT INTO `log` VALUES (91, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:35:59', '\"成功\"', 71);
INSERT INTO `log` VALUES (92, 'pw', '开药患者记录', 'com.example.controller.MercuryController.TemporaryInfoController', 'addTemPatient', '2024-07-26 16:36:03', '\"成功\"', 41);
INSERT INTO `log` VALUES (93, 'pw', '收费操作', 'com.example.controller.MercuryController.TemporaryDrugController', 'clearDrug', '2024-07-26 16:36:20', '\"成功\"', 45);
INSERT INTO `log` VALUES (94, 'pw', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-26 16:37:11', '\"成功\"', 23);
INSERT INTO `log` VALUES (95, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:37:19', '\"成功\"', 42);
INSERT INTO `log` VALUES (96, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:37:19', '\"成功\"', 45);
INSERT INTO `log` VALUES (97, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:37:19', '\"成功\"', 60);
INSERT INTO `log` VALUES (98, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:37:19', '\"成功\"', 65);
INSERT INTO `log` VALUES (99, 'pw', '开药患者记录', 'com.example.controller.MercuryController.TemporaryInfoController', 'addTemPatient', '2024-07-26 16:37:26', '\"成功\"', 144);
INSERT INTO `log` VALUES (100, 'pw', '收费操作', 'com.example.controller.MercuryController.TemporaryDrugController', 'clearDrug', '2024-07-26 16:37:37', '\"成功\"', 45);
INSERT INTO `log` VALUES (101, 'pw', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-26 16:38:01', '\"成功\"', 21);
INSERT INTO `log` VALUES (102, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:38:22', '\"成功\"', 46);
INSERT INTO `log` VALUES (103, 'pw', '开药患者记录', 'com.example.controller.MercuryController.TemporaryInfoController', 'addTemPatient', '2024-07-26 16:38:27', '\"成功\"', 41);
INSERT INTO `log` VALUES (104, 'pw', '收费操作', 'com.example.controller.MercuryController.TemporaryDrugController', 'clearDrug', '2024-07-26 16:38:37', '\"成功\"', 45);
INSERT INTO `log` VALUES (105, 'wj', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-26 16:38:41', '\"成功\"', 105);
INSERT INTO `log` VALUES (106, 'pw', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-26 16:39:28', '\"成功\"', 21);
INSERT INTO `log` VALUES (107, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:39:39', '\"成功\"', 60);
INSERT INTO `log` VALUES (108, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:39:39', '\"成功\"', 60);
INSERT INTO `log` VALUES (109, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:39:39', '\"成功\"', 64);
INSERT INTO `log` VALUES (110, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:39:39', '\"成功\"', 65);
INSERT INTO `log` VALUES (111, 'pw', '开药患者记录', 'com.example.controller.MercuryController.TemporaryInfoController', 'addTemPatient', '2024-07-26 16:39:46', '\"成功\"', 46);
INSERT INTO `log` VALUES (112, 'pw', '收费操作', 'com.example.controller.MercuryController.TemporaryDrugController', 'clearDrug', '2024-07-26 16:39:58', '\"成功\"', 41);
INSERT INTO `log` VALUES (113, 'pw', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-26 16:40:17', '\"成功\"', 21);
INSERT INTO `log` VALUES (114, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:41:03', '\"成功\"', 41);
INSERT INTO `log` VALUES (115, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:41:03', '\"成功\"', 60);
INSERT INTO `log` VALUES (116, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:41:03', '\"成功\"', 65);
INSERT INTO `log` VALUES (117, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:41:03', '\"成功\"', 61);
INSERT INTO `log` VALUES (118, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:41:03', '\"成功\"', 65);
INSERT INTO `log` VALUES (119, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:41:03', '\"成功\"', 83);
INSERT INTO `log` VALUES (120, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:41:03', '\"成功\"', 44);
INSERT INTO `log` VALUES (121, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:41:03', '\"成功\"', 46);
INSERT INTO `log` VALUES (122, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:41:03', '\"成功\"', 46);
INSERT INTO `log` VALUES (123, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:41:03', '\"成功\"', 48);
INSERT INTO `log` VALUES (124, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:41:03', '\"成功\"', 47);
INSERT INTO `log` VALUES (125, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:41:03', '\"成功\"', 45);
INSERT INTO `log` VALUES (126, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:41:04', '\"成功\"', 43);
INSERT INTO `log` VALUES (127, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:41:04', '\"成功\"', 44);
INSERT INTO `log` VALUES (128, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:41:04', '\"成功\"', 50);
INSERT INTO `log` VALUES (129, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:41:04', '\"成功\"', 50);
INSERT INTO `log` VALUES (130, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:41:04', '\"成功\"', 40);
INSERT INTO `log` VALUES (131, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:41:04', '\"成功\"', 42);
INSERT INTO `log` VALUES (132, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:41:04', '\"成功\"', 43);
INSERT INTO `log` VALUES (133, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:41:04', '\"成功\"', 45);
INSERT INTO `log` VALUES (134, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:41:04', '\"成功\"', 42);
INSERT INTO `log` VALUES (135, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:41:04', '\"成功\"', 45);
INSERT INTO `log` VALUES (136, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:41:04', '\"成功\"', 43);
INSERT INTO `log` VALUES (137, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:41:04', '\"成功\"', 41);
INSERT INTO `log` VALUES (138, 'pw', '开药患者记录', 'com.example.controller.MercuryController.TemporaryInfoController', 'addTemPatient', '2024-07-26 16:41:13', '\"成功\"', 43);
INSERT INTO `log` VALUES (139, 'pw', '收费操作', 'com.example.controller.MercuryController.TemporaryDrugController', 'clearDrug', '2024-07-26 16:41:29', '\"成功\"', 47);
INSERT INTO `log` VALUES (140, 'pw', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-26 16:42:00', '\"成功\"', 22);
INSERT INTO `log` VALUES (141, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:42:09', '\"成功\"', 44);
INSERT INTO `log` VALUES (142, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:42:09', '\"成功\"', 49);
INSERT INTO `log` VALUES (143, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:42:09', '\"成功\"', 49);
INSERT INTO `log` VALUES (144, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:42:09', '\"成功\"', 57);
INSERT INTO `log` VALUES (145, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:42:09', '\"成功\"', 59);
INSERT INTO `log` VALUES (146, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:42:09', '\"成功\"', 61);
INSERT INTO `log` VALUES (147, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:42:10', '\"成功\"', 44);
INSERT INTO `log` VALUES (148, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:42:10', '\"成功\"', 44);
INSERT INTO `log` VALUES (149, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:42:10', '\"成功\"', 45);
INSERT INTO `log` VALUES (150, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:42:10', '\"成功\"', 45);
INSERT INTO `log` VALUES (151, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:42:10', '\"成功\"', 41);
INSERT INTO `log` VALUES (152, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:42:10', '\"成功\"', 40);
INSERT INTO `log` VALUES (153, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:42:10', '\"成功\"', 45);
INSERT INTO `log` VALUES (154, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:42:10', '\"成功\"', 46);
INSERT INTO `log` VALUES (155, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:42:10', '\"成功\"', 46);
INSERT INTO `log` VALUES (156, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:42:10', '\"成功\"', 46);
INSERT INTO `log` VALUES (157, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:42:10', '\"成功\"', 47);
INSERT INTO `log` VALUES (158, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:42:10', '\"成功\"', 46);
INSERT INTO `log` VALUES (159, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:42:10', '\"成功\"', 48);
INSERT INTO `log` VALUES (160, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:42:10', '\"成功\"', 41);
INSERT INTO `log` VALUES (161, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:42:10', '\"成功\"', 43);
INSERT INTO `log` VALUES (162, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:42:10', '\"成功\"', 43);
INSERT INTO `log` VALUES (163, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:42:10', '\"成功\"', 43);
INSERT INTO `log` VALUES (164, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:42:10', '\"成功\"', 45);
INSERT INTO `log` VALUES (165, 'pw', '开药患者记录', 'com.example.controller.MercuryController.TemporaryInfoController', 'addTemPatient', '2024-07-26 16:42:18', '\"成功\"', 42);
INSERT INTO `log` VALUES (166, 'pw', '收费操作', 'com.example.controller.MercuryController.TemporaryDrugController', 'clearDrug', '2024-07-26 16:42:27', '\"成功\"', 42);
INSERT INTO `log` VALUES (167, 'wj', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-26 16:44:10', '\"成功\"', 121);
INSERT INTO `log` VALUES (168, 'wj', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-26 16:44:17', '\"成功\"', 278);
INSERT INTO `log` VALUES (169, 'pw', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-26 16:46:04', '\"成功\"', 40);
INSERT INTO `log` VALUES (170, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:46:11', '\"成功\"', 63);
INSERT INTO `log` VALUES (171, 'pw', '开药患者记录', 'com.example.controller.MercuryController.TemporaryInfoController', 'addTemPatient', '2024-07-26 16:46:18', '\"成功\"', 52);
INSERT INTO `log` VALUES (172, 'pw', '收费操作', 'com.example.controller.MercuryController.TemporaryDrugController', 'clearDrug', '2024-07-26 16:46:27', '\"成功\"', 60);
INSERT INTO `log` VALUES (173, 'pw', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-26 16:46:31', '\"成功\"', 19);
INSERT INTO `log` VALUES (174, 'wj', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-26 16:46:34', '\"成功\"', 167);
INSERT INTO `log` VALUES (175, 'wj', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-26 16:47:56', '\"成功\"', 231);
INSERT INTO `log` VALUES (176, 'wj', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-26 16:48:15', '\"成功\"', 54);
INSERT INTO `log` VALUES (177, 'pw', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-26 16:50:11', '\"成功\"', 38);
INSERT INTO `log` VALUES (178, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:50:19', '\"成功\"', 42);
INSERT INTO `log` VALUES (179, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:50:20', '\"成功\"', 65);
INSERT INTO `log` VALUES (180, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 16:50:20', '\"成功\"', 69);
INSERT INTO `log` VALUES (181, 'pw', '开药患者记录', 'com.example.controller.MercuryController.TemporaryInfoController', 'addTemPatient', '2024-07-26 16:50:24', '\"成功\"', 44);
INSERT INTO `log` VALUES (182, 'pw', '收费操作', 'com.example.controller.MercuryController.TemporaryDrugController', 'clearDrug', '2024-07-26 16:51:09', '\"成功\"', 45);
INSERT INTO `log` VALUES (183, 'pw', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-26 17:03:43', '\"成功\"', 41);
INSERT INTO `log` VALUES (184, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 17:03:48', '\"成功\"', 44);
INSERT INTO `log` VALUES (185, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 17:03:49', '\"成功\"', 61);
INSERT INTO `log` VALUES (186, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 17:03:49', '\"成功\"', 66);
INSERT INTO `log` VALUES (187, 'pw', '开药患者记录', 'com.example.controller.MercuryController.TemporaryInfoController', 'addTemPatient', '2024-07-26 17:04:06', '\"成功\"', 47);
INSERT INTO `log` VALUES (188, 'pw', '收费操作', 'com.example.controller.MercuryController.TemporaryDrugController', 'clearDrug', '2024-07-26 17:08:12', '\"成功\"', 51);
INSERT INTO `log` VALUES (189, 'pw', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-26 17:22:49', '\"成功\"', 22);
INSERT INTO `log` VALUES (190, 'pw', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-26 17:38:45', '\"成功\"', 37);
INSERT INTO `log` VALUES (191, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 17:38:59', '\"成功\"', 47);
INSERT INTO `log` VALUES (192, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 17:38:59', '\"成功\"', 58);
INSERT INTO `log` VALUES (193, 'pw', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-26 17:44:45', '\"成功\"', 23);
INSERT INTO `log` VALUES (194, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 17:44:53', '\"成功\"', 61);
INSERT INTO `log` VALUES (195, 'pw', '开药患者记录', 'com.example.controller.MercuryController.TemporaryInfoController', 'addTemPatient', '2024-07-26 17:45:00', '\"成功\"', 44);
INSERT INTO `log` VALUES (196, 'pw', '收费操作', 'com.example.controller.MercuryController.TemporaryDrugController', 'clearDrug', '2024-07-26 17:45:12', '\"成功\"', 42);
INSERT INTO `log` VALUES (197, 'pw', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-26 17:47:34', '\"成功\"', 19);
INSERT INTO `log` VALUES (198, 'pw', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-26 18:27:47', '\"成功\"', 20);
INSERT INTO `log` VALUES (199, 'lyx', '修改个人信息', 'com.example.controller.SysUserController.SysUserController', 'saveInfo', '2024-07-26 19:14:35', '\"成功\"', 45);
INSERT INTO `log` VALUES (200, 'lyx', '更改头像信息', 'com.example.controller.SysUserController.SysUserController', 'upload', '2024-07-26 19:23:50', '\"成功\"', 921);
INSERT INTO `log` VALUES (201, 'lyx', '修改个人信息', 'com.example.controller.SysUserController.SysUserController', 'saveInfo', '2024-07-26 19:23:52', '\"成功\"', 108);
INSERT INTO `log` VALUES (202, 'pw', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-26 19:27:03', '\"成功\"', 22);
INSERT INTO `log` VALUES (203, 'pw', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-26 19:27:06', '\"成功\"', 20);
INSERT INTO `log` VALUES (204, 'pw', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-26 19:27:22', '\"成功\"', 21);
INSERT INTO `log` VALUES (205, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 19:27:30', '\"成功\"', 77);
INSERT INTO `log` VALUES (206, 'pw', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-26 19:27:31', '\"成功\"', 22);
INSERT INTO `log` VALUES (207, 'pw', '选购药品', 'com.example.controller.MercuryController.TemporaryDrugController', 'addTemDrug', '2024-07-26 19:27:39', '\"成功\"', 42);
INSERT INTO `log` VALUES (208, 'pw', '开药患者记录', 'com.example.controller.MercuryController.TemporaryInfoController', 'addTemPatient', '2024-07-26 19:27:55', '\"成功\"', 116);
INSERT INTO `log` VALUES (209, 'pw', '收费操作', 'com.example.controller.MercuryController.TemporaryDrugController', 'clearDrug', '2024-07-26 19:28:02', '\"成功\"', 100);
INSERT INTO `log` VALUES (210, 'pw', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-26 19:28:07', '\"成功\"', 33);
INSERT INTO `log` VALUES (211, 'lyx', '修改个人信息', 'com.example.controller.SysUserController.SysUserController', 'saveInfo', '2024-07-26 19:38:36', '\"成功\"', 154);
INSERT INTO `log` VALUES (212, 'lyx', '修改个人信息', 'com.example.controller.SysUserController.SysUserController', 'saveInfo', '2024-07-26 19:38:47', '\"成功\"', 45);
INSERT INTO `log` VALUES (214, 'lyx', '更改头像信息', 'com.example.controller.SysUserController.SysUserController', 'upload', '2024-07-26 19:58:34', '\"成功\"', 272);
INSERT INTO `log` VALUES (215, 'lyx', '修改个人信息', 'com.example.controller.SysUserController.SysUserController', 'saveInfo', '2024-07-26 19:58:35', '\"成功\"', 47);
INSERT INTO `log` VALUES (216, 'lyx', '更改头像信息', 'com.example.controller.SysUserController.SysUserController', 'upload', '2024-07-26 20:03:47', '\"成功\"', 281);
INSERT INTO `log` VALUES (217, 'lyx', '修改个人信息', 'com.example.controller.SysUserController.SysUserController', 'saveInfo', '2024-07-26 20:03:48', '\"成功\"', 43);
INSERT INTO `log` VALUES (218, 'lyx', '修改个人信息', 'com.example.controller.SysUserController.SysUserController', 'saveInfo', '2024-07-26 20:04:04', '\"成功\"', 48);
INSERT INTO `log` VALUES (220, 'lyx', '修改个人信息', 'com.example.controller.SysUserController.SysUserController', 'saveInfo', '2024-07-26 20:06:02', '\"成功\"', 43);
INSERT INTO `log` VALUES (222, 'lyx', '修改个人信息', 'com.example.controller.SysUserController.SysUserController', 'saveInfo', '2024-07-26 20:07:18', '\"成功\"', 43);
INSERT INTO `log` VALUES (224, 'lyx', '修改个人信息', 'com.example.controller.SysUserController.SysUserController', 'saveInfo', '2024-07-26 20:08:48', '\"成功\"', 53);
INSERT INTO `log` VALUES (227, 'lyx', '更改头像信息', 'com.example.controller.SysUserController.SysUserController', 'upload', '2024-07-26 20:09:12', '\"成功\"', 224);
INSERT INTO `log` VALUES (228, 'lyx', '修改个人信息', 'com.example.controller.SysUserController.SysUserController', 'saveInfo', '2024-07-26 20:09:14', '\"成功\"', 43);
INSERT INTO `log` VALUES (231, 'lyx', '更改头像信息', 'com.example.controller.SysUserController.SysUserController', 'upload', '2024-07-26 20:30:10', '\"成功\"', 775);
INSERT INTO `log` VALUES (232, 'lyx', '修改个人信息', 'com.example.controller.SysUserController.SysUserController', 'saveInfo', '2024-07-26 20:30:11', '\"成功\"', 67);
INSERT INTO `log` VALUES (235, 'pw', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-26 20:35:19', '\"成功\"', 27);
INSERT INTO `log` VALUES (236, 'pw', '更改头像信息', 'com.example.controller.SysUserController.SysUserController', 'upload', '2024-07-26 20:40:52', '\"成功\"', 856);
INSERT INTO `log` VALUES (237, 'pw', '修改个人信息', 'com.example.controller.SysUserController.SysUserController', 'saveInfo', '2024-07-26 20:40:59', '\"成功\"', 53);
INSERT INTO `log` VALUES (238, 'xk', '更改头像信息', 'com.example.controller.SysUserController.SysUserController', 'upload', '2024-07-27 09:15:03', '\"成功\"', 1751);
INSERT INTO `log` VALUES (239, 'xk', '修改个人信息', 'com.example.controller.SysUserController.SysUserController', 'saveInfo', '2024-07-27 09:15:06', '\"成功\"', 290);
INSERT INTO `log` VALUES (240, 'xk', '修改就诊状态', 'com.example.controller.GuahaoController.GuahaoController', 'jiuZhen', '2024-07-27 09:19:36', '\"成功\"', 270);
INSERT INTO `log` VALUES (241, 'xk', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-27 09:32:20', '\"成功\"', 137);
INSERT INTO `log` VALUES (242, 'xk', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-27 09:32:27', '\"成功\"', 129);
INSERT INTO `log` VALUES (243, 'xk', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-27 09:32:30', '\"成功\"', 137);
INSERT INTO `log` VALUES (244, 'xk', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-27 09:32:45', '\"成功\"', 130);
INSERT INTO `log` VALUES (245, 'lb', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-27 09:46:13', '\"成功\"', 41);
INSERT INTO `log` VALUES (246, 'lyx', '更改头像信息', 'com.example.controller.SysUserController.SysUserController', 'upload', '2024-07-27 09:47:09', '\"成功\"', 1449);
INSERT INTO `log` VALUES (247, 'lyx', '修改个人信息', 'com.example.controller.SysUserController.SysUserController', 'saveInfo', '2024-07-27 09:47:11', '\"成功\"', 239);
INSERT INTO `log` VALUES (248, 'lyx', '更改头像信息', 'com.example.controller.SysUserController.SysUserController', 'upload', '2024-07-27 10:03:21', '\"成功\"', 266);
INSERT INTO `log` VALUES (249, 'lyx', '修改个人信息', 'com.example.controller.SysUserController.SysUserController', 'saveInfo', '2024-07-27 10:03:23', '\"成功\"', 44);
INSERT INTO `log` VALUES (250, 'lyx', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-27 11:25:17', '\"成功\"', 50);
INSERT INTO `log` VALUES (251, 'lyx', '查全部药品', 'com.example.controller.wwjController.DrugController', 'getList', '2024-07-27 11:29:51', '\"成功\"', 44);
INSERT INTO `log` VALUES (252, 'xk', '修改收费管理', 'com.example.controller.CXKController.chargeController', 'update', '2024-07-27 14:15:16', '\"成功\"', 49);
INSERT INTO `log` VALUES (253, 'xk', '修改收费管理', 'com.example.controller.CXKController.chargeController', 'update', '2024-07-27 14:15:20', '\"成功\"', 46);
INSERT INTO `log` VALUES (254, 'xk', '修改收费管理', 'com.example.controller.CXKController.chargeController', 'update', '2024-07-27 14:15:29', '\"成功\"', 48);
INSERT INTO `log` VALUES (255, 'lyx', '退出登录', 'com.example.controller.SysUserController.SysUserController', 'logout', '2024-07-27 14:21:50', '\"成功\"', 0);
INSERT INTO `log` VALUES (258, 'lyx', '删除挂号信息', 'com.example.controller.GuahaoController.GuahaoController', 'delByCoding', '2024-07-27 14:49:10', '\"成功\"', 45);
INSERT INTO `log` VALUES (259, 'lyx', '修改个人信息', 'com.example.controller.SysUserController.SysUserController', 'saveInfo', '2024-07-27 14:56:16', '\"成功\"', 47);
INSERT INTO `log` VALUES (260, 'lyx', '更改头像信息', 'com.example.controller.SysUserController.SysUserController', 'upload', '2024-07-27 14:56:22', '\"成功\"', 972);
INSERT INTO `log` VALUES (261, 'lyx', '修改个人信息', 'com.example.controller.SysUserController.SysUserController', 'saveInfo', '2024-07-27 14:56:24', '\"成功\"', 41);
INSERT INTO `log` VALUES (262, 'xk', '修改收费管理', 'com.example.controller.CXKController.chargeController', 'update', '2024-07-27 15:47:30', '\"成功\"', 44);
INSERT INTO `log` VALUES (263, 'lyx', '退出登录', 'com.example.controller.SysUserController.SysUserController', 'logout', '2024-07-27 16:42:56', '\"成功\"', 0);
INSERT INTO `log` VALUES (264, 'lyx', '退出登录', 'com.example.controller.SysUserController.SysUserController', 'logout', '2024-07-27 17:26:39', '\"成功\"', 1);
INSERT INTO `log` VALUES (265, 'lyx', '修改密码', 'com.example.controller.SysUserController.SysUserController', 'editPwd', '2024-07-27 17:36:35', '\"您输入的旧密码出错~\"', 22);
INSERT INTO `log` VALUES (266, 'lyx', '修改密码', 'com.example.controller.SysUserController.SysUserController', 'editPwd', '2024-07-27 17:36:41', '\"您输入的旧密码出错~\"', 20);
INSERT INTO `log` VALUES (267, 'lyx', '修改密码', 'com.example.controller.SysUserController.SysUserController', 'editPwd', '2024-07-27 17:41:37', '\"修改成功,请重新登录~\"', 84);
INSERT INTO `log` VALUES (268, 'lyx', '退出登录', 'com.example.controller.SysUserController.SysUserController', 'logout', '2024-07-27 17:41:37', '\"成功\"', 0);
INSERT INTO `log` VALUES (269, 'xk', '修改个人信息', 'com.example.controller.SysUserController.SysUserController', 'saveInfo', '2024-07-27 19:09:40', '\"成功\"', 37);
INSERT INTO `log` VALUES (270, 'xk', '修改收费管理', 'com.example.controller.CXKController.chargeController', 'update', '2024-07-27 19:22:03', '\"成功\"', 45);
INSERT INTO `log` VALUES (271, 'xk', '修改收费管理', 'com.example.controller.CXKController.chargeController', 'update', '2024-07-27 19:29:57', '\"成功\"', 46);
INSERT INTO `log` VALUES (272, 'xk', '修改收费管理', 'com.example.controller.CXKController.chargeController', 'update', '2024-07-27 19:30:26', '\"成功\"', 41);
INSERT INTO `log` VALUES (273, 'xk', '修改收费管理', 'com.example.controller.CXKController.chargeController', 'update', '2024-07-27 19:30:31', '\"成功\"', 43);

-- ----------------------------
-- Table structure for medicine
-- ----------------------------
DROP TABLE IF EXISTS `medicine`;
CREATE TABLE `medicine`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `medicine_coding` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '药品编码',
  `medicine_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '药品名称',
  `specification` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '规格（例6g*11袋每盒）',
  `category` int(11) NULL DEFAULT NULL COMMENT '处方类别（1中药，2西药）',
  `purchase_price` double(10, 2) NULL DEFAULT NULL COMMENT '采购价',
  `sell_price` double(10, 2) NULL DEFAULT NULL COMMENT '售药价',
  `manufacturers` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '生产厂家',
  `medicine_state` int(11) NULL DEFAULT NULL COMMENT '药品状态(1启用,2停用)',
  `create_time` date NULL DEFAULT NULL COMMENT '创建时间',
  `medicine_type` int(11) NULL DEFAULT NULL COMMENT '药品剂型（1注射类，2口服类，3外用类）',
  `OTC_medicine` int(11) NULL DEFAULT NULL COMMENT '1是，2否',
  `approval_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '批准文号',
  `sell_num` int(11) NULL DEFAULT NULL COMMENT '出售数量',
  `repertory_num` int(11) NULL DEFAULT NULL COMMENT '库存数量',
  `number` int(11) NULL DEFAULT NULL COMMENT '调价次数',
  `buy_num` int(11) NULL DEFAULT NULL COMMENT '购买数量',
  `unit` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '单位',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of medicine
-- ----------------------------
INSERT INTO `medicine` VALUES (1, '10022222220001', '复方氯化钠注射液', '10ml*10支/盒', 2, 2.50, 4.00, '上海医药（集团）有限公司', 2, '2024-07-21', 0, 2, '123456', 10, 8, 1, 1, '盒');
INSERT INTO `medicine` VALUES (3, 'Y003', '布洛芬片', '0.2g*100片/瓶', 2, 7.50, 15.00, '某制药公司', 1, '2023-01-03', 2, 1, '国药准字H34020874', 60, 300, 1, 1, '瓶');
INSERT INTO `medicine` VALUES (4, 'Y004', '银翘解毒丸', '6g*10丸/盒', 1, 4.00, 8.00, '某中药厂', 1, '2023-01-04', 2, 1, '国药准字Z11020934', 50, 250, 1, 1, '盒');
INSERT INTO `medicine` VALUES (5, 'Y005', '氯化钠注射液', '500ml/瓶', 2, 1.50, 3.00, '某制药公司', 1, '2023-01-05', 1, 2, '国药准字H14021011', 202, 998, 1, 1, '瓶');
INSERT INTO `medicine` VALUES (6, 'Y006', '藿香正气水', '10ml*10支/盒', 1, 2.50, 5.00, '某中药厂', 1, '2023-01-06', 2, 1, '国药准字Z45021125', 70, 350, 1, 1, '盒');
INSERT INTO `medicine` VALUES (7, 'Y007', '头孢克肟片', '0.1g*10片/盒', 2, 8.00, 16.00, '某制药公司', 1, '2023-01-07', 2, 2, '国药准字H34021155', 90, 448, 1, 1, '盒');
INSERT INTO `medicine` VALUES (8, 'Y008', '龙胆泻肝丸', '6g*12丸/盒', 1, 5.50, 11.00, '某中药厂', 1, '2023-01-08', 2, 1, '国药准字Z11021232', 65, 323, 1, 1, '盒');
INSERT INTO `medicine` VALUES (9, 'Y009', '甲硝唑片', '0.2g*20片/盒', 2, 2.00, 4.00, '某制药公司', 1, '2023-01-09', 2, 2, '国药准字H14021288', 120, 598, 1, 1, '盒');
INSERT INTO `medicine` VALUES (10, 'Y010', '清开灵胶囊', '0.3g*24粒/盒', 1, 6.00, 12.00, '某中药厂', 1, '2023-01-10', 2, 1, '国药准字Z45021344', 85, 425, 1, 1, '盒');
INSERT INTO `medicine` VALUES (11, 'Y011', '诺氟沙星胶囊', '0.1g*20粒/盒', 2, 4.00, 8.00, '某制药公司', 1, '2023-01-11', 2, 2, '国药准字H14021390', 75, 375, 1, 1, '盒');
INSERT INTO `medicine` VALUES (12, 'Y012', '小柴胡颗粒', '10g*10袋/盒', 1, 3.50, 7.00, '某中药厂', 1, '2023-01-12', 2, 1, '国药准字Z11021455', 110, 550, 1, 1, '盒');
INSERT INTO `medicine` VALUES (13, 'Y013', '洛索洛芬钠片', '0.06g*20片/盒', 2, 9.00, 18.00, '某制药公司', 1, '2023-01-13', 2, 2, '国药准字H34021567', 95, 475, 1, 1, '盒');
INSERT INTO `medicine` VALUES (14, 'Y014', '六味地黄丸', '9g*10丸/盒', 1, 5.00, 10.00, '某中药厂', 1, '2023-01-14', 2, 1, '国药准字Z45021645', 130, 650, 1, 1, '盒');
INSERT INTO `medicine` VALUES (15, 'Y015', '维生素C片', '0.1g*100片/瓶', 2, 1.00, 2.00, '某制药公司', 1, '2023-01-15', 2, 1, '国药准字H14021699', 141, 699, 1, 1, '瓶');
INSERT INTO `medicine` VALUES (16, 'Y016', '金银花颗粒', '10g*12袋/盒', 1, 3.00, 6.00, '某中药厂', 1, '2023-01-16', 2, 1, '国药准字Z11021723', 60, 300, 1, 1, '盒');
INSERT INTO `medicine` VALUES (17, 'Y017', '阿司匹林片', '0.1g*30片/盒', 2, 2.50, 5.00, '某制药公司', 1, '2023-01-17', 2, 2, '国药准字H14021867', 100, 500, 1, 1, '盒');
INSERT INTO `medicine` VALUES (18, 'Y018', '感冒清热颗粒', '10g*9袋/盒', 1, 3.20, 6.40, '某中药厂', 1, '2023-01-18', 2, 1, '国药准字Z45021900', 70, 350, 1, 1, '盒');
INSERT INTO `medicine` VALUES (19, 'Y019', '氧氟沙星滴眼液', '5ml*1瓶/盒', 2, 6.00, 12.00, '某制药公司', 1, '2023-01-19', 3, 2, '国药准字H14022001', 50, 250, 1, 1, '盒');
INSERT INTO `medicine` VALUES (20, 'Y020', '黄连上清丸', '9g*12丸/盒', 1, 4.50, 9.00, '某中药厂', 1, '2023-01-20', 2, 1, '国药准字Z11022123', 90, 450, 1, 1, '盒');
INSERT INTO `medicine` VALUES (21, 'Y021', '头孢呋辛酯片', '0.25g*10片/盒', 2, 8.50, 17.00, '某制药公司', 1, '2023-01-21', 2, 2, '国药准字H34022245', 85, 425, 1, 1, '盒');
INSERT INTO `medicine` VALUES (22, 'Y022', '健胃消食片', '0.5g*24片/盒', 1, 2.50, 5.00, '某中药厂', 1, '2023-01-22', 2, 1, '国药准字Z45022367', 65, 325, 1, 1, '盒');
INSERT INTO `medicine` VALUES (23, 'Y023', '盐酸曲美他嗪片', '0.02g*30片/盒', 2, 10.00, 20.00, '某制药公司', 1, '2023-01-23', 2, 2, '国药准字H14022456', 40, 200, 1, 1, '盒');
INSERT INTO `medicine` VALUES (24, 'Y001', '阿莫西林胶囊', '0.5g*20粒/盒', 2, 5.00, 10.00, '某制药公司', 1, '2023-01-01', 2, 1, '国药准字H11020755', 100, 500, 1, 1, '盒');
INSERT INTO `medicine` VALUES (25, 'Y002', '复方感冒灵颗粒', '10g*12袋/盒', 1, 3.00, 6.00, '某中药厂', 1, '2023-01-02', 2, 1, '国药准字Z45020759', 80, 400, 1, 1, '盒');
INSERT INTO `medicine` VALUES (33, NULL, NULL, NULL, NULL, 0.00, 0.00, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `medicine` VALUES (35, '123', '', '', 0, 0.00, 0.00, '', 0, '2024-07-17', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for outbound
-- ----------------------------
DROP TABLE IF EXISTS `outbound`;
CREATE TABLE `outbound`  (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `outbound_order` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '出库单号',
  `outbound_type` int(11) NOT NULL COMMENT '出库类型(1科室领药，2报损出库，3采购退货)',
  `make_name` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '制单人员',
  `procurement_amount` double(10, 2) NOT NULL COMMENT '采购金额',
  `procurement_retail` double(10, 2) NOT NULL COMMENT '零售金额',
  `Outbound_name` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '出库人员',
  `create_tima` datetime(0) NOT NULL COMMENT '创建时间',
  `review_status` int(11) NOT NULL COMMENT '审核状态（1已通过，2未通过）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of outbound
-- ----------------------------

-- ----------------------------
-- Table structure for patient
-- ----------------------------
DROP TABLE IF EXISTS `patient`;
CREATE TABLE `patient`  (
  `patient_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `patient_num` int(20) NOT NULL COMMENT '患者编码',
  `patient_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '患者姓名',
  `patient_sex` int(3) NULL DEFAULT NULL COMMENT '性别',
  `patient_age` int(10) NULL DEFAULT NULL COMMENT '年龄',
  `patient_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '手机号码',
  `opreator` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '操作人员',
  PRIMARY KEY (`patient_id`, `patient_num`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of patient
-- ----------------------------
INSERT INTO `patient` VALUES (28, 1005, 'Grace', 1, 28, '9998887777', 'Sarah');
INSERT INTO `patient` VALUES (29, 1006, 'Michael', 0, 42, '4445556666', 'Emily');
INSERT INTO `patient` VALUES (30, 1007, 'Sophia', 1, 39, '7778889999', 'James');
INSERT INTO `patient` VALUES (31, 1008, 'Oliver', 0, 31, '3334445555', 'Emma');
INSERT INTO `patient` VALUES (32, 1009, 'Isabella', 1, 27, '6667778888', 'Daniel');
INSERT INTO `patient` VALUES (33, 1010, 'William', 0, 48, '2223334444', 'Olivia');
INSERT INTO `patient` VALUES (34, 1011, 'Ava', 1, 33, '8889990000', 'William');
INSERT INTO `patient` VALUES (35, 1012, 'Liam', 0, 29, '5556667777', 'Sophia');
INSERT INTO `patient` VALUES (36, 1013, 'Mia', 1, 36, '4445556666', 'Benjamin');
INSERT INTO `patient` VALUES (37, 1014, 'Lucas', 0, 40, '1112223333', 'Amelia');
INSERT INTO `patient` VALUES (38, 1015, 'Emma', 1, 25, '9998887777', 'Lucas');
INSERT INTO `patient` VALUES (39, 1016, 'Alexander', 0, 37, '7778889999', 'Ava');
INSERT INTO `patient` VALUES (40, 1017, 'Abigail', 1, 34, '3334445555', 'Ethan');
INSERT INTO `patient` VALUES (41, 1018, 'Benjamin', 0, 30, '6667778888', 'Chloe');
INSERT INTO `patient` VALUES (42, 1019, 'Charlotte', 1, 26, '2223334444', 'Jacob');
INSERT INTO `patient` VALUES (43, 1020, 'Daniel', 0, 41, '8889990000', 'Ella');
INSERT INTO `patient` VALUES (44, 1021, 'Ella', 1, 32, '5556667777', 'Logan');
INSERT INTO `patient` VALUES (45, 1022, 'Logan', 0, 38, '4445556666', 'Aria');
INSERT INTO `patient` VALUES (46, 1023, 'Aria', 1, 29, '1112223333', 'Jack');
INSERT INTO `patient` VALUES (47, 1024, 'Jack', 0, 43, '9998887777', 'Sophie');
INSERT INTO `patient` VALUES (48, 1025, 'Sophie', 1, 24, '7778889999', 'Noah');
INSERT INTO `patient` VALUES (49, 1026, 'Noah', 0, 46, '3334445555', 'Emily');
INSERT INTO `patient` VALUES (50, 1027, 'Emily', 1, 31, '6667778888', 'Matthew');
INSERT INTO `patient` VALUES (51, 1028, 'Matthew', 0, 47, '2223334444', 'Amelia');
INSERT INTO `patient` VALUES (52, 1029, 'Amelia', 1, 23, '8889990000', 'Jacob');
INSERT INTO `patient` VALUES (53, 1030, 'Jacob', 0, 44, '5556667777', 'Ava');
INSERT INTO `patient` VALUES (54, 1031, 'Ava', 1, 30, '4445556666', 'Ethan');
INSERT INTO `patient` VALUES (55, 1032, 'Ethan', 0, 45, '1112223333', 'Chloe');
INSERT INTO `patient` VALUES (56, 1033, 'Chloe', 1, 28, '9998887777', 'Logan');
INSERT INTO `patient` VALUES (57, 1034, 'Logan', 0, 42, '7778889999', 'Sophie');
INSERT INTO `patient` VALUES (58, 1035, 'Sophie', 1, 25, '3334445555', 'Noah');
INSERT INTO `patient` VALUES (59, 1036, 'Noah', 0, 48, '6667778888', 'Emily');
INSERT INTO `patient` VALUES (60, 1037, 'Emily', 1, 27, '2223334444', 'Matthew');
INSERT INTO `patient` VALUES (61, 1038, 'Matthew', 0, 41, '8889990000', 'Amelia');
INSERT INTO `patient` VALUES (62, 1039, 'Amelia', 1, 26, '5556667777', 'Jacob');
INSERT INTO `patient` VALUES (63, 1040, 'Jacob', 0, 43, '4445556666', 'Ava');

-- ----------------------------
-- Table structure for patient_family
-- ----------------------------
DROP TABLE IF EXISTS `patient_family`;
CREATE TABLE `patient_family`  (
  `family_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_num` int(11) NOT NULL COMMENT '患者编码',
  `family_relation` int(11) NOT NULL COMMENT '家庭关系（1父子，2母子，3姐弟，4兄妹，5其他）',
  `family_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '姓名',
  `family_sex` int(11) NOT NULL COMMENT '性别（1男，2女）',
  `work_unit` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工作单位',
  `family_dob` date NULL DEFAULT NULL COMMENT '出生日期',
  `family_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  PRIMARY KEY (`family_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 62 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of patient_family
-- ----------------------------
INSERT INTO `patient_family` VALUES (22, 1001, 1, 'John', 1, 'ABC Company', '1980-05-15', '1234567890');
INSERT INTO `patient_family` VALUES (23, 1001, 2, 'Mary', 2, 'XYZ Corporation', '1982-08-20', '9876543210');
INSERT INTO `patient_family` VALUES (24, 1002, 1, 'David', 1, 'PQR Ltd.', '1975-11-10', '5556667777');
INSERT INTO `patient_family` VALUES (25, 1002, 2, 'Sarah', 2, 'LMN Group', '1986-04-25', '7778889999');
INSERT INTO `patient_family` VALUES (26, 1003, 1, 'Michael', 1, 'JKL Enterprises', '1970-09-30', '4445556666');
INSERT INTO `patient_family` VALUES (27, 1003, 2, 'Emily', 2, 'NOP Inc.', '1979-03-05', '2223334444');
INSERT INTO `patient_family` VALUES (28, 1004, 1, 'James', 1, 'RST Corp.', '1988-06-12', '8889990000');
INSERT INTO `patient_family` VALUES (29, 1004, 2, 'Sophia', 2, 'UVW Ltd.', '1990-01-17', '1112223333');
INSERT INTO `patient_family` VALUES (30, 1005, 1, 'Daniel', 1, 'EFG Co.', '1983-07-22', '9998887777');
INSERT INTO `patient_family` VALUES (31, 1005, 2, 'Olivia', 2, 'HIJ Group', '1985-12-03', '6667778888');
INSERT INTO `patient_family` VALUES (32, 1006, 1, 'William', 1, 'MNO Corporation', '1978-02-28', '3334445555');
INSERT INTO `patient_family` VALUES (33, 1006, 2, 'Emma', 2, 'PQS Enterprises', '1987-10-09', '5556667777');
INSERT INTO `patient_family` VALUES (34, 1007, 1, 'Benjamin', 1, 'XYZ Ltd.', '1973-04-14', '2223334444');
INSERT INTO `patient_family` VALUES (35, 1007, 2, 'Ava', 2, 'LMN Group', '1980-11-19', '7778889999');
INSERT INTO `patient_family` VALUES (36, 1008, 1, 'Lucas', 1, 'ABC Company', '1986-08-27', '4445556666');
INSERT INTO `patient_family` VALUES (37, 1008, 2, 'Amelia', 2, 'RST Corp.', '1989-03-08', '1112223333');
INSERT INTO `patient_family` VALUES (38, 1009, 1, 'Jacob', 1, 'EFG Co.', '1982-05-31', '8889990000');
INSERT INTO `patient_family` VALUES (39, 1009, 2, 'Chloe', 2, 'PQR Ltd.', '1984-10-12', '9998887777');
INSERT INTO `patient_family` VALUES (40, 1010, 1, 'Logan', 1, 'MNO Corporation', '1975-12-09', '6667778888');
INSERT INTO `patient_family` VALUES (41, 1010, 2, 'Sophie', 2, 'NOP Inc.', '1977-07-26', '3334445555');
INSERT INTO `patient_family` VALUES (42, 1011, 1, 'Noah', 1, 'JKL Enterprises', '1981-09-15', '5556667777');
INSERT INTO `patient_family` VALUES (43, 1011, 2, 'Emily', 2, 'UVW Ltd.', '1984-02-18', '2223334444');
INSERT INTO `patient_family` VALUES (44, 1012, 1, 'Matthew', 1, 'PQS Enterprises', '1987-04-03', '7778889999');
INSERT INTO `patient_family` VALUES (45, 1012, 2, 'Amelia', 2, 'EFG Co.', '1990-11-20', '4445556666');
INSERT INTO `patient_family` VALUES (46, 1013, 1, 'Jacob', 1, 'ABC Company', '1984-06-07', '1112223333');
INSERT INTO `patient_family` VALUES (47, 1013, 2, 'Ava', 2, 'MNO Corporation', '1986-03-14', '8889990000');
INSERT INTO `patient_family` VALUES (48, 1014, 1, 'Ethan', 1, 'XYZ Ltd.', '1979-08-23', '9998887777');
INSERT INTO `patient_family` VALUES (49, 1014, 2, 'Chloe', 2, 'JKL Enterprises', '1981-01-30', '6667778888');
INSERT INTO `patient_family` VALUES (50, 1015, 1, 'Logan', 1, 'PQR Ltd.', '1976-10-16', '3334445555');
INSERT INTO `patient_family` VALUES (51, 1015, 2, 'Sophie', 2, 'RST Corp.', '1978-05-21', '5556667777');
INSERT INTO `patient_family` VALUES (52, 1016, 1, 'Noah', 1, 'LMN Group', '1980-12-11', '2223334444');
INSERT INTO `patient_family` VALUES (53, 1016, 2, 'Emily', 2, 'NOP Inc.', '1983-07-06', '7778889999');
INSERT INTO `patient_family` VALUES (54, 1017, 1, 'Matthew', 1, 'PQS Enterprises', '1985-09-09', '4445556666');
INSERT INTO `patient_family` VALUES (55, 1017, 2, 'Amelia', 2, 'ABC Company', '1988-04-24', '1112223333');
INSERT INTO `patient_family` VALUES (56, 1018, 1, 'Jacob', 1, 'MNO Corporation', '1977-02-18', '8889990000');
INSERT INTO `patient_family` VALUES (57, 1018, 2, 'Ava', 2, 'EFG Co.', '1979-11-03', '9998887777');
INSERT INTO `patient_family` VALUES (58, 1019, 1, 'Ethan', 1, 'XYZ Ltd.', '1981-04-26', '6667778888');
INSERT INTO `patient_family` VALUES (59, 1019, 2, 'Chloe', 2, 'JKL Enterprises', '1983-09-01', '3334445555');
INSERT INTO `patient_family` VALUES (60, 1020, 1, 'Logan', 1, 'PQR Ltd.', '1985-11-07', '5556667777');
INSERT INTO `patient_family` VALUES (61, 1020, 2, 'Sophie', 2, 'RST Corp.', '1988-06-22', '2223334444');

-- ----------------------------
-- Table structure for patients
-- ----------------------------
DROP TABLE IF EXISTS `patients`;
CREATE TABLE `patients`  (
  `patient_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `patient_sex` int(11) NULL DEFAULT NULL,
  `patient_age` int(11) NULL DEFAULT NULL,
  `patient_phone` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`patient_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of patients
-- ----------------------------
INSERT INTO `patients` VALUES (1, '张三', 1, 35, '13800000001');
INSERT INTO `patients` VALUES (2, '李四', 2, 40, '13800000002');
INSERT INTO `patients` VALUES (3, '王五', 1, 50, '13800000003');
INSERT INTO `patients` VALUES (4, '赵六', 2, 28, '13800000004');
INSERT INTO `patients` VALUES (5, '陈七', 2, 30, '13800000005');
INSERT INTO `patients` VALUES (6, '周八', 1, 45, '13800000006');
INSERT INTO `patients` VALUES (7, '吴九', 2, 55, '13800000007');
INSERT INTO `patients` VALUES (8, '赵六', 1, 38, '13800000008');
INSERT INTO `patients` VALUES (9, '孙十一', 2, 29, '13800000009');
INSERT INTO `patients` VALUES (10, '钱十二', 1, 42, '13800000010');
INSERT INTO `patients` VALUES (11, '刘十三', 2, 32, '13800000011');
INSERT INTO `patients` VALUES (12, '朱十四', 1, 58, '13800000012');
INSERT INTO `patients` VALUES (13, '冯十五', 2, 38, '13800000013');
INSERT INTO `patients` VALUES (14, '陈十六', 1, 44, '13800000014');
INSERT INTO `patients` VALUES (15, '周十七', 2, 52, '13800000015');
INSERT INTO `patients` VALUES (16, '吴十八', 1, 36, '13800000016');
INSERT INTO `patients` VALUES (17, '郑十九', 2, 30, '13800000017');
INSERT INTO `patients` VALUES (18, '王二十', 1, 55, '13800000018');
INSERT INTO `patients` VALUES (19, '李二十一', 2, 40, '13800000019');
INSERT INTO `patients` VALUES (20, '张二十二', 1, 45, '13800000020');

-- ----------------------------
-- Table structure for ptuser
-- ----------------------------
DROP TABLE IF EXISTS `ptuser`;
CREATE TABLE `ptuser`  (
  `patient_id` int(20) NOT NULL AUTO_INCREMENT,
  `partient_num` int(20) NULL DEFAULT NULL,
  `partient_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `patient_sex` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `patient_age` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `patient_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `opreator` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`patient_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ptuser
-- ----------------------------

-- ----------------------------
-- Table structure for registration
-- ----------------------------
DROP TABLE IF EXISTS `registration`;
CREATE TABLE `registration`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `registration_coding` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '挂号单号',
  `registration_fee` double(10, 2) NOT NULL DEFAULT 0.00 COMMENT '挂号费',
  `registration_state` int(11) NULL DEFAULT 2 COMMENT '就诊状态（1已就诊，2未就）',
  `departments` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '科室',
  `reception_type` int(11) NOT NULL COMMENT '接诊类型（1初诊，2复诊）',
  `doctor_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '接诊医生',
  `consultation_fee` double(10, 2) NULL DEFAULT 0.00 COMMENT '诊疗费',
  `receivable` double(10, 2) NULL DEFAULT 0.00 COMMENT '应收费用（挂号费+诊疗费）',
  `registration_date` date NOT NULL COMMENT '挂号日期',
  `registration_by` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '李悦先' COMMENT '挂号员',
  `patient_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '患者姓名',
  `patient_sex` int(11) NOT NULL COMMENT '患者性别(1男，2女)',
  `patient_age` int(11) NOT NULL COMMENT '患者年龄',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of registration
-- ----------------------------
INSERT INTO `registration` VALUES (1, '202312230001', 10.00, 1, '全科', 2, '文杰主任', 0.00, 10.00, '2023-12-21', ' 李悦先', '崔瑜航', 1, 20);
INSERT INTO `registration` VALUES (2, '202312230002', 20.00, 1, '外科', 1, '刘医生', 50.00, 70.00, '2023-12-22', '李悦先', 'Kobe', 2, 45);
INSERT INTO `registration` VALUES (3, '202312280001', 10.00, 2, '妇科', 1, '阿朱姐姐', 0.00, 10.00, '2023-12-28', '李悦先', ' 奥斯曼', 2, 20);
INSERT INTO `registration` VALUES (4, '202407240001', 50.00, 1, '内科', 1, '张医生', 80.00, 130.00, '2024-01-01', '王挂号员', '李小明', 1, 45);
INSERT INTO `registration` VALUES (5, '202407240002', 50.00, 2, '外科', 2, '刘医生', 0.00, 50.00, '2024-01-01', '赵挂号员', '王小红', 2, 30);
INSERT INTO `registration` VALUES (6, '202407240003', 60.00, 1, '全科', 1, '陈医生', 100.00, 160.00, '2024-01-01', '李挂号员', '张大力', 1, 55);
INSERT INTO `registration` VALUES (7, '202407240004', 50.00, 1, '眼科', 1, '王医生', 80.00, 130.00, '2024-01-02', '赵挂号员', '刘小芳', 2, 25);
INSERT INTO `registration` VALUES (8, '202407240005', 50.00, 1, '儿科', 2, '李医生', 70.00, 120.00, '2024-01-02', '王挂号员', '陈刚', 1, 40);
INSERT INTO `registration` VALUES (9, '202407240006', 60.00, 2, '外科', 1, '刘医生', 0.00, 60.00, '2024-01-02', '李挂号员', '周丽华', 2, 35);
INSERT INTO `registration` VALUES (10, '202407240007', 50.00, 1, '全科', 2, '陈医生', 90.00, 140.00, '2024-01-03', '赵挂号员', '孙建国', 1, 50);
INSERT INTO `registration` VALUES (11, '202407240008', 60.00, 1, '眼科', 1, '王医生', 100.00, 160.00, '2024-01-03', '王挂号员', '朱丽丽', 2, 28);
INSERT INTO `registration` VALUES (12, '202407240009', 50.00, 2, '儿科', 2, '李医生', 0.00, 50.00, '2024-01-03', '李挂号员', '刘伟', 1, 60);
INSERT INTO `registration` VALUES (13, '202407240010', 50.00, 1, '全科', 1, '文杰主任', 80.00, 130.00, '2024-01-04', '赵挂号员', '程小琴', 2, 32);
INSERT INTO `registration` VALUES (14, '202407240011', 60.00, 1, '眼科', 2, '王医生', 90.00, 150.00, '2024-01-04', '王挂号员', '黄志强', 1, 48);
INSERT INTO `registration` VALUES (15, '202407240012', 50.00, 2, '儿科', 1, '李医生', 0.00, 50.00, '2024-01-04', '李挂号员', '周小敏', 2, 38);
INSERT INTO `registration` VALUES (16, '202407240013', 60.00, 1, '外科', 2, '刘医生', 70.00, 130.00, '2024-01-05', '赵挂号员', '朱小龙', 1, 42);
INSERT INTO `registration` VALUES (17, '202407240014', 50.00, 1, '全科', 1, '陈医生', 80.00, 130.00, '2024-01-05', '王挂号员', '许小娟', 2, 29);
INSERT INTO `registration` VALUES (18, '202407240015', 50.00, 2, '内科', 2, '张医生', 0.00, 50.00, '2024-01-05', '李挂号员', '钱小强', 1, 55);
INSERT INTO `registration` VALUES (20, '202407240016', 0.00, 2, '全科', 1, '文杰主任', 0.00, 0.00, '2024-07-25', '李悦先', '沃日', 2, 18);
INSERT INTO `registration` VALUES (21, '202407240017', 10.00, 2, '全科', 1, '文杰主任', 50.00, 60.00, '2024-07-25', '李悦先', '詹姆斯', 1, 15);

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `roles_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `roles_id_card` int(20) NULL DEFAULT NULL COMMENT '角色编号',
  `roles_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `roles_text` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色描述',
  `roles_create_time` date NULL DEFAULT NULL COMMENT '创建时间',
  `roles_create_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人员',
  `roles_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色状态',
  PRIMARY KEY (`roles_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 101, '医生', '负责诊断和治疗患者病情', '2024-07-26', '管理员A', '启用');
INSERT INTO `roles` VALUES (2, 102, '护士', '负责照顾和护理患者', '2024-07-26', '管理员B', '启用');
INSERT INTO `roles` VALUES (3, 103, '药剂师', '负责调配和发药', '2024-07-26', '管理员C', '启用');
INSERT INTO `roles` VALUES (4, 104, '行政人员', '负责协调医院内部事务', '2024-07-26', '管理员D', '启用');
INSERT INTO `roles` VALUES (5, 105, '财务人员', '负责医院财务管理', '2024-07-26', '管理员E', '启用');
INSERT INTO `roles` VALUES (6, 106, '清洁工', '负责医院卫生保洁', '2024-07-26', '管理员F', '启用');
INSERT INTO `roles` VALUES (7, 107, '安保人员', '负责医院安全和秩序', '2024-07-26', '管理员G', '启用');
INSERT INTO `roles` VALUES (8, 108, '信息技术人员', '负责医院信息技术支持', '2024-07-26', '管理员H', '启用');
INSERT INTO `roles` VALUES (9, 109, '营养师', '负责制定患者饮食方案', '2024-07-26', '管理员I', '启用');
INSERT INTO `roles` VALUES (10, 110, '健康教育员', '负责健康宣教和指导', '2024-07-26', '管理员J', '启用');
INSERT INTO `roles` VALUES (11, 111, '病案管理师', '负责医疗档案管理', '2024-07-26', '管理员K', '启用');
INSERT INTO `roles` VALUES (12, 112, '志愿者', '无偿服务医院', '2024-07-26', '管理员L', '启用');
INSERT INTO `roles` VALUES (13, 113, '心理医生', '负责心理健康咨询', '2024-07-26', '管理员M', '启用');
INSERT INTO `roles` VALUES (14, 114, '社工', '负责社会工作服务', '2024-07-26', '管理员N', '启用');
INSERT INTO `roles` VALUES (15, 115, '采购人员', '负责医院物资采购', '2024-07-26', '管理员O', '启用');
INSERT INTO `roles` VALUES (16, 116, '科研人员', '负责医学科研工作', '2024-07-26', '管理员P', '启用');
INSERT INTO `roles` VALUES (17, 117, '护理部主任', '负责护理部门管理', '2024-07-26', '管理员Q', '启用');
INSERT INTO `roles` VALUES (18, 118, '检验科技师', '负责医学检验工作', '2024-07-26', '管理员R', '启用');
INSERT INTO `roles` VALUES (19, 119, '麻醉师', '负责麻醉操作', '2024-07-26', '管理员S', '启用');
INSERT INTO `roles` VALUES (20, 120, '院长', '医院的最高管理者', '2024-07-26', '管理员T', '启用');
INSERT INTO `roles` VALUES (21, 11, '11', '11', '2024-07-30', '11', NULL);

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier`  (
  `supplier_id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_number` int(20) NULL DEFAULT NULL COMMENT '供应商编号',
  `supplier_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '供应商名称',
  `contacts` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '联系人',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '联系电话',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `supplier_user` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人员',
  `supplier_state` int(11) NULL DEFAULT NULL COMMENT '供应商状态(1.启用，2.禁用)',
  PRIMARY KEY (`supplier_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES (13, 10013, '白云制药厂', '王宽硕', '13800000013', '2024-07-24 22:00:00', '王冕', 1);
INSERT INTO `supplier` VALUES (16, 10016, '蓝天制药厂', '赵健', '13800000016', '2024-07-25 01:00:00', '王冕', 2);
INSERT INTO `supplier` VALUES (27, 10019, '蓝天制药厂', '王宽硕', '13800000001', '2024-07-26 17:30:18', '王冕', 1);
INSERT INTO `supplier` VALUES (28, 10020, '蓝天制药厂', '王宽硕', '13800000001', '2024-07-26 17:30:50', '王冕', 1);
INSERT INTO `supplier` VALUES (34, 10021, '白云制药厂', '李明', '13800000008', '2024-07-26 18:22:51', '王冕', 1);
INSERT INTO `supplier` VALUES (35, 10022, '白云制药厂', '曲晓静', '13800000002', '2024-07-26 18:30:41', '林鹤', 1);
INSERT INTO `supplier` VALUES (36, 10023, '白云制药厂', '王宽硕', '13800000013', '2024-07-27 09:33:09', '王冕', 2);

-- ----------------------------
-- Table structure for temporary_drug
-- ----------------------------
DROP TABLE IF EXISTS `temporary_drug`;
CREATE TABLE `temporary_drug`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `medicine_coding` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药品编码',
  `medicine_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药品名称',
  `specification` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药品规格',
  `buy_num` int(11) NULL DEFAULT NULL COMMENT '数量',
  `unit` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位',
  `sell_price` double(10, 2) NULL DEFAULT NULL COMMENT '单价',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 162 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of temporary_drug
-- ----------------------------

-- ----------------------------
-- Table structure for temporary_info
-- ----------------------------
DROP TABLE IF EXISTS `temporary_info`;
CREATE TABLE `temporary_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `patient_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `patient_card` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者卡号',
  `patient_age` int(11) NULL DEFAULT NULL COMMENT '患者年龄',
  `dob` date NULL DEFAULT NULL COMMENT '患者出生日期',
  `patient_sex` int(11) NULL DEFAULT NULL COMMENT '患者性别',
  `patient_contact` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者联系方式',
  `id_card_num` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者身份证号码',
  `operator` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作员',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of temporary_info
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `user_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phone_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sex` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `login_date` datetime(0) NULL DEFAULT NULL,
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ip_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  INDEX `userId`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'lyx', '88888', '女', '123', '2024-07-27 18:58:35', '1', '', '');
INSERT INTO `users` VALUES (2, 'wj', '88888888888', '男', '111111', '2024-07-26 16:44:09', '', NULL, NULL);
INSERT INTO `users` VALUES (3, 'lb', '12345678911', '男', '111111', '2024-07-27 21:30:10', '1', NULL, NULL);
INSERT INTO `users` VALUES (4, 'pw', '6546516611', '男', '111111', '2024-07-26 20:40:59', '1', NULL, NULL);
INSERT INTO `users` VALUES (5, 'xk', '151611611', '男', '111111', '2024-07-27 19:29:46', '1', '', '');

-- ----------------------------
-- Table structure for warehousing
-- ----------------------------
DROP TABLE IF EXISTS `warehousing`;
CREATE TABLE `warehousing`  (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `warehousing_order` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '入库单号',
  `type` int(11) NULL DEFAULT NULL COMMENT '入库类型(1采购入库，2退货入库，3其他入库)',
  `supplier_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '供应商名称',
  `make_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '制单人员',
  `procurement_amount` double(10, 2) NULL DEFAULT NULL COMMENT '采购金额',
  `procurement_retail` double(10, 2) NULL DEFAULT NULL COMMENT '零售金额',
  `Warehousing_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '入库人员',
  `create_tima` datetime(0) NULL DEFAULT NULL COMMENT '创建时间(入库时间)',
  `review_status` int(11) NULL DEFAULT NULL COMMENT '审核状态（1审核通过，2审核未通过,3未审核）',
  `make_time` datetime(0) NULL DEFAULT NULL COMMENT '制单时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of warehousing
-- ----------------------------
INSERT INTO `warehousing` VALUES (1, 'WO10001', 1, '供应商A', '张三', 1000.00, 1200.00, '李四', '2023-07-01 10:00:00', 1, NULL);
INSERT INTO `warehousing` VALUES (2, 'WO10002', 2, '供应商B', '王五', 1500.50, 1800.60, '赵六', '2023-07-02 11:00:00', 1, NULL);
INSERT INTO `warehousing` VALUES (4, 'WO10004', 1, '供应商D', '赵六', 2500.75, 3000.90, '王五', '2023-07-04 13:00:00', 1, NULL);
INSERT INTO `warehousing` VALUES (5, 'WO10005', 2, '供应商E', '张三', 3000.20, 3600.24, '李四', '2023-07-05 14:00:00', 1, NULL);
INSERT INTO `warehousing` VALUES (6, 'WO10006', 3, '供应商F', '王五', 3500.80, 4200.96, '赵六', '2023-07-06 15:00:00', 2, NULL);
INSERT INTO `warehousing` VALUES (7, 'WO10007', 1, '供应商G', '李四', 4000.35, 4800.42, '张三', '2023-07-07 16:00:00', 3, NULL);
INSERT INTO `warehousing` VALUES (8, 'WO10008', 2, '供应商H', '赵六', 4500.90, 5400.18, '王五', '2023-07-08 17:00:00', 1, NULL);
INSERT INTO `warehousing` VALUES (9, 'WO10009', 3, '供应商I', '张三', 5000.50, 6000.60, '李四', '2023-07-09 18:00:00', 2, NULL);
INSERT INTO `warehousing` VALUES (10, 'WO10010', 1, '供应商J', '王五', 5500.10, 6600.12, '赵六', '2023-07-10 19:00:00', 1, NULL);
INSERT INTO `warehousing` VALUES (11, 'WO10011', 2, '供应商K', '李四', 6000.25, 7200.30, '张三', '2023-07-11 20:00:00', 1, NULL);
INSERT INTO `warehousing` VALUES (12, 'WO10012', 3, '供应商L', '赵六', 6500.75, 7800.90, '王五', '2023-07-12 21:00:00', 2, NULL);
INSERT INTO `warehousing` VALUES (13, 'WO10013', 1, '供应商M', '张三', 7000.20, 8400.24, '李四', '2023-07-13 22:00:00', 1, NULL);
INSERT INTO `warehousing` VALUES (14, 'WO10014', 2, '供应商N', '王五', 7500.80, 9000.96, '赵六', '2023-07-14 23:00:00', 1, NULL);
INSERT INTO `warehousing` VALUES (15, 'WO10015', 3, '供应商O', '李四', 8000.35, 9600.42, '张三', '2023-07-15 00:00:00', 2, NULL);
INSERT INTO `warehousing` VALUES (16, 'WO10016', 1, '供应商P', '赵六', 8500.90, 10200.18, '王五', '2023-07-16 01:00:00', 1, NULL);
INSERT INTO `warehousing` VALUES (17, 'WO10017', 2, '供应商Q', '张三', 9000.50, 10800.60, '李四', '2023-07-17 02:00:00', 1, NULL);
INSERT INTO `warehousing` VALUES (18, 'WO10018', 3, '供应商R', '王五', 9500.10, 11400.12, '赵六', '2023-07-18 03:00:00', 2, NULL);
INSERT INTO `warehousing` VALUES (19, 'WO10019', 1, '供应商S', '李四', 10000.25, 12000.30, '张三', '2023-07-19 04:00:00', 1, NULL);
INSERT INTO `warehousing` VALUES (20, 'WO10020', 2, '供应商T', '赵六', 10500.75, 12600.90, '王五', '2023-07-20 05:00:00', 1, NULL);

SET FOREIGN_KEY_CHECKS = 1;
