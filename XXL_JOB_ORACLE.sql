/*
 Navicat Premium Data Transfer

 Source Server         : 测试-外部-S3-192.168.2.82
 Source Server Type    : Oracle
 Source Server Version : 110200
 Source Host           : 192.168.2.82:11521
 Source Schema         : XXL_JOB

 Target Server Type    : Oracle
 Target Server Version : 110200
 File Encoding         : 65001

 Date: 28/07/2021 17:32:50
*/


-- ----------------------------
-- Table structure for XXL_JOB_GROUP
-- ----------------------------
DROP TABLE "XXL_JOB"."XXL_JOB_GROUP";
CREATE TABLE "XXL_JOB"."XXL_JOB_GROUP" (
  "ID" NUMBER NOT NULL ,
  "APP_NAME" VARCHAR2(150 BYTE) NOT NULL ,
  "TITLE" VARCHAR2(50 BYTE) NOT NULL ,
  "GROUP_ORDER" NUMBER DEFAULT 0  NOT NULL ,
  "ADDRESS_TYPE" NUMBER DEFAULT 0  NOT NULL ,
  "ADDRESS_LIST" VARCHAR2(1000 BYTE) ,
  "UPDATE_TIME" DATE 
)
TABLESPACE "SYSAUX"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN "XXL_JOB"."XXL_JOB_GROUP"."APP_NAME" IS '执行器AppName';
COMMENT ON COLUMN "XXL_JOB"."XXL_JOB_GROUP"."TITLE" IS '执行器名称';
COMMENT ON COLUMN "XXL_JOB"."XXL_JOB_GROUP"."GROUP_ORDER" IS '排序';
COMMENT ON COLUMN "XXL_JOB"."XXL_JOB_GROUP"."ADDRESS_TYPE" IS '执行器地址类型：0=自动注册、1=手动录入';
COMMENT ON COLUMN "XXL_JOB"."XXL_JOB_GROUP"."ADDRESS_LIST" IS '执行器地址列表，多地址逗号分隔';
COMMENT ON TABLE "XXL_JOB"."XXL_JOB_GROUP" IS '执行器信息表';

