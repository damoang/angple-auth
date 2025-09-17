-- MySQL dump 10.13  Distrib 8.0.31, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: dmg-test
-- ------------------------------------------------------
-- Server version	8.0.31-google

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `dmg-test`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dmg-test` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `dmg-test`;

--
-- Table structure for table `g5_auth`
--

DROP TABLE IF EXISTS `g5_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_auth` (
  `mb_id` varchar(20) NOT NULL DEFAULT '',
  `au_menu` varchar(50) NOT NULL DEFAULT '',
  `au_auth` set('r','w','d') NOT NULL DEFAULT '',
  PRIMARY KEY (`mb_id`,`au_menu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_auth`
--

LOCK TABLES `g5_auth` WRITE;
/*!40000 ALTER TABLE `g5_auth` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_autosave`
--

DROP TABLE IF EXISTS `g5_autosave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_autosave` (
  `as_id` int NOT NULL AUTO_INCREMENT,
  `mb_id` varchar(20) NOT NULL,
  `as_uid` bigint unsigned NOT NULL,
  `as_subject` varchar(255) NOT NULL,
  `as_content` text NOT NULL,
  `as_datetime` datetime NOT NULL,
  PRIMARY KEY (`as_id`),
  UNIQUE KEY `as_uid` (`as_uid`),
  KEY `mb_id` (`mb_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_autosave`
--

LOCK TABLES `g5_autosave` WRITE;
/*!40000 ALTER TABLE `g5_autosave` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_autosave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_board`
--

DROP TABLE IF EXISTS `g5_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_board` (
  `bo_table` varchar(20) NOT NULL DEFAULT '',
  `gr_id` varchar(255) NOT NULL DEFAULT '',
  `bo_subject` varchar(255) NOT NULL DEFAULT '',
  `bo_mobile_subject` varchar(255) NOT NULL DEFAULT '',
  `bo_device` enum('both','pc','mobile') NOT NULL DEFAULT 'both',
  `bo_admin` varchar(255) NOT NULL DEFAULT '',
  `bo_list_level` tinyint NOT NULL DEFAULT '0',
  `bo_read_level` tinyint NOT NULL DEFAULT '0',
  `bo_write_level` tinyint NOT NULL DEFAULT '0',
  `bo_reply_level` tinyint NOT NULL DEFAULT '0',
  `bo_comment_level` tinyint NOT NULL DEFAULT '0',
  `bo_upload_level` tinyint NOT NULL DEFAULT '0',
  `bo_download_level` tinyint NOT NULL DEFAULT '0',
  `bo_html_level` tinyint NOT NULL DEFAULT '0',
  `bo_link_level` tinyint NOT NULL DEFAULT '0',
  `bo_count_delete` tinyint NOT NULL DEFAULT '0',
  `bo_count_modify` tinyint NOT NULL DEFAULT '0',
  `bo_read_point` int NOT NULL DEFAULT '0',
  `bo_write_point` int NOT NULL DEFAULT '0',
  `bo_comment_point` int NOT NULL DEFAULT '0',
  `bo_download_point` int NOT NULL DEFAULT '0',
  `bo_use_category` tinyint NOT NULL DEFAULT '0',
  `bo_category_list` text NOT NULL,
  `bo_use_sideview` tinyint NOT NULL DEFAULT '0',
  `bo_use_file_content` tinyint NOT NULL DEFAULT '0',
  `bo_use_secret` tinyint NOT NULL DEFAULT '0',
  `bo_use_dhtml_editor` tinyint NOT NULL DEFAULT '0',
  `bo_select_editor` varchar(50) NOT NULL DEFAULT '',
  `bo_use_rss_view` tinyint NOT NULL DEFAULT '0',
  `bo_use_good` tinyint NOT NULL DEFAULT '0',
  `bo_use_nogood` tinyint NOT NULL DEFAULT '0',
  `bo_use_name` tinyint NOT NULL DEFAULT '0',
  `bo_use_signature` tinyint NOT NULL DEFAULT '0',
  `bo_use_ip_view` tinyint NOT NULL DEFAULT '0',
  `bo_use_list_view` tinyint NOT NULL DEFAULT '0',
  `bo_use_list_file` tinyint NOT NULL DEFAULT '0',
  `bo_use_list_content` tinyint NOT NULL DEFAULT '0',
  `bo_table_width` int NOT NULL DEFAULT '0',
  `bo_subject_len` int NOT NULL DEFAULT '0',
  `bo_mobile_subject_len` int NOT NULL DEFAULT '0',
  `bo_page_rows` int NOT NULL DEFAULT '0',
  `bo_mobile_page_rows` int NOT NULL DEFAULT '0',
  `bo_new` int NOT NULL DEFAULT '0',
  `bo_hot` int NOT NULL DEFAULT '0',
  `bo_image_width` int NOT NULL DEFAULT '0',
  `bo_skin` varchar(255) NOT NULL DEFAULT '',
  `bo_mobile_skin` varchar(255) NOT NULL DEFAULT '',
  `bo_include_head` varchar(255) NOT NULL DEFAULT '',
  `bo_include_tail` varchar(255) NOT NULL DEFAULT '',
  `bo_content_head` text NOT NULL,
  `bo_mobile_content_head` text NOT NULL,
  `bo_content_tail` text NOT NULL,
  `bo_mobile_content_tail` text NOT NULL,
  `bo_insert_content` text NOT NULL,
  `bo_gallery_cols` int NOT NULL DEFAULT '0',
  `bo_gallery_width` int NOT NULL DEFAULT '0',
  `bo_gallery_height` int NOT NULL DEFAULT '0',
  `bo_mobile_gallery_width` int NOT NULL DEFAULT '0',
  `bo_mobile_gallery_height` int NOT NULL DEFAULT '0',
  `bo_upload_size` int NOT NULL DEFAULT '0',
  `bo_reply_order` tinyint NOT NULL DEFAULT '0',
  `bo_use_search` tinyint NOT NULL DEFAULT '0',
  `bo_order` int NOT NULL DEFAULT '0',
  `bo_count_write` int NOT NULL DEFAULT '0',
  `bo_count_comment` int NOT NULL DEFAULT '0',
  `bo_write_min` int NOT NULL DEFAULT '0',
  `bo_write_max` int NOT NULL DEFAULT '0',
  `bo_comment_min` int NOT NULL DEFAULT '0',
  `bo_comment_max` int NOT NULL DEFAULT '0',
  `bo_notice` text NOT NULL,
  `bo_upload_count` tinyint NOT NULL DEFAULT '0',
  `bo_use_email` tinyint NOT NULL DEFAULT '0',
  `bo_use_cert` enum('','cert','adult','hp-cert','hp-adult') NOT NULL DEFAULT '',
  `bo_use_sns` tinyint NOT NULL DEFAULT '0',
  `bo_use_captcha` tinyint NOT NULL DEFAULT '0',
  `bo_sort_field` varchar(255) NOT NULL DEFAULT '',
  `bo_1_subj` varchar(255) NOT NULL DEFAULT '',
  `bo_2_subj` varchar(255) NOT NULL DEFAULT '',
  `bo_3_subj` varchar(255) NOT NULL DEFAULT '',
  `bo_4_subj` varchar(255) NOT NULL DEFAULT '',
  `bo_5_subj` varchar(255) NOT NULL DEFAULT '',
  `bo_6_subj` varchar(255) NOT NULL DEFAULT '',
  `bo_7_subj` varchar(255) NOT NULL DEFAULT '',
  `bo_8_subj` varchar(255) NOT NULL DEFAULT '',
  `bo_9_subj` varchar(255) NOT NULL DEFAULT '',
  `bo_10_subj` varchar(255) NOT NULL DEFAULT '',
  `bo_1` varchar(255) NOT NULL DEFAULT '',
  `bo_2` varchar(255) NOT NULL DEFAULT '',
  `bo_3` varchar(255) NOT NULL DEFAULT '',
  `bo_4` varchar(255) NOT NULL DEFAULT '',
  `bo_5` varchar(255) NOT NULL DEFAULT '',
  `bo_6` varchar(255) NOT NULL DEFAULT '',
  `bo_7` varchar(255) NOT NULL DEFAULT '',
  `bo_8` varchar(255) NOT NULL DEFAULT '',
  `bo_9` varchar(255) NOT NULL DEFAULT '',
  `bo_10` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`bo_table`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_board`
--

LOCK TABLES `g5_board` WRITE;
/*!40000 ALTER TABLE `g5_board` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_board_file`
--

DROP TABLE IF EXISTS `g5_board_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_board_file` (
  `bo_table` varchar(20) NOT NULL DEFAULT '',
  `wr_id` int NOT NULL DEFAULT '0',
  `bf_no` int NOT NULL DEFAULT '0',
  `bf_source` varchar(255) NOT NULL DEFAULT '',
  `bf_file` varchar(255) NOT NULL DEFAULT '',
  `bf_download` int NOT NULL,
  `bf_content` text NOT NULL,
  `bf_fileurl` varchar(255) NOT NULL DEFAULT '',
  `bf_thumburl` varchar(255) NOT NULL DEFAULT '',
  `bf_storage` varchar(50) NOT NULL DEFAULT '',
  `bf_filesize` int NOT NULL DEFAULT '0',
  `bf_width` int NOT NULL DEFAULT '0',
  `bf_height` smallint NOT NULL DEFAULT '0',
  `bf_type` tinyint NOT NULL DEFAULT '0',
  `bf_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`bo_table`,`wr_id`,`bf_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_board_file`
--

LOCK TABLES `g5_board_file` WRITE;
/*!40000 ALTER TABLE `g5_board_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_board_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_board_good`
--

DROP TABLE IF EXISTS `g5_board_good`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_board_good` (
  `bg_id` int NOT NULL AUTO_INCREMENT,
  `bo_table` varchar(20) NOT NULL DEFAULT '',
  `wr_id` int NOT NULL DEFAULT '0',
  `mb_id` varchar(20) NOT NULL DEFAULT '',
  `bg_flag` varchar(255) NOT NULL DEFAULT '',
  `bg_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`bg_id`),
  UNIQUE KEY `fkey1` (`bo_table`,`wr_id`,`mb_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_board_good`
--

LOCK TABLES `g5_board_good` WRITE;
/*!40000 ALTER TABLE `g5_board_good` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_board_good` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_board_new`
--

DROP TABLE IF EXISTS `g5_board_new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_board_new` (
  `bn_id` int NOT NULL AUTO_INCREMENT,
  `bo_table` varchar(20) NOT NULL DEFAULT '',
  `wr_id` int NOT NULL DEFAULT '0',
  `wr_parent` int NOT NULL DEFAULT '0',
  `bn_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `mb_id` varchar(20) NOT NULL DEFAULT '',
  `wr_is_comment` tinyint NOT NULL DEFAULT '0',
  `wr_is_secret` tinyint NOT NULL DEFAULT '0',
  `wr_hit` int NOT NULL DEFAULT '0',
  `wr_comment` int NOT NULL DEFAULT '0',
  `wr_good` int NOT NULL DEFAULT '0',
  `wr_nogood` int NOT NULL DEFAULT '0',
  `wr_singo` varchar(20) NOT NULL DEFAULT '',
  `wr_image` varchar(255) NOT NULL DEFAULT '',
  `wr_video` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`bn_id`),
  KEY `mb_id` (`mb_id`),
  KEY `idx_mb_id_01` (`mb_id`,`bn_datetime`)
) ENGINE=InnoDB AUTO_INCREMENT=11948 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_board_new`
--

LOCK TABLES `g5_board_new` WRITE;
/*!40000 ALTER TABLE `g5_board_new` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_board_new` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_board_rate_average`
--

DROP TABLE IF EXISTS `g5_board_rate_average`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_board_rate_average` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `bo_table` varchar(20) NOT NULL,
  `wr_id` bigint NOT NULL,
  `rate_sum` decimal(20,0) NOT NULL,
  `rate_average` double NOT NULL,
  `rate_count` bigint NOT NULL,
  `rate_count_1` bigint NOT NULL,
  `rate_count_2` bigint NOT NULL,
  `rate_count_3` bigint NOT NULL,
  `rate_count_4` bigint NOT NULL,
  `rate_count_5` bigint NOT NULL,
  `rate_count_6` bigint NOT NULL,
  `rate_count_7` bigint NOT NULL,
  `rate_count_8` bigint NOT NULL,
  `rate_count_9` bigint NOT NULL,
  `rate_count_10` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`bo_table`,`wr_id`),
  KEY `idx_bo_table` (`bo_table`),
  KEY `idx_wr_id` (`wr_id`),
  KEY `idx_rate_count` (`rate_count`),
  KEY `idx_rate_sum` (`rate_sum`),
  KEY `idx_rate_average` (`rate_average`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_board_rate_average`
--

LOCK TABLES `g5_board_rate_average` WRITE;
/*!40000 ALTER TABLE `g5_board_rate_average` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_board_rate_average` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_cert_history`
--

DROP TABLE IF EXISTS `g5_cert_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_cert_history` (
  `cr_id` int NOT NULL AUTO_INCREMENT,
  `mb_id` varchar(20) NOT NULL DEFAULT '',
  `cr_company` varchar(255) NOT NULL DEFAULT '',
  `cr_method` varchar(255) NOT NULL DEFAULT '',
  `cr_ip` varchar(255) NOT NULL DEFAULT '',
  `cr_date` date NOT NULL DEFAULT '0000-00-00',
  `cr_time` time NOT NULL DEFAULT '00:00:00',
  PRIMARY KEY (`cr_id`),
  KEY `mb_id` (`mb_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_cert_history`
--

LOCK TABLES `g5_cert_history` WRITE;
/*!40000 ALTER TABLE `g5_cert_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_cert_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_config`
--

DROP TABLE IF EXISTS `g5_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_config` (
  `cf_id` int NOT NULL AUTO_INCREMENT,
  `cf_title` varchar(255) NOT NULL DEFAULT '',
  `cf_theme` varchar(100) NOT NULL DEFAULT '',
  `cf_admin` varchar(100) NOT NULL DEFAULT '',
  `cf_admin_email` varchar(100) NOT NULL DEFAULT '',
  `cf_admin_email_name` varchar(100) NOT NULL DEFAULT '',
  `cf_add_script` text NOT NULL,
  `cf_use_point` tinyint NOT NULL DEFAULT '0',
  `cf_point_term` int NOT NULL DEFAULT '0',
  `cf_use_copy_log` tinyint NOT NULL DEFAULT '0',
  `cf_use_email_certify` tinyint NOT NULL DEFAULT '0',
  `cf_login_point` int NOT NULL DEFAULT '0',
  `cf_cut_name` tinyint NOT NULL DEFAULT '0',
  `cf_nick_modify` int NOT NULL DEFAULT '0',
  `cf_new_skin` varchar(50) NOT NULL DEFAULT '',
  `cf_new_rows` int NOT NULL DEFAULT '0',
  `cf_search_skin` varchar(50) NOT NULL DEFAULT '',
  `cf_connect_skin` varchar(50) NOT NULL DEFAULT '',
  `cf_faq_skin` varchar(50) NOT NULL DEFAULT '',
  `cf_read_point` int NOT NULL DEFAULT '0',
  `cf_write_point` int NOT NULL DEFAULT '0',
  `cf_comment_point` int NOT NULL DEFAULT '0',
  `cf_download_point` int NOT NULL DEFAULT '0',
  `cf_write_pages` int NOT NULL DEFAULT '0',
  `cf_mobile_pages` int NOT NULL DEFAULT '0',
  `cf_link_target` varchar(50) NOT NULL DEFAULT '',
  `cf_bbs_rewrite` tinyint NOT NULL DEFAULT '0',
  `cf_delay_sec` int NOT NULL DEFAULT '0',
  `cf_filter` text NOT NULL,
  `cf_possible_ip` text NOT NULL,
  `cf_intercept_ip` text NOT NULL,
  `cf_analytics` text NOT NULL,
  `cf_add_meta` text NOT NULL,
  `cf_syndi_token` varchar(255) NOT NULL,
  `cf_syndi_except` text NOT NULL,
  `cf_member_skin` varchar(50) NOT NULL DEFAULT '',
  `cf_use_homepage` tinyint NOT NULL DEFAULT '0',
  `cf_req_homepage` tinyint NOT NULL DEFAULT '0',
  `cf_use_tel` tinyint NOT NULL DEFAULT '0',
  `cf_req_tel` tinyint NOT NULL DEFAULT '0',
  `cf_use_hp` tinyint NOT NULL DEFAULT '0',
  `cf_req_hp` tinyint NOT NULL DEFAULT '0',
  `cf_use_addr` tinyint NOT NULL DEFAULT '0',
  `cf_req_addr` tinyint NOT NULL DEFAULT '0',
  `cf_use_signature` tinyint NOT NULL DEFAULT '0',
  `cf_req_signature` tinyint NOT NULL DEFAULT '0',
  `cf_use_profile` tinyint NOT NULL DEFAULT '0',
  `cf_req_profile` tinyint NOT NULL DEFAULT '0',
  `cf_register_level` tinyint NOT NULL DEFAULT '0',
  `cf_register_point` int NOT NULL DEFAULT '0',
  `cf_icon_level` tinyint NOT NULL DEFAULT '0',
  `cf_use_recommend` tinyint NOT NULL DEFAULT '0',
  `cf_recommend_point` int NOT NULL DEFAULT '0',
  `cf_leave_day` int NOT NULL DEFAULT '0',
  `cf_search_part` int NOT NULL DEFAULT '0',
  `cf_email_use` tinyint NOT NULL DEFAULT '0',
  `cf_email_wr_super_admin` tinyint NOT NULL DEFAULT '0',
  `cf_email_wr_group_admin` tinyint NOT NULL DEFAULT '0',
  `cf_email_wr_board_admin` tinyint NOT NULL DEFAULT '0',
  `cf_email_wr_write` tinyint NOT NULL DEFAULT '0',
  `cf_email_wr_comment_all` tinyint NOT NULL DEFAULT '0',
  `cf_email_mb_super_admin` tinyint NOT NULL DEFAULT '0',
  `cf_email_mb_member` tinyint NOT NULL DEFAULT '0',
  `cf_email_po_super_admin` tinyint NOT NULL DEFAULT '0',
  `cf_prohibit_id` text NOT NULL,
  `cf_prohibit_email` text NOT NULL,
  `cf_new_del` int NOT NULL DEFAULT '0',
  `cf_memo_del` int NOT NULL DEFAULT '0',
  `cf_visit_del` int NOT NULL DEFAULT '0',
  `cf_popular_del` int NOT NULL DEFAULT '0',
  `cf_optimize_date` date NOT NULL DEFAULT '0000-00-00',
  `cf_use_member_icon` tinyint NOT NULL DEFAULT '0',
  `cf_member_icon_size` int NOT NULL DEFAULT '0',
  `cf_member_icon_width` int NOT NULL DEFAULT '0',
  `cf_member_icon_height` int NOT NULL DEFAULT '0',
  `cf_member_img_size` int NOT NULL DEFAULT '0',
  `cf_member_img_width` int NOT NULL DEFAULT '0',
  `cf_member_img_height` int NOT NULL DEFAULT '0',
  `cf_login_minutes` int NOT NULL DEFAULT '0',
  `cf_image_extension` varchar(255) NOT NULL DEFAULT '',
  `cf_flash_extension` varchar(255) NOT NULL DEFAULT '',
  `cf_movie_extension` varchar(255) NOT NULL DEFAULT '',
  `cf_formmail_is_member` tinyint NOT NULL DEFAULT '0',
  `cf_page_rows` int NOT NULL DEFAULT '0',
  `cf_mobile_page_rows` int NOT NULL DEFAULT '0',
  `cf_visit` varchar(255) NOT NULL DEFAULT '',
  `cf_max_po_id` int NOT NULL DEFAULT '0',
  `cf_stipulation` text NOT NULL,
  `cf_privacy` text NOT NULL,
  `cf_open_modify` int NOT NULL DEFAULT '0',
  `cf_memo_send_point` int NOT NULL DEFAULT '0',
  `cf_mobile_new_skin` varchar(50) NOT NULL DEFAULT '',
  `cf_mobile_search_skin` varchar(50) NOT NULL DEFAULT '',
  `cf_mobile_connect_skin` varchar(50) NOT NULL DEFAULT '',
  `cf_mobile_faq_skin` varchar(50) NOT NULL DEFAULT '',
  `cf_mobile_member_skin` varchar(50) NOT NULL DEFAULT '',
  `cf_captcha_mp3` varchar(255) NOT NULL DEFAULT '',
  `cf_editor` varchar(50) NOT NULL DEFAULT '',
  `cf_cert_use` tinyint NOT NULL DEFAULT '0',
  `cf_cert_find` tinyint NOT NULL DEFAULT '0',
  `cf_cert_ipin` varchar(255) NOT NULL DEFAULT '',
  `cf_cert_hp` varchar(255) NOT NULL DEFAULT '',
  `cf_cert_simple` varchar(255) NOT NULL DEFAULT '',
  `cf_cert_kg_cd` varchar(255) NOT NULL DEFAULT '',
  `cf_cert_kg_mid` varchar(255) NOT NULL DEFAULT '',
  `cf_cert_use_seed` tinyint NOT NULL DEFAULT '0',
  `cf_cert_kcb_cd` varchar(255) NOT NULL DEFAULT '',
  `cf_cert_kcp_cd` varchar(255) NOT NULL DEFAULT '',
  `cf_lg_mid` varchar(100) NOT NULL DEFAULT '',
  `cf_lg_mert_key` varchar(100) NOT NULL DEFAULT '',
  `cf_cert_limit` int NOT NULL DEFAULT '0',
  `cf_cert_req` tinyint NOT NULL DEFAULT '0',
  `cf_sms_use` varchar(255) NOT NULL DEFAULT '',
  `cf_sms_type` varchar(10) NOT NULL DEFAULT '',
  `cf_icode_id` varchar(255) NOT NULL DEFAULT '',
  `cf_icode_pw` varchar(255) NOT NULL DEFAULT '',
  `cf_icode_server_ip` varchar(50) NOT NULL DEFAULT '',
  `cf_icode_server_port` varchar(50) NOT NULL DEFAULT '',
  `cf_icode_token_key` varchar(100) NOT NULL DEFAULT '',
  `cf_googl_shorturl_apikey` varchar(50) NOT NULL DEFAULT '',
  `cf_social_login_use` tinyint NOT NULL DEFAULT '0',
  `cf_social_servicelist` varchar(255) NOT NULL DEFAULT '',
  `cf_payco_clientid` varchar(100) NOT NULL DEFAULT '',
  `cf_payco_secret` varchar(100) NOT NULL DEFAULT '',
  `cf_facebook_appid` varchar(100) NOT NULL,
  `cf_facebook_secret` varchar(100) NOT NULL,
  `cf_twitter_key` varchar(100) NOT NULL,
  `cf_twitter_secret` varchar(100) NOT NULL,
  `cf_google_clientid` varchar(100) NOT NULL DEFAULT '',
  `cf_google_secret` varchar(100) NOT NULL DEFAULT '',
  `cf_naver_clientid` varchar(100) NOT NULL DEFAULT '',
  `cf_naver_secret` varchar(100) NOT NULL DEFAULT '',
  `cf_kakao_rest_key` varchar(100) NOT NULL DEFAULT '',
  `cf_kakao_client_secret` varchar(100) NOT NULL DEFAULT '',
  `cf_kakao_js_apikey` varchar(100) NOT NULL,
  `cf_captcha` varchar(100) NOT NULL DEFAULT '',
  `cf_recaptcha_site_key` varchar(100) NOT NULL DEFAULT '',
  `cf_recaptcha_secret_key` varchar(100) NOT NULL DEFAULT '',
  `cf_1_subj` varchar(255) NOT NULL DEFAULT '',
  `cf_2_subj` varchar(255) NOT NULL DEFAULT '',
  `cf_3_subj` varchar(255) NOT NULL DEFAULT '',
  `cf_4_subj` varchar(255) NOT NULL DEFAULT '',
  `cf_5_subj` varchar(255) NOT NULL DEFAULT '',
  `cf_6_subj` varchar(255) NOT NULL DEFAULT '',
  `cf_7_subj` varchar(255) NOT NULL DEFAULT '',
  `cf_8_subj` varchar(255) NOT NULL DEFAULT '',
  `cf_9_subj` varchar(255) NOT NULL DEFAULT '',
  `cf_10_subj` varchar(255) NOT NULL DEFAULT '',
  `cf_1` varchar(255) NOT NULL DEFAULT '',
  `cf_2` varchar(255) NOT NULL DEFAULT '',
  `cf_3` varchar(255) NOT NULL DEFAULT '',
  `cf_4` varchar(255) NOT NULL DEFAULT '',
  `cf_5` varchar(255) NOT NULL DEFAULT '',
  `cf_6` varchar(255) NOT NULL DEFAULT '',
  `cf_7` varchar(255) NOT NULL DEFAULT '',
  `cf_8` varchar(255) NOT NULL DEFAULT '',
  `cf_9` varchar(255) NOT NULL DEFAULT '',
  `cf_10` varchar(255) NOT NULL DEFAULT '',
  `na_optimize_date` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`cf_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_config`
--

LOCK TABLES `g5_config` WRITE;
/*!40000 ALTER TABLE `g5_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_content`
--

DROP TABLE IF EXISTS `g5_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_content` (
  `co_id` varchar(20) NOT NULL DEFAULT '',
  `co_html` tinyint NOT NULL DEFAULT '0',
  `co_shop` tinyint NOT NULL DEFAULT '0',
  `co_level` tinyint NOT NULL DEFAULT '0',
  `co_subject` varchar(255) NOT NULL DEFAULT '',
  `co_content` longtext NOT NULL,
  `co_seo_title` varchar(255) NOT NULL DEFAULT '',
  `co_mobile_content` longtext NOT NULL,
  `co_skin` varchar(255) NOT NULL DEFAULT '',
  `co_mobile_skin` varchar(255) NOT NULL DEFAULT '',
  `co_tag_filter_use` tinyint NOT NULL DEFAULT '0',
  `co_hit` int NOT NULL DEFAULT '0',
  `co_include_head` varchar(255) NOT NULL,
  `co_include_tail` varchar(255) NOT NULL,
  PRIMARY KEY (`co_id`),
  KEY `co_seo_title` (`co_seo_title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_content`
--

LOCK TABLES `g5_content` WRITE;
/*!40000 ALTER TABLE `g5_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_da_content_history`
--

DROP TABLE IF EXISTS `g5_da_content_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_da_content_history` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bo_table` varchar(20) NOT NULL,
  `wr_id` int unsigned NOT NULL,
  `wr_is_comment` tinyint NOT NULL DEFAULT '0',
  `mb_id` varchar(20) NOT NULL,
  `wr_name` varchar(255) NOT NULL,
  `operation` enum('수정','삭제') NOT NULL,
  `operated_by` varchar(20) NOT NULL,
  `operated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `previous_data` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_bo_table_wr_id` (`bo_table`,`wr_id`),
  KEY `idx_operated_at` (`operated_at`),
  KEY `idx_mb_id` (`mb_id`),
  KEY `idx_operated_by` (`operated_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_da_content_history`
--

LOCK TABLES `g5_da_content_history` WRITE;
/*!40000 ALTER TABLE `g5_da_content_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_da_content_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_da_editor_images`
--

DROP TABLE IF EXISTS `g5_da_editor_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_da_editor_images` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `filepath` varchar(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `filesize` int unsigned NOT NULL,
  `filehash` varchar(100) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `uploaded_count` int DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `filehash` (`filehash`,`filesize`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_da_editor_images`
--

LOCK TABLES `g5_da_editor_images` WRITE;
/*!40000 ALTER TABLE `g5_da_editor_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_da_editor_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_faq`
--

DROP TABLE IF EXISTS `g5_faq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_faq` (
  `fa_id` int NOT NULL AUTO_INCREMENT,
  `fm_id` int NOT NULL DEFAULT '0',
  `fa_subject` text NOT NULL,
  `fa_content` text NOT NULL,
  `fa_order` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`fa_id`),
  KEY `fm_id` (`fm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_faq`
--

LOCK TABLES `g5_faq` WRITE;
/*!40000 ALTER TABLE `g5_faq` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_faq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_faq_master`
--

DROP TABLE IF EXISTS `g5_faq_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_faq_master` (
  `fm_id` int NOT NULL AUTO_INCREMENT,
  `fm_subject` varchar(255) NOT NULL DEFAULT '',
  `fm_head_html` text NOT NULL,
  `fm_tail_html` text NOT NULL,
  `fm_mobile_head_html` text NOT NULL,
  `fm_mobile_tail_html` text NOT NULL,
  `fm_order` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`fm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_faq_master`
--

LOCK TABLES `g5_faq_master` WRITE;
/*!40000 ALTER TABLE `g5_faq_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_faq_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_group`
--

DROP TABLE IF EXISTS `g5_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_group` (
  `gr_id` varchar(10) NOT NULL DEFAULT '',
  `gr_subject` varchar(255) NOT NULL DEFAULT '',
  `gr_device` enum('both','pc','mobile') NOT NULL DEFAULT 'both',
  `gr_admin` varchar(255) NOT NULL DEFAULT '',
  `gr_use_access` tinyint NOT NULL DEFAULT '0',
  `gr_order` int NOT NULL DEFAULT '0',
  `gr_1_subj` varchar(255) NOT NULL DEFAULT '',
  `gr_2_subj` varchar(255) NOT NULL DEFAULT '',
  `gr_3_subj` varchar(255) NOT NULL DEFAULT '',
  `gr_4_subj` varchar(255) NOT NULL DEFAULT '',
  `gr_5_subj` varchar(255) NOT NULL DEFAULT '',
  `gr_6_subj` varchar(255) NOT NULL DEFAULT '',
  `gr_7_subj` varchar(255) NOT NULL DEFAULT '',
  `gr_8_subj` varchar(255) NOT NULL DEFAULT '',
  `gr_9_subj` varchar(255) NOT NULL DEFAULT '',
  `gr_10_subj` varchar(255) NOT NULL DEFAULT '',
  `gr_1` varchar(255) NOT NULL DEFAULT '',
  `gr_2` varchar(255) NOT NULL DEFAULT '',
  `gr_3` varchar(255) NOT NULL DEFAULT '',
  `gr_4` varchar(255) NOT NULL DEFAULT '',
  `gr_5` varchar(255) NOT NULL DEFAULT '',
  `gr_6` varchar(255) NOT NULL DEFAULT '',
  `gr_7` varchar(255) NOT NULL DEFAULT '',
  `gr_8` varchar(255) NOT NULL DEFAULT '',
  `gr_9` varchar(255) NOT NULL DEFAULT '',
  `gr_10` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`gr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_group`
--

LOCK TABLES `g5_group` WRITE;
/*!40000 ALTER TABLE `g5_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_group_member`
--

DROP TABLE IF EXISTS `g5_group_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_group_member` (
  `gm_id` int NOT NULL AUTO_INCREMENT,
  `gr_id` varchar(255) NOT NULL DEFAULT '',
  `mb_id` varchar(20) NOT NULL DEFAULT '',
  `gm_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`gm_id`),
  KEY `gr_id` (`gr_id`),
  KEY `mb_id` (`mb_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_group_member`
--

LOCK TABLES `g5_group_member` WRITE;
/*!40000 ALTER TABLE `g5_group_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_group_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_login`
--

DROP TABLE IF EXISTS `g5_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_login` (
  `lo_id` int NOT NULL AUTO_INCREMENT,
  `lo_ip` varchar(100) NOT NULL DEFAULT '',
  `mb_id` varchar(20) NOT NULL DEFAULT '',
  `lo_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lo_location` text NOT NULL,
  `lo_url` text NOT NULL,
  PRIMARY KEY (`lo_id`),
  UNIQUE KEY `lo_ip_unique` (`lo_ip`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_login`
--

LOCK TABLES `g5_login` WRITE;
/*!40000 ALTER TABLE `g5_login` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_mail`
--

DROP TABLE IF EXISTS `g5_mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_mail` (
  `ma_id` int NOT NULL AUTO_INCREMENT,
  `ma_subject` varchar(255) NOT NULL DEFAULT '',
  `ma_content` mediumtext NOT NULL,
  `ma_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ma_ip` varchar(255) NOT NULL DEFAULT '',
  `ma_last_option` text NOT NULL,
  PRIMARY KEY (`ma_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_mail`
--

LOCK TABLES `g5_mail` WRITE;
/*!40000 ALTER TABLE `g5_mail` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_mail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_member`
--

DROP TABLE IF EXISTS `g5_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_member` (
  `mb_no` int NOT NULL AUTO_INCREMENT,
  `mb_id` varchar(20) NOT NULL DEFAULT '',
  `mb_password` varchar(255) NOT NULL DEFAULT '',
  `mb_name` varchar(255) NOT NULL DEFAULT '',
  `mb_nick` varchar(255) NOT NULL DEFAULT '',
  `mb_nick_date` date NOT NULL DEFAULT '0000-00-00',
  `mb_email` varchar(255) NOT NULL DEFAULT '',
  `mb_homepage` varchar(255) NOT NULL DEFAULT '',
  `mb_level` tinyint NOT NULL DEFAULT '0',
  `mb_sex` char(1) NOT NULL DEFAULT '',
  `mb_birth` varchar(255) NOT NULL DEFAULT '',
  `mb_tel` varchar(255) NOT NULL DEFAULT '',
  `mb_hp` varchar(255) NOT NULL DEFAULT '',
  `mb_certify` varchar(20) NOT NULL DEFAULT '',
  `mb_adult` tinyint NOT NULL DEFAULT '0',
  `mb_dupinfo` varchar(255) NOT NULL DEFAULT '',
  `mb_zip1` char(3) NOT NULL DEFAULT '',
  `mb_zip2` char(3) NOT NULL DEFAULT '',
  `mb_addr1` varchar(255) NOT NULL DEFAULT '',
  `mb_addr2` varchar(255) NOT NULL DEFAULT '',
  `mb_addr3` varchar(255) NOT NULL DEFAULT '',
  `mb_addr_jibeon` varchar(255) NOT NULL DEFAULT '',
  `mb_signature` text NOT NULL,
  `mb_recommend` varchar(255) NOT NULL DEFAULT '',
  `mb_point` int NOT NULL DEFAULT '0',
  `mb_today_login` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `mb_login_ip` varchar(255) NOT NULL DEFAULT '',
  `mb_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `mb_ip` varchar(255) NOT NULL DEFAULT '',
  `mb_leave_date` varchar(8) NOT NULL DEFAULT '',
  `mb_intercept_date` varchar(8) NOT NULL DEFAULT '',
  `mb_email_certify` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `mb_email_certify2` varchar(255) NOT NULL DEFAULT '',
  `mb_memo` text NOT NULL,
  `mb_lost_certify` varchar(255) NOT NULL,
  `mb_mailling` tinyint NOT NULL DEFAULT '0',
  `mb_sms` tinyint NOT NULL DEFAULT '0',
  `mb_open` tinyint NOT NULL DEFAULT '0',
  `mb_open_date` date NOT NULL DEFAULT '0000-00-00',
  `mb_profile` text NOT NULL,
  `mb_memo_call` varchar(255) NOT NULL DEFAULT '',
  `mb_memo_cnt` int NOT NULL DEFAULT '0',
  `mb_scrap_cnt` int NOT NULL DEFAULT '0',
  `mb_1` varchar(255) NOT NULL DEFAULT '',
  `mb_2` varchar(255) NOT NULL DEFAULT '',
  `mb_3` varchar(255) NOT NULL DEFAULT '',
  `mb_4` varchar(255) NOT NULL DEFAULT '',
  `mb_5` varchar(255) NOT NULL DEFAULT '',
  `mb_6` varchar(255) NOT NULL DEFAULT '',
  `mb_7` varchar(255) NOT NULL DEFAULT '',
  `mb_8` varchar(255) NOT NULL DEFAULT '',
  `mb_9` varchar(255) NOT NULL DEFAULT '',
  `mb_10` varchar(255) NOT NULL DEFAULT '',
  `as_noti` int NOT NULL DEFAULT '0',
  `as_msg` tinyint NOT NULL DEFAULT '0',
  `as_exp` int NOT NULL DEFAULT '0',
  `as_level` int NOT NULL DEFAULT '1',
  `as_max` int NOT NULL DEFAULT '0',
  `as_chadan` text NOT NULL,
  PRIMARY KEY (`mb_no`),
  UNIQUE KEY `mb_id` (`mb_id`),
  KEY `mb_today_login` (`mb_today_login`),
  KEY `mb_datetime` (`mb_datetime`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_member`
--

LOCK TABLES `g5_member` WRITE;
/*!40000 ALTER TABLE `g5_member` DISABLE KEYS */;
INSERT INTO `g5_member` VALUES (1,'admin','sha256:12000:Vbf61waiKdDbWERBXGEqTAzzda2cCAjq:2bvdoLJKaxmg6Ix97xQmgiNoV3M8RO+G','관리자','관리자','2024-05-05','admin@domain.com','',10,'','','','','',0,'','','','','','','','','',2465,'2025-02-21 08:10:48','172.71.215.54','2024-05-05 22:04:41','58.238.141.95','','','2024-05-05 22:04:41','','','',1,0,1,'0000-00-00','','',0,0,'','','','','','','','','','',0,0,0,1,10000,''),(2,'test1','sha256:12000:t+jGQrW+02+I0+IcKHhg9Tjd4wUMfUEl:0nEko1icInHilWMY64HYBq6ugNDAWZis','test1','테스트1','2024-05-05','test1@test1111.com','',2,'','','','','ipin',1,'','','','','','','','','',3310,'2024-07-17 23:19:54','172.70.210.221','2024-05-05 23:39:45','58.238.141.95','','','2024-05-05 23:39:45','','본인인증, 성인인증된 회원 ','',1,0,1,'2024-05-05','','',0,0,'','','','','','','','','','',0,0,0,1,10000,''),(3,'test2','sha256:12000:t+jGQrW+02+I0+IcKHhg9Tjd4wUMfUEl:0nEko1icInHilWMY64HYBq6ugNDAWZis','test2','테스트2','2024-05-05','test3@test1111.com','',2,'','','','','',0,'','','','','','','','','',500,'2024-07-06 11:34:29','162.158.118.194','2024-05-05 23:39:45','58.238.141.95','','','2024-05-05 23:39:45','','','',1,0,1,'2024-05-05','','',0,0,'','','','','','','','','','',0,0,0,1,10000,''),(4,'test3','sha256:12000:t+jGQrW+02+I0+IcKHhg9Tjd4wUMfUEl:0nEko1icInHilWMY64HYBq6ugNDAWZis','test3','테스트3','2024-05-05','test3@test1111.com','',2,'','','','','',0,'','','','','','','','','',1100,'2024-05-06 09:41:59','58.238.141.95','2024-05-05 23:39:45','58.238.141.95','','','2024-05-05 23:39:45','','','',1,0,1,'2024-05-05','','',0,0,'','','','','','','','','','',0,0,0,1,1000,''),(5,'test4','sha256:12000:t+jGQrW+02+I0+IcKHhg9Tjd4wUMfUEl:0nEko1icInHilWMY64HYBq6ugNDAWZis','test4','테스트4','2024-05-05','test4@test1111.com','',2,'','','','','',0,'','','','','','','','','',0,'2024-05-06 09:41:59','58.238.141.95','2024-05-05 23:39:45','58.238.141.95','','','2024-05-05 23:39:45','','','',1,0,1,'2024-05-05','','',0,0,'','','','','','','','','','',0,0,0,1,1000,''),(6,'test5','sha256:12000:t+jGQrW+02+I0+IcKHhg9Tjd4wUMfUEl:0nEko1icInHilWMY64HYBq6ugNDAWZis','test5','테스트5','2024-05-05','test5@test1111.com','',2,'','','','','',0,'','','','','','','','','',1048,'2024-06-07 11:00:47','162.158.138.54','2024-05-05 23:39:45','58.238.141.95','','','2024-05-05 23:39:45','','','',1,0,1,'2024-05-05','','',0,1,'','','','','','','','','','',0,0,0,1,10000,''),(7,'test6','sha256:12000:t+jGQrW+02+I0+IcKHhg9Tjd4wUMfUEl:0nEko1icInHilWMY64HYBq6ugNDAWZis','test6','테스트6','2024-05-05','test6@test1111.com','',2,'','','','','',0,'','','','','','','','','',110,'2024-06-03 19:11:00','172.70.211.235','2024-05-05 23:39:45','58.238.141.95','','','2024-05-05 23:39:45','','','',1,0,1,'2024-05-05','','',0,0,'','','','','','','','','','',0,0,0,1,10000,''),(8,'test7','sha256:12000:t+jGQrW+02+I0+IcKHhg9Tjd4wUMfUEl:0nEko1icInHilWMY64HYBq6ugNDAWZis','test7','테스트7','2024-05-05','test7@test1111.com','',2,'','','','','',0,'','','','','','','','','',100,'2024-05-19 22:28:36','172.226.95.46','2024-05-05 23:39:45','58.238.141.95','','','2024-05-05 23:39:45','','','',1,0,1,'2024-05-05','','',0,0,'','','','','','','','','','',0,0,0,1,1000,''),(9,'test8','sha256:12000:t+jGQrW+02+I0+IcKHhg9Tjd4wUMfUEl:0nEko1icInHilWMY64HYBq6ugNDAWZis','test8','테스트8','2024-05-05','test8@test1111.com','',2,'','','','','',0,'','','','','','','','','',1100,'2024-05-06 09:41:59','58.238.141.95','2024-05-05 23:39:45','58.238.141.95','','','2024-05-05 23:39:45','','','',1,0,1,'2024-05-05','','',0,0,'','','','','','','','','','',0,0,0,1,1000,''),(10,'test9','sha256:12000:t+jGQrW+02+I0+IcKHhg9Tjd4wUMfUEl:0nEko1icInHilWMY64HYBq6ugNDAWZis','test9','테스트9','2024-05-05','test9@test1111.com','',2,'','','','','',0,'','','','','','','','','',0,'2024-05-06 09:41:59','58.238.141.95','2024-05-05 23:39:45','58.238.141.95','','','2024-05-05 23:39:45','','','',1,0,1,'2024-05-05','','',0,0,'','','','','','','','','','',0,0,0,1,1000,'');
/*!40000 ALTER TABLE `g5_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_member_cert_history`
--

DROP TABLE IF EXISTS `g5_member_cert_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_member_cert_history` (
  `ch_id` int NOT NULL AUTO_INCREMENT,
  `mb_id` varchar(20) NOT NULL DEFAULT '',
  `ch_name` varchar(255) NOT NULL DEFAULT '',
  `ch_hp` varchar(255) NOT NULL DEFAULT '',
  `ch_birth` varchar(255) NOT NULL DEFAULT '',
  `ch_type` varchar(20) NOT NULL DEFAULT '',
  `ch_ci` varchar(255) NOT NULL DEFAULT '',
  `ch_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ch_id`),
  KEY `mb_id` (`mb_id`),
  KEY `idx_ci` (`ch_ci`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_member_cert_history`
--

LOCK TABLES `g5_member_cert_history` WRITE;
/*!40000 ALTER TABLE `g5_member_cert_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_member_cert_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_member_memo`
--

DROP TABLE IF EXISTS `g5_member_memo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_member_memo` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `member_uid` int DEFAULT NULL,
  `member_id` varchar(20) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `target_member_uid` int DEFAULT NULL,
  `target_member_id` varchar(20) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `color` varchar(20) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `memo` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `memo_detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_keys` (`member_id`,`target_member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_member_memo`
--

LOCK TABLES `g5_member_memo` WRITE;
/*!40000 ALTER TABLE `g5_member_memo` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_member_memo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_member_social_profiles`
--

DROP TABLE IF EXISTS `g5_member_social_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_member_social_profiles` (
  `mp_no` int NOT NULL AUTO_INCREMENT,
  `mb_id` varchar(255) NOT NULL DEFAULT '',
  `provider` varchar(50) NOT NULL DEFAULT '',
  `object_sha` varchar(45) NOT NULL DEFAULT '',
  `identifier` varchar(255) NOT NULL DEFAULT '',
  `profileurl` varchar(255) NOT NULL DEFAULT '',
  `photourl` varchar(255) NOT NULL DEFAULT '',
  `displayname` varchar(150) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `mp_register_day` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `mp_latest_day` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE KEY `mp_no` (`mp_no`),
  KEY `mb_id` (`mb_id`),
  KEY `provider` (`provider`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_member_social_profiles`
--

LOCK TABLES `g5_member_social_profiles` WRITE;
/*!40000 ALTER TABLE `g5_member_social_profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_member_social_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_memo`
--

DROP TABLE IF EXISTS `g5_memo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_memo` (
  `me_id` int NOT NULL AUTO_INCREMENT,
  `me_recv_mb_id` varchar(20) NOT NULL DEFAULT '',
  `me_send_mb_id` varchar(20) NOT NULL DEFAULT '',
  `me_send_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `me_read_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `me_memo` text NOT NULL,
  `me_send_id` int NOT NULL DEFAULT '0',
  `me_type` enum('send','recv') NOT NULL DEFAULT 'recv',
  `me_send_ip` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`me_id`),
  KEY `me_recv_mb_id` (`me_recv_mb_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_memo`
--

LOCK TABLES `g5_memo` WRITE;
/*!40000 ALTER TABLE `g5_memo` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_memo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_menu`
--

DROP TABLE IF EXISTS `g5_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_menu` (
  `me_id` int NOT NULL AUTO_INCREMENT,
  `me_code` varchar(255) NOT NULL DEFAULT '',
  `me_name` varchar(255) NOT NULL DEFAULT '',
  `me_link` varchar(255) NOT NULL DEFAULT '',
  `me_target` varchar(255) NOT NULL DEFAULT '',
  `me_order` int NOT NULL DEFAULT '0',
  `me_use` tinyint NOT NULL DEFAULT '0',
  `me_mobile_use` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`me_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_menu`
--

LOCK TABLES `g5_menu` WRITE;
/*!40000 ALTER TABLE `g5_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_na_menu`
--

DROP TABLE IF EXISTS `g5_na_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_na_menu` (
  `me_id` int NOT NULL AUTO_INCREMENT,
  `me_code` varchar(255) NOT NULL DEFAULT '',
  `me_name` varchar(255) NOT NULL DEFAULT '',
  `me_link` varchar(255) NOT NULL DEFAULT '',
  `me_target` varchar(255) NOT NULL DEFAULT '0',
  `me_order` int NOT NULL DEFAULT '0',
  `me_use` tinyint NOT NULL DEFAULT '0',
  `me_mobile_use` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`me_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_na_menu`
--

LOCK TABLES `g5_na_menu` WRITE;
/*!40000 ALTER TABLE `g5_na_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_na_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_na_noti`
--

DROP TABLE IF EXISTS `g5_na_noti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_na_noti` (
  `ph_id` int unsigned NOT NULL AUTO_INCREMENT,
  `ph_to_case` varchar(50) NOT NULL DEFAULT '',
  `ph_from_case` varchar(50) NOT NULL DEFAULT '',
  `bo_table` varchar(20) NOT NULL DEFAULT '',
  `rel_bo_table` varchar(20) NOT NULL DEFAULT '',
  `wr_id` int NOT NULL DEFAULT '0',
  `rel_wr_id` int NOT NULL DEFAULT '0',
  `mb_id` varchar(255) NOT NULL DEFAULT '',
  `rel_mb_id` varchar(255) NOT NULL DEFAULT '',
  `rel_mb_nick` varchar(255) DEFAULT NULL,
  `rel_msg` varchar(255) NOT NULL DEFAULT '',
  `rel_url` varchar(200) NOT NULL DEFAULT '',
  `ph_readed` char(1) NOT NULL DEFAULT 'N',
  `ph_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `parent_subject` varchar(255) NOT NULL,
  `wr_parent` int DEFAULT '0',
  PRIMARY KEY (`ph_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_na_noti`
--

LOCK TABLES `g5_na_noti` WRITE;
/*!40000 ALTER TABLE `g5_na_noti` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_na_noti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_na_singo`
--

DROP TABLE IF EXISTS `g5_na_singo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_na_singo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sg_flag` tinyint NOT NULL DEFAULT '0',
  `mb_id` varchar(20) NOT NULL DEFAULT '',
  `sg_table` varchar(20) NOT NULL DEFAULT '',
  `sg_id` int NOT NULL DEFAULT '0',
  `sg_parent` int NOT NULL DEFAULT '0',
  `sg_type` tinyint NOT NULL DEFAULT '0',
  `sg_desc` text NOT NULL,
  `wr_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sg_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `index1` (`sg_flag`,`mb_id`,`sg_table`,`sg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_na_singo`
--

LOCK TABLES `g5_na_singo` WRITE;
/*!40000 ALTER TABLE `g5_na_singo` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_na_singo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_na_tag`
--

DROP TABLE IF EXISTS `g5_na_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_na_tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` tinyint NOT NULL DEFAULT '0',
  `idx` varchar(10) NOT NULL DEFAULT '',
  `tag` varchar(255) NOT NULL DEFAULT '',
  `cnt` int NOT NULL DEFAULT '0',
  `regdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `tag` (`tag`,`lastdate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_na_tag`
--

LOCK TABLES `g5_na_tag` WRITE;
/*!40000 ALTER TABLE `g5_na_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_na_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_na_tag_log`
--

DROP TABLE IF EXISTS `g5_na_tag_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_na_tag_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bo_table` varchar(20) NOT NULL DEFAULT '',
  `wr_id` int NOT NULL DEFAULT '0',
  `tag_id` int NOT NULL DEFAULT '0',
  `tag` varchar(255) NOT NULL DEFAULT '',
  `mb_id` varchar(255) NOT NULL DEFAULT '',
  `regdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `tag` (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_na_tag_log`
--

LOCK TABLES `g5_na_tag_log` WRITE;
/*!40000 ALTER TABLE `g5_na_tag_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_na_tag_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_na_xp`
--

DROP TABLE IF EXISTS `g5_na_xp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_na_xp` (
  `xp_id` int NOT NULL AUTO_INCREMENT,
  `mb_id` varchar(20) NOT NULL DEFAULT '',
  `xp_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `xp_content` varchar(255) NOT NULL DEFAULT '',
  `xp_point` int NOT NULL DEFAULT '0',
  `xp_rel_table` varchar(20) NOT NULL DEFAULT '',
  `xp_rel_id` varchar(20) NOT NULL DEFAULT '',
  `xp_rel_action` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`xp_id`),
  KEY `index1` (`mb_id`,`xp_rel_table`,`xp_rel_id`,`xp_rel_action`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_na_xp`
--

LOCK TABLES `g5_na_xp` WRITE;
/*!40000 ALTER TABLE `g5_na_xp` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_na_xp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_new_win`
--

DROP TABLE IF EXISTS `g5_new_win`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_new_win` (
  `nw_id` int NOT NULL AUTO_INCREMENT,
  `nw_division` varchar(10) NOT NULL DEFAULT 'both',
  `nw_device` varchar(10) NOT NULL DEFAULT 'both',
  `nw_begin_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `nw_end_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `nw_disable_hours` int NOT NULL DEFAULT '0',
  `nw_left` int NOT NULL DEFAULT '0',
  `nw_top` int NOT NULL DEFAULT '0',
  `nw_height` int NOT NULL DEFAULT '0',
  `nw_width` int NOT NULL DEFAULT '0',
  `nw_subject` text NOT NULL,
  `nw_content` text NOT NULL,
  `nw_content_html` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`nw_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_new_win`
--

LOCK TABLES `g5_new_win` WRITE;
/*!40000 ALTER TABLE `g5_new_win` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_new_win` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_point`
--

DROP TABLE IF EXISTS `g5_point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_point` (
  `po_id` int NOT NULL AUTO_INCREMENT,
  `mb_id` varchar(20) NOT NULL DEFAULT '',
  `po_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `po_content` varchar(255) NOT NULL DEFAULT '',
  `po_point` int NOT NULL DEFAULT '0',
  `po_use_point` int NOT NULL DEFAULT '0',
  `po_expired` tinyint NOT NULL DEFAULT '0',
  `po_expire_date` date NOT NULL DEFAULT '0000-00-00',
  `po_mb_point` int NOT NULL DEFAULT '0',
  `po_rel_table` varchar(20) NOT NULL DEFAULT '',
  `po_rel_id` varchar(20) NOT NULL DEFAULT '',
  `po_rel_action` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`po_id`),
  KEY `index1` (`mb_id`,`po_rel_table`,`po_rel_id`,`po_rel_action`),
  KEY `index2` (`po_expire_date`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_point`
--

LOCK TABLES `g5_point` WRITE;
/*!40000 ALTER TABLE `g5_point` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_point` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_poll`
--

DROP TABLE IF EXISTS `g5_poll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_poll` (
  `po_id` int NOT NULL AUTO_INCREMENT,
  `po_subject` varchar(255) NOT NULL DEFAULT '',
  `po_poll1` varchar(255) NOT NULL DEFAULT '',
  `po_poll2` varchar(255) NOT NULL DEFAULT '',
  `po_poll3` varchar(255) NOT NULL DEFAULT '',
  `po_poll4` varchar(255) NOT NULL DEFAULT '',
  `po_poll5` varchar(255) NOT NULL DEFAULT '',
  `po_poll6` varchar(255) NOT NULL DEFAULT '',
  `po_poll7` varchar(255) NOT NULL DEFAULT '',
  `po_poll8` varchar(255) NOT NULL DEFAULT '',
  `po_poll9` varchar(255) NOT NULL DEFAULT '',
  `po_cnt1` int NOT NULL DEFAULT '0',
  `po_cnt2` int NOT NULL DEFAULT '0',
  `po_cnt3` int NOT NULL DEFAULT '0',
  `po_cnt4` int NOT NULL DEFAULT '0',
  `po_cnt5` int NOT NULL DEFAULT '0',
  `po_cnt6` int NOT NULL DEFAULT '0',
  `po_cnt7` int NOT NULL DEFAULT '0',
  `po_cnt8` int NOT NULL DEFAULT '0',
  `po_cnt9` int NOT NULL DEFAULT '0',
  `po_etc` varchar(255) NOT NULL DEFAULT '',
  `po_level` tinyint NOT NULL DEFAULT '0',
  `po_point` int NOT NULL DEFAULT '0',
  `po_date` date NOT NULL DEFAULT '0000-00-00',
  `po_ips` mediumtext NOT NULL,
  `mb_ids` text NOT NULL,
  `po_use` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`po_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_poll`
--

LOCK TABLES `g5_poll` WRITE;
/*!40000 ALTER TABLE `g5_poll` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_poll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_poll_etc`
--

DROP TABLE IF EXISTS `g5_poll_etc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_poll_etc` (
  `pc_id` int NOT NULL DEFAULT '0',
  `po_id` int NOT NULL DEFAULT '0',
  `mb_id` varchar(20) NOT NULL DEFAULT '',
  `pc_name` varchar(255) NOT NULL DEFAULT '',
  `pc_idea` varchar(255) NOT NULL DEFAULT '',
  `pc_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`pc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_poll_etc`
--

LOCK TABLES `g5_poll_etc` WRITE;
/*!40000 ALTER TABLE `g5_poll_etc` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_poll_etc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_popular`
--

DROP TABLE IF EXISTS `g5_popular`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_popular` (
  `pp_id` int NOT NULL AUTO_INCREMENT,
  `pp_word` varchar(50) NOT NULL DEFAULT '',
  `pp_date` date NOT NULL DEFAULT '0000-00-00',
  `pp_ip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`pp_id`),
  UNIQUE KEY `index1` (`pp_date`,`pp_word`,`pp_ip`)
) ENGINE=InnoDB AUTO_INCREMENT=15855 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_popular`
--

LOCK TABLES `g5_popular` WRITE;
/*!40000 ALTER TABLE `g5_popular` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_popular` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_qa_config`
--

DROP TABLE IF EXISTS `g5_qa_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_qa_config` (
  `qa_id` int NOT NULL AUTO_INCREMENT,
  `qa_title` varchar(255) NOT NULL DEFAULT '',
  `qa_category` varchar(255) NOT NULL DEFAULT '',
  `qa_skin` varchar(255) NOT NULL DEFAULT '',
  `qa_mobile_skin` varchar(255) NOT NULL DEFAULT '',
  `qa_use_email` tinyint NOT NULL DEFAULT '0',
  `qa_req_email` tinyint NOT NULL DEFAULT '0',
  `qa_use_hp` tinyint NOT NULL DEFAULT '0',
  `qa_req_hp` tinyint NOT NULL DEFAULT '0',
  `qa_use_sms` tinyint NOT NULL DEFAULT '0',
  `qa_send_number` varchar(255) NOT NULL DEFAULT '0',
  `qa_admin_hp` varchar(255) NOT NULL DEFAULT '',
  `qa_admin_email` varchar(255) NOT NULL DEFAULT '',
  `qa_use_editor` tinyint NOT NULL DEFAULT '0',
  `qa_subject_len` int NOT NULL DEFAULT '0',
  `qa_mobile_subject_len` int NOT NULL DEFAULT '0',
  `qa_page_rows` int NOT NULL DEFAULT '0',
  `qa_mobile_page_rows` int NOT NULL DEFAULT '0',
  `qa_image_width` int NOT NULL DEFAULT '0',
  `qa_upload_size` int NOT NULL DEFAULT '0',
  `qa_insert_content` text NOT NULL,
  `qa_include_head` varchar(255) NOT NULL DEFAULT '',
  `qa_include_tail` varchar(255) NOT NULL DEFAULT '',
  `qa_content_head` text NOT NULL,
  `qa_content_tail` text NOT NULL,
  `qa_mobile_content_head` text NOT NULL,
  `qa_mobile_content_tail` text NOT NULL,
  `qa_1_subj` varchar(255) NOT NULL DEFAULT '',
  `qa_2_subj` varchar(255) NOT NULL DEFAULT '',
  `qa_3_subj` varchar(255) NOT NULL DEFAULT '',
  `qa_4_subj` varchar(255) NOT NULL DEFAULT '',
  `qa_5_subj` varchar(255) NOT NULL DEFAULT '',
  `qa_1` varchar(255) NOT NULL DEFAULT '',
  `qa_2` varchar(255) NOT NULL DEFAULT '',
  `qa_3` varchar(255) NOT NULL DEFAULT '',
  `qa_4` varchar(255) NOT NULL DEFAULT '',
  `qa_5` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`qa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_qa_config`
--

LOCK TABLES `g5_qa_config` WRITE;
/*!40000 ALTER TABLE `g5_qa_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_qa_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_qa_content`
--

DROP TABLE IF EXISTS `g5_qa_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_qa_content` (
  `qa_id` int NOT NULL AUTO_INCREMENT,
  `qa_num` int NOT NULL DEFAULT '0',
  `qa_parent` int NOT NULL DEFAULT '0',
  `qa_related` int NOT NULL DEFAULT '0',
  `mb_id` varchar(20) NOT NULL DEFAULT '',
  `qa_name` varchar(255) NOT NULL DEFAULT '',
  `qa_email` varchar(255) NOT NULL DEFAULT '',
  `qa_hp` varchar(255) NOT NULL DEFAULT '',
  `qa_type` tinyint NOT NULL DEFAULT '0',
  `qa_category` varchar(255) NOT NULL DEFAULT '',
  `qa_email_recv` tinyint NOT NULL DEFAULT '0',
  `qa_sms_recv` tinyint NOT NULL DEFAULT '0',
  `qa_html` tinyint NOT NULL DEFAULT '0',
  `qa_subject` varchar(255) NOT NULL DEFAULT '',
  `qa_content` text NOT NULL,
  `qa_status` tinyint NOT NULL DEFAULT '0',
  `qa_file1` varchar(255) NOT NULL DEFAULT '',
  `qa_source1` varchar(255) NOT NULL DEFAULT '',
  `qa_file2` varchar(255) NOT NULL DEFAULT '',
  `qa_source2` varchar(255) NOT NULL DEFAULT '',
  `qa_ip` varchar(255) NOT NULL DEFAULT '',
  `qa_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `qa_1` varchar(255) NOT NULL DEFAULT '',
  `qa_2` varchar(255) NOT NULL DEFAULT '',
  `qa_3` varchar(255) NOT NULL DEFAULT '',
  `qa_4` varchar(255) NOT NULL DEFAULT '',
  `qa_5` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`qa_id`),
  KEY `qa_num_parent` (`qa_num`,`qa_parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_qa_content`
--

LOCK TABLES `g5_qa_content` WRITE;
/*!40000 ALTER TABLE `g5_qa_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_qa_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_s3_config`
--

DROP TABLE IF EXISTS `g5_s3_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_s3_config` (
  `acl_value` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'private',
  `is_use_s3` tinyint NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_s3_config`
--

LOCK TABLES `g5_s3_config` WRITE;
/*!40000 ALTER TABLE `g5_s3_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_s3_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_scrap`
--

DROP TABLE IF EXISTS `g5_scrap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_scrap` (
  `ms_id` int NOT NULL AUTO_INCREMENT,
  `mb_id` varchar(20) NOT NULL DEFAULT '',
  `bo_table` varchar(20) NOT NULL DEFAULT '',
  `wr_id` varchar(15) NOT NULL DEFAULT '',
  `ms_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ms_id`),
  KEY `mb_id` (`mb_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_scrap`
--

LOCK TABLES `g5_scrap` WRITE;
/*!40000 ALTER TABLE `g5_scrap` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_scrap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_shop_banner`
--

DROP TABLE IF EXISTS `g5_shop_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_shop_banner` (
  `bn_id` int NOT NULL AUTO_INCREMENT,
  `bn_alt` varchar(255) NOT NULL DEFAULT '',
  `bn_url` varchar(255) NOT NULL DEFAULT '',
  `bn_device` varchar(10) NOT NULL DEFAULT '',
  `bn_position` varchar(255) NOT NULL DEFAULT '',
  `bn_border` tinyint NOT NULL DEFAULT '0',
  `bn_new_win` tinyint NOT NULL DEFAULT '0',
  `bn_begin_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `bn_end_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `bn_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `bn_hit` int NOT NULL DEFAULT '0',
  `bn_order` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`bn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_shop_banner`
--

LOCK TABLES `g5_shop_banner` WRITE;
/*!40000 ALTER TABLE `g5_shop_banner` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_shop_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_shop_cart`
--

DROP TABLE IF EXISTS `g5_shop_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_shop_cart` (
  `ct_id` int NOT NULL AUTO_INCREMENT,
  `od_id` bigint unsigned NOT NULL,
  `mb_id` varchar(255) NOT NULL DEFAULT '',
  `it_id` varchar(20) NOT NULL DEFAULT '',
  `it_name` varchar(255) NOT NULL DEFAULT '',
  `it_sc_type` tinyint NOT NULL DEFAULT '0',
  `it_sc_method` tinyint NOT NULL DEFAULT '0',
  `it_sc_price` int NOT NULL DEFAULT '0',
  `it_sc_minimum` int NOT NULL DEFAULT '0',
  `it_sc_qty` int NOT NULL DEFAULT '0',
  `ct_status` varchar(255) NOT NULL DEFAULT '',
  `ct_history` text NOT NULL,
  `ct_price` int NOT NULL DEFAULT '0',
  `ct_point` int NOT NULL DEFAULT '0',
  `cp_price` int NOT NULL DEFAULT '0',
  `ct_point_use` tinyint NOT NULL DEFAULT '0',
  `ct_stock_use` tinyint NOT NULL DEFAULT '0',
  `ct_option` varchar(255) NOT NULL DEFAULT '',
  `ct_qty` int NOT NULL DEFAULT '0',
  `ct_notax` tinyint NOT NULL DEFAULT '0',
  `io_id` varchar(255) NOT NULL DEFAULT '',
  `io_type` tinyint NOT NULL DEFAULT '0',
  `io_price` int NOT NULL DEFAULT '0',
  `ct_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ct_ip` varchar(25) NOT NULL DEFAULT '',
  `ct_send_cost` tinyint NOT NULL DEFAULT '0',
  `ct_direct` tinyint NOT NULL DEFAULT '0',
  `ct_select` tinyint NOT NULL DEFAULT '0',
  `ct_select_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ct_id`),
  KEY `od_id` (`od_id`),
  KEY `it_id` (`it_id`),
  KEY `ct_status` (`ct_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_shop_cart`
--

LOCK TABLES `g5_shop_cart` WRITE;
/*!40000 ALTER TABLE `g5_shop_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_shop_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_shop_category`
--

DROP TABLE IF EXISTS `g5_shop_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_shop_category` (
  `ca_id` varchar(10) NOT NULL DEFAULT '0',
  `ca_name` varchar(255) NOT NULL DEFAULT '',
  `ca_order` int NOT NULL DEFAULT '0',
  `ca_skin_dir` varchar(255) NOT NULL DEFAULT '',
  `ca_mobile_skin_dir` varchar(255) NOT NULL DEFAULT '',
  `ca_skin` varchar(255) NOT NULL DEFAULT '',
  `ca_mobile_skin` varchar(255) NOT NULL DEFAULT '',
  `ca_img_width` int NOT NULL DEFAULT '0',
  `ca_img_height` int NOT NULL DEFAULT '0',
  `ca_mobile_img_width` int NOT NULL DEFAULT '0',
  `ca_mobile_img_height` int NOT NULL DEFAULT '0',
  `ca_sell_email` varchar(255) NOT NULL DEFAULT '',
  `ca_use` tinyint NOT NULL DEFAULT '0',
  `ca_stock_qty` int NOT NULL DEFAULT '0',
  `ca_explan_html` tinyint NOT NULL DEFAULT '0',
  `ca_head_html` text NOT NULL,
  `ca_tail_html` text NOT NULL,
  `ca_mobile_head_html` text NOT NULL,
  `ca_mobile_tail_html` text NOT NULL,
  `ca_list_mod` int NOT NULL DEFAULT '0',
  `ca_list_row` int NOT NULL DEFAULT '0',
  `ca_mobile_list_mod` int NOT NULL DEFAULT '0',
  `ca_mobile_list_row` int NOT NULL DEFAULT '0',
  `ca_include_head` varchar(255) NOT NULL DEFAULT '',
  `ca_include_tail` varchar(255) NOT NULL DEFAULT '',
  `ca_mb_id` varchar(255) NOT NULL DEFAULT '',
  `ca_cert_use` tinyint NOT NULL DEFAULT '0',
  `ca_adult_use` tinyint NOT NULL DEFAULT '0',
  `ca_nocoupon` tinyint NOT NULL DEFAULT '0',
  `ca_1_subj` varchar(255) NOT NULL DEFAULT '',
  `ca_2_subj` varchar(255) NOT NULL DEFAULT '',
  `ca_3_subj` varchar(255) NOT NULL DEFAULT '',
  `ca_4_subj` varchar(255) NOT NULL DEFAULT '',
  `ca_5_subj` varchar(255) NOT NULL DEFAULT '',
  `ca_6_subj` varchar(255) NOT NULL DEFAULT '',
  `ca_7_subj` varchar(255) NOT NULL DEFAULT '',
  `ca_8_subj` varchar(255) NOT NULL DEFAULT '',
  `ca_9_subj` varchar(255) NOT NULL DEFAULT '',
  `ca_10_subj` varchar(255) NOT NULL DEFAULT '',
  `ca_1` varchar(255) NOT NULL DEFAULT '',
  `ca_2` varchar(255) NOT NULL DEFAULT '',
  `ca_3` varchar(255) NOT NULL DEFAULT '',
  `ca_4` varchar(255) NOT NULL DEFAULT '',
  `ca_5` varchar(255) NOT NULL DEFAULT '',
  `ca_6` varchar(255) NOT NULL DEFAULT '',
  `ca_7` varchar(255) NOT NULL DEFAULT '',
  `ca_8` varchar(255) NOT NULL DEFAULT '',
  `ca_9` varchar(255) NOT NULL DEFAULT '',
  `ca_10` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ca_id`),
  KEY `ca_order` (`ca_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_shop_category`
--

LOCK TABLES `g5_shop_category` WRITE;
/*!40000 ALTER TABLE `g5_shop_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_shop_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_shop_coupon`
--

DROP TABLE IF EXISTS `g5_shop_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_shop_coupon` (
  `cp_no` int NOT NULL AUTO_INCREMENT,
  `cp_id` varchar(100) NOT NULL DEFAULT '',
  `cp_subject` varchar(255) NOT NULL DEFAULT '',
  `cp_method` tinyint NOT NULL DEFAULT '0',
  `cp_target` varchar(255) NOT NULL DEFAULT '',
  `mb_id` varchar(255) NOT NULL DEFAULT '',
  `cz_id` int NOT NULL DEFAULT '0',
  `cp_start` date NOT NULL DEFAULT '0000-00-00',
  `cp_end` date NOT NULL DEFAULT '0000-00-00',
  `cp_price` int NOT NULL DEFAULT '0',
  `cp_type` tinyint NOT NULL DEFAULT '0',
  `cp_trunc` int NOT NULL DEFAULT '0',
  `cp_minimum` int NOT NULL DEFAULT '0',
  `cp_maximum` int NOT NULL DEFAULT '0',
  `od_id` bigint unsigned NOT NULL,
  `cp_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`cp_no`),
  UNIQUE KEY `cp_id` (`cp_id`),
  KEY `mb_id` (`mb_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_shop_coupon`
--

LOCK TABLES `g5_shop_coupon` WRITE;
/*!40000 ALTER TABLE `g5_shop_coupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_shop_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_shop_coupon_log`
--

DROP TABLE IF EXISTS `g5_shop_coupon_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_shop_coupon_log` (
  `cl_id` int NOT NULL AUTO_INCREMENT,
  `cp_id` varchar(100) NOT NULL DEFAULT '',
  `mb_id` varchar(100) NOT NULL DEFAULT '',
  `od_id` bigint NOT NULL,
  `cp_price` int NOT NULL DEFAULT '0',
  `cl_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`cl_id`),
  KEY `mb_id` (`mb_id`),
  KEY `od_id` (`od_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_shop_coupon_log`
--

LOCK TABLES `g5_shop_coupon_log` WRITE;
/*!40000 ALTER TABLE `g5_shop_coupon_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_shop_coupon_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_shop_coupon_zone`
--

DROP TABLE IF EXISTS `g5_shop_coupon_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_shop_coupon_zone` (
  `cz_id` int NOT NULL AUTO_INCREMENT,
  `cz_type` tinyint NOT NULL DEFAULT '0',
  `cz_subject` varchar(255) NOT NULL DEFAULT '',
  `cz_start` date NOT NULL DEFAULT '0000-00-00',
  `cz_end` date NOT NULL DEFAULT '0000-00-00',
  `cz_file` varchar(255) NOT NULL DEFAULT '',
  `cz_period` int NOT NULL DEFAULT '0',
  `cz_point` int NOT NULL DEFAULT '0',
  `cp_method` tinyint NOT NULL DEFAULT '0',
  `cp_target` varchar(255) NOT NULL DEFAULT '',
  `cp_price` int NOT NULL DEFAULT '0',
  `cp_type` tinyint NOT NULL DEFAULT '0',
  `cp_trunc` int NOT NULL DEFAULT '0',
  `cp_minimum` int NOT NULL DEFAULT '0',
  `cp_maximum` int NOT NULL DEFAULT '0',
  `cz_download` int NOT NULL DEFAULT '0',
  `cz_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`cz_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_shop_coupon_zone`
--

LOCK TABLES `g5_shop_coupon_zone` WRITE;
/*!40000 ALTER TABLE `g5_shop_coupon_zone` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_shop_coupon_zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_shop_default`
--

DROP TABLE IF EXISTS `g5_shop_default`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_shop_default` (
  `de_id` int NOT NULL AUTO_INCREMENT,
  `de_admin_company_owner` varchar(255) NOT NULL DEFAULT '',
  `de_admin_company_name` varchar(255) NOT NULL DEFAULT '',
  `de_admin_company_saupja_no` varchar(255) NOT NULL DEFAULT '',
  `de_admin_company_tel` varchar(255) NOT NULL DEFAULT '',
  `de_admin_company_fax` varchar(255) NOT NULL DEFAULT '',
  `de_admin_tongsin_no` varchar(255) NOT NULL DEFAULT '',
  `de_admin_company_zip` varchar(255) NOT NULL DEFAULT '',
  `de_admin_company_addr` varchar(255) NOT NULL DEFAULT '',
  `de_admin_info_name` varchar(255) NOT NULL DEFAULT '',
  `de_admin_info_email` varchar(255) NOT NULL DEFAULT '',
  `de_shop_skin` varchar(255) NOT NULL DEFAULT '',
  `de_shop_mobile_skin` varchar(255) NOT NULL DEFAULT '',
  `de_type1_list_use` tinyint NOT NULL DEFAULT '0',
  `de_type1_list_skin` varchar(255) NOT NULL DEFAULT '',
  `de_type1_list_mod` int NOT NULL DEFAULT '0',
  `de_type1_list_row` int NOT NULL DEFAULT '0',
  `de_type1_img_width` int NOT NULL DEFAULT '0',
  `de_type1_img_height` int NOT NULL DEFAULT '0',
  `de_type2_list_use` tinyint NOT NULL DEFAULT '0',
  `de_type2_list_skin` varchar(255) NOT NULL DEFAULT '',
  `de_type2_list_mod` int NOT NULL DEFAULT '0',
  `de_type2_list_row` int NOT NULL DEFAULT '0',
  `de_type2_img_width` int NOT NULL DEFAULT '0',
  `de_type2_img_height` int NOT NULL DEFAULT '0',
  `de_type3_list_use` tinyint NOT NULL DEFAULT '0',
  `de_type3_list_skin` varchar(255) NOT NULL DEFAULT '',
  `de_type3_list_mod` int NOT NULL DEFAULT '0',
  `de_type3_list_row` int NOT NULL DEFAULT '0',
  `de_type3_img_width` int NOT NULL DEFAULT '0',
  `de_type3_img_height` int NOT NULL DEFAULT '0',
  `de_type4_list_use` tinyint NOT NULL DEFAULT '0',
  `de_type4_list_skin` varchar(255) NOT NULL DEFAULT '',
  `de_type4_list_mod` int NOT NULL DEFAULT '0',
  `de_type4_list_row` int NOT NULL DEFAULT '0',
  `de_type4_img_width` int NOT NULL DEFAULT '0',
  `de_type4_img_height` int NOT NULL DEFAULT '0',
  `de_type5_list_use` tinyint NOT NULL DEFAULT '0',
  `de_type5_list_skin` varchar(255) NOT NULL DEFAULT '',
  `de_type5_list_mod` int NOT NULL DEFAULT '0',
  `de_type5_list_row` int NOT NULL DEFAULT '0',
  `de_type5_img_width` int NOT NULL DEFAULT '0',
  `de_type5_img_height` int NOT NULL DEFAULT '0',
  `de_mobile_type1_list_use` tinyint NOT NULL DEFAULT '0',
  `de_mobile_type1_list_skin` varchar(255) NOT NULL DEFAULT '',
  `de_mobile_type1_list_mod` int NOT NULL DEFAULT '0',
  `de_mobile_type1_list_row` int NOT NULL DEFAULT '0',
  `de_mobile_type1_img_width` int NOT NULL DEFAULT '0',
  `de_mobile_type1_img_height` int NOT NULL DEFAULT '0',
  `de_mobile_type2_list_use` tinyint NOT NULL DEFAULT '0',
  `de_mobile_type2_list_skin` varchar(255) NOT NULL DEFAULT '',
  `de_mobile_type2_list_mod` int NOT NULL DEFAULT '0',
  `de_mobile_type2_list_row` int NOT NULL DEFAULT '0',
  `de_mobile_type2_img_width` int NOT NULL DEFAULT '0',
  `de_mobile_type2_img_height` int NOT NULL DEFAULT '0',
  `de_mobile_type3_list_use` tinyint NOT NULL DEFAULT '0',
  `de_mobile_type3_list_skin` varchar(255) NOT NULL DEFAULT '',
  `de_mobile_type3_list_mod` int NOT NULL DEFAULT '0',
  `de_mobile_type3_list_row` int NOT NULL DEFAULT '0',
  `de_mobile_type3_img_width` int NOT NULL DEFAULT '0',
  `de_mobile_type3_img_height` int NOT NULL DEFAULT '0',
  `de_mobile_type4_list_use` tinyint NOT NULL DEFAULT '0',
  `de_mobile_type4_list_skin` varchar(255) NOT NULL DEFAULT '',
  `de_mobile_type4_list_mod` int NOT NULL DEFAULT '0',
  `de_mobile_type4_list_row` int NOT NULL DEFAULT '0',
  `de_mobile_type4_img_width` int NOT NULL DEFAULT '0',
  `de_mobile_type4_img_height` int NOT NULL DEFAULT '0',
  `de_mobile_type5_list_use` tinyint NOT NULL DEFAULT '0',
  `de_mobile_type5_list_skin` varchar(255) NOT NULL DEFAULT '',
  `de_mobile_type5_list_mod` int NOT NULL DEFAULT '0',
  `de_mobile_type5_list_row` int NOT NULL DEFAULT '0',
  `de_mobile_type5_img_width` int NOT NULL DEFAULT '0',
  `de_mobile_type5_img_height` int NOT NULL DEFAULT '0',
  `de_rel_list_use` tinyint NOT NULL DEFAULT '0',
  `de_rel_list_skin` varchar(255) NOT NULL DEFAULT '',
  `de_rel_list_mod` int NOT NULL DEFAULT '0',
  `de_rel_img_width` int NOT NULL DEFAULT '0',
  `de_rel_img_height` int NOT NULL DEFAULT '0',
  `de_mobile_rel_list_use` tinyint NOT NULL DEFAULT '0',
  `de_mobile_rel_list_skin` varchar(255) NOT NULL DEFAULT '',
  `de_mobile_rel_list_mod` int NOT NULL DEFAULT '0',
  `de_mobile_rel_img_width` int NOT NULL DEFAULT '0',
  `de_mobile_rel_img_height` int NOT NULL DEFAULT '0',
  `de_search_list_skin` varchar(255) NOT NULL DEFAULT '',
  `de_search_list_mod` int NOT NULL DEFAULT '0',
  `de_search_list_row` int NOT NULL DEFAULT '0',
  `de_search_img_width` int NOT NULL DEFAULT '0',
  `de_search_img_height` int NOT NULL DEFAULT '0',
  `de_mobile_search_list_skin` varchar(255) NOT NULL DEFAULT '',
  `de_mobile_search_list_mod` int NOT NULL DEFAULT '0',
  `de_mobile_search_list_row` int NOT NULL DEFAULT '0',
  `de_mobile_search_img_width` int NOT NULL DEFAULT '0',
  `de_mobile_search_img_height` int NOT NULL DEFAULT '0',
  `de_listtype_list_skin` varchar(255) NOT NULL DEFAULT '',
  `de_listtype_list_mod` int NOT NULL DEFAULT '0',
  `de_listtype_list_row` int NOT NULL DEFAULT '0',
  `de_listtype_img_width` int NOT NULL DEFAULT '0',
  `de_listtype_img_height` int NOT NULL DEFAULT '0',
  `de_mobile_listtype_list_skin` varchar(255) NOT NULL DEFAULT '',
  `de_mobile_listtype_list_mod` int NOT NULL DEFAULT '0',
  `de_mobile_listtype_list_row` int NOT NULL DEFAULT '0',
  `de_mobile_listtype_img_width` int NOT NULL DEFAULT '0',
  `de_mobile_listtype_img_height` int NOT NULL DEFAULT '0',
  `de_bank_use` int NOT NULL DEFAULT '0',
  `de_bank_account` text NOT NULL,
  `de_card_test` int NOT NULL DEFAULT '0',
  `de_card_use` int NOT NULL DEFAULT '0',
  `de_card_noint_use` tinyint NOT NULL DEFAULT '0',
  `de_card_point` int NOT NULL DEFAULT '0',
  `de_settle_min_point` int NOT NULL DEFAULT '0',
  `de_settle_max_point` int NOT NULL DEFAULT '0',
  `de_settle_point_unit` int NOT NULL DEFAULT '0',
  `de_level_sell` int NOT NULL DEFAULT '0',
  `de_delivery_company` varchar(255) NOT NULL DEFAULT '',
  `de_send_cost_case` varchar(255) NOT NULL DEFAULT '',
  `de_send_cost_limit` varchar(255) NOT NULL DEFAULT '',
  `de_send_cost_list` varchar(255) NOT NULL DEFAULT '',
  `de_hope_date_use` int NOT NULL DEFAULT '0',
  `de_hope_date_after` int NOT NULL DEFAULT '0',
  `de_baesong_content` text NOT NULL,
  `de_change_content` text NOT NULL,
  `de_point_days` int NOT NULL DEFAULT '0',
  `de_simg_width` int NOT NULL DEFAULT '0',
  `de_simg_height` int NOT NULL DEFAULT '0',
  `de_mimg_width` int NOT NULL DEFAULT '0',
  `de_mimg_height` int NOT NULL DEFAULT '0',
  `de_sms_cont1` text NOT NULL,
  `de_sms_cont2` text NOT NULL,
  `de_sms_cont3` text NOT NULL,
  `de_sms_cont4` text NOT NULL,
  `de_sms_cont5` text NOT NULL,
  `de_sms_use1` tinyint NOT NULL DEFAULT '0',
  `de_sms_use2` tinyint NOT NULL DEFAULT '0',
  `de_sms_use3` tinyint NOT NULL DEFAULT '0',
  `de_sms_use4` tinyint NOT NULL DEFAULT '0',
  `de_sms_use5` tinyint NOT NULL DEFAULT '0',
  `de_sms_hp` varchar(255) NOT NULL DEFAULT '',
  `de_pg_service` varchar(255) NOT NULL DEFAULT '',
  `de_kcp_mid` varchar(255) NOT NULL DEFAULT '',
  `de_kcp_site_key` varchar(255) NOT NULL DEFAULT '',
  `de_inicis_mid` varchar(255) NOT NULL DEFAULT '',
  `de_inicis_iniapi_key` varchar(30) NOT NULL DEFAULT '',
  `de_inicis_iniapi_iv` varchar(30) NOT NULL DEFAULT '',
  `de_inicis_sign_key` varchar(255) NOT NULL DEFAULT '',
  `de_iche_use` tinyint NOT NULL DEFAULT '0',
  `de_easy_pay_use` tinyint NOT NULL DEFAULT '0',
  `de_easy_pay_services` varchar(255) NOT NULL DEFAULT '',
  `de_samsung_pay_use` tinyint NOT NULL DEFAULT '0',
  `de_inicis_lpay_use` tinyint NOT NULL DEFAULT '0',
  `de_inicis_kakaopay_use` tinyint NOT NULL DEFAULT '0',
  `de_inicis_cartpoint_use` tinyint NOT NULL DEFAULT '0',
  `de_nicepay_mid` varchar(20) NOT NULL DEFAULT '',
  `de_nicepay_key` varchar(150) NOT NULL DEFAULT '',
  `de_item_use_use` tinyint NOT NULL DEFAULT '0',
  `de_item_use_write` tinyint NOT NULL DEFAULT '0',
  `de_code_dup_use` tinyint NOT NULL DEFAULT '0',
  `de_cart_keep_term` int NOT NULL DEFAULT '0',
  `de_guest_cart_use` tinyint NOT NULL DEFAULT '0',
  `de_admin_buga_no` varchar(255) NOT NULL DEFAULT '',
  `de_vbank_use` varchar(255) NOT NULL DEFAULT '',
  `de_taxsave_use` tinyint NOT NULL,
  `de_taxsave_types` set('account','vbank','transfer') NOT NULL DEFAULT 'account',
  `de_guest_privacy` text NOT NULL,
  `de_hp_use` tinyint NOT NULL DEFAULT '0',
  `de_escrow_use` tinyint NOT NULL DEFAULT '0',
  `de_tax_flag_use` tinyint NOT NULL DEFAULT '0',
  `de_kakaopay_mid` varchar(255) NOT NULL DEFAULT '',
  `de_kakaopay_key` varchar(255) NOT NULL DEFAULT '',
  `de_kakaopay_enckey` varchar(255) NOT NULL DEFAULT '',
  `de_kakaopay_hashkey` varchar(255) NOT NULL DEFAULT '',
  `de_kakaopay_cancelpwd` varchar(255) NOT NULL DEFAULT '',
  `de_naverpay_mid` varchar(255) NOT NULL DEFAULT '',
  `de_naverpay_cert_key` varchar(255) NOT NULL DEFAULT '',
  `de_naverpay_button_key` varchar(255) NOT NULL DEFAULT '',
  `de_naverpay_test` tinyint NOT NULL DEFAULT '0',
  `de_naverpay_mb_id` varchar(255) NOT NULL DEFAULT '',
  `de_naverpay_sendcost` varchar(255) NOT NULL DEFAULT '',
  `de_member_reg_coupon_use` tinyint NOT NULL DEFAULT '0',
  `de_member_reg_coupon_term` int NOT NULL DEFAULT '0',
  `de_member_reg_coupon_price` int NOT NULL DEFAULT '0',
  `de_member_reg_coupon_minimum` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`de_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_shop_default`
--

LOCK TABLES `g5_shop_default` WRITE;
/*!40000 ALTER TABLE `g5_shop_default` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_shop_default` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_shop_event`
--

DROP TABLE IF EXISTS `g5_shop_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_shop_event` (
  `ev_id` int NOT NULL AUTO_INCREMENT,
  `ev_skin` varchar(255) NOT NULL DEFAULT '',
  `ev_mobile_skin` varchar(255) NOT NULL DEFAULT '',
  `ev_img_width` int NOT NULL DEFAULT '0',
  `ev_img_height` int NOT NULL DEFAULT '0',
  `ev_list_mod` int NOT NULL DEFAULT '0',
  `ev_list_row` int NOT NULL DEFAULT '0',
  `ev_mobile_img_width` int NOT NULL DEFAULT '0',
  `ev_mobile_img_height` int NOT NULL DEFAULT '0',
  `ev_mobile_list_mod` int NOT NULL DEFAULT '0',
  `ev_mobile_list_row` int NOT NULL DEFAULT '0',
  `ev_subject` varchar(255) NOT NULL DEFAULT '',
  `ev_subject_strong` tinyint NOT NULL DEFAULT '0',
  `ev_head_html` text NOT NULL,
  `ev_tail_html` text NOT NULL,
  `ev_use` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ev_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_shop_event`
--

LOCK TABLES `g5_shop_event` WRITE;
/*!40000 ALTER TABLE `g5_shop_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_shop_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_shop_event_item`
--

DROP TABLE IF EXISTS `g5_shop_event_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_shop_event_item` (
  `ev_id` int NOT NULL DEFAULT '0',
  `it_id` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`ev_id`,`it_id`),
  KEY `it_id` (`it_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_shop_event_item`
--

LOCK TABLES `g5_shop_event_item` WRITE;
/*!40000 ALTER TABLE `g5_shop_event_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_shop_event_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_shop_inicis_log`
--

DROP TABLE IF EXISTS `g5_shop_inicis_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_shop_inicis_log` (
  `oid` bigint unsigned NOT NULL,
  `P_TID` varchar(255) NOT NULL DEFAULT '',
  `P_MID` varchar(255) NOT NULL DEFAULT '',
  `P_AUTH_DT` varchar(255) NOT NULL DEFAULT '',
  `P_STATUS` varchar(255) NOT NULL DEFAULT '',
  `P_TYPE` varchar(255) NOT NULL DEFAULT '',
  `P_OID` varchar(255) NOT NULL DEFAULT '',
  `P_FN_NM` varchar(255) NOT NULL DEFAULT '',
  `P_AUTH_NO` varchar(255) NOT NULL DEFAULT '',
  `P_AMT` int NOT NULL DEFAULT '0',
  `P_RMESG1` varchar(255) NOT NULL DEFAULT '',
  `post_data` text NOT NULL,
  `is_mail_send` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_shop_inicis_log`
--

LOCK TABLES `g5_shop_inicis_log` WRITE;
/*!40000 ALTER TABLE `g5_shop_inicis_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_shop_inicis_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_shop_item`
--

DROP TABLE IF EXISTS `g5_shop_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_shop_item` (
  `it_id` varchar(20) NOT NULL DEFAULT '',
  `ca_id` varchar(10) NOT NULL DEFAULT '0',
  `ca_id2` varchar(255) NOT NULL DEFAULT '',
  `ca_id3` varchar(255) NOT NULL DEFAULT '',
  `it_skin` varchar(255) NOT NULL DEFAULT '',
  `it_mobile_skin` varchar(255) NOT NULL DEFAULT '',
  `it_name` varchar(255) NOT NULL DEFAULT '',
  `it_seo_title` varchar(200) NOT NULL DEFAULT '',
  `it_maker` varchar(255) NOT NULL DEFAULT '',
  `it_origin` varchar(255) NOT NULL DEFAULT '',
  `it_brand` varchar(255) NOT NULL DEFAULT '',
  `it_model` varchar(255) NOT NULL DEFAULT '',
  `it_option_subject` varchar(255) NOT NULL DEFAULT '',
  `it_supply_subject` varchar(255) NOT NULL DEFAULT '',
  `it_type1` tinyint NOT NULL DEFAULT '0',
  `it_type2` tinyint NOT NULL DEFAULT '0',
  `it_type3` tinyint NOT NULL DEFAULT '0',
  `it_type4` tinyint NOT NULL DEFAULT '0',
  `it_type5` tinyint NOT NULL DEFAULT '0',
  `it_basic` text NOT NULL,
  `it_explan` mediumtext NOT NULL,
  `it_explan2` mediumtext NOT NULL,
  `it_mobile_explan` mediumtext NOT NULL,
  `it_cust_price` int NOT NULL DEFAULT '0',
  `it_price` int NOT NULL DEFAULT '0',
  `it_point` int NOT NULL DEFAULT '0',
  `it_point_type` tinyint NOT NULL DEFAULT '0',
  `it_supply_point` int NOT NULL DEFAULT '0',
  `it_notax` tinyint NOT NULL DEFAULT '0',
  `it_sell_email` varchar(255) NOT NULL DEFAULT '',
  `it_use` tinyint NOT NULL DEFAULT '0',
  `it_nocoupon` tinyint NOT NULL DEFAULT '0',
  `it_soldout` tinyint NOT NULL DEFAULT '0',
  `it_stock_qty` int NOT NULL DEFAULT '0',
  `it_stock_sms` tinyint NOT NULL DEFAULT '0',
  `it_noti_qty` int NOT NULL DEFAULT '0',
  `it_sc_type` tinyint NOT NULL DEFAULT '0',
  `it_sc_method` tinyint NOT NULL DEFAULT '0',
  `it_sc_price` int NOT NULL DEFAULT '0',
  `it_sc_minimum` int NOT NULL DEFAULT '0',
  `it_sc_qty` int NOT NULL DEFAULT '0',
  `it_buy_min_qty` int NOT NULL DEFAULT '0',
  `it_buy_max_qty` int NOT NULL DEFAULT '0',
  `it_head_html` text NOT NULL,
  `it_tail_html` text NOT NULL,
  `it_mobile_head_html` text NOT NULL,
  `it_mobile_tail_html` text NOT NULL,
  `it_hit` int NOT NULL DEFAULT '0',
  `it_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `it_update_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `it_ip` varchar(25) NOT NULL DEFAULT '',
  `it_order` int NOT NULL DEFAULT '0',
  `it_tel_inq` tinyint NOT NULL DEFAULT '0',
  `it_info_gubun` varchar(50) NOT NULL DEFAULT '',
  `it_info_value` text NOT NULL,
  `it_sum_qty` int NOT NULL DEFAULT '0',
  `it_use_cnt` int NOT NULL DEFAULT '0',
  `it_use_avg` decimal(2,1) NOT NULL,
  `it_shop_memo` text NOT NULL,
  `ec_mall_pid` varchar(255) NOT NULL DEFAULT '',
  `it_img1` varchar(255) NOT NULL DEFAULT '',
  `it_img2` varchar(255) NOT NULL DEFAULT '',
  `it_img3` varchar(255) NOT NULL DEFAULT '',
  `it_img4` varchar(255) NOT NULL DEFAULT '',
  `it_img5` varchar(255) NOT NULL DEFAULT '',
  `it_img6` varchar(255) NOT NULL DEFAULT '',
  `it_img7` varchar(255) NOT NULL DEFAULT '',
  `it_img8` varchar(255) NOT NULL DEFAULT '',
  `it_img9` varchar(255) NOT NULL DEFAULT '',
  `it_img10` varchar(255) NOT NULL DEFAULT '',
  `it_1_subj` varchar(255) NOT NULL DEFAULT '',
  `it_2_subj` varchar(255) NOT NULL DEFAULT '',
  `it_3_subj` varchar(255) NOT NULL DEFAULT '',
  `it_4_subj` varchar(255) NOT NULL DEFAULT '',
  `it_5_subj` varchar(255) NOT NULL DEFAULT '',
  `it_6_subj` varchar(255) NOT NULL DEFAULT '',
  `it_7_subj` varchar(255) NOT NULL DEFAULT '',
  `it_8_subj` varchar(255) NOT NULL DEFAULT '',
  `it_9_subj` varchar(255) NOT NULL DEFAULT '',
  `it_10_subj` varchar(255) NOT NULL DEFAULT '',
  `it_1` varchar(255) NOT NULL DEFAULT '',
  `it_2` varchar(255) NOT NULL DEFAULT '',
  `it_3` varchar(255) NOT NULL DEFAULT '',
  `it_4` varchar(255) NOT NULL DEFAULT '',
  `it_5` varchar(255) NOT NULL DEFAULT '',
  `it_6` varchar(255) NOT NULL DEFAULT '',
  `it_7` varchar(255) NOT NULL DEFAULT '',
  `it_8` varchar(255) NOT NULL DEFAULT '',
  `it_9` varchar(255) NOT NULL DEFAULT '',
  `it_10` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`it_id`),
  KEY `ca_id` (`ca_id`),
  KEY `it_name` (`it_name`),
  KEY `it_seo_title` (`it_seo_title`),
  KEY `it_order` (`it_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_shop_item`
--

LOCK TABLES `g5_shop_item` WRITE;
/*!40000 ALTER TABLE `g5_shop_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_shop_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_shop_item_option`
--

DROP TABLE IF EXISTS `g5_shop_item_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_shop_item_option` (
  `io_no` int NOT NULL AUTO_INCREMENT,
  `io_id` varchar(255) NOT NULL DEFAULT '0',
  `io_type` tinyint NOT NULL DEFAULT '0',
  `it_id` varchar(20) NOT NULL DEFAULT '',
  `io_price` int NOT NULL DEFAULT '0',
  `io_stock_qty` int NOT NULL DEFAULT '0',
  `io_noti_qty` int NOT NULL DEFAULT '0',
  `io_use` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`io_no`),
  KEY `io_id` (`io_id`),
  KEY `it_id` (`it_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_shop_item_option`
--

LOCK TABLES `g5_shop_item_option` WRITE;
/*!40000 ALTER TABLE `g5_shop_item_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_shop_item_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_shop_item_qa`
--

DROP TABLE IF EXISTS `g5_shop_item_qa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_shop_item_qa` (
  `iq_id` int NOT NULL AUTO_INCREMENT,
  `it_id` varchar(20) NOT NULL DEFAULT '',
  `mb_id` varchar(255) NOT NULL DEFAULT '',
  `iq_secret` tinyint NOT NULL DEFAULT '0',
  `iq_name` varchar(255) NOT NULL DEFAULT '',
  `iq_email` varchar(255) NOT NULL DEFAULT '',
  `iq_hp` varchar(255) NOT NULL DEFAULT '',
  `iq_password` varchar(255) NOT NULL DEFAULT '',
  `iq_subject` varchar(255) NOT NULL DEFAULT '',
  `iq_question` text NOT NULL,
  `iq_answer` text NOT NULL,
  `iq_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `iq_ip` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`iq_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_shop_item_qa`
--

LOCK TABLES `g5_shop_item_qa` WRITE;
/*!40000 ALTER TABLE `g5_shop_item_qa` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_shop_item_qa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_shop_item_relation`
--

DROP TABLE IF EXISTS `g5_shop_item_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_shop_item_relation` (
  `it_id` varchar(20) NOT NULL DEFAULT '',
  `it_id2` varchar(20) NOT NULL DEFAULT '',
  `ir_no` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`it_id`,`it_id2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_shop_item_relation`
--

LOCK TABLES `g5_shop_item_relation` WRITE;
/*!40000 ALTER TABLE `g5_shop_item_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_shop_item_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_shop_item_stocksms`
--

DROP TABLE IF EXISTS `g5_shop_item_stocksms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_shop_item_stocksms` (
  `ss_id` int NOT NULL AUTO_INCREMENT,
  `it_id` varchar(20) NOT NULL DEFAULT '',
  `ss_hp` varchar(255) NOT NULL DEFAULT '',
  `ss_send` tinyint NOT NULL DEFAULT '0',
  `ss_send_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ss_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ss_ip` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`ss_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_shop_item_stocksms`
--

LOCK TABLES `g5_shop_item_stocksms` WRITE;
/*!40000 ALTER TABLE `g5_shop_item_stocksms` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_shop_item_stocksms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_shop_item_use`
--

DROP TABLE IF EXISTS `g5_shop_item_use`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_shop_item_use` (
  `is_id` int NOT NULL AUTO_INCREMENT,
  `it_id` varchar(20) NOT NULL DEFAULT '0',
  `mb_id` varchar(255) NOT NULL DEFAULT '',
  `is_name` varchar(255) NOT NULL DEFAULT '',
  `is_password` varchar(255) NOT NULL DEFAULT '',
  `is_score` tinyint NOT NULL DEFAULT '0',
  `is_subject` varchar(255) NOT NULL DEFAULT '',
  `is_content` text NOT NULL,
  `is_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_ip` varchar(25) NOT NULL DEFAULT '',
  `is_confirm` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`is_id`),
  KEY `index1` (`it_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_shop_item_use`
--

LOCK TABLES `g5_shop_item_use` WRITE;
/*!40000 ALTER TABLE `g5_shop_item_use` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_shop_item_use` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_shop_order`
--

DROP TABLE IF EXISTS `g5_shop_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_shop_order` (
  `od_id` bigint unsigned NOT NULL,
  `mb_id` varchar(255) NOT NULL DEFAULT '',
  `od_name` varchar(20) NOT NULL DEFAULT '',
  `od_email` varchar(100) NOT NULL DEFAULT '',
  `od_tel` varchar(20) NOT NULL DEFAULT '',
  `od_hp` varchar(20) NOT NULL DEFAULT '',
  `od_zip1` char(3) NOT NULL DEFAULT '',
  `od_zip2` char(3) NOT NULL DEFAULT '',
  `od_addr1` varchar(100) NOT NULL DEFAULT '',
  `od_addr2` varchar(100) NOT NULL DEFAULT '',
  `od_addr3` varchar(255) NOT NULL DEFAULT '',
  `od_addr_jibeon` varchar(255) NOT NULL DEFAULT '',
  `od_deposit_name` varchar(20) NOT NULL DEFAULT '',
  `od_b_name` varchar(20) NOT NULL DEFAULT '',
  `od_b_tel` varchar(20) NOT NULL DEFAULT '',
  `od_b_hp` varchar(20) NOT NULL DEFAULT '',
  `od_b_zip1` char(3) NOT NULL DEFAULT '',
  `od_b_zip2` char(3) NOT NULL DEFAULT '',
  `od_b_addr1` varchar(100) NOT NULL DEFAULT '',
  `od_b_addr2` varchar(100) NOT NULL DEFAULT '',
  `od_b_addr3` varchar(255) NOT NULL DEFAULT '',
  `od_b_addr_jibeon` varchar(255) NOT NULL DEFAULT '',
  `od_memo` text NOT NULL,
  `od_cart_count` int NOT NULL DEFAULT '0',
  `od_cart_price` int NOT NULL DEFAULT '0',
  `od_cart_coupon` int NOT NULL DEFAULT '0',
  `od_send_cost` int NOT NULL DEFAULT '0',
  `od_send_cost2` int NOT NULL DEFAULT '0',
  `od_send_coupon` int NOT NULL DEFAULT '0',
  `od_receipt_price` int NOT NULL DEFAULT '0',
  `od_cancel_price` int NOT NULL DEFAULT '0',
  `od_receipt_point` int NOT NULL DEFAULT '0',
  `od_refund_price` int NOT NULL DEFAULT '0',
  `od_bank_account` varchar(255) NOT NULL DEFAULT '',
  `od_receipt_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `od_coupon` int NOT NULL DEFAULT '0',
  `od_misu` int NOT NULL DEFAULT '0',
  `od_shop_memo` text NOT NULL,
  `od_mod_history` text NOT NULL,
  `od_status` varchar(255) NOT NULL DEFAULT '',
  `od_hope_date` date NOT NULL DEFAULT '0000-00-00',
  `od_settle_case` varchar(255) NOT NULL DEFAULT '',
  `od_other_pay_type` varchar(100) NOT NULL DEFAULT '',
  `od_test` tinyint NOT NULL DEFAULT '0',
  `od_mobile` tinyint NOT NULL DEFAULT '0',
  `od_pg` varchar(255) NOT NULL DEFAULT '',
  `od_tno` varchar(255) NOT NULL DEFAULT '',
  `od_app_no` varchar(20) NOT NULL DEFAULT '',
  `od_escrow` tinyint NOT NULL DEFAULT '0',
  `od_casseqno` varchar(255) NOT NULL DEFAULT '',
  `od_tax_flag` tinyint NOT NULL DEFAULT '0',
  `od_tax_mny` int NOT NULL DEFAULT '0',
  `od_vat_mny` int NOT NULL DEFAULT '0',
  `od_free_mny` int NOT NULL DEFAULT '0',
  `od_delivery_company` varchar(255) NOT NULL DEFAULT '0',
  `od_invoice` varchar(255) NOT NULL DEFAULT '',
  `od_invoice_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `od_cash` tinyint NOT NULL,
  `od_cash_no` varchar(255) NOT NULL,
  `od_cash_info` text NOT NULL,
  `od_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `od_pwd` varchar(255) NOT NULL DEFAULT '',
  `od_ip` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`od_id`),
  KEY `index2` (`mb_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_shop_order`
--

LOCK TABLES `g5_shop_order` WRITE;
/*!40000 ALTER TABLE `g5_shop_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_shop_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_shop_order_address`
--

DROP TABLE IF EXISTS `g5_shop_order_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_shop_order_address` (
  `ad_id` int NOT NULL AUTO_INCREMENT,
  `mb_id` varchar(255) NOT NULL DEFAULT '',
  `ad_subject` varchar(255) NOT NULL DEFAULT '',
  `ad_default` tinyint NOT NULL DEFAULT '0',
  `ad_name` varchar(255) NOT NULL DEFAULT '',
  `ad_tel` varchar(255) NOT NULL DEFAULT '',
  `ad_hp` varchar(255) NOT NULL DEFAULT '',
  `ad_zip1` char(3) NOT NULL DEFAULT '',
  `ad_zip2` char(3) NOT NULL DEFAULT '',
  `ad_addr1` varchar(255) NOT NULL DEFAULT '',
  `ad_addr2` varchar(255) NOT NULL DEFAULT '',
  `ad_addr3` varchar(255) NOT NULL DEFAULT '',
  `ad_jibeon` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ad_id`),
  KEY `mb_id` (`mb_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_shop_order_address`
--

LOCK TABLES `g5_shop_order_address` WRITE;
/*!40000 ALTER TABLE `g5_shop_order_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_shop_order_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_shop_order_data`
--

DROP TABLE IF EXISTS `g5_shop_order_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_shop_order_data` (
  `od_id` bigint unsigned NOT NULL,
  `cart_id` bigint unsigned NOT NULL,
  `mb_id` varchar(20) NOT NULL DEFAULT '',
  `dt_pg` varchar(255) NOT NULL DEFAULT '',
  `dt_data` text NOT NULL,
  `dt_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `od_id` (`od_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_shop_order_data`
--

LOCK TABLES `g5_shop_order_data` WRITE;
/*!40000 ALTER TABLE `g5_shop_order_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_shop_order_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_shop_order_delete`
--

DROP TABLE IF EXISTS `g5_shop_order_delete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_shop_order_delete` (
  `de_id` int NOT NULL AUTO_INCREMENT,
  `de_key` varchar(255) NOT NULL DEFAULT '',
  `de_data` longtext NOT NULL,
  `mb_id` varchar(20) NOT NULL DEFAULT '',
  `de_ip` varchar(255) NOT NULL DEFAULT '',
  `de_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`de_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_shop_order_delete`
--

LOCK TABLES `g5_shop_order_delete` WRITE;
/*!40000 ALTER TABLE `g5_shop_order_delete` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_shop_order_delete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_shop_order_post_log`
--

DROP TABLE IF EXISTS `g5_shop_order_post_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_shop_order_post_log` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `oid` bigint unsigned NOT NULL,
  `mb_id` varchar(255) NOT NULL DEFAULT '',
  `post_data` text NOT NULL,
  `ol_code` varchar(255) NOT NULL DEFAULT '',
  `ol_msg` text NOT NULL,
  `ol_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ol_ip` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_shop_order_post_log`
--

LOCK TABLES `g5_shop_order_post_log` WRITE;
/*!40000 ALTER TABLE `g5_shop_order_post_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_shop_order_post_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_shop_personalpay`
--

DROP TABLE IF EXISTS `g5_shop_personalpay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_shop_personalpay` (
  `pp_id` bigint unsigned NOT NULL,
  `od_id` bigint unsigned NOT NULL,
  `pp_name` varchar(255) NOT NULL DEFAULT '',
  `pp_email` varchar(255) NOT NULL DEFAULT '',
  `pp_hp` varchar(255) NOT NULL DEFAULT '',
  `pp_content` text NOT NULL,
  `pp_use` tinyint NOT NULL DEFAULT '0',
  `pp_price` int NOT NULL DEFAULT '0',
  `pp_pg` varchar(255) NOT NULL DEFAULT '',
  `pp_tno` varchar(255) NOT NULL DEFAULT '',
  `pp_app_no` varchar(20) NOT NULL DEFAULT '',
  `pp_casseqno` varchar(255) NOT NULL DEFAULT '',
  `pp_receipt_price` int NOT NULL DEFAULT '0',
  `pp_settle_case` varchar(255) NOT NULL DEFAULT '',
  `pp_bank_account` varchar(255) NOT NULL DEFAULT '',
  `pp_deposit_name` varchar(255) NOT NULL DEFAULT '',
  `pp_receipt_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `pp_receipt_ip` varchar(255) NOT NULL DEFAULT '',
  `pp_shop_memo` text NOT NULL,
  `pp_cash` tinyint NOT NULL DEFAULT '0',
  `pp_cash_no` varchar(255) NOT NULL DEFAULT '',
  `pp_cash_info` text NOT NULL,
  `pp_ip` varchar(255) NOT NULL DEFAULT '',
  `pp_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`pp_id`),
  KEY `od_id` (`od_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_shop_personalpay`
--

LOCK TABLES `g5_shop_personalpay` WRITE;
/*!40000 ALTER TABLE `g5_shop_personalpay` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_shop_personalpay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_shop_sendcost`
--

DROP TABLE IF EXISTS `g5_shop_sendcost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_shop_sendcost` (
  `sc_id` int NOT NULL AUTO_INCREMENT,
  `sc_name` varchar(255) NOT NULL DEFAULT '',
  `sc_zip1` varchar(10) NOT NULL DEFAULT '',
  `sc_zip2` varchar(10) NOT NULL DEFAULT '',
  `sc_price` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`sc_id`),
  KEY `sc_zip1` (`sc_zip1`),
  KEY `sc_zip2` (`sc_zip2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_shop_sendcost`
--

LOCK TABLES `g5_shop_sendcost` WRITE;
/*!40000 ALTER TABLE `g5_shop_sendcost` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_shop_sendcost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_shop_wish`
--

DROP TABLE IF EXISTS `g5_shop_wish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_shop_wish` (
  `wi_id` int NOT NULL AUTO_INCREMENT,
  `mb_id` varchar(255) NOT NULL DEFAULT '',
  `it_id` varchar(20) NOT NULL DEFAULT '0',
  `wi_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wi_ip` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`wi_id`),
  KEY `index1` (`mb_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_shop_wish`
--

LOCK TABLES `g5_shop_wish` WRITE;
/*!40000 ALTER TABLE `g5_shop_wish` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_shop_wish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_uniqid`
--

DROP TABLE IF EXISTS `g5_uniqid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_uniqid` (
  `uq_id` bigint unsigned NOT NULL,
  `uq_ip` varchar(255) NOT NULL,
  PRIMARY KEY (`uq_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_uniqid`
--

LOCK TABLES `g5_uniqid` WRITE;
/*!40000 ALTER TABLE `g5_uniqid` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_uniqid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_visit`
--

DROP TABLE IF EXISTS `g5_visit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_visit` (
  `vi_id` int NOT NULL AUTO_INCREMENT,
  `vi_ip` varchar(100) NOT NULL DEFAULT '',
  `vi_date` date NOT NULL DEFAULT '0000-00-00',
  `vi_time` time NOT NULL DEFAULT '00:00:00',
  `vi_referer` text NOT NULL,
  `vi_agent` varchar(200) NOT NULL DEFAULT '',
  `vi_browser` varchar(255) NOT NULL DEFAULT '',
  `vi_os` varchar(255) NOT NULL DEFAULT '',
  `vi_device` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`vi_id`),
  UNIQUE KEY `index1` (`vi_ip`,`vi_date`),
  KEY `index2` (`vi_date`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_visit`
--

LOCK TABLES `g5_visit` WRITE;
/*!40000 ALTER TABLE `g5_visit` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_visit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_visit_sum`
--

DROP TABLE IF EXISTS `g5_visit_sum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_visit_sum` (
  `vs_date` date NOT NULL DEFAULT '0000-00-00',
  `vs_count` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`vs_date`),
  KEY `index1` (`vs_count`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_visit_sum`
--

LOCK TABLES `g5_visit_sum` WRITE;
/*!40000 ALTER TABLE `g5_visit_sum` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_visit_sum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_ai`
--

DROP TABLE IF EXISTS `g5_write_ai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_write_ai` (
  `wr_id` int NOT NULL AUTO_INCREMENT,
  `wr_num` int NOT NULL DEFAULT '0',
  `wr_reply` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_parent` int NOT NULL DEFAULT '0',
  `wr_is_comment` tinyint NOT NULL DEFAULT '0',
  `wr_comment` int NOT NULL DEFAULT '0',
  `wr_comment_reply` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ca_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_option` set('html1','html2','secret','mail') COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_seo_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `wr_link1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link2` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link1_hit` int NOT NULL DEFAULT '0',
  `wr_link2_hit` int NOT NULL DEFAULT '0',
  `wr_hit` int NOT NULL DEFAULT '0',
  `wr_good` int NOT NULL DEFAULT '0',
  `wr_nogood` int NOT NULL DEFAULT '0',
  `mb_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_homepage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wr_file` tinyint NOT NULL DEFAULT '0',
  `wr_last` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_facebook_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_twitter_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_4` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_5` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_6` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_7` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_8` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_9` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_10` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`wr_id`),
  KEY `wr_seo_title` (`wr_seo_title`),
  KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
  KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_ai`
--

LOCK TABLES `g5_write_ai` WRITE;
/*!40000 ALTER TABLE `g5_write_ai` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_write_ai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_boardgame`
--

DROP TABLE IF EXISTS `g5_write_boardgame`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_write_boardgame` (
  `wr_id` int NOT NULL AUTO_INCREMENT,
  `wr_num` int NOT NULL DEFAULT '0',
  `wr_reply` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_parent` int NOT NULL DEFAULT '0',
  `wr_is_comment` tinyint NOT NULL DEFAULT '0',
  `wr_comment` int NOT NULL DEFAULT '0',
  `wr_comment_reply` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ca_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_option` set('html1','html2','secret','mail') COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_seo_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link2` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link1_hit` int NOT NULL DEFAULT '0',
  `wr_link2_hit` int NOT NULL DEFAULT '0',
  `wr_hit` int NOT NULL DEFAULT '0',
  `wr_good` int NOT NULL DEFAULT '0',
  `wr_nogood` int NOT NULL DEFAULT '0',
  `mb_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_homepage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wr_file` tinyint NOT NULL DEFAULT '0',
  `wr_last` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_facebook_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_twitter_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_4` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_5` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_6` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_7` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_8` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_9` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_10` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`wr_id`),
  KEY `wr_seo_title` (`wr_seo_title`),
  KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
  KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_boardgame`
--

LOCK TABLES `g5_write_boardgame` WRITE;
/*!40000 ALTER TABLE `g5_write_boardgame` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_write_boardgame` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_bts`
--

DROP TABLE IF EXISTS `g5_write_bts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_write_bts` (
  `wr_id` int NOT NULL AUTO_INCREMENT,
  `wr_num` int NOT NULL DEFAULT '0',
  `wr_reply` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_parent` int NOT NULL DEFAULT '0',
  `wr_is_comment` tinyint NOT NULL DEFAULT '0',
  `wr_comment` int NOT NULL DEFAULT '0',
  `wr_comment_reply` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ca_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_option` set('html1','html2','secret','mail') COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_seo_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link2` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link1_hit` int NOT NULL DEFAULT '0',
  `wr_link2_hit` int NOT NULL DEFAULT '0',
  `wr_hit` int NOT NULL DEFAULT '0',
  `wr_good` int NOT NULL DEFAULT '0',
  `wr_nogood` int NOT NULL DEFAULT '0',
  `mb_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_homepage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wr_file` tinyint NOT NULL DEFAULT '0',
  `wr_last` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_facebook_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_twitter_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_4` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_5` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_6` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_7` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_8` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_9` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_10` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`wr_id`),
  KEY `wr_seo_title` (`wr_seo_title`),
  KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
  KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_bts`
--

LOCK TABLES `g5_write_bts` WRITE;
/*!40000 ALTER TABLE `g5_write_bts` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_write_bts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_car`
--

DROP TABLE IF EXISTS `g5_write_car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_write_car` (
  `wr_id` int NOT NULL AUTO_INCREMENT,
  `wr_num` int NOT NULL DEFAULT '0',
  `wr_reply` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_parent` int NOT NULL DEFAULT '0',
  `wr_is_comment` tinyint NOT NULL DEFAULT '0',
  `wr_comment` int NOT NULL DEFAULT '0',
  `wr_comment_reply` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ca_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_option` set('html1','html2','secret','mail') COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_seo_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link2` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link1_hit` int NOT NULL DEFAULT '0',
  `wr_link2_hit` int NOT NULL DEFAULT '0',
  `wr_hit` int NOT NULL DEFAULT '0',
  `wr_good` int NOT NULL DEFAULT '0',
  `wr_nogood` int NOT NULL DEFAULT '0',
  `mb_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_homepage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wr_file` tinyint NOT NULL DEFAULT '0',
  `wr_last` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_facebook_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_twitter_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_4` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_5` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_6` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_7` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_8` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_9` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_10` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`wr_id`),
  KEY `wr_seo_title` (`wr_seo_title`),
  KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
  KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_car`
--

LOCK TABLES `g5_write_car` WRITE;
/*!40000 ALTER TABLE `g5_write_car` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_write_car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_cat`
--

DROP TABLE IF EXISTS `g5_write_cat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_write_cat` (
  `wr_id` int NOT NULL AUTO_INCREMENT,
  `wr_num` int NOT NULL DEFAULT '0',
  `wr_reply` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_parent` int NOT NULL DEFAULT '0',
  `wr_is_comment` tinyint NOT NULL DEFAULT '0',
  `wr_comment` int NOT NULL DEFAULT '0',
  `wr_comment_reply` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ca_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_option` set('html1','html2','secret','mail') COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_seo_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link2` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link1_hit` int NOT NULL DEFAULT '0',
  `wr_link2_hit` int NOT NULL DEFAULT '0',
  `wr_hit` int NOT NULL DEFAULT '0',
  `wr_good` int NOT NULL DEFAULT '0',
  `wr_nogood` int NOT NULL DEFAULT '0',
  `mb_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_homepage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wr_file` tinyint NOT NULL DEFAULT '0',
  `wr_last` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_facebook_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_twitter_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_4` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_5` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_6` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_7` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_8` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_9` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_10` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`wr_id`),
  KEY `wr_seo_title` (`wr_seo_title`),
  KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
  KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_cat`
--

LOCK TABLES `g5_write_cat` WRITE;
/*!40000 ALTER TABLE `g5_write_cat` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_write_cat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_cryptocurrency`
--

DROP TABLE IF EXISTS `g5_write_cryptocurrency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_write_cryptocurrency` (
  `wr_id` int NOT NULL AUTO_INCREMENT,
  `wr_num` int NOT NULL DEFAULT '0',
  `wr_reply` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_parent` int NOT NULL DEFAULT '0',
  `wr_is_comment` tinyint NOT NULL DEFAULT '0',
  `wr_comment` int NOT NULL DEFAULT '0',
  `wr_comment_reply` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ca_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_option` set('html1','html2','secret','mail') COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_seo_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link2` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link1_hit` int NOT NULL DEFAULT '0',
  `wr_link2_hit` int NOT NULL DEFAULT '0',
  `wr_hit` int NOT NULL DEFAULT '0',
  `wr_good` int NOT NULL DEFAULT '0',
  `wr_nogood` int NOT NULL DEFAULT '0',
  `mb_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_homepage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wr_file` tinyint NOT NULL DEFAULT '0',
  `wr_last` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_facebook_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_twitter_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_4` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_5` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_6` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_7` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_8` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_9` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_10` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`wr_id`),
  KEY `wr_seo_title` (`wr_seo_title`),
  KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
  KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_cryptocurrency`
--

LOCK TABLES `g5_write_cryptocurrency` WRITE;
/*!40000 ALTER TABLE `g5_write_cryptocurrency` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_write_cryptocurrency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_daegu`
--

DROP TABLE IF EXISTS `g5_write_daegu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_write_daegu` (
  `wr_id` int NOT NULL AUTO_INCREMENT,
  `wr_num` int NOT NULL DEFAULT '0',
  `wr_reply` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_parent` int NOT NULL DEFAULT '0',
  `wr_is_comment` tinyint NOT NULL DEFAULT '0',
  `wr_comment` int NOT NULL DEFAULT '0',
  `wr_comment_reply` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ca_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_option` set('html1','html2','secret','mail') COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_seo_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link2` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link1_hit` int NOT NULL DEFAULT '0',
  `wr_link2_hit` int NOT NULL DEFAULT '0',
  `wr_hit` int NOT NULL DEFAULT '0',
  `wr_good` int NOT NULL DEFAULT '0',
  `wr_nogood` int NOT NULL DEFAULT '0',
  `mb_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_homepage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wr_file` tinyint NOT NULL DEFAULT '0',
  `wr_last` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_facebook_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_twitter_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_4` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_5` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_6` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_7` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_8` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_9` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_10` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`wr_id`),
  KEY `wr_seo_title` (`wr_seo_title`),
  KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
  KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_daegu`
--

LOCK TABLES `g5_write_daegu` WRITE;
/*!40000 ALTER TABLE `g5_write_daegu` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_write_daegu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_development`
--

DROP TABLE IF EXISTS `g5_write_development`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_write_development` (
  `wr_id` int NOT NULL AUTO_INCREMENT,
  `wr_num` int NOT NULL DEFAULT '0',
  `wr_reply` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_parent` int NOT NULL DEFAULT '0',
  `wr_is_comment` tinyint NOT NULL DEFAULT '0',
  `wr_comment` int NOT NULL DEFAULT '0',
  `wr_comment_reply` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ca_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_option` set('html1','html2','secret','mail') COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_seo_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link2` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link1_hit` int NOT NULL DEFAULT '0',
  `wr_link2_hit` int NOT NULL DEFAULT '0',
  `wr_hit` int NOT NULL DEFAULT '0',
  `wr_good` int NOT NULL DEFAULT '0',
  `wr_nogood` int NOT NULL DEFAULT '0',
  `mb_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_homepage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wr_file` tinyint NOT NULL DEFAULT '0',
  `wr_last` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_facebook_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_twitter_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_4` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_5` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_6` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_7` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_8` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_9` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_10` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`wr_id`),
  KEY `wr_seo_title` (`wr_seo_title`),
  KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
  KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_development`
--

LOCK TABLES `g5_write_development` WRITE;
/*!40000 ALTER TABLE `g5_write_development` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_write_development` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_diablo`
--

DROP TABLE IF EXISTS `g5_write_diablo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_write_diablo` (
  `wr_id` int NOT NULL AUTO_INCREMENT,
  `wr_num` int NOT NULL DEFAULT '0',
  `wr_reply` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_parent` int NOT NULL DEFAULT '0',
  `wr_is_comment` tinyint NOT NULL DEFAULT '0',
  `wr_comment` int NOT NULL DEFAULT '0',
  `wr_comment_reply` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ca_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_option` set('html1','html2','secret','mail') COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_seo_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link2` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link1_hit` int NOT NULL DEFAULT '0',
  `wr_link2_hit` int NOT NULL DEFAULT '0',
  `wr_hit` int NOT NULL DEFAULT '0',
  `wr_good` int NOT NULL DEFAULT '0',
  `wr_nogood` int NOT NULL DEFAULT '0',
  `mb_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_homepage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wr_file` tinyint NOT NULL DEFAULT '0',
  `wr_last` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_facebook_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_twitter_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_4` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_5` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_6` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_7` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_8` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_9` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_10` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`wr_id`),
  KEY `wr_seo_title` (`wr_seo_title`),
  KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
  KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_diablo`
--

LOCK TABLES `g5_write_diablo` WRITE;
/*!40000 ALTER TABLE `g5_write_diablo` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_write_diablo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_dongsup`
--

DROP TABLE IF EXISTS `g5_write_dongsup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_write_dongsup` (
  `wr_id` int NOT NULL AUTO_INCREMENT,
  `wr_num` int NOT NULL DEFAULT '0',
  `wr_reply` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_parent` int NOT NULL DEFAULT '0',
  `wr_is_comment` tinyint NOT NULL DEFAULT '0',
  `wr_comment` int NOT NULL DEFAULT '0',
  `wr_comment_reply` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ca_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_option` set('html1','html2','secret','mail') COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_seo_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link2` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link1_hit` int NOT NULL DEFAULT '0',
  `wr_link2_hit` int NOT NULL DEFAULT '0',
  `wr_hit` int NOT NULL DEFAULT '0',
  `wr_good` int NOT NULL DEFAULT '0',
  `wr_nogood` int NOT NULL DEFAULT '0',
  `mb_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_homepage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wr_file` tinyint NOT NULL DEFAULT '0',
  `wr_last` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_facebook_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_twitter_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_4` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_5` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_6` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_7` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_8` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_9` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_10` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`wr_id`),
  KEY `wr_seo_title` (`wr_seo_title`),
  KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
  KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_dongsup`
--

LOCK TABLES `g5_write_dongsup` WRITE;
/*!40000 ALTER TABLE `g5_write_dongsup` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_write_dongsup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_drawing`
--

DROP TABLE IF EXISTS `g5_write_drawing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_write_drawing` (
  `wr_id` int NOT NULL AUTO_INCREMENT,
  `wr_num` int NOT NULL DEFAULT '0',
  `wr_reply` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_parent` int NOT NULL DEFAULT '0',
  `wr_is_comment` tinyint NOT NULL DEFAULT '0',
  `wr_comment` int NOT NULL DEFAULT '0',
  `wr_comment_reply` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ca_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_option` set('html1','html2','secret','mail') COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_seo_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link2` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link1_hit` int NOT NULL DEFAULT '0',
  `wr_link2_hit` int NOT NULL DEFAULT '0',
  `wr_hit` int NOT NULL DEFAULT '0',
  `wr_good` int NOT NULL DEFAULT '0',
  `wr_nogood` int NOT NULL DEFAULT '0',
  `mb_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_homepage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wr_file` tinyint NOT NULL DEFAULT '0',
  `wr_last` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_facebook_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_twitter_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_4` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_5` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_6` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_7` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_8` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_9` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_10` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`wr_id`),
  KEY `wr_seo_title` (`wr_seo_title`),
  KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
  KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_drawing`
--

LOCK TABLES `g5_write_drawing` WRITE;
/*!40000 ALTER TABLE `g5_write_drawing` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_write_drawing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_fishing`
--

DROP TABLE IF EXISTS `g5_write_fishing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_write_fishing` (
  `wr_id` int NOT NULL AUTO_INCREMENT,
  `wr_num` int NOT NULL DEFAULT '0',
  `wr_reply` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_parent` int NOT NULL DEFAULT '0',
  `wr_is_comment` tinyint NOT NULL DEFAULT '0',
  `wr_comment` int NOT NULL DEFAULT '0',
  `wr_comment_reply` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ca_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_option` set('html1','html2','secret','mail') COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_seo_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link2` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link1_hit` int NOT NULL DEFAULT '0',
  `wr_link2_hit` int NOT NULL DEFAULT '0',
  `wr_hit` int NOT NULL DEFAULT '0',
  `wr_good` int NOT NULL DEFAULT '0',
  `wr_nogood` int NOT NULL DEFAULT '0',
  `mb_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_homepage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wr_file` tinyint NOT NULL DEFAULT '0',
  `wr_last` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_facebook_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_twitter_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_4` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_5` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_6` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_7` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_8` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_9` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_10` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`wr_id`),
  KEY `wr_seo_title` (`wr_seo_title`),
  KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
  KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_fishing`
--

LOCK TABLES `g5_write_fishing` WRITE;
/*!40000 ALTER TABLE `g5_write_fishing` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_write_fishing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_fly`
--

DROP TABLE IF EXISTS `g5_write_fly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_write_fly` (
  `wr_id` int NOT NULL AUTO_INCREMENT,
  `wr_num` int NOT NULL DEFAULT '0',
  `wr_reply` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_parent` int NOT NULL DEFAULT '0',
  `wr_is_comment` tinyint NOT NULL DEFAULT '0',
  `wr_comment` int NOT NULL DEFAULT '0',
  `wr_comment_reply` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ca_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_option` set('html1','html2','secret','mail') COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_seo_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link2` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link1_hit` int NOT NULL DEFAULT '0',
  `wr_link2_hit` int NOT NULL DEFAULT '0',
  `wr_hit` int NOT NULL DEFAULT '0',
  `wr_good` int NOT NULL DEFAULT '0',
  `wr_nogood` int NOT NULL DEFAULT '0',
  `mb_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_homepage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wr_file` tinyint NOT NULL DEFAULT '0',
  `wr_last` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_facebook_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_twitter_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_4` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_5` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_6` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_7` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_8` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_9` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_10` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`wr_id`),
  KEY `wr_seo_title` (`wr_seo_title`),
  KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
  KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_fly`
--

LOCK TABLES `g5_write_fly` WRITE;
/*!40000 ALTER TABLE `g5_write_fly` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_write_fly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_free`
--

DROP TABLE IF EXISTS `g5_write_free`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_write_free` (
  `wr_id` int NOT NULL AUTO_INCREMENT,
  `wr_num` int NOT NULL DEFAULT '0',
  `wr_reply` varchar(10) NOT NULL,
  `wr_parent` int NOT NULL DEFAULT '0',
  `wr_is_comment` tinyint NOT NULL DEFAULT '0',
  `wr_comment` int NOT NULL DEFAULT '0',
  `wr_comment_reply` varchar(5) NOT NULL,
  `ca_name` varchar(255) NOT NULL,
  `wr_option` set('html1','html2','secret','mail') NOT NULL,
  `wr_subject` varchar(255) NOT NULL,
  `wr_content` text NOT NULL,
  `wr_seo_title` varchar(255) NOT NULL DEFAULT '',
  `wr_link1` text NOT NULL,
  `wr_link2` text NOT NULL,
  `wr_link1_hit` int NOT NULL DEFAULT '0',
  `wr_link2_hit` int NOT NULL DEFAULT '0',
  `wr_hit` int NOT NULL DEFAULT '0',
  `wr_good` int NOT NULL DEFAULT '0',
  `wr_nogood` int NOT NULL DEFAULT '0',
  `mb_id` varchar(20) NOT NULL,
  `wr_password` varchar(255) NOT NULL,
  `wr_name` varchar(255) NOT NULL,
  `wr_email` varchar(255) NOT NULL,
  `wr_homepage` varchar(255) NOT NULL,
  `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wr_file` tinyint NOT NULL DEFAULT '0',
  `wr_last` varchar(19) NOT NULL,
  `wr_ip` varchar(255) NOT NULL,
  `wr_facebook_user` varchar(255) NOT NULL,
  `wr_twitter_user` varchar(255) NOT NULL,
  `wr_1` varchar(255) NOT NULL,
  `wr_2` varchar(255) NOT NULL,
  `wr_3` varchar(255) NOT NULL,
  `wr_4` varchar(255) NOT NULL,
  `wr_5` varchar(255) NOT NULL,
  `wr_6` varchar(255) NOT NULL,
  `wr_7` varchar(255) NOT NULL,
  `wr_8` varchar(255) NOT NULL,
  `wr_9` varchar(255) NOT NULL,
  `wr_10` varchar(255) NOT NULL,
  PRIMARY KEY (`wr_id`),
  KEY `wr_seo_title` (`wr_seo_title`),
  KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
  KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10257 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_free`
--

LOCK TABLES `g5_write_free` WRITE;
/*!40000 ALTER TABLE `g5_write_free` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_write_free` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_gallery`
--

DROP TABLE IF EXISTS `g5_write_gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_write_gallery` (
  `wr_id` int NOT NULL AUTO_INCREMENT,
  `wr_num` int NOT NULL DEFAULT '0',
  `wr_reply` varchar(10) NOT NULL,
  `wr_parent` int NOT NULL DEFAULT '0',
  `wr_is_comment` tinyint NOT NULL DEFAULT '0',
  `wr_comment` int NOT NULL DEFAULT '0',
  `wr_comment_reply` varchar(5) NOT NULL,
  `ca_name` varchar(255) NOT NULL,
  `wr_option` set('html1','html2','secret','mail') NOT NULL,
  `wr_subject` varchar(255) NOT NULL,
  `wr_content` text NOT NULL,
  `wr_seo_title` varchar(255) NOT NULL DEFAULT '',
  `wr_link1` text NOT NULL,
  `wr_link2` text NOT NULL,
  `wr_link1_hit` int NOT NULL DEFAULT '0',
  `wr_link2_hit` int NOT NULL DEFAULT '0',
  `wr_hit` int NOT NULL DEFAULT '0',
  `wr_good` int NOT NULL DEFAULT '0',
  `wr_nogood` int NOT NULL DEFAULT '0',
  `mb_id` varchar(20) NOT NULL,
  `wr_password` varchar(255) NOT NULL,
  `wr_name` varchar(255) NOT NULL,
  `wr_email` varchar(255) NOT NULL,
  `wr_homepage` varchar(255) NOT NULL,
  `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wr_file` tinyint NOT NULL DEFAULT '0',
  `wr_last` varchar(19) NOT NULL,
  `wr_ip` varchar(255) NOT NULL,
  `wr_facebook_user` varchar(255) NOT NULL,
  `wr_twitter_user` varchar(255) NOT NULL,
  `wr_1` varchar(255) NOT NULL,
  `wr_2` varchar(255) NOT NULL,
  `wr_3` varchar(255) NOT NULL,
  `wr_4` varchar(255) NOT NULL,
  `wr_5` varchar(255) NOT NULL,
  `wr_6` varchar(255) NOT NULL,
  `wr_7` varchar(255) NOT NULL,
  `wr_8` varchar(255) NOT NULL,
  `wr_9` varchar(255) NOT NULL,
  `wr_10` varchar(255) NOT NULL,
  PRIMARY KEY (`wr_id`),
  KEY `wr_seo_title` (`wr_seo_title`),
  KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
  KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_gallery`
--

LOCK TABLES `g5_write_gallery` WRITE;
/*!40000 ALTER TABLE `g5_write_gallery` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_write_gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_game`
--

DROP TABLE IF EXISTS `g5_write_game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_write_game` (
  `wr_id` int NOT NULL AUTO_INCREMENT,
  `wr_num` int NOT NULL DEFAULT '0',
  `wr_reply` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_parent` int NOT NULL DEFAULT '0',
  `wr_is_comment` tinyint NOT NULL DEFAULT '0',
  `wr_comment` int NOT NULL DEFAULT '0',
  `wr_comment_reply` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ca_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_option` set('html1','html2','secret','mail') COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_seo_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link2` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link1_hit` int NOT NULL DEFAULT '0',
  `wr_link2_hit` int NOT NULL DEFAULT '0',
  `wr_hit` int NOT NULL DEFAULT '0',
  `wr_good` int NOT NULL DEFAULT '0',
  `wr_nogood` int NOT NULL DEFAULT '0',
  `mb_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_homepage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wr_file` tinyint NOT NULL DEFAULT '0',
  `wr_last` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_facebook_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_twitter_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_4` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_5` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_6` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_7` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_8` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_9` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_10` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`wr_id`),
  KEY `wr_seo_title` (`wr_seo_title`),
  KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
  KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_game`
--

LOCK TABLES `g5_write_game` WRITE;
/*!40000 ALTER TABLE `g5_write_game` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_write_game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_golf`
--

DROP TABLE IF EXISTS `g5_write_golf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_write_golf` (
  `wr_id` int NOT NULL AUTO_INCREMENT,
  `wr_num` int NOT NULL DEFAULT '0',
  `wr_reply` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_parent` int NOT NULL DEFAULT '0',
  `wr_is_comment` tinyint NOT NULL DEFAULT '0',
  `wr_comment` int NOT NULL DEFAULT '0',
  `wr_comment_reply` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ca_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_option` set('html1','html2','secret','mail') COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_seo_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link2` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link1_hit` int NOT NULL DEFAULT '0',
  `wr_link2_hit` int NOT NULL DEFAULT '0',
  `wr_hit` int NOT NULL DEFAULT '0',
  `wr_good` int NOT NULL DEFAULT '0',
  `wr_nogood` int NOT NULL DEFAULT '0',
  `mb_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_homepage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wr_file` tinyint NOT NULL DEFAULT '0',
  `wr_last` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_facebook_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_twitter_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_4` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_5` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_6` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_7` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_8` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_9` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_10` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`wr_id`),
  KEY `wr_seo_title` (`wr_seo_title`),
  KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
  KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_golf`
--

LOCK TABLES `g5_write_golf` WRITE;
/*!40000 ALTER TABLE `g5_write_golf` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_write_golf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_gym`
--

DROP TABLE IF EXISTS `g5_write_gym`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_write_gym` (
  `wr_id` int NOT NULL AUTO_INCREMENT,
  `wr_num` int NOT NULL DEFAULT '0',
  `wr_reply` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_parent` int NOT NULL DEFAULT '0',
  `wr_is_comment` tinyint NOT NULL DEFAULT '0',
  `wr_comment` int NOT NULL DEFAULT '0',
  `wr_comment_reply` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ca_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_option` set('html1','html2','secret','mail') COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_seo_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link2` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link1_hit` int NOT NULL DEFAULT '0',
  `wr_link2_hit` int NOT NULL DEFAULT '0',
  `wr_hit` int NOT NULL DEFAULT '0',
  `wr_good` int NOT NULL DEFAULT '0',
  `wr_nogood` int NOT NULL DEFAULT '0',
  `mb_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_homepage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wr_file` tinyint NOT NULL DEFAULT '0',
  `wr_last` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_facebook_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_twitter_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_4` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_5` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_6` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_7` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_8` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_9` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_10` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`wr_id`),
  KEY `wr_seo_title` (`wr_seo_title`),
  KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
  KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_gym`
--

LOCK TABLES `g5_write_gym` WRITE;
/*!40000 ALTER TABLE `g5_write_gym` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_write_gym` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_hike`
--

DROP TABLE IF EXISTS `g5_write_hike`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_write_hike` (
  `wr_id` int NOT NULL AUTO_INCREMENT,
  `wr_num` int NOT NULL DEFAULT '0',
  `wr_reply` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_parent` int NOT NULL DEFAULT '0',
  `wr_is_comment` tinyint NOT NULL DEFAULT '0',
  `wr_comment` int NOT NULL DEFAULT '0',
  `wr_comment_reply` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ca_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_option` set('html1','html2','secret','mail') COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_seo_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link2` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link1_hit` int NOT NULL DEFAULT '0',
  `wr_link2_hit` int NOT NULL DEFAULT '0',
  `wr_hit` int NOT NULL DEFAULT '0',
  `wr_good` int NOT NULL DEFAULT '0',
  `wr_nogood` int NOT NULL DEFAULT '0',
  `mb_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_homepage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wr_file` tinyint NOT NULL DEFAULT '0',
  `wr_last` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_facebook_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_twitter_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_4` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_5` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_6` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_7` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_8` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_9` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_10` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`wr_id`),
  KEY `wr_seo_title` (`wr_seo_title`),
  KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
  KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_hike`
--

LOCK TABLES `g5_write_hike` WRITE;
/*!40000 ALTER TABLE `g5_write_hike` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_write_hike` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_lecture`
--

DROP TABLE IF EXISTS `g5_write_lecture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_write_lecture` (
  `wr_id` int NOT NULL AUTO_INCREMENT,
  `wr_num` int NOT NULL DEFAULT '0',
  `wr_reply` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_parent` int NOT NULL DEFAULT '0',
  `wr_is_comment` tinyint NOT NULL DEFAULT '0',
  `wr_comment` int NOT NULL DEFAULT '0',
  `wr_comment_reply` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ca_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_option` set('html1','html2','secret','mail') COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_seo_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link2` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link1_hit` int NOT NULL DEFAULT '0',
  `wr_link2_hit` int NOT NULL DEFAULT '0',
  `wr_hit` int NOT NULL DEFAULT '0',
  `wr_good` int NOT NULL DEFAULT '0',
  `wr_nogood` int NOT NULL DEFAULT '0',
  `mb_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_homepage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wr_file` tinyint NOT NULL DEFAULT '0',
  `wr_last` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_facebook_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_twitter_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_4` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_5` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_6` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_7` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_8` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_9` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_10` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`wr_id`),
  KEY `wr_seo_title` (`wr_seo_title`),
  KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
  KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_lecture`
--

LOCK TABLES `g5_write_lecture` WRITE;
/*!40000 ALTER TABLE `g5_write_lecture` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_write_lecture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_lego`
--

DROP TABLE IF EXISTS `g5_write_lego`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_write_lego` (
  `wr_id` int NOT NULL AUTO_INCREMENT,
  `wr_num` int NOT NULL DEFAULT '0',
  `wr_reply` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_parent` int NOT NULL DEFAULT '0',
  `wr_is_comment` tinyint NOT NULL DEFAULT '0',
  `wr_comment` int NOT NULL DEFAULT '0',
  `wr_comment_reply` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ca_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_option` set('html1','html2','secret','mail') COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_seo_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link2` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link1_hit` int NOT NULL DEFAULT '0',
  `wr_link2_hit` int NOT NULL DEFAULT '0',
  `wr_hit` int NOT NULL DEFAULT '0',
  `wr_good` int NOT NULL DEFAULT '0',
  `wr_nogood` int NOT NULL DEFAULT '0',
  `mb_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_homepage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wr_file` tinyint NOT NULL DEFAULT '0',
  `wr_last` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_facebook_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_twitter_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_4` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_5` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_6` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_7` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_8` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_9` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_10` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`wr_id`),
  KEY `wr_seo_title` (`wr_seo_title`),
  KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
  KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_lego`
--

LOCK TABLES `g5_write_lego` WRITE;
/*!40000 ALTER TABLE `g5_write_lego` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_write_lego` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_linux`
--

DROP TABLE IF EXISTS `g5_write_linux`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_write_linux` (
  `wr_id` int NOT NULL AUTO_INCREMENT,
  `wr_num` int NOT NULL DEFAULT '0',
  `wr_reply` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_parent` int NOT NULL DEFAULT '0',
  `wr_is_comment` tinyint NOT NULL DEFAULT '0',
  `wr_comment` int NOT NULL DEFAULT '0',
  `wr_comment_reply` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ca_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_option` set('html1','html2','secret','mail') COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_seo_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link2` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link1_hit` int NOT NULL DEFAULT '0',
  `wr_link2_hit` int NOT NULL DEFAULT '0',
  `wr_hit` int NOT NULL DEFAULT '0',
  `wr_good` int NOT NULL DEFAULT '0',
  `wr_nogood` int NOT NULL DEFAULT '0',
  `mb_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_homepage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wr_file` tinyint NOT NULL DEFAULT '0',
  `wr_last` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_facebook_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_twitter_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_4` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_5` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_6` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_7` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_8` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_9` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_10` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`wr_id`),
  KEY `wr_seo_title` (`wr_seo_title`),
  KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
  KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_linux`
--

LOCK TABLES `g5_write_linux` WRITE;
/*!40000 ALTER TABLE `g5_write_linux` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_write_linux` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_lol`
--

DROP TABLE IF EXISTS `g5_write_lol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_write_lol` (
  `wr_id` int NOT NULL AUTO_INCREMENT,
  `wr_num` int NOT NULL DEFAULT '0',
  `wr_reply` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_parent` int NOT NULL DEFAULT '0',
  `wr_is_comment` tinyint NOT NULL DEFAULT '0',
  `wr_comment` int NOT NULL DEFAULT '0',
  `wr_comment_reply` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ca_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_option` set('html1','html2','secret','mail') COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_seo_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link2` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link1_hit` int NOT NULL DEFAULT '0',
  `wr_link2_hit` int NOT NULL DEFAULT '0',
  `wr_hit` int NOT NULL DEFAULT '0',
  `wr_good` int NOT NULL DEFAULT '0',
  `wr_nogood` int NOT NULL DEFAULT '0',
  `mb_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_homepage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wr_file` tinyint NOT NULL DEFAULT '0',
  `wr_last` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_facebook_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_twitter_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_4` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_5` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_6` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_7` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_8` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_9` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_10` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`wr_id`),
  KEY `wr_seo_title` (`wr_seo_title`),
  KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
  KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_lol`
--

LOCK TABLES `g5_write_lol` WRITE;
/*!40000 ALTER TABLE `g5_write_lol` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_write_lol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_macmoang`
--

DROP TABLE IF EXISTS `g5_write_macmoang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_write_macmoang` (
  `wr_id` int NOT NULL AUTO_INCREMENT,
  `wr_num` int NOT NULL DEFAULT '0',
  `wr_reply` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_parent` int NOT NULL DEFAULT '0',
  `wr_is_comment` tinyint NOT NULL DEFAULT '0',
  `wr_comment` int NOT NULL DEFAULT '0',
  `wr_comment_reply` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ca_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_option` set('html1','html2','secret','mail') COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_seo_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link2` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link1_hit` int NOT NULL DEFAULT '0',
  `wr_link2_hit` int NOT NULL DEFAULT '0',
  `wr_hit` int NOT NULL DEFAULT '0',
  `wr_good` int NOT NULL DEFAULT '0',
  `wr_nogood` int NOT NULL DEFAULT '0',
  `mb_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_homepage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wr_file` tinyint NOT NULL DEFAULT '0',
  `wr_last` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_facebook_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_twitter_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_4` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_5` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_6` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_7` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_8` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_9` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_10` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`wr_id`),
  KEY `wr_seo_title` (`wr_seo_title`),
  KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
  KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_macmoang`
--

LOCK TABLES `g5_write_macmoang` WRITE;
/*!40000 ALTER TABLE `g5_write_macmoang` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_write_macmoang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_military`
--

DROP TABLE IF EXISTS `g5_write_military`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_write_military` (
  `wr_id` int NOT NULL AUTO_INCREMENT,
  `wr_num` int NOT NULL DEFAULT '0',
  `wr_reply` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_parent` int NOT NULL DEFAULT '0',
  `wr_is_comment` tinyint NOT NULL DEFAULT '0',
  `wr_comment` int NOT NULL DEFAULT '0',
  `wr_comment_reply` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ca_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_option` set('html1','html2','secret','mail') COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_seo_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link2` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link1_hit` int NOT NULL DEFAULT '0',
  `wr_link2_hit` int NOT NULL DEFAULT '0',
  `wr_hit` int NOT NULL DEFAULT '0',
  `wr_good` int NOT NULL DEFAULT '0',
  `wr_nogood` int NOT NULL DEFAULT '0',
  `mb_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_homepage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wr_file` tinyint NOT NULL DEFAULT '0',
  `wr_last` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_facebook_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_twitter_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_4` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_5` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_6` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_7` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_8` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_9` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_10` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`wr_id`),
  KEY `wr_seo_title` (`wr_seo_title`),
  KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
  KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_military`
--

LOCK TABLES `g5_write_military` WRITE;
/*!40000 ALTER TABLE `g5_write_military` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_write_military` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_nas`
--

DROP TABLE IF EXISTS `g5_write_nas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_write_nas` (
  `wr_id` int NOT NULL AUTO_INCREMENT,
  `wr_num` int NOT NULL DEFAULT '0',
  `wr_reply` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_parent` int NOT NULL DEFAULT '0',
  `wr_is_comment` tinyint NOT NULL DEFAULT '0',
  `wr_comment` int NOT NULL DEFAULT '0',
  `wr_comment_reply` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ca_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_option` set('html1','html2','secret','mail') COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_seo_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link2` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link1_hit` int NOT NULL DEFAULT '0',
  `wr_link2_hit` int NOT NULL DEFAULT '0',
  `wr_hit` int NOT NULL DEFAULT '0',
  `wr_good` int NOT NULL DEFAULT '0',
  `wr_nogood` int NOT NULL DEFAULT '0',
  `mb_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_homepage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wr_file` tinyint NOT NULL DEFAULT '0',
  `wr_last` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_facebook_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_twitter_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_4` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_5` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_6` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_7` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_8` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_9` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_10` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`wr_id`),
  KEY `wr_seo_title` (`wr_seo_title`),
  KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
  KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_nas`
--

LOCK TABLES `g5_write_nas` WRITE;
/*!40000 ALTER TABLE `g5_write_nas` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_write_nas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_new`
--

DROP TABLE IF EXISTS `g5_write_new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_write_new` (
  `wr_id` int NOT NULL AUTO_INCREMENT,
  `wr_num` int NOT NULL DEFAULT '0',
  `wr_reply` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_parent` int NOT NULL DEFAULT '0',
  `wr_is_comment` tinyint NOT NULL DEFAULT '0',
  `wr_comment` int NOT NULL DEFAULT '0',
  `wr_comment_reply` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ca_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_option` set('html1','html2','secret','mail') COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_seo_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `wr_link1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link2` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link1_hit` int NOT NULL DEFAULT '0',
  `wr_link2_hit` int NOT NULL DEFAULT '0',
  `wr_hit` int NOT NULL DEFAULT '0',
  `wr_good` int NOT NULL DEFAULT '0',
  `wr_nogood` int NOT NULL DEFAULT '0',
  `mb_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_homepage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wr_file` tinyint NOT NULL DEFAULT '0',
  `wr_last` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_facebook_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_twitter_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_4` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_5` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_6` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_7` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_8` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_9` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_10` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`wr_id`),
  KEY `wr_seo_title` (`wr_seo_title`),
  KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
  KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_new`
--

LOCK TABLES `g5_write_new` WRITE;
/*!40000 ALTER TABLE `g5_write_new` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_write_new` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_notice`
--

DROP TABLE IF EXISTS `g5_write_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_write_notice` (
  `wr_id` int NOT NULL AUTO_INCREMENT,
  `wr_num` int NOT NULL DEFAULT '0',
  `wr_reply` varchar(10) NOT NULL,
  `wr_parent` int NOT NULL DEFAULT '0',
  `wr_is_comment` tinyint NOT NULL DEFAULT '0',
  `wr_comment` int NOT NULL DEFAULT '0',
  `wr_comment_reply` varchar(5) NOT NULL,
  `ca_name` varchar(255) NOT NULL,
  `wr_option` set('html1','html2','secret','mail') NOT NULL,
  `wr_subject` varchar(255) NOT NULL,
  `wr_content` text NOT NULL,
  `wr_seo_title` varchar(255) NOT NULL DEFAULT '',
  `wr_link1` text NOT NULL,
  `wr_link2` text NOT NULL,
  `wr_link1_hit` int NOT NULL DEFAULT '0',
  `wr_link2_hit` int NOT NULL DEFAULT '0',
  `wr_hit` int NOT NULL DEFAULT '0',
  `wr_good` int NOT NULL DEFAULT '0',
  `wr_nogood` int NOT NULL DEFAULT '0',
  `mb_id` varchar(20) NOT NULL,
  `wr_password` varchar(255) NOT NULL,
  `wr_name` varchar(255) NOT NULL,
  `wr_email` varchar(255) NOT NULL,
  `wr_homepage` varchar(255) NOT NULL,
  `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wr_file` tinyint NOT NULL DEFAULT '0',
  `wr_last` varchar(19) NOT NULL,
  `wr_ip` varchar(255) NOT NULL,
  `wr_facebook_user` varchar(255) NOT NULL,
  `wr_twitter_user` varchar(255) NOT NULL,
  `wr_1` varchar(255) NOT NULL,
  `wr_2` varchar(255) NOT NULL,
  `wr_3` varchar(255) NOT NULL,
  `wr_4` varchar(255) NOT NULL,
  `wr_5` varchar(255) NOT NULL,
  `wr_6` varchar(255) NOT NULL,
  `wr_7` varchar(255) NOT NULL,
  `wr_8` varchar(255) NOT NULL,
  `wr_9` varchar(255) NOT NULL,
  `wr_10` varchar(255) NOT NULL,
  PRIMARY KEY (`wr_id`),
  KEY `wr_seo_title` (`wr_seo_title`),
  KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
  KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_notice`
--

LOCK TABLES `g5_write_notice` WRITE;
/*!40000 ALTER TABLE `g5_write_notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_write_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_ott`
--

DROP TABLE IF EXISTS `g5_write_ott`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_write_ott` (
  `wr_id` int NOT NULL AUTO_INCREMENT,
  `wr_num` int NOT NULL DEFAULT '0',
  `wr_reply` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_parent` int NOT NULL DEFAULT '0',
  `wr_is_comment` tinyint NOT NULL DEFAULT '0',
  `wr_comment` int NOT NULL DEFAULT '0',
  `wr_comment_reply` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ca_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_option` set('html1','html2','secret','mail') COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_seo_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link2` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link1_hit` int NOT NULL DEFAULT '0',
  `wr_link2_hit` int NOT NULL DEFAULT '0',
  `wr_hit` int NOT NULL DEFAULT '0',
  `wr_good` int NOT NULL DEFAULT '0',
  `wr_nogood` int NOT NULL DEFAULT '0',
  `mb_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_homepage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wr_file` tinyint NOT NULL DEFAULT '0',
  `wr_last` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_facebook_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_twitter_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_4` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_5` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_6` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_7` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_8` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_9` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_10` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`wr_id`),
  KEY `wr_seo_title` (`wr_seo_title`),
  KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
  KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_ott`
--

LOCK TABLES `g5_write_ott` WRITE;
/*!40000 ALTER TABLE `g5_write_ott` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_write_ott` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_overseas`
--

DROP TABLE IF EXISTS `g5_write_overseas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_write_overseas` (
  `wr_id` int NOT NULL AUTO_INCREMENT,
  `wr_num` int NOT NULL DEFAULT '0',
  `wr_reply` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_parent` int NOT NULL DEFAULT '0',
  `wr_is_comment` tinyint NOT NULL DEFAULT '0',
  `wr_comment` int NOT NULL DEFAULT '0',
  `wr_comment_reply` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ca_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_option` set('html1','html2','secret','mail') COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_seo_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link2` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link1_hit` int NOT NULL DEFAULT '0',
  `wr_link2_hit` int NOT NULL DEFAULT '0',
  `wr_hit` int NOT NULL DEFAULT '0',
  `wr_good` int NOT NULL DEFAULT '0',
  `wr_nogood` int NOT NULL DEFAULT '0',
  `mb_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_homepage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wr_file` tinyint NOT NULL DEFAULT '0',
  `wr_last` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_facebook_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_twitter_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_4` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_5` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_6` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_7` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_8` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_9` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_10` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`wr_id`),
  KEY `wr_seo_title` (`wr_seo_title`),
  KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
  KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_overseas`
--

LOCK TABLES `g5_write_overseas` WRITE;
/*!40000 ALTER TABLE `g5_write_overseas` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_write_overseas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_promotion`
--

DROP TABLE IF EXISTS `g5_write_promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_write_promotion` (
  `wr_id` int NOT NULL AUTO_INCREMENT,
  `wr_num` int NOT NULL DEFAULT '0',
  `wr_reply` varchar(10) NOT NULL,
  `wr_parent` int NOT NULL DEFAULT '0',
  `wr_is_comment` tinyint NOT NULL DEFAULT '0',
  `wr_comment` int NOT NULL DEFAULT '0',
  `wr_comment_reply` varchar(5) NOT NULL,
  `ca_name` varchar(255) NOT NULL,
  `wr_option` set('html1','html2','secret','mail') NOT NULL,
  `wr_subject` varchar(255) NOT NULL,
  `wr_content` text NOT NULL,
  `wr_seo_title` varchar(255) NOT NULL,
  `wr_link1` text NOT NULL,
  `wr_link2` text NOT NULL,
  `wr_link1_hit` int NOT NULL DEFAULT '0',
  `wr_link2_hit` int NOT NULL DEFAULT '0',
  `wr_hit` int NOT NULL DEFAULT '0',
  `wr_good` int NOT NULL DEFAULT '0',
  `wr_nogood` int NOT NULL DEFAULT '0',
  `mb_id` varchar(20) NOT NULL,
  `wr_password` varchar(255) NOT NULL,
  `wr_name` varchar(255) NOT NULL,
  `wr_email` varchar(255) NOT NULL,
  `wr_homepage` varchar(255) NOT NULL,
  `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wr_file` tinyint NOT NULL DEFAULT '0',
  `wr_last` varchar(19) NOT NULL,
  `wr_ip` varchar(255) NOT NULL,
  `wr_facebook_user` varchar(255) NOT NULL,
  `wr_twitter_user` varchar(255) NOT NULL,
  `wr_1` varchar(255) NOT NULL,
  `wr_2` varchar(255) NOT NULL,
  `wr_3` varchar(255) NOT NULL,
  `wr_4` varchar(255) NOT NULL,
  `wr_5` varchar(255) NOT NULL,
  `wr_6` varchar(255) NOT NULL,
  `wr_7` varchar(255) NOT NULL,
  `wr_8` varchar(255) NOT NULL,
  `wr_9` varchar(255) NOT NULL,
  `wr_10` varchar(255) NOT NULL,
  PRIMARY KEY (`wr_id`),
  KEY `wr_seo_title` (`wr_seo_title`),
  KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
  KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_promotion`
--

LOCK TABLES `g5_write_promotion` WRITE;
/*!40000 ALTER TABLE `g5_write_promotion` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_write_promotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_qa`
--

DROP TABLE IF EXISTS `g5_write_qa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_write_qa` (
  `wr_id` int NOT NULL AUTO_INCREMENT,
  `wr_num` int NOT NULL DEFAULT '0',
  `wr_reply` varchar(10) NOT NULL,
  `wr_parent` int NOT NULL DEFAULT '0',
  `wr_is_comment` tinyint NOT NULL DEFAULT '0',
  `wr_comment` int NOT NULL DEFAULT '0',
  `wr_comment_reply` varchar(5) NOT NULL,
  `ca_name` varchar(255) NOT NULL,
  `wr_option` set('html1','html2','secret','mail') NOT NULL,
  `wr_subject` varchar(255) NOT NULL,
  `wr_content` text NOT NULL,
  `wr_seo_title` varchar(255) NOT NULL DEFAULT '',
  `wr_link1` text NOT NULL,
  `wr_link2` text NOT NULL,
  `wr_link1_hit` int NOT NULL DEFAULT '0',
  `wr_link2_hit` int NOT NULL DEFAULT '0',
  `wr_hit` int NOT NULL DEFAULT '0',
  `wr_good` int NOT NULL DEFAULT '0',
  `wr_nogood` int NOT NULL DEFAULT '0',
  `mb_id` varchar(20) NOT NULL,
  `wr_password` varchar(255) NOT NULL,
  `wr_name` varchar(255) NOT NULL,
  `wr_email` varchar(255) NOT NULL,
  `wr_homepage` varchar(255) NOT NULL,
  `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wr_file` tinyint NOT NULL DEFAULT '0',
  `wr_last` varchar(19) NOT NULL,
  `wr_ip` varchar(255) NOT NULL,
  `wr_facebook_user` varchar(255) NOT NULL,
  `wr_twitter_user` varchar(255) NOT NULL,
  `wr_1` varchar(255) NOT NULL,
  `wr_2` varchar(255) NOT NULL,
  `wr_3` varchar(255) NOT NULL,
  `wr_4` varchar(255) NOT NULL,
  `wr_5` varchar(255) NOT NULL,
  `wr_6` varchar(255) NOT NULL,
  `wr_7` varchar(255) NOT NULL,
  `wr_8` varchar(255) NOT NULL,
  `wr_9` varchar(255) NOT NULL,
  `wr_10` varchar(255) NOT NULL,
  PRIMARY KEY (`wr_id`),
  KEY `wr_seo_title` (`wr_seo_title`),
  KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
  KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1618 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_qa`
--

LOCK TABLES `g5_write_qa` WRITE;
/*!40000 ALTER TABLE `g5_write_qa` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_write_qa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_running`
--

DROP TABLE IF EXISTS `g5_write_running`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_write_running` (
  `wr_id` int NOT NULL AUTO_INCREMENT,
  `wr_num` int NOT NULL DEFAULT '0',
  `wr_reply` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_parent` int NOT NULL DEFAULT '0',
  `wr_is_comment` tinyint NOT NULL DEFAULT '0',
  `wr_comment` int NOT NULL DEFAULT '0',
  `wr_comment_reply` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ca_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_option` set('html1','html2','secret','mail') COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_seo_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link2` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link1_hit` int NOT NULL DEFAULT '0',
  `wr_link2_hit` int NOT NULL DEFAULT '0',
  `wr_hit` int NOT NULL DEFAULT '0',
  `wr_good` int NOT NULL DEFAULT '0',
  `wr_nogood` int NOT NULL DEFAULT '0',
  `mb_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_homepage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wr_file` tinyint NOT NULL DEFAULT '0',
  `wr_last` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_facebook_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_twitter_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_4` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_5` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_6` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_7` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_8` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_9` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_10` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`wr_id`),
  KEY `wr_seo_title` (`wr_seo_title`),
  KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
  KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_running`
--

LOCK TABLES `g5_write_running` WRITE;
/*!40000 ALTER TABLE `g5_write_running` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_write_running` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_see`
--

DROP TABLE IF EXISTS `g5_write_see`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_write_see` (
  `wr_id` int NOT NULL AUTO_INCREMENT,
  `wr_num` int NOT NULL DEFAULT '0',
  `wr_reply` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_parent` int NOT NULL DEFAULT '0',
  `wr_is_comment` tinyint NOT NULL DEFAULT '0',
  `wr_comment` int NOT NULL DEFAULT '0',
  `wr_comment_reply` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ca_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_option` set('html1','html2','secret','mail') COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_seo_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link2` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link1_hit` int NOT NULL DEFAULT '0',
  `wr_link2_hit` int NOT NULL DEFAULT '0',
  `wr_hit` int NOT NULL DEFAULT '0',
  `wr_good` int NOT NULL DEFAULT '0',
  `wr_nogood` int NOT NULL DEFAULT '0',
  `mb_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_homepage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wr_file` tinyint NOT NULL DEFAULT '0',
  `wr_last` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_facebook_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_twitter_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_4` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_5` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_6` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_7` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_8` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_9` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_10` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`wr_id`),
  KEY `wr_seo_title` (`wr_seo_title`),
  KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
  KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_see`
--

LOCK TABLES `g5_write_see` WRITE;
/*!40000 ALTER TABLE `g5_write_see` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_write_see` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_seniorcenter`
--

DROP TABLE IF EXISTS `g5_write_seniorcenter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_write_seniorcenter` (
  `wr_id` int NOT NULL AUTO_INCREMENT,
  `wr_num` int NOT NULL DEFAULT '0',
  `wr_reply` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_parent` int NOT NULL DEFAULT '0',
  `wr_is_comment` tinyint NOT NULL DEFAULT '0',
  `wr_comment` int NOT NULL DEFAULT '0',
  `wr_comment_reply` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ca_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_option` set('html1','html2','secret','mail') COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_seo_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link2` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link1_hit` int NOT NULL DEFAULT '0',
  `wr_link2_hit` int NOT NULL DEFAULT '0',
  `wr_hit` int NOT NULL DEFAULT '0',
  `wr_good` int NOT NULL DEFAULT '0',
  `wr_nogood` int NOT NULL DEFAULT '0',
  `mb_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_homepage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wr_file` tinyint NOT NULL DEFAULT '0',
  `wr_last` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_facebook_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_twitter_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_4` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_5` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_6` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_7` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_8` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_9` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_10` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`wr_id`),
  KEY `wr_seo_title` (`wr_seo_title`),
  KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
  KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_seniorcenter`
--

LOCK TABLES `g5_write_seniorcenter` WRITE;
/*!40000 ALTER TABLE `g5_write_seniorcenter` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_write_seniorcenter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_vr`
--

DROP TABLE IF EXISTS `g5_write_vr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_write_vr` (
  `wr_id` int NOT NULL AUTO_INCREMENT,
  `wr_num` int NOT NULL DEFAULT '0',
  `wr_reply` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_parent` int NOT NULL DEFAULT '0',
  `wr_is_comment` tinyint NOT NULL DEFAULT '0',
  `wr_comment` int NOT NULL DEFAULT '0',
  `wr_comment_reply` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ca_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_option` set('html1','html2','secret','mail') COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_seo_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link2` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link1_hit` int NOT NULL DEFAULT '0',
  `wr_link2_hit` int NOT NULL DEFAULT '0',
  `wr_hit` int NOT NULL DEFAULT '0',
  `wr_good` int NOT NULL DEFAULT '0',
  `wr_nogood` int NOT NULL DEFAULT '0',
  `mb_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_homepage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wr_file` tinyint NOT NULL DEFAULT '0',
  `wr_last` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_facebook_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_twitter_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_4` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_5` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_6` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_7` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_8` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_9` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_10` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`wr_id`),
  KEY `wr_seo_title` (`wr_seo_title`),
  KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
  KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_vr`
--

LOCK TABLES `g5_write_vr` WRITE;
/*!40000 ALTER TABLE `g5_write_vr` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_write_vr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_youtube`
--

DROP TABLE IF EXISTS `g5_write_youtube`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g5_write_youtube` (
  `wr_id` int NOT NULL AUTO_INCREMENT,
  `wr_num` int NOT NULL DEFAULT '0',
  `wr_reply` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_parent` int NOT NULL DEFAULT '0',
  `wr_is_comment` tinyint NOT NULL DEFAULT '0',
  `wr_comment` int NOT NULL DEFAULT '0',
  `wr_comment_reply` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ca_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_option` set('html1','html2','secret','mail') COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_seo_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link2` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_link1_hit` int NOT NULL DEFAULT '0',
  `wr_link2_hit` int NOT NULL DEFAULT '0',
  `wr_hit` int NOT NULL DEFAULT '0',
  `wr_good` int NOT NULL DEFAULT '0',
  `wr_nogood` int NOT NULL DEFAULT '0',
  `mb_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_homepage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wr_file` tinyint NOT NULL DEFAULT '0',
  `wr_last` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_facebook_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_twitter_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_4` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_5` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_6` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_7` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_8` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_9` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wr_10` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`wr_id`),
  KEY `wr_seo_title` (`wr_seo_title`),
  KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
  KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_youtube`
--

LOCK TABLES `g5_write_youtube` WRITE;
/*!40000 ALTER TABLE `g5_write_youtube` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_write_youtube` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wgb_mention`
--

DROP TABLE IF EXISTS `wgb_mention`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wgb_mention` (
  `id` int NOT NULL AUTO_INCREMENT,
  `from_mb_id` varchar(20) NOT NULL,
  `from_name` varchar(255) NOT NULL,
  `to_mb_id` varchar(20) NOT NULL,
  `bo_table` varchar(20) NOT NULL,
  `wr_id` int NOT NULL,
  `comment_id` int DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `checked` tinyint DEFAULT '0',
  `reg_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_mention` (`from_mb_id`,`to_mb_id`,`bo_table`,`wr_id`,`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wgb_mention`
--

LOCK TABLES `wgb_mention` WRITE;
/*!40000 ALTER TABLE `wgb_mention` DISABLE KEYS */;
/*!40000 ALTER TABLE `wgb_mention` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-05  6:58:58
