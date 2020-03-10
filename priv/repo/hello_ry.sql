/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50623
 Source Host           : localhost:3306
 Source Schema         : hello_ry

 Target Server Type    : MySQL
 Target Server Version : 50623
 File Encoding         : 65001

 Date: 10/03/2020 13:42:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `blob_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E078707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E078707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E078707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', 'DESKTOP-R9KTDAE1576920009672', 1576920232778, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `int_prop_1` int(11) NULL DEFAULT NULL,
  `int_prop_2` int(11) NULL DEFAULT NULL,
  `long_prop_1` bigint(20) NULL DEFAULT NULL,
  `long_prop_2` bigint(20) NULL DEFAULT NULL,
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL,
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL,
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `next_fire_time` bigint(13) NULL DEFAULT NULL,
  `prev_fire_time` bigint(13) NULL DEFAULT NULL,
  `priority` int(11) NULL DEFAULT NULL,
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) NULL DEFAULT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `misfire_instr` smallint(2) NULL DEFAULT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1576920010000, -1, 5, 'PAUSED', 'CRON', 1576920010000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1576920015000, -1, 5, 'PAUSED', 'CRON', 1576920011000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1576920020000, -1, 5, 'PAUSED', 'CRON', 1576920012000, 0, NULL, 2, '');

-- ----------------------------
-- Table structure for schema_migrations
-- ----------------------------
DROP TABLE IF EXISTS `schema_migrations`;
CREATE TABLE `schema_migrations`  (
  `version` bigint(20) NOT NULL DEFAULT 0,
  `inserted_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`version`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of schema_migrations
-- ----------------------------
INSERT INTO `schema_migrations` VALUES (20191218094633, '2019-12-19 01:24:28');
INSERT INTO `schema_migrations` VALUES (20191220071348, '2019-12-20 09:57:20');

-- ----------------------------
-- Table structure for sys_account
-- ----------------------------
DROP TABLE IF EXISTS `sys_account`;
CREATE TABLE `sys_account`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `password_hash` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `inserted_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `credentials_user_id_index`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_account
-- ----------------------------
INSERT INTO `sys_account` VALUES (4, '$pbkdf2-sha512$160000$AjZcJ4bPb7M.wXUuIoMniw$iYgC2DjIvI333cBRYs3ZRqRW6OufR93Q4dDeXSH7P3MxI2khor5nx2aSOup2VrhHz8jX9en182g2Up6QdWuPmQ', 3, '2020-02-15 14:07:16', '2020-02-15 14:07:16');
INSERT INTO `sys_account` VALUES (5, '$pbkdf2-sha512$160000$elJK8F4qwwae4an5WpcRWA$hj3syJrofarMnR0vhe8R6IarSjzny7FtDGxND0apLu7Iy2tU4/cCj5bKU0/kqkImPoxtE3u9PS3GZWgZDIg.yg', 5, '2020-02-15 14:51:51', '2020-02-15 14:51:51');
INSERT INTO `sys_account` VALUES (6, '$pbkdf2-sha512$160000$Wqzsc5sh6QjULbw06R9dBA$fu1Jwr/pTKBHP2ZiWFSJ89qCnMxZWyElot/uevg5DJoC/On6G4PiY82Qw1XTZ.DOXq6x63rir2qlx71Fp6VGVA', 6, '2020-02-15 15:08:05', '2020-02-15 15:08:05');
INSERT INTO `sys_account` VALUES (7, '$pbkdf2-sha512$160000$ZI.eaaAJvORmH4gO4.1fgg$6ZJYiH0MtDqibS0sy.AFT2U0Vvw8L2Ph90wqJUyxoehIYdMSXVcQ9aZk/N.O/5AgaFoYEZO1SpgIdPEBjYmbPw', 7, '2020-02-16 03:06:38', '2020-02-16 03:06:38');
INSERT INTO `sys_account` VALUES (8, NULL, 1, '2020-02-16 06:18:06', '2020-02-16 06:18:06');
INSERT INTO `sys_account` VALUES (9, NULL, 4, '2020-02-16 06:34:55', '2020-02-16 06:34:55');

-- ----------------------------
-- Table structure for sys_area
-- ----------------------------
DROP TABLE IF EXISTS `sys_area`;
CREATE TABLE `sys_area`  (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `parent_id` bigint(64) NULL DEFAULT NULL COMMENT '父级编号',
  `ancestors` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所有父级编号',
  `code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区域编码',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区域名称',
  `type` int(1) NULL DEFAULT NULL COMMENT '区域类型',
  `status` int(1) NULL DEFAULT 0 COMMENT '删除标记',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `inserted_by_id` bigint(64) NULL DEFAULT NULL COMMENT '创建者',
  `inserted_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by_id` bigint(64) NULL DEFAULT NULL COMMENT '更新者',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sys_area_parent_id`(`parent_id`) USING BTREE,
  INDEX `sys_area_del_flag`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 661401 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '区域表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_area
-- ----------------------------
INSERT INTO `sys_area` VALUES (1, 0, '0,', '100000', '中国', 1, 0, '', 1, '2013-05-27 08:00:00', 1, '2013-05-27 08:00:00');
INSERT INTO `sys_area` VALUES (110000, 1, '0,1,', '110000', '北京市', 2, 0, NULL, 1, NULL, 3, '2020-02-15 17:56:16');
INSERT INTO `sys_area` VALUES (110101, 110000, '0,1,110000,', '110101', '东城区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (110102, 110000, '0,1,110000,', '110102', '西城区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (110103, 110000, '0,1,110000,', '110103', '崇文区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (110104, 110000, '0,1,110000,', '110104', '宣武区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (110105, 110000, '0,1,110000,', '110105', '朝阳区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (110106, 110000, '0,1,110000,', '110106', '丰台区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (110107, 110000, '0,1,110000,', '110107', '石景山区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (110108, 110000, '0,1,110000,', '110108', '海淀区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (110109, 110000, '0,1,110000,', '110109', '门头沟区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (110111, 110000, '0,1,110000,', '110111', '房山区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (110112, 110000, '0,1,110000,', '110112', '通州区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (110113, 110000, '0,1,110000,', '110113', '顺义区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (110114, 110000, '0,1,110000,', '110114', '昌平区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (110115, 110000, '0,1,110000,', '110115', '大兴区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (110116, 110000, '0,1,110000,', '110116', '怀柔区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (110117, 110000, '0,1,110000,', '110117', '平谷区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (110140, 110000, '0,1,110000,', '110140', '经济技术开发区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (110228, 110000, '0,1,110000,', '110228', '密云县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (110229, 110000, '0,1,110000,', '110229', '延庆县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (120000, 1, '0,1,', '120000', '天津市', 2, 0, NULL, 1, NULL, NULL, '2020-02-11 14:00:47');
INSERT INTO `sys_area` VALUES (120101, 120000, '0,1,120000,', '120101', '和平区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (120102, 120000, '0,1,120000,', '120102', '河东区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (120103, 120000, '0,1,120000,', '120103', '河西区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (120104, 120000, '0,1,120000,', '120104', '南开区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (120105, 120000, '0,1,120000,', '120105', '河北区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (120106, 120000, '0,1,120000,', '120106', '红桥区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (120107, 120000, '0,1,120000,', '120107', '塘沽区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (120108, 120000, '0,1,120000,', '120108', '汉沽区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (120109, 120000, '0,1,120000,', '120109', '大港区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (120110, 120000, '0,1,120000,', '120110', '东丽区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (120111, 120000, '0,1,120000,', '120111', '西青区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (120112, 120000, '0,1,120000,', '120112', '津南区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (120113, 120000, '0,1,120000,', '120113', '北辰区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (120114, 120000, '0,1,120000,', '120114', '武清区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (120115, 120000, '0,1,120000,', '120115', '宝坻区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (120140, 120000, '0,1,120000,', '120140', '开发区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (120141, 120000, '0,1,120000,', '120141', '保税区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (120142, 120000, '0,1,120000,', '120142', '科技园区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (120221, 120000, '0,1,120000,', '120221', '宁河县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (120223, 120000, '0,1,120000,', '120223', '静海县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (120225, 120000, '0,1,120000,', '120225', '蓟县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130000, 1, '0,1,', '130000', '河北省', 2, 0, NULL, 1, NULL, NULL, '2020-02-11 12:21:45');
INSERT INTO `sys_area` VALUES (130100, 130000, '0,1,130000,', '130100', '石家庄市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130102, 130100, '0,1,130000,130100,', '130102', '长安区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130103, 130100, '0,1,130000,130100,', '130103', '桥东区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130104, 130100, '0,1,130000,130100,', '130104', '桥西区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130105, 130100, '0,1,130000,130100,', '130105', '新华区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130107, 130100, '0,1,130000,130100,', '130107', '井陉矿区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130108, 130100, '0,1,130000,130100,', '130108', '裕华区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130121, 130100, '0,1,130000,130100,', '130121', '井陉县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130123, 130100, '0,1,130000,130100,', '130123', '正定县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130124, 130100, '0,1,130000,130100,', '130124', '栾城县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130125, 130100, '0,1,130000,130100,', '130125', '行唐县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130126, 130100, '0,1,130000,130100,', '130126', '灵寿县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130127, 130100, '0,1,130000,130100,', '130127', '高邑县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130128, 130100, '0,1,130000,130100,', '130128', '深泽县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130129, 130100, '0,1,130000,130100,', '130129', '赞皇县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130130, 130100, '0,1,130000,130100,', '130130', '无极县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130131, 130100, '0,1,130000,130100,', '130131', '平山县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130132, 130100, '0,1,130000,130100,', '130132', '元氏县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130133, 130100, '0,1,130000,130100,', '130133', '赵县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130140, 130100, '0,1,130000,130100,', '130140', '开发区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130181, 130100, '0,1,130000,130100,', '130181', '辛集市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130182, 130100, '0,1,130000,130100,', '130182', '藁城市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130183, 130100, '0,1,130000,130100,', '130183', '晋州市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130184, 130100, '0,1,130000,130100,', '130184', '新乐市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130185, 130100, '0,1,130000,130100,', '130185', '鹿泉市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130200, 130000, '0,1,130000,', '130200', '唐山市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130202, 130200, '0,1,130000,130200,', '130202', '路南区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130203, 130200, '0,1,130000,130200,', '130203', '路北区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130204, 130200, '0,1,130000,130200,', '130204', '古冶区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130205, 130200, '0,1,130000,130200,', '130205', '开平区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130207, 130200, '0,1,130000,130200,', '130207', '丰南区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130208, 130200, '0,1,130000,130200,', '130208', '丰润区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130223, 130200, '0,1,130000,130200,', '130223', '滦县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130224, 130200, '0,1,130000,130200,', '130224', '滦南县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130225, 130200, '0,1,130000,130200,', '130225', '乐亭县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130227, 130200, '0,1,130000,130200,', '130227', '迁西县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130229, 130200, '0,1,130000,130200,', '130229', '玉田县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130230, 130200, '0,1,130000,130200,', '130230', '唐海县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130240, 130200, '0,1,130000,130200,', '130240', '高新技术开发区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130241, 130200, '0,1,130000,130200,', '130241', '南堡开发区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130242, 130200, '0,1,130000,130200,', '130242', '海港开发区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130243, 130200, '0,1,130000,130200,', '130243', '芦台开发区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130244, 130200, '0,1,130000,130200,', '130244', '汉沽开发区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130281, 130200, '0,1,130000,130200,', '130281', '遵化市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130283, 130200, '0,1,130000,130200,', '130283', '迁安市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130300, 130000, '0,1,130000,', '130300', '秦皇岛市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130302, 130300, '0,1,130000,130300,', '130302', '海港区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130303, 130300, '0,1,130000,130300,', '130303', '山海关区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130304, 130300, '0,1,130000,130300,', '130304', '北戴河区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130321, 130300, '0,1,130000,130300,', '130321', '青龙满族自治县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130322, 130300, '0,1,130000,130300,', '130322', '昌黎县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130323, 130300, '0,1,130000,130300,', '130323', '抚宁县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130324, 130300, '0,1,130000,130300,', '130324', '卢龙县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130340, 130300, '0,1,130000,130300,', '130340', '开发区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130400, 130000, '0,1,130000,', '130400', '邯郸市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130402, 130400, '0,1,130000,130400,', '130402', '邯山区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130403, 130400, '0,1,130000,130400,', '130403', '丛台区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130404, 130400, '0,1,130000,130400,', '130404', '复兴区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130406, 130400, '0,1,130000,130400,', '130406', '峰峰矿区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130421, 130400, '0,1,130000,130400,', '130421', '邯郸县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130423, 130400, '0,1,130000,130400,', '130423', '临漳县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130424, 130400, '0,1,130000,130400,', '130424', '成安县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130425, 130400, '0,1,130000,130400,', '130425', '大名县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130426, 130400, '0,1,130000,130400,', '130426', '涉县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130427, 130400, '0,1,130000,130400,', '130427', '磁县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130428, 130400, '0,1,130000,130400,', '130428', '肥乡县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130429, 130400, '0,1,130000,130400,', '130429', '永年县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130430, 130400, '0,1,130000,130400,', '130430', '邱县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130431, 130400, '0,1,130000,130400,', '130431', '鸡泽县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130432, 130400, '0,1,130000,130400,', '130432', '广平县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130433, 130400, '0,1,130000,130400,', '130433', '馆陶县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130434, 130400, '0,1,130000,130400,', '130434', '魏县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130435, 130400, '0,1,130000,130400,', '130435', '曲周县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130440, 130400, '0,1,130000,130400,', '130440', '开发区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130481, 130400, '0,1,130000,130400,', '130481', '武安市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130500, 130000, '0,1,130000,', '130500', '邢台市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130502, 130500, '0,1,130000,130500,', '130502', '桥东区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130503, 130500, '0,1,130000,130500,', '130503', '桥西区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130521, 130500, '0,1,130000,130500,', '130521', '邢台县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130522, 130500, '0,1,130000,130500,', '130522', '临城县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130523, 130500, '0,1,130000,130500,', '130523', '内丘县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130524, 130500, '0,1,130000,130500,', '130524', '柏乡县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130525, 130500, '0,1,130000,130500,', '130525', '隆尧县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130526, 130500, '0,1,130000,130500,', '130526', '任县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130527, 130500, '0,1,130000,130500,', '130527', '南和县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130528, 130500, '0,1,130000,130500,', '130528', '宁晋县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130529, 130500, '0,1,130000,130500,', '130529', '巨鹿县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130530, 130500, '0,1,130000,130500,', '130530', '新河县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130531, 130500, '0,1,130000,130500,', '130531', '广宗县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130532, 130500, '0,1,130000,130500,', '130532', '平乡县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130533, 130500, '0,1,130000,130500,', '130533', '威县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130534, 130500, '0,1,130000,130500,', '130534', '清河县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130535, 130500, '0,1,130000,130500,', '130535', '临西县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130540, 130500, '0,1,130000,130500,', '130540', '高开区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130541, 130500, '0,1,130000,130500,', '130541', '大曹庄', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130581, 130500, '0,1,130000,130500,', '130581', '南宫市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130582, 130500, '0,1,130000,130500,', '130582', '沙河市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130600, 130000, '0,1,130000,', '130600', '保定市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130602, 130600, '0,1,130000,130600,', '130602', '新市区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130603, 130600, '0,1,130000,130600,', '130603', '北市区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130604, 130600, '0,1,130000,130600,', '130604', '南市区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130621, 130600, '0,1,130000,130600,', '130621', '满城县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130622, 130600, '0,1,130000,130600,', '130622', '清苑县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130623, 130600, '0,1,130000,130600,', '130623', '涞水县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130624, 130600, '0,1,130000,130600,', '130624', '阜平县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130625, 130600, '0,1,130000,130600,', '130625', '徐水县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130626, 130600, '0,1,130000,130600,', '130626', '定兴县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130627, 130600, '0,1,130000,130600,', '130627', '唐县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130628, 130600, '0,1,130000,130600,', '130628', '高阳县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130629, 130600, '0,1,130000,130600,', '130629', '容城县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130630, 130600, '0,1,130000,130600,', '130630', '涞源县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130631, 130600, '0,1,130000,130600,', '130631', '望都县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130632, 130600, '0,1,130000,130600,', '130632', '安新县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130633, 130600, '0,1,130000,130600,', '130633', '易县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130634, 130600, '0,1,130000,130600,', '130634', '曲阳县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130635, 130600, '0,1,130000,130600,', '130635', '蠡县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130636, 130600, '0,1,130000,130600,', '130636', '顺平县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130637, 130600, '0,1,130000,130600,', '130637', '博野县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130638, 130600, '0,1,130000,130600,', '130638', '雄县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130640, 130600, '0,1,130000,130600,', '130640', '温泉城经济区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130641, 130600, '0,1,130000,130600,', '130641', '高新区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130681, 130600, '0,1,130000,130600,', '130681', '涿州市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130682, 130600, '0,1,130000,130600,', '130682', '定州市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130683, 130600, '0,1,130000,130600,', '130683', '安国市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130684, 130600, '0,1,130000,130600,', '130684', '高碑店市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130700, 130000, '0,1,130000,', '130700', '张家口市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130702, 130700, '0,1,130000,130700,', '130702', '桥东区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130703, 130700, '0,1,130000,130700,', '130703', '桥西区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130705, 130700, '0,1,130000,130700,', '130705', '宣化区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130706, 130700, '0,1,130000,130700,', '130706', '下花园区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130721, 130700, '0,1,130000,130700,', '130721', '宣化县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130722, 130700, '0,1,130000,130700,', '130722', '张北县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130723, 130700, '0,1,130000,130700,', '130723', '康保县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130724, 130700, '0,1,130000,130700,', '130724', '沽源县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130725, 130700, '0,1,130000,130700,', '130725', '尚义县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130726, 130700, '0,1,130000,130700,', '130726', '蔚县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130727, 130700, '0,1,130000,130700,', '130727', '阳原县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130728, 130700, '0,1,130000,130700,', '130728', '怀安县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130729, 130700, '0,1,130000,130700,', '130729', '万全县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130730, 130700, '0,1,130000,130700,', '130730', '怀来县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130731, 130700, '0,1,130000,130700,', '130731', '涿鹿县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130732, 130700, '0,1,130000,130700,', '130732', '赤城县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130733, 130700, '0,1,130000,130700,', '130733', '崇礼县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130740, 130700, '0,1,130000,130700,', '130740', '高新区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130741, 130700, '0,1,130000,130700,', '130741', '察北管理区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130742, 130700, '0,1,130000,130700,', '130742', '塞北管理区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130800, 130000, '0,1,130000,', '130800', '承德市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130802, 130800, '0,1,130000,130800,', '130802', '双桥区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130803, 130800, '0,1,130000,130800,', '130803', '双滦区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130804, 130800, '0,1,130000,130800,', '130804', '鹰手营子矿区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130821, 130800, '0,1,130000,130800,', '130821', '承德县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130822, 130800, '0,1,130000,130800,', '130822', '兴隆县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130823, 130800, '0,1,130000,130800,', '130823', '平泉县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130824, 130800, '0,1,130000,130800,', '130824', '滦平县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130825, 130800, '0,1,130000,130800,', '130825', '隆化县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130826, 130800, '0,1,130000,130800,', '130826', '丰宁满族自治县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130827, 130800, '0,1,130000,130800,', '130827', '宽城满族自治县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130828, 130800, '0,1,130000,130800,', '130828', '围场满族蒙古族自治县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130900, 130000, '0,1,130000,', '130900', '沧州市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130902, 130900, '0,1,130000,130900,', '130902', '新华区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130903, 130900, '0,1,130000,130900,', '130903', '运河区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130921, 130900, '0,1,130000,130900,', '130921', '沧县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130922, 130900, '0,1,130000,130900,', '130922', '青县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130923, 130900, '0,1,130000,130900,', '130923', '东光县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130924, 130900, '0,1,130000,130900,', '130924', '海兴县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130925, 130900, '0,1,130000,130900,', '130925', '盐山县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130926, 130900, '0,1,130000,130900,', '130926', '肃宁县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130927, 130900, '0,1,130000,130900,', '130927', '南皮县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130928, 130900, '0,1,130000,130900,', '130928', '吴桥县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130929, 130900, '0,1,130000,130900,', '130929', '献县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130930, 130900, '0,1,130000,130900,', '130930', '孟村回族自治县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130940, 130900, '0,1,130000,130900,', '130940', '黄骅港开发区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130941, 130900, '0,1,130000,130900,', '130941', '沧州临港经济技术开发区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130942, 130900, '0,1,130000,130900,', '130942', '沧州市南大港管理区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130981, 130900, '0,1,130000,130900,', '130981', '泊头市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130982, 130900, '0,1,130000,130900,', '130982', '任丘市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130983, 130900, '0,1,130000,130900,', '130983', '黄骅市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (130984, 130900, '0,1,130000,130900,', '130984', '河间市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (131000, 130000, '0,1,130000,', '131000', '廊坊市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (131002, 131000, '0,1,130000,131000,', '131002', '安次区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (131003, 131000, '0,1,130000,131000,', '131003', '广阳区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (131022, 131000, '0,1,130000,131000,', '131022', '固安县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (131023, 131000, '0,1,130000,131000,', '131023', '永清县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (131024, 131000, '0,1,130000,131000,', '131024', '香河县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (131025, 131000, '0,1,130000,131000,', '131025', '大城县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (131026, 131000, '0,1,130000,131000,', '131026', '文安县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (131028, 131000, '0,1,130000,131000,', '131028', '大厂回族自治县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (131040, 131000, '0,1,130000,131000,', '131040', '开发区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (131081, 131000, '0,1,130000,131000,', '131081', '霸州市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (131082, 131000, '0,1,130000,131000,', '131082', '三河市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (131100, 130000, '0,1,130000,', '131100', '衡水市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (131102, 131100, '0,1,130000,131100,', '131102', '桃城区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (131121, 131100, '0,1,130000,131100,', '131121', '枣强县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (131122, 131100, '0,1,130000,131100,', '131122', '武邑县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (131123, 131100, '0,1,130000,131100,', '131123', '武强县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (131124, 131100, '0,1,130000,131100,', '131124', '饶阳县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (131125, 131100, '0,1,130000,131100,', '131125', '安平县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (131126, 131100, '0,1,130000,131100,', '131126', '故城县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (131127, 131100, '0,1,130000,131100,', '131127', '景县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (131128, 131100, '0,1,130000,131100,', '131128', '阜城县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (131140, 131100, '0,1,130000,131100,', '131140', '开发区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (131181, 131100, '0,1,130000,131100,', '131181', '冀州市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (131182, 131100, '0,1,130000,131100,', '131182', '深州市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140000, 1, '0,1,', '140000', '山西省', 2, 0, NULL, 1, NULL, NULL, '2020-02-11 12:22:16');
INSERT INTO `sys_area` VALUES (140100, 140000, '0,1,140000,', '140100', '太原市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140105, 140100, '0,1,140000,140100,', '140105', '小店区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140106, 140100, '0,1,140000,140100,', '140106', '迎泽区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140107, 140100, '0,1,140000,140100,', '140107', '杏花岭区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140108, 140100, '0,1,140000,140100,', '140108', '尖草坪区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140109, 140100, '0,1,140000,140100,', '140109', '万柏林区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140110, 140100, '0,1,140000,140100,', '140110', '晋源区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140121, 140100, '0,1,140000,140100,', '140121', '清徐县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140122, 140100, '0,1,140000,140100,', '140122', '阳曲县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140123, 140100, '0,1,140000,140100,', '140123', '娄烦县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140181, 140100, '0,1,140000,140100,', '140181', '古交市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140200, 140000, '0,1,140000,', '140200', '大同市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140202, 140200, '0,1,140000,140200,', '140202', '城区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140203, 140200, '0,1,140000,140200,', '140203', '矿区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140211, 140200, '0,1,140000,140200,', '140211', '南郊区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140212, 140200, '0,1,140000,140200,', '140212', '新荣区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140221, 140200, '0,1,140000,140200,', '140221', '阳高县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140222, 140200, '0,1,140000,140200,', '140222', '天镇县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140223, 140200, '0,1,140000,140200,', '140223', '广灵县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140224, 140200, '0,1,140000,140200,', '140224', '灵丘县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140225, 140200, '0,1,140000,140200,', '140225', '浑源县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140226, 140200, '0,1,140000,140200,', '140226', '左云县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140227, 140200, '0,1,140000,140200,', '140227', '大同县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140240, 140200, '0,1,140000,140200,', '140240', '开发区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140300, 140000, '0,1,140000,', '140300', '阳泉市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140302, 140300, '0,1,140000,140300,', '140302', '城区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140303, 140300, '0,1,140000,140300,', '140303', '矿区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140311, 140300, '0,1,140000,140300,', '140311', '郊区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140321, 140300, '0,1,140000,140300,', '140321', '平定县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140322, 140300, '0,1,140000,140300,', '140322', '盂县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140340, 140300, '0,1,140000,140300,', '140340', '开发区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140400, 140000, '0,1,140000,', '140400', '长治市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140402, 140400, '0,1,140000,140400,', '140402', '城区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140411, 140400, '0,1,140000,140400,', '140411', '郊区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140421, 140400, '0,1,140000,140400,', '140421', '长治县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140423, 140400, '0,1,140000,140400,', '140423', '襄垣县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140424, 140400, '0,1,140000,140400,', '140424', '屯留县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140425, 140400, '0,1,140000,140400,', '140425', '平顺县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140426, 140400, '0,1,140000,140400,', '140426', '黎城县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140427, 140400, '0,1,140000,140400,', '140427', '壶关县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140428, 140400, '0,1,140000,140400,', '140428', '长子县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140429, 140400, '0,1,140000,140400,', '140429', '武乡县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140430, 140400, '0,1,140000,140400,', '140430', '沁县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140431, 140400, '0,1,140000,140400,', '140431', '沁源县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140481, 140400, '0,1,140000,140400,', '140481', '潞城市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140500, 140000, '0,1,140000,', '140500', '晋城市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140502, 140500, '0,1,140000,140500,', '140502', '城区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140521, 140500, '0,1,140000,140500,', '140521', '沁水县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140522, 140500, '0,1,140000,140500,', '140522', '阳城县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140524, 140500, '0,1,140000,140500,', '140524', '陵川县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140525, 140500, '0,1,140000,140500,', '140525', '泽州县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140581, 140500, '0,1,140000,140500,', '140581', '高平市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140600, 140000, '0,1,140000,', '140600', '朔州市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140602, 140600, '0,1,140000,140600,', '140602', '朔城区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140603, 140600, '0,1,140000,140600,', '140603', '平鲁区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140621, 140600, '0,1,140000,140600,', '140621', '山阴县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140622, 140600, '0,1,140000,140600,', '140622', '应县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140623, 140600, '0,1,140000,140600,', '140623', '右玉县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140624, 140600, '0,1,140000,140600,', '140624', '怀仁县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140700, 140000, '0,1,140000,', '140700', '晋中市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140702, 140700, '0,1,140000,140700,', '140702', '榆次区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140721, 140700, '0,1,140000,140700,', '140721', '榆社县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140722, 140700, '0,1,140000,140700,', '140722', '左权县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140723, 140700, '0,1,140000,140700,', '140723', '和顺县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140724, 140700, '0,1,140000,140700,', '140724', '昔阳县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140725, 140700, '0,1,140000,140700,', '140725', '寿阳县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140726, 140700, '0,1,140000,140700,', '140726', '太谷县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140727, 140700, '0,1,140000,140700,', '140727', '祁县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140728, 140700, '0,1,140000,140700,', '140728', '平遥县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140729, 140700, '0,1,140000,140700,', '140729', '灵石县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140781, 140700, '0,1,140000,140700,', '140781', '介休市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140800, 140000, '0,1,140000,', '140800', '运城市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140802, 140800, '0,1,140000,140800,', '140802', '盐湖区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140821, 140800, '0,1,140000,140800,', '140821', '临猗县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140822, 140800, '0,1,140000,140800,', '140822', '万荣县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140823, 140800, '0,1,140000,140800,', '140823', '闻喜县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140824, 140800, '0,1,140000,140800,', '140824', '稷山县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140825, 140800, '0,1,140000,140800,', '140825', '新绛县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140826, 140800, '0,1,140000,140800,', '140826', '绛县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140827, 140800, '0,1,140000,140800,', '140827', '垣曲县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140828, 140800, '0,1,140000,140800,', '140828', '夏县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140829, 140800, '0,1,140000,140800,', '140829', '平陆县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140830, 140800, '0,1,140000,140800,', '140830', '芮城县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140881, 140800, '0,1,140000,140800,', '140881', '永济市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140882, 140800, '0,1,140000,140800,', '140882', '河津市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140900, 140000, '0,1,140000,', '140900', '忻州市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140902, 140900, '0,1,140000,140900,', '140902', '忻府区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140921, 140900, '0,1,140000,140900,', '140921', '定襄县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140922, 140900, '0,1,140000,140900,', '140922', '五台县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140923, 140900, '0,1,140000,140900,', '140923', '代县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140924, 140900, '0,1,140000,140900,', '140924', '繁峙县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140925, 140900, '0,1,140000,140900,', '140925', '宁武县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140926, 140900, '0,1,140000,140900,', '140926', '静乐县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140927, 140900, '0,1,140000,140900,', '140927', '神池县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140928, 140900, '0,1,140000,140900,', '140928', '五寨县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140929, 140900, '0,1,140000,140900,', '140929', '岢岚县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140930, 140900, '0,1,140000,140900,', '140930', '河曲县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140931, 140900, '0,1,140000,140900,', '140931', '保德县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140932, 140900, '0,1,140000,140900,', '140932', '偏关县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (140981, 140900, '0,1,140000,140900,', '140981', '原平市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (141000, 140000, '0,1,140000,', '141000', '临汾市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (141002, 141000, '0,1,140000,141000,', '141002', '尧都区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (141021, 141000, '0,1,140000,141000,', '141021', '曲沃县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (141022, 141000, '0,1,140000,141000,', '141022', '翼城县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (141023, 141000, '0,1,140000,141000,', '141023', '襄汾县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (141024, 141000, '0,1,140000,141000,', '141024', '洪洞县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (141025, 141000, '0,1,140000,141000,', '141025', '古县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (141026, 141000, '0,1,140000,141000,', '141026', '安泽县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (141027, 141000, '0,1,140000,141000,', '141027', '浮山县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (141028, 141000, '0,1,140000,141000,', '141028', '吉县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (141029, 141000, '0,1,140000,141000,', '141029', '乡宁县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (141030, 141000, '0,1,140000,141000,', '141030', '大宁县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (141031, 141000, '0,1,140000,141000,', '141031', '隰县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (141032, 141000, '0,1,140000,141000,', '141032', '永和县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (141033, 141000, '0,1,140000,141000,', '141033', '蒲县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (141034, 141000, '0,1,140000,141000,', '141034', '汾西县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (141081, 141000, '0,1,140000,141000,', '141081', '侯马市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (141082, 141000, '0,1,140000,141000,', '141082', '霍州市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (141100, 140000, '0,1,140000,', '141100', '吕梁市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (141102, 141100, '0,1,140000,141100,', '141102', '离石区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (141121, 141100, '0,1,140000,141100,', '141121', '文水县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (141122, 141100, '0,1,140000,141100,', '141122', '交城县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (141123, 141100, '0,1,140000,141100,', '141123', '兴县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (141124, 141100, '0,1,140000,141100,', '141124', '临县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (141125, 141100, '0,1,140000,141100,', '141125', '柳林县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (141126, 141100, '0,1,140000,141100,', '141126', '石楼县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (141127, 141100, '0,1,140000,141100,', '141127', '岚县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (141128, 141100, '0,1,140000,141100,', '141128', '方山县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (141129, 141100, '0,1,140000,141100,', '141129', '中阳县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (141130, 141100, '0,1,140000,141100,', '141130', '交口县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (141181, 141100, '0,1,140000,141100,', '141181', '孝义市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (141182, 141100, '0,1,140000,141100,', '141182', '汾阳市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (142640, 140400, '0,1,140000,140400,', '142640', '开发区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150000, 1, '0,1,', '150000', '内蒙古自治区', 2, 0, NULL, 1, NULL, NULL, '2020-02-11 02:36:49');
INSERT INTO `sys_area` VALUES (150100, 150000, '0,1,150000,', '150100', '呼和浩特市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150102, 150100, '0,1,150000,150100,', '150102', '新城区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150103, 150100, '0,1,150000,150100,', '150103', '回民区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150104, 150100, '0,1,150000,150100,', '150104', '玉泉区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150105, 150100, '0,1,150000,150100,', '150105', '赛罕区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150121, 150100, '0,1,150000,150100,', '150121', '土默特左旗', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150122, 150100, '0,1,150000,150100,', '150122', '托克托县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150123, 150100, '0,1,150000,150100,', '150123', '和林格尔县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150124, 150100, '0,1,150000,150100,', '150124', '清水河县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150125, 150100, '0,1,150000,150100,', '150125', '武川县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150200, 150000, '0,1,150000,', '150200', '包头市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150202, 150200, '0,1,150000,150200,', '150202', '东河区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150203, 150200, '0,1,150000,150200,', '150203', '昆都仑区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150204, 150200, '0,1,150000,150200,', '150204', '青山区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150205, 150200, '0,1,150000,150200,', '150205', '石拐区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150206, 150200, '0,1,150000,150200,', '150206', '白云矿区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150207, 150200, '0,1,150000,150200,', '150207', '九原区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150221, 150200, '0,1,150000,150200,', '150221', '土默特右旗', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150222, 150200, '0,1,150000,150200,', '150222', '固阳县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150223, 150200, '0,1,150000,150200,', '150223', '达尔罕茂明安联合旗', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150240, 150200, '0,1,150000,150200,', '150240', '稀土高新技术产业开发区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150300, 150000, '0,1,150000,', '150300', '乌海市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150302, 150300, '0,1,150000,150300,', '150302', '海勃湾区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150303, 150300, '0,1,150000,150300,', '150303', '海南区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150304, 150300, '0,1,150000,150300,', '150304', '乌达区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150400, 150000, '0,1,150000,', '150400', '赤峰市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150402, 150400, '0,1,150000,150400,', '150402', '红山区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150403, 150400, '0,1,150000,150400,', '150403', '元宝山区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150404, 150400, '0,1,150000,150400,', '150404', '松山区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150421, 150400, '0,1,150000,150400,', '150421', '阿鲁科尔沁旗', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150422, 150400, '0,1,150000,150400,', '150422', '巴林左旗', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150423, 150400, '0,1,150000,150400,', '150423', '巴林右旗', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150424, 150400, '0,1,150000,150400,', '150424', '林西县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150425, 150400, '0,1,150000,150400,', '150425', '克什克腾旗', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150426, 150400, '0,1,150000,150400,', '150426', '翁牛特旗', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150428, 150400, '0,1,150000,150400,', '150428', '喀喇沁旗', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150429, 150400, '0,1,150000,150400,', '150429', '宁城县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150430, 150400, '0,1,150000,150400,', '150430', '敖汉旗', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150500, 150000, '0,1,150000,', '150500', '通辽市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150502, 150500, '0,1,150000,150500,', '150502', '科尔沁区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150521, 150500, '0,1,150000,150500,', '150521', '科尔沁左翼中旗', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150522, 150500, '0,1,150000,150500,', '150522', '科尔沁左翼后旗', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150523, 150500, '0,1,150000,150500,', '150523', '开鲁县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150524, 150500, '0,1,150000,150500,', '150524', '库伦旗', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150525, 150500, '0,1,150000,150500,', '150525', '奈曼旗', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150526, 150500, '0,1,150000,150500,', '150526', '扎鲁特旗', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150581, 150500, '0,1,150000,150500,', '150581', '霍林郭勒市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150600, 150000, '0,1,150000,', '150600', '鄂尔多斯市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150602, 150600, '0,1,150000,150600,', '150602', '东胜区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150621, 150600, '0,1,150000,150600,', '150621', '达拉特旗', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150622, 150600, '0,1,150000,150600,', '150622', '准格尔旗', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150623, 150600, '0,1,150000,150600,', '150623', '鄂托克前旗', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150624, 150600, '0,1,150000,150600,', '150624', '鄂托克旗', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150625, 150600, '0,1,150000,150600,', '150625', '杭锦旗', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150626, 150600, '0,1,150000,150600,', '150626', '乌审旗', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150627, 150600, '0,1,150000,150600,', '150627', '伊金霍洛旗', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150640, 150600, '0,1,150000,150600,', '150640', '康巴什新区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150700, 150000, '0,1,150000,', '150700', '呼伦贝尔市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150702, 150700, '0,1,150000,150700,', '150702', '海拉尔区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150721, 150700, '0,1,150000,150700,', '150721', '阿荣旗', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150722, 150700, '0,1,150000,150700,', '150722', '莫力达瓦达斡尔族自治旗', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150723, 150700, '0,1,150000,150700,', '150723', '鄂伦春自治旗', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150724, 150700, '0,1,150000,150700,', '150724', '鄂温克族自治旗', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150725, 150700, '0,1,150000,150700,', '150725', '陈巴尔虎旗', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150726, 150700, '0,1,150000,150700,', '150726', '新巴尔虎左旗', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150727, 150700, '0,1,150000,150700,', '150727', '新巴尔虎右旗', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150740, 150700, '0,1,150000,150700,', '150740', '海拉尔农牧场', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150741, 150700, '0,1,150000,150700,', '150741', '大兴安岭农牧场', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150781, 150700, '0,1,150000,150700,', '150781', '满洲里市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150782, 150700, '0,1,150000,150700,', '150782', '牙克石市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150783, 150700, '0,1,150000,150700,', '150783', '扎兰屯市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150784, 150700, '0,1,150000,150700,', '150784', '额尔古纳市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150785, 150700, '0,1,150000,150700,', '150785', '根河市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150800, 150000, '0,1,150000,', '150800', '巴彦淖尔市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150802, 150800, '0,1,150000,150800,', '150802', '临河区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150821, 150800, '0,1,150000,150800,', '150821', '五原县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150822, 150800, '0,1,150000,150800,', '150822', '磴口县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150823, 150800, '0,1,150000,150800,', '150823', '乌拉特前旗', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150824, 150800, '0,1,150000,150800,', '150824', '乌拉特中旗', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150825, 150800, '0,1,150000,150800,', '150825', '乌拉特后旗', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150826, 150800, '0,1,150000,150800,', '150826', '杭锦后旗', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150900, 150000, '0,1,150000,', '150900', '乌兰察布市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150902, 150900, '0,1,150000,150900,', '150902', '集宁区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150921, 150900, '0,1,150000,150900,', '150921', '卓资县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150922, 150900, '0,1,150000,150900,', '150922', '化德县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150923, 150900, '0,1,150000,150900,', '150923', '商都县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150924, 150900, '0,1,150000,150900,', '150924', '兴和县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150925, 150900, '0,1,150000,150900,', '150925', '凉城县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150926, 150900, '0,1,150000,150900,', '150926', '察哈尔右翼前旗', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150927, 150900, '0,1,150000,150900,', '150927', '察哈尔右翼中旗', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150928, 150900, '0,1,150000,150900,', '150928', '察哈尔右翼后旗', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150929, 150900, '0,1,150000,150900,', '150929', '四子王旗', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (150981, 150900, '0,1,150000,150900,', '150981', '丰镇市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (152200, 150900, '0,1,150000,150900,', '152200', '兴安盟', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (152201, 150900, '0,1,150000,150900,', '152201', '乌兰浩特市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (152202, 150900, '0,1,150000,150900,', '152202', '阿尔山市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (152221, 150900, '0,1,150000,150900,', '152221', '科尔沁右翼前旗', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (152222, 150900, '0,1,150000,150900,', '152222', '科尔沁右翼中旗', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (152223, 150900, '0,1,150000,150900,', '152223', '扎赉特旗', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (152224, 150900, '0,1,150000,150900,', '152224', '突泉县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (152500, 150000, '0,1,150000,', '152500', '锡林郭勒盟', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (152501, 152500, '0,1,150000,152500,', '152501', '二连浩特市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (152502, 152500, '0,1,150000,152500,', '152502', '锡林浩特市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (152522, 152500, '0,1,150000,152500,', '152522', '阿巴嘎旗', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (152523, 152500, '0,1,150000,152500,', '152523', '苏尼特左旗', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (152524, 152500, '0,1,150000,152500,', '152524', '苏尼特右旗', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (152525, 152500, '0,1,150000,152500,', '152525', '东乌珠穆沁旗', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (152526, 152500, '0,1,150000,152500,', '152526', '西乌珠穆沁旗', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (152527, 152500, '0,1,150000,152500,', '152527', '太仆寺旗', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (152528, 152500, '0,1,150000,152500,', '152528', '镶黄旗', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (152529, 152500, '0,1,150000,152500,', '152529', '正镶白旗', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (152530, 152500, '0,1,150000,152500,', '152530', '正蓝旗', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (152531, 152500, '0,1,150000,152500,', '152531', '多伦县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (152540, 152500, '0,1,150000,152500,', '152540', '乌拉盖开发区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (152900, 150000, '0,1,150000,', '152900', '阿拉善盟', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (152921, 152900, '0,1,150000,152900,', '152921', '阿拉善左旗', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (152922, 152900, '0,1,150000,152900,', '152922', '阿拉善右旗', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (152923, 152900, '0,1,150000,152900,', '152923', '额济纳旗', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (152940, 152900, '0,1,150000,152900,', '152940', '阿拉善经济开发区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (153000, 150000, '0,1,150000,', '153000', '满洲里市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (153100, 150000, '0,1,150000,', '153100', '二连浩特市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210000, 1, '0,1,', '210000', '辽宁省', 2, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210100, 210000, '0,1,210000,', '210100', '沈阳市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210102, 210100, '0,1,210000,210100,', '210102', '和平区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210103, 210100, '0,1,210000,210100,', '210103', '沈河区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210104, 210100, '0,1,210000,210100,', '210104', '大东区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210105, 210100, '0,1,210000,210100,', '210105', '皇姑区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210106, 210100, '0,1,210000,210100,', '210106', '铁西区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210111, 210100, '0,1,210000,210100,', '210111', '苏家屯区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210112, 210100, '0,1,210000,210100,', '210112', '东陵区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210113, 210100, '0,1,210000,210100,', '210113', '沈北新区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210114, 210100, '0,1,210000,210100,', '210114', '于洪区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210122, 210100, '0,1,210000,210100,', '210122', '辽中县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210123, 210100, '0,1,210000,210100,', '210123', '康平县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210124, 210100, '0,1,210000,210100,', '210124', '法库县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210140, 210100, '0,1,210000,210100,', '210140', '经济技术开发区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210141, 210100, '0,1,210000,210100,', '210141', '浑南新区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210142, 210100, '0,1,210000,210100,', '210142', '棋盘山', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210143, 210100, '0,1,210000,210100,', '210143', '蒲河新城', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210181, 210100, '0,1,210000,210100,', '210181', '新民市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210200, 210000, '0,1,210000,', '210200', '大连市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210202, 210200, '0,1,210000,210200,', '210202', '中山区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210203, 210200, '0,1,210000,210200,', '210203', '西岗区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210204, 210200, '0,1,210000,210200,', '210204', '沙河口区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210211, 210200, '0,1,210000,210200,', '210211', '甘井子区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210212, 210200, '0,1,210000,210200,', '210212', '旅顺口区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210213, 210200, '0,1,210000,210200,', '210213', '金州区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210224, 210200, '0,1,210000,210200,', '210224', '长海县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210240, 210200, '0,1,210000,210200,', '210240', '开发区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210241, 210200, '0,1,210000,210200,', '210241', '保税区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210242, 210200, '0,1,210000,210200,', '210242', '工业区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210281, 210200, '0,1,210000,210200,', '210281', '瓦房店市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210282, 210200, '0,1,210000,210200,', '210282', '普兰店市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210283, 210200, '0,1,210000,210200,', '210283', '庄河市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210300, 210000, '0,1,210000,', '210300', '鞍山市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210302, 210300, '0,1,210000,210300,', '210302', '铁东区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210303, 210300, '0,1,210000,210300,', '210303', '铁西区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210304, 210300, '0,1,210000,210300,', '210304', '立山区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210311, 210300, '0,1,210000,210300,', '210311', '千山区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210321, 210300, '0,1,210000,210300,', '210321', '台安县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210323, 210300, '0,1,210000,210300,', '210323', '岫岩满族自治县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210381, 210300, '0,1,210000,210300,', '210381', '海城市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210400, 210000, '0,1,210000,', '210400', '抚顺市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210402, 210400, '0,1,210000,210400,', '210402', '新抚区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210403, 210400, '0,1,210000,210400,', '210403', '东洲区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210404, 210400, '0,1,210000,210400,', '210404', '望花区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210411, 210400, '0,1,210000,210400,', '210411', '顺城区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210421, 210400, '0,1,210000,210400,', '210421', '抚顺县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210422, 210400, '0,1,210000,210400,', '210422', '新宾满族自治县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210423, 210400, '0,1,210000,210400,', '210423', '清原满族自治县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210440, 210400, '0,1,210000,210400,', '210440', '李石开发区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210500, 210000, '0,1,210000,', '210500', '本溪市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210502, 210500, '0,1,210000,210500,', '210502', '平山区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210503, 210500, '0,1,210000,210400,', '210503', '溪湖区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210504, 210500, '0,1,210000,210400,', '210504', '明山区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210505, 210500, '0,1,210000,210400,', '210505', '南芬区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210521, 210500, '0,1,210000,210400,', '210521', '本溪满族自治县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210522, 210500, '0,1,210000,210400,', '210522', '桓仁满族自治县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210600, 210000, '0,1,210000,', '210600', '丹东市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210602, 210600, '0,1,210000,210600,', '210602', '元宝区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210603, 210600, '0,1,210000,210600,', '210603', '振兴区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210604, 210600, '0,1,210000,210600,', '210604', '振安区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210624, 210600, '0,1,210000,210600,', '210624', '宽甸满族自治县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210681, 210600, '0,1,210000,210600,', '210681', '东港市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210682, 210600, '0,1,210000,210600,', '210682', '凤城市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210700, 210000, '0,1,210000,', '210700', '锦州市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210702, 210700, '0,1,210000,210700,', '210702', '古塔区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210703, 210700, '0,1,210000,210700,', '210703', '凌河区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210711, 210700, '0,1,210000,210700,', '210711', '太和区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210726, 210700, '0,1,210000,210700,', '210726', '黑山县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210727, 210700, '0,1,210000,210700,', '210727', '义县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210740, 210700, '0,1,210000,210700,', '210740', '开发区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210741, 210700, '0,1,210000,210700,', '210741', '松山新区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210781, 210700, '0,1,210000,210700,', '210781', '凌海市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210782, 210700, '0,1,210000,210700,', '210782', '北镇市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210800, 210000, '0,1,210000,', '210800', '营口市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210802, 210800, '0,1,210000,210800,', '210802', '站前区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210803, 210800, '0,1,210000,210800,', '210803', '西市区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210804, 210800, '0,1,210000,210800,', '210804', '鲅鱼圈区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210811, 210800, '0,1,210000,210800,', '210811', '老边区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210840, 210800, '0,1,210000,210800,', '210840', '建筑企业', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210881, 210800, '0,1,210000,210800,', '210881', '盖州市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210882, 210800, '0,1,210000,210800,', '210882', '大石桥市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210900, 210000, '0,1,210000,', '210900', '阜新市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210902, 210900, '0,1,210000,210900,', '210902', '海州区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210903, 210900, '0,1,210000,210900,', '210903', '新邱区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210904, 210900, '0,1,210000,210900,', '210904', '太平区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210905, 210900, '0,1,210000,210900,', '210905', '清河门区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210911, 210900, '0,1,210000,210900,', '210911', '细河区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210921, 210900, '0,1,210000,210900,', '210921', '蒙古族自治县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210922, 210900, '0,1,210000,210900,', '210922', '彰武县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210940, 210900, '0,1,210000,210900,', '210940', '开发区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210941, 210900, '0,1,210000,210900,', '210941', '矿区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (210942, 210900, '0,1,210000,210900,', '210942', '高新区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (211000, 210000, '0,1,210000,', '211000', '辽阳市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (211002, 211000, '0,1,210000,211000,', '211002', '白塔区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (211003, 211000, '0,1,210000,211000,', '211003', '文圣区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (211004, 211000, '0,1,210000,211000,', '211004', '宏伟区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (211005, 211000, '0,1,210000,211000,', '211005', '弓长岭区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (211011, 211000, '0,1,210000,211000,', '211011', '太子河区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (211021, 211000, '0,1,210000,211000,', '211021', '辽阳县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (211081, 211000, '0,1,210000,211000,', '211081', '灯塔市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (211100, 210000, '0,1,210000,', '211100', '盘锦市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (211102, 211100, '0,1,210000,211100,', '211102', '双台子区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (211103, 211100, '0,1,210000,211100,', '211103', '兴隆台区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (211121, 211100, '0,1,210000,211100,', '211121', '大洼县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (211122, 211100, '0,1,210000,211100,', '211122', '盘山县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (211200, 210000, '0,1,210000,', '211200', '铁岭市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (211202, 211200, '0,1,210000,211200,', '211202', '银州区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (211204, 211200, '0,1,210000,211200,', '211204', '清河区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (211221, 211200, '0,1,210000,211200,', '211221', '铁岭县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (211223, 211200, '0,1,210000,211200,', '211223', '西丰县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (211224, 211200, '0,1,210000,211200,', '211224', '昌图县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (211281, 211200, '0,1,210000,211200,', '211281', '调兵山市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (211282, 211200, '0,1,210000,211200,', '211282', '开原市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (211300, 210000, '0,1,210000,', '211300', '朝阳市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (211302, 211300, '0,1,210000,211300,', '211302', '双塔区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (211303, 211300, '0,1,210000,211300,', '211303', '龙城区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (211321, 211300, '0,1,210000,211300,', '211321', '朝阳县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (211322, 211300, '0,1,210000,211300,', '211322', '建平县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (211324, 211300, '0,1,210000,211300,', '211324', '喀喇沁左翼蒙古族自治县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (211381, 211300, '0,1,210000,211300,', '211381', '北票市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (211382, 211300, '0,1,210000,211300,', '211382', '凌源市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (211400, 210000, '0,1,210000,', '211400', '葫芦岛市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (211402, 211400, '0,1,210000,211400,', '211402', '连山区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (211403, 211400, '0,1,210000,211400,', '211403', '龙港区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (211404, 211400, '0,1,210000,211400,', '211404', '南票区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (211421, 211400, '0,1,210000,211400,', '211421', '绥中县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (211422, 211400, '0,1,210000,211400,', '211422', '建昌县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (211481, 211400, '0,1,210000,211400,', '211481', '兴城市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (220000, 1, '0,1,', '220000', '吉林省', 2, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (220100, 220000, '0,1,220000,', '220100', '长春市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (220102, 220100, '0,1,220000,220100,', '220102', '南关区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (220103, 220100, '0,1,220000,220100,', '220103', '宽城区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (220104, 220100, '0,1,220000,220100,', '220104', '朝阳区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (220105, 220100, '0,1,220000,220100,', '220105', '二道区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (220106, 220100, '0,1,220000,220100,', '220106', '绿园区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (220112, 220100, '0,1,220000,220100,', '220112', '双阳区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (220122, 220100, '0,1,220000,220100,', '220122', '农安县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (220140, 220100, '0,1,220000,220100,', '220140', '开发区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (220181, 220100, '0,1,220000,220100,', '220181', '九台市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (220182, 220100, '0,1,220000,220100,', '220182', '榆树市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (220183, 220100, '0,1,220000,220100,', '220183', '德惠市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (220200, 220000, '0,1,220000,', '220200', '吉林市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (220202, 220200, '0,1,220000,220200,', '220202', '昌邑区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (220203, 220200, '0,1,220000,220200,', '220203', '龙潭区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (220204, 220200, '0,1,220000,220200,', '220204', '船营区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (220211, 220200, '0,1,220000,220200,', '220211', '丰满区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (220221, 220200, '0,1,220000,220200,', '220221', '永吉县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (220281, 220200, '0,1,220000,220200,', '220281', '蛟河市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (220282, 220200, '0,1,220000,220200,', '220282', '桦甸市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (220283, 220200, '0,1,220000,220200,', '220283', '舒兰市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (220284, 220200, '0,1,220000,220200,', '220284', '磐石市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (220300, 220000, '0,1,220000,', '220300', '四平市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (220302, 220300, '0,1,220000,220300,', '220302', '铁西区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (220303, 220300, '0,1,220000,220300,', '220303', '铁东区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (220322, 220300, '0,1,220000,220300,', '220322', '梨树县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (220323, 220300, '0,1,220000,220300,', '220323', '伊通满族自治县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (220381, 220300, '0,1,220000,220300,', '220381', '公主岭市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (220382, 220300, '0,1,220000,220300,', '220382', '双辽市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (220400, 220000, '0,1,220000,', '220400', '辽源市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (220402, 220400, '0,1,220000,220400,', '220402', '龙山区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (220403, 220400, '0,1,220000,220400,', '220403', '西安区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (220421, 220400, '0,1,220000,220400,', '220421', '东丰县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (220422, 220400, '0,1,220000,220400,', '220422', '东辽县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (220500, 220000, '0,1,220000,', '220500', '通化市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (220502, 220500, '0,1,220000,220500,', '220502', '东昌区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (220503, 220500, '0,1,220000,220500,', '220503', '二道江区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (220521, 220500, '0,1,220000,220500,', '220521', '通化县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (220523, 220500, '0,1,220000,220500,', '220523', '辉南县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (220524, 220500, '0,1,220000,220500,', '220524', '柳河县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (220581, 220500, '0,1,220000,220500,', '220581', '梅河口市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (220582, 220500, '0,1,220000,220500,', '220582', '集安市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (220600, 220000, '0,1,220000,', '220600', '白山市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (220602, 220600, '0,1,220000,220600,', '220602', '八道江区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (220605, 220600, '0,1,220000,220600,', '220605', '江源区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (220621, 220600, '0,1,220000,220600,', '220621', '抚松县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (220622, 220600, '0,1,220000,220600,', '220622', '靖宇县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (220623, 220600, '0,1,220000,220600,', '220623', '长白朝鲜族自治县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (220681, 220600, '0,1,220000,220600,', '220681', '临江市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (220700, 220000, '0,1,220000,', '220700', '松原市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (220702, 220700, '0,1,220000,220700,', '220702', '宁江区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (220721, 220700, '0,1,220000,220700,', '220721', '前郭尔罗斯蒙古族自治县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (220722, 220700, '0,1,220000,220700,', '220722', '长岭县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (220723, 220700, '0,1,220000,220700,', '220723', '乾安县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (220724, 220700, '0,1,220000,220700,', '220724', '扶余县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (220800, 220000, '0,1,220000,', '220800', '白城市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (220802, 220800, '0,1,220000,220800,', '220802', '洮北区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (220821, 220800, '0,1,220000,220800,', '220821', '镇赉县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (220822, 220800, '0,1,220000,220800,', '220822', '通榆县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (220881, 220800, '0,1,220000,220800,', '220881', '洮南市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (220882, 220800, '0,1,220000,220800,', '220882', '大安市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (222200, 220000, '0,1,220000,', '222200', '长白山管委会', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (222400, 220000, '0,1,220000,', '222400', '延边朝鲜族自治州', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (222401, 222400, '0,1,220000,222400,', '222401', '延吉市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (222402, 222400, '0,1,220000,222400,', '222402', '图们市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (222403, 222400, '0,1,220000,222400,', '222403', '敦化市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (222404, 222400, '0,1,220000,222400,', '222404', '珲春市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (222405, 222400, '0,1,220000,222400,', '222405', '龙井市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (222406, 222400, '0,1,220000,222400,', '222406', '和龙市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (222424, 222400, '0,1,220000,222400,', '222424', '汪清县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (222426, 222400, '0,1,220000,222400,', '222426', '安图县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230000, 1, '0,1,', '230000', '黑龙江省', 2, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230100, 230000, '0,1,230000,', '230100', '哈尔滨市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230102, 230100, '0,1,230000,230100,', '230102', '道里区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230103, 230100, '0,1,230000,230100,', '230103', '南岗区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230104, 230100, '0,1,230000,230100,', '230104', '道外区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230108, 230100, '0,1,230000,230100,', '230108', '平房区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230109, 230100, '0,1,230000,230100,', '230109', '松北区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230110, 230100, '0,1,230000,230100,', '230110', '香坊区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230111, 230100, '0,1,230000,230100,', '230111', '呼兰区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230112, 230100, '0,1,230000,230100,', '230112', '阿城区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230123, 230100, '0,1,230000,230100,', '230123', '依兰县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230124, 230100, '0,1,230000,230100,', '230124', '方正县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230125, 230100, '0,1,230000,230100,', '230125', '宾县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230126, 230100, '0,1,230000,230100,', '230126', '巴彦县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230127, 230100, '0,1,230000,230100,', '230127', '木兰县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230128, 230100, '0,1,230000,230100,', '230128', '通河县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230129, 230100, '0,1,230000,230100,', '230129', '延寿县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230182, 230100, '0,1,230000,230100,', '230182', '双城市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230183, 230100, '0,1,230000,230100,', '230183', '尚志市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230184, 230100, '0,1,230000,230100,', '230184', '五常市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230200, 230000, '0,1,230000,', '230200', '齐齐哈尔市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230202, 230200, '0,1,230000,230200,', '230202', '龙沙区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230203, 230200, '0,1,230000,230200,', '230203', '建华区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230204, 230200, '0,1,230000,230200,', '230204', '铁锋区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230205, 230200, '0,1,230000,230200,', '230205', '昂昂溪区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230206, 230200, '0,1,230000,230200,', '230206', '富拉尔基区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230207, 230200, '0,1,230000,230200,', '230207', '碾子山区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230208, 230200, '0,1,230000,230200,', '230208', '梅里斯达斡尔族区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230221, 230200, '0,1,230000,230200,', '230221', '龙江县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230223, 230200, '0,1,230000,230200,', '230223', '依安县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230224, 230200, '0,1,230000,230200,', '230224', '泰来县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230225, 230200, '0,1,230000,230200,', '230225', '甘南县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230227, 230200, '0,1,230000,230200,', '230227', '富裕县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230229, 230200, '0,1,230000,230200,', '230229', '克山县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230230, 230200, '0,1,230000,230200,', '230230', '克东县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230231, 230200, '0,1,230000,230200,', '230231', '拜泉县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230281, 230200, '0,1,230000,230200,', '230281', '讷河市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230300, 230000, '0,1,230000,', '230300', '鸡西市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230302, 230300, '0,1,230000,230300,', '230302', '鸡冠区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230303, 230300, '0,1,230000,230300,', '230303', '恒山区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230304, 230300, '0,1,230000,230300,', '230304', '滴道区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230305, 230300, '0,1,230000,230300,', '230305', '梨树区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230306, 230300, '0,1,230000,230300,', '230306', '城子河区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230307, 230300, '0,1,230000,230300,', '230307', '麻山区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230321, 230300, '0,1,230000,230300,', '230321', '鸡东县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230381, 230300, '0,1,230000,230300,', '230381', '虎林市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230382, 230300, '0,1,230000,230300,', '230382', '密山市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230400, 230000, '0,1,230000,', '230400', '鹤岗市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230402, 230400, '0,1,230000,230400,', '230402', '向阳区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230403, 230400, '0,1,230000,230400,', '230403', '工农区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230404, 230400, '0,1,230000,230400,', '230404', '南山区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230405, 230400, '0,1,230000,230400,', '230405', '兴安区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230406, 230400, '0,1,230000,230400,', '230406', '东山区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230407, 230400, '0,1,230000,230400,', '230407', '兴山区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230421, 230400, '0,1,230000,230400,', '230421', '萝北县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230422, 230400, '0,1,230000,230400,', '230422', '绥滨县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230500, 230000, '0,1,230000,', '230500', '双鸭山市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230502, 230500, '0,1,230000,230500,', '230502', '尖山区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230503, 230500, '0,1,230000,230500,', '230503', '岭东区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230505, 230500, '0,1,230000,230500,', '230505', '四方台区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230506, 230500, '0,1,230000,230500,', '230506', '宝山区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230521, 230500, '0,1,230000,230500,', '230521', '集贤县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230522, 230500, '0,1,230000,230500,', '230522', '友谊县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230523, 230500, '0,1,230000,230500,', '230523', '宝清县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230524, 230500, '0,1,230000,230500,', '230524', '饶河县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230600, 230000, '0,1,230000,', '230600', '大庆市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230602, 230600, '0,1,230000,230600,', '230602', '萨尔图区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230603, 230600, '0,1,230000,230600,', '230603', '龙凤区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230604, 230600, '0,1,230000,230600,', '230604', '让胡路区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230605, 230600, '0,1,230000,230600,', '230605', '红岗区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230606, 230600, '0,1,230000,230600,', '230606', '大同区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230621, 230600, '0,1,230000,230600,', '230621', '肇州县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230622, 230600, '0,1,230000,230600,', '230622', '肇源县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230623, 230600, '0,1,230000,230600,', '230623', '林甸县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230624, 230600, '0,1,230000,230600,', '230624', '杜尔伯特蒙古族自治县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230700, 230000, '0,1,230000,', '230700', '伊春市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230702, 230700, '0,1,230000,230700,', '230702', '伊春区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230703, 230700, '0,1,230000,230700,', '230703', '南岔区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230704, 230700, '0,1,230000,230700,', '230704', '友好区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230705, 230700, '0,1,230000,230700,', '230705', '西林区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230706, 230700, '0,1,230000,230700,', '230706', '翠峦区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230707, 230700, '0,1,230000,230700,', '230707', '新青区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230708, 230700, '0,1,230000,230700,', '230708', '美溪区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230709, 230700, '0,1,230000,230700,', '230709', '金山屯区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230710, 230700, '0,1,230000,230700,', '230710', '五营区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230711, 230700, '0,1,230000,230700,', '230711', '乌马河区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230712, 230700, '0,1,230000,230700,', '230712', '汤旺河区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230713, 230700, '0,1,230000,230700,', '230713', '带岭区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230714, 230700, '0,1,230000,230700,', '230714', '乌伊岭区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230715, 230700, '0,1,230000,230700,', '230715', '红星区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230716, 230700, '0,1,230000,230700,', '230716', '上甘岭区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230722, 230700, '0,1,230000,230700,', '230722', '嘉荫县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230781, 230700, '0,1,230000,230700,', '230781', '铁力市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230800, 230000, '0,1,230000,', '230800', '佳木斯市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230803, 230800, '0,1,230000,230800,', '230803', '向阳区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230804, 230800, '0,1,230000,230800,', '230804', '前进区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230805, 230800, '0,1,230000,230800,', '230805', '东风区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230811, 230800, '0,1,230000,230800,', '230811', '郊区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230822, 230800, '0,1,230000,230800,', '230822', '桦南县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230826, 230800, '0,1,230000,230800,', '230826', '桦川县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230828, 230800, '0,1,230000,230800,', '230828', '汤原县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230833, 230800, '0,1,230000,230800,', '230833', '抚远县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230881, 230800, '0,1,230000,230800,', '230881', '同江市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230882, 230800, '0,1,230000,230800,', '230882', '富锦市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230900, 230000, '0,1,230000,', '230900', '七台河市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230902, 230900, '0,1,230000,230900,', '230902', '新兴区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230903, 230900, '0,1,230000,230900,', '230903', '桃山区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230904, 230900, '0,1,230000,230900,', '230904', '茄子河区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (230921, 230900, '0,1,230000,230900,', '230921', '勃利县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (231000, 230000, '0,1,230000,', '231000', '牡丹江市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (231002, 231000, '0,1,230000,231000,', '231002', '东安区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (231003, 231000, '0,1,230000,231000,', '231003', '阳明区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (231004, 231000, '0,1,230000,231000,', '231004', '爱民区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (231005, 231000, '0,1,230000,231000,', '231005', '西安区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (231024, 231000, '0,1,230000,231000,', '231024', '东宁县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (231025, 231000, '0,1,230000,231000,', '231025', '林口县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (231081, 231000, '0,1,230000,231000,', '231081', '绥芬河市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (231083, 231000, '0,1,230000,231000,', '231083', '海林市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (231084, 231000, '0,1,230000,231000,', '231084', '宁安市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (231085, 231000, '0,1,230000,231000,', '231085', '穆棱市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (231100, 230000, '0,1,230000,', '231100', '黑河市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (231102, 231100, '0,1,230000,231100,', '231102', '爱辉区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (231121, 231100, '0,1,230000,231100,', '231121', '嫩江县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (231123, 231100, '0,1,230000,231100,', '231123', '逊克县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (231124, 231100, '0,1,230000,231100,', '231124', '孙吴县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (231181, 231100, '0,1,230000,231100,', '231181', '北安市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (231182, 231100, '0,1,230000,231100,', '231182', '五大连池市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (231200, 230000, '0,1,230000,', '231200', '绥化市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (231202, 231200, '0,1,230000,231200,', '231202', '北林区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (231221, 231200, '0,1,230000,231200,', '231221', '望奎县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (231222, 231200, '0,1,230000,231200,', '231222', '兰西县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (231223, 231200, '0,1,230000,231200,', '231223', '青冈县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (231224, 231200, '0,1,230000,231200,', '231224', '庆安县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (231225, 231200, '0,1,230000,231200,', '231225', '明水县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (231226, 231200, '0,1,230000,231200,', '231226', '绥棱县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (231281, 231200, '0,1,230000,231200,', '231281', '安达市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (231282, 231200, '0,1,230000,231200,', '231282', '肇东市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (231283, 231200, '0,1,230000,231200,', '231283', '海伦市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (232700, 230000, '0,1,230000,', '232700', '大兴安岭地区', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (232701, 232700, '0,1,230000,232700,', '232701', '加格达奇区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (232702, 232700, '0,1,230000,232700,', '232702', '松岭区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (232703, 232700, '0,1,230000,232700,', '232703', '新林区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (232704, 232700, '0,1,230000,232700,', '232704', '呼中区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (232721, 232700, '0,1,230000,232700,', '232721', '呼玛县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (232722, 232700, '0,1,230000,232700,', '232722', '塔河县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (232723, 232700, '0,1,230000,232700,', '232723', '漠河县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (232740, 232700, '0,1,230000,232700,', '232740', '加格达奇林业局', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (232741, 232700, '0,1,230000,232700,', '232741', '十八站林业局', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (232742, 232700, '0,1,230000,232700,', '232742', '图强林业局', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (232743, 232700, '0,1,230000,232700,', '232743', '阿木尔林业局', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (232744, 232700, '0,1,230000,232700,', '232744', '韩家园林业局', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (232745, 232700, '0,1,230000,232700,', '232745', '林管局农工商联合', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (232800, 232700, '0,1,230000,232700,', '232800', '省森工地区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (232801, 232700, '0,1,230000,232700,', '232801', '牡丹江森工地区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (232802, 232700, '0,1,230000,232700,', '232802', '松花江森工地区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (232803, 232700, '0,1,230000,232700,', '232803', '合江森工地区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (232900, 232700, '0,1,230000,232700,', '232900', '省农垦总局', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (232901, 232700, '0,1,230000,232700,', '232901', '农垦总局直属地区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (232902, 232700, '0,1,230000,232700,', '232902', '农垦宝泉岭分局', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (232903, 232700, '0,1,230000,232700,', '232903', '农垦红兴隆分局', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (232904, 232700, '0,1,230000,232700,', '232904', '农垦建三江分局', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (232905, 232700, '0,1,230000,232700,', '232905', '农垦牡丹江分局', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (232906, 232700, '0,1,230000,232700,', '232906', '农垦北安分局', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (232907, 232700, '0,1,230000,232700,', '232907', '农垦九三分局', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (232908, 232700, '0,1,230000,232700,', '232908', '农垦齐齐哈尔分局', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (232909, 232700, '0,1,230000,232700,', '232909', '农垦绥化分局', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (232910, 232700, '0,1,230000,232700,', '232910', '农垦哈尔滨分局', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (310000, 1, '0,1,', '310000', '上海市', 2, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (310101, 310000, '0,1,310000,', '310101', '黄浦区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (310103, 310000, '0,1,310000,', '310103', '卢湾区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (310104, 310000, '0,1,310000,', '310104', '徐汇区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (310105, 310000, '0,1,310000,', '310105', '长宁区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (310106, 310000, '0,1,310000,', '310106', '静安区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (310107, 310000, '0,1,310000,', '310107', '普陀区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (310108, 310000, '0,1,310000,', '310108', '闸北区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (310109, 310000, '0,1,310000,', '310109', '虹口区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (310110, 310000, '0,1,310000,', '310110', '杨浦区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (310112, 310000, '0,1,310000,', '310112', '闵行区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (310113, 310000, '0,1,310000,', '310113', '宝山区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (310114, 310000, '0,1,310000,', '310114', '嘉定区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (310115, 310000, '0,1,310000,', '310115', '浦东新区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (310116, 310000, '0,1,310000,', '310116', '金山区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (310117, 310000, '0,1,310000,', '310117', '松江区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (310118, 310000, '0,1,310000,', '310118', '青浦区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (310119, 310000, '0,1,310000,', '310119', '南汇区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (310120, 310000, '0,1,310000,', '310120', '奉贤区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (310230, 310000, '0,1,310000,', '310230', '崇明县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320000, 1, '0,1,', '320000', '江苏省', 2, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320100, 320000, '0,1,320000,', '320100', '南京市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320102, 320100, '0,1,320000,320100,', '320102', '玄武区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320103, 320100, '0,1,320000,320100,', '320103', '白下区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320104, 320100, '0,1,320000,320100,', '320104', '秦淮区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320105, 320100, '0,1,320000,320100,', '320105', '建邺区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320106, 320100, '0,1,320000,320100,', '320106', '鼓楼区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320107, 320100, '0,1,320000,320100,', '320107', '下关区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320111, 320100, '0,1,320000,320100,', '320111', '浦口区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320113, 320100, '0,1,320000,320100,', '320113', '栖霞区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320114, 320100, '0,1,320000,320100,', '320114', '雨花台区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320115, 320100, '0,1,320000,320100,', '320115', '江宁区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320116, 320100, '0,1,320000,320100,', '320116', '六合区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320124, 320100, '0,1,320000,320100,', '320124', '溧水县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320125, 320100, '0,1,320000,320100,', '320125', '高淳县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320200, 320000, '0,1,320000,', '320200', '无锡市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320202, 320200, '0,1,320000,320200,', '320202', '崇安区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320203, 320200, '0,1,320000,320200,', '320203', '南长区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320204, 320200, '0,1,320000,320200,', '320204', '北塘区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320205, 320200, '0,1,320000,320200,', '320205', '锡山区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320206, 320200, '0,1,320000,320200,', '320206', '惠山区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320211, 320200, '0,1,320000,320200,', '320211', '滨湖区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320213, 320200, '0,1,320000,320200,', '320213', '新区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320281, 320200, '0,1,320000,320200,', '320281', '江阴市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320282, 320200, '0,1,320000,320200,', '320282', '宜兴市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320300, 320000, '0,1,320000,', '320300', '徐州市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320302, 320300, '0,1,320000,320300,', '320302', '鼓楼区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320303, 320300, '0,1,320000,320300,', '320303', '云龙区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320304, 320300, '0,1,320000,320300,', '320304', '九里区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320305, 320300, '0,1,320000,320300,', '320305', '贾汪区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320311, 320300, '0,1,320000,320300,', '320311', '泉山区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320321, 320300, '0,1,320000,320300,', '320321', '丰县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320322, 320300, '0,1,320000,320300,', '320322', '沛县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320323, 320300, '0,1,320000,320300,', '320323', '铜山县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320324, 320300, '0,1,320000,320300,', '320324', '睢宁县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320381, 320300, '0,1,320000,320300,', '320381', '新沂市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320382, 320300, '0,1,320000,320300,', '320382', '邳州市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320400, 320000, '0,1,320000,', '320400', '常州市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320402, 320400, '0,1,320000,320400,', '320402', '天宁区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320404, 320400, '0,1,320000,320400,', '320404', '钟楼区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320405, 320400, '0,1,320000,320400,', '320405', '戚墅堰区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320411, 320400, '0,1,320000,320400,', '320411', '新北区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320412, 320400, '0,1,320000,320400,', '320412', '武进区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320481, 320400, '0,1,320000,320400,', '320481', '溧阳市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320482, 320400, '0,1,320000,320400,', '320482', '金坛市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320500, 320000, '0,1,320000,', '320500', '苏州市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320502, 320500, '0,1,320000,320500,', '320502', '沧浪区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320503, 320500, '0,1,320000,320500,', '320503', '平江区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320504, 320500, '0,1,320000,320500,', '320504', '金阊区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320505, 320500, '0,1,320000,320500,', '320505', '虎丘区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320506, 320500, '0,1,320000,320500,', '320506', '吴中区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320507, 320500, '0,1,320000,320500,', '320507', '相城区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320540, 320500, '0,1,320000,320500,', '320540', '工业园区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320581, 320500, '0,1,320000,320500,', '320581', '常熟市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320582, 320500, '0,1,320000,320500,', '320582', '张家港市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320583, 320500, '0,1,320000,320500,', '320583', '昆山市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320584, 320500, '0,1,320000,320500,', '320584', '吴江市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320585, 320500, '0,1,320000,320500,', '320585', '太仓市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320600, 320000, '0,1,320000,3', '320600', '南通市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320602, 320600, '0,1,320000,320600,', '320602', '崇川区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320611, 320600, '0,1,320000,320600,', '320611', '港闸区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320621, 320600, '0,1,320000,320600,', '320621', '海安县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320623, 320600, '0,1,320000,320600,', '320623', '如东县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320681, 320600, '0,1,320000,320600,', '320681', '启东市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320682, 320600, '0,1,320000,320600,', '320682', '如皋市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320683, 320600, '0,1,320000,320600,', '320683', '通州市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320684, 320600, '0,1,320000,320600,', '320684', '海门市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320700, 320000, '0,1,320000,', '320700', '连云港市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320703, 320700, '0,1,320000,320700,', '320703', '连云区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320705, 320700, '0,1,320000,320700,', '320705', '新浦区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320706, 320700, '0,1,320000,320700,', '320706', '海州区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320721, 320700, '0,1,320000,320700,', '320721', '赣榆县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320722, 320700, '0,1,320000,320700,', '320722', '东海县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320723, 320700, '0,1,320000,320700,', '320723', '灌云县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320724, 320700, '0,1,320000,320700,', '320724', '灌南县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320800, 320000, '0,1,320000,', '320800', '淮安市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320802, 320800, '0,1,320000,320800,', '320802', '清河区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320803, 320800, '0,1,320000,320800,', '320803', '楚州区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320804, 320800, '0,1,320000,320800,', '320804', '淮阴区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320811, 320800, '0,1,320000,320800,', '320811', '清浦区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320826, 320800, '0,1,320000,320800,', '320826', '涟水县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320829, 320800, '0,1,320000,320800,', '320829', '洪泽县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320830, 320800, '0,1,320000,320800,', '320830', '盱眙县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320831, 320800, '0,1,320000,320800,', '320831', '金湖县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320900, 320000, '0,1,320000,', '320900', '盐城市', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320902, 320900, '0,1,320000,320900,', '320902', '亭湖区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320903, 320900, '0,1,320000,320900,', '320903', '盐都区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320921, 320900, '0,1,320000,320900,', '320921', '响水县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320922, 320900, '0,1,320000,320900,', '320922', '滨海县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320923, 320900, '0,1,320000,320900,', '320923', '阜宁县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320924, 320900, '0,1,320000,320900,', '320924', '射阳县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320925, 320900, '0,1,320000,320900,', '320925', '建湖县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320940, 320900, '0,1,320000,320900,', '320940', '经济开发区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320981, 320900, '0,1,320000,320900,', '320981', '东台市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (320982, 320900, '0,1,320000,320900,', '320982', '大丰市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (321000, 320000, '0,1,320000,', '321000', '扬州市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:41');
INSERT INTO `sys_area` VALUES (321002, 321000, '0,1,320000,321000,', '321002', '广陵区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:42');
INSERT INTO `sys_area` VALUES (321003, 321000, '0,1,320000,321000,', '321003', '邗江区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:42');
INSERT INTO `sys_area` VALUES (321011, 321000, '0,1,320000,321000,', '321011', '维扬区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:42');
INSERT INTO `sys_area` VALUES (321023, 321000, '0,1,320000,321000,', '321023', '宝应县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:42');
INSERT INTO `sys_area` VALUES (321081, 321000, '0,1,320000,321000,', '321081', '仪征市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:42');
INSERT INTO `sys_area` VALUES (321084, 321000, '0,1,320000,321000,', '321084', '高邮市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:43');
INSERT INTO `sys_area` VALUES (321088, 321000, '0,1,320000,321000,', '321088', '江都市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:43');
INSERT INTO `sys_area` VALUES (321100, 320000, '0,1,320000,', '321100', '镇江市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:43');
INSERT INTO `sys_area` VALUES (321102, 321100, '0,1,320000,321100,', '321102', '京口区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:43');
INSERT INTO `sys_area` VALUES (321111, 321100, '0,1,320000,321100,', '321111', '润州区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:43');
INSERT INTO `sys_area` VALUES (321112, 321100, '0,1,320000,321100,', '321112', '丹徒区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:43');
INSERT INTO `sys_area` VALUES (321181, 321100, '0,1,320000,321100,', '321181', '丹阳市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:44');
INSERT INTO `sys_area` VALUES (321182, 321100, '0,1,320000,321100,', '321182', '扬中市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:44');
INSERT INTO `sys_area` VALUES (321183, 321100, '0,1,320000,321100,', '321183', '句容市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:44');
INSERT INTO `sys_area` VALUES (321200, 320000, '0,1,320000,', '321200', '泰州市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:44');
INSERT INTO `sys_area` VALUES (321202, 321100, '0,1,320000,321100,', '321202', '海陵区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:45');
INSERT INTO `sys_area` VALUES (321203, 321100, '0,1,320000,321100,', '321203', '高港区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:45');
INSERT INTO `sys_area` VALUES (321281, 321100, '0,1,320000,321100,', '321281', '兴化市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:45');
INSERT INTO `sys_area` VALUES (321282, 321100, '0,1,320000,321100,', '321282', '靖江市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:45');
INSERT INTO `sys_area` VALUES (321283, 321100, '0,1,320000,321100,', '321283', '泰兴市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:46');
INSERT INTO `sys_area` VALUES (321284, 321100, '0,1,320000,321100,', '321284', '姜堰市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:46');
INSERT INTO `sys_area` VALUES (321300, 320000, '0,1,320000,', '321300', '宿迁市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:46');
INSERT INTO `sys_area` VALUES (321302, 321300, '0,1,320000,321300,', '321302', '宿城区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:46');
INSERT INTO `sys_area` VALUES (321311, 321300, '0,1,320000,321300,', '321311', '宿豫区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:46');
INSERT INTO `sys_area` VALUES (321322, 321300, '0,1,320000,321300,', '321322', '沭阳县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:47');
INSERT INTO `sys_area` VALUES (321323, 321300, '0,1,320000,321300,', '321323', '泗阳县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:47');
INSERT INTO `sys_area` VALUES (321324, 321300, '0,1,320000,321300,', '321324', '泗洪县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:47');
INSERT INTO `sys_area` VALUES (330000, 1, '0,1,', '330000', '浙江省', 2, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (330100, 330000, '0,1,330000,', '330100', '杭州市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:47');
INSERT INTO `sys_area` VALUES (330102, 330100, '0,1,330000,330100,', '330102', '上城区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:47');
INSERT INTO `sys_area` VALUES (330103, 330100, '0,1,330000,330100,', '330103', '下城区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:48');
INSERT INTO `sys_area` VALUES (330104, 330100, '0,1,330000,330100,', '330104', '江干区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:48');
INSERT INTO `sys_area` VALUES (330105, 330100, '0,1,330000,330100,', '330105', '拱墅区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:48');
INSERT INTO `sys_area` VALUES (330106, 330100, '0,1,330000,330100,', '330106', '西湖区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:48');
INSERT INTO `sys_area` VALUES (330108, 330100, '0,1,330000,330100,', '330108', '滨江区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:48');
INSERT INTO `sys_area` VALUES (330109, 330100, '0,1,330000,330100,', '330109', '萧山区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:49');
INSERT INTO `sys_area` VALUES (330110, 330100, '0,1,330000,330100,', '330110', '余杭区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:49');
INSERT INTO `sys_area` VALUES (330122, 330100, '0,1,330000,330100,', '330122', '桐庐县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:49');
INSERT INTO `sys_area` VALUES (330127, 330100, '0,1,330000,330100,', '330127', '淳安县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:49');
INSERT INTO `sys_area` VALUES (330182, 330100, '0,1,330000,330100,', '330182', '建德市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:49');
INSERT INTO `sys_area` VALUES (330183, 330100, '0,1,330000,330100,', '330183', '富阳市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:49');
INSERT INTO `sys_area` VALUES (330185, 330100, '0,1,330000,330100,', '330185', '临安市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:50');
INSERT INTO `sys_area` VALUES (330200, 330000, '0,1,330000,', '330200', '宁波市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:50');
INSERT INTO `sys_area` VALUES (330203, 330200, '0,1,330000,330200,', '330203', '海曙区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:50');
INSERT INTO `sys_area` VALUES (330204, 330200, '0,1,330000,330200,', '330204', '江东区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:50');
INSERT INTO `sys_area` VALUES (330205, 330200, '0,1,330000,330200,', '330205', '江北区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:50');
INSERT INTO `sys_area` VALUES (330206, 330200, '0,1,330000,330200,', '330206', '北仑区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:50');
INSERT INTO `sys_area` VALUES (330211, 330200, '0,1,330000,330200,', '330211', '镇海区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:51');
INSERT INTO `sys_area` VALUES (330212, 330200, '0,1,330000,330200,', '330212', '鄞州区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:51');
INSERT INTO `sys_area` VALUES (330225, 330200, '0,1,330000,330200,', '330225', '象山县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:51');
INSERT INTO `sys_area` VALUES (330226, 330200, '0,1,330000,330200,', '330226', '宁海县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:51');
INSERT INTO `sys_area` VALUES (330240, 330200, '0,1,330000,330200,', '330240', '东钱湖区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:51');
INSERT INTO `sys_area` VALUES (330241, 330200, '0,1,330000,330200,', '330241', '开发区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:52');
INSERT INTO `sys_area` VALUES (330242, 330200, '0,1,330000,330200,', '330242', '保税区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:52');
INSERT INTO `sys_area` VALUES (330243, 330200, '0,1,330000,330200,', '330243', '大榭开发区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:52');
INSERT INTO `sys_area` VALUES (330244, 330200, '0,1,330000,330200,', '330244', '科技院区     ', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:52');
INSERT INTO `sys_area` VALUES (330281, 330200, '0,1,330000,330200,', '330281', '余姚市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:52');
INSERT INTO `sys_area` VALUES (330282, 330200, '0,1,330000,330200,', '330282', '慈溪市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:53');
INSERT INTO `sys_area` VALUES (330283, 330200, '0,1,330000,330200,', '330283', '奉化市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:53');
INSERT INTO `sys_area` VALUES (330300, 330000, '0,1,330000,', '330300', '温州市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:53');
INSERT INTO `sys_area` VALUES (330302, 330300, '0,1,330000,330300,', '330302', '鹿城区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:53');
INSERT INTO `sys_area` VALUES (330303, 330300, '0,1,330000,330300,', '330303', '龙湾区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:53');
INSERT INTO `sys_area` VALUES (330304, 330300, '0,1,330000,330300,', '330304', '瓯海区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:54');
INSERT INTO `sys_area` VALUES (330322, 330300, '0,1,330000,330300,', '330322', '洞头县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:54');
INSERT INTO `sys_area` VALUES (330324, 330300, '0,1,330000,330300,', '330324', '永嘉县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:54');
INSERT INTO `sys_area` VALUES (330326, 330300, '0,1,330000,330300,', '330326', '平阳县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:54');
INSERT INTO `sys_area` VALUES (330327, 330300, '0,1,330000,330300,', '330327', '苍南县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:54');
INSERT INTO `sys_area` VALUES (330328, 330300, '0,1,330000,330300,', '330328', '文成县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:54');
INSERT INTO `sys_area` VALUES (330329, 330300, '0,1,330000,330300,', '330329', '泰顺县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:55');
INSERT INTO `sys_area` VALUES (330340, 330300, '0,1,330000,330300,', '330340', '开发区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:55');
INSERT INTO `sys_area` VALUES (330381, 330300, '0,1,330000,330300,', '330381', '瑞安市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:55');
INSERT INTO `sys_area` VALUES (330382, 330300, '0,1,330000,330300,', '330382', '乐清市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:55');
INSERT INTO `sys_area` VALUES (330400, 330000, '0,1,330000,', '330400', '嘉兴市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:55');
INSERT INTO `sys_area` VALUES (330402, 330400, '0,1,330000,330400,', '330402', '南湖区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:55');
INSERT INTO `sys_area` VALUES (330411, 330400, '0,1,330000,330400,', '330411', '秀洲区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:56');
INSERT INTO `sys_area` VALUES (330421, 330400, '0,1,330000,330400,', '330421', '嘉善县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:56');
INSERT INTO `sys_area` VALUES (330424, 330400, '0,1,330000,330400,', '330424', '海盐县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:56');
INSERT INTO `sys_area` VALUES (330481, 330400, '0,1,330000,330400,', '330481', '海宁市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:56');
INSERT INTO `sys_area` VALUES (330482, 330400, '0,1,330000,330400,', '330482', '平湖市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:56');
INSERT INTO `sys_area` VALUES (330483, 330400, '0,1,330000,330400,', '330483', '桐乡市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:57');
INSERT INTO `sys_area` VALUES (330500, 330000, '0,1,330000,', '330500', '湖州市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:57');
INSERT INTO `sys_area` VALUES (330502, 330500, '0,1,330000,330500,', '330502', '吴兴区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:57');
INSERT INTO `sys_area` VALUES (330503, 330500, '0,1,330000,330500,', '330503', '南浔区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:57');
INSERT INTO `sys_area` VALUES (330521, 330500, '0,1,330000,330500,', '330521', '德清县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:57');
INSERT INTO `sys_area` VALUES (330522, 330500, '0,1,330000,330500,', '330522', '长兴县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:58');
INSERT INTO `sys_area` VALUES (330523, 330500, '0,1,330000,330500,', '330523', '安吉县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:58');
INSERT INTO `sys_area` VALUES (330600, 330000, '0,1,330000,', '330600', '绍兴市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:58');
INSERT INTO `sys_area` VALUES (330602, 330600, '0,1,330000,330600,', '330602', '越城区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:58');
INSERT INTO `sys_area` VALUES (330621, 330600, '0,1,330000,330600,', '330621', '绍兴县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:59');
INSERT INTO `sys_area` VALUES (330624, 330600, '0,1,330000,330600,', '330624', '新昌县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:59');
INSERT INTO `sys_area` VALUES (330681, 330600, '0,1,330000,330600,', '330681', '诸暨市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:59');
INSERT INTO `sys_area` VALUES (330682, 330600, '0,1,330000,330600,', '330682', '上虞市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:59');
INSERT INTO `sys_area` VALUES (330683, 330600, '0,1,330000,330600,', '330683', '嵊州市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:51:59');
INSERT INTO `sys_area` VALUES (330700, 330000, '0,1,330000,', '330700', '金华市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:00');
INSERT INTO `sys_area` VALUES (330702, 330700, '0,1,330000,330700,', '330702', '婺城区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:00');
INSERT INTO `sys_area` VALUES (330703, 330700, '0,1,330000,330700,', '330703', '金东区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:00');
INSERT INTO `sys_area` VALUES (330723, 330700, '0,1,330000,330700,', '330723', '武义县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:00');
INSERT INTO `sys_area` VALUES (330726, 330700, '0,1,330000,330700,', '330726', '浦江县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:00');
INSERT INTO `sys_area` VALUES (330727, 330700, '0,1,330000,330700,', '330727', '磐安县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:00');
INSERT INTO `sys_area` VALUES (330781, 330700, '0,1,330000,330700,', '330781', '兰溪市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:01');
INSERT INTO `sys_area` VALUES (330782, 330700, '0,1,330000,330700,', '330782', '义乌市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:01');
INSERT INTO `sys_area` VALUES (330783, 330700, '0,1,330000,330700,', '330783', '东阳市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:01');
INSERT INTO `sys_area` VALUES (330784, 330700, '0,1,330000,330700,', '330784', '永康市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:01');
INSERT INTO `sys_area` VALUES (330800, 330000, '0,1,330000,', '330800', '衢州市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:02');
INSERT INTO `sys_area` VALUES (330802, 330800, '0,1,330000,330800,', '330802', '柯城区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:02');
INSERT INTO `sys_area` VALUES (330803, 330800, '0,1,330000,330800,', '330803', '衢江区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:02');
INSERT INTO `sys_area` VALUES (330822, 330800, '0,1,330000,330800,', '330822', '常山县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:02');
INSERT INTO `sys_area` VALUES (330824, 330800, '0,1,330000,330800,', '330824', '开化县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:02');
INSERT INTO `sys_area` VALUES (330825, 330800, '0,1,330000,330800,', '330825', '龙游县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:02');
INSERT INTO `sys_area` VALUES (330881, 330800, '0,1,330000,330800,', '330881', '江山市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:02');
INSERT INTO `sys_area` VALUES (330900, 330000, '0,1,330000,', '330900', '舟山市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:03');
INSERT INTO `sys_area` VALUES (330902, 330900, '0,1,330000,330900,', '330902', '定海区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:03');
INSERT INTO `sys_area` VALUES (330903, 330900, '0,1,330000,330900,', '330903', '普陀区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:03');
INSERT INTO `sys_area` VALUES (330921, 330900, '0,1,330000,330900,', '330921', '岱山县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:03');
INSERT INTO `sys_area` VALUES (330922, 330900, '0,1,330000,330900,', '330922', '嵊泗县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:03');
INSERT INTO `sys_area` VALUES (331000, 330000, '0,1,330000,', '331000', '台州市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:04');
INSERT INTO `sys_area` VALUES (331002, 331000, '0,1,330000,331000,', '331002', '椒江区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:04');
INSERT INTO `sys_area` VALUES (331003, 331000, '0,1,330000,331000,', '331003', '黄岩区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:04');
INSERT INTO `sys_area` VALUES (331004, 331000, '0,1,330000,331000,', '331004', '路桥区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:04');
INSERT INTO `sys_area` VALUES (331021, 331000, '0,1,330000,331000,', '331021', '玉环县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:05');
INSERT INTO `sys_area` VALUES (331022, 331000, '0,1,330000,331000,', '331022', '三门县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:05');
INSERT INTO `sys_area` VALUES (331023, 331000, '0,1,330000,331000,', '331023', '天台县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:05');
INSERT INTO `sys_area` VALUES (331024, 331000, '0,1,330000,331000,', '331024', '仙居县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:05');
INSERT INTO `sys_area` VALUES (331081, 331000, '0,1,330000,331000,', '331081', '温岭市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:06');
INSERT INTO `sys_area` VALUES (331082, 331000, '0,1,330000,331000,', '331082', '临海市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:06');
INSERT INTO `sys_area` VALUES (331100, 330000, '0,1,330000,', '331100', '丽水市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:06');
INSERT INTO `sys_area` VALUES (331102, 331100, '0,1,330000,331100,', '331102', '莲都区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:06');
INSERT INTO `sys_area` VALUES (331121, 331100, '0,1,330000,331100,', '331121', '青田县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:06');
INSERT INTO `sys_area` VALUES (331122, 331100, '0,1,330000,331100,', '331122', '缙云县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:06');
INSERT INTO `sys_area` VALUES (331123, 331100, '0,1,330000,331100,', '331123', '遂昌县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:07');
INSERT INTO `sys_area` VALUES (331124, 331100, '0,1,330000,331100,', '331124', '松阳县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:07');
INSERT INTO `sys_area` VALUES (331125, 331100, '0,1,330000,331100,', '331125', '云和县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:07');
INSERT INTO `sys_area` VALUES (331126, 331100, '0,1,330000,331100,', '331126', '庆元县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:07');
INSERT INTO `sys_area` VALUES (331127, 331100, '0,1,330000,331100,', '331127', '景宁畲族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:07');
INSERT INTO `sys_area` VALUES (331181, 331100, '0,1,330000,331100,', '331181', '龙泉市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:08');
INSERT INTO `sys_area` VALUES (340000, 1, '0,1,', '340000', '安徽省', 2, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (340100, 340000, '0,1,340000,', '340100', '合肥市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:08');
INSERT INTO `sys_area` VALUES (340102, 340100, '0,1,340000,340100,', '340102', '瑶海区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:08');
INSERT INTO `sys_area` VALUES (340103, 340100, '0,1,340000,340100,', '340103', '庐阳区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:08');
INSERT INTO `sys_area` VALUES (340104, 340100, '0,1,340000,340100,', '340104', '蜀山区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:09');
INSERT INTO `sys_area` VALUES (340111, 340100, '0,1,340000,340100,', '340111', '包河区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:09');
INSERT INTO `sys_area` VALUES (340121, 340100, '0,1,340000,340100,', '340121', '长丰县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:09');
INSERT INTO `sys_area` VALUES (340122, 340100, '0,1,340000,340100,', '340122', '肥东县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:09');
INSERT INTO `sys_area` VALUES (340123, 340100, '0,1,340000,340100,', '340123', '肥西县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:09');
INSERT INTO `sys_area` VALUES (340200, 340000, '0,1,340000,', '340200', '芜湖市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:10');
INSERT INTO `sys_area` VALUES (340202, 340200, '0,1,340000,340200,', '340202', '镜湖区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:10');
INSERT INTO `sys_area` VALUES (340203, 340200, '0,1,340000,340200,', '340203', '弋江区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:10');
INSERT INTO `sys_area` VALUES (340207, 340200, '0,1,340000,340200,', '340207', '鸠江区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:10');
INSERT INTO `sys_area` VALUES (340208, 340200, '0,1,340000,340200,', '340208', '三山区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:10');
INSERT INTO `sys_area` VALUES (340221, 340200, '0,1,340000,340200,', '340221', '芜湖县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:11');
INSERT INTO `sys_area` VALUES (340222, 340200, '0,1,340000,340200,', '340222', '繁昌县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:11');
INSERT INTO `sys_area` VALUES (340223, 340200, '0,1,340000,340200,', '340223', '南陵县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:11');
INSERT INTO `sys_area` VALUES (340300, 340000, '0,1,340000,', '340300', '蚌埠市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:11');
INSERT INTO `sys_area` VALUES (340302, 340300, '0,1,340000,340300,', '340302', '龙子湖区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:12');
INSERT INTO `sys_area` VALUES (340303, 340300, '0,1,340000,340300,', '340303', '蚌山区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:12');
INSERT INTO `sys_area` VALUES (340304, 340300, '0,1,340000,340300,', '340304', '禹会区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:12');
INSERT INTO `sys_area` VALUES (340311, 340300, '0,1,340000,340300,', '340311', '淮上区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:12');
INSERT INTO `sys_area` VALUES (340321, 340300, '0,1,340000,340300,', '340321', '怀远县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:12');
INSERT INTO `sys_area` VALUES (340322, 340300, '0,1,340000,340300,', '340322', '五河县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:12');
INSERT INTO `sys_area` VALUES (340323, 340300, '0,1,340000,340300,', '340323', '固镇县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:13');
INSERT INTO `sys_area` VALUES (340400, 340000, '0,1,340000,', '340400', '淮南市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:13');
INSERT INTO `sys_area` VALUES (340402, 340400, '0,1,340000,340400,', '340402', '大通区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:13');
INSERT INTO `sys_area` VALUES (340403, 340400, '0,1,340000,340400,', '340403', '田家庵区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:13');
INSERT INTO `sys_area` VALUES (340404, 340400, '0,1,340000,340400,', '340404', '谢家集区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:13');
INSERT INTO `sys_area` VALUES (340405, 340400, '0,1,340000,340400,', '340405', '八公山区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:13');
INSERT INTO `sys_area` VALUES (340406, 340400, '0,1,340000,340400,', '340406', '潘集区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:14');
INSERT INTO `sys_area` VALUES (340421, 340400, '0,1,340000,340400,', '340421', '凤台县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:14');
INSERT INTO `sys_area` VALUES (340500, 340000, '0,1,340000,', '340500', '马鞍山市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:14');
INSERT INTO `sys_area` VALUES (340502, 340500, '0,1,340000,340500,', '340502', '金家庄区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:14');
INSERT INTO `sys_area` VALUES (340503, 340500, '0,1,340000,340500,', '340503', '花山区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:14');
INSERT INTO `sys_area` VALUES (340504, 340500, '0,1,340000,340500,', '340504', '雨山区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:14');
INSERT INTO `sys_area` VALUES (340521, 340500, '0,1,340000,340500,', '340521', '当涂县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:15');
INSERT INTO `sys_area` VALUES (340600, 340000, '0,1,340000,', '340600', '淮北市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:15');
INSERT INTO `sys_area` VALUES (340602, 340600, '0,1,340000,340600,', '340602', '杜集区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:15');
INSERT INTO `sys_area` VALUES (340603, 340600, '0,1,340000,340600,', '340603', '相山区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:15');
INSERT INTO `sys_area` VALUES (340604, 340600, '0,1,340000,340600,', '340604', '烈山区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:15');
INSERT INTO `sys_area` VALUES (340621, 340600, '0,1,340000,340600,', '340621', '濉溪县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:15');
INSERT INTO `sys_area` VALUES (340700, 340000, '0,1,340000,', '340700', '铜陵市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:16');
INSERT INTO `sys_area` VALUES (340702, 340700, '0,1,340000,340700,', '340702', '铜官山区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:16');
INSERT INTO `sys_area` VALUES (340703, 340700, '0,1,340000,340700,', '340703', '狮子山区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:16');
INSERT INTO `sys_area` VALUES (340711, 340700, '0,1,340000,340700,', '340711', '郊区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:16');
INSERT INTO `sys_area` VALUES (340721, 340700, '0,1,340000,340700,', '340721', '铜陵县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:16');
INSERT INTO `sys_area` VALUES (340800, 340000, '0,1,340000,', '340800', '安庆市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:17');
INSERT INTO `sys_area` VALUES (340802, 340800, '0,1,340000,340800,', '340802', '迎江区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:17');
INSERT INTO `sys_area` VALUES (340803, 340800, '0,1,340000,340800,', '340803', '大观区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:17');
INSERT INTO `sys_area` VALUES (340811, 340800, '0,1,340000,340800,', '340811', '宜秀区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:17');
INSERT INTO `sys_area` VALUES (340822, 340800, '0,1,340000,340800,', '340822', '怀宁县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:18');
INSERT INTO `sys_area` VALUES (340823, 340800, '0,1,340000,340800,', '340823', '枞阳县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:18');
INSERT INTO `sys_area` VALUES (340824, 340800, '0,1,340000,340800,', '340824', '潜山县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:18');
INSERT INTO `sys_area` VALUES (340825, 340800, '0,1,340000,340800,', '340825', '太湖县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:18');
INSERT INTO `sys_area` VALUES (340826, 340800, '0,1,340000,340800,', '340826', '宿松县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:18');
INSERT INTO `sys_area` VALUES (340827, 340800, '0,1,340000,340800,', '340827', '望江县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:19');
INSERT INTO `sys_area` VALUES (340828, 340800, '0,1,340000,340800,', '340828', '岳西县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:19');
INSERT INTO `sys_area` VALUES (340881, 340800, '0,1,340000,340800,', '340881', '桐城市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:19');
INSERT INTO `sys_area` VALUES (341000, 340000, '0,1,340000,', '341000', '黄山市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:19');
INSERT INTO `sys_area` VALUES (341002, 341000, '0,1,340000,341000,', '341002', '屯溪区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:19');
INSERT INTO `sys_area` VALUES (341003, 341000, '0,1,340000,341000,', '341003', '黄山区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:20');
INSERT INTO `sys_area` VALUES (341004, 341000, '0,1,340000,341000,', '341004', '徽州区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:20');
INSERT INTO `sys_area` VALUES (341021, 341000, '0,1,340000,341000,', '341021', '歙县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:20');
INSERT INTO `sys_area` VALUES (341022, 341000, '0,1,340000,341000,', '341022', '休宁县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:20');
INSERT INTO `sys_area` VALUES (341023, 341000, '0,1,340000,341000,', '341023', '黟县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:20');
INSERT INTO `sys_area` VALUES (341024, 341000, '0,1,340000,341000,', '341024', '祁门县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:21');
INSERT INTO `sys_area` VALUES (341100, 340000, '0,1,340000,', '341100', '滁州市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:21');
INSERT INTO `sys_area` VALUES (341102, 341100, '0,1,340000,341100,', '341102', '琅琊区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:21');
INSERT INTO `sys_area` VALUES (341103, 341100, '0,1,340000,341100,', '341103', '南谯区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:21');
INSERT INTO `sys_area` VALUES (341122, 341100, '0,1,340000,341100,', '341122', '来安县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:21');
INSERT INTO `sys_area` VALUES (341124, 341100, '0,1,340000,341100,', '341124', '全椒县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:22');
INSERT INTO `sys_area` VALUES (341125, 341100, '0,1,340000,341100,', '341125', '定远县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:22');
INSERT INTO `sys_area` VALUES (341126, 341100, '0,1,340000,341100,', '341126', '凤阳县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:22');
INSERT INTO `sys_area` VALUES (341181, 341100, '0,1,340000,341100,', '341181', '天长市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:22');
INSERT INTO `sys_area` VALUES (341182, 341100, '0,1,340000,341100,', '341182', '明光市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:22');
INSERT INTO `sys_area` VALUES (341200, 340000, '0,1,340000,', '341200', '阜阳市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:23');
INSERT INTO `sys_area` VALUES (341202, 341200, '0,1,340000,341200,', '341202', '颍州区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:23');
INSERT INTO `sys_area` VALUES (341203, 341200, '0,1,340000,341200,', '341203', '颍东区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:23');
INSERT INTO `sys_area` VALUES (341204, 341200, '0,1,340000,341200,', '341204', '颍泉区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:24');
INSERT INTO `sys_area` VALUES (341221, 341200, '0,1,340000,341200,', '341221', '临泉县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:24');
INSERT INTO `sys_area` VALUES (341222, 341200, '0,1,340000,341200,', '341222', '太和县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:24');
INSERT INTO `sys_area` VALUES (341225, 341200, '0,1,340000,341200,', '341225', '阜南县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:24');
INSERT INTO `sys_area` VALUES (341226, 341200, '0,1,340000,341200,', '341226', '颍上县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:24');
INSERT INTO `sys_area` VALUES (341282, 341200, '0,1,340000,341200,', '341282', '界首市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:25');
INSERT INTO `sys_area` VALUES (341300, 340000, '0,1,340000,', '341300', '宿州市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:25');
INSERT INTO `sys_area` VALUES (341302, 341300, '0,1,340000,341300,', '341302', '埇桥区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:25');
INSERT INTO `sys_area` VALUES (341321, 341300, '0,1,340000,341300,', '341321', '砀山县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:25');
INSERT INTO `sys_area` VALUES (341322, 341300, '0,1,340000,341300,', '341322', '萧县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:25');
INSERT INTO `sys_area` VALUES (341323, 341300, '0,1,340000,341300,', '341323', '灵璧县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:25');
INSERT INTO `sys_area` VALUES (341324, 341300, '0,1,340000,341300,', '341324', '泗县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:26');
INSERT INTO `sys_area` VALUES (341400, 340000, '0,1,340000,', '341400', '巢湖市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:26');
INSERT INTO `sys_area` VALUES (341402, 341400, '0,1,340000,341400,', '341402', '居巢区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:26');
INSERT INTO `sys_area` VALUES (341421, 341400, '0,1,340000,341400,', '341421', '庐江县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:26');
INSERT INTO `sys_area` VALUES (341422, 341400, '0,1,340000,341400,', '341422', '无为县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:26');
INSERT INTO `sys_area` VALUES (341423, 341400, '0,1,340000,341400,', '341423', '含山县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:27');
INSERT INTO `sys_area` VALUES (341424, 341400, '0,1,340000,341400,', '341424', '和县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:27');
INSERT INTO `sys_area` VALUES (341500, 340000, '0,1,340000,', '341500', '六安市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:27');
INSERT INTO `sys_area` VALUES (341502, 341500, '0,1,340000,341500,', '341502', '金安区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:27');
INSERT INTO `sys_area` VALUES (341503, 341500, '0,1,340000,341500,', '341503', '裕安区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:27');
INSERT INTO `sys_area` VALUES (341521, 341500, '0,1,340000,341500,', '341521', '寿县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:27');
INSERT INTO `sys_area` VALUES (341522, 341500, '0,1,340000,341500,', '341522', '霍邱县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:28');
INSERT INTO `sys_area` VALUES (341523, 341500, '0,1,340000,341500,', '341523', '舒城县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:28');
INSERT INTO `sys_area` VALUES (341524, 341500, '0,1,340000,341500,', '341524', '金寨县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:28');
INSERT INTO `sys_area` VALUES (341525, 341500, '0,1,340000,341500,', '341525', '霍山县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:28');
INSERT INTO `sys_area` VALUES (341540, 341500, '0,1,340000,341500,', '341540', '叶集', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:28');
INSERT INTO `sys_area` VALUES (341600, 340000, '0,1,340000,', '341600', '亳州市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:29');
INSERT INTO `sys_area` VALUES (341602, 341600, '0,1,340000,341600,', '341602', '谯城区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:29');
INSERT INTO `sys_area` VALUES (341621, 341600, '0,1,340000,341600,', '341621', '涡阳县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:29');
INSERT INTO `sys_area` VALUES (341622, 341600, '0,1,340000,341600,', '341622', '蒙城县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:29');
INSERT INTO `sys_area` VALUES (341623, 341600, '0,1,340000,341600,', '341623', '利辛县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:30');
INSERT INTO `sys_area` VALUES (341700, 340000, '0,1,340000,', '341700', '池州市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:30');
INSERT INTO `sys_area` VALUES (341702, 341700, '0,1,340000,341700,', '341702', '贵池区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:30');
INSERT INTO `sys_area` VALUES (341721, 341700, '0,1,340000,341700,', '341721', '东至县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:30');
INSERT INTO `sys_area` VALUES (341722, 341700, '0,1,340000,341700,', '341722', '石台县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:30');
INSERT INTO `sys_area` VALUES (341723, 341700, '0,1,340000,341700,', '341723', '青阳县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:31');
INSERT INTO `sys_area` VALUES (341740, 341700, '0,1,340000,341700,', '341740', '九华山风景区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:31');
INSERT INTO `sys_area` VALUES (341800, 340000, '0,1,340000,', '341800', '宣城市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:31');
INSERT INTO `sys_area` VALUES (341802, 341800, '0,1,340000,341800,', '341802', '宣州区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:31');
INSERT INTO `sys_area` VALUES (341821, 341800, '0,1,340000,341800,', '341821', '郎溪县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:31');
INSERT INTO `sys_area` VALUES (341822, 341800, '0,1,340000,341800,', '341822', '广德县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:32');
INSERT INTO `sys_area` VALUES (341823, 341800, '0,1,340000,341800,', '341823', '泾县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:32');
INSERT INTO `sys_area` VALUES (341824, 341800, '0,1,340000,341800,', '341824', '绩溪县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:32');
INSERT INTO `sys_area` VALUES (341825, 341800, '0,1,340000,341800,', '341825', '旌德县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:32');
INSERT INTO `sys_area` VALUES (341881, 341800, '0,1,340000,341800,', '341881', '宁国市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:32');
INSERT INTO `sys_area` VALUES (350000, 1, '0,1,', '350000', '福建省', 2, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (350100, 350000, '0,1,350000,', '350100', '福州市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:33');
INSERT INTO `sys_area` VALUES (350102, 350000, '0,1,350000,', '350102', '鼓楼区', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:33');
INSERT INTO `sys_area` VALUES (350103, 350000, '0,1,350000,', '350103', '台江区', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:33');
INSERT INTO `sys_area` VALUES (350104, 350000, '0,1,350000,', '350104', '仓山区', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:33');
INSERT INTO `sys_area` VALUES (350105, 350000, '0,1,350000,', '350105', '马尾区', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:33');
INSERT INTO `sys_area` VALUES (350111, 350000, '0,1,350000,', '350111', '晋安区', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:34');
INSERT INTO `sys_area` VALUES (350121, 350000, '0,1,350000,', '350121', '闽侯县', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:34');
INSERT INTO `sys_area` VALUES (350122, 350000, '0,1,350000,', '350122', '连江县', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:34');
INSERT INTO `sys_area` VALUES (350123, 350000, '0,1,350000,', '350123', '罗源县', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:34');
INSERT INTO `sys_area` VALUES (350124, 350000, '0,1,350000,', '350124', '闽清县', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:34');
INSERT INTO `sys_area` VALUES (350125, 350000, '0,1,350000,', '350125', '永泰县', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:34');
INSERT INTO `sys_area` VALUES (350128, 350000, '0,1,350000,', '350128', '平潭县', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:34');
INSERT INTO `sys_area` VALUES (350181, 350000, '0,1,350000,', '350181', '福清市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:35');
INSERT INTO `sys_area` VALUES (350182, 350000, '0,1,350000,', '350182', '长乐市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:35');
INSERT INTO `sys_area` VALUES (350200, 350000, '0,1,350000,', '350200', '厦门市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:36');
INSERT INTO `sys_area` VALUES (350203, 350200, '0,1,350000,350200,', '350203', '思明区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:36');
INSERT INTO `sys_area` VALUES (350205, 350200, '0,1,350000,350200,', '350205', '海沧区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:36');
INSERT INTO `sys_area` VALUES (350206, 350200, '0,1,350000,350200,', '350206', '湖里区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:36');
INSERT INTO `sys_area` VALUES (350211, 350200, '0,1,350000,350200,', '350211', '集美区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:36');
INSERT INTO `sys_area` VALUES (350212, 350200, '0,1,350000,350200,', '350212', '同安区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:36');
INSERT INTO `sys_area` VALUES (350213, 350200, '0,1,350000,350200,', '350213', '翔安区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:37');
INSERT INTO `sys_area` VALUES (350300, 350000, '0,1,350000,', '350300', '莆田市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:37');
INSERT INTO `sys_area` VALUES (350302, 350300, '0,1,350000,350300,', '350302', '城厢区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:37');
INSERT INTO `sys_area` VALUES (350303, 350300, '0,1,350000,350300,', '350303', '涵江区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:37');
INSERT INTO `sys_area` VALUES (350304, 350300, '0,1,350000,350300,', '350304', '荔城区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:37');
INSERT INTO `sys_area` VALUES (350305, 350300, '0,1,350000,350300,', '350305', '秀屿区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:38');
INSERT INTO `sys_area` VALUES (350322, 350300, '0,1,350000,350300,', '350322', '仙游县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:38');
INSERT INTO `sys_area` VALUES (350400, 350000, '0,1,350000,', '350400', '三明市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:38');
INSERT INTO `sys_area` VALUES (350402, 350400, '0,1,350000,350400,', '350402', '梅列区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:38');
INSERT INTO `sys_area` VALUES (350403, 350400, '0,1,350000,350400,', '350403', '三元区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:38');
INSERT INTO `sys_area` VALUES (350421, 350400, '0,1,350000,350400,', '350421', '明溪县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:39');
INSERT INTO `sys_area` VALUES (350423, 350400, '0,1,350000,350400,', '350423', '清流县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:39');
INSERT INTO `sys_area` VALUES (350424, 350400, '0,1,350000,350400,', '350424', '宁化县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:39');
INSERT INTO `sys_area` VALUES (350425, 350400, '0,1,350000,350400,', '350425', '大田县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:39');
INSERT INTO `sys_area` VALUES (350426, 350400, '0,1,350000,350400,', '350426', '尤溪县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:39');
INSERT INTO `sys_area` VALUES (350427, 350400, '0,1,350000,350400,', '350427', '沙县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:39');
INSERT INTO `sys_area` VALUES (350428, 350400, '0,1,350000,350400,', '350428', '将乐县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:40');
INSERT INTO `sys_area` VALUES (350429, 350400, '0,1,350000,350400,', '350429', '泰宁县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:40');
INSERT INTO `sys_area` VALUES (350430, 350400, '0,1,350000,350400,', '350430', '建宁县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:40');
INSERT INTO `sys_area` VALUES (350481, 350400, '0,1,350000,350400,', '350481', '永安市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:40');
INSERT INTO `sys_area` VALUES (350500, 350000, '0,1,350000,', '350500', '泉州市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:40');
INSERT INTO `sys_area` VALUES (350502, 350500, '0,1,350000,350500,', '350502', '鲤城区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:41');
INSERT INTO `sys_area` VALUES (350503, 350500, '0,1,350000,350500,', '350503', '丰泽区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:41');
INSERT INTO `sys_area` VALUES (350504, 350500, '0,1,350000,350500,', '350504', '洛江区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:41');
INSERT INTO `sys_area` VALUES (350505, 350500, '0,1,350000,350500,', '350505', '泉港区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:41');
INSERT INTO `sys_area` VALUES (350521, 350500, '0,1,350000,350500,', '350521', '惠安县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:41');
INSERT INTO `sys_area` VALUES (350524, 350500, '0,1,350000,350500,', '350524', '安溪县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:42');
INSERT INTO `sys_area` VALUES (350525, 350500, '0,1,350000,350500,', '350525', '永春县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:42');
INSERT INTO `sys_area` VALUES (350526, 350500, '0,1,350000,350500,', '350526', '德化县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:42');
INSERT INTO `sys_area` VALUES (350527, 350500, '0,1,350000,350500,', '350527', '金门县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:42');
INSERT INTO `sys_area` VALUES (350581, 350500, '0,1,350000,350500,', '350581', '石狮市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:42');
INSERT INTO `sys_area` VALUES (350582, 350500, '0,1,350000,350500,', '350582', '晋江市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:43');
INSERT INTO `sys_area` VALUES (350583, 350500, '0,1,350000,350500,', '350583', '南安市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:43');
INSERT INTO `sys_area` VALUES (350600, 350000, '0,1,350000,', '350600', '漳州市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:43');
INSERT INTO `sys_area` VALUES (350602, 350600, '0,1,350000,350600,', '350602', '芗城区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:43');
INSERT INTO `sys_area` VALUES (350603, 350600, '0,1,350000,350600,', '350603', '龙文区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:43');
INSERT INTO `sys_area` VALUES (350622, 350600, '0,1,350000,350600,', '350622', '云霄县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:44');
INSERT INTO `sys_area` VALUES (350623, 350600, '0,1,350000,350600,', '350623', '漳浦县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:44');
INSERT INTO `sys_area` VALUES (350624, 350600, '0,1,350000,350600,', '350624', '诏安县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:44');
INSERT INTO `sys_area` VALUES (350625, 350600, '0,1,350000,350600,', '350625', '长泰县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:44');
INSERT INTO `sys_area` VALUES (350626, 350600, '0,1,350000,350600,', '350626', '东山县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:44');
INSERT INTO `sys_area` VALUES (350627, 350600, '0,1,350000,350600,', '350627', '南靖县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:44');
INSERT INTO `sys_area` VALUES (350628, 350600, '0,1,350000,350600,', '350628', '平和县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:45');
INSERT INTO `sys_area` VALUES (350629, 350600, '0,1,350000,350600,', '350629', '华安县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:45');
INSERT INTO `sys_area` VALUES (350681, 350600, '0,1,350000,350600,', '350681', '龙海市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:45');
INSERT INTO `sys_area` VALUES (350700, 350000, '0,1,350000,', '350700', '南平市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:45');
INSERT INTO `sys_area` VALUES (350702, 350700, '0,1,350000,350700,', '350702', '延平区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:45');
INSERT INTO `sys_area` VALUES (350721, 350700, '0,1,350000,350700,', '350721', '顺昌县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:45');
INSERT INTO `sys_area` VALUES (350722, 350700, '0,1,350000,350700,', '350722', '浦城县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:46');
INSERT INTO `sys_area` VALUES (350723, 350700, '0,1,350000,350700,', '350723', '光泽县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:46');
INSERT INTO `sys_area` VALUES (350724, 350700, '0,1,350000,350700,', '350724', '松溪县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:46');
INSERT INTO `sys_area` VALUES (350725, 350700, '0,1,350000,350700,', '350725', '政和县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:46');
INSERT INTO `sys_area` VALUES (350781, 350700, '0,1,350000,350700,', '350781', '邵武市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:46');
INSERT INTO `sys_area` VALUES (350782, 350700, '0,1,350000,350700,', '350782', '武夷山市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:46');
INSERT INTO `sys_area` VALUES (350783, 350700, '0,1,350000,350700,', '350783', '建瓯市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:47');
INSERT INTO `sys_area` VALUES (350784, 350700, '0,1,350000,350700,', '350784', '建阳市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:47');
INSERT INTO `sys_area` VALUES (350800, 350000, '0,1,350000,', '350800', '龙岩市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:47');
INSERT INTO `sys_area` VALUES (350802, 350800, '0,1,350000,350800,', '350802', '新罗区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:47');
INSERT INTO `sys_area` VALUES (350821, 350800, '0,1,350000,350800,', '350821', '长汀县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:47');
INSERT INTO `sys_area` VALUES (350822, 350800, '0,1,350000,350800,', '350822', '永定县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:48');
INSERT INTO `sys_area` VALUES (350823, 350800, '0,1,350000,350800,', '350823', '上杭县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:48');
INSERT INTO `sys_area` VALUES (350824, 350800, '0,1,350000,350800,', '350824', '武平县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:48');
INSERT INTO `sys_area` VALUES (350825, 350800, '0,1,350000,350800,', '350825', '连城县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:48');
INSERT INTO `sys_area` VALUES (350881, 350800, '0,1,350000,350800,', '350881', '漳平市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:49');
INSERT INTO `sys_area` VALUES (350900, 350000, '0,1,350000,', '350900', '宁德市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:49');
INSERT INTO `sys_area` VALUES (350902, 350900, '0,1,350000,350900,', '350902', '蕉城区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:49');
INSERT INTO `sys_area` VALUES (350921, 350900, '0,1,350000,350900,', '350921', '霞浦县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:49');
INSERT INTO `sys_area` VALUES (350922, 350900, '0,1,350000,350900,', '350922', '古田县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:49');
INSERT INTO `sys_area` VALUES (350923, 350900, '0,1,350000,350900,', '350923', '屏南县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:49');
INSERT INTO `sys_area` VALUES (350924, 350900, '0,1,350000,350900,', '350924', '寿宁县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:50');
INSERT INTO `sys_area` VALUES (350925, 350900, '0,1,350000,350900,', '350925', '周宁县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:50');
INSERT INTO `sys_area` VALUES (350926, 350900, '0,1,350000,350900,', '350926', '柘荣县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:50');
INSERT INTO `sys_area` VALUES (350981, 350900, '0,1,350000,350900,', '350981', '福安市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:50');
INSERT INTO `sys_area` VALUES (350982, 350900, '0,1,350000,350900,', '350982', '福鼎市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:50');
INSERT INTO `sys_area` VALUES (360000, 1, '0,1,', '360000', '江西省', 2, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (360100, 360000, '0,1,360000,', '360100', '南昌市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:51');
INSERT INTO `sys_area` VALUES (360102, 360000, '0,1,360000,', '360102', '东湖区', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:51');
INSERT INTO `sys_area` VALUES (360103, 360000, '0,1,360000,', '360103', '西湖区', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:51');
INSERT INTO `sys_area` VALUES (360104, 360000, '0,1,360000,', '360104', '青云谱区', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:51');
INSERT INTO `sys_area` VALUES (360105, 360000, '0,1,360000,', '360105', '湾里区', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:51');
INSERT INTO `sys_area` VALUES (360111, 360000, '0,1,360000,', '360111', '青山湖区', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:51');
INSERT INTO `sys_area` VALUES (360121, 360000, '0,1,360000,', '360121', '南昌县', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:52');
INSERT INTO `sys_area` VALUES (360122, 360000, '0,1,360000,', '360122', '新建县', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:52');
INSERT INTO `sys_area` VALUES (360123, 360000, '0,1,360000,', '360123', '安义县', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:52');
INSERT INTO `sys_area` VALUES (360124, 360000, '0,1,360000,', '360124', '进贤县', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:52');
INSERT INTO `sys_area` VALUES (360140, 360000, '0,1,360000,', '360140', '昌北区', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:52');
INSERT INTO `sys_area` VALUES (360141, 360000, '0,1,360000,', '360141', '高新区', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:53');
INSERT INTO `sys_area` VALUES (360200, 360000, '0,1,360000,', '360200', '景德镇市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:53');
INSERT INTO `sys_area` VALUES (360202, 360200, '0,1,360000,360200,', '360202', '昌江区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:53');
INSERT INTO `sys_area` VALUES (360203, 360200, '0,1,360000,360200,', '360203', '珠山区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:53');
INSERT INTO `sys_area` VALUES (360222, 360200, '0,1,360000,360200,', '360222', '浮梁县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:53');
INSERT INTO `sys_area` VALUES (360281, 360200, '0,1,360000,360200,', '360281', '乐平市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:53');
INSERT INTO `sys_area` VALUES (360300, 360000, '0,1,360000,', '360300', '萍乡市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:54');
INSERT INTO `sys_area` VALUES (360302, 360300, '0,1,360000,360300,', '360302', '安源区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:54');
INSERT INTO `sys_area` VALUES (360313, 360300, '0,1,360000,360300,', '360313', '湘东区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:54');
INSERT INTO `sys_area` VALUES (360321, 360300, '0,1,360000,360300,', '360321', '莲花县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:55');
INSERT INTO `sys_area` VALUES (360322, 360300, '0,1,360000,360300,', '360322', '上栗县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:55');
INSERT INTO `sys_area` VALUES (360323, 360300, '0,1,360000,360300,', '360323', '芦溪县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:55');
INSERT INTO `sys_area` VALUES (360400, 360000, '0,1,360000,', '360400', '九江市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:55');
INSERT INTO `sys_area` VALUES (360402, 360400, '0,1,360000,360400,', '360402', '庐山区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:55');
INSERT INTO `sys_area` VALUES (360403, 360400, '0,1,360000,360400,', '360403', '浔阳区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:55');
INSERT INTO `sys_area` VALUES (360421, 360400, '0,1,360000,360400,', '360421', '九江县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:56');
INSERT INTO `sys_area` VALUES (360423, 360400, '0,1,360000,360400,', '360423', '武宁县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:56');
INSERT INTO `sys_area` VALUES (360424, 360400, '0,1,360000,360400,', '360424', '修水县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:56');
INSERT INTO `sys_area` VALUES (360425, 360400, '0,1,360000,360400,', '360425', '永修县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:56');
INSERT INTO `sys_area` VALUES (360426, 360400, '0,1,360000,360400,', '360426', '德安县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:56');
INSERT INTO `sys_area` VALUES (360427, 360400, '0,1,360000,360400,', '360427', '星子县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:56');
INSERT INTO `sys_area` VALUES (360428, 360400, '0,1,360000,360400,', '360428', '都昌县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:57');
INSERT INTO `sys_area` VALUES (360429, 360400, '0,1,360000,360400,', '360429', '湖口县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:57');
INSERT INTO `sys_area` VALUES (360430, 360400, '0,1,360000,360400,', '360430', '彭泽县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:57');
INSERT INTO `sys_area` VALUES (360440, 360400, '0,1,360000,360400,', '360440', '开发区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:57');
INSERT INTO `sys_area` VALUES (360441, 360400, '0,1,360000,360400,', '360441', '庐山局', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:57');
INSERT INTO `sys_area` VALUES (360481, 360400, '0,1,360000,360400,', '360481', '瑞昌市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:58');
INSERT INTO `sys_area` VALUES (360500, 360000, '0,1,360000,', '360500', '新余市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:58');
INSERT INTO `sys_area` VALUES (360502, 360500, '0,1,360000,360500,', '360502', '渝水区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:58');
INSERT INTO `sys_area` VALUES (360521, 360500, '0,1,360000,360500,', '360521', '分宜县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:58');
INSERT INTO `sys_area` VALUES (360540, 360500, '0,1,360000,360500,', '360540', '仙女湖区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:58');
INSERT INTO `sys_area` VALUES (360600, 360000, '0,1,360000,', '360600', '鹰潭市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:59');
INSERT INTO `sys_area` VALUES (360602, 360600, '0,1,360000,360600,', '360602', '月湖区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:59');
INSERT INTO `sys_area` VALUES (360622, 360600, '0,1,360000,360600,', '360622', '余江县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:59');
INSERT INTO `sys_area` VALUES (360681, 360600, '0,1,360000,360600,', '360681', '贵溪市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:52:59');
INSERT INTO `sys_area` VALUES (360700, 360000, '0,1,360000,', '360700', '赣州市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:00');
INSERT INTO `sys_area` VALUES (360702, 360700, '0,1,360000,360700,', '360702', '章贡区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:00');
INSERT INTO `sys_area` VALUES (360721, 360700, '0,1,360000,360700,', '360721', '赣县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:00');
INSERT INTO `sys_area` VALUES (360722, 360700, '0,1,360000,360700,', '360722', '信丰县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:00');
INSERT INTO `sys_area` VALUES (360723, 360700, '0,1,360000,360700,', '360723', '大余县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:01');
INSERT INTO `sys_area` VALUES (360724, 360700, '0,1,360000,360700,', '360724', '上犹县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:01');
INSERT INTO `sys_area` VALUES (360725, 360700, '0,1,360000,360700,', '360725', '崇义县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:01');
INSERT INTO `sys_area` VALUES (360726, 360700, '0,1,360000,360700,', '360726', '安远县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:01');
INSERT INTO `sys_area` VALUES (360727, 360700, '0,1,360000,360700,', '360727', '龙南县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:02');
INSERT INTO `sys_area` VALUES (360728, 360700, '0,1,360000,360700,', '360728', '定南县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:02');
INSERT INTO `sys_area` VALUES (360729, 360700, '0,1,360000,360700,', '360729', '全南县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:02');
INSERT INTO `sys_area` VALUES (360730, 360700, '0,1,360000,360700,', '360730', '宁都县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:02');
INSERT INTO `sys_area` VALUES (360731, 360700, '0,1,360000,360700,', '360731', '于都县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:02');
INSERT INTO `sys_area` VALUES (360732, 360700, '0,1,360000,360700,', '360732', '兴国县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:02');
INSERT INTO `sys_area` VALUES (360733, 360700, '0,1,360000,360700,', '360733', '会昌县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:03');
INSERT INTO `sys_area` VALUES (360734, 360700, '0,1,360000,360700,', '360734', '寻乌县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:03');
INSERT INTO `sys_area` VALUES (360735, 360700, '0,1,360000,360700,', '360735', '石城县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:03');
INSERT INTO `sys_area` VALUES (360781, 360700, '0,1,360000,360700,', '360781', '瑞金市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:03');
INSERT INTO `sys_area` VALUES (360782, 360700, '0,1,360000,360700,', '360782', '南康市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:03');
INSERT INTO `sys_area` VALUES (360800, 360000, '0,1,360000,', '360800', '吉安市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:04');
INSERT INTO `sys_area` VALUES (360802, 360800, '0,1,360000,360800,', '360802', '吉州区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:04');
INSERT INTO `sys_area` VALUES (360803, 360800, '0,1,360000,360800,', '360803', '青原区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:04');
INSERT INTO `sys_area` VALUES (360821, 360800, '0,1,360000,360800,', '360821', '吉安县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:04');
INSERT INTO `sys_area` VALUES (360822, 360800, '0,1,360000,360800,', '360822', '吉水县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:04');
INSERT INTO `sys_area` VALUES (360823, 360800, '0,1,360000,360800,', '360823', '峡江县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:05');
INSERT INTO `sys_area` VALUES (360824, 360800, '0,1,360000,360800,', '360824', '新干县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:05');
INSERT INTO `sys_area` VALUES (360825, 360800, '0,1,360000,360800,', '360825', '永丰县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:05');
INSERT INTO `sys_area` VALUES (360826, 360800, '0,1,360000,360800,', '360826', '泰和县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:05');
INSERT INTO `sys_area` VALUES (360827, 360800, '0,1,360000,360800,', '360827', '遂川县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:05');
INSERT INTO `sys_area` VALUES (360828, 360800, '0,1,360000,360800,', '360828', '万安县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:05');
INSERT INTO `sys_area` VALUES (360829, 360800, '0,1,360000,360800,', '360829', '安福县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:06');
INSERT INTO `sys_area` VALUES (360830, 360800, '0,1,360000,360800,', '360830', '永新县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:06');
INSERT INTO `sys_area` VALUES (360881, 360800, '0,1,360000,360800,', '360881', '井冈山市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:06');
INSERT INTO `sys_area` VALUES (360900, 360000, '0,1,360000,', '360900', '宜春市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:07');
INSERT INTO `sys_area` VALUES (360902, 360900, '0,1,360000,360900,', '360902', '袁州区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:07');
INSERT INTO `sys_area` VALUES (360921, 360900, '0,1,360000,360900,', '360921', '奉新县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:07');
INSERT INTO `sys_area` VALUES (360922, 360900, '0,1,360000,360900,', '360922', '万载县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:07');
INSERT INTO `sys_area` VALUES (360923, 360900, '0,1,360000,360900,', '360923', '上高县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:07');
INSERT INTO `sys_area` VALUES (360924, 360900, '0,1,360000,360900,', '360924', '宜丰县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:07');
INSERT INTO `sys_area` VALUES (360925, 360900, '0,1,360000,360900,', '360925', '靖安县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:08');
INSERT INTO `sys_area` VALUES (360926, 360900, '0,1,360000,360900,', '360926', '铜鼓县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:08');
INSERT INTO `sys_area` VALUES (360981, 360900, '0,1,360000,360900,', '360981', '丰城市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:08');
INSERT INTO `sys_area` VALUES (360982, 360900, '0,1,360000,360900,', '360982', '樟树市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:08');
INSERT INTO `sys_area` VALUES (360983, 360900, '0,1,360000,360900,', '360983', '高安市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:08');
INSERT INTO `sys_area` VALUES (361000, 360000, '0,1,360000,', '361000', '抚州市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:09');
INSERT INTO `sys_area` VALUES (361002, 361000, '0,1,360000,361000,', '361002', '临川区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:09');
INSERT INTO `sys_area` VALUES (361021, 361000, '0,1,360000,361000,', '361021', '南城县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:09');
INSERT INTO `sys_area` VALUES (361022, 361000, '0,1,360000,361000,', '361022', '黎川县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:09');
INSERT INTO `sys_area` VALUES (361023, 361000, '0,1,360000,361000,', '361023', '南丰县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:09');
INSERT INTO `sys_area` VALUES (361024, 361000, '0,1,360000,361000,', '361024', '崇仁县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:09');
INSERT INTO `sys_area` VALUES (361025, 361000, '0,1,360000,361000,', '361025', '乐安县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:10');
INSERT INTO `sys_area` VALUES (361026, 361000, '0,1,360000,361000,', '361026', '宜黄县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:10');
INSERT INTO `sys_area` VALUES (361027, 361000, '0,1,360000,361000,', '361027', '金溪县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:10');
INSERT INTO `sys_area` VALUES (361028, 361000, '0,1,360000,361000,', '361028', '资溪县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:10');
INSERT INTO `sys_area` VALUES (361029, 361000, '0,1,360000,361000,', '361029', '东乡县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:10');
INSERT INTO `sys_area` VALUES (361030, 361000, '0,1,360000,361000,', '361030', '广昌县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:10');
INSERT INTO `sys_area` VALUES (361040, 361000, '0,1,360000,361000,', '361040', '金巢区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:11');
INSERT INTO `sys_area` VALUES (361100, 360000, '0,1,360000,', '361100', '上饶市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:11');
INSERT INTO `sys_area` VALUES (361102, 361100, '0,1,360000,361100,', '361102', '信州区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:11');
INSERT INTO `sys_area` VALUES (361121, 361100, '0,1,360000,361100,', '361121', '上饶县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:11');
INSERT INTO `sys_area` VALUES (361122, 361100, '0,1,360000,361100,', '361122', '广丰县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:11');
INSERT INTO `sys_area` VALUES (361123, 361100, '0,1,360000,361100,', '361123', '玉山县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:11');
INSERT INTO `sys_area` VALUES (361124, 361100, '0,1,360000,361100,', '361124', '铅山县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:12');
INSERT INTO `sys_area` VALUES (361125, 361100, '0,1,360000,361100,', '361125', '横峰县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:12');
INSERT INTO `sys_area` VALUES (361126, 361100, '0,1,360000,361100,', '361126', '弋阳县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:12');
INSERT INTO `sys_area` VALUES (361127, 361100, '0,1,360000,361100,', '361127', '余干县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:12');
INSERT INTO `sys_area` VALUES (361128, 361100, '0,1,360000,361100,', '361128', '波阳县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:12');
INSERT INTO `sys_area` VALUES (361129, 361100, '0,1,360000,361100,', '361129', '万年县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:13');
INSERT INTO `sys_area` VALUES (361130, 361100, '0,1,360000,361100,', '361130', '婺源县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:13');
INSERT INTO `sys_area` VALUES (361181, 361100, '0,1,360000,361100,', '361181', '德兴市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:13');
INSERT INTO `sys_area` VALUES (370000, 1, '0,1,', '370000', '山东省', 2, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (370100, 370000, '0,1,370000,', '370100', '济南市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:14');
INSERT INTO `sys_area` VALUES (370102, 370100, '0,1,370000,370100,', '370102', '历下区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:14');
INSERT INTO `sys_area` VALUES (370103, 370100, '0,1,370000,370100,', '370103', '市中区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:14');
INSERT INTO `sys_area` VALUES (370104, 370100, '0,1,370000,370100,', '370104', '槐荫区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:14');
INSERT INTO `sys_area` VALUES (370105, 370100, '0,1,370000,370100,', '370105', '天桥区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:14');
INSERT INTO `sys_area` VALUES (370112, 370100, '0,1,370000,370100,', '370112', '历城区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:14');
INSERT INTO `sys_area` VALUES (370113, 370100, '0,1,370000,370100,', '370113', '长清区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:15');
INSERT INTO `sys_area` VALUES (370124, 370100, '0,1,370000,370100,', '370124', '平阴县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:15');
INSERT INTO `sys_area` VALUES (370125, 370100, '0,1,370000,370100,', '370125', '济阳县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:15');
INSERT INTO `sys_area` VALUES (370126, 370100, '0,1,370000,370100,', '370126', '商河县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:15');
INSERT INTO `sys_area` VALUES (370181, 370100, '0,1,370000,370100,', '370181', '章丘市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:15');
INSERT INTO `sys_area` VALUES (370200, 370000, '0,1,370000,', '370200', '青岛市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:16');
INSERT INTO `sys_area` VALUES (370202, 370200, '0,1,370000,370200,', '370202', '市南区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:16');
INSERT INTO `sys_area` VALUES (370203, 370200, '0,1,370000,370200,', '370203', '市北区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:16');
INSERT INTO `sys_area` VALUES (370205, 370200, '0,1,370000,370200,', '370205', '四方区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:16');
INSERT INTO `sys_area` VALUES (370211, 370200, '0,1,370000,370200,', '370211', '黄岛区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:16');
INSERT INTO `sys_area` VALUES (370212, 370200, '0,1,370000,370200,', '370212', '崂山区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:16');
INSERT INTO `sys_area` VALUES (370213, 370200, '0,1,370000,370200,', '370213', '李沧区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:17');
INSERT INTO `sys_area` VALUES (370214, 370200, '0,1,370000,370200,', '370214', '城阳区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:17');
INSERT INTO `sys_area` VALUES (370240, 370200, '0,1,370000,370200,', '370240', '保税区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:17');
INSERT INTO `sys_area` VALUES (370281, 370200, '0,1,370000,370200,', '370281', '胶州市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:17');
INSERT INTO `sys_area` VALUES (370282, 370200, '0,1,370000,370200,', '370282', '即墨市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:17');
INSERT INTO `sys_area` VALUES (370283, 370200, '0,1,370000,370200,', '370283', '平度市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:18');
INSERT INTO `sys_area` VALUES (370284, 370200, '0,1,370000,370200,', '370284', '胶南市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:18');
INSERT INTO `sys_area` VALUES (370285, 370200, '0,1,370000,370200,', '370285', '莱西市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:18');
INSERT INTO `sys_area` VALUES (370300, 370000, '0,1,370000,', '370300', '淄博市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:18');
INSERT INTO `sys_area` VALUES (370302, 370300, '0,1,370000,370300,', '370302', '淄川区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:19');
INSERT INTO `sys_area` VALUES (370303, 370300, '0,1,370000,370300,', '370303', '张店区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:19');
INSERT INTO `sys_area` VALUES (370304, 370300, '0,1,370000,370300,', '370304', '博山区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:19');
INSERT INTO `sys_area` VALUES (370305, 370300, '0,1,370000,370300,', '370305', '临淄区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:19');
INSERT INTO `sys_area` VALUES (370306, 370300, '0,1,370000,370300,', '370306', '周村区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:19');
INSERT INTO `sys_area` VALUES (370321, 370300, '0,1,370000,370300,', '370321', '桓台县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:19');
INSERT INTO `sys_area` VALUES (370322, 370300, '0,1,370000,370300,', '370322', '高青县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:20');
INSERT INTO `sys_area` VALUES (370323, 370300, '0,1,370000,370300,', '370323', '沂源县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:20');
INSERT INTO `sys_area` VALUES (370340, 370300, '0,1,370000,370300,', '370340', '高新区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:20');
INSERT INTO `sys_area` VALUES (370400, 370000, '0,1,370000,', '370400', '枣庄市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:20');
INSERT INTO `sys_area` VALUES (370402, 370400, '0,1,370000,370400,', '370402', '市中区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:20');
INSERT INTO `sys_area` VALUES (370403, 370400, '0,1,370000,370400,', '370403', '薛城区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:21');
INSERT INTO `sys_area` VALUES (370404, 370400, '0,1,370000,370400,', '370404', '峄城区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:21');
INSERT INTO `sys_area` VALUES (370405, 370400, '0,1,370000,370400,', '370405', '台儿庄区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:21');
INSERT INTO `sys_area` VALUES (370406, 370400, '0,1,370000,370400,', '370406', '山亭区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:21');
INSERT INTO `sys_area` VALUES (370481, 370400, '0,1,370000,370400,', '370481', '滕州市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:21');
INSERT INTO `sys_area` VALUES (370500, 370000, '0,1,370000,', '370500', '东营市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:21');
INSERT INTO `sys_area` VALUES (370502, 370500, '0,1,370000,370500,', '370502', '东营区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:22');
INSERT INTO `sys_area` VALUES (370503, 370500, '0,1,370000,370500,', '370503', '河口区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:22');
INSERT INTO `sys_area` VALUES (370521, 370500, '0,1,370000,370500,', '370521', '垦利县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:22');
INSERT INTO `sys_area` VALUES (370522, 370500, '0,1,370000,370500,', '370522', '利津县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:22');
INSERT INTO `sys_area` VALUES (370523, 370500, '0,1,370000,370500,', '370523', '广饶县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:22');
INSERT INTO `sys_area` VALUES (370600, 370000, '0,1,370000,', '370600', '烟台市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:23');
INSERT INTO `sys_area` VALUES (370602, 370600, '0,1,370000,370600,', '370602', '芝罘区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:23');
INSERT INTO `sys_area` VALUES (370611, 370600, '0,1,370000,370600,', '370611', '福山区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:23');
INSERT INTO `sys_area` VALUES (370612, 370600, '0,1,370000,370600,', '370612', '牟平区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:23');
INSERT INTO `sys_area` VALUES (370613, 370600, '0,1,370000,370600,', '370613', '莱山区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:23');
INSERT INTO `sys_area` VALUES (370634, 370600, '0,1,370000,370600,', '370634', '长岛县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:23');
INSERT INTO `sys_area` VALUES (370640, 370600, '0,1,370000,370600,', '370640', '开发区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:24');
INSERT INTO `sys_area` VALUES (370641, 370600, '0,1,370000,370600,', '370641', '高新区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:24');
INSERT INTO `sys_area` VALUES (370681, 370600, '0,1,370000,370600,', '370681', '龙口市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:24');
INSERT INTO `sys_area` VALUES (370682, 370600, '0,1,370000,370600,', '370682', '莱阳市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:24');
INSERT INTO `sys_area` VALUES (370683, 370600, '0,1,370000,370600,', '370683', '莱州市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:24');
INSERT INTO `sys_area` VALUES (370684, 370600, '0,1,370000,370600,', '370684', '蓬莱市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:25');
INSERT INTO `sys_area` VALUES (370685, 370600, '0,1,370000,370600,', '370685', '招远市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:25');
INSERT INTO `sys_area` VALUES (370686, 370600, '0,1,370000,370600,', '370686', '栖霞市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:25');
INSERT INTO `sys_area` VALUES (370687, 370600, '0,1,370000,370600,', '370687', '海阳市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:25');
INSERT INTO `sys_area` VALUES (370700, 370000, '0,1,370000,', '370700', '潍坊市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:26');
INSERT INTO `sys_area` VALUES (370702, 370700, '0,1,370000,370700,', '370702', '潍城区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:26');
INSERT INTO `sys_area` VALUES (370703, 370700, '0,1,370000,370700,', '370703', '寒亭区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:26');
INSERT INTO `sys_area` VALUES (370704, 370700, '0,1,370000,370700,', '370704', '坊子区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:26');
INSERT INTO `sys_area` VALUES (370705, 370700, '0,1,370000,370700,', '370705', '奎文区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:26');
INSERT INTO `sys_area` VALUES (370724, 370700, '0,1,370000,370700,', '370724', '临朐县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:26');
INSERT INTO `sys_area` VALUES (370725, 370700, '0,1,370000,370700,', '370725', '昌乐县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:26');
INSERT INTO `sys_area` VALUES (370781, 370700, '0,1,370000,370700,', '370781', '青州市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:27');
INSERT INTO `sys_area` VALUES (370782, 370700, '0,1,370000,370700,', '370782', '诸城市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:27');
INSERT INTO `sys_area` VALUES (370783, 370700, '0,1,370000,370700,', '370783', '寿光市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:27');
INSERT INTO `sys_area` VALUES (370784, 370700, '0,1,370000,370700,', '370784', '安丘市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:27');
INSERT INTO `sys_area` VALUES (370785, 370700, '0,1,370000,370700,', '370785', '高密市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:27');
INSERT INTO `sys_area` VALUES (370786, 370700, '0,1,370000,370700,', '370786', '昌邑市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:27');
INSERT INTO `sys_area` VALUES (370800, 370000, '0,1,370000,', '370800', '济宁市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:28');
INSERT INTO `sys_area` VALUES (370802, 370800, '0,1,370000,370800,', '370802', '市中区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:28');
INSERT INTO `sys_area` VALUES (370811, 370800, '0,1,370000,370800,', '370811', '任城区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:28');
INSERT INTO `sys_area` VALUES (370826, 370800, '0,1,370000,370800,', '370826', '微山县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:28');
INSERT INTO `sys_area` VALUES (370827, 370800, '0,1,370000,370800,', '370827', '鱼台县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:28');
INSERT INTO `sys_area` VALUES (370828, 370800, '0,1,370000,370800,', '370828', '金乡县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:28');
INSERT INTO `sys_area` VALUES (370829, 370800, '0,1,370000,370800,', '370829', '嘉祥县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:29');
INSERT INTO `sys_area` VALUES (370830, 370800, '0,1,370000,370800,', '370830', '汶上县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:29');
INSERT INTO `sys_area` VALUES (370831, 370800, '0,1,370000,370800,', '370831', '泗水县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:29');
INSERT INTO `sys_area` VALUES (370832, 370800, '0,1,370000,370800,', '370832', '梁山县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:29');
INSERT INTO `sys_area` VALUES (370881, 370800, '0,1,370000,370800,', '370881', '曲阜市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:29');
INSERT INTO `sys_area` VALUES (370882, 370800, '0,1,370000,370800,', '370882', '兖州市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:30');
INSERT INTO `sys_area` VALUES (370883, 370800, '0,1,370000,370800,', '370883', '邹城市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:30');
INSERT INTO `sys_area` VALUES (370900, 370000, '0,1,370000,', '370900', '泰安市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:30');
INSERT INTO `sys_area` VALUES (370902, 370900, '0,1,370000,370900,', '370902', '泰山区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:30');
INSERT INTO `sys_area` VALUES (370911, 370900, '0,1,370000,370900,', '370911', '岱岳区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:30');
INSERT INTO `sys_area` VALUES (370921, 370900, '0,1,370000,370900,', '370921', '宁阳县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:30');
INSERT INTO `sys_area` VALUES (370923, 370900, '0,1,370000,370900,', '370923', '东平县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:31');
INSERT INTO `sys_area` VALUES (370982, 370900, '0,1,370000,370900,', '370982', '新泰市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:31');
INSERT INTO `sys_area` VALUES (370983, 370900, '0,1,370000,370900,', '370983', '肥城市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:31');
INSERT INTO `sys_area` VALUES (371000, 370000, '0,1,370000,', '371000', '威海市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:31');
INSERT INTO `sys_area` VALUES (371002, 371000, '0,1,370000,371000,', '371002', '环翠区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:31');
INSERT INTO `sys_area` VALUES (371040, 371000, '0,1,370000,371000,', '371040', '高技术产业开发区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:32');
INSERT INTO `sys_area` VALUES (371041, 371000, '0,1,370000,371000,', '371041', '经济技术开发区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:32');
INSERT INTO `sys_area` VALUES (371081, 371000, '0,1,370000,371000,', '371081', '文登市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:32');
INSERT INTO `sys_area` VALUES (371082, 371000, '0,1,370000,371000,', '371082', '荣成市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:32');
INSERT INTO `sys_area` VALUES (371083, 371000, '0,1,370000,371000,', '371083', '乳山市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:32');
INSERT INTO `sys_area` VALUES (371100, 370000, '0,1,370000,', '371100', '日照市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:33');
INSERT INTO `sys_area` VALUES (371102, 371100, '0,1,370000,371100,', '371102', '东港区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:33');
INSERT INTO `sys_area` VALUES (371103, 371100, '0,1,370000,371100,', '371103', '岚山区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:33');
INSERT INTO `sys_area` VALUES (371121, 371100, '0,1,370000,371100,', '371121', '五莲县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:33');
INSERT INTO `sys_area` VALUES (371122, 371100, '0,1,370000,371100,', '371122', '莒县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:33');
INSERT INTO `sys_area` VALUES (371140, 371100, '0,1,370000,371100,', '371140', '经济开发区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:33');
INSERT INTO `sys_area` VALUES (371141, 371100, '0,1,370000,371100,', '371141', '山海天旅游度假区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:33');
INSERT INTO `sys_area` VALUES (371200, 370000, '0,1,370000,', '371200', '莱芜市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:34');
INSERT INTO `sys_area` VALUES (371202, 371200, '0,1,370000,371200,', '371202', '莱城区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:34');
INSERT INTO `sys_area` VALUES (371203, 371200, '0,1,370000,371200,', '371203', '钢城区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:34');
INSERT INTO `sys_area` VALUES (371300, 370000, '0,1,370000,', '371300', '临沂市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:34');
INSERT INTO `sys_area` VALUES (371302, 371300, '0,1,370000,371300,', '371302', '兰山区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:34');
INSERT INTO `sys_area` VALUES (371311, 371300, '0,1,370000,371300,', '371311', '罗庄区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:35');
INSERT INTO `sys_area` VALUES (371312, 371300, '0,1,370000,371300,', '371312', '河东区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:35');
INSERT INTO `sys_area` VALUES (371321, 371300, '0,1,370000,371300,', '371321', '沂南县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:35');
INSERT INTO `sys_area` VALUES (371322, 371300, '0,1,370000,371300,', '371322', '郯城县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:35');
INSERT INTO `sys_area` VALUES (371323, 371300, '0,1,370000,371300,', '371323', '沂水县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:35');
INSERT INTO `sys_area` VALUES (371324, 371300, '0,1,370000,371300,', '371324', '苍山县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:35');
INSERT INTO `sys_area` VALUES (371325, 371300, '0,1,370000,371300,', '371325', '费县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:36');
INSERT INTO `sys_area` VALUES (371326, 371300, '0,1,370000,371300,', '371326', '平邑县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:36');
INSERT INTO `sys_area` VALUES (371327, 371300, '0,1,370000,371300,', '371327', '莒南县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:36');
INSERT INTO `sys_area` VALUES (371328, 371300, '0,1,370000,371300,', '371328', '蒙阴县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:36');
INSERT INTO `sys_area` VALUES (371329, 371300, '0,1,370000,371300,', '371329', '临沭县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:36');
INSERT INTO `sys_area` VALUES (371400, 370000, '0,1,370000,', '371400', '德州市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:37');
INSERT INTO `sys_area` VALUES (371402, 371400, '0,1,370000,371400,', '371402', '德城区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:37');
INSERT INTO `sys_area` VALUES (371421, 371400, '0,1,370000,371400,', '371421', '陵县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:37');
INSERT INTO `sys_area` VALUES (371422, 371400, '0,1,370000,371400,', '371422', '宁津县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:37');
INSERT INTO `sys_area` VALUES (371423, 371400, '0,1,370000,371400,', '371423', '庆云县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:37');
INSERT INTO `sys_area` VALUES (371424, 371400, '0,1,370000,371400,', '371424', '临邑县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:38');
INSERT INTO `sys_area` VALUES (371425, 371400, '0,1,370000,371400,', '371425', '齐河县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:38');
INSERT INTO `sys_area` VALUES (371426, 371400, '0,1,370000,371400,', '371426', '平原县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:38');
INSERT INTO `sys_area` VALUES (371427, 371400, '0,1,370000,371400,', '371427', '夏津县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:38');
INSERT INTO `sys_area` VALUES (371428, 371400, '0,1,370000,371400,', '371428', '武城县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:38');
INSERT INTO `sys_area` VALUES (371481, 371400, '0,1,370000,371400,', '371481', '乐陵市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:38');
INSERT INTO `sys_area` VALUES (371482, 371400, '0,1,370000,371400,', '371482', '禹城市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:39');
INSERT INTO `sys_area` VALUES (371500, 370000, '0,1,370000,', '371500', '聊城市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:39');
INSERT INTO `sys_area` VALUES (371502, 371500, '0,1,370000,371500,', '371502', '东昌府区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:39');
INSERT INTO `sys_area` VALUES (371521, 371500, '0,1,370000,371500,', '371521', '阳谷县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:39');
INSERT INTO `sys_area` VALUES (371522, 371500, '0,1,370000,371500,', '371522', '莘县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:39');
INSERT INTO `sys_area` VALUES (371523, 371500, '0,1,370000,371500,', '371523', '茌平县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:39');
INSERT INTO `sys_area` VALUES (371524, 371500, '0,1,370000,371500,', '371524', '东阿县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:40');
INSERT INTO `sys_area` VALUES (371525, 371500, '0,1,370000,371500,', '371525', '冠县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:40');
INSERT INTO `sys_area` VALUES (371526, 371500, '0,1,370000,371500,', '371526', '高唐县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:40');
INSERT INTO `sys_area` VALUES (371581, 371500, '0,1,370000,371500,', '371581', '临清市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:40');
INSERT INTO `sys_area` VALUES (371600, 370000, '0,1,370000,', '371600', '滨州市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:40');
INSERT INTO `sys_area` VALUES (371602, 371600, '0,1,370000,371600,', '371602', '滨城区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:41');
INSERT INTO `sys_area` VALUES (371621, 371600, '0,1,370000,371600,', '371621', '惠民县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:41');
INSERT INTO `sys_area` VALUES (371622, 371600, '0,1,370000,371600,', '371622', '阳信县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:41');
INSERT INTO `sys_area` VALUES (371623, 371600, '0,1,370000,371600,', '371623', '无棣县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:41');
INSERT INTO `sys_area` VALUES (371624, 371600, '0,1,370000,371600,', '371624', '沾化县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:41');
INSERT INTO `sys_area` VALUES (371625, 371600, '0,1,370000,371600,', '371625', '博兴县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:41');
INSERT INTO `sys_area` VALUES (371626, 371600, '0,1,370000,371600,', '371626', '邹平县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:42');
INSERT INTO `sys_area` VALUES (371640, 371600, '0,1,370000,371600,', '371640', '开发区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:42');
INSERT INTO `sys_area` VALUES (371700, 370000, '0,1,370000,', '371700', '菏泽市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:42');
INSERT INTO `sys_area` VALUES (371702, 371700, '0,1,370000,371700,', '371702', '牡丹区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:42');
INSERT INTO `sys_area` VALUES (371721, 371700, '0,1,370000,371700,', '371721', '曹县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:43');
INSERT INTO `sys_area` VALUES (371722, 371700, '0,1,370000,371700,', '371722', '单县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:43');
INSERT INTO `sys_area` VALUES (371723, 371700, '0,1,370000,371700,', '371723', '成武县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:43');
INSERT INTO `sys_area` VALUES (371724, 371700, '0,1,370000,371700,', '371724', '巨野县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:43');
INSERT INTO `sys_area` VALUES (371725, 371700, '0,1,370000,371700,', '371725', '郓城县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:43');
INSERT INTO `sys_area` VALUES (371726, 371700, '0,1,370000,371700,', '371726', '鄄城县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:43');
INSERT INTO `sys_area` VALUES (371727, 371700, '0,1,370000,371700,', '371727', '定陶县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:44');
INSERT INTO `sys_area` VALUES (371728, 371700, '0,1,370000,371700,', '371728', '东明县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:44');
INSERT INTO `sys_area` VALUES (410000, 1, '0,1,', '410000', '河南省', 2, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (410100, 410000, '0,1,410000,', '410100', '郑州市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:44');
INSERT INTO `sys_area` VALUES (410102, 410100, '0,1,410000,410100,', '410102', '中原区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:44');
INSERT INTO `sys_area` VALUES (410103, 410100, '0,1,410000,410100,', '410103', '二七区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:45');
INSERT INTO `sys_area` VALUES (410104, 410100, '0,1,410000,410100,', '410104', '管城回族区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:45');
INSERT INTO `sys_area` VALUES (410105, 410100, '0,1,410000,410100,', '410105', '金水区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:45');
INSERT INTO `sys_area` VALUES (410106, 410100, '0,1,410000,410100,', '410106', '上街区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:45');
INSERT INTO `sys_area` VALUES (410108, 410100, '0,1,410000,410100,', '410108', '惠济区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:45');
INSERT INTO `sys_area` VALUES (410122, 410100, '0,1,410000,410100,', '410122', '中牟县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:45');
INSERT INTO `sys_area` VALUES (410181, 410100, '0,1,410000,410100,', '410181', '巩义市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:46');
INSERT INTO `sys_area` VALUES (410182, 410100, '0,1,410000,410100,', '410182', '荥阳市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:46');
INSERT INTO `sys_area` VALUES (410183, 410100, '0,1,410000,410100,', '410183', '新密市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:46');
INSERT INTO `sys_area` VALUES (410184, 410100, '0,1,410000,410100,', '410184', '新郑市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:46');
INSERT INTO `sys_area` VALUES (410185, 410100, '0,1,410000,410100,', '410185', '登封市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:46');
INSERT INTO `sys_area` VALUES (410200, 410000, '0,1,410000,', '410200', '开封市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:47');
INSERT INTO `sys_area` VALUES (410202, 410200, '0,1,410000,410200,', '410202', '龙亭区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:47');
INSERT INTO `sys_area` VALUES (410203, 410200, '0,1,410000,410200,', '410203', '顺河回族区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:47');
INSERT INTO `sys_area` VALUES (410204, 410200, '0,1,410000,410200,', '410204', '鼓楼区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:47');
INSERT INTO `sys_area` VALUES (410205, 410200, '0,1,410000,410200,', '410205', '禹王台区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:47');
INSERT INTO `sys_area` VALUES (410211, 410200, '0,1,410000,410200,', '410211', '金明区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:48');
INSERT INTO `sys_area` VALUES (410221, 410200, '0,1,410000,410200,', '410221', '杞县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:48');
INSERT INTO `sys_area` VALUES (410222, 410200, '0,1,410000,410200,', '410222', '通许县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:48');
INSERT INTO `sys_area` VALUES (410223, 410200, '0,1,410000,410200,', '410223', '尉氏县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:48');
INSERT INTO `sys_area` VALUES (410224, 410200, '0,1,410000,410200,', '410224', '开封县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:49');
INSERT INTO `sys_area` VALUES (410225, 410200, '0,1,410000,410200,', '410225', '兰考县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:49');
INSERT INTO `sys_area` VALUES (410300, 410000, '0,1,410000,', '410300', '洛阳市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:49');
INSERT INTO `sys_area` VALUES (410302, 410300, '0,1,410000,410300,', '410302', '老城区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:49');
INSERT INTO `sys_area` VALUES (410303, 410300, '0,1,410000,410300,', '410303', '西工区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:49');
INSERT INTO `sys_area` VALUES (410304, 410300, '0,1,410000,410300,', '410304', '瀍河回族区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:50');
INSERT INTO `sys_area` VALUES (410305, 410300, '0,1,410000,410300,', '410305', '涧西区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:50');
INSERT INTO `sys_area` VALUES (410306, 410300, '0,1,410000,410300,', '410306', '吉利区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:50');
INSERT INTO `sys_area` VALUES (410311, 410300, '0,1,410000,410300,', '410311', '洛龙区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:50');
INSERT INTO `sys_area` VALUES (410322, 410300, '0,1,410000,410300,', '410322', '孟津县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:50');
INSERT INTO `sys_area` VALUES (410323, 410300, '0,1,410000,410300,', '410323', '新安县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:51');
INSERT INTO `sys_area` VALUES (410324, 410300, '0,1,410000,410300,', '410324', '栾川县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:51');
INSERT INTO `sys_area` VALUES (410325, 410300, '0,1,410000,410300,', '410325', '嵩县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:51');
INSERT INTO `sys_area` VALUES (410326, 410300, '0,1,410000,410300,', '410326', '汝阳县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:51');
INSERT INTO `sys_area` VALUES (410327, 410300, '0,1,410000,410300,', '410327', '宜阳县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:51');
INSERT INTO `sys_area` VALUES (410328, 410300, '0,1,410000,410300,', '410328', '洛宁县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:52');
INSERT INTO `sys_area` VALUES (410329, 410300, '0,1,410000,410300,', '410329', '伊川县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:52');
INSERT INTO `sys_area` VALUES (410340, 410300, '0,1,410000,410300,', '410340', '高新技术开发区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:52');
INSERT INTO `sys_area` VALUES (410381, 410300, '0,1,410000,410300,', '410381', '偃师市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:52');
INSERT INTO `sys_area` VALUES (410400, 410000, '0,1,410000,', '410400', '平顶山市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:52');
INSERT INTO `sys_area` VALUES (410402, 410400, '0,1,410000,410400,', '410402', '新华区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:52');
INSERT INTO `sys_area` VALUES (410403, 410400, '0,1,410000,410400,', '410403', '卫东区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:53');
INSERT INTO `sys_area` VALUES (410404, 410400, '0,1,410000,410400,', '410404', '石龙区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:53');
INSERT INTO `sys_area` VALUES (410411, 410400, '0,1,410000,410400,', '410411', '湛河区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:53');
INSERT INTO `sys_area` VALUES (410421, 410400, '0,1,410000,410400,', '410421', '宝丰县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:53');
INSERT INTO `sys_area` VALUES (410422, 410400, '0,1,410000,410400,', '410422', '叶县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:53');
INSERT INTO `sys_area` VALUES (410423, 410400, '0,1,410000,410400,', '410423', '鲁山县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:54');
INSERT INTO `sys_area` VALUES (410425, 410400, '0,1,410000,410400,', '410425', '郏县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:54');
INSERT INTO `sys_area` VALUES (410481, 410400, '0,1,410000,410400,', '410481', '舞钢市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:54');
INSERT INTO `sys_area` VALUES (410482, 410400, '0,1,410000,410400,', '410482', '汝州市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:54');
INSERT INTO `sys_area` VALUES (410500, 410000, '0,1,410000,', '410500', '安阳市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:55');
INSERT INTO `sys_area` VALUES (410502, 410500, '0,1,410000,410500,', '410502', '文峰区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:55');
INSERT INTO `sys_area` VALUES (410503, 410500, '0,1,410000,410500,', '410503', '北关区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:55');
INSERT INTO `sys_area` VALUES (410505, 410500, '0,1,410000,410500,', '410505', '殷都区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:55');
INSERT INTO `sys_area` VALUES (410506, 410500, '0,1,410000,410500,', '410506', '龙安区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:55');
INSERT INTO `sys_area` VALUES (410522, 410500, '0,1,410000,410500,', '410522', '安阳县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:55');
INSERT INTO `sys_area` VALUES (410523, 410500, '0,1,410000,410500,', '410523', '汤阴县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:55');
INSERT INTO `sys_area` VALUES (410526, 410500, '0,1,410000,410500,', '410526', '滑县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:56');
INSERT INTO `sys_area` VALUES (410527, 410500, '0,1,410000,410500,', '410527', '内黄县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:56');
INSERT INTO `sys_area` VALUES (410540, 410500, '0,1,410000,410500,', '410540', '开发区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:56');
INSERT INTO `sys_area` VALUES (410581, 410500, '0,1,410000,410500,', '410581', '林州市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:56');
INSERT INTO `sys_area` VALUES (410600, 410000, '0,1,410000,', '410600', '鹤壁市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:56');
INSERT INTO `sys_area` VALUES (410602, 410600, '0,1,410000,410600,', '410602', '鹤山区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:56');
INSERT INTO `sys_area` VALUES (410603, 410600, '0,1,410000,410600,', '410603', '山城区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:57');
INSERT INTO `sys_area` VALUES (410611, 410600, '0,1,410000,410600,', '410611', '淇滨区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:57');
INSERT INTO `sys_area` VALUES (410621, 410600, '0,1,410000,410600,', '410621', '浚县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:57');
INSERT INTO `sys_area` VALUES (410622, 410600, '0,1,410000,410600,', '410622', '淇县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:57');
INSERT INTO `sys_area` VALUES (410700, 410000, '0,1,410000,', '410700', '新乡市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:57');
INSERT INTO `sys_area` VALUES (410702, 410700, '0,1,410000,410700,', '410702', '红旗区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:57');
INSERT INTO `sys_area` VALUES (410703, 410700, '0,1,410000,410700,', '410703', '卫滨区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:58');
INSERT INTO `sys_area` VALUES (410704, 410700, '0,1,410000,410700,', '410704', '凤泉区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:58');
INSERT INTO `sys_area` VALUES (410711, 410700, '0,1,410000,410700,', '410711', '牧野区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:58');
INSERT INTO `sys_area` VALUES (410721, 410700, '0,1,410000,410700,', '410721', '新乡县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:58');
INSERT INTO `sys_area` VALUES (410724, 410700, '0,1,410000,410700,', '410724', '获嘉县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:58');
INSERT INTO `sys_area` VALUES (410725, 410700, '0,1,410000,410700,', '410725', '原阳县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:59');
INSERT INTO `sys_area` VALUES (410726, 410700, '0,1,410000,410700,', '410726', '延津县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:59');
INSERT INTO `sys_area` VALUES (410727, 410700, '0,1,410000,410700,', '410727', '封丘县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:59');
INSERT INTO `sys_area` VALUES (410728, 410700, '0,1,410000,410700,', '410728', '长垣县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:59');
INSERT INTO `sys_area` VALUES (410740, 410700, '0,1,410000,410700,', '410740', '开发区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:53:59');
INSERT INTO `sys_area` VALUES (410781, 410700, '0,1,410000,410700,', '410781', '卫辉市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:00');
INSERT INTO `sys_area` VALUES (410782, 410700, '0,1,410000,410700,', '410782', '辉县市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:00');
INSERT INTO `sys_area` VALUES (410800, 410000, '0,1,410000,', '410800', '焦作市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:00');
INSERT INTO `sys_area` VALUES (410802, 410800, '0,1,410000,410800,', '410802', '解放区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:00');
INSERT INTO `sys_area` VALUES (410803, 410800, '0,1,410000,410800,', '410803', '中站区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:00');
INSERT INTO `sys_area` VALUES (410804, 410800, '0,1,410000,410800,', '410804', '马村区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:01');
INSERT INTO `sys_area` VALUES (410811, 410800, '0,1,410000,410800,', '410811', '山阳区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:01');
INSERT INTO `sys_area` VALUES (410821, 410800, '0,1,410000,410800,', '410821', '修武县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:01');
INSERT INTO `sys_area` VALUES (410822, 410800, '0,1,410000,410800,', '410822', '博爱县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:01');
INSERT INTO `sys_area` VALUES (410823, 410800, '0,1,410000,410800,', '410823', '武陟县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:01');
INSERT INTO `sys_area` VALUES (410825, 410800, '0,1,410000,410800,', '410825', '温县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:02');
INSERT INTO `sys_area` VALUES (410840, 410800, '0,1,410000,410800,', '410840', '高新区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:02');
INSERT INTO `sys_area` VALUES (410881, 410800, '0,1,410000,410800,', '410881', '济源市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:02');
INSERT INTO `sys_area` VALUES (410882, 410800, '0,1,410000,410800,', '410882', '沁阳市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:02');
INSERT INTO `sys_area` VALUES (410883, 410800, '0,1,410000,410800,', '410883', '孟州市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:02');
INSERT INTO `sys_area` VALUES (410900, 410000, '0,1,410000,', '410900', '濮阳市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:03');
INSERT INTO `sys_area` VALUES (410902, 410900, '0,1,410000,410900,', '410902', '华龙区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:03');
INSERT INTO `sys_area` VALUES (410922, 410900, '0,1,410000,410900,', '410922', '清丰县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:03');
INSERT INTO `sys_area` VALUES (410923, 410900, '0,1,410000,410900,', '410923', '南乐县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:03');
INSERT INTO `sys_area` VALUES (410926, 410900, '0,1,410000,410900,', '410926', '范县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:03');
INSERT INTO `sys_area` VALUES (410927, 410900, '0,1,410000,410900,', '410927', '台前县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:04');
INSERT INTO `sys_area` VALUES (410928, 410900, '0,1,410000,410900,', '410928', '濮阳县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:04');
INSERT INTO `sys_area` VALUES (410940, 410900, '0,1,410000,410900,', '410940', '高新区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:04');
INSERT INTO `sys_area` VALUES (411000, 410000, '0,1,410000,', '411000', '许昌市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:04');
INSERT INTO `sys_area` VALUES (411002, 411000, '0,1,410000,411000,', '411002', '魏都区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:04');
INSERT INTO `sys_area` VALUES (411023, 411000, '0,1,410000,411000,', '411023', '许昌县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:05');
INSERT INTO `sys_area` VALUES (411024, 411000, '0,1,410000,411000,', '411024', '鄢陵县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:05');
INSERT INTO `sys_area` VALUES (411025, 411000, '0,1,410000,411000,', '411025', '襄城县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:05');
INSERT INTO `sys_area` VALUES (411081, 411000, '0,1,410000,411000,', '411081', '禹州市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:05');
INSERT INTO `sys_area` VALUES (411082, 411000, '0,1,410000,411000,', '411082', '长葛市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:05');
INSERT INTO `sys_area` VALUES (411100, 410000, '0,1,410000,', '411100', '漯河市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:06');
INSERT INTO `sys_area` VALUES (411102, 411100, '0,1,410000,411100,', '411102', '源汇区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:06');
INSERT INTO `sys_area` VALUES (411103, 411100, '0,1,410000,411100,', '411103', '郾城区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:06');
INSERT INTO `sys_area` VALUES (411104, 411100, '0,1,410000,411100,', '411104', '召陵区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:06');
INSERT INTO `sys_area` VALUES (411121, 411100, '0,1,410000,411100,', '411121', '舞阳县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:06');
INSERT INTO `sys_area` VALUES (411122, 411100, '0,1,410000,411100,', '411122', '临颍县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:07');
INSERT INTO `sys_area` VALUES (411200, 410000, '0,1,410000,', '411200', '三门峡市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:07');
INSERT INTO `sys_area` VALUES (411202, 411200, '0,1,410000,411200,', '411202', '湖滨区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:07');
INSERT INTO `sys_area` VALUES (411221, 411200, '0,1,410000,411200,', '411221', '渑池县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:07');
INSERT INTO `sys_area` VALUES (411222, 411200, '0,1,410000,411200,', '411222', '陕县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:07');
INSERT INTO `sys_area` VALUES (411224, 411200, '0,1,410000,411200,', '411224', '卢氏县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:08');
INSERT INTO `sys_area` VALUES (411281, 411200, '0,1,410000,411200,', '411281', '义马市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:08');
INSERT INTO `sys_area` VALUES (411282, 411200, '0,1,410000,411200,', '411282', '灵宝市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:08');
INSERT INTO `sys_area` VALUES (411300, 410000, '0,1,410000,', '411300', '南阳市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:08');
INSERT INTO `sys_area` VALUES (411302, 411300, '0,1,410000,411300,', '411302', '宛城区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:08');
INSERT INTO `sys_area` VALUES (411303, 411300, '0,1,410000,411300,', '411303', '卧龙区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:09');
INSERT INTO `sys_area` VALUES (411321, 411300, '0,1,410000,411300,', '411321', '南召县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:09');
INSERT INTO `sys_area` VALUES (411322, 411300, '0,1,410000,411300,', '411322', '方城县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:09');
INSERT INTO `sys_area` VALUES (411323, 411300, '0,1,410000,411300,', '411323', '西峡县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:09');
INSERT INTO `sys_area` VALUES (411324, 411300, '0,1,410000,411300,', '411324', '镇平县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:09');
INSERT INTO `sys_area` VALUES (411325, 411300, '0,1,410000,411300,', '411325', '内乡县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:09');
INSERT INTO `sys_area` VALUES (411326, 411300, '0,1,410000,411300,', '411326', '淅川县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:10');
INSERT INTO `sys_area` VALUES (411327, 411300, '0,1,410000,411300,', '411327', '社旗县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:10');
INSERT INTO `sys_area` VALUES (411328, 411300, '0,1,410000,411300,', '411328', '唐河县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:10');
INSERT INTO `sys_area` VALUES (411329, 411300, '0,1,410000,411300,', '411329', '新野县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:10');
INSERT INTO `sys_area` VALUES (411330, 411300, '0,1,410000,411300,', '411330', '桐柏县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:11');
INSERT INTO `sys_area` VALUES (411381, 411300, '0,1,410000,411300,', '411381', '邓州市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:11');
INSERT INTO `sys_area` VALUES (411400, 410000, '0,1,410000,', '411400', '商丘市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:11');
INSERT INTO `sys_area` VALUES (411402, 411400, '0,1,410000,411400,', '411402', '梁园区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:11');
INSERT INTO `sys_area` VALUES (411403, 411400, '0,1,410000,411400,', '411403', '睢阳区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:11');
INSERT INTO `sys_area` VALUES (411421, 411400, '0,1,410000,411400,', '411421', '民权县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:12');
INSERT INTO `sys_area` VALUES (411422, 411400, '0,1,410000,411400,', '411422', '睢县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:12');
INSERT INTO `sys_area` VALUES (411423, 411400, '0,1,410000,411400,', '411423', '宁陵县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:12');
INSERT INTO `sys_area` VALUES (411424, 411400, '0,1,410000,411400,', '411424', '柘城县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:12');
INSERT INTO `sys_area` VALUES (411425, 411400, '0,1,410000,411400,', '411425', '虞城县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:12');
INSERT INTO `sys_area` VALUES (411426, 411400, '0,1,410000,411400,', '411426', '夏邑县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:13');
INSERT INTO `sys_area` VALUES (411440, 411400, '0,1,410000,411400,', '411440', '开发区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:13');
INSERT INTO `sys_area` VALUES (411481, 411400, '0,1,410000,411400,', '411481', '永城市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:13');
INSERT INTO `sys_area` VALUES (411500, 410000, '0,1,410000,', '411500', '信阳市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:13');
INSERT INTO `sys_area` VALUES (411502, 411500, '0,1,410000,411500,', '411502', '浉河区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:13');
INSERT INTO `sys_area` VALUES (411503, 411500, '0,1,410000,411500,', '411503', '平桥区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:13');
INSERT INTO `sys_area` VALUES (411521, 411500, '0,1,410000,411500,', '411521', '罗山县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:14');
INSERT INTO `sys_area` VALUES (411522, 411500, '0,1,410000,411500,', '411522', '光山县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:14');
INSERT INTO `sys_area` VALUES (411523, 411500, '0,1,410000,411500,', '411523', '新县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:14');
INSERT INTO `sys_area` VALUES (411524, 411500, '0,1,410000,411500,', '411524', '商城县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:14');
INSERT INTO `sys_area` VALUES (411525, 411500, '0,1,410000,411500,', '411525', '固始县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:14');
INSERT INTO `sys_area` VALUES (411526, 411500, '0,1,410000,411500,', '411526', '潢川县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:14');
INSERT INTO `sys_area` VALUES (411527, 411500, '0,1,410000,411500,', '411527', '淮滨县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:15');
INSERT INTO `sys_area` VALUES (411528, 411500, '0,1,410000,411500,', '411528', '息县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:15');
INSERT INTO `sys_area` VALUES (411600, 410000, '0,1,410000,', '411600', '周口市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:15');
INSERT INTO `sys_area` VALUES (411602, 411600, '0,1,410000,411600,', '411602', '川汇区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:15');
INSERT INTO `sys_area` VALUES (411621, 411600, '0,1,410000,411600,', '411621', '扶沟县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:15');
INSERT INTO `sys_area` VALUES (411622, 411600, '0,1,410000,411600,', '411622', '西华县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:15');
INSERT INTO `sys_area` VALUES (411623, 411600, '0,1,410000,411600,', '411623', '商水县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:16');
INSERT INTO `sys_area` VALUES (411624, 411600, '0,1,410000,411600,', '411624', '沈丘县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:16');
INSERT INTO `sys_area` VALUES (411625, 411600, '0,1,410000,411600,', '411625', '郸城县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:16');
INSERT INTO `sys_area` VALUES (411626, 411600, '0,1,410000,411600,', '411626', '淮阳县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:16');
INSERT INTO `sys_area` VALUES (411627, 411600, '0,1,410000,411600,', '411627', '太康县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:16');
INSERT INTO `sys_area` VALUES (411628, 411600, '0,1,410000,411600,', '411628', '鹿邑县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:16');
INSERT INTO `sys_area` VALUES (411640, 411600, '0,1,410000,411600,', '411640', '黄泛区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:16');
INSERT INTO `sys_area` VALUES (411681, 411600, '0,1,410000,411600,', '411681', '项城市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:17');
INSERT INTO `sys_area` VALUES (411700, 410000, '0,1,410000,', '411700', '驻马店市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:17');
INSERT INTO `sys_area` VALUES (411702, 411700, '0,1,410000,411700,', '411702', '驿城区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:17');
INSERT INTO `sys_area` VALUES (411721, 411700, '0,1,410000,411700,', '411721', '西平县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:17');
INSERT INTO `sys_area` VALUES (411722, 411700, '0,1,410000,411700,', '411722', '上蔡县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:17');
INSERT INTO `sys_area` VALUES (411723, 411700, '0,1,410000,411700,', '411723', '平舆县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:18');
INSERT INTO `sys_area` VALUES (411724, 411700, '0,1,410000,411700,', '411724', '正阳县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:18');
INSERT INTO `sys_area` VALUES (411725, 411700, '0,1,410000,411700,', '411725', '确山县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:18');
INSERT INTO `sys_area` VALUES (411726, 411700, '0,1,410000,411700,', '411726', '泌阳县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:18');
INSERT INTO `sys_area` VALUES (411727, 411700, '0,1,410000,411700,', '411727', '汝南县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:18');
INSERT INTO `sys_area` VALUES (411728, 411700, '0,1,410000,411700,', '411728', '遂平县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:19');
INSERT INTO `sys_area` VALUES (411729, 411700, '0,1,410000,411700,', '411729', '新蔡县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:19');
INSERT INTO `sys_area` VALUES (411740, 411700, '0,1,410000,411700,', '411740', '高新区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:19');
INSERT INTO `sys_area` VALUES (411800, 410000, '0,1,410000,', '411800', '济源市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:19');
INSERT INTO `sys_area` VALUES (420000, 1, '0,1,', '420000', '湖北省', 2, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (420100, 420000, '0,1,420000,', '420100', '武汉市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:20');
INSERT INTO `sys_area` VALUES (420102, 420100, '0,1,420000,420100,', '420102', '江岸区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:20');
INSERT INTO `sys_area` VALUES (420103, 420100, '0,1,420000,420100,', '420103', '江汉区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:20');
INSERT INTO `sys_area` VALUES (420104, 420100, '0,1,420000,420100,', '420104', '硚口区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:20');
INSERT INTO `sys_area` VALUES (420105, 420100, '0,1,420000,420100,', '420105', '汉阳区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:20');
INSERT INTO `sys_area` VALUES (420106, 420100, '0,1,420000,420100,', '420106', '武昌区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:20');
INSERT INTO `sys_area` VALUES (420107, 420100, '0,1,420000,420100,', '420107', '青山区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:21');
INSERT INTO `sys_area` VALUES (420111, 420100, '0,1,420000,420100,', '420111', '洪山区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:21');
INSERT INTO `sys_area` VALUES (420112, 420100, '0,1,420000,420100,', '420112', '东西湖区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:21');
INSERT INTO `sys_area` VALUES (420113, 420100, '0,1,420000,420100,', '420113', '汉南区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:21');
INSERT INTO `sys_area` VALUES (420114, 420100, '0,1,420000,420100,', '420114', '蔡甸区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:21');
INSERT INTO `sys_area` VALUES (420115, 420100, '0,1,420000,420100,', '420115', '江夏区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:21');
INSERT INTO `sys_area` VALUES (420116, 420100, '0,1,420000,420100,', '420116', '黄陂区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:22');
INSERT INTO `sys_area` VALUES (420117, 420100, '0,1,420000,420100,', '420117', '新洲区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:22');
INSERT INTO `sys_area` VALUES (420140, 420100, '0,1,420000,420100,', '420140', '东湖高新开发区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:22');
INSERT INTO `sys_area` VALUES (420141, 420100, '0,1,420000,420100,', '420141', '经济开发区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:22');
INSERT INTO `sys_area` VALUES (420200, 420000, '0,1,420000,', '420200', '黄石市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:23');
INSERT INTO `sys_area` VALUES (420202, 420200, '0,1,420000,420200,', '420202', '黄石港区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:23');
INSERT INTO `sys_area` VALUES (420203, 420200, '0,1,420000,420200,', '420203', '西塞山区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:23');
INSERT INTO `sys_area` VALUES (420204, 420200, '0,1,420000,420200,', '420204', '下陆区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:23');
INSERT INTO `sys_area` VALUES (420205, 420200, '0,1,420000,420200,', '420205', '铁山区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:23');
INSERT INTO `sys_area` VALUES (420222, 420200, '0,1,420000,420200,', '420222', '阳新县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:23');
INSERT INTO `sys_area` VALUES (420281, 420200, '0,1,420000,420200,', '420281', '大冶市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:23');
INSERT INTO `sys_area` VALUES (420300, 420000, '0,1,420000,', '420300', '十堰市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:24');
INSERT INTO `sys_area` VALUES (420302, 420300, '0,1,420000,420300,', '420302', '茅箭区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:24');
INSERT INTO `sys_area` VALUES (420303, 420300, '0,1,420000,420300,', '420303', '张湾区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:24');
INSERT INTO `sys_area` VALUES (420321, 420300, '0,1,420000,420300,', '420321', '郧县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:24');
INSERT INTO `sys_area` VALUES (420322, 420300, '0,1,420000,420300,', '420322', '郧西县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:24');
INSERT INTO `sys_area` VALUES (420323, 420300, '0,1,420000,420300,', '420323', '竹山县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:25');
INSERT INTO `sys_area` VALUES (420324, 420300, '0,1,420000,420300,', '420324', '竹溪县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:25');
INSERT INTO `sys_area` VALUES (420325, 420300, '0,1,420000,420300,', '420325', '房县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:25');
INSERT INTO `sys_area` VALUES (420340, 420300, '0,1,420000,420300,', '420340', '武当山特区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:25');
INSERT INTO `sys_area` VALUES (420381, 420300, '0,1,420000,420300,', '420381', '丹江口市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:25');
INSERT INTO `sys_area` VALUES (420500, 420000, '0,1,420000,', '420500', '宜昌市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:26');
INSERT INTO `sys_area` VALUES (420502, 420500, '0,1,420000,420500,', '420502', '西陵区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:26');
INSERT INTO `sys_area` VALUES (420503, 420500, '0,1,420000,420500,', '420503', '伍家岗区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:26');
INSERT INTO `sys_area` VALUES (420504, 420500, '0,1,420000,420500,', '420504', '点军区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:26');
INSERT INTO `sys_area` VALUES (420505, 420500, '0,1,420000,420500,', '420505', '猇亭区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:26');
INSERT INTO `sys_area` VALUES (420506, 420500, '0,1,420000,420500,', '420506', '夷陵区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:26');
INSERT INTO `sys_area` VALUES (420525, 420500, '0,1,420000,420500,', '420525', '远安县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:27');
INSERT INTO `sys_area` VALUES (420526, 420500, '0,1,420000,420500,', '420526', '兴山县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:27');
INSERT INTO `sys_area` VALUES (420527, 420500, '0,1,420000,420500,', '420527', '秭归县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:27');
INSERT INTO `sys_area` VALUES (420528, 420500, '0,1,420000,420500,', '420528', '长阳土家族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:27');
INSERT INTO `sys_area` VALUES (420529, 420500, '0,1,420000,420500,', '420529', '五峰土家族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:27');
INSERT INTO `sys_area` VALUES (420540, 420500, '0,1,420000,420500,', '420540', '开发区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:27');
INSERT INTO `sys_area` VALUES (420581, 420500, '0,1,420000,420500,', '420581', '宜都市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:27');
INSERT INTO `sys_area` VALUES (420582, 420500, '0,1,420000,420500,', '420582', '当阳市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:28');
INSERT INTO `sys_area` VALUES (420583, 420500, '0,1,420000,420500,', '420583', '枝江市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:28');
INSERT INTO `sys_area` VALUES (420600, 420000, '0,1,420000,', '420600', '襄樊市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:28');
INSERT INTO `sys_area` VALUES (420602, 420600, '0,1,420000,420600,', '420602', '襄城区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:28');
INSERT INTO `sys_area` VALUES (420606, 420600, '0,1,420000,420600,', '420606', '樊城区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:28');
INSERT INTO `sys_area` VALUES (420607, 420600, '0,1,420000,420600,', '420607', '襄阳区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:28');
INSERT INTO `sys_area` VALUES (420624, 420600, '0,1,420000,420600,', '420624', '南漳县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:29');
INSERT INTO `sys_area` VALUES (420625, 420600, '0,1,420000,420600,', '420625', '谷城县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:29');
INSERT INTO `sys_area` VALUES (420626, 420600, '0,1,420000,420600,', '420626', '保康县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:29');
INSERT INTO `sys_area` VALUES (420640, 420600, '0,1,420000,420600,', '420640', '高新技术开发区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:29');
INSERT INTO `sys_area` VALUES (420682, 420600, '0,1,420000,420600,', '420682', '老河口市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:29');
INSERT INTO `sys_area` VALUES (420683, 420600, '0,1,420000,420600,', '420683', '枣阳市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:30');
INSERT INTO `sys_area` VALUES (420684, 420600, '0,1,420000,420600,', '420684', '宜城市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:30');
INSERT INTO `sys_area` VALUES (420700, 420000, '0,1,420000,', '420700', '鄂州市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:30');
INSERT INTO `sys_area` VALUES (420702, 420600, '0,1,420000,420600,', '420702', '梁子湖区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:31');
INSERT INTO `sys_area` VALUES (420703, 420600, '0,1,420000,420600,', '420703', '华容区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:31');
INSERT INTO `sys_area` VALUES (420704, 420600, '0,1,420000,420600,', '420704', '鄂城区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:31');
INSERT INTO `sys_area` VALUES (420740, 420600, '0,1,420000,420600,', '420740', '葛店开发区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:31');
INSERT INTO `sys_area` VALUES (420741, 420600, '0,1,420000,420600,', '420741', '长港农场', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:31');
INSERT INTO `sys_area` VALUES (420800, 420000, '0,1,420000,', '420800', '荆门市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:32');
INSERT INTO `sys_area` VALUES (420802, 420800, '0,1,420000,420800,', '420802', '东宝区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:32');
INSERT INTO `sys_area` VALUES (420804, 420800, '0,1,420000,420800,', '420804', '掇刀区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:32');
INSERT INTO `sys_area` VALUES (420821, 420800, '0,1,420000,420800,', '420821', '京山县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:32');
INSERT INTO `sys_area` VALUES (420822, 420800, '0,1,420000,420800,', '420822', '沙洋县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:32');
INSERT INTO `sys_area` VALUES (420840, 420800, '0,1,420000,420800,', '420840', '屈家岭管理区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:33');
INSERT INTO `sys_area` VALUES (420881, 420800, '0,1,420000,420800,', '420881', '钟祥市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:33');
INSERT INTO `sys_area` VALUES (420900, 420000, '0,1,420000,', '420900', '孝感市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:33');
INSERT INTO `sys_area` VALUES (420902, 420900, '0,1,420000,420900,', '420902', '孝南区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:33');
INSERT INTO `sys_area` VALUES (420921, 420900, '0,1,420000,420900,', '420921', '孝昌县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:33');
INSERT INTO `sys_area` VALUES (420922, 420900, '0,1,420000,420900,', '420922', '大悟县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:34');
INSERT INTO `sys_area` VALUES (420923, 420900, '0,1,420000,420900,', '420923', '云梦县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:34');
INSERT INTO `sys_area` VALUES (420981, 420900, '0,1,420000,420900,', '420981', '应城市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:34');
INSERT INTO `sys_area` VALUES (420982, 420900, '0,1,420000,420900,', '420982', '安陆市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:34');
INSERT INTO `sys_area` VALUES (420984, 420900, '0,1,420000,420900,', '420984', '汉川市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:34');
INSERT INTO `sys_area` VALUES (421000, 420000, '0,1,420000,', '421000', '荆州市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:35');
INSERT INTO `sys_area` VALUES (421002, 421000, '0,1,420000,421000,', '421002', '沙市区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:35');
INSERT INTO `sys_area` VALUES (421003, 421000, '0,1,420000,421000,', '421003', '荆州区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:35');
INSERT INTO `sys_area` VALUES (421022, 421000, '0,1,420000,421000,', '421022', '公安县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:35');
INSERT INTO `sys_area` VALUES (421023, 421000, '0,1,420000,421000,', '421023', '监利县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:36');
INSERT INTO `sys_area` VALUES (421024, 421000, '0,1,420000,421000,', '421024', '江陵县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:36');
INSERT INTO `sys_area` VALUES (421081, 421000, '0,1,420000,421000,', '421081', '石首市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:36');
INSERT INTO `sys_area` VALUES (421083, 421000, '0,1,420000,421000,', '421083', '洪湖市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:36');
INSERT INTO `sys_area` VALUES (421087, 421000, '0,1,420000,421000,', '421087', '松滋市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:36');
INSERT INTO `sys_area` VALUES (421100, 420000, '0,1,420000,', '421100', '黄冈市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:37');
INSERT INTO `sys_area` VALUES (421102, 421100, '0,1,420000,421100,', '421102', '黄州区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:37');
INSERT INTO `sys_area` VALUES (421121, 421100, '0,1,420000,421100,', '421121', '团风县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:37');
INSERT INTO `sys_area` VALUES (421122, 421100, '0,1,420000,421100,', '421122', '红安县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:37');
INSERT INTO `sys_area` VALUES (421123, 421100, '0,1,420000,421100,', '421123', '罗田县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:37');
INSERT INTO `sys_area` VALUES (421124, 421100, '0,1,420000,421100,', '421124', '英山县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:37');
INSERT INTO `sys_area` VALUES (421125, 421100, '0,1,420000,421100,', '421125', '浠水县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:38');
INSERT INTO `sys_area` VALUES (421126, 421100, '0,1,420000,421100,', '421126', '蕲春县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:38');
INSERT INTO `sys_area` VALUES (421127, 421100, '0,1,420000,421100,', '421127', '黄梅县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:38');
INSERT INTO `sys_area` VALUES (421181, 421100, '0,1,420000,421100,', '421181', '麻城市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:38');
INSERT INTO `sys_area` VALUES (421182, 421100, '0,1,420000,421100,', '421182', '武穴市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:39');
INSERT INTO `sys_area` VALUES (421200, 420000, '0,1,420000,', '421200', '咸宁市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:39');
INSERT INTO `sys_area` VALUES (421202, 421200, '0,1,420000,421200,', '421202', '咸安区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:39');
INSERT INTO `sys_area` VALUES (421221, 421200, '0,1,420000,421200,', '421221', '嘉鱼县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:39');
INSERT INTO `sys_area` VALUES (421222, 421200, '0,1,420000,421200,', '421222', '通城县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:39');
INSERT INTO `sys_area` VALUES (421223, 421200, '0,1,420000,421200,', '421223', '崇阳县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:39');
INSERT INTO `sys_area` VALUES (421224, 421200, '0,1,420000,421200,', '421224', '通山县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:40');
INSERT INTO `sys_area` VALUES (421281, 421200, '0,1,420000,421200,', '421281', '赤壁市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:40');
INSERT INTO `sys_area` VALUES (421300, 420000, '0,1,420000,', '421300', '随州市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:40');
INSERT INTO `sys_area` VALUES (421302, 421300, '0,1,420000,421300,', '421302', '曾都区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:40');
INSERT INTO `sys_area` VALUES (421381, 421300, '0,1,420000,421300,', '421381', '广水市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:40');
INSERT INTO `sys_area` VALUES (422800, 420000, '0,1,420000,', '422800', '恩施土家族苗族自治州', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:41');
INSERT INTO `sys_area` VALUES (422801, 422800, '0,1,420000,422800,', '422801', '恩施市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:41');
INSERT INTO `sys_area` VALUES (422802, 422800, '0,1,420000,422800,', '422802', '利川市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:41');
INSERT INTO `sys_area` VALUES (422822, 422800, '0,1,420000,422800,', '422822', '建始县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:41');
INSERT INTO `sys_area` VALUES (422823, 422800, '0,1,420000,422800,', '422823', '巴东县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:41');
INSERT INTO `sys_area` VALUES (422825, 422800, '0,1,420000,422800,', '422825', '宣恩县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:42');
INSERT INTO `sys_area` VALUES (422826, 422800, '0,1,420000,422800,', '422826', '咸丰县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:42');
INSERT INTO `sys_area` VALUES (422827, 422800, '0,1,420000,422800,', '422827', '来凤县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:42');
INSERT INTO `sys_area` VALUES (422828, 422800, '0,1,420000,422800,', '422828', '鹤峰县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:42');
INSERT INTO `sys_area` VALUES (429000, 420000, '0,1,420000,', '429000', '省直辖县级行政单位', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:43');
INSERT INTO `sys_area` VALUES (429004, 429000, '0,1,420000,429000,', '429004', '仙桃市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:43');
INSERT INTO `sys_area` VALUES (429005, 429000, '0,1,420000,429000,', '429005', '潜江市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:43');
INSERT INTO `sys_area` VALUES (429006, 429000, '0,1,420000,429000,', '429006', '天门市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:43');
INSERT INTO `sys_area` VALUES (429021, 429000, '0,1,420000,429000,', '429021', '神农架林区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:43');
INSERT INTO `sys_area` VALUES (430000, 1, '0,1,', '430000', '湖南省', 2, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (430100, 430000, '0,1,430000,', '430100', '长沙市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:44');
INSERT INTO `sys_area` VALUES (430102, 430100, '0,1,430000,430100,', '430102', '芙蓉区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:44');
INSERT INTO `sys_area` VALUES (430103, 430100, '0,1,430000,430100,', '430103', '天心区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:44');
INSERT INTO `sys_area` VALUES (430104, 430100, '0,1,430000,430100,', '430104', '岳麓区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:44');
INSERT INTO `sys_area` VALUES (430105, 430100, '0,1,430000,430100,', '430105', '开福区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:44');
INSERT INTO `sys_area` VALUES (430111, 430100, '0,1,430000,430100,', '430111', '雨花区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:44');
INSERT INTO `sys_area` VALUES (430121, 430100, '0,1,430000,430100,', '430121', '长沙县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:44');
INSERT INTO `sys_area` VALUES (430122, 430100, '0,1,430000,430100,', '430122', '望城县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:45');
INSERT INTO `sys_area` VALUES (430124, 430100, '0,1,430000,430100,', '430124', '宁乡县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:45');
INSERT INTO `sys_area` VALUES (430181, 430100, '0,1,430000,430100,', '430181', '浏阳市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:45');
INSERT INTO `sys_area` VALUES (430200, 430000, '0,1,430000,', '430200', '株洲市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:45');
INSERT INTO `sys_area` VALUES (430202, 430200, '0,1,430000,430200,', '430202', '荷塘区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:45');
INSERT INTO `sys_area` VALUES (430203, 430200, '0,1,430000,430200,', '430203', '芦淞区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:45');
INSERT INTO `sys_area` VALUES (430204, 430200, '0,1,430000,430200,', '430204', '石峰区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:46');
INSERT INTO `sys_area` VALUES (430211, 430200, '0,1,430000,430200,', '430211', '天元区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:46');
INSERT INTO `sys_area` VALUES (430221, 430200, '0,1,430000,430200,', '430221', '株洲县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:46');
INSERT INTO `sys_area` VALUES (430223, 430200, '0,1,430000,430200,', '430223', '攸县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:46');
INSERT INTO `sys_area` VALUES (430224, 430200, '0,1,430000,430200,', '430224', '茶陵县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:46');
INSERT INTO `sys_area` VALUES (430225, 430200, '0,1,430000,430200,', '430225', '炎陵县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:46');
INSERT INTO `sys_area` VALUES (430240, 430200, '0,1,430000,430200,', '430240', '云龙示范区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:47');
INSERT INTO `sys_area` VALUES (430281, 430200, '0,1,430000,430200,', '430281', '醴陵市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:47');
INSERT INTO `sys_area` VALUES (430300, 430000, '0,1,430000,', '430300', '湘潭市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:47');
INSERT INTO `sys_area` VALUES (430302, 430300, '0,1,430000,430300,', '430302', '雨湖区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:47');
INSERT INTO `sys_area` VALUES (430304, 430300, '0,1,430000,430300,', '430304', '岳塘区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:48');
INSERT INTO `sys_area` VALUES (430321, 430300, '0,1,430000,430300,', '430321', '湘潭县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:48');
INSERT INTO `sys_area` VALUES (430340, 430300, '0,1,430000,430300,', '430340', '高新区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:48');
INSERT INTO `sys_area` VALUES (430381, 430300, '0,1,430000,430300,', '430381', '湘乡市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:48');
INSERT INTO `sys_area` VALUES (430382, 430300, '0,1,430000,430300,', '430382', '韶山市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:48');
INSERT INTO `sys_area` VALUES (430400, 430000, '0,1,430000,', '430400', '衡阳市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:49');
INSERT INTO `sys_area` VALUES (430405, 430400, '0,1,430000,430400,', '430405', '珠晖区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:49');
INSERT INTO `sys_area` VALUES (430406, 430400, '0,1,430000,430400,', '430406', '雁峰区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:49');
INSERT INTO `sys_area` VALUES (430407, 430400, '0,1,430000,430400,', '430407', '石鼓区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:49');
INSERT INTO `sys_area` VALUES (430408, 430400, '0,1,430000,430400,', '430408', '蒸湘区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:49');
INSERT INTO `sys_area` VALUES (430412, 430400, '0,1,430000,430400,', '430412', '南岳区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:49');
INSERT INTO `sys_area` VALUES (430421, 430400, '0,1,430000,430400,', '430421', '衡阳县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:49');
INSERT INTO `sys_area` VALUES (430422, 430400, '0,1,430000,430400,', '430422', '衡南县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:50');
INSERT INTO `sys_area` VALUES (430423, 430400, '0,1,430000,430400,', '430423', '衡山县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:50');
INSERT INTO `sys_area` VALUES (430424, 430400, '0,1,430000,430400,', '430424', '衡东县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:50');
INSERT INTO `sys_area` VALUES (430426, 430400, '0,1,430000,430400,', '430426', '祁东县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:50');
INSERT INTO `sys_area` VALUES (430481, 430400, '0,1,430000,430400,', '430481', '耒阳市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:50');
INSERT INTO `sys_area` VALUES (430482, 430400, '0,1,430000,430400,', '430482', '常宁市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:50');
INSERT INTO `sys_area` VALUES (430500, 430000, '0,1,430000,', '430500', '邵阳市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:51');
INSERT INTO `sys_area` VALUES (430502, 430500, '0,1,430000,430500,', '430502', '双清区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:51');
INSERT INTO `sys_area` VALUES (430503, 430500, '0,1,430000,430500,', '430503', '大祥区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:51');
INSERT INTO `sys_area` VALUES (430511, 430500, '0,1,430000,430500,', '430511', '北塔区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:51');
INSERT INTO `sys_area` VALUES (430521, 430500, '0,1,430000,430500,', '430521', '邵东县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:51');
INSERT INTO `sys_area` VALUES (430522, 430500, '0,1,430000,430500,', '430522', '新邵县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:51');
INSERT INTO `sys_area` VALUES (430523, 430500, '0,1,430000,430500,', '430523', '邵阳县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:52');
INSERT INTO `sys_area` VALUES (430524, 430500, '0,1,430000,430500,', '430524', '隆回县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:52');
INSERT INTO `sys_area` VALUES (430525, 430500, '0,1,430000,430500,', '430525', '洞口县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:52');
INSERT INTO `sys_area` VALUES (430527, 430500, '0,1,430000,430500,', '430527', '绥宁县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:52');
INSERT INTO `sys_area` VALUES (430528, 430500, '0,1,430000,430500,', '430528', '新宁县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:52');
INSERT INTO `sys_area` VALUES (430529, 430500, '0,1,430000,430500,', '430529', '城步苗族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:52');
INSERT INTO `sys_area` VALUES (430581, 430500, '0,1,430000,430500,', '430581', '武冈市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:53');
INSERT INTO `sys_area` VALUES (430600, 430000, '0,1,430000,', '430600', '岳阳市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:53');
INSERT INTO `sys_area` VALUES (430602, 430600, '0,1,430000,430600,', '430602', '岳阳楼区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:53');
INSERT INTO `sys_area` VALUES (430603, 430600, '0,1,430000,430600,', '430603', '云溪区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:53');
INSERT INTO `sys_area` VALUES (430611, 430600, '0,1,430000,430600,', '430611', '君山区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:53');
INSERT INTO `sys_area` VALUES (430621, 430600, '0,1,430000,430600,', '430621', '岳阳县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:54');
INSERT INTO `sys_area` VALUES (430623, 430600, '0,1,430000,430600,', '430623', '华容县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:54');
INSERT INTO `sys_area` VALUES (430624, 430600, '0,1,430000,430600,', '430624', '湘阴县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:54');
INSERT INTO `sys_area` VALUES (430626, 430600, '0,1,430000,430600,', '430626', '平江县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:54');
INSERT INTO `sys_area` VALUES (430640, 430600, '0,1,430000,430600,', '430640', '开发区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:55');
INSERT INTO `sys_area` VALUES (430641, 430600, '0,1,430000,430600,', '430641', '屈原区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:55');
INSERT INTO `sys_area` VALUES (430681, 430600, '0,1,430000,430600,', '430681', '汨罗市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:55');
INSERT INTO `sys_area` VALUES (430682, 430600, '0,1,430000,430600,', '430682', '临湘市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:55');
INSERT INTO `sys_area` VALUES (430700, 430000, '0,1,430000,', '430700', '常德市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:55');
INSERT INTO `sys_area` VALUES (430702, 430700, '0,1,430000,430700,', '430702', '武陵区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:55');
INSERT INTO `sys_area` VALUES (430703, 430700, '0,1,430000,430700,', '430703', '鼎城区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:56');
INSERT INTO `sys_area` VALUES (430721, 430700, '0,1,430000,430700,', '430721', '安乡县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:56');
INSERT INTO `sys_area` VALUES (430722, 430700, '0,1,430000,430700,', '430722', '汉寿县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:56');
INSERT INTO `sys_area` VALUES (430723, 430700, '0,1,430000,430700,', '430723', '澧县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:56');
INSERT INTO `sys_area` VALUES (430724, 430700, '0,1,430000,430700,', '430724', '临澧县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:56');
INSERT INTO `sys_area` VALUES (430725, 430700, '0,1,430000,430700,', '430725', '桃源县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:56');
INSERT INTO `sys_area` VALUES (430726, 430700, '0,1,430000,430700,', '430726', '石门县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:57');
INSERT INTO `sys_area` VALUES (430740, 430700, '0,1,430000,430700,', '430740', '洞庭湖区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:57');
INSERT INTO `sys_area` VALUES (430741, 430700, '0,1,430000,430700,', '430741', '西湖区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:57');
INSERT INTO `sys_area` VALUES (430781, 430700, '0,1,430000,430700,', '430781', '津市市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:57');
INSERT INTO `sys_area` VALUES (430800, 430000, '0,1,430000,', '430800', '张家界市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:57');
INSERT INTO `sys_area` VALUES (430802, 430800, '0,1,430000,430800,', '430802', '永定区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:57');
INSERT INTO `sys_area` VALUES (430811, 430800, '0,1,430000,430800,', '430811', '武陵源区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:58');
INSERT INTO `sys_area` VALUES (430821, 430800, '0,1,430000,430800,', '430821', '慈利县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:58');
INSERT INTO `sys_area` VALUES (430822, 430800, '0,1,430000,430800,', '430822', '桑植县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:58');
INSERT INTO `sys_area` VALUES (430900, 430800, '0,1,430000,430800,', '430900', '益阳市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:59');
INSERT INTO `sys_area` VALUES (430902, 430800, '0,1,430000,430800,', '430902', '资阳区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:59');
INSERT INTO `sys_area` VALUES (430903, 430800, '0,1,430000,430800,', '430903', '赫山区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:59');
INSERT INTO `sys_area` VALUES (430921, 430800, '0,1,430000,430800,', '430921', '南县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:54:59');
INSERT INTO `sys_area` VALUES (430922, 430800, '0,1,430000,430800,', '430922', '桃江县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:00');
INSERT INTO `sys_area` VALUES (430923, 430800, '0,1,430000,430800,', '430923', '安化县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:00');
INSERT INTO `sys_area` VALUES (430940, 430800, '0,1,430000,430800,', '430940', '大通湖区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:00');
INSERT INTO `sys_area` VALUES (430981, 430800, '0,1,430000,430800,', '430981', '沅江市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:00');
INSERT INTO `sys_area` VALUES (431000, 430000, '0,1,430000,', '431000', '郴州市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:01');
INSERT INTO `sys_area` VALUES (431002, 431000, '0,1,430000,431000,', '431002', '北湖区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:01');
INSERT INTO `sys_area` VALUES (431003, 431000, '0,1,430000,431000,', '431003', '苏仙区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:01');
INSERT INTO `sys_area` VALUES (431021, 431000, '0,1,430000,431000,', '431021', '桂阳县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:01');
INSERT INTO `sys_area` VALUES (431022, 431000, '0,1,430000,431000,', '431022', '宜章县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:01');
INSERT INTO `sys_area` VALUES (431023, 431000, '0,1,430000,431000,', '431023', '永兴县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:01');
INSERT INTO `sys_area` VALUES (431024, 431000, '0,1,430000,431000,', '431024', '嘉禾县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:01');
INSERT INTO `sys_area` VALUES (431025, 431000, '0,1,430000,431000,', '431025', '临武县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:02');
INSERT INTO `sys_area` VALUES (431026, 431000, '0,1,430000,431000,', '431026', '汝城县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:02');
INSERT INTO `sys_area` VALUES (431027, 431000, '0,1,430000,431000,', '431027', '桂东县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:02');
INSERT INTO `sys_area` VALUES (431028, 431000, '0,1,430000,431000,', '431028', '安仁县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:02');
INSERT INTO `sys_area` VALUES (431081, 431000, '0,1,430000,431000,', '431081', '资兴市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:02');
INSERT INTO `sys_area` VALUES (431100, 430000, '0,1,430000,', '431100', '永州市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:03');
INSERT INTO `sys_area` VALUES (431102, 431100, '0,1,430000,431100,', '431102', '零陵区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:03');
INSERT INTO `sys_area` VALUES (431103, 431100, '0,1,430000,431100,', '431103', '冷水滩区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:03');
INSERT INTO `sys_area` VALUES (431121, 431100, '0,1,430000,431100,', '431121', '祁阳县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:03');
INSERT INTO `sys_area` VALUES (431122, 431100, '0,1,430000,431100,', '431122', '东安县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:03');
INSERT INTO `sys_area` VALUES (431123, 431100, '0,1,430000,431100,', '431123', '双牌县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:03');
INSERT INTO `sys_area` VALUES (431124, 431100, '0,1,430000,431100,', '431124', '道县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:03');
INSERT INTO `sys_area` VALUES (431125, 431100, '0,1,430000,431100,', '431125', '江永县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:04');
INSERT INTO `sys_area` VALUES (431126, 431100, '0,1,430000,431100,', '431126', '宁远县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:04');
INSERT INTO `sys_area` VALUES (431127, 431100, '0,1,430000,431100,', '431127', '蓝山县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:04');
INSERT INTO `sys_area` VALUES (431128, 431100, '0,1,430000,431100,', '431128', '新田县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:04');
INSERT INTO `sys_area` VALUES (431129, 431100, '0,1,430000,431100,', '431129', '江华瑶族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:04');
INSERT INTO `sys_area` VALUES (431140, 431100, '0,1,430000,431100,', '431140', '回龙圩区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:05');
INSERT INTO `sys_area` VALUES (431200, 430000, '0,1,430000,', '431200', '怀化市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:05');
INSERT INTO `sys_area` VALUES (431202, 431200, '0,1,430000,431200,', '431202', '鹤城区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:05');
INSERT INTO `sys_area` VALUES (431221, 431200, '0,1,430000,431200,', '431221', '中方县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:05');
INSERT INTO `sys_area` VALUES (431222, 431200, '0,1,430000,431200,', '431222', '沅陵县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:05');
INSERT INTO `sys_area` VALUES (431223, 431200, '0,1,430000,431200,', '431223', '辰溪县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:06');
INSERT INTO `sys_area` VALUES (431224, 431200, '0,1,430000,431200,', '431224', '溆浦县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:06');
INSERT INTO `sys_area` VALUES (431225, 431200, '0,1,430000,431200,', '431225', '会同县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:06');
INSERT INTO `sys_area` VALUES (431226, 431200, '0,1,430000,431200,', '431226', '麻阳苗族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:06');
INSERT INTO `sys_area` VALUES (431227, 431200, '0,1,430000,431200,', '431227', '新晃侗族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:06');
INSERT INTO `sys_area` VALUES (431228, 431200, '0,1,430000,431200,', '431228', '芷江侗族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:07');
INSERT INTO `sys_area` VALUES (431229, 431200, '0,1,430000,431200,', '431229', '靖州苗族侗族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:07');
INSERT INTO `sys_area` VALUES (431230, 431200, '0,1,430000,431200,', '431230', '通道侗族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:07');
INSERT INTO `sys_area` VALUES (431240, 431200, '0,1,430000,431200,', '431240', '洪江区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:07');
INSERT INTO `sys_area` VALUES (431281, 431200, '0,1,430000,431200,', '431281', '洪江市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:07');
INSERT INTO `sys_area` VALUES (431300, 430000, '0,1,430000,', '431300', '娄底市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:08');
INSERT INTO `sys_area` VALUES (431302, 431300, '0,1,430000,431300,', '431302', '娄星区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:08');
INSERT INTO `sys_area` VALUES (431321, 431300, '0,1,430000,431300,', '431321', '双峰县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:08');
INSERT INTO `sys_area` VALUES (431322, 431300, '0,1,430000,431300,', '431322', '新化县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:08');
INSERT INTO `sys_area` VALUES (431381, 431300, '0,1,430000,431300,', '431381', '冷水江市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:08');
INSERT INTO `sys_area` VALUES (431382, 431300, '0,1,430000,431300,', '431382', '涟源市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:08');
INSERT INTO `sys_area` VALUES (433100, 430000, '0,1,430000,', '433100', '湘西土家族苗族自治州', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:09');
INSERT INTO `sys_area` VALUES (433101, 433100, '0,1,430000,433100,', '433101', '吉首市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:09');
INSERT INTO `sys_area` VALUES (433122, 433100, '0,1,430000,433100,', '433122', '泸溪县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:09');
INSERT INTO `sys_area` VALUES (433123, 433100, '0,1,430000,433100,', '433123', '凤凰县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:09');
INSERT INTO `sys_area` VALUES (433124, 433100, '0,1,430000,433100,', '433124', '花垣县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:09');
INSERT INTO `sys_area` VALUES (433125, 433100, '0,1,430000,433100,', '433125', '保靖县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:09');
INSERT INTO `sys_area` VALUES (433126, 433100, '0,1,430000,433100,', '433126', '古丈县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:10');
INSERT INTO `sys_area` VALUES (433127, 433100, '0,1,430000,433100,', '433127', '永顺县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:10');
INSERT INTO `sys_area` VALUES (433130, 433100, '0,1,430000,433100,', '433130', '龙山县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:10');
INSERT INTO `sys_area` VALUES (440000, 1, '0,1,', '440000', '广东省', 2, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (440100, 440000, '0,1,440000,', '440100', '广州市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:10');
INSERT INTO `sys_area` VALUES (440103, 440100, '0,1,440000,440100,', '440103', '荔湾区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:11');
INSERT INTO `sys_area` VALUES (440104, 440100, '0,1,440000,440100,', '440104', '越秀区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:11');
INSERT INTO `sys_area` VALUES (440105, 440100, '0,1,440000,440100,', '440105', '海珠区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:11');
INSERT INTO `sys_area` VALUES (440106, 440100, '0,1,440000,440100,', '440106', '天河区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:11');
INSERT INTO `sys_area` VALUES (440111, 440100, '0,1,440000,440100,', '440111', '白云区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:11');
INSERT INTO `sys_area` VALUES (440112, 440100, '0,1,440000,440100,', '440112', '黄埔区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:12');
INSERT INTO `sys_area` VALUES (440113, 440100, '0,1,440000,440100,', '440113', '番禺区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:12');
INSERT INTO `sys_area` VALUES (440114, 440100, '0,1,440000,440100,', '440114', '花都区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:12');
INSERT INTO `sys_area` VALUES (440115, 440100, '0,1,440000,440100,', '440115', '南沙区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:13');
INSERT INTO `sys_area` VALUES (440116, 440100, '0,1,440000,440100,', '440116', '萝岗区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:13');
INSERT INTO `sys_area` VALUES (440183, 440100, '0,1,440000,440100,', '440183', '增城市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:13');
INSERT INTO `sys_area` VALUES (440184, 440100, '0,1,440000,440100,', '440184', '从化市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:13');
INSERT INTO `sys_area` VALUES (440200, 440000, '0,1,440000,', '440200', '韶关市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:13');
INSERT INTO `sys_area` VALUES (440203, 440200, '0,1,440000,440200,', '440203', '武江区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:13');
INSERT INTO `sys_area` VALUES (440204, 440200, '0,1,440000,440200,', '440204', '浈江区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:13');
INSERT INTO `sys_area` VALUES (440205, 440200, '0,1,440000,440200,', '440205', '曲江区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:14');
INSERT INTO `sys_area` VALUES (440222, 440200, '0,1,440000,440200,', '440222', '始兴县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:14');
INSERT INTO `sys_area` VALUES (440224, 440200, '0,1,440000,440200,', '440224', '仁化县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:14');
INSERT INTO `sys_area` VALUES (440229, 440200, '0,1,440000,440200,', '440229', '翁源县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:14');
INSERT INTO `sys_area` VALUES (440232, 440200, '0,1,440000,440200,', '440232', '乳源瑶族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:14');
INSERT INTO `sys_area` VALUES (440233, 440200, '0,1,440000,440200,', '440233', '新丰县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:14');
INSERT INTO `sys_area` VALUES (440281, 440200, '0,1,440000,440200,', '440281', '乐昌市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:15');
INSERT INTO `sys_area` VALUES (440282, 440200, '0,1,440000,440200,', '440282', '南雄市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:15');
INSERT INTO `sys_area` VALUES (440300, 440000, '0,1,440000,', '440300', '深圳市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:15');
INSERT INTO `sys_area` VALUES (440303, 440300, '0,1,440000,440300,', '440303', '罗湖区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:15');
INSERT INTO `sys_area` VALUES (440304, 440300, '0,1,440000,440300,', '440304', '福田区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:15');
INSERT INTO `sys_area` VALUES (440305, 440300, '0,1,440000,440300,', '440305', '南山区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:15');
INSERT INTO `sys_area` VALUES (440306, 440300, '0,1,440000,440300,', '440306', '宝安区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:16');
INSERT INTO `sys_area` VALUES (440307, 440300, '0,1,440000,440300,', '440307', '龙岗区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:16');
INSERT INTO `sys_area` VALUES (440308, 440300, '0,1,440000,440300,', '440308', '盐田区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:16');
INSERT INTO `sys_area` VALUES (440400, 440000, '0,1,440000,', '440400', '珠海市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:16');
INSERT INTO `sys_area` VALUES (440402, 440400, '0,1,440000,440400,', '440402', '香洲区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:16');
INSERT INTO `sys_area` VALUES (440403, 440400, '0,1,440000,440400,', '440403', '斗门区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:16');
INSERT INTO `sys_area` VALUES (440404, 440400, '0,1,440000,440400,', '440404', '金湾区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:17');
INSERT INTO `sys_area` VALUES (440500, 440000, '0,1,440000,', '440500', '汕头市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:17');
INSERT INTO `sys_area` VALUES (440507, 440500, '0,1,440000,440500,', '440507', '龙湖区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:17');
INSERT INTO `sys_area` VALUES (440511, 440500, '0,1,440000,440500,', '440511', '金平区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:17');
INSERT INTO `sys_area` VALUES (440512, 440500, '0,1,440000,440500,', '440512', '濠江区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:17');
INSERT INTO `sys_area` VALUES (440513, 440500, '0,1,440000,440500,', '440513', '潮阳区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:18');
INSERT INTO `sys_area` VALUES (440514, 440500, '0,1,440000,440500,', '440514', '潮南区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:18');
INSERT INTO `sys_area` VALUES (440515, 440500, '0,1,440000,440500,', '440515', '澄海区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:18');
INSERT INTO `sys_area` VALUES (440523, 440500, '0,1,440000,440500,', '440523', '南澳县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:18');
INSERT INTO `sys_area` VALUES (440600, 440000, '0,1,440000,', '440600', '佛山市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:19');
INSERT INTO `sys_area` VALUES (440604, 440600, '0,1,440000,440600,', '440604', '禅城区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:19');
INSERT INTO `sys_area` VALUES (440605, 440600, '0,1,440000,440600,', '440605', '南海区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:19');
INSERT INTO `sys_area` VALUES (440606, 440600, '0,1,440000,440600,', '440606', '顺德区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:19');
INSERT INTO `sys_area` VALUES (440607, 440600, '0,1,440000,440600,', '440607', '三水区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:19');
INSERT INTO `sys_area` VALUES (440608, 440600, '0,1,440000,440600,', '440608', '高明区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:19');
INSERT INTO `sys_area` VALUES (440700, 440000, '0,1,440000,', '440700', '江门市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:20');
INSERT INTO `sys_area` VALUES (440703, 440700, '0,1,440000,440700,', '440703', '蓬江区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:20');
INSERT INTO `sys_area` VALUES (440704, 440700, '0,1,440000,440700,', '440704', '江海区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:20');
INSERT INTO `sys_area` VALUES (440705, 440700, '0,1,440000,440700,', '440705', '新会区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:20');
INSERT INTO `sys_area` VALUES (440781, 440700, '0,1,440000,440700,', '440781', '台山市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:21');
INSERT INTO `sys_area` VALUES (440783, 440700, '0,1,440000,440700,', '440783', '开平市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:21');
INSERT INTO `sys_area` VALUES (440784, 440700, '0,1,440000,440700,', '440784', '鹤山市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:21');
INSERT INTO `sys_area` VALUES (440785, 440700, '0,1,440000,440700,', '440785', '恩平市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:21');
INSERT INTO `sys_area` VALUES (440800, 440000, '0,1,440000,', '440800', '湛江市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:21');
INSERT INTO `sys_area` VALUES (440802, 440800, '0,1,440000,440800,', '440802', '赤坎区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:21');
INSERT INTO `sys_area` VALUES (440803, 440800, '0,1,440000,440800,', '440803', '霞山区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:22');
INSERT INTO `sys_area` VALUES (440804, 440800, '0,1,440000,440800,', '440804', '坡头区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:22');
INSERT INTO `sys_area` VALUES (440811, 440800, '0,1,440000,440800,', '440811', '麻章区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:22');
INSERT INTO `sys_area` VALUES (440823, 440800, '0,1,440000,440800,', '440823', '遂溪县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:22');
INSERT INTO `sys_area` VALUES (440825, 440800, '0,1,440000,440800,', '440825', '徐闻县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:22');
INSERT INTO `sys_area` VALUES (440881, 440800, '0,1,440000,440800,', '440881', '廉江市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:23');
INSERT INTO `sys_area` VALUES (440882, 440800, '0,1,440000,440800,', '440882', '雷州市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:23');
INSERT INTO `sys_area` VALUES (440883, 440800, '0,1,440000,440800,', '440883', '吴川市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:23');
INSERT INTO `sys_area` VALUES (440900, 440000, '0,1,440000,', '440900', '茂名市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:23');
INSERT INTO `sys_area` VALUES (440902, 440900, '0,1,440000,440900,', '440902', '茂南区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:23');
INSERT INTO `sys_area` VALUES (440903, 440900, '0,1,440000,440900,', '440903', '茂港区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:23');
INSERT INTO `sys_area` VALUES (440923, 440900, '0,1,440000,440900,', '440923', '电白县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:24');
INSERT INTO `sys_area` VALUES (440981, 440900, '0,1,440000,440900,', '440981', '高州市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:24');
INSERT INTO `sys_area` VALUES (440982, 440900, '0,1,440000,440900,', '440982', '化州市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:24');
INSERT INTO `sys_area` VALUES (440983, 440900, '0,1,440000,440900,', '440983', '信宜市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:24');
INSERT INTO `sys_area` VALUES (441200, 440000, '0,1,440000,', '441200', '肇庆市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:25');
INSERT INTO `sys_area` VALUES (441202, 441200, '0,1,440000,441200,', '441202', '端州区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:25');
INSERT INTO `sys_area` VALUES (441203, 441200, '0,1,440000,441200,', '441203', '鼎湖区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:25');
INSERT INTO `sys_area` VALUES (441223, 441200, '0,1,440000,441200,', '441223', '广宁县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:25');
INSERT INTO `sys_area` VALUES (441224, 441200, '0,1,440000,441200,', '441224', '怀集县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:25');
INSERT INTO `sys_area` VALUES (441225, 441200, '0,1,440000,441200,', '441225', '封开县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:26');
INSERT INTO `sys_area` VALUES (441226, 441200, '0,1,440000,441200,', '441226', '德庆县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:26');
INSERT INTO `sys_area` VALUES (441240, 441200, '0,1,440000,441200,', '441240', '高新区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:26');
INSERT INTO `sys_area` VALUES (441283, 441200, '0,1,440000,441200,', '441283', '高要市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:26');
INSERT INTO `sys_area` VALUES (441284, 441200, '0,1,440000,441200,', '441284', '四会市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:26');
INSERT INTO `sys_area` VALUES (441300, 440000, '0,1,440000,', '441300', '惠州市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:27');
INSERT INTO `sys_area` VALUES (441302, 441300, '0,1,440000,441300,', '441302', '惠城区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:27');
INSERT INTO `sys_area` VALUES (441303, 441300, '0,1,440000,441300,', '441303', '惠阳区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:27');
INSERT INTO `sys_area` VALUES (441322, 441300, '0,1,440000,441300,', '441322', '博罗县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:27');
INSERT INTO `sys_area` VALUES (441323, 441300, '0,1,440000,441300,', '441323', '惠东县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:27');
INSERT INTO `sys_area` VALUES (441324, 441300, '0,1,440000,441300,', '441324', '龙门县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:27');
INSERT INTO `sys_area` VALUES (441340, 441300, '0,1,440000,441300,', '441340', '大亚湾经济开发区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:27');
INSERT INTO `sys_area` VALUES (441400, 440000, '0,1,440000,', '441400', '梅州市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:28');
INSERT INTO `sys_area` VALUES (441402, 441400, '0,1,440000,441400,', '441402', '梅江区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:28');
INSERT INTO `sys_area` VALUES (441421, 441400, '0,1,440000,441400,', '441421', '梅县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:28');
INSERT INTO `sys_area` VALUES (441422, 441400, '0,1,440000,441400,', '441422', '大埔县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:28');
INSERT INTO `sys_area` VALUES (441423, 441400, '0,1,440000,441400,', '441423', '丰顺县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:28');
INSERT INTO `sys_area` VALUES (441424, 441400, '0,1,440000,441400,', '441424', '五华县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:29');
INSERT INTO `sys_area` VALUES (441426, 441400, '0,1,440000,441400,', '441426', '平远县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:29');
INSERT INTO `sys_area` VALUES (441427, 441400, '0,1,440000,441400,', '441427', '蕉岭县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:29');
INSERT INTO `sys_area` VALUES (441481, 441400, '0,1,440000,441400,', '441481', '兴宁市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:29');
INSERT INTO `sys_area` VALUES (441500, 440000, '0,1,440000,', '441500', '汕尾市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:29');
INSERT INTO `sys_area` VALUES (441502, 441500, '0,1,440000,441500,', '441502', '城区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:29');
INSERT INTO `sys_area` VALUES (441521, 441500, '0,1,440000,441500,', '441521', '海丰县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:30');
INSERT INTO `sys_area` VALUES (441523, 441500, '0,1,440000,441500,', '441523', '陆河县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:30');
INSERT INTO `sys_area` VALUES (441540, 441500, '0,1,440000,441500,', '441540', '红海湾', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:30');
INSERT INTO `sys_area` VALUES (441541, 441500, '0,1,440000,441500,', '441541', '农垦', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:30');
INSERT INTO `sys_area` VALUES (441542, 441500, '0,1,440000,441500,', '441542', '华侨管理区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:30');
INSERT INTO `sys_area` VALUES (441580, 441500, '0,1,440000,441500,', '441580', '陆丰市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:31');
INSERT INTO `sys_area` VALUES (441600, 440000, '0,1,440000,', '441600', '河源市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:31');
INSERT INTO `sys_area` VALUES (441602, 441600, '0,1,440000,441600,', '441602', '源城区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:31');
INSERT INTO `sys_area` VALUES (441621, 441600, '0,1,440000,441600,', '441621', '紫金县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:31');
INSERT INTO `sys_area` VALUES (441622, 441600, '0,1,440000,441600,', '441622', '龙川县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:31');
INSERT INTO `sys_area` VALUES (441623, 441600, '0,1,440000,441600,', '441623', '连平县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:31');
INSERT INTO `sys_area` VALUES (441624, 441600, '0,1,440000,441600,', '441624', '和平县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:32');
INSERT INTO `sys_area` VALUES (441625, 441600, '0,1,440000,441600,', '441625', '东源县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:32');
INSERT INTO `sys_area` VALUES (441700, 440000, '0,1,440000,', '441700', '阳江市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:32');
INSERT INTO `sys_area` VALUES (441702, 441700, '0,1,440000,441700,', '441702', '江城区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:32');
INSERT INTO `sys_area` VALUES (441721, 441700, '0,1,440000,441700,', '441721', '阳西县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:32');
INSERT INTO `sys_area` VALUES (441723, 441700, '0,1,440000,441700,', '441723', '阳东县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:33');
INSERT INTO `sys_area` VALUES (441740, 441700, '0,1,440000,441700,', '441740', '岗侨区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:33');
INSERT INTO `sys_area` VALUES (441741, 441700, '0,1,440000,441700,', '441741', '农垦', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:33');
INSERT INTO `sys_area` VALUES (441742, 441700, '0,1,440000,441700,', '441742', '海陵区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:33');
INSERT INTO `sys_area` VALUES (441780, 441700, '0,1,440000,441700,', '441780', '阳春市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:33');
INSERT INTO `sys_area` VALUES (441800, 440000, '0,1,440000,', '441800', '清远市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:33');
INSERT INTO `sys_area` VALUES (441802, 441800, '0,1,440000,441800,', '441802', '清城区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:34');
INSERT INTO `sys_area` VALUES (441821, 441800, '0,1,440000,441800,', '441821', '佛冈县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:34');
INSERT INTO `sys_area` VALUES (441823, 441800, '0,1,440000,441800,', '441823', '阳山县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:34');
INSERT INTO `sys_area` VALUES (441825, 441800, '0,1,440000,441800,', '441825', '连山壮族瑶族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:34');
INSERT INTO `sys_area` VALUES (441826, 441800, '0,1,440000,441800,', '441826', '连南瑶族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:34');
INSERT INTO `sys_area` VALUES (441827, 441800, '0,1,440000,441800,', '441827', '清新县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:34');
INSERT INTO `sys_area` VALUES (441881, 441800, '0,1,440000,441800,', '441881', '英德市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:35');
INSERT INTO `sys_area` VALUES (441882, 441800, '0,1,440000,441800,', '441882', '连州市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:35');
INSERT INTO `sys_area` VALUES (441900, 440000, '0,1,440000,', '441900', '东莞市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:35');
INSERT INTO `sys_area` VALUES (442000, 441900, '0,1,440000,441900,', '442000', '中山市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:35');
INSERT INTO `sys_area` VALUES (445100, 440000, '0,1,440000,', '445100', '潮州市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:36');
INSERT INTO `sys_area` VALUES (445102, 445100, '0,1,440000,445100,', '445102', '湘桥区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:36');
INSERT INTO `sys_area` VALUES (445121, 445100, '0,1,440000,445100,', '445121', '潮安县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:36');
INSERT INTO `sys_area` VALUES (445122, 445100, '0,1,440000,445100,', '445122', '饶平县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:36');
INSERT INTO `sys_area` VALUES (445200, 440000, '0,1,440000,', '445200', '揭阳市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:37');
INSERT INTO `sys_area` VALUES (445202, 445200, '0,1,440000,445200,', '445202', '榕城区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:37');
INSERT INTO `sys_area` VALUES (445221, 445200, '0,1,440000,445200,', '445221', '揭东县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:37');
INSERT INTO `sys_area` VALUES (445222, 445200, '0,1,440000,445200,', '445222', '揭西县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:37');
INSERT INTO `sys_area` VALUES (445224, 445200, '0,1,440000,445200,', '445224', '惠来县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:37');
INSERT INTO `sys_area` VALUES (445240, 445200, '0,1,440000,445200,', '445240', '东山区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:37');
INSERT INTO `sys_area` VALUES (445241, 445200, '0,1,440000,445200,', '445241', '实验区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:38');
INSERT INTO `sys_area` VALUES (445242, 445200, '0,1,440000,445200,', '445242', '大南山区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:38');
INSERT INTO `sys_area` VALUES (445243, 445200, '0,1,440000,445200,', '445243', '普侨区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:38');
INSERT INTO `sys_area` VALUES (445281, 445200, '0,1,440000,445200,', '445281', '普宁市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:38');
INSERT INTO `sys_area` VALUES (445300, 440000, '0,1,440000,', '445300', '云浮市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:39');
INSERT INTO `sys_area` VALUES (445302, 445300, '0,1,440000,445300,', '445302', '云城区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:39');
INSERT INTO `sys_area` VALUES (445321, 445300, '0,1,440000,445300,', '445321', '新兴县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:39');
INSERT INTO `sys_area` VALUES (445322, 445300, '0,1,440000,445300,', '445322', '郁南县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:39');
INSERT INTO `sys_area` VALUES (445323, 445300, '0,1,440000,445300,', '445323', '云安县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:39');
INSERT INTO `sys_area` VALUES (445381, 445300, '0,1,440000,445300,', '445381', '罗定市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:39');
INSERT INTO `sys_area` VALUES (450000, 1, '0,1,', '450000', '广西壮族自治区', 2, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (450100, 450000, '0,1,450000,', '450100', '南宁市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:40');
INSERT INTO `sys_area` VALUES (450102, 450100, '0,1,450000,450100,', '450102', '兴宁区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:40');
INSERT INTO `sys_area` VALUES (450103, 450100, '0,1,450000,450100,', '450103', '青秀区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:40');
INSERT INTO `sys_area` VALUES (450105, 450100, '0,1,450000,450100,', '450105', '江南区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:40');
INSERT INTO `sys_area` VALUES (450107, 450100, '0,1,450000,450100,', '450107', '西乡塘区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:41');
INSERT INTO `sys_area` VALUES (450108, 450100, '0,1,450000,450100,', '450108', '良庆区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:41');
INSERT INTO `sys_area` VALUES (450109, 450100, '0,1,450000,450100,', '450109', '邕宁区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:41');
INSERT INTO `sys_area` VALUES (450122, 450100, '0,1,450000,450100,', '450122', '武鸣县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:41');
INSERT INTO `sys_area` VALUES (450123, 450100, '0,1,450000,450100,', '450123', '隆安县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:41');
INSERT INTO `sys_area` VALUES (450124, 450100, '0,1,450000,450100,', '450124', '马山县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:42');
INSERT INTO `sys_area` VALUES (450125, 450100, '0,1,450000,450100,', '450125', '上林县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:42');
INSERT INTO `sys_area` VALUES (450126, 450100, '0,1,450000,450100,', '450126', '宾阳县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:42');
INSERT INTO `sys_area` VALUES (450127, 450100, '0,1,450000,450100,', '450127', '横县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:42');
INSERT INTO `sys_area` VALUES (450200, 450000, '0,1,450000,', '450200', '柳州市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:43');
INSERT INTO `sys_area` VALUES (450202, 450200, '0,1,450000,450200,', '450202', '城中区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:43');
INSERT INTO `sys_area` VALUES (450203, 450200, '0,1,450000,450200,', '450203', '鱼峰区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:43');
INSERT INTO `sys_area` VALUES (450204, 450200, '0,1,450000,450200,', '450204', '柳南区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:43');
INSERT INTO `sys_area` VALUES (450205, 450200, '0,1,450000,450200,', '450205', '柳北区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:43');
INSERT INTO `sys_area` VALUES (450221, 450200, '0,1,450000,450200,', '450221', '柳江县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:44');
INSERT INTO `sys_area` VALUES (450222, 450200, '0,1,450000,450200,', '450222', '柳城县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:44');
INSERT INTO `sys_area` VALUES (450223, 450200, '0,1,450000,450200,', '450223', '鹿寨县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:44');
INSERT INTO `sys_area` VALUES (450224, 450200, '0,1,450000,450200,', '450224', '融安县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:44');
INSERT INTO `sys_area` VALUES (450225, 450200, '0,1,450000,450200,', '450225', '融水苗族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:44');
INSERT INTO `sys_area` VALUES (450226, 450200, '0,1,450000,450200,', '450226', '三江侗族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:44');
INSERT INTO `sys_area` VALUES (450300, 450000, '0,1,450000,', '450300', '桂林市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:45');
INSERT INTO `sys_area` VALUES (450302, 450300, '0,1,450000,450300,', '450302', '秀峰区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:45');
INSERT INTO `sys_area` VALUES (450303, 450300, '0,1,450000,450300,', '450303', '叠彩区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:45');
INSERT INTO `sys_area` VALUES (450304, 450300, '0,1,450000,450300,', '450304', '象山区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:45');
INSERT INTO `sys_area` VALUES (450305, 450300, '0,1,450000,450300,', '450305', '七星区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:46');
INSERT INTO `sys_area` VALUES (450311, 450300, '0,1,450000,450300,', '450311', '雁山区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:46');
INSERT INTO `sys_area` VALUES (450321, 450300, '0,1,450000,450300,', '450321', '阳朔县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:46');
INSERT INTO `sys_area` VALUES (450322, 450300, '0,1,450000,450300,', '450322', '临桂县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:46');
INSERT INTO `sys_area` VALUES (450323, 450300, '0,1,450000,450300,', '450323', '灵川县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:46');
INSERT INTO `sys_area` VALUES (450324, 450300, '0,1,450000,450300,', '450324', '全州县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:46');
INSERT INTO `sys_area` VALUES (450325, 450300, '0,1,450000,450300,', '450325', '兴安县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:47');
INSERT INTO `sys_area` VALUES (450326, 450300, '0,1,450000,450300,', '450326', '永福县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:47');
INSERT INTO `sys_area` VALUES (450327, 450300, '0,1,450000,450300,', '450327', '灌阳县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:47');
INSERT INTO `sys_area` VALUES (450328, 450300, '0,1,450000,450300,', '450328', '龙胜各族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:47');
INSERT INTO `sys_area` VALUES (450329, 450300, '0,1,450000,450300,', '450329', '资源县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:47');
INSERT INTO `sys_area` VALUES (450330, 450300, '0,1,450000,450300,', '450330', '平乐县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:48');
INSERT INTO `sys_area` VALUES (450331, 450300, '0,1,450000,450300,', '450331', '荔蒲县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:48');
INSERT INTO `sys_area` VALUES (450332, 450300, '0,1,450000,450300,', '450332', '恭城瑶族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:48');
INSERT INTO `sys_area` VALUES (450400, 450000, '0,1,450000,', '450400', '梧州市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:48');
INSERT INTO `sys_area` VALUES (450403, 450400, '0,1,450000,450400,', '450403', '万秀区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:49');
INSERT INTO `sys_area` VALUES (450404, 450400, '0,1,450000,450400,', '450404', '蝶山区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:49');
INSERT INTO `sys_area` VALUES (450405, 450400, '0,1,450000,450400,', '450405', '长洲区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:49');
INSERT INTO `sys_area` VALUES (450421, 450400, '0,1,450000,450400,', '450421', '苍梧县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:49');
INSERT INTO `sys_area` VALUES (450422, 450400, '0,1,450000,450400,', '450422', '藤县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:49');
INSERT INTO `sys_area` VALUES (450423, 450400, '0,1,450000,450400,', '450423', '蒙山县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:49');
INSERT INTO `sys_area` VALUES (450481, 450400, '0,1,450000,450400,', '450481', '岑溪市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:49');
INSERT INTO `sys_area` VALUES (450500, 450000, '0,1,450000,', '450500', '北海市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:50');
INSERT INTO `sys_area` VALUES (450502, 450500, '0,1,450000,450500,', '450502', '海城区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:50');
INSERT INTO `sys_area` VALUES (450503, 450500, '0,1,450000,450500,', '450503', '银海区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:50');
INSERT INTO `sys_area` VALUES (450512, 450500, '0,1,450000,450500,', '450512', '铁山港区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:50');
INSERT INTO `sys_area` VALUES (450521, 450500, '0,1,450000,450500,', '450521', '合浦县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:50');
INSERT INTO `sys_area` VALUES (450600, 450000, '0,1,450000,', '450600', '防城港市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:51');
INSERT INTO `sys_area` VALUES (450602, 450600, '0,1,450000,450600,', '450602', '港口区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:51');
INSERT INTO `sys_area` VALUES (450603, 450600, '0,1,450000,450600,', '450603', '防城区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:51');
INSERT INTO `sys_area` VALUES (450621, 450600, '0,1,450000,450600,', '450621', '上思县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:51');
INSERT INTO `sys_area` VALUES (450681, 450600, '0,1,450000,450600,', '450681', '东兴市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:51');
INSERT INTO `sys_area` VALUES (450700, 450000, '0,1,450000,', '450700', '钦州市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:52');
INSERT INTO `sys_area` VALUES (450702, 450700, '0,1,450000,450700,', '450702', '钦南区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:52');
INSERT INTO `sys_area` VALUES (450703, 450700, '0,1,450000,450700,', '450703', '钦北区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:52');
INSERT INTO `sys_area` VALUES (450721, 450700, '0,1,450000,450700,', '450721', '灵山县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:52');
INSERT INTO `sys_area` VALUES (450722, 450700, '0,1,450000,450700,', '450722', '浦北县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:52');
INSERT INTO `sys_area` VALUES (450800, 450000, '0,1,450000,', '450800', '贵港市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:52');
INSERT INTO `sys_area` VALUES (450802, 450800, '0,1,450000,450800,', '450802', '港北区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:53');
INSERT INTO `sys_area` VALUES (450803, 450800, '0,1,450000,450800,', '450803', '港南区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:53');
INSERT INTO `sys_area` VALUES (450804, 450800, '0,1,450000,450800,', '450804', '覃塘区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:53');
INSERT INTO `sys_area` VALUES (450821, 450800, '0,1,450000,450800,', '450821', '平南县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:53');
INSERT INTO `sys_area` VALUES (450881, 450800, '0,1,450000,450800,', '450881', '桂平市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:53');
INSERT INTO `sys_area` VALUES (450900, 450000, '0,1,450000,', '450900', '玉林市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:54');
INSERT INTO `sys_area` VALUES (450902, 450900, '0,1,450000,450900,', '450902', '玉州区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:54');
INSERT INTO `sys_area` VALUES (450921, 450900, '0,1,450000,450900,', '450921', '容县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:54');
INSERT INTO `sys_area` VALUES (450922, 450900, '0,1,450000,450900,', '450922', '陆川县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:54');
INSERT INTO `sys_area` VALUES (450923, 450900, '0,1,450000,450900,', '450923', '博白县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:54');
INSERT INTO `sys_area` VALUES (450924, 450900, '0,1,450000,450900,', '450924', '兴业县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:54');
INSERT INTO `sys_area` VALUES (450981, 450900, '0,1,450000,450900,', '450981', '北流市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:55');
INSERT INTO `sys_area` VALUES (451000, 450000, '0,1,450000,', '451000', '百色市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:55');
INSERT INTO `sys_area` VALUES (451002, 451000, '0,1,450000,451000,', '451002', '右江区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:55');
INSERT INTO `sys_area` VALUES (451021, 451000, '0,1,450000,451000,', '451021', '田阳县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:55');
INSERT INTO `sys_area` VALUES (451022, 451000, '0,1,450000,451000,', '451022', '田东县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:55');
INSERT INTO `sys_area` VALUES (451023, 451000, '0,1,450000,451000,', '451023', '平果县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:56');
INSERT INTO `sys_area` VALUES (451024, 451000, '0,1,450000,451000,', '451024', '德保县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:56');
INSERT INTO `sys_area` VALUES (451025, 451000, '0,1,450000,451000,', '451025', '靖西县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:56');
INSERT INTO `sys_area` VALUES (451026, 451000, '0,1,450000,451000,', '451026', '那坡县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:56');
INSERT INTO `sys_area` VALUES (451027, 451000, '0,1,450000,451000,', '451027', '凌云县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:56');
INSERT INTO `sys_area` VALUES (451028, 451000, '0,1,450000,451000,', '451028', '乐业县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:56');
INSERT INTO `sys_area` VALUES (451029, 451000, '0,1,450000,451000,', '451029', '田林县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:57');
INSERT INTO `sys_area` VALUES (451030, 451000, '0,1,450000,451000,', '451030', '西林县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:57');
INSERT INTO `sys_area` VALUES (451031, 451000, '0,1,450000,451000,', '451031', '隆林各族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:57');
INSERT INTO `sys_area` VALUES (451100, 450000, '0,1,450000,', '451100', '贺州市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:57');
INSERT INTO `sys_area` VALUES (451102, 451100, '0,1,450000,451100,', '451102', '八步区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:57');
INSERT INTO `sys_area` VALUES (451121, 451100, '0,1,450000,451100,', '451121', '昭平县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:57');
INSERT INTO `sys_area` VALUES (451122, 451100, '0,1,450000,451100,', '451122', '钟山县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:58');
INSERT INTO `sys_area` VALUES (451123, 451100, '0,1,450000,451100,', '451123', '富川瑶族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:58');
INSERT INTO `sys_area` VALUES (451200, 450000, '0,1,450000,', '451200', '河池市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:58');
INSERT INTO `sys_area` VALUES (451202, 451200, '0,1,450000,451200,', '451202', '金城江区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:58');
INSERT INTO `sys_area` VALUES (451221, 451200, '0,1,450000,451200,', '451221', '南丹县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:58');
INSERT INTO `sys_area` VALUES (451222, 451200, '0,1,450000,451200,', '451222', '天峨县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:58');
INSERT INTO `sys_area` VALUES (451223, 451200, '0,1,450000,451200,', '451223', '凤山县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:59');
INSERT INTO `sys_area` VALUES (451224, 451200, '0,1,450000,451200,', '451224', '东兰县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:59');
INSERT INTO `sys_area` VALUES (451225, 451200, '0,1,450000,451200,', '451225', '罗城仫佬族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:59');
INSERT INTO `sys_area` VALUES (451226, 451200, '0,1,450000,451200,', '451226', '环江毛南族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:59');
INSERT INTO `sys_area` VALUES (451227, 451200, '0,1,450000,451200,', '451227', '巴马瑶族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:55:59');
INSERT INTO `sys_area` VALUES (451228, 451200, '0,1,450000,451200,', '451228', '都安瑶族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:00');
INSERT INTO `sys_area` VALUES (451229, 451200, '0,1,450000,451200,', '451229', '大化瑶族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:00');
INSERT INTO `sys_area` VALUES (451281, 451200, '0,1,450000,451200,', '451281', '宜州市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:00');
INSERT INTO `sys_area` VALUES (451300, 450000, '0,1,450000,', '451300', '来宾市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:00');
INSERT INTO `sys_area` VALUES (451302, 451300, '0,1,450000,451300,', '451302', '兴宾区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:00');
INSERT INTO `sys_area` VALUES (451321, 451300, '0,1,450000,451300,', '451321', '忻城县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:01');
INSERT INTO `sys_area` VALUES (451322, 451300, '0,1,450000,451300,', '451322', '象州县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:01');
INSERT INTO `sys_area` VALUES (451323, 451300, '0,1,450000,451300,', '451323', '武宣县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:01');
INSERT INTO `sys_area` VALUES (451324, 451300, '0,1,450000,451300,', '451324', '金秀瑶族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:01');
INSERT INTO `sys_area` VALUES (451381, 451300, '0,1,450000,451300,', '451381', '合山市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:01');
INSERT INTO `sys_area` VALUES (451400, 450000, '0,1,450000,', '451400', '崇左市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:02');
INSERT INTO `sys_area` VALUES (451402, 451400, '0,1,450000,451400,', '451402', '江洲区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:02');
INSERT INTO `sys_area` VALUES (451421, 451400, '0,1,450000,451400,', '451421', '扶绥县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:02');
INSERT INTO `sys_area` VALUES (451422, 451400, '0,1,450000,451400,', '451422', '宁明县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:02');
INSERT INTO `sys_area` VALUES (451423, 451400, '0,1,450000,451400,', '451423', '龙州县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:02');
INSERT INTO `sys_area` VALUES (451424, 451400, '0,1,450000,451400,', '451424', '大新县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:02');
INSERT INTO `sys_area` VALUES (451425, 451400, '0,1,450000,451400,', '451425', '天等县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:02');
INSERT INTO `sys_area` VALUES (451481, 451400, '0,1,450000,451400,', '451481', '凭祥市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:03');
INSERT INTO `sys_area` VALUES (460000, 1, '0,1,', '460000', '海南省', 2, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (460100, 460000, '0,1,460000,', '460100', '海口市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:03');
INSERT INTO `sys_area` VALUES (460105, 460100, '0,1,460000,460100,', '460105', '秀英区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:03');
INSERT INTO `sys_area` VALUES (460106, 460100, '0,1,460000,460100,', '460106', '龙华区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:03');
INSERT INTO `sys_area` VALUES (460107, 460100, '0,1,460000,460100,', '460107', '琼山区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:03');
INSERT INTO `sys_area` VALUES (460108, 460100, '0,1,460000,460100,', '460108', '美兰区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:04');
INSERT INTO `sys_area` VALUES (460200, 460000, '0,1,460000,', '460200', '三亚市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:04');
INSERT INTO `sys_area` VALUES (462000, 469000, 'null469000,', '462000', '洋浦经济开发区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:04');
INSERT INTO `sys_area` VALUES (462100, 469000, 'null469000,', '462100', '省农垦', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:05');
INSERT INTO `sys_area` VALUES (469000, 460000, '0,1,460000,', '469000', '省直辖县级行政单位', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:05');
INSERT INTO `sys_area` VALUES (469001, 469000, '0,1,460000,469000,', '469001', '五指山市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:05');
INSERT INTO `sys_area` VALUES (469002, 469000, '0,1,460000,469000,', '469002', '琼海市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:05');
INSERT INTO `sys_area` VALUES (469003, 469000, '0,1,460000,469000,', '469003', '儋州市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:05');
INSERT INTO `sys_area` VALUES (469005, 469000, '0,1,460000,469000,', '469005', '文昌市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:06');
INSERT INTO `sys_area` VALUES (469006, 469000, '0,1,460000,469000,', '469006', '万宁市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:06');
INSERT INTO `sys_area` VALUES (469007, 469000, '0,1,460000,469000,', '469007', '东方市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:06');
INSERT INTO `sys_area` VALUES (469021, 469000, '0,1,460000,469000,', '469021', '定安县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:06');
INSERT INTO `sys_area` VALUES (469022, 469000, '0,1,460000,469000,', '469022', '屯昌县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:06');
INSERT INTO `sys_area` VALUES (469023, 469000, '0,1,460000,469000,', '469023', '澄迈县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:07');
INSERT INTO `sys_area` VALUES (469024, 469000, '0,1,460000,469000,', '469024', '临高县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:07');
INSERT INTO `sys_area` VALUES (469025, 469000, '0,1,460000,469000,', '469025', '白沙黎族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:07');
INSERT INTO `sys_area` VALUES (469026, 469000, '0,1,460000,469000,', '469026', '昌江黎族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:07');
INSERT INTO `sys_area` VALUES (469027, 469000, '0,1,460000,469000,', '469027', '乐东黎族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:07');
INSERT INTO `sys_area` VALUES (469028, 469000, '0,1,460000,469000,', '469028', '陵水黎族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:07');
INSERT INTO `sys_area` VALUES (469029, 469000, '0,1,460000,469000,', '469029', '保亭黎族苗族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:08');
INSERT INTO `sys_area` VALUES (469030, 469000, '0,1,460000,469000,', '469030', '琼中黎族苗族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:08');
INSERT INTO `sys_area` VALUES (469031, 469000, '0,1,460000,469000,', '469031', '西沙群岛', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:08');
INSERT INTO `sys_area` VALUES (469032, 469000, '0,1,460000,469000,', '469032', '南沙群岛', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:08');
INSERT INTO `sys_area` VALUES (469033, 469000, '0,1,460000,469000,', '469033', '中沙群岛的岛礁及其海域', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:08');
INSERT INTO `sys_area` VALUES (500000, 1, '0,1,', '500000', '重庆市', 2, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (500101, 500000, '0,1,500000,', '500101', '万州区', 3, 0, NULL, 1, NULL, NULL, '2020-02-11 07:58:38');
INSERT INTO `sys_area` VALUES (500102, 500000, '0,1,500000,', '500102', '涪陵区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:09');
INSERT INTO `sys_area` VALUES (500103, 500000, '0,1,500000,', '500103', '渝中区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:09');
INSERT INTO `sys_area` VALUES (500104, 500000, '0,1,500000,', '500104', '大渡口区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:09');
INSERT INTO `sys_area` VALUES (500105, 500000, '0,1,500000,', '500105', '江北区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:09');
INSERT INTO `sys_area` VALUES (500106, 500000, '0,1,500000,', '500106', '沙坪坝区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:10');
INSERT INTO `sys_area` VALUES (500107, 500000, '0,1,500000,', '500107', '九龙坡区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:10');
INSERT INTO `sys_area` VALUES (500108, 500000, '0,1,500000,', '500108', '南岸区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:10');
INSERT INTO `sys_area` VALUES (500109, 500000, '0,1,500000,', '500109', '北碚区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:10');
INSERT INTO `sys_area` VALUES (500110, 500000, '0,1,500000,', '500110', '万盛区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:10');
INSERT INTO `sys_area` VALUES (500111, 500000, '0,1,500000,', '500111', '双桥区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:10');
INSERT INTO `sys_area` VALUES (500112, 500000, '0,1,500000,', '500112', '渝北区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:10');
INSERT INTO `sys_area` VALUES (500113, 500000, '0,1,500000,', '500113', '巴南区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:11');
INSERT INTO `sys_area` VALUES (500114, 500000, '0,1,500000,', '500114', '黔江区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:11');
INSERT INTO `sys_area` VALUES (500115, 500000, '0,1,500000,', '500115', '长寿区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:11');
INSERT INTO `sys_area` VALUES (500116, 500000, '0,1,500000,', '500116', '江津区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:11');
INSERT INTO `sys_area` VALUES (500117, 500000, '0,1,500000,', '500117', '合川区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:11');
INSERT INTO `sys_area` VALUES (500118, 500000, '0,1,500000,', '500118', '永川区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:11');
INSERT INTO `sys_area` VALUES (500119, 500000, '0,1,500000,', '500119', '南川区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:12');
INSERT INTO `sys_area` VALUES (500140, 500000, '0,1,500000,', '500140', '经济技术开发区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:12');
INSERT INTO `sys_area` VALUES (500141, 500000, '0,1,500000,', '500141', '高新区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:12');
INSERT INTO `sys_area` VALUES (500142, 500000, '0,1,500000,', '500142', '北部新区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:12');
INSERT INTO `sys_area` VALUES (500222, 500000, '0,1,500000,', '500222', '綦江县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:12');
INSERT INTO `sys_area` VALUES (500223, 500000, '0,1,500000,', '500223', '潼南县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:13');
INSERT INTO `sys_area` VALUES (500224, 500000, '0,1,500000,', '500224', '铜梁县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:13');
INSERT INTO `sys_area` VALUES (500225, 500000, '0,1,500000,', '500225', '大足县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:13');
INSERT INTO `sys_area` VALUES (500226, 500000, '0,1,500000,', '500226', '荣昌县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:13');
INSERT INTO `sys_area` VALUES (500227, 500000, '0,1,500000,', '500227', '璧山县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:13');
INSERT INTO `sys_area` VALUES (500228, 500000, '0,1,500000,', '500228', '梁平县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:13');
INSERT INTO `sys_area` VALUES (500229, 500000, '0,1,500000,', '500229', '城口县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:13');
INSERT INTO `sys_area` VALUES (500230, 500000, '0,1,500000,', '500230', '丰都县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:14');
INSERT INTO `sys_area` VALUES (500231, 500000, '0,1,500000,', '500231', '垫江县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:14');
INSERT INTO `sys_area` VALUES (500232, 500000, '0,1,500000,', '500232', '武隆县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:14');
INSERT INTO `sys_area` VALUES (500233, 500000, '0,1,500000,', '500233', '忠县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:14');
INSERT INTO `sys_area` VALUES (500234, 500000, '0,1,500000,', '500234', '开县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:14');
INSERT INTO `sys_area` VALUES (500235, 500000, '0,1,500000,', '500235', '云阳县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:14');
INSERT INTO `sys_area` VALUES (500236, 500000, '0,1,500000,', '500236', '奉节县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:15');
INSERT INTO `sys_area` VALUES (500237, 500000, '0,1,500000,', '500237', '巫山县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:15');
INSERT INTO `sys_area` VALUES (500238, 500000, '0,1,500000,', '500238', '巫溪县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:15');
INSERT INTO `sys_area` VALUES (500240, 500000, '0,1,500000,', '500240', '石柱土家族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:15');
INSERT INTO `sys_area` VALUES (500241, 500000, '0,1,500000,', '500241', '秀山土家族苗族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:15');
INSERT INTO `sys_area` VALUES (500242, 500000, '0,1,500000,', '500242', '酉阳土家族苗族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:15');
INSERT INTO `sys_area` VALUES (500243, 500000, '0,1,500000,', '500243', '彭水苗族土家族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:15');
INSERT INTO `sys_area` VALUES (510000, 1, '0,1,', '510000', '四川省', 2, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (510100, 510000, '0,1,510000,', '510100', '成都市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:16');
INSERT INTO `sys_area` VALUES (510104, 510100, '0,1,510000,510100,', '510104', '锦江区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:16');
INSERT INTO `sys_area` VALUES (510105, 510100, '0,1,510000,510100,', '510105', '青羊区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:16');
INSERT INTO `sys_area` VALUES (510106, 510100, '0,1,510000,510100,', '510106', '金牛区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:16');
INSERT INTO `sys_area` VALUES (510107, 510100, '0,1,510000,510100,', '510107', '武侯区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:16');
INSERT INTO `sys_area` VALUES (510108, 510100, '0,1,510000,510100,', '510108', '成华区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:16');
INSERT INTO `sys_area` VALUES (510112, 510100, '0,1,510000,510100,', '510112', '龙泉驿区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:17');
INSERT INTO `sys_area` VALUES (510113, 510100, '0,1,510000,510100,', '510113', '青白江区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:17');
INSERT INTO `sys_area` VALUES (510114, 510100, '0,1,510000,510100,', '510114', '新都区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:17');
INSERT INTO `sys_area` VALUES (510115, 510100, '0,1,510000,510100,', '510115', '温江区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:17');
INSERT INTO `sys_area` VALUES (510121, 510100, '0,1,510000,510100,', '510121', '金堂县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:17');
INSERT INTO `sys_area` VALUES (510122, 510100, '0,1,510000,510100,', '510122', '双流县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:18');
INSERT INTO `sys_area` VALUES (510124, 510100, '0,1,510000,510100,', '510124', '郫县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:18');
INSERT INTO `sys_area` VALUES (510129, 510100, '0,1,510000,510100,', '510129', '大邑县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:18');
INSERT INTO `sys_area` VALUES (510131, 510100, '0,1,510000,510100,', '510131', '蒲江县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:18');
INSERT INTO `sys_area` VALUES (510132, 510100, '0,1,510000,510100,', '510132', '新津县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:18');
INSERT INTO `sys_area` VALUES (510140, 510100, '0,1,510000,510100,', '510140', '高新区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:19');
INSERT INTO `sys_area` VALUES (510181, 510100, '0,1,510000,510100,', '510181', '都江堰市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:19');
INSERT INTO `sys_area` VALUES (510182, 510100, '0,1,510000,510100,', '510182', '彭州市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:19');
INSERT INTO `sys_area` VALUES (510183, 510100, '0,1,510000,510100,', '510183', '邛崃市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:19');
INSERT INTO `sys_area` VALUES (510184, 510100, '0,1,510000,510100,', '510184', '崇州市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:19');
INSERT INTO `sys_area` VALUES (510300, 510000, '0,1,510000,', '510300', '自贡市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:20');
INSERT INTO `sys_area` VALUES (510302, 510300, '0,1,510000,510300,', '510302', '自流井区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:20');
INSERT INTO `sys_area` VALUES (510303, 510300, '0,1,510000,510300,', '510303', '贡井区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:20');
INSERT INTO `sys_area` VALUES (510304, 510300, '0,1,510000,510300,', '510304', '大安区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:20');
INSERT INTO `sys_area` VALUES (510311, 510300, '0,1,510000,510300,', '510311', '沿滩区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:20');
INSERT INTO `sys_area` VALUES (510321, 510300, '0,1,510000,510300,', '510321', '荣县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:20');
INSERT INTO `sys_area` VALUES (510322, 510300, '0,1,510000,510300,', '510322', '富顺县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:21');
INSERT INTO `sys_area` VALUES (510400, 510000, '0,1,510000,', '510400', '攀枝花市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:21');
INSERT INTO `sys_area` VALUES (510402, 510400, '0,1,510000,510400,', '510402', '东区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:21');
INSERT INTO `sys_area` VALUES (510403, 510400, '0,1,510000,510400,', '510403', '西区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:21');
INSERT INTO `sys_area` VALUES (510411, 510400, '0,1,510000,510400,', '510411', '仁和区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:21');
INSERT INTO `sys_area` VALUES (510421, 510400, '0,1,510000,510400,', '510421', '米易县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:21');
INSERT INTO `sys_area` VALUES (510422, 510400, '0,1,510000,510400,', '510422', '盐边县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:22');
INSERT INTO `sys_area` VALUES (510500, 510000, '0,1,510000,', '510500', '泸州市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:22');
INSERT INTO `sys_area` VALUES (510502, 510500, '0,1,510000,510500,', '510502', '江阳区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:22');
INSERT INTO `sys_area` VALUES (510503, 510500, '0,1,510000,510500,', '510503', '纳溪区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:22');
INSERT INTO `sys_area` VALUES (510504, 510500, '0,1,510000,510500,', '510504', '龙马潭区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:22');
INSERT INTO `sys_area` VALUES (510521, 510500, '0,1,510000,510500,', '510521', '泸县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:23');
INSERT INTO `sys_area` VALUES (510522, 510500, '0,1,510000,510500,', '510522', '合江县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:23');
INSERT INTO `sys_area` VALUES (510524, 510500, '0,1,510000,510500,', '510524', '叙永县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:23');
INSERT INTO `sys_area` VALUES (510525, 510500, '0,1,510000,510500,', '510525', '古蔺县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:23');
INSERT INTO `sys_area` VALUES (510600, 510000, '0,1,510000,', '510600', '德阳市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:23');
INSERT INTO `sys_area` VALUES (510603, 510600, '0,1,510000,510600,', '510603', '旌阳区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:24');
INSERT INTO `sys_area` VALUES (510623, 510600, '0,1,510000,510600,', '510623', '中江县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:24');
INSERT INTO `sys_area` VALUES (510626, 510600, '0,1,510000,510600,', '510626', '罗江县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:24');
INSERT INTO `sys_area` VALUES (510681, 510600, '0,1,510000,510600,', '510681', '广汉市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:24');
INSERT INTO `sys_area` VALUES (510682, 510600, '0,1,510000,510600,', '510682', '什邡市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:24');
INSERT INTO `sys_area` VALUES (510683, 510600, '0,1,510000,510600,', '510683', '绵竹市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:25');
INSERT INTO `sys_area` VALUES (510700, 510000, '0,1,510000,', '510700', '绵阳市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:25');
INSERT INTO `sys_area` VALUES (510703, 510700, '0,1,510000,510700,', '510703', '涪城区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:25');
INSERT INTO `sys_area` VALUES (510704, 510700, '0,1,510000,510700,', '510704', '游仙区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:25');
INSERT INTO `sys_area` VALUES (510722, 510700, '0,1,510000,510700,', '510722', '三台县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:25');
INSERT INTO `sys_area` VALUES (510723, 510700, '0,1,510000,510700,', '510723', '盐亭县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:25');
INSERT INTO `sys_area` VALUES (510724, 510700, '0,1,510000,510700,', '510724', '安县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:26');
INSERT INTO `sys_area` VALUES (510725, 510700, '0,1,510000,510700,', '510725', '梓潼县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:26');
INSERT INTO `sys_area` VALUES (510726, 510700, '0,1,510000,510700,', '510726', '北川羌族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:26');
INSERT INTO `sys_area` VALUES (510727, 510700, '0,1,510000,510700,', '510727', '平武县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:26');
INSERT INTO `sys_area` VALUES (510740, 510700, '0,1,510000,510700,', '510740', '高新区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:26');
INSERT INTO `sys_area` VALUES (510781, 510700, '0,1,510000,510700,', '510781', '江油市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:26');
INSERT INTO `sys_area` VALUES (510800, 510000, '0,1,510000,', '510800', '广元市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:27');
INSERT INTO `sys_area` VALUES (510802, 510800, '0,1,510000,510800,', '510802', '利州区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:27');
INSERT INTO `sys_area` VALUES (510811, 510800, '0,1,510000,510800,', '510811', '元坝区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:27');
INSERT INTO `sys_area` VALUES (510812, 510800, '0,1,510000,510800,', '510812', '朝天区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:27');
INSERT INTO `sys_area` VALUES (510821, 510800, '0,1,510000,510800,', '510821', '旺苍县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:27');
INSERT INTO `sys_area` VALUES (510822, 510800, '0,1,510000,510800,', '510822', '青川县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:28');
INSERT INTO `sys_area` VALUES (510823, 510800, '0,1,510000,510800,', '510823', '剑阁县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:28');
INSERT INTO `sys_area` VALUES (510824, 510800, '0,1,510000,510800,', '510824', '苍溪县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:28');
INSERT INTO `sys_area` VALUES (510900, 510000, '0,1,510000,', '510900', '遂宁市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:28');
INSERT INTO `sys_area` VALUES (510903, 510900, '0,1,510000,510900,', '510903', '船山区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:28');
INSERT INTO `sys_area` VALUES (510904, 510900, '0,1,510000,510900,', '510904', '安居区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:29');
INSERT INTO `sys_area` VALUES (510921, 510900, '0,1,510000,510900,', '510921', '蓬溪县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:29');
INSERT INTO `sys_area` VALUES (510922, 510900, '0,1,510000,510900,', '510922', '射洪县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:29');
INSERT INTO `sys_area` VALUES (510923, 510900, '0,1,510000,510900,', '510923', '大英县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:29');
INSERT INTO `sys_area` VALUES (511000, 510000, '0,1,510000,', '511000', '内江市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:30');
INSERT INTO `sys_area` VALUES (511002, 511000, '0,1,510000,511000,', '511002', '市中区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:30');
INSERT INTO `sys_area` VALUES (511011, 511000, '0,1,510000,511000,', '511011', '东兴区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:30');
INSERT INTO `sys_area` VALUES (511024, 511000, '0,1,510000,511000,', '511024', '威远县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:30');
INSERT INTO `sys_area` VALUES (511025, 511000, '0,1,510000,511000,', '511025', '资中县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:30');
INSERT INTO `sys_area` VALUES (511028, 511000, '0,1,510000,511000,', '511028', '隆昌县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:30');
INSERT INTO `sys_area` VALUES (511100, 510000, '0,1,510000,', '511100', '乐山市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:31');
INSERT INTO `sys_area` VALUES (511102, 511100, '0,1,510000,511100,', '511102', '市中区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:31');
INSERT INTO `sys_area` VALUES (511111, 511100, '0,1,510000,511100,', '511111', '沙湾区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:31');
INSERT INTO `sys_area` VALUES (511112, 511100, '0,1,510000,511100,', '511112', '五通桥区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:31');
INSERT INTO `sys_area` VALUES (511113, 511100, '0,1,510000,511100,', '511113', '金口河区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:31');
INSERT INTO `sys_area` VALUES (511123, 511100, '0,1,510000,511100,', '511123', '犍为县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:31');
INSERT INTO `sys_area` VALUES (511124, 511100, '0,1,510000,511100,', '511124', '井研县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:32');
INSERT INTO `sys_area` VALUES (511126, 511100, '0,1,510000,511100,', '511126', '夹江县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:32');
INSERT INTO `sys_area` VALUES (511129, 511100, '0,1,510000,511100,', '511129', '沐川县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:32');
INSERT INTO `sys_area` VALUES (511132, 511100, '0,1,510000,511100,', '511132', '峨边彝族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:32');
INSERT INTO `sys_area` VALUES (511133, 511100, '0,1,510000,511100,', '511133', '马边彝族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:32');
INSERT INTO `sys_area` VALUES (511181, 511100, '0,1,510000,511100,', '511181', '峨眉山市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:33');
INSERT INTO `sys_area` VALUES (511300, 510000, '0,1,510000,', '511300', '南充市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:33');
INSERT INTO `sys_area` VALUES (511302, 511300, '0,1,510000,511300,', '511302', '顺庆区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:33');
INSERT INTO `sys_area` VALUES (511303, 511300, '0,1,510000,511300,', '511303', '高坪区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:33');
INSERT INTO `sys_area` VALUES (511304, 511300, '0,1,510000,511300,', '511304', '嘉陵区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:33');
INSERT INTO `sys_area` VALUES (511321, 511300, '0,1,510000,511300,', '511321', '南部县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:34');
INSERT INTO `sys_area` VALUES (511322, 511300, '0,1,510000,511300,', '511322', '营山县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:34');
INSERT INTO `sys_area` VALUES (511323, 511300, '0,1,510000,511300,', '511323', '蓬安县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:34');
INSERT INTO `sys_area` VALUES (511324, 511300, '0,1,510000,511300,', '511324', '仪陇县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:34');
INSERT INTO `sys_area` VALUES (511325, 511300, '0,1,510000,511300,', '511325', '西充县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:35');
INSERT INTO `sys_area` VALUES (511381, 511300, '0,1,510000,511300,', '511381', '阆中市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:35');
INSERT INTO `sys_area` VALUES (511400, 510000, '0,1,510000,', '511400', '眉山市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:35');
INSERT INTO `sys_area` VALUES (511402, 511400, '0,1,510000,511400,', '511402', '东坡区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:35');
INSERT INTO `sys_area` VALUES (511421, 511400, '0,1,510000,511400,', '511421', '仁寿县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:36');
INSERT INTO `sys_area` VALUES (511422, 511400, '0,1,510000,511400,', '511422', '彭山县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:36');
INSERT INTO `sys_area` VALUES (511423, 511400, '0,1,510000,511400,', '511423', '洪雅县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:36');
INSERT INTO `sys_area` VALUES (511424, 511400, '0,1,510000,511400,', '511424', '丹棱县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:36');
INSERT INTO `sys_area` VALUES (511425, 511400, '0,1,510000,511400,', '511425', '青神县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:36');
INSERT INTO `sys_area` VALUES (511500, 510000, '0,1,510000,', '511500', '宜宾市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:37');
INSERT INTO `sys_area` VALUES (511502, 511500, '0,1,510000,511500,', '511502', '翠屏区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:37');
INSERT INTO `sys_area` VALUES (511521, 511500, '0,1,510000,511500,', '511521', '宜宾县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:37');
INSERT INTO `sys_area` VALUES (511522, 511500, '0,1,510000,511500,', '511522', '南溪县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:37');
INSERT INTO `sys_area` VALUES (511523, 511500, '0,1,510000,511500,', '511523', '江安县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:37');
INSERT INTO `sys_area` VALUES (511524, 511500, '0,1,510000,511500,', '511524', '长宁县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:37');
INSERT INTO `sys_area` VALUES (511525, 511500, '0,1,510000,511500,', '511525', '高县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:38');
INSERT INTO `sys_area` VALUES (511526, 511500, '0,1,510000,511500,', '511526', '珙县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:38');
INSERT INTO `sys_area` VALUES (511527, 511500, '0,1,510000,511500,', '511527', '筠连县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:38');
INSERT INTO `sys_area` VALUES (511528, 511500, '0,1,510000,511500,', '511528', '兴文县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:38');
INSERT INTO `sys_area` VALUES (511529, 511500, '0,1,510000,511500,', '511529', '屏山县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:38');
INSERT INTO `sys_area` VALUES (511600, 510000, '0,1,510000,', '511600', '广安市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:39');
INSERT INTO `sys_area` VALUES (511602, 511600, '0,1,510000,511600,', '511602', '广安区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:39');
INSERT INTO `sys_area` VALUES (511621, 511600, '0,1,510000,511600,', '511621', '岳池县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:39');
INSERT INTO `sys_area` VALUES (511622, 511600, '0,1,510000,511600,', '511622', '武胜县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:39');
INSERT INTO `sys_area` VALUES (511623, 511600, '0,1,510000,511600,', '511623', '邻水县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:39');
INSERT INTO `sys_area` VALUES (511681, 511600, '0,1,510000,511600,', '511681', '华蓥市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:40');
INSERT INTO `sys_area` VALUES (511700, 510000, '0,1,510000,', '511700', '达州市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:40');
INSERT INTO `sys_area` VALUES (511702, 511700, '0,1,510000,511700,', '511702', '通川区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:40');
INSERT INTO `sys_area` VALUES (511721, 511700, '0,1,510000,511700,', '511721', '达县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:40');
INSERT INTO `sys_area` VALUES (511722, 511700, '0,1,510000,511700,', '511722', '宣汉县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:40');
INSERT INTO `sys_area` VALUES (511723, 511700, '0,1,510000,511700,', '511723', '开江县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:41');
INSERT INTO `sys_area` VALUES (511724, 511700, '0,1,510000,511700,', '511724', '大竹县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:41');
INSERT INTO `sys_area` VALUES (511725, 511700, '0,1,510000,511700,', '511725', '渠县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:41');
INSERT INTO `sys_area` VALUES (511781, 511700, '0,1,510000,511700,', '511781', '万源市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:41');
INSERT INTO `sys_area` VALUES (511800, 510000, '0,1,510000,', '511800', '雅安市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:42');
INSERT INTO `sys_area` VALUES (511802, 511800, '0,1,510000,511800,', '511802', '雨城区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:42');
INSERT INTO `sys_area` VALUES (511821, 511800, '0,1,510000,511800,', '511821', '名山县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:42');
INSERT INTO `sys_area` VALUES (511822, 511800, '0,1,510000,511800,', '511822', '荥经县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:42');
INSERT INTO `sys_area` VALUES (511823, 511800, '0,1,510000,511800,', '511823', '汉源县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:42');
INSERT INTO `sys_area` VALUES (511824, 511800, '0,1,510000,511800,', '511824', '石棉县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:43');
INSERT INTO `sys_area` VALUES (511825, 511800, '0,1,510000,511800,', '511825', '天全县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:43');
INSERT INTO `sys_area` VALUES (511826, 511800, '0,1,510000,511800,', '511826', '芦山县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:43');
INSERT INTO `sys_area` VALUES (511827, 511800, '0,1,510000,511800,', '511827', '宝兴县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:43');
INSERT INTO `sys_area` VALUES (511900, 510000, '0,1,510000,', '511900', '巴中市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:44');
INSERT INTO `sys_area` VALUES (511902, 511900, '0,1,510000,511900,', '511902', '巴州区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:44');
INSERT INTO `sys_area` VALUES (511921, 511900, '0,1,510000,511900,', '511921', '通江县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:44');
INSERT INTO `sys_area` VALUES (511922, 511900, '0,1,510000,511900,', '511922', '南江县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:44');
INSERT INTO `sys_area` VALUES (511923, 511900, '0,1,510000,511900,', '511923', '平昌县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:44');
INSERT INTO `sys_area` VALUES (512000, 510000, '0,1,510000,', '512000', '资阳市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:45');
INSERT INTO `sys_area` VALUES (512002, 512000, '0,1,510000,512000,', '512002', '雁江区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:45');
INSERT INTO `sys_area` VALUES (512021, 512000, '0,1,510000,512000,', '512021', '安岳县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:45');
INSERT INTO `sys_area` VALUES (512022, 512000, '0,1,510000,512000,', '512022', '乐至县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:45');
INSERT INTO `sys_area` VALUES (512081, 512000, '0,1,510000,512000,', '512081', '简阳市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:45');
INSERT INTO `sys_area` VALUES (513200, 510000, '0,1,510000,', '513200', '阿坝藏族羌族自治州', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:46');
INSERT INTO `sys_area` VALUES (513221, 513200, '0,1,510000,513200,', '513221', '汶川县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:46');
INSERT INTO `sys_area` VALUES (513222, 513200, '0,1,510000,513200,', '513222', '理县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:46');
INSERT INTO `sys_area` VALUES (513223, 513200, '0,1,510000,513200,', '513223', '茂县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:46');
INSERT INTO `sys_area` VALUES (513224, 513200, '0,1,510000,513200,', '513224', '松潘县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:46');
INSERT INTO `sys_area` VALUES (513225, 513200, '0,1,510000,513200,', '513225', '九寨沟县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:46');
INSERT INTO `sys_area` VALUES (513226, 513200, '0,1,510000,513200,', '513226', '金川县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:47');
INSERT INTO `sys_area` VALUES (513227, 513200, '0,1,510000,513200,', '513227', '小金县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:47');
INSERT INTO `sys_area` VALUES (513228, 513200, '0,1,510000,513200,', '513228', '黑水县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:47');
INSERT INTO `sys_area` VALUES (513229, 513200, '0,1,510000,513200,', '513229', '马尔康县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:47');
INSERT INTO `sys_area` VALUES (513230, 513200, '0,1,510000,513200,', '513230', '壤塘县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:47');
INSERT INTO `sys_area` VALUES (513231, 513200, '0,1,510000,513200,', '513231', '阿坝县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:48');
INSERT INTO `sys_area` VALUES (513232, 513200, '0,1,510000,513200,', '513232', '若尔盖县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:48');
INSERT INTO `sys_area` VALUES (513233, 513200, '0,1,510000,513200,', '513233', '红原县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:48');
INSERT INTO `sys_area` VALUES (513240, 513200, '0,1,510000,513200,', '513240', '卧龙特区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:48');
INSERT INTO `sys_area` VALUES (513300, 510000, '0,1,510000,', '513300', '甘孜藏族自治州', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:49');
INSERT INTO `sys_area` VALUES (513321, 513300, '0,1,510000,513300,', '513321', '康定县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:49');
INSERT INTO `sys_area` VALUES (513322, 513300, '0,1,510000,513300,', '513322', '泸定县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:49');
INSERT INTO `sys_area` VALUES (513323, 513300, '0,1,510000,513300,', '513323', '丹巴县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:49');
INSERT INTO `sys_area` VALUES (513324, 513300, '0,1,510000,513300,', '513324', '九龙县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:49');
INSERT INTO `sys_area` VALUES (513325, 513300, '0,1,510000,513300,', '513325', '雅江县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:49');
INSERT INTO `sys_area` VALUES (513326, 513300, '0,1,510000,513300,', '513326', '道孚县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:50');
INSERT INTO `sys_area` VALUES (513327, 513300, '0,1,510000,513300,', '513327', '炉霍县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:50');
INSERT INTO `sys_area` VALUES (513328, 513300, '0,1,510000,513300,', '513328', '甘孜县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:50');
INSERT INTO `sys_area` VALUES (513329, 513300, '0,1,510000,513300,', '513329', '新龙县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:50');
INSERT INTO `sys_area` VALUES (513330, 513300, '0,1,510000,513300,', '513330', '德格县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:50');
INSERT INTO `sys_area` VALUES (513331, 513300, '0,1,510000,513300,', '513331', '白玉县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:50');
INSERT INTO `sys_area` VALUES (513332, 513300, '0,1,510000,513300,', '513332', '石渠县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:51');
INSERT INTO `sys_area` VALUES (513333, 513300, '0,1,510000,513300,', '513333', '色达县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:51');
INSERT INTO `sys_area` VALUES (513334, 513300, '0,1,510000,513300,', '513334', '理塘县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:51');
INSERT INTO `sys_area` VALUES (513335, 513300, '0,1,510000,513300,', '513335', '巴塘县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:51');
INSERT INTO `sys_area` VALUES (513336, 513300, '0,1,510000,513300,', '513336', '乡城县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:51');
INSERT INTO `sys_area` VALUES (513337, 513300, '0,1,510000,513300,', '513337', '稻城县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:52');
INSERT INTO `sys_area` VALUES (513338, 513300, '0,1,510000,513300,', '513338', '得荣县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:52');
INSERT INTO `sys_area` VALUES (513400, 510000, '0,1,510000,', '513400', '凉山彝族自治州', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:52');
INSERT INTO `sys_area` VALUES (513401, 513400, '0,1,510000,513400,', '513401', '西昌市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:52');
INSERT INTO `sys_area` VALUES (513422, 513400, '0,1,510000,513400,', '513422', '木里藏族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:52');
INSERT INTO `sys_area` VALUES (513423, 513400, '0,1,510000,513400,', '513423', '盐源县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:53');
INSERT INTO `sys_area` VALUES (513424, 513400, '0,1,510000,513400,', '513424', '德昌县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:53');
INSERT INTO `sys_area` VALUES (513425, 513400, '0,1,510000,513400,', '513425', '会理县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:53');
INSERT INTO `sys_area` VALUES (513426, 513400, '0,1,510000,513400,', '513426', '会东县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:53');
INSERT INTO `sys_area` VALUES (513427, 513400, '0,1,510000,513400,', '513427', '宁南县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:53');
INSERT INTO `sys_area` VALUES (513428, 513400, '0,1,510000,513400,', '513428', '普格县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:54');
INSERT INTO `sys_area` VALUES (513429, 513400, '0,1,510000,513400,', '513429', '布拖县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:54');
INSERT INTO `sys_area` VALUES (513430, 513400, '0,1,510000,513400,', '513430', '金阳县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:54');
INSERT INTO `sys_area` VALUES (513431, 513400, '0,1,510000,513400,', '513431', '昭觉县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:54');
INSERT INTO `sys_area` VALUES (513432, 513400, '0,1,510000,513400,', '513432', '喜德县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:54');
INSERT INTO `sys_area` VALUES (513433, 513400, '0,1,510000,513400,', '513433', '冕宁县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:55');
INSERT INTO `sys_area` VALUES (513434, 513400, '0,1,510000,513400,', '513434', '越西县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:55');
INSERT INTO `sys_area` VALUES (513435, 513400, '0,1,510000,513400,', '513435', '甘洛县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:55');
INSERT INTO `sys_area` VALUES (513436, 513400, '0,1,510000,513400,', '513436', '美姑县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:55');
INSERT INTO `sys_area` VALUES (513437, 513400, '0,1,510000,513400,', '513437', '雷波县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:55');
INSERT INTO `sys_area` VALUES (520000, 1, '0,1,', '520000', '贵州省', 2, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (520100, 520000, '0,1,520000,', '520100', '贵阳市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:56');
INSERT INTO `sys_area` VALUES (520102, 520100, '0,1,520000,520100,', '520102', '南明区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:56');
INSERT INTO `sys_area` VALUES (520103, 520100, '0,1,520000,520100,', '520103', '云岩区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:56');
INSERT INTO `sys_area` VALUES (520111, 520100, '0,1,520000,520100,', '520111', '花溪区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:56');
INSERT INTO `sys_area` VALUES (520112, 520100, '0,1,520000,520100,', '520112', '乌当区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:56');
INSERT INTO `sys_area` VALUES (520113, 520100, '0,1,520000,520100,', '520113', '白云区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:56');
INSERT INTO `sys_area` VALUES (520114, 520100, '0,1,520000,520100,', '520114', '小河区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:57');
INSERT INTO `sys_area` VALUES (520121, 520100, '0,1,520000,520100,', '520121', '开阳县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:57');
INSERT INTO `sys_area` VALUES (520122, 520100, '0,1,520000,520100,', '520122', '息烽县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:57');
INSERT INTO `sys_area` VALUES (520123, 520100, '0,1,520000,520100,', '520123', '修文县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:57');
INSERT INTO `sys_area` VALUES (520181, 520100, '0,1,520000,520100,', '520181', '清镇市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:57');
INSERT INTO `sys_area` VALUES (520200, 520000, '0,1,520000,', '520200', '六盘水市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:58');
INSERT INTO `sys_area` VALUES (520201, 520100, '0,1,520000,520100,', '520201', '钟山区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:58');
INSERT INTO `sys_area` VALUES (520203, 520100, '0,1,520000,520100,', '520203', '六枝特区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:58');
INSERT INTO `sys_area` VALUES (520221, 520100, '0,1,520000,520100,', '520221', '水城县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:58');
INSERT INTO `sys_area` VALUES (520222, 520100, '0,1,520000,520100,', '520222', '盘县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:58');
INSERT INTO `sys_area` VALUES (520300, 520000, '0,1,520000,', '520300', '遵义市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:59');
INSERT INTO `sys_area` VALUES (520302, 520300, '0,1,520000,520300,', '520302', '红花岗区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:59');
INSERT INTO `sys_area` VALUES (520303, 520300, '0,1,520000,520300,', '520303', '汇川区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:59');
INSERT INTO `sys_area` VALUES (520321, 520300, '0,1,520000,520300,', '520321', '遵义县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:59');
INSERT INTO `sys_area` VALUES (520322, 520300, '0,1,520000,520300,', '520322', '桐梓县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:56:59');
INSERT INTO `sys_area` VALUES (520323, 520300, '0,1,520000,520300,', '520323', '绥阳县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:00');
INSERT INTO `sys_area` VALUES (520324, 520300, '0,1,520000,520300,', '520324', '正安县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:00');
INSERT INTO `sys_area` VALUES (520325, 520300, '0,1,520000,520300,', '520325', '道真仡佬族苗族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:00');
INSERT INTO `sys_area` VALUES (520326, 520300, '0,1,520000,520300,', '520326', '务川仡佬族苗族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:00');
INSERT INTO `sys_area` VALUES (520327, 520300, '0,1,520000,520300,', '520327', '凤冈县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:00');
INSERT INTO `sys_area` VALUES (520328, 520300, '0,1,520000,520300,', '520328', '湄潭县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:00');
INSERT INTO `sys_area` VALUES (520329, 520300, '0,1,520000,520300,', '520329', '余庆县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:01');
INSERT INTO `sys_area` VALUES (520330, 520300, '0,1,520000,520300,', '520330', '习水县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:01');
INSERT INTO `sys_area` VALUES (520381, 520300, '0,1,520000,520300,', '520381', '赤水市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:01');
INSERT INTO `sys_area` VALUES (520382, 520300, '0,1,520000,520300,', '520382', '仁怀市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:01');
INSERT INTO `sys_area` VALUES (520400, 520000, '0,1,520000,', '520400', '安顺市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:01');
INSERT INTO `sys_area` VALUES (520402, 520400, '0,1,520000,520400,', '520402', '西秀区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:01');
INSERT INTO `sys_area` VALUES (520421, 520400, '0,1,520000,520400,', '520421', '平坝县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:02');
INSERT INTO `sys_area` VALUES (520422, 520400, '0,1,520000,520400,', '520422', '普定县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:02');
INSERT INTO `sys_area` VALUES (520423, 520400, '0,1,520000,520400,', '520423', '镇宁布依族苗族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:02');
INSERT INTO `sys_area` VALUES (520424, 520400, '0,1,520000,520400,', '520424', '关岭布依族苗族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:02');
INSERT INTO `sys_area` VALUES (520425, 520400, '0,1,520000,520400,', '520425', '紫云苗族布依族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:02');
INSERT INTO `sys_area` VALUES (520440, 520400, '0,1,520000,520400,', '520440', '经济技术开发区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:02');
INSERT INTO `sys_area` VALUES (520441, 520400, '0,1,520000,520400,', '520441', '黄果树管委会', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:03');
INSERT INTO `sys_area` VALUES (522200, 520000, '0,1,520000,', '522200', '铜仁地区', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:03');
INSERT INTO `sys_area` VALUES (522201, 522200, '0,1,520000,522200,', '522201', '铜仁市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:03');
INSERT INTO `sys_area` VALUES (522222, 522200, '0,1,520000,522200,', '522222', '江口县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:03');
INSERT INTO `sys_area` VALUES (522223, 522200, '0,1,520000,522200,', '522223', '玉屏侗族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:03');
INSERT INTO `sys_area` VALUES (522224, 522200, '0,1,520000,522200,', '522224', '石阡县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:03');
INSERT INTO `sys_area` VALUES (522225, 522200, '0,1,520000,522200,', '522225', '思南县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:04');
INSERT INTO `sys_area` VALUES (522226, 522200, '0,1,520000,522200,', '522226', '印江土家族苗族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:04');
INSERT INTO `sys_area` VALUES (522227, 522200, '0,1,520000,522200,', '522227', '德江县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:04');
INSERT INTO `sys_area` VALUES (522228, 522200, '0,1,520000,522200,', '522228', '沿河土家族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:04');
INSERT INTO `sys_area` VALUES (522229, 522200, '0,1,520000,522200,', '522229', '松桃苗族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:04');
INSERT INTO `sys_area` VALUES (522230, 522200, '0,1,520000,522200,', '522230', '万山特区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:05');
INSERT INTO `sys_area` VALUES (522300, 520000, '0,1,520000,', '522300', '黔西南布依族苗族自治州', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:05');
INSERT INTO `sys_area` VALUES (522301, 522300, '0,1,520000,522300,', '522301', '兴义市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:05');
INSERT INTO `sys_area` VALUES (522322, 522300, '0,1,520000,522300,', '522322', '兴仁县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:05');
INSERT INTO `sys_area` VALUES (522323, 522300, '0,1,520000,522300,', '522323', '普安县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:06');
INSERT INTO `sys_area` VALUES (522324, 522300, '0,1,520000,522300,', '522324', '晴隆县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:06');
INSERT INTO `sys_area` VALUES (522325, 522300, '0,1,520000,522300,', '522325', '贞丰县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:06');
INSERT INTO `sys_area` VALUES (522326, 522300, '0,1,520000,522300,', '522326', '望谟县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:06');
INSERT INTO `sys_area` VALUES (522327, 522300, '0,1,520000,522300,', '522327', '册亨县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:06');
INSERT INTO `sys_area` VALUES (522328, 522300, '0,1,520000,522300,', '522328', '安龙县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:06');
INSERT INTO `sys_area` VALUES (522340, 522300, '0,1,520000,522300,', '522340', '顶效经济技术开发区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:07');
INSERT INTO `sys_area` VALUES (522400, 520000, '0,1,520000,', '522400', '毕节地区', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:07');
INSERT INTO `sys_area` VALUES (522401, 522400, '0,1,520000,522400,', '522401', '毕节市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:07');
INSERT INTO `sys_area` VALUES (522422, 522400, '0,1,520000,522400,', '522422', '大方县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:07');
INSERT INTO `sys_area` VALUES (522423, 522400, '0,1,520000,522400,', '522423', '黔西县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:07');
INSERT INTO `sys_area` VALUES (522424, 522400, '0,1,520000,522400,', '522424', '金沙县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:08');
INSERT INTO `sys_area` VALUES (522425, 522400, '0,1,520000,522400,', '522425', '织金县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:08');
INSERT INTO `sys_area` VALUES (522426, 522400, '0,1,520000,522400,', '522426', '纳雍县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:08');
INSERT INTO `sys_area` VALUES (522427, 522400, '0,1,520000,522400,', '522427', '威宁彝族回族苗族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:08');
INSERT INTO `sys_area` VALUES (522428, 522400, '0,1,520000,522400,', '522428', '赫章县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:08');
INSERT INTO `sys_area` VALUES (522440, 522400, '0,1,520000,522400,', '522440', '百里杜鹃管理区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:08');
INSERT INTO `sys_area` VALUES (522600, 520000, '0,1,520000,', '522600', '黔东南苗族侗族自治州', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:09');
INSERT INTO `sys_area` VALUES (522601, 522600, '0,1,520000,522600,', '522601', '凯里市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:09');
INSERT INTO `sys_area` VALUES (522622, 522600, '0,1,520000,522600,', '522622', '黄平县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:09');
INSERT INTO `sys_area` VALUES (522623, 522600, '0,1,520000,522600,', '522623', '施秉县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:09');
INSERT INTO `sys_area` VALUES (522624, 522600, '0,1,520000,522600,', '522624', '三穗县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:09');
INSERT INTO `sys_area` VALUES (522625, 522600, '0,1,520000,522600,', '522625', '镇远县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:09');
INSERT INTO `sys_area` VALUES (522626, 522600, '0,1,520000,522600,', '522626', '岑巩县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:10');
INSERT INTO `sys_area` VALUES (522627, 522600, '0,1,520000,522600,', '522627', '天柱县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:10');
INSERT INTO `sys_area` VALUES (522628, 522600, '0,1,520000,522600,', '522628', '锦屏县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:10');
INSERT INTO `sys_area` VALUES (522629, 522600, '0,1,520000,522600,', '522629', '剑河县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:10');
INSERT INTO `sys_area` VALUES (522630, 522600, '0,1,520000,522600,', '522630', '台江县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:10');
INSERT INTO `sys_area` VALUES (522631, 522600, '0,1,520000,522600,', '522631', '黎平县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:10');
INSERT INTO `sys_area` VALUES (522632, 522600, '0,1,520000,522600,', '522632', '榕江县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:10');
INSERT INTO `sys_area` VALUES (522633, 522600, '0,1,520000,522600,', '522633', '从江县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:11');
INSERT INTO `sys_area` VALUES (522634, 522600, '0,1,520000,522600,', '522634', '雷山县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:11');
INSERT INTO `sys_area` VALUES (522635, 522600, '0,1,520000,522600,', '522635', '麻江县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:11');
INSERT INTO `sys_area` VALUES (522636, 522600, '0,1,520000,522600,', '522636', '丹寨县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:11');
INSERT INTO `sys_area` VALUES (522700, 520000, '0,1,520000,', '522700', '黔南布依族苗族自治州', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:12');
INSERT INTO `sys_area` VALUES (522701, 522700, '0,1,520000,522700,', '522701', '都匀市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:12');
INSERT INTO `sys_area` VALUES (522702, 522700, '0,1,520000,522700,', '522702', '福泉市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:12');
INSERT INTO `sys_area` VALUES (522722, 522700, '0,1,520000,522700,', '522722', '荔波县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:12');
INSERT INTO `sys_area` VALUES (522723, 522700, '0,1,520000,522700,', '522723', '贵定县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:12');
INSERT INTO `sys_area` VALUES (522725, 522700, '0,1,520000,522700,', '522725', '瓮安县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:12');
INSERT INTO `sys_area` VALUES (522726, 522700, '0,1,520000,522700,', '522726', '独山县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:13');
INSERT INTO `sys_area` VALUES (522727, 522700, '0,1,520000,522700,', '522727', '平塘县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:13');
INSERT INTO `sys_area` VALUES (522728, 522700, '0,1,520000,522700,', '522728', '罗甸县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:13');
INSERT INTO `sys_area` VALUES (522729, 522700, '0,1,520000,522700,', '522729', '长顺县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:13');
INSERT INTO `sys_area` VALUES (522730, 522700, '0,1,520000,522700,', '522730', '龙里县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:13');
INSERT INTO `sys_area` VALUES (522731, 522700, '0,1,520000,522700,', '522731', '惠水县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:13');
INSERT INTO `sys_area` VALUES (522732, 522700, '0,1,520000,522700,', '522732', '三都水族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:14');
INSERT INTO `sys_area` VALUES (530000, 1, '0,1,', '530000', '云南省', 2, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (530100, 530000, '0,1,530000,', '530100', '昆明市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:14');
INSERT INTO `sys_area` VALUES (530102, 530100, '0,1,530000,530100,', '530102', '五华区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:14');
INSERT INTO `sys_area` VALUES (530103, 530100, '0,1,530000,530100,', '530103', '盘龙区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:14');
INSERT INTO `sys_area` VALUES (530111, 530100, '0,1,530000,530100,', '530111', '官渡区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:14');
INSERT INTO `sys_area` VALUES (530112, 530100, '0,1,530000,530100,', '530112', '西山区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:15');
INSERT INTO `sys_area` VALUES (530113, 530100, '0,1,530000,530100,', '530113', '东川区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:15');
INSERT INTO `sys_area` VALUES (530121, 530100, '0,1,530000,530100,', '530121', '呈贡县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:15');
INSERT INTO `sys_area` VALUES (530122, 530100, '0,1,530000,530100,', '530122', '晋宁县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:15');
INSERT INTO `sys_area` VALUES (530124, 530100, '0,1,530000,530100,', '530124', '富民县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:15');
INSERT INTO `sys_area` VALUES (530125, 530100, '0,1,530000,530100,', '530125', '宜良县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:15');
INSERT INTO `sys_area` VALUES (530126, 530100, '0,1,530000,530100,', '530126', '石林彝族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:15');
INSERT INTO `sys_area` VALUES (530127, 530100, '0,1,530000,530100,', '530127', '嵩明县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:16');
INSERT INTO `sys_area` VALUES (530128, 530100, '0,1,530000,530100,', '530128', '禄劝彝族苗族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:16');
INSERT INTO `sys_area` VALUES (530129, 530100, '0,1,530000,530100,', '530129', '寻甸回族彝族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:16');
INSERT INTO `sys_area` VALUES (530181, 530100, '0,1,530000,530100,', '530181', '安宁市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:16');
INSERT INTO `sys_area` VALUES (530300, 530000, '0,1,530000,', '530300', '曲靖市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:16');
INSERT INTO `sys_area` VALUES (530302, 530300, '0,1,530000,530300,', '530302', '麒麟区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:16');
INSERT INTO `sys_area` VALUES (530321, 530300, '0,1,530000,530300,', '530321', '马龙县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:17');
INSERT INTO `sys_area` VALUES (530322, 530300, '0,1,530000,530300,', '530322', '陆良县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:17');
INSERT INTO `sys_area` VALUES (530323, 530300, '0,1,530000,530300,', '530323', '师宗县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:17');
INSERT INTO `sys_area` VALUES (530324, 530300, '0,1,530000,530300,', '530324', '罗平县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:17');
INSERT INTO `sys_area` VALUES (530325, 530300, '0,1,530000,530300,', '530325', '富源县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:18');
INSERT INTO `sys_area` VALUES (530326, 530300, '0,1,530000,530300,', '530326', '会泽县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:18');
INSERT INTO `sys_area` VALUES (530328, 530300, '0,1,530000,530300,', '530328', '沾益县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:18');
INSERT INTO `sys_area` VALUES (530381, 530300, '0,1,530000,530300,', '530381', '宣威市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:18');
INSERT INTO `sys_area` VALUES (530400, 530000, '0,1,530000,', '530400', '玉溪市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:19');
INSERT INTO `sys_area` VALUES (530402, 530400, '0,1,530000,530400,', '530402', '红塔区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:19');
INSERT INTO `sys_area` VALUES (530421, 530400, '0,1,530000,530400,', '530421', '江川县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:19');
INSERT INTO `sys_area` VALUES (530422, 530400, '0,1,530000,530400,', '530422', '澄江县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:19');
INSERT INTO `sys_area` VALUES (530423, 530400, '0,1,530000,530400,', '530423', '通海县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:19');
INSERT INTO `sys_area` VALUES (530424, 530400, '0,1,530000,530400,', '530424', '华宁县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:19');
INSERT INTO `sys_area` VALUES (530425, 530400, '0,1,530000,530400,', '530425', '易门县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:19');
INSERT INTO `sys_area` VALUES (530426, 530400, '0,1,530000,530400,', '530426', '峨山彝族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:20');
INSERT INTO `sys_area` VALUES (530427, 530400, '0,1,530000,530400,', '530427', '新平彝族傣族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:20');
INSERT INTO `sys_area` VALUES (530428, 530400, '0,1,530000,530400,', '530428', '元江哈尼族彝族傣族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:20');
INSERT INTO `sys_area` VALUES (530500, 530000, '0,1,530000,', '530500', '保山市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:20');
INSERT INTO `sys_area` VALUES (530502, 530500, '0,1,530000,530500,', '530502', '隆阳区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:20');
INSERT INTO `sys_area` VALUES (530521, 530500, '0,1,530000,530500,', '530521', '施甸县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:20');
INSERT INTO `sys_area` VALUES (530522, 530500, '0,1,530000,530500,', '530522', '腾冲县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:21');
INSERT INTO `sys_area` VALUES (530523, 530500, '0,1,530000,530500,', '530523', '龙陵县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:21');
INSERT INTO `sys_area` VALUES (530524, 530500, '0,1,530000,530500,', '530524', '昌宁县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:21');
INSERT INTO `sys_area` VALUES (530600, 530000, '0,1,530000,', '530600', '昭通市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:21');
INSERT INTO `sys_area` VALUES (530602, 530600, '0,1,530000,530600,', '530602', '昭阳区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:21');
INSERT INTO `sys_area` VALUES (530621, 530600, '0,1,530000,530600,', '530621', '鲁甸县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:21');
INSERT INTO `sys_area` VALUES (530622, 530600, '0,1,530000,530600,', '530622', '巧家县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:22');
INSERT INTO `sys_area` VALUES (530623, 530600, '0,1,530000,530600,', '530623', '盐津县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:22');
INSERT INTO `sys_area` VALUES (530624, 530600, '0,1,530000,530600,', '530624', '大关县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:22');
INSERT INTO `sys_area` VALUES (530625, 530600, '0,1,530000,530600,', '530625', '永善县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:22');
INSERT INTO `sys_area` VALUES (530626, 530600, '0,1,530000,530600,', '530626', '绥江县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:22');
INSERT INTO `sys_area` VALUES (530627, 530600, '0,1,530000,530600,', '530627', '镇雄县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:22');
INSERT INTO `sys_area` VALUES (530628, 530600, '0,1,530000,530600,', '530628', '彝良县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:23');
INSERT INTO `sys_area` VALUES (530629, 530600, '0,1,530000,530600,', '530629', '威信县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:23');
INSERT INTO `sys_area` VALUES (530630, 530600, '0,1,530000,530600,', '530630', '水富县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:23');
INSERT INTO `sys_area` VALUES (530700, 530000, '0,1,530000,', '530700', '丽江市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:24');
INSERT INTO `sys_area` VALUES (530702, 530700, '0,1,530000,530700,', '530702', '古城区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:24');
INSERT INTO `sys_area` VALUES (530721, 530700, '0,1,530000,530700,', '530721', '玉龙纳西族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:24');
INSERT INTO `sys_area` VALUES (530722, 530700, '0,1,530000,530700,', '530722', '永胜县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:24');
INSERT INTO `sys_area` VALUES (530723, 530700, '0,1,530000,530700,', '530723', '华坪县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:24');
INSERT INTO `sys_area` VALUES (530724, 530700, '0,1,530000,530700,', '530724', '宁蒗彝族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:25');
INSERT INTO `sys_area` VALUES (530800, 530000, '0,1,530000,', '530800', '普洱市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:25');
INSERT INTO `sys_area` VALUES (530802, 530800, '0,1,530000,530800,', '530802', '思茅区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:25');
INSERT INTO `sys_area` VALUES (530821, 530800, '0,1,530000,530800,', '530821', '宁洱哈尼族彝族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:25');
INSERT INTO `sys_area` VALUES (530822, 530800, '0,1,530000,530800,', '530822', '墨江哈尼族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:25');
INSERT INTO `sys_area` VALUES (530823, 530800, '0,1,530000,530800,', '530823', '景东彝族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:26');
INSERT INTO `sys_area` VALUES (530824, 530800, '0,1,530000,530800,', '530824', '景谷傣族彝族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:26');
INSERT INTO `sys_area` VALUES (530825, 530800, '0,1,530000,530800,', '530825', '镇沅彝族哈尼族拉祜族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:26');
INSERT INTO `sys_area` VALUES (530826, 530800, '0,1,530000,530800,', '530826', '江城哈尼族彝族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:26');
INSERT INTO `sys_area` VALUES (530827, 530800, '0,1,530000,530800,', '530827', '孟连傣族拉祜族佤族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:26');
INSERT INTO `sys_area` VALUES (530828, 530800, '0,1,530000,530800,', '530828', '澜沧拉祜族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:27');
INSERT INTO `sys_area` VALUES (530829, 530800, '0,1,530000,530800,', '530829', '西盟佤族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:27');
INSERT INTO `sys_area` VALUES (530900, 530000, '0,1,530000,', '530900', '临沧市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:27');
INSERT INTO `sys_area` VALUES (530902, 530900, '0,1,530000,530900,', '530902', '临翔区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:27');
INSERT INTO `sys_area` VALUES (530921, 530900, '0,1,530000,530900,', '530921', '凤庆县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:27');
INSERT INTO `sys_area` VALUES (530922, 530900, '0,1,530000,530900,', '530922', '云县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:27');
INSERT INTO `sys_area` VALUES (530923, 530900, '0,1,530000,530900,', '530923', '永德县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:28');
INSERT INTO `sys_area` VALUES (530924, 530900, '0,1,530000,530900,', '530924', '镇康县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:28');
INSERT INTO `sys_area` VALUES (530925, 530900, '0,1,530000,530900,', '530925', '双江拉祜族佤族布朗族傣族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:28');
INSERT INTO `sys_area` VALUES (530926, 530900, '0,1,530000,530900,', '530926', '耿马傣族佤族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:28');
INSERT INTO `sys_area` VALUES (530927, 530900, '0,1,530000,530900,', '530927', '沧源佤族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:28');
INSERT INTO `sys_area` VALUES (532300, 530000, '0,1,530000,', '532300', '楚雄彝族自治州', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:28');
INSERT INTO `sys_area` VALUES (532301, 532300, '0,1,530000,532300,', '532301', '楚雄市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:29');
INSERT INTO `sys_area` VALUES (532322, 532300, '0,1,530000,532300,', '532322', '双柏县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:29');
INSERT INTO `sys_area` VALUES (532323, 532300, '0,1,530000,532300,', '532323', '牟定县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:29');
INSERT INTO `sys_area` VALUES (532324, 532300, '0,1,530000,532300,', '532324', '南华县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:29');
INSERT INTO `sys_area` VALUES (532325, 532300, '0,1,530000,532300,', '532325', '姚安县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:29');
INSERT INTO `sys_area` VALUES (532326, 532300, '0,1,530000,532300,', '532326', '大姚县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:30');
INSERT INTO `sys_area` VALUES (532327, 532300, '0,1,530000,532300,', '532327', '永仁县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:30');
INSERT INTO `sys_area` VALUES (532328, 532300, '0,1,530000,532300,', '532328', '元谋县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:30');
INSERT INTO `sys_area` VALUES (532329, 532300, '0,1,530000,532300,', '532329', '武定县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:30');
INSERT INTO `sys_area` VALUES (532331, 532300, '0,1,530000,532300,', '532331', '禄丰县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:30');
INSERT INTO `sys_area` VALUES (532500, 530000, '0,1,530000,', '532500', '红河哈尼族彝族自治州', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:31');
INSERT INTO `sys_area` VALUES (532501, 532331, '0,1,530000,532300,532331,', '532501', '个旧市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:31');
INSERT INTO `sys_area` VALUES (532502, 532331, '0,1,530000,532300,532331,', '532502', '开远市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:31');
INSERT INTO `sys_area` VALUES (532522, 532331, '0,1,530000,532300,532331,', '532522', '蒙自县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:32');
INSERT INTO `sys_area` VALUES (532523, 532331, '0,1,530000,532300,532331,', '532523', '屏边苗族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:32');
INSERT INTO `sys_area` VALUES (532524, 532331, '0,1,530000,532300,532331,', '532524', '建水县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:32');
INSERT INTO `sys_area` VALUES (532525, 532331, '0,1,530000,532300,532331,', '532525', '石屏县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:32');
INSERT INTO `sys_area` VALUES (532526, 532331, '0,1,530000,532300,532331,', '532526', '弥勒县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:32');
INSERT INTO `sys_area` VALUES (532527, 532331, '0,1,530000,532300,532331,', '532527', '泸西县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:32');
INSERT INTO `sys_area` VALUES (532528, 532331, '0,1,530000,532300,532331,', '532528', '元阳县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:33');
INSERT INTO `sys_area` VALUES (532529, 532331, '0,1,530000,532300,532331,', '532529', '红河县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:33');
INSERT INTO `sys_area` VALUES (532530, 532331, '0,1,530000,532300,532331,', '532530', '金平苗族瑶族傣族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:33');
INSERT INTO `sys_area` VALUES (532531, 532331, '0,1,530000,532300,532331,', '532531', '绿春县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:33');
INSERT INTO `sys_area` VALUES (532532, 532331, '0,1,530000,532300,532331,', '532532', '河口瑶族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:33');
INSERT INTO `sys_area` VALUES (532600, 530000, '0,1,530000,', '532600', '文山壮族苗族自治州', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:34');
INSERT INTO `sys_area` VALUES (532621, 532600, '0,1,530000,532600,', '532621', '文山县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:34');
INSERT INTO `sys_area` VALUES (532622, 532600, '0,1,530000,532600,', '532622', '砚山县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:34');
INSERT INTO `sys_area` VALUES (532623, 532600, '0,1,530000,532600,', '532623', '西畴县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:34');
INSERT INTO `sys_area` VALUES (532624, 532600, '0,1,530000,532600,', '532624', '麻栗坡县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:35');
INSERT INTO `sys_area` VALUES (532625, 532600, '0,1,530000,532600,', '532625', '马关县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:35');
INSERT INTO `sys_area` VALUES (532626, 532600, '0,1,530000,532600,', '532626', '丘北县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:35');
INSERT INTO `sys_area` VALUES (532627, 532600, '0,1,530000,532600,', '532627', '广南县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:35');
INSERT INTO `sys_area` VALUES (532628, 532600, '0,1,530000,532600,', '532628', '富宁县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:35');
INSERT INTO `sys_area` VALUES (532800, 530000, '0,1,530000,', '532800', '西双版纳傣族自治州', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:36');
INSERT INTO `sys_area` VALUES (532801, 532800, '0,1,530000,532800,', '532801', '景洪市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:36');
INSERT INTO `sys_area` VALUES (532822, 532800, '0,1,530000,532800,', '532822', '勐海县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:36');
INSERT INTO `sys_area` VALUES (532823, 532800, '0,1,530000,532800,', '532823', '勐腊县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:36');
INSERT INTO `sys_area` VALUES (532900, 530000, '0,1,530000,', '532900', '大理白族自治州', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:37');
INSERT INTO `sys_area` VALUES (532901, 532900, '0,1,530000,532900,', '532901', '大理市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:37');
INSERT INTO `sys_area` VALUES (532922, 532900, '0,1,530000,532900,', '532922', '漾濞彝族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:37');
INSERT INTO `sys_area` VALUES (532923, 532900, '0,1,530000,532900,', '532923', '祥云县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:37');
INSERT INTO `sys_area` VALUES (532924, 532900, '0,1,530000,532900,', '532924', '宾川县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:37');
INSERT INTO `sys_area` VALUES (532925, 532900, '0,1,530000,532900,', '532925', '弥渡县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:38');
INSERT INTO `sys_area` VALUES (532926, 532900, '0,1,530000,532900,', '532926', '南涧彝族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:38');
INSERT INTO `sys_area` VALUES (532927, 532900, '0,1,530000,532900,', '532927', '巍山彝族回族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:38');
INSERT INTO `sys_area` VALUES (532928, 532900, '0,1,530000,532900,', '532928', '永平县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:38');
INSERT INTO `sys_area` VALUES (532929, 532900, '0,1,530000,532900,', '532929', '云龙县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:38');
INSERT INTO `sys_area` VALUES (532930, 532900, '0,1,530000,532900,', '532930', '洱源县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:38');
INSERT INTO `sys_area` VALUES (532931, 532900, '0,1,530000,532900,', '532931', '剑川县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:39');
INSERT INTO `sys_area` VALUES (532932, 532900, '0,1,530000,532900,', '532932', '鹤庆县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:39');
INSERT INTO `sys_area` VALUES (533100, 530000, '0,1,530000,', '533100', '德宏傣族景颇族自治州', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:39');
INSERT INTO `sys_area` VALUES (533102, 533100, '0,1,530000,533100,', '533102', '瑞丽市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:39');
INSERT INTO `sys_area` VALUES (533103, 533100, '0,1,530000,533100,', '533103', '潞西市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:39');
INSERT INTO `sys_area` VALUES (533122, 533100, '0,1,530000,533100,', '533122', '梁河县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:40');
INSERT INTO `sys_area` VALUES (533123, 533100, '0,1,530000,533100,', '533123', '盈江县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:40');
INSERT INTO `sys_area` VALUES (533124, 533100, '0,1,530000,533100,', '533124', '陇川县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:40');
INSERT INTO `sys_area` VALUES (533300, 530000, '0,1,530000,', '533300', '怒江傈僳族自治州', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:40');
INSERT INTO `sys_area` VALUES (533321, 533300, '0,1,530000,533300,', '533321', '泸水县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:40');
INSERT INTO `sys_area` VALUES (533323, 533300, '0,1,530000,533300,', '533323', '福贡县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:41');
INSERT INTO `sys_area` VALUES (533324, 533300, '0,1,530000,533300,', '533324', '贡山独龙族怒族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:41');
INSERT INTO `sys_area` VALUES (533325, 533300, '0,1,530000,533300,', '533325', '兰坪白族普米族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:41');
INSERT INTO `sys_area` VALUES (533400, 530000, '0,1,530000,', '533400', '迪庆藏族自治州', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:41');
INSERT INTO `sys_area` VALUES (533421, 533400, '0,1,530000,533400,', '533421', '香格里拉县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:42');
INSERT INTO `sys_area` VALUES (533422, 533400, '0,1,530000,533400,', '533422', '德钦县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:42');
INSERT INTO `sys_area` VALUES (533423, 533400, '0,1,530000,533400,', '533423', '维西傈僳族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:42');
INSERT INTO `sys_area` VALUES (540000, 1, '0,1,', '540000', '西藏自治区', 2, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (540100, 540000, '0,1,540000,', '540100', '拉萨市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:42');
INSERT INTO `sys_area` VALUES (540102, 540100, '0,1,540000,540100,', '540102', '城关区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:42');
INSERT INTO `sys_area` VALUES (540121, 540100, '0,1,540000,540100,', '540121', '林周县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:43');
INSERT INTO `sys_area` VALUES (540122, 540100, '0,1,540000,540100,', '540122', '当雄县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:43');
INSERT INTO `sys_area` VALUES (540123, 540100, '0,1,540000,540100,', '540123', '尼木县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:43');
INSERT INTO `sys_area` VALUES (540124, 540100, '0,1,540000,540100,', '540124', '曲水县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:43');
INSERT INTO `sys_area` VALUES (540125, 540100, '0,1,540000,540100,', '540125', '堆龙德庆县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:43');
INSERT INTO `sys_area` VALUES (540126, 540100, '0,1,540000,540100,', '540126', '达孜县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:43');
INSERT INTO `sys_area` VALUES (540127, 540100, '0,1,540000,540100,', '540127', '墨竹工卡县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:44');
INSERT INTO `sys_area` VALUES (542100, 540000, '0,1,540000,', '542100', '昌都地区', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:44');
INSERT INTO `sys_area` VALUES (542121, 542100, '0,1,540000,542100,', '542121', '昌都县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:44');
INSERT INTO `sys_area` VALUES (542122, 542100, '0,1,540000,542100,', '542122', '江达县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:44');
INSERT INTO `sys_area` VALUES (542123, 542100, '0,1,540000,542100,', '542123', '贡觉县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:44');
INSERT INTO `sys_area` VALUES (542124, 542100, '0,1,540000,542100,', '542124', '类乌齐县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:44');
INSERT INTO `sys_area` VALUES (542125, 542100, '0,1,540000,542100,', '542125', '丁青县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:45');
INSERT INTO `sys_area` VALUES (542126, 542100, '0,1,540000,542100,', '542126', '察雅县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:45');
INSERT INTO `sys_area` VALUES (542127, 542100, '0,1,540000,542100,', '542127', '八宿县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:45');
INSERT INTO `sys_area` VALUES (542128, 542100, '0,1,540000,542100,', '542128', '左贡县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:45');
INSERT INTO `sys_area` VALUES (542129, 542100, '0,1,540000,542100,', '542129', '芒康县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:45');
INSERT INTO `sys_area` VALUES (542132, 542100, '0,1,540000,542100,', '542132', '洛隆县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:46');
INSERT INTO `sys_area` VALUES (542133, 542100, '0,1,540000,542100,', '542133', '边坝县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:46');
INSERT INTO `sys_area` VALUES (542200, 540000, '0,1,540000,', '542200', '山南地区', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:46');
INSERT INTO `sys_area` VALUES (542221, 542200, '0,1,540000,542200,', '542221', '乃东县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:46');
INSERT INTO `sys_area` VALUES (542222, 542200, '0,1,540000,542200,', '542222', '扎囊县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:46');
INSERT INTO `sys_area` VALUES (542223, 542200, '0,1,540000,542200,', '542223', '贡嘎县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:47');
INSERT INTO `sys_area` VALUES (542224, 542200, '0,1,540000,542200,', '542224', '桑日县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:47');
INSERT INTO `sys_area` VALUES (542225, 542200, '0,1,540000,542200,', '542225', '琼结县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:47');
INSERT INTO `sys_area` VALUES (542226, 542200, '0,1,540000,542200,', '542226', '曲松县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:47');
INSERT INTO `sys_area` VALUES (542227, 542200, '0,1,540000,542200,', '542227', '措美县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:47');
INSERT INTO `sys_area` VALUES (542228, 542200, '0,1,540000,542200,', '542228', '洛扎县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:48');
INSERT INTO `sys_area` VALUES (542229, 542200, '0,1,540000,542200,', '542229', '加查县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:48');
INSERT INTO `sys_area` VALUES (542231, 542200, '0,1,540000,542200,', '542231', '隆子县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:48');
INSERT INTO `sys_area` VALUES (542232, 542200, '0,1,540000,542200,', '542232', '错那县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:48');
INSERT INTO `sys_area` VALUES (542233, 542200, '0,1,540000,542200,', '542233', '浪卡子县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:49');
INSERT INTO `sys_area` VALUES (542300, 540000, '0,1,540000,', '542300', '日喀则地区', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:49');
INSERT INTO `sys_area` VALUES (542301, 542300, '0,1,540000,542300,', '542301', '日喀则市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:49');
INSERT INTO `sys_area` VALUES (542322, 542300, '0,1,540000,542300,', '542322', '南木林县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:49');
INSERT INTO `sys_area` VALUES (542323, 542300, '0,1,540000,542300,', '542323', '江孜县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:49');
INSERT INTO `sys_area` VALUES (542324, 542300, '0,1,540000,542300,', '542324', '定日县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:50');
INSERT INTO `sys_area` VALUES (542325, 542300, '0,1,540000,542300,', '542325', '萨迦县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:50');
INSERT INTO `sys_area` VALUES (542326, 542300, '0,1,540000,542300,', '542326', '拉孜县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:50');
INSERT INTO `sys_area` VALUES (542327, 542300, '0,1,540000,542300,', '542327', '昂仁县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:50');
INSERT INTO `sys_area` VALUES (542328, 542300, '0,1,540000,542300,', '542328', '谢通门县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:50');
INSERT INTO `sys_area` VALUES (542329, 542300, '0,1,540000,542300,', '542329', '白朗县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:50');
INSERT INTO `sys_area` VALUES (542330, 542300, '0,1,540000,542300,', '542330', '仁布县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:50');
INSERT INTO `sys_area` VALUES (542331, 542300, '0,1,540000,542300,', '542331', '康马县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:51');
INSERT INTO `sys_area` VALUES (542332, 542300, '0,1,540000,542300,', '542332', '定结县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:51');
INSERT INTO `sys_area` VALUES (542333, 542300, '0,1,540000,542300,', '542333', '仲巴县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:51');
INSERT INTO `sys_area` VALUES (542334, 542300, '0,1,540000,542300,', '542334', '亚东县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:51');
INSERT INTO `sys_area` VALUES (542335, 542300, '0,1,540000,542300,', '542335', '吉隆县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:51');
INSERT INTO `sys_area` VALUES (542336, 542300, '0,1,540000,542300,', '542336', '聂拉木县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:51');
INSERT INTO `sys_area` VALUES (542337, 542300, '0,1,540000,542300,', '542337', '萨嘎县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:52');
INSERT INTO `sys_area` VALUES (542338, 542300, '0,1,540000,542300,', '542338', '岗巴县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:52');
INSERT INTO `sys_area` VALUES (542400, 540000, '0,1,540000,', '542400', '那曲地区', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:52');
INSERT INTO `sys_area` VALUES (542421, 542400, '0,1,540000,542400,', '542421', '那曲县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:52');
INSERT INTO `sys_area` VALUES (542422, 542400, '0,1,540000,542400,', '542422', '嘉黎县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:52');
INSERT INTO `sys_area` VALUES (542423, 542400, '0,1,540000,542400,', '542423', '比如县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:52');
INSERT INTO `sys_area` VALUES (542424, 542400, '0,1,540000,542400,', '542424', '聂荣县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:53');
INSERT INTO `sys_area` VALUES (542425, 542400, '0,1,540000,542400,', '542425', '安多县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:53');
INSERT INTO `sys_area` VALUES (542426, 542400, '0,1,540000,542400,', '542426', '申扎县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:53');
INSERT INTO `sys_area` VALUES (542427, 542400, '0,1,540000,542400,', '542427', '索县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:53');
INSERT INTO `sys_area` VALUES (542428, 542400, '0,1,540000,542400,', '542428', '班戈县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:53');
INSERT INTO `sys_area` VALUES (542429, 542400, '0,1,540000,542400,', '542429', '巴青县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:54');
INSERT INTO `sys_area` VALUES (542430, 542400, '0,1,540000,542400,', '542430', '尼玛县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:54');
INSERT INTO `sys_area` VALUES (542500, 540000, '0,1,540000,', '542500', '阿里地区', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:54');
INSERT INTO `sys_area` VALUES (542521, 542500, '0,1,540000,542500,', '542521', '普兰县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:54');
INSERT INTO `sys_area` VALUES (542522, 542500, '0,1,540000,542500,', '542522', '札达县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:54');
INSERT INTO `sys_area` VALUES (542523, 542500, '0,1,540000,542500,', '542523', '噶尔县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:55');
INSERT INTO `sys_area` VALUES (542524, 542500, '0,1,540000,542500,', '542524', '日土县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:55');
INSERT INTO `sys_area` VALUES (542525, 542500, '0,1,540000,542500,', '542525', '革吉县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:55');
INSERT INTO `sys_area` VALUES (542526, 542500, '0,1,540000,542500,', '542526', '改则县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:55');
INSERT INTO `sys_area` VALUES (542527, 542500, '0,1,540000,542500,', '542527', '措勤县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:55');
INSERT INTO `sys_area` VALUES (542600, 540000, '0,1,540000,', '542600', '林芝地区', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:56');
INSERT INTO `sys_area` VALUES (542621, 542600, '0,1,540000,542600,', '542621', '林芝县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:56');
INSERT INTO `sys_area` VALUES (542622, 542600, '0,1,540000,542600,', '542622', '工布江达县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:56');
INSERT INTO `sys_area` VALUES (542623, 542600, '0,1,540000,542600,', '542623', '米林县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:56');
INSERT INTO `sys_area` VALUES (542624, 542600, '0,1,540000,542600,', '542624', '墨脱县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:56');
INSERT INTO `sys_area` VALUES (542625, 542600, '0,1,540000,542600,', '542625', '波密县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:56');
INSERT INTO `sys_area` VALUES (542626, 542600, '0,1,540000,542600,', '542626', '察隅县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:57');
INSERT INTO `sys_area` VALUES (542627, 542600, '0,1,540000,542600,', '542627', '朗县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:57');
INSERT INTO `sys_area` VALUES (610000, 1, '0,1,', '610000', '陕西省', 2, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (610100, 610000, '0,1,610000,', '610100', '西安市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:57');
INSERT INTO `sys_area` VALUES (610102, 610100, '0,1,610000,610100,', '610102', '新城区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:57');
INSERT INTO `sys_area` VALUES (610103, 610100, '0,1,610000,610100,', '610103', '碑林区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:58');
INSERT INTO `sys_area` VALUES (610104, 610100, '0,1,610000,610100,', '610104', '莲湖区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:58');
INSERT INTO `sys_area` VALUES (610111, 610100, '0,1,610000,610100,', '610111', '灞桥区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:58');
INSERT INTO `sys_area` VALUES (610112, 610100, '0,1,610000,610100,', '610112', '未央区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:58');
INSERT INTO `sys_area` VALUES (610113, 610100, '0,1,610000,610100,', '610113', '雁塔区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:58');
INSERT INTO `sys_area` VALUES (610114, 610100, '0,1,610000,610100,', '610114', '阎良区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:58');
INSERT INTO `sys_area` VALUES (610115, 610100, '0,1,610000,610100,', '610115', '临潼区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:59');
INSERT INTO `sys_area` VALUES (610116, 610100, '0,1,610000,610100,', '610116', '长安区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:59');
INSERT INTO `sys_area` VALUES (610122, 610100, '0,1,610000,610100,', '610122', '蓝田县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:59');
INSERT INTO `sys_area` VALUES (610124, 610100, '0,1,610000,610100,', '610124', '周至县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:59');
INSERT INTO `sys_area` VALUES (610125, 610100, '0,1,610000,610100,', '610125', '户县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:57:59');
INSERT INTO `sys_area` VALUES (610126, 610100, '0,1,610000,610100,', '610126', '高陵县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:00');
INSERT INTO `sys_area` VALUES (610140, 610100, '0,1,610000,610100,', '610140', '高新技术产业开发区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:00');
INSERT INTO `sys_area` VALUES (610141, 610100, '0,1,610000,610100,', '610141', '经济开发区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:00');
INSERT INTO `sys_area` VALUES (610200, 610000, '0,1,610000,', '610200', '铜川市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:00');
INSERT INTO `sys_area` VALUES (610202, 610200, '0,1,610000,610200,', '610202', '王益区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:00');
INSERT INTO `sys_area` VALUES (610203, 610200, '0,1,610000,610200,', '610203', '印台区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:00');
INSERT INTO `sys_area` VALUES (610204, 610200, '0,1,610000,610200,', '610204', '耀州区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:01');
INSERT INTO `sys_area` VALUES (610222, 610200, '0,1,610000,610200,', '610222', '宜君县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:01');
INSERT INTO `sys_area` VALUES (610300, 610000, '0,1,610000,', '610300', '宝鸡市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:01');
INSERT INTO `sys_area` VALUES (610302, 610300, '0,1,610000,610300,', '610302', '渭滨区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:01');
INSERT INTO `sys_area` VALUES (610303, 610300, '0,1,610000,610300,', '610303', '金台区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:01');
INSERT INTO `sys_area` VALUES (610304, 610300, '0,1,610000,610300,', '610304', '陈仓区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:01');
INSERT INTO `sys_area` VALUES (610322, 610300, '0,1,610000,610300,', '610322', '凤翔县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:02');
INSERT INTO `sys_area` VALUES (610323, 610300, '0,1,610000,610300,', '610323', '岐山县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:02');
INSERT INTO `sys_area` VALUES (610324, 610300, '0,1,610000,610300,', '610324', '扶风县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:02');
INSERT INTO `sys_area` VALUES (610326, 610300, '0,1,610000,610300,', '610326', '眉县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:02');
INSERT INTO `sys_area` VALUES (610327, 610300, '0,1,610000,610300,', '610327', '陇县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:02');
INSERT INTO `sys_area` VALUES (610328, 610300, '0,1,610000,610300,', '610328', '千阳县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:03');
INSERT INTO `sys_area` VALUES (610329, 610300, '0,1,610000,610300,', '610329', '麟游县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:03');
INSERT INTO `sys_area` VALUES (610330, 610300, '0,1,610000,610300,', '610330', '凤县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:03');
INSERT INTO `sys_area` VALUES (610331, 610300, '0,1,610000,610300,', '610331', '太白县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:03');
INSERT INTO `sys_area` VALUES (610400, 610000, '0,1,610000,', '610400', '咸阳市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:03');
INSERT INTO `sys_area` VALUES (610402, 610400, '0,1,610000,610400,', '610402', '秦都区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:04');
INSERT INTO `sys_area` VALUES (610403, 610400, '0,1,610000,610400,', '610403', '杨凌区                  ', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:04');
INSERT INTO `sys_area` VALUES (610404, 610400, '0,1,610000,610400,', '610404', '渭城区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:04');
INSERT INTO `sys_area` VALUES (610422, 610400, '0,1,610000,610400,', '610422', '三原县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:04');
INSERT INTO `sys_area` VALUES (610423, 610400, '0,1,610000,610400,', '610423', '泾阳县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:04');
INSERT INTO `sys_area` VALUES (610424, 610400, '0,1,610000,610400,', '610424', '乾县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:04');
INSERT INTO `sys_area` VALUES (610425, 610400, '0,1,610000,610400,', '610425', '礼泉县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:05');
INSERT INTO `sys_area` VALUES (610426, 610400, '0,1,610000,610400,', '610426', '永寿县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:05');
INSERT INTO `sys_area` VALUES (610427, 610400, '0,1,610000,610400,', '610427', '彬县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:05');
INSERT INTO `sys_area` VALUES (610428, 610400, '0,1,610000,610400,', '610428', '长武县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:05');
INSERT INTO `sys_area` VALUES (610429, 610400, '0,1,610000,610400,', '610429', '旬邑县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:05');
INSERT INTO `sys_area` VALUES (610430, 610400, '0,1,610000,610400,', '610430', '淳化县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:06');
INSERT INTO `sys_area` VALUES (610431, 610400, '0,1,610000,610400,', '610431', '武功县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:06');
INSERT INTO `sys_area` VALUES (610481, 610400, '0,1,610000,610400,', '610481', '兴平市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:06');
INSERT INTO `sys_area` VALUES (610500, 610000, '0,1,610000,', '610500', '渭南市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:06');
INSERT INTO `sys_area` VALUES (610502, 610500, '0,1,610000,610500,', '610502', '临渭区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:06');
INSERT INTO `sys_area` VALUES (610521, 610500, '0,1,610000,610500,', '610521', '华县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:07');
INSERT INTO `sys_area` VALUES (610522, 610500, '0,1,610000,610500,', '610522', '潼关县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:07');
INSERT INTO `sys_area` VALUES (610523, 610500, '0,1,610000,610500,', '610523', '大荔县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:07');
INSERT INTO `sys_area` VALUES (610524, 610500, '0,1,610000,610500,', '610524', '合阳县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:07');
INSERT INTO `sys_area` VALUES (610525, 610500, '0,1,610000,610500,', '610525', '澄城县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:07');
INSERT INTO `sys_area` VALUES (610526, 610500, '0,1,610000,610500,', '610526', '蒲城县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:07');
INSERT INTO `sys_area` VALUES (610527, 610500, '0,1,610000,610500,', '610527', '白水县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:07');
INSERT INTO `sys_area` VALUES (610528, 610500, '0,1,610000,610500,', '610528', '富平县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:08');
INSERT INTO `sys_area` VALUES (610540, 610500, '0,1,610000,610500,', '610540', '高新技术产业开发区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:08');
INSERT INTO `sys_area` VALUES (610581, 610500, '0,1,610000,610500,', '610581', '韩城市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:08');
INSERT INTO `sys_area` VALUES (610582, 610500, '0,1,610000,610500,', '610582', '华阴市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:08');
INSERT INTO `sys_area` VALUES (610600, 610000, '0,1,610000,', '610600', '延安市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:08');
INSERT INTO `sys_area` VALUES (610602, 610600, '0,1,610000,610600,', '610602', '宝塔区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:08');
INSERT INTO `sys_area` VALUES (610621, 610600, '0,1,610000,610600,', '610621', '延长县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:09');
INSERT INTO `sys_area` VALUES (610622, 610600, '0,1,610000,610600,', '610622', '延川县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:09');
INSERT INTO `sys_area` VALUES (610623, 610600, '0,1,610000,610600,', '610623', '子长县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:09');
INSERT INTO `sys_area` VALUES (610624, 610600, '0,1,610000,610600,', '610624', '安塞县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:09');
INSERT INTO `sys_area` VALUES (610625, 610600, '0,1,610000,610600,', '610625', '志丹县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:09');
INSERT INTO `sys_area` VALUES (610626, 610600, '0,1,610000,610600,', '610626', '吴起县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:10');
INSERT INTO `sys_area` VALUES (610627, 610600, '0,1,610000,610600,', '610627', '甘泉县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:10');
INSERT INTO `sys_area` VALUES (610628, 610600, '0,1,610000,610600,', '610628', '富县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:10');
INSERT INTO `sys_area` VALUES (610629, 610600, '0,1,610000,610600,', '610629', '洛川县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:10');
INSERT INTO `sys_area` VALUES (610630, 610600, '0,1,610000,610600,', '610630', '宜川县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:10');
INSERT INTO `sys_area` VALUES (610631, 610600, '0,1,610000,610600,', '610631', '黄龙县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:11');
INSERT INTO `sys_area` VALUES (610632, 610600, '0,1,610000,610600,', '610632', '黄陵县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:11');
INSERT INTO `sys_area` VALUES (610700, 610000, '0,1,610000,', '610700', '汉中市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:11');
INSERT INTO `sys_area` VALUES (610702, 610700, '0,1,610000,610700,', '610702', '汉台区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:11');
INSERT INTO `sys_area` VALUES (610721, 610700, '0,1,610000,610700,', '610721', '南郑县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:12');
INSERT INTO `sys_area` VALUES (610722, 610700, '0,1,610000,610700,', '610722', '城固县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:12');
INSERT INTO `sys_area` VALUES (610723, 610700, '0,1,610000,610700,', '610723', '洋县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:12');
INSERT INTO `sys_area` VALUES (610724, 610700, '0,1,610000,610700,', '610724', '西乡县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:12');
INSERT INTO `sys_area` VALUES (610725, 610700, '0,1,610000,610700,', '610725', '勉县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:12');
INSERT INTO `sys_area` VALUES (610726, 610700, '0,1,610000,610700,', '610726', '宁强县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:13');
INSERT INTO `sys_area` VALUES (610727, 610700, '0,1,610000,610700,', '610727', '略阳县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:13');
INSERT INTO `sys_area` VALUES (610728, 610700, '0,1,610000,610700,', '610728', '镇巴县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:13');
INSERT INTO `sys_area` VALUES (610729, 610700, '0,1,610000,610700,', '610729', '留坝县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:13');
INSERT INTO `sys_area` VALUES (610730, 610700, '0,1,610000,610700,', '610730', '佛坪县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:13');
INSERT INTO `sys_area` VALUES (610800, 610000, '0,1,610000,', '610800', '榆林市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:14');
INSERT INTO `sys_area` VALUES (610802, 610800, '0,1,610000,610800,', '610802', '榆阳区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:14');
INSERT INTO `sys_area` VALUES (610821, 610800, '0,1,610000,610800,', '610821', '神木县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:14');
INSERT INTO `sys_area` VALUES (610822, 610800, '0,1,610000,610800,', '610822', '府谷县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:14');
INSERT INTO `sys_area` VALUES (610823, 610800, '0,1,610000,610800,', '610823', '横山县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:14');
INSERT INTO `sys_area` VALUES (610824, 610800, '0,1,610000,610800,', '610824', '靖边县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:14');
INSERT INTO `sys_area` VALUES (610825, 610800, '0,1,610000,610800,', '610825', '定边县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:15');
INSERT INTO `sys_area` VALUES (610826, 610800, '0,1,610000,610800,', '610826', '绥德县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:15');
INSERT INTO `sys_area` VALUES (610827, 610800, '0,1,610000,610800,', '610827', '米脂县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:15');
INSERT INTO `sys_area` VALUES (610828, 610800, '0,1,610000,610800,', '610828', '佳县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:15');
INSERT INTO `sys_area` VALUES (610829, 610800, '0,1,610000,610800,', '610829', '吴堡县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:15');
INSERT INTO `sys_area` VALUES (610830, 610800, '0,1,610000,610800,', '610830', '清涧县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:16');
INSERT INTO `sys_area` VALUES (610831, 610800, '0,1,610000,610800,', '610831', '子洲县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:16');
INSERT INTO `sys_area` VALUES (610900, 610000, '0,1,610000,', '610900', '安康市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:16');
INSERT INTO `sys_area` VALUES (610902, 610900, '0,1,610000,610900,', '610902', '汉滨区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:16');
INSERT INTO `sys_area` VALUES (610921, 610900, '0,1,610000,610900,', '610921', '汉阴县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:16');
INSERT INTO `sys_area` VALUES (610922, 610900, '0,1,610000,610900,', '610922', '石泉县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:16');
INSERT INTO `sys_area` VALUES (610923, 610900, '0,1,610000,610900,', '610923', '宁陕县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:16');
INSERT INTO `sys_area` VALUES (610924, 610900, '0,1,610000,610900,', '610924', '紫阳县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:17');
INSERT INTO `sys_area` VALUES (610925, 610900, '0,1,610000,610900,', '610925', '岚皋县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:17');
INSERT INTO `sys_area` VALUES (610926, 610900, '0,1,610000,610900,', '610926', '平利县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:17');
INSERT INTO `sys_area` VALUES (610927, 610900, '0,1,610000,610900,', '610927', '镇坪县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:17');
INSERT INTO `sys_area` VALUES (610928, 610900, '0,1,610000,610900,', '610928', '旬阳县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:17');
INSERT INTO `sys_area` VALUES (610929, 610900, '0,1,610000,610900,', '610929', '白河县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:18');
INSERT INTO `sys_area` VALUES (611000, 610000, '0,1,610000,', '611000', '商洛市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:18');
INSERT INTO `sys_area` VALUES (611002, 611000, '0,1,610000,611000,', '611002', '商州区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:18');
INSERT INTO `sys_area` VALUES (611021, 611000, '0,1,610000,611000,', '611021', '洛南县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:18');
INSERT INTO `sys_area` VALUES (611022, 611000, '0,1,610000,611000,', '611022', '丹凤县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:18');
INSERT INTO `sys_area` VALUES (611023, 611000, '0,1,610000,611000,', '611023', '商南县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:19');
INSERT INTO `sys_area` VALUES (611024, 611000, '0,1,610000,611000,', '611024', '山阳县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:19');
INSERT INTO `sys_area` VALUES (611025, 611000, '0,1,610000,611000,', '611025', '镇安县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:19');
INSERT INTO `sys_area` VALUES (611026, 611000, '0,1,610000,611000,', '611026', '柞水县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:19');
INSERT INTO `sys_area` VALUES (611100, 611000, '0,1,610000,611000,', '611100', '杨凌示范区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:19');
INSERT INTO `sys_area` VALUES (620000, 1, '0,1,', '620000', '甘肃省', 2, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (620100, 620000, '0,1,620000,', '620100', '兰州市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:20');
INSERT INTO `sys_area` VALUES (620102, 620100, '0,1,620000,620100,', '620102', '城关区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:20');
INSERT INTO `sys_area` VALUES (620103, 620100, '0,1,620000,620100,', '620103', '七里河区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:20');
INSERT INTO `sys_area` VALUES (620104, 620100, '0,1,620000,620100,', '620104', '西固区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:20');
INSERT INTO `sys_area` VALUES (620105, 620100, '0,1,620000,620100,', '620105', '安宁区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:21');
INSERT INTO `sys_area` VALUES (620111, 620100, '0,1,620000,620100,', '620111', '红古区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:21');
INSERT INTO `sys_area` VALUES (620121, 620100, '0,1,620000,620100,', '620121', '永登县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:21');
INSERT INTO `sys_area` VALUES (620122, 620100, '0,1,620000,620100,', '620122', '皋兰县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:21');
INSERT INTO `sys_area` VALUES (620123, 620100, '0,1,620000,620100,', '620123', '榆中县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:21');
INSERT INTO `sys_area` VALUES (620200, 620000, '0,1,620000,', '620200', '嘉峪关市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:21');
INSERT INTO `sys_area` VALUES (620300, 620000, '0,1,620000,', '620300', '金昌市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:22');
INSERT INTO `sys_area` VALUES (620302, 620300, '0,1,620000,620300,', '620302', '金川区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:22');
INSERT INTO `sys_area` VALUES (620321, 620300, '0,1,620000,620300,', '620321', '永昌县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:22');
INSERT INTO `sys_area` VALUES (620400, 620000, '0,1,620000,', '620400', '白银市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:22');
INSERT INTO `sys_area` VALUES (620402, 620400, '0,1,620000,620400,', '620402', '白银区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:22');
INSERT INTO `sys_area` VALUES (620403, 620400, '0,1,620000,620400,', '620403', '平川区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:22');
INSERT INTO `sys_area` VALUES (620421, 620400, '0,1,620000,620400,', '620421', '靖远县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:23');
INSERT INTO `sys_area` VALUES (620422, 620400, '0,1,620000,620400,', '620422', '会宁县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:23');
INSERT INTO `sys_area` VALUES (620423, 620400, '0,1,620000,620400,', '620423', '景泰县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:23');
INSERT INTO `sys_area` VALUES (620500, 620000, '0,1,620000,', '620500', '天水市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:23');
INSERT INTO `sys_area` VALUES (620502, 620500, '0,1,620000,620500,', '620502', '秦州区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:23');
INSERT INTO `sys_area` VALUES (620503, 620500, '0,1,620000,620500,', '620503', '麦积区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:24');
INSERT INTO `sys_area` VALUES (620521, 620500, '0,1,620000,620500,', '620521', '清水县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:24');
INSERT INTO `sys_area` VALUES (620522, 620500, '0,1,620000,620500,', '620522', '秦安县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:24');
INSERT INTO `sys_area` VALUES (620523, 620500, '0,1,620000,620500,', '620523', '甘谷县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:24');
INSERT INTO `sys_area` VALUES (620524, 620500, '0,1,620000,620500,', '620524', '武山县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:24');
INSERT INTO `sys_area` VALUES (620525, 620500, '0,1,620000,620500,', '620525', '张家川回族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:25');
INSERT INTO `sys_area` VALUES (620600, 620000, '0,1,620000,', '620600', '武威市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:25');
INSERT INTO `sys_area` VALUES (620602, 620600, '0,1,620000,620600,', '620602', '凉州区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:25');
INSERT INTO `sys_area` VALUES (620621, 620600, '0,1,620000,620600,', '620621', '民勤县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:25');
INSERT INTO `sys_area` VALUES (620622, 620600, '0,1,620000,620600,', '620622', '古浪县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:25');
INSERT INTO `sys_area` VALUES (620623, 620600, '0,1,620000,620600,', '620623', '天祝藏族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:25');
INSERT INTO `sys_area` VALUES (620700, 620000, '0,1,620000,', '620700', '张掖市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:26');
INSERT INTO `sys_area` VALUES (620702, 620700, '0,1,620000,620700,', '620702', '甘州区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:26');
INSERT INTO `sys_area` VALUES (620721, 620700, '0,1,620000,620700,', '620721', '肃南裕固族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:26');
INSERT INTO `sys_area` VALUES (620722, 620700, '0,1,620000,620700,', '620722', '民乐县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:26');
INSERT INTO `sys_area` VALUES (620723, 620700, '0,1,620000,620700,', '620723', '临泽县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:26');
INSERT INTO `sys_area` VALUES (620724, 620700, '0,1,620000,620700,', '620724', '高台县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:26');
INSERT INTO `sys_area` VALUES (620725, 620700, '0,1,620000,620700,', '620725', '山丹县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:27');
INSERT INTO `sys_area` VALUES (620800, 620000, '0,1,620000,', '620800', '平凉市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:27');
INSERT INTO `sys_area` VALUES (620802, 620800, '0,1,620000,620800,', '620802', '崆峒区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:27');
INSERT INTO `sys_area` VALUES (620821, 620800, '0,1,620000,620800,', '620821', '泾川县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:27');
INSERT INTO `sys_area` VALUES (620822, 620800, '0,1,620000,620800,', '620822', '灵台县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:27');
INSERT INTO `sys_area` VALUES (620823, 620800, '0,1,620000,620800,', '620823', '崇信县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:27');
INSERT INTO `sys_area` VALUES (620824, 620800, '0,1,620000,620800,', '620824', '华亭县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:28');
INSERT INTO `sys_area` VALUES (620825, 620800, '0,1,620000,620800,', '620825', '庄浪县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:28');
INSERT INTO `sys_area` VALUES (620826, 620800, '0,1,620000,620800,', '620826', '静宁县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:28');
INSERT INTO `sys_area` VALUES (620900, 620000, '0,1,620000,', '620900', '酒泉市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:28');
INSERT INTO `sys_area` VALUES (620902, 620900, '0,1,620000,620900,', '620902', '肃州区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:28');
INSERT INTO `sys_area` VALUES (620921, 620900, '0,1,620000,620900,', '620921', '金塔县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:29');
INSERT INTO `sys_area` VALUES (620922, 620900, '0,1,620000,620900,', '620922', '瓜州县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:29');
INSERT INTO `sys_area` VALUES (620923, 620900, '0,1,620000,620900,', '620923', '肃北蒙古族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:29');
INSERT INTO `sys_area` VALUES (620924, 620900, '0,1,620000,620900,', '620924', '阿克塞哈萨克族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:29');
INSERT INTO `sys_area` VALUES (620981, 620900, '0,1,620000,620900,', '620981', '玉门市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:29');
INSERT INTO `sys_area` VALUES (620982, 620900, '0,1,620000,620900,', '620982', '敦煌市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:30');
INSERT INTO `sys_area` VALUES (621000, 620000, '0,1,620000,', '621000', '庆阳市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:30');
INSERT INTO `sys_area` VALUES (621002, 621000, '0,1,620000,621000,', '621002', '西峰区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:30');
INSERT INTO `sys_area` VALUES (621021, 621000, '0,1,620000,621000,', '621021', '庆城县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:30');
INSERT INTO `sys_area` VALUES (621022, 621000, '0,1,620000,621000,', '621022', '环县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:30');
INSERT INTO `sys_area` VALUES (621023, 621000, '0,1,620000,621000,', '621023', '华池县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:30');
INSERT INTO `sys_area` VALUES (621024, 621000, '0,1,620000,621000,', '621024', '合水县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:31');
INSERT INTO `sys_area` VALUES (621025, 621000, '0,1,620000,621000,', '621025', '正宁县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:31');
INSERT INTO `sys_area` VALUES (621026, 621000, '0,1,620000,621000,', '621026', '宁县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:31');
INSERT INTO `sys_area` VALUES (621027, 621000, '0,1,620000,621000,', '621027', '镇原县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:31');
INSERT INTO `sys_area` VALUES (621100, 620000, '0,1,620000,', '621100', '定西市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:31');
INSERT INTO `sys_area` VALUES (621102, 621100, '0,1,620000,621100,', '621102', '安定区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:31');
INSERT INTO `sys_area` VALUES (621121, 621100, '0,1,620000,621100,', '621121', '通渭县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:32');
INSERT INTO `sys_area` VALUES (621122, 621100, '0,1,620000,621100,', '621122', '陇西县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:32');
INSERT INTO `sys_area` VALUES (621123, 621100, '0,1,620000,621100,', '621123', '渭源县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:32');
INSERT INTO `sys_area` VALUES (621124, 621100, '0,1,620000,621100,', '621124', '临洮县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:32');
INSERT INTO `sys_area` VALUES (621125, 621100, '0,1,620000,621100,', '621125', '漳县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:32');
INSERT INTO `sys_area` VALUES (621126, 621100, '0,1,620000,621100,', '621126', '岷县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:33');
INSERT INTO `sys_area` VALUES (621200, 620000, '0,1,620000,', '621200', '陇南市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:33');
INSERT INTO `sys_area` VALUES (621202, 621200, '0,1,620000,621200,', '621202', '武都区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:33');
INSERT INTO `sys_area` VALUES (621221, 621200, '0,1,620000,621200,', '621221', '成县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:33');
INSERT INTO `sys_area` VALUES (621222, 621200, '0,1,620000,621200,', '621222', '文县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:33');
INSERT INTO `sys_area` VALUES (621223, 621200, '0,1,620000,621200,', '621223', '宕昌县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:33');
INSERT INTO `sys_area` VALUES (621224, 621200, '0,1,620000,621200,', '621224', '康县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:34');
INSERT INTO `sys_area` VALUES (621225, 621200, '0,1,620000,621200,', '621225', '西和县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:34');
INSERT INTO `sys_area` VALUES (621226, 621200, '0,1,620000,621200,', '621226', '礼县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:34');
INSERT INTO `sys_area` VALUES (621227, 621200, '0,1,620000,621200,', '621227', '徽县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:34');
INSERT INTO `sys_area` VALUES (621228, 621200, '0,1,620000,621200,', '621228', '两当县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:34');
INSERT INTO `sys_area` VALUES (622900, 620000, '0,1,620000,', '622900', '临夏回族自治州', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:35');
INSERT INTO `sys_area` VALUES (622901, 622900, '0,1,620000,622900,', '622901', '临夏市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:35');
INSERT INTO `sys_area` VALUES (622921, 622900, '0,1,620000,622900,', '622921', '临夏县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:35');
INSERT INTO `sys_area` VALUES (622922, 622900, '0,1,620000,622900,', '622922', '康乐县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:35');
INSERT INTO `sys_area` VALUES (622923, 622900, '0,1,620000,622900,', '622923', '永靖县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:36');
INSERT INTO `sys_area` VALUES (622924, 622900, '0,1,620000,622900,', '622924', '广河县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:36');
INSERT INTO `sys_area` VALUES (622925, 622900, '0,1,620000,622900,', '622925', '和政县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:36');
INSERT INTO `sys_area` VALUES (622926, 622900, '0,1,620000,622900,', '622926', '东乡族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:36');
INSERT INTO `sys_area` VALUES (622927, 622900, '0,1,620000,622900,', '622927', '积石山保安族东乡族撒拉族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:36');
INSERT INTO `sys_area` VALUES (623000, 620000, '0,1,620000,', '623000', '甘南藏族自治州', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:37');
INSERT INTO `sys_area` VALUES (623001, 623000, '0,1,620000,623000,', '623001', '合作市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:37');
INSERT INTO `sys_area` VALUES (623021, 623000, '0,1,620000,623000,', '623021', '临潭县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:37');
INSERT INTO `sys_area` VALUES (623022, 623000, '0,1,620000,623000,', '623022', '卓尼县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:37');
INSERT INTO `sys_area` VALUES (623023, 623000, '0,1,620000,623000,', '623023', '舟曲县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:37');
INSERT INTO `sys_area` VALUES (623024, 623000, '0,1,620000,623000,', '623024', '迭部县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:37');
INSERT INTO `sys_area` VALUES (623025, 623000, '0,1,620000,623000,', '623025', '玛曲县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:38');
INSERT INTO `sys_area` VALUES (623026, 623000, '0,1,620000,623000,', '623026', '碌曲县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:38');
INSERT INTO `sys_area` VALUES (623027, 623000, '0,1,620000,623000,', '623027', '夏河县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:38');
INSERT INTO `sys_area` VALUES (627000, 620000, '0,1,620000,', '627000', '甘肃矿区', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:38');
INSERT INTO `sys_area` VALUES (630000, 1, '0,1,', '630000', '青海省', 2, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (630100, 630000, '0,1,630000,', '630100', '西宁市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:39');
INSERT INTO `sys_area` VALUES (630102, 630100, '0,1,630000,630100,', '630102', '城东区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:39');
INSERT INTO `sys_area` VALUES (630103, 630100, '0,1,630000,630100,', '630103', '城中区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:39');
INSERT INTO `sys_area` VALUES (630104, 630100, '0,1,630000,630100,', '630104', '城西区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:39');
INSERT INTO `sys_area` VALUES (630105, 630100, '0,1,630000,630100,', '630105', '城北区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:39');
INSERT INTO `sys_area` VALUES (630121, 630100, '0,1,630000,630100,', '630121', '大通回族土族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:39');
INSERT INTO `sys_area` VALUES (630122, 630100, '0,1,630000,630100,', '630122', '湟中县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:40');
INSERT INTO `sys_area` VALUES (630123, 630100, '0,1,630000,630100,', '630123', '湟源县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:40');
INSERT INTO `sys_area` VALUES (632100, 630000, '0,1,630000,', '632100', '海东地区', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:40');
INSERT INTO `sys_area` VALUES (632121, 632100, '0,1,630000,632100,', '632121', '平安县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:40');
INSERT INTO `sys_area` VALUES (632122, 632100, '0,1,630000,632100,', '632122', '民和回族土族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:40');
INSERT INTO `sys_area` VALUES (632123, 632100, '0,1,630000,632100,', '632123', '乐都县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:40');
INSERT INTO `sys_area` VALUES (632126, 632100, '0,1,630000,632100,', '632126', '互助土族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:40');
INSERT INTO `sys_area` VALUES (632127, 632100, '0,1,630000,632100,', '632127', '化隆回族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:41');
INSERT INTO `sys_area` VALUES (632128, 632100, '0,1,630000,632100,', '632128', '循化撒拉族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:41');
INSERT INTO `sys_area` VALUES (632200, 630000, '0,1,630000,', '632200', '海北藏族自治州', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:41');
INSERT INTO `sys_area` VALUES (632221, 632200, '0,1,630000,632200,', '632221', '门源回族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:41');
INSERT INTO `sys_area` VALUES (632222, 632200, '0,1,630000,632200,', '632222', '祁连县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:42');
INSERT INTO `sys_area` VALUES (632223, 632200, '0,1,630000,632200,', '632223', '海晏县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:42');
INSERT INTO `sys_area` VALUES (632224, 632200, '0,1,630000,632200,', '632224', '刚察县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:42');
INSERT INTO `sys_area` VALUES (632300, 630000, '0,1,630000,', '632300', '黄南藏族自治州', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:42');
INSERT INTO `sys_area` VALUES (632321, 632300, '0,1,630000,632300,', '632321', '同仁县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:42');
INSERT INTO `sys_area` VALUES (632322, 632300, '0,1,630000,632300,', '632322', '尖扎县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:43');
INSERT INTO `sys_area` VALUES (632323, 632300, '0,1,630000,632300,', '632323', '泽库县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:43');
INSERT INTO `sys_area` VALUES (632324, 632300, '0,1,630000,632300,', '632324', '河南蒙古族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:43');
INSERT INTO `sys_area` VALUES (632340, 632300, '0,1,630000,632300,', '632340', '李家峡', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:43');
INSERT INTO `sys_area` VALUES (632500, 630000, '0,1,630000,', '632500', '海南藏族自治州', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:43');
INSERT INTO `sys_area` VALUES (632521, 632500, '0,1,630000,632500,', '632521', '共和县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:43');
INSERT INTO `sys_area` VALUES (632522, 632500, '0,1,630000,632500,', '632522', '同德县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:44');
INSERT INTO `sys_area` VALUES (632523, 632500, '0,1,630000,632500,', '632523', '贵德县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:44');
INSERT INTO `sys_area` VALUES (632524, 632500, '0,1,630000,632500,', '632524', '兴海县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:44');
INSERT INTO `sys_area` VALUES (632525, 632500, '0,1,630000,632500,', '632525', '贵南县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:44');
INSERT INTO `sys_area` VALUES (632540, 632500, '0,1,630000,632500,', '632540', '龙羊峡', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:44');
INSERT INTO `sys_area` VALUES (632600, 630000, '0,1,630000,', '632600', '果洛藏族自治州', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:45');
INSERT INTO `sys_area` VALUES (632621, 632600, '0,1,630000,632600,', '632621', '玛沁县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:45');
INSERT INTO `sys_area` VALUES (632622, 632600, '0,1,630000,632600,', '632622', '班玛县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:45');
INSERT INTO `sys_area` VALUES (632623, 632600, '0,1,630000,632600,', '632623', '甘德县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:45');
INSERT INTO `sys_area` VALUES (632624, 632600, '0,1,630000,632600,', '632624', '达日县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:45');
INSERT INTO `sys_area` VALUES (632625, 632600, '0,1,630000,632600,', '632625', '久治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:45');
INSERT INTO `sys_area` VALUES (632626, 632600, '0,1,630000,632600,', '632626', '玛多县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:45');
INSERT INTO `sys_area` VALUES (632700, 630000, '0,1,630000,', '632700', '玉树藏族自治州', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:46');
INSERT INTO `sys_area` VALUES (632721, 632700, '0,1,630000,632700,', '632721', '玉树县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:46');
INSERT INTO `sys_area` VALUES (632722, 632700, '0,1,630000,632700,', '632722', '杂多县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:46');
INSERT INTO `sys_area` VALUES (632723, 632700, '0,1,630000,632700,', '632723', '称多县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:46');
INSERT INTO `sys_area` VALUES (632724, 632700, '0,1,630000,632700,', '632724', '治多县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:46');
INSERT INTO `sys_area` VALUES (632725, 632700, '0,1,630000,632700,', '632725', '囊谦县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:47');
INSERT INTO `sys_area` VALUES (632726, 632700, '0,1,630000,632700,', '632726', '曲麻莱县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:47');
INSERT INTO `sys_area` VALUES (632800, 630000, '0,1,630000,', '632800', '海西蒙古族藏族自治州', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:47');
INSERT INTO `sys_area` VALUES (632801, 632800, '0,1,630000,632800,', '632801', '格尔木市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:47');
INSERT INTO `sys_area` VALUES (632802, 632800, '0,1,630000,632800,', '632802', '德令哈市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:48');
INSERT INTO `sys_area` VALUES (632821, 632800, '0,1,630000,632800,', '632821', '乌兰县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:48');
INSERT INTO `sys_area` VALUES (632822, 632800, '0,1,630000,632800,', '632822', '都兰县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:48');
INSERT INTO `sys_area` VALUES (632823, 632800, '0,1,630000,632800,', '632823', '天峻县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:48');
INSERT INTO `sys_area` VALUES (632840, 632800, '0,1,630000,632800,', '632840', '茫崖行委', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:48');
INSERT INTO `sys_area` VALUES (632841, 632800, '0,1,630000,632800,', '632841', '大柴旦行委', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:48');
INSERT INTO `sys_area` VALUES (632842, 632800, '0,1,630000,632800,', '632842', '冷湖行委', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:48');
INSERT INTO `sys_area` VALUES (632843, 632800, '0,1,630000,632800,', '632843', '省石油管理局', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:49');
INSERT INTO `sys_area` VALUES (640000, 1, '0,1,', '640000', '宁夏回族自治区', 2, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (640100, 640000, '0,1,640000,', '640100', '银川市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:49');
INSERT INTO `sys_area` VALUES (640104, 640100, '0,1,640000,640100,', '640104', '兴庆区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:49');
INSERT INTO `sys_area` VALUES (640105, 640100, '0,1,640000,640100,', '640105', '西夏区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:49');
INSERT INTO `sys_area` VALUES (640106, 640100, '0,1,640000,640100,', '640106', '金凤区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:50');
INSERT INTO `sys_area` VALUES (640121, 640100, '0,1,640000,640100,', '640121', '永宁县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:50');
INSERT INTO `sys_area` VALUES (640122, 640100, '0,1,640000,640100,', '640122', '贺兰县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:50');
INSERT INTO `sys_area` VALUES (640181, 640100, '0,1,640000,640100,', '640181', '灵武市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:50');
INSERT INTO `sys_area` VALUES (640200, 640000, '0,1,640000,', '640200', '石嘴山市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:50');
INSERT INTO `sys_area` VALUES (640202, 640200, '0,1,640000,640200,', '640202', '大武口区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:50');
INSERT INTO `sys_area` VALUES (640205, 640200, '0,1,640000,640200,', '640205', '惠农区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:51');
INSERT INTO `sys_area` VALUES (640221, 640200, '0,1,640000,640200,', '640221', '平罗县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:51');
INSERT INTO `sys_area` VALUES (640300, 640000, '0,1,640000,', '640300', '吴忠市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:51');
INSERT INTO `sys_area` VALUES (640302, 640300, '0,1,640000,640300,', '640302', '利通区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:51');
INSERT INTO `sys_area` VALUES (640323, 640300, '0,1,640000,640300,', '640323', '盐池县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:51');
INSERT INTO `sys_area` VALUES (640324, 640300, '0,1,640000,640300,', '640324', '同心县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:52');
INSERT INTO `sys_area` VALUES (640340, 640300, '0,1,640000,640300,', '640340', '红寺堡开发区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:52');
INSERT INTO `sys_area` VALUES (640381, 640300, '0,1,640000,640300,', '640381', '青铜峡市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:52');
INSERT INTO `sys_area` VALUES (640400, 640000, '0,1,640000,', '640400', '固原市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:52');
INSERT INTO `sys_area` VALUES (640402, 640400, '0,1,640000,640400,', '640402', '原州区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:52');
INSERT INTO `sys_area` VALUES (640422, 640400, '0,1,640000,640400,', '640422', '西吉县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:53');
INSERT INTO `sys_area` VALUES (640423, 640400, '0,1,640000,640400,', '640423', '隆德县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:53');
INSERT INTO `sys_area` VALUES (640424, 640400, '0,1,640000,640400,', '640424', '泾源县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:53');
INSERT INTO `sys_area` VALUES (640425, 640400, '0,1,640000,640400,', '640425', '彭阳县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:53');
INSERT INTO `sys_area` VALUES (640500, 640000, '0,1,640000,', '640500', '中卫市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:54');
INSERT INTO `sys_area` VALUES (640502, 640500, '0,1,640000,640500,', '640502', '沙坡头区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:54');
INSERT INTO `sys_area` VALUES (640521, 640500, '0,1,640000,640500,', '640521', '中宁县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:54');
INSERT INTO `sys_area` VALUES (640522, 640500, '0,1,640000,640500,', '640522', '海原县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:54');
INSERT INTO `sys_area` VALUES (650000, 1, '0,1,', '650000', '新疆维吾尔自治区', 2, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (650100, 650000, '0,1,650000,', '650100', '乌鲁木齐市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:55');
INSERT INTO `sys_area` VALUES (650102, 650100, '0,1,650000,650100,', '650102', '天山区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:55');
INSERT INTO `sys_area` VALUES (650103, 650100, '0,1,650000,650100,', '650103', '沙依巴克区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:55');
INSERT INTO `sys_area` VALUES (650104, 650100, '0,1,650000,650100,', '650104', '新市区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:55');
INSERT INTO `sys_area` VALUES (650105, 650100, '0,1,650000,650100,', '650105', '水磨沟区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:55');
INSERT INTO `sys_area` VALUES (650106, 650100, '0,1,650000,650100,', '650106', '头屯河区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:55');
INSERT INTO `sys_area` VALUES (650107, 650100, '0,1,650000,650100,', '650107', '达坂城区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:56');
INSERT INTO `sys_area` VALUES (650109, 650100, '0,1,650000,650100,', '650109', '米东区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:56');
INSERT INTO `sys_area` VALUES (650121, 650100, '0,1,650000,650100,', '650121', '乌鲁木齐县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:56');
INSERT INTO `sys_area` VALUES (650140, 650100, '0,1,650000,650100,', '650140', '经济技术开发区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:56');
INSERT INTO `sys_area` VALUES (650200, 650000, '0,1,650000,', '650200', '克拉玛依市', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:56');
INSERT INTO `sys_area` VALUES (650202, 650200, '0,1,650000,650200,', '650202', '独山子区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:56');
INSERT INTO `sys_area` VALUES (650203, 650200, '0,1,650000,650200,', '650203', '克拉玛依区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:57');
INSERT INTO `sys_area` VALUES (650204, 650200, '0,1,650000,650200,', '650204', '白碱滩区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:57');
INSERT INTO `sys_area` VALUES (650205, 650200, '0,1,650000,650200,', '650205', '乌尔禾区', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:57');
INSERT INTO `sys_area` VALUES (652100, 650000, '0,1,650000,', '652100', '吐鲁番地区', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:58');
INSERT INTO `sys_area` VALUES (652101, 652100, '0,1,650000,652100,', '652101', '吐鲁番市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:58');
INSERT INTO `sys_area` VALUES (652122, 652100, '0,1,650000,652100,', '652122', '鄯善县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:58');
INSERT INTO `sys_area` VALUES (652123, 652100, '0,1,650000,652100,', '652123', '托克逊县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:58');
INSERT INTO `sys_area` VALUES (652200, 650000, '0,1,650000,', '652200', '哈密地区', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:58');
INSERT INTO `sys_area` VALUES (652201, 652200, '0,1,650000,652200,', '652201', '哈密市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:58');
INSERT INTO `sys_area` VALUES (652222, 652200, '0,1,650000,652200,', '652222', '巴里坤哈萨克自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:59');
INSERT INTO `sys_area` VALUES (652223, 652200, '0,1,650000,652200,', '652223', '伊吾县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:59');
INSERT INTO `sys_area` VALUES (652300, 650000, '0,1,650000,', '652300', '昌吉回族自治州', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:59');
INSERT INTO `sys_area` VALUES (652301, 652300, '0,1,650000,652300,', '652301', '昌吉市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:58:59');
INSERT INTO `sys_area` VALUES (652302, 652300, '0,1,650000,652300,', '652302', '阜康市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:59:00');
INSERT INTO `sys_area` VALUES (652323, 652300, '0,1,650000,652300,', '652323', '呼图壁县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:59:00');
INSERT INTO `sys_area` VALUES (652324, 652300, '0,1,650000,652300,', '652324', '玛纳斯县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:59:00');
INSERT INTO `sys_area` VALUES (652325, 652300, '0,1,650000,652300,', '652325', '奇台县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:59:00');
INSERT INTO `sys_area` VALUES (652327, 652300, '0,1,650000,652300,', '652327', '吉木萨尔县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:59:00');
INSERT INTO `sys_area` VALUES (652328, 652300, '0,1,650000,652300,', '652328', '木垒哈萨克自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:59:00');
INSERT INTO `sys_area` VALUES (652700, 650000, '0,1,650000,', '652700', '博尔塔拉蒙古自治州', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:59:01');
INSERT INTO `sys_area` VALUES (652701, 652700, '0,1,650000,652700,', '652701', '博乐市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:59:01');
INSERT INTO `sys_area` VALUES (652722, 652700, '0,1,650000,652700,', '652722', '精河县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:59:01');
INSERT INTO `sys_area` VALUES (652723, 652700, '0,1,650000,652700,', '652723', '温泉县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:59:01');
INSERT INTO `sys_area` VALUES (652800, 650000, '0,1,650000,', '652800', '巴音郭楞蒙古自治州', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:59:02');
INSERT INTO `sys_area` VALUES (652801, 652800, '0,1,650000,652800,', '652801', '库尔勒市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:59:02');
INSERT INTO `sys_area` VALUES (652822, 652800, '0,1,650000,652800,', '652822', '轮台县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:59:02');
INSERT INTO `sys_area` VALUES (652823, 652800, '0,1,650000,652800,', '652823', '尉犁县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:59:02');
INSERT INTO `sys_area` VALUES (652824, 652800, '0,1,650000,652800,', '652824', '若羌县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:59:02');
INSERT INTO `sys_area` VALUES (652825, 652800, '0,1,650000,652800,', '652825', '且末县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:59:02');
INSERT INTO `sys_area` VALUES (652826, 652800, '0,1,650000,652800,', '652826', '焉耆回族自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:59:02');
INSERT INTO `sys_area` VALUES (652827, 652800, '0,1,650000,652800,', '652827', '和静县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:59:03');
INSERT INTO `sys_area` VALUES (652828, 652800, '0,1,650000,652800,', '652828', '和硕县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:59:03');
INSERT INTO `sys_area` VALUES (652829, 652800, '0,1,650000,652800,', '652829', '博湖县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:59:03');
INSERT INTO `sys_area` VALUES (652900, 650000, '0,1,650000,', '652900', '阿克苏地区', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:59:03');
INSERT INTO `sys_area` VALUES (652901, 652900, '0,1,650000,652900,', '652901', '阿克苏市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:59:03');
INSERT INTO `sys_area` VALUES (652922, 652900, '0,1,650000,652900,', '652922', '温宿县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:59:03');
INSERT INTO `sys_area` VALUES (652923, 652900, '0,1,650000,652900,', '652923', '库车县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:59:04');
INSERT INTO `sys_area` VALUES (652924, 652900, '0,1,650000,652900,', '652924', '沙雅县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:59:04');
INSERT INTO `sys_area` VALUES (652925, 652900, '0,1,650000,652900,', '652925', '新和县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:59:04');
INSERT INTO `sys_area` VALUES (652926, 652900, '0,1,650000,652900,', '652926', '拜城县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:59:04');
INSERT INTO `sys_area` VALUES (652927, 652900, '0,1,650000,652900,', '652927', '乌什县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:59:04');
INSERT INTO `sys_area` VALUES (652928, 652900, '0,1,650000,652900,', '652928', '阿瓦提县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:59:04');
INSERT INTO `sys_area` VALUES (652929, 652900, '0,1,650000,652900,', '652929', '柯坪县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:59:05');
INSERT INTO `sys_area` VALUES (653000, 650000, '0,1,650000,', '653000', '克孜勒苏柯尔克孜自治州', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:59:05');
INSERT INTO `sys_area` VALUES (653001, 653000, '0,1,650000,653000,', '653001', '阿图什市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:59:05');
INSERT INTO `sys_area` VALUES (653022, 653000, '0,1,650000,653000,', '653022', '阿克陶县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:59:05');
INSERT INTO `sys_area` VALUES (653023, 653000, '0,1,650000,653000,', '653023', '阿合奇县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:59:06');
INSERT INTO `sys_area` VALUES (653024, 653000, '0,1,650000,653000,', '653024', '乌恰县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:59:06');
INSERT INTO `sys_area` VALUES (653100, 650000, '0,1,650000,', '653100', '喀什地区', 3, 0, NULL, 1, NULL, 1, '2015-04-02 09:59:06');
INSERT INTO `sys_area` VALUES (653101, 653100, '0,1,650000,653100,', '653101', '喀什市', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:59:06');
INSERT INTO `sys_area` VALUES (653121, 653100, '0,1,650000,653100,', '653121', '疏附县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:59:06');
INSERT INTO `sys_area` VALUES (653122, 653100, '0,1,650000,653100,', '653122', '疏勒县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:59:06');
INSERT INTO `sys_area` VALUES (653123, 653100, '0,1,650000,653100,', '653123', '英吉沙县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:59:07');
INSERT INTO `sys_area` VALUES (653124, 653100, '0,1,650000,653100,', '653124', '泽普县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:59:07');
INSERT INTO `sys_area` VALUES (653125, 653100, '0,1,650000,653100,', '653125', '莎车县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:59:07');
INSERT INTO `sys_area` VALUES (653126, 653100, '0,1,650000,653100,', '653126', '叶城县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:59:07');
INSERT INTO `sys_area` VALUES (653127, 653100, '0,1,650000,653100,', '653127', '麦盖提县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:59:07');
INSERT INTO `sys_area` VALUES (653128, 653100, '0,1,650000,653100,', '653128', '岳普湖县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:59:07');
INSERT INTO `sys_area` VALUES (653129, 653100, '0,1,650000,653100,', '653129', '伽师县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:59:07');
INSERT INTO `sys_area` VALUES (653130, 653100, '0,1,650000,653100,', '653130', '巴楚县', 4, 0, NULL, 1, NULL, NULL, '2020-02-09 14:30:13');
INSERT INTO `sys_area` VALUES (653131, 653100, '0,1,650000,653100,', '653131', '塔什库尔干塔吉克自治县', 4, 0, NULL, 1, NULL, 1, '2015-04-02 09:59:08');
INSERT INTO `sys_area` VALUES (653200, 650000, '0,1,650000,', '653200', '和田地区', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (653201, 653200, '0,1,650000,653200,', '653201', '和田市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (653221, 653200, '0,1,650000,653200,', '653221', '和田县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (653222, 653200, '0,1,650000,653200,', '653222', '墨玉县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (653223, 653200, '0,1,650000,653200,', '653223', '皮山县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (653224, 653200, '0,1,650000,653200,', '653224', '洛浦县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (653225, 653200, '0,1,650000,653200,', '653225', '策勒县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (653226, 653200, '0,1,650000,653200,', '653226', '于田县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (653227, 653200, '0,1,650000,653200,', '653227', '民丰县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (654000, 650000, '0,1,650000,', '654000', '伊犁哈萨克自治州', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (654002, 654000, '0,1,650000,654000,', '654002', '伊宁市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (654003, 654000, '0,1,650000,654000,', '654003', '奎屯市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (654021, 654000, '0,1,650000,654000,', '654021', '伊宁县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (654022, 654000, '0,1,650000,654000,', '654022', '察布查尔锡伯自治县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (654023, 654000, '0,1,650000,654000,', '654023', '霍城县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (654024, 654000, '0,1,650000,654000,', '654024', '巩留县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (654025, 654000, '0,1,650000,654000,', '654025', '新源县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (654026, 654000, '0,1,650000,654000,', '654026', '昭苏县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (654027, 654000, '0,1,650000,654000,', '654027', '特克斯县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (654028, 654000, '0,1,650000,654000,', '654028', '尼勒克县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (654200, 650000, '0,1,650000,', '654200', '塔城地区', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (654201, 654200, '0,1,650000,654200,', '654201', '塔城市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (654202, 654200, '0,1,650000,654200,', '654202', '乌苏市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (654221, 654200, '0,1,650000,654200,', '654221', '额敏县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (654223, 654200, '0,1,650000,654200,', '654223', '沙湾县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (654224, 654200, '0,1,650000,654200,', '654224', '托里县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (654225, 654200, '0,1,650000,654200,', '654225', '裕民县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (654226, 654200, '0,1,650000,654200,', '654226', '和布克赛尔蒙古自治县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (654300, 650000, '0,1,650000,', '654300', '阿勒泰地区', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (654301, 654300, '0,1,650000,654300,', '654301', '阿勒泰市', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (654321, 654300, '0,1,650000,654300,', '654321', '布尔津县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (654322, 654300, '0,1,650000,654300,', '654322', '富蕴县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (654323, 654300, '0,1,650000,654300,', '654323', '福海县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (654324, 654300, '0,1,650000,654300,', '654324', '哈巴河县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (654325, 654300, '0,1,650000,654300,', '654325', '青河县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (654326, 654300, '0,1,650000,654300,', '654326', '吉木乃县', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (660000, 650000, '0,1,650000,', '660000', '新疆生产建设兵团', 3, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (660100, 660000, '0,1,650000,660000,', '660100', '农一师', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (660200, 660000, '0,1,650000,660000,', '660200', '农二师', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (660300, 660000, '0,1,650000,660000,', '660300', '农三师', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (660400, 660000, '0,1,650000,660000,', '660400', '农四师', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (660500, 660000, '0,1,650000,660000,', '660500', '农五师', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (660600, 660000, '0,1,650000,660000,', '660600', '农六师', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (660700, 660000, '0,1,650000,660000,', '660700', '农七师', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (660800, 660000, '0,1,650000,660000,', '660800', '农八师', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (660900, 660000, '0,1,650000,660000,', '660900', '农九师', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (661000, 660000, '0,1,650000,660000,', '661000', '农十师', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (661100, 660000, NULL, '661100', '建工师', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (661200, 660000, NULL, '661200', '农十二师', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (661300, 660000, NULL, '661300', '农十三师', 4, 0, NULL, 1, NULL, 1, NULL);
INSERT INTO `sys_area` VALUES (661400, 660000, NULL, '661400', '农十四师', 4, 0, NULL, 1, NULL, 1, NULL);

-- ----------------------------
-- Table structure for sys_company
-- ----------------------------
DROP TABLE IF EXISTS `sys_company`;
CREATE TABLE `sys_company`  (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `parent_id` bigint(64) NULL DEFAULT NULL COMMENT '父级编号',
  `ancestors` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所有父级编号',
  `order_num` int(10) NULL DEFAULT NULL COMMENT '本级排序号（升序）',
  `code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公司代码',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公司名称',
  `short_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司简称',
  `area_id` bigint(100) NOT NULL COMMENT '区域编码',
  `status` int(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `inserted_by_id` bigint(64) NULL DEFAULT NULL COMMENT '创建者',
  `inserted_at` datetime(0) NOT NULL COMMENT '创建时间',
  `updated_by_id` bigint(64) NULL DEFAULT NULL COMMENT '更新者',
  `updated_at` datetime(0) NOT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `corp_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '租户代码',
  `corp_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '租户名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公司表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_company
-- ----------------------------
INSERT INTO `sys_company` VALUES (1, NULL, NULL, 1, '1231231', '测试公司', '我的测试公司', 110000, 0, NULL, '2020-02-12 05:59:12', NULL, '2020-02-12 07:17:58', NULL, NULL, NULL);
INSERT INTO `sys_company` VALUES (2, NULL, NULL, 2, 'test2', '测试2', '2', 310000, 0, NULL, '2020-02-12 07:30:54', NULL, '2020-02-12 07:30:54', NULL, NULL, NULL);
INSERT INTO `sys_company` VALUES (3, NULL, NULL, NULL, '234234', '4214', '244234', 430102, 0, 3, '2020-02-17 14:27:29', 3, '2020-03-09 16:29:58', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `config_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `config_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `config_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `config_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `inserted_by_id` bigint(255) NULL DEFAULT NULL,
  `updated_by_id` bigint(255) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `inserted_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL,
  `status` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 1, 3, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow', '2019-12-22 07:45:58', '2020-02-16 06:14:50', 0);

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` int(1) NULL DEFAULT 0 COMMENT '部门状态（0正常 1停用）',
  `inserted_by_id` bigint(64) NULL DEFAULT NULL COMMENT '创建者',
  `inserted_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by_id` bigint(64) NULL DEFAULT NULL COMMENT '更新者',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, NULL, '0', '圣河科技', 0, '若依', '15888888888', 'ry@qq.com', 0, 1, '2018-03-16 11:33:00', 3, '2020-02-17 14:26:34', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', 0, 1, '2018-03-16 11:33:00', 3, '2020-03-09 16:29:09', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', 0, 1, '2018-03-16 11:33:00', 3, '2020-02-17 14:26:42', NULL);
INSERT INTO `sys_dept` VALUES (106, 100, '0,100', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', 0, 1, '2018-03-16 11:33:00', NULL, '2020-02-11 14:26:36', NULL);
INSERT INTO `sys_dept` VALUES (107, 100, '0,100', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', 0, 1, '2018-03-16 11:33:00', NULL, '2020-02-11 11:19:44', NULL);
INSERT INTO `sys_dept` VALUES (108, 100, '0,100', '24234', 1, '2342', '234324', '4234', 0, NULL, '2020-01-13 07:22:41', NULL, '2020-02-11 14:53:09', '23423423');
INSERT INTO `sys_dept` VALUES (109, 100, '0,100', 'test', 1, '4234', ' 242342', NULL, 0, NULL, '2020-02-11 14:54:53', NULL, '2020-02-11 14:54:53', '24234');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` int(1) NULL DEFAULT 0 COMMENT '状态（0正常 1停用）',
  `inserted_by_id` bigint(64) NULL DEFAULT NULL COMMENT '创建者',
  `inserted_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by_id` bigint(64) NULL DEFAULT NULL COMMENT '更新者',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', NULL, NULL, 'Y', 0, 1, '2018-03-16 11:33:00', 3, '2020-02-17 14:26:05', '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', 0, 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', 0, 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', 0, 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', 0, 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', 0, 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', 0, 1, '2018-03-16 11:33:00', 1, '2019-12-24 08:55:08', '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', 0, 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', 0, 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', 0, 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', 0, 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', 0, 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', 0, 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', 0, 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', 0, 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', 0, 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', 0, 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', 0, 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', 0, 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', 0, 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', 0, 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', 0, 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', 0, 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', 0, 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', 0, 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', 0, 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', 0, 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', 0, 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (29, 1, '默认', 'default', 'sys_list_css', NULL, 'default', 'Y', 0, NULL, '2020-02-08 07:27:19', NULL, '2020-02-08 07:34:45', 'default');
INSERT INTO `sys_dict_data` VALUES (30, 2, '主要', 'primary', 'sys_list_css', NULL, 'primary', 'N', 0, NULL, '2020-02-08 07:33:00', NULL, '2020-02-08 07:34:55', NULL);
INSERT INTO `sys_dict_data` VALUES (31, 3, '成功', 'success', 'sys_list_css', NULL, 'success', 'N', 0, NULL, '2020-02-08 07:34:15', NULL, '2020-02-08 07:34:26', NULL);
INSERT INTO `sys_dict_data` VALUES (32, 4, '信息', 'info', 'sys_list_css', NULL, 'info', 'N', 0, NULL, '2020-02-08 07:37:54', NULL, '2020-02-08 07:38:18', NULL);
INSERT INTO `sys_dict_data` VALUES (33, 5, '警告', 'warning', 'sys_list_css', NULL, 'warning', 'N', 0, NULL, '2020-02-08 07:41:16', NULL, '2020-02-08 07:41:27', NULL);
INSERT INTO `sys_dict_data` VALUES (34, 6, '危险', 'danger', 'sys_list_css', NULL, 'danger', 'N', 0, NULL, '2020-02-08 07:42:15', NULL, '2020-02-08 07:42:34', NULL);
INSERT INTO `sys_dict_data` VALUES (35, 1, '仅本人数据', '0', 'sys_data_scope', NULL, 'default', 'Y', 0, NULL, '2020-02-08 07:45:20', NULL, '2020-02-08 07:45:20', NULL);
INSERT INTO `sys_dict_data` VALUES (36, 1, '本部门数据', '1', 'sys_data_scope', NULL, 'default', 'N', 0, NULL, '2020-02-08 07:46:08', NULL, '2020-02-08 07:46:08', NULL);
INSERT INTO `sys_dict_data` VALUES (37, 3, '本部门及子部门的数据', '3', 'sys_data_scope', NULL, 'default', 'N', 0, NULL, '2020-02-08 07:50:16', NULL, '2020-02-08 07:50:16', NULL);
INSERT INTO `sys_dict_data` VALUES (38, 4, '本公司数据', '4', 'sys_data_scope', NULL, 'default', 'N', 0, NULL, '2020-02-08 07:51:19', NULL, '2020-02-08 07:51:19', NULL);
INSERT INTO `sys_dict_data` VALUES (39, 1, '国家', '1', 'sys_area_type', NULL, 'default', 'Y', 0, NULL, '2020-02-11 02:09:58', NULL, '2020-02-11 08:57:56', NULL);
INSERT INTO `sys_dict_data` VALUES (40, 2, '省/直辖市', '2', 'sys_area_type', NULL, 'primary', 'N', 0, NULL, '2020-02-11 02:10:40', NULL, '2020-02-11 08:56:51', NULL);
INSERT INTO `sys_dict_data` VALUES (41, 3, '地/市/州', '3', 'sys_area_type', NULL, 'primary', 'N', 0, NULL, '2020-02-11 02:11:27', NULL, '2020-02-11 02:17:56', NULL);
INSERT INTO `sys_dict_data` VALUES (42, 4, '区/县', '4', 'sys_area_type', NULL, 'primary', 'N', 0, NULL, '2020-02-11 02:11:57', NULL, '2020-02-11 02:18:05', NULL);
INSERT INTO `sys_dict_data` VALUES (43, 5, '乡/镇/街道', '5', 'sys_area_type', NULL, 'primary', 'N', 0, NULL, '2020-02-11 02:13:17', NULL, '2020-02-11 02:18:24', NULL);
INSERT INTO `sys_dict_data` VALUES (44, 6, '村/社区', '6', 'sys_area_type', NULL, 'primary', 'N', 0, NULL, '2020-02-11 02:14:16', NULL, '2020-02-11 08:57:08', NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` int(1) NULL DEFAULT 0 COMMENT '状态（0正常 1停用）',
  `inserted_by_id` bigint(64) NULL DEFAULT NULL COMMENT '创建者',
  `inserted_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by_id` bigint(64) NULL DEFAULT NULL COMMENT '更新者',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', 0, 1, '2018-03-16 11:33:00', NULL, '2020-01-10 15:50:55', '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', 0, 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', 0, 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', 0, 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', 0, 1, '2018-03-16 11:33:00', NULL, '2020-01-10 15:51:08', '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', 0, 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', 0, 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', 0, 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', 0, 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', 0, 1, '2018-03-16 11:33:00', NULL, '2020-01-31 02:28:42', '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (11, '数据权限', 'sys_data_scope', 0, NULL, '2020-02-07 02:24:20', NULL, '2020-02-07 02:24:55', '数据范围权限选项');
INSERT INTO `sys_dict_type` VALUES (12, '回显样式', 'sys_list_css', 0, NULL, '2020-02-08 03:00:09', NULL, '2020-02-08 03:00:09', NULL);
INSERT INTO `sys_dict_type` VALUES (13, '区域级别', 'sys_area_type', 0, NULL, '2020-02-11 02:08:43', 3, '2020-02-17 14:26:18', '行政区域级别');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `inserted_by_id` bigint(64) NULL DEFAULT NULL COMMENT '创建者',
  `inserted_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by_id` bigint(64) NULL DEFAULT NULL COMMENT '更新者',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `inserted_by_id` bigint(64) NULL DEFAULT NULL COMMENT '创建者',
  `inserted_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by_id` bigint(64) NULL DEFAULT NULL COMMENT '更新者',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 158 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-11-25 15:12:49');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-25 15:12:55');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-11-25 21:08:40');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-11-25 21:08:50');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-11-25 21:09:02');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-25 21:09:24');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-25 22:52:39');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-26 00:02:02');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-26 10:41:35');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-26 10:46:21');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-11-26 12:30:38');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-26 12:30:45');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-26 13:35:43');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-11-26 13:49:49');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-26 13:49:53');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-11-26 14:17:28');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-26 14:17:34');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-26 15:00:32');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-11-26 15:08:18');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-11-26 15:08:24');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-26 15:08:29');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-11-26 15:09:44');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-26 15:09:49');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-27 00:10:42');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-11-27 12:51:55');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-27 12:52:03');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-12-12 13:53:44');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-12-12 13:53:48');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-12 13:53:56');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-12 15:42:36');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-12 16:19:33');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-12 17:04:21');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-12 23:39:28');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-12-13 01:11:45');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-12-13 01:11:54');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-13 01:12:11');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-16 13:45:11');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-12-20 11:06:17');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-20 11:06:30');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-20 11:38:31');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Firefox 45', 'Windows 10', '0', '登录成功', '2019-12-21 14:52:08');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-21 14:53:13');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-21 14:55:41');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-12-21 14:57:48');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-21 14:57:53');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Firefox 45', 'Windows 10', '0', '登录成功', '2019-12-21 15:43:41');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-12-21 16:57:20');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-12-21 16:57:30');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2019-12-21 16:57:43');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-12-21 16:57:54');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-21 16:57:59');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-12-21 17:04:33');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-21 17:04:41');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-12-21 17:05:49');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-21 17:05:56');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-21 17:09:49');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-21 17:12:39');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-21 17:21:34');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `inserted_by_id` bigint(64) NULL DEFAULT NULL COMMENT '创建者',
  `inserted_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by_id` bigint(64) NULL DEFAULT NULL COMMENT '更新者',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  `status` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1062 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', NULL, 2, '#', 'menuItem', 'M', '0', NULL, 'fa fa-gear', 1, '2018-03-16 11:33:00', NULL, '2020-02-15 15:53:30', '系统管理目录', 0);
INSERT INTO `sys_menu` VALUES (2, '系统监控', NULL, 2, '#', '', 'M', '0', '', 'fa fa-video-camera', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '系统监控目录', 0);
INSERT INTO `sys_menu` VALUES (3, '系统工具', NULL, 3, '#', '', 'M', '0', '', 'fa fa-bars', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '系统工具目录', 0);
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, '/system/user', 'menuItem', 'C', '0', 'system:user:view', 'fa fa-adjust', 1, '2018-03-16 11:33:00', NULL, '2020-02-11 14:58:53', '用户管理菜单', 0);
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, '/system/role', '', 'C', '0', 'system:role:view', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '角色管理菜单', 0);
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, '/system/menu', '', 'C', '0', 'system:menu:view', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '菜单管理菜单', 0);
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, '/system/dept', '', 'C', '0', 'system:dept:view', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '部门管理菜单', 0);
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, '/system/post', '', 'C', '0', 'system:post:view', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '岗位管理菜单', 0);
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, '/system/dict', '', 'C', '0', 'system:dict:view', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '字典管理菜单', 0);
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, '/system/config', '', 'C', '0', 'system:config:view', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '参数设置菜单', 0);
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, '/system/notice', '', 'C', '0', 'system:notice:view', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '通知公告菜单', 0);
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, '#', '', 'M', '0', '', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '日志管理菜单', 0);
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, '/monitor/online', '', 'C', '0', 'monitor:online:view', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '在线用户菜单', 0);
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, '/monitor/job', '', 'C', '0', 'monitor:job:view', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '定时任务菜单', 0);
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, '/monitor/data', '', 'C', '0', 'monitor:data:view', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '数据监控菜单', 0);
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 3, '/monitor/server', '', 'C', '0', 'monitor:server:view', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '服务监控菜单', 0);
INSERT INTO `sys_menu` VALUES (113, '表单构建', 3, 1, '/tool/build', '', 'C', '0', 'tool:build:view', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '表单构建菜单', 0);
INSERT INTO `sys_menu` VALUES (114, '代码生成', 3, 2, '/tool/gen', '', 'C', '0', 'tool:gen:view', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '代码生成菜单', 0);
INSERT INTO `sys_menu` VALUES (115, '系统接口', 3, 3, '/tool/swagger', '', 'C', '0', 'tool:swagger:view', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '系统接口菜单', 0);
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, '/monitor/operlog', '', 'C', '0', 'monitor:operlog:view', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '操作日志菜单', 0);
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, '/monitor/logininfor', '', 'C', '0', 'monitor:logininfor:view', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '登录日志菜单', 0);
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '#', 'menuItem', 'F', '0', 'system:user:list', 'fa fa-automobile', 1, '2018-03-16 11:33:00', NULL, '2020-01-28 01:45:52', '1313144', 0);
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '#', 'menuItem', 'F', '0', 'system:user:add', 'fa fa-bank', 1, '2018-03-16 11:33:00', NULL, '2020-01-28 02:57:03', 'eewr', 0);
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '#', 'menuItem', 'F', '0', 'system:user:edit', '#', 1, '2018-03-16 11:33:00', 3, '2020-03-09 16:28:50', NULL, 0);
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '#', 'menuItem', 'F', '0', 'system:user:remove', '#', 1, '2018-03-16 11:33:00', NULL, '2020-01-28 03:31:30', NULL, 0);
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '#', 'menuItem', 'F', '0', 'system:user:export', 'fa fa-bluetooth', 1, '2018-03-16 11:33:00', NULL, '2020-01-28 03:28:17', '53536', 0);
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '#', '', 'F', '0', 'system:user:import', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '', 0);
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '#', '', 'F', '0', 'system:user:resetPwd', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '', 0);
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '#', '', 'F', '0', 'system:role:list', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '', 0);
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '#', '', 'F', '0', 'system:role:add', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '', 0);
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '#', '', 'F', '0', 'system:role:edit', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '', 0);
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '#', '', 'F', '0', 'system:role:remove', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '', 0);
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '#', '', 'F', '0', 'system:role:export', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '', 0);
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '#', '', 'F', '0', 'system:menu:list', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '', 0);
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '#', '', 'F', '0', 'system:menu:add', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '', 0);
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '#', '', 'F', '0', 'system:menu:edit', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '', 0);
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '#', '', 'F', '0', 'system:menu:remove', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '', 0);
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '#', '', 'F', '0', 'system:dept:list', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '', 0);
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '#', '', 'F', '0', 'system:dept:add', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '', 0);
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '#', '', 'F', '0', 'system:dept:edit', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '', 0);
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '#', '', 'F', '0', 'system:dept:remove', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '', 0);
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '#', '', 'F', '0', 'system:post:list', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '', 0);
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '#', '', 'F', '0', 'system:post:add', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '', 0);
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '#', '', 'F', '0', 'system:post:edit', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '', 0);
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '#', '', 'F', '0', 'system:post:remove', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '', 0);
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '#', '', 'F', '0', 'system:post:export', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '', 0);
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', 'menuItem', 'F', '0', 'system:dict:list', '#', 1, '2018-03-16 11:33:00', 3, '2020-02-17 14:26:26', NULL, 0);
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', 'F', '0', 'system:dict:add', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '', 0);
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', 'F', '0', 'system:dict:edit', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '', 0);
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', 'F', '0', 'system:dict:remove', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '', 0);
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', 'F', '0', 'system:dict:export', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '', 0);
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', 'F', '0', 'system:config:list', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '', 0);
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', 'F', '0', 'system:config:add', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '', 0);
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', 'F', '0', 'system:config:edit', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '', 0);
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', 'F', '0', 'system:config:remove', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '', 0);
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', 'F', '0', 'system:config:export', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '', 0);
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', 'F', '0', 'system:notice:list', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '', 0);
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', 'F', '0', 'system:notice:add', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '', 0);
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', 'F', '0', 'system:notice:edit', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '', 0);
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', 'F', '0', 'system:notice:remove', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '', 0);
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', 'F', '0', 'monitor:operlog:list', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '', 0);
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', 'F', '0', 'monitor:operlog:remove', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '', 0);
INSERT INTO `sys_menu` VALUES (1041, '详细信息', 500, 3, '#', '', 'F', '0', 'monitor:operlog:detail', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '', 0);
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', 'F', '0', 'monitor:operlog:export', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '', 0);
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', 'F', '0', 'monitor:logininfor:list', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '', 0);
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', 'F', '0', 'monitor:logininfor:remove', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '', 0);
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', 'F', '0', 'monitor:logininfor:export', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '', 0);
INSERT INTO `sys_menu` VALUES (1046, '账户解锁', 501, 4, '#', '', 'F', '0', 'monitor:logininfor:unlock', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '', 0);
INSERT INTO `sys_menu` VALUES (1047, '在线查询', 109, 1, '#', '', 'F', '0', 'monitor:online:list', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '', 0);
INSERT INTO `sys_menu` VALUES (1048, '批量强退', 109, 2, '#', '', 'F', '0', 'monitor:online:batchForceLogout', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '', 0);
INSERT INTO `sys_menu` VALUES (1049, '单条强退', 109, 3, '#', '', 'F', '0', 'monitor:online:forceLogout', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '', 0);
INSERT INTO `sys_menu` VALUES (1050, '任务查询', 110, 1, '#', '', 'F', '0', 'monitor:job:list', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '', 0);
INSERT INTO `sys_menu` VALUES (1051, '任务新增', 110, 2, '#', '', 'F', '0', 'monitor:job:add', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '', 0);
INSERT INTO `sys_menu` VALUES (1052, '任务修改', 110, 3, '#', '', 'F', '0', 'monitor:job:edit', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '', 0);
INSERT INTO `sys_menu` VALUES (1053, '任务删除', 110, 4, '#', '', 'F', '0', 'monitor:job:remove', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '', 0);
INSERT INTO `sys_menu` VALUES (1054, '状态修改', 110, 5, '#', '', 'F', '0', 'monitor:job:changeStatus', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '', 0);
INSERT INTO `sys_menu` VALUES (1055, '任务详细', 110, 6, '#', '', 'F', '0', 'monitor:job:detail', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '', 0);
INSERT INTO `sys_menu` VALUES (1056, '任务导出', 110, 7, '#', '', 'F', '0', 'monitor:job:export', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '', 0);
INSERT INTO `sys_menu` VALUES (1057, '生成查询', 114, 1, '#', '', 'F', '0', 'tool:gen:list', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '', 0);
INSERT INTO `sys_menu` VALUES (1058, '生成修改', 114, 2, '#', '', 'F', '0', 'tool:gen:edit', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '', 0);
INSERT INTO `sys_menu` VALUES (1059, '生成删除', 114, 3, '#', '', 'F', '0', 'tool:gen:remove', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '', 0);
INSERT INTO `sys_menu` VALUES (1060, '预览代码', 114, 4, '#', '', 'F', '0', 'tool:gen:preview', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '', 0);
INSERT INTO `sys_menu` VALUES (1061, '生成代码', 114, 5, '#', '', 'F', '0', 'tool:gen:code', '#', 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '', 0);

-- ----------------------------
-- Table structure for sys_module
-- ----------------------------
DROP TABLE IF EXISTS `sys_module`;
CREATE TABLE `sys_module`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模块编码',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模块名称',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模块描述',
  `main_class_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主类全名',
  `current_version` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前版本',
  `upgrade_info` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '升级信息',
  `status` int(1) NOT NULL DEFAULT 0 COMMENT '状态（0正常 1删除 2停用）',
  `inserted_by_id` bigint(100) NULL DEFAULT NULL COMMENT '创建者',
  `inserted_at` datetime(0) NOT NULL COMMENT '更新时间',
  `updated_by_id` bigint(100) NULL DEFAULT NULL COMMENT '更新者',
  `updated_at` datetime(0) NOT NULL COMMENT '创建时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_module_status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '模块表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_module
-- ----------------------------
INSERT INTO `sys_module` VALUES (1, 'sys', '系统管理模块', NULL, NULL, 'v1.0', '初始版本', 0, NULL, '2020-02-12 01:46:26', 3, '2020-02-16 06:14:43', NULL);

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `id` bigint(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公告内容',
  `status` int(1) NULL DEFAULT 0 COMMENT '公告状态（0正常 1关闭）',
  `inserted_by_id` bigint(64) NULL DEFAULT NULL COMMENT '创建者',
  `inserted_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by_id` bigint(64) NULL DEFAULT NULL COMMENT '更新者',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', '新版本内容', 0, 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', '维护内容', 0, 1, '2018-03-16 11:33:00', 1, '2018-03-16 11:33:00', '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 126 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.changeStatus()', 'POST', 1, 'admin', '研发部门', '/system/role/changeStatus', '127.0.0.1', '内网IP', '{\r\n  \"roleId\" : [ \"1\" ],\r\n  \"status\" : [ \"1\" ]\r\n}', 'null', 1, '不允许操作超级管理员角色', '2019-11-25 15:13:42');
INSERT INTO `sys_oper_log` VALUES (101, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.changeStatus()', 'POST', 1, 'admin', '研发部门', '/system/role/changeStatus', '127.0.0.1', '内网IP', '{\r\n  \"roleId\" : [ \"2\" ],\r\n  \"status\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2019-11-25 15:13:47');
INSERT INTO `sys_oper_log` VALUES (102, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.changeStatus()', 'POST', 1, 'admin', '研发部门', '/system/role/changeStatus', '127.0.0.1', '内网IP', '{\r\n  \"roleId\" : [ \"2\" ],\r\n  \"status\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2019-11-25 15:13:54');
INSERT INTO `sys_oper_log` VALUES (103, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\r\n  \"userId\" : [ \"1\" ],\r\n  \"deptId\" : [ \"103\" ],\r\n  \"userName\" : [ \"若依\" ],\r\n  \"dept.deptName\" : [ \"研发部门\" ],\r\n  \"phonenumber\" : [ \"15888888888\" ],\r\n  \"email\" : [ \"ry@163.com\" ],\r\n  \"loginName\" : [ \"admin\" ],\r\n  \"sex\" : [ \"1\" ],\r\n  \"role\" : [ \"1\" ],\r\n  \"remark\" : [ \"管理员\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"1\" ],\r\n  \"postIds\" : [ \"1\" ]\r\n}', 'null', 1, '不允许操作超级管理员用户', '2019-11-25 15:26:52');
INSERT INTO `sys_oper_log` VALUES (104, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserController.export()', 'POST', 1, 'admin', '研发部门', '/system/user/export', '127.0.0.1', '内网IP', '{\r\n  \"deptId\" : [ \"\" ],\r\n  \"parentId\" : [ \"\" ],\r\n  \"loginName\" : [ \"\" ],\r\n  \"phonenumber\" : [ \"\" ],\r\n  \"status\" : [ \"\" ],\r\n  \"params[beginTime]\" : [ \"\" ],\r\n  \"params[endTime]\" : [ \"\" ]\r\n}', '{\r\n  \"msg\" : \"ad123e99-2bb1-496e-b56f-5e8f99b413b6_用户数据.xlsx\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2019-11-25 21:11:10');
INSERT INTO `sys_oper_log` VALUES (105, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'POST', 1, 'admin', '研发部门', '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\r\n  \"userId\" : [ \"1\" ],\r\n  \"status\" : [ \"1\" ]\r\n}', 'null', 1, '不允许操作超级管理员用户', '2019-11-25 21:11:21');
INSERT INTO `sys_oper_log` VALUES (106, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'POST', 1, 'admin', '研发部门', '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\r\n  \"userId\" : [ \"1\" ],\r\n  \"status\" : [ \"1\" ]\r\n}', 'null', 1, '不允许操作超级管理员用户', '2019-11-25 21:11:26');
INSERT INTO `sys_oper_log` VALUES (107, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\r\n  \"roleId\" : [ \"1\" ],\r\n  \"roleName\" : [ \"管理员\" ],\r\n  \"roleKey\" : [ \"admin\" ],\r\n  \"roleSort\" : [ \"1\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"管理员\" ],\r\n  \"menuIds\" : [ \"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,1046\" ]\r\n}', 'null', 1, '不允许操作超级管理员角色', '2019-11-25 21:12:13');
INSERT INTO `sys_oper_log` VALUES (108, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.authDataScopeSave()', 'POST', 1, 'admin', '研发部门', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\r\n  \"roleId\" : [ \"2\" ],\r\n  \"roleName\" : [ \"普通角色\" ],\r\n  \"roleKey\" : [ \"common\" ],\r\n  \"dataScope\" : [ \"2\" ],\r\n  \"deptIds\" : [ \"100,101,105\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2019-11-25 21:12:50');
INSERT INTO `sys_oper_log` VALUES (109, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/post/edit', '127.0.0.1', '内网IP', '{\r\n  \"postId\" : [ \"1\" ],\r\n  \"postName\" : [ \"董事长\" ],\r\n  \"postCode\" : [ \"ceo\" ],\r\n  \"postSort\" : [ \"1\" ],\r\n  \"status\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2019-11-25 21:48:04');
INSERT INTO `sys_oper_log` VALUES (110, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/post/edit', '127.0.0.1', '内网IP', '{\r\n  \"postId\" : [ \"3\" ],\r\n  \"postName\" : [ \"人力资源\" ],\r\n  \"postCode\" : [ \"hr\" ],\r\n  \"postSort\" : [ \"3\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2019-11-25 21:48:14');
INSERT INTO `sys_oper_log` VALUES (111, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/post/edit', '127.0.0.1', '内网IP', '{\r\n  \"postId\" : [ \"3\" ],\r\n  \"postName\" : [ \"人力资源\" ],\r\n  \"postCode\" : [ \"hr\" ],\r\n  \"postSort\" : [ \"3\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2019-11-25 21:48:21');
INSERT INTO `sys_oper_log` VALUES (112, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/post/edit', '127.0.0.1', '内网IP', '{\r\n  \"postId\" : [ \"3\" ],\r\n  \"postName\" : [ \"人力资源\" ],\r\n  \"postCode\" : [ \"hr\" ],\r\n  \"postSort\" : [ \"3\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2019-11-25 21:48:26');
INSERT INTO `sys_oper_log` VALUES (113, '岗位管理', 5, 'com.ruoyi.web.controller.system.SysPostController.export()', 'POST', 1, 'admin', '研发部门', '/system/post/export', '127.0.0.1', '内网IP', '{\r\n  \"postCode\" : [ \"\" ],\r\n  \"postName\" : [ \"\" ],\r\n  \"status\" : [ \"\" ]\r\n}', '{\r\n  \"msg\" : \"7fd4b6fd-f4ff-404e-b4c9-4300da92ad41_岗位数据.xlsx\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2019-11-26 10:43:22');
INSERT INTO `sys_oper_log` VALUES (114, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\r\n  \"userId\" : [ \"2\" ],\r\n  \"deptId\" : [ \"105\" ],\r\n  \"userName\" : [ \"若依\" ],\r\n  \"dept.deptName\" : [ \"测试部门\" ],\r\n  \"phonenumber\" : [ \"15666666666\" ],\r\n  \"email\" : [ \"ry@qq.com\" ],\r\n  \"loginName\" : [ \"ry\" ],\r\n  \"sex\" : [ \"1\" ],\r\n  \"role\" : [ \"1\", \"2\" ],\r\n  \"remark\" : [ \"测试员\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"1,2\" ],\r\n  \"postIds\" : [ \"2,3,4\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2019-11-26 13:50:47');
INSERT INTO `sys_oper_log` VALUES (115, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\r\n  \"userId\" : [ \"1\" ],\r\n  \"deptId\" : [ \"103\" ],\r\n  \"userName\" : [ \"若依\" ],\r\n  \"dept.deptName\" : [ \"研发部门\" ],\r\n  \"phonenumber\" : [ \"15888888888\" ],\r\n  \"email\" : [ \"ry@163.com\" ],\r\n  \"loginName\" : [ \"admin\" ],\r\n  \"sex\" : [ \"1\" ],\r\n  \"role\" : [ \"1\" ],\r\n  \"remark\" : [ \"管理员\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"1\" ],\r\n  \"postIds\" : [ \"1\" ]\r\n}', 'null', 1, '不允许操作超级管理员用户', '2019-11-26 14:53:53');
INSERT INTO `sys_oper_log` VALUES (116, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\r\n  \"userId\" : [ \"2\" ],\r\n  \"deptId\" : [ \"105\" ],\r\n  \"userName\" : [ \"若依\" ],\r\n  \"dept.deptName\" : [ \"测试部门\" ],\r\n  \"phonenumber\" : [ \"15666666666\" ],\r\n  \"email\" : [ \"ry@qq.com\" ],\r\n  \"loginName\" : [ \"ry\" ],\r\n  \"sex\" : [ \"1\" ],\r\n  \"role\" : [ \"1\", \"2\" ],\r\n  \"remark\" : [ \"测试员\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"1,2\" ],\r\n  \"postIds\" : [ \"2,3,4\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2019-11-26 14:54:04');
INSERT INTO `sys_oper_log` VALUES (117, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\r\n  \"userId\" : [ \"2\" ],\r\n  \"deptId\" : [ \"105\" ],\r\n  \"userName\" : [ \"若依\" ],\r\n  \"dept.deptName\" : [ \"测试部门\" ],\r\n  \"phonenumber\" : [ \"15666666666\" ],\r\n  \"email\" : [ \"ry@qq.com\" ],\r\n  \"loginName\" : [ \"ry\" ],\r\n  \"sex\" : [ \"1\" ],\r\n  \"role\" : [ \"1\", \"2\" ],\r\n  \"remark\" : [ \"测试员\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"1,2\" ],\r\n  \"postIds\" : [ \"2,3,4\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2019-11-26 14:54:10');
INSERT INTO `sys_oper_log` VALUES (118, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\r\n  \"userId\" : [ \"1\" ],\r\n  \"deptId\" : [ \"103\" ],\r\n  \"userName\" : [ \"若依\" ],\r\n  \"dept.deptName\" : [ \"研发部门\" ],\r\n  \"phonenumber\" : [ \"15888888888\" ],\r\n  \"email\" : [ \"ry@163.com\" ],\r\n  \"loginName\" : [ \"admin\" ],\r\n  \"sex\" : [ \"1\" ],\r\n  \"role\" : [ \"1\" ],\r\n  \"remark\" : [ \"管理员\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"1\" ],\r\n  \"postIds\" : [ \"1\" ]\r\n}', 'null', 1, '不允许操作超级管理员用户', '2019-11-26 15:10:20');
INSERT INTO `sys_oper_log` VALUES (119, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\r\n  \"userId\" : [ \"1\" ],\r\n  \"deptId\" : [ \"103\" ],\r\n  \"userName\" : [ \"若依\" ],\r\n  \"dept.deptName\" : [ \"研发部门\" ],\r\n  \"phonenumber\" : [ \"15888888888\" ],\r\n  \"email\" : [ \"ry@163.com\" ],\r\n  \"loginName\" : [ \"admin\" ],\r\n  \"sex\" : [ \"1\" ],\r\n  \"role\" : [ \"1\" ],\r\n  \"remark\" : [ \"管理员\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"1\" ],\r\n  \"postIds\" : [ \"1\" ]\r\n}', 'null', 1, '不允许操作超级管理员用户', '2019-11-26 15:10:38');
INSERT INTO `sys_oper_log` VALUES (120, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\r\n  \"userId\" : [ \"2\" ],\r\n  \"deptId\" : [ \"105\" ],\r\n  \"userName\" : [ \"若依\" ],\r\n  \"dept.deptName\" : [ \"测试部门\" ],\r\n  \"phonenumber\" : [ \"15666666666\" ],\r\n  \"email\" : [ \"ry@qq.com\" ],\r\n  \"loginName\" : [ \"ry\" ],\r\n  \"sex\" : [ \"1\" ],\r\n  \"role\" : [ \"1\", \"2\" ],\r\n  \"remark\" : [ \"测试员\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"1,2\" ],\r\n  \"postIds\" : [ \"2,3,4\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2019-11-26 15:10:51');
INSERT INTO `sys_oper_log` VALUES (121, '角色管理', 4, 'com.ruoyi.web.controller.system.SysRoleController.cancelAuthUser()', 'POST', 1, 'admin', '研发部门', '/system/role/authUser/cancel', '127.0.0.1', '内网IP', '{\r\n  \"roleId\" : [ \"1\" ],\r\n  \"userId\" : [ \"2\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2019-11-27 00:40:47');
INSERT INTO `sys_oper_log` VALUES (122, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/post/edit', '127.0.0.1', '内网IP', '{\r\n  \"postId\" : [ \"4\" ],\r\n  \"postName\" : [ \"普通员工\" ],\r\n  \"postCode\" : [ \"user\" ],\r\n  \"postSort\" : [ \"4\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2019-12-12 23:59:26');
INSERT INTO `sys_oper_log` VALUES (123, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/post/edit', '127.0.0.1', '内网IP', '{\r\n  \"postId\" : [ \"4\" ],\r\n  \"postName\" : [ \"普通员工\" ],\r\n  \"postCode\" : [ \"user\" ],\r\n  \"postSort\" : [ \"4\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2019-12-12 23:59:31');
INSERT INTO `sys_oper_log` VALUES (124, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/post/edit', '127.0.0.1', '内网IP', '{\r\n  \"postId\" : [ \"4\" ],\r\n  \"postName\" : [ \"普通员工\" ],\r\n  \"postCode\" : [ \"user\" ],\r\n  \"postSort\" : [ \"4\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2019-12-12 23:59:35');
INSERT INTO `sys_oper_log` VALUES (125, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\r\n  \"roleId\" : [ \"1\" ],\r\n  \"roleName\" : [ \"管理员\" ],\r\n  \"roleKey\" : [ \"admin\" ],\r\n  \"roleSort\" : [ \"1\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"管理员\" ],\r\n  \"menuIds\" : [ \"\" ]\r\n}', 'null', 1, '不允许操作超级管理员角色', '2019-12-13 01:13:15');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` int(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `inserted_by_id` bigint(64) NULL DEFAULT NULL COMMENT '创建者',
  `inserted_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by_id` bigint(64) NULL DEFAULT NULL COMMENT '更新者',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '1', 0, 1, '2018-03-16 11:33:00', 3, '2020-03-09 15:28:12', 'jhhhhhh', 101);
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 0, 1, '2018-03-16 11:33:00', NULL, '2020-02-09 01:05:56', NULL, 101);
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '3', 0, 1, '2018-03-16 11:33:00', NULL, '2020-02-08 15:17:55', '24234', 100);
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '1', 0, 1, '2018-03-16 11:33:00', 3, '2020-02-17 13:30:53', NULL, 101);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` int(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `inserted_by_id` bigint(20) NULL DEFAULT NULL COMMENT '创建者',
  `inserted_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by_id` bigint(20) NULL DEFAULT NULL COMMENT '更新者',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '管理员', 'admin', 1, 0, 1, '2018-03-16 11:33:00', 3, '2020-02-16 06:14:58', '管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, 0, 1, '2018-03-16 11:33:00', 3, '2020-02-17 16:00:41', '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (2, 1061);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '职务',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像路径',
  `login_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登陆时间',
  `status` int(1) NULL DEFAULT 0 COMMENT '帐号状态（0正常 1停用）',
  `inserted_by_id` bigint(64) NULL DEFAULT NULL COMMENT '创建者',
  `inserted_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by_id` bigint(64) NULL DEFAULT NULL COMMENT '更新者',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `login_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `sys_user_login_name_u`(`login_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 100, 'iuuiiuiiu', '管理员55', '00', NULL, 'ry@163.com', '15888888888', '1', 'b6b66a23-8b3e-40ff-a9c5-06716ab0f00c.png', '127.0.0.1', '2019-12-21 17:21:34', 0, 1, '2018-03-16 11:33:00', 3, '2020-02-16 06:26:34', '管理员88', 'liuliu');
INSERT INTO `sys_user` VALUES (3, 100, 'werwe', '管理员', '00', NULL, NULL, 'wer', '0', '2b18e15b-94c0-461d-9cc6-b3cc8e4c97f0.jpg', '', NULL, 0, NULL, '2020-01-20 17:04:16', 3, '2020-02-17 13:00:20', NULL, 'admin');
INSERT INTO `sys_user` VALUES (4, 100, 'werwe', 'ewrwr', '00', NULL, NULL, 'wer', '1', '', '', NULL, 0, NULL, '2020-01-20 17:04:20', 3, '2020-02-16 06:35:00', NULL, '8887788');
INSERT INTO `sys_user` VALUES (5, 101, '1313313', 'tt', '00', NULL, NULL, '156789000', '0', '1e4c88e9-c50b-491e-8ee4-dae9943b2b88.jpg', '', NULL, 0, NULL, '2020-02-15 14:51:51', NULL, '2020-02-15 15:10:35', NULL, 'tttt');
INSERT INTO `sys_user` VALUES (6, 102, '234234', 'tttt', '00', NULL, NULL, '12345678099', '0', '', '', NULL, 0, NULL, '2020-02-15 15:08:05', 3, '2020-02-16 06:35:02', NULL, 'tttt2');
INSERT INTO `sys_user` VALUES (7, 100, '2342342', 't1', '00', NULL, NULL, '1234567809', '0', 'fac44a55-3a4f-49f0-a344-f4d192abc33a.jpg', '', NULL, 0, NULL, '2020-02-16 03:06:38', 3, '2020-02-16 06:17:01', NULL, 't1');

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online`  (
  `sessionId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime(0) NULL DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime(0) NULL DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) NULL DEFAULT 0 COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '在线用户记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
INSERT INTO `sys_user_online` VALUES ('9cf6e3de-5d33-4c8e-a2dd-ad7b647dbc09', 'admin', '研发部门', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', 'on_line', '2019-12-21 17:07:14', '2019-12-21 17:11:11', 1800000);
INSERT INTO `sys_user_online` VALUES ('f1bda882-935b-487c-917b-d5cc9356210c', 'admin', '研发部门', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', 'on_line', '2019-12-21 17:12:29', '2019-12-21 17:21:35', 1800000);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (2, 2);
INSERT INTO `sys_user_post` VALUES (2, 3);
INSERT INTO `sys_user_post` VALUES (2, 4);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (2, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (5, 1);
INSERT INTO `sys_user_role` VALUES (5, 2);

SET FOREIGN_KEY_CHECKS = 1;
