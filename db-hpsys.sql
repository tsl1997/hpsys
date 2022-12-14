/*
SQLyog v10.2 
MySQL - 5.7.20 : Database - hp
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`hp` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `hp`;

/*Table structure for table `act_evt_log` */

DROP TABLE IF EXISTS `act_evt_log`;

CREATE TABLE `act_evt_log` (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_evt_log` */

/*Table structure for table `act_ge_bytearray` */

DROP TABLE IF EXISTS `act_ge_bytearray`;

CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ge_bytearray` */

/*Table structure for table `act_ge_property` */

DROP TABLE IF EXISTS `act_ge_property`;

CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ge_property` */

insert  into `act_ge_property`(`NAME_`,`VALUE_`,`REV_`) values ('cfg.execution-related-entities-count','false',1),('next.dbid','1',1),('schema.history','create(7.1.0-M6)',1),('schema.version','7.1.0-M6',1);

/*Table structure for table `act_hi_actinst` */

DROP TABLE IF EXISTS `act_hi_actinst`;

CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_actinst` */

/*Table structure for table `act_hi_attachment` */

DROP TABLE IF EXISTS `act_hi_attachment`;

CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_attachment` */

/*Table structure for table `act_hi_comment` */

DROP TABLE IF EXISTS `act_hi_comment`;

CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_comment` */

/*Table structure for table `act_hi_detail` */

DROP TABLE IF EXISTS `act_hi_detail`;

CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_detail` */

/*Table structure for table `act_hi_identitylink` */

DROP TABLE IF EXISTS `act_hi_identitylink`;

CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_identitylink` */

/*Table structure for table `act_hi_procinst` */

DROP TABLE IF EXISTS `act_hi_procinst`;

CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_procinst` */

/*Table structure for table `act_hi_taskinst` */

DROP TABLE IF EXISTS `act_hi_taskinst`;

CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_taskinst` */

/*Table structure for table `act_hi_varinst` */

DROP TABLE IF EXISTS `act_hi_varinst`;

CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_varinst` */

/*Table structure for table `act_procdef_info` */

DROP TABLE IF EXISTS `act_procdef_info`;

CREATE TABLE `act_procdef_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`),
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_procdef_info` */

/*Table structure for table `act_re_deployment` */

DROP TABLE IF EXISTS `act_re_deployment`;

CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp(3) NULL DEFAULT NULL,
  `ENGINE_VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VERSION_` int(11) DEFAULT '1',
  `PROJECT_RELEASE_VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_deployment` */

/*Table structure for table `act_re_model` */

DROP TABLE IF EXISTS `act_re_model`;

CREATE TABLE `act_re_model` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_model` */

/*Table structure for table `act_re_procdef` */

DROP TABLE IF EXISTS `act_re_procdef`;

CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `ENGINE_VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `APP_VERSION_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_procdef` */

/*Table structure for table `act_ru_deadletter_job` */

DROP TABLE IF EXISTS `act_ru_deadletter_job`;

CREATE TABLE `act_ru_deadletter_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_deadletter_job` */

/*Table structure for table `act_ru_event_subscr` */

DROP TABLE IF EXISTS `act_ru_event_subscr`;

CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_event_subscr` */

/*Table structure for table `act_ru_execution` */

DROP TABLE IF EXISTS `act_ru_execution`;

CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_MI_ROOT_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint(4) DEFAULT NULL,
  `EVT_SUBSCR_COUNT_` int(11) DEFAULT NULL,
  `TASK_COUNT_` int(11) DEFAULT NULL,
  `JOB_COUNT_` int(11) DEFAULT NULL,
  `TIMER_JOB_COUNT_` int(11) DEFAULT NULL,
  `SUSP_JOB_COUNT_` int(11) DEFAULT NULL,
  `DEADLETTER_JOB_COUNT_` int(11) DEFAULT NULL,
  `VAR_COUNT_` int(11) DEFAULT NULL,
  `ID_LINK_COUNT_` int(11) DEFAULT NULL,
  `APP_VERSION_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_IDC_EXEC_ROOT` (`ROOT_PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE,
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_execution` */

/*Table structure for table `act_ru_identitylink` */

DROP TABLE IF EXISTS `act_ru_identitylink`;

CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_identitylink` */

/*Table structure for table `act_ru_integration` */

DROP TABLE IF EXISTS `act_ru_integration`;

CREATE TABLE `act_ru_integration` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `FLOW_NODE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_DATE_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_INT_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_INT_PROC_INST` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_INT_PROC_DEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_INT_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE,
  CONSTRAINT `ACT_FK_INT_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_INT_PROC_INST` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_integration` */

/*Table structure for table `act_ru_job` */

DROP TABLE IF EXISTS `act_ru_job`;

CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_job` */

/*Table structure for table `act_ru_suspended_job` */

DROP TABLE IF EXISTS `act_ru_suspended_job`;

CREATE TABLE `act_ru_suspended_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_suspended_job` */

/*Table structure for table `act_ru_task` */

DROP TABLE IF EXISTS `act_ru_task`;

CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `APP_VERSION_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_task` */

/*Table structure for table `act_ru_timer_job` */

DROP TABLE IF EXISTS `act_ru_timer_job`;

CREATE TABLE `act_ru_timer_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_TIMER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TIMER_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_timer_job` */

/*Table structure for table `act_ru_variable` */

DROP TABLE IF EXISTS `act_ru_variable`;

CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_variable` */

/*Table structure for table `persistent_logins` */

DROP TABLE IF EXISTS `persistent_logins`;

CREATE TABLE `persistent_logins` (
  `username` varchar(64) NOT NULL,
  `series` varchar(64) NOT NULL,
  `token` varchar(64) NOT NULL,
  `last_used` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`series`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `persistent_logins` */

insert  into `persistent_logins`(`username`,`series`,`token`,`last_used`) values ('yan','gpr1AevweuhOnv5cBvYOFw==','MCfb6BNm6MB0neraAFkFuQ==','2022-11-30 22:46:54');

/*Table structure for table `t_account` */

DROP TABLE IF EXISTS `t_account`;

CREATE TABLE `t_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '??????',
  `user_name` varchar(255) DEFAULT NULL COMMENT '?????????',
  `password` varchar(255) DEFAULT NULL COMMENT '????????????',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  `update_time` datetime DEFAULT NULL COMMENT '????????????',
  `emp_id` int(11) DEFAULT NULL COMMENT '??????id',
  `status` int(255) DEFAULT '1' COMMENT '0-??????  1-??????',
  `photo` varchar(255) DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `t_account` */

insert  into `t_account`(`id`,`user_name`,`password`,`create_time`,`update_time`,`emp_id`,`status`,`photo`) values (1,'yan','$2a$10$.krderayZQ8Ln1KfBLrV.eZK5pk/q3FhAFxYMnfvpiFWw4PCAwMBm','2021-10-15 16:06:00','2021-10-15 16:06:03',1,1,'https://hy-sys.oss-cn-hongkong.aliyuncs.com/images/2022/11/22/16691218206431542.jpg'),(2,'wang','$2a$10$.krderayZQ8Ln1KfBLrV.eZK5pk/q3FhAFxYMnfvpiFWw4PCAwMBm','2022-11-30 21:41:08','2022-11-30 21:41:12',2,1,NULL),(3,'ke','$2a$10$.krderayZQ8Ln1KfBLrV.eZK5pk/q3FhAFxYMnfvpiFWw4PCAwMBm','2022-11-23 21:55:07',NULL,3,1,NULL);

/*Table structure for table `t_account_role` */

DROP TABLE IF EXISTS `t_account_role`;

CREATE TABLE `t_account_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '??????',
  `account_id` int(11) DEFAULT NULL COMMENT '??????id',
  `role_id` int(11) DEFAULT NULL COMMENT '?????? id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `t_account_role` */

insert  into `t_account_role`(`id`,`account_id`,`role_id`) values (1,1,1),(2,2,2),(3,3,3);

/*Table structure for table `t_dept` */

DROP TABLE IF EXISTS `t_dept`;

CREATE TABLE `t_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '??????id',
  `dept_num` varchar(100) DEFAULT NULL COMMENT '????????????',
  `dept_name` varchar(255) DEFAULT NULL COMMENT '????????????',
  `parent_id` int(11) DEFAULT NULL COMMENT '????????????id',
  `level` int(11) DEFAULT NULL COMMENT '????????????',
  `manager_id` int(11) DEFAULT NULL COMMENT '????????????',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  `update_time` datetime DEFAULT NULL COMMENT '????????????',
  `status` int(255) DEFAULT '1' COMMENT '0?????????   1 : ????????????   2?????????',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `t_dept` */

insert  into `t_dept`(`id`,`dept_num`,`dept_name`,`parent_id`,`level`,`manager_id`,`create_time`,`update_time`,`status`) values (1,'jxb','?????????',0,1,0,'2022-11-05 10:04:05','2022-11-05 10:04:07',1),(2,'xsb','?????????',1,2,1,'2022-11-08 14:53:24','2022-11-08 14:53:24',1),(3,'jzb','?????????',1,2,2,'2022-11-08 14:53:40','2022-11-08 14:53:40',1),(4,'jyb','?????????',2,3,1,'2022-11-08 15:06:40','2022-11-08 15:06:40',1),(5,'jy','??????',2,3,1,'2022-11-09 17:13:42','2022-11-09 17:13:44',1),(6,'bzr','?????????',3,3,2,'2022-11-09 17:17:03','2022-11-09 17:17:05',1),(13,'scb','?????????',0,1,0,'2022-11-12 15:56:17','2022-11-12 15:56:17',1),(14,'xszx','????????????',13,2,3,'2022-11-12 15:57:00','2022-11-12 15:57:00',1),(15,'dhzx','????????????',14,3,3,'2022-11-12 15:59:49','2022-11-12 15:59:49',1),(16,'wl','??????',14,3,3,'2022-11-12 16:00:02','2022-11-12 16:00:02',1),(17,'cpp','CPP??????',3,3,1,'2022-11-25 21:12:45','2022-11-25 21:12:48',1),(19,'java','Java??????',2,3,3,'2022-11-25 22:59:41','2022-11-25 23:01:07',1),(20,'jy3','??????2',2,2,2,'2022-11-26 19:02:15','2022-11-26 19:33:05',1);

/*Table structure for table `t_employee` */

DROP TABLE IF EXISTS `t_employee`;

CREATE TABLE `t_employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '??????id',
  `emp_num` varchar(255) DEFAULT NULL COMMENT '????????????',
  `emp_name` varchar(255) DEFAULT NULL COMMENT '????????????',
  `gender` varchar(255) DEFAULT NULL COMMENT '??????',
  `birthday` date DEFAULT NULL COMMENT '????????????',
  `location` varchar(255) DEFAULT NULL COMMENT '????????????',
  `on_board_date` datetime DEFAULT NULL COMMENT '????????????',
  `mobile` varchar(255) DEFAULT NULL COMMENT '?????????',
  `qq` varchar(255) DEFAULT NULL COMMENT 'qq',
  `email` varchar(255) DEFAULT NULL COMMENT '??????',
  `weixin` varchar(255) DEFAULT NULL COMMENT '??????',
  `dept_id` int(11) DEFAULT NULL COMMENT '????????????',
  `title_category_id` int(11) DEFAULT NULL COMMENT '????????????',
  `title_id` int(11) DEFAULT NULL COMMENT '??????',
  `employ_status_id` int(11) DEFAULT NULL COMMENT '????????????',
  `graduate_school` varchar(255) DEFAULT NULL COMMENT '????????????',
  `education` varchar(255) DEFAULT NULL COMMENT '??????',
  `formal_status` varchar(255) DEFAULT '0' COMMENT '0:?????????;1:?????????',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `t_employee` */

insert  into `t_employee`(`id`,`emp_num`,`emp_name`,`gender`,`birthday`,`location`,`on_board_date`,`mobile`,`qq`,`email`,`weixin`,`dept_id`,`title_category_id`,`title_id`,`employ_status_id`,`graduate_school`,`education`,`formal_status`) values (1,'001','??????','???','2022-11-11',NULL,'2022-11-11 15:27:26',NULL,NULL,NULL,NULL,1,2,NULL,1,NULL,NULL,'1'),(2,'002','?????????','???','2022-11-11',NULL,'2022-11-11 15:27:29',NULL,NULL,NULL,NULL,1,4,NULL,1,NULL,NULL,'1'),(3,'003','?????????','???','2022-11-11',NULL,'2022-11-11 16:10:27',NULL,NULL,NULL,NULL,7,4,NULL,1,NULL,NULL,'0'),(4,'004','???????????????','???','2022-11-07',NULL,'2022-11-29 08:00:00','12345678910','','','',6,4,NULL,2,'','??????','0');

/*Table structure for table `t_employee_status` */

DROP TABLE IF EXISTS `t_employee_status`;

CREATE TABLE `t_employee_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '??????',
  `name` varchar(255) DEFAULT NULL COMMENT '??????',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  `update_time` datetime DEFAULT NULL COMMENT '????????????',
  `status` int(255) DEFAULT '1' COMMENT '1-?????? 0-??????',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `t_employee_status` */

insert  into `t_employee_status`(`id`,`name`,`create_time`,`update_time`,`status`) values (1,'??????','2022-11-16 17:34:38','2022-11-16 17:34:43',1),(2,'??????','2022-11-16 17:34:49','2022-11-16 17:34:51',1);

/*Table structure for table `t_menu` */

DROP TABLE IF EXISTS `t_menu`;

CREATE TABLE `t_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '????????????',
  `menu_name` varchar(255) DEFAULT NULL COMMENT '????????????',
  `menu_style` varchar(255) DEFAULT NULL COMMENT '????????????',
  `url` varchar(255) DEFAULT NULL COMMENT '??????',
  `parent_id` int(11) DEFAULT NULL COMMENT '????????????id',
  `parent_opt_value` varchar(255) DEFAULT NULL COMMENT '??????????????????',
  `grade` int(11) DEFAULT NULL COMMENT '??????',
  `opt_value` varchar(255) DEFAULT NULL COMMENT '?????????',
  `orders` int(11) DEFAULT NULL COMMENT '??????',
  `is_valid` tinyint(4) DEFAULT NULL COMMENT '????????????',
  `create_date` datetime DEFAULT NULL COMMENT '????????????',
  `update_date` datetime DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `t_menu` */

insert  into `t_menu`(`id`,`menu_name`,`menu_style`,`url`,`parent_id`,`parent_opt_value`,`grade`,`opt_value`,`orders`,`is_valid`,`create_date`,`update_date`) values (1,'????????????','','#',-1,NULL,0,'10',1,1,'2017-09-28 00:00:00','2020-02-17 15:46:59'),(2,'??????????????????','','saleChance/index',1,NULL,1,'1010',1,1,'2017-09-28 00:00:00','2020-02-17 15:47:26'),(3,'????????????????????????','','#',2,NULL,2,'101001',2,1,'2017-09-28 00:00:00','2020-02-17 15:47:51'),(4,'????????????????????????','','#',2,NULL,2,'101002',2,1,'2017-09-28 00:00:00','2021-05-29 14:41:40'),(5,'????????????????????????','','#',2,NULL,2,'101003',3,1,'2017-09-28 00:00:00','2017-09-28 00:00:00'),(6,'??????????????????','','cus_dev_plan/index',1,NULL,1,'1020',2,1,'2017-09-28 00:00:00','2017-09-28 00:00:00'),(7,'????????????','','#',6,NULL,2,'102001',1,1,'2017-09-28 00:00:00','2017-09-28 00:00:00'),(8,'????????????','','customer/index',-1,NULL,0,'20',3,1,'2017-07-01 00:00:00','2017-07-01 00:00:00'),(9,'??????????????????','','customer/index',8,NULL,1,'2010',1,1,'2017-09-06 00:00:00','2017-09-06 00:00:00'),(10,'??????','','#',9,NULL,2,'201001',1,1,'2017-07-01 00:00:00','2017-07-01 00:00:00'),(11,'??????','','#',9,NULL,2,'201002',2,1,'2017-07-01 00:00:00','2017-07-01 00:00:00'),(12,'??????????????????','','customer_loss/index',8,NULL,1,'2020',2,1,'2017-08-17 00:00:00','2017-08-17 00:00:00'),(13,'????????????','','openCustomerReprieve',12,NULL,2,'202001',1,1,'2017-09-23 00:00:00','2017-09-23 00:00:00'),(14,'????????????','','#',-1,NULL,0,'40',4,1,'2017-08-15 00:00:00','2017-08-15 00:00:00'),(15,'??????????????????','','report/1',14,NULL,1,'4010',1,1,'2017-08-15 00:00:00','2017-08-15 00:00:00'),(16,'????????????','','#',-1,NULL,0,'30',3,1,'2017-08-18 00:00:00','2017-08-18 00:00:00'),(17,'??????????????????','','#',-1,NULL,0,'50',5,1,'2017-08-18 00:00:00','2017-08-18 00:00:00'),(18,'????????????','','#',-1,NULL,0,'60',6,1,'2017-08-18 00:00:00','2017-08-18 00:00:00'),(19,'??????','','#',9,NULL,2,'201003',3,1,'2017-08-18 00:00:00','2017-08-18 00:00:00'),(26,'????????????','','user/index',18,NULL,1,'6010',NULL,1,'2017-10-24 16:54:12','2017-10-24 16:54:12'),(27,'????????????','','role/index',18,NULL,1,'6020',NULL,1,'2018-01-13 11:29:17','2018-01-13 11:29:19'),(28,'????????????','','module/index/1',18,NULL,1,'6030',NULL,1,'2018-01-13 11:29:40','2018-01-13 11:29:42'),(34,'????????????','',NULL,16,NULL,1,'3010',NULL,1,'2018-01-16 09:21:59','2018-01-16 09:22:02'),(35,'????????????','',NULL,16,NULL,1,'3020',NULL,1,'2018-01-16 09:22:26','2018-01-16 09:22:28'),(36,'????????????','',NULL,16,NULL,1,'3030',NULL,1,'2018-01-16 09:22:47','2018-01-16 09:22:50'),(37,'????????????','',NULL,16,NULL,1,'3040',NULL,1,'2018-01-16 09:23:11','2018-01-16 09:23:13'),(38,'????????????','',NULL,16,NULL,1,'3050',NULL,1,'2018-01-16 09:23:37','2018-01-16 09:23:39'),(39,'??????????????????','',NULL,14,NULL,NULL,'4020',NULL,1,'2018-01-16 14:57:24','2018-01-16 14:57:27'),(40,'??????????????????','',NULL,14,NULL,NULL,'4030',NULL,1,'2018-01-16 16:14:48','2018-01-16 16:14:50'),(44,'????????????????????????','',NULL,2,NULL,2,'101004',NULL,1,'2019-09-25 15:22:12','2020-01-15 10:43:09'),(102,'??????????????????','','sale_chance/xxx',17,NULL,1,'5010',NULL,1,'2019-09-26 11:07:00','2019-09-26 11:07:00'),(103,'??????????????????','','#',17,NULL,2,'5020',NULL,1,'2019-09-26 11:13:14','2019-09-26 11:13:14'),(109,'??????????????????','','report/r01',14,NULL,1,'4060',NULL,1,'2019-11-09 16:31:58','2019-11-09 16:31:58'),(126,'??????????????????','',NULL,12,NULL,2,'123213',12323,1,'2020-02-17 15:25:53','2020-02-17 15:25:53'),(130,'????????????','',NULL,26,NULL,2,'601001',NULL,1,'2020-02-17 15:55:45','2020-02-17 15:55:45'),(131,'????????????','',NULL,26,NULL,2,'601002',NULL,1,'2020-02-17 15:56:04','2020-02-17 15:56:04'),(132,'????????????','',NULL,26,NULL,2,'601003',NULL,1,'2020-02-17 15:56:20','2020-02-17 15:56:20'),(133,'????????????','',NULL,26,NULL,2,'601004',NULL,1,'2020-02-17 15:56:36','2020-02-17 15:56:36'),(134,'????????????','',NULL,27,NULL,2,'602001',NULL,1,'2020-02-17 15:56:53','2020-02-17 15:56:53'),(135,'????????????','',NULL,27,NULL,2,'602002',NULL,1,'2020-02-17 15:57:08','2020-02-17 15:57:08'),(136,'????????????','',NULL,27,NULL,2,'602003',NULL,1,'2020-02-17 15:57:23','2020-02-17 15:57:23'),(137,'????????????','',NULL,27,NULL,2,'602004',NULL,1,'2020-02-17 15:57:37','2020-02-17 15:57:37'),(138,'????????????','',NULL,28,NULL,2,'603001',NULL,1,'2020-02-17 15:57:57','2020-02-17 15:57:57'),(139,'????????????','',NULL,28,NULL,2,'603002',NULL,1,'2020-02-17 15:58:18','2020-02-17 15:58:18'),(140,'????????????','',NULL,28,NULL,2,'603003',NULL,1,'2020-02-17 15:58:31','2020-02-17 15:58:31'),(141,'????????????','',NULL,28,NULL,2,'603004',NULL,1,'2020-02-17 15:58:45','2020-02-17 15:58:45'),(142,'????????????','','data_dic/index',18,NULL,1,'6040',NULL,1,'2020-02-20 21:30:11','2020-02-20 21:30:53'),(143,'????????????','',NULL,142,NULL,2,'604001',NULL,1,'2020-02-20 21:31:12','2020-02-20 21:31:12'),(144,'????????????','',NULL,142,NULL,2,'604002',NULL,1,'2020-02-20 21:31:31','2020-02-20 21:31:31'),(145,'????????????','',NULL,142,NULL,2,'604003',NULL,1,'2020-02-20 21:31:47','2020-02-20 21:31:47'),(146,'????????????','',NULL,142,NULL,2,'604004',NULL,1,'2020-02-20 21:32:03','2020-02-20 21:32:03'),(147,'??????????????????','',NULL,34,NULL,2,'301001',NULL,1,'2020-02-20 21:32:39','2020-02-20 21:34:40'),(149,'??????????????????','',NULL,35,NULL,2,'302001',NULL,1,'2020-02-20 21:34:31','2020-02-20 21:34:31'),(150,'??????????????????','',NULL,36,NULL,2,'303001',NULL,1,'2020-02-20 21:34:56','2020-02-20 21:34:56'),(151,'????????????','',NULL,36,NULL,2,'303002',NULL,1,'2020-02-20 21:35:20','2020-02-20 21:35:20'),(152,'??????????????????','',NULL,37,NULL,2,'304001',NULL,1,'2020-02-20 21:35:43','2020-02-20 21:35:43'),(153,'????????????','',NULL,37,NULL,2,'304002',NULL,1,'2020-02-20 21:35:57','2020-02-20 21:35:57'),(154,'????????????',NULL,'test/index',1,NULL,1,'1030',NULL,1,'2020-11-13 02:57:06','2020-11-13 02:57:06'),(155,'????????????',NULL,NULL,-1,NULL,0,'70',NULL,1,'2020-11-13 02:58:52','2020-11-13 02:58:52'),(156,'??????????????????',NULL,'aa/index',155,NULL,1,'7010',NULL,1,'2020-11-13 03:00:11','2020-11-13 03:00:11'),(157,'??????????????????',NULL,NULL,156,NULL,2,'701001',NULL,1,'2020-11-13 03:00:51','2020-11-13 03:00:51'),(158,'????????????1','',NULL,-1,NULL,0,'100',NULL,1,'2020-11-13 03:32:21','2020-11-13 04:26:26'),(159,'????????????2','',NULL,-1,NULL,0,'90',NULL,0,'2020-11-13 03:33:38','2020-11-13 04:53:37'),(160,'??????????????????2','','test001/index',158,NULL,1,'10010',NULL,1,'2020-11-13 03:34:14','2020-11-13 04:26:49'),(161,'??????????????????001','',NULL,160,NULL,2,'1001001',NULL,1,'2020-11-13 03:34:34','2020-11-13 04:27:18'),(162,'??????????????????03','',NULL,160,NULL,2,'801003',NULL,1,'2020-11-13 03:34:47','2020-11-13 04:05:44');

/*Table structure for table `t_permission` */

DROP TABLE IF EXISTS `t_permission`;

CREATE TABLE `t_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL COMMENT '??????ID',
  `menu_id` int(11) DEFAULT NULL COMMENT '??????ID',
  `acl_value` varchar(255) DEFAULT NULL COMMENT '?????????',
  `create_date` datetime DEFAULT NULL COMMENT '????????????',
  `update_date` datetime DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6765 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `t_permission` */

insert  into `t_permission`(`id`,`role_id`,`menu_id`,`acl_value`,`create_date`,`update_date`) values (6696,2,1,'10','2021-05-29 00:39:30','2021-05-29 00:39:30'),(6697,2,2,'1010','2021-05-29 00:39:30','2021-05-29 00:39:30'),(6698,2,3,'101001','2021-05-29 00:39:30','2021-05-29 00:39:30'),(6699,2,4,'101002','2021-05-29 00:39:30','2021-05-29 00:39:30'),(6700,2,5,'101003','2021-05-29 00:39:30','2021-05-29 00:39:30'),(6701,2,44,'101004','2021-05-29 00:39:30','2021-05-29 00:39:30'),(6702,2,6,'1020','2021-05-29 00:39:30','2021-05-29 00:39:30'),(6703,2,7,'102001','2021-05-29 00:39:30','2021-05-29 00:39:30'),(6704,2,158,'100','2021-05-29 00:39:30','2021-05-29 00:39:30'),(6705,2,160,'10010','2021-05-29 00:39:30','2021-05-29 00:39:30'),(6706,2,161,'1001001','2021-05-29 00:39:30','2021-05-29 00:39:30'),(6707,2,162,'801003','2021-05-29 00:39:30','2021-05-29 00:39:30'),(6708,1,1,'10','2021-06-03 21:14:53','2021-06-03 21:14:53'),(6709,1,2,'1010','2021-06-03 21:14:53','2021-06-03 21:14:53'),(6710,1,3,'101001','2021-06-03 21:14:53','2021-06-03 21:14:53'),(6711,1,4,'101002','2021-06-03 21:14:53','2021-06-03 21:14:53'),(6712,1,5,'101003','2021-06-03 21:14:53','2021-06-03 21:14:53'),(6713,1,44,'101004','2021-06-03 21:14:53','2021-06-03 21:14:53'),(6714,1,6,'1020','2021-06-03 21:14:53','2021-06-03 21:14:53'),(6715,1,7,'102001','2021-06-03 21:14:53','2021-06-03 21:14:53'),(6716,1,8,'20','2021-06-03 21:14:53','2021-06-03 21:14:53'),(6717,1,9,'2010','2021-06-03 21:14:53','2021-06-03 21:14:53'),(6718,1,10,'201001','2021-06-03 21:14:53','2021-06-03 21:14:53'),(6719,1,11,'201002','2021-06-03 21:14:53','2021-06-03 21:14:53'),(6720,1,19,'201003','2021-06-03 21:14:53','2021-06-03 21:14:53'),(6721,1,12,'2020','2021-06-03 21:14:53','2021-06-03 21:14:53'),(6722,1,13,'202001','2021-06-03 21:14:53','2021-06-03 21:14:53'),(6723,1,126,'123213','2021-06-03 21:14:53','2021-06-03 21:14:53'),(6724,1,14,'40','2021-06-03 21:14:53','2021-06-03 21:14:53'),(6725,1,15,'4010','2021-06-03 21:14:53','2021-06-03 21:14:53'),(6726,1,39,'4020','2021-06-03 21:14:53','2021-06-03 21:14:53'),(6727,1,40,'4030','2021-06-03 21:14:53','2021-06-03 21:14:53'),(6728,1,109,'4060','2021-06-03 21:14:53','2021-06-03 21:14:53'),(6729,1,16,'30','2021-06-03 21:14:53','2021-06-03 21:14:53'),(6730,1,34,'3010','2021-06-03 21:14:53','2021-06-03 21:14:53'),(6731,1,147,'301001','2021-06-03 21:14:53','2021-06-03 21:14:53'),(6732,1,35,'3020','2021-06-03 21:14:53','2021-06-03 21:14:53'),(6733,1,149,'302001','2021-06-03 21:14:53','2021-06-03 21:14:53'),(6734,1,36,'3030','2021-06-03 21:14:53','2021-06-03 21:14:53'),(6735,1,150,'303001','2021-06-03 21:14:53','2021-06-03 21:14:53'),(6736,1,151,'303002','2021-06-03 21:14:53','2021-06-03 21:14:53'),(6737,1,37,'3040','2021-06-03 21:14:53','2021-06-03 21:14:53'),(6738,1,152,'304001','2021-06-03 21:14:53','2021-06-03 21:14:53'),(6739,1,153,'304002','2021-06-03 21:14:53','2021-06-03 21:14:53'),(6740,1,38,'3050','2021-06-03 21:14:53','2021-06-03 21:14:53'),(6741,1,17,'50','2021-06-03 21:14:53','2021-06-03 21:14:53'),(6742,1,102,'5010','2021-06-03 21:14:53','2021-06-03 21:14:53'),(6743,1,103,'5020','2021-06-03 21:14:53','2021-06-03 21:14:53'),(6744,1,18,'60','2021-06-03 21:14:53','2021-06-03 21:14:53'),(6745,1,26,'6010','2021-06-03 21:14:53','2021-06-03 21:14:53'),(6746,1,130,'601001','2021-06-03 21:14:53','2021-06-03 21:14:53'),(6747,1,131,'601002','2021-06-03 21:14:53','2021-06-03 21:14:53'),(6748,1,132,'601003','2021-06-03 21:14:53','2021-06-03 21:14:53'),(6749,1,133,'601004','2021-06-03 21:14:53','2021-06-03 21:14:53'),(6750,1,27,'6020','2021-06-03 21:14:53','2021-06-03 21:14:53'),(6751,1,134,'602001','2021-06-03 21:14:53','2021-06-03 21:14:53'),(6752,1,135,'602002','2021-06-03 21:14:53','2021-06-03 21:14:53'),(6753,1,136,'602003','2021-06-03 21:14:53','2021-06-03 21:14:53'),(6754,1,137,'602004','2021-06-03 21:14:53','2021-06-03 21:14:53'),(6755,1,28,'6030','2021-06-03 21:14:53','2021-06-03 21:14:53'),(6756,1,138,'603001','2021-06-03 21:14:53','2021-06-03 21:14:53'),(6757,1,139,'603002','2021-06-03 21:14:53','2021-06-03 21:14:53'),(6758,1,140,'603003','2021-06-03 21:14:53','2021-06-03 21:14:53'),(6759,1,141,'603004','2021-06-03 21:14:53','2021-06-03 21:14:53'),(6760,1,142,'6040','2021-06-03 21:14:53','2021-06-03 21:14:53'),(6761,1,143,'604001','2021-06-03 21:14:53','2021-06-03 21:14:53'),(6762,1,144,'604002','2021-06-03 21:14:53','2021-06-03 21:14:53'),(6763,1,145,'604003','2021-06-03 21:14:53','2021-06-03 21:14:53'),(6764,1,146,'604004','2021-06-03 21:14:53','2021-06-03 21:14:53');

/*Table structure for table `t_role` */

DROP TABLE IF EXISTS `t_role`;

CREATE TABLE `t_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '??????',
  `role_name` varchar(255) DEFAULT NULL COMMENT '?????????',
  `status` varchar(255) DEFAULT '1' COMMENT '1-??????  0-??????',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  `update_time` datetime DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `t_role` */

insert  into `t_role`(`id`,`role_name`,`status`,`create_time`,`update_time`) values (1,'?????????','1','2022-11-30 21:36:38','2022-11-30 21:36:40'),(2,'??????','1','2022-11-30 21:40:10','2022-11-30 21:40:13'),(3,'?????????','1','2022-11-30 21:40:15','2022-11-30 21:40:16');

/*Table structure for table `t_title_category` */

DROP TABLE IF EXISTS `t_title_category`;

CREATE TABLE `t_title_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title_num` varchar(100) DEFAULT NULL COMMENT '????????????',
  `title_name` varchar(100) DEFAULT NULL COMMENT '????????????',
  `parent_id` int(11) DEFAULT NULL COMMENT '??????id',
  `level` int(11) DEFAULT NULL COMMENT '??????',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `status` int(11) DEFAULT '1' COMMENT '0?????????   1 : ????????????   2?????????',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `t_title_category` */

insert  into `t_title_category`(`id`,`title_num`,`title_name`,`parent_id`,`level`,`create_time`,`update_time`,`status`) values (1,'jy','??????',0,1,'2022-11-14 17:13:50','2022-11-14 17:13:52',1),(2,'javajy','java??????',1,2,'2022-11-14 17:14:05','2022-11-14 17:14:07',1),(3,'webjy','web????????????',1,2,'2022-11-14 17:14:59','2022-11-14 17:15:01',1),(4,'bzr','?????????',0,1,'2022-11-16 22:40:11','2022-11-29 22:40:19',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
