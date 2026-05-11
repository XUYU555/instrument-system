/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 80033
 Source Host           : localhost:3306
 Source Schema         : ry1

 Target Server Type    : MySQL
 Target Server Version : 80033
 File Encoding         : 65001

 Date: 11/05/2026 11:00:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (100, 2);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);
INSERT INTO `sys_user_post` VALUES (100, 4);

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online`  (
  `sessionId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime NULL DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime NULL DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int NULL DEFAULT 0 COMMENT '超时时间，单位为分钟',
  `session_data` blob NULL COMMENT '序列化的Session数据，用于服务重启后恢复会话',
  PRIMARY KEY (`sessionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '在线用户记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
INSERT INTO `sys_user_online` VALUES ('ac157922-382e-4780-a17f-afd65be1f848', 'admin', '研发部门', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', 'on_line', '2026-05-11 10:55:19', '2026-05-11 10:59:16', 1800000, 0xACED00057372002B636F6D2E72756F79692E636F6D6D6F6E2E636F72652E73657373696F6E2E4F6E6C696E6553657373696F6E00000000000000010200084C00066176617461727400124C6A6176612F6C616E672F537472696E673B4C000762726F7773657271007E00014C0008646570744E616D6571007E00014C0004686F737471007E00014C00096C6F67696E4E616D6571007E00014C00026F7371007E00014C00067374617475737400254C636F6D2F72756F79692F636F6D6D6F6E2F656E756D732F4F6E6C696E655374617475733B4C00067573657249647400104C6A6176612F6C616E672F4C6F6E673B7872002A6F72672E6170616368652E736869726F2E73657373696F6E2E6D67742E53696D706C6553657373696F6E9D1CA1B8D58C626E03000078707702009B74002461633135373932322D333832652D343738302D613137662D6166643635626531663834387372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000019E14F5E255787371007E000777080000019E14F97FED78770800000000001B7740737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C77080000001000000004740011736869726F536176656452657175657374737200266F72672E6170616368652E736869726F2E7765622E7574696C2E5361766564526571756573749834DDF5BF680B440200034C00066D6574686F6471007E00014C000B7175657279537472696E6771007E00014C000A7265717565737455524971007E00017870740003474554707400312F2E77656C6C2D6B6E6F776E2F61707073706563696669632F636F6D2E6368726F6D652E646576746F6F6C732E6A736F6E740048636F6D2E72756F79692E6672616D65776F726B2E736869726F2E73657373696F6E2E4F6E6C696E6553657373696F6E44414F4C4153545F53594E435F44425F54494D455354414D5071007E00097400506F72672E6170616368652E736869726F2E7375626A6563742E737570706F72742E44656661756C745375626A656374436F6E746578745F41555448454E544943415445445F53455353494F4E5F4B4559737200116A6176612E6C616E672E426F6F6C65616ECD207280D59CFAEE0200015A000576616C756578700174004D6F72672E6170616368652E736869726F2E7375626A6563742E737570706F72742E44656661756C745375626A656374436F6E746578745F5052494E434950414C535F53455353494F4E5F4B4559737200326F72672E6170616368652E736869726F2E7375626A6563742E53696D706C655072696E636970616C436F6C6C656374696F6EA87F5825C6A3084A0300014C000F7265616C6D5072696E636970616C7374000F4C6A6176612F7574696C2F4D61703B7870737200176A6176612E7574696C2E4C696E6B6564486173684D617034C04E5C106CC0FB0200015A000B6163636573734F726465727871007E000A3F4000000000000C7708000000100000000174002B636F6D2E72756F79692E6672616D65776F726B2E736869726F2E7265616C6D2E557365725265616C6D5F30737200176A6176612E7574696C2E4C696E6B656448617368536574D86CD75A95DD2A1E020000787200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F400000000000017372002B636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E656E746974792E5379735573657200000000000000010200164C000661766174617271007E00014C000764656C466C616771007E00014C00046465707474002D4C636F6D2F72756F79692F636F6D6D6F6E2F636F72652F646F6D61696E2F656E746974792F537973446570743B4C000664657074496471007E00034C0005656D61696C71007E00014C00096C6F67696E446174657400104C6A6176612F7574696C2F446174653B4C00076C6F67696E497071007E00014C00096C6F67696E4E616D6571007E00014C0008706172656E74496471007E00034C000870617373776F726471007E00014C000B70686F6E656E756D62657271007E00015B0007706F73744964737400115B4C6A6176612F6C616E672F4C6F6E673B4C000D7077645570646174654461746571007E00214C0006726F6C65496471007E00035B0007726F6C6549647371007E00224C0005726F6C65737400104C6A6176612F7574696C2F4C6973743B4C000473616C7471007E00014C000373657871007E00014C000673746174757371007E00014C000675736572496471007E00034C0008757365724E616D6571007E00014C0008757365725479706571007E000178720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00014C000A63726561746554696D6571007E00214C0006706172616D7371007E00174C000672656D61726B71007E00014C000B73656172636856616C756571007E00014C0008757064617465427971007E00014C000A75706461746554696D6571007E0021787074000561646D696E7371007E000777080000019D0E481BE0787371007E000A3F400000000000007708000000100000000078740009E7AEA1E79086E59198707400007371007E000777080000019E0A6D22A87874003F2F70726F66696C652F6176617461722F323032362F30342F32342F30343233663335313666353234376466383264366561396138643066656236372E706E67740001307372002B636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E656E746974792E53797344657074000000000000000102000C4C0009616E636573746F727371007E00014C000764656C466C616771007E00014C000664657074496471007E00034C0008646570744E616D6571007E00014C0005656D61696C71007E00014C00096578636C756465496471007E00034C00066C656164657271007E00014C00086F726465724E756D7400134C6A6176612F6C616E672F496E74656765723B4C0008706172656E74496471007E00034C000A706172656E744E616D6571007E00014C000570686F6E6571007E00014C000673746174757371007E00017871007E002470707070707070740009302C3130302C313031707372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000006774000CE7A094E58F91E983A8E997A87070740006E88BA5E4BE9D737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0033000000017371007E0032000000000000006570707400013071007E003474000A7279403136332E636F6D7371007E000777080000019E0A4C5C08787400093132372E302E302E3174000561646D696E70740020323963363761333033393836333832363966653630306637336130353439333474000B313538383838383838383870707070737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A657870000000017704000000017372002B636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E656E746974792E537973526F6C65000000000000000102000B5A0004666C61674C00096461746153636F706571007E00014C000764656C466C616771007E00015B00076465707449647371007E00225B00076D656E7549647371007E00224C000B7065726D697373696F6E7374000F4C6A6176612F7574696C2F5365743B4C0006726F6C65496471007E00034C0007726F6C654B657971007E00014C0008726F6C654E616D6571007E00014C0008726F6C65536F727471007E00014C000673746174757371007E00017871007E0024707070707070700074000131707070707371007E0032000000000000000174000561646D696E74000FE8B685E7BAA7E7AEA1E79086E59198740001317400013078740006313131313131740001317400013071007E0047740003637569740002303078780077010171007E001A78787871007E002C740008456467652031343871007E00357400093132372E302E302E3171007E003E74000C57696E646F7773203E3D31307E720023636F6D2E72756F79692E636F6D6D6F6E2E656E756D732E4F6E6C696E6553746174757300000000000000001200007872000E6A6176612E6C616E672E456E756D000000000000000012000078707400076F6E5F6C696E6571007E0047);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户 01注册用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '盐加密',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '账号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime NULL DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', 'cui', '00', 'ry@163.com', '15888888888', '1', '/profile/avatar/2026/04/24/0423f3516f5247df82d6ea9a8d0feb67.png', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', '2026-05-11 10:59:16', NULL, 'admin', '2026-03-21 10:45:00', '', '2026-05-09 09:49:45', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '0', '127.0.0.1', '2026-03-25 19:33:38', NULL, 'admin', '2026-03-21 10:45:00', '', NULL, '测试员');
INSERT INTO `sys_user` VALUES (100, 101, 'user', 'user', '00', 'xuyu34521@gmail.com', '15115005242', '0', '', '24ae1389f51a58ff038b4d7c30999027', '2664c8', '0', '0', '127.0.0.1', '2026-05-08 23:18:46', '2026-05-08 23:17:59', 'ry', '2026-03-25 19:34:27', '', '2026-05-08 23:17:59', NULL);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 2000);
INSERT INTO `sys_role_menu` VALUES (2, 2001);
INSERT INTO `sys_role_menu` VALUES (2, 2002);
INSERT INTO `sys_role_menu` VALUES (2, 2003);
INSERT INTO `sys_role_menu` VALUES (2, 2004);
INSERT INTO `sys_role_menu` VALUES (2, 2005);
INSERT INTO `sys_role_menu` VALUES (2, 2006);
INSERT INTO `sys_role_menu` VALUES (2, 2007);
INSERT INTO `sys_role_menu` VALUES (2, 2008);
INSERT INTO `sys_role_menu` VALUES (2, 2009);
INSERT INTO `sys_role_menu` VALUES (2, 2010);
INSERT INTO `sys_role_menu` VALUES (2, 2011);
INSERT INTO `sys_role_menu` VALUES (2, 2012);
INSERT INTO `sys_role_menu` VALUES (2, 2013);
INSERT INTO `sys_role_menu` VALUES (2, 2014);
INSERT INTO `sys_role_menu` VALUES (2, 2015);
INSERT INTO `sys_role_menu` VALUES (2, 2016);
INSERT INTO `sys_role_menu` VALUES (2, 2017);
INSERT INTO `sys_role_menu` VALUES (2, 2018);
INSERT INTO `sys_role_menu` VALUES (2, 2019);
INSERT INTO `sys_role_menu` VALUES (2, 2020);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', '0', '0', 'admin', '2026-03-21 10:45:00', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', '0', '0', 'admin', '2026-03-21 10:45:00', 'admin', '2026-04-24 19:55:01', '普通角色');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2026-03-21 10:45:00', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2026-03-21 10:45:00', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2026-03-21 10:45:00', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2026-03-21 10:45:00', '', NULL, '');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 211 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"仪器管理\"],\"url\":[\"system/instrument\"],\"target\":[\"menuItem\"],\"perms\":[\"system:instrument:view\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-balance-scale\"],\"visible\":[\"0\"],\"isRefresh\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-23 17:42:43', 85);
INSERT INTO `sys_oper_log` VALUES (101, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"仪器借用\"],\"url\":[\"system/borrow\"],\"target\":[\"menuItem\"],\"perms\":[\"system:borrow:view\"],\"orderNum\":[\"5\"],\"icon\":[\"fa fa-sitemap\"],\"visible\":[\"0\"],\"isRefresh\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-23 19:57:08', 104);
INSERT INTO `sys_oper_log` VALUES (102, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2000\"],\"menuType\":[\"F\"],\"menuName\":[\"查询仪器\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"system:instrument:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-23 19:57:58', 11);
INSERT INTO `sys_oper_log` VALUES (103, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2000\"],\"menuType\":[\"F\"],\"menuName\":[\"新增仪器\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"system:instrument:add\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-23 19:58:19', 8);
INSERT INTO `sys_oper_log` VALUES (104, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2000\"],\"menuType\":[\"F\"],\"menuName\":[\"修改仪器\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"system:instrument:edit\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-23 19:58:49', 11);
INSERT INTO `sys_oper_log` VALUES (105, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2000\"],\"menuType\":[\"F\"],\"menuName\":[\"删除仪器\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\\tsystem:instrument:remove\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-23 19:59:04', 10);
INSERT INTO `sys_oper_log` VALUES (106, '仪器管理', 1, 'com.ruoyi.web.controller.instrument.SysInstrumentController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/instrument/add', '127.0.0.1', '内网IP', '{\"instrumentName\":[\"测试仪器\"],\"instrumentCode\":[\"12345\"],\"deptId\":[\"100\"],\"status\":[\"0\"],\"location\":[\"逸夫楼D203\"],\"remark\":[\"测试\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-23 20:04:19', 4);
INSERT INTO `sys_oper_log` VALUES (107, '仪器管理', 1, 'com.ruoyi.web.controller.instrument.SysInstrumentController.addSave()', 'POST', 1, 'admin', NULL, '/system/instrument/add', '127.0.0.1', '内网IP', '{\"instrumentName\":[\"测试仪器111\"],\"instrumentCode\":[\"12345\"],\"deptId\":[\"101\"],\"status\":[\"0\"],\"location\":[\"逸夫楼D2033\"],\"remark\":[\"测试\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-23 20:07:26', 53099);
INSERT INTO `sys_oper_log` VALUES (108, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', NULL, '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2001\"],\"menuType\":[\"F\"],\"menuName\":[\"查询\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"system:borrow:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-23 20:10:50', 21);
INSERT INTO `sys_oper_log` VALUES (109, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', NULL, '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2001\"],\"menuType\":[\"F\"],\"menuName\":[\"新增\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"system:borrow:add\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-23 20:11:09', 11);
INSERT INTO `sys_oper_log` VALUES (110, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', NULL, '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2001\"],\"menuType\":[\"F\"],\"menuName\":[\"修改\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"system:borrow:edit\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-23 20:11:32', 10);
INSERT INTO `sys_oper_log` VALUES (111, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', NULL, '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2001\"],\"menuType\":[\"F\"],\"menuName\":[\"删除\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"system:borrow:remove\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-23 20:11:52', 9);
INSERT INTO `sys_oper_log` VALUES (112, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', NULL, '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2001\"],\"menuType\":[\"F\"],\"menuName\":[\"审核\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"system:borrow:audit\"],\"orderNum\":[\"5\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-23 20:12:07', 11);
INSERT INTO `sys_oper_log` VALUES (113, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', NULL, '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2001\"],\"menuType\":[\"F\"],\"menuName\":[\"归还\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"system:borrow:return\"],\"orderNum\":[\"6\"],\"icon\":[\"\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-23 20:12:24', 10);
INSERT INTO `sys_oper_log` VALUES (114, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', NULL, '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"仪器维修\"],\"url\":[\"system/repair\"],\"target\":[\"menuItem\"],\"perms\":[\"\\tsystem:repair:view\"],\"orderNum\":[\"6\"],\"icon\":[\"fa fa-gavel\"],\"visible\":[\"0\"],\"isRefresh\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-23 20:19:43', 313);
INSERT INTO `sys_oper_log` VALUES (115, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', NULL, '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2012\"],\"menuType\":[\"F\"],\"menuName\":[\"查询\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"system:repair:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-23 20:20:44', 9);
INSERT INTO `sys_oper_log` VALUES (116, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', NULL, '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2012\"],\"menuType\":[\"F\"],\"menuName\":[\"新增\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"system:repair:add\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-23 20:20:57', 13);
INSERT INTO `sys_oper_log` VALUES (117, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', NULL, '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2012\"],\"menuType\":[\"F\"],\"menuName\":[\"修改\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"system:repair:edit\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-23 20:21:12', 8);
INSERT INTO `sys_oper_log` VALUES (118, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', NULL, '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2012\"],\"menuType\":[\"F\"],\"menuName\":[\"删除\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"system:repair:remove\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-23 20:21:28', 11);
INSERT INTO `sys_oper_log` VALUES (119, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', NULL, '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2012\"],\"menuType\":[\"F\"],\"menuName\":[\"处理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"system:repair:handle\"],\"orderNum\":[\"5\"],\"icon\":[\"\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-23 20:21:40', 14);
INSERT INTO `sys_oper_log` VALUES (120, '仪器借用', 3, 'com.ruoyi.web.controller.instrument.SysInstrumentBorrowController.remove()', 'POST', 1, 'admin', '研发部门', '/system/borrow/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"8\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-24 19:30:14', 88);
INSERT INTO `sys_oper_log` VALUES (121, '借用审核', 2, 'com.ruoyi.web.controller.instrument.SysInstrumentBorrowController.auditSave()', 'POST', 1, 'admin', '研发部门', '/system/borrow/audit', '127.0.0.1', '内网IP', '{\"borrowId\":[\"5\"],\"status\":[\"1\"],\"auditRemark\":[\"通过\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'update_by\' in \'field list\'\r\n### The error may exist in file [D:\\IdeaProjects\\Instrument-Management\\RuoYi\\instrument-manage\\target\\classes\\mapper\\SysInstrumentBorrowMapper.xml]\r\n### The error may involve com.cui.mapper.SysInstrumentBorrowMapper.updateBorrow-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_instrument_borrow          SET borrow_time = ?,                                       status = ?,             audit_user_id = ?,             audit_remark = ?,             audit_time = ?,             update_by = ?,                          update_time = sysdate()          where borrow_id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'update_by\' in \'field list\'\n; bad SQL grammar []', '2026-03-24 19:31:21', 162);
INSERT INTO `sys_oper_log` VALUES (122, '仪器借用', 1, 'com.ruoyi.web.controller.instrument.SysInstrumentBorrowController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/borrow/add', '127.0.0.1', '内网IP', '{\"instrumentId\":[\"1\"],\"planReturnTime\":[\"2026-03-25 17:45:10\"],\"remark\":[\"测试\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'\r\n### The error may exist in file [D:\\IdeaProjects\\Instrument-Management\\RuoYi\\instrument-manage\\target\\classes\\mapper\\SysInstrumentBorrowMapper.xml]\r\n### The error may involve com.cui.mapper.SysInstrumentBorrowMapper.insertBorrow-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_instrument_borrow          ( instrument_id,             user_id,             user_name,             plan_return_time,             status,             create_by,             remark )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'\n; bad SQL grammar []', '2026-03-24 19:48:51', 7);
INSERT INTO `sys_oper_log` VALUES (123, '仪器借用', 1, 'com.ruoyi.web.controller.instrument.SysInstrumentBorrowController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/borrow/add', '127.0.0.1', '内网IP', '{\"instrumentId\":[\"1\"],\"planReturnTime\":[\"2026-03-24 19:50:00\"],\"remark\":[\"测试\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'\r\n### The error may exist in file [D:\\IdeaProjects\\Instrument-Management\\RuoYi\\instrument-manage\\target\\classes\\mapper\\SysInstrumentBorrowMapper.xml]\r\n### The error may involve com.cui.mapper.SysInstrumentBorrowMapper.insertBorrow-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_instrument_borrow          ( instrument_id,             user_id,             user_name,             plan_return_time,             status,             create_by,             remark )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'\n; bad SQL grammar []', '2026-03-24 19:49:24', 7);
INSERT INTO `sys_oper_log` VALUES (124, '仪器借用', 1, 'com.ruoyi.web.controller.instrument.SysInstrumentBorrowController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/borrow/add', '127.0.0.1', '内网IP', '{\"instrumentId\":[\"1\"],\"planReturnTime\":[\"2026-03-24 19:59:24\"],\"remark\":[\"申请\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-24 19:59:31', 6);
INSERT INTO `sys_oper_log` VALUES (125, '借用审核', 2, 'com.ruoyi.web.controller.instrument.SysInstrumentBorrowController.auditSave()', 'POST', 1, 'admin', '研发部门', '/system/borrow/audit', '127.0.0.1', '内网IP', '{\"borrowId\":[\"11\"],\"status\":[\"1\"],\"auditRemark\":[\"通过\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-24 19:59:43', 4);
INSERT INTO `sys_oper_log` VALUES (126, '仪器归还', 2, 'com.ruoyi.web.controller.instrument.SysInstrumentBorrowController.returnBorrow()', 'POST', 1, 'admin', '研发部门', '/system/borrow/return', '127.0.0.1', '内网IP', '{\"borrowId\":[\"11\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-25 19:31:13', 84);
INSERT INTO `sys_oper_log` VALUES (127, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.addSave()', 'POST', 1, 'ry', '测试部门', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"101\"],\"userName\":[\"user\"],\"deptName\":[\"深圳总公司\"],\"phonenumber\":[\"15115005242\"],\"email\":[\"xuyu34521@gmail.com\"],\"loginName\":[\"user\"],\"sex\":[\"0\"],\"role\":[\"2\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"4\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-25 19:34:27', 26);
INSERT INTO `sys_oper_log` VALUES (128, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"1,2,3,4,2000,2001,2012,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,1000,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,1034,1035,1036,1037,1038,500,501,1047,1048,1049,1050,1051,1052,1053,1054,1055,1056,1057,1058,1059,1060,1061,1039,1040,1041,1042,1043,1044,1045,1046,2002,2003,2004,2006,2007,2008,2011,2013,2014,2015\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-25 19:51:34', 40);
INSERT INTO `sys_oper_log` VALUES (129, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"1,2,3,4,2000,2001,2012,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,1000,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,1034,1035,1036,1037,1038,500,501,1047,1048,1049,1050,1051,1052,1053,1054,1055,1056,1057,1058,1059,1060,1061,1039,1040,1041,1042,1043,1044,1045,1046,2002,2003,2004,2006,2007,2008,2011,2013,2014,2015\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-25 19:52:46', 20);
INSERT INTO `sys_oper_log` VALUES (130, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"1\"],\"roleName\":[\"超级管理员\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"超级管理员\"],\"menuIds\":[\"1,2,3,4,2000,2001,2012,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,1000,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,1034,1035,1036,1037,1038,500,501,1047,1048,1049,1050,1051,1052,1053,1054,1055,1056,1057,1058,1059,1060,1061,1039,1040,1041,1042,1043,1044,1045,1046,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2013,2014,2015,2016,2017\"]}', NULL, 1, '不允许操作超级管理员角色', '2026-03-25 19:52:58', 3);
INSERT INTO `sys_oper_log` VALUES (131, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"3,2000,2001,2012,114,115,116,1057,1058,1059,1060,1061,2002,2003,2004,2006,2007,2008,2011,2013,2014,2017\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-25 20:06:28', 11);
INSERT INTO `sys_oper_log` VALUES (132, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"3,2000,2001,2012,114,115,116,1057,1058,1059,1060,1061,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2013,2014,2015,2016,2017\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-25 20:09:00', 14);
INSERT INTO `sys_oper_log` VALUES (133, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"3,2000,2001,2012,114,115,116,1057,1058,1059,1060,1061,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2013,2014,2015,2016,2017\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-25 20:13:51', 95);
INSERT INTO `sys_oper_log` VALUES (134, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"3,2000,2001,2012,114,115,116,1057,1058,1059,1060,1061,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2013,2014,2015,2016,2017\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-25 20:15:36', 20);
INSERT INTO `sys_oper_log` VALUES (135, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2006\"],\"parentId\":[\"2001\"],\"menuType\":[\"F\"],\"menuName\":[\"查询\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system:borrow:list\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-25 20:19:48', 7);
INSERT INTO `sys_oper_log` VALUES (136, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2007\"],\"parentId\":[\"2001\"],\"menuType\":[\"F\"],\"menuName\":[\"新增\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system:borrow:add\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-25 20:19:53', 8);
INSERT INTO `sys_oper_log` VALUES (137, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2008\"],\"parentId\":[\"2001\"],\"menuType\":[\"F\"],\"menuName\":[\"修改\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system:borrow:edit\"],\"orderNum\":[\"3\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-25 20:19:59', 8);
INSERT INTO `sys_oper_log` VALUES (138, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2009\"],\"parentId\":[\"2001\"],\"menuType\":[\"F\"],\"menuName\":[\"删除\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system:borrow:remove\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-25 20:20:09', 8);
INSERT INTO `sys_oper_log` VALUES (139, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2011\"],\"parentId\":[\"2001\"],\"menuType\":[\"F\"],\"menuName\":[\"归还\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system:borrow:return\"],\"orderNum\":[\"6\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-25 20:20:18', 7);
INSERT INTO `sys_oper_log` VALUES (140, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2013\"],\"parentId\":[\"2012\"],\"menuType\":[\"F\"],\"menuName\":[\"查询\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system:repair:list\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-25 20:20:31', 8);
INSERT INTO `sys_oper_log` VALUES (141, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2014\"],\"parentId\":[\"2012\"],\"menuType\":[\"F\"],\"menuName\":[\"新增\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system:repair:add\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-25 20:20:35', 7);
INSERT INTO `sys_oper_log` VALUES (142, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2015\"],\"parentId\":[\"2012\"],\"menuType\":[\"F\"],\"menuName\":[\"修改\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system:repair:edit\"],\"orderNum\":[\"3\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-25 20:20:40', 10);
INSERT INTO `sys_oper_log` VALUES (143, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2016\"],\"parentId\":[\"2012\"],\"menuType\":[\"F\"],\"menuName\":[\"删除\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system:repair:remove\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-25 20:20:44', 8);
INSERT INTO `sys_oper_log` VALUES (144, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2017\"],\"parentId\":[\"2012\"],\"menuType\":[\"F\"],\"menuName\":[\"处理\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system:repair:handle\"],\"orderNum\":[\"5\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-25 20:20:48', 9);
INSERT INTO `sys_oper_log` VALUES (145, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"3,2000,2001,2012,114,115,116,1057,1058,1059,1060,1061,2002,2003,2004,2006,2007,2008,2011,2013,2014,2015\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-03-25 20:21:43', 14);
INSERT INTO `sys_oper_log` VALUES (146, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/115', '127.0.0.1', '内网IP', '115 ', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":301}', 0, NULL, '2026-04-24 14:59:20', 80);
INSERT INTO `sys_oper_log` VALUES (147, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/1057', '127.0.0.1', '内网IP', '1057 ', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":301}', 0, NULL, '2026-04-24 14:59:25', 7);
INSERT INTO `sys_oper_log` VALUES (148, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"3,2000,2001,2012,100,101,102,103,104,105,106,107,114,1057,1058,1059,1060,1061,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2013,2014,2015,2016,2017\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-24 15:01:48', 45);
INSERT INTO `sys_oper_log` VALUES (149, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"3,2000,2001,2012,100,101,102,103,104,105,106,107,114,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2013,2014,2015,2016,2017\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-24 15:02:23', 17);
INSERT INTO `sys_oper_log` VALUES (150, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/115', '127.0.0.1', '内网IP', '115 ', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":301}', 0, NULL, '2026-04-24 15:02:36', 5);
INSERT INTO `sys_oper_log` VALUES (151, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/1057', '127.0.0.1', '内网IP', '1057 ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-24 15:02:39', 10);
INSERT INTO `sys_oper_log` VALUES (152, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/1058', '127.0.0.1', '内网IP', '1058 ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-24 15:02:48', 9);
INSERT INTO `sys_oper_log` VALUES (153, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/1059', '127.0.0.1', '内网IP', '1059 ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-24 15:02:52', 9);
INSERT INTO `sys_oper_log` VALUES (154, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/1060', '127.0.0.1', '内网IP', '1060 ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-24 15:02:57', 8);
INSERT INTO `sys_oper_log` VALUES (155, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/1061', '127.0.0.1', '内网IP', '1061 ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-24 15:03:00', 7);
INSERT INTO `sys_oper_log` VALUES (156, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/115', '127.0.0.1', '内网IP', '115 ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-24 15:03:06', 9);
INSERT INTO `sys_oper_log` VALUES (157, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/4', '127.0.0.1', '内网IP', '4 ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-24 15:03:34', 8);
INSERT INTO `sys_oper_log` VALUES (158, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/1050', '127.0.0.1', '内网IP', '1050 ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-24 15:04:25', 7);
INSERT INTO `sys_oper_log` VALUES (159, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/1051', '127.0.0.1', '内网IP', '1051 ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-24 15:04:30', 7);
INSERT INTO `sys_oper_log` VALUES (160, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/1052', '127.0.0.1', '内网IP', '1052 ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-24 15:04:35', 15);
INSERT INTO `sys_oper_log` VALUES (161, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/1053', '127.0.0.1', '内网IP', '1053 ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-24 15:04:39', 8);
INSERT INTO `sys_oper_log` VALUES (162, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/1054', '127.0.0.1', '内网IP', '1054 ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-24 15:04:44', 7);
INSERT INTO `sys_oper_log` VALUES (163, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/1055', '127.0.0.1', '内网IP', '1055 ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-24 15:04:49', 8);
INSERT INTO `sys_oper_log` VALUES (164, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/1056', '127.0.0.1', '内网IP', '1056 ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-24 15:04:55', 8);
INSERT INTO `sys_oper_log` VALUES (165, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/110', '127.0.0.1', '内网IP', '110 ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-24 15:04:58', 11);
INSERT INTO `sys_oper_log` VALUES (166, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-24 15:34:34', 167);
INSERT INTO `sys_oper_log` VALUES (167, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.update()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/update', '127.0.0.1', '内网IP', '{\"id\":[\"\"],\"userName\":[\"若依\"],\"phonenumber\":[\"15888888888\"],\"email\":[\"ry@163.com\"],\"sex\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-24 15:34:40', 21);
INSERT INTO `sys_oper_log` VALUES (168, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"仪器预约\"],\"url\":[\"recommend\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-clock-o\"],\"visible\":[\"0\"],\"isRefresh\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-24 17:24:21', 105);
INSERT INTO `sys_oper_log` VALUES (169, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2018\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"仪器预约\"],\"url\":[\"/instrument/recommend\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-clock-o\"],\"visible\":[\"0\"],\"isRefresh\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-24 17:24:56', 9);
INSERT INTO `sys_oper_log` VALUES (170, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"仪器预警\"],\"url\":[\"/instrument/stat\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"5\"],\"icon\":[\"fa fa-warning\"],\"visible\":[\"0\"],\"isRefresh\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-24 17:26:20', 8);
INSERT INTO `sys_oper_log` VALUES (171, '仪器借用', 1, 'com.ruoyi.web.controller.instrument.SysInstrumentBorrowController.addSave()', 'POST', 1, 'admin', NULL, '/system/borrow/add', '127.0.0.1', '内网IP', '{\"instrumentId\":[\"1\"],\"planReturnTime\":[\"2026-04-26 17:50:19\"],\"remark\":[\"测试\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-24 17:52:32', 314);
INSERT INTO `sys_oper_log` VALUES (172, '借用审核', 2, 'com.ruoyi.web.controller.instrument.SysInstrumentBorrowController.auditSave()', 'POST', 1, 'admin', NULL, '/system/borrow/audit', '127.0.0.1', '内网IP', '{\"borrowId\":[\"12\"],\"status\":[\"1\"],\"auditRemark\":[\"pass\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-24 17:54:07', 4);
INSERT INTO `sys_oper_log` VALUES (173, '仪器管理', 2, 'com.ruoyi.web.controller.instrument.SysInstrumentController.editSave()', 'POST', 1, 'admin', NULL, '/system/instrument/edit', '127.0.0.1', '内网IP', '{\"instrumentId\":[\"1\"],\"instrumentName\":[\"电子分析天平\"],\"instrumentCode\":[\"INST-2023-001\"],\"deptId\":[\"101\"],\"status\":[\"0\"],\"specs\":[\"FA2004N\"],\"manufacturer\":[\"梅特勒-托利多\"],\"purchaseTime\":[\"2023-05-15\"],\"location\":[\"理学楼A座201室\"],\"remark\":[\"精度0.1mg，，，\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-24 17:54:56', 5);
INSERT INTO `sys_oper_log` VALUES (174, '仪器借用', 1, 'com.ruoyi.web.controller.instrument.SysInstrumentBorrowController.addSave()', 'POST', 1, 'admin', NULL, '/system/borrow/add', '127.0.0.1', '内网IP', '{\"instrumentId\":[\"2\"],\"planReturnTime\":[\"2026-04-24 19:55:02\"],\"remark\":[\"test\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-24 17:57:10', 309);
INSERT INTO `sys_oper_log` VALUES (175, '仪器借用', 1, 'com.ruoyi.web.controller.instrument.SysInstrumentBorrowController.addSave()', 'POST', 1, 'admin', NULL, '/system/borrow/add', '127.0.0.1', '内网IP', '{\"instrumentId\":[\"1\"],\"planReturnTime\":[\"2026-04-25 17:50:30\"],\"remark\":[\"提升为\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-24 17:57:36', 5);
INSERT INTO `sys_oper_log` VALUES (176, '借用审核', 2, 'com.ruoyi.web.controller.instrument.SysInstrumentBorrowController.auditSave()', 'POST', 1, 'admin', NULL, '/system/borrow/audit', '127.0.0.1', '内网IP', '{\"borrowId\":[\"14\"],\"status\":[\"3\"],\"auditRemark\":[\"test2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-24 18:00:44', 7);
INSERT INTO `sys_oper_log` VALUES (177, '仪器借用', 1, 'com.ruoyi.web.controller.instrument.SysInstrumentBorrowController.addSave()', 'POST', 1, 'admin', NULL, '/system/borrow/add', '127.0.0.1', '内网IP', '{\"instrumentId\":[\"1\"],\"planReturnTime\":[\"2026-04-27 13:45:03\"],\"remark\":[\"test\"]}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2026-04-24 18:06:09', 87);
INSERT INTO `sys_oper_log` VALUES (178, '仪器借用', 1, 'com.ruoyi.web.controller.instrument.SysInstrumentBorrowController.addSave()', 'POST', 1, 'admin', NULL, '/system/borrow/add', '127.0.0.1', '内网IP', '{\"instrumentId\":[\"1\"],\"planReturnTime\":[\"2026-04-24 18:09:46\"],\"remark\":[\"test\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-24 18:09:57', 9951);
INSERT INTO `sys_oper_log` VALUES (179, '仪器借用', 1, 'com.ruoyi.web.controller.instrument.SysInstrumentBorrowController.addSave()', 'POST', 1, 'admin', NULL, '/system/borrow/add', '127.0.0.1', '内网IP', '{\"instrumentId\":[\"1\"],\"planReturnTime\":[\"2026-04-24 18:10:38\"],\"remark\":[\"test\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-24 18:10:43', 102);
INSERT INTO `sys_oper_log` VALUES (180, '仪器借用', 1, 'com.ruoyi.web.controller.instrument.SysInstrumentBorrowController.addSave()', 'POST', 1, 'admin', NULL, '/system/borrow/add', '127.0.0.1', '内网IP', '{\"instrumentId\":[\"1\"],\"planReturnTime\":[\"2026-04-24 18:11:43\"],\"remark\":[\"test\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-24 18:12:02', 17973);
INSERT INTO `sys_oper_log` VALUES (181, '仪器借用', 1, 'com.ruoyi.web.controller.instrument.SysInstrumentBorrowController.addSave()', 'POST', 1, 'admin', NULL, '/system/borrow/add', '127.0.0.1', '内网IP', '{\"instrumentId\":[\"1\"],\"planReturnTime\":[\"2026-04-24 18:12:49\"],\"remark\":[\"他West\"]}', '{\"msg\":\"仪器已被借出\",\"code\":500}', 0, NULL, '2026-04-24 18:12:50', 96);
INSERT INTO `sys_oper_log` VALUES (182, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', NULL, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2019\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"仪器预警\"],\"url\":[\"/instrument/stat\"],\"target\":[\"menuItem\"],\"perms\":[\"instrument:state:view\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-warning\"],\"visible\":[\"0\"],\"isRefresh\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-24 19:53:39', 104);
INSERT INTO `sys_oper_log` VALUES (183, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', NULL, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2018\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"仪器预约\"],\"url\":[\"/instrument/recommend\"],\"target\":[\"menuItem\"],\"perms\":[\"instrument:recommend:view\"],\"orderNum\":[\"5\"],\"icon\":[\"fa fa-clock-o\"],\"visible\":[\"0\"],\"isRefresh\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-24 19:54:00', 8);
INSERT INTO `sys_oper_log` VALUES (184, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', NULL, '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2018\"],\"menuType\":[\"F\"],\"menuName\":[\"推荐刷新\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"instrument:recommend:refresh\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-24 19:54:37', 12);
INSERT INTO `sys_oper_log` VALUES (185, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', NULL, '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"2000,2001,2012,2019,2018,3,100,101,102,103,104,105,106,107,114,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2013,2014,2015,2016,2017,2020\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-24 19:55:01', 31);
INSERT INTO `sys_oper_log` VALUES (186, '借用审核', 2, 'com.ruoyi.web.controller.instrument.SysInstrumentBorrowController.auditSave()', 'POST', 1, 'user', '深圳总公司', '/system/borrow/audit', '127.0.0.1', '内网IP', '{\"borrowId\":[\"13\"],\"status\":[\"1\"],\"auditRemark\":[\"test\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-24 19:56:01', 6);
INSERT INTO `sys_oper_log` VALUES (187, '仪器归还', 2, 'com.ruoyi.web.controller.instrument.SysInstrumentBorrowController.returnBorrow()', 'POST', 1, 'user', NULL, '/system/borrow/return', '127.0.0.1', '内网IP', '{\"borrowId\":[\"13\"]}', '{\"msg\":\"请输入正确参数\",\"code\":500}', 0, NULL, '2026-04-24 20:14:51', 89);
INSERT INTO `sys_oper_log` VALUES (188, '仪器归还', 2, 'com.ruoyi.web.controller.instrument.SysInstrumentBorrowController.returnBorrow()', 'POST', 1, 'user', NULL, '/system/borrow/return', '127.0.0.1', '内网IP', '{\"borrowId\":[\"12\"]}', '{\"msg\":\"请输入正确参数\",\"code\":500}', 0, NULL, '2026-04-24 20:14:53', 6);
INSERT INTO `sys_oper_log` VALUES (189, '仪器归还', 2, 'com.ruoyi.web.controller.instrument.SysInstrumentBorrowController.returnBorrow()', 'POST', 1, 'user', NULL, '/system/borrow/return', '127.0.0.1', '内网IP', '{\"borrowId\":[\"13\"]}', '{\"msg\":\"请输入正确参数\",\"code\":500}', 0, NULL, '2026-04-24 20:14:57', 3);
INSERT INTO `sys_oper_log` VALUES (190, '仪器借用', 1, 'com.ruoyi.web.controller.instrument.SysInstrumentBorrowController.addSave()', 'POST', 1, 'user', NULL, '/system/borrow/add', '127.0.0.1', '内网IP', '{\"instrumentId\":[\"3\"],\"planReturnTime\":[\"2026-04-30 21:50:05\"],\"remark\":[\"test\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-24 20:15:12', 5);
INSERT INTO `sys_oper_log` VALUES (191, '借用审核', 2, 'com.ruoyi.web.controller.instrument.SysInstrumentBorrowController.auditSave()', 'POST', 1, 'user', NULL, '/system/borrow/audit', '127.0.0.1', '内网IP', '{\"borrowId\":[\"15\"],\"status\":[\"1\"],\"auditRemark\":[\"pass\"]}', '{\"msg\":\"无权限操作\",\"code\":500}', 0, NULL, '2026-04-24 20:15:19', 6);
INSERT INTO `sys_oper_log` VALUES (192, '仪器借用', 2, 'com.ruoyi.web.controller.instrument.SysInstrumentBorrowController.editSave()', 'POST', 1, 'user', NULL, '/system/borrow/edit', '127.0.0.1', '内网IP', '{\"borrowId\":[\"15\"],\"instrumentId\":[\"3\"],\"planReturnTime\":[\"Thu Apr 30 21:50:05 GMT+08:00 2026\"],\"remark\":[\"test\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-24 20:27:56', 96);
INSERT INTO `sys_oper_log` VALUES (193, '借用审核', 2, 'com.ruoyi.web.controller.instrument.SysInstrumentBorrowController.auditSave()', 'POST', 1, 'user', NULL, '/system/borrow/audit', '127.0.0.1', '内网IP', '{\"borrowId\":[\"15\"],\"status\":[\"1\"],\"auditRemark\":[\"他test\"]}', '{\"msg\":\"无权限操作\",\"code\":500}', 0, NULL, '2026-04-24 20:28:05', 6);
INSERT INTO `sys_oper_log` VALUES (194, '仪器借用', 1, 'com.ruoyi.web.controller.instrument.SysInstrumentBorrowController.addSave()', 'POST', 1, 'user', NULL, '/system/borrow/add', '127.0.0.1', '内网IP', '{\"instrumentId\":[\"5\"],\"planReturnTime\":[\"2026-04-28 13:45:16\"],\"remark\":[\"test\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-24 20:28:24', 13);
INSERT INTO `sys_oper_log` VALUES (195, '仪器借用', 3, 'com.ruoyi.web.controller.instrument.SysInstrumentBorrowController.remove()', 'POST', 1, 'user', NULL, '/system/borrow/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"11\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-24 20:29:25', 6);
INSERT INTO `sys_oper_log` VALUES (196, '仪器归还', 2, 'com.ruoyi.web.controller.instrument.SysInstrumentBorrowController.returnBorrow()', 'POST', 1, 'user', NULL, '/system/borrow/return', '127.0.0.1', '内网IP', '{\"borrowId\":[\"13\"]}', '{\"msg\":\"请输入正确参数\",\"code\":500}', 0, NULL, '2026-04-24 20:29:39', 4);
INSERT INTO `sys_oper_log` VALUES (197, '仪器归还', 2, 'com.ruoyi.web.controller.instrument.SysInstrumentBorrowController.returnBorrow()', 'POST', 1, 'user', NULL, '/system/borrow/return', '127.0.0.1', '内网IP', '{\"borrowId\":[\"12\"]}', '{\"msg\":\"请输入正确参数\",\"code\":500}', 0, NULL, '2026-04-24 20:29:40', 7);
INSERT INTO `sys_oper_log` VALUES (198, '仪器借用', 2, 'com.ruoyi.web.controller.instrument.SysInstrumentBorrowController.editSave()', 'POST', 1, 'user', NULL, '/system/borrow/edit', '127.0.0.1', '内网IP', '{\"borrowId\":[\"16\"],\"instrumentId\":[\"5\"],\"planReturnTime\":[\"Tue Apr 28 13:45:16 GMT+08:00 2026\"],\"remark\":[\"tested\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-24 20:30:16', 94);
INSERT INTO `sys_oper_log` VALUES (199, '仪器借用', 2, 'com.ruoyi.web.controller.instrument.SysInstrumentBorrowController.editSave()', 'POST', 1, 'user', NULL, '/system/borrow/edit', '127.0.0.1', '内网IP', '{\"borrowId\":[\"16\"],\"instrumentId\":[\"5\"],\"planReturnTime\":[\"2026-04-28 13:45:16\"],\"remark\":[\"日哇让娃娃人\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-24 20:33:36', 90);
INSERT INTO `sys_oper_log` VALUES (200, '仪器归还', 2, 'com.ruoyi.web.controller.instrument.SysInstrumentBorrowController.returnBorrow()', 'POST', 1, 'user', NULL, '/system/borrow/return', '127.0.0.1', '内网IP', '{\"borrowId\":[\"13\"]}', '{\"msg\":\"请输入正确参数\",\"code\":500}', 0, NULL, '2026-04-24 20:33:49', 4);
INSERT INTO `sys_oper_log` VALUES (201, '借用审核', 2, 'com.ruoyi.web.controller.instrument.SysInstrumentBorrowController.auditSave()', 'POST', 1, 'user', NULL, '/system/borrow/audit', '127.0.0.1', '内网IP', '{\"borrowId\":[\"16\"],\"status\":[\"1\"],\"auditRemark\":[\"微软\"]}', '{\"msg\":\"无权限操作\",\"code\":500}', 0, NULL, '2026-04-24 20:33:59', 6);
INSERT INTO `sys_oper_log` VALUES (202, '仪器借用', 1, 'com.ruoyi.web.controller.instrument.SysInstrumentBorrowController.addSave()', 'POST', 1, 'user', NULL, '/system/borrow/add', '127.0.0.1', '内网IP', '{\"instrumentId\":[\"6\"],\"planReturnTime\":[\"\"],\"remark\":[\"哈哈哈\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'plan_return_time\' doesn\'t have a default value\r\n### The error may exist in file [D:\\IdeaProjects\\Instrument-Management\\RuoYi\\instrument-manage\\target\\classes\\mapper\\SysInstrumentBorrowMapper.xml]\r\n### The error may involve com.cui.mapper.SysInstrumentBorrowMapper.insertBorrow-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_instrument_borrow          ( instrument_id,             user_id,             user_name,                          status,             create_by,             remark )           values ( ?,             ?,             ?,                          ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'plan_return_time\' doesn\'t have a default value\n; Field \'plan_return_time\' doesn\'t have a default value', '2026-04-24 20:35:47', 193);
INSERT INTO `sys_oper_log` VALUES (203, '仪器借用', 1, 'com.ruoyi.web.controller.instrument.SysInstrumentBorrowController.addSave()', 'POST', 1, 'user', NULL, '/system/borrow/add', '127.0.0.1', '内网IP', '{\"instrumentId\":[\"6\"],\"planReturnTime\":[\"2026-04-28 17:35:43\"],\"remark\":[\"哈哈哈\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-24 20:36:03', 9);
INSERT INTO `sys_oper_log` VALUES (204, '仪器管理', 2, 'com.ruoyi.web.controller.instrument.SysInstrumentController.editSave()', 'POST', 1, 'user', '深圳总公司', '/system/instrument/edit', '127.0.0.1', '内网IP', '{\"instrumentId\":[\"1\"],\"instrumentName\":[\"电子分析天平\"],\"instrumentCode\":[\"INST-2023-001\"],\"deptId\":[\"101\"],\"status\":[\"0\"],\"specs\":[\"FA2004N\"],\"manufacturer\":[\"梅特勒-托利多\"],\"purchaseTime\":[\"2023-05-15\"],\"location\":[\"理学楼A座201室\"],\"remark\":[\"问题儿童set\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-24 20:42:20', 95);
INSERT INTO `sys_oper_log` VALUES (205, '仪器管理', 1, 'com.ruoyi.web.controller.instrument.SysInstrumentController.addSave()', 'POST', 1, 'user', '深圳总公司', '/system/instrument/add', '127.0.0.1', '内网IP', '{\"instrumentName\":[\"电子分析天平\"],\"instrumentCode\":[\"12345\"],\"deptId\":[\"101\"],\"status\":[\"0\"],\"specs\":[\"FA2004N\"],\"manufacturer\":[\"梅特勒-托利多\"],\"purchaseTime\":[\"2026-04-23\"],\"location\":[\"逸夫楼D203\"],\"remark\":[\"test\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-04-24 20:42:44', 6);
INSERT INTO `sys_oper_log` VALUES (206, '重置密码', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwdSave()', 'POST', 1, 'admin', '研发部门', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"userId\":[\"100\"],\"loginName\":[\"user\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-05-08 23:17:59', 160);
INSERT INTO `sys_oper_log` VALUES (207, '仪器管理', 2, 'com.ruoyi.web.controller.instrument.SysInstrumentController.editSave()', 'POST', 1, 'user', '深圳总公司', '/system/instrument/edit', '127.0.0.1', '内网IP', '{\"instrumentId\":[\"1\"],\"instrumentName\":[\"电子分析天平\"],\"instrumentCode\":[\"INST-2023-001\"],\"deptId\":[\"101\"],\"status\":[\"2\"],\"specs\":[\"FA2004N\"],\"manufacturer\":[\"梅特勒-托利多\"],\"purchaseTime\":[\"2023-05-15\"],\"location\":[\"理学楼A座201室\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-05-08 23:37:25', 31);
INSERT INTO `sys_oper_log` VALUES (208, '仪器管理', 2, 'com.ruoyi.web.controller.instrument.SysInstrumentController.editSave()', 'POST', 1, 'user', '深圳总公司', '/system/instrument/edit', '127.0.0.1', '内网IP', '{\"instrumentId\":[\"3\"],\"instrumentName\":[\"恒温水浴锅\"],\"instrumentCode\":[\"INST-2023-003\"],\"deptId\":[\"\"],\"status\":[\"1\"],\"specs\":[\"HH-4\"],\"manufacturer\":[\"金坛大地\"],\"purchaseTime\":[\"2022-09-10\"],\"location\":[\"工学楼B座305室\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-05-08 23:37:32', 11);
INSERT INTO `sys_oper_log` VALUES (209, '仪器管理', 2, 'com.ruoyi.web.controller.instrument.SysInstrumentController.editSave()', 'POST', 1, 'user', '深圳总公司', '/system/instrument/edit', '127.0.0.1', '内网IP', '{\"instrumentId\":[\"5\"],\"instrumentName\":[\"紫外可见分光光度计\"],\"instrumentCode\":[\"INST-2023-005\"],\"deptId\":[\"101\"],\"status\":[\"3\"],\"specs\":[\"UV-1800\"],\"manufacturer\":[\"岛津\"],\"purchaseTime\":[\"2023-03-01\"],\"location\":[\"理学楼A座203室\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-05-08 23:37:38', 15);
INSERT INTO `sys_oper_log` VALUES (210, '仪器维修', 1, 'com.ruoyi.web.controller.instrument.SysInstrumentRepairController.addSave()', 'POST', 1, 'user', '深圳总公司', '/system/repair/add', '127.0.0.1', '内网IP', '{\"instrumentId\":[\"1\"],\"repairReason\":[\"TEST\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-05-08 23:38:07', 15);
INSERT INTO `sys_oper_log` VALUES (211, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.update()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/update', '127.0.0.1', '内网IP', '{\"id\":[\"\"],\"userName\":[\"cui\"],\"phonenumber\":[\"15888888888\"],\"email\":[\"ry@163.com\"],\"sex\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-05-09 09:49:45', 101);

-- ----------------------------
-- Table structure for sys_notice_read
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice_read`;
CREATE TABLE `sys_notice_read`  (
  `read_id` bigint NOT NULL AUTO_INCREMENT COMMENT '已读主键',
  `notice_id` int NOT NULL COMMENT '公告id',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `read_time` datetime NOT NULL COMMENT '阅读时间',
  PRIMARY KEY (`read_id`) USING BTREE,
  UNIQUE INDEX `uk_user_notice`(`user_id` ASC, `notice_id` ASC) USING BTREE COMMENT '同一用户同一公告只记录一次'
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '公告已读记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice_read
-- ----------------------------
INSERT INTO `sys_notice_read` VALUES (1, 3, 1, '2026-03-23 20:08:01');
INSERT INTO `sys_notice_read` VALUES (2, 2, 1, '2026-03-23 20:08:01');
INSERT INTO `sys_notice_read` VALUES (3, 1, 1, '2026-03-23 20:08:01');
INSERT INTO `sys_notice_read` VALUES (4, 3, 100, '2026-03-25 19:40:14');
INSERT INTO `sys_notice_read` VALUES (5, 2, 100, '2026-03-25 19:40:14');
INSERT INTO `sys_notice_read` VALUES (6, 1, 100, '2026-03-25 19:40:14');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2026-03-21 10:45:01', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2026-03-21 10:45:01', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (3, '若依开源框架介绍', '1', 0x3C703E3C7370616E207374796C653D22636F6C6F723A20726762283233302C20302C2030293B223EE9A1B9E79BAEE4BB8BE7BB8D3C2F7370616E3E3C2F703E3C703E3C666F6E7420636F6C6F723D2223333333333333223E52756F5969E5BC80E6BA90E9A1B9E79BAEE698AFE4B8BAE4BC81E4B89AE794A8E688B7E5AE9AE588B6E79A84E5908EE58FB0E8849AE6898BE69EB6E6A186E69EB6EFBC8CE4B8BAE4BC81E4B89AE68993E980A0E79A84E4B880E7AB99E5BC8FE8A7A3E586B3E696B9E6A188EFBC8CE9998DE4BD8EE4BC81E4B89AE5BC80E58F91E68890E69CACEFBC8CE68F90E58D87E5BC80E58F91E69588E78E87E38082E4B8BBE8A681E58C85E68BACE794A8E688B7E7AEA1E79086E38081E8A792E889B2E7AEA1E79086E38081E983A8E997A8E7AEA1E79086E38081E88F9CE58D95E7AEA1E79086E38081E58F82E695B0E7AEA1E79086E38081E5AD97E585B8E7AEA1E79086E380813C2F666F6E743E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE5B297E4BD8DE7AEA1E790863C2F7370616E3E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE38081E5AE9AE697B6E4BBBBE58AA13C2F7370616E3E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE380813C2F7370616E3E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE69C8DE58AA1E79B91E68EA7E38081E799BBE5BD95E697A5E5BF97E38081E6938DE4BD9CE697A5E5BF97E38081E4BBA3E7A081E7949FE68890E7AD89E58A9FE883BDE38082E585B6E4B8ADEFBC8CE8BF98E694AFE68C81E5A49AE695B0E68DAEE6BA90E38081E695B0E68DAEE69D83E99990E38081E59BBDE99985E58C96E380815265646973E7BC93E5AD98E38081446F636B6572E983A8E7BDB2E38081E6BB91E58AA8E9AA8CE8AF81E7A081E38081E7ACACE4B889E696B9E8AEA4E8AF81E799BBE5BD95E38081E58886E5B883E5BC8FE4BA8BE58AA1E380813C2F7370616E3E3C666F6E7420636F6C6F723D2223333333333333223EE58886E5B883E5BC8FE69687E4BBB6E5AD98E582A83C2F666F6E743E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE38081E58886E5BA93E58886E8A1A8E5A484E79086E7AD89E68A80E69CAFE789B9E782B9E380823C2F7370616E3E3C2F703E3C703E3C696D67207372633D2268747470733A2F2F666F727564612E67697465652E636F6D2F696D616765732F313730353033303538333937373430313635312F35656435646236615F313135313030342E706E6722207374796C653D2277696474683A20363470783B223E3C62723E3C2F703E3C703E3C7370616E207374796C653D22636F6C6F723A20726762283233302C20302C2030293B223EE5AE98E7BD91E58F8AE6BC94E7A4BA3C2F7370616E3E3C2F703E3C703E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE88BA5E4BE9DE5AE98E7BD91E59CB0E59D80EFBC9A266E6273703B3C2F7370616E3E3C6120687265663D22687474703A2F2F72756F79692E76697022207461726765743D225F626C616E6B223E687474703A2F2F72756F79692E7669703C2F613E3C6120687265663D22687474703A2F2F72756F79692E76697022207461726765743D225F626C616E6B223E3C2F613E3C2F703E3C703E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE88BA5E4BE9DE69687E6A1A3E59CB0E59D80EFBC9A266E6273703B3C2F7370616E3E3C6120687265663D22687474703A2F2F646F632E72756F79692E76697022207461726765743D225F626C616E6B223E687474703A2F2F646F632E72756F79692E7669703C2F613E3C62723E3C2F703E3C703E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE6BC94E7A4BAE59CB0E59D80E38090E4B88DE58886E7A6BBE78988E38091EFBC9A266E6273703B3C2F7370616E3E3C6120687265663D22687474703A2F2F64656D6F2E72756F79692E76697022207461726765743D225F626C616E6B223E687474703A2F2F64656D6F2E72756F79692E7669703C2F613E3C2F703E3C703E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE6BC94E7A4BAE59CB0E59D80E38090E58886E7A6BBE78988E69CACE38091EFBC9A266E6273703B3C2F7370616E3E3C6120687265663D22687474703A2F2F7675652E72756F79692E76697022207461726765743D225F626C616E6B223E687474703A2F2F7675652E72756F79692E7669703C2F613E3C2F703E3C703E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE6BC94E7A4BAE59CB0E59D80E38090E5BEAEE69C8DE58AA1E78988E38091EFBC9A266E6273703B3C2F7370616E3E3C6120687265663D22687474703A2F2F636C6F75642E72756F79692E76697022207461726765743D225F626C616E6B223E687474703A2F2F636C6F75642E72756F79692E7669703C2F613E3C2F703E3C703E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE6BC94E7A4BAE59CB0E59D80E38090E7A7BBE58AA8E7ABAFE78988E38091EFBC9A266E6273703B3C2F7370616E3E3C6120687265663D22687474703A2F2F68352E72756F79692E76697022207461726765743D225F626C616E6B223E687474703A2F2F68352E72756F79692E7669703C2F613E3C2F703E3C703E3C6272207374796C653D22636F6C6F723A207267622834382C2034392C203531293B20666F6E742D66616D696C793A202671756F743B48656C766574696361204E6575652671756F743B2C2048656C7665746963612C20417269616C2C2073616E732D73657269663B20666F6E742D73697A653A20313270783B223E3C2F703E, '0', 'admin', '2026-03-21 10:45:01', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `is_refresh` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否刷新（0刷新 1不刷新）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2021 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 8, '#', '', 'M', '0', '1', '', 'fa fa-gear', 'admin', '2026-03-21 10:45:00', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 7, '#', '', 'M', '0', '1', '', 'fa fa-video-camera', 'admin', '2026-03-21 10:45:00', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 6, '#', '', 'M', '0', '1', '', 'fa fa-bars', 'admin', '2026-03-21 10:45:00', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, '/system/user', '', 'C', '0', '1', 'system:user:view', 'fa fa-user-o', 'admin', '2026-03-21 10:45:00', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, '/system/role', '', 'C', '0', '1', 'system:role:view', 'fa fa-user-secret', 'admin', '2026-03-21 10:45:00', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, '/system/menu', '', 'C', '0', '1', 'system:menu:view', 'fa fa-th-list', 'admin', '2026-03-21 10:45:00', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, '/system/dept', '', 'C', '0', '1', 'system:dept:view', 'fa fa-outdent', 'admin', '2026-03-21 10:45:00', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, '/system/post', '', 'C', '0', '1', 'system:post:view', 'fa fa-address-card-o', 'admin', '2026-03-21 10:45:00', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, '/system/dict', '', 'C', '0', '1', 'system:dict:view', 'fa fa-bookmark-o', 'admin', '2026-03-21 10:45:00', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, '/system/config', '', 'C', '0', '1', 'system:config:view', 'fa fa-sun-o', 'admin', '2026-03-21 10:45:00', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, '/system/notice', '', 'C', '0', '1', 'system:notice:view', 'fa fa-bullhorn', 'admin', '2026-03-21 10:45:00', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, '#', '', 'M', '0', '1', '', 'fa fa-pencil-square-o', 'admin', '2026-03-21 10:45:00', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, '/monitor/online', '', 'C', '0', '1', 'monitor:online:view', 'fa fa-user-circle', 'admin', '2026-03-21 10:45:00', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, '/monitor/data', '', 'C', '0', '1', 'monitor:data:view', 'fa fa-bug', 'admin', '2026-03-21 10:45:00', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, '/monitor/server', '', 'C', '0', '1', 'monitor:server:view', 'fa fa-server', 'admin', '2026-03-21 10:45:00', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, '/monitor/cache', '', 'C', '0', '1', 'monitor:cache:view', 'fa fa-cube', 'admin', '2026-03-21 10:45:00', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, '/tool/build', '', 'C', '0', '1', 'tool:build:view', 'fa fa-wpforms', 'admin', '2026-03-21 10:45:00', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, '/tool/swagger', '', 'C', '0', '1', 'tool:swagger:view', 'fa fa-gg', 'admin', '2026-03-21 10:45:00', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, '/monitor/operlog', '', 'C', '0', '1', 'monitor:operlog:view', 'fa fa-address-book', 'admin', '2026-03-21 10:45:00', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, '/monitor/logininfor', '', 'C', '0', '1', 'monitor:logininfor:view', 'fa fa-file-image-o', 'admin', '2026-03-21 10:45:00', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '#', '', 'F', '0', '1', 'system:user:list', '#', 'admin', '2026-03-21 10:45:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '#', '', 'F', '0', '1', 'system:user:add', '#', 'admin', '2026-03-21 10:45:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '#', '', 'F', '0', '1', 'system:user:edit', '#', 'admin', '2026-03-21 10:45:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '#', '', 'F', '0', '1', 'system:user:remove', '#', 'admin', '2026-03-21 10:45:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '#', '', 'F', '0', '1', 'system:user:export', '#', 'admin', '2026-03-21 10:45:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '#', '', 'F', '0', '1', 'system:user:import', '#', 'admin', '2026-03-21 10:45:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '#', '', 'F', '0', '1', 'system:user:resetPwd', '#', 'admin', '2026-03-21 10:45:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '#', '', 'F', '0', '1', 'system:role:list', '#', 'admin', '2026-03-21 10:45:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '#', '', 'F', '0', '1', 'system:role:add', '#', 'admin', '2026-03-21 10:45:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '#', '', 'F', '0', '1', 'system:role:edit', '#', 'admin', '2026-03-21 10:45:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '#', '', 'F', '0', '1', 'system:role:remove', '#', 'admin', '2026-03-21 10:45:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '#', '', 'F', '0', '1', 'system:role:export', '#', 'admin', '2026-03-21 10:45:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '#', '', 'F', '0', '1', 'system:menu:list', '#', 'admin', '2026-03-21 10:45:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '#', '', 'F', '0', '1', 'system:menu:add', '#', 'admin', '2026-03-21 10:45:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '#', '', 'F', '0', '1', 'system:menu:edit', '#', 'admin', '2026-03-21 10:45:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '#', '', 'F', '0', '1', 'system:menu:remove', '#', 'admin', '2026-03-21 10:45:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '#', '', 'F', '0', '1', 'system:dept:list', '#', 'admin', '2026-03-21 10:45:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '#', '', 'F', '0', '1', 'system:dept:add', '#', 'admin', '2026-03-21 10:45:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '#', '', 'F', '0', '1', 'system:dept:edit', '#', 'admin', '2026-03-21 10:45:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '#', '', 'F', '0', '1', 'system:dept:remove', '#', 'admin', '2026-03-21 10:45:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '#', '', 'F', '0', '1', 'system:post:list', '#', 'admin', '2026-03-21 10:45:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '#', '', 'F', '0', '1', 'system:post:add', '#', 'admin', '2026-03-21 10:45:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '#', '', 'F', '0', '1', 'system:post:edit', '#', 'admin', '2026-03-21 10:45:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '#', '', 'F', '0', '1', 'system:post:remove', '#', 'admin', '2026-03-21 10:45:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '#', '', 'F', '0', '1', 'system:post:export', '#', 'admin', '2026-03-21 10:45:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', 'F', '0', '1', 'system:dict:list', '#', 'admin', '2026-03-21 10:45:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', 'F', '0', '1', 'system:dict:add', '#', 'admin', '2026-03-21 10:45:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', 'F', '0', '1', 'system:dict:edit', '#', 'admin', '2026-03-21 10:45:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', 'F', '0', '1', 'system:dict:remove', '#', 'admin', '2026-03-21 10:45:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', 'F', '0', '1', 'system:dict:export', '#', 'admin', '2026-03-21 10:45:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', 'F', '0', '1', 'system:config:list', '#', 'admin', '2026-03-21 10:45:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', 'F', '0', '1', 'system:config:add', '#', 'admin', '2026-03-21 10:45:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', 'F', '0', '1', 'system:config:edit', '#', 'admin', '2026-03-21 10:45:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', 'F', '0', '1', 'system:config:remove', '#', 'admin', '2026-03-21 10:45:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', 'F', '0', '1', 'system:config:export', '#', 'admin', '2026-03-21 10:45:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', 'F', '0', '1', 'system:notice:list', '#', 'admin', '2026-03-21 10:45:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', 'F', '0', '1', 'system:notice:add', '#', 'admin', '2026-03-21 10:45:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', 'F', '0', '1', 'system:notice:edit', '#', 'admin', '2026-03-21 10:45:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', 'F', '0', '1', 'system:notice:remove', '#', 'admin', '2026-03-21 10:45:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', 'F', '0', '1', 'monitor:operlog:list', '#', 'admin', '2026-03-21 10:45:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', 'F', '0', '1', 'monitor:operlog:remove', '#', 'admin', '2026-03-21 10:45:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '详细信息', 500, 3, '#', '', 'F', '0', '1', 'monitor:operlog:detail', '#', 'admin', '2026-03-21 10:45:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', 'F', '0', '1', 'monitor:operlog:export', '#', 'admin', '2026-03-21 10:45:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', 'F', '0', '1', 'monitor:logininfor:list', '#', 'admin', '2026-03-21 10:45:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', 'F', '0', '1', 'monitor:logininfor:remove', '#', 'admin', '2026-03-21 10:45:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', 'F', '0', '1', 'monitor:logininfor:export', '#', 'admin', '2026-03-21 10:45:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '账户解锁', 501, 4, '#', '', 'F', '0', '1', 'monitor:logininfor:unlock', '#', 'admin', '2026-03-21 10:45:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '在线查询', 109, 1, '#', '', 'F', '0', '1', 'monitor:online:list', '#', 'admin', '2026-03-21 10:45:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '批量强退', 109, 2, '#', '', 'F', '0', '1', 'monitor:online:batchForceLogout', '#', 'admin', '2026-03-21 10:45:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '单条强退', 109, 3, '#', '', 'F', '0', '1', 'monitor:online:forceLogout', '#', 'admin', '2026-03-21 10:45:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '仪器管理', 0, 1, 'system/instrument', 'menuItem', 'C', '0', '0', 'system:instrument:view', 'fa fa-balance-scale', 'admin', '2026-03-23 17:42:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2001, '仪器借用', 0, 2, 'system/borrow', 'menuItem', 'C', '0', '0', 'system:borrow:view', 'fa fa-sitemap', 'admin', '2026-03-23 19:57:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2002, '查询仪器', 2000, 1, '#', 'menuItem', 'F', '0', '1', 'system:instrument:list', '#', 'admin', '2026-03-23 19:57:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, '新增仪器', 2000, 2, '#', 'menuItem', 'F', '0', '1', 'system:instrument:add', '#', 'admin', '2026-03-23 19:58:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, '修改仪器', 2000, 3, '#', 'menuItem', 'F', '0', '1', 'system:instrument:edit', '#', 'admin', '2026-03-23 19:58:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '删除仪器', 2000, 4, '#', 'menuItem', 'F', '0', '1', 'system:instrument:remove', '#', 'admin', '2026-03-23 19:59:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '查询', 2001, 1, '#', 'menuItem', 'F', '0', '1', 'system:borrow:list', '#', 'admin', '2026-03-23 20:10:50', 'admin', '2026-03-25 20:19:48', '');
INSERT INTO `sys_menu` VALUES (2007, '新增', 2001, 2, '#', 'menuItem', 'F', '0', '1', 'system:borrow:add', '#', 'admin', '2026-03-23 20:11:09', 'admin', '2026-03-25 20:19:53', '');
INSERT INTO `sys_menu` VALUES (2008, '修改', 2001, 3, '#', 'menuItem', 'F', '0', '1', 'system:borrow:edit', '#', 'admin', '2026-03-23 20:11:32', 'admin', '2026-03-25 20:19:59', '');
INSERT INTO `sys_menu` VALUES (2009, '删除', 2001, 4, '#', 'menuItem', 'F', '0', '1', 'system:borrow:remove', '#', 'admin', '2026-03-23 20:11:52', 'admin', '2026-03-25 20:20:09', '');
INSERT INTO `sys_menu` VALUES (2010, '审核', 2001, 5, '#', 'menuItem', 'F', '0', '1', 'system:borrow:audit', '#', 'admin', '2026-03-23 20:12:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, '归还', 2001, 6, '#', 'menuItem', 'F', '0', '1', 'system:borrow:return', '#', 'admin', '2026-03-23 20:12:24', 'admin', '2026-03-25 20:20:17', '');
INSERT INTO `sys_menu` VALUES (2012, '仪器维修', 0, 3, 'system/repair', 'menuItem', 'C', '0', '0', 'system:repair:view', 'fa fa-gavel', 'admin', '2026-03-23 20:19:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2013, '查询', 2012, 1, '#', 'menuItem', 'F', '0', '1', 'system:repair:list', '#', 'admin', '2026-03-23 20:20:44', 'admin', '2026-03-25 20:20:31', '');
INSERT INTO `sys_menu` VALUES (2014, '新增', 2012, 2, '#', 'menuItem', 'F', '0', '1', 'system:repair:add', '#', 'admin', '2026-03-23 20:20:57', 'admin', '2026-03-25 20:20:35', '');
INSERT INTO `sys_menu` VALUES (2015, '修改', 2012, 3, '#', 'menuItem', 'F', '0', '1', 'system:repair:edit', '#', 'admin', '2026-03-23 20:21:12', 'admin', '2026-03-25 20:20:40', '');
INSERT INTO `sys_menu` VALUES (2016, '删除', 2012, 4, '#', 'menuItem', 'F', '0', '1', 'system:repair:remove', '#', 'admin', '2026-03-23 20:21:28', 'admin', '2026-03-25 20:20:44', '');
INSERT INTO `sys_menu` VALUES (2017, '处理', 2012, 5, '#', 'menuItem', 'F', '0', '1', 'system:repair:handle', '#', 'admin', '2026-03-23 20:21:40', 'admin', '2026-03-25 20:20:48', '');
INSERT INTO `sys_menu` VALUES (2018, '仪器预约', 0, 5, '/instrument/recommend', 'menuItem', 'C', '0', '0', 'instrument:recommend:view', 'fa fa-clock-o', 'admin', '2026-04-24 17:24:21', 'admin', '2026-04-24 19:54:00', '');
INSERT INTO `sys_menu` VALUES (2019, '仪器预警', 0, 4, '/instrument/stat', 'menuItem', 'C', '0', '0', 'instrument:state:view', 'fa fa-warning', 'admin', '2026-04-24 17:26:20', 'admin', '2026-04-24 19:53:39', '');
INSERT INTO `sys_menu` VALUES (2020, '推荐刷新', 2018, 1, '#', 'menuItem', 'F', '0', '1', 'instrument:recommend:refresh', '#', 'admin', '2026-04-24 19:54:37', '', NULL, '');

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 167 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-03-21 10:47:33');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-03-23 17:40:49');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-03-23 19:53:58');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-03-24 19:27:31');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-03-25 19:30:40');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '退出成功', '2026-03-25 19:33:33');
INSERT INTO `sys_logininfor` VALUES (106, 'ry', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-03-25 19:33:37');
INSERT INTO `sys_logininfor` VALUES (107, 'ry', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '退出成功', '2026-03-25 19:34:32');
INSERT INTO `sys_logininfor` VALUES (108, 'user', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '1', '用户不存在/密码错误', '2026-03-25 19:34:40');
INSERT INTO `sys_logininfor` VALUES (109, 'user', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-03-25 19:34:46');
INSERT INTO `sys_logininfor` VALUES (110, 'user', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '退出成功', '2026-03-25 19:35:46');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-03-25 19:35:49');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '退出成功', '2026-03-25 19:39:47');
INSERT INTO `sys_logininfor` VALUES (113, 'user', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-03-25 19:39:54');
INSERT INTO `sys_logininfor` VALUES (114, 'user', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '退出成功', '2026-03-25 19:49:14');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-03-25 19:49:17');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '退出成功', '2026-03-25 19:51:43');
INSERT INTO `sys_logininfor` VALUES (117, 'user', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '1', '密码输入错误1次', '2026-03-25 19:51:48');
INSERT INTO `sys_logininfor` VALUES (118, 'user', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '1', '密码输入错误2次', '2026-03-25 19:51:53');
INSERT INTO `sys_logininfor` VALUES (119, 'user', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-03-25 19:52:00');
INSERT INTO `sys_logininfor` VALUES (120, 'user', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '退出成功', '2026-03-25 19:52:14');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-03-25 19:52:19');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '退出成功', '2026-03-25 19:54:03');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-03-25 19:54:08');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '退出成功', '2026-03-25 19:54:21');
INSERT INTO `sys_logininfor` VALUES (125, 'user', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-03-25 19:54:29');
INSERT INTO `sys_logininfor` VALUES (126, 'user', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '退出成功', '2026-03-25 20:02:58');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-03-25 20:03:02');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '退出成功', '2026-03-25 20:07:01');
INSERT INTO `sys_logininfor` VALUES (129, 'user', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '1', '密码输入错误1次', '2026-03-25 20:07:07');
INSERT INTO `sys_logininfor` VALUES (130, 'user', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-03-25 20:07:14');
INSERT INTO `sys_logininfor` VALUES (131, 'user', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '退出成功', '2026-03-25 20:07:52');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-03-25 20:07:56');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '退出成功', '2026-03-25 20:09:02');
INSERT INTO `sys_logininfor` VALUES (134, 'user', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-03-25 20:09:11');
INSERT INTO `sys_logininfor` VALUES (135, 'user', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '退出成功', '2026-03-25 20:13:02');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-03-25 20:13:09');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '退出成功', '2026-03-25 20:20:55');
INSERT INTO `sys_logininfor` VALUES (138, 'user', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-03-25 20:21:01');
INSERT INTO `sys_logininfor` VALUES (139, 'user', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '退出成功', '2026-03-25 20:21:10');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-03-25 20:21:13');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-04-24 14:57:46');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '退出成功', '2026-04-24 15:30:00');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-04-24 15:30:05');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '退出成功', '2026-04-24 15:34:05');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-04-24 15:34:08');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '退出成功', '2026-04-24 15:37:33');
INSERT INTO `sys_logininfor` VALUES (147, 'user', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-04-24 15:37:40');
INSERT INTO `sys_logininfor` VALUES (148, 'user', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '退出成功', '2026-04-24 15:38:31');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-04-24 15:38:35');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-04-24 17:22:12');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-04-24 18:59:07');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '退出成功', '2026-04-24 19:55:08');
INSERT INTO `sys_logininfor` VALUES (153, 'user', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '1', '密码输入错误1次', '2026-04-24 19:55:15');
INSERT INTO `sys_logininfor` VALUES (154, 'user', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-04-24 19:55:21');
INSERT INTO `sys_logininfor` VALUES (155, 'user', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '退出成功', '2026-04-24 20:42:08');
INSERT INTO `sys_logininfor` VALUES (156, 'user', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-04-24 20:42:13');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-05-08 15:01:30');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-05-08 23:13:10');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '退出成功', '2026-05-08 23:14:47');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-05-08 23:17:25');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '退出成功', '2026-05-08 23:18:02');
INSERT INTO `sys_logininfor` VALUES (162, 'uers', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '1', '用户不存在/密码错误', '2026-05-08 23:18:24');
INSERT INTO `sys_logininfor` VALUES (163, 'user', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-05-08 23:18:45');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-05-09 09:13:57');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-05-09 09:44:27');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-05-11 10:59:16');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '异常信息',
  `start_time` datetime NULL DEFAULT NULL COMMENT '执行开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '执行结束时间',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2026-03-21 10:45:01', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2026-03-21 10:45:01', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2026-03-21 10:45:01', '', NULL, '');

-- ----------------------------
-- Table structure for sys_instrument_warn_rule
-- ----------------------------
DROP TABLE IF EXISTS `sys_instrument_warn_rule`;
CREATE TABLE `sys_instrument_warn_rule`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `instrument_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '仪器编号',
  `warn_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '预警类型',
  `warn_level` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '预警级别',
  `threshold_upper` decimal(10, 2) NULL DEFAULT NULL COMMENT '预警阈值上限',
  `threshold_lower` decimal(10, 2) NULL DEFAULT NULL COMMENT '预警阈值下限',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '1' COMMENT '规则状态（0：禁用，1：启用）',
  `warn_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '预警规则描述',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_instrument_code`(`instrument_code` ASC) USING BTREE COMMENT '仪器编号索引'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '仪器预警规则表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_instrument_warn_rule
-- ----------------------------

-- ----------------------------
-- Table structure for sys_instrument_warn_record
-- ----------------------------
DROP TABLE IF EXISTS `sys_instrument_warn_record`;
CREATE TABLE `sys_instrument_warn_record`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `rule_id` bigint NOT NULL COMMENT '关联预警规则ID',
  `instrument_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '仪器编号',
  `warn_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '预警类型',
  `warn_level` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '预警级别',
  `trigger_value` decimal(10, 2) NULL DEFAULT NULL COMMENT '触发预警的实际值',
  `warn_content` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '预警内容',
  `handle_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '处理状态（0：未处理，1：已处理，2：已忽略）',
  `handle_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '处理人',
  `handle_time` datetime NULL DEFAULT NULL COMMENT '处理时间',
  `handle_remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '处理备注',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_rule_id`(`rule_id` ASC) USING BTREE COMMENT '规则ID索引',
  INDEX `idx_instrument_code`(`instrument_code` ASC) USING BTREE COMMENT '仪器编号索引',
  INDEX `idx_handle_status`(`handle_status` ASC) USING BTREE COMMENT '处理状态索引'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '仪器预警记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_instrument_warn_record
-- ----------------------------

-- ----------------------------
-- Table structure for sys_instrument_repair
-- ----------------------------
DROP TABLE IF EXISTS `sys_instrument_repair`;
CREATE TABLE `sys_instrument_repair`  (
  `repair_id` bigint NOT NULL AUTO_INCREMENT COMMENT '维修ID',
  `instrument_id` bigint NOT NULL COMMENT '仪器ID',
  `repair_reason` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '故障原因',
  `repair_time` datetime NULL DEFAULT NULL COMMENT '维修时间',
  `repair_result` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '维修结果',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '状态 0待维修 1维修中 2已修复 3无法修复',
  `cost` decimal(10, 2) NULL DEFAULT NULL COMMENT '维修费用',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '申报人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '申报时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`repair_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '仪器维修表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_instrument_repair
-- ----------------------------
INSERT INTO `sys_instrument_repair` VALUES (1, 1, 'TEST', NULL, NULL, '0', NULL, 'user', '2026-05-08 23:38:07', '', '', NULL);

-- ----------------------------
-- Table structure for sys_instrument_borrow
-- ----------------------------
DROP TABLE IF EXISTS `sys_instrument_borrow`;
CREATE TABLE `sys_instrument_borrow`  (
  `borrow_id` bigint NOT NULL AUTO_INCREMENT COMMENT '借用ID',
  `instrument_id` bigint NOT NULL COMMENT '仪器ID',
  `user_id` bigint NOT NULL COMMENT '借用人ID',
  `user_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '借用人姓名',
  `borrow_time` datetime NULL DEFAULT NULL COMMENT '实际借出时间',
  `plan_return_time` datetime NOT NULL COMMENT '计划归还时间',
  `return_time` datetime NULL DEFAULT NULL COMMENT '实际归还时间',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '状态 0申请中 1已借出 2已归还 3已驳回 4逾期',
  `audit_user_id` bigint NULL DEFAULT NULL COMMENT '审核人ID',
  `audit_remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '审核意见',
  `audit_time` datetime NULL DEFAULT NULL COMMENT '审核时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '申请时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  PRIMARY KEY (`borrow_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '仪器借用表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_instrument_borrow
-- ----------------------------
INSERT INTO `sys_instrument_borrow` VALUES (12, 1, 1, '若依', '2026-04-24 17:54:08', '2026-04-26 17:50:19', NULL, '1', 1, 'pass', '2026-04-24 17:54:08', '2026-04-24 17:52:32', 'admin', '2026-04-24 17:54:07', '测试', 'admin');
INSERT INTO `sys_instrument_borrow` VALUES (13, 2, 1, '若依', '2026-04-24 19:56:02', '2026-04-24 19:55:02', NULL, '1', 100, 'test', '2026-04-24 19:56:02', '2026-04-24 17:57:10', 'user', '2026-04-24 19:56:01', 'test', 'admin');
INSERT INTO `sys_instrument_borrow` VALUES (14, 1, 1, '若依', NULL, '2026-04-25 17:50:30', NULL, '3', 1, 'test2', '2026-04-24 18:00:45', '2026-04-24 17:57:36', 'admin', '2026-04-24 18:00:44', '提升为', 'admin');
INSERT INTO `sys_instrument_borrow` VALUES (15, 3, 100, 'user', NULL, '2026-04-30 21:50:05', NULL, '0', NULL, NULL, NULL, '2026-04-24 20:15:12', 'user', '2026-04-24 20:27:56', 'test', 'user');
INSERT INTO `sys_instrument_borrow` VALUES (16, 5, 100, 'user', NULL, '2026-04-28 13:45:16', NULL, '0', NULL, NULL, NULL, '2026-04-24 20:28:24', 'user', '2026-04-24 20:33:36', '日哇让娃娃人', 'user');
INSERT INTO `sys_instrument_borrow` VALUES (17, 6, 100, 'user', NULL, '2026-04-28 17:35:43', NULL, '0', NULL, NULL, NULL, '2026-04-24 20:36:03', '', NULL, '哈哈哈', 'user');

-- ----------------------------
-- Table structure for sys_instrument
-- ----------------------------
DROP TABLE IF EXISTS `sys_instrument`;
CREATE TABLE `sys_instrument`  (
  `instrument_id` bigint NOT NULL AUTO_INCREMENT COMMENT '仪器ID',
  `instrument_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '仪器名称',
  `instrument_code` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '仪器编号',
  `dept_id` bigint NOT NULL COMMENT '所属院系',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '状态 0正常 1维修 2报废 3停用',
  `purchase_time` date NULL DEFAULT NULL COMMENT '采购时间',
  `location` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '存放位置',
  `specs` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '规格型号',
  `manufacturer` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '生产厂家',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`instrument_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '仪器信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_instrument
-- ----------------------------
INSERT INTO `sys_instrument` VALUES (1, '电子分析天平', 'INST-2023-001', 101, '2', '2023-05-15', '理学楼A座201室', 'FA2004N', '梅特勒-托利多', 'admin', '2026-03-23 17:46:32', '', '2026-05-08 23:37:25', '');
INSERT INTO `sys_instrument` VALUES (2, 'pH计', 'INST-2023-002', 101, '0', '2023-06-20', '理学楼A座202室', 'PHS-3C', '上海雷磁', 'admin', '2026-03-23 17:46:32', '', NULL, '');
INSERT INTO `sys_instrument` VALUES (3, '恒温水浴锅', 'INST-2023-003', 102, '1', '2022-09-10', '工学楼B座305室', 'HH-4', '金坛大地', 'admin', '2026-03-23 17:46:32', '', '2026-05-08 23:37:32', '');
INSERT INTO `sys_instrument` VALUES (4, '高速离心机', 'INST-2023-004', 103, '1', '2021-11-05', '医学楼C座101室', 'TG16-WS', '湘仪', 'admin', '2026-03-23 17:46:32', '', NULL, '待更换转子');
INSERT INTO `sys_instrument` VALUES (5, '紫外可见分光光度计', 'INST-2023-005', 101, '3', '2023-03-01', '理学楼A座203室', 'UV-1800', '岛津', 'admin', '2026-03-23 17:46:32', '', '2026-05-08 23:37:38', '');
INSERT INTO `sys_instrument` VALUES (6, '电热鼓风干燥箱', 'INST-2023-006', 102, '0', '2022-04-18', '工学楼B座306室', 'DHG-9070A', '一恒', 'admin', '2026-03-23 17:46:32', '', NULL, '');
INSERT INTO `sys_instrument` VALUES (7, '光学显微镜', 'INST-2023-007', 103, '0', '2020-09-01', '医学楼C座102室', 'CX23', '奥林巴斯', 'admin', '2026-03-23 17:46:32', '', NULL, '');
INSERT INTO `sys_instrument` VALUES (8, '超声波清洗器', 'INST-2023-008', 101, '3', '2019-12-25', '理学楼A座204室', 'KQ-250DE', '昆山舒美', 'admin', '2026-03-23 17:46:32', '', NULL, '已停用');
INSERT INTO `sys_instrument` VALUES (9, '旋转蒸发仪', 'INST-2023-009', 101, '0', '2023-08-12', '理学楼A座205室', 'RE-52AA', '上海亚荣', 'admin', '2026-03-23 17:46:32', '', NULL, '');
INSERT INTO `sys_instrument` VALUES (10, '磁力搅拌器', 'INST-2023-010', 102, '0', '2023-01-08', '工学楼B座307室', '85-2', '司乐', 'admin', '2026-03-23 17:46:32', '', NULL, '');
INSERT INTO `sys_instrument` VALUES (11, '气相色谱仪', 'INST-2023-011', 101, '0', '2022-07-22', '理学楼A座301室', 'GC-2014C', '岛津', 'admin', '2026-03-23 17:46:32', '', NULL, '大型精密仪器');
INSERT INTO `sys_instrument` VALUES (12, '液相色谱仪', 'INST-2023-012', 101, '1', '2021-05-30', '理学楼A座302室', 'LC-16', '岛津', 'admin', '2026-03-23 17:46:32', '', NULL, '正在维修');
INSERT INTO `sys_instrument` VALUES (13, '原子吸收分光光度计', 'INST-2023-013', 101, '0', '2022-11-14', '理学楼A座303室', 'AA-6300C', '岛津', 'admin', '2026-03-23 17:46:32', '', NULL, '');
INSERT INTO `sys_instrument` VALUES (14, '箱式电阻炉', 'INST-2023-014', 102, '0', '2020-03-20', '工学楼B座401室', 'SX2-4-10', '上海意丰', 'admin', '2026-03-23 17:46:32', '', NULL, '马弗炉');
INSERT INTO `sys_instrument` VALUES (15, '电子万能试验机', 'INST-2023-015', 102, '0', '2021-08-09', '工学楼B座402室', 'WDW-10', '济南试金', 'admin', '2026-03-23 17:46:32', '', NULL, '10KN');
INSERT INTO `sys_instrument` VALUES (16, '激光粒度分析仪', 'INST-2023-016', 102, '2', '2018-06-01', '工学楼B座403室', 'Bettersize2000', '丹东百特', 'admin', '2026-03-23 17:46:32', '', NULL, '已报废');
INSERT INTO `sys_instrument` VALUES (17, '红外光谱仪', 'INST-2023-017', 101, '0', '2023-02-28', '理学楼A座304室', 'Nicolet iS5', '赛默飞', 'admin', '2026-03-23 17:46:32', '', NULL, '');
INSERT INTO `sys_instrument` VALUES (18, '荧光分光光度计', 'INST-2023-018', 101, '0', '2022-05-16', '理学楼A座305室', 'F-7000', '日立', 'admin', '2026-03-23 17:46:32', '', NULL, '');
INSERT INTO `sys_instrument` VALUES (19, '超纯水机', 'INST-2023-019', 101, '0', '2023-09-05', '理学楼A座101室', 'Milli-Q', '默克', 'admin', '2026-03-23 17:46:32', '', NULL, '');
INSERT INTO `sys_instrument` VALUES (20, '生化培养箱', 'INST-2023-020', 103, '0', '2022-03-15', '医学楼C座201室', 'SPX-250B-Z', '博迅', 'admin', '2026-03-23 17:46:32', '', NULL, '');
INSERT INTO `sys_instrument` VALUES (21, '霉菌培养箱', 'INST-2023-021', 103, '0', '2022-03-15', '医学楼C座202室', 'MJX-250B-Z', '博迅', 'admin', '2026-03-23 17:46:32', '', NULL, '');
INSERT INTO `sys_instrument` VALUES (22, '厌氧培养箱', 'INST-2023-022', 103, '1', '2020-10-20', '医学楼C座203室', 'YQX-II', '跃进', 'admin', '2026-03-23 17:46:32', '', NULL, '维修中');
INSERT INTO `sys_instrument` VALUES (23, 'PCR仪', 'INST-2023-023', 103, '0', '2023-04-01', '医学楼C座301室', 'ProFlex', 'ABI', 'admin', '2026-03-23 17:46:32', '', NULL, '');
INSERT INTO `sys_instrument` VALUES (24, '电泳仪', 'INST-2023-024', 103, '0', '2023-04-10', '医学楼C座302室', 'DYY-6C', '六一', 'admin', '2026-03-23 17:46:32', '', NULL, '');
INSERT INTO `sys_instrument` VALUES (25, '凝胶成像系统', 'INST-2023-025', 103, '0', '2023-07-07', '医学楼C座303室', 'ChemiDoc XRS+', 'Bio-Rad', 'admin', '2026-03-23 17:46:32', '', NULL, '');
INSERT INTO `sys_instrument` VALUES (26, '液氮罐', 'INST-2023-026', 103, '0', '2021-01-25', '医学楼C座103室', 'YDS-30', '金凤', 'admin', '2026-03-23 17:46:32', '', NULL, '');
INSERT INTO `sys_instrument` VALUES (27, 'CO2培养箱', 'INST-2023-027', 103, '0', '2022-12-01', '医学楼C座204室', 'HERAcell 150i', '赛默飞', 'admin', '2026-03-23 17:46:32', '', NULL, '');
INSERT INTO `sys_instrument` VALUES (28, '倒置显微镜', 'INST-2023-028', 103, '0', '2023-10-09', '医学楼C座205室', 'CKX53', '奥林巴斯', 'admin', '2026-03-23 17:46:32', '', NULL, '');
INSERT INTO `sys_instrument` VALUES (29, '三目生物显微镜', 'INST-2023-029', 103, '3', '2017-05-12', '医学楼C座206室', 'BM2000', '江南永新', 'admin', '2026-03-23 17:46:32', '', NULL, '待报废');
INSERT INTO `sys_instrument` VALUES (30, '数字式粘度计', 'INST-2023-030', 102, '0', '2023-11-20', '工学楼B座308室', 'NDJ-5S', '平轩', 'admin', '2026-03-23 17:46:32', '', NULL, '');
INSERT INTO `sys_instrument` VALUES (31, '测试仪器', '12345', 100, '0', NULL, '逸夫楼D203', NULL, NULL, '', '2026-03-23 20:04:19', '', NULL, '测试');
INSERT INTO `sys_instrument` VALUES (32, '测试仪器111', '12345', 101, '0', NULL, '逸夫楼D2033', NULL, NULL, '', '2026-03-23 20:07:26', '', NULL, '测试');
INSERT INTO `sys_instrument` VALUES (33, '电子分析天平', '12345', 101, '0', '2026-04-23', '逸夫楼D203', 'FA2004N', '梅特勒-托利多', '', '2026-04-24 20:42:44', '', NULL, 'test');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2026-03-21 10:45:00', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2026-03-21 10:45:00', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2026-03-21 10:45:00', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2026-03-21 10:45:00', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2026-03-21 10:45:00', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2026-03-21 10:45:00', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2026-03-21 10:45:00', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2026-03-21 10:45:00', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2026-03-21 10:45:00', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2026-03-21 10:45:00', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2026-03-21 10:45:01', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2026-03-21 10:45:01', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2026-03-21 10:45:01', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2026-03-21 10:45:01', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2026-03-21 10:45:01', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2026-03-21 10:45:01', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2026-03-21 10:45:01', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2026-03-21 10:45:01', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2026-03-21 10:45:01', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2026-03-21 10:45:01', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2026-03-21 10:45:01', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2026-03-21 10:45:01', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2026-03-21 10:45:01', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2026-03-21 10:45:01', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2026-03-21 10:45:01', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2026-03-21 10:45:01', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2026-03-21 10:45:01', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2026-03-21 10:45:01', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2026-03-21 10:45:01', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2026-03-21 10:45:01', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2026-03-21 10:45:01', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2026-03-21 10:45:01', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2026-03-21 10:45:01', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2026-03-21 10:45:01', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2026-03-21 10:45:01', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2026-03-21 10:45:01', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2026-03-21 10:45:01', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2026-03-21 10:45:01', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2026-03-21 10:45:01', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-03-21 10:45:00', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-03-21 10:45:00', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-03-21 10:45:00', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-03-21 10:45:00', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-03-21 10:45:00', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-03-21 10:45:00', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-03-21 10:45:00', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-03-21 10:45:00', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-03-21 10:45:00', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-03-21 10:45:00', '', NULL);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2026-03-21 10:45:01', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2026-03-21 10:45:01', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2026-03-21 10:45:01', '', NULL, '深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue');
INSERT INTO `sys_config` VALUES (4, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2026-03-21 10:45:01', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '用户管理-密码字符范围', 'sys.account.chrtype', '0', 'Y', 'admin', '2026-03-21 10:45:01', '', NULL, '默认任意字符范围，0任意（密码可以输入任意字符），1数字（密码只能为0-9数字），2英文字母（密码只能为a-z和A-Z字母），3字母和数字（密码必须包含字母，数字）,4字母数字和特殊字符（目前支持的特殊字符包括：~!@#$%^&*()-=_+）');
INSERT INTO `sys_config` VALUES (6, '用户管理-初始密码修改策略', 'sys.account.initPasswordModify', '1', 'Y', 'admin', '2026-03-21 10:45:01', '', NULL, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (7, '用户管理-账号密码更新周期', 'sys.account.passwordValidateDays', '0', 'Y', 'admin', '2026-03-21 10:45:01', '', NULL, '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (8, '主框架页-菜单导航显示风格', 'sys.index.menuStyle', 'default', 'Y', 'admin', '2026-03-21 10:45:01', '', NULL, '菜单导航显示风格（default为左侧导航菜单，topnav为顶部导航菜单）');
INSERT INTO `sys_config` VALUES (9, '主框架页-是否开启页脚', 'sys.index.footer', 'true', 'Y', 'admin', '2026-03-21 10:45:01', '', NULL, '是否开启底部页脚显示（true显示，false隐藏）');
INSERT INTO `sys_config` VALUES (10, '主框架页-是否开启页签', 'sys.index.tagsView', 'true', 'Y', 'admin', '2026-03-21 10:45:01', '', NULL, '是否开启菜单多页签显示（true显示，false隐藏）');
INSERT INTO `sys_config` VALUES (11, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2026-03-21 10:45:01', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

SET FOREIGN_KEY_CHECKS = 1;