-- ----------------------------
-- Records of XXL_JOB_GROUP
-- ----------------------------
INSERT INTO "XXL_JOB"."XXL_JOB_GROUP" VALUES ('1', 'xxl-job-executor-sample', '示例执行器', '1', '0', NULL, TO_DATE('2021-07-28 17:32:40', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "XXL_JOB"."XXL_JOB_GROUP" VALUES ('3', 'gta-order-process', 'Order Proces', '0', '0', NULL, TO_DATE('2021-07-28 17:32:40', 'SYYYY-MM-DD HH24:MI:SS'));
COMMIT;

-- ----------------------------
-- Table structure for XXL_JOB_INFO
-- ----------------------------
DROP TABLE "XXL_JOB"."XXL_JOB_INFO";
CREATE TABLE "XXL_JOB"."XXL_JOB_INFO" (
  "ID" NUMBER NOT NULL ,
  "JOB_GROUP" NUMBER NOT NULL ,
  "JOB_DESC" VARCHAR2(500 BYTE) NOT NULL ,
  "ADD_TIME" DATE ,
  "UPDATE_TIME" DATE ,
  "AUTHOR" VARCHAR2(500 BYTE) ,
  "ALARM_EMAIL" VARCHAR2(500 BYTE) ,
  "EXECUTOR_ROUTE_STRATEGY" VARCHAR2(150 BYTE) ,
  "EXECUTOR_HANDLER" VARCHAR2(500 BYTE) ,
  "EXECUTOR_PARAM" VARCHAR2(1000 BYTE) ,
  "EXECUTOR_BLOCK_STRATEGY" VARCHAR2(150 BYTE) ,
  "EXECUTOR_TIMEOUT" NUMBER DEFAULT 0  NOT NULL ,
  "EXECUTOR_FAIL_RETRY_COUNT" NUMBER DEFAULT 0  NOT NULL ,
  "GLUE_TYPE" VARCHAR2(150 BYTE) NOT NULL ,
  "GLUE_SOURCE" CLOB ,
  "GLUE_REMARK" VARCHAR2(128 BYTE) ,
  "GLUE_UPDATETIME" DATE ,
  "CHILD_JOBID" VARCHAR2(500 BYTE) ,
  "TRIGGER_STATUS" NUMBER DEFAULT 0  NOT NULL ,
  "TRIGGER_LAST_TIME" NUMBER DEFAULT 0  NOT NULL ,
  "TRIGGER_NEXT_TIME" NUMBER DEFAULT 0  NOT NULL ,
  "MISFIRE_STRATEGY" VARCHAR2(50 BYTE) DEFAULT 'DO_NOTHING'  NOT NULL ,
  "SCHEDULE_TYPE" VARCHAR2(50 BYTE) DEFAULT 'NONE'  NOT NULL ,
  "SCHEDULE_CONF" VARCHAR2(128 BYTE) 
)
TABLESPACE "SYSAUX"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN "XXL_JOB"."XXL_JOB_INFO"."ID" IS '主键';
COMMENT ON COLUMN "XXL_JOB"."XXL_JOB_INFO"."JOB_GROUP" IS '执行器主键ID';
COMMENT ON COLUMN "XXL_JOB"."XXL_JOB_INFO"."JOB_DESC" IS '任务描述';
COMMENT ON COLUMN "XXL_JOB"."XXL_JOB_INFO"."ADD_TIME" IS '添加时间';
COMMENT ON COLUMN "XXL_JOB"."XXL_JOB_INFO"."UPDATE_TIME" IS '更新时间';
COMMENT ON COLUMN "XXL_JOB"."XXL_JOB_INFO"."AUTHOR" IS '作者';
COMMENT ON COLUMN "XXL_JOB"."XXL_JOB_INFO"."ALARM_EMAIL" IS '报警邮件';
COMMENT ON COLUMN "XXL_JOB"."XXL_JOB_INFO"."EXECUTOR_ROUTE_STRATEGY" IS '执行器路由策略';
COMMENT ON COLUMN "XXL_JOB"."XXL_JOB_INFO"."EXECUTOR_HANDLER" IS '执行器任务handler';
COMMENT ON COLUMN "XXL_JOB"."XXL_JOB_INFO"."EXECUTOR_PARAM" IS '执行器任务参数';
COMMENT ON COLUMN "XXL_JOB"."XXL_JOB_INFO"."EXECUTOR_BLOCK_STRATEGY" IS '阻塞处理策略';
COMMENT ON COLUMN "XXL_JOB"."XXL_JOB_INFO"."EXECUTOR_TIMEOUT" IS '任务执行超时时间，单位秒';
COMMENT ON COLUMN "XXL_JOB"."XXL_JOB_INFO"."EXECUTOR_FAIL_RETRY_COUNT" IS '失败重试次数';
COMMENT ON COLUMN "XXL_JOB"."XXL_JOB_INFO"."GLUE_TYPE" IS 'GLUE类型';
COMMENT ON COLUMN "XXL_JOB"."XXL_JOB_INFO"."GLUE_SOURCE" IS 'GLUE源代码';
COMMENT ON COLUMN "XXL_JOB"."XXL_JOB_INFO"."GLUE_REMARK" IS 'GLUE备注';
COMMENT ON COLUMN "XXL_JOB"."XXL_JOB_INFO"."GLUE_UPDATETIME" IS 'GLUE更新时间';
COMMENT ON COLUMN "XXL_JOB"."XXL_JOB_INFO"."CHILD_JOBID" IS '子任务ID，多个逗号分隔';
COMMENT ON COLUMN "XXL_JOB"."XXL_JOB_INFO"."TRIGGER_STATUS" IS '调度状态：0-停止，1-运行';
COMMENT ON COLUMN "XXL_JOB"."XXL_JOB_INFO"."TRIGGER_LAST_TIME" IS '上次调度时间';
COMMENT ON COLUMN "XXL_JOB"."XXL_JOB_INFO"."TRIGGER_NEXT_TIME" IS '下次调度时间';
COMMENT ON COLUMN "XXL_JOB"."XXL_JOB_INFO"."MISFIRE_STRATEGY" IS '调度过期策略';
COMMENT ON COLUMN "XXL_JOB"."XXL_JOB_INFO"."SCHEDULE_TYPE" IS '调度类型';
COMMENT ON COLUMN "XXL_JOB"."XXL_JOB_INFO"."SCHEDULE_CONF" IS '调度配置，值含义取决于调度类型';
COMMENT ON TABLE "XXL_JOB"."XXL_JOB_INFO" IS '调度信息表';

-- ----------------------------
-- Records of XXL_JOB_INFO
-- ----------------------------
INSERT INTO "XXL_JOB"."XXL_JOB_INFO" VALUES ('3', '1', '测试任务1', TO_DATE('2021-06-30 17:49:13', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-06-30 21:00:39', 'SYYYY-MM-DD HH24:MI:SS'), '小明', NULL, 'FIRST', NULL, NULL, 'SERIAL_EXECUTION', '0', '0', 'GLUE_GROOVY', 'package com.xxl.job.service.handler;

import com.xxl.job.core.context.XxlJobHelper;
import com.xxl.job.core.handler.IJobHandler;

public class DemoGlueJobHandler extends IJobHandler {

	@Override
	public void execute() throws Exception {
		XxlJobHelper.log("XXL-JOB, Hello World.");
	}

}
', 'GLUE代码初始化', TO_DATE('2021-06-30 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '0', '0', '0', 'DO_NOTHING', 'CRON', '0/1 * * * * ?');
INSERT INTO "XXL_JOB"."XXL_JOB_INFO" VALUES ('62', '3', '同步3B2视图数据', TO_DATE('2021-07-08 14:33:42', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-07-08 14:33:42', 'SYYYY-MM-DD HH24:MI:SS'), '小明', NULL, 'FIRST', 'syncOrder3B2', NULL, 'SERIAL_EXECUTION', '0', '0', 'BEAN', NULL, 'GLUE代码初始化', TO_DATE('2021-07-08 14:33:42', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '0', '0', '0', 'DO_NOTHING', 'CRON', '* 0/1 * * * ?');
INSERT INTO "XXL_JOB"."XXL_JOB_INFO" VALUES ('63', '3', '同步3C3视图数据', TO_DATE('2021-07-08 14:34:28', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-07-08 14:34:28', 'SYYYY-MM-DD HH24:MI:SS'), '小明', NULL, 'FIRST', 'syncOrder3C3', NULL, 'SERIAL_EXECUTION', '0', '0', 'BEAN', NULL, 'GLUE代码初始化', TO_DATE('2021-07-08 14:34:28', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '0', '0', '0', 'DO_NOTHING', 'CRON', '0/1 0/1 * * * ?');
INSERT INTO "XXL_JOB"."XXL_JOB_INFO" VALUES ('42', '3', '解析NXP中3A4文件', TO_DATE('2021-07-04 20:45:44', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-07-04 20:45:44', 'SYYYY-MM-DD HH24:MI:SS'), '小明', NULL, 'FIRST', 'downloadOrderNXP3A4', NULL, 'SERIAL_EXECUTION', '0', '0', 'BEAN', NULL, 'GLUE代码初始化', TO_DATE('2021-07-04 20:45:44', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '0', '0', '0', 'DO_NOTHING', 'CRON', '0 0/1 * * * ?');
INSERT INTO "XXL_JOB"."XXL_JOB_INFO" VALUES ('22', '3', '解析NPA中3A19文件', TO_DATE('2021-07-02 10:31:04', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-07-02 10:31:04', 'SYYYY-MM-DD HH24:MI:SS'), '小明', NULL, 'FIRST', 'downloadOrderNPA3A19', NULL, 'SERIAL_EXECUTION', '0', '0', 'BEAN', NULL, 'GLUE代码初始化', TO_DATE('2021-07-02 10:31:04', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '0', '0', '0', 'DO_NOTHING', 'CRON', '* 0/1 * * * ?');
COMMIT;

-- ----------------------------
-- Table structure for XXL_JOB_LOCK
-- ----------------------------
DROP TABLE "XXL_JOB"."XXL_JOB_LOCK";
CREATE TABLE "XXL_JOB"."XXL_JOB_LOCK" (
  "LOCK_NAME" VARCHAR2(150 BYTE) NOT NULL 
)
TABLESPACE "SYSAUX"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN "XXL_JOB"."XXL_JOB_LOCK"."LOCK_NAME" IS '锁名称';
COMMENT ON TABLE "XXL_JOB"."XXL_JOB_LOCK" IS '锁信息';

-- ----------------------------
-- Records of XXL_JOB_LOCK
-- ----------------------------
INSERT INTO "XXL_JOB"."XXL_JOB_LOCK" VALUES ('schedule_lock');
COMMIT;

-- ----------------------------
-- Table structure for XXL_JOB_LOG
-- ----------------------------
DROP TABLE "XXL_JOB"."XXL_JOB_LOG";
CREATE TABLE "XXL_JOB"."XXL_JOB_LOG" (
  "ID" NUMBER NOT NULL ,
  "JOB_GROUP" NUMBER NOT NULL ,
  "JOB_ID" NUMBER NOT NULL ,
  "EXECUTOR_ADDRESS" VARCHAR2(500 BYTE) ,
  "EXECUTOR_HANDLER" VARCHAR2(500 BYTE) ,
  "EXECUTOR_PARAM" VARCHAR2(1000 BYTE) ,
  "EXECUTOR_SHARDING_PARAM" VARCHAR2(50 BYTE) ,
  "EXECUTOR_FAIL_RETRY_COUNT" NUMBER DEFAULT 0  NOT NULL ,
  "TRIGGER_TIME" DATE ,
  "TRIGGER_CODE" NUMBER NOT NULL ,
  "TRIGGER_MSG" VARCHAR2(2000 BYTE) ,
  "HANDLE_TIME" DATE ,
  "HANDLE_CODE" NUMBER NOT NULL ,
  "HANDLE_MSG" VARCHAR2(2000 BYTE) ,
  "ALARM_STATUS" NUMBER DEFAULT 0  NOT NULL 
)
TABLESPACE "SYSAUX"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN "XXL_JOB"."XXL_JOB_LOG"."ID" IS '主键ID';
COMMENT ON COLUMN "XXL_JOB"."XXL_JOB_LOG"."JOB_GROUP" IS '执行器主键ID';
COMMENT ON COLUMN "XXL_JOB"."XXL_JOB_LOG"."JOB_ID" IS '任务，主键ID';
COMMENT ON COLUMN "XXL_JOB"."XXL_JOB_LOG"."EXECUTOR_ADDRESS" IS '执行器地址，本次执行的地址';
COMMENT ON COLUMN "XXL_JOB"."XXL_JOB_LOG"."EXECUTOR_HANDLER" IS '执行器任务handler';
COMMENT ON COLUMN "XXL_JOB"."XXL_JOB_LOG"."EXECUTOR_PARAM" IS '执行器任务参数';
COMMENT ON COLUMN "XXL_JOB"."XXL_JOB_LOG"."EXECUTOR_SHARDING_PARAM" IS '执行器任务分片参数，格式如 1/2';
COMMENT ON COLUMN "XXL_JOB"."XXL_JOB_LOG"."EXECUTOR_FAIL_RETRY_COUNT" IS '失败重试次数';
COMMENT ON COLUMN "XXL_JOB"."XXL_JOB_LOG"."TRIGGER_TIME" IS '调度-时间';
COMMENT ON COLUMN "XXL_JOB"."XXL_JOB_LOG"."TRIGGER_CODE" IS '调度-结果';
COMMENT ON COLUMN "XXL_JOB"."XXL_JOB_LOG"."TRIGGER_MSG" IS '调度-日志';
COMMENT ON COLUMN "XXL_JOB"."XXL_JOB_LOG"."HANDLE_TIME" IS '执行-时间';
COMMENT ON COLUMN "XXL_JOB"."XXL_JOB_LOG"."HANDLE_CODE" IS '执行-状态';
COMMENT ON COLUMN "XXL_JOB"."XXL_JOB_LOG"."HANDLE_MSG" IS '执行-日志';
COMMENT ON COLUMN "XXL_JOB"."XXL_JOB_LOG"."ALARM_STATUS" IS '告警状态：0-默认、1-无需告警、2-告警成功、3-告警失败';
COMMENT ON TABLE "XXL_JOB"."XXL_JOB_LOG" IS '任务日志信息';

-- ----------------------------
-- Records of XXL_JOB_LOG
-- ----------------------------
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2394', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 19:50:17', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 19:50:23', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2433', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 19:51:01', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 19:51:01', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2444', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 19:51:12', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 19:51:12', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2445', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 19:51:13', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 19:51:13', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2446', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 19:51:13', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 19:51:13', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2447', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 21:00:20', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 21:00:21', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2448', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 21:00:21', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 21:00:21', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2449', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 21:00:22', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 21:00:22', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2450', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 21:00:23', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 21:00:23', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2451', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 21:00:24', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 21:00:24', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2452', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 21:00:25', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 21:00:25', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2453', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 21:00:26', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 21:00:26', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2454', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 21:00:27', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 21:00:27', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2455', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 21:00:28', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 21:00:28', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2387', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 19:34:38', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2386', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '500', '任务触发类型：手动触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：500<br>msg：xxl-rpc remoting error(Connection refused (Connection refused)), for url : http://10.147.19.111:9999/run', NULL, '0', NULL, '1');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2388', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '500', '任务触发类型：手动触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：500<br>msg：xxl-rpc remoting error(Connection refused (Connection refused)), for url : http://10.147.19.111:9999/run', NULL, '0', NULL, '1');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2389', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 19:40:57', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 19:40:58', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2390', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 19:41:13', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 19:41:14', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2391', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 19:41:41', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 19:41:41', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2392', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 19:42:34', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 19:42:34', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2393', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 19:50:12', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 19:50:16', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2395', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 19:50:23', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 19:50:23', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2396', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 19:50:25', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 19:50:25', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2398', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 19:50:26', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 19:50:26', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2399', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 19:50:27', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 19:50:27', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2400', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 19:50:28', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 19:50:28', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2401', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 19:50:29', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 19:50:29', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2402', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 19:50:30', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 19:50:30', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2403', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 19:50:31', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 19:50:31', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2404', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 19:50:32', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 19:50:32', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2405', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 19:50:33', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 19:50:33', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2406', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 19:50:34', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 19:50:34', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2407', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 19:50:35', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 19:50:35', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2408', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 19:50:36', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 19:50:36', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2409', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 19:50:37', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 19:50:37', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2410', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 19:50:38', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 19:50:38', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2411', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 19:50:39', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 19:50:39', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2412', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 19:50:40', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 19:50:41', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2414', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 19:50:42', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 19:50:42', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2415', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 19:50:44', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 19:50:44', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2418', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 19:50:46', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 19:50:47', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2397', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 19:50:26', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 19:50:26', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2413', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 19:50:41', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 19:50:42', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2416', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 19:50:44', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 19:50:44', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2417', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 19:50:45', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 19:50:45', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2419', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 19:50:47', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 19:50:47', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2420', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 19:50:48', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 19:50:49', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2421', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 19:50:50', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 19:50:50', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2422', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 19:50:51', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 19:50:51', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2423', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 19:50:52', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 19:50:53', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2424', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 19:50:53', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 19:50:53', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2425', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 19:50:53', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 19:50:53', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2426', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 19:50:54', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 19:50:54', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2427', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 19:50:55', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 19:50:55', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2428', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 19:50:56', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 19:50:56', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2429', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 19:50:57', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 19:50:57', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2430', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 19:50:58', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 19:50:58', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2431', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 19:50:59', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 19:50:59', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2432', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 19:51:00', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 19:51:00', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2434', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 19:51:02', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 19:51:02', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2435', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 19:51:03', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 19:51:03', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2436', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 19:51:04', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 19:51:04', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2437', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 19:51:05', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 19:51:05', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2438', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 19:51:06', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 19:51:07', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2439', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 19:51:07', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 19:51:07', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2440', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 19:51:08', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 19:51:08', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2441', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 19:51:09', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 19:51:09', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2442', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 19:51:10', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 19:51:10', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2443', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 19:51:11', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 19:51:12', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2456', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 21:00:29', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 21:00:29', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2457', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 21:00:30', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 21:00:30', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2458', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 21:00:31', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 21:00:31', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2459', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 21:00:32', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 21:00:32', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2460', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 21:00:33', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 21:00:33', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2461', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 21:00:34', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 21:00:34', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2462', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 21:00:35', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 21:00:35', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2463', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 21:00:36', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 21:00:36', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2464', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 21:00:37', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 21:00:37', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2465', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 21:00:38', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 21:00:38', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2466', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 21:00:39', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 21:00:39', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2467', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 21:00:40', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 21:00:40', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2468', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 21:00:41', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 21:00:41', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2469', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 21:00:42', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 21:00:42', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2515', '3', '42', 'http://10.147.19.111:9998/', 'downloadOrderNXP3A4', NULL, NULL, '0', TO_DATE('2021-07-04 20:50:33', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.8.0.41<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-04 21:01:10', 'SYYYY-MM-DD HH24:MI:SS'), '500', '任务结果丢失，标记失败', '1');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2516', '3', '42', 'http://10.147.19.111:9998/', 'downloadOrderNXP3A4', NULL, NULL, '0', TO_DATE('2021-07-04 20:50:45', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.8.0.41<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-04 21:01:10', 'SYYYY-MM-DD HH24:MI:SS'), '500', '任务结果丢失，标记失败', '1');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2517', '3', '42', 'http://10.147.19.111:9998/', 'downloadOrderNXP3A4', NULL, NULL, '0', TO_DATE('2021-07-04 20:51:03', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.8.0.41<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-04 21:01:10', 'SYYYY-MM-DD HH24:MI:SS'), '500', '任务结果丢失，标记失败', '1');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2518', '3', '42', 'http://10.8.0.41:9998/', 'downloadOrderNXP3A4', NULL, NULL, '0', TO_DATE('2021-07-04 20:59:58', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.8.0.41<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.8.0.41:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.8.0.41:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-04 21:12:11', 'SYYYY-MM-DD HH24:MI:SS'), '500', '任务结果丢失，标记失败', '1');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2519', '3', '42', 'http://10.8.0.41:9998/', 'downloadOrderNXP3A4', NULL, NULL, '0', TO_DATE('2021-07-04 21:02:55', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.8.0.41<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.8.0.41:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.8.0.41:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-04 21:12:05', 'SYYYY-MM-DD HH24:MI:SS'), '500', 'web container destroy and kill the job. [job running, killed]', '1');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2522', '3', '42', 'http://10.8.0.41:9998/', 'downloadOrderNXP3A4', NULL, NULL, '0', TO_DATE('2021-07-04 21:17:24', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.8.0.41<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.8.0.41:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.8.0.41:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-04 21:17:31', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2523', '3', '42', 'http://10.147.19.111:9998/', 'downloadOrderNXP3A4', NULL, NULL, '0', TO_DATE('2021-07-04 21:53:30', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.8.0.41<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-04 21:53:46', 'SYYYY-MM-DD HH24:MI:SS'), '500', 'java.lang.reflect.InvocationTargetException
	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
	at java.lang.reflect.Method.invoke(Method.java:498)
	at com.xxl.job.core.handler.impl.MethodJobHandler.execute(MethodJobHandler.java:31)
	at com.xxl.job.core.thread.JobThread.run(JobThread.java:163)
Caused by: java.text.ParseException: Unparseable date: "20210329T120000.000Z"
	at java.text.DateFormat.parse(DateFormat.java:366)
	at com.gta.cloud.service.order.util.OrderGenUtil.formatTz(OrderGenUtil.java:43)
	at com.gta.cloud.service.order.util.OrderUtil.handleToOrder3A4(OrderUtil.java:70)
	at com.gta.cloud.service.order.task.Order3A4Task.downloadOrderNXP3A4(Order3A4Task.java:96)
	... 6 more
', '1');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2546', '3', '63', 'http://10.147.19.111:9998/', 'syncOrder3C3', NULL, NULL, '0', TO_DATE('2021-07-08 15:10:34', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-08 15:10:36', 'SYYYY-MM-DD HH24:MI:SS'), '500', 'java.lang.reflect.InvocationTargetException
	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
	at java.lang.reflect.Method.invoke(Method.java:498)
	at com.xxl.job.core.handler.impl.MethodJobHandler.execute(MethodJobHandler.java:31)
	at com.xxl.job.core.thread.JobThread.run(JobThread.java:163)
Caused by: java.lang.NullPointerException
	at com.gta.cloud.service.order.util.Order3C3Util.handleTo3C3(Order3C3Util.java:49)
	at com.gta.cloud.service.order.task.Order3C3Task.syncOrderNPA3C3(Order3C3Task.java:113)
	at com.gta.cloud.service.order.task.Order3C3Task.syncOrder3C3(Order3C3Task.java:78)
	... 6 more
', '1');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2550', '3', '63', 'http://10.147.19.111:9998/', 'syncOrder3C3', NULL, NULL, '0', TO_DATE('2021-07-08 16:33:06', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-08 16:58:18', 'SYYYY-MM-DD HH24:MI:SS'), '500', '任务结果丢失，标记失败', '1');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2557', '3', '63', 'http://10.147.19.111:9998/', 'syncOrder3C3', NULL, NULL, '0', TO_DATE('2021-07-08 17:38:11', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-08 22:13:28', 'SYYYY-MM-DD HH24:MI:SS'), '500', '任务结果丢失，标记失败', '1');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2483', '3', '22', 'http://10.147.19.111:9998/', 'downloadOrderNPA3A19', NULL, NULL, '0', TO_DATE('2021-07-02 14:12:58', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-02 14:13:07', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2484', '3', '22', NULL, 'downloadOrderNPA3A19', NULL, NULL, '0', TO_DATE('2021-07-02 14:57:54', 'SYYYY-MM-DD HH24:MI:SS'), '500', '任务触发类型：手动触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, '0', NULL, '1');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2485', '3', '22', 'http://10.147.19.111:9998/', 'downloadOrderNPA3A19', NULL, NULL, '0', TO_DATE('2021-07-02 14:58:14', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-02 14:58:16', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2501', '3', '22', 'http://10.8.0.41:9998/', 'downloadOrderNPA3A19', NULL, NULL, '0', TO_DATE('2021-07-04 17:31:44', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.8.0.41<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.8.0.41:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.8.0.41:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-04 17:45:53', 'SYYYY-MM-DD HH24:MI:SS'), '500', '任务结果丢失，标记失败', '1');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2502', '3', '22', 'http://10.8.0.41:9998/', 'downloadOrderNPA3A19', NULL, NULL, '0', TO_DATE('2021-07-04 17:36:12', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.8.0.41<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.8.0.41:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.8.0.41:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-04 17:46:53', 'SYYYY-MM-DD HH24:MI:SS'), '500', '任务结果丢失，标记失败', '1');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2503', '3', '22', 'http://10.8.0.41:9998/', 'downloadOrderNPA3A19', NULL, NULL, '0', TO_DATE('2021-07-04 17:40:31', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.8.0.41<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.8.0.41:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.8.0.41:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-04 18:11:56', 'SYYYY-MM-DD HH24:MI:SS'), '500', '任务结果丢失，标记失败', '1');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2544', '3', '62', 'http://10.147.19.111:9998/', 'syncOrder3B2', NULL, NULL, '0', TO_DATE('2021-07-08 14:36:05', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-08 16:32:10', 'SYYYY-MM-DD HH24:MI:SS'), '500', '任务结果丢失，标记失败', '1');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2547', '3', '63', 'http://10.147.19.111:9998/', 'syncOrder3C3', NULL, NULL, '0', TO_DATE('2021-07-08 16:15:04', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-08 16:15:06', 'SYYYY-MM-DD HH24:MI:SS'), '500', 'java.lang.reflect.InvocationTargetException
	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
	at java.lang.reflect.Method.invoke(Method.java:498)
	at com.xxl.job.core.handler.impl.MethodJobHandler.execute(MethodJobHandler.java:31)
	at com.xxl.job.core.thread.JobThread.run(JobThread.java:163)
Caused by: java.lang.NullPointerException
	at com.gta.cloud.service.order.util.Order3C3Util.handleTo3C3(Order3C3Util.java:49)
	at com.gta.cloud.service.order.task.Order3C3Task.syncOrderNPA3C3(Order3C3Task.java:113)
	at com.gta.cloud.service.order.task.Order3C3Task.syncOrder3C3(Order3C3Task.java:78)
	... 6 more
', '1');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2555', '3', '63', 'http://10.147.19.111:9998/', 'syncOrder3C3', NULL, NULL, '0', TO_DATE('2021-07-08 17:15:16', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-08 22:13:28', 'SYYYY-MM-DD HH24:MI:SS'), '500', '任务结果丢失，标记失败', '1');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2556', '3', '62', 'http://10.147.19.111:9998/', 'syncOrder3B2', NULL, NULL, '0', TO_DATE('2021-07-08 17:15:28', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-08 17:15:48', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2558', '3', '63', 'http://10.147.19.111:9998/', 'syncOrder3C3', NULL, NULL, '0', TO_DATE('2021-07-08 17:42:55', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-08 17:43:33', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2560', '3', '63', 'http://10.147.19.111:9998/', 'syncOrder3C3', NULL, NULL, '0', TO_DATE('2021-07-09 11:50:56', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-09 11:51:42', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2541', '3', '42', 'http://10.147.19.111:9998/', 'downloadOrderNXP3A4', NULL, NULL, '0', TO_DATE('2021-07-07 14:26:35', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-07 14:27:52', 'SYYYY-MM-DD HH24:MI:SS'), '500', 'web container destroy and kill the job. [job running, killed]', '1');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2542', '3', '42', 'http://10.147.19.111:9998/', 'downloadOrderNXP3A4', NULL, NULL, '0', TO_DATE('2021-07-07 14:29:10', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-07 14:29:16', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2543', '3', '42', 'http://10.147.19.111:9998/', 'downloadOrderNXP3A4', NULL, NULL, '0', TO_DATE('2021-07-07 14:35:58', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-07 14:36:03', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2559', '3', '63', 'http://10.147.19.111:9998/', 'syncOrder3C3', NULL, NULL, '0', TO_DATE('2021-07-09 10:26:12', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-09 10:27:05', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2561', '3', '62', 'http://10.147.19.111:9998/', 'syncOrder3B2', NULL, NULL, '0', TO_DATE('2021-07-12 11:50:07', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-12 11:51:29', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2567', '3', '42', 'http://10.147.19.111:9998/', 'downloadOrderNXP3A4', NULL, NULL, '0', TO_DATE('2021-07-12 16:19:33', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-12 16:21:39', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2581', '3', '42', 'http://10.147.19.111:9998/', 'downloadOrderNXP3A4', NULL, NULL, '0', TO_DATE('2021-07-15 15:42:32', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-15 15:45:44', 'SYYYY-MM-DD HH24:MI:SS'), '500', 'web container destroy and kill the job. [job running, killed]', '1');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2582', '3', '42', 'http://10.147.19.111:9998/', 'downloadOrderNXP3A4', NULL, NULL, '0', TO_DATE('2021-07-15 15:46:39', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-15 15:46:48', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2601', '3', '42', 'http://10.147.19.111:9998/', 'downloadOrderNXP3A4', NULL, NULL, '0', TO_DATE('2021-07-19 11:07:03', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-19 11:07:05', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2602', '3', '42', 'http://10.147.19.111:9998/', 'downloadOrderNXP3A4', NULL, NULL, '0', TO_DATE('2021-07-19 11:11:23', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-19 11:11:25', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2603', '3', '42', 'http://10.147.19.111:9998/', 'downloadOrderNXP3A4', NULL, NULL, '0', TO_DATE('2021-07-19 11:13:42', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-19 11:13:51', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2604', '3', '42', 'http://10.147.19.111:9998/', 'downloadOrderNXP3A4', NULL, NULL, '0', TO_DATE('2021-07-19 11:14:46', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-19 11:14:48', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2605', '3', '42', 'http://10.147.19.111:9998/', 'downloadOrderNXP3A4', NULL, NULL, '0', TO_DATE('2021-07-19 11:20:43', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-19 11:20:51', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2609', '3', '42', 'http://10.147.19.111:9998/', 'downloadOrderNXP3A4', NULL, NULL, '0', TO_DATE('2021-07-19 11:35:29', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-19 11:35:38', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2478', '3', '22', 'http://10.147.19.111:9998/', 'downloadOrderNPA3A19', NULL, NULL, '0', TO_DATE('2021-07-02 10:44:00', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-02 10:44:02', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2479', '3', '22', 'http://10.147.19.111:9998/', 'downloadOrderNPA3A19', NULL, NULL, '0', TO_DATE('2021-07-02 10:44:58', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-02 10:45:02', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2564', '3', '62', 'http://10.147.19.111:9998/', 'syncOrder3B2', NULL, NULL, '0', TO_DATE('2021-07-12 14:16:53', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-12 14:18:52', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2565', '3', '62', NULL, 'syncOrder3B2', NULL, NULL, '0', TO_DATE('2021-07-12 14:24:38', 'SYYYY-MM-DD HH24:MI:SS'), '500', '任务触发类型：手动触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, '0', NULL, '1');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2566', '3', '62', 'http://10.147.19.111:9998/', 'syncOrder3B2', NULL, NULL, '0', TO_DATE('2021-07-12 14:25:11', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-12 14:26:35', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2610', '3', '63', 'http://10.147.19.111:9998/', 'syncOrder3C3', NULL, NULL, '0', TO_DATE('2021-07-19 11:40:46', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-19 11:40:52', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2611', '3', '22', 'http://10.147.19.111:9998/', 'downloadOrderNPA3A19', NULL, NULL, '0', TO_DATE('2021-07-19 11:42:25', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-19 11:42:31', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2612', '3', '63', 'http://10.147.19.111:9998/', 'syncOrder3C3', NULL, NULL, '0', TO_DATE('2021-07-19 11:56:19', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-19 11:56:25', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2613', '3', '63', 'http://10.147.19.111:9998/', 'syncOrder3C3', NULL, NULL, '0', TO_DATE('2021-07-19 13:41:39', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-19 13:42:24', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2615', '3', '63', 'http://10.147.19.111:9998/', 'syncOrder3C3', NULL, NULL, '0', TO_DATE('2021-07-19 13:46:57', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-19 13:47:53', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2641', '3', '42', NULL, 'downloadOrderNXP3A4', NULL, NULL, '0', TO_DATE('2021-07-27 11:40:51', 'SYYYY-MM-DD HH24:MI:SS'), '500', '任务触发类型：手动触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, '0', NULL, '1');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2480', '3', '22', 'http://10.147.19.111:9998/', 'downloadOrderNPA3A19', NULL, NULL, '0', TO_DATE('2021-07-02 13:45:42', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-02 13:45:45', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2510', '3', '22', 'http://10.8.0.41:9998/', 'downloadOrderNPA3A19', NULL, NULL, '0', TO_DATE('2021-07-04 18:36:03', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.8.0.41<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.8.0.41:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.8.0.41:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-04 18:36:06', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2512', '3', '22', 'http://10.8.0.41:9998/', 'downloadOrderNPA3A19', NULL, NULL, '0', TO_DATE('2021-07-04 19:22:41', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.8.0.41<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.8.0.41:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.8.0.41:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-04 19:22:52', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2521', '3', '42', 'http://10.8.0.41:9998/', 'downloadOrderNXP3A4', NULL, NULL, '0', TO_DATE('2021-07-04 21:13:34', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.8.0.41<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.8.0.41:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.8.0.41:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-04 21:27:12', 'SYYYY-MM-DD HH24:MI:SS'), '500', '任务结果丢失，标记失败', '1');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2524', '3', '42', 'http://10.8.0.41:9998/', 'downloadOrderNXP3A4', NULL, NULL, '0', TO_DATE('2021-07-04 21:56:22', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.8.0.41<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.8.0.41:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.8.0.41:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-04 21:56:32', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2548', '3', '63', 'http://10.147.19.111:9998/', 'syncOrder3C3', NULL, NULL, '0', TO_DATE('2021-07-08 16:22:27', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-08 16:22:29', 'SYYYY-MM-DD HH24:MI:SS'), '500', 'java.lang.reflect.InvocationTargetException
	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
	at java.lang.reflect.Method.invoke(Method.java:498)
	at com.xxl.job.core.handler.impl.MethodJobHandler.execute(MethodJobHandler.java:31)
	at com.xxl.job.core.thread.JobThread.run(JobThread.java:163)
Caused by: java.lang.NullPointerException
	at com.gta.cloud.service.order.util.Order3C3Util.handleTo3C3(Order3C3Util.java:101)
	at com.gta.cloud.service.order.task.Order3C3Task.syncOrderNPA3C3(Order3C3Task.java:115)
	at com.gta.cloud.service.order.task.Order3C3Task.syncOrder3C3(Order3C3Task.java:79)
	at com.gta.cloud.service.order.task.Order3C3Task$$FastClassBySpringCGLIB$$44c782aa.invoke(<generated>)
	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)
	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:687)
	at com.gta.cloud.service.order.task.Order3C3Task$$EnhancerBySpringCGLIB$$977461c2.syncOrder3C3(<generated>)
	... 6 more
', '1');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2549', '3', '63', 'http://10.147.19.111:9998/', 'syncOrder3C3', NULL, NULL, '0', TO_DATE('2021-07-08 16:27:59', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-08 16:58:18', 'SYYYY-MM-DD HH24:MI:SS'), '500', '任务结果丢失，标记失败', '1');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2606', '3', '42', NULL, 'downloadOrderNXP3A4', NULL, NULL, '0', TO_DATE('2021-07-19 11:23:55', 'SYYYY-MM-DD HH24:MI:SS'), '500', '任务触发类型：手动触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, '0', NULL, '1');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2607', '3', '42', 'http://10.147.19.111:9998/', 'downloadOrderNXP3A4', NULL, NULL, '0', TO_DATE('2021-07-19 11:24:28', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-19 11:24:37', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2608', '3', '42', 'http://10.147.19.111:9998/', 'downloadOrderNXP3A4', NULL, NULL, '0', TO_DATE('2021-07-19 11:28:53', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-19 11:29:02', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2621', '3', '63', 'http://10.147.19.111:9998/', 'syncOrder3C3', NULL, NULL, '0', TO_DATE('2021-07-23 15:59:26', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-23 15:59:33', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2470', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-06-30 21:00:43', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：Cron触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：200<br>msg：null', TO_DATE('2021-06-30 21:00:43', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2482', '3', '22', 'http://10.147.19.111:9998/', 'downloadOrderNPA3A19', NULL, NULL, '0', TO_DATE('2021-07-02 14:10:45', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-02 14:11:49', 'SYYYY-MM-DD HH24:MI:SS'), '500', 'web container destroy and kill the job. [job running, killed]', '1');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2509', '3', '22', 'http://10.8.0.41:9998/', 'downloadOrderNPA3A19', NULL, NULL, '0', TO_DATE('2021-07-04 18:02:24', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.8.0.41<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.8.0.41:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.8.0.41:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-04 18:02:30', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2511', '3', '22', 'http://10.8.0.41:9998/', 'downloadOrderNPA3A19', NULL, NULL, '0', TO_DATE('2021-07-04 18:58:02', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.8.0.41<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.8.0.41:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.8.0.41:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-04 18:58:25', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2513', '3', '22', 'http://10.8.0.41:9998/', 'downloadOrderNPA3A19', NULL, NULL, '0', TO_DATE('2021-07-04 19:34:07', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.8.0.41<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.8.0.41:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.8.0.41:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-04 19:34:10', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2520', '3', '42', NULL, 'downloadOrderNXP3A4', NULL, NULL, '0', TO_DATE('2021-07-04 21:12:39', 'SYYYY-MM-DD HH24:MI:SS'), '500', '任务触发类型：手动触发<br>调度机器：10.8.0.41<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, '0', NULL, '1');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2545', '3', '62', 'http://10.147.19.111:9998/', 'syncOrder3B2', NULL, NULL, '0', TO_DATE('2021-07-08 14:47:36', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-08 16:32:10', 'SYYYY-MM-DD HH24:MI:SS'), '500', '任务结果丢失，标记失败', '1');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2551', '3', '63', 'http://10.147.19.111:9998/', 'syncOrder3C3', NULL, NULL, '0', TO_DATE('2021-07-08 17:05:25', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-08 22:13:28', 'SYYYY-MM-DD HH24:MI:SS'), '500', '任务结果丢失，标记失败', '1');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2552', '3', '62', 'http://10.147.19.111:9998/', 'syncOrder3B2', NULL, NULL, '0', TO_DATE('2021-07-08 17:05:29', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-08 22:13:28', 'SYYYY-MM-DD HH24:MI:SS'), '500', '任务结果丢失，标记失败', '1');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2553', '3', '63', 'http://10.147.19.111:9998/', 'syncOrder3C3', NULL, NULL, '0', TO_DATE('2021-07-08 17:08:34', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-08 22:13:28', 'SYYYY-MM-DD HH24:MI:SS'), '500', '任务结果丢失，标记失败', '1');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2554', '3', '62', 'http://10.147.19.111:9998/', 'syncOrder3B2', NULL, NULL, '0', TO_DATE('2021-07-08 17:08:38', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-08 17:09:24', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2562', '3', '62', 'http://10.147.19.111:9998/', 'syncOrder3B2', NULL, NULL, '0', TO_DATE('2021-07-12 13:49:10', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-12 13:50:30', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2563', '3', '62', 'http://10.147.19.111:9998/', 'syncOrder3B2', NULL, NULL, '0', TO_DATE('2021-07-12 13:55:10', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-12 14:09:07', 'SYYYY-MM-DD HH24:MI:SS'), '500', 'web container destroy and kill the job. [job running, killed]', '1');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2614', '3', '62', 'http://10.147.19.111:9998/', 'syncOrder3B2', NULL, NULL, '0', TO_DATE('2021-07-19 13:44:54', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-19 13:45:37', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2471', '1', '3', NULL, NULL, NULL, NULL, '0', TO_DATE('2021-06-30 21:01:05', 'SYYYY-MM-DD HH24:MI:SS'), '500', '任务触发类型：手动触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, '0', NULL, '1');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2472', '1', '3', 'http://10.147.19.111:9999/', NULL, NULL, NULL, '0', TO_DATE('2021-07-01 00:26:36', 'SYYYY-MM-DD HH24:MI:SS'), '500', '任务触发类型：手动触发<br>调度机器：10.8.0.41<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9999/<br>code：500<br>msg：xxl-rpc remoting error(Connection refused (Connection refused)), for url : http://10.147.19.111:9999/run', NULL, '0', NULL, '1');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2473', '3', '22', 'http://10.147.19.111:9998/', 'downloadOrderNPA3A19', NULL, NULL, '0', TO_DATE('2021-07-02 10:31:26', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-02 11:07:06', 'SYYYY-MM-DD HH24:MI:SS'), '500', '任务结果丢失，标记失败', '1');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2474', '3', '22', 'http://10.147.19.111:9998/', 'downloadOrderNPA3A19', NULL, NULL, '0', TO_DATE('2021-07-02 10:35:11', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-02 11:07:06', 'SYYYY-MM-DD HH24:MI:SS'), '500', '任务结果丢失，标记失败', '1');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2475', '3', '22', NULL, 'downloadOrderNPA3A19', NULL, NULL, '0', TO_DATE('2021-07-02 10:36:30', 'SYYYY-MM-DD HH24:MI:SS'), '500', '任务触发类型：手动触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, '0', NULL, '1');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2476', '3', '22', 'http://10.147.19.111:9998/', 'downloadOrderNPA3A19', NULL, NULL, '0', TO_DATE('2021-07-02 10:37:36', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-02 11:07:06', 'SYYYY-MM-DD HH24:MI:SS'), '500', '任务结果丢失，标记失败', '1');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2477', '3', '22', 'http://10.147.19.111:9998/', 'downloadOrderNPA3A19', NULL, NULL, '0', TO_DATE('2021-07-02 10:41:04', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-02 10:42:43', 'SYYYY-MM-DD HH24:MI:SS'), '500', 'web container destroy and kill the job. [job running, killed]', '1');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2481', '3', '22', 'http://10.147.19.111:9998/', 'downloadOrderNPA3A19', NULL, NULL, '0', TO_DATE('2021-07-02 14:08:01', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.147.19.111<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-02 14:08:04', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2504', '3', '22', NULL, 'downloadOrderNPA3A19', NULL, NULL, '0', TO_DATE('2021-07-04 17:45:52', 'SYYYY-MM-DD HH24:MI:SS'), '500', '任务触发类型：手动触发<br>调度机器：10.8.0.41<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, '0', NULL, '1');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2505', '3', '22', 'http://10.147.19.111:9998/', 'downloadOrderNPA3A19', NULL, NULL, '0', TO_DATE('2021-07-04 17:46:35', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.8.0.41<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-04 17:56:54', 'SYYYY-MM-DD HH24:MI:SS'), '500', '任务结果丢失，标记失败', '1');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2506', '3', '22', 'http://10.8.0.41:9998/', 'downloadOrderNPA3A19', NULL, NULL, '0', TO_DATE('2021-07-04 17:48:31', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.8.0.41<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.8.0.41:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.8.0.41:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-04 18:11:56', 'SYYYY-MM-DD HH24:MI:SS'), '500', '任务结果丢失，标记失败', '1');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2507', '3', '22', 'http://10.8.0.41:9998/', 'downloadOrderNPA3A19', NULL, NULL, '0', TO_DATE('2021-07-04 17:52:02', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.8.0.41<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.8.0.41:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.8.0.41:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-04 18:11:55', 'SYYYY-MM-DD HH24:MI:SS'), '500', '任务结果丢失，标记失败', '1');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2508', '3', '22', 'http://10.8.0.41:9998/', 'downloadOrderNPA3A19', NULL, NULL, '0', TO_DATE('2021-07-04 17:59:59', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.8.0.41<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.8.0.41:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.8.0.41:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-04 18:00:08', 'SYYYY-MM-DD HH24:MI:SS'), '200', NULL, '0');
INSERT INTO "XXL_JOB"."XXL_JOB_LOG" VALUES ('2514', '3', '42', 'http://10.147.19.111:9998/', 'downloadOrderNXP3A4', NULL, NULL, '0', TO_DATE('2021-07-04 20:45:50', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：10.8.0.41<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.147.19.111:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.147.19.111:9998/<br>code：200<br>msg：null', TO_DATE('2021-07-04 21:00:10', 'SYYYY-MM-DD HH24:MI:SS'), '500', '任务结果丢失，标记失败', '1');
COMMIT;

-- ----------------------------
-- Table structure for XXL_JOB_LOGGLUE
-- ----------------------------
DROP TABLE "XXL_JOB"."XXL_JOB_LOGGLUE";
CREATE TABLE "XXL_JOB"."XXL_JOB_LOGGLUE" (
  "ID" NUMBER NOT NULL ,
  "JOB_ID" NUMBER NOT NULL ,
  "GLUE_TYPE" VARCHAR2(150 BYTE) ,
  "GLUE_SOURCE" CLOB ,
  "GLUE_REMARK" VARCHAR2(256 BYTE) NOT NULL ,
  "ADD_TIME" DATE ,
  "UPDATE_TIME" DATE 
)
TABLESPACE "SYSAUX"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN "XXL_JOB"."XXL_JOB_LOGGLUE"."ID" IS '主键ID';
COMMENT ON COLUMN "XXL_JOB"."XXL_JOB_LOGGLUE"."JOB_ID" IS '任务，主键ID';
COMMENT ON COLUMN "XXL_JOB"."XXL_JOB_LOGGLUE"."GLUE_TYPE" IS 'GLUE类型';
COMMENT ON COLUMN "XXL_JOB"."XXL_JOB_LOGGLUE"."GLUE_SOURCE" IS 'GLUE源代码';
COMMENT ON COLUMN "XXL_JOB"."XXL_JOB_LOGGLUE"."GLUE_REMARK" IS 'GLUE备注';
COMMENT ON COLUMN "XXL_JOB"."XXL_JOB_LOGGLUE"."ADD_TIME" IS '添加时间';
COMMENT ON COLUMN "XXL_JOB"."XXL_JOB_LOGGLUE"."UPDATE_TIME" IS '更新时间';
COMMENT ON TABLE "XXL_JOB"."XXL_JOB_LOGGLUE" IS '任务GLUE日志';

-- ----------------------------
-- Table structure for XXL_JOB_LOG_REPORT
-- ----------------------------
DROP TABLE "XXL_JOB"."XXL_JOB_LOG_REPORT";
CREATE TABLE "XXL_JOB"."XXL_JOB_LOG_REPORT" (
  "ID" NUMBER NOT NULL ,
  "TRIGGER_DAY" DATE ,
  "RUNNING_COUNT" NUMBER DEFAULT 0  NOT NULL ,
  "SUC_COUNT" NUMBER DEFAULT 0  NOT NULL ,
  "FAIL_COUNT" NUMBER DEFAULT 0  NOT NULL ,
  "UPDATE_TIME" DATE 
)
TABLESPACE "SYSAUX"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN "XXL_JOB"."XXL_JOB_LOG_REPORT"."TRIGGER_DAY" IS '调度-时间';
COMMENT ON COLUMN "XXL_JOB"."XXL_JOB_LOG_REPORT"."RUNNING_COUNT" IS '运行中-日志数量';
COMMENT ON COLUMN "XXL_JOB"."XXL_JOB_LOG_REPORT"."SUC_COUNT" IS '执行成功-日志数量';
COMMENT ON COLUMN "XXL_JOB"."XXL_JOB_LOG_REPORT"."FAIL_COUNT" IS '执行失败-日志数量';

-- ----------------------------
-- Records of XXL_JOB_LOG_REPORT
-- ----------------------------
INSERT INTO "XXL_JOB"."XXL_JOB_LOG_REPORT" VALUES ('2', TO_DATE('2021-06-30 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '0', '83', '3', NULL);
INSERT INTO "XXL_JOB"."XXL_JOB_LOG_REPORT" VALUES ('3', TO_DATE('2021-06-29 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '0', '0', '0', NULL);
INSERT INTO "XXL_JOB"."XXL_JOB_LOG_REPORT" VALUES ('4', TO_DATE('2021-06-28 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '0', '0', '0', NULL);
INSERT INTO "XXL_JOB"."XXL_JOB_LOG_REPORT" VALUES ('42', TO_DATE('2021-07-05 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '0', '0', '0', NULL);
INSERT INTO "XXL_JOB"."XXL_JOB_LOG_REPORT" VALUES ('66', TO_DATE('2021-07-12 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '0', '5', '2', NULL);
INSERT INTO "XXL_JOB"."XXL_JOB_LOG_REPORT" VALUES ('102', TO_DATE('2021-07-15 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '0', '1', '1', NULL);
INSERT INTO "XXL_JOB"."XXL_JOB_LOG_REPORT" VALUES ('103', TO_DATE('2021-07-16 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '0', '0', '0', NULL);
INSERT INTO "XXL_JOB"."XXL_JOB_LOG_REPORT" VALUES ('23', TO_DATE('2021-07-04 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '0', '8', '16', NULL);
INSERT INTO "XXL_JOB"."XXL_JOB_LOG_REPORT" VALUES ('44', TO_DATE('2021-07-07 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '0', '2', '1', NULL);
INSERT INTO "XXL_JOB"."XXL_JOB_LOG_REPORT" VALUES ('142', TO_DATE('2021-07-23 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '0', '1', '0', NULL);
INSERT INTO "XXL_JOB"."XXL_JOB_LOG_REPORT" VALUES ('182', TO_DATE('2021-07-28 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '0', '0', '0', NULL);
INSERT INTO "XXL_JOB"."XXL_JOB_LOG_REPORT" VALUES ('5', TO_DATE('2021-07-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '0', '0', '1', NULL);
INSERT INTO "XXL_JOB"."XXL_JOB_LOG_REPORT" VALUES ('24', TO_DATE('2021-07-03 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '0', '0', '0', NULL);
INSERT INTO "XXL_JOB"."XXL_JOB_LOG_REPORT" VALUES ('43', TO_DATE('2021-07-06 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '0', '0', '0', NULL);
INSERT INTO "XXL_JOB"."XXL_JOB_LOG_REPORT" VALUES ('62', TO_DATE('2021-07-08 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '0', '3', '12', NULL);
INSERT INTO "XXL_JOB"."XXL_JOB_LOG_REPORT" VALUES ('64', TO_DATE('2021-07-10 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '0', '0', '0', NULL);
INSERT INTO "XXL_JOB"."XXL_JOB_LOG_REPORT" VALUES ('104', TO_DATE('2021-07-17 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '0', '0', '0', NULL);
INSERT INTO "XXL_JOB"."XXL_JOB_LOG_REPORT" VALUES ('125', TO_DATE('2021-07-21 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '0', '0', '0', NULL);
INSERT INTO "XXL_JOB"."XXL_JOB_LOG_REPORT" VALUES ('126', TO_DATE('2021-07-22 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '0', '0', '0', NULL);
INSERT INTO "XXL_JOB"."XXL_JOB_LOG_REPORT" VALUES ('162', TO_DATE('2021-07-26 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '0', '0', '0', NULL);
INSERT INTO "XXL_JOB"."XXL_JOB_LOG_REPORT" VALUES ('163', TO_DATE('2021-07-25 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '0', '0', '0', NULL);
INSERT INTO "XXL_JOB"."XXL_JOB_LOG_REPORT" VALUES ('164', TO_DATE('2021-07-24 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '0', '0', '0', NULL);
INSERT INTO "XXL_JOB"."XXL_JOB_LOG_REPORT" VALUES ('63', TO_DATE('2021-07-09 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '0', '2', '0', NULL);
INSERT INTO "XXL_JOB"."XXL_JOB_LOG_REPORT" VALUES ('82', TO_DATE('2021-07-14 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '0', '0', '0', NULL);
INSERT INTO "XXL_JOB"."XXL_JOB_LOG_REPORT" VALUES ('165', TO_DATE('2021-07-27 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '0', '0', '1', NULL);
INSERT INTO "XXL_JOB"."XXL_JOB_LOG_REPORT" VALUES ('22', TO_DATE('2021-07-02 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '0', '6', '7', NULL);
INSERT INTO "XXL_JOB"."XXL_JOB_LOG_REPORT" VALUES ('65', TO_DATE('2021-07-11 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '0', '0', '0', NULL);
INSERT INTO "XXL_JOB"."XXL_JOB_LOG_REPORT" VALUES ('67', TO_DATE('2021-07-13 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '0', '0', '0', NULL);
INSERT INTO "XXL_JOB"."XXL_JOB_LOG_REPORT" VALUES ('122', TO_DATE('2021-07-19 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '0', '14', '1', NULL);
INSERT INTO "XXL_JOB"."XXL_JOB_LOG_REPORT" VALUES ('123', TO_DATE('2021-07-18 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '0', '0', '0', NULL);
INSERT INTO "XXL_JOB"."XXL_JOB_LOG_REPORT" VALUES ('124', TO_DATE('2021-07-20 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '0', '0', '0', NULL);
COMMIT;

-- ----------------------------
-- Table structure for XXL_JOB_REGISTRY
-- ----------------------------
DROP TABLE "XXL_JOB"."XXL_JOB_REGISTRY";
CREATE TABLE "XXL_JOB"."XXL_JOB_REGISTRY" (
  "ID" NUMBER NOT NULL ,
  "REGISTRY_GROUP" VARCHAR2(500 BYTE) NOT NULL ,
  "REGISTRY_KEY" VARCHAR2(500 BYTE) NOT NULL ,
  "REGISTRY_VALUE" VARCHAR2(500 BYTE) NOT NULL ,
  "UPDATE_TIME" DATE 
)
TABLESPACE "SYSAUX"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN "XXL_JOB"."XXL_JOB_REGISTRY"."ID" IS '主键ID';
COMMENT ON COLUMN "XXL_JOB"."XXL_JOB_REGISTRY"."REGISTRY_GROUP" IS '注册组';
COMMENT ON COLUMN "XXL_JOB"."XXL_JOB_REGISTRY"."REGISTRY_KEY" IS '注册key';
COMMENT ON COLUMN "XXL_JOB"."XXL_JOB_REGISTRY"."REGISTRY_VALUE" IS '注册value';
COMMENT ON COLUMN "XXL_JOB"."XXL_JOB_REGISTRY"."UPDATE_TIME" IS '修改时间';
COMMENT ON TABLE "XXL_JOB"."XXL_JOB_REGISTRY" IS '执行器注册表';

-- ----------------------------
-- Table structure for XXL_JOB_USER
-- ----------------------------
DROP TABLE "XXL_JOB"."XXL_JOB_USER";
CREATE TABLE "XXL_JOB"."XXL_JOB_USER" (
  "ID" NUMBER NOT NULL ,
  "USERNAME" VARCHAR2(150 BYTE) NOT NULL ,
  "PASSWORD" VARCHAR2(150 BYTE) NOT NULL ,
  "ROLE" NUMBER NOT NULL ,
  "PERMISSION" VARCHAR2(500 BYTE) 
)
TABLESPACE "SYSAUX"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN "XXL_JOB"."XXL_JOB_USER"."ID" IS '主键ID';
COMMENT ON COLUMN "XXL_JOB"."XXL_JOB_USER"."USERNAME" IS '账号';
COMMENT ON COLUMN "XXL_JOB"."XXL_JOB_USER"."PASSWORD" IS '密码';
COMMENT ON COLUMN "XXL_JOB"."XXL_JOB_USER"."ROLE" IS '角色：0-普通用户、1-管理员';
COMMENT ON COLUMN "XXL_JOB"."XXL_JOB_USER"."PERMISSION" IS '权限：执行器ID列表，多个逗号分割';
COMMENT ON TABLE "XXL_JOB"."XXL_JOB_USER" IS '登录用户信息';

-- ----------------------------
-- Records of XXL_JOB_USER
-- ----------------------------
INSERT INTO "XXL_JOB"."XXL_JOB_USER" VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '1', NULL);
COMMIT;

-- ----------------------------
-- Sequence structure for XXL_JOB_GROUP_ID
-- ----------------------------
DROP SEQUENCE "XXL_JOB"."XXL_JOB_GROUP_ID";
CREATE SEQUENCE "XXL_JOB"."XXL_JOB_GROUP_ID" MINVALUE 1 MAXVALUE 999999999999 INCREMENT BY 1 CYCLE CACHE 20;

-- ----------------------------
-- Sequence structure for XXL_JOB_INFO_ID
-- ----------------------------
DROP SEQUENCE "XXL_JOB"."XXL_JOB_INFO_ID";
CREATE SEQUENCE "XXL_JOB"."XXL_JOB_INFO_ID" MINVALUE 1 MAXVALUE 999999999999 INCREMENT BY 1 CYCLE CACHE 20;

-- ----------------------------
-- Sequence structure for XXL_JOB_LOGGLUE_ID
-- ----------------------------
DROP SEQUENCE "XXL_JOB"."XXL_JOB_LOGGLUE_ID";
CREATE SEQUENCE "XXL_JOB"."XXL_JOB_LOGGLUE_ID" MINVALUE 1 MAXVALUE 999999999999 INCREMENT BY 1 CYCLE CACHE 20;

-- ----------------------------
-- Sequence structure for XXL_JOB_LOG_ID
-- ----------------------------
DROP SEQUENCE "XXL_JOB"."XXL_JOB_LOG_ID";
CREATE SEQUENCE "XXL_JOB"."XXL_JOB_LOG_ID" MINVALUE 1 MAXVALUE 999999999999 INCREMENT BY 1 CYCLE CACHE 20;

-- ----------------------------
-- Sequence structure for XXL_JOB_LOG_REPORT_ID
-- ----------------------------
DROP SEQUENCE "XXL_JOB"."XXL_JOB_LOG_REPORT_ID";
CREATE SEQUENCE "XXL_JOB"."XXL_JOB_LOG_REPORT_ID" MINVALUE 1 MAXVALUE 999999999999 INCREMENT BY 1 CYCLE CACHE 20;

-- ----------------------------
-- Sequence structure for XXL_JOB_REGISTRY_ID
-- ----------------------------
DROP SEQUENCE "XXL_JOB"."XXL_JOB_REGISTRY_ID";
CREATE SEQUENCE "XXL_JOB"."XXL_JOB_REGISTRY_ID" MINVALUE 1 MAXVALUE 999999999999 INCREMENT BY 1 CYCLE CACHE 20;

-- ----------------------------
-- Sequence structure for XXL_JOB_USER_ID
-- ----------------------------
DROP SEQUENCE "XXL_JOB"."XXL_JOB_USER_ID";
CREATE SEQUENCE "XXL_JOB"."XXL_JOB_USER_ID" MINVALUE 1 MAXVALUE 999999999999 INCREMENT BY 1 CYCLE CACHE 20;

-- ----------------------------
-- Primary Key structure for table XXL_JOB_GROUP
-- ----------------------------
ALTER TABLE "XXL_JOB"."XXL_JOB_GROUP" ADD CONSTRAINT "PK_XXL_JOB_GROUP_ID" PRIMARY KEY ("ID");

-- ----------------------------
-- Checks structure for table XXL_JOB_GROUP
-- ----------------------------
ALTER TABLE "XXL_JOB"."XXL_JOB_GROUP" ADD CONSTRAINT "SYS_C008513" CHECK ("ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "XXL_JOB"."XXL_JOB_GROUP" ADD CONSTRAINT "SYS_C008514" CHECK ("APP_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "XXL_JOB"."XXL_JOB_GROUP" ADD CONSTRAINT "SYS_C008515" CHECK ("TITLE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "XXL_JOB"."XXL_JOB_GROUP" ADD CONSTRAINT "SYS_C008516" CHECK ("GROUP_ORDER" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "XXL_JOB"."XXL_JOB_GROUP" ADD CONSTRAINT "SYS_C008517" CHECK ("ADDRESS_TYPE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Indexes structure for table XXL_JOB_GROUP
-- ----------------------------
CREATE INDEX "XXL_JOB"."IDX_XXL_JOB_GROUP_APP_NAME"
  ON "XXL_JOB"."XXL_JOB_GROUP" ("APP_NAME" ASC)
  LOGGING
  TABLESPACE "SYSAUX"
  VISIBLE
PCTFREE 10
INITRANS 2
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
);
CREATE INDEX "XXL_JOB"."IDX_XXL_JOB_GROUP_GROUP_ORDER"
  ON "XXL_JOB"."XXL_JOB_GROUP" ("GROUP_ORDER" ASC)
  LOGGING
  TABLESPACE "SYSAUX"
  VISIBLE
PCTFREE 10
INITRANS 2
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
);

-- ----------------------------
-- Primary Key structure for table XXL_JOB_INFO
-- ----------------------------
ALTER TABLE "XXL_JOB"."XXL_JOB_INFO" ADD CONSTRAINT "PK_XXL_JOB_INFO_ID" PRIMARY KEY ("ID");

-- ----------------------------
-- Checks structure for table XXL_JOB_INFO
-- ----------------------------
ALTER TABLE "XXL_JOB"."XXL_JOB_INFO" ADD CONSTRAINT "SYS_C008519" CHECK ("ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "XXL_JOB"."XXL_JOB_INFO" ADD CONSTRAINT "SYS_C008520" CHECK ("JOB_GROUP" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "XXL_JOB"."XXL_JOB_INFO" ADD CONSTRAINT "SYS_C008522" CHECK ("JOB_DESC" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "XXL_JOB"."XXL_JOB_INFO" ADD CONSTRAINT "SYS_C008523" CHECK ("EXECUTOR_TIMEOUT" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "XXL_JOB"."XXL_JOB_INFO" ADD CONSTRAINT "SYS_C008524" CHECK ("EXECUTOR_FAIL_RETRY_COUNT" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "XXL_JOB"."XXL_JOB_INFO" ADD CONSTRAINT "SYS_C008525" CHECK ("GLUE_TYPE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "XXL_JOB"."XXL_JOB_INFO" ADD CONSTRAINT "SYS_C008526" CHECK ("TRIGGER_STATUS" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "XXL_JOB"."XXL_JOB_INFO" ADD CONSTRAINT "SYS_C008527" CHECK ("TRIGGER_LAST_TIME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "XXL_JOB"."XXL_JOB_INFO" ADD CONSTRAINT "SYS_C008528" CHECK ("TRIGGER_NEXT_TIME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "XXL_JOB"."XXL_JOB_INFO" ADD CONSTRAINT "SYS_C008559" CHECK ("MISFIRE_STRATEGY" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "XXL_JOB"."XXL_JOB_INFO" ADD CONSTRAINT "SYS_C008560" CHECK ("SCHEDULE_TYPE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Indexes structure for table XXL_JOB_INFO
-- ----------------------------
CREATE INDEX "XXL_JOB"."IDX_XXL_JOB_AUTHOR"
  ON "XXL_JOB"."XXL_JOB_INFO" ("AUTHOR" ASC)
  LOGGING
  TABLESPACE "SYSAUX"
  VISIBLE
PCTFREE 10
INITRANS 2
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
);
CREATE INDEX "XXL_JOB"."IDX_XXL_JOB_EXECUTOR_HANDLER"
  ON "XXL_JOB"."XXL_JOB_INFO" ("EXECUTOR_HANDLER" ASC) LOCAL
  LOGGING
  ONLINE
  TABLESPACE "SYSAUX"
  NOSORT
  VISIBLE
PCTFREE 10
INITRANS 2
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
);
CREATE INDEX "XXL_JOB"."IDX_XXL_JOB_JOB_GROUP"
  ON "XXL_JOB"."XXL_JOB_INFO" ("JOB_GROUP" ASC)
  LOGGING
  TABLESPACE "SYSAUX"
  VISIBLE
PCTFREE 10
INITRANS 2
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
);
CREATE INDEX "XXL_JOB"."IDX_XXL_JOB_TRIGGER_STATUS"
  ON "XXL_JOB"."XXL_JOB_INFO" ("TRIGGER_STATUS" ASC)
  LOGGING
  TABLESPACE "SYSAUX"
  VISIBLE
PCTFREE 10
INITRANS 2
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
);

-- ----------------------------
-- Primary Key structure for table XXL_JOB_LOCK
-- ----------------------------
ALTER TABLE "XXL_JOB"."XXL_JOB_LOCK" ADD CONSTRAINT "PK_XXL_JOB_LOCK_" PRIMARY KEY ("LOCK_NAME");

-- ----------------------------
-- Checks structure for table XXL_JOB_LOCK
-- ----------------------------
ALTER TABLE "XXL_JOB"."XXL_JOB_LOCK" ADD CONSTRAINT "SYS_C008530" CHECK ("LOCK_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table XXL_JOB_LOG
-- ----------------------------
ALTER TABLE "XXL_JOB"."XXL_JOB_LOG" ADD CONSTRAINT "PK_XXL_JOB_LOG_ID" PRIMARY KEY ("ID");

-- ----------------------------
-- Checks structure for table XXL_JOB_LOG
-- ----------------------------
ALTER TABLE "XXL_JOB"."XXL_JOB_LOG" ADD CONSTRAINT "SYS_C008561" CHECK ("ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "XXL_JOB"."XXL_JOB_LOG" ADD CONSTRAINT "SYS_C008562" CHECK ("JOB_GROUP" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "XXL_JOB"."XXL_JOB_LOG" ADD CONSTRAINT "SYS_C008563" CHECK ("JOB_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "XXL_JOB"."XXL_JOB_LOG" ADD CONSTRAINT "SYS_C008564" CHECK ("EXECUTOR_FAIL_RETRY_COUNT" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "XXL_JOB"."XXL_JOB_LOG" ADD CONSTRAINT "SYS_C008565" CHECK ("TRIGGER_CODE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "XXL_JOB"."XXL_JOB_LOG" ADD CONSTRAINT "SYS_C008566" CHECK ("HANDLE_CODE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "XXL_JOB"."XXL_JOB_LOG" ADD CONSTRAINT "SYS_C008567" CHECK ("ALARM_STATUS" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table XXL_JOB_LOGGLUE
-- ----------------------------
ALTER TABLE "XXL_JOB"."XXL_JOB_LOGGLUE" ADD CONSTRAINT "PK_XXL_JOB_LOGGLUE_ID" PRIMARY KEY ("ID");

-- ----------------------------
-- Checks structure for table XXL_JOB_LOGGLUE
-- ----------------------------
ALTER TABLE "XXL_JOB"."XXL_JOB_LOGGLUE" ADD CONSTRAINT "SYS_C008540" CHECK ("ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "XXL_JOB"."XXL_JOB_LOGGLUE" ADD CONSTRAINT "SYS_C008541" CHECK ("JOB_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "XXL_JOB"."XXL_JOB_LOGGLUE" ADD CONSTRAINT "SYS_C008542" CHECK ("GLUE_REMARK" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Indexes structure for table XXL_JOB_LOGGLUE
-- ----------------------------
CREATE INDEX "XXL_JOB"."IDX_XXL_JOB_LOGGLUE_JOB_ID"
  ON "XXL_JOB"."XXL_JOB_LOGGLUE" ("JOB_ID" ASC)
  LOGGING
  ONLINE
  TABLESPACE "SYSAUX"
  NOSORT
  VISIBLE
PCTFREE 10
INITRANS 2
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
);

-- ----------------------------
-- Primary Key structure for table XXL_JOB_LOG_REPORT
-- ----------------------------
ALTER TABLE "XXL_JOB"."XXL_JOB_LOG_REPORT" ADD CONSTRAINT "PK_XXL_JOB_LOG_REPORT_ID" PRIMARY KEY ("ID");

-- ----------------------------
-- Checks structure for table XXL_JOB_LOG_REPORT
-- ----------------------------
ALTER TABLE "XXL_JOB"."XXL_JOB_LOG_REPORT" ADD CONSTRAINT "SYS_C008554" CHECK ("ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "XXL_JOB"."XXL_JOB_LOG_REPORT" ADD CONSTRAINT "SYS_C008555" CHECK ("RUNNING_COUNT" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "XXL_JOB"."XXL_JOB_LOG_REPORT" ADD CONSTRAINT "SYS_C008556" CHECK ("SUC_COUNT" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "XXL_JOB"."XXL_JOB_LOG_REPORT" ADD CONSTRAINT "SYS_C008557" CHECK ("FAIL_COUNT" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table XXL_JOB_REGISTRY
-- ----------------------------
ALTER TABLE "XXL_JOB"."XXL_JOB_REGISTRY" ADD CONSTRAINT "PK_XXL_JOB_REGISTRY_ID" PRIMARY KEY ("ID");

-- ----------------------------
-- Checks structure for table XXL_JOB_REGISTRY
-- ----------------------------
ALTER TABLE "XXL_JOB"."XXL_JOB_REGISTRY" ADD CONSTRAINT "SYS_C008544" CHECK ("ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "XXL_JOB"."XXL_JOB_REGISTRY" ADD CONSTRAINT "SYS_C008545" CHECK ("REGISTRY_GROUP" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "XXL_JOB"."XXL_JOB_REGISTRY" ADD CONSTRAINT "SYS_C008546" CHECK ("REGISTRY_KEY" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "XXL_JOB"."XXL_JOB_REGISTRY" ADD CONSTRAINT "SYS_C008547" CHECK ("REGISTRY_VALUE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Indexes structure for table XXL_JOB_REGISTRY
-- ----------------------------
CREATE INDEX "XXL_JOB"."IDX_REGISTRY_GROUP"
  ON "XXL_JOB"."XXL_JOB_REGISTRY" ("REGISTRY_GROUP" ASC)
  LOGGING
  TABLESPACE "SYSAUX"
  VISIBLE
PCTFREE 10
INITRANS 2
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
);
CREATE INDEX "XXL_JOB"."IDX_UPDATE_TIME"
  ON "XXL_JOB"."XXL_JOB_REGISTRY" ("UPDATE_TIME" ASC) LOCAL
  LOGGING
  ONLINE
  TABLESPACE "SYSAUX"
  NOSORT
  VISIBLE
PCTFREE 10
INITRANS 2
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
);

-- ----------------------------
-- Primary Key structure for table XXL_JOB_USER
-- ----------------------------
ALTER TABLE "XXL_JOB"."XXL_JOB_USER" ADD CONSTRAINT "PK_XXL_JOB_USER_ID" PRIMARY KEY ("ID");

-- ----------------------------
-- Checks structure for table XXL_JOB_USER
-- ----------------------------
ALTER TABLE "XXL_JOB"."XXL_JOB_USER" ADD CONSTRAINT "SYS_C008549" CHECK ("ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "XXL_JOB"."XXL_JOB_USER" ADD CONSTRAINT "SYS_C008550" CHECK ("USERNAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "XXL_JOB"."XXL_JOB_USER" ADD CONSTRAINT "SYS_C008551" CHECK ("PASSWORD" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "XXL_JOB"."XXL_JOB_USER" ADD CONSTRAINT "SYS_C008552" CHECK ("ROLE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
COMMIT;
