/*
Navicat Oracle Data Transfer
Oracle Client Version : 11.2.0.1.0

Source Server         : ssm
Source Server Version : 110200
Source Host           : localhost:1521
Source Schema         : SSM

Target Server Type    : ORACLE
Target Server Version : 110200
File Encoding         : 65001

Date: 2020-06-04 14:44:46
*/


-- ----------------------------
-- Table structure for MEMBER
-- ----------------------------
DROP TABLE "SSM"."MEMBER";
CREATE TABLE "SSM"."MEMBER" (
"ID" VARCHAR2(32 BYTE) DEFAULT SYS_GUID()  NOT NULL ,
"NAME" VARCHAR2(20 BYTE) NULL ,
"NICKNAME" VARCHAR2(20 BYTE) NULL ,
"PHONENUM" VARCHAR2(20 BYTE) NULL ,
"EMAIL" VARCHAR2(20 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of MEMBER
-- ----------------------------
INSERT INTO "SSM"."MEMBER" VALUES ('E61D65F673D54F68B0861025C69773DB', '张三', '小三', '18888888888', 'zs@163.com');

-- ----------------------------
-- Table structure for ORDER_TRAVELLER
-- ----------------------------
DROP TABLE "SSM"."ORDER_TRAVELLER";
CREATE TABLE "SSM"."ORDER_TRAVELLER" (
"ORDERID" VARCHAR2(32 BYTE) NOT NULL ,
"TRAVELLERID" VARCHAR2(32 BYTE) NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of ORDER_TRAVELLER
-- ----------------------------

-- ----------------------------
-- Table structure for ORDERS
-- ----------------------------
DROP TABLE "SSM"."ORDERS";
CREATE TABLE "SSM"."ORDERS" (
"ID" VARCHAR2(32 BYTE) DEFAULT SYS_GUID()  NOT NULL ,
"ORDERNUM" VARCHAR2(20 BYTE) NOT NULL ,
"ORDERTIME" TIMESTAMP(6)  NULL ,
"PEOPLECOUNT" NUMBER NULL ,
"ORDERDESC" VARCHAR2(500 BYTE) NULL ,
"PAYTYPE" NUMBER NULL ,
"ORDERSTATUS" NUMBER NULL ,
"PRODUCTID" VARCHAR2(32 BYTE) NULL ,
"MEMBERID" VARCHAR2(32 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of ORDERS
-- ----------------------------
INSERT INTO "SSM"."ORDERS" VALUES ('55F9AF582D5A4DB28FB4EC3199385762', '33333', TO_TIMESTAMP(' 2018-03-02 12:00:00:000000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '2', '没什么', '0', '1', '9F71F01CB448476DAFB309AA6DF9497F', 'E61D65F673D54F68B0861025C69773DB');

-- ----------------------------
-- Table structure for PERMISSION
-- ----------------------------
DROP TABLE "SSM"."PERMISSION";
CREATE TABLE "SSM"."PERMISSION" (
"ID" VARCHAR2(32 BYTE) DEFAULT SYS_GUID()  NOT NULL ,
"PERMISSIONNAME" VARCHAR2(50 BYTE) NULL ,
"URL" VARCHAR2(50 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of PERMISSION
-- ----------------------------
INSERT INTO "SSM"."PERMISSION" VALUES ('2ED3EA4B12644170ABC6E944D96316BF', 'select', 'selectById,findAll');
INSERT INTO "SSM"."PERMISSION" VALUES ('C74372A6DC3648E682DB7B23E30298E2', 'insert', 'insertOneProduct');
INSERT INTO "SSM"."PERMISSION" VALUES ('FD16CD795DAC4A6AA60010B5F2C0AA74', 'delete', 'delete...');

-- ----------------------------
-- Table structure for PRODUCT
-- ----------------------------
DROP TABLE "SSM"."PRODUCT";
CREATE TABLE "SSM"."PRODUCT" (
"ID" VARCHAR2(32 BYTE) DEFAULT ''  NOT NULL ,
"PRODUCTNUM" VARCHAR2(50 BYTE) NOT NULL ,
"PRODUCTNAME" VARCHAR2(50 BYTE) NULL ,
"CITYNAME" VARCHAR2(50 BYTE) NULL ,
"DEPARTURETIME" TIMESTAMP(6)  NULL ,
"PRODUCTPRICE" NUMBER NULL ,
"PRODUCTDESC" VARCHAR2(500 BYTE) NULL ,
"PRODUCTSTATUS" NUMBER NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of PRODUCT
-- ----------------------------
INSERT INTO "SSM"."PRODUCT" VALUES ('9F71F01CB448476DAFB309AA6DF9497F', 'S003', '苏杭六日游', '海南', TO_TIMESTAMP(' 2020-04-01 00:00:00:000000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '1800', null, '1');
INSERT INTO "SSM"."PRODUCT" VALUES ('066DDAFB10D24C25897D91F6B386B67D', 'M006', '美国东西海岸夏威夷14日游', '天津', TO_TIMESTAMP(' 2020-05-15 00:00:00:000000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '21000', '性价比超高', '0');
INSERT INTO "SSM"."PRODUCT" VALUES ('DE68223BDAC74F23B1A1814DA5B597C4', 'B004', '北京七日游', '天津', TO_TIMESTAMP(' 2020-04-25 00:00:00:000000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '2300', null, '0');
INSERT INTO "SSM"."PRODUCT" VALUES ('57EFD78B727646328ECF0A5590C2D6A2', 'M005', '马尔代夫希尔顿伊露岛4晚6日', '香港', TO_TIMESTAMP(' 2020-05-01 00:00:00:000000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '14600', null, '0');
INSERT INTO "SSM"."PRODUCT" VALUES ('39B9019B00BA441B8E803C8F43CDBCE6', 'P007', '【春节包位】上航直飞普吉岛4晚6日游', null, TO_TIMESTAMP(' 2020-04-16 00:00:00:000000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '12000', null, '1');

-- ----------------------------
-- Table structure for ROLE
-- ----------------------------
DROP TABLE "SSM"."ROLE";
CREATE TABLE "SSM"."ROLE" (
"ID" VARCHAR2(32 BYTE) DEFAULT SYS_GUID()  NOT NULL ,
"ROLENAME" VARCHAR2(50 BYTE) NULL ,
"ROLEDESC" VARCHAR2(50 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of ROLE
-- ----------------------------
INSERT INTO "SSM"."ROLE" VALUES ('adsdc12f', 'ADMIN', 'system');
INSERT INTO "SSM"."ROLE" VALUES ('C7213513734A4F32AB032F2BE4C2D5E4', 'USER', 'user');

-- ----------------------------
-- Table structure for ROLE_PERMISSION
-- ----------------------------
DROP TABLE "SSM"."ROLE_PERMISSION";
CREATE TABLE "SSM"."ROLE_PERMISSION" (
"PERMISSIONID" VARCHAR2(32 BYTE) NOT NULL ,
"ROLEID" VARCHAR2(32 BYTE) NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of ROLE_PERMISSION
-- ----------------------------
INSERT INTO "SSM"."ROLE_PERMISSION" VALUES ('2ED3EA4B12644170ABC6E944D96316BF', 'C7213513734A4F32AB032F2BE4C2D5E4');
INSERT INTO "SSM"."ROLE_PERMISSION" VALUES ('2ED3EA4B12644170ABC6E944D96316BF', 'adsdc12f');
INSERT INTO "SSM"."ROLE_PERMISSION" VALUES ('C74372A6DC3648E682DB7B23E30298E2', 'adsdc12f');
INSERT INTO "SSM"."ROLE_PERMISSION" VALUES ('FD16CD795DAC4A6AA60010B5F2C0AA74', 'adsdc12f');

-- ----------------------------
-- Table structure for SYSLOG
-- ----------------------------
DROP TABLE "SSM"."SYSLOG";
CREATE TABLE "SSM"."SYSLOG" (
"ID" VARCHAR2(32 BYTE) DEFAULT SYS_GUID()  NOT NULL ,
"VISITTIME" TIMESTAMP(6)  NULL ,
"USERNAME" VARCHAR2(50 BYTE) NULL ,
"IP" VARCHAR2(30 BYTE) NULL ,
"URL" VARCHAR2(50 BYTE) NULL ,
"EXECUTIONTIME" NUMBER NULL ,
"METHOD" VARCHAR2(200 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of SYSLOG
-- ----------------------------
INSERT INTO "SSM"."SYSLOG" VALUES ('3F1105AC67734363B5FDFB0E3CDD755D', TO_TIMESTAMP(' 2020-04-14 17:44:14:599000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', '10', '[类名] com.ex.ssm.controller.ProductController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('BD8EAA5286814105A2CED809EB77EB26', TO_TIMESTAMP(' 2020-04-14 17:44:16:564000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/product/deleteOneProduct.do', '6', '[类名] com.ex.ssm.controller.ProductController[方法名] deleteOneProduct');
INSERT INTO "SSM"."SYSLOG" VALUES ('5DBD18F4B2A0430995D460593E10304F', TO_TIMESTAMP(' 2020-04-14 17:44:18:810000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', '7', '[类名] com.ex.ssm.controller.ProductController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('88E33DB1473D4010A80842E07A6A9F48', TO_TIMESTAMP(' 2020-04-14 20:39:23:585000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/order/findAll.do', '11', '[类名] com.ex.ssm.controller.OrderController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('DE78E8F5727E4A28A6CD8CFE77F6D5AB', TO_TIMESTAMP(' 2020-04-14 20:39:25:877000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/order/deleteOneOrder.do', '296', '[类名] com.ex.ssm.controller.OrderController[方法名] deleteOneOrder');
INSERT INTO "SSM"."SYSLOG" VALUES ('B6806E0BD8914C399E52AFAAA0D227C7', TO_TIMESTAMP(' 2020-04-14 20:39:26:231000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/order/findAll.do', '11', '[类名] com.ex.ssm.controller.OrderController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('3E1561E72AE84240A969AB0DC61F7FF6', TO_TIMESTAMP(' 2020-04-14 20:39:59:040000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/order/deleteOneOrder.do', '15', '[类名] com.ex.ssm.controller.OrderController[方法名] deleteOneOrder');
INSERT INTO "SSM"."SYSLOG" VALUES ('156C52D9F2104749A20BCEBE104EEEFD', TO_TIMESTAMP(' 2020-04-14 20:39:59:088000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/order/findAll.do', '3', '[类名] com.ex.ssm.controller.OrderController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('13B4B8456A874B8CA0022A27C096CA70', TO_TIMESTAMP(' 2020-04-14 20:41:42:309000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/order/findAll.do', '4', '[类名] com.ex.ssm.controller.OrderController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('5E12CC0D0A734815A1C9B2495382F1EA', TO_TIMESTAMP(' 2020-04-14 20:41:44:868000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/order/findAll.do', '4', '[类名] com.ex.ssm.controller.OrderController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('4DE2C4EFE36541159B66B565BF97CE50', TO_TIMESTAMP(' 2020-04-14 20:41:53:488000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/order/findAll.do', '15', '[类名] com.ex.ssm.controller.OrderController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('AC1F02E31ABF41D8B9D54873CB8835B6', TO_TIMESTAMP(' 2020-04-14 20:43:30:742000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/order/deleteManyOrders.do', '11', '[类名] com.ex.ssm.controller.OrderController[方法名] deleteManyOrders');
INSERT INTO "SSM"."SYSLOG" VALUES ('E605EC0A7A124B728D5F7A9004DA2764', TO_TIMESTAMP(' 2020-04-14 20:43:30:781000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/order/findAll.do', '24', '[类名] com.ex.ssm.controller.OrderController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('E3A2D2D1D7784FA8908AAB0A16B0CAA6', TO_TIMESTAMP(' 2020-04-14 20:43:33:772000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/order/findAll.do', '9', '[类名] com.ex.ssm.controller.OrderController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('2BCE4336FC02494BA3400D08F5A534E0', TO_TIMESTAMP(' 2020-04-14 20:43:36:373000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/order/findAll.do', '13', '[类名] com.ex.ssm.controller.OrderController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('567BCFD3CC11452DB548DB17F555DBE3', TO_TIMESTAMP(' 2020-04-14 20:43:59:326000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', '26', '[类名] com.ex.ssm.controller.UserController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('6E9E061DDC4641F1B578764FE9198DC7', TO_TIMESTAMP(' 2020-04-14 20:44:38:772000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', '5', '[类名] com.ex.ssm.controller.UserController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('A364CBF999264C5CA7F72A01721313F2', TO_TIMESTAMP(' 2020-04-14 20:44:40:838000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', '12', '[类名] com.ex.ssm.controller.UserController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('926336701D7545DCBCF78250D1F28557', TO_TIMESTAMP(' 2020-04-14 20:44:53:760000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', '15', '[类名] com.ex.ssm.controller.UserController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('D7F3C82B65E3478094679361AA163B8D', TO_TIMESTAMP(' 2020-04-14 20:44:55:741000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', '17', '[类名] com.ex.ssm.controller.UserController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('88F31B713D9743689DB90D8D1FEC5A30', TO_TIMESTAMP(' 2020-04-14 20:44:57:123000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', '18', '[类名] com.ex.ssm.controller.UserController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('10C0282899B74BCABC7AF3E395D973C8', TO_TIMESTAMP(' 2020-04-14 20:45:02:050000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '33', '[类名] com.ex.ssm.controller.RoleController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('0356FCB8FE6244C4BF67CB90CDD5107D', TO_TIMESTAMP(' 2020-04-14 20:45:12:619000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', '8', '[类名] com.ex.ssm.controller.UserController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('92CEB56471BA4365A86B3EA403A10404', TO_TIMESTAMP(' 2020-05-08 17:04:43:520000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', '307', '[类名] com.ex.ssm.controller.UserController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('C74A181DDE9C4192A8E5833177A2CDB7', TO_TIMESTAMP(' 2020-05-08 17:04:48:956000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/user/toPage_UserAdd.do', '0', '[类名] com.ex.ssm.controller.UserController[方法名] toPage_UserAdd');
INSERT INTO "SSM"."SYSLOG" VALUES ('3AD37B8EB55449F1ADD31EFB43931ECE', TO_TIMESTAMP(' 2020-05-08 17:05:06:566000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', '30', '[类名] com.ex.ssm.controller.UserController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('0C6049EE5140402280A46EFAD7D35F12', TO_TIMESTAMP(' 2020-05-08 17:05:12:412000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/user/deleteOneUser.do', '138', '[类名] com.ex.ssm.controller.UserController[方法名] deleteOneUser');
INSERT INTO "SSM"."SYSLOG" VALUES ('27D3C6EBF7E94887979C652D3676A768', TO_TIMESTAMP(' 2020-05-08 17:05:13:099000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', '32', '[类名] com.ex.ssm.controller.UserController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('563A83CF2A3E440DBCC48DB00FA62578', TO_TIMESTAMP(' 2020-05-08 17:05:37:389000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '147', '[类名] com.ex.ssm.controller.RoleController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('C0AE605DEE514BE292DF50B0984F1CA6', TO_TIMESTAMP(' 2020-05-08 17:05:41:318000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', null, '315', '[类名] com.ex.ssm.controller.SysLogController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('C4A3BA2F94FD4B339D961676102BDB06', TO_TIMESTAMP(' 2020-05-08 17:05:49:014000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', null, '119', '[类名] com.ex.ssm.controller.SysLogController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('981632A9384140D5B7F171E96BC0E39D', TO_TIMESTAMP(' 2020-05-08 17:08:24:315000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', '3', '[类名] com.ex.ssm.controller.UserController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('1B8E95EAA05D43DCA63DF4E0E0818642', TO_TIMESTAMP(' 2020-05-08 17:08:37:096000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '7', '[类名] com.ex.ssm.controller.RoleController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('5451E4324F6540498B82AF589F97F228', TO_TIMESTAMP(' 2020-05-08 17:08:44:177000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', '3', '[类名] com.ex.ssm.controller.UserController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('05F04B90F6444D18BF1E5F34912CC095', TO_TIMESTAMP(' 2020-05-08 17:08:53:661000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/user/showRemainRole.do', '1670', '[类名] com.ex.ssm.controller.UserController[方法名] showRemainRole');
INSERT INTO "SSM"."SYSLOG" VALUES ('DD2E08EDCEF3425EA76318982E1E207F', TO_TIMESTAMP(' 2020-05-08 17:09:00:412000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', '4', '[类名] com.ex.ssm.controller.UserController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('548C3C05B19048B9BF57B883A13AC1A3', TO_TIMESTAMP(' 2020-05-08 17:09:01:436000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/user/toPage_UserAdd.do', '0', '[类名] com.ex.ssm.controller.UserController[方法名] toPage_UserAdd');
INSERT INTO "SSM"."SYSLOG" VALUES ('40C3101CCD51460FB1E6F099D3332E31', TO_TIMESTAMP(' 2020-05-08 17:09:15:143000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/user/insertOneUser.do', '143', '[类名] com.ex.ssm.controller.UserController[方法名] insertOneUser');
INSERT INTO "SSM"."SYSLOG" VALUES ('494D3BBE73E346B28A81FE562F9A5FAC', TO_TIMESTAMP(' 2020-05-08 17:09:15:333000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', '4', '[类名] com.ex.ssm.controller.UserController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('FB5A045760894628BCC17E0CDCAE0DE2', TO_TIMESTAMP(' 2020-05-08 17:09:19:600000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/user/showRemainRole.do', '44', '[类名] com.ex.ssm.controller.UserController[方法名] showRemainRole');
INSERT INTO "SSM"."SYSLOG" VALUES ('123AA5D2A3AE4A2D950ACA321EB0EB78', TO_TIMESTAMP(' 2020-05-08 17:09:19:600000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/user/showRemainRole.do', '1441', '[类名] com.ex.ssm.controller.UserController[方法名] showRemainRole');
INSERT INTO "SSM"."SYSLOG" VALUES ('7D779FE019AB4BBF812D61533C6DB45A', TO_TIMESTAMP(' 2020-05-08 17:09:23:829000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/user/showRemainRole.do', '29', '[类名] com.ex.ssm.controller.UserController[方法名] showRemainRole');
INSERT INTO "SSM"."SYSLOG" VALUES ('201AD15555894F63BE24037DFA08E97A', TO_TIMESTAMP(' 2020-05-08 17:09:25:910000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '11', '[类名] com.ex.ssm.controller.RoleController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('AD2F891DBD044383B2B9F7AFFD2BD43F', TO_TIMESTAMP(' 2020-05-08 17:09:32:987000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', '9', '[类名] com.ex.ssm.controller.UserController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('C7C3A2B2E3EE439DBAF3EACFE56C638B', TO_TIMESTAMP(' 2020-05-08 17:09:39:099000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/user/showRemainRole.do', '43', '[类名] com.ex.ssm.controller.UserController[方法名] showRemainRole');
INSERT INTO "SSM"."SYSLOG" VALUES ('01083EF2378043DE89F50298CA8E2DB8', TO_TIMESTAMP(' 2020-05-08 17:09:42:540000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/user/addRoleToUser.do', '95', '[类名] com.ex.ssm.controller.UserController[方法名] addRoleToUser');
INSERT INTO "SSM"."SYSLOG" VALUES ('B9FFB9D36A4B420A84541DF1B4CAB666', TO_TIMESTAMP(' 2020-05-08 17:09:42:650000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', '3', '[类名] com.ex.ssm.controller.UserController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('179E46C778FD4465AAA073887DDE3A2B', TO_TIMESTAMP(' 2020-05-08 17:09:46:487000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/user/selectById.do', '18', '[类名] com.ex.ssm.controller.UserController[方法名] selectById');
INSERT INTO "SSM"."SYSLOG" VALUES ('5F10ABA0CB85409DAA0E555B2F72C03E', TO_TIMESTAMP(' 2020-05-08 17:09:52:369000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', '1389', '[类名] com.ex.ssm.controller.PermissionController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('E6942C0443994752B29D167DCF5A772F', TO_TIMESTAMP(' 2020-05-08 17:09:58:104000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '4', '[类名] com.ex.ssm.controller.RoleController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('0CC288CD460F4DAB85429830A9088310', TO_TIMESTAMP(' 2020-05-08 17:10:10:723000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/role/showRemainPermission.do', '731', '[类名] com.ex.ssm.controller.RoleController[方法名] showRemainPermission');
INSERT INTO "SSM"."SYSLOG" VALUES ('512D44082BFC4D6D95529EDC61A7C41E', TO_TIMESTAMP(' 2020-05-08 17:10:13:974000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '5', '[类名] com.ex.ssm.controller.RoleController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('D3B8EE0E8409427AA72CC744F5CB4FAF', TO_TIMESTAMP(' 2020-05-08 17:10:15:642000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/role/showRemainPermission.do', '32', '[类名] com.ex.ssm.controller.RoleController[方法名] showRemainPermission');
INSERT INTO "SSM"."SYSLOG" VALUES ('B5A112DB476D4358ADD5E26B3F612C52', TO_TIMESTAMP(' 2020-05-08 17:10:17:824000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '4', '[类名] com.ex.ssm.controller.RoleController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('4EE1EFFB7BC24EF18412323E73AA580F', TO_TIMESTAMP(' 2020-05-09 10:51:10:638000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', '53', '[类名] com.ex.ssm.controller.UserController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('FC007DF2E9374F3CB302F48A02A3854A', TO_TIMESTAMP(' 2020-05-09 10:51:34:609000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', null, '150', '[类名] com.ex.ssm.controller.SysLogController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('3CC179B566414CA89CF5B99A72E974E8', TO_TIMESTAMP(' 2020-05-09 10:52:32:197000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', null, '34', '[类名] com.ex.ssm.controller.SysLogController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('B3A9441C5D724359ADB3A2BEF2367A97', TO_TIMESTAMP(' 2020-05-09 10:53:02:390000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', '62', '[类名] com.ex.ssm.controller.ProductController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('BE935B55CE834FB1938F0D0D884ACF7F', TO_TIMESTAMP(' 2020-05-09 10:56:49:132000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', null, '14', '[类名] com.ex.ssm.controller.SysLogController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('2CEE5B331C8E435B9B87F99D4D6C550A', TO_TIMESTAMP(' 2020-05-09 10:56:57:434000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', '5', '[类名] com.ex.ssm.controller.UserController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('A54B350B9EF7481990BD5627AD8ABD17', TO_TIMESTAMP(' 2020-05-09 10:57:16:067000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', '10', '[类名] com.ex.ssm.controller.ProductController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('D484BF46E7FB4AB795B18B515F669C6C', TO_TIMESTAMP(' 2020-05-13 15:58:30:097000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', '64', '[类名] com.ex.ssm.controller.UserController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('13B7E4F610F34135B1A3C201C02A6920', TO_TIMESTAMP(' 2020-05-13 15:58:38:222000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/user/selectById.do', '52', '[类名] com.ex.ssm.controller.UserController[方法名] selectById');
INSERT INTO "SSM"."SYSLOG" VALUES ('603B4CD5523A4223B2A5362B0A2ABEA0', TO_TIMESTAMP(' 2020-05-13 15:58:47:302000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', '3', '[类名] com.ex.ssm.controller.UserController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('F565047D609041639455FBD138B6F385', TO_TIMESTAMP(' 2020-05-13 16:10:01:819000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '54', '[类名] com.ex.ssm.controller.RoleController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('E55E21B41CE14F85824C1DBC231204F2', TO_TIMESTAMP(' 2020-05-13 16:26:44:763000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', '318', '[类名] com.ex.ssm.controller.ProductController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('3AAB4B5C849D464BA3E78D9569AAF3E2', TO_TIMESTAMP(' 2020-05-17 14:27:56:226000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', '33', '[类名] com.ex.ssm.controller.UserController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('8A041E23534D41609DC4593CB6E5F649', TO_TIMESTAMP(' 2020-05-22 19:28:36:724000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', '31', '[类名] com.ex.ssm.controller.UserController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('B8B616C627F547C0ACCFFB0845A68766', TO_TIMESTAMP(' 2020-06-04 14:24:05:294000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', '37', '[类名] com.ex.ssm.controller.UserController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('25A18F69B8544032AC7273061572E0BE', TO_TIMESTAMP(' 2020-06-04 14:24:13:343000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '40', '[类名] com.ex.ssm.controller.RoleController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('82CB1928A84C400C8B16ECA185B7EF00', TO_TIMESTAMP(' 2020-06-04 14:24:24:788000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', null, '68', '[类名] com.ex.ssm.controller.SysLogController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('A2734413D8BE4CC6A5293267F4C6E682', TO_TIMESTAMP(' 2020-06-04 14:24:52:841000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', '61', '[类名] com.ex.ssm.controller.ProductController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('77FFF5FC4EF94F09882CB13C4A7F15D6', TO_TIMESTAMP(' 2020-06-04 14:25:57:594000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/order/findAll.do', '83', '[类名] com.ex.ssm.controller.OrderController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('8816384E73ED46E3A6A5DDB29288B262', TO_TIMESTAMP(' 2020-06-04 14:26:22:201000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/order/selectById', '70', '[类名] com.ex.ssm.controller.OrderController[方法名] selectById');
INSERT INTO "SSM"."SYSLOG" VALUES ('D1C05677F5814DC0849ADB830D0B94A6', TO_TIMESTAMP(' 2020-06-04 14:26:24:983000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/order/findAll.do', '9', '[类名] com.ex.ssm.controller.OrderController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('9AEFBF9F18034F2BA7F85E0C5E84C594', TO_TIMESTAMP(' 2020-04-14 16:00:08:227000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', '2', '[类名] com.ex.ssm.controller.PermissionController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('C53B42AFC159405AA4717893D786DCF6', TO_TIMESTAMP(' 2020-04-14 16:00:12:275000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', '2', '[类名] com.ex.ssm.controller.PermissionController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('51BA467903C34521A170031DD45F8FBA', TO_TIMESTAMP(' 2020-04-14 16:10:05:646000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', '7', '[类名] com.ex.ssm.controller.ProductController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('E35E4292DF544E928F1EA2CBBD3AFC9A', TO_TIMESTAMP(' 2020-04-14 16:10:07:769000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/product/deleteOneProduct.do', '2', '[类名] com.ex.ssm.controller.ProductController[方法名] deleteOneProduct');
INSERT INTO "SSM"."SYSLOG" VALUES ('554B74AE4B404574856251281519E1B9', TO_TIMESTAMP(' 2020-04-14 16:10:07:804000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', '4', '[类名] com.ex.ssm.controller.ProductController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('B04209A35DC340DDB8DA14AFF4DA389E', TO_TIMESTAMP(' 2020-04-14 16:10:12:479000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/product/deleteOneProduct.do', '321', '[类名] com.ex.ssm.controller.ProductController[方法名] deleteOneProduct');
INSERT INTO "SSM"."SYSLOG" VALUES ('07A5D4B5BBFA454C9273CEEB7642D9C2', TO_TIMESTAMP(' 2020-04-14 16:10:14:472000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', '5', '[类名] com.ex.ssm.controller.ProductController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('267A0B32860B48029751DA14B8976876', TO_TIMESTAMP(' 2020-04-14 16:10:15:308000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', '8', '[类名] com.ex.ssm.controller.ProductController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('A67709E4D9AF4D11BD2DF19B915DDE9F', TO_TIMESTAMP(' 2020-04-14 16:10:17:197000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/product/deleteOneProduct.do', '143', '[类名] com.ex.ssm.controller.ProductController[方法名] deleteOneProduct');
INSERT INTO "SSM"."SYSLOG" VALUES ('28F602825FDE47B5AA725BBAEEF4E454', TO_TIMESTAMP(' 2020-04-14 16:13:15:809000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', '5', '[类名] com.ex.ssm.controller.ProductController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('03476F85BAE84ABAAD2E9C22A54C9169', TO_TIMESTAMP(' 2020-04-14 16:16:20:402000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', '5', '[类名] com.ex.ssm.controller.ProductController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('D2AB1B5E80BB4B7D9DAB0E0667F6B44E', TO_TIMESTAMP(' 2020-04-14 17:17:37:210000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', '12', '[类名] com.ex.ssm.controller.UserController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('E03F1EC360C34391BC84DD839B30CEB9', TO_TIMESTAMP(' 2020-04-14 17:17:41:158000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '5', '[类名] com.ex.ssm.controller.RoleController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('22C485E0D19C4AC0A3A771C8C91F2143', TO_TIMESTAMP(' 2020-04-14 17:17:44:145000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', '3', '[类名] com.ex.ssm.controller.PermissionController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('B15154463A6841FE924D41C74D8B3C52', TO_TIMESTAMP(' 2020-04-14 17:17:46:795000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', null, '22', '[类名] com.ex.ssm.controller.SysLogController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('E0080C26755F448CA873C92FF961A7F5', TO_TIMESTAMP(' 2020-04-14 17:17:54:043000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', '18', '[类名] com.ex.ssm.controller.ProductController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('F9CC743582D841ACB1F18677B0A48477', TO_TIMESTAMP(' 2020-04-14 17:17:56:155000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/order/findAll.do', '9', '[类名] com.ex.ssm.controller.OrderController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('73BB4C62E3CF4407BA652943F4F301FD', TO_TIMESTAMP(' 2020-04-14 17:20:27:811000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', '37', '[类名] com.ex.ssm.controller.UserController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('E6C65561A1254B8181C15A7051294D05', TO_TIMESTAMP(' 2020-04-14 17:20:32:340000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', '5', '[类名] com.ex.ssm.controller.UserController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('ECF0A211A38D4BC0B38DE3527D9A06E8', TO_TIMESTAMP(' 2020-04-14 17:20:34:806000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', '3', '[类名] com.ex.ssm.controller.UserController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('2217491B636C4DF3B77D329CA61497C0', TO_TIMESTAMP(' 2020-04-14 17:20:36:683000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/user/showRemainRole.do', '12', '[类名] com.ex.ssm.controller.UserController[方法名] showRemainRole');
INSERT INTO "SSM"."SYSLOG" VALUES ('F669E9C6FD95446ABA73F2A93DD1C9D3', TO_TIMESTAMP(' 2020-04-14 17:20:39:166000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', '4', '[类名] com.ex.ssm.controller.UserController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('575A4399CBC344B7BF5D600DAAD28614', TO_TIMESTAMP(' 2020-04-14 17:20:41:250000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '20', '[类名] com.ex.ssm.controller.RoleController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('1EBA16DC18044E46870F10D515942688', TO_TIMESTAMP(' 2020-04-14 17:20:43:878000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', '4', '[类名] com.ex.ssm.controller.UserController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('FC905B0698AE4BED9129A57B4EEA695D', TO_TIMESTAMP(' 2020-04-14 17:20:45:515000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', '3', '[类名] com.ex.ssm.controller.UserController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('C97F962DB2F24D76A791F6991EC88EAA', TO_TIMESTAMP(' 2020-04-14 17:20:47:433000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/user/showRemainRole.do', '17', '[类名] com.ex.ssm.controller.UserController[方法名] showRemainRole');
INSERT INTO "SSM"."SYSLOG" VALUES ('A84D731D02DC471E85FAACA7F6E0E4F1', TO_TIMESTAMP(' 2020-04-14 17:20:48:177000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', '5', '[类名] com.ex.ssm.controller.UserController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('A5A40AC421B5494B942FAF1DBC5D8FC0', TO_TIMESTAMP(' 2020-04-14 17:20:49:820000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '8', '[类名] com.ex.ssm.controller.RoleController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('B0C89502004E457FA1AF8FDC68E3C704', TO_TIMESTAMP(' 2020-04-14 17:20:54:521000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/role/showRemainPermission.do', '15', '[类名] com.ex.ssm.controller.RoleController[方法名] showRemainPermission');
INSERT INTO "SSM"."SYSLOG" VALUES ('2A257D0A8B2E462F908BA43F1D828D01', TO_TIMESTAMP(' 2020-04-14 17:20:56:059000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '8', '[类名] com.ex.ssm.controller.RoleController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('D773055615E54350BCF579107F31732A', TO_TIMESTAMP(' 2020-04-14 17:20:57:891000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', '12', '[类名] com.ex.ssm.controller.PermissionController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('24C367DE108C4F6FA6EFEC4D03AAE504', TO_TIMESTAMP(' 2020-04-14 17:21:00:530000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/permission/selectById.do', '4', '[类名] com.ex.ssm.controller.PermissionController[方法名] selectById');
INSERT INTO "SSM"."SYSLOG" VALUES ('240073FCDFFF42F58FA94CA413F52C04', TO_TIMESTAMP(' 2020-04-14 17:21:02:717000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', '4', '[类名] com.ex.ssm.controller.PermissionController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('DFED7D490B3B468CB0C1B9F8191EF84C', TO_TIMESTAMP(' 2020-04-14 17:21:04:584000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', null, '91', '[类名] com.ex.ssm.controller.SysLogController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('9680674DD22D432B8809F8A4F57183DF', TO_TIMESTAMP(' 2020-04-14 17:21:06:944000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', null, '19', '[类名] com.ex.ssm.controller.SysLogController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('3EDE454163B54CE491886C1E8F79B848', TO_TIMESTAMP(' 2020-04-14 17:21:08:493000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/index/toPage_Index.do', '6', '[类名] com.ex.ssm.controller.indexController[方法名] toPage_Index');
INSERT INTO "SSM"."SYSLOG" VALUES ('F83B6125EDBA438B904A613EBA0177DD', TO_TIMESTAMP(' 2020-04-14 17:21:10:591000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', '14', '[类名] com.ex.ssm.controller.ProductController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('CE3AD694CA484EABB002AFC411070298', TO_TIMESTAMP(' 2020-04-14 17:21:13:119000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/product/toPage_ProductEdit.do', '3', '[类名] com.ex.ssm.controller.ProductController[方法名] toPage_ProductEdit');
INSERT INTO "SSM"."SYSLOG" VALUES ('B0B26DC762DB4C90A2414DD4B8547656', TO_TIMESTAMP(' 2020-04-14 17:21:14:918000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', '7', '[类名] com.ex.ssm.controller.ProductController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('CD6A3C92A422473396CCA5CE417F8D82', TO_TIMESTAMP(' 2020-04-14 17:21:16:873000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/order/findAll.do', '25', '[类名] com.ex.ssm.controller.OrderController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('E54376FAC7B94535A7626AB84ADF50C3', TO_TIMESTAMP(' 2020-04-14 17:21:18:016000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/order/findAll.do', '7', '[类名] com.ex.ssm.controller.OrderController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('F9F2A5EEF89A448F8DD886F3A4A51C7B', TO_TIMESTAMP(' 2020-04-14 17:21:20:651000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/order/selectById', '14', '[类名] com.ex.ssm.controller.OrderController[方法名] selectById');
INSERT INTO "SSM"."SYSLOG" VALUES ('77F0628F51664BFABE78AFBECF395BFD', TO_TIMESTAMP(' 2020-04-14 17:21:21:510000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/order/findAll.do', '7', '[类名] com.ex.ssm.controller.OrderController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('3B89E15B92DD4255BDC15CBE27D07D29', TO_TIMESTAMP(' 2020-04-14 17:21:35:164000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '4', '[类名] com.ex.ssm.controller.RoleController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('C778C4BEB6B341149FBF946CF34F83CA', TO_TIMESTAMP(' 2020-04-14 17:21:37:603000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/role/showRemainPermission.do', '12', '[类名] com.ex.ssm.controller.RoleController[方法名] showRemainPermission');
INSERT INTO "SSM"."SYSLOG" VALUES ('39B426CA8E88445797A87347AEEFBA8A', TO_TIMESTAMP(' 2020-04-14 17:21:45:143000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '7', '[类名] com.ex.ssm.controller.RoleController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('E896A51E0A80435694A173919A7BDF0F', TO_TIMESTAMP(' 2020-04-14 17:21:46:946000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/role/showRemainPermission.do', '10', '[类名] com.ex.ssm.controller.RoleController[方法名] showRemainPermission');
INSERT INTO "SSM"."SYSLOG" VALUES ('BC888FB36D90465AB9F72872A4A03A96', TO_TIMESTAMP(' 2020-04-14 17:21:48:195000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '4', '[类名] com.ex.ssm.controller.RoleController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('E8DF4D431810406F8A755329C27C7B4B', TO_TIMESTAMP(' 2020-04-14 17:21:51:298000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', '4', '[类名] com.ex.ssm.controller.UserController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('E0093C71E86E41FEB7FF7F26742B59F9', TO_TIMESTAMP(' 2020-04-14 17:21:52:609000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/user/showRemainRole.do', '14', '[类名] com.ex.ssm.controller.UserController[方法名] showRemainRole');
INSERT INTO "SSM"."SYSLOG" VALUES ('447DA4EF57524197A5DF8D0D7C2D47E8', TO_TIMESTAMP(' 2020-04-14 17:21:53:675000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', '2', '[类名] com.ex.ssm.controller.UserController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('D1E58BA5EF3E4BFF940B042A0E9138DC', TO_TIMESTAMP(' 2020-04-14 17:22:02:846000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/user/toPage_UserAdd.do', '0', '[类名] com.ex.ssm.controller.UserController[方法名] toPage_UserAdd');
INSERT INTO "SSM"."SYSLOG" VALUES ('5A597891A87E4745ABE9ABD22AB75238', TO_TIMESTAMP(' 2020-04-14 17:22:06:379000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/user/insertOneUser.do', '932', '[类名] com.ex.ssm.controller.UserController[方法名] insertOneUser');
INSERT INTO "SSM"."SYSLOG" VALUES ('D9C826E066A44169B86929D2C7842B1C', TO_TIMESTAMP(' 2020-04-14 17:22:15:794000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/user/insertOneUser.do', '179', '[类名] com.ex.ssm.controller.UserController[方法名] insertOneUser');
INSERT INTO "SSM"."SYSLOG" VALUES ('158533315D64435EBDF7CB5270A90981', TO_TIMESTAMP(' 2020-04-14 17:26:52:986000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/user/insertOneUser.do', '730', '[类名] com.ex.ssm.controller.UserController[方法名] insertOneUser');
INSERT INTO "SSM"."SYSLOG" VALUES ('A586CD23CCB4462085F0FAD9B4FB7CAE', TO_TIMESTAMP(' 2020-04-14 17:27:10:527000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/user/toPage_UserAdd.do', '0', '[类名] com.ex.ssm.controller.UserController[方法名] toPage_UserAdd');
INSERT INTO "SSM"."SYSLOG" VALUES ('A422AA643F254A5D937CBF8E77F9720D', TO_TIMESTAMP(' 2020-04-14 17:27:27:154000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', '3', '[类名] com.ex.ssm.controller.PermissionController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('93F2410531DE40BDAB6DAC1D30AE2E03', TO_TIMESTAMP(' 2020-04-14 17:27:30:796000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/permission/deleteOnePermission.do', '10', '[类名] com.ex.ssm.controller.PermissionController[方法名] deleteOnePermission');
INSERT INTO "SSM"."SYSLOG" VALUES ('55EE05CEC25B4335A8033793309332A1', TO_TIMESTAMP(' 2020-04-14 17:27:30:858000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', '2', '[类名] com.ex.ssm.controller.PermissionController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('532A414CC4E64344AB1A7B86DB073F0F', TO_TIMESTAMP(' 2020-04-14 17:27:38:004000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', '7', '[类名] com.ex.ssm.controller.ProductController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('8AA778EF8BDE4FF2902EE49BFC9D1FB5', TO_TIMESTAMP(' 2020-04-14 17:27:43:408000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/product/deleteOneProduct.do', '3', '[类名] com.ex.ssm.controller.ProductController[方法名] deleteOneProduct');
INSERT INTO "SSM"."SYSLOG" VALUES ('7854687676EE4A7E93ED75D2495A1145', TO_TIMESTAMP(' 2020-04-14 17:27:45:672000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', '5', '[类名] com.ex.ssm.controller.ProductController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('33A1BABD81544FF188B8EF9B77DFA32B', TO_TIMESTAMP(' 2020-04-14 17:27:58:117000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/product/deleteOneProduct.do', '3', '[类名] com.ex.ssm.controller.ProductController[方法名] deleteOneProduct');
INSERT INTO "SSM"."SYSLOG" VALUES ('1163660C91674D0085B8D69001187ADF', TO_TIMESTAMP(' 2020-04-14 17:27:59:448000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', '5', '[类名] com.ex.ssm.controller.ProductController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('A0D062D3D5B34DDA8BE0B8F5CB3B30AF', TO_TIMESTAMP(' 2020-04-14 17:28:19:054000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', '4', '[类名] com.ex.ssm.controller.ProductController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('BC612D6EB7ED442A91E868886BDA5C78', TO_TIMESTAMP(' 2020-04-14 17:28:21:527000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/product/deleteOneProduct.do', '3', '[类名] com.ex.ssm.controller.ProductController[方法名] deleteOneProduct');
INSERT INTO "SSM"."SYSLOG" VALUES ('3520D813EEFA4C9CAED7A0A01D4DBF02', TO_TIMESTAMP(' 2020-04-14 17:28:24:432000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', '8', '[类名] com.ex.ssm.controller.ProductController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('DE7639FD19A748F483A8BA103092FAED', TO_TIMESTAMP(' 2020-04-14 17:28:32:709000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', '8', '[类名] com.ex.ssm.controller.ProductController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('2733337ED31A40808BB607E158BE2349', TO_TIMESTAMP(' 2020-04-14 17:29:10:167000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/product/toPage_ProductAdd.do', '1', '[类名] com.ex.ssm.controller.ProductController[方法名] toPage_ProductAdd');
INSERT INTO "SSM"."SYSLOG" VALUES ('7954788D889E41818BF106C0D1BE2CF7', TO_TIMESTAMP(' 2020-04-14 17:29:12:073000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', '4', '[类名] com.ex.ssm.controller.ProductController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('BC151CF0FA004195A70FE4FE75E001E9', TO_TIMESTAMP(' 2020-04-14 17:29:23:005000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', '8', '[类名] com.ex.ssm.controller.ProductController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('871E14794BD246B999FCA8FA0B28A631', TO_TIMESTAMP(' 2020-04-14 17:29:24:513000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/product/deleteOneProduct.do', '2', '[类名] com.ex.ssm.controller.ProductController[方法名] deleteOneProduct');
INSERT INTO "SSM"."SYSLOG" VALUES ('F6682AD38B4946D6B5B92FE6A5F74699', TO_TIMESTAMP(' 2020-04-14 17:31:28:249000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/order/findAll.do', '9', '[类名] com.ex.ssm.controller.OrderController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('E6B5AE7CCE314D6C813B013610C3BF42', TO_TIMESTAMP(' 2020-04-14 17:31:29:740000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/product/toPage_ProductAdd.do', '1', '[类名] com.ex.ssm.controller.ProductController[方法名] toPage_ProductAdd');
INSERT INTO "SSM"."SYSLOG" VALUES ('76B79C978ED0426481764CF3CB7DA5B7', TO_TIMESTAMP(' 2020-04-14 17:32:35:307000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/order/findAll.do', '7', '[类名] com.ex.ssm.controller.OrderController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('1B39DB6221544870A6D98F09A6BF0E45', TO_TIMESTAMP(' 2020-04-14 17:37:12:718000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/order/findAll.do', '6', '[类名] com.ex.ssm.controller.OrderController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('AF28059BC2B74E8484170D0141940AD8', TO_TIMESTAMP(' 2020-04-14 17:37:20:631000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '5', '[类名] com.ex.ssm.controller.RoleController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('7BDD11CCC784497DB3F4055803D448CA', TO_TIMESTAMP(' 2020-04-14 17:37:22:103000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', '7', '[类名] com.ex.ssm.controller.ProductController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('00C57282A66040EB9B96AA9FDE6950DF', TO_TIMESTAMP(' 2020-04-14 17:37:23:383000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/product/deleteOneProduct.do', '5', '[类名] com.ex.ssm.controller.ProductController[方法名] deleteOneProduct');
INSERT INTO "SSM"."SYSLOG" VALUES ('826FFD193CDA4B74895A0D59A6DC3E3A', TO_TIMESTAMP(' 2020-04-14 17:37:26:099000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', '5', '[类名] com.ex.ssm.controller.ProductController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('EAD7D6D3E04A4C829D95F541F3DDA9C2', TO_TIMESTAMP(' 2020-04-14 17:41:29:136000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', '310', '[类名] com.ex.ssm.controller.ProductController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('778A8DD8D353483FBD51D6DA66ED7B10', TO_TIMESTAMP(' 2020-04-14 17:41:31:812000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/product/deleteOneProduct.do', '106704', '[类名] com.ex.ssm.controller.ProductController[方法名] deleteOneProduct');
INSERT INTO "SSM"."SYSLOG" VALUES ('F0A7A8B0D78642E1BC3D91D3D4EF4696', TO_TIMESTAMP(' 2020-04-14 17:43:18:539000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/product/deleteOneProduct.do', '7', '[类名] com.ex.ssm.controller.ProductController[方法名] deleteOneProduct');
INSERT INTO "SSM"."SYSLOG" VALUES ('F61C7D51B540459EB7CCAC13DB6E88D5', TO_TIMESTAMP(' 2020-04-14 17:43:18:539000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/product/deleteOneProduct.do', '7', '[类名] com.ex.ssm.controller.ProductController[方法名] deleteOneProduct');
INSERT INTO "SSM"."SYSLOG" VALUES ('F20C307843A740D4BB0D51E1274523CC', TO_TIMESTAMP(' 2020-04-14 17:44:03:299000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/order/findAll.do', '158', '[类名] com.ex.ssm.controller.OrderController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('758BBE187DDB4F54BAAC604FCB2D173E', TO_TIMESTAMP(' 2020-04-14 17:44:03:875000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', '20', '[类名] com.ex.ssm.controller.ProductController[方法名] findAll');
INSERT INTO "SSM"."SYSLOG" VALUES ('D484DFE02B074F908CA3F3C8AB9DD4F6', TO_TIMESTAMP(' 2020-04-14 17:44:07:787000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0:0:0:0:0:0:0:1', null, '17', '[类名] com.ex.ssm.controller.SysLogController[方法名] findAll');

-- ----------------------------
-- Table structure for TRAVELLER
-- ----------------------------
DROP TABLE "SSM"."TRAVELLER";
CREATE TABLE "SSM"."TRAVELLER" (
"ID" VARCHAR2(32 BYTE) DEFAULT SYS_GUID()  NOT NULL ,
"NAME" VARCHAR2(20 BYTE) NULL ,
"SEX" VARCHAR2(20 BYTE) NULL ,
"PHONENUM" VARCHAR2(20 BYTE) NULL ,
"CREDENTIALSTYPE" NUMBER NULL ,
"CREDENTIALSNUM" VARCHAR2(50 BYTE) NULL ,
"TRAVELLERTYPE" NUMBER NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of TRAVELLER
-- ----------------------------
INSERT INTO "SSM"."TRAVELLER" VALUES ('3FE27DF2A4E44A6DBC5D0FE4651D3D3E', '张龙', '男', '13333333333', '0', '123456789009876543', '0');
INSERT INTO "SSM"."TRAVELLER" VALUES ('EE7A71FB6945483FBF91543DBE851960', '张小龙', '男', '15555555555', '0', '987654321123456789', '1');
INSERT INTO "SSM"."TRAVELLER" VALUES ('044E43A058CC4736A3AF4B23012ED4A1', '张三', '男', '13002233789', '0', '1234567890445645665', '0');
INSERT INTO "SSM"."TRAVELLER" VALUES ('79EF5C2A423449DCA95329A58B66BEE9', '君乐', '女', '15682233789', '0', '4111224890445645665', '0');

-- ----------------------------
-- Table structure for USERS
-- ----------------------------
DROP TABLE "SSM"."USERS";
CREATE TABLE "SSM"."USERS" (
"ID" VARCHAR2(32 BYTE) DEFAULT SYS_GUID()  NOT NULL ,
"EMAIL" VARCHAR2(50 BYTE) NOT NULL ,
"USERNAME" VARCHAR2(50 BYTE) NULL ,
"PASSWORD" VARCHAR2(100 BYTE) NULL ,
"PHONENUM" VARCHAR2(20 BYTE) NULL ,
"STATUS" NUMBER NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of USERS
-- ----------------------------
INSERT INTO "SSM"."USERS" VALUES ('111', 'rtrt22@163.com', 'admin', '$2a$10$/EcIfws95xKhodwZZmWozObyz88xsYtAOlirKWw/O1VSdpDJ6PqZy', '13002277673', '1');
INSERT INTO "SSM"."USERS" VALUES ('1607772C8B844B8E8389B9B3B0F915C3', '1785409323@qq.com', 'hahahah', '$2a$10$tb9pJ5YrGXBcQRTXPLZyCO.cQ7GKoQtypXqRnmOXVrsB98bLJGp8G', '15810359852', '0');

-- ----------------------------
-- Table structure for USERS_ROLE
-- ----------------------------
DROP TABLE "SSM"."USERS_ROLE";
CREATE TABLE "SSM"."USERS_ROLE" (
"USERID" VARCHAR2(32 BYTE) NOT NULL ,
"ROLEID" VARCHAR2(32 BYTE) NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of USERS_ROLE
-- ----------------------------
INSERT INTO "SSM"."USERS_ROLE" VALUES ('111', 'C7213513734A4F32AB032F2BE4C2D5E4');
INSERT INTO "SSM"."USERS_ROLE" VALUES ('111', 'adsdc12f');
INSERT INTO "SSM"."USERS_ROLE" VALUES ('1607772C8B844B8E8389B9B3B0F915C3', 'adsdc12f');

-- ----------------------------
-- Indexes structure for table MEMBER
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table MEMBER
-- ----------------------------
ALTER TABLE "SSM"."MEMBER" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table ORDER_TRAVELLER
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table ORDER_TRAVELLER
-- ----------------------------
ALTER TABLE "SSM"."ORDER_TRAVELLER" ADD PRIMARY KEY ("ORDERID", "TRAVELLERID");

-- ----------------------------
-- Indexes structure for table ORDERS
-- ----------------------------

-- ----------------------------
-- Uniques structure for table ORDERS
-- ----------------------------
ALTER TABLE "SSM"."ORDERS" ADD UNIQUE ("ORDERNUM");

-- ----------------------------
-- Checks structure for table ORDERS
-- ----------------------------
ALTER TABLE "SSM"."ORDERS" ADD CHECK ("ORDERNUM" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table ORDERS
-- ----------------------------
ALTER TABLE "SSM"."ORDERS" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table PERMISSION
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table PERMISSION
-- ----------------------------
ALTER TABLE "SSM"."PERMISSION" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table PRODUCT
-- ----------------------------

-- ----------------------------
-- Uniques structure for table PRODUCT
-- ----------------------------
ALTER TABLE "SSM"."PRODUCT" ADD UNIQUE ("ID", "PRODUCTNUM");

-- ----------------------------
-- Checks structure for table PRODUCT
-- ----------------------------
ALTER TABLE "SSM"."PRODUCT" ADD CHECK ("PRODUCTNUM" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table PRODUCT
-- ----------------------------
ALTER TABLE "SSM"."PRODUCT" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table ROLE
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table ROLE
-- ----------------------------
ALTER TABLE "SSM"."ROLE" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table ROLE_PERMISSION
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table ROLE_PERMISSION
-- ----------------------------
ALTER TABLE "SSM"."ROLE_PERMISSION" ADD PRIMARY KEY ("PERMISSIONID", "ROLEID");

-- ----------------------------
-- Indexes structure for table SYSLOG
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table SYSLOG
-- ----------------------------
ALTER TABLE "SSM"."SYSLOG" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table TRAVELLER
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table TRAVELLER
-- ----------------------------
ALTER TABLE "SSM"."TRAVELLER" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table USERS
-- ----------------------------

-- ----------------------------
-- Uniques structure for table USERS
-- ----------------------------
ALTER TABLE "SSM"."USERS" ADD UNIQUE ("EMAIL");

-- ----------------------------
-- Checks structure for table USERS
-- ----------------------------
ALTER TABLE "SSM"."USERS" ADD CHECK ("EMAIL" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table USERS
-- ----------------------------
ALTER TABLE "SSM"."USERS" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table USERS_ROLE
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table USERS_ROLE
-- ----------------------------
ALTER TABLE "SSM"."USERS_ROLE" ADD PRIMARY KEY ("USERID", "ROLEID");

-- ----------------------------
-- Foreign Key structure for table "SSM"."ORDER_TRAVELLER"
-- ----------------------------
ALTER TABLE "SSM"."ORDER_TRAVELLER" ADD FOREIGN KEY ("ORDERID") REFERENCES "SSM"."ORDERS" ("ID");
ALTER TABLE "SSM"."ORDER_TRAVELLER" ADD FOREIGN KEY ("TRAVELLERID") REFERENCES "SSM"."TRAVELLER" ("ID");

-- ----------------------------
-- Foreign Key structure for table "SSM"."ORDERS"
-- ----------------------------
ALTER TABLE "SSM"."ORDERS" ADD FOREIGN KEY ("PRODUCTID") REFERENCES "SSM"."PRODUCT" ("ID");
ALTER TABLE "SSM"."ORDERS" ADD FOREIGN KEY ("MEMBERID") REFERENCES "SSM"."MEMBER" ("ID");

-- ----------------------------
-- Foreign Key structure for table "SSM"."ROLE_PERMISSION"
-- ----------------------------
ALTER TABLE "SSM"."ROLE_PERMISSION" ADD FOREIGN KEY ("PERMISSIONID") REFERENCES "SSM"."PERMISSION" ("ID");
ALTER TABLE "SSM"."ROLE_PERMISSION" ADD FOREIGN KEY ("ROLEID") REFERENCES "SSM"."ROLE" ("ID");

-- ----------------------------
-- Foreign Key structure for table "SSM"."USERS_ROLE"
-- ----------------------------
ALTER TABLE "SSM"."USERS_ROLE" ADD FOREIGN KEY ("USERID") REFERENCES "SSM"."USERS" ("ID");
ALTER TABLE "SSM"."USERS_ROLE" ADD FOREIGN KEY ("ROLEID") REFERENCES "SSM"."ROLE" ("ID");
