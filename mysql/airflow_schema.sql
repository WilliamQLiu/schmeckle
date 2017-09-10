-- MySQL dump 10.13  Distrib 5.7.19, for Linux (x86_64)
--
-- Host: localhost    Database: airflow
-- ------------------------------------------------------
-- Server version	5.7.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alembic_version`
--

DROP TABLE IF EXISTS `alembic_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL,
  PRIMARY KEY (`version_num`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chart`
--

DROP TABLE IF EXISTS `chart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(200) DEFAULT NULL,
  `conn_id` varchar(250) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `chart_type` varchar(100) DEFAULT NULL,
  `sql_layout` varchar(50) DEFAULT NULL,
  `sql` text,
  `y_log_scale` tinyint(1) DEFAULT NULL,
  `show_datatable` tinyint(1) DEFAULT NULL,
  `show_sql` tinyint(1) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `default_params` varchar(5000) DEFAULT NULL,
  `x_is_date` tinyint(1) DEFAULT NULL,
  `iteration_no` int(11) DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `chart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `connection`
--

DROP TABLE IF EXISTS `connection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `connection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `conn_id` varchar(250) DEFAULT NULL,
  `conn_type` varchar(500) DEFAULT NULL,
  `host` varchar(500) DEFAULT NULL,
  `schema` varchar(500) DEFAULT NULL,
  `login` varchar(500) DEFAULT NULL,
  `password` varchar(500) DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `extra` varchar(5000) DEFAULT NULL,
  `is_encrypted` tinyint(1) DEFAULT NULL,
  `is_extra_encrypted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dag`
--

DROP TABLE IF EXISTS `dag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dag` (
  `dag_id` varchar(250) NOT NULL,
  `is_paused` tinyint(1) DEFAULT NULL,
  `is_subdag` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `last_scheduler_run` datetime(6) DEFAULT NULL,
  `last_pickled` datetime(6) DEFAULT NULL,
  `last_expired` datetime(6) DEFAULT NULL,
  `scheduler_lock` tinyint(1) DEFAULT NULL,
  `pickle_id` int(11) DEFAULT NULL,
  `fileloc` varchar(2000) DEFAULT NULL,
  `owners` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`dag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dag_pickle`
--

DROP TABLE IF EXISTS `dag_pickle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dag_pickle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pickle` blob,
  `created_dttm` datetime(6) DEFAULT NULL,
  `pickle_hash` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dag_run`
--

DROP TABLE IF EXISTS `dag_run`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dag_run` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dag_id` varchar(250) DEFAULT NULL,
  `execution_date` datetime(6) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `run_id` varchar(250) DEFAULT NULL,
  `external_trigger` tinyint(1) DEFAULT NULL,
  `conf` blob,
  `end_date` datetime(6) DEFAULT NULL,
  `start_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dag_id` (`dag_id`,`execution_date`),
  UNIQUE KEY `dag_id_2` (`dag_id`,`run_id`),
  KEY `dag_id_state` (`dag_id`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dag_stats`
--

DROP TABLE IF EXISTS `dag_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dag_stats` (
  `dag_id` varchar(250) NOT NULL,
  `state` varchar(50) NOT NULL,
  `count` int(11) NOT NULL,
  `dirty` tinyint(1) NOT NULL,
  PRIMARY KEY (`dag_id`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `import_error`
--

DROP TABLE IF EXISTS `import_error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `import_error` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` datetime(6) DEFAULT NULL,
  `filename` varchar(1024) DEFAULT NULL,
  `stacktrace` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dag_id` varchar(250) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `job_type` varchar(30) DEFAULT NULL,
  `start_date` datetime(6) DEFAULT NULL,
  `end_date` datetime(6) DEFAULT NULL,
  `latest_heartbeat` datetime(6) DEFAULT NULL,
  `executor_class` varchar(500) DEFAULT NULL,
  `hostname` varchar(500) DEFAULT NULL,
  `unixname` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job_type_heart` (`job_type`,`latest_heartbeat`),
  KEY `idx_job_state_heartbeat` (`state`,`latest_heartbeat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `known_event`
--

DROP TABLE IF EXISTS `known_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `known_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(200) DEFAULT NULL,
  `start_date` datetime(6) DEFAULT NULL,
  `end_date` datetime(6) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `known_event_type_id` int(11) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `known_event_type_id` (`known_event_type_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `known_event_ibfk_1` FOREIGN KEY (`known_event_type_id`) REFERENCES `known_event_type` (`id`),
  CONSTRAINT `known_event_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `known_event_type`
--

DROP TABLE IF EXISTS `known_event_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `known_event_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `know_event_type` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dttm` datetime(6) DEFAULT NULL,
  `dag_id` varchar(250) DEFAULT NULL,
  `task_id` varchar(250) DEFAULT NULL,
  `event` varchar(30) DEFAULT NULL,
  `execution_date` datetime(6) DEFAULT NULL,
  `owner` varchar(500) DEFAULT NULL,
  `extra` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sla_miss`
--

DROP TABLE IF EXISTS `sla_miss`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sla_miss` (
  `task_id` varchar(250) NOT NULL,
  `dag_id` varchar(250) NOT NULL,
  `execution_date` datetime(6) NOT NULL,
  `email_sent` tinyint(1) DEFAULT NULL,
  `timestamp` datetime(6) DEFAULT NULL,
  `description` text,
  `notification_sent` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`task_id`,`dag_id`,`execution_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `slot_pool`
--

DROP TABLE IF EXISTS `slot_pool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slot_pool` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pool` varchar(50) DEFAULT NULL,
  `slots` int(11) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pool` (`pool`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_fail`
--

DROP TABLE IF EXISTS `task_fail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_fail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` varchar(250) NOT NULL,
  `dag_id` varchar(250) NOT NULL,
  `execution_date` datetime(6) DEFAULT NULL,
  `start_date` datetime(6) DEFAULT NULL,
  `end_date` datetime(6) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_instance`
--

DROP TABLE IF EXISTS `task_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_instance` (
  `task_id` varchar(250) NOT NULL,
  `dag_id` varchar(250) NOT NULL,
  `execution_date` datetime(6) NOT NULL,
  `start_date` datetime(6) DEFAULT NULL,
  `end_date` datetime(6) DEFAULT NULL,
  `duration` float DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `try_number` int(11) DEFAULT NULL,
  `hostname` varchar(1000) DEFAULT NULL,
  `unixname` varchar(1000) DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  `pool` varchar(50) DEFAULT NULL,
  `queue` varchar(50) DEFAULT NULL,
  `priority_weight` int(11) DEFAULT NULL,
  `operator` varchar(1000) DEFAULT NULL,
  `queued_dttm` datetime(6) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`task_id`,`dag_id`,`execution_date`),
  KEY `ti_dag_state` (`dag_id`,`state`),
  KEY `ti_pool` (`pool`,`state`,`priority_weight`),
  KEY `ti_state_lkp` (`dag_id`,`task_id`,`execution_date`,`state`),
  KEY `ti_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(250) DEFAULT NULL,
  `email` varchar(500) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `variable`
--

DROP TABLE IF EXISTS `variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `variable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(250) DEFAULT NULL,
  `val` text,
  `is_encrypted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `xcom`
--

DROP TABLE IF EXISTS `xcom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xcom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(512) DEFAULT NULL,
  `value` blob,
  `timestamp` datetime(6) DEFAULT NULL,
  `execution_date` datetime(6) DEFAULT NULL,
  `task_id` varchar(250) NOT NULL,
  `dag_id` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_xcom_dag_task_date` (`dag_id`,`task_id`,`execution_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-09 17:08:33
