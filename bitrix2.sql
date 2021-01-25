-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               10.3.22-MariaDB - mariadb.org binary distribution
-- Операционная система:         Win64
-- HeidiSQL Версия:              11.0.0.5958
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Дамп структуры базы данных bitrix2
DROP DATABASE IF EXISTS `bitrix2`;
CREATE DATABASE IF NOT EXISTS `bitrix2` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `bitrix2`;

-- Дамп структуры для таблица bitrix2.b_admin_notify
DROP TABLE IF EXISTS `b_admin_notify`;
CREATE TABLE IF NOT EXISTS `b_admin_notify` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAG` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `ENABLE_CLOSE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `PUBLIC_SECTION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `NOTIFY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'M',
  PRIMARY KEY (`ID`),
  KEY `IX_AD_TAG` (`TAG`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_admin_notify: ~0 rows (приблизительно)
DELETE FROM `b_admin_notify`;
/*!40000 ALTER TABLE `b_admin_notify` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_admin_notify` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_admin_notify_lang
DROP TABLE IF EXISTS `b_admin_notify_lang`;
CREATE TABLE IF NOT EXISTS `b_admin_notify_lang` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `NOTIFY_ID` int(18) NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_ADM_NTFY_LANG` (`NOTIFY_ID`,`LID`),
  KEY `IX_ADM_NTFY_LID` (`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_admin_notify_lang: ~0 rows (приблизительно)
DELETE FROM `b_admin_notify_lang`;
/*!40000 ALTER TABLE `b_admin_notify_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_admin_notify_lang` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_agent
DROP TABLE IF EXISTS `b_agent`;
CREATE TABLE IF NOT EXISTS `b_agent` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(18) NOT NULL DEFAULT 100,
  `NAME` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `LAST_EXEC` datetime DEFAULT NULL,
  `NEXT_EXEC` datetime NOT NULL,
  `DATE_CHECK` datetime DEFAULT NULL,
  `AGENT_INTERVAL` int(18) DEFAULT 86400,
  `IS_PERIOD` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `USER_ID` int(18) DEFAULT NULL,
  `RUNNING` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `RETRY_COUNT` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_act_next_exec` (`ACTIVE`,`NEXT_EXEC`),
  KEY `ix_agent_user_id` (`USER_ID`),
  KEY `ix_agent_name` (`NAME`(100))
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_agent: ~33 rows (приблизительно)
DELETE FROM `b_agent`;
/*!40000 ALTER TABLE `b_agent` DISABLE KEYS */;
INSERT INTO `b_agent` (`ID`, `MODULE_ID`, `SORT`, `NAME`, `ACTIVE`, `LAST_EXEC`, `NEXT_EXEC`, `DATE_CHECK`, `AGENT_INTERVAL`, `IS_PERIOD`, `USER_ID`, `RUNNING`, `RETRY_COUNT`) VALUES
	(1, 'main', 100, '\\Bitrix\\Main\\Analytics\\CounterDataTable::submitData();', 'Y', '2021-01-25 14:58:00', '2021-01-25 14:59:00', NULL, 60, 'N', NULL, 'N', 0),
	(2, 'main', 100, 'CCaptchaAgent::DeleteOldCaptcha(3600);', 'Y', '2021-01-25 14:58:00', '2021-01-25 15:58:00', NULL, 3600, 'N', NULL, 'N', 0),
	(3, 'main', 100, 'CSiteCheckerTest::CommonTest();', 'Y', '2021-01-25 12:37:31', '2021-01-26 12:37:31', NULL, 86400, 'N', NULL, 'N', 0),
	(4, 'main', 100, 'CEvent::CleanUpAgent();', 'Y', '2021-01-25 12:37:31', '2021-01-26 12:37:31', NULL, 86400, 'N', NULL, 'N', 0),
	(5, 'main', 100, 'CUser::CleanUpHitAuthAgent();', 'Y', '2021-01-25 12:37:31', '2021-01-26 12:37:31', NULL, 86400, 'N', NULL, 'N', 0),
	(6, 'main', 100, 'CUndo::CleanUpOld();', 'Y', '2021-01-25 12:37:31', '2021-01-26 12:37:31', NULL, 86400, 'N', NULL, 'N', 0),
	(7, 'main', 100, 'CUserCounter::DeleteOld();', 'Y', '2021-01-25 12:37:31', '2021-01-26 12:37:31', NULL, 86400, 'N', NULL, 'N', 0),
	(8, 'main', 100, '\\Bitrix\\Main\\UI\\Viewer\\FilePreviewTable::deleteOldAgent(22, 20);', 'Y', '2021-01-25 12:37:31', '2021-01-26 12:37:31', NULL, 86400, 'N', NULL, 'N', 0),
	(9, 'main', 100, 'CUser::AuthActionsCleanUpAgent();', 'Y', '2021-01-25 12:37:31', '2021-01-26 12:37:31', NULL, 86400, 'N', NULL, 'N', 0),
	(10, 'main', 100, 'CUser::CleanUpAgent();', 'Y', '2021-01-25 12:37:31', '2021-01-26 12:37:31', NULL, 86400, 'N', NULL, 'N', 0),
	(11, 'main', 100, 'CUser::DeactivateAgent();', 'Y', '2021-01-25 12:37:31', '2021-01-26 12:37:31', NULL, 86400, 'N', NULL, 'N', 0),
	(12, 'main', 100, 'CEventLog::CleanUpAgent();', 'Y', '2021-01-25 12:37:31', '2021-01-26 12:37:31', NULL, 86400, 'N', NULL, 'N', 0),
	(13, 'clouds', 100, 'CCloudStorage::CleanUp();', 'Y', '2021-01-24 17:52:07', '2021-01-25 17:52:07', NULL, 86400, 'N', NULL, 'N', 0),
	(14, 'forum', 100, 'CForumStat::CleanUp();', 'Y', '2021-01-24 17:52:07', '2021-01-25 17:52:07', NULL, 86400, 'N', NULL, 'N', 0),
	(15, 'forum', 100, 'CForumFiles::CleanUp();', 'Y', '2021-01-24 17:52:07', '2021-01-25 17:52:07', NULL, 86400, 'N', NULL, 'N', 0),
	(16, 'landing', 100, 'Bitrix\\Landing\\Agent::clearRecycle();', 'Y', '2021-01-25 13:29:36', '2021-01-25 15:29:36', NULL, 7200, 'N', NULL, 'N', 0),
	(17, 'landing', 100, 'Bitrix\\Landing\\Agent::clearFiles(30);', 'Y', '2021-01-25 14:58:00', '2021-01-25 15:58:00', NULL, 3600, 'N', NULL, 'N', 0),
	(18, 'landing', 100, 'Bitrix\\Landing\\Agent::sendRestStatistic();', 'Y', '2021-01-24 17:52:07', '2021-01-25 17:52:07', NULL, 86400, 'N', NULL, 'N', 0),
	(19, 'messageservice', 100, '\\Bitrix\\MessageService\\Queue::cleanUpAgent();', 'Y', '2021-01-25 11:27:45', '2021-01-26 00:00:00', NULL, 86400, 'Y', NULL, 'N', 0),
	(20, 'rest', 100, 'Bitrix\\Rest\\Marketplace\\Client::getNumUpdates();', 'Y', '2021-01-24 17:52:07', '2021-01-25 17:52:07', NULL, 86400, 'N', NULL, 'N', 0),
	(21, 'rest', 100, '\\Bitrix\\Rest\\EventOfflineTable::cleanProcessAgent();', 'Y', '2021-01-24 17:52:07', '2021-01-25 17:52:07', NULL, 86400, 'N', NULL, 'N', 0),
	(22, 'rest', 100, '\\Bitrix\\Rest\\LogTable::cleanUpAgent();', 'Y', '2021-01-24 17:52:07', '2021-01-25 17:52:07', NULL, 86400, 'N', NULL, 'N', 0),
	(23, 'rest', 100, '\\Bitrix\\Rest\\Configuration\\Helper::sendStatisticAgent();', 'Y', '2021-01-24 17:52:07', '2021-01-25 17:52:07', NULL, 86400, 'N', NULL, 'N', 0),
	(24, 'rest', 100, '\\Bitrix\\Rest\\UsageStatTable::sendAgent();', 'Y', '2021-01-25 14:58:00', '2021-01-25 15:58:00', NULL, 3600, 'N', NULL, 'N', 0),
	(25, 'rest', 100, '\\Bitrix\\Rest\\UsageStatTable::cleanUpAgent();', 'Y', '2021-01-25 14:58:00', '2021-01-25 15:58:00', NULL, 3600, 'N', NULL, 'N', 0),
	(26, 'search', 10, 'CSearchSuggest::CleanUpAgent();', 'Y', '2021-01-24 17:52:07', '2021-01-25 17:52:07', NULL, 86400, 'N', NULL, 'N', 0),
	(27, 'search', 10, 'CSearchStatistic::CleanUpAgent();', 'Y', '2021-01-24 17:52:07', '2021-01-25 17:52:07', NULL, 86400, 'N', NULL, 'N', 0),
	(28, 'security', 100, 'CSecuritySession::CleanUpAgent();', 'Y', '2021-01-25 14:37:44', '2021-01-25 15:07:44', NULL, 1800, 'N', NULL, 'N', 0),
	(29, 'security', 100, 'CSecurityIPRule::CleanUpAgent();', 'Y', '2021-01-25 14:58:00', '2021-01-25 15:58:00', NULL, 3600, 'N', NULL, 'N', 0),
	(30, 'seo', 100, 'Bitrix\\Seo\\Engine\\YandexDirect::updateAgent();', 'Y', '2021-01-25 14:58:00', '2021-01-25 15:58:00', NULL, 3600, 'N', NULL, 'N', 0),
	(31, 'seo', 100, 'Bitrix\\Seo\\Adv\\LogTable::clean();', 'Y', '2021-01-24 17:52:07', '2021-01-25 17:52:07', NULL, 86400, 'N', NULL, 'N', 0),
	(32, 'seo', 100, 'Bitrix\\Seo\\Adv\\Auto::checkQuantityAgent();', 'Y', '2021-01-25 14:58:00', '2021-01-25 15:58:00', NULL, 3600, 'N', NULL, 'N', 0),
	(33, 'subscribe', 100, 'CSubscription::CleanUp();', 'Y', '2021-01-25 11:27:45', '2021-01-26 03:00:00', NULL, 86400, 'Y', NULL, 'N', 0);
/*!40000 ALTER TABLE `b_agent` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_app_password
DROP TABLE IF EXISTS `b_app_password`;
CREATE TABLE IF NOT EXISTS `b_app_password` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `APPLICATION_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PASSWORD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DIGEST_PASSWORD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `DATE_LOGIN` datetime DEFAULT NULL,
  `LAST_IP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SYSCOMMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_app_password_user` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_app_password: ~0 rows (приблизительно)
DELETE FROM `b_app_password`;
/*!40000 ALTER TABLE `b_app_password` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_app_password` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_b24connector_buttons
DROP TABLE IF EXISTS `b_b24connector_buttons`;
CREATE TABLE IF NOT EXISTS `b_b24connector_buttons` (
  `ID` int(11) NOT NULL,
  `APP_ID` int(11) NOT NULL,
  `ADD_DATE` datetime NOT NULL,
  `ADD_BY` int(11) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SCRIPT` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_b24connector_buttons: ~0 rows (приблизительно)
DELETE FROM `b_b24connector_buttons`;
/*!40000 ALTER TABLE `b_b24connector_buttons` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_b24connector_buttons` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_bitrixcloud_option
DROP TABLE IF EXISTS `b_bitrixcloud_option`;
CREATE TABLE IF NOT EXISTS `b_bitrixcloud_option` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(11) NOT NULL,
  `PARAM_KEY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PARAM_VALUE` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_bitrixcloud_option_1` (`NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_bitrixcloud_option: ~4 rows (приблизительно)
DELETE FROM `b_bitrixcloud_option`;
/*!40000 ALTER TABLE `b_bitrixcloud_option` DISABLE KEYS */;
INSERT INTO `b_bitrixcloud_option` (`ID`, `NAME`, `SORT`, `PARAM_KEY`, `PARAM_VALUE`) VALUES
	(1, 'backup_quota', 0, '0', '0'),
	(2, 'backup_total_size', 0, '0', '0'),
	(3, 'backup_last_backup_time', 0, '0', '1611310809'),
	(4, 'monitoring_expire_time', 0, '0', '1611557549');
/*!40000 ALTER TABLE `b_bitrixcloud_option` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_blog
DROP TABLE IF EXISTS `b_blog`;
CREATE TABLE IF NOT EXISTS `b_blog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_CREATE` datetime NOT NULL,
  `DATE_UPDATE` datetime NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `OWNER_ID` int(11) DEFAULT NULL,
  `SOCNET_GROUP_ID` int(11) DEFAULT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `REAL_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `ENABLE_COMMENTS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ENABLE_IMG_VERIF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ENABLE_RSS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `LAST_POST_ID` int(11) DEFAULT NULL,
  `LAST_POST_DATE` datetime DEFAULT NULL,
  `AUTO_GROUPS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL_NOTIFY` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_HTML` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SEARCH_INDEX` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `USE_SOCNET` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `EDITOR_USE_FONT` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `EDITOR_USE_LINK` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `EDITOR_USE_IMAGE` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `EDITOR_USE_VIDEO` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `EDITOR_USE_FORMAT` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_BLOG_4` (`URL`),
  KEY `IX_BLOG_BLOG_1` (`GROUP_ID`,`ACTIVE`),
  KEY `IX_BLOG_BLOG_2` (`OWNER_ID`),
  KEY `IX_BLOG_BLOG_5` (`LAST_POST_DATE`),
  KEY `IX_BLOG_BLOG_6` (`SOCNET_GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_blog: ~0 rows (приблизительно)
DELETE FROM `b_blog`;
/*!40000 ALTER TABLE `b_blog` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_blog_category
DROP TABLE IF EXISTS `b_blog_category`;
CREATE TABLE IF NOT EXISTS `b_blog_category` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BLOG_ID` int(11) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_CAT_1` (`BLOG_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_blog_category: ~0 rows (приблизительно)
DELETE FROM `b_blog_category`;
/*!40000 ALTER TABLE `b_blog_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_category` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_blog_comment
DROP TABLE IF EXISTS `b_blog_comment`;
CREATE TABLE IF NOT EXISTS `b_blog_comment` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BLOG_ID` int(11) NOT NULL,
  `POST_ID` int(11) NOT NULL,
  `PARENT_ID` int(11) DEFAULT NULL,
  `AUTHOR_ID` int(11) DEFAULT NULL,
  `ICON_ID` int(11) DEFAULT NULL,
  `AUTHOR_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTHOR_EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTHOR_IP` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTHOR_IP1` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_CREATE` datetime NOT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `POST_TEXT` text COLLATE utf8_unicode_ci NOT NULL,
  `PUBLISH_STATUS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'P',
  `HAS_PROPS` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SHARE_DEST` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_COMM_1` (`BLOG_ID`,`POST_ID`),
  KEY `IX_BLOG_COMM_2` (`AUTHOR_ID`),
  KEY `IX_BLOG_COMM_3` (`DATE_CREATE`,`AUTHOR_ID`),
  KEY `IX_BLOG_COMM_4` (`POST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_blog_comment: ~0 rows (приблизительно)
DELETE FROM `b_blog_comment`;
/*!40000 ALTER TABLE `b_blog_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_comment` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_blog_group
DROP TABLE IF EXISTS `b_blog_group`;
CREATE TABLE IF NOT EXISTS `b_blog_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_GROUP_1` (`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_blog_group: ~0 rows (приблизительно)
DELETE FROM `b_blog_group`;
/*!40000 ALTER TABLE `b_blog_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_group` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_blog_image
DROP TABLE IF EXISTS `b_blog_image`;
CREATE TABLE IF NOT EXISTS `b_blog_image` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FILE_ID` int(11) NOT NULL DEFAULT 0,
  `BLOG_ID` int(11) NOT NULL DEFAULT 0,
  `POST_ID` int(11) NOT NULL DEFAULT 0,
  `USER_ID` int(11) NOT NULL DEFAULT 0,
  `TIMESTAMP_X` datetime NOT NULL DEFAULT '1970-01-01 00:00:01',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IMAGE_SIZE` int(11) NOT NULL DEFAULT 0,
  `IS_COMMENT` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `COMMENT_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_IMAGE_1` (`POST_ID`,`BLOG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_blog_image: ~0 rows (приблизительно)
DELETE FROM `b_blog_image`;
/*!40000 ALTER TABLE `b_blog_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_image` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_blog_post
DROP TABLE IF EXISTS `b_blog_post`;
CREATE TABLE IF NOT EXISTS `b_blog_post` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `BLOG_ID` int(11) NOT NULL,
  `AUTHOR_ID` int(11) NOT NULL,
  `PREVIEW_TEXT` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREVIEW_TEXT_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `DETAIL_TEXT` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `DETAIL_TEXT_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `DATE_CREATE` datetime NOT NULL,
  `DATE_PUBLISH` datetime NOT NULL,
  `KEYWORDS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PUBLISH_STATUS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'P',
  `CATEGORY_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ATRIBUTE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ENABLE_TRACKBACK` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ENABLE_COMMENTS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ATTACH_IMG` int(11) DEFAULT NULL,
  `NUM_COMMENTS` int(11) NOT NULL DEFAULT 0,
  `NUM_COMMENTS_ALL` int(11) NOT NULL DEFAULT 0,
  `NUM_TRACKBACKS` int(11) NOT NULL DEFAULT 0,
  `VIEWS` int(11) DEFAULT NULL,
  `FAVORITE_SORT` int(11) DEFAULT NULL,
  `PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MICRO` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `HAS_IMAGES` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HAS_PROPS` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HAS_TAGS` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HAS_COMMENT_IMAGES` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HAS_SOCNET_ALL` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEO_TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEO_TAGS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEO_DESCRIPTION` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_POST_1` (`BLOG_ID`,`PUBLISH_STATUS`,`DATE_PUBLISH`),
  KEY `IX_BLOG_POST_2` (`BLOG_ID`,`DATE_PUBLISH`,`PUBLISH_STATUS`),
  KEY `IX_BLOG_POST_3` (`BLOG_ID`,`CATEGORY_ID`),
  KEY `IX_BLOG_POST_4` (`PUBLISH_STATUS`,`DATE_PUBLISH`),
  KEY `IX_BLOG_POST_5` (`DATE_PUBLISH`,`AUTHOR_ID`),
  KEY `IX_BLOG_POST_CODE` (`BLOG_ID`,`CODE`),
  KEY `IX_BLOG_POST_6` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_blog_post: ~0 rows (приблизительно)
DELETE FROM `b_blog_post`;
/*!40000 ALTER TABLE `b_blog_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_post` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_blog_post_category
DROP TABLE IF EXISTS `b_blog_post_category`;
CREATE TABLE IF NOT EXISTS `b_blog_post_category` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BLOG_ID` int(11) NOT NULL,
  `POST_ID` int(11) NOT NULL,
  `CATEGORY_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_POST_CATEGORY` (`POST_ID`,`CATEGORY_ID`),
  KEY `IX_BLOG_POST_CATEGORY_CAT_ID` (`CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_blog_post_category: ~0 rows (приблизительно)
DELETE FROM `b_blog_post_category`;
/*!40000 ALTER TABLE `b_blog_post_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_post_category` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_blog_post_param
DROP TABLE IF EXISTS `b_blog_post_param`;
CREATE TABLE IF NOT EXISTS `b_blog_post_param` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `POST_ID` int(11) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_PP_1` (`POST_ID`,`USER_ID`),
  KEY `IX_BLOG_PP_2` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_blog_post_param: ~0 rows (приблизительно)
DELETE FROM `b_blog_post_param`;
/*!40000 ALTER TABLE `b_blog_post_param` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_post_param` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_blog_site_path
DROP TABLE IF EXISTS `b_blog_site_path`;
CREATE TABLE IF NOT EXISTS `b_blog_site_path` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `PATH` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_SITE_PATH_2` (`SITE_ID`,`TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_blog_site_path: ~0 rows (приблизительно)
DELETE FROM `b_blog_site_path`;
/*!40000 ALTER TABLE `b_blog_site_path` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_site_path` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_blog_socnet
DROP TABLE IF EXISTS `b_blog_socnet`;
CREATE TABLE IF NOT EXISTS `b_blog_socnet` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BLOG_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_SOCNET` (`BLOG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_blog_socnet: ~0 rows (приблизительно)
DELETE FROM `b_blog_socnet`;
/*!40000 ALTER TABLE `b_blog_socnet` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_socnet` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_blog_socnet_rights
DROP TABLE IF EXISTS `b_blog_socnet_rights`;
CREATE TABLE IF NOT EXISTS `b_blog_socnet_rights` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `POST_ID` int(11) NOT NULL,
  `ENTITY_TYPE` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `ENTITY` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_SR_1` (`POST_ID`),
  KEY `IX_BLOG_SR_2` (`ENTITY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_blog_socnet_rights: ~0 rows (приблизительно)
DELETE FROM `b_blog_socnet_rights`;
/*!40000 ALTER TABLE `b_blog_socnet_rights` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_socnet_rights` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_blog_trackback
DROP TABLE IF EXISTS `b_blog_trackback`;
CREATE TABLE IF NOT EXISTS `b_blog_trackback` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PREVIEW_TEXT` text COLLATE utf8_unicode_ci NOT NULL,
  `BLOG_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `POST_DATE` datetime NOT NULL,
  `BLOG_ID` int(11) NOT NULL,
  `POST_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_TRBK_1` (`BLOG_ID`,`POST_ID`),
  KEY `IX_BLOG_TRBK_2` (`POST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_blog_trackback: ~0 rows (приблизительно)
DELETE FROM `b_blog_trackback`;
/*!40000 ALTER TABLE `b_blog_trackback` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_trackback` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_blog_user
DROP TABLE IF EXISTS `b_blog_user`;
CREATE TABLE IF NOT EXISTS `b_blog_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `ALIAS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `AVATAR` int(11) DEFAULT NULL,
  `INTERESTS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_VISIT` datetime DEFAULT NULL,
  `DATE_REG` datetime NOT NULL,
  `ALLOW_POST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_USER_1` (`USER_ID`),
  KEY `IX_BLOG_USER_2` (`ALIAS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_blog_user: ~0 rows (приблизительно)
DELETE FROM `b_blog_user`;
/*!40000 ALTER TABLE `b_blog_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_user` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_blog_user2blog
DROP TABLE IF EXISTS `b_blog_user2blog`;
CREATE TABLE IF NOT EXISTS `b_blog_user2blog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `BLOG_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_USER2GROUP_1` (`BLOG_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_blog_user2blog: ~0 rows (приблизительно)
DELETE FROM `b_blog_user2blog`;
/*!40000 ALTER TABLE `b_blog_user2blog` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_user2blog` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_blog_user2user_group
DROP TABLE IF EXISTS `b_blog_user2user_group`;
CREATE TABLE IF NOT EXISTS `b_blog_user2user_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `BLOG_ID` int(11) NOT NULL,
  `USER_GROUP_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_USER2GROUP_1` (`USER_ID`,`BLOG_ID`,`USER_GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_blog_user2user_group: ~0 rows (приблизительно)
DELETE FROM `b_blog_user2user_group`;
/*!40000 ALTER TABLE `b_blog_user2user_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_user2user_group` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_blog_user_group
DROP TABLE IF EXISTS `b_blog_user_group`;
CREATE TABLE IF NOT EXISTS `b_blog_user_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BLOG_ID` int(11) DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_USER_GROUP_1` (`BLOG_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_blog_user_group: ~2 rows (приблизительно)
DELETE FROM `b_blog_user_group`;
/*!40000 ALTER TABLE `b_blog_user_group` DISABLE KEYS */;
INSERT INTO `b_blog_user_group` (`ID`, `BLOG_ID`, `NAME`) VALUES
	(1, NULL, 'all'),
	(2, NULL, 'registered');
/*!40000 ALTER TABLE `b_blog_user_group` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_blog_user_group_perms
DROP TABLE IF EXISTS `b_blog_user_group_perms`;
CREATE TABLE IF NOT EXISTS `b_blog_user_group_perms` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BLOG_ID` int(11) NOT NULL,
  `USER_GROUP_ID` int(11) NOT NULL,
  `PERMS_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'P',
  `POST_ID` int(11) DEFAULT NULL,
  `PERMS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'D',
  `AUTOSET` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_UG_PERMS_1` (`BLOG_ID`,`USER_GROUP_ID`,`PERMS_TYPE`,`POST_ID`),
  KEY `IX_BLOG_UG_PERMS_2` (`USER_GROUP_ID`,`PERMS_TYPE`,`POST_ID`),
  KEY `IX_BLOG_UG_PERMS_3` (`POST_ID`,`USER_GROUP_ID`,`PERMS_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_blog_user_group_perms: ~0 rows (приблизительно)
DELETE FROM `b_blog_user_group_perms`;
/*!40000 ALTER TABLE `b_blog_user_group_perms` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_user_group_perms` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_cache_tag
DROP TABLE IF EXISTS `b_cache_tag`;
CREATE TABLE IF NOT EXISTS `b_cache_tag` (
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CACHE_SALT` char(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RELATIVE_PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAG` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `ix_b_cache_tag_0` (`SITE_ID`,`CACHE_SALT`,`RELATIVE_PATH`(50)),
  KEY `ix_b_cache_tag_1` (`TAG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_cache_tag: ~4 rows (приблизительно)
DELETE FROM `b_cache_tag`;
/*!40000 ALTER TABLE `b_cache_tag` DISABLE KEYS */;
INSERT INTO `b_cache_tag` (`SITE_ID`, `CACHE_SALT`, `RELATIVE_PATH`, `TAG`) VALUES
	(NULL, NULL, '0:1611554311', '**'),
	('s1', '/e25', '/s1/bitrix/news.list/e25', 'iblock_id_4'),
	('s1', '/e25', '/s1/bitrix/news.list/e25', 'iblock_id_5'),
	('s1', '/e25', '/s1/bitrix/news.list/e25', 'iblock_id_6');
/*!40000 ALTER TABLE `b_cache_tag` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_captcha
DROP TABLE IF EXISTS `b_captcha`;
CREATE TABLE IF NOT EXISTS `b_captcha` (
  `ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `IP` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` datetime NOT NULL,
  UNIQUE KEY `UX_B_CAPTCHA` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_captcha: ~0 rows (приблизительно)
DELETE FROM `b_captcha`;
/*!40000 ALTER TABLE `b_captcha` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_captcha` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_checklist
DROP TABLE IF EXISTS `b_checklist`;
CREATE TABLE IF NOT EXISTS `b_checklist` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_CREATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TESTER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMPANY_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PICTURE` int(11) DEFAULT NULL,
  `TOTAL` int(11) DEFAULT NULL,
  `SUCCESS` int(11) DEFAULT NULL,
  `FAILED` int(11) DEFAULT NULL,
  `PENDING` int(11) DEFAULT NULL,
  `SKIP` int(11) DEFAULT NULL,
  `STATE` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `REPORT_COMMENT` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `REPORT` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `EMAIL` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PHONE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SENDED_TO_BITRIX` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `HIDDEN` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_checklist: ~0 rows (приблизительно)
DELETE FROM `b_checklist`;
/*!40000 ALTER TABLE `b_checklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_checklist` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_clouds_copy_queue
DROP TABLE IF EXISTS `b_clouds_copy_queue`;
CREATE TABLE IF NOT EXISTS `b_clouds_copy_queue` (
  `ID` int(32) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL,
  `OP` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `SOURCE_BUCKET_ID` int(11) NOT NULL,
  `SOURCE_FILE_PATH` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `TARGET_BUCKET_ID` int(11) NOT NULL,
  `TARGET_FILE_PATH` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `FILE_SIZE` int(11) NOT NULL DEFAULT -1,
  `FILE_POS` int(11) NOT NULL DEFAULT 0,
  `FAIL_COUNTER` int(11) NOT NULL DEFAULT 0,
  `STATUS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ERROR_MESSAGE` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_clouds_copy_queue: ~0 rows (приблизительно)
DELETE FROM `b_clouds_copy_queue`;
/*!40000 ALTER TABLE `b_clouds_copy_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_clouds_copy_queue` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_clouds_delete_queue
DROP TABLE IF EXISTS `b_clouds_delete_queue`;
CREATE TABLE IF NOT EXISTS `b_clouds_delete_queue` (
  `ID` int(32) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL,
  `BUCKET_ID` int(11) NOT NULL,
  `FILE_PATH` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_clouds_delete_queue_1` (`BUCKET_ID`,`FILE_PATH`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_clouds_delete_queue: ~0 rows (приблизительно)
DELETE FROM `b_clouds_delete_queue`;
/*!40000 ALTER TABLE `b_clouds_delete_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_clouds_delete_queue` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_clouds_file_bucket
DROP TABLE IF EXISTS `b_clouds_file_bucket`;
CREATE TABLE IF NOT EXISTS `b_clouds_file_bucket` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `SORT` int(11) DEFAULT 500,
  `READ_ONLY` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `SERVICE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BUCKET` varchar(63) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LOCATION` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CNAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_COUNT` int(11) DEFAULT 0,
  `FILE_SIZE` double DEFAULT 0,
  `LAST_FILE_ID` int(11) DEFAULT NULL,
  `PREFIX` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_RULES` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `FAILOVER_ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `FAILOVER_BUCKET_ID` int(11) DEFAULT NULL,
  `FAILOVER_COPY` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `FAILOVER_DELETE` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `FAILOVER_DELETE_DELAY` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_clouds_file_bucket: ~0 rows (приблизительно)
DELETE FROM `b_clouds_file_bucket`;
/*!40000 ALTER TABLE `b_clouds_file_bucket` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_clouds_file_bucket` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_clouds_file_hash
DROP TABLE IF EXISTS `b_clouds_file_hash`;
CREATE TABLE IF NOT EXISTS `b_clouds_file_hash` (
  `BUCKET_ID` int(11) NOT NULL,
  `FILE_PATH` varchar(600) COLLATE utf8_unicode_ci NOT NULL,
  `FILE_SIZE` bigint(20) DEFAULT NULL,
  `FILE_MTIME` datetime DEFAULT NULL,
  `FILE_HASH` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`BUCKET_ID`,`FILE_PATH`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_clouds_file_hash: ~0 rows (приблизительно)
DELETE FROM `b_clouds_file_hash`;
/*!40000 ALTER TABLE `b_clouds_file_hash` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_clouds_file_hash` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_clouds_file_resize
DROP TABLE IF EXISTS `b_clouds_file_resize`;
CREATE TABLE IF NOT EXISTS `b_clouds_file_resize` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL,
  `ERROR_CODE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `FILE_ID` int(11) DEFAULT NULL,
  `PARAMS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `FROM_PATH` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TO_PATH` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_file_resize_ts` (`TIMESTAMP_X`),
  KEY `ix_b_file_resize_path` (`TO_PATH`(100)),
  KEY `ix_b_file_resize_file` (`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_clouds_file_resize: ~0 rows (приблизительно)
DELETE FROM `b_clouds_file_resize`;
/*!40000 ALTER TABLE `b_clouds_file_resize` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_clouds_file_resize` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_clouds_file_save
DROP TABLE IF EXISTS `b_clouds_file_save`;
CREATE TABLE IF NOT EXISTS `b_clouds_file_save` (
  `ID` int(32) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL,
  `BUCKET_ID` int(11) NOT NULL,
  `SUBDIR` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `EXTERNAL_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_SIZE` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_EXTERNAL_ID` (`EXTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_clouds_file_save: ~0 rows (приблизительно)
DELETE FROM `b_clouds_file_save`;
/*!40000 ALTER TABLE `b_clouds_file_save` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_clouds_file_save` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_clouds_file_upload
DROP TABLE IF EXISTS `b_clouds_file_upload`;
CREATE TABLE IF NOT EXISTS `b_clouds_file_upload` (
  `ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `FILE_PATH` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `FILE_SIZE` bigint(20) DEFAULT NULL,
  `TMP_FILE` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BUCKET_ID` int(11) NOT NULL,
  `PART_SIZE` int(11) NOT NULL,
  `PART_NO` int(11) NOT NULL,
  `PART_FAIL_COUNTER` int(11) NOT NULL,
  `NEXT_STEP` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_clouds_file_upload: ~0 rows (приблизительно)
DELETE FROM `b_clouds_file_upload`;
/*!40000 ALTER TABLE `b_clouds_file_upload` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_clouds_file_upload` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_component_params
DROP TABLE IF EXISTS `b_component_params`;
CREATE TABLE IF NOT EXISTS `b_component_params` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `COMPONENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TEMPLATE_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REAL_PATH` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SEF_MODE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SEF_FOLDER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `START_CHAR` int(11) NOT NULL,
  `END_CHAR` int(11) NOT NULL,
  `PARAMETERS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_comp_params_name` (`COMPONENT_NAME`),
  KEY `ix_comp_params_path` (`SITE_ID`,`REAL_PATH`),
  KEY `ix_comp_params_sname` (`SITE_ID`,`COMPONENT_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_component_params: ~6 rows (приблизительно)
DELETE FROM `b_component_params`;
/*!40000 ALTER TABLE `b_component_params` DISABLE KEYS */;
INSERT INTO `b_component_params` (`ID`, `SITE_ID`, `COMPONENT_NAME`, `TEMPLATE_NAME`, `REAL_PATH`, `SEF_MODE`, `SEF_FOLDER`, `START_CHAR`, `END_CHAR`, `PARAMETERS`) VALUES
	(29, 's1', 'bitrix:menu', 'main_menu', '/bitrix/templates/main/header.php', 'N', NULL, 2444, 3233, 'a:12:{s:18:"ALLOW_MULTI_SELECT";s:1:"N";s:15:"CHILD_MENU_TYPE";s:4:"left";s:5:"DELAY";s:1:"N";s:9:"MAX_LEVEL";s:1:"1";s:19:"MENU_CACHE_GET_VARS";s:0:"";s:15:"MENU_CACHE_TIME";s:4:"3600";s:15:"MENU_CACHE_TYPE";s:1:"N";s:21:"MENU_CACHE_USE_GROUPS";s:1:"Y";s:14:"ROOT_MENU_TYPE";s:4:"left";s:7:"USE_EXT";s:1:"N";s:18:"COMPONENT_TEMPLATE";s:18:"catalog_horizontal";s:10:"MENU_THEME";s:4:"site";}'),
	(34, 's1', 'bitrix:main.feedback', 'call_price', '/index.php', 'N', NULL, 3444, 4119, 'a:5:{s:8:"EMAIL_TO";s:17:"fed8055@yandex.ru";s:16:"EVENT_MESSAGE_ID";a:1:{i:0;s:1:"7";}s:7:"OK_TEXT";s:53:"Спасибо, ваша заявка принята.";s:15:"REQUIRED_FIELDS";s:0:"";s:11:"USE_CAPTCHA";s:1:"Y";}'),
	(35, 's1', 'bitrix:news.list', 'WhyUs', '/index.php', 'N', NULL, 9135, 11042, 'a:51:{s:18:"ACTIVE_DATE_FORMAT";s:5:"d.m.Y";s:18:"ADD_SECTIONS_CHAIN";s:1:"Y";s:9:"AJAX_MODE";s:1:"N";s:22:"AJAX_OPTION_ADDITIONAL";s:0:"";s:19:"AJAX_OPTION_HISTORY";s:1:"N";s:16:"AJAX_OPTION_JUMP";s:1:"N";s:17:"AJAX_OPTION_STYLE";s:1:"Y";s:12:"CACHE_FILTER";s:1:"N";s:12:"CACHE_GROUPS";s:1:"Y";s:10:"CACHE_TIME";s:8:"36000000";s:10:"CACHE_TYPE";s:1:"A";s:11:"CHECK_DATES";s:1:"Y";s:10:"DETAIL_URL";s:0:"";s:20:"DISPLAY_BOTTOM_PAGER";s:1:"Y";s:12:"DISPLAY_DATE";s:1:"Y";s:12:"DISPLAY_NAME";s:1:"Y";s:15:"DISPLAY_PICTURE";s:1:"Y";s:20:"DISPLAY_PREVIEW_TEXT";s:1:"Y";s:17:"DISPLAY_TOP_PAGER";s:1:"N";s:10:"FIELD_CODE";a:2:{i:0;s:0:"";i:1;s:0:"";}s:11:"FILTER_NAME";s:0:"";s:24:"HIDE_LINK_WHEN_NO_DETAIL";s:1:"N";s:9:"IBLOCK_ID";s:1:"4";s:11:"IBLOCK_TYPE";s:6:"why_us";s:25:"INCLUDE_IBLOCK_INTO_CHAIN";s:1:"Y";s:19:"INCLUDE_SUBSECTIONS";s:1:"Y";s:11:"MESSAGE_404";s:0:"";s:10:"NEWS_COUNT";s:1:"5";s:22:"PAGER_BASE_LINK_ENABLE";s:1:"N";s:20:"PAGER_DESC_NUMBERING";s:1:"N";s:31:"PAGER_DESC_NUMBERING_CACHE_TIME";s:5:"36000";s:14:"PAGER_SHOW_ALL";s:1:"N";s:17:"PAGER_SHOW_ALWAYS";s:1:"N";s:14:"PAGER_TEMPLATE";s:8:".default";s:11:"PAGER_TITLE";s:14:"Новости";s:14:"PARENT_SECTION";s:0:"";s:19:"PARENT_SECTION_CODE";s:0:"";s:20:"PREVIEW_TRUNCATE_LEN";s:0:"";s:13:"PROPERTY_CODE";a:2:{i:0;s:0:"";i:1;s:0:"";}s:17:"SET_BROWSER_TITLE";s:1:"Y";s:17:"SET_LAST_MODIFIED";s:1:"N";s:20:"SET_META_DESCRIPTION";s:1:"Y";s:17:"SET_META_KEYWORDS";s:1:"Y";s:14:"SET_STATUS_404";s:1:"N";s:9:"SET_TITLE";s:1:"Y";s:8:"SHOW_404";s:1:"N";s:8:"SORT_BY1";s:11:"ACTIVE_FROM";s:8:"SORT_BY2";s:4:"SORT";s:11:"SORT_ORDER1";s:4:"DESC";s:11:"SORT_ORDER2";s:3:"ASC";s:20:"STRICT_SECTION_CHECK";s:1:"N";}'),
	(36, 's1', 'bitrix:main.feedback', 'free_measure', '/index.php', 'N', NULL, 11564, 12091, 'a:5:{s:8:"EMAIL_TO";s:17:"fed8055@yandex.ru";s:16:"EVENT_MESSAGE_ID";s:0:"";s:7:"OK_TEXT";s:59:"Спасибо, ваше сообщение принято.";s:15:"REQUIRED_FIELDS";s:0:"";s:11:"USE_CAPTCHA";s:1:"N";}'),
	(37, 's1', 'bitrix:news.list', 'reviews', '/index.php', 'N', NULL, 14666, 17473, 'a:51:{s:18:"ACTIVE_DATE_FORMAT";s:5:"d.m.Y";s:18:"ADD_SECTIONS_CHAIN";s:1:"Y";s:9:"AJAX_MODE";s:1:"N";s:22:"AJAX_OPTION_ADDITIONAL";s:0:"";s:19:"AJAX_OPTION_HISTORY";s:1:"N";s:16:"AJAX_OPTION_JUMP";s:1:"N";s:17:"AJAX_OPTION_STYLE";s:1:"Y";s:12:"CACHE_FILTER";s:1:"N";s:12:"CACHE_GROUPS";s:1:"Y";s:10:"CACHE_TIME";s:8:"36000000";s:10:"CACHE_TYPE";s:1:"A";s:11:"CHECK_DATES";s:1:"Y";s:10:"DETAIL_URL";s:0:"";s:20:"DISPLAY_BOTTOM_PAGER";s:1:"Y";s:12:"DISPLAY_DATE";s:1:"Y";s:12:"DISPLAY_NAME";s:1:"Y";s:15:"DISPLAY_PICTURE";s:1:"Y";s:20:"DISPLAY_PREVIEW_TEXT";s:1:"Y";s:17:"DISPLAY_TOP_PAGER";s:1:"N";s:10:"FIELD_CODE";a:2:{i:0;s:0:"";i:1;s:0:"";}s:11:"FILTER_NAME";s:0:"";s:24:"HIDE_LINK_WHEN_NO_DETAIL";s:1:"N";s:9:"IBLOCK_ID";s:1:"5";s:11:"IBLOCK_TYPE";s:7:"reviews";s:25:"INCLUDE_IBLOCK_INTO_CHAIN";s:1:"Y";s:19:"INCLUDE_SUBSECTIONS";s:1:"Y";s:11:"MESSAGE_404";s:0:"";s:10:"NEWS_COUNT";s:2:"10";s:22:"PAGER_BASE_LINK_ENABLE";s:1:"N";s:20:"PAGER_DESC_NUMBERING";s:1:"N";s:31:"PAGER_DESC_NUMBERING_CACHE_TIME";s:5:"36000";s:14:"PAGER_SHOW_ALL";s:1:"N";s:17:"PAGER_SHOW_ALWAYS";s:1:"N";s:14:"PAGER_TEMPLATE";s:8:".default";s:11:"PAGER_TITLE";s:14:"Новости";s:14:"PARENT_SECTION";s:0:"";s:19:"PARENT_SECTION_CODE";s:0:"";s:20:"PREVIEW_TRUNCATE_LEN";s:0:"";s:13:"PROPERTY_CODE";a:2:{i:0;s:0:"";i:1;s:0:"";}s:17:"SET_BROWSER_TITLE";s:1:"Y";s:17:"SET_LAST_MODIFIED";s:1:"N";s:20:"SET_META_DESCRIPTION";s:1:"Y";s:17:"SET_META_KEYWORDS";s:1:"Y";s:14:"SET_STATUS_404";s:1:"N";s:9:"SET_TITLE";s:1:"Y";s:8:"SHOW_404";s:1:"N";s:8:"SORT_BY1";s:11:"ACTIVE_FROM";s:8:"SORT_BY2";s:4:"SORT";s:11:"SORT_ORDER1";s:4:"DESC";s:11:"SORT_ORDER2";s:3:"ASC";s:20:"STRICT_SECTION_CHECK";s:1:"N";}'),
	(38, 's1', 'bitrix:news.list', 'contacts', '/index.php', 'N', NULL, 17531, 19751, 'a:58:{s:18:"ACTIVE_DATE_FORMAT";s:5:"d.m.Y";s:18:"ADD_SECTIONS_CHAIN";s:1:"Y";s:9:"AJAX_MODE";s:1:"N";s:22:"AJAX_OPTION_ADDITIONAL";s:0:"";s:19:"AJAX_OPTION_HISTORY";s:1:"N";s:16:"AJAX_OPTION_JUMP";s:1:"N";s:17:"AJAX_OPTION_STYLE";s:1:"Y";s:12:"CACHE_FILTER";s:1:"N";s:12:"CACHE_GROUPS";s:1:"Y";s:10:"CACHE_TIME";s:8:"36000000";s:10:"CACHE_TYPE";s:1:"A";s:11:"CHECK_DATES";s:1:"Y";s:10:"DETAIL_URL";s:0:"";s:20:"DISPLAY_BOTTOM_PAGER";s:1:"Y";s:12:"DISPLAY_DATE";s:1:"Y";s:12:"DISPLAY_NAME";s:1:"Y";s:15:"DISPLAY_PICTURE";s:1:"Y";s:20:"DISPLAY_PREVIEW_TEXT";s:1:"Y";s:17:"DISPLAY_TOP_PAGER";s:1:"N";s:10:"FIELD_CODE";a:2:{i:0;s:0:"";i:1;s:0:"";}s:11:"FILTER_NAME";s:0:"";s:24:"HIDE_LINK_WHEN_NO_DETAIL";s:1:"N";s:9:"IBLOCK_ID";s:1:"6";s:11:"IBLOCK_TYPE";s:8:"contacts";s:25:"INCLUDE_IBLOCK_INTO_CHAIN";s:1:"Y";s:19:"INCLUDE_SUBSECTIONS";s:1:"Y";s:11:"MESSAGE_404";s:0:"";s:10:"NEWS_COUNT";s:1:"4";s:22:"PAGER_BASE_LINK_ENABLE";s:1:"N";s:20:"PAGER_DESC_NUMBERING";s:1:"N";s:31:"PAGER_DESC_NUMBERING_CACHE_TIME";s:5:"36000";s:14:"PAGER_SHOW_ALL";s:1:"N";s:17:"PAGER_SHOW_ALWAYS";s:1:"N";s:14:"PAGER_TEMPLATE";s:8:".default";s:11:"PAGER_TITLE";s:14:"Новости";s:14:"PARENT_SECTION";s:0:"";s:19:"PARENT_SECTION_CODE";s:0:"";s:20:"PREVIEW_TRUNCATE_LEN";s:0:"";s:13:"PROPERTY_CODE";a:2:{i:0;s:0:"";i:1;s:0:"";}s:17:"SET_BROWSER_TITLE";s:1:"Y";s:17:"SET_LAST_MODIFIED";s:1:"N";s:20:"SET_META_DESCRIPTION";s:1:"Y";s:17:"SET_META_KEYWORDS";s:1:"Y";s:14:"SET_STATUS_404";s:1:"N";s:9:"SET_TITLE";s:1:"Y";s:8:"SHOW_404";s:1:"N";s:8:"SORT_BY1";s:2:"ID";s:8:"SORT_BY2";s:4:"SORT";s:11:"SORT_ORDER1";s:3:"ASC";s:11:"SORT_ORDER2";s:3:"ASC";s:20:"STRICT_SECTION_CHECK";s:1:"N";s:18:"COMPONENT_TEMPLATE";s:8:"contacts";s:14:"TEMPLATE_THEME";s:4:"blue";s:14:"MEDIA_PROPERTY";s:0:"";s:15:"SLIDER_PROPERTY";s:0:"";s:11:"SEARCH_PAGE";s:8:"/search/";s:10:"USE_RATING";s:1:"N";s:9:"USE_SHARE";s:1:"N";}');
/*!40000 ALTER TABLE `b_component_params` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_composite_log
DROP TABLE IF EXISTS `b_composite_log`;
CREATE TABLE IF NOT EXISTS `b_composite_log` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `HOST` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `URI` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `TITLE` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED` datetime NOT NULL,
  `TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `AJAX` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `USER_ID` int(18) NOT NULL DEFAULT 0,
  `PAGE_ID` int(18) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `IX_B_COMPOSITE_LOG_PAGE_ID` (`PAGE_ID`),
  KEY `IX_B_COMPOSITE_LOG_HOST` (`HOST`),
  KEY `IX_B_COMPOSITE_LOG_TYPE` (`TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_composite_log: ~0 rows (приблизительно)
DELETE FROM `b_composite_log`;
/*!40000 ALTER TABLE `b_composite_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_composite_log` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_composite_page
DROP TABLE IF EXISTS `b_composite_page`;
CREATE TABLE IF NOT EXISTS `b_composite_page` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CACHE_KEY` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `HOST` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `URI` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `TITLE` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED` datetime NOT NULL,
  `CHANGED` datetime NOT NULL,
  `LAST_VIEWED` datetime NOT NULL,
  `VIEWS` int(18) NOT NULL DEFAULT 0,
  `REWRITES` int(18) NOT NULL DEFAULT 0,
  `SIZE` int(18) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `IX_B_COMPOSITE_PAGE_CACHE_KEY` (`CACHE_KEY`(100)),
  KEY `IX_B_COMPOSITE_PAGE_VIEWED` (`LAST_VIEWED`),
  KEY `IX_B_COMPOSITE_PAGE_HOST` (`HOST`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_composite_page: ~0 rows (приблизительно)
DELETE FROM `b_composite_page`;
/*!40000 ALTER TABLE `b_composite_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_composite_page` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_consent_agreement
DROP TABLE IF EXISTS `b_consent_agreement`;
CREATE TABLE IF NOT EXISTS `b_consent_agreement` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_INSERT` datetime NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATA_PROVIDER` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AGREEMENT_TEXT` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `LABEL_TEXT` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECURITY_CODE` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USE_URL` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IS_AGREEMENT_TEXT_HTML` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `IX_B_CONSENT_AGREEMENT_CODE` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_consent_agreement: ~0 rows (приблизительно)
DELETE FROM `b_consent_agreement`;
/*!40000 ALTER TABLE `b_consent_agreement` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_consent_agreement` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_consent_field
DROP TABLE IF EXISTS `b_consent_field`;
CREATE TABLE IF NOT EXISTS `b_consent_field` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `AGREEMENT_ID` int(18) NOT NULL,
  `CODE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_CONSENT_FIELD_AG_ID` (`AGREEMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_consent_field: ~0 rows (приблизительно)
DELETE FROM `b_consent_field`;
/*!40000 ALTER TABLE `b_consent_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_consent_field` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_consent_user_consent
DROP TABLE IF EXISTS `b_consent_user_consent`;
CREATE TABLE IF NOT EXISTS `b_consent_user_consent` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime NOT NULL,
  `AGREEMENT_ID` int(18) NOT NULL,
  `USER_ID` int(18) DEFAULT NULL,
  `IP` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `URL` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ORIGIN_ID` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ORIGINATOR_ID` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_CONSENT_USER_CONSENT` (`AGREEMENT_ID`),
  KEY `IX_CONSENT_USER_CONSENT_USER_ORIGIN` (`USER_ID`,`ORIGIN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_consent_user_consent: ~0 rows (приблизительно)
DELETE FROM `b_consent_user_consent`;
/*!40000 ALTER TABLE `b_consent_user_consent` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_consent_user_consent` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_consent_user_consent_item
DROP TABLE IF EXISTS `b_consent_user_consent_item`;
CREATE TABLE IF NOT EXISTS `b_consent_user_consent_item` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `USER_CONSENT_ID` int(18) NOT NULL,
  `VALUE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_CONSENT_USER_ITEM_AG_ID` (`USER_CONSENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_consent_user_consent_item: ~0 rows (приблизительно)
DELETE FROM `b_consent_user_consent_item`;
/*!40000 ALTER TABLE `b_consent_user_consent_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_consent_user_consent_item` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_counter_data
DROP TABLE IF EXISTS `b_counter_data`;
CREATE TABLE IF NOT EXISTS `b_counter_data` (
  `ID` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `TYPE` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `DATA` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_counter_data: ~0 rows (приблизительно)
DELETE FROM `b_counter_data`;
/*!40000 ALTER TABLE `b_counter_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_counter_data` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_culture
DROP TABLE IF EXISTS `b_culture`;
CREATE TABLE IF NOT EXISTS `b_culture` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_DATE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_DATETIME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WEEK_START` int(1) DEFAULT 1,
  `CHARSET` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DIRECTION` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `SHORT_DATE_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'n/j/Y',
  `MEDIUM_DATE_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'M j, Y',
  `LONG_DATE_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'F j, Y',
  `FULL_DATE_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'l, F j, Y',
  `DAY_MONTH_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'F j',
  `DAY_SHORT_MONTH_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'M j',
  `DAY_OF_WEEK_MONTH_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'l, F j',
  `SHORT_DAY_OF_WEEK_MONTH_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'D, F j',
  `SHORT_DAY_OF_WEEK_SHORT_MONTH_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'D, M j',
  `SHORT_TIME_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'g:i a',
  `LONG_TIME_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'g:i:s a',
  `AM_VALUE` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'am',
  `PM_VALUE` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'pm',
  `NUMBER_THOUSANDS_SEPARATOR` varchar(10) COLLATE utf8_unicode_ci DEFAULT ',',
  `NUMBER_DECIMAL_SEPARATOR` varchar(10) COLLATE utf8_unicode_ci DEFAULT '.',
  `NUMBER_DECIMALS` tinyint(4) DEFAULT 2,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_culture: ~2 rows (приблизительно)
DELETE FROM `b_culture`;
/*!40000 ALTER TABLE `b_culture` DISABLE KEYS */;
INSERT INTO `b_culture` (`ID`, `CODE`, `NAME`, `FORMAT_DATE`, `FORMAT_DATETIME`, `FORMAT_NAME`, `WEEK_START`, `CHARSET`, `DIRECTION`, `SHORT_DATE_FORMAT`, `MEDIUM_DATE_FORMAT`, `LONG_DATE_FORMAT`, `FULL_DATE_FORMAT`, `DAY_MONTH_FORMAT`, `DAY_SHORT_MONTH_FORMAT`, `DAY_OF_WEEK_MONTH_FORMAT`, `SHORT_DAY_OF_WEEK_MONTH_FORMAT`, `SHORT_DAY_OF_WEEK_SHORT_MONTH_FORMAT`, `SHORT_TIME_FORMAT`, `LONG_TIME_FORMAT`, `AM_VALUE`, `PM_VALUE`, `NUMBER_THOUSANDS_SEPARATOR`, `NUMBER_DECIMAL_SEPARATOR`, `NUMBER_DECIMALS`) VALUES
	(1, 'ru', 'ru', 'DD.MM.YYYY', 'DD.MM.YYYY HH:MI:SS', '#NAME# #LAST_NAME#', 1, 'UTF-8', 'Y', 'd.m.Y', 'j M Y', 'j F Y', 'l, j F Y', 'j F', 'j M', 'l, j F', 'D, j F', 'D, j M', 'H:i', 'H:i:s', 'am', 'pm', ' ', ',', 2),
	(2, 'en', 'en', 'MM/DD/YYYY', 'MM/DD/YYYY H:MI:SS T', '#NAME# #LAST_NAME#', 0, 'UTF-8', 'Y', 'n/j/Y', 'M j, Y', 'F j, Y', 'l, F j, Y', 'F j', 'M j', 'l, F j', 'D, F j', 'D, M j', 'g:i a', 'g:i:s a', 'am', 'pm', ',', '.', 2);
/*!40000 ALTER TABLE `b_culture` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_entity_usage
DROP TABLE IF EXISTS `b_entity_usage`;
CREATE TABLE IF NOT EXISTS `b_entity_usage` (
  `USER_ID` int(11) NOT NULL,
  `CONTEXT` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_ID_INT` int(11) NOT NULL DEFAULT 0,
  `PREFIX` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `LAST_USE_DATE` datetime NOT NULL,
  PRIMARY KEY (`USER_ID`,`CONTEXT`,`ENTITY_ID`,`ITEM_ID`),
  KEY `IX_ENTITY_USAGE_ITEM_ID_INT` (`ITEM_ID_INT`),
  KEY `IX_ENTITY_USAGE_LAST_USE_DATE` (`LAST_USE_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_entity_usage: ~0 rows (приблизительно)
DELETE FROM `b_entity_usage`;
/*!40000 ALTER TABLE `b_entity_usage` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_entity_usage` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_event
DROP TABLE IF EXISTS `b_event`;
CREATE TABLE IF NOT EXISTS `b_event` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE_ID` int(18) DEFAULT NULL,
  `LID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `C_FIELDS` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_INSERT` datetime DEFAULT NULL,
  `DATE_EXEC` datetime DEFAULT NULL,
  `SUCCESS_EXEC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DUPLICATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_success` (`SUCCESS_EXEC`),
  KEY `ix_b_event_date_exec` (`DATE_EXEC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_event: ~0 rows (приблизительно)
DELETE FROM `b_event`;
/*!40000 ALTER TABLE `b_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_event` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_event_attachment
DROP TABLE IF EXISTS `b_event_attachment`;
CREATE TABLE IF NOT EXISTS `b_event_attachment` (
  `EVENT_ID` int(18) NOT NULL,
  `FILE_ID` int(18) NOT NULL,
  `IS_FILE_COPIED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`EVENT_ID`,`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_event_attachment: ~0 rows (приблизительно)
DELETE FROM `b_event_attachment`;
/*!40000 ALTER TABLE `b_event_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_event_attachment` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_event_log
DROP TABLE IF EXISTS `b_event_log`;
CREATE TABLE IF NOT EXISTS `b_event_log` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `SEVERITY` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `AUDIT_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `REMOTE_ADDR` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_AGENT` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUEST_URI` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_ID` int(18) DEFAULT NULL,
  `GUEST_ID` int(18) DEFAULT NULL,
  `DESCRIPTION` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_event_log_time` (`TIMESTAMP_X`),
  KEY `ix_b_event_log_audit_type_time` (`AUDIT_TYPE_ID`,`TIMESTAMP_X`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_event_log: ~12 rows (приблизительно)
DELETE FROM `b_event_log`;
/*!40000 ALTER TABLE `b_event_log` DISABLE KEYS */;
INSERT INTO `b_event_log` (`ID`, `TIMESTAMP_X`, `SEVERITY`, `AUDIT_TYPE_ID`, `MODULE_ID`, `ITEM_ID`, `REMOTE_ADDR`, `USER_AGENT`, `REQUEST_URI`, `SITE_ID`, `USER_ID`, `GUEST_ID`, `DESCRIPTION`) VALUES
	(1, '2021-01-23 12:22:29', 'WARNING', 'SITE_CHECKER_ERROR', 'main', 'CSiteCheckerTest::CommonTest();', '-', '-', '/bitrix/tools/public_session.php?k=12c50cc09290ec2006092e82bb8602c8.2ffbd30d49445417ee0db00996e38a789850395b5950086dd6a9ac0d19dc15e5', 's1', 1, NULL, ''),
	(2, '2021-01-23 18:03:13', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36 OPR/73.0.3856.344 (Edition Campaign 34)', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:"path";s:9:"index.php";}'),
	(3, '2021-01-24 12:26:04', 'WARNING', 'SITE_CHECKER_ERROR', 'main', 'CSiteCheckerTest::CommonTest();', '-', '-', '/bitrix/admin/public_file_edit.php?bxpublic=Y&lang=ru&path=%2Findex.php&site=s1&back_url=%2F%3Fbitrix_include_areas%3DY%26clear_cache%3DY&templateID=main&siteTemplateId=main&bxsender=core_window_cdialog', NULL, 1, NULL, ''),
	(4, '2021-01-24 12:27:16', 'UNKNOWN', 'MENU_ADD', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36 OPR/73.0.3856.344 (Edition Campaign 34)', '/bitrix/admin/public_menu_edit.php?bxsender=core_window_cdialog&new=Y&lang=ru&site=s1&back_url=%2F%3Fbitrix_include_areas%3DN%26clear_cache%3DY&path=&name=left&siteTemplateId=main', NULL, 1, NULL, 'a:2:{s:9:"menu_name";N;s:4:"path";s:0:"";}'),
	(5, '2021-01-24 12:53:33', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36 OPR/73.0.3856.344 (Edition Campaign 34)', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:"path";s:9:"index.php";}'),
	(6, '2021-01-24 12:54:00', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36 OPR/73.0.3856.344 (Edition Campaign 34)', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:"path";s:0:"";}'),
	(7, '2021-01-24 12:54:45', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36 OPR/73.0.3856.344 (Edition Campaign 34)', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:"path";s:13:"index_inc.php";}'),
	(8, '2021-01-24 14:08:17', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36 OPR/73.0.3856.344 (Edition Campaign 34)', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:"path";s:9:"index.php";}'),
	(9, '2021-01-24 14:44:53', 'UNKNOWN', 'MENU_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36 OPR/73.0.3856.344 (Edition Campaign 34)', '/bitrix/admin/public_menu_edit.php?bxsender=core_window_cdialog&lang=ru&site=s1&back_url=%2F%3Fbitrix_include_areas%3DY%26clear_cache%3DY&path=%2F&name=left&siteTemplateId=main', NULL, 1, NULL, 'a:2:{s:9:"menu_name";N;s:4:"path";s:0:"";}'),
	(10, '2021-01-24 14:46:33', 'UNKNOWN', 'MENU_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36 OPR/73.0.3856.344 (Edition Campaign 34)', '/bitrix/admin/public_menu_edit.php?bxsender=core_window_cdialog&lang=ru&site=s1&back_url=%2F%3Fbitrix_include_areas%3DY%26clear_cache%3DY&path=%2F&name=left&siteTemplateId=main', NULL, 1, NULL, 'a:2:{s:9:"menu_name";N;s:4:"path";s:0:"";}'),
	(11, '2021-01-24 14:46:53', 'UNKNOWN', 'MENU_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36 OPR/73.0.3856.344 (Edition Campaign 34)', '/bitrix/admin/public_menu_edit.php?bxsender=core_window_cdialog&lang=ru&site=s1&back_url=%2F%3Fbitrix_include_areas%3DY%26clear_cache%3DY&path=%2F&name=left&siteTemplateId=main', NULL, 1, NULL, 'a:2:{s:9:"menu_name";N;s:4:"path";s:0:"";}'),
	(12, '2021-01-25 12:37:31', 'WARNING', 'SITE_CHECKER_ERROR', 'main', 'CSiteCheckerTest::CommonTest();', '-', '-', '/bitrix/tools/public_session.php?k=1fed3c56a9aadb11bf5de2cb72b6931d.34dd1289d6263c3316bf85c436890add9ab54c25fe1aaffeaf1a9217d2f11d14', 's1', 1, NULL, '');
/*!40000 ALTER TABLE `b_event_log` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_event_message
DROP TABLE IF EXISTS `b_event_message`;
CREATE TABLE IF NOT EXISTS `b_event_message` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `EMAIL_FROM` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#EMAIL_FROM#',
  `EMAIL_TO` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#EMAIL_TO#',
  `SUBJECT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE_PHP` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `BODY_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `BCC` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `REPLY_TO` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CC` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IN_REPLY_TO` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRIORITY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD1_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD1_VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD2_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD2_VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_TEMPLATE_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ADDITIONAL_FIELD` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_event_message_name` (`EVENT_NAME`(50))
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_event_message: ~31 rows (приблизительно)
DELETE FROM `b_event_message`;
/*!40000 ALTER TABLE `b_event_message` DISABLE KEYS */;
INSERT INTO `b_event_message` (`ID`, `TIMESTAMP_X`, `EVENT_NAME`, `LID`, `ACTIVE`, `EMAIL_FROM`, `EMAIL_TO`, `SUBJECT`, `MESSAGE`, `MESSAGE_PHP`, `BODY_TYPE`, `BCC`, `REPLY_TO`, `CC`, `IN_REPLY_TO`, `PRIORITY`, `FIELD1_NAME`, `FIELD1_VALUE`, `FIELD2_NAME`, `FIELD2_VALUE`, `SITE_TEMPLATE_ID`, `ADDITIONAL_FIELD`, `LANGUAGE_ID`) VALUES
	(1, '2021-01-22 13:16:56', 'NEW_USER', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#DEFAULT_EMAIL_FROM#', '#SITE_NAME#: Зарегистрировался новый пользователь', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНа сайте #SERVER_NAME# успешно зарегистрирован новый пользователь.\n\nДанные пользователя:\nID пользователя: #USER_ID#\n\nИмя: #NAME#\nФамилия: #LAST_NAME#\nE-Mail: #EMAIL#\n\nLogin: #LOGIN#\n\nПисьмо сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nНа сайте <?=$arParams["SERVER_NAME"];?> успешно зарегистрирован новый пользователь.\n\nДанные пользователя:\nID пользователя: <?=$arParams["USER_ID"];?>\n\n\nИмя: <?=$arParams["NAME"];?>\n\nФамилия: <?=$arParams["LAST_NAME"];?>\n\nE-Mail: <?=$arParams["EMAIL"];?>\n\n\nLogin: <?=$arParams["LOGIN"];?>\n\n\nПисьмо сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
	(2, '2021-01-22 13:16:56', 'USER_INFO', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Регистрационная информация', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nLogin: #LOGIN#\n\nВы можете изменить пароль, перейдя по следующей ссылке:\nhttp://#SERVER_NAME#/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=#CHECKWORD#&USER_LOGIN=#URL_LOGIN#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n<?=$arParams["NAME"];?> <?=$arParams["LAST_NAME"];?>,\n\n<?=$arParams["MESSAGE"];?>\n\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams["USER_ID"];?>\n\nСтатус профиля: <?=$arParams["STATUS"];?>\n\nLogin: <?=$arParams["LOGIN"];?>\n\n\nВы можете изменить пароль, перейдя по следующей ссылке:\nhttp://<?=$arParams["SERVER_NAME"];?>/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=<?=$arParams["CHECKWORD"];?>&USER_LOGIN=<?=$arParams["URL_LOGIN"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
	(3, '2021-01-22 13:16:56', 'USER_PASS_REQUEST', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Запрос на смену пароля', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://#SERVER_NAME#/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=#CHECKWORD#&USER_LOGIN=#URL_LOGIN#\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nLogin: #LOGIN#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n<?=$arParams["NAME"];?> <?=$arParams["LAST_NAME"];?>,\n\n<?=$arParams["MESSAGE"];?>\n\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://<?=$arParams["SERVER_NAME"];?>/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=<?=$arParams["CHECKWORD"];?>&USER_LOGIN=<?=$arParams["URL_LOGIN"];?>\n\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams["USER_ID"];?>\n\nСтатус профиля: <?=$arParams["STATUS"];?>\n\nLogin: <?=$arParams["LOGIN"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
	(4, '2021-01-22 13:16:56', 'USER_PASS_CHANGED', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Подтверждение смены пароля', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nLogin: #LOGIN#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n<?=$arParams["NAME"];?> <?=$arParams["LAST_NAME"];?>,\n\n<?=$arParams["MESSAGE"];?>\n\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams["USER_ID"];?>\n\nСтатус профиля: <?=$arParams["STATUS"];?>\n\nLogin: <?=$arParams["LOGIN"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
	(5, '2021-01-22 13:16:56', 'NEW_USER_CONFIRM', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Подтверждение регистрации нового пользователя', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nЗдравствуйте,\n\nВы получили это сообщение, так как ваш адрес был использован при регистрации нового пользователя на сервере #SERVER_NAME#.\n\nВаш код для подтверждения регистрации: #CONFIRM_CODE#\n\nДля подтверждения регистрации перейдите по следующей ссылке:\nhttp://#SERVER_NAME#/auth/index.php?confirm_registration=yes&confirm_user_id=#USER_ID#&confirm_code=#CONFIRM_CODE#\n\nВы также можете ввести код для подтверждения регистрации на странице:\nhttp://#SERVER_NAME#/auth/index.php?confirm_registration=yes&confirm_user_id=#USER_ID#\n\nВнимание! Ваш профиль не будет активным, пока вы не подтвердите свою регистрацию.\n\n---------------------------------------------------------------------\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nЗдравствуйте,\n\nВы получили это сообщение, так как ваш адрес был использован при регистрации нового пользователя на сервере <?=$arParams["SERVER_NAME"];?>.\n\nВаш код для подтверждения регистрации: <?=$arParams["CONFIRM_CODE"];?>\n\n\nДля подтверждения регистрации перейдите по следующей ссылке:\nhttp://<?=$arParams["SERVER_NAME"];?>/auth/index.php?confirm_registration=yes&confirm_user_id=<?=$arParams["USER_ID"];?>&confirm_code=<?=$arParams["CONFIRM_CODE"];?>\n\n\nВы также можете ввести код для подтверждения регистрации на странице:\nhttp://<?=$arParams["SERVER_NAME"];?>/auth/index.php?confirm_registration=yes&confirm_user_id=<?=$arParams["USER_ID"];?>\n\n\nВнимание! Ваш профиль не будет активным, пока вы не подтвердите свою регистрацию.\n\n---------------------------------------------------------------------\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
	(6, '2021-01-22 13:16:56', 'USER_INVITE', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Приглашение на сайт', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\nЗдравствуйте, #NAME# #LAST_NAME#!\n\nАдминистратором сайта вы добавлены в число зарегистрированных пользователей.\n\nПриглашаем Вас на наш сайт.\n\nВаша регистрационная информация:\n\nID пользователя: #ID#\nLogin: #LOGIN#\n\nРекомендуем вам сменить установленный автоматически пароль.\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://#SERVER_NAME#/auth.php?change_password=yes&USER_LOGIN=#URL_LOGIN#&USER_CHECKWORD=#CHECKWORD#\n', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\nЗдравствуйте, <?=$arParams["NAME"];?> <?=$arParams["LAST_NAME"];?>!\n\nАдминистратором сайта вы добавлены в число зарегистрированных пользователей.\n\nПриглашаем Вас на наш сайт.\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams["ID"];?>\n\nLogin: <?=$arParams["LOGIN"];?>\n\n\nРекомендуем вам сменить установленный автоматически пароль.\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://<?=$arParams["SERVER_NAME"];?>/auth.php?change_password=yes&USER_LOGIN=<?=$arParams["URL_LOGIN"];?>&USER_CHECKWORD=<?=$arParams["CHECKWORD"];?>\n\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
	(7, '2021-01-22 13:16:56', 'FEEDBACK_FORM', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', 'fed8055@yandex.ru', '#SITE_NAME#: Сообщение из формы уточнения стоимости', 'Информационное сообщение сайта #SITE_NAME#\r\n------------------------------------------\r\n\r\nВам был заказан звонок для уточнения стоимости натяжного потолка\r\n\r\nАвтор: #AUTHOR#\r\nТелефон пользователя автора: #PHONE#\r\n\r\n\r\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\r\n\r\n------------------------------------------\r\n\r\nВам был заказан звонок для уточнения стоимости натяжного потолка\r\n\r\nАвтор: <?=$arParams["AUTHOR"];?>\r\n\r\nТелефон пользователя автора: <?=$arParams["PHONE"];?>\r\n\r\n\r\n\r\nСообщение сгенерировано автоматически.', 'text', '', '', '', '', '', '', '', '', '', '', 'a:0:{}', 'ru'),
	(8, '2021-01-22 13:16:56', 'MAIN_MAIL_CONFIRM_CODE', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL_TO#', '#MESSAGE_SUBJECT#', '<? EventMessageThemeCompiler::includeComponent(\'bitrix:main.mail.confirm\', \'\', $arParams); ?>', '<? EventMessageThemeCompiler::includeComponent(\'bitrix:main.mail.confirm\', \'\', $arParams); ?>', 'html', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'mail_join', NULL, NULL),
	(9, '2021-01-22 13:16:56', 'EVENT_LOG_NOTIFICATION', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', 'Оповещение журнала событий: #NAME#', 'Зафиксированы события в журнале, соответствующие параметрам оповещения:\n\nТип события: #AUDIT_TYPE_ID#\nОбъект: #ITEM_ID#\nПользователь: #USER_ID# \nIP-адрес: #REMOTE_ADDR#\nБраузер: #USER_AGENT#\nСтраница: #REQUEST_URI# \n\nКоличество записей: #EVENT_COUNT# \n\n#ADDITIONAL_TEXT#\n\nПерейти в журнал событий:\nhttp://#SERVER_NAME#/bitrix/admin/event_log.php?set_filter=Y&find_audit_type_id=#AUDIT_TYPE_ID#', 'Зафиксированы события в журнале, соответствующие параметрам оповещения:\n\nТип события: <?=$arParams["AUDIT_TYPE_ID"];?>\n\nОбъект: <?=$arParams["ITEM_ID"];?>\n\nПользователь: <?=$arParams["USER_ID"];?> \nIP-адрес: <?=$arParams["REMOTE_ADDR"];?>\n\nБраузер: <?=$arParams["USER_AGENT"];?>\n\nСтраница: <?=$arParams["REQUEST_URI"];?> \n\nКоличество записей: <?=$arParams["EVENT_COUNT"];?> \n\n<?=$arParams["ADDITIONAL_TEXT"];?>\n\n\nПерейти в журнал событий:\nhttp://<?=$arParams["SERVER_NAME"];?>/bitrix/admin/event_log.php?set_filter=Y&find_audit_type_id=<?=$arParams["AUDIT_TYPE_ID"];?>', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
	(10, '2021-01-22 13:16:56', 'USER_CODE_REQUEST', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Запрос кода авторизации', 'Используйте для авторизации код:\n\n#CHECKWORD#\n\nПосле авторизации вы сможете изменить свой пароль в редактировании профиля.\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nЛогин: #LOGIN#\n\nСообщение создано автоматически.', 'Используйте для авторизации код:\n\n<?=$arParams["CHECKWORD"];?>\n\n\nПосле авторизации вы сможете изменить свой пароль в редактировании профиля.\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams["USER_ID"];?>\n\nСтатус профиля: <?=$arParams["STATUS"];?>\n\nЛогин: <?=$arParams["LOGIN"];?>\n\n\nСообщение создано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
	(11, '2021-01-22 13:17:35', 'NEW_BLOG_MESSAGE', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] #BLOG_NAME# : #MESSAGE_TITLE#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовое сообщение в блоге "#BLOG_NAME#"\n\nТема:\n#MESSAGE_TITLE#\n\nАвтор: #AUTHOR#\nДата: #MESSAGE_DATE#\n\nТекст сообщения:\n#MESSAGE_TEXT#\n\nАдрес сообщения:\n#MESSAGE_PATH#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nНовое сообщение в блоге "<?=$arParams["BLOG_NAME"];?>"\n\nТема:\n<?=$arParams["MESSAGE_TITLE"];?>\n\n\nАвтор: <?=$arParams["AUTHOR"];?>\n\nДата: <?=$arParams["MESSAGE_DATE"];?>\n\n\nТекст сообщения:\n<?=$arParams["MESSAGE_TEXT"];?>\n\n\nАдрес сообщения:\n<?=$arParams["MESSAGE_PATH"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(12, '2021-01-22 13:17:35', 'NEW_BLOG_COMMENT', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] #MESSAGE_TITLE# : #COMMENT_TITLE#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовый комментарий в блоге "#BLOG_NAME#" на сообщение "#MESSAGE_TITLE#"\n\nТема:\n#COMMENT_TITLE#\nАвтор: #AUTHOR#\nДата: #COMMENT_DATE#\n\nТекст сообщения:\n#COMMENT_TEXT#\n\nАдрес сообщения:\n#COMMENT_PATH#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nНовый комментарий в блоге "<?=$arParams["BLOG_NAME"];?>" на сообщение "<?=$arParams["MESSAGE_TITLE"];?>"\n\nТема:\n<?=$arParams["COMMENT_TITLE"];?>\n\nАвтор: <?=$arParams["AUTHOR"];?>\n\nДата: <?=$arParams["COMMENT_DATE"];?>\n\n\nТекст сообщения:\n<?=$arParams["COMMENT_TEXT"];?>\n\n\nАдрес сообщения:\n<?=$arParams["COMMENT_PATH"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(13, '2021-01-22 13:17:35', 'NEW_BLOG_COMMENT2COMMENT', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] #MESSAGE_TITLE# : #COMMENT_TITLE#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовый комментарий на ваш комментарий в блоге "#BLOG_NAME#" на сообщение "#MESSAGE_TITLE#".\n\nТема:\n#COMMENT_TITLE#\nАвтор: #AUTHOR#\nДата: #COMMENT_DATE#\n\nТекст сообщения:\n#COMMENT_TEXT#\n\nАдрес сообщения:\n#COMMENT_PATH#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nНовый комментарий на ваш комментарий в блоге "<?=$arParams["BLOG_NAME"];?>" на сообщение "<?=$arParams["MESSAGE_TITLE"];?>".\n\nТема:\n<?=$arParams["COMMENT_TITLE"];?>\n\nАвтор: <?=$arParams["AUTHOR"];?>\n\nДата: <?=$arParams["COMMENT_DATE"];?>\n\n\nТекст сообщения:\n<?=$arParams["COMMENT_TEXT"];?>\n\n\nАдрес сообщения:\n<?=$arParams["COMMENT_PATH"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(14, '2021-01-22 13:17:35', 'NEW_BLOG_COMMENT_WITHOUT_TITLE', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] #MESSAGE_TITLE#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовый комментарий в блоге "#BLOG_NAME#" на сообщение "#MESSAGE_TITLE#"\n\nАвтор: #AUTHOR#\nДата: #COMMENT_DATE#\n\nТекст сообщения:\n#COMMENT_TEXT#\n\nАдрес сообщения:\n#COMMENT_PATH#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nНовый комментарий в блоге "<?=$arParams["BLOG_NAME"];?>" на сообщение "<?=$arParams["MESSAGE_TITLE"];?>"\n\nАвтор: <?=$arParams["AUTHOR"];?>\n\nДата: <?=$arParams["COMMENT_DATE"];?>\n\n\nТекст сообщения:\n<?=$arParams["COMMENT_TEXT"];?>\n\n\nАдрес сообщения:\n<?=$arParams["COMMENT_PATH"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(15, '2021-01-22 13:17:35', 'NEW_BLOG_COMMENT2COMMENT_WITHOUT_TITLE', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] #MESSAGE_TITLE#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовый комментарий на ваш комментарий в блоге "#BLOG_NAME#" на сообщение "#MESSAGE_TITLE#".\n\nАвтор: #AUTHOR#\nДата: #COMMENT_DATE#\n\nТекст сообщения:\n#COMMENT_TEXT#\n\nАдрес сообщения:\n#COMMENT_PATH#\n\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nНовый комментарий на ваш комментарий в блоге "<?=$arParams["BLOG_NAME"];?>" на сообщение "<?=$arParams["MESSAGE_TITLE"];?>".\n\nАвтор: <?=$arParams["AUTHOR"];?>\n\nДата: <?=$arParams["COMMENT_DATE"];?>\n\n\nТекст сообщения:\n<?=$arParams["COMMENT_TEXT"];?>\n\n\nАдрес сообщения:\n<?=$arParams["COMMENT_PATH"];?>\n\n\nСообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(16, '2021-01-22 13:17:35', 'BLOG_YOUR_BLOG_TO_USER', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] Ваш блог "#BLOG_NAME#" был добавлен в друзья к #USER#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВаш блог "#BLOG_NAME#" был добавлен в друзья к #USER#.\n\nПрофиль пользователя: #USER_URL#\n\nАдрес вашего блога: #BLOG_ADR#\n\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nВаш блог "<?=$arParams["BLOG_NAME"];?>" был добавлен в друзья к <?=$arParams["USER"];?>.\n\nПрофиль пользователя: <?=$arParams["USER_URL"];?>\n\n\nАдрес вашего блога: <?=$arParams["BLOG_ADR"];?>\n\n\nСообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(17, '2021-01-22 13:17:35', 'BLOG_YOU_TO_BLOG', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] Вы были добавлены в друзья блога "#BLOG_NAME#"', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВы были добавлены в друзья блога "#BLOG_NAME#".\n\nАдрес блога: #BLOG_ADR#\n\nВаш профиль: #USER_URL#\n\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nВы были добавлены в друзья блога "<?=$arParams["BLOG_NAME"];?>".\n\nАдрес блога: <?=$arParams["BLOG_ADR"];?>\n\n\nВаш профиль: <?=$arParams["USER_URL"];?>\n\n\nСообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(18, '2021-01-22 13:17:35', 'BLOG_BLOG_TO_YOU', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] К вам в друзья был добавлен блог "#BLOG_NAME#"', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nК вам в друзья был добавлен блог "#BLOG_NAME#".\n\nАдрес блога: #BLOG_ADR#\n\nВаш профиль: #USER_URL#\n\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nК вам в друзья был добавлен блог "<?=$arParams["BLOG_NAME"];?>".\n\nАдрес блога: <?=$arParams["BLOG_ADR"];?>\n\n\nВаш профиль: <?=$arParams["USER_URL"];?>\n\n\nСообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(19, '2021-01-22 13:17:35', 'BLOG_USER_TO_YOUR_BLOG', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] В ваш блог "#BLOG_NAME#" был добавлен друг #USER#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВ ваш блог "#BLOG_NAME#" был добавлен друг #USER#.\n\nПрофиль пользователя: #USER_URL#\n\nАдрес вашего блога: #BLOG_ADR#\n\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nВ ваш блог "<?=$arParams["BLOG_NAME"];?>" был добавлен друг <?=$arParams["USER"];?>.\n\nПрофиль пользователя: <?=$arParams["USER_URL"];?>\n\n\nАдрес вашего блога: <?=$arParams["BLOG_ADR"];?>\n\n\nСообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(20, '2021-01-22 13:17:35', 'BLOG_SONET_NEW_POST', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#POST_TITLE#', '<?EventMessageThemeCompiler::includeComponent("bitrix:socialnetwork.blog.post.mail","",Array("EMAIL_TO" => "{#EMAIL_TO#}","RECIPIENT_ID" => "{#RECIPIENT_ID#}","POST_ID" => "{#POST_ID#}","URL" => "{#URL#}"));?>', '<?EventMessageThemeCompiler::includeComponent("bitrix:socialnetwork.blog.post.mail","",Array("EMAIL_TO" => "{$arParams[\'EMAIL_TO\']}","RECIPIENT_ID" => "{$arParams[\'RECIPIENT_ID\']}","POST_ID" => "{$arParams[\'POST_ID\']}","URL" => "{$arParams[\'URL\']}"));?>', 'html', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'mail_user', NULL, NULL),
	(21, '2021-01-22 13:17:35', 'BLOG_SONET_NEW_COMMENT', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', 'Re: #POST_TITLE#', '<?EventMessageThemeCompiler::includeComponent("bitrix:socialnetwork.blog.post.comment.mail","",Array("COMMENT_ID" => "{#COMMENT_ID#}","RECIPIENT_ID" => "{#RECIPIENT_ID#}","EMAIL_TO" => "{#EMAIL_TO#}","POST_ID" => "{#POST_ID#}","URL" => "{#URL#}"));?>', '<?EventMessageThemeCompiler::includeComponent("bitrix:socialnetwork.blog.post.comment.mail","",Array("COMMENT_ID" => "{$arParams[\'COMMENT_ID\']}","RECIPIENT_ID" => "{$arParams[\'RECIPIENT_ID\']}","EMAIL_TO" => "{$arParams[\'EMAIL_TO\']}","POST_ID" => "{$arParams[\'POST_ID\']}","URL" => "{$arParams[\'URL\']}"));?>', 'html', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'mail_user', NULL, NULL),
	(22, '2021-01-22 13:17:35', 'BLOG_SONET_POST_SHARE', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#POST_TITLE#', '<?EventMessageThemeCompiler::includeComponent("bitrix:socialnetwork.blog.post_share.mail","",Array("EMAIL_TO" => "{#EMAIL_TO#}","RECIPIENT_ID" => "{#RECIPIENT_ID#}","POST_ID" => "{#POST_ID#}","URL" => "{#URL#}"));?>', '<?EventMessageThemeCompiler::includeComponent("bitrix:socialnetwork.blog.post_share.mail","",Array("EMAIL_TO" => "{$arParams[\'EMAIL_TO\']}","RECIPIENT_ID" => "{$arParams[\'RECIPIENT_ID\']}","POST_ID" => "{$arParams[\'POST_ID\']}","URL" => "{$arParams[\'URL\']}"));?>', 'html', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'mail_user', NULL, NULL),
	(23, '2021-01-22 13:17:35', 'BLOG_POST_BROADCAST', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: #MESSAGE_TITLE#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНа сайте добавлено новое сообщение.\n\nТема:\n#MESSAGE_TITLE#\n\nАвтор: #AUTHOR#\n\nТекст сообщения:\n#MESSAGE_TEXT#\n\nАдрес сообщения:\n#MESSAGE_PATH#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nНа сайте добавлено новое сообщение.\n\nТема:\n<?=$arParams["MESSAGE_TITLE"];?>\n\n\nАвтор: <?=$arParams["AUTHOR"];?>\n\n\nТекст сообщения:\n<?=$arParams["MESSAGE_TEXT"];?>\n\n\nАдрес сообщения:\n<?=$arParams["MESSAGE_PATH"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(24, '2021-01-22 13:18:01', 'NEW_FORUM_MESSAGE', 's1', 'Y', '#FROM_EMAIL#', '#RECIPIENT#', '#SITE_NAME#: [F] #TOPIC_TITLE# : #FORUM_NAME#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовое сообщение на форуме #SERVER_NAME#.\n\nТема:\n#TOPIC_TITLE#\n\nАвтор: #AUTHOR#\nДата : #MESSAGE_DATE#\nТекст сообщения:\n\n#MESSAGE_TEXT#\n\nАдрес сообщения:\nhttp://#SERVER_NAME##PATH2FORUM#\n\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nНовое сообщение на форуме <?=$arParams["SERVER_NAME"];?>.\n\nТема:\n<?=$arParams["TOPIC_TITLE"];?>\n\n\nАвтор: <?=$arParams["AUTHOR"];?>\n\nДата : <?=$arParams["MESSAGE_DATE"];?>\n\nТекст сообщения:\n\n<?=$arParams["MESSAGE_TEXT"];?>\n\n\nАдрес сообщения:\nhttp://<?=$arParams["SERVER_NAME"];?><?=$arParams["PATH2FORUM"];?>\n\n\nСообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(25, '2021-01-22 13:18:01', 'NEW_FORUM_PRIV', 's1', 'Y', '#FROM_EMAIL#', '#TO_EMAIL#', '#SITE_NAME#: [private] #SUBJECT#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВы получили персональное сообщение с форума на сайте #SERVER_NAME#.\n\nТема: #SUBJECT#\n\nАвтор: #FROM_NAME# #FROM_EMAIL#\nДата : #MESSAGE_DATE#\nСообщение:\n\n#MESSAGE#\n\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nВы получили персональное сообщение с форума на сайте <?=$arParams["SERVER_NAME"];?>.\n\nТема: <?=$arParams["SUBJECT"];?>\n\n\nАвтор: <?=$arParams["FROM_NAME"];?> <?=$arParams["FROM_EMAIL"];?>\n\nДата : <?=$arParams["MESSAGE_DATE"];?>\n\nСообщение:\n\n<?=$arParams["MESSAGE"];?>\n\n\nСообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(26, '2021-01-22 13:18:01', 'NEW_FORUM_PRIVATE_MESSAGE', 's1', 'Y', '#FROM_EMAIL#', '#TO_EMAIL#', '#SITE_NAME#: [private] #SUBJECT#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВы получили персональное сообщение с форума на сайте #SERVER_NAME#.\n\nТема: #SUBJECT#\n\nАвтор: #FROM_NAME#\nДата: #MESSAGE_DATE#\nСообщение:\n\n#MESSAGE#\n\nСсылка на сообщение: #MESSAGE_LINK#Сообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nВы получили персональное сообщение с форума на сайте <?=$arParams["SERVER_NAME"];?>.\n\nТема: <?=$arParams["SUBJECT"];?>\n\n\nАвтор: <?=$arParams["FROM_NAME"];?>\n\nДата: <?=$arParams["MESSAGE_DATE"];?>\n\nСообщение:\n\n<?=$arParams["MESSAGE"];?>\n\n\nСсылка на сообщение: <?=$arParams["MESSAGE_LINK"];?>Сообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(27, '2021-01-22 13:18:01', 'EDIT_FORUM_MESSAGE', 's1', 'Y', '#FROM_EMAIL#', '#RECIPIENT#', '#SITE_NAME#: [F] #TOPIC_TITLE# : #FORUM_NAME#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nИзменение сообщения на форуме #SERVER_NAME#.\n\nТема:\n#TOPIC_TITLE#\n\nАвтор: #AUTHOR#\nДата : #MESSAGE_DATE#\nТекст сообщения:\n\n#MESSAGE_TEXT#\n\nАдрес сообщения:\nhttp://#SERVER_NAME##PATH2FORUM#\n\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nИзменение сообщения на форуме <?=$arParams["SERVER_NAME"];?>.\n\nТема:\n<?=$arParams["TOPIC_TITLE"];?>\n\n\nАвтор: <?=$arParams["AUTHOR"];?>\n\nДата : <?=$arParams["MESSAGE_DATE"];?>\n\nТекст сообщения:\n\n<?=$arParams["MESSAGE_TEXT"];?>\n\n\nАдрес сообщения:\nhttp://<?=$arParams["SERVER_NAME"];?><?=$arParams["PATH2FORUM"];?>\n\n\nСообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(28, '2021-01-22 13:18:01', 'FORUM_NEW_MESSAGE_MAIL', 's1', 'Y', '#FROM_EMAIL#', '#RECIPIENT#', '#TOPIC_TITLE#', '#MESSAGE_TEXT#\n\n------------------------------------------  \nВы получили это сообщение, так как выподписаны на форум #FORUM_NAME#.\n\nОтветить на сообщение можно по электронной почте или через форму на сайте:\nhttp://#SERVER_NAME##PATH2FORUM#\n\nНаписать новое сообщение: #FORUM_EMAIL#\n\nАвтор сообщения: #AUTHOR#\n\nСообщение сгенерировано автоматически на сайте #SITE_NAME#.\n', '<?=$arParams["MESSAGE_TEXT"];?>\n\n\n------------------------------------------  \nВы получили это сообщение, так как выподписаны на форум <?=$arParams["FORUM_NAME"];?>.\n\nОтветить на сообщение можно по электронной почте или через форму на сайте:\nhttp://<?=$arParams["SERVER_NAME"];?><?=$arParams["PATH2FORUM"];?>\n\n\nНаписать новое сообщение: <?=$arParams["FORUM_EMAIL"];?>\n\n\nАвтор сообщения: <?=$arParams["AUTHOR"];?>\n\n\nСообщение сгенерировано автоматически на сайте <?=$arParams["SITE_NAME"];?>.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(29, '2021-01-22 13:19:07', 'VIRUS_DETECTED', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Обнаружен вирус', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nЗдравствуйте!\n\nВы получили это сообщение, так как модуль проактивной защиты сервера #SERVER_NAME# обнаружил код, похожий на вирус.\n\n1. Подозрительный код был вырезан из html.\n2. Проверьте журнал вторжений и убедитесь, что код действительно вредоносный, а не является кодом какого-либо счетчика или фреймворка.\n (ссылка: http://#SERVER_NAME#/bitrix/admin/event_log.php?lang=ru&set_filter=Y&find_type=audit_type_id&find_audit_type[]=SECURITY_VIRUS )\n3. В случае, если код не является опасным, добавьте его в исключения на странице настройки антивируса.\n (ссылка: http://#SERVER_NAME#/bitrix/admin/security_antivirus.php?lang=ru&tabControl_active_tab=exceptions )\n4. Если код является вирусным, то необходимо выполнить следующие действия:\n\n а) Смените пароли доступа к сайту у администраторов и ответственных сотрудников.\n б) Смените пароли доступа по ssh и ftp.\n в) Проверьте и вылечите компьютеры администраторов, имевших доступ к сайту по ssh или ftp.\n г) В программах доступа к сайту по ssh и ftp отключите сохранение паролей.\n д) Удалите вредоносный код из зараженных файлов. Например, восстановите поврежденные файлы из самой свежей резервной копии.\n\n---------------------------------------------------------------------\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nЗдравствуйте!\n\nВы получили это сообщение, так как модуль проактивной защиты сервера <?=$arParams["SERVER_NAME"];?> обнаружил код, похожий на вирус.\n\n1. Подозрительный код был вырезан из html.\n2. Проверьте журнал вторжений и убедитесь, что код действительно вредоносный, а не является кодом какого-либо счетчика или фреймворка.\n (ссылка: http://<?=$arParams["SERVER_NAME"];?>/bitrix/admin/event_log.php?lang=ru&set_filter=Y&find_type=audit_type_id&find_audit_type[]=SECURITY_VIRUS )\n3. В случае, если код не является опасным, добавьте его в исключения на странице настройки антивируса.\n (ссылка: http://<?=$arParams["SERVER_NAME"];?>/bitrix/admin/security_antivirus.php?lang=ru&tabControl_active_tab=exceptions )\n4. Если код является вирусным, то необходимо выполнить следующие действия:\n\n а) Смените пароли доступа к сайту у администраторов и ответственных сотрудников.\n б) Смените пароли доступа по ssh и ftp.\n в) Проверьте и вылечите компьютеры администраторов, имевших доступ к сайту по ssh или ftp.\n г) В программах доступа к сайту по ssh и ftp отключите сохранение паролей.\n д) Удалите вредоносный код из зараженных файлов. Например, восстановите поврежденные файлы из самой свежей резервной копии.\n\n---------------------------------------------------------------------\nСообщение сгенерировано автоматически.\n', 'text', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(30, '2021-01-22 13:19:11', 'SUBSCRIBE_CONFIRM', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Подтверждение подписки', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nЗдравствуйте,\n\nВы получили это сообщение, так как ваш адрес был подписан\nна список рассылки сервера #SERVER_NAME#.\n\nДополнительная информация о подписке:\n\nАдрес подписки (email) ............ #EMAIL#\nДата добавления/редактирования .... #DATE_SUBSCR#\n\nВаш код для подтверждения подписки: #CONFIRM_CODE#\n\nДля подтверждения подписки перейдите по следующей ссылке:\nhttp://#SERVER_NAME##SUBSCR_SECTION#subscr_edit.php?ID=#ID#&CONFIRM_CODE=#CONFIRM_CODE#\n\nВы также можете ввести код для подтверждения подписки на странице:\nhttp://#SERVER_NAME##SUBSCR_SECTION#subscr_edit.php?ID=#ID#\n\nВнимание! Вы не будете получать сообщения рассылки, пока не подтвердите\nсвою подписку.\n\n---------------------------------------------------------------------\nСохраните это письмо, так как оно содержит информацию для авторизации.\nИспользуя код подтверждения подписки, вы cможете изменить параметры\nподписки или отписаться от рассылки.\n\nИзменить параметры:\nhttp://#SERVER_NAME##SUBSCR_SECTION#subscr_edit.php?ID=#ID#&CONFIRM_CODE=#CONFIRM_CODE#\n\nОтписаться:\nhttp://#SERVER_NAME##SUBSCR_SECTION#subscr_edit.php?ID=#ID#&CONFIRM_CODE=#CONFIRM_CODE#&action=unsubscribe\n---------------------------------------------------------------------\n\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nЗдравствуйте,\n\nВы получили это сообщение, так как ваш адрес был подписан\nна список рассылки сервера <?=$arParams["SERVER_NAME"];?>.\n\nДополнительная информация о подписке:\n\nАдрес подписки (email) ............ <?=$arParams["EMAIL"];?>\n\nДата добавления/редактирования .... <?=$arParams["DATE_SUBSCR"];?>\n\n\nВаш код для подтверждения подписки: <?=$arParams["CONFIRM_CODE"];?>\n\n\nДля подтверждения подписки перейдите по следующей ссылке:\nhttp://<?=$arParams["SERVER_NAME"];?><?=$arParams["SUBSCR_SECTION"];?>subscr_edit.php?ID=<?=$arParams["ID"];?>&CONFIRM_CODE=<?=$arParams["CONFIRM_CODE"];?>\n\n\nВы также можете ввести код для подтверждения подписки на странице:\nhttp://<?=$arParams["SERVER_NAME"];?><?=$arParams["SUBSCR_SECTION"];?>subscr_edit.php?ID=<?=$arParams["ID"];?>\n\n\nВнимание! Вы не будете получать сообщения рассылки, пока не подтвердите\nсвою подписку.\n\n---------------------------------------------------------------------\nСохраните это письмо, так как оно содержит информацию для авторизации.\nИспользуя код подтверждения подписки, вы cможете изменить параметры\nподписки или отписаться от рассылки.\n\nИзменить параметры:\nhttp://<?=$arParams["SERVER_NAME"];?><?=$arParams["SUBSCR_SECTION"];?>subscr_edit.php?ID=<?=$arParams["ID"];?>&CONFIRM_CODE=<?=$arParams["CONFIRM_CODE"];?>\n\n\nОтписаться:\nhttp://<?=$arParams["SERVER_NAME"];?><?=$arParams["SUBSCR_SECTION"];?>subscr_edit.php?ID=<?=$arParams["ID"];?>&CONFIRM_CODE=<?=$arParams["CONFIRM_CODE"];?>&action=unsubscribe\n---------------------------------------------------------------------\n\nСообщение сгенерировано автоматически.\n', 'text', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(31, '2021-01-22 13:19:22', 'VOTE_FOR', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [V] #VOTE_TITLE#', '#USER_NAME# принял участие в опросе "#VOTE_TITLE#":\n#VOTE_STATISTIC#\n\nhttp://#SERVER_NAME##URL#\nСообщение сгенерировано автоматически.', '<?=$arParams["USER_NAME"];?> принял участие в опросе "<?=$arParams["VOTE_TITLE"];?>":\n<?=$arParams["VOTE_STATISTIC"];?>\n\n\nhttp://<?=$arParams["SERVER_NAME"];?><?=$arParams["URL"];?>\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `b_event_message` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_event_message_attachment
DROP TABLE IF EXISTS `b_event_message_attachment`;
CREATE TABLE IF NOT EXISTS `b_event_message_attachment` (
  `EVENT_MESSAGE_ID` int(18) NOT NULL,
  `FILE_ID` int(18) NOT NULL,
  PRIMARY KEY (`EVENT_MESSAGE_ID`,`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_event_message_attachment: ~0 rows (приблизительно)
DELETE FROM `b_event_message_attachment`;
/*!40000 ALTER TABLE `b_event_message_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_event_message_attachment` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_event_message_site
DROP TABLE IF EXISTS `b_event_message_site`;
CREATE TABLE IF NOT EXISTS `b_event_message_site` (
  `EVENT_MESSAGE_ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`EVENT_MESSAGE_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_event_message_site: ~31 rows (приблизительно)
DELETE FROM `b_event_message_site`;
/*!40000 ALTER TABLE `b_event_message_site` DISABLE KEYS */;
INSERT INTO `b_event_message_site` (`EVENT_MESSAGE_ID`, `SITE_ID`) VALUES
	(1, 's1'),
	(2, 's1'),
	(3, 's1'),
	(4, 's1'),
	(5, 's1'),
	(6, 's1'),
	(7, 's1'),
	(8, 's1'),
	(9, 's1'),
	(10, 's1'),
	(11, 's1'),
	(12, 's1'),
	(13, 's1'),
	(14, 's1'),
	(15, 's1'),
	(16, 's1'),
	(17, 's1'),
	(18, 's1'),
	(19, 's1'),
	(20, 's1'),
	(21, 's1'),
	(22, 's1'),
	(23, 's1'),
	(24, 's1'),
	(25, 's1'),
	(26, 's1'),
	(27, 's1'),
	(28, 's1'),
	(29, 's1'),
	(30, 's1'),
	(31, 's1');
/*!40000 ALTER TABLE `b_event_message_site` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_event_type
DROP TABLE IF EXISTS `b_event_type`;
CREATE TABLE IF NOT EXISTS `b_event_type` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(18) NOT NULL DEFAULT 150,
  `EVENT_TYPE` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'email',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_1` (`EVENT_NAME`,`LID`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_event_type: ~68 rows (приблизительно)
DELETE FROM `b_event_type`;
/*!40000 ALTER TABLE `b_event_type` DISABLE KEYS */;
INSERT INTO `b_event_type` (`ID`, `LID`, `EVENT_NAME`, `NAME`, `DESCRIPTION`, `SORT`, `EVENT_TYPE`) VALUES
	(1, 'ru', 'NEW_USER', 'Зарегистрировался новый пользователь', '\n\n#USER_ID# - ID пользователя\n#LOGIN# - Логин\n#EMAIL# - EMail\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#USER_IP# - IP пользователя\n#USER_HOST# - Хост пользователя\n', 1, 'email'),
	(2, 'ru', 'USER_INFO', 'Информация о пользователе', '\n\n#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#MESSAGE# - Сообщение пользователю\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#CHECKWORD# - Контрольная строка для смены пароля\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - E-Mail пользователя\n', 2, 'email'),
	(3, 'ru', 'NEW_USER_CONFIRM', 'Подтверждение регистрации нового пользователя', '\n\n\n#USER_ID# - ID пользователя\n#LOGIN# - Логин\n#EMAIL# - EMail\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#USER_IP# - IP пользователя\n#USER_HOST# - Хост пользователя\n#CONFIRM_CODE# - Код подтверждения\n', 3, 'email'),
	(4, 'ru', 'USER_PASS_REQUEST', 'Запрос на смену пароля', '\n\n#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#MESSAGE# - Сообщение пользователю\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#CHECKWORD# - Контрольная строка для смены пароля\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - E-Mail пользователя\n', 4, 'email'),
	(5, 'ru', 'USER_PASS_CHANGED', 'Подтверждение смены пароля', '\n\n#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#MESSAGE# - Сообщение пользователю\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#CHECKWORD# - Контрольная строка для смены пароля\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - E-Mail пользователя\n', 5, 'email'),
	(6, 'ru', 'USER_INVITE', 'Приглашение на сайт нового пользователя', '#ID# - ID пользователя\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#EMAIL# - EMail\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#PASSWORD# - пароль пользователя \n#CHECKWORD# - Контрольная строка для смены пароля\n#XML_ID# - ID пользователя для связи с внешними источниками\n', 6, 'email'),
	(7, 'ru', 'FEEDBACK_FORM', 'Отправка сообщения формы уточнения стоимости', '#AUTHOR# - Автор сообщения\r\n#AUTHOR_EMAIL# - Email автора сообщения\r\n#TEXT# - Текст сообщения\r\n#EMAIL_FROM# - Email отправителя письма\r\n#EMAIL_TO# - Email получателя письма', 7, 'email'),
	(8, 'ru', 'MAIN_MAIL_CONFIRM_CODE', 'Подтверждение email-адреса отправителя', '\n\n#EMAIL_TO# - Email-адрес для подтверждения\n#MESSAGE_SUBJECT# - Тема сообщения\n#CONFIRM_CODE# - Код подтверждения', 8, 'email'),
	(9, 'ru', 'EVENT_LOG_NOTIFICATION', 'Оповещение журнала событий', '#EMAIL# - Email получателя\n#ADDITIONAL_TEXT# - Дополнительный текст действия\n#NAME# - Название оповещения\n#AUDIT_TYPE_ID# - Тип события\n#ITEM_ID# - Объект\n#USER_ID# - Пользователь\n#REMOTE_ADDR# - IP-адрес\n#USER_AGENT# - Браузер\n#REQUEST_URI# - Страница\n#EVENT_COUNT# - Количество записей', 9, 'email'),
	(10, 'ru', 'USER_CODE_REQUEST', 'Запрос кода авторизации', '#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#LOGIN# - Логин\n#CHECKWORD# - Код для авторизации\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - Email пользователя\n', 10, 'email'),
	(11, 'ru', 'SMS_USER_CONFIRM_NUMBER', 'Подтверждение номера телефона по СМС', '#USER_PHONE# - номер телефона\n#CODE# - код подтверждения\n', 100, 'sms'),
	(12, 'ru', 'SMS_USER_RESTORE_PASSWORD', 'Восстановление пароля через СМС', '#USER_PHONE# - номер телефона\n#CODE# - код для восстановления\n', 100, 'sms'),
	(13, 'ru', 'SMS_EVENT_LOG_NOTIFICATION', 'Оповещение журнала событий', '#PHONE_NUMBER# - Номер телефона получателя\n#ADDITIONAL_TEXT# - Дополнительный текст действия\n#NAME# - Название оповещения\n#AUDIT_TYPE_ID# - Тип события\n#ITEM_ID# - Объект\n#USER_ID# - Пользователь\n#REMOTE_ADDR# - IP-адрес\n#USER_AGENT# - Браузер\n#REQUEST_URI# - Страница\n#EVENT_COUNT# - Количество записей', 100, 'sms'),
	(14, 'en', 'NEW_USER', 'New user was registered', '\n\n#USER_ID# - User ID\n#LOGIN# - Login\n#EMAIL# - EMail\n#NAME# - Name\n#LAST_NAME# - Last Name\n#USER_IP# - User IP\n#USER_HOST# - User Host\n', 1, 'email'),
	(15, 'en', 'USER_INFO', 'Account Information', '\n\n#USER_ID# - User ID\n#STATUS# - Account status\n#MESSAGE# - Message for user\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#CHECKWORD# - Check string for password change\n#NAME# - Name\n#LAST_NAME# - Last Name\n#EMAIL# - User E-Mail\n', 2, 'email'),
	(16, 'en', 'NEW_USER_CONFIRM', 'New user registration confirmation', '\n\n#USER_ID# - User ID\n#LOGIN# - Login\n#EMAIL# - E-mail\n#NAME# - First name\n#LAST_NAME# - Last name\n#USER_IP# - User IP\n#USER_HOST# - User host\n#CONFIRM_CODE# - Confirmation code\n', 3, 'email'),
	(17, 'en', 'USER_PASS_REQUEST', 'Password Change Request', '\n\n#USER_ID# - User ID\n#STATUS# - Account status\n#MESSAGE# - Message for user\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#CHECKWORD# - Check string for password change\n#NAME# - Name\n#LAST_NAME# - Last Name\n#EMAIL# - User E-Mail\n', 4, 'email'),
	(18, 'en', 'USER_PASS_CHANGED', 'Password Change Confirmation', '\n\n#USER_ID# - User ID\n#STATUS# - Account status\n#MESSAGE# - Message for user\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#CHECKWORD# - Check string for password change\n#NAME# - Name\n#LAST_NAME# - Last Name\n#EMAIL# - User E-Mail\n', 5, 'email'),
	(19, 'en', 'USER_INVITE', 'Invitation of a new site user', '#ID# - User ID\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#EMAIL# - EMail\n#NAME# - Name\n#LAST_NAME# - Last Name\n#PASSWORD# - User password \n#CHECKWORD# - Password check string\n#XML_ID# - User ID to link with external data sources\n\n', 6, 'email'),
	(20, 'en', 'FEEDBACK_FORM', 'Sending a message using a feedback form', '#AUTHOR# - Message author\r\n#AUTHOR_EMAIL# - Author\'s e-mail address\r\n#TEXT# - Message text\r\n#EMAIL_FROM# - Sender\'s e-mail address\r\n#EMAIL_TO# - Recipient\'s e-mail address', 7, 'email'),
	(21, 'en', 'MAIN_MAIL_CONFIRM_CODE', 'Confirm sender\'s email address', '\n\n#EMAIL_TO# - confirmation email address\n#MESSAGE_SUBJECT# - Message subject\n#CONFIRM_CODE# - Confirmation code', 8, 'email'),
	(22, 'en', 'EVENT_LOG_NOTIFICATION', 'Event log notification', '#EMAIL# - Recipient email\n#ADDITIONAL_TEXT# - Action additional text\n#NAME# - Notification name\n#AUDIT_TYPE_ID# - Event type\n#ITEM_ID# - Object\n#USER_ID# - User\n#REMOTE_ADDR# - IP address\n#USER_AGENT# - Browser\n#REQUEST_URI# - Page URL\n#EVENT_COUNT# - Number of events', 9, 'email'),
	(23, 'en', 'USER_CODE_REQUEST', 'Request for verification code', '#USER_ID# - user ID\n#STATUS# - Login status\n#LOGIN# - Login\n#CHECKWORD# - Verification code\n#NAME# - First name\n#LAST_NAME# - Last name\n#EMAIL# - User email\n', 10, 'email'),
	(24, 'en', 'SMS_USER_CONFIRM_NUMBER', 'Verify phone number using SMS', '#USER_PHONE# - phone number\n#CODE# - confirmation code', 100, 'sms'),
	(25, 'en', 'SMS_USER_RESTORE_PASSWORD', 'Recover password using SMS', '#USER_PHONE# - phone number\n#CODE# - recovery confirmation code', 100, 'sms'),
	(26, 'en', 'SMS_EVENT_LOG_NOTIFICATION', 'Event log notification', '#PHONE_NUMBER# - Recipient phone number\n#ADDITIONAL_TEXT# - Action additional text\n#NAME# - Notification name\n#AUDIT_TYPE_ID# - Event type\n#ITEM_ID# - Object\n#USER_ID# - User\n#REMOTE_ADDR# - IP address\n#USER_AGENT# - Browser\n#REQUEST_URI# - Page URL\n#EVENT_COUNT# - Number of events', 100, 'sms'),
	(27, 'ru', 'NEW_BLOG_MESSAGE', 'Новое сообщение в блоге', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#MESSAGE_TITLE# - Тема сообщения\n#MESSAGE_TEXT# - Текст сообщения\n#MESSAGE_DATE# - Дата сообщения\n#MESSAGE_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма', 100, 'email'),
	(28, 'ru', 'NEW_BLOG_COMMENT', 'Новый комментарий в блоге', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#MESSAGE_TITLE# - Тема сообщения\n#COMMENT_TITLE# - Заголовок комментария\n#COMMENT_TEXT# - Текст комментария\n#COMMENT_DATE# - Текст комментария\n#COMMENT_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма', 100, 'email'),
	(29, 'ru', 'NEW_BLOG_COMMENT2COMMENT', 'Новый комментарий на ваш комментарий в блоге', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#MESSAGE_TITLE# - Тема сообщения\n#COMMENT_TITLE# - Заголовок комментария\n#COMMENT_TEXT# - Текст комментария\n#COMMENT_DATE# - Текст комментария\n#COMMENT_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма', 100, 'email'),
	(30, 'ru', 'NEW_BLOG_COMMENT_WITHOUT_TITLE', 'Новый комментарий в блоге (без темы)', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#MESSAGE_TITLE# - Тема сообщения\n#COMMENT_TEXT# - Текст комментария\n#COMMENT_DATE# - Текст комментария\n#COMMENT_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма', 100, 'email'),
	(31, 'ru', 'NEW_BLOG_COMMENT2COMMENT_WITHOUT_TITLE', 'Новый комментарий на ваш комментарий в блоге (без темы)', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#COMMENT_TITLE# - Заголовок комментария\n#COMMENT_TEXT# - Текст комментария\n#COMMENT_DATE# - Текст комментария\n#COMMENT_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма', 100, 'email'),
	(32, 'ru', 'BLOG_YOUR_BLOG_TO_USER', 'Ваш блог был добавлен в друзья', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#BLOG_ADR# - Адрес блога\n#USER_ID# - ID пользователя\n#USER# - Пользователь\n#USER_URL# - Адрес пользователя\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма\n', 100, 'email'),
	(33, 'ru', 'BLOG_YOU_TO_BLOG', 'Вы были добавлены в друзья блога', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#BLOG_ADR# - Адрес блога\n#USER_ID# - ID пользователя\n#USER# - Пользователь\n#USER_URL# - Адрес пользователя\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма\n', 100, 'email'),
	(34, 'ru', 'BLOG_BLOG_TO_YOU', 'К вам в друзья был добавлен блог', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#BLOG_ADR# - Адрес блога\n#USER_ID# - ID пользователя\n#USER# - Пользователь\n#USER_URL# - Адрес пользователя\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма\n', 100, 'email'),
	(35, 'ru', 'BLOG_USER_TO_YOUR_BLOG', 'В ваш блог был добавлен друг', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#BLOG_ADR# - Адрес блога\n#USER_ID# - ID пользователя\n#USER# - Пользователь\n#USER_URL# - Адрес пользователя\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма\n', 100, 'email'),
	(36, 'ru', 'BLOG_SONET_NEW_POST', 'Добавлено новое сообщение', '#EMAIL_TO# - Email получателя письма\n#POST_ID# - ID сообщения\n#RECIPIENT_ID# - ID получателя\n#URL_ID# - URL страницы сообщения\n', 100, 'email'),
	(37, 'ru', 'BLOG_SONET_NEW_COMMENT', 'Добавлен новый комментарий', '#EMAIL_TO# - Email получателя письма\n#COMMENT_ID# - ID комментария\n#POST_ID# - ID сообщения\n#RECIPIENT_ID# - ID получателя\n#URL_ID# - URL страницы сообщения\n', 100, 'email'),
	(38, 'ru', 'BLOG_SONET_POST_SHARE', 'Добавлен новый получатель сообщения', '#EMAIL_TO# - Email получателя письма\n#POST_ID# - ID сообщения\n#RECIPIENT_ID# - ID получателя\n#URL_ID# - URL страницы сообщения\n', 100, 'email'),
	(39, 'ru', 'BLOG_POST_BROADCAST', 'Добавлено новое сообщение', '\n#MESSAGE_TITLE# - Тема сообщения\n#MESSAGE_TEXT# - Текст сообщения\n#MESSAGE_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_TO# - Email получателя письма', 100, 'email'),
	(40, 'en', 'NEW_BLOG_MESSAGE', 'New blog message', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog title\n#BLOG_URL# - Blog url\n#MESSAGE_TITLE# - Message title\n#MESSAGE_TEXT# - Message text\n#MESSAGE_DATE# - Message date\n#MESSAGE_PATH# - URL to message\n#AUTHOR# - Message author\n#EMAIL_FROM# - Sender email\n#EMAIL_TO# - Recipient email', 100, 'email'),
	(41, 'en', 'NEW_BLOG_COMMENT', 'New comment in blog', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog title\n#BLOG_URL# - Blog url\n#MESSAGE_TITLE# - Message title\n#COMMENT_TITLE# - Comment title\n#COMMENT_TEXT# - Comment text\n#COMMENT_DATE# - Comment date\n#COMMENT_PATH# - Comment URL\n#AUTHOR# - Comment author\n#EMAIL_FROM# - Sender email\n#EMAIL_TO# - Recipient email', 100, 'email'),
	(42, 'en', 'NEW_BLOG_COMMENT2COMMENT', 'New comment for your in blog', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog title\n#BLOG_URL# - Blog url\n#MESSAGE_TITLE# - Message title\n#COMMENT_TITLE# - Comment title\n#COMMENT_TEXT# - Comment text\n#COMMENT_DATE# - Comment date\n#COMMENT_PATH# - Comment URL\n#AUTHOR# - Comment author\n#EMAIL_FROM# - Sender email\n#EMAIL_TO# - Recipient email', 100, 'email'),
	(43, 'en', 'NEW_BLOG_COMMENT_WITHOUT_TITLE', 'New comment in blog (without subject)', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog title\n#BLOG_URL# - Blog url\n#MESSAGE_TITLE# - Message title\n#COMMENT_TEXT# - Comment text\n#COMMENT_DATE# - Comment date\n#COMMENT_PATH# - Comment URL\n#AUTHOR# - Comment author\n#EMAIL_FROM# - Sender email\n#EMAIL_TO# - Recipient email', 100, 'email'),
	(44, 'en', 'NEW_BLOG_COMMENT2COMMENT_WITHOUT_TITLE', 'New comment for your in blog (without subject)', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog title\n#BLOG_URL# - Blog url\n#MESSAGE_TITLE# - Message title\n#COMMENT_TEXT# - Comment text\n#COMMENT_DATE# - Comment date\n#COMMENT_PATH# - Comment URL\n#AUTHOR# - Comment author\n#EMAIL_FROM# - Sender email\n#EMAIL_TO# - Recipient email', 100, 'email'),
	(45, 'en', 'BLOG_YOUR_BLOG_TO_USER', 'Your blog has been added to friends', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog name\n#BLOG_URL# - Blog name, Latin letters only\n#BLOG_ADR# - Blog address\n#USER_ID# - User ID\n#USER# - User\n#USER_URL# - User URL\n#EMAIL_FROM# - Sender E-mail\n#EMAIL_TO# - Recipient E-mail', 100, 'email'),
	(46, 'en', 'BLOG_YOU_TO_BLOG', 'You have been added to blog friends', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog name\n#BLOG_URL# - Blog name, Latin letters only\n#BLOG_ADR# - Blog address\n#USER_ID# - User ID\n#USER# - User\n#USER_URL# - User URL\n#EMAIL_FROM# - Sender E-mail\n#EMAIL_TO# - Recipient E-mail', 100, 'email'),
	(47, 'en', 'BLOG_BLOG_TO_YOU', 'A blog has been added to your friends', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog name\n#BLOG_URL# - Blog name, Latin letters only\n#BLOG_ADR# - Blog address\n#USER_ID# - User ID\n#USER# - User\n#USER_URL# - User URL\n#EMAIL_FROM# - Sender E-mail\n#EMAIL_TO# - Recipient E-mail', 100, 'email'),
	(48, 'en', 'BLOG_USER_TO_YOUR_BLOG', 'A friend has been added to your blog', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog name\n#BLOG_URL# - Blog name, Latin letters only\n#BLOG_ADR# - Blog address\n#USER_ID# - User ID\n#USER# - User\n#USER_URL# - User URL\n#EMAIL_FROM# - Sender E-mail\n#EMAIL_TO# - Recipient E-mail', 100, 'email'),
	(49, 'en', 'BLOG_SONET_NEW_POST', 'New post added', '#EMAIL_TO# - Recipient email\n#POST_ID# - Post ID\n#URL_ID# - Post URL', 100, 'email'),
	(50, 'en', 'BLOG_SONET_NEW_COMMENT', 'Comment added', '#EMAIL_TO# - Recipient email\n#COMMENT_ID# - Comment ID\n#POST_ID# - Post ID\n#URL_ID# - Post URL', 100, 'email'),
	(51, 'en', 'BLOG_SONET_POST_SHARE', 'New recipient added', '#EMAIL_TO# - Recipient email\n#POST_ID# - Post ID\n#URL_ID# - Post URL', 100, 'email'),
	(52, 'en', 'BLOG_POST_BROADCAST', 'New post added', '\n#MESSAGE_TITLE# - Post subject\n#MESSAGE_TEXT# - Post text \n#MESSAGE_PATH# - Post URL\n#AUTHOR# - Post author\n#EMAIL_TO# - E-mail recipient', 100, 'email'),
	(53, 'ru', 'NEW_FORUM_MESSAGE', 'Новое сообщение на форуме', '\n			#FORUM_ID# - ID форума\n			#FORUM_NAME# - Название форума\n			#TOPIC_ID# - ID темы\n			#MESSAGE_ID# - ID сообщения\n			#TOPIC_TITLE# - Тема сообщения\n			#MESSAGE_TEXT# - Текст сообщения\n			#MESSAGE_DATE# - Дата сообщения\n			#AUTHOR# - Автор сообщения\n			#RECIPIENT# - Получатель сообщения\n			#TAPPROVED# - Тема сообщения показывается\n			#MAPPROVED# - Тело сообщения показывается\n			#PATH2FORUM# - Адрес сообщения\n			#FROM_EMAIL# - E-Mail для поля From письма', 100, 'email'),
	(54, 'ru', 'NEW_FORUM_PRIV', 'Приватное письмо посетителю форума', '\n			#FROM_NAME# - Автор сообщения\n			#FROM_EMAIL# - E-Mail автора сообщения\n			#TO_NAME# - Имя получателя сообщения\n			#TO_EMAIL# - E-Mail получателя сообщения\n			#SUBJECT# - Тема сообщения\n			#MESSAGE# - Тело сообщения\n			#MESSAGE_DATE# - Дата сообщения', 100, 'email'),
	(55, 'ru', 'NEW_FORUM_PRIVATE_MESSAGE', 'Приватное сообщение', '\n			#FROM_NAME# - Имя автора сообщения\n			#FROM_USER_ID# - ID автора сообщения\n			#FROM_EMAIL# - E-Mail автора сообщения\n			#TO_NAME# - Имя получателя сообщения\n			#TO_USER_ID# - ID получателя сообщения\n			#TO_EMAIL# - E-Mail получателя сообщения\n			#SUBJECT# - Тема сообщения\n			#MESSAGE# - Текст сообщения\n			#MESSAGE_DATE# - Дата сообщения\n			#MESSAGE_LINK# - Ссылка на сообщение', 100, 'email'),
	(56, 'ru', 'EDIT_FORUM_MESSAGE', 'Изменение сообщения на форуме', '\n			#FORUM_ID# - ID форума\n			#FORUM_NAME# - Название форума\n			#TOPIC_ID# - ID темы\n			#MESSAGE_ID# - ID сообщения\n			#TOPIC_TITLE# - Тема сообщения\n			#MESSAGE_TEXT# - Текст сообщения\n			#MESSAGE_DATE# - Дата сообщения\n			#AUTHOR# - Автор сообщения\n			#RECIPIENT# - Получатель сообщения\n			#TAPPROVED# - Тема сообщения показывается\n			#MAPPROVED# - Тело сообщения показывается\n			#PATH2FORUM# - Адрес сообщения\n			#FROM_EMAIL# - E-Mail для поля From письма', 100, 'email'),
	(57, 'en', 'NEW_FORUM_MESSAGE', 'New forum message', '\n			#FORUM_ID# - Forum ID\n			#FORUM_NAME# - Forum name\n			#TOPIC_ID# - Topic ID\n			#MESSAGE_ID# - Message ID\n			#TOPIC_TITLE# - Topic title\n			#MESSAGE_TEXT# - Message text\n			#MESSAGE_DATE# - Message date\n			#AUTHOR# - Message author\n			#RECIPIENT# - E-Mail recipient\n			#TAPPROVED# - Message topic is approved\n			#MAPPROVED# - Message is approved\n			#PATH2FORUM# - Message Url\n			#FROM_EMAIL# - E-Mail for From field of the EMail', 100, 'email'),
	(58, 'en', 'NEW_FORUM_PRIV', 'Private message for forum user', '\n			#FROM_NAME# - Name of the sender\n			#FROM_EMAIL# - E-Mail of the sender\n			#TO_NAME# - Name of recipient\n			#TO_EMAIL# - E-Mail of recipient\n			#SUBJECT# - Topic\n			#MESSAGE# - Message\n			#MESSAGE_DATE# - Date', 100, 'email'),
	(59, 'en', 'NEW_FORUM_PRIVATE_MESSAGE', 'Private message for forum user', '\n			#FROM_NAME# - Name of the sender\n			#FROM_USER_ID# - ID of the sender\n			#FROM_EMAIL# - E-Mail of the sender\n			#TO_NAME# - Name of recipient\n			#TO_USER_ID# - ID of recipient\n			#TO_EMAIL# - E-Mail of recipient\n			#SUBJECT# - Topic\n			#MESSAGE# - Message\n			#MESSAGE_DATE# - Date\n			#MESSAGE_LINK# - Link to message', 100, 'email'),
	(60, 'en', 'EDIT_FORUM_MESSAGE', 'Changing forum message', '\n			#FORUM_ID# - Forum ID\n			#FORUM_NAME# - Forum name\n			#TOPIC_ID# - Topic ID\n			#MESSAGE_ID# - Message ID\n			#TOPIC_TITLE# - Topic title\n			#MESSAGE_TEXT# - Message text\n			#MESSAGE_DATE# - Message date\n			#AUTHOR# - Message author\n			#RECIPIENT# - E-Mail recipient\n			#TAPPROVED# - Message topic is approved\n			#MAPPROVED# - Message is approved\n			#PATH2FORUM# - Message Url\n			#FROM_EMAIL# - E-Mail for From field of the EMail', 100, 'email'),
	(61, 'ru', 'FORUM_NEW_MESSAGE_MAIL', 'Новое сообщение на форуме в режиме общения по E-Mail', '#FORUM_NAME# - Название форума\n#AUTHOR# - Автор сообщения\n#FROM_EMAIL# - E-Mail для поля From письма\n#RECIPIENT# - Получатель сообщения\n#TOPIC_TITLE# - Тема сообщения\n#MESSAGE_TEXT# - Текст сообщения\n#PATH2FORUM# - Адрес сообщения\n#MESSAGE_DATE# - Дата сообщения\n#FORUM_EMAIL# - Е-Mail адрес для добавления сообщений на форум\n#FORUM_ID# - ID форума\n#TOPIC_ID# - ID темы \n#MESSAGE_ID# - ID сообщения\n#TAPPROVED# - Тема опубликована\n#MAPPROVED# - Сообщение опубликовано\n', 100, 'email'),
	(62, 'en', 'FORUM_NEW_MESSAGE_MAIL', 'New message at the forum (e-mail messaging mode)', '#FORUM_NAME# - Forum name\n#AUTHOR# - Message author\n#FROM_EMAIL# - E-Mail in the &amp;From&amp; field\n#RECIPIENT# - Message recipient\n#TOPIC_TITLE# - Message subject\n#MESSAGE_TEXT# - Message text\n#PATH2FORUM# - Message URL\n#MESSAGE_DATE# - Message date\n#FORUM_EMAIL# - E-Mail to add messages to the forum \n#FORUM_ID# - Forum ID\n#TOPIC_ID# - Topic ID \n#MESSAGE_ID# - Message ID\n#TAPPROVED# - Topic approved and published\n#MAPPROVED# - Message approved and published\n', 100, 'email'),
	(63, 'ru', 'VIRUS_DETECTED', 'Обнаружен вирус', '#EMAIL# - E-Mail администратора сайта (из настроек главного модуля)', 100, 'email'),
	(64, 'en', 'VIRUS_DETECTED', 'Virus detected', '#EMAIL# - Site administrator\'s e-mail address (from the Kernel module settings)', 100, 'email'),
	(65, 'ru', 'SUBSCRIBE_CONFIRM', 'Подтверждение подписки', '#ID# - идентификатор подписки\n#EMAIL# - адрес подписки\n#CONFIRM_CODE# - код подтверждения\n#SUBSCR_SECTION# - раздел, где находится страница редактирования подписки (задается в настройках)\n#USER_NAME# - имя подписчика (может отсутствовать)\n#DATE_SUBSCR# - дата добавления/изменения адреса\n', 100, 'email'),
	(66, 'en', 'SUBSCRIBE_CONFIRM', 'Confirmation of subscription', '#ID# - subscription ID\n#EMAIL# - subscription email\n#CONFIRM_CODE# - confirmation code\n#SUBSCR_SECTION# - section with subscription edit page (specifies in the settings)\n#USER_NAME# - subscriber\'s name (optional)\n#DATE_SUBSCR# - date of adding/change of address\n', 100, 'email'),
	(67, 'ru', 'VOTE_FOR', 'Новый голос', '#ID# - ID результата голосования\n#TIME# - время голосования\n#VOTE_TITLE# - наименование опроса\n#VOTE_DESCRIPTION# - описание опроса\n#VOTE_ID# - ID опроса\n#CHANNEL# - наименование группы опроса\n#CHANNEL_ID# - ID группы опроса\n#VOTER_ID# - ID проголосовавшего посетителя\n#USER_NAME# - ФИО пользователя\n#LOGIN# - логин\n#USER_ID# - ID пользователя\n#STAT_GUEST_ID# - ID посетителя модуля статистики\n#SESSION_ID# - ID сессии модуля статистики\n#IP# - IP адрес\n#VOTE_STATISTIC# - Сводная статистика опроса типа ( - Вопрос - Ответ )\n#URL# - Путь к опросу\n', 100, 'email'),
	(68, 'en', 'VOTE_FOR', 'New vote', '#ID# - Vote result ID\n#TIME# - Time of vote\n#VOTE_TITLE# - Poll name\n#VOTE_DESCRIPTION# - Poll description\n#VOTE_ID# - Poll ID\n#CHANNEL# - Poll group name\n#CHANNEL_ID# - Poll group ID\n#VOTER_ID# - Voter\'s user ID\n#USER_NAME# - User full name\n#LOGIN# - login\n#USER_ID# - User ID\n#STAT_GUEST_ID# - Visitor ID in web analytics module\n#SESSION_ID# - Session ID in web analytics module\n#IP# - IP address\n#VOTE_STATISTIC# - Summary statistics of this poll type ( - Question - Answer)\n#URL# - Poll URL', 100, 'email');
/*!40000 ALTER TABLE `b_event_type` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_favorite
DROP TABLE IF EXISTS `b_favorite`;
CREATE TABLE IF NOT EXISTS `b_favorite` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `C_SORT` int(18) NOT NULL DEFAULT 100,
  `MODIFIED_BY` int(18) DEFAULT NULL,
  `CREATED_BY` int(18) DEFAULT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMMENTS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `CODE_ID` int(18) DEFAULT NULL,
  `COMMON` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `MENU_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_favorite: ~0 rows (приблизительно)
DELETE FROM `b_favorite`;
/*!40000 ALTER TABLE `b_favorite` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_favorite` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_file
DROP TABLE IF EXISTS `b_file`;
CREATE TABLE IF NOT EXISTS `b_file` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HEIGHT` int(18) DEFAULT NULL,
  `WIDTH` int(18) DEFAULT NULL,
  `FILE_SIZE` bigint(20) DEFAULT NULL,
  `CONTENT_TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'IMAGE',
  `SUBDIR` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ORIGINAL_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HANDLER_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXTERNAL_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FILE_EXTERNAL_ID` (`EXTERNAL_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_file: ~13 rows (приблизительно)
DELETE FROM `b_file`;
/*!40000 ALTER TABLE `b_file` DISABLE KEYS */;
INSERT INTO `b_file` (`ID`, `TIMESTAMP_X`, `MODULE_ID`, `HEIGHT`, `WIDTH`, `FILE_SIZE`, `CONTENT_TYPE`, `SUBDIR`, `FILE_NAME`, `ORIGINAL_NAME`, `DESCRIPTION`, `HANDLER_ID`, `EXTERNAL_ID`) VALUES
	(1, '2021-01-24 12:33:50', 'iblock', 69, 70, 2598, 'image/png', 'iblock/559', '559098ecbcbbdb393c65bc2ea498b9c9.png', 'why1.png', '', NULL, 'c881ec036addfe5eb97bb54e9c449467'),
	(2, '2021-01-24 12:34:23', 'iblock', 43, 70, 2074, 'image/png', 'iblock/2fc', '2fc10c49b1f99f453b4199b9b197242a.png', 'why2.png', '', NULL, 'a2e47cca5aa63affa46d99bf1bf73ce6'),
	(3, '2021-01-24 13:01:02', 'iblock', 841, 595, 72315, 'image/jpeg', 'iblock/e38', 'e3882dee072be700c5f489c7f3be6d38.jpg', 'r1.jpg', '', NULL, 'fe17065397161c9f61866391c56bd49f'),
	(4, '2021-01-24 13:01:30', 'iblock', 1762, 1244, 353659, 'image/jpeg', 'iblock/f18', 'f1819712b03285aa93c64d493da7d618.jpg', 'r2.jpg', '', NULL, '535227ffea1e911f52403a2a178627bb'),
	(5, '2021-01-24 13:02:16', 'iblock', 841, 595, 72315, 'image/jpeg', 'iblock/e38', 'e3882dee072be700c5f489c7f3be6d38.jpg', 'r1.jpg', '', NULL, 'a8d380439bf3a1ef4c588af909f981bd'),
	(6, '2021-01-24 13:02:34', 'iblock', 267, 189, 5429, 'image/png', 'iblock/b35', 'b35253b04bc53b289135d4f211471d2c.png', 'r1.png', '', NULL, '0d877e4911d5c0b55cf4fa13c23fc0ac'),
	(7, '2021-01-24 13:56:04', 'iblock', 70, 58, 2362, 'image/png', 'iblock/ce9', 'ce95985192d86d9796da3eb086283abc.png', 'why3.png', '', NULL, '5b87e6dfaf151357798404cafcbb5635'),
	(8, '2021-01-24 13:56:30', 'iblock', 65, 70, 2635, 'image/png', 'iblock/9f2', '9f26892f8fd80f79ef462bd73a87b104.png', 'why4.png', '', NULL, '942ddfcb3d93310ecfba88619d175f83'),
	(9, '2021-01-24 13:56:57', 'iblock', 70, 53, 2074, 'image/png', 'iblock/73c', '73ce0a4dafb11edf4bb74d5c17ba43a5.png', 'why5.png', '', NULL, '439740e60d4564809474e12dbb61f486'),
	(10, '2021-01-24 14:28:51', 'iblock', 60, 55, 2151, 'image/png', 'iblock/9b3', '9b3d7e60fc36af0d9e4512e972a1379d.png', 'c1.png', '', NULL, 'b204a75a601c9703cf632920a1b3b1eb'),
	(11, '2021-01-24 14:28:30', 'iblock', 60, 60, 3015, 'image/png', 'iblock/9e0', '9e0043ce59d329face0968ea89804994.png', 'c2.png', '', NULL, '0d3e4347bc2f0d8f7181d1262eb9198d'),
	(12, '2021-01-24 14:26:37', 'iblock', 50, 50, 2071, 'image/png', 'iblock/fe7', 'fe75e92bc289cf4984614f2305849ce8.png', 'c3.png', '', NULL, '23e89197551ebce58827eeba3fa17428'),
	(14, '2021-01-24 14:36:29', 'iblock', 45, 61, 2287, 'image/png', 'iblock/295', '2956aca5d251fa8f6280c496ff4bf6be.png', 'c4.png', '', NULL, '1e1a135e1da13c22f213742d778e9d7c');
/*!40000 ALTER TABLE `b_file` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_file_duplicate
DROP TABLE IF EXISTS `b_file_duplicate`;
CREATE TABLE IF NOT EXISTS `b_file_duplicate` (
  `DUPLICATE_ID` int(11) NOT NULL,
  `ORIGINAL_ID` int(11) NOT NULL,
  `COUNTER` int(11) NOT NULL DEFAULT 1,
  `ORIGINAL_DELETED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`DUPLICATE_ID`,`ORIGINAL_ID`),
  KEY `ix_file_duplicate_duplicate` (`ORIGINAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_file_duplicate: ~1 rows (приблизительно)
DELETE FROM `b_file_duplicate`;
/*!40000 ALTER TABLE `b_file_duplicate` DISABLE KEYS */;
INSERT INTO `b_file_duplicate` (`DUPLICATE_ID`, `ORIGINAL_ID`, `COUNTER`, `ORIGINAL_DELETED`) VALUES
	(5, 3, 1, 'N');
/*!40000 ALTER TABLE `b_file_duplicate` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_file_hash
DROP TABLE IF EXISTS `b_file_hash`;
CREATE TABLE IF NOT EXISTS `b_file_hash` (
  `FILE_ID` int(11) NOT NULL,
  `FILE_SIZE` bigint(20) NOT NULL,
  `FILE_HASH` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`FILE_ID`),
  KEY `ix_file_hash_size_hash` (`FILE_SIZE`,`FILE_HASH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_file_hash: ~12 rows (приблизительно)
DELETE FROM `b_file_hash`;
/*!40000 ALTER TABLE `b_file_hash` DISABLE KEYS */;
INSERT INTO `b_file_hash` (`FILE_ID`, `FILE_SIZE`, `FILE_HASH`) VALUES
	(12, 2071, 'c69b87660df4ea51c40f11b69a9ff0b9'),
	(9, 2074, '3e39528e15d8f88713ed8aebae998820'),
	(2, 2074, 'b329929f49ef272975e598cbed711900'),
	(10, 2151, 'f72a0b319d1250530ac027e854f922eb'),
	(14, 2287, '99397f1a443375e1cb12395ae789f96e'),
	(7, 2362, 'd2fab8432497a1a03f273e04f1a9f72b'),
	(1, 2598, '3201db89ada47849802e9a689adb45d3'),
	(8, 2635, '21dd0bf040267dcbd7c964f784a02c7e'),
	(11, 3015, '8a4a80f6b6aa4acf81a835130f4fe91e'),
	(6, 5429, 'cb7023e6312d2ed065a751473f0f323f'),
	(3, 72315, '5f905ef533b5d118011dff14eced1cc8'),
	(4, 353659, '685514477e3dc37ca06cfdea729c1887');
/*!40000 ALTER TABLE `b_file_hash` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_file_preview
DROP TABLE IF EXISTS `b_file_preview`;
CREATE TABLE IF NOT EXISTS `b_file_preview` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FILE_ID` int(18) NOT NULL,
  `PREVIEW_ID` int(18) DEFAULT NULL,
  `PREVIEW_IMAGE_ID` int(18) DEFAULT NULL,
  `CREATED_AT` datetime NOT NULL,
  `TOUCHED_AT` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FILE_PL_TOUCH` (`TOUCHED_AT`),
  KEY `IX_B_FILE_PL_FILE` (`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_file_preview: ~0 rows (приблизительно)
DELETE FROM `b_file_preview`;
/*!40000 ALTER TABLE `b_file_preview` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_file_preview` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_file_search
DROP TABLE IF EXISTS `b_file_search`;
CREATE TABLE IF NOT EXISTS `b_file_search` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SESS_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `F_PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `B_DIR` int(11) NOT NULL DEFAULT 0,
  `F_SIZE` int(11) NOT NULL DEFAULT 0,
  `F_TIME` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_file_search: ~0 rows (приблизительно)
DELETE FROM `b_file_search`;
/*!40000 ALTER TABLE `b_file_search` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_file_search` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_filters
DROP TABLE IF EXISTS `b_filters`;
CREATE TABLE IF NOT EXISTS `b_filters` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(18) DEFAULT NULL,
  `FILTER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FIELDS` text COLLATE utf8_unicode_ci NOT NULL,
  `COMMON` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRESET` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRESET_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(18) DEFAULT NULL,
  `SORT_FIELD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_filters: ~0 rows (приблизительно)
DELETE FROM `b_filters`;
/*!40000 ALTER TABLE `b_filters` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_filters` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_finder_dest
DROP TABLE IF EXISTS `b_finder_dest`;
CREATE TABLE IF NOT EXISTS `b_finder_dest` (
  `USER_ID` int(11) NOT NULL,
  `CODE` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `CODE_USER_ID` int(11) DEFAULT NULL,
  `CODE_TYPE` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTEXT` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_USE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`USER_ID`,`CODE`,`CONTEXT`),
  KEY `IX_FINDER_DEST` (`CODE_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_finder_dest: ~0 rows (приблизительно)
DELETE FROM `b_finder_dest`;
/*!40000 ALTER TABLE `b_finder_dest` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_finder_dest` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_form
DROP TABLE IF EXISTS `b_form`;
CREATE TABLE IF NOT EXISTS `b_form` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `BUTTON` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `C_SORT` int(18) DEFAULT 100,
  `FIRST_SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IMAGE_ID` int(18) DEFAULT NULL,
  `USE_CAPTCHA` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `DESCRIPTION` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'html',
  `FORM_TEMPLATE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `USE_DEFAULT_TEMPLATE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `SHOW_TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MAIL_EVENT_TYPE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SHOW_RESULT_TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRINT_RESULT_TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EDIT_RESULT_TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILTER_RESULT_TEMPLATE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `TABLE_RESULT_TEMPLATE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `USE_RESTRICTIONS` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `RESTRICT_USER` int(5) DEFAULT 0,
  `RESTRICT_TIME` int(10) DEFAULT 0,
  `RESTRICT_STATUS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STAT_EVENT1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STAT_EVENT2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STAT_EVENT3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_SID` (`SID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_form: ~0 rows (приблизительно)
DELETE FROM `b_form`;
/*!40000 ALTER TABLE `b_form` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_form_2_group
DROP TABLE IF EXISTS `b_form_2_group`;
CREATE TABLE IF NOT EXISTS `b_form_2_group` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORM_ID` int(18) NOT NULL DEFAULT 0,
  `GROUP_ID` int(18) NOT NULL DEFAULT 0,
  `PERMISSION` int(5) NOT NULL DEFAULT 1,
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_ID` (`FORM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_form_2_group: ~0 rows (приблизительно)
DELETE FROM `b_form_2_group`;
/*!40000 ALTER TABLE `b_form_2_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_2_group` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_form_2_mail_template
DROP TABLE IF EXISTS `b_form_2_mail_template`;
CREATE TABLE IF NOT EXISTS `b_form_2_mail_template` (
  `FORM_ID` int(18) NOT NULL DEFAULT 0,
  `MAIL_TEMPLATE_ID` int(18) NOT NULL DEFAULT 0,
  PRIMARY KEY (`FORM_ID`,`MAIL_TEMPLATE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_form_2_mail_template: ~0 rows (приблизительно)
DELETE FROM `b_form_2_mail_template`;
/*!40000 ALTER TABLE `b_form_2_mail_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_2_mail_template` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_form_2_site
DROP TABLE IF EXISTS `b_form_2_site`;
CREATE TABLE IF NOT EXISTS `b_form_2_site` (
  `FORM_ID` int(18) NOT NULL DEFAULT 0,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`FORM_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_form_2_site: ~0 rows (приблизительно)
DELETE FROM `b_form_2_site`;
/*!40000 ALTER TABLE `b_form_2_site` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_2_site` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_form_answer
DROP TABLE IF EXISTS `b_form_answer`;
CREATE TABLE IF NOT EXISTS `b_form_answer` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FIELD_ID` int(18) NOT NULL DEFAULT 0,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `MESSAGE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `C_SORT` int(18) NOT NULL DEFAULT 100,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD_TYPE` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `FIELD_WIDTH` int(18) DEFAULT NULL,
  `FIELD_HEIGHT` int(18) DEFAULT NULL,
  `FIELD_PARAM` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FIELD_ID` (`FIELD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_form_answer: ~0 rows (приблизительно)
DELETE FROM `b_form_answer`;
/*!40000 ALTER TABLE `b_form_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_answer` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_form_crm
DROP TABLE IF EXISTS `b_form_crm`;
CREATE TABLE IF NOT EXISTS `b_form_crm` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `AUTH_HASH` varchar(32) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_form_crm: ~0 rows (приблизительно)
DELETE FROM `b_form_crm`;
/*!40000 ALTER TABLE `b_form_crm` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_crm` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_form_crm_field
DROP TABLE IF EXISTS `b_form_crm_field`;
CREATE TABLE IF NOT EXISTS `b_form_crm_field` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `LINK_ID` int(18) NOT NULL DEFAULT 0,
  `FIELD_ID` int(18) DEFAULT 0,
  `FIELD_ALT` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `CRM_FIELD` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `ix_b_form_crm_field_1` (`LINK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_form_crm_field: ~0 rows (приблизительно)
DELETE FROM `b_form_crm_field`;
/*!40000 ALTER TABLE `b_form_crm_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_crm_field` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_form_crm_link
DROP TABLE IF EXISTS `b_form_crm_link`;
CREATE TABLE IF NOT EXISTS `b_form_crm_link` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORM_ID` int(18) NOT NULL DEFAULT 0,
  `CRM_ID` int(18) NOT NULL DEFAULT 0,
  `LINK_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'M',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_form_crm_link_1` (`FORM_ID`,`CRM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_form_crm_link: ~0 rows (приблизительно)
DELETE FROM `b_form_crm_link`;
/*!40000 ALTER TABLE `b_form_crm_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_crm_link` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_form_field
DROP TABLE IF EXISTS `b_form_field`;
CREATE TABLE IF NOT EXISTS `b_form_field` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORM_ID` int(18) NOT NULL DEFAULT 0,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `TITLE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `TITLE_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `SID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `C_SORT` int(18) NOT NULL DEFAULT 100,
  `ADDITIONAL` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `REQUIRED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IN_FILTER` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IN_RESULTS_TABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IN_EXCEL_TABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `FIELD_TYPE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IMAGE_ID` int(18) DEFAULT NULL,
  `COMMENTS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILTER_TITLE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `RESULTS_TABLE_TITLE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_ID` (`FORM_ID`),
  KEY `IX_SID` (`SID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_form_field: ~0 rows (приблизительно)
DELETE FROM `b_form_field`;
/*!40000 ALTER TABLE `b_form_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_field` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_form_field_filter
DROP TABLE IF EXISTS `b_form_field_filter`;
CREATE TABLE IF NOT EXISTS `b_form_field_filter` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FIELD_ID` int(18) NOT NULL DEFAULT 0,
  `PARAMETER_NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `FILTER_TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FIELD_ID` (`FIELD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_form_field_filter: ~0 rows (приблизительно)
DELETE FROM `b_form_field_filter`;
/*!40000 ALTER TABLE `b_form_field_filter` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_field_filter` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_form_field_validator
DROP TABLE IF EXISTS `b_form_field_validator`;
CREATE TABLE IF NOT EXISTS `b_form_field_validator` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORM_ID` int(18) NOT NULL DEFAULT 0,
  `FIELD_ID` int(18) NOT NULL DEFAULT 0,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'y',
  `C_SORT` int(18) DEFAULT 100,
  `VALIDATOR_SID` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `PARAMS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_ID` (`FORM_ID`),
  KEY `IX_FIELD_ID` (`FIELD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_form_field_validator: ~0 rows (приблизительно)
DELETE FROM `b_form_field_validator`;
/*!40000 ALTER TABLE `b_form_field_validator` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_field_validator` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_form_menu
DROP TABLE IF EXISTS `b_form_menu`;
CREATE TABLE IF NOT EXISTS `b_form_menu` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORM_ID` int(18) NOT NULL DEFAULT 0,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `MENU` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_ID` (`FORM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_form_menu: ~0 rows (приблизительно)
DELETE FROM `b_form_menu`;
/*!40000 ALTER TABLE `b_form_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_menu` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_form_result
DROP TABLE IF EXISTS `b_form_result`;
CREATE TABLE IF NOT EXISTS `b_form_result` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `STATUS_ID` int(18) NOT NULL DEFAULT 0,
  `FORM_ID` int(18) NOT NULL DEFAULT 0,
  `USER_ID` int(18) DEFAULT NULL,
  `USER_AUTH` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `STAT_GUEST_ID` int(18) DEFAULT NULL,
  `STAT_SESSION_ID` int(18) DEFAULT NULL,
  `SENT_TO_CRM` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_ID` (`FORM_ID`),
  KEY `IX_STATUS_ID` (`STATUS_ID`),
  KEY `IX_SENT_TO_CRM` (`SENT_TO_CRM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_form_result: ~0 rows (приблизительно)
DELETE FROM `b_form_result`;
/*!40000 ALTER TABLE `b_form_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_result` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_form_result_answer
DROP TABLE IF EXISTS `b_form_result_answer`;
CREATE TABLE IF NOT EXISTS `b_form_result_answer` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `RESULT_ID` int(18) NOT NULL DEFAULT 0,
  `FORM_ID` int(18) NOT NULL DEFAULT 0,
  `FIELD_ID` int(18) NOT NULL DEFAULT 0,
  `ANSWER_ID` int(18) DEFAULT NULL,
  `ANSWER_TEXT` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `ANSWER_TEXT_SEARCH` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `ANSWER_VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ANSWER_VALUE_SEARCH` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_TEXT` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_TEXT_SEARCH` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_DATE` datetime DEFAULT NULL,
  `USER_FILE_ID` int(18) DEFAULT NULL,
  `USER_FILE_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_FILE_IS_IMAGE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_FILE_HASH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_FILE_SUFFIX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_FILE_SIZE` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_RESULT_ID` (`RESULT_ID`),
  KEY `IX_FIELD_ID` (`FIELD_ID`),
  KEY `IX_ANSWER_ID` (`ANSWER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_form_result_answer: ~0 rows (приблизительно)
DELETE FROM `b_form_result_answer`;
/*!40000 ALTER TABLE `b_form_result_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_result_answer` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_form_status
DROP TABLE IF EXISTS `b_form_status`;
CREATE TABLE IF NOT EXISTS `b_form_status` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORM_ID` int(18) NOT NULL DEFAULT 0,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `C_SORT` int(18) NOT NULL DEFAULT 100,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `DEFAULT_VALUE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CSS` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'statusgreen',
  `HANDLER_OUT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HANDLER_IN` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MAIL_EVENT_TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_ID` (`FORM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_form_status: ~0 rows (приблизительно)
DELETE FROM `b_form_status`;
/*!40000 ALTER TABLE `b_form_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_status` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_form_status_2_group
DROP TABLE IF EXISTS `b_form_status_2_group`;
CREATE TABLE IF NOT EXISTS `b_form_status_2_group` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `STATUS_ID` int(18) NOT NULL DEFAULT 0,
  `GROUP_ID` int(18) NOT NULL DEFAULT 0,
  `PERMISSION` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_STATUS_GROUP` (`STATUS_ID`,`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_form_status_2_group: ~0 rows (приблизительно)
DELETE FROM `b_form_status_2_group`;
/*!40000 ALTER TABLE `b_form_status_2_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_status_2_group` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_form_status_2_mail_template
DROP TABLE IF EXISTS `b_form_status_2_mail_template`;
CREATE TABLE IF NOT EXISTS `b_form_status_2_mail_template` (
  `STATUS_ID` int(18) NOT NULL DEFAULT 0,
  `MAIL_TEMPLATE_ID` int(18) NOT NULL DEFAULT 0,
  PRIMARY KEY (`STATUS_ID`,`MAIL_TEMPLATE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_form_status_2_mail_template: ~0 rows (приблизительно)
DELETE FROM `b_form_status_2_mail_template`;
/*!40000 ALTER TABLE `b_form_status_2_mail_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_status_2_mail_template` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_forum
DROP TABLE IF EXISTS `b_forum`;
CREATE TABLE IF NOT EXISTS `b_forum` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `FORUM_GROUP_ID` int(11) DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(10) NOT NULL DEFAULT 150,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_HTML` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ALLOW_ANCHOR` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_BIU` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_IMG` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_VIDEO` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_LIST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_QUOTE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_CODE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_FONT` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_SMILES` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_UPLOAD` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ALLOW_TABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ALLOW_ALIGN` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_UPLOAD_EXT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ALLOW_MOVE_TOPIC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_TOPIC_TITLED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ALLOW_NL2BR` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ALLOW_SIGNATURE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `PATH2FORUM_MESSAGE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ASK_GUEST_EMAIL` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `USE_CAPTCHA` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `INDEXATION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `DEDUPLICATION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `MODERATION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ORDER_BY` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'P',
  `ORDER_DIRECTION` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'DESC',
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ru',
  `TOPICS` int(11) NOT NULL DEFAULT 0,
  `POSTS` int(11) NOT NULL DEFAULT 0,
  `LAST_POSTER_ID` int(11) DEFAULT NULL,
  `LAST_POSTER_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_POST_DATE` datetime DEFAULT NULL,
  `LAST_MESSAGE_ID` bigint(20) DEFAULT NULL,
  `POSTS_UNAPPROVED` int(11) DEFAULT 0,
  `ABS_LAST_POSTER_ID` int(11) DEFAULT NULL,
  `ABS_LAST_POSTER_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ABS_LAST_POST_DATE` datetime DEFAULT NULL,
  `ABS_LAST_MESSAGE_ID` bigint(20) DEFAULT NULL,
  `EVENT1` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'forum',
  `EVENT2` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'message',
  `EVENT3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HTML` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORUM_SORT` (`SORT`),
  KEY `IX_FORUM_ACTIVE` (`ACTIVE`),
  KEY `IX_FORUM_GROUP_ID` (`FORUM_GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_forum: ~0 rows (приблизительно)
DELETE FROM `b_forum`;
/*!40000 ALTER TABLE `b_forum` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_forum2site
DROP TABLE IF EXISTS `b_forum2site`;
CREATE TABLE IF NOT EXISTS `b_forum2site` (
  `FORUM_ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `PATH2FORUM_MESSAGE` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`FORUM_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_forum2site: ~0 rows (приблизительно)
DELETE FROM `b_forum2site`;
/*!40000 ALTER TABLE `b_forum2site` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum2site` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_forum_dictionary
DROP TABLE IF EXISTS `b_forum_dictionary`;
CREATE TABLE IF NOT EXISTS `b_forum_dictionary` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_forum_dictionary: ~4 rows (приблизительно)
DELETE FROM `b_forum_dictionary`;
/*!40000 ALTER TABLE `b_forum_dictionary` DISABLE KEYS */;
INSERT INTO `b_forum_dictionary` (`ID`, `TITLE`, `TYPE`) VALUES
	(1, '[ru] Словарь слов', 'W'),
	(2, '[ru] Словарь транслита', 'T'),
	(3, '[en] Bad words', 'W'),
	(4, '[en] Transliteration', 'T');
/*!40000 ALTER TABLE `b_forum_dictionary` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_forum_email
DROP TABLE IF EXISTS `b_forum_email`;
CREATE TABLE IF NOT EXISTS `b_forum_email` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EMAIL_FORUM_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `FORUM_ID` int(11) NOT NULL,
  `SOCNET_GROUP_ID` int(11) DEFAULT NULL,
  `MAIL_FILTER_ID` int(11) NOT NULL,
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `USE_EMAIL` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL_GROUP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SUBJECT_SUF` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USE_SUBJECT` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL_TEMPLATES_MESSAGE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NOT_MEMBER_POST` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FORUM_EMAIL_FORUM_SOC` (`FORUM_ID`,`SOCNET_GROUP_ID`),
  KEY `IX_B_FORUM_EMAIL_FILTER_ID` (`MAIL_FILTER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_forum_email: ~0 rows (приблизительно)
DELETE FROM `b_forum_email`;
/*!40000 ALTER TABLE `b_forum_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_email` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_forum_file
DROP TABLE IF EXISTS `b_forum_file`;
CREATE TABLE IF NOT EXISTS `b_forum_file` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORUM_ID` int(18) DEFAULT NULL,
  `TOPIC_ID` int(20) DEFAULT NULL,
  `MESSAGE_ID` int(20) DEFAULT NULL,
  `FILE_ID` int(18) NOT NULL,
  `USER_ID` int(18) DEFAULT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `HITS` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORUM_FILE_FILE` (`FILE_ID`),
  KEY `IX_FORUM_FILE_FORUM` (`FORUM_ID`),
  KEY `IX_FORUM_FILE_TOPIC` (`TOPIC_ID`),
  KEY `IX_FORUM_FILE_MESSAGE` (`MESSAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_forum_file: ~0 rows (приблизительно)
DELETE FROM `b_forum_file`;
/*!40000 ALTER TABLE `b_forum_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_file` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_forum_filter
DROP TABLE IF EXISTS `b_forum_filter`;
CREATE TABLE IF NOT EXISTS `b_forum_filter` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DICTIONARY_ID` int(11) DEFAULT NULL,
  `WORDS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PATTERN` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `REPLACEMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `USE_IT` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PATTERN_CREATE` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FORUM_FILTER_2` (`USE_IT`),
  KEY `IX_B_FORUM_FILTER_3` (`PATTERN_CREATE`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_forum_filter: ~151 rows (приблизительно)
DELETE FROM `b_forum_filter`;
/*!40000 ALTER TABLE `b_forum_filter` DISABLE KEYS */;
INSERT INTO `b_forum_filter` (`ID`, `DICTIONARY_ID`, `WORDS`, `PATTERN`, `REPLACEMENT`, `DESCRIPTION`, `USE_IT`, `PATTERN_CREATE`) VALUES
	(1, 1, '*пизд*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])([^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*([ПпPp]+)([ИиIi]+)([ЗзZz3]+)([ДдDd]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(2, 1, '*пизж*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])([^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*([ПпPp]+)([ИиIi]+)([ЗзZz3]+)([ЖжGg]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(3, 1, '*сра%', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])([^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*([СсCc]+)([РрPpRr]+)([АаAa]+)([[Цц]+([Аа]+|[Оо]+)]+|[[Тт]+([Ьь]+|)[Сс]+[Яя]+]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(4, 1, 'анобляд*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([АаAa]+)([НнNn]+)([ОоOo]+)([БбBb]+)([ЛлLl]+)([Яя]+)([ДдDd]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(5, 1, 'взъеб*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвVv]+)([ЗзZz3]+)([ЪъЬь"\']+|)([ЁёЕеEe]+)([БбBb]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(6, 1, 'бля', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([БбBb]+)([ЛлLl]+)([Яя]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(7, 1, 'долбоеб*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ДдDd]+)([ОоOo]+)([ЛлLl]+)([БбBb]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(8, 1, 'дуроеб*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ДдDd]+)([УуUu]+)([РрPpRr]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(9, 1, 'еби', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ИиIi]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(10, 1, 'ебисти*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([СсCc]+)([ТтTt]+)([ИиIi]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(11, 1, 'ебическ*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([Чч]+)([ЁёЕеEe]+)([СсCc]+)([КкKk]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(12, 1, 'еблив*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ЛлLl]+)([ИиIi]+)([ВвVv]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(13, 1, 'ебло*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ЛлLl]+)([ОоOo]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(14, 1, 'еблыс*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ЛлLl]+)([Ыы]+)([СсCc]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(15, 1, 'ебля', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ЛлLl]+)([Яя]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(16, 1, 'ебс', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([СсCc]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(17, 1, 'ебукент*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([УуUu]+)([КкKk]+)([ЁёЕеEe]+)([НнNn]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(18, 1, 'ебурген*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([УуUu]+)([РрPpRr]+)([Гг]+)([ЁёЕеEe]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(19, 1, 'коноебит*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([КкKk]+)([ОоOo]+)([НнNn]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(20, 1, 'мозгоеб*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([МмMm]+)([ОоOo]+)([ЗзZz3]+)([Гг]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(21, 1, 'мудоеб*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([МмMm]+)([УуUu]+)([ДдDd]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(22, 1, 'однохуйствен*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ОоOo]+)([ДдDd]+)([НнNn]+)([ОоOo]+)([ХхXx]+)([УуUu]+)([ЙйИиYy]+)([СсCc]+)([ТтTt]+)([ВвVv]+)([ЁёЕеEe]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(23, 1, 'охуе*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ОоOo]+)([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(24, 1, 'охуи*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ОоOo]+)([ХхXx]+)([УуUu]+)([ИиIi]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(25, 1, 'охуя*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ОоOo]+)([ХхXx]+)([УуUu]+)([Яя]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(26, 1, 'разъеба*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([РрPpRr]+)([АаAa]+)([ЗзZz3]+)([ЪъЬь"\']+|)([ЁёЕеEe]+)([БбBb]+)([АаAa]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(27, 1, 'распиздон*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([РрPpRr]+)([АаAa]+)([СсCc]+)([ПпPp]+)([ИиIi]+)([ЗзZz3]+)([ДдDd]+)([ОоOo]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(28, 1, 'расхуюж*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([РрPpRr]+)([АаAa]+)([СсCc]+)([ХхXx]+)([УуUu]+)([Юю]+|[[Йй]+[Оо]+]+)([ЖжGg]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(29, 1, 'худоебин*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ДдDd]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(30, 1, 'хуе', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЁёЕеEe]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(31, 1, 'хуебрат*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([БбBb]+)([РрPpRr]+)([АаAa]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(32, 1, 'хуеглот*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([Гг]+)([ЛлLl]+)([ОоOo]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(33, 1, 'хуеплёт*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([ПпPp]+)([ЛлLl]+)([ЁёЕеEe]+|[[Йй]+[Оо]+]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(34, 1, 'хует*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(35, 1, 'хуила', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ИиIi]+)([ЛлLl]+)([АаAa]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(36, 1, 'хул?', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЛлLl]+).?)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(37, 1, 'хуя', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([Яя]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(38, 1, '^бляд*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([БбBb]+)([ЛлLl]+)([Яя]+)([ДдDd]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(39, 1, '^пидор*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ПпPp]+)([ИиIi]+)([ДдDd]+)([ОоOo]+)([РрPpRr]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(40, 1, '^хуев*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([ВвVv]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(41, 1, '^хуем*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([МмMm]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(42, 1, '^хуй*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([ЙйИиYy]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(43, 1, '^хуяк*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([Яя]+)([КкKk]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(44, 1, '^хуям*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([Яя]+)([МмMm]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(45, 1, '^хуяр*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([Яя]+)([РрPpRr]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(46, 1, '^хуяч*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([Яя]+)([Чч]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(47, 1, '^ъебал*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь"\']+|)([ЁёЕеEe]+)([БбBb]+)([АаAa]+)([ЛлLl]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(48, 1, '^ъебан*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь"\']+|)([ЁёЕеEe]+)([БбBb]+)([АаAa]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(49, 1, '^ъебар*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь"\']+|)([ЁёЕеEe]+)([БбBb]+)([АаAa]+)([РрPpRr]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(50, 1, '^ъебат*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь"\']+|)([ЁёЕеEe]+)([БбBb]+)([АаAa]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(51, 1, '^ъебен*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь"\']+|)([ЁёЕеEe]+)([БбBb]+)([ЁёЕеEe]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(52, 1, '^ъеби', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь"\']+|)([ЁёЕеEe]+)([БбBb]+)([ИиIi]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(53, 1, '^ъебис*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь"\']+|)([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([СсCc]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(54, 1, '^ъебит*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь"\']+|)([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(55, 1, '^ъёбля*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь"\']+|)([ЁёЕеEe]+|[[Йй]+[Оо]+]+)([БбBb]+)([ЛлLl]+)([Яя]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(56, 1, '^ъёбну*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь"\']+|)([ЁёЕеEe]+|[[Йй]+[Оо]+]+)([БбBb]+)([НнNn]+)([УуUu]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(57, 1, '^ъебу', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь"\']+|)([ЁёЕеEe]+)([БбBb]+)([УуUu]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(58, 1, '^ъебуч*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь"\']+|)([ЁёЕеEe]+)([БбBb]+)([УуUu]+)([Чч]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(59, 1, '^ъебыв*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь"\']+|)([ЁёЕеEe]+)([БбBb]+)([Ыы]+)([ВвVv]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(60, 1, '/(?<=[s.,;:!?-#*|[]()])(?![Вв][ЕеЁё][Бб])(([ВвЗзСс]+|[Ввы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)|)([ЬьЪъ]+|)([ЁёЕеEe]+|[Йй]+[Оо]+|[Yy]+[Oo]+)([BbБб]+))(?=[s.,;:!?-#*|[]()])/is', '', '', '', 'Y', 'PTTRN'),
	(61, 3, 'angry', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(a+n+g+r+y+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(62, 3, 'ass', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(a+s+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(63, 3, 'asshole', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(a+s+s+h+o+l+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(64, 3, 'banger', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+a+n+g+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(65, 3, 'bastard', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+a+s+t+a+r+d+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(66, 3, 'batter', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+a+t+t+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(67, 3, 'bicho', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+i+c+h+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(68, 3, 'bisexual', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+i+s+e+x+u+a+l+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(69, 3, 'bitch', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+i+t+c+h+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(70, 3, 'blumpkin', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+l+u+m+p+k+i+n+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(71, 3, 'booger', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+o+o+g+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(72, 3, 'bugger*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+g+g+e+r+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(73, 3, 'bukakke', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+k+a+k+k+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(74, 3, 'bull', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+l+l+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(75, 3, 'bulldyke', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+l+l+d+y+k+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(76, 3, 'bullshit', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+l+l+s+h+i+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(77, 3, 'bunny', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+n+n+y+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(78, 3, 'bunnyfuck', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+n+n+y+f+u+c+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(79, 3, 'chocha', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+h+o+c+h+a+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(80, 3, 'chode', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+h+o+d+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(81, 3, 'clap', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+l+a+p+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(82, 3, 'coconuts', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+c+o+n+u+t+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(83, 3, 'cohones', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+h+o+n+e+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(84, 3, 'cojones', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+j+o+n+e+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(85, 3, 'coon', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+o+n+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(86, 3, 'cootch', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+o+t+c+h+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(87, 3, 'cooter', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+o+t+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(88, 3, 'cornhole', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+r+n+h+o+l+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(89, 3, 'cracka', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+r+a+c+k+a+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(90, 3, 'crap', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+r+a+p+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(91, 3, 'cum', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+u+m+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(92, 3, 'cunnilingus', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+u+n+n+i+l+i+n+g+u+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(93, 3, 'cunt*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+u+n+t+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(94, 3, 'damn*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+a+m+n+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(95, 3, 'dark*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+a+r+k+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(96, 3, 'dick', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+c+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(97, 3, 'dickhead', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+c+k+h+e+a+d+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(98, 3, 'diddle', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+d+d+l+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(99, 3, 'dildo', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+l+d+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(100, 3, 'dilhole', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+l+h+o+l+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(101, 3, 'dingleberry', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+n+g+l+e+b+e+r+r+y+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(102, 3, 'doodle', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+o+o+d+l+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(103, 3, 'dork', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+o+r+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(104, 3, 'dumpster', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+u+m+p+s+t+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(105, 3, 'faggot', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(f+a+g+g+o+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(106, 3, 'fart', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(f+a+r+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(107, 3, 'frig', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(f+r+i+g+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(108, 3, 'fuck*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(f+u+c+k+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(109, 3, 'fucker', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(f+u+c+k+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(110, 3, 'giz', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(g+i+z+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(111, 3, 'goatse', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(g+o+a+t+s+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(112, 3, 'gook', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(g+o+o+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(113, 3, 'gringo', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(g+r+i+n+g+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(114, 3, 'hobo', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(h+o+b+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(115, 3, 'honky', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(h+o+n+k+y+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(116, 3, 'jackass', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(j+a+c+k+a+s+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(117, 3, 'jackoff', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(j+a+c+k+o+f+f+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(118, 3, 'jerkoff', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(j+e+r+k+o+f+f+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(119, 3, 'jiggaboo', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(j+i+g+g+a+b+o+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(120, 3, 'jizz', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(j+i+z+z+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(121, 3, 'kike', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(k+i+k+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(122, 3, 'mayo', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(m+a+y+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(123, 3, 'moose', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(m+o+o+s+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(124, 3, 'nigg*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(n+i+g+g+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(125, 3, 'paki', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+a+k+i+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(126, 3, 'pecker', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+e+c+k+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(127, 3, 'piss', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+i+s+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(128, 3, 'poonanni', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+o+o+n+a+n+n+i+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(129, 3, 'poontang', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+o+o+n+t+a+n+g+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(130, 3, 'prick', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+r+i+c+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(131, 3, 'punch', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+u+n+c+h+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(132, 3, 'queef', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(q+u+e+e+f+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(133, 3, 'rogue', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(r+o+g+u+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(134, 3, 'sanchez', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+a+n+c+h+e+z+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(135, 3, 'schlong', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+c+h+l+o+n+g+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(136, 3, 'shit', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+h+i+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(137, 3, 'skank', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+k+a+n+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(138, 3, 'spaz', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+p+a+z+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(139, 3, 'spic', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+p+i+c+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(140, 3, 'teabag*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(t+e+a+b+a+g+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(141, 3, 'tits', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(t+i+t+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(142, 3, 'twat', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(t+w+a+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(143, 3, 'twot', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(t+w+o+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(144, 3, 'vart', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(v+a+r+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(145, 3, 'wanker', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+a+n+k+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(146, 3, 'waste', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+a+s+t+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(147, 3, 'wetback', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+e+t+b+a+c+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(148, 3, 'whore', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+h+o+r+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(149, 3, 'wigger', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+i+g+g+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(150, 3, 'wog', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+o+g+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(151, 3, 'wop', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+o+p+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL');
/*!40000 ALTER TABLE `b_forum_filter` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_forum_group
DROP TABLE IF EXISTS `b_forum_group`;
CREATE TABLE IF NOT EXISTS `b_forum_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SORT` int(11) NOT NULL DEFAULT 150,
  `PARENT_ID` int(11) DEFAULT NULL,
  `LEFT_MARGIN` int(11) DEFAULT NULL,
  `RIGHT_MARGIN` int(11) DEFAULT NULL,
  `DEPTH_LEVEL` int(11) DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_forum_group: ~0 rows (приблизительно)
DELETE FROM `b_forum_group`;
/*!40000 ALTER TABLE `b_forum_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_group` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_forum_group_lang
DROP TABLE IF EXISTS `b_forum_group_lang`;
CREATE TABLE IF NOT EXISTS `b_forum_group_lang` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FORUM_GROUP_ID` int(11) NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_FORUM_GROUP` (`FORUM_GROUP_ID`,`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_forum_group_lang: ~0 rows (приблизительно)
DELETE FROM `b_forum_group_lang`;
/*!40000 ALTER TABLE `b_forum_group_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_group_lang` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_forum_letter
DROP TABLE IF EXISTS `b_forum_letter`;
CREATE TABLE IF NOT EXISTS `b_forum_letter` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DICTIONARY_ID` int(11) DEFAULT 0,
  `LETTER` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REPLACEMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_forum_letter: ~37 rows (приблизительно)
DELETE FROM `b_forum_letter`;
/*!40000 ALTER TABLE `b_forum_letter` DISABLE KEYS */;
INSERT INTO `b_forum_letter` (`ID`, `DICTIONARY_ID`, `LETTER`, `REPLACEMENT`) VALUES
	(1, 2, 'а', 'АаAa'),
	(2, 2, 'б', 'БбBb'),
	(3, 2, 'в', 'ВвVv'),
	(4, 2, 'г', 'Гг'),
	(5, 2, 'д', 'ДдDd'),
	(6, 2, 'е', 'ЁёЕеEe'),
	(7, 2, 'ё', 'ЁёЕеEe, [Йй]+[Оо]+'),
	(8, 2, 'ж', 'ЖжGg'),
	(9, 2, 'з', 'ЗзZz3'),
	(10, 2, 'и', 'ИиIi'),
	(11, 2, 'й', 'ЙйИиYy'),
	(12, 2, 'к', 'КкKk'),
	(13, 2, 'л', 'ЛлLl'),
	(14, 2, 'м', 'МмMm'),
	(15, 2, 'н', 'НнNn'),
	(16, 2, 'о', 'ОоOo'),
	(17, 2, 'п', 'ПпPp'),
	(18, 2, 'р', 'РрPpRr'),
	(19, 2, 'с', 'СсCc'),
	(20, 2, 'т', 'ТтTt'),
	(21, 2, 'у', 'УуUu'),
	(22, 2, 'ф', 'ФфFf'),
	(23, 2, 'х', 'ХхXx'),
	(24, 2, 'ц', 'ЦцCc'),
	(25, 2, 'ч', 'Чч'),
	(26, 2, 'ш', 'Шш'),
	(27, 2, 'щ', 'Щщ'),
	(28, 2, 'ь', 'ЪъЬь"\','),
	(29, 2, 'ы', 'Ыы'),
	(30, 2, 'ъ', 'ЪъЬь"\','),
	(31, 2, 'э', 'Ээ'),
	(32, 2, 'ю', 'Юю, [Йй]+[Оо]+'),
	(33, 2, 'я', 'Яя'),
	(34, 2, '%', '[Цц]+([Аа]+|[Оо]+), [Тт]+([Ьь]+|)[Сс]+[Яя]+'),
	(35, 2, '^', ',ВвЗзСс,ВвЫы,ДдОо,ЗзАа,ИиЗзСс,НнАа,НнЕе,ОоТт,([Пп]*[Ее]+[Рр]+[Ее]+)'),
	(36, 2, 'тся', '%'),
	(37, 2, 'ться', '%');
/*!40000 ALTER TABLE `b_forum_letter` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_forum_message
DROP TABLE IF EXISTS `b_forum_message`;
CREATE TABLE IF NOT EXISTS `b_forum_message` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FORUM_ID` int(10) NOT NULL,
  `TOPIC_ID` bigint(20) NOT NULL,
  `USE_SMILES` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NEW_TOPIC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `APPROVED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SOURCE_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'WEB',
  `POST_DATE` datetime NOT NULL,
  `POST_MESSAGE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `POST_MESSAGE_HTML` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `POST_MESSAGE_FILTER` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `POST_MESSAGE_CHECK` char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ATTACH_IMG` int(11) DEFAULT NULL,
  `PARAM1` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PARAM2` int(11) DEFAULT NULL,
  `AUTHOR_ID` int(10) DEFAULT NULL,
  `AUTHOR_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTHOR_EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTHOR_IP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTHOR_REAL_IP` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GUEST_ID` int(10) DEFAULT NULL,
  `EDITOR_ID` int(10) DEFAULT NULL,
  `EDITOR_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EDITOR_EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EDIT_REASON` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `EDIT_DATE` datetime DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HTML` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `MAIL_HEADER` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `SERVICE_TYPE` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORUM_MESSAGE_FORUM` (`FORUM_ID`,`APPROVED`),
  KEY `IX_FORUM_MESSAGE_FORUM_TOPIC` (`FORUM_ID`,`TOPIC_ID`),
  KEY `IX_FORUM_MESSAGE_TOPIC` (`TOPIC_ID`,`APPROVED`),
  KEY `IX_FORUM_MESSAGE_AUTHOR` (`AUTHOR_ID`,`APPROVED`,`FORUM_ID`),
  KEY `IX_FORUM_MESSAGE_APPROVED` (`APPROVED`),
  KEY `IX_FORUM_MESSAGE_PARAM2` (`PARAM2`),
  KEY `IX_FORUM_MESSAGE_XML_ID` (`XML_ID`),
  KEY `IX_FORUM_MESSAGE_DATE_AUTHOR_ID` (`POST_DATE`,`AUTHOR_ID`),
  KEY `IX_FORUM_MESSAGE_AUTHOR_TOPIC_ID` (`AUTHOR_ID`,`TOPIC_ID`),
  KEY `IX_FORUM_MESSAGE_AUTHOR_FORUM_ID` (`AUTHOR_ID`,`FORUM_ID`,`ID`,`APPROVED`,`TOPIC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_forum_message: ~0 rows (приблизительно)
DELETE FROM `b_forum_message`;
/*!40000 ALTER TABLE `b_forum_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_message` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_forum_perms
DROP TABLE IF EXISTS `b_forum_perms`;
CREATE TABLE IF NOT EXISTS `b_forum_perms` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FORUM_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `PERMISSION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'M',
  PRIMARY KEY (`ID`),
  KEY `IX_FORUM_PERMS_FORUM` (`FORUM_ID`,`GROUP_ID`),
  KEY `IX_FORUM_PERMS_GROUP` (`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_forum_perms: ~0 rows (приблизительно)
DELETE FROM `b_forum_perms`;
/*!40000 ALTER TABLE `b_forum_perms` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_perms` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_forum_pm_folder
DROP TABLE IF EXISTS `b_forum_pm_folder`;
CREATE TABLE IF NOT EXISTS `b_forum_pm_folder` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `SORT` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FORUM_PM_FOLDER_USER_IST` (`USER_ID`,`ID`,`SORT`,`TITLE`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_forum_pm_folder: ~4 rows (приблизительно)
DELETE FROM `b_forum_pm_folder`;
/*!40000 ALTER TABLE `b_forum_pm_folder` DISABLE KEYS */;
INSERT INTO `b_forum_pm_folder` (`ID`, `TITLE`, `USER_ID`, `SORT`) VALUES
	(1, 'SYSTEM_FOLDER_1', 0, 0),
	(2, 'SYSTEM_FOLDER_2', 0, 0),
	(3, 'SYSTEM_FOLDER_3', 0, 0),
	(4, 'SYSTEM_FOLDER_4', 0, 0);
/*!40000 ALTER TABLE `b_forum_pm_folder` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_forum_points
DROP TABLE IF EXISTS `b_forum_points`;
CREATE TABLE IF NOT EXISTS `b_forum_points` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MIN_POINTS` int(11) NOT NULL,
  `CODE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VOTES` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_FORUM_P_MP` (`MIN_POINTS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_forum_points: ~0 rows (приблизительно)
DELETE FROM `b_forum_points`;
/*!40000 ALTER TABLE `b_forum_points` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_points` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_forum_points2post
DROP TABLE IF EXISTS `b_forum_points2post`;
CREATE TABLE IF NOT EXISTS `b_forum_points2post` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MIN_NUM_POSTS` int(11) NOT NULL,
  `POINTS_PER_POST` decimal(18,4) NOT NULL DEFAULT 0.0000,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_FORUM_P2P_MNP` (`MIN_NUM_POSTS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_forum_points2post: ~0 rows (приблизительно)
DELETE FROM `b_forum_points2post`;
/*!40000 ALTER TABLE `b_forum_points2post` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_points2post` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_forum_points_lang
DROP TABLE IF EXISTS `b_forum_points_lang`;
CREATE TABLE IF NOT EXISTS `b_forum_points_lang` (
  `POINTS_ID` int(11) NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`POINTS_ID`,`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_forum_points_lang: ~0 rows (приблизительно)
DELETE FROM `b_forum_points_lang`;
/*!40000 ALTER TABLE `b_forum_points_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_points_lang` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_forum_private_message
DROP TABLE IF EXISTS `b_forum_private_message`;
CREATE TABLE IF NOT EXISTS `b_forum_private_message` (
  `ID` bigint(10) NOT NULL AUTO_INCREMENT,
  `AUTHOR_ID` int(11) DEFAULT 0,
  `RECIPIENT_ID` int(11) DEFAULT 0,
  `POST_DATE` datetime DEFAULT NULL,
  `POST_SUBJ` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `POST_MESSAGE` text COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `FOLDER_ID` int(11) NOT NULL,
  `IS_READ` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUEST_IS_READ` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USE_SMILES` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FORUM_PM_AFR` (`AUTHOR_ID`,`FOLDER_ID`,`IS_READ`),
  KEY `IX_B_FORUM_PM_UFP` (`USER_ID`,`FOLDER_ID`,`POST_DATE`),
  KEY `IX_B_FORUM_PM_POST_DATE` (`POST_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_forum_private_message: ~0 rows (приблизительно)
DELETE FROM `b_forum_private_message`;
/*!40000 ALTER TABLE `b_forum_private_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_private_message` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_forum_rank
DROP TABLE IF EXISTS `b_forum_rank`;
CREATE TABLE IF NOT EXISTS `b_forum_rank` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MIN_NUM_POSTS` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_forum_rank: ~0 rows (приблизительно)
DELETE FROM `b_forum_rank`;
/*!40000 ALTER TABLE `b_forum_rank` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_rank` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_forum_rank_lang
DROP TABLE IF EXISTS `b_forum_rank_lang`;
CREATE TABLE IF NOT EXISTS `b_forum_rank_lang` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RANK_ID` int(11) NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_FORUM_RANK` (`RANK_ID`,`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_forum_rank_lang: ~0 rows (приблизительно)
DELETE FROM `b_forum_rank_lang`;
/*!40000 ALTER TABLE `b_forum_rank_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_rank_lang` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_forum_stat
DROP TABLE IF EXISTS `b_forum_stat`;
CREATE TABLE IF NOT EXISTS `b_forum_stat` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(10) DEFAULT NULL,
  `IP_ADDRESS` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PHPSESSID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_VISIT` datetime DEFAULT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORUM_ID` smallint(5) NOT NULL DEFAULT 0,
  `TOPIC_ID` int(10) DEFAULT NULL,
  `SHOW_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FORUM_STAT_SITE_ID` (`SITE_ID`,`LAST_VISIT`),
  KEY `IX_B_FORUM_STAT_TOPIC_ID` (`TOPIC_ID`,`LAST_VISIT`),
  KEY `IX_B_FORUM_STAT_FORUM_ID` (`FORUM_ID`,`LAST_VISIT`),
  KEY `IX_B_FORUM_STAT_PHPSESSID` (`PHPSESSID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_forum_stat: ~0 rows (приблизительно)
DELETE FROM `b_forum_stat`;
/*!40000 ALTER TABLE `b_forum_stat` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_stat` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_forum_subscribe
DROP TABLE IF EXISTS `b_forum_subscribe`;
CREATE TABLE IF NOT EXISTS `b_forum_subscribe` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(10) NOT NULL,
  `FORUM_ID` int(10) NOT NULL,
  `TOPIC_ID` int(10) DEFAULT NULL,
  `START_DATE` datetime NOT NULL,
  `LAST_SEND` int(10) DEFAULT NULL,
  `NEW_TOPIC_ONLY` char(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ru',
  `SOCNET_GROUP_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_FORUM_SUBSCRIBE_USER` (`USER_ID`,`FORUM_ID`,`TOPIC_ID`,`SOCNET_GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_forum_subscribe: ~0 rows (приблизительно)
DELETE FROM `b_forum_subscribe`;
/*!40000 ALTER TABLE `b_forum_subscribe` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_subscribe` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_forum_topic
DROP TABLE IF EXISTS `b_forum_topic`;
CREATE TABLE IF NOT EXISTS `b_forum_topic` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FORUM_ID` int(10) NOT NULL,
  `TOPIC_ID` bigint(20) DEFAULT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TITLE_SEO` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAGS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ICON` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `APPROVED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(10) NOT NULL DEFAULT 150,
  `VIEWS` int(10) NOT NULL DEFAULT 0,
  `USER_START_ID` int(10) DEFAULT NULL,
  `USER_START_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `START_DATE` datetime NOT NULL,
  `POSTS` int(10) NOT NULL DEFAULT 0,
  `LAST_POSTER_ID` int(10) DEFAULT NULL,
  `LAST_POSTER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_POST_DATE` datetime NOT NULL,
  `LAST_MESSAGE_ID` bigint(20) DEFAULT NULL,
  `POSTS_UNAPPROVED` int(11) DEFAULT 0,
  `ABS_LAST_POSTER_ID` int(10) DEFAULT NULL,
  `ABS_LAST_POSTER_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ABS_LAST_POST_DATE` datetime DEFAULT NULL,
  `ABS_LAST_MESSAGE_ID` bigint(20) DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HTML` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `SOCNET_GROUP_ID` int(10) DEFAULT NULL,
  `OWNER_ID` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORUM_TOPIC_FORUM` (`FORUM_ID`,`APPROVED`),
  KEY `IX_FORUM_TOPIC_APPROVED` (`APPROVED`),
  KEY `IX_FORUM_TOPIC_ABS_L_POST_DATE` (`ABS_LAST_POST_DATE`),
  KEY `IX_FORUM_TOPIC_LAST_POST_DATE` (`LAST_POST_DATE`),
  KEY `IX_FORUM_TOPIC_USER_START_ID` (`USER_START_ID`),
  KEY `IX_FORUM_TOPIC_DATE_USER_START_ID` (`START_DATE`,`USER_START_ID`),
  KEY `IX_FORUM_TOPIC_XML_ID` (`XML_ID`),
  KEY `IX_FORUM_TOPIC_TITLE_SEO` (`FORUM_ID`,`TITLE_SEO`),
  KEY `IX_FORUM_TOPIC_TITLE_SEO2` (`TITLE_SEO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_forum_topic: ~0 rows (приблизительно)
DELETE FROM `b_forum_topic`;
/*!40000 ALTER TABLE `b_forum_topic` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_topic` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_forum_user
DROP TABLE IF EXISTS `b_forum_user`;
CREATE TABLE IF NOT EXISTS `b_forum_user` (
  `ID` bigint(10) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(10) NOT NULL,
  `ALIAS` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IP_ADDRESS` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AVATAR` int(10) DEFAULT NULL,
  `NUM_POSTS` int(10) DEFAULT 0,
  `INTERESTS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_POST` int(10) DEFAULT NULL,
  `ALLOW_POST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `LAST_VISIT` datetime NOT NULL,
  `DATE_REG` date NOT NULL,
  `REAL_IP_ADDRESS` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SIGNATURE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SHOW_NAME` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `RANK_ID` int(11) DEFAULT NULL,
  `POINTS` int(11) NOT NULL DEFAULT 0,
  `HIDE_FROM_ONLINE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SUBSC_GROUP_MESSAGE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SUBSC_GET_MY_MESSAGE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_FORUM_USER_USER6` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_forum_user: ~0 rows (приблизительно)
DELETE FROM `b_forum_user`;
/*!40000 ALTER TABLE `b_forum_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_user` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_forum_user_forum
DROP TABLE IF EXISTS `b_forum_user_forum`;
CREATE TABLE IF NOT EXISTS `b_forum_user_forum` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) DEFAULT NULL,
  `FORUM_ID` int(11) DEFAULT NULL,
  `LAST_VISIT` datetime DEFAULT NULL,
  `MAIN_LAST_VISIT` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FORUM_USER_FORUM_ID1` (`USER_ID`,`FORUM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_forum_user_forum: ~0 rows (приблизительно)
DELETE FROM `b_forum_user_forum`;
/*!40000 ALTER TABLE `b_forum_user_forum` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_user_forum` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_forum_user_points
DROP TABLE IF EXISTS `b_forum_user_points`;
CREATE TABLE IF NOT EXISTS `b_forum_user_points` (
  `FROM_USER_ID` int(11) NOT NULL,
  `TO_USER_ID` int(11) NOT NULL,
  `POINTS` int(11) NOT NULL DEFAULT 0,
  `DATE_UPDATE` datetime DEFAULT NULL,
  PRIMARY KEY (`FROM_USER_ID`,`TO_USER_ID`),
  KEY `IX_B_FORUM_USER_POINTS_TO_USER` (`TO_USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_forum_user_points: ~0 rows (приблизительно)
DELETE FROM `b_forum_user_points`;
/*!40000 ALTER TABLE `b_forum_user_points` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_user_points` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_forum_user_topic
DROP TABLE IF EXISTS `b_forum_user_topic`;
CREATE TABLE IF NOT EXISTS `b_forum_user_topic` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TOPIC_ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `FORUM_ID` int(11) DEFAULT NULL,
  `LAST_VISIT` datetime DEFAULT NULL,
  PRIMARY KEY (`TOPIC_ID`,`USER_ID`),
  KEY `ID` (`ID`),
  KEY `IX_B_FORUM_USER_FORUM_ID2` (`USER_ID`,`FORUM_ID`,`TOPIC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_forum_user_topic: ~0 rows (приблизительно)
DELETE FROM `b_forum_user_topic`;
/*!40000 ALTER TABLE `b_forum_user_topic` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_user_topic` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_geoip_handlers
DROP TABLE IF EXISTS `b_geoip_handlers`;
CREATE TABLE IF NOT EXISTS `b_geoip_handlers` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SORT` int(10) NOT NULL DEFAULT 100,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `CLASS_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONFIG` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_geoip_handlers: ~2 rows (приблизительно)
DELETE FROM `b_geoip_handlers`;
/*!40000 ALTER TABLE `b_geoip_handlers` DISABLE KEYS */;
INSERT INTO `b_geoip_handlers` (`ID`, `SORT`, `ACTIVE`, `CLASS_NAME`, `CONFIG`) VALUES
	(1, 100, 'N', '\\Bitrix\\Main\\Service\\GeoIp\\MaxMind', NULL),
	(2, 110, 'Y', '\\Bitrix\\Main\\Service\\GeoIp\\SypexGeo', NULL);
/*!40000 ALTER TABLE `b_geoip_handlers` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_group
DROP TABLE IF EXISTS `b_group`;
CREATE TABLE IF NOT EXISTS `b_group` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `C_SORT` int(18) NOT NULL DEFAULT 100,
  `ANONYMOUS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IS_SYSTEM` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECURITY_POLICY` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `STRING_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_group: ~4 rows (приблизительно)
DELETE FROM `b_group`;
/*!40000 ALTER TABLE `b_group` DISABLE KEYS */;
INSERT INTO `b_group` (`ID`, `TIMESTAMP_X`, `ACTIVE`, `C_SORT`, `ANONYMOUS`, `IS_SYSTEM`, `NAME`, `DESCRIPTION`, `SECURITY_POLICY`, `STRING_ID`) VALUES
	(1, NULL, 'Y', 1, 'N', 'Y', 'Администраторы', 'Полный доступ к управлению сайтом.', NULL, NULL),
	(2, NULL, 'Y', 2, 'Y', 'Y', 'Все пользователи (в том числе неавторизованные)', 'Все пользователи, включая неавторизованных.', NULL, NULL),
	(3, NULL, 'Y', 3, 'N', 'Y', 'Пользователи, имеющие право голосовать за рейтинг', 'В эту группу пользователи добавляются автоматически.', NULL, 'RATING_VOTE'),
	(4, NULL, 'Y', 4, 'N', 'Y', 'Пользователи имеющие право голосовать за авторитет', 'В эту группу пользователи добавляются автоматически.', NULL, 'RATING_VOTE_AUTHORITY');
/*!40000 ALTER TABLE `b_group` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_group_collection_task
DROP TABLE IF EXISTS `b_group_collection_task`;
CREATE TABLE IF NOT EXISTS `b_group_collection_task` (
  `GROUP_ID` int(11) NOT NULL,
  `TASK_ID` int(11) NOT NULL,
  `COLLECTION_ID` int(11) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`TASK_ID`,`COLLECTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_group_collection_task: ~0 rows (приблизительно)
DELETE FROM `b_group_collection_task`;
/*!40000 ALTER TABLE `b_group_collection_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_group_collection_task` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_group_subordinate
DROP TABLE IF EXISTS `b_group_subordinate`;
CREATE TABLE IF NOT EXISTS `b_group_subordinate` (
  `ID` int(18) NOT NULL,
  `AR_SUBGROUP_ID` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_group_subordinate: ~0 rows (приблизительно)
DELETE FROM `b_group_subordinate`;
/*!40000 ALTER TABLE `b_group_subordinate` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_group_subordinate` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_group_task
DROP TABLE IF EXISTS `b_group_task`;
CREATE TABLE IF NOT EXISTS `b_group_task` (
  `GROUP_ID` int(18) NOT NULL,
  `TASK_ID` int(18) NOT NULL,
  `EXTERNAL_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`GROUP_ID`,`TASK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_group_task: ~0 rows (приблизительно)
DELETE FROM `b_group_task`;
/*!40000 ALTER TABLE `b_group_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_group_task` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_hlblock_entity
DROP TABLE IF EXISTS `b_hlblock_entity`;
CREATE TABLE IF NOT EXISTS `b_hlblock_entity` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `TABLE_NAME` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_hlblock_entity: ~0 rows (приблизительно)
DELETE FROM `b_hlblock_entity`;
/*!40000 ALTER TABLE `b_hlblock_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_hlblock_entity` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_hlblock_entity_lang
DROP TABLE IF EXISTS `b_hlblock_entity_lang`;
CREATE TABLE IF NOT EXISTS `b_hlblock_entity_lang` (
  `ID` int(11) unsigned NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_hlblock_entity_lang: ~0 rows (приблизительно)
DELETE FROM `b_hlblock_entity_lang`;
/*!40000 ALTER TABLE `b_hlblock_entity_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_hlblock_entity_lang` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_hlblock_entity_rights
DROP TABLE IF EXISTS `b_hlblock_entity_rights`;
CREATE TABLE IF NOT EXISTS `b_hlblock_entity_rights` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `HL_ID` int(11) unsigned NOT NULL,
  `TASK_ID` int(11) unsigned NOT NULL,
  `ACCESS_CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_hlblock_entity_rights: ~0 rows (приблизительно)
DELETE FROM `b_hlblock_entity_rights`;
/*!40000 ALTER TABLE `b_hlblock_entity_rights` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_hlblock_entity_rights` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_hot_keys
DROP TABLE IF EXISTS `b_hot_keys`;
CREATE TABLE IF NOT EXISTS `b_hot_keys` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `KEYS_STRING` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `CODE_ID` int(18) NOT NULL,
  `USER_ID` int(18) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_b_hot_keys_co_u` (`CODE_ID`,`USER_ID`),
  KEY `ix_hot_keys_user` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_hot_keys: ~24 rows (приблизительно)
DELETE FROM `b_hot_keys`;
/*!40000 ALTER TABLE `b_hot_keys` DISABLE KEYS */;
INSERT INTO `b_hot_keys` (`ID`, `KEYS_STRING`, `CODE_ID`, `USER_ID`) VALUES
	(1, 'Ctrl+Alt+85', 139, 0),
	(2, 'Ctrl+Alt+80', 17, 0),
	(3, 'Ctrl+Alt+70', 120, 0),
	(4, 'Ctrl+Alt+68', 117, 0),
	(5, 'Ctrl+Alt+81', 3, 0),
	(6, 'Ctrl+Alt+75', 106, 0),
	(7, 'Ctrl+Alt+79', 133, 0),
	(8, 'Ctrl+Alt+70', 121, 0),
	(9, 'Ctrl+Alt+69', 118, 0),
	(10, 'Ctrl+Shift+83', 87, 0),
	(11, 'Ctrl+Shift+88', 88, 0),
	(12, 'Ctrl+Shift+76', 89, 0),
	(13, 'Ctrl+Alt+85', 139, 1),
	(14, 'Ctrl+Alt+80', 17, 1),
	(15, 'Ctrl+Alt+70', 120, 1),
	(16, 'Ctrl+Alt+68', 117, 1),
	(17, 'Ctrl+Alt+81', 3, 1),
	(18, 'Ctrl+Alt+75', 106, 1),
	(19, 'Ctrl+Alt+79', 133, 1),
	(20, 'Ctrl+Alt+70', 121, 1),
	(21, 'Ctrl+Alt+69', 118, 1),
	(22, 'Ctrl+Shift+83', 87, 1),
	(23, 'Ctrl+Shift+88', 88, 1),
	(24, 'Ctrl+Shift+76', 89, 1);
/*!40000 ALTER TABLE `b_hot_keys` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_hot_keys_code
DROP TABLE IF EXISTS `b_hot_keys_code`;
CREATE TABLE IF NOT EXISTS `b_hot_keys_code` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CLASS_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMMENTS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TITLE_OBJ` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IS_CUSTOM` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`ID`),
  KEY `ix_hot_keys_code_cn` (`CLASS_NAME`),
  KEY `ix_hot_keys_code_url` (`URL`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_hot_keys_code: ~79 rows (приблизительно)
DELETE FROM `b_hot_keys_code`;
/*!40000 ALTER TABLE `b_hot_keys_code` DISABLE KEYS */;
INSERT INTO `b_hot_keys_code` (`ID`, `CLASS_NAME`, `CODE`, `NAME`, `COMMENTS`, `TITLE_OBJ`, `URL`, `IS_CUSTOM`) VALUES
	(3, 'CAdminTabControl', 'NextTab();', 'HK_DB_CADMINTC', 'HK_DB_CADMINTC_C', 'tab-container', '', 0),
	(5, 'btn_new', 'var d=BX (\'btn_new\'); if (d) location.href = d.href;', 'HK_DB_BUT_ADD', 'HK_DB_BUT_ADD_C', 'btn_new', '', 0),
	(6, 'btn_excel', 'var d=BX(\'btn_excel\'); if (d) location.href = d.href;', 'HK_DB_BUT_EXL', 'HK_DB_BUT_EXL_C', 'btn_excel', '', 0),
	(7, 'btn_settings', 'var d=BX(\'btn_settings\'); if (d) location.href = d.href;', 'HK_DB_BUT_OPT', 'HK_DB_BUT_OPT_C', 'btn_settings', '', 0),
	(8, 'btn_list', 'var d=BX(\'btn_list\'); if (d) location.href = d.href;', 'HK_DB_BUT_LST', 'HK_DB_BUT_LST_C', 'btn_list', '', 0),
	(9, 'Edit_Save_Button', 'var d=BX .findChild(document, {attribute: {\'name\': \'save\'}}, true );  if (d) d.click();', 'HK_DB_BUT_SAVE', 'HK_DB_BUT_SAVE_C', 'Edit_Save_Button', '', 0),
	(10, 'btn_delete', 'var d=BX(\'btn_delete\'); if (d) location.href = d.href;', 'HK_DB_BUT_DEL', 'HK_DB_BUT_DEL_C', 'btn_delete', '', 0),
	(12, 'CAdminFilter', 'var d=BX .findChild(document, {attribute: {\'name\': \'find\'}}, true ); if (d) d.focus();', 'HK_DB_FLT_FND', 'HK_DB_FLT_FND_C', 'find', '', 0),
	(13, 'CAdminFilter', 'var d=BX .findChild(document, {attribute: {\'name\': \'set_filter\'}}, true );  if (d) d.click();', 'HK_DB_FLT_BUT_F', 'HK_DB_FLT_BUT_F_C', 'set_filter', '', 0),
	(14, 'CAdminFilter', 'var d=BX .findChild(document, {attribute: {\'name\': \'del_filter\'}}, true );  if (d) d.click();', 'HK_DB_FLT_BUT_CNL', 'HK_DB_FLT_BUT_CNL_C', 'del_filter', '', 0),
	(15, 'bx-panel-admin-button-help-icon-id', 'var d=BX(\'bx-panel-admin-button-help-icon-id\'); if (d) location.href = d.href;', 'HK_DB_BUT_HLP', 'HK_DB_BUT_HLP_C', 'bx-panel-admin-button-help-icon-id', '', 0),
	(17, 'Global', 'BXHotKeys.ShowSettings();', 'HK_DB_SHW_L', 'HK_DB_SHW_L_C', 'bx-panel-hotkeys', '', 0),
	(19, 'Edit_Apply_Button', 'var d=BX .findChild(document, {attribute: {\'name\': \'apply\'}}, true );  if (d) d.click();', 'HK_DB_BUT_APPL', 'HK_DB_BUT_APPL_C', 'Edit_Apply_Button', '', 0),
	(20, 'Edit_Cancel_Button', 'var d=BX .findChild(document, {attribute: {\'name\': \'cancel\'}}, true );  if (d) d.click();', 'HK_DB_BUT_CANCEL', 'HK_DB_BUT_CANCEL_C', 'Edit_Cancel_Button', '', 0),
	(54, 'top_panel_org_fav', '', '-=AUTONAME=-', NULL, 'top_panel_org_fav', NULL, 0),
	(55, 'top_panel_module_settings', '', '-=AUTONAME=-', NULL, 'top_panel_module_settings', '', 0),
	(56, 'top_panel_interface_settings', '', '-=AUTONAME=-', NULL, 'top_panel_interface_settings', '', 0),
	(57, 'top_panel_help', '', '-=AUTONAME=-', NULL, 'top_panel_help', '', 0),
	(58, 'top_panel_bizproc_tasks', '', '-=AUTONAME=-', NULL, 'top_panel_bizproc_tasks', '', 0),
	(59, 'top_panel_add_fav', '', '-=AUTONAME=-', NULL, 'top_panel_add_fav', NULL, 0),
	(60, 'top_panel_create_page', '', '-=AUTONAME=-', NULL, 'top_panel_create_page', '', 0),
	(62, 'top_panel_create_folder', '', '-=AUTONAME=-', NULL, 'top_panel_create_folder', '', 0),
	(63, 'top_panel_edit_page', '', '-=AUTONAME=-', NULL, 'top_panel_edit_page', '', 0),
	(64, 'top_panel_page_prop', '', '-=AUTONAME=-', NULL, 'top_panel_page_prop', '', 0),
	(65, 'top_panel_edit_page_html', '', '-=AUTONAME=-', NULL, 'top_panel_edit_page_html', '', 0),
	(67, 'top_panel_edit_page_php', '', '-=AUTONAME=-', NULL, 'top_panel_edit_page_php', '', 0),
	(68, 'top_panel_del_page', '', '-=AUTONAME=-', NULL, 'top_panel_del_page', '', 0),
	(69, 'top_panel_folder_prop', '', '-=AUTONAME=-', NULL, 'top_panel_folder_prop', '', 0),
	(70, 'top_panel_access_folder_new', '', '-=AUTONAME=-', NULL, 'top_panel_access_folder_new', '', 0),
	(71, 'main_top_panel_struct_panel', '', '-=AUTONAME=-', NULL, 'main_top_panel_struct_panel', '', 0),
	(72, 'top_panel_cache_page', '', '-=AUTONAME=-', NULL, 'top_panel_cache_page', '', 0),
	(73, 'top_panel_cache_comp', '', '-=AUTONAME=-', NULL, 'top_panel_cache_comp', '', 0),
	(74, 'top_panel_cache_not', '', '-=AUTONAME=-', NULL, 'top_panel_cache_not', '', 0),
	(75, 'top_panel_edit_mode', '', '-=AUTONAME=-', NULL, 'top_panel_edit_mode', '', 0),
	(76, 'top_panel_templ_site_css', '', '-=AUTONAME=-', NULL, 'top_panel_templ_site_css', '', 0),
	(77, 'top_panel_templ_templ_css', '', '-=AUTONAME=-', NULL, 'top_panel_templ_templ_css', '', 0),
	(78, 'top_panel_templ_site', '', '-=AUTONAME=-', NULL, 'top_panel_templ_site', '', 0),
	(81, 'top_panel_debug_time', '', '-=AUTONAME=-', NULL, 'top_panel_debug_time', '', 0),
	(82, 'top_panel_debug_incl', '', '-=AUTONAME=-', NULL, 'top_panel_debug_incl', '', 0),
	(83, 'top_panel_debug_sql', '', '-=AUTONAME=-', NULL, 'top_panel_debug_sql', NULL, 0),
	(84, 'top_panel_debug_compr', '', '-=AUTONAME=-', NULL, 'top_panel_debug_compr', '', 0),
	(85, 'MTP_SHORT_URI1', '', '-=AUTONAME=-', NULL, 'MTP_SHORT_URI1', '', 0),
	(86, 'MTP_SHORT_URI_LIST', '', '-=AUTONAME=-', NULL, 'MTP_SHORT_URI_LIST', '', 0),
	(87, 'FMST_PANEL_STICKER_ADD', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_STICKER_ADD', '', 0),
	(88, 'FMST_PANEL_STICKERS_SHOW', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_STICKERS_SHOW', '', 0),
	(89, 'FMST_PANEL_CUR_STICKER_LIST', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_CUR_STICKER_LIST', '', 0),
	(90, 'FMST_PANEL_ALL_STICKER_LIST', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_ALL_STICKER_LIST', '', 0),
	(91, 'top_panel_menu', 'var d=BX("bx-panel-menu"); if (d) d.click();', '-=AUTONAME=-', NULL, 'bx-panel-menu', '', 0),
	(92, 'top_panel_admin', 'var d=BX(\'bx-panel-admin-tab\'); if (d) location.href = d.href;', '-=AUTONAME=-', NULL, 'bx-panel-admin-tab', '', 0),
	(93, 'admin_panel_site', 'var d=BX(\'bx-panel-view-tab\'); if (d) location.href = d.href;', '-=AUTONAME=-', NULL, 'bx-panel-view-tab', '', 0),
	(94, 'admin_panel_admin', 'var d=BX(\'bx-panel-admin-tab\'); if (d) location.href = d.href;', '-=AUTONAME=-', NULL, 'bx-panel-admin-tab', '', 0),
	(96, 'top_panel_folder_prop_new', '', '-=AUTONAME=-', NULL, 'top_panel_folder_prop_new', '', 0),
	(97, 'main_top_panel_structure', '', '-=AUTONAME=-', NULL, 'main_top_panel_structure', '', 0),
	(98, 'top_panel_clear_cache', '', '-=AUTONAME=-', NULL, 'top_panel_clear_cache', '', 0),
	(99, 'top_panel_templ', '', '-=AUTONAME=-', NULL, 'top_panel_templ', '', 0),
	(100, 'top_panel_debug', '', '-=AUTONAME=-', NULL, 'top_panel_debug', '', 0),
	(101, 'MTP_SHORT_URI', '', '-=AUTONAME=-', NULL, 'MTP_SHORT_URI', '', 0),
	(102, 'FMST_PANEL_STICKERS', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_STICKERS', '', 0),
	(103, 'top_panel_settings', '', '-=AUTONAME=-', NULL, 'top_panel_settings', '', 0),
	(104, 'top_panel_fav', '', '-=AUTONAME=-', NULL, 'top_panel_fav', '', 0),
	(106, 'Global', 'location.href=\'/bitrix/admin/hot_keys_list.php?lang=ru\';', 'HK_DB_SHW_HK', '', '', '', 0),
	(107, 'top_panel_edit_new', '', '-=AUTONAME=-', NULL, 'top_panel_edit_new', '', 0),
	(108, 'FLOW_PANEL_CREATE_WITH_WF', '', '-=AUTONAME=-', NULL, 'FLOW_PANEL_CREATE_WITH_WF', '', 0),
	(109, 'FLOW_PANEL_EDIT_WITH_WF', '', '-=AUTONAME=-', NULL, 'FLOW_PANEL_EDIT_WITH_WF', '', 0),
	(110, 'FLOW_PANEL_HISTORY', '', '-=AUTONAME=-', NULL, 'FLOW_PANEL_HISTORY', '', 0),
	(111, 'top_panel_create_new', '', '-=AUTONAME=-', NULL, 'top_panel_create_new', '', 0),
	(112, 'top_panel_create_folder_new', '', '-=AUTONAME=-', NULL, 'top_panel_create_folder_new', '', 0),
	(116, 'bx-panel-toggle', '', '-=AUTONAME=-', NULL, 'bx-panel-toggle', '', 0),
	(117, 'bx-panel-small-toggle', '', '-=AUTONAME=-', NULL, 'bx-panel-small-toggle', '', 0),
	(118, 'bx-panel-expander', 'var d=BX(\'bx-panel-expander\'); if (d) BX.fireEvent(d, \'click\');', '-=AUTONAME=-', NULL, 'bx-panel-expander', '', 0),
	(119, 'bx-panel-hider', 'var d=BX(\'bx-panel-hider\'); if (d) d.click();', '-=AUTONAME=-', NULL, 'bx-panel-hider', '', 0),
	(120, 'search-textbox-input', 'var d=BX(\'search-textbox-input\'); if (d) { d.click(); d.focus();}', '-=AUTONAME=-', '', 'search', '', 0),
	(121, 'bx-search-input', 'var d=BX(\'bx-search-input\'); if (d) { d.click(); d.focus(); }', '-=AUTONAME=-', '', 'bx-search-input', '', 0),
	(133, 'bx-panel-logout', 'var d=BX(\'bx-panel-logout\'); if (d) location.href = d.href;', '-=AUTONAME=-', '', 'bx-panel-logout', '', 0),
	(135, 'CDialog', 'var d=BX(\'cancel\'); if (d) d.click();', 'HK_DB_D_CANCEL', '', 'cancel', '', 0),
	(136, 'CDialog', 'var d=BX(\'close\'); if (d) d.click();', 'HK_DB_D_CLOSE', '', 'close', '', 0),
	(137, 'CDialog', 'var d=BX(\'savebtn\'); if (d) d.click();', 'HK_DB_D_SAVE', '', 'savebtn', '', 0),
	(138, 'CDialog', 'var d=BX(\'btn_popup_save\'); if (d) d.click();', 'HK_DB_D_EDIT_SAVE', '', 'btn_popup_save', '', 0),
	(139, 'Global', 'location.href=\'/bitrix/admin/user_admin.php?lang=\'+phpVars.LANGUAGE_ID;', 'HK_DB_SHW_U', '', '', '', 0);
/*!40000 ALTER TABLE `b_hot_keys_code` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_iblock
DROP TABLE IF EXISTS `b_iblock`;
CREATE TABLE IF NOT EXISTS `b_iblock` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `IBLOCK_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `API_CODE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT 500,
  `LIST_PAGE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DETAIL_PAGE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTION_PAGE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CANONICAL_PAGE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PICTURE` int(18) DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `RSS_TTL` int(11) NOT NULL DEFAULT 24,
  `RSS_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `RSS_FILE_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `RSS_FILE_LIMIT` int(11) DEFAULT NULL,
  `RSS_FILE_DAYS` int(11) DEFAULT NULL,
  `RSS_YANDEX_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INDEX_ELEMENT` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `INDEX_SECTION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `WORKFLOW` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `BIZPROC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SECTION_CHOOSER` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIST_MODE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RIGHTS_MODE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTION_PROPERTY` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PROPERTY_INDEX` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT 1,
  `LAST_CONV_ELEMENT` int(11) NOT NULL DEFAULT 0,
  `SOCNET_GROUP_ID` int(18) DEFAULT NULL,
  `EDIT_FILE_BEFORE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EDIT_FILE_AFTER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTIONS_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTION_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ELEMENTS_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ELEMENT_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_iblock_api_code` (`API_CODE`),
  KEY `ix_iblock` (`IBLOCK_TYPE_ID`,`LID`,`ACTIVE`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_iblock: ~3 rows (приблизительно)
DELETE FROM `b_iblock`;
/*!40000 ALTER TABLE `b_iblock` DISABLE KEYS */;
INSERT INTO `b_iblock` (`ID`, `TIMESTAMP_X`, `IBLOCK_TYPE_ID`, `LID`, `CODE`, `API_CODE`, `NAME`, `ACTIVE`, `SORT`, `LIST_PAGE_URL`, `DETAIL_PAGE_URL`, `SECTION_PAGE_URL`, `CANONICAL_PAGE_URL`, `PICTURE`, `DESCRIPTION`, `DESCRIPTION_TYPE`, `RSS_TTL`, `RSS_ACTIVE`, `RSS_FILE_ACTIVE`, `RSS_FILE_LIMIT`, `RSS_FILE_DAYS`, `RSS_YANDEX_ACTIVE`, `XML_ID`, `TMP_ID`, `INDEX_ELEMENT`, `INDEX_SECTION`, `WORKFLOW`, `BIZPROC`, `SECTION_CHOOSER`, `LIST_MODE`, `RIGHTS_MODE`, `SECTION_PROPERTY`, `PROPERTY_INDEX`, `VERSION`, `LAST_CONV_ELEMENT`, `SOCNET_GROUP_ID`, `EDIT_FILE_BEFORE`, `EDIT_FILE_AFTER`, `SECTIONS_NAME`, `SECTION_NAME`, `ELEMENTS_NAME`, `ELEMENT_NAME`) VALUES
	(4, '2021-01-23 17:33:36', 'why_us', 's1', 'why_us', NULL, 'Почему выбирают нас', 'Y', 500, '#SITE_DIR#/why_us/index.php?ID=#IBLOCK_ID#', '#SITE_DIR#/why_us/detail.php?ID=#ELEMENT_ID#', '#SITE_DIR#/why_us/list.php?SECTION_ID=#SECTION_ID#', '', NULL, '', 'html', 24, 'Y', 'N', NULL, NULL, 'N', NULL, NULL, 'Y', 'Y', 'N', 'N', 'L', '', 'S', 'N', 'N', 1, 0, NULL, '', '', 'Разделы', 'Раздел', 'Элементы', 'Элемент'),
	(5, '2021-01-23 17:03:41', 'reviews', 's1', 'reviews', NULL, 'Отзывы и благодарности', 'Y', 500, '#SITE_DIR#/reviews/index.php?ID=#IBLOCK_ID#', '#SITE_DIR#/reviews/detail.php?ID=#ELEMENT_ID#', '#SITE_DIR#/reviews/list.php?SECTION_ID=#SECTION_ID#', '', NULL, '', 'text', 24, 'Y', 'N', NULL, NULL, 'N', NULL, NULL, 'Y', 'Y', 'N', 'N', 'L', '', 'S', 'N', 'N', 1, 0, NULL, '', '', 'Разделы', 'Раздел', 'Элементы', 'Элемент'),
	(6, '2021-01-23 17:04:17', 'contacts', 's1', 'contacts', NULL, 'Контактная информация', 'Y', 500, '#SITE_DIR#/contacts/index.php?ID=#IBLOCK_ID#', '#SITE_DIR#/contacts/detail.php?ID=#ELEMENT_ID#', '#SITE_DIR#/contacts/list.php?SECTION_ID=#SECTION_ID#', '', NULL, '', 'text', 24, 'Y', 'N', NULL, NULL, 'N', NULL, NULL, 'Y', 'Y', 'N', 'N', 'L', '', 'S', 'N', 'N', 1, 0, NULL, '', '', 'Разделы', 'Раздел', 'Элементы', 'Элемент');
/*!40000 ALTER TABLE `b_iblock` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_iblock_cache
DROP TABLE IF EXISTS `b_iblock_cache`;
CREATE TABLE IF NOT EXISTS `b_iblock_cache` (
  `CACHE_KEY` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `CACHE` longtext COLLATE utf8_unicode_ci NOT NULL,
  `CACHE_DATE` datetime NOT NULL,
  PRIMARY KEY (`CACHE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_iblock_cache: ~0 rows (приблизительно)
DELETE FROM `b_iblock_cache`;
/*!40000 ALTER TABLE `b_iblock_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_cache` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_iblock_element
DROP TABLE IF EXISTS `b_iblock_element`;
CREATE TABLE IF NOT EXISTS `b_iblock_element` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `MODIFIED_BY` int(18) DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `CREATED_BY` int(18) DEFAULT NULL,
  `IBLOCK_ID` int(11) NOT NULL DEFAULT 0,
  `IBLOCK_SECTION_ID` int(11) DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ACTIVE_FROM` datetime DEFAULT NULL,
  `ACTIVE_TO` datetime DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT 500,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PREVIEW_PICTURE` int(18) DEFAULT NULL,
  `PREVIEW_TEXT` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREVIEW_TEXT_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `DETAIL_PICTURE` int(18) DEFAULT NULL,
  `DETAIL_TEXT` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `DETAIL_TEXT_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `SEARCHABLE_CONTENT` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `WF_STATUS_ID` int(18) DEFAULT 1,
  `WF_PARENT_ELEMENT_ID` int(11) DEFAULT NULL,
  `WF_NEW` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WF_LOCKED_BY` int(18) DEFAULT NULL,
  `WF_DATE_LOCK` datetime DEFAULT NULL,
  `WF_COMMENTS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `IN_SECTIONS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAGS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WF_LAST_HISTORY_ID` int(11) DEFAULT NULL,
  `SHOW_COUNTER` int(18) DEFAULT NULL,
  `SHOW_COUNTER_START` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_element_1` (`IBLOCK_ID`,`IBLOCK_SECTION_ID`),
  KEY `ix_iblock_element_4` (`IBLOCK_ID`,`XML_ID`,`WF_PARENT_ELEMENT_ID`),
  KEY `ix_iblock_element_3` (`WF_PARENT_ELEMENT_ID`),
  KEY `ix_iblock_element_code` (`IBLOCK_ID`,`CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_iblock_element: ~13 rows (приблизительно)
DELETE FROM `b_iblock_element`;
/*!40000 ALTER TABLE `b_iblock_element` DISABLE KEYS */;
INSERT INTO `b_iblock_element` (`ID`, `TIMESTAMP_X`, `MODIFIED_BY`, `DATE_CREATE`, `CREATED_BY`, `IBLOCK_ID`, `IBLOCK_SECTION_ID`, `ACTIVE`, `ACTIVE_FROM`, `ACTIVE_TO`, `SORT`, `NAME`, `PREVIEW_PICTURE`, `PREVIEW_TEXT`, `PREVIEW_TEXT_TYPE`, `DETAIL_PICTURE`, `DETAIL_TEXT`, `DETAIL_TEXT_TYPE`, `SEARCHABLE_CONTENT`, `WF_STATUS_ID`, `WF_PARENT_ELEMENT_ID`, `WF_NEW`, `WF_LOCKED_BY`, `WF_DATE_LOCK`, `WF_COMMENTS`, `IN_SECTIONS`, `XML_ID`, `CODE`, `TAGS`, `TMP_ID`, `WF_LAST_HISTORY_ID`, `SHOW_COUNTER`, `SHOW_COUNTER_START`) VALUES
	(4, '2021-01-24 12:33:50', 1, '2021-01-24 12:33:50', 1, 4, NULL, 'Y', NULL, NULL, 500, 'Более 7 лет', 1, 'Работаем одним составом', 'text', NULL, '', 'text', 'БОЛЕЕ 7 ЛЕТ\r\nРАБОТАЕМ ОДНИМ СОСТАВОМ\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '4', 'bolee-7-let', '', '0', NULL, NULL, NULL),
	(5, '2021-01-24 12:34:23', 1, '2021-01-24 12:34:23', 1, 4, NULL, 'Y', NULL, NULL, 500, 'Бесплатный замер', 2, 'Выезд в день обращения, производим расчет сразу на месте', 'text', NULL, '', 'text', 'БЕСПЛАТНЫЙ ЗАМЕР\r\nВЫЕЗД В ДЕНЬ ОБРАЩЕНИЯ, ПРОИЗВОДИМ РАСЧЕТ СРАЗУ НА МЕСТЕ\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '5', 'besplatnyy-zamer', '', '0', NULL, NULL, NULL),
	(6, '2021-01-24 13:01:02', 1, '2021-01-24 13:01:02', 1, 5, NULL, 'Y', NULL, NULL, 500, 'благодарность1', 3, '', 'text', NULL, '', 'text', 'БЛАГОДАРНОСТЬ1\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '6', 'reviews', '', '0', NULL, NULL, NULL),
	(7, '2021-01-24 13:01:30', 1, '2021-01-24 13:01:30', 1, 5, NULL, 'Y', NULL, NULL, 500, 'благодарность2', 4, '', 'text', NULL, '', 'text', 'БЛАГОДАРНОСТЬ2\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '7', '', '', '0', NULL, NULL, NULL),
	(8, '2021-01-24 13:02:16', 1, '2021-01-24 13:02:16', 1, 5, NULL, 'Y', NULL, NULL, 500, 'благодарность3', 5, '', 'text', NULL, '', 'text', 'БЛАГОДАРНОСТЬ3\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '8', '', '', '0', NULL, NULL, NULL),
	(9, '2021-01-24 13:02:34', 1, '2021-01-24 13:02:34', 1, 5, NULL, 'Y', NULL, NULL, 500, 'благодарность4', 6, '', 'text', NULL, '', 'text', 'БЛАГОДАРНОСТЬ4\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '9', '', '', '0', NULL, NULL, NULL),
	(10, '2021-01-24 13:56:04', 1, '2021-01-24 13:56:01', 1, 4, NULL, 'Y', NULL, NULL, 500, 'Бесплатно', 7, 'Сервисное обслуживание всех выполненных работ', 'text', NULL, '', 'text', 'БЕСПЛАТНО\r\nСЕРВИСНОЕ ОБСЛУЖИВАНИЕ ВСЕХ ВЫПОЛНЕННЫХ РАБОТ\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '10', 'besplatno', '', '0', NULL, NULL, NULL),
	(11, '2021-01-24 13:56:30', 1, '2021-01-24 13:56:30', 1, 4, NULL, 'Y', NULL, NULL, 500, 'Высокое качество', 8, 'Монтажных работ\r\nи обслуживания', 'text', NULL, '', 'text', 'ВЫСОКОЕ КАЧЕСТВО\r\nМОНТАЖНЫХ РАБОТ\r\nИ ОБСЛУЖИВАНИЯ\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '11', 'vysokoe-kachestvo', '', '0', NULL, NULL, NULL),
	(12, '2021-01-24 13:56:57', 1, '2021-01-24 13:56:57', 1, 4, NULL, 'Y', NULL, NULL, 500, 'Гос. заказчики', 9, 'Довольны нашей работой', 'text', NULL, '', 'text', 'ГОС. ЗАКАЗЧИКИ\r\nДОВОЛЬНЫ НАШЕЙ РАБОТОЙ\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '12', 'gos-zakazchiki', '', '0', NULL, NULL, NULL),
	(13, '2021-01-24 14:28:51', 1, '2021-01-24 14:20:05', 1, 6, NULL, 'Y', NULL, NULL, 500, 'adress', 10, 'г. Новосибирск, ул. Ленина, д.1, \r\nофис 100', 'text', NULL, '', 'text', 'ADRESS\r\nГ. НОВОСИБИРСК, УЛ. ЛЕНИНА, Д.1, \r\nОФИС 100\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '13', '', '', '0', NULL, NULL, NULL),
	(14, '2021-01-24 14:28:30', 1, '2021-01-24 14:20:46', 1, 6, NULL, 'Y', NULL, NULL, 500, 'schedule', 11, '10:00 - 20:00, \r\nбез выходных', 'text', NULL, '', 'text', 'SCHEDULE\r\n10:00 - 20:00, \r\nБЕЗ ВЫХОДНЫХ\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '14', '', '', '0', NULL, NULL, NULL),
	(15, '2021-01-24 14:26:37', 1, '2021-01-24 14:21:16', 1, 6, NULL, 'Y', NULL, NULL, 500, 'phone', 12, '8 (383) 000-00-00', 'text', NULL, '', 'text', 'PHONE\r\n8 (383) 000-00-00\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '15', '', '', '0', NULL, NULL, NULL),
	(17, '2021-01-24 14:36:29', 1, '2021-01-24 14:36:29', 1, 6, NULL, 'Y', NULL, NULL, 500, 'email', 14, 'ampir_nsk@mail.ru', 'text', NULL, '', 'text', 'EMAIL\r\nAMPIR_NSK@MAIL.RU\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '17', '', '', '0', NULL, NULL, NULL);
/*!40000 ALTER TABLE `b_iblock_element` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_iblock_element_iprop
DROP TABLE IF EXISTS `b_iblock_element_iprop`;
CREATE TABLE IF NOT EXISTS `b_iblock_element_iprop` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `ELEMENT_ID` int(11) NOT NULL,
  `IPROP_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ELEMENT_ID`,`IPROP_ID`),
  KEY `ix_b_iblock_element_iprop_0` (`IPROP_ID`),
  KEY `ix_b_iblock_element_iprop_1` (`IBLOCK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_iblock_element_iprop: ~0 rows (приблизительно)
DELETE FROM `b_iblock_element_iprop`;
/*!40000 ALTER TABLE `b_iblock_element_iprop` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_element_iprop` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_iblock_element_lock
DROP TABLE IF EXISTS `b_iblock_element_lock`;
CREATE TABLE IF NOT EXISTS `b_iblock_element_lock` (
  `IBLOCK_ELEMENT_ID` int(11) NOT NULL,
  `DATE_LOCK` datetime DEFAULT NULL,
  `LOCKED_BY` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ELEMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_iblock_element_lock: ~0 rows (приблизительно)
DELETE FROM `b_iblock_element_lock`;
/*!40000 ALTER TABLE `b_iblock_element_lock` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_element_lock` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_iblock_element_property
DROP TABLE IF EXISTS `b_iblock_element_property`;
CREATE TABLE IF NOT EXISTS `b_iblock_element_property` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_PROPERTY_ID` int(11) NOT NULL,
  `IBLOCK_ELEMENT_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  `VALUE_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `VALUE_ENUM` int(11) DEFAULT NULL,
  `VALUE_NUM` decimal(18,4) DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_element_property_1` (`IBLOCK_ELEMENT_ID`,`IBLOCK_PROPERTY_ID`),
  KEY `ix_iblock_element_property_2` (`IBLOCK_PROPERTY_ID`),
  KEY `ix_iblock_element_prop_enum` (`VALUE_ENUM`,`IBLOCK_PROPERTY_ID`),
  KEY `ix_iblock_element_prop_num` (`VALUE_NUM`,`IBLOCK_PROPERTY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_iblock_element_property: ~0 rows (приблизительно)
DELETE FROM `b_iblock_element_property`;
/*!40000 ALTER TABLE `b_iblock_element_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_element_property` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_iblock_element_right
DROP TABLE IF EXISTS `b_iblock_element_right`;
CREATE TABLE IF NOT EXISTS `b_iblock_element_right` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `ELEMENT_ID` int(11) NOT NULL,
  `RIGHT_ID` int(11) NOT NULL,
  `IS_INHERITED` char(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`RIGHT_ID`,`ELEMENT_ID`,`SECTION_ID`),
  KEY `ix_b_iblock_element_right_1` (`ELEMENT_ID`,`IBLOCK_ID`),
  KEY `ix_b_iblock_element_right_2` (`IBLOCK_ID`,`RIGHT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_iblock_element_right: ~0 rows (приблизительно)
DELETE FROM `b_iblock_element_right`;
/*!40000 ALTER TABLE `b_iblock_element_right` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_element_right` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_iblock_fields
DROP TABLE IF EXISTS `b_iblock_fields`;
CREATE TABLE IF NOT EXISTS `b_iblock_fields` (
  `IBLOCK_ID` int(18) NOT NULL,
  `FIELD_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `IS_REQUIRED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DEFAULT_VALUE` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`FIELD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_iblock_fields: ~96 rows (приблизительно)
DELETE FROM `b_iblock_fields`;
/*!40000 ALTER TABLE `b_iblock_fields` DISABLE KEYS */;
INSERT INTO `b_iblock_fields` (`IBLOCK_ID`, `FIELD_ID`, `IS_REQUIRED`, `DEFAULT_VALUE`) VALUES
	(4, 'ACTIVE', 'Y', 'Y'),
	(4, 'ACTIVE_FROM', 'N', ''),
	(4, 'ACTIVE_TO', 'N', ''),
	(4, 'CODE', 'Y', 'a:8:{s:6:"UNIQUE";s:1:"Y";s:15:"TRANSLITERATION";s:1:"Y";s:9:"TRANS_LEN";i:100;s:10:"TRANS_CASE";s:1:"L";s:11:"TRANS_SPACE";s:1:"-";s:11:"TRANS_OTHER";s:1:"-";s:9:"TRANS_EAT";s:1:"Y";s:10:"USE_GOOGLE";s:1:"N";}'),
	(4, 'DETAIL_PICTURE', 'N', 'a:17:{s:5:"SCALE";s:1:"N";s:5:"WIDTH";s:0:"";s:6:"HEIGHT";s:0:"";s:13:"IGNORE_ERRORS";s:1:"N";s:6:"METHOD";s:8:"resample";s:11:"COMPRESSION";i:95;s:18:"USE_WATERMARK_TEXT";s:1:"N";s:14:"WATERMARK_TEXT";s:0:"";s:19:"WATERMARK_TEXT_FONT";s:0:"";s:20:"WATERMARK_TEXT_COLOR";s:0:"";s:19:"WATERMARK_TEXT_SIZE";s:0:"";s:23:"WATERMARK_TEXT_POSITION";s:2:"tl";s:18:"USE_WATERMARK_FILE";s:1:"N";s:14:"WATERMARK_FILE";s:0:"";s:20:"WATERMARK_FILE_ALPHA";s:0:"";s:23:"WATERMARK_FILE_POSITION";s:2:"tl";s:20:"WATERMARK_FILE_ORDER";N;}'),
	(4, 'DETAIL_TEXT', 'N', ''),
	(4, 'DETAIL_TEXT_TYPE', 'Y', 'text'),
	(4, 'DETAIL_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
	(4, 'IBLOCK_SECTION', 'N', 'a:1:{s:22:"KEEP_IBLOCK_SECTION_ID";s:1:"N";}'),
	(4, 'LOG_ELEMENT_ADD', 'N', NULL),
	(4, 'LOG_ELEMENT_DELETE', 'N', NULL),
	(4, 'LOG_ELEMENT_EDIT', 'N', NULL),
	(4, 'LOG_SECTION_ADD', 'N', NULL),
	(4, 'LOG_SECTION_DELETE', 'N', NULL),
	(4, 'LOG_SECTION_EDIT', 'N', NULL),
	(4, 'NAME', 'Y', ''),
	(4, 'PREVIEW_PICTURE', 'N', 'a:20:{s:11:"FROM_DETAIL";s:1:"N";s:5:"SCALE";s:1:"N";s:5:"WIDTH";s:0:"";s:6:"HEIGHT";s:0:"";s:13:"IGNORE_ERRORS";s:1:"N";s:6:"METHOD";s:8:"resample";s:11:"COMPRESSION";i:95;s:18:"DELETE_WITH_DETAIL";s:1:"N";s:18:"UPDATE_WITH_DETAIL";s:1:"N";s:18:"USE_WATERMARK_TEXT";s:1:"N";s:14:"WATERMARK_TEXT";s:0:"";s:19:"WATERMARK_TEXT_FONT";s:0:"";s:20:"WATERMARK_TEXT_COLOR";s:0:"";s:19:"WATERMARK_TEXT_SIZE";s:0:"";s:23:"WATERMARK_TEXT_POSITION";s:2:"tl";s:18:"USE_WATERMARK_FILE";s:1:"N";s:14:"WATERMARK_FILE";s:0:"";s:20:"WATERMARK_FILE_ALPHA";s:0:"";s:23:"WATERMARK_FILE_POSITION";s:2:"tl";s:20:"WATERMARK_FILE_ORDER";N;}'),
	(4, 'PREVIEW_TEXT', 'N', ''),
	(4, 'PREVIEW_TEXT_TYPE', 'Y', 'text'),
	(4, 'PREVIEW_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
	(4, 'SECTION_CODE', 'N', 'a:8:{s:6:"UNIQUE";s:1:"N";s:15:"TRANSLITERATION";s:1:"N";s:9:"TRANS_LEN";i:100;s:10:"TRANS_CASE";s:1:"L";s:11:"TRANS_SPACE";s:1:"-";s:11:"TRANS_OTHER";s:1:"-";s:9:"TRANS_EAT";s:1:"Y";s:10:"USE_GOOGLE";s:1:"N";}'),
	(4, 'SECTION_DESCRIPTION', 'N', ''),
	(4, 'SECTION_DESCRIPTION_TYPE', 'Y', 'text'),
	(4, 'SECTION_DESCRIPTION_TYPE_ALLOW_CHANGE', 'N', 'Y'),
	(4, 'SECTION_DETAIL_PICTURE', 'N', 'a:17:{s:5:"SCALE";s:1:"N";s:5:"WIDTH";s:0:"";s:6:"HEIGHT";s:0:"";s:13:"IGNORE_ERRORS";s:1:"N";s:6:"METHOD";s:8:"resample";s:11:"COMPRESSION";i:95;s:18:"USE_WATERMARK_TEXT";s:1:"N";s:14:"WATERMARK_TEXT";s:0:"";s:19:"WATERMARK_TEXT_FONT";s:0:"";s:20:"WATERMARK_TEXT_COLOR";s:0:"";s:19:"WATERMARK_TEXT_SIZE";s:0:"";s:23:"WATERMARK_TEXT_POSITION";s:2:"tl";s:18:"USE_WATERMARK_FILE";s:1:"N";s:14:"WATERMARK_FILE";s:0:"";s:20:"WATERMARK_FILE_ALPHA";s:0:"";s:23:"WATERMARK_FILE_POSITION";s:2:"tl";s:20:"WATERMARK_FILE_ORDER";N;}'),
	(4, 'SECTION_NAME', 'Y', ''),
	(4, 'SECTION_PICTURE', 'N', 'a:20:{s:11:"FROM_DETAIL";s:1:"N";s:5:"SCALE";s:1:"N";s:5:"WIDTH";s:0:"";s:6:"HEIGHT";s:0:"";s:13:"IGNORE_ERRORS";s:1:"N";s:6:"METHOD";s:8:"resample";s:11:"COMPRESSION";i:95;s:18:"DELETE_WITH_DETAIL";s:1:"N";s:18:"UPDATE_WITH_DETAIL";s:1:"N";s:18:"USE_WATERMARK_TEXT";s:1:"N";s:14:"WATERMARK_TEXT";s:0:"";s:19:"WATERMARK_TEXT_FONT";s:0:"";s:20:"WATERMARK_TEXT_COLOR";s:0:"";s:19:"WATERMARK_TEXT_SIZE";s:0:"";s:23:"WATERMARK_TEXT_POSITION";s:2:"tl";s:18:"USE_WATERMARK_FILE";s:1:"N";s:14:"WATERMARK_FILE";s:0:"";s:20:"WATERMARK_FILE_ALPHA";s:0:"";s:23:"WATERMARK_FILE_POSITION";s:2:"tl";s:20:"WATERMARK_FILE_ORDER";N;}'),
	(4, 'SECTION_XML_ID', 'N', ''),
	(4, 'SORT', 'N', '0'),
	(4, 'TAGS', 'N', ''),
	(4, 'XML_ID', 'Y', ''),
	(4, 'XML_IMPORT_START_TIME', 'N', NULL),
	(5, 'ACTIVE', 'Y', 'Y'),
	(5, 'ACTIVE_FROM', 'N', ''),
	(5, 'ACTIVE_TO', 'N', ''),
	(5, 'CODE', 'N', 'a:8:{s:6:"UNIQUE";s:1:"N";s:15:"TRANSLITERATION";s:1:"N";s:9:"TRANS_LEN";i:100;s:10:"TRANS_CASE";s:1:"L";s:11:"TRANS_SPACE";s:1:"-";s:11:"TRANS_OTHER";s:1:"-";s:9:"TRANS_EAT";s:1:"Y";s:10:"USE_GOOGLE";s:1:"N";}'),
	(5, 'DETAIL_PICTURE', 'N', 'a:17:{s:5:"SCALE";s:1:"N";s:5:"WIDTH";s:0:"";s:6:"HEIGHT";s:0:"";s:13:"IGNORE_ERRORS";s:1:"N";s:6:"METHOD";s:8:"resample";s:11:"COMPRESSION";i:95;s:18:"USE_WATERMARK_TEXT";s:1:"N";s:14:"WATERMARK_TEXT";s:0:"";s:19:"WATERMARK_TEXT_FONT";s:0:"";s:20:"WATERMARK_TEXT_COLOR";s:0:"";s:19:"WATERMARK_TEXT_SIZE";s:0:"";s:23:"WATERMARK_TEXT_POSITION";s:2:"tl";s:18:"USE_WATERMARK_FILE";s:1:"N";s:14:"WATERMARK_FILE";s:0:"";s:20:"WATERMARK_FILE_ALPHA";s:0:"";s:23:"WATERMARK_FILE_POSITION";s:2:"tl";s:20:"WATERMARK_FILE_ORDER";N;}'),
	(5, 'DETAIL_TEXT', 'N', ''),
	(5, 'DETAIL_TEXT_TYPE', 'Y', 'text'),
	(5, 'DETAIL_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
	(5, 'IBLOCK_SECTION', 'N', 'a:1:{s:22:"KEEP_IBLOCK_SECTION_ID";s:1:"N";}'),
	(5, 'LOG_ELEMENT_ADD', 'N', NULL),
	(5, 'LOG_ELEMENT_DELETE', 'N', NULL),
	(5, 'LOG_ELEMENT_EDIT', 'N', NULL),
	(5, 'LOG_SECTION_ADD', 'N', NULL),
	(5, 'LOG_SECTION_DELETE', 'N', NULL),
	(5, 'LOG_SECTION_EDIT', 'N', NULL),
	(5, 'NAME', 'Y', ''),
	(5, 'PREVIEW_PICTURE', 'N', 'a:20:{s:11:"FROM_DETAIL";s:1:"N";s:5:"SCALE";s:1:"N";s:5:"WIDTH";s:0:"";s:6:"HEIGHT";s:0:"";s:13:"IGNORE_ERRORS";s:1:"N";s:6:"METHOD";s:8:"resample";s:11:"COMPRESSION";i:95;s:18:"DELETE_WITH_DETAIL";s:1:"N";s:18:"UPDATE_WITH_DETAIL";s:1:"N";s:18:"USE_WATERMARK_TEXT";s:1:"N";s:14:"WATERMARK_TEXT";s:0:"";s:19:"WATERMARK_TEXT_FONT";s:0:"";s:20:"WATERMARK_TEXT_COLOR";s:0:"";s:19:"WATERMARK_TEXT_SIZE";s:0:"";s:23:"WATERMARK_TEXT_POSITION";s:2:"tl";s:18:"USE_WATERMARK_FILE";s:1:"N";s:14:"WATERMARK_FILE";s:0:"";s:20:"WATERMARK_FILE_ALPHA";s:0:"";s:23:"WATERMARK_FILE_POSITION";s:2:"tl";s:20:"WATERMARK_FILE_ORDER";N;}'),
	(5, 'PREVIEW_TEXT', 'N', ''),
	(5, 'PREVIEW_TEXT_TYPE', 'Y', 'text'),
	(5, 'PREVIEW_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
	(5, 'SECTION_CODE', 'N', 'a:8:{s:6:"UNIQUE";s:1:"N";s:15:"TRANSLITERATION";s:1:"N";s:9:"TRANS_LEN";i:100;s:10:"TRANS_CASE";s:1:"L";s:11:"TRANS_SPACE";s:1:"-";s:11:"TRANS_OTHER";s:1:"-";s:9:"TRANS_EAT";s:1:"Y";s:10:"USE_GOOGLE";s:1:"N";}'),
	(5, 'SECTION_DESCRIPTION', 'N', ''),
	(5, 'SECTION_DESCRIPTION_TYPE', 'Y', 'text'),
	(5, 'SECTION_DESCRIPTION_TYPE_ALLOW_CHANGE', 'N', 'Y'),
	(5, 'SECTION_DETAIL_PICTURE', 'N', 'a:17:{s:5:"SCALE";s:1:"N";s:5:"WIDTH";s:0:"";s:6:"HEIGHT";s:0:"";s:13:"IGNORE_ERRORS";s:1:"N";s:6:"METHOD";s:8:"resample";s:11:"COMPRESSION";i:95;s:18:"USE_WATERMARK_TEXT";s:1:"N";s:14:"WATERMARK_TEXT";s:0:"";s:19:"WATERMARK_TEXT_FONT";s:0:"";s:20:"WATERMARK_TEXT_COLOR";s:0:"";s:19:"WATERMARK_TEXT_SIZE";s:0:"";s:23:"WATERMARK_TEXT_POSITION";s:2:"tl";s:18:"USE_WATERMARK_FILE";s:1:"N";s:14:"WATERMARK_FILE";s:0:"";s:20:"WATERMARK_FILE_ALPHA";s:0:"";s:23:"WATERMARK_FILE_POSITION";s:2:"tl";s:20:"WATERMARK_FILE_ORDER";N;}'),
	(5, 'SECTION_NAME', 'Y', ''),
	(5, 'SECTION_PICTURE', 'N', 'a:20:{s:11:"FROM_DETAIL";s:1:"N";s:5:"SCALE";s:1:"N";s:5:"WIDTH";s:0:"";s:6:"HEIGHT";s:0:"";s:13:"IGNORE_ERRORS";s:1:"N";s:6:"METHOD";s:8:"resample";s:11:"COMPRESSION";i:95;s:18:"DELETE_WITH_DETAIL";s:1:"N";s:18:"UPDATE_WITH_DETAIL";s:1:"N";s:18:"USE_WATERMARK_TEXT";s:1:"N";s:14:"WATERMARK_TEXT";s:0:"";s:19:"WATERMARK_TEXT_FONT";s:0:"";s:20:"WATERMARK_TEXT_COLOR";s:0:"";s:19:"WATERMARK_TEXT_SIZE";s:0:"";s:23:"WATERMARK_TEXT_POSITION";s:2:"tl";s:18:"USE_WATERMARK_FILE";s:1:"N";s:14:"WATERMARK_FILE";s:0:"";s:20:"WATERMARK_FILE_ALPHA";s:0:"";s:23:"WATERMARK_FILE_POSITION";s:2:"tl";s:20:"WATERMARK_FILE_ORDER";N;}'),
	(5, 'SECTION_XML_ID', 'N', ''),
	(5, 'SORT', 'N', '0'),
	(5, 'TAGS', 'N', ''),
	(5, 'XML_ID', 'Y', ''),
	(5, 'XML_IMPORT_START_TIME', 'N', NULL),
	(6, 'ACTIVE', 'Y', 'Y'),
	(6, 'ACTIVE_FROM', 'N', ''),
	(6, 'ACTIVE_TO', 'N', ''),
	(6, 'CODE', 'N', 'a:8:{s:6:"UNIQUE";s:1:"N";s:15:"TRANSLITERATION";s:1:"N";s:9:"TRANS_LEN";i:100;s:10:"TRANS_CASE";s:1:"L";s:11:"TRANS_SPACE";s:1:"-";s:11:"TRANS_OTHER";s:1:"-";s:9:"TRANS_EAT";s:1:"Y";s:10:"USE_GOOGLE";s:1:"N";}'),
	(6, 'DETAIL_PICTURE', 'N', 'a:17:{s:5:"SCALE";s:1:"N";s:5:"WIDTH";s:0:"";s:6:"HEIGHT";s:0:"";s:13:"IGNORE_ERRORS";s:1:"N";s:6:"METHOD";s:8:"resample";s:11:"COMPRESSION";i:95;s:18:"USE_WATERMARK_TEXT";s:1:"N";s:14:"WATERMARK_TEXT";s:0:"";s:19:"WATERMARK_TEXT_FONT";s:0:"";s:20:"WATERMARK_TEXT_COLOR";s:0:"";s:19:"WATERMARK_TEXT_SIZE";s:0:"";s:23:"WATERMARK_TEXT_POSITION";s:2:"tl";s:18:"USE_WATERMARK_FILE";s:1:"N";s:14:"WATERMARK_FILE";s:0:"";s:20:"WATERMARK_FILE_ALPHA";s:0:"";s:23:"WATERMARK_FILE_POSITION";s:2:"tl";s:20:"WATERMARK_FILE_ORDER";N;}'),
	(6, 'DETAIL_TEXT', 'N', ''),
	(6, 'DETAIL_TEXT_TYPE', 'Y', 'text'),
	(6, 'DETAIL_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
	(6, 'IBLOCK_SECTION', 'N', 'a:1:{s:22:"KEEP_IBLOCK_SECTION_ID";s:1:"N";}'),
	(6, 'LOG_ELEMENT_ADD', 'N', NULL),
	(6, 'LOG_ELEMENT_DELETE', 'N', NULL),
	(6, 'LOG_ELEMENT_EDIT', 'N', NULL),
	(6, 'LOG_SECTION_ADD', 'N', NULL),
	(6, 'LOG_SECTION_DELETE', 'N', NULL),
	(6, 'LOG_SECTION_EDIT', 'N', NULL),
	(6, 'NAME', 'Y', ''),
	(6, 'PREVIEW_PICTURE', 'N', 'a:20:{s:11:"FROM_DETAIL";s:1:"N";s:5:"SCALE";s:1:"N";s:5:"WIDTH";s:0:"";s:6:"HEIGHT";s:0:"";s:13:"IGNORE_ERRORS";s:1:"N";s:6:"METHOD";s:8:"resample";s:11:"COMPRESSION";i:95;s:18:"DELETE_WITH_DETAIL";s:1:"N";s:18:"UPDATE_WITH_DETAIL";s:1:"N";s:18:"USE_WATERMARK_TEXT";s:1:"N";s:14:"WATERMARK_TEXT";s:0:"";s:19:"WATERMARK_TEXT_FONT";s:0:"";s:20:"WATERMARK_TEXT_COLOR";s:0:"";s:19:"WATERMARK_TEXT_SIZE";s:0:"";s:23:"WATERMARK_TEXT_POSITION";s:2:"tl";s:18:"USE_WATERMARK_FILE";s:1:"N";s:14:"WATERMARK_FILE";s:0:"";s:20:"WATERMARK_FILE_ALPHA";s:0:"";s:23:"WATERMARK_FILE_POSITION";s:2:"tl";s:20:"WATERMARK_FILE_ORDER";N;}'),
	(6, 'PREVIEW_TEXT', 'N', ''),
	(6, 'PREVIEW_TEXT_TYPE', 'Y', 'text'),
	(6, 'PREVIEW_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
	(6, 'SECTION_CODE', 'N', 'a:8:{s:6:"UNIQUE";s:1:"N";s:15:"TRANSLITERATION";s:1:"N";s:9:"TRANS_LEN";i:100;s:10:"TRANS_CASE";s:1:"L";s:11:"TRANS_SPACE";s:1:"-";s:11:"TRANS_OTHER";s:1:"-";s:9:"TRANS_EAT";s:1:"Y";s:10:"USE_GOOGLE";s:1:"N";}'),
	(6, 'SECTION_DESCRIPTION', 'N', ''),
	(6, 'SECTION_DESCRIPTION_TYPE', 'Y', 'text'),
	(6, 'SECTION_DESCRIPTION_TYPE_ALLOW_CHANGE', 'N', 'Y'),
	(6, 'SECTION_DETAIL_PICTURE', 'N', 'a:17:{s:5:"SCALE";s:1:"N";s:5:"WIDTH";s:0:"";s:6:"HEIGHT";s:0:"";s:13:"IGNORE_ERRORS";s:1:"N";s:6:"METHOD";s:8:"resample";s:11:"COMPRESSION";i:95;s:18:"USE_WATERMARK_TEXT";s:1:"N";s:14:"WATERMARK_TEXT";s:0:"";s:19:"WATERMARK_TEXT_FONT";s:0:"";s:20:"WATERMARK_TEXT_COLOR";s:0:"";s:19:"WATERMARK_TEXT_SIZE";s:0:"";s:23:"WATERMARK_TEXT_POSITION";s:2:"tl";s:18:"USE_WATERMARK_FILE";s:1:"N";s:14:"WATERMARK_FILE";s:0:"";s:20:"WATERMARK_FILE_ALPHA";s:0:"";s:23:"WATERMARK_FILE_POSITION";s:2:"tl";s:20:"WATERMARK_FILE_ORDER";N;}'),
	(6, 'SECTION_NAME', 'Y', ''),
	(6, 'SECTION_PICTURE', 'N', 'a:20:{s:11:"FROM_DETAIL";s:1:"N";s:5:"SCALE";s:1:"N";s:5:"WIDTH";s:0:"";s:6:"HEIGHT";s:0:"";s:13:"IGNORE_ERRORS";s:1:"N";s:6:"METHOD";s:8:"resample";s:11:"COMPRESSION";i:95;s:18:"DELETE_WITH_DETAIL";s:1:"N";s:18:"UPDATE_WITH_DETAIL";s:1:"N";s:18:"USE_WATERMARK_TEXT";s:1:"N";s:14:"WATERMARK_TEXT";s:0:"";s:19:"WATERMARK_TEXT_FONT";s:0:"";s:20:"WATERMARK_TEXT_COLOR";s:0:"";s:19:"WATERMARK_TEXT_SIZE";s:0:"";s:23:"WATERMARK_TEXT_POSITION";s:2:"tl";s:18:"USE_WATERMARK_FILE";s:1:"N";s:14:"WATERMARK_FILE";s:0:"";s:20:"WATERMARK_FILE_ALPHA";s:0:"";s:23:"WATERMARK_FILE_POSITION";s:2:"tl";s:20:"WATERMARK_FILE_ORDER";N;}'),
	(6, 'SECTION_XML_ID', 'N', ''),
	(6, 'SORT', 'N', '0'),
	(6, 'TAGS', 'N', ''),
	(6, 'XML_ID', 'Y', ''),
	(6, 'XML_IMPORT_START_TIME', 'N', NULL);
/*!40000 ALTER TABLE `b_iblock_fields` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_iblock_group
DROP TABLE IF EXISTS `b_iblock_group`;
CREATE TABLE IF NOT EXISTS `b_iblock_group` (
  `IBLOCK_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `PERMISSION` char(1) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `ux_iblock_group_1` (`IBLOCK_ID`,`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_iblock_group: ~3 rows (приблизительно)
DELETE FROM `b_iblock_group`;
/*!40000 ALTER TABLE `b_iblock_group` DISABLE KEYS */;
INSERT INTO `b_iblock_group` (`IBLOCK_ID`, `GROUP_ID`, `PERMISSION`) VALUES
	(4, 1, 'X'),
	(5, 1, 'X'),
	(6, 1, 'X');
/*!40000 ALTER TABLE `b_iblock_group` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_iblock_iblock_iprop
DROP TABLE IF EXISTS `b_iblock_iblock_iprop`;
CREATE TABLE IF NOT EXISTS `b_iblock_iblock_iprop` (
  `IBLOCK_ID` int(11) NOT NULL,
  `IPROP_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`IPROP_ID`),
  KEY `ix_b_iblock_iblock_iprop_0` (`IPROP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_iblock_iblock_iprop: ~0 rows (приблизительно)
DELETE FROM `b_iblock_iblock_iprop`;
/*!40000 ALTER TABLE `b_iblock_iblock_iprop` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_iblock_iprop` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_iblock_iproperty
DROP TABLE IF EXISTS `b_iblock_iproperty`;
CREATE TABLE IF NOT EXISTS `b_iblock_iproperty` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_ID` int(11) NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `TEMPLATE` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_iblock_iprop_0` (`IBLOCK_ID`,`ENTITY_TYPE`,`ENTITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_iblock_iproperty: ~0 rows (приблизительно)
DELETE FROM `b_iblock_iproperty`;
/*!40000 ALTER TABLE `b_iblock_iproperty` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_iproperty` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_iblock_messages
DROP TABLE IF EXISTS `b_iblock_messages`;
CREATE TABLE IF NOT EXISTS `b_iblock_messages` (
  `IBLOCK_ID` int(18) NOT NULL,
  `MESSAGE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE_TEXT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`MESSAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_iblock_messages: ~30 rows (приблизительно)
DELETE FROM `b_iblock_messages`;
/*!40000 ALTER TABLE `b_iblock_messages` DISABLE KEYS */;
INSERT INTO `b_iblock_messages` (`IBLOCK_ID`, `MESSAGE_ID`, `MESSAGE_TEXT`) VALUES
	(4, 'ELEMENT_ADD', 'Добавить элемент'),
	(4, 'ELEMENT_DELETE', 'Удалить элемент'),
	(4, 'ELEMENT_EDIT', 'Изменить элемент'),
	(4, 'ELEMENT_NAME', 'Элемент'),
	(4, 'ELEMENTS_NAME', 'Элементы'),
	(4, 'SECTION_ADD', 'Добавить раздел'),
	(4, 'SECTION_DELETE', 'Удалить раздел'),
	(4, 'SECTION_EDIT', 'Изменить раздел'),
	(4, 'SECTION_NAME', 'Раздел'),
	(4, 'SECTIONS_NAME', 'Разделы'),
	(5, 'ELEMENT_ADD', 'Добавить элемент'),
	(5, 'ELEMENT_DELETE', 'Удалить элемент'),
	(5, 'ELEMENT_EDIT', 'Изменить элемент'),
	(5, 'ELEMENT_NAME', 'Элемент'),
	(5, 'ELEMENTS_NAME', 'Элементы'),
	(5, 'SECTION_ADD', 'Добавить раздел'),
	(5, 'SECTION_DELETE', 'Удалить раздел'),
	(5, 'SECTION_EDIT', 'Изменить раздел'),
	(5, 'SECTION_NAME', 'Раздел'),
	(5, 'SECTIONS_NAME', 'Разделы'),
	(6, 'ELEMENT_ADD', 'Добавить элемент'),
	(6, 'ELEMENT_DELETE', 'Удалить элемент'),
	(6, 'ELEMENT_EDIT', 'Изменить элемент'),
	(6, 'ELEMENT_NAME', 'Элемент'),
	(6, 'ELEMENTS_NAME', 'Элементы'),
	(6, 'SECTION_ADD', 'Добавить раздел'),
	(6, 'SECTION_DELETE', 'Удалить раздел'),
	(6, 'SECTION_EDIT', 'Изменить раздел'),
	(6, 'SECTION_NAME', 'Раздел'),
	(6, 'SECTIONS_NAME', 'Разделы');
/*!40000 ALTER TABLE `b_iblock_messages` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_iblock_offers_tmp
DROP TABLE IF EXISTS `b_iblock_offers_tmp`;
CREATE TABLE IF NOT EXISTS `b_iblock_offers_tmp` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `PRODUCT_IBLOCK_ID` int(11) unsigned NOT NULL,
  `OFFERS_IBLOCK_ID` int(11) unsigned NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_iblock_offers_tmp: ~0 rows (приблизительно)
DELETE FROM `b_iblock_offers_tmp`;
/*!40000 ALTER TABLE `b_iblock_offers_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_offers_tmp` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_iblock_property
DROP TABLE IF EXISTS `b_iblock_property`;
CREATE TABLE IF NOT EXISTS `b_iblock_property` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `IBLOCK_ID` int(11) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT 500,
  `CODE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DEFAULT_VALUE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `PROPERTY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `ROW_COUNT` int(11) NOT NULL DEFAULT 1,
  `COL_COUNT` int(11) NOT NULL DEFAULT 30,
  `LIST_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'L',
  `MULTIPLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `XML_ID` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_TYPE` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MULTIPLE_CNT` int(11) DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINK_IBLOCK_ID` int(18) DEFAULT NULL,
  `WITH_DESCRIPTION` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEARCHABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `FILTRABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IS_REQUIRED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT 1,
  `USER_TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_TYPE_SETTINGS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `HINT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_property_1` (`IBLOCK_ID`),
  KEY `ix_iblock_property_3` (`LINK_IBLOCK_ID`),
  KEY `ix_iblock_property_2` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_iblock_property: ~0 rows (приблизительно)
DELETE FROM `b_iblock_property`;
/*!40000 ALTER TABLE `b_iblock_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_property` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_iblock_property_enum
DROP TABLE IF EXISTS `b_iblock_property_enum`;
CREATE TABLE IF NOT EXISTS `b_iblock_property_enum` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PROPERTY_ID` int(11) NOT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SORT` int(11) NOT NULL DEFAULT 500,
  `XML_ID` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_iblock_property_enum` (`PROPERTY_ID`,`XML_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_iblock_property_enum: ~0 rows (приблизительно)
DELETE FROM `b_iblock_property_enum`;
/*!40000 ALTER TABLE `b_iblock_property_enum` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_property_enum` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_iblock_property_feature
DROP TABLE IF EXISTS `b_iblock_property_feature`;
CREATE TABLE IF NOT EXISTS `b_iblock_property_feature` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PROPERTY_ID` int(11) NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `FEATURE_ID` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `IS_ENABLED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_iblock_property_feature` (`PROPERTY_ID`,`MODULE_ID`,`FEATURE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_iblock_property_feature: ~0 rows (приблизительно)
DELETE FROM `b_iblock_property_feature`;
/*!40000 ALTER TABLE `b_iblock_property_feature` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_property_feature` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_iblock_right
DROP TABLE IF EXISTS `b_iblock_right`;
CREATE TABLE IF NOT EXISTS `b_iblock_right` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_ID` int(11) NOT NULL,
  `GROUP_CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_TYPE` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `DO_INHERIT` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `TASK_ID` int(11) NOT NULL,
  `OP_SREAD` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `OP_EREAD` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `XML_ID` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_iblock_right_iblock_id` (`IBLOCK_ID`,`ENTITY_TYPE`,`ENTITY_ID`),
  KEY `ix_b_iblock_right_group_code` (`GROUP_CODE`,`IBLOCK_ID`),
  KEY `ix_b_iblock_right_entity` (`ENTITY_ID`,`ENTITY_TYPE`),
  KEY `ix_b_iblock_right_op_eread` (`ID`,`OP_EREAD`,`GROUP_CODE`),
  KEY `ix_b_iblock_right_op_sread` (`ID`,`OP_SREAD`,`GROUP_CODE`),
  KEY `ix_b_iblock_right_task_id` (`TASK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_iblock_right: ~0 rows (приблизительно)
DELETE FROM `b_iblock_right`;
/*!40000 ALTER TABLE `b_iblock_right` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_right` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_iblock_rss
DROP TABLE IF EXISTS `b_iblock_rss`;
CREATE TABLE IF NOT EXISTS `b_iblock_rss` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_ID` int(11) NOT NULL,
  `NODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NODE_VALUE` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_iblock_rss: ~0 rows (приблизительно)
DELETE FROM `b_iblock_rss`;
/*!40000 ALTER TABLE `b_iblock_rss` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_rss` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_iblock_section
DROP TABLE IF EXISTS `b_iblock_section`;
CREATE TABLE IF NOT EXISTS `b_iblock_section` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `MODIFIED_BY` int(18) DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `CREATED_BY` int(18) DEFAULT NULL,
  `IBLOCK_ID` int(11) NOT NULL,
  `IBLOCK_SECTION_ID` int(11) DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `GLOBAL_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT 500,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PICTURE` int(18) DEFAULT NULL,
  `LEFT_MARGIN` int(18) DEFAULT NULL,
  `RIGHT_MARGIN` int(18) DEFAULT NULL,
  `DEPTH_LEVEL` int(18) DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `SEARCHABLE_CONTENT` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DETAIL_PICTURE` int(18) DEFAULT NULL,
  `SOCNET_GROUP_ID` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_section_1` (`IBLOCK_ID`,`IBLOCK_SECTION_ID`),
  KEY `ix_iblock_section_depth_level` (`IBLOCK_ID`,`DEPTH_LEVEL`),
  KEY `ix_iblock_section_left_margin` (`IBLOCK_ID`,`LEFT_MARGIN`,`RIGHT_MARGIN`),
  KEY `ix_iblock_section_right_margin` (`IBLOCK_ID`,`RIGHT_MARGIN`,`LEFT_MARGIN`),
  KEY `ix_iblock_section_code` (`IBLOCK_ID`,`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_iblock_section: ~0 rows (приблизительно)
DELETE FROM `b_iblock_section`;
/*!40000 ALTER TABLE `b_iblock_section` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_section` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_iblock_section_element
DROP TABLE IF EXISTS `b_iblock_section_element`;
CREATE TABLE IF NOT EXISTS `b_iblock_section_element` (
  `IBLOCK_SECTION_ID` int(11) NOT NULL,
  `IBLOCK_ELEMENT_ID` int(11) NOT NULL,
  `ADDITIONAL_PROPERTY_ID` int(18) DEFAULT NULL,
  UNIQUE KEY `ux_iblock_section_element` (`IBLOCK_SECTION_ID`,`IBLOCK_ELEMENT_ID`,`ADDITIONAL_PROPERTY_ID`),
  KEY `UX_IBLOCK_SECTION_ELEMENT2` (`IBLOCK_ELEMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_iblock_section_element: ~0 rows (приблизительно)
DELETE FROM `b_iblock_section_element`;
/*!40000 ALTER TABLE `b_iblock_section_element` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_section_element` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_iblock_section_iprop
DROP TABLE IF EXISTS `b_iblock_section_iprop`;
CREATE TABLE IF NOT EXISTS `b_iblock_section_iprop` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `IPROP_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`SECTION_ID`,`IPROP_ID`),
  KEY `ix_b_iblock_section_iprop_0` (`IPROP_ID`),
  KEY `ix_b_iblock_section_iprop_1` (`IBLOCK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_iblock_section_iprop: ~0 rows (приблизительно)
DELETE FROM `b_iblock_section_iprop`;
/*!40000 ALTER TABLE `b_iblock_section_iprop` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_section_iprop` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_iblock_section_property
DROP TABLE IF EXISTS `b_iblock_section_property`;
CREATE TABLE IF NOT EXISTS `b_iblock_section_property` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `PROPERTY_ID` int(11) NOT NULL,
  `SMART_FILTER` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DISPLAY_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DISPLAY_EXPANDED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILTER_HINT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`SECTION_ID`,`PROPERTY_ID`),
  KEY `ix_b_iblock_section_property_1` (`PROPERTY_ID`),
  KEY `ix_b_iblock_section_property_2` (`SECTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_iblock_section_property: ~0 rows (приблизительно)
DELETE FROM `b_iblock_section_property`;
/*!40000 ALTER TABLE `b_iblock_section_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_section_property` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_iblock_section_right
DROP TABLE IF EXISTS `b_iblock_section_right`;
CREATE TABLE IF NOT EXISTS `b_iblock_section_right` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `RIGHT_ID` int(11) NOT NULL,
  `IS_INHERITED` char(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`RIGHT_ID`,`SECTION_ID`),
  KEY `ix_b_iblock_section_right_1` (`SECTION_ID`,`IBLOCK_ID`),
  KEY `ix_b_iblock_section_right_2` (`IBLOCK_ID`,`RIGHT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_iblock_section_right: ~0 rows (приблизительно)
DELETE FROM `b_iblock_section_right`;
/*!40000 ALTER TABLE `b_iblock_section_right` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_section_right` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_iblock_sequence
DROP TABLE IF EXISTS `b_iblock_sequence`;
CREATE TABLE IF NOT EXISTS `b_iblock_sequence` (
  `IBLOCK_ID` int(18) NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SEQ_VALUE` int(11) DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_iblock_sequence: ~0 rows (приблизительно)
DELETE FROM `b_iblock_sequence`;
/*!40000 ALTER TABLE `b_iblock_sequence` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_sequence` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_iblock_site
DROP TABLE IF EXISTS `b_iblock_site`;
CREATE TABLE IF NOT EXISTS `b_iblock_site` (
  `IBLOCK_ID` int(18) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_iblock_site: ~3 rows (приблизительно)
DELETE FROM `b_iblock_site`;
/*!40000 ALTER TABLE `b_iblock_site` DISABLE KEYS */;
INSERT INTO `b_iblock_site` (`IBLOCK_ID`, `SITE_ID`) VALUES
	(4, 's1'),
	(5, 's1'),
	(6, 's1');
/*!40000 ALTER TABLE `b_iblock_site` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_iblock_type
DROP TABLE IF EXISTS `b_iblock_type`;
CREATE TABLE IF NOT EXISTS `b_iblock_type` (
  `ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SECTIONS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `EDIT_FILE_BEFORE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EDIT_FILE_AFTER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IN_RSS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SORT` int(18) NOT NULL DEFAULT 500,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_iblock_type: ~3 rows (приблизительно)
DELETE FROM `b_iblock_type`;
/*!40000 ALTER TABLE `b_iblock_type` DISABLE KEYS */;
INSERT INTO `b_iblock_type` (`ID`, `SECTIONS`, `EDIT_FILE_BEFORE`, `EDIT_FILE_AFTER`, `IN_RSS`, `SORT`) VALUES
	('contacts', 'Y', '', '', 'N', 500),
	('reviews', 'Y', '', '', 'N', 500),
	('why_us', 'Y', '', '', 'N', 500);
/*!40000 ALTER TABLE `b_iblock_type` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_iblock_type_lang
DROP TABLE IF EXISTS `b_iblock_type_lang`;
CREATE TABLE IF NOT EXISTS `b_iblock_type_lang` (
  `IBLOCK_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `SECTION_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ELEMENT_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_iblock_type_lang: ~6 rows (приблизительно)
DELETE FROM `b_iblock_type_lang`;
/*!40000 ALTER TABLE `b_iblock_type_lang` DISABLE KEYS */;
INSERT INTO `b_iblock_type_lang` (`IBLOCK_TYPE_ID`, `LID`, `NAME`, `SECTION_NAME`, `ELEMENT_NAME`) VALUES
	('why_us', 'ru', 'Почему выбирают нас', '', ''),
	('why_us', 'en', 'Why choose us', '', ''),
	('reviews', 'ru', 'Отзывы и благодарности', '', ''),
	('reviews', 'en', ' Reviews', '', ''),
	('contacts', 'ru', 'Контактная информация', '', ''),
	('contacts', 'en', 'Contact information', '', '');
/*!40000 ALTER TABLE `b_iblock_type_lang` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_landing
DROP TABLE IF EXISTS `b_landing`;
CREATE TABLE IF NOT EXISTS `b_landing` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INITIATOR_APP_CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RULE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `DELETED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `PUBLIC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SYS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `VIEWS` int(18) NOT NULL DEFAULT 0,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TPL_ID` int(18) DEFAULT NULL,
  `TPL_CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_ID` int(18) NOT NULL,
  `SITEMAP` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `FOLDER` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `FOLDER_ID` int(18) DEFAULT NULL,
  `SEARCH_CONTENT` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `VERSION` int(18) NOT NULL DEFAULT 1,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  `DATE_PUBLIC` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_LAND_CODE` (`CODE`),
  KEY `IX_B_LAND_ACTIVE` (`ACTIVE`),
  KEY `IX_B_LAND_DELETED` (`DELETED`),
  KEY `IX_B_LAND_SYS` (`SYS`),
  KEY `IX_B_LAND_XML_ID` (`XML_ID`),
  KEY `IX_B_LAND_SITEMAP` (`SITEMAP`),
  KEY `IX_B_LAND_FOLDER` (`FOLDER`),
  KEY `IX_B_LAND_FOLDER_ID` (`FOLDER_ID`),
  FULLTEXT KEY `IX_B_LANDING_SEARCH` (`SEARCH_CONTENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_landing: ~0 rows (приблизительно)
DELETE FROM `b_landing`;
/*!40000 ALTER TABLE `b_landing` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_landing_binding
DROP TABLE IF EXISTS `b_landing_binding`;
CREATE TABLE IF NOT EXISTS `b_landing_binding` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ENTITY_ID` int(18) NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `BINDING_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `BINDING_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_BINDING` (`BINDING_ID`,`BINDING_TYPE`),
  KEY `IX_B_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`),
  KEY `IX_B_BINDING_TYPE` (`BINDING_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_landing_binding: ~0 rows (приблизительно)
DELETE FROM `b_landing_binding`;
/*!40000 ALTER TABLE `b_landing_binding` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_binding` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_landing_block
DROP TABLE IF EXISTS `b_landing_block`;
CREATE TABLE IF NOT EXISTS `b_landing_block` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `PARENT_ID` int(18) DEFAULT NULL,
  `LID` int(18) NOT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INITIATOR_APP_CODE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ANCHOR` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(18) DEFAULT 500,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `PUBLIC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `DELETED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ACCESS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'X',
  `SOURCE_PARAMS` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTENT` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `SEARCH_CONTENT` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `ASSETS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_BLOCK_LID` (`LID`),
  KEY `IX_B_BLOCK_CODE` (`CODE`),
  KEY `IX_B_BLOCK_ACTIVE` (`ACTIVE`),
  KEY `IX_B_BLOCK_PUBLIC` (`PUBLIC`),
  KEY `IX_B_BLOCK_DELETED` (`DELETED`),
  FULLTEXT KEY `IX_B_BLOCK_SEARCH` (`SEARCH_CONTENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_landing_block: ~0 rows (приблизительно)
DELETE FROM `b_landing_block`;
/*!40000 ALTER TABLE `b_landing_block` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_block` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_landing_chat
DROP TABLE IF EXISTS `b_landing_chat`;
CREATE TABLE IF NOT EXISTS `b_landing_chat` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CHAT_ID` int(18) NOT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `AVATAR` int(18) DEFAULT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_CHAT` (`CHAT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_landing_chat: ~0 rows (приблизительно)
DELETE FROM `b_landing_chat`;
/*!40000 ALTER TABLE `b_landing_chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_chat` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_landing_chat_binding
DROP TABLE IF EXISTS `b_landing_chat_binding`;
CREATE TABLE IF NOT EXISTS `b_landing_chat_binding` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `INTERNAL_CHAT_ID` int(18) NOT NULL,
  `ENTITY_ID` int(18) NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_CHAT` (`INTERNAL_CHAT_ID`),
  KEY `IX_B_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_landing_chat_binding: ~0 rows (приблизительно)
DELETE FROM `b_landing_chat_binding`;
/*!40000 ALTER TABLE `b_landing_chat_binding` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_chat_binding` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_landing_cookies_agreement
DROP TABLE IF EXISTS `b_landing_cookies_agreement`;
CREATE TABLE IF NOT EXISTS `b_landing_cookies_agreement` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SITE_ID` int(18) NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTENT` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_SITE` (`SITE_ID`,`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_landing_cookies_agreement: ~0 rows (приблизительно)
DELETE FROM `b_landing_cookies_agreement`;
/*!40000 ALTER TABLE `b_landing_cookies_agreement` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_cookies_agreement` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_landing_demo
DROP TABLE IF EXISTS `b_landing_demo`;
CREATE TABLE IF NOT EXISTS `b_landing_demo` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `APP_CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `TYPE` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `TPL_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `SHOW_IN_LIST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREVIEW_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREVIEW` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREVIEW2X` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREVIEW3X` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MANIFEST` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANG` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_TEMPLATE_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_DEMO_ACTIVE` (`ACTIVE`),
  KEY `IX_B_DEMO_SHOW_IN_LIST` (`SHOW_IN_LIST`),
  KEY `IX_B_DEMO_XML_ID` (`XML_ID`),
  KEY `IX_B_DEMO_APP_CODE` (`APP_CODE`),
  KEY `IX_B_DEMO_TEMPLATE_ID` (`SITE_TEMPLATE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_landing_demo: ~0 rows (приблизительно)
DELETE FROM `b_landing_demo`;
/*!40000 ALTER TABLE `b_landing_demo` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_demo` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_landing_domain
DROP TABLE IF EXISTS `b_landing_domain`;
CREATE TABLE IF NOT EXISTS `b_landing_domain` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `DOMAIN` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PROTOCOL` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `PROVIDER` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_DOMAIN_ACTIVE` (`ACTIVE`),
  KEY `IX_B_DOMAIN_DOMAIN` (`DOMAIN`),
  KEY `IX_B_DOMAIN_PROVIDER` (`PROVIDER`),
  KEY `IX_B_DOMAIN_XML_ID` (`XML_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_landing_domain: ~0 rows (приблизительно)
DELETE FROM `b_landing_domain`;
/*!40000 ALTER TABLE `b_landing_domain` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_domain` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_landing_entity_rights
DROP TABLE IF EXISTS `b_landing_entity_rights`;
CREATE TABLE IF NOT EXISTS `b_landing_entity_rights` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ENTITY_ID` int(18) NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `TASK_ID` int(11) NOT NULL,
  `ACCESS_CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ROLE_ID` int(18) DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `IX_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`),
  KEY `IX_ROLE` (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_landing_entity_rights: ~0 rows (приблизительно)
DELETE FROM `b_landing_entity_rights`;
/*!40000 ALTER TABLE `b_landing_entity_rights` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_entity_rights` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_landing_file
DROP TABLE IF EXISTS `b_landing_file`;
CREATE TABLE IF NOT EXISTS `b_landing_file` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ENTITY_ID` int(18) NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `FILE_ID` int(18) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`),
  KEY `IX_FILE` (`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_landing_file: ~0 rows (приблизительно)
DELETE FROM `b_landing_file`;
/*!40000 ALTER TABLE `b_landing_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_file` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_landing_filter_block
DROP TABLE IF EXISTS `b_landing_filter_block`;
CREATE TABLE IF NOT EXISTS `b_landing_filter_block` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FILTER_ID` int(18) NOT NULL,
  `BLOCK_ID` int(18) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_FILTER_BLOCK` (`FILTER_ID`,`BLOCK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_landing_filter_block: ~0 rows (приблизительно)
DELETE FROM `b_landing_filter_block`;
/*!40000 ALTER TABLE `b_landing_filter_block` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_filter_block` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_landing_filter_entity
DROP TABLE IF EXISTS `b_landing_filter_entity`;
CREATE TABLE IF NOT EXISTS `b_landing_filter_entity` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `SOURCE_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FILTER_HASH` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `FILTER` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_FILTER_HASH` (`FILTER_HASH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_landing_filter_entity: ~0 rows (приблизительно)
DELETE FROM `b_landing_filter_entity`;
/*!40000 ALTER TABLE `b_landing_filter_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_filter_entity` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_landing_hook_data
DROP TABLE IF EXISTS `b_landing_hook_data`;
CREATE TABLE IF NOT EXISTS `b_landing_hook_data` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ENTITY_ID` int(18) NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `HOOK` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `PUBLIC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `K_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_landing_hook_data: ~0 rows (приблизительно)
DELETE FROM `b_landing_hook_data`;
/*!40000 ALTER TABLE `b_landing_hook_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_hook_data` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_landing_placement
DROP TABLE IF EXISTS `b_landing_placement`;
CREATE TABLE IF NOT EXISTS `b_landing_placement` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `APP_ID` int(18) DEFAULT NULL,
  `PLACEMENT` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PLACEMENT_HANDLER` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_landing_placement: ~0 rows (приблизительно)
DELETE FROM `b_landing_placement`;
/*!40000 ALTER TABLE `b_landing_placement` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_placement` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_landing_repo
DROP TABLE IF EXISTS `b_landing_repo`;
CREATE TABLE IF NOT EXISTS `b_landing_repo` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `APP_CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTIONS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_TEMPLATE_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREVIEW` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MANIFEST` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTENT` text COLLATE utf8_unicode_ci NOT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_REPO_ACTIVE` (`ACTIVE`),
  KEY `IX_B_REPO_XML_ID` (`XML_ID`),
  KEY `IX_B_REPO_APP_CODE` (`APP_CODE`),
  KEY `IX_B_REPO_TEMPLATE_ID` (`SITE_TEMPLATE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_landing_repo: ~0 rows (приблизительно)
DELETE FROM `b_landing_repo`;
/*!40000 ALTER TABLE `b_landing_repo` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_repo` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_landing_role
DROP TABLE IF EXISTS `b_landing_role`;
CREATE TABLE IF NOT EXISTS `b_landing_role` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACCESS_CODES` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `ADDITIONAL_RIGHTS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ID`),
  KEY `IX_B_ROLE_TYPE` (`TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_landing_role: ~0 rows (приблизительно)
DELETE FROM `b_landing_role`;
/*!40000 ALTER TABLE `b_landing_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_role` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_landing_site
DROP TABLE IF EXISTS `b_landing_site`;
CREATE TABLE IF NOT EXISTS `b_landing_site` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `DELETED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'PAGE',
  `TPL_ID` int(18) DEFAULT NULL,
  `TPL_CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DOMAIN_ID` int(18) NOT NULL,
  `SMN_SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANDING_ID_INDEX` int(18) DEFAULT NULL,
  `LANDING_ID_404` int(18) DEFAULT NULL,
  `LANDING_ID_503` int(18) DEFAULT NULL,
  `LANG` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SPECIAL` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_SITE_CODE` (`CODE`),
  KEY `IX_B_SITE_ACTIVE` (`ACTIVE`),
  KEY `IX_B_SITE_DELETED` (`DELETED`),
  KEY `IX_B_SITE_XML_ID` (`XML_ID`),
  KEY `IX_B_SITE_SPECIAL` (`SPECIAL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_landing_site: ~0 rows (приблизительно)
DELETE FROM `b_landing_site`;
/*!40000 ALTER TABLE `b_landing_site` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_site` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_landing_syspage
DROP TABLE IF EXISTS `b_landing_syspage`;
CREATE TABLE IF NOT EXISTS `b_landing_syspage` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `SITE_ID` int(18) NOT NULL,
  `TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `LANDING_ID` int(18) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_SITE_ID` (`SITE_ID`),
  KEY `IX_LANDING_ID` (`LANDING_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_landing_syspage: ~0 rows (приблизительно)
DELETE FROM `b_landing_syspage`;
/*!40000 ALTER TABLE `b_landing_syspage` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_syspage` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_landing_template
DROP TABLE IF EXISTS `b_landing_template`;
CREATE TABLE IF NOT EXISTS `b_landing_template` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(18) DEFAULT 100,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTENT` text COLLATE utf8_unicode_ci NOT NULL,
  `AREA_COUNT` int(2) NOT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_landing_template: ~7 rows (приблизительно)
DELETE FROM `b_landing_template`;
/*!40000 ALTER TABLE `b_landing_template` DISABLE KEYS */;
INSERT INTO `b_landing_template` (`ID`, `ACTIVE`, `TITLE`, `SORT`, `XML_ID`, `CONTENT`, `AREA_COUNT`, `CREATED_BY_ID`, `MODIFIED_BY_ID`, `DATE_CREATE`, `DATE_MODIFY`) VALUES
	(1, 'Y', '#EMPTY#', 100, 'empty', '#CONTENT#', 0, 1, 1, '2021-01-22 13:18:34', '2021-01-22 13:18:34'),
	(2, 'Y', '#SIDEBAR_LEFT#', 200, 'sidebar_left', '<div class="landing-layout-flex">\n								<div class="landing-sidebar g-max-width-100x g-overflow-hidden">#AREA_1#</div>\n								<div class="landing-main g-max-width-100x">#CONTENT#</div>\n							</div>', 1, 1, 1, '2021-01-22 13:18:34', '2021-01-22 13:18:34'),
	(3, 'Y', '#SIDEBAR_RIGHT#', 300, 'sidebar_right', '<div class="landing-layout-flex sidebar-right">\n								<div class="landing-sidebar g-max-width-100x">#AREA_1#</div>\n								<div class="landing-main g-max-width-100x">#CONTENT#</div>\n							</div>', 1, 1, 1, '2021-01-22 13:18:34', '2021-01-22 13:18:34'),
	(4, 'Y', '#HEADER_ONLY#', 400, 'header_only', '<div class="landing-header">#AREA_1#</div> \n								<div class="landing-main">#CONTENT#</div>', 1, 1, 1, '2021-01-22 13:18:34', '2021-01-22 13:18:34'),
	(5, 'Y', '#HEADER_FOOTER#', 500, 'header_footer', '<div class="landing-header">#AREA_1#</div> \n								<div class="landing-main">#CONTENT#</div> \n							<div class="landing-footer">#AREA_2#</div>', 2, 1, 1, '2021-01-22 13:18:34', '2021-01-22 13:18:34'),
	(6, 'Y', '#WITHOUT_LEFT#', 600, 'without_left', '<div class="landing-header">#AREA_1#</div>\n								<div class="landing-layout-flex without-left">\n									<div class="landing-sidebar g-max-width-100x">#AREA_2#</div>\n									<div class="landing-main g-max-width-100x">#CONTENT#</div>\n								</div>\n							<div class="landing-footer">#AREA_3#</div>', 3, 1, 1, '2021-01-22 13:18:34', '2021-01-22 13:18:34'),
	(7, 'Y', '#WITHOUT_RIGHT#', 700, 'without_right', '<div class="landing-header">#AREA_1#</div>\n								<div class="landing-layout-flex">\n									<div class="landing-sidebar g-max-width-100x">#AREA_2#</div>\n									<div class="landing-main g-max-width-100x">#CONTENT#</div>\n								</div>\n							<div class="landing-footer">#AREA_3#</div>', 3, 1, 1, '2021-01-22 13:18:34', '2021-01-22 13:18:34');
/*!40000 ALTER TABLE `b_landing_template` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_landing_template_ref
DROP TABLE IF EXISTS `b_landing_template_ref`;
CREATE TABLE IF NOT EXISTS `b_landing_template_ref` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ENTITY_ID` int(18) NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `AREA` int(2) NOT NULL,
  `LANDING_ID` int(18) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `K_LANDING_ID` (`LANDING_ID`),
  KEY `K_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_landing_template_ref: ~0 rows (приблизительно)
DELETE FROM `b_landing_template_ref`;
/*!40000 ALTER TABLE `b_landing_template_ref` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_template_ref` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_landing_update_block
DROP TABLE IF EXISTS `b_landing_update_block`;
CREATE TABLE IF NOT EXISTS `b_landing_update_block` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_BLOCK_ID` int(18) DEFAULT 0,
  `PARAMS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_CODE` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_landing_update_block: ~0 rows (приблизительно)
DELETE FROM `b_landing_update_block`;
/*!40000 ALTER TABLE `b_landing_update_block` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_update_block` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_landing_urlrewrite
DROP TABLE IF EXISTS `b_landing_urlrewrite`;
CREATE TABLE IF NOT EXISTS `b_landing_urlrewrite` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `SITE_ID` int(18) NOT NULL,
  `RULE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LANDING_ID` int(18) NOT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_SITE_RULE` (`SITE_ID`,`RULE`),
  KEY `IX_LANDING_ID` (`LANDING_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_landing_urlrewrite: ~0 rows (приблизительно)
DELETE FROM `b_landing_urlrewrite`;
/*!40000 ALTER TABLE `b_landing_urlrewrite` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_urlrewrite` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_landing_view
DROP TABLE IF EXISTS `b_landing_view`;
CREATE TABLE IF NOT EXISTS `b_landing_view` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `LID` int(18) NOT NULL,
  `USER_ID` int(18) NOT NULL,
  `VIEWS` int(18) NOT NULL,
  `FIRST_VIEW` datetime NOT NULL,
  `LAST_VIEW` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_VIEW_LIDUID` (`LID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_landing_view: ~0 rows (приблизительно)
DELETE FROM `b_landing_view`;
/*!40000 ALTER TABLE `b_landing_view` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_view` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_lang
DROP TABLE IF EXISTS `b_lang`;
CREATE TABLE IF NOT EXISTS `b_lang` (
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(18) NOT NULL DEFAULT 100,
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DIR` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `FORMAT_DATE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_DATETIME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WEEK_START` int(11) DEFAULT NULL,
  `CHARSET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `DOC_ROOT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DOMAIN_LIMITED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SERVER_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CULTURE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_lang: ~1 rows (приблизительно)
DELETE FROM `b_lang`;
/*!40000 ALTER TABLE `b_lang` DISABLE KEYS */;
INSERT INTO `b_lang` (`LID`, `SORT`, `DEF`, `ACTIVE`, `NAME`, `DIR`, `FORMAT_DATE`, `FORMAT_DATETIME`, `FORMAT_NAME`, `WEEK_START`, `CHARSET`, `LANGUAGE_ID`, `DOC_ROOT`, `DOMAIN_LIMITED`, `SERVER_NAME`, `SITE_NAME`, `EMAIL`, `CULTURE_ID`) VALUES
	('s1', 1, 'Y', 'Y', 'Сайт по умолчанию', '/', NULL, NULL, NULL, NULL, NULL, 'ru', '', 'N', '', '', '', 1);
/*!40000 ALTER TABLE `b_lang` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_language
DROP TABLE IF EXISTS `b_language`;
CREATE TABLE IF NOT EXISTS `b_language` (
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT 100,
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `FORMAT_DATE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_DATETIME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WEEK_START` int(11) DEFAULT NULL,
  `CHARSET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DIRECTION` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CULTURE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_language: ~2 rows (приблизительно)
DELETE FROM `b_language`;
/*!40000 ALTER TABLE `b_language` DISABLE KEYS */;
INSERT INTO `b_language` (`LID`, `SORT`, `DEF`, `ACTIVE`, `NAME`, `FORMAT_DATE`, `FORMAT_DATETIME`, `FORMAT_NAME`, `WEEK_START`, `CHARSET`, `DIRECTION`, `CULTURE_ID`) VALUES
	('en', 2, 'N', 'Y', 'English', NULL, NULL, NULL, NULL, NULL, NULL, 2),
	('ru', 1, 'Y', 'Y', 'Russian', NULL, NULL, NULL, NULL, NULL, NULL, 1);
/*!40000 ALTER TABLE `b_language` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_lang_domain
DROP TABLE IF EXISTS `b_lang_domain`;
CREATE TABLE IF NOT EXISTS `b_lang_domain` (
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `DOMAIN` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`LID`,`DOMAIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_lang_domain: ~0 rows (приблизительно)
DELETE FROM `b_lang_domain`;
/*!40000 ALTER TABLE `b_lang_domain` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_lang_domain` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_list_rubric
DROP TABLE IF EXISTS `b_list_rubric`;
CREATE TABLE IF NOT EXISTS `b_list_rubric` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT 100,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `AUTO` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DAYS_OF_MONTH` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DAYS_OF_WEEK` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIMES_OF_DAY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TEMPLATE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_EXECUTED` datetime DEFAULT NULL,
  `VISIBLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `FROM_FIELD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_list_rubric: ~0 rows (приблизительно)
DELETE FROM `b_list_rubric`;
/*!40000 ALTER TABLE `b_list_rubric` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_list_rubric` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_log_notification
DROP TABLE IF EXISTS `b_log_notification`;
CREATE TABLE IF NOT EXISTS `b_log_notification` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUDIT_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `REMOTE_ADDR` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_AGENT` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUEST_URI` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CHECK_INTERVAL` int(11) DEFAULT NULL,
  `ALERT_COUNT` int(11) DEFAULT NULL,
  `DATE_CHECKED` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_log_notification: ~0 rows (приблизительно)
DELETE FROM `b_log_notification`;
/*!40000 ALTER TABLE `b_log_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_log_notification` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_log_notification_action
DROP TABLE IF EXISTS `b_log_notification_action`;
CREATE TABLE IF NOT EXISTS `b_log_notification_action` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NOTIFICATION_ID` int(10) unsigned NOT NULL,
  `NOTIFICATION_TYPE` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `RECIPIENT` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ADDITIONAL_TEXT` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_log_notification_action_notification_id` (`NOTIFICATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_log_notification_action: ~0 rows (приблизительно)
DELETE FROM `b_log_notification_action`;
/*!40000 ALTER TABLE `b_log_notification_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_log_notification_action` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_main_mail_blacklist
DROP TABLE IF EXISTS `b_main_mail_blacklist`;
CREATE TABLE IF NOT EXISTS `b_main_mail_blacklist` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime NOT NULL,
  `CATEGORY_ID` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_B_MAIN_MAIL_BLACKLIST_CODE` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_main_mail_blacklist: ~0 rows (приблизительно)
DELETE FROM `b_main_mail_blacklist`;
/*!40000 ALTER TABLE `b_main_mail_blacklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_main_mail_blacklist` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_main_mail_sender
DROP TABLE IF EXISTS `b_main_mail_sender`;
CREATE TABLE IF NOT EXISTS `b_main_mail_sender` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `IS_CONFIRMED` tinyint(4) NOT NULL DEFAULT 0,
  `IS_PUBLIC` tinyint(4) NOT NULL DEFAULT 0,
  `OPTIONS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_MAIN_MAIL_SENDER_USER_ID` (`USER_ID`,`IS_CONFIRMED`,`IS_PUBLIC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_main_mail_sender: ~0 rows (приблизительно)
DELETE FROM `b_main_mail_sender`;
/*!40000 ALTER TABLE `b_main_mail_sender` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_main_mail_sender` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_medialib_collection
DROP TABLE IF EXISTS `b_medialib_collection`;
CREATE TABLE IF NOT EXISTS `b_medialib_collection` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `DATE_UPDATE` datetime NOT NULL,
  `OWNER_ID` int(11) DEFAULT NULL,
  `PARENT_ID` int(11) DEFAULT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `KEYWORDS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ITEMS_COUNT` int(11) DEFAULT NULL,
  `ML_TYPE` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_medialib_collection: ~0 rows (приблизительно)
DELETE FROM `b_medialib_collection`;
/*!40000 ALTER TABLE `b_medialib_collection` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_medialib_collection` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_medialib_collection_item
DROP TABLE IF EXISTS `b_medialib_collection_item`;
CREATE TABLE IF NOT EXISTS `b_medialib_collection_item` (
  `COLLECTION_ID` int(11) NOT NULL,
  `ITEM_ID` int(11) NOT NULL,
  PRIMARY KEY (`ITEM_ID`,`COLLECTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_medialib_collection_item: ~0 rows (приблизительно)
DELETE FROM `b_medialib_collection_item`;
/*!40000 ALTER TABLE `b_medialib_collection_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_medialib_collection_item` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_medialib_item
DROP TABLE IF EXISTS `b_medialib_item`;
CREATE TABLE IF NOT EXISTS `b_medialib_item` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_TYPE` char(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_CREATE` datetime NOT NULL,
  `DATE_UPDATE` datetime NOT NULL,
  `SOURCE_ID` int(11) NOT NULL,
  `KEYWORDS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEARCHABLE_CONTENT` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_medialib_item: ~0 rows (приблизительно)
DELETE FROM `b_medialib_item`;
/*!40000 ALTER TABLE `b_medialib_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_medialib_item` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_medialib_type
DROP TABLE IF EXISTS `b_medialib_type`;
CREATE TABLE IF NOT EXISTS `b_medialib_type` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `EXT` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SYSTEM` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DESCRIPTION` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_medialib_type: ~3 rows (приблизительно)
DELETE FROM `b_medialib_type`;
/*!40000 ALTER TABLE `b_medialib_type` DISABLE KEYS */;
INSERT INTO `b_medialib_type` (`ID`, `NAME`, `CODE`, `EXT`, `SYSTEM`, `DESCRIPTION`) VALUES
	(1, 'image_name', 'image', 'jpg,jpeg,gif,png', 'Y', 'image_desc'),
	(2, 'video_name', 'video', 'flv,mp4,wmv', 'Y', 'video_desc'),
	(3, 'sound_name', 'sound', 'mp3,wma,aac', 'Y', 'sound_desc');
/*!40000 ALTER TABLE `b_medialib_type` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_messageservice_message
DROP TABLE IF EXISTS `b_messageservice_message`;
CREATE TABLE IF NOT EXISTS `b_messageservice_message` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TYPE` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `SENDER_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `AUTHOR_ID` int(18) NOT NULL DEFAULT 0,
  `MESSAGE_FROM` varchar(260) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE_TO` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE_HEADERS` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE_BODY` longtext COLLATE utf8_unicode_ci NOT NULL,
  `DATE_INSERT` datetime DEFAULT NULL,
  `DATE_EXEC` datetime DEFAULT NULL,
  `NEXT_EXEC` datetime DEFAULT NULL,
  `SUCCESS_EXEC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `EXEC_ERROR` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STATUS_ID` int(18) NOT NULL DEFAULT 0,
  `EXTERNAL_ID` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `B_MESSAGESERVICE_MESSAGE_1` (`DATE_EXEC`),
  KEY `B_MESSAGESERVICE_MESSAGE_2` (`SUCCESS_EXEC`),
  KEY `B_MESSAGESERVICE_MESSAGE_3` (`SENDER_ID`,`EXTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_messageservice_message: ~0 rows (приблизительно)
DELETE FROM `b_messageservice_message`;
/*!40000 ALTER TABLE `b_messageservice_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_messageservice_message` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_messageservice_rest_app
DROP TABLE IF EXISTS `b_messageservice_rest_app`;
CREATE TABLE IF NOT EXISTS `b_messageservice_rest_app` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `APP_ID` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `TYPE` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `HANDLER` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_ADD` datetime DEFAULT NULL,
  `AUTHOR_ID` int(18) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `B_MESSAGESERVICE_REST_APP_1` (`APP_ID`,`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_messageservice_rest_app: ~0 rows (приблизительно)
DELETE FROM `b_messageservice_rest_app`;
/*!40000 ALTER TABLE `b_messageservice_rest_app` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_messageservice_rest_app` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_messageservice_rest_app_lang
DROP TABLE IF EXISTS `b_messageservice_rest_app_lang`;
CREATE TABLE IF NOT EXISTS `b_messageservice_rest_app_lang` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `APP_ID` int(18) NOT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `APP_NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_messageservice_rest_app_lang: ~0 rows (приблизительно)
DELETE FROM `b_messageservice_rest_app_lang`;
/*!40000 ALTER TABLE `b_messageservice_rest_app_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_messageservice_rest_app_lang` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_mobileapp_app
DROP TABLE IF EXISTS `b_mobileapp_app`;
CREATE TABLE IF NOT EXISTS `b_mobileapp_app` (
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SHORT_NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci NOT NULL,
  `FILES` text COLLATE utf8_unicode_ci NOT NULL,
  `LAUNCH_ICONS` text COLLATE utf8_unicode_ci NOT NULL,
  `LAUNCH_SCREENS` text COLLATE utf8_unicode_ci NOT NULL,
  `FOLDER` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` datetime NOT NULL,
  PRIMARY KEY (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_mobileapp_app: ~0 rows (приблизительно)
DELETE FROM `b_mobileapp_app`;
/*!40000 ALTER TABLE `b_mobileapp_app` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_mobileapp_app` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_mobileapp_config
DROP TABLE IF EXISTS `b_mobileapp_config`;
CREATE TABLE IF NOT EXISTS `b_mobileapp_config` (
  `APP_CODE` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `PLATFORM` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `PARAMS` text COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` datetime NOT NULL,
  PRIMARY KEY (`APP_CODE`,`PLATFORM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_mobileapp_config: ~0 rows (приблизительно)
DELETE FROM `b_mobileapp_config`;
/*!40000 ALTER TABLE `b_mobileapp_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_mobileapp_config` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_module
DROP TABLE IF EXISTS `b_module`;
CREATE TABLE IF NOT EXISTS `b_module` (
  `ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_ACTIVE` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_module: ~28 rows (приблизительно)
DELETE FROM `b_module`;
/*!40000 ALTER TABLE `b_module` DISABLE KEYS */;
INSERT INTO `b_module` (`ID`, `DATE_ACTIVE`) VALUES
	('b24connector', NULL),
	('bitrix.sitecorporate', NULL),
	('bitrix.siteinfoportal', NULL),
	('bitrix.sitepersonal', NULL),
	('bitrixcloud', NULL),
	('blog', NULL),
	('clouds', NULL),
	('fileman', NULL),
	('form', NULL),
	('forum', NULL),
	('highloadblock', NULL),
	('iblock', NULL),
	('landing', NULL),
	('main', NULL),
	('messageservice', NULL),
	('mobileapp', NULL),
	('perfmon', NULL),
	('photogallery', NULL),
	('rest', NULL),
	('scale', NULL),
	('search', NULL),
	('security', NULL),
	('seo', NULL),
	('socialservices', NULL),
	('subscribe', NULL),
	('translate', NULL),
	('ui', NULL),
	('vote', NULL);
/*!40000 ALTER TABLE `b_module` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_module_group
DROP TABLE IF EXISTS `b_module_group`;
CREATE TABLE IF NOT EXISTS `b_module_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `G_ACCESS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_GROUP_MODULE` (`MODULE_ID`,`GROUP_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_module_group: ~0 rows (приблизительно)
DELETE FROM `b_module_group`;
/*!40000 ALTER TABLE `b_module_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_module_group` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_module_to_module
DROP TABLE IF EXISTS `b_module_to_module`;
CREATE TABLE IF NOT EXISTS `b_module_to_module` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `SORT` int(18) NOT NULL DEFAULT 100,
  `FROM_MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TO_MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `TO_PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TO_CLASS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TO_METHOD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TO_METHOD_ARG` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VERSION` int(18) DEFAULT NULL,
  `UNIQUE_ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_module_to_module_unique_id` (`UNIQUE_ID`),
  KEY `ix_module_to_module` (`FROM_MODULE_ID`(20),`MESSAGE_ID`(20),`TO_MODULE_ID`(20),`TO_CLASS`(20),`TO_METHOD`(20))
) ENGINE=InnoDB AUTO_INCREMENT=317 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_module_to_module: ~314 rows (приблизительно)
DELETE FROM `b_module_to_module`;
/*!40000 ALTER TABLE `b_module_to_module` DISABLE KEYS */;
INSERT INTO `b_module_to_module` (`ID`, `TIMESTAMP_X`, `SORT`, `FROM_MODULE_ID`, `MESSAGE_ID`, `TO_MODULE_ID`, `TO_PATH`, `TO_CLASS`, `TO_METHOD`, `TO_METHOD_ARG`, `VERSION`, `UNIQUE_ID`) VALUES
	(1, NULL, 100, 'iblock', 'OnIBlockPropertyBuildList', 'main', '/modules/main/tools/prop_userid.php', 'CIBlockPropertyUserID', 'GetUserTypeDescription', '', 1, '2b30c309bf87645959b9bfbed51b49c6'),
	(2, NULL, 100, 'main', 'OnUserDelete', 'main', '/modules/main/classes/mysql/favorites.php', 'CFavorites', 'OnUserDelete', '', 1, 'f437e170e4daf957766b0b0579f08fb4'),
	(3, NULL, 100, 'main', 'OnLanguageDelete', 'main', '/modules/main/classes/mysql/favorites.php', 'CFavorites', 'OnLanguageDelete', '', 1, '9211999c5cfc3a4d374e4f957d5079f6'),
	(4, NULL, 100, 'main', 'OnUserDelete', 'main', '', 'CUserOptions', 'OnUserDelete', '', 1, '9ef4e969f975b6425c7113444d210a90'),
	(5, NULL, 100, 'main', 'OnChangeFile', 'main', '', 'CMain', 'OnChangeFileComponent', '', 1, '332179402f77c4d41c6c2e524acde4d0'),
	(6, NULL, 100, 'main', 'OnUserTypeRightsCheck', 'main', '', 'CUser', 'UserTypeRightsCheck', '', 1, 'e1aae03ea8eb08e7bbb6d8d42cbc2ebe'),
	(7, NULL, 100, 'main', 'OnUserLogin', 'main', '', 'UpdateTools', 'CheckUpdates', '', 1, 'a2986b9f6e9a99c0351c2ba858dafc85'),
	(8, NULL, 100, 'main', 'OnModuleUpdate', 'main', '', 'UpdateTools', 'SetUpdateResult', '', 1, 'f9b70c6a75b6341063b23bde5d32e582'),
	(9, NULL, 100, 'main', 'OnUpdateCheck', 'main', '', 'UpdateTools', 'SetUpdateError', '', 1, 'a0aecef95a192ec3dd134f71f0f4f175'),
	(10, NULL, 100, 'main', 'OnPanelCreate', 'main', '', 'CUndo', 'CheckNotifyMessage', '', 1, '6476f96ffba6ab2b4a7dbe644f42edf6'),
	(11, NULL, 100, 'main', 'OnAfterAddRating', 'main', '', 'CRatingsComponentsMain', 'OnAfterAddRating', '', 1, '6122bee2ad083f8f72e35655cee48859'),
	(12, NULL, 100, 'main', 'OnAfterUpdateRating', 'main', '', 'CRatingsComponentsMain', 'OnAfterUpdateRating', '', 1, 'f8f806e33dc35737bdbe6b9bc42626a4'),
	(13, NULL, 100, 'main', 'OnSetRatingsConfigs', 'main', '', 'CRatingsComponentsMain', 'OnSetRatingConfigs', '', 1, '9244ca7fd6964757ca191c9407cb1218'),
	(14, NULL, 100, 'main', 'OnGetRatingsConfigs', 'main', '', 'CRatingsComponentsMain', 'OnGetRatingConfigs', '', 1, 'd8ae8e1f8889b1fbb6af276fb14c8411'),
	(15, NULL, 100, 'main', 'OnGetRatingsObjects', 'main', '', 'CRatingsComponentsMain', 'OnGetRatingObject', '', 1, '129315715250c195ee115002b445a156'),
	(16, NULL, 100, 'main', 'OnGetRatingContentOwner', 'main', '', 'CRatingsComponentsMain', 'OnGetRatingContentOwner', '', 1, 'bf1f5deaa1532fe9a28acd6d19d23a80'),
	(17, NULL, 100, 'main', 'OnAfterAddRatingRule', 'main', '', 'CRatingRulesMain', 'OnAfterAddRatingRule', '', 1, '298e763431f7f7d6c3af9798663f410d'),
	(18, NULL, 100, 'main', 'OnAfterUpdateRatingRule', 'main', '', 'CRatingRulesMain', 'OnAfterUpdateRatingRule', '', 1, '4ecdc4a15e24c49f0fa8f44064bf1511'),
	(19, NULL, 100, 'main', 'OnGetRatingRuleObjects', 'main', '', 'CRatingRulesMain', 'OnGetRatingRuleObjects', '', 1, '6ac10928b76183004ba0e88ace0a1b5b'),
	(20, NULL, 100, 'main', 'OnGetRatingRuleConfigs', 'main', '', 'CRatingRulesMain', 'OnGetRatingRuleConfigs', '', 1, '06769c4f6bbba4fad79c1619a874ee97'),
	(21, NULL, 100, 'main', 'OnAfterUserAdd', 'main', '', 'CRatings', 'OnAfterUserRegister', '', 1, 'ecb9ae0476db69da6c95b06bcb3aebbb'),
	(22, NULL, 100, 'main', 'OnUserDelete', 'main', '', 'CRatings', 'OnUserDelete', '', 1, '9fe6984fd29b7ab9508ac02c23690094'),
	(23, NULL, 100, 'main', 'OnAfterGroupAdd', 'main', '', 'CGroupAuthProvider', 'OnAfterGroupAdd', '', 1, '02f2fe70b9068a6b307192321fe74430'),
	(24, NULL, 100, 'main', 'OnBeforeGroupUpdate', 'main', '', 'CGroupAuthProvider', 'OnBeforeGroupUpdate', '', 1, 'ef0f2e4d0ae7bbf59d0798e8078143f9'),
	(25, NULL, 100, 'main', 'OnBeforeGroupDelete', 'main', '', 'CGroupAuthProvider', 'OnBeforeGroupDelete', '', 1, 'd3ec9527c0e77709402a05ae4249afca'),
	(26, NULL, 100, 'main', 'OnAfterSetUserGroup', 'main', '', 'CGroupAuthProvider', 'OnAfterSetUserGroup', '', 1, '0de6c5b48e9382f6e857d79f76d95f25'),
	(27, NULL, 100, 'main', 'OnUserLogin', 'main', '', 'CGroupAuthProvider', 'OnUserLogin', '', 1, '954e2c4ca8624f90f1aee6f40183d5fc'),
	(28, NULL, 100, 'main', 'OnUserLogin', 'main', '', 'CUserAuthProvider', 'OnUserLogin', '', 1, 'ab2cca8754737b6c630dfaa7f4ca5d32'),
	(29, NULL, 100, 'main', 'OnEventLogGetAuditTypes', 'main', '', 'CEventMain', 'GetAuditTypes', '', 1, 'ac0b8b7a5e703131a3bd41b4399bc032'),
	(30, NULL, 100, 'main', 'OnEventLogGetAuditHandlers', 'main', '', 'CEventMain', 'MakeMainObject', '', 1, '1ddb38ccf35a8a9da5d3b2bc80591ad6'),
	(31, NULL, 100, 'perfmon', 'OnGetTableSchema', 'main', '', 'CTableSchema', 'OnGetTableSchema', '', 1, 'c1f65f88d449e8b8a3b7af9d54ef3f50'),
	(32, NULL, 100, 'sender', 'OnConnectorList', 'main', '', '\\Bitrix\\Main\\SenderEventHandler', 'onConnectorListUser', '', 1, '8af99568465a1ccdb6a84e868cf5aad8'),
	(33, NULL, 110, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeString', 'GetUserTypeDescription', '', 1, '09f8200652932044934bd3c522e920c5'),
	(34, NULL, 120, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeInteger', 'GetUserTypeDescription', '', 1, '71ef247b3eb3b07e4bd6940791b89497'),
	(35, NULL, 130, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeDouble', 'GetUserTypeDescription', '', 1, '4fe2008255fe567423cc0c2f080ca741'),
	(36, NULL, 140, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeDateTime', 'GetUserTypeDescription', '', 1, '686c0679e60bee52dbcc27f5502277b6'),
	(37, NULL, 145, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeDate', 'GetUserTypeDescription', '', 1, '7e19b5fc5fc48b1cd317a6ac44d84236'),
	(38, NULL, 150, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeBoolean', 'GetUserTypeDescription', '', 1, '4d5e1dd2369089f2db9480549241205f'),
	(39, NULL, 155, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeUrl', 'GetUserTypeDescription', '', 1, '79fcd650625b296abf13216cd5af2428'),
	(40, NULL, 160, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeFile', 'GetUserTypeDescription', '', 1, '67b9a4fbc45240a7887b73e3a246eba0'),
	(41, NULL, 170, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeEnum', 'GetUserTypeDescription', '', 1, 'fbebdb289fe38c1fbfeda4d3d8ee43ef'),
	(42, NULL, 180, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeIBlockSection', 'GetUserTypeDescription', '', 1, '2065f8305645790970bac0b99f127f47'),
	(43, NULL, 190, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeIBlockElement', 'GetUserTypeDescription', '', 1, '65bda5818e3545f1683a3ff5271cc891'),
	(44, NULL, 200, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeStringFormatted', 'GetUserTypeDescription', '', 1, '47e3cf1c280e01dbaed43f9989a6747b'),
	(45, NULL, 210, 'main', 'OnUserTypeBuildList', 'main', '', '\\Bitrix\\Main\\UrlPreview\\UrlPreviewUserType', 'getUserTypeDescription', '', 1, '719d15ee5f60f6348d2bd6a8911aeed1'),
	(46, NULL, 100, 'main', 'OnBeforeEndBufferContent', 'main', '', '\\Bitrix\\Main\\Analytics\\Counter', 'onBeforeEndBufferContent', '', 1, 'ff5eb984fe6ce3e8d769bf3ba646b902'),
	(47, NULL, 100, 'main', 'OnBeforeRestartBuffer', 'main', '', '\\Bitrix\\Main\\Analytics\\Counter', 'onBeforeRestartBuffer', '', 1, '0782f5a6df6dd52d834caea88c3ba3a7'),
	(48, NULL, 100, 'main', 'OnFileDelete', 'main', '', '\\Bitrix\\Main\\UI\\Viewer\\FilePreviewTable', 'onFileDelete', '', 1, '54c80cd94412db221338aeb59902f059'),
	(49, NULL, 100, 'socialnetwork', 'OnSocNetLogDelete', 'main', '', 'CUserCounter', 'OnSocNetLogDelete', '', 1, '33e603755a0bc07abd51a1f8ed52966e'),
	(50, NULL, 100, 'socialnetwork', 'OnSocNetLogCommentDelete', 'main', '', 'CUserCounter', 'OnSocNetLogCommentDelete', '', 1, '51ee2214895be904a880046f43e84138'),
	(51, NULL, 100, 'main', 'OnAdminInformerInsertItems', 'main', '', 'CMpNotifications', 'OnAdminInformerInsertItemsHandlerMP', '', 1, 'c89c0e94ac1110c334a24c70e1773daa'),
	(52, NULL, 100, 'rest', 'OnRestServiceBuildDescription', 'main', '', '\\Bitrix\\Main\\Rest\\Handlers', 'onRestServiceBuildDescription', '', 1, 'c0b0c358a21b648d4f9c5d29d17a5ab2'),
	(53, NULL, 100, 'sale', 'OnSaleBasketItemSaved', 'main', '', '\\Bitrix\\Main\\Analytics\\Catalog', 'catchCatalogBasket', '', 2, 'fa4fc3924ff2585e92f8bdabaf287864'),
	(54, NULL, 100, 'sale', 'OnSaleOrderSaved', 'main', '', '\\Bitrix\\Main\\Analytics\\Catalog', 'catchCatalogOrder', '', 2, '6b358bb17b30da91b105fb1451ed9aaa'),
	(55, NULL, 100, 'sale', 'OnSaleOrderPaid', 'main', '', '\\Bitrix\\Main\\Analytics\\Catalog', 'catchCatalogOrderPayment', '', 2, '8f5ca6e1c5136cb4bbf30474f0ff4183'),
	(56, NULL, 1000, 'sale', 'onBuildDiscountConditionInterfaceControls', 'main', '', '\\Bitrix\\Main\\Discount\\UserConditionControl', 'onBuildDiscountConditionInterfaceControls', '', 1, '9f0d91c081704e52b52f540b3acaf52e'),
	(57, NULL, 100, 'main', 'OnBeforePhpMail', 'main', '', '\\Bitrix\\Main\\Mail\\Sender', 'applyCustomSmtp', '', 2, '10fbf5b8dec05a02d8d7010e594f16ec'),
	(58, NULL, 100, 'main', 'OnBuildFilterFactoryMethods', 'main', '', '\\Bitrix\\Main\\Filter\\FactoryMain', 'onBuildFilterFactoryMethods', '', 2, '19f10c2686a955bd8b8116ea1f1ad829'),
	(59, NULL, 100, 'main', 'OnBeforeUserTypeAdd', 'main', '', '\\Bitrix\\Main\\UserField\\Internal\\UserFieldHelper', 'OnBeforeUserTypeAdd', '', 1, 'e204684efc0764af9431ca94b950619a'),
	(60, NULL, 100, 'main', 'OnAfterUserTypeAdd', 'main', '', '\\Bitrix\\Main\\UserField\\Internal\\UserFieldHelper', 'onAfterUserTypeAdd', '', 1, '50932fb244caf7af686fac906caf3e73'),
	(61, NULL, 100, 'main', 'OnBeforeUserTypeDelete', 'main', '', '\\Bitrix\\Main\\UserField\\Internal\\UserFieldHelper', 'OnBeforeUserTypeDelete', '', 1, 'd22a86deba0ff4bd031d022e331033b4'),
	(62, NULL, 100, 'main', 'onGetUserFieldValues', 'main', '', '\\Bitrix\\Main\\UserField\\Internal\\UserFieldHelper', 'onGetUserFieldValues', '', 2, '7f9a5e25d638a6bff29f0bf4666da1a9'),
	(63, NULL, 100, 'main', 'onUpdateUserFieldValues', 'main', '', '\\Bitrix\\Main\\UserField\\Internal\\UserFieldHelper', 'onUpdateUserFieldValues', '', 2, 'd78761f994d74258421d271810f03ebf'),
	(64, NULL, 100, 'main', 'onDeleteUserFieldValues', 'main', '', '\\Bitrix\\Main\\UserField\\Internal\\UserFieldHelper', 'onDeleteUserFieldValues', '', 2, '074b2e25238a00ffc809ad12b609db2c'),
	(65, NULL, 100, 'main', 'OnAuthProvidersBuildList', 'main', '', '\\Bitrix\\Main\\Access\\Auth\\AccessAuthProvider', 'getProviders', '', 1, '3a2839dac113bf47bce01812903e768a'),
	(66, NULL, 100, 'iblock', 'OnBeforeIBlockSectionUpdate', 'main', '', '\\Bitrix\\Main\\Access\\Auth\\AccessEventHandler', 'onBeforeIBlockSectionUpdate', '', 1, 'dde505dba68c59bd4661b7680c329485'),
	(67, NULL, 100, 'iblock', 'OnBeforeIBlockSectionAdd', 'main', '', '\\Bitrix\\Main\\Access\\Auth\\AccessEventHandler', 'onBeforeIBlockSectionAdd', '', 1, 'd3a665b1890dabbba32ff01e3e46ec57'),
	(68, NULL, 100, 'iblock', 'OnBeforeIBlockSectionDelete', 'main', '', '\\Bitrix\\Main\\Access\\Auth\\AccessEventHandler', 'onBeforeIBlockSectionDelete', '', 1, '157add4b02621a60fabf1369c3e7ea9b'),
	(69, NULL, 100, 'main', 'OnBuildGlobalMenu', 'b24connector', '', '\\Bitrix\\B24Connector\\Helper', 'onBuildGlobalMenu', '', 1, '9c4452a442bacc2d4d70635962485be1'),
	(70, NULL, 100, 'main', 'OnBeforeProlog', 'b24connector', '', '\\Bitrix\\B24Connector\\Helper', 'onBeforeProlog', '', 1, '641053ff6ee8ff57518d7c30724530e5'),
	(71, NULL, 100, 'main', 'OnBeforeProlog', 'bitrix.sitecorporate', '', 'CSiteCorporate', 'ShowPanel', '', 1, 'bc7c322534797a9ed3493c40e1b8fdac'),
	(72, NULL, 100, 'main', 'OnBeforeProlog', 'bitrix.siteinfoportal', '', 'CSiteInfoportal', 'ShowPanel', '', 1, '7ffb3da30f1bec7fe0c7456a8ec3b8d7'),
	(73, NULL, 100, 'main', 'OnBeforeProlog', 'bitrix.sitepersonal', '', 'CSitePersonal', 'ShowPanel', '', 1, '5a8bf3ea4b17f8d011b8f398c05ac89b'),
	(74, NULL, 100, 'main', 'OnAdminInformerInsertItems', 'bitrixcloud', '', 'CBitrixCloudBackup', 'OnAdminInformerInsertItems', '', 1, '5499039afdd0fdb38d4b245c8b886dcb'),
	(75, NULL, 100, 'mobileapp', 'OnBeforeAdminMobileMenuBuild', 'bitrixcloud', '', 'CBitrixCloudMobile', 'OnBeforeAdminMobileMenuBuild', '', 1, '5828a8cdb2cc45e2724ef1c76139df88'),
	(76, NULL, 100, 'search', 'OnReindex', 'blog', '', 'CBlogSearch', 'OnSearchReindex', '', 1, '6c23ebfcdfc99d14541ad083b0ee7430'),
	(77, NULL, 100, 'main', 'OnUserDelete', 'blog', '', '\\Bitrix\\Blog\\BlogUser', 'onUserDelete', '', 1, '470dc0caadb6eee3cf6bd32a89d2aa38'),
	(78, NULL, 100, 'main', 'OnSiteDelete', 'blog', '', 'CBlogSitePath', 'DeleteBySiteID', '', 1, '33b1b3449b56990b745b251f3976521d'),
	(79, NULL, 100, 'socialnetwork', 'OnSocNetGroupDelete', 'blog', '', 'CBlogSoNetPost', 'OnGroupDelete', '', 1, '4fa06723b7108652d8f6846f17c4bfda'),
	(80, NULL, 100, 'socialnetwork', 'OnSocNetFeaturesAdd', 'blog', '', 'CBlogSearch', 'SetSoNetFeatureIndexSearch', '', 1, '5e642b195637a47eda278a2f769d72ae'),
	(81, NULL, 100, 'socialnetwork', 'OnSocNetFeaturesUpdate', 'blog', '', 'CBlogSearch', 'SetSoNetFeatureIndexSearch', '', 1, '94116bd773c35830e32cabd264e1deac'),
	(82, NULL, 100, 'socialnetwork', 'OnBeforeSocNetFeaturesPermsAdd', 'blog', '', 'CBlogSearch', 'OnBeforeSocNetFeaturesPermsAdd', '', 1, 'ef99702762ccf8958b3bd05a0bc2bd21'),
	(83, NULL, 100, 'socialnetwork', 'OnSocNetFeaturesPermsAdd', 'blog', '', 'CBlogSearch', 'SetSoNetFeaturePermIndexSearch', '', 1, '7e78a43487928787ac0665eb1eade0d5'),
	(84, NULL, 100, 'socialnetwork', 'OnBeforeSocNetFeaturesPermsUpdate', 'blog', '', 'CBlogSearch', 'OnBeforeSocNetFeaturesPermsUpdate', '', 1, '13116dc44040b680c93a2b7f60ff2845'),
	(85, NULL, 100, 'socialnetwork', 'OnSocNetFeaturesPermsUpdate', 'blog', '', 'CBlogSearch', 'SetSoNetFeaturePermIndexSearch', '', 1, '06ae1cde11216c73393f8720c0f31ea9'),
	(86, NULL, 200, 'main', 'OnAfterAddRating', 'blog', '', 'CRatingsComponentsBlog', 'OnAfterAddRating', '', 1, '6dd70a97fa5c2f15e619721007813bd0'),
	(87, NULL, 200, 'main', 'OnAfterUpdateRating', 'blog', '', 'CRatingsComponentsBlog', 'OnAfterUpdateRating', '', 1, 'a2f4b906bc5e1e984c28ef37728d7007'),
	(88, NULL, 200, 'main', 'OnSetRatingsConfigs', 'blog', '', 'CRatingsComponentsBlog', 'OnSetRatingConfigs', '', 1, '4461c77de3ca9dec12cd66c9554555a0'),
	(89, NULL, 200, 'main', 'OnGetRatingsConfigs', 'blog', '', 'CRatingsComponentsBlog', 'OnGetRatingConfigs', '', 1, '6708964800c60ed28bb3ac095494d0f8'),
	(90, NULL, 200, 'main', 'OnGetRatingsObjects', 'blog', '', 'CRatingsComponentsBlog', 'OnGetRatingObject', '', 1, '29df09132203259924e883921fed0971'),
	(91, NULL, 200, 'main', 'OnGetRatingContentOwner', 'blog', '', 'CRatingsComponentsBlog', 'OnGetRatingContentOwner', '', 1, 'a47b921e59710bdca16e2284d11e8aa0'),
	(92, NULL, 100, 'im', 'OnGetNotifySchema', 'blog', '', 'CBlogNotifySchema', 'OnGetNotifySchema', '', 1, 'cd6910b2ee2dd66f257a68a6406b9f79'),
	(93, NULL, 100, 'im', 'OnAnswerNotify', 'blog', '', 'CBlogNotifySchema', 'CBlogEventsIMCallback', '', 1, '890d3be770eab6025cc54e120d3b51f5'),
	(94, NULL, 100, 'main', 'OnAfterRegisterModule', 'main', '/modules/blog/install/index.php', 'blog', 'installUserFields', '', 1, 'bfd07861166a9d51c1d21d18b291a1dc'),
	(95, NULL, 100, 'conversion', 'OnGetCounterTypes', 'blog', '', '\\Bitrix\\Blog\\Internals\\ConversionHandlers', 'onGetCounterTypes', '', 1, 'e5df84e19828b3b95901e7b2a5d55cb1'),
	(96, NULL, 100, 'conversion', 'OnGetRateTypes', 'blog', '', '\\Bitrix\\Blog\\Internals\\ConversionHandlers', 'onGetRateTypes', '', 1, '75028a7a2551f7c677c09c367ed1a54c'),
	(97, NULL, 100, 'blog', 'OnPostAdd', 'blog', '', '\\Bitrix\\Blog\\Internals\\ConversionHandlers', 'onPostAdd', '', 1, 'a3b637f0c0945089c95d5c08e1166938'),
	(98, NULL, 100, 'mail', 'onReplyReceivedBLOG_POST', 'blog', '', '\\Bitrix\\Blog\\Internals\\MailHandler', 'handleReplyReceivedBlogPost', '', 2, '5e3d8ad3f14c5b994981074e43a02cd7'),
	(99, NULL, 100, 'mail', 'onForwardReceivedBLOG_POST', 'blog', '', '\\Bitrix\\Blog\\Internals\\MailHandler', 'handleForwardReceivedBlogPost', '', 2, '6002badd4ffa13790a43d45c5c29fca3'),
	(100, NULL, 100, 'socialnetwork', 'onLogIndexGetContent', 'blog', '', '\\Bitrix\\Blog\\Integration\\Socialnetwork\\Log', 'onIndexGetContent', '', 2, '3fba13b74a731f896448388c082c24a4'),
	(101, NULL, 100, 'socialnetwork', 'onLogCommentIndexGetContent', 'blog', '', '\\Bitrix\\Blog\\Integration\\Socialnetwork\\LogComment', 'onIndexGetContent', '', 2, '57ce8e76c004b1447554d8ec64c48783'),
	(102, NULL, 100, 'socialnetwork', 'onContentViewed', 'blog', '', '\\Bitrix\\Blog\\Integration\\Socialnetwork\\ContentViewHandler', 'onContentViewed', '', 2, 'd33a4b2ae579a2c9b5ddcea17bc62806'),
	(103, NULL, 100, 'main', 'OnEventLogGetAuditTypes', 'clouds', '', 'CCloudStorage', 'GetAuditTypes', '', 1, 'da69722ba95497cf263381b46e24df40'),
	(104, NULL, 90, 'main', 'OnBeforeProlog', 'clouds', '', 'CCloudStorage', 'OnBeforeProlog', '', 1, 'f8c39ff182ad873715f10a7091f928a4'),
	(105, NULL, 100, 'main', 'OnAdminListDisplay', 'clouds', '', 'CCloudStorage', 'OnAdminListDisplay', '', 1, '8ddf4f578e7229a63cba4d2124c7643c'),
	(106, NULL, 100, 'main', 'OnBuildGlobalMenu', 'clouds', '', 'CCloudStorage', 'OnBuildGlobalMenu', '', 1, 'd6d308843a6521ad50bfa230a2fcef8f'),
	(107, NULL, 100, 'main', 'OnFileSave', 'clouds', '', 'CCloudStorage', 'OnFileSave', '', 1, '1e4f94a842d6166359ed1789a6f21245'),
	(108, NULL, 100, 'main', 'OnAfterFileSave', 'clouds', '', 'CCloudStorage', 'OnAfterFileSave', '', 1, 'c36bae07a3080f9b5bc5d422ec96933f'),
	(109, NULL, 100, 'main', 'OnGetFileSRC', 'clouds', '', 'CCloudStorage', 'OnGetFileSRC', '', 1, '7ec03b3b7ad3f2f54c1e438a1172e5a8'),
	(110, NULL, 100, 'main', 'OnFileCopy', 'clouds', '', 'CCloudStorage', 'OnFileCopy', '', 1, '6880b56c76f7d3c5d09f887fca6341ca'),
	(111, NULL, 100, 'main', 'OnPhysicalFileDelete', 'clouds', '', 'CCloudStorage', 'OnFileDelete', '', 1, '3151c487c747a57d7817f68e97fd1c94'),
	(112, NULL, 100, 'main', 'OnMakeFileArray', 'clouds', '', 'CCloudStorage', 'OnMakeFileArray', '', 1, '713ea8a7a25764b1af60f7a1ec3032d5'),
	(113, NULL, 100, 'main', 'OnBeforeResizeImage', 'clouds', '', 'CCloudStorage', 'OnBeforeResizeImage', '', 1, '705cd310c52f9c7e8e0c8a0578a22667'),
	(114, NULL, 100, 'main', 'OnAfterResizeImage', 'clouds', '', 'CCloudStorage', 'OnAfterResizeImage', '', 1, 'a403ad2328227153475df0c478a465cc'),
	(115, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_AmazonS3', 'GetObjectInstance', '', 1, 'a4eb7ed1f50b5931474c565f448a4069'),
	(116, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_GoogleStorage', 'GetObjectInstance', '', 1, '1e559e2225608e8d40eeede5b7526f2a'),
	(117, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_OpenStackStorage', 'GetObjectInstance', '', 1, '5ad09feff5dab28ab571ad034ccdf2ea'),
	(118, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_RackSpaceCloudFiles', 'GetObjectInstance', '', 1, 'cc976773610cf809bb56871ac7dd9f01'),
	(119, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_ClodoRU', 'GetObjectInstance', '', 1, 'faadad31436e94c420ed787e4424714b'),
	(120, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_Selectel', 'GetObjectInstance', '', 1, '5e63a8eebed42bd099b4a9ef62e8d52b'),
	(121, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_HotBox', 'GetObjectInstance', '', 1, '1913169adcd6d6f3b7fb5f3b70ba1fd8'),
	(122, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_Yandex', 'GetObjectInstance', '', 1, '12bd1d4f0d145d5b1681955612fe61c8'),
	(123, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_S3', 'GetObjectInstance', '', 1, '4af3f0ba1f50ed9be6efcdb55dfbee4e'),
	(124, NULL, 100, 'perfmon', 'OnGetTableSchema', 'clouds', '', 'clouds', 'OnGetTableSchema', '', 1, 'd31a1f80f07441976eb1711db4902a71'),
	(125, NULL, 100, 'main', 'OnGroupDelete', 'fileman', '', 'CFileman', 'OnGroupDelete', '', 1, 'd10f791d422ba0e7551ab267db50404c'),
	(126, NULL, 100, 'main', 'OnPanelCreate', 'fileman', '', 'CFileman', 'OnPanelCreate', '', 1, 'b00a6174fb1763684c299ccf5e054c65'),
	(127, NULL, 100, 'main', 'OnModuleUpdate', 'fileman', '', 'CFileman', 'OnModuleUpdate', '', 1, '58ae853e2b7c230b5cdb51129efd8a05'),
	(128, NULL, 100, 'main', 'OnModuleInstalled', 'fileman', '', 'CFileman', 'ClearComponentsListCache', '', 1, '7bdbd354eab11f376fa257a998587277'),
	(129, NULL, 100, 'iblock', 'OnIBlockPropertyBuildList', 'fileman', '', 'CIBlockPropertyMapGoogle', 'GetUserTypeDescription', '', 1, 'd9d06fd05f80b33379359ebd8e36e655'),
	(130, NULL, 100, 'iblock', 'OnIBlockPropertyBuildList', 'fileman', '', 'CIBlockPropertyMapYandex', 'GetUserTypeDescription', '', 1, '20ca1d02998884b5abec68b32fdb561d'),
	(131, NULL, 100, 'iblock', 'OnIBlockPropertyBuildList', 'fileman', '', 'CIBlockPropertyVideo', 'GetUserTypeDescription', '', 1, '991c32062e05844708a5cf7aba37bf9a'),
	(132, NULL, 100, 'main', 'OnUserTypeBuildList', 'fileman', '', 'CUserTypeVideo', 'GetUserTypeDescription', '', 1, '41bc5efb49ebf8d165acd4e4d556f60c'),
	(133, NULL, 100, 'main', 'OnEventLogGetAuditTypes', 'fileman', '', 'CEventFileman', 'GetAuditTypes', '', 1, 'e0a610651ffec1fbddb2f261223fb2e9'),
	(134, NULL, 100, 'main', 'OnEventLogGetAuditHandlers', 'fileman', '', 'CEventFileman', 'MakeFilemanObject', '', 1, 'fbfef1ef99530f6eae191da293f9566c'),
	(135, NULL, 154, 'main', 'OnUserTypeBuildList', 'fileman', '', '\\Bitrix\\Fileman\\UserField\\Address', 'getUserTypeDescription', '', 1, 'f0583a376e38d3d2675513b1a367ed3c'),
	(136, NULL, 100, 'sender', 'OnConnectorList', 'form', '', '\\Bitrix\\Form\\SenderEventHandler', 'onConnectorListForm', '', 1, '182217f1803d20e2899086e379ada21c'),
	(137, NULL, 100, 'main', 'OnAfterUserUpdate', 'forum', '', 'CForumUser', 'OnAfterUserUpdate', '', 1, '18ca0a9757a229b6290603235dfff0d1'),
	(138, NULL, 100, 'main', 'OnGroupDelete', 'forum', '', 'CForumNew', 'OnGroupDelete', '', 1, '63f10ce39f269a9f1add6a0600aa05b9'),
	(139, NULL, 100, 'main', 'OnBeforeLangDelete', 'forum', '', 'CForumNew', 'OnBeforeLangDelete', '', 1, '201c2a343960654a90382521e253328f'),
	(140, NULL, 100, 'main', 'OnFileDelete', 'forum', '', 'CForumFiles', 'OnFileDelete', '', 1, 'a00aa95408b2665018cb63e21cef4684'),
	(141, NULL, 100, 'search', 'OnReindex', 'forum', '', 'CForumNew', 'OnReindex', '', 1, '3fe2c3077963069fee2360611d840816'),
	(142, NULL, 100, 'main', 'OnUserDelete', 'forum', '', 'CForumUser', 'OnUserDelete', '', 1, 'eb0cb7958d708be629eba740bcabd8c4'),
	(143, NULL, 100, 'iblock', 'OnIBlockPropertyBuildList', 'main', '/modules/forum/tools/prop_topicid.php', 'CIBlockPropertyTopicID', 'GetUserTypeDescription', '', 1, 'd5b04b52654500981293dbcf10ca1ef9'),
	(144, NULL, 100, 'iblock', 'OnBeforeIBlockElementDelete', 'forum', '', 'CForumTopic', 'OnBeforeIBlockElementDelete', '', 1, '929cf569dd703b922e4a96a0a023f120'),
	(145, NULL, 100, 'main', 'OnEventLogGetAuditTypes', 'forum', '', 'CForumEventLog', 'GetAuditTypes', '', 1, '30a759001702af8052ea65e700c519c7'),
	(146, NULL, 100, 'main', 'OnEventLogGetAuditHandlers', 'forum', '', 'CEventForum', 'MakeForumObject', '', 1, '78ecc0524ac5d4fb0545c8a3fa28b3bd'),
	(147, NULL, 100, 'socialnetwork', 'OnSocNetGroupDelete', 'forum', '', 'CForumUser', 'OnSocNetGroupDelete', '', 1, '94cfb4cf5460746b7b31a5b93a3805f6'),
	(148, NULL, 100, 'socialnetwork', 'OnSocNetLogFormatEvent', 'forum', '', 'CForumMessage', 'OnSocNetLogFormatEvent', '', 1, '28c7a91a467c1190a064f597487abd5c'),
	(149, NULL, 100, 'mail', 'OnGetFilterList', 'forum', '', 'CForumEMail', 'OnGetSocNetFilterList', '', 1, 'e42fc61795fed0c5f397259bb6f1f6b9'),
	(150, NULL, 100, 'main', 'OnAfterAddRating', 'forum', '', 'CRatingsComponentsForum', 'OnAfterAddRating', '', 1, 'db966e6ee1f8b98f83e57411f4757858'),
	(151, NULL, 100, 'main', 'OnAfterUpdateRating', 'forum', '', 'CRatingsComponentsForum', 'OnAfterUpdateRating', '', 1, 'f5f6a93c1fe6d7dc61fbb5bf25f9965f'),
	(152, NULL, 100, 'main', 'OnSetRatingsConfigs', 'forum', '', 'CRatingsComponentsForum', 'OnSetRatingConfigs', '', 1, '84556c2f1f7f23189f90603f45ad3942'),
	(153, NULL, 100, 'main', 'OnGetRatingsConfigs', 'forum', '', 'CRatingsComponentsForum', 'OnGetRatingConfigs', '', 1, '7ead6be47d7bb2e297a2af57f85dc7ee'),
	(154, NULL, 100, 'main', 'OnGetRatingsObjects', 'forum', '', 'CRatingsComponentsForum', 'OnGetRatingObject', '', 1, '99f4b68c8e6c1598377e0016b31234bb'),
	(155, NULL, 100, 'main', 'OnGetRatingContentOwner', 'forum', '', 'CRatingsComponentsForum', 'OnGetRatingContentOwner', '', 1, '5ef51ecf36931b3a32f4fea00dc49c8c'),
	(156, NULL, 100, 'im', 'OnGetNotifySchema', 'forum', '', 'CForumNotifySchema', 'OnGetNotifySchema', '', 1, 'ad425ff862192078c050ea34d60f8d63'),
	(157, NULL, 100, 'main', 'OnAfterRegisterModule', 'main', '/modules/forum/install/index.php', 'forum', 'InstallUserFields', '', 1, '205fd3e33648d7e1ed6f4b7f0298f603'),
	(158, NULL, 100, 'rest', 'OnRestServiceBuildDescription', 'forum', '', 'CForumRestService', 'OnRestServiceBuildDescription', '', 1, '506b2a93cea64d73c9e7c187fdde2840'),
	(159, NULL, 100, 'conversion', 'OnGetCounterTypes', 'forum', '', '\\Bitrix\\Forum\\Internals\\ConversionHandlers', 'onGetCounterTypes', '', 1, 'fa69bf6ff10a0fb9b2e91098f0c0bab3'),
	(160, NULL, 100, 'conversion', 'OnGetRateTypes', 'forum', '', '\\Bitrix\\Forum\\Internals\\ConversionHandlers', 'onGetRateTypes', '', 1, '9eb2b6d8edde63385655c1001d9e0c31'),
	(161, NULL, 100, 'forum', 'onAfterTopicAdd', 'forum', '', '\\Bitrix\\Forum\\Internals\\ConversionHandlers', 'onTopicAdd', '', 1, 'ea61a319e93c2c3a9bfc9a63840b2155'),
	(162, NULL, 100, 'forum', 'onAfterMessageAdd', 'forum', '', '\\Bitrix\\Forum\\Internals\\ConversionHandlers', 'onMessageAdd', '', 1, '3cc5f27501dad77acdecb1c8a4e978de'),
	(163, NULL, 100, 'socialnetwork', 'onLogIndexGetContent', 'forum', '', '\\Bitrix\\Forum\\Integration\\Socialnetwork\\Log', 'onIndexGetContent', '', 2, '909a8b84bf80774a6a89bfbbd2258ce8'),
	(164, NULL, 100, 'socialnetwork', 'onLogCommentIndexGetContent', 'forum', '', '\\Bitrix\\Forum\\Integration\\Socialnetwork\\LogComment', 'onIndexGetContent', '', 2, 'e6aaa86c7daeae2bc002e513f06ccffa'),
	(165, NULL, 100, 'socialnetwork', 'onContentViewed', 'forum', '', '\\Bitrix\\Forum\\Integration\\Socialnetwork\\ContentViewHandler', 'onContentViewed', '', 2, '5db6b373f6612f36c2ff6783dd4d6154'),
	(166, NULL, 100, 'main', 'OnBeforeUserTypeAdd', 'highloadblock', '', '\\Bitrix\\Highloadblock\\HighloadBlockTable', 'OnBeforeUserTypeAdd', '', 1, 'f9dcff287cf7753e5c56974d37975507'),
	(167, NULL, 100, 'main', 'OnAfterUserTypeAdd', 'highloadblock', '', '\\Bitrix\\Highloadblock\\HighloadBlockTable', 'onAfterUserTypeAdd', '', 1, 'd1fa2865e72eca144b964b6fb1eefc15'),
	(168, NULL, 100, 'main', 'OnBeforeUserTypeDelete', 'highloadblock', '', '\\Bitrix\\Highloadblock\\HighloadBlockTable', 'OnBeforeUserTypeDelete', '', 1, '1bf13707e1a45b8320c2ecd35534cbb4'),
	(169, NULL, 100, 'main', 'OnUserTypeBuildList', 'highloadblock', '', 'CUserTypeHlblock', 'GetUserTypeDescription', '', 1, '2ac4a2154f4fd85d67b50f412ed5ed48'),
	(170, NULL, 100, 'iblock', 'OnIBlockPropertyBuildList', 'highloadblock', '', 'CIBlockPropertyDirectory', 'GetUserTypeDescription', '', 1, 'a6f7df502db8a04590e43188d7cbfc99'),
	(171, NULL, 100, 'main', 'OnGroupDelete', 'iblock', '', 'CIBlock', 'OnGroupDelete', '', 1, 'f2320df213f38adf32364d3169d5b197'),
	(172, NULL, 100, 'main', 'OnBeforeLangDelete', 'iblock', '', 'CIBlock', 'OnBeforeLangDelete', '', 1, '46aef774958db327c1170a12d3a70ee5'),
	(173, NULL, 100, 'main', 'OnLangDelete', 'iblock', '', 'CIBlock', 'OnLangDelete', '', 1, '861f6ee2ca56bf63c3af07db0553606b'),
	(174, NULL, 100, 'main', 'OnUserTypeRightsCheck', 'iblock', '', 'CIBlockSection', 'UserTypeRightsCheck', '', 1, '2a6d446893d46f04f2c151f458d2908c'),
	(175, NULL, 100, 'search', 'OnReindex', 'iblock', '', 'CIBlock', 'OnSearchReindex', '', 1, 'c6c8111f129e0eb19e558106e354e6f6'),
	(176, NULL, 100, 'search', 'OnSearchGetURL', 'iblock', '', 'CIBlock', 'OnSearchGetURL', '', 1, '0ae9fc756bfb1273309240cd8f535672'),
	(177, NULL, 100, 'main', 'OnEventLogGetAuditTypes', 'iblock', '', 'CIBlock', 'GetAuditTypes', '', 1, '182d19c163e3a5a965bca170c3fb0e83'),
	(178, NULL, 100, 'main', 'OnEventLogGetAuditHandlers', 'iblock', '', 'CEventIBlock', 'MakeIBlockObject', '', 1, 'f7a182e8d9b204970d111e4703b9f523'),
	(179, NULL, 200, 'main', 'OnGetRatingContentOwner', 'iblock', '', 'CRatingsComponentsIBlock', 'OnGetRatingContentOwner', '', 1, '6da245944e376d586a3fa2aaee02c70b'),
	(180, NULL, 100, 'main', 'OnTaskOperationsChanged', 'iblock', '', 'CIBlockRightsStorage', 'OnTaskOperationsChanged', '', 1, '01b3f9984fa07b1dfb4bc35d107d5672'),
	(181, NULL, 100, 'main', 'OnGroupDelete', 'iblock', '', 'CIBlockRightsStorage', 'OnGroupDelete', '', 1, '2dbbccdee3f2e7bd86446bec02be1d54'),
	(182, NULL, 100, 'main', 'OnUserDelete', 'iblock', '', 'CIBlockRightsStorage', 'OnUserDelete', '', 1, '78f090ee29030c54788098b0782d28f9'),
	(183, NULL, 100, 'perfmon', 'OnGetTableSchema', 'iblock', '', 'iblock', 'OnGetTableSchema', '', 1, '4b71a345c136beed338aa7137943d80b'),
	(184, NULL, 100, 'sender', 'OnConnectorList', 'iblock', '', '\\Bitrix\\Iblock\\SenderEventHandler', 'onConnectorListIblock', '', 1, '3de75587a47352dd3cb6d10866f69385'),
	(185, NULL, 10, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyDate', 'GetUserTypeDescription', '', 1, 'fa608e2c397b6793c54ad296619a22e2'),
	(186, NULL, 20, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyDateTime', 'GetUserTypeDescription', '', 1, '78554c9e3c38ac383d51f0ee4d013120'),
	(187, NULL, 30, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyXmlID', 'GetUserTypeDescription', '', 1, '952fe5f2ea67493fb9f9b924ce1b992b'),
	(188, NULL, 40, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyFileMan', 'GetUserTypeDescription', '', 1, 'fd688441d5e8203751fb47374931e011'),
	(189, NULL, 50, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyHTML', 'GetUserTypeDescription', '', 1, '27645f81ce5d6d9f19a47cc171860beb'),
	(190, NULL, 60, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyElementList', 'GetUserTypeDescription', '', 1, 'c53e9314ae43c30267b32310a02d7df4'),
	(191, NULL, 70, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertySequence', 'GetUserTypeDescription', '', 1, '3ff9528d1264fc77697248957aafdab5'),
	(192, NULL, 80, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyElementAutoComplete', 'GetUserTypeDescription', '', 1, '0d233a1e7a0d6a52a52e13df88291024'),
	(193, NULL, 90, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertySKU', 'GetUserTypeDescription', '', 1, '8678bc826ced4f66640fba3775b18516'),
	(194, NULL, 100, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertySectionAutoComplete', 'GetUserTypeDescription', '', 1, '26ff6f651cb94a1fe4ce9827566f0730'),
	(195, NULL, 100, 'main', 'onVirtualClassBuildList', 'iblock', '', 'Bitrix\\Iblock\\IblockTable', 'compileAllEntities', '', 2, '8a4e85071d25e6ba7f9ed315874c411b'),
	(196, NULL, 100, 'bitrix24', 'onDomainChange', 'landing', '', '\\Bitrix\\Landing\\Update\\Block\\NodeAttributes', 'updateFormDomain', '', 2, 'a5f1ac2c31163115813298acc7bbffcf'),
	(197, NULL, 100, 'intranet', 'onBuildBindingMenu', 'landing', '', '\\Bitrix\\Landing\\Connector\\Intranet', 'onBuildBindingMenu', '', 2, 'd5464da9aea2308d3d5f13c2387c4c40'),
	(198, NULL, 100, 'landing', 'onBuildSourceList', 'landing', '', '\\Bitrix\\Landing\\Connector\\Landing', 'onSourceBuildHandler', '', 2, 'fc391addc82a816df68510b0ae3363a5'),
	(199, NULL, 100, 'main', 'onBeforeSiteDelete', 'landing', '', '\\Bitrix\\Landing\\Site', 'onBeforeMainSiteDelete', '', 2, '5faa9b5de931dbb101e2e0aef6fc594b'),
	(200, NULL, 100, 'main', 'onSiteDelete', 'landing', '', '\\Bitrix\\Landing\\Site', 'onMainSiteDelete', '', 2, 'af029bceca7ea9cc809515e95bd3a710'),
	(201, NULL, 100, 'main', 'onUserConsentProviderList', 'landing', '', '\\Bitrix\\Landing\\Site\\Cookies', 'onUserConsentProviderList', '', 2, 'f59a96e272348f934d62ba5d3ee79f21'),
	(202, NULL, 100, 'mobile', 'onMobileMenuStructureBuilt', 'landing', '', '\\Bitrix\\Landing\\Connector\\Mobile', 'onMobileMenuStructureBuilt', '', 2, '01fd8a44b83b5f7fcd2f36a626657ad0'),
	(203, NULL, 100, 'rest', 'onRestServiceBuildDescription', 'landing', '', '\\Bitrix\\Landing\\Publicaction', 'restBase', '', 2, '9af99ddecf2dd8c3c5b14721f23e8fef'),
	(204, NULL, 100, 'rest', 'onBeforeApplicationUninstall', 'landing', '', '\\Bitrix\\Landing\\Publicaction', 'beforeRestApplicationDelete', '', 2, 'ef1f080a088ad54298a4ba9bf2896313'),
	(205, NULL, 100, 'rest', 'onRestAppDelete', 'landing', '', '\\Bitrix\\Landing\\Publicaction', 'restApplicationDelete', '', 2, '031cfc016e3be91368376a391c351dea'),
	(206, NULL, 100, 'rest', 'onRestApplicationConfigurationGetManifest', 'landing', '', '\\Bitrix\\Landing\\Transfer\\AppConfiguration', 'getManifestList', '', 2, 'b88124aac7c2c8ddecf2ce127a9c6ef8'),
	(207, NULL, 100, 'rest', 'onRestApplicationConfigurationExport', 'landing', '', '\\Bitrix\\Landing\\Transfer\\AppConfiguration', 'onEventExportController', '', 2, '917b00a9f82e6b8f7899a6e8c3b22236'),
	(208, NULL, 100, 'rest', 'onRestApplicationConfigurationGetManifestSetting', 'landing', '', '\\Bitrix\\Landing\\Transfer\\AppConfiguration', 'onInitManifest', '', 2, '99fa9aa37a23a371cca0153c840c7802'),
	(209, NULL, 100, 'rest', 'onRestApplicationConfigurationEntity', 'landing', '', '\\Bitrix\\Landing\\Transfer\\AppConfiguration', 'getEntityList', '', 2, '820df699b9abf22ce0356fc9957be794'),
	(210, NULL, 100, 'rest', 'onRestApplicationConfigurationImport', 'landing', '', '\\Bitrix\\Landing\\Transfer\\AppConfiguration', 'onEventImportController', '', 2, 'e65daaed01b2c52e6098ee47ddb7f07a'),
	(211, NULL, 100, 'rest', 'onRestApplicationConfigurationFinish', 'landing', '', '\\Bitrix\\Landing\\Transfer\\AppConfiguration', 'onFinish', '', 2, '45343e5617dca2ad06a5d13050232caf'),
	(212, NULL, 100, 'socialnetwork', 'onFillSocNetFeaturesList', 'landing', '', '\\Bitrix\\Landing\\Connector\\SocialNetwork', 'onFillSocNetFeaturesList', '', 2, '9825d91c89b53b69655aa98ea4f3a6cf'),
	(213, NULL, 100, 'socialnetwork', 'onFillSocNetMenu', 'landing', '', '\\Bitrix\\Landing\\Connector\\SocialNetwork', 'onFillSocNetMenu', '', 2, '14ecfb8fb4fc20f22ddb5ac64783461d'),
	(214, NULL, 100, 'socialnetwork', 'onSocNetGroupDelete', 'landing', '', '\\Bitrix\\Landing\\Connector\\SocialNetwork', 'onSocNetGroupDelete', '', 2, '78202f1461a8822a105a19f45502c327'),
	(215, NULL, 100, 'socialservices', '\\Bitrix\\Socialservices\\ApTable::OnAfterAdd', 'landing', '', '\\Bitrix\\Landing\\Update\\Block\\NodeAttributes', 'updateFormDomainByConnector', '', 2, '0152997776462d358b5364b794cd205e'),
	(216, NULL, 100, 'main', 'OnAfterEpilog', 'messageservice', '', '\\Bitrix\\MessageService\\Queue', 'run', '', 1, '6bcb21b0ccc5ac89d9531ddf8b94683c'),
	(217, NULL, 100, 'rest', 'OnRestServiceBuildDescription', 'messageservice', '', '\\Bitrix\\MessageService\\RestService', 'onRestServiceBuildDescription', '', 1, '7524628243223e572590eea87cc03f73'),
	(218, NULL, 100, 'rest', 'OnRestAppDelete', 'messageservice', '', '\\Bitrix\\MessageService\\RestService', 'onRestAppDelete', '', 1, '5febc41cd526ecba95dbb4843dd9c134'),
	(219, NULL, 100, 'rest', 'OnRestAppUpdate', 'messageservice', '', '\\Bitrix\\MessageService\\RestService', 'onRestAppUpdate', '', 1, '7e77b4d550c200a4ec06872af7857ee6'),
	(220, NULL, 100, 'pull', 'OnGetDependentModule', 'mobileapp', '', 'CMobileAppPullSchema', 'OnGetDependentModule', '', 1, '4833278dbe60d476fbccbaa54545cffa'),
	(221, NULL, 100, 'perfmon', 'OnGetTableSchema', 'perfmon', '', 'perfmon', 'OnGetTableSchema', '', 1, '3a4da255b44f05899b64e66a40c12662'),
	(222, NULL, 100, 'iblock', 'OnBeforeIBlockElementDelete', 'photogallery', '', 'CPhotogalleryElement', 'OnBeforeIBlockElementDelete', '', 1, 'dc9ea0b8411dfa54929a022d44bc5b1a'),
	(223, NULL, 100, 'iblock', 'OnAfterIBlockElementAdd', 'photogallery', '', 'CPhotogalleryElement', 'OnAfterIBlockElementAdd', '', 1, '7fc7f3cc71ad3188022388365d446ed2'),
	(224, NULL, 100, 'search', 'BeforeIndex', 'photogallery', '', 'CRatingsComponentsPhotogallery', 'BeforeIndex', '', 1, '06e2330d56c3b972e67707d665383704'),
	(225, NULL, 100, 'im', 'OnGetNotifySchema', 'photogallery', '', 'CPhotogalleryNotifySchema', 'OnGetNotifySchema', '', 1, '7ca75249042a033e858d90dc2473adac'),
	(226, NULL, 100, 'socialnetwork', 'OnSocNetGroupDelete', 'photogallery', '', '\\Bitrix\\Photogallery\\Integration\\Socialnetwork\\Group', 'onSocNetGroupDelete', '', 1, 'bded61c39d768685fa7dd112c63c702b'),
	(227, NULL, 49, 'main', 'OnBeforeProlog', 'rest', '', 'CRestEventHandlers', 'OnBeforeProlog', '', 2, '395c9c42c3cc9392de1e5887617afe6d'),
	(228, NULL, 100, 'rest', 'OnRestServiceBuildDescription', 'rest', '', 'CBitrixRestEntity', 'OnRestServiceBuildDescription', '', 2, 'f63068b1eb62c36219518206e1e2827c'),
	(229, NULL, 100, 'rest', 'OnRestServiceBuildDescription', 'rest', '', '\\Bitrix\\Rest\\Api\\User', 'onRestServiceBuildDescription', '', 2, 'c9a03e9019564649e55f5409b661e050'),
	(230, NULL, 100, 'rest', 'OnRestServiceBuildDescription', 'rest', '', '\\Bitrix\\Rest\\Api\\Placement', 'onRestServiceBuildDescription', '', 2, '9751a266c2b6f6be5c34b1541bf7c194'),
	(231, NULL, 100, 'rest', 'OnRestServiceBuildDescription', 'rest', '', '\\Bitrix\\Rest\\Api\\Event', 'onRestServiceBuildDescription', '', 2, '842ad63f19aff6d810059c7e56739aae'),
	(232, NULL, 100, 'rest', 'OnRestServiceBuildDescription', 'rest', '', '\\Bitrix\\Rest\\Api\\UserFieldType', 'onRestServiceBuildDescription', '', 2, '4caf68a5256aabe4abef37f24562e59b'),
	(233, NULL, 100, 'rest', 'onFindMethodDescription', 'rest', '', '\\Bitrix\\Rest\\Engine\\RestManager', 'onFindMethodDescription', '', 2, '4d0614f880674af333326dd5ba9b2828'),
	(234, NULL, 100, 'main', 'OnApplicationsBuildList', 'main', 'modules/rest/lib/apauth/application.php', '\\Bitrix\\Rest\\APAuth\\Application', 'onApplicationsBuildList', '', 2, '9c39129872987f8dcc8baacc0c446ed7'),
	(235, NULL, 100, 'im', 'OnAfterConfirmNotify', 'rest', '', '\\Bitrix\\Rest\\NotifyIm', 'receive', '', 2, '2ac9c19fe69d4e106deaa6f4a7a4371b'),
	(236, NULL, 100, 'rest', '\\Bitrix\\Rest\\APAuth\\Password::OnDelete', 'rest', '', '\\Bitrix\\Rest\\APAuth\\PermissionTable', 'onPasswordDelete', '', 2, 'f04447ca635f045ec1a64e593964fc90'),
	(237, NULL, 100, 'perfmon', 'OnGetTableSchema', 'rest', '', 'rest', 'OnGetTableSchema', '', 2, '47a76003c8f9f2d8c820f446e084ff39'),
	(238, NULL, 100, 'rest', 'OnRestApplicationConfigurationImport', 'rest', '', '\\Bitrix\\Rest\\Configuration\\AppConfiguration', 'onEventImportController', '', 2, '3fc1dd7e523b33f9d76c19e54d45c2fb'),
	(239, NULL, 100, 'rest', 'OnRestApplicationConfigurationExport', 'rest', '', '\\Bitrix\\Rest\\Configuration\\AppConfiguration', 'onEventExportController', '', 2, 'b90a349060c693506b740c4d36f75f5f'),
	(240, NULL, 100, 'rest', 'OnRestApplicationConfigurationClear', 'rest', '', '\\Bitrix\\Rest\\Configuration\\AppConfiguration', 'onEventClearController', '', 2, '75dccda637a740c033b2d014a84a8009'),
	(241, NULL, 100, 'rest', 'OnRestApplicationConfigurationEntity', 'rest', '', '\\Bitrix\\Rest\\Configuration\\AppConfiguration', 'getEntityList', '', 2, '8d83d219eaf2f415d55fb67e221b7c3d'),
	(242, NULL, 100, 'rest', 'OnRestApplicationConfigurationGetManifest', 'rest', '', '\\Bitrix\\Rest\\Configuration\\AppConfiguration', 'getManifestList', '', 2, '6ba35b1f4b01d1e358e1b3a79ac437d6'),
	(243, NULL, 100, 'rest', 'onRestCheckAuth', 'rest', '', '\\Bitrix\\Rest\\OAuth\\Auth', 'onRestCheckAuth', '', 2, '70e923729089b8cba69bb3b4311da11e'),
	(244, NULL, 100, 'rest', 'onRestCheckAuth', 'rest', '', '\\Bitrix\\Rest\\APAuth\\Auth', 'onRestCheckAuth', '', 2, '3550e6c95772564101770e0c9cb54470'),
	(245, NULL, 100, 'rest', 'onRestCheckAuth', 'rest', '', '\\Bitrix\\Rest\\SessionAuth\\Auth', 'onRestCheckAuth', '', 2, '8e33ae5a47b59d21df7d26f916d19e38'),
	(246, NULL, 100, 'main', 'OnEventLogGetAuditTypes', 'scale', '', '\\Bitrix\\Scale\\Logger', 'onEventLogGetAuditTypes', '', 1, 'd8192b7113f1652bdf8a37bcd4e38dea'),
	(247, NULL, 100, 'main', 'OnChangePermissions', 'search', '', 'CSearch', 'OnChangeFilePermissions', '', 1, '1c37aedc2ec89f94624291d097fe7adf'),
	(248, NULL, 100, 'main', 'OnChangeFile', 'search', '', 'CSearch', 'OnChangeFile', '', 1, 'd51170fc3433fde7eab8edc1c2b933a0'),
	(249, NULL, 100, 'main', 'OnGroupDelete', 'search', '', 'CSearch', 'OnGroupDelete', '', 1, '05382d7448b1ba259b89bf9e87e4eb44'),
	(250, NULL, 100, 'main', 'OnLangDelete', 'search', '', 'CSearch', 'OnLangDelete', '', 1, '15ebda82514af5a966b3466cd26992a4'),
	(251, NULL, 100, 'main', 'OnAfterUserUpdate', 'search', '', 'CSearchUser', 'OnAfterUserUpdate', '', 1, '9e0cea5039973193afc706ec8978d674'),
	(252, NULL, 100, 'main', 'OnUserDelete', 'search', '', 'CSearchUser', 'DeleteByUserID', '', 1, '524a910f381ba144bf50caa152222ed6'),
	(253, NULL, 100, 'cluster', 'OnGetTableList', 'search', '', 'search', 'OnGetTableList', '', 1, 'a40ffd36df151e2c0294b5639e81d665'),
	(254, NULL, 100, 'perfmon', 'OnGetTableSchema', 'search', '', 'search', 'OnGetTableSchema', '', 1, '9c8df2577e0cb80c68afa2030e193efb'),
	(255, NULL, 90, 'main', 'OnEpilog', 'search', '', 'CSearchStatistic', 'OnEpilog', '', 1, '6b3591ad78ac2a3ce6ad411f0aff47fe'),
	(256, NULL, 100, 'main', 'OnUserDelete', 'security', '', 'CSecurityUser', 'OnUserDelete', '', 1, '450a1c7509f5363a9bf7d1472f22f9cf'),
	(257, NULL, 100, 'main', 'OnEventLogGetAuditTypes', 'security', '', 'CSecurityFilter', 'GetAuditTypes', '', 1, '893bc94df887141b4f3579561ea37454'),
	(258, NULL, 100, 'main', 'OnEventLogGetAuditTypes', 'security', '', 'CSecurityAntiVirus', 'GetAuditTypes', '', 1, '9ba919b0537aa25fe47e438c2428b4d9'),
	(259, NULL, 100, 'main', 'OnAdminInformerInsertItems', 'security', '', 'CSecurityFilter', 'OnAdminInformerInsertItems', '', 1, 'c751923f396ccc4e102ed17e97cb8afb'),
	(260, NULL, 100, 'main', 'OnAdminInformerInsertItems', 'security', '', 'CSecuritySiteChecker', 'OnAdminInformerInsertItems', '', 1, '0c7cea553d58a72f7c5521d282898bc7'),
	(261, NULL, 5, 'main', 'OnBeforeProlog', 'security', '', 'CSecurityFilter', 'OnBeforeProlog', '', 1, 'bb70fedd18267b1c5290068ae80dbc4d'),
	(262, NULL, 9999, 'main', 'OnEndBufferContent', 'security', '', 'CSecurityXSSDetect', 'OnEndBufferContent', '', 1, 'd1886589ecd51b020420e6c1415edeaf'),
	(263, NULL, 1, 'main', 'OnBeforeLocalRedirect', 'security', '', 'CSecurityRedirect', 'BeforeLocalRedirect', '', 1, '2dbeb7fa7a8bec4d90e8940616976b3d'),
	(264, NULL, 1, 'main', 'OnEndBufferContent', 'security', '', 'CSecurityRedirect', 'EndBufferContent', '', 1, '099871646b4df8c1263e26f9bd91f3bd'),
	(265, NULL, 100, 'main', 'OnPanelCreate', 'seo', '', 'CSeoEventHandlers', 'SeoOnPanelCreate', '', 2, '79688b0b4a106b805d09e63ffe88f580'),
	(266, NULL, 100, 'fileman', 'OnIncludeHTMLEditorScript', 'seo', '', 'CSeoEventHandlers', 'OnIncludeHTMLEditorScript', '', 2, '7995eac5813e40f6b3e82b146631397e'),
	(267, NULL, 100, 'fileman', 'OnBeforeHTMLEditorScriptRuns', 'seo', '', 'CSeoEventHandlers', 'OnBeforeHTMLEditorScriptRuns', '', 2, '313b34609f1fa34d34cde1c2103c09ff'),
	(268, NULL, 100, 'iblock', 'OnAfterIBlockSectionAdd', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'addSection', '', 2, 'c61de21b0b0873525fa5c39427324664'),
	(269, NULL, 100, 'iblock', 'OnAfterIBlockElementAdd', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'addElement', '', 2, '1b167ab85d6d744bba456e559546f13e'),
	(270, NULL, 100, 'iblock', 'OnBeforeIBlockSectionDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'beforeDeleteSection', '', 2, '148ce014df9dd9f99f17ebfc5d766e8a'),
	(271, NULL, 100, 'iblock', 'OnBeforeIBlockElementDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'beforeDeleteElement', '', 2, '4b1e9896d9f0aa37a7039a321f25f9a5'),
	(272, NULL, 100, 'iblock', 'OnAfterIBlockSectionDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'deleteSection', '', 2, 'b699c1c0d6665f9cffe7ff76ab108a24'),
	(273, NULL, 100, 'iblock', 'OnAfterIBlockElementDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'deleteElement', '', 2, 'ff3a36654015c53890f4cf2204b030c4'),
	(274, NULL, 100, 'iblock', 'OnBeforeIBlockSectionUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'beforeUpdateSection', '', 2, 'aa5f8c360ed88eb5e2884c57b6f1f2f3'),
	(275, NULL, 100, 'iblock', 'OnBeforeIBlockElementUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'beforeUpdateElement', '', 2, 'a1022e0619263c0e91139fb3f9837085'),
	(276, NULL, 100, 'iblock', 'OnAfterIBlockSectionUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'updateSection', '', 2, '27930cffcd40b84666d0a22e1a953c41'),
	(277, NULL, 100, 'iblock', 'OnAfterIBlockElementUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'updateElement', '', 2, 'f0151e07363564774d45acba4100aebe'),
	(278, NULL, 100, 'forum', 'onAfterTopicAdd', 'seo', '', '\\Bitrix\\Seo\\SitemapForum', 'addTopic', '', 2, 'd4d54756116942c9ee0bda9b31e9d0e7'),
	(279, NULL, 100, 'forum', 'onAfterTopicUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapForum', 'updateTopic', '', 2, '3e0a8569016a4c941f3eb4aa9fca6e8b'),
	(280, NULL, 100, 'forum', 'onAfterTopicDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapForum', 'deleteTopic', '', 2, '7f4379c818231561b41589d3de41e36b'),
	(281, NULL, 100, 'main', 'OnAdminIBlockElementEdit', 'seo', '', '\\Bitrix\\Seo\\AdvTabEngine', 'eventHandler', '', 2, 'c894d167ef03c35375b8eb8f2551a798'),
	(282, NULL, 100, 'main', 'OnBeforeProlog', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'checkSession', '', 2, '5fdf8dd9fd70719e442efcb589175bf0'),
	(283, NULL, 100, 'sale', 'OnOrderSave', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onOrderSave', '', 2, '07d4ab0b1aa0aa130a0cbc06403f6eae'),
	(284, NULL, 100, 'sale', 'OnBasketOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onBasketOrder', '', 2, 'cf6298b090e92e955b32c358c1d14b25'),
	(285, NULL, 100, 'sale', 'onSalePayOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onSalePayOrder', '', 2, '745afed820778e33d5cd3e91cbd622f1'),
	(286, NULL, 100, 'sale', 'onSaleDeductOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onSaleDeductOrder', '', 2, '12861bd5c6c27ffa2abe5cac90ea58d8'),
	(287, NULL, 100, 'sale', 'onSaleDeliveryOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onSaleDeliveryOrder', '', 2, 'ead8fb64fece572d1fabd3d6fd27af27'),
	(288, NULL, 100, 'sale', 'onSaleStatusOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onSaleStatusOrder', '', 2, 'b7b9ac4bbf458d433e1cf3835ff4cb6c'),
	(289, NULL, 100, 'conversion', 'OnSetDayContextAttributes', 'seo', '', '\\Bitrix\\Seo\\ConversionHandler', 'onSetDayContextAttributes', '', 2, 'c19eb7659342fabc34b953f69e8b9eee'),
	(290, NULL, 100, 'conversion', 'OnGetAttributeTypes', 'seo', '', '\\Bitrix\\Seo\\ConversionHandler', 'onGetAttributeTypes', '', 2, '379294eefad289e474bf0c5ce2a281d8'),
	(291, NULL, 100, 'catalog', 'OnProductUpdate', 'seo', '', '\\Bitrix\\Seo\\Adv\\Auto', 'checkQuantity', '', 2, '0f4deda4d57adb4389d85a19e5bbcf2b'),
	(292, NULL, 100, 'catalog', 'OnProductSetAvailableUpdate', 'seo', '', '\\Bitrix\\Seo\\Adv\\Auto', 'checkQuantity', '', 2, '3d040ae51f0f6a4b2a08be0e6e1494d4'),
	(293, NULL, 100, 'bitrix24', 'onDomainChange', 'seo', '', '\\Bitrix\\Seo\\Service', 'changeRegisteredDomain', '', 2, 'fcb2dadb8b7ff1863c0ad86320e9e521'),
	(294, NULL, 100, 'main', 'OnUserDelete', 'socialservices', '', 'CSocServAuthDB', 'OnUserDelete', '', 1, '1f5b8fc024dfdf83952d6c723466cdf5'),
	(295, NULL, 100, 'timeman', 'OnAfterTMReportDailyAdd', 'socialservices', '', 'CSocServAuthDB', 'OnAfterTMReportDailyAdd', '', 1, 'a16159f6a90f1b67cb9ec15b0c1bab3a'),
	(296, NULL, 100, 'timeman', 'OnAfterTMDayStart', 'socialservices', '', 'CSocServAuthDB', 'OnAfterTMDayStart', '', 1, '9567feb38890d6581a3204dc5e65e8b6'),
	(297, NULL, 100, 'timeman', 'OnTimeManShow', 'socialservices', '', 'CSocServEventHandlers', 'OnTimeManShow', '', 1, 'b728f3cea11d374f7638c29f84e8e15e'),
	(298, NULL, 100, 'main', 'OnFindExternalUser', 'socialservices', '', 'CSocServAuthDB', 'OnFindExternalUser', '', 1, '1ab251d15efc87c5b5cfe6396f5dec1b'),
	(299, NULL, 100, 'perfmon', 'OnGetTableSchema', 'socialservices', '', 'socialservices', 'OnGetTableSchema', '', 1, '56107bf1a0dcee0db660c0ec27c31c6c'),
	(300, NULL, 100, 'socialservices', 'OnFindSocialservicesUser', 'socialservices', '', 'CSocServAuthManager', 'checkOldUser', '', 1, 'c3d7460e4ef694f5bc53b6a6ad902407'),
	(301, NULL, 100, 'socialservices', 'OnFindSocialservicesUser', 'socialservices', '', 'CSocServAuthManager', 'checkAbandonedUser', '', 1, '331f99f0b265544c33777c299eab16f6'),
	(302, NULL, 100, 'main', 'OnBeforeLangDelete', 'subscribe', '', 'CRubric', 'OnBeforeLangDelete', '', 1, 'ee539731a3e52fe65cb52596ce0856d2'),
	(303, NULL, 100, 'main', 'OnUserDelete', 'subscribe', '', 'CSubscription', 'OnUserDelete', '', 1, '88c6e57a6f0f18341332db1879c0005b'),
	(304, NULL, 100, 'main', 'OnUserLogout', 'subscribe', '', 'CSubscription', 'OnUserLogout', '', 1, 'f4fa3b156b00fb4415c8612f8439f278'),
	(305, NULL, 100, 'main', 'OnGroupDelete', 'subscribe', '', 'CPosting', 'OnGroupDelete', '', 1, '990d63845f75e93e670ed85f1aa15152'),
	(306, NULL, 100, 'sender', 'OnConnectorList', 'subscribe', '', 'Bitrix\\Subscribe\\SenderEventHandler', 'onConnectorListSubscriber', '', 1, '8a1cffe1bd46a72108e48656a1bae99b'),
	(307, NULL, 100, 'perfmon', 'OnGetTableSchema', 'subscribe', '', 'subscribe', 'OnGetTableSchema', '', 1, '320b1fb657ce46ad23992d00b2f54916'),
	(308, NULL, 100, 'main', 'OnPanelCreate', 'translate', '', '\\Bitrix\\Translate\\Ui\\Panel', 'onPanelCreate', '', 1, '88ecb95eac2e28b80f234bfc8c1cd597'),
	(309, NULL, 100, 'perfmon', 'OnGetTableSchema', 'translate', '', 'translate', 'onGetTableSchema', '', 1, '00347f45b2f48480b1a521c32036beb5'),
	(312, NULL, 10, 'main', 'OnBeforeProlog', 'main', '/modules/vote/keepvoting.php', '', '', '', 1, '251d4d100c1545ca5847d8d6d626dea9'),
	(313, NULL, 200, 'main', 'OnUserTypeBuildList', 'vote', '', 'Bitrix\\Vote\\Uf\\VoteUserType', 'getUserTypeDescription', '', 1, 'e30dd2d26df22ce2dcffef84256cf160'),
	(314, NULL, 200, 'main', 'OnUserLogin', 'vote', '', 'Bitrix\\Vote\\User', 'onUserLogin', '', 1, '5047b245af7aede3f2474b40dfbc65be'),
	(315, NULL, 100, 'im', 'OnGetNotifySchema', 'vote', '', 'CVoteNotifySchema', 'OnGetNotifySchema', '', 1, '97ffe9642e64dc7d68f9ec9bc789be47'),
	(316, NULL, 100, 'main', 'OnBeforeProlog', 'main', '/modules/main/install/wizard_sol/panel_button.php', 'CWizardSolPanel', 'ShowPanel', '', 1, 'bbd7b8c1e518a0b3eae815eb91a95c11');
/*!40000 ALTER TABLE `b_module_to_module` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_numerator
DROP TABLE IF EXISTS `b_numerator`;
CREATE TABLE IF NOT EXISTS `b_numerator` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TYPE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED_AT` datetime DEFAULT NULL,
  `CREATED_BY` int(11) DEFAULT NULL,
  `UPDATED_AT` datetime DEFAULT NULL,
  `UPDATED_BY` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_numerator: ~0 rows (приблизительно)
DELETE FROM `b_numerator`;
/*!40000 ALTER TABLE `b_numerator` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_numerator` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_numerator_sequence
DROP TABLE IF EXISTS `b_numerator_sequence`;
CREATE TABLE IF NOT EXISTS `b_numerator_sequence` (
  `NUMERATOR_ID` int(11) NOT NULL DEFAULT 0,
  `KEY` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `TEXT_KEY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NEXT_NUMBER` int(11) DEFAULT NULL,
  `LAST_INVOCATION_TIME` int(11) DEFAULT NULL,
  PRIMARY KEY (`NUMERATOR_ID`,`KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_numerator_sequence: ~0 rows (приблизительно)
DELETE FROM `b_numerator_sequence`;
/*!40000 ALTER TABLE `b_numerator_sequence` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_numerator_sequence` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_operation
DROP TABLE IF EXISTS `b_operation`;
CREATE TABLE IF NOT EXISTS `b_operation` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BINDING` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'module',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_operation: ~120 rows (приблизительно)
DELETE FROM `b_operation`;
/*!40000 ALTER TABLE `b_operation` DISABLE KEYS */;
INSERT INTO `b_operation` (`ID`, `NAME`, `MODULE_ID`, `DESCRIPTION`, `BINDING`) VALUES
	(1, 'edit_php', 'main', NULL, 'module'),
	(2, 'view_own_profile', 'main', NULL, 'module'),
	(3, 'edit_own_profile', 'main', NULL, 'module'),
	(4, 'view_all_users', 'main', NULL, 'module'),
	(5, 'view_groups', 'main', NULL, 'module'),
	(6, 'view_tasks', 'main', NULL, 'module'),
	(7, 'view_other_settings', 'main', NULL, 'module'),
	(8, 'view_subordinate_users', 'main', NULL, 'module'),
	(9, 'edit_subordinate_users', 'main', NULL, 'module'),
	(10, 'edit_all_users', 'main', NULL, 'module'),
	(11, 'edit_groups', 'main', NULL, 'module'),
	(12, 'edit_tasks', 'main', NULL, 'module'),
	(13, 'edit_other_settings', 'main', NULL, 'module'),
	(14, 'cache_control', 'main', NULL, 'module'),
	(15, 'lpa_template_edit', 'main', NULL, 'module'),
	(16, 'view_event_log', 'main', NULL, 'module'),
	(17, 'edit_ratings', 'main', NULL, 'module'),
	(18, 'manage_short_uri', 'main', NULL, 'module'),
	(19, 'fm_view_permission', 'main', NULL, 'file'),
	(20, 'fm_view_file', 'main', NULL, 'file'),
	(21, 'fm_view_listing', 'main', NULL, 'file'),
	(22, 'fm_edit_existent_folder', 'main', NULL, 'file'),
	(23, 'fm_create_new_file', 'main', NULL, 'file'),
	(24, 'fm_edit_existent_file', 'main', NULL, 'file'),
	(25, 'fm_create_new_folder', 'main', NULL, 'file'),
	(26, 'fm_delete_file', 'main', NULL, 'file'),
	(27, 'fm_delete_folder', 'main', NULL, 'file'),
	(28, 'fm_edit_in_workflow', 'main', NULL, 'file'),
	(29, 'fm_rename_file', 'main', NULL, 'file'),
	(30, 'fm_rename_folder', 'main', NULL, 'file'),
	(31, 'fm_upload_file', 'main', NULL, 'file'),
	(32, 'fm_add_to_menu', 'main', NULL, 'file'),
	(33, 'fm_download_file', 'main', NULL, 'file'),
	(34, 'fm_lpa', 'main', NULL, 'file'),
	(35, 'fm_edit_permission', 'main', NULL, 'file'),
	(36, 'bitrixcloud_monitoring', 'bitrixcloud', NULL, 'module'),
	(37, 'bitrixcloud_backup', 'bitrixcloud', NULL, 'module'),
	(38, 'bitrixcloud_cdn', 'bitrixcloud', NULL, 'module'),
	(39, 'clouds_browse', 'clouds', NULL, 'module'),
	(40, 'clouds_upload', 'clouds', NULL, 'module'),
	(41, 'clouds_config', 'clouds', NULL, 'module'),
	(42, 'fileman_view_all_settings', 'fileman', '', 'module'),
	(43, 'fileman_edit_menu_types', 'fileman', '', 'module'),
	(44, 'fileman_add_element_to_menu', 'fileman', '', 'module'),
	(45, 'fileman_edit_menu_elements', 'fileman', '', 'module'),
	(46, 'fileman_edit_existent_files', 'fileman', '', 'module'),
	(47, 'fileman_edit_existent_folders', 'fileman', '', 'module'),
	(48, 'fileman_admin_files', 'fileman', '', 'module'),
	(49, 'fileman_admin_folders', 'fileman', '', 'module'),
	(50, 'fileman_view_permissions', 'fileman', '', 'module'),
	(51, 'fileman_edit_all_settings', 'fileman', '', 'module'),
	(52, 'fileman_upload_files', 'fileman', '', 'module'),
	(53, 'fileman_view_file_structure', 'fileman', '', 'module'),
	(54, 'fileman_install_control', 'fileman', '', 'module'),
	(55, 'medialib_view_collection', 'fileman', '', 'medialib'),
	(56, 'medialib_new_collection', 'fileman', '', 'medialib'),
	(57, 'medialib_edit_collection', 'fileman', '', 'medialib'),
	(58, 'medialib_del_collection', 'fileman', '', 'medialib'),
	(59, 'medialib_access', 'fileman', '', 'medialib'),
	(60, 'medialib_new_item', 'fileman', '', 'medialib'),
	(61, 'medialib_edit_item', 'fileman', '', 'medialib'),
	(62, 'medialib_del_item', 'fileman', '', 'medialib'),
	(63, 'sticker_view', 'fileman', '', 'stickers'),
	(64, 'sticker_edit', 'fileman', '', 'stickers'),
	(65, 'sticker_new', 'fileman', '', 'stickers'),
	(66, 'sticker_del', 'fileman', '', 'stickers'),
	(67, 'hl_element_read', 'highloadblock', NULL, 'module'),
	(68, 'hl_element_write', 'highloadblock', NULL, 'module'),
	(69, 'hl_element_delete', 'highloadblock', NULL, 'module'),
	(70, 'section_read', 'iblock', NULL, 'iblock'),
	(71, 'element_read', 'iblock', NULL, 'iblock'),
	(72, 'section_element_bind', 'iblock', NULL, 'iblock'),
	(73, 'iblock_admin_display', 'iblock', NULL, 'iblock'),
	(74, 'element_edit', 'iblock', NULL, 'iblock'),
	(75, 'element_edit_price', 'iblock', NULL, 'iblock'),
	(76, 'element_delete', 'iblock', NULL, 'iblock'),
	(77, 'element_bizproc_start', 'iblock', NULL, 'iblock'),
	(78, 'section_edit', 'iblock', NULL, 'iblock'),
	(79, 'section_delete', 'iblock', NULL, 'iblock'),
	(80, 'section_section_bind', 'iblock', NULL, 'iblock'),
	(81, 'element_edit_any_wf_status', 'iblock', NULL, 'iblock'),
	(82, 'iblock_edit', 'iblock', NULL, 'iblock'),
	(83, 'iblock_delete', 'iblock', NULL, 'iblock'),
	(84, 'iblock_rights_edit', 'iblock', NULL, 'iblock'),
	(85, 'iblock_export', 'iblock', NULL, 'iblock'),
	(86, 'section_rights_edit', 'iblock', NULL, 'iblock'),
	(87, 'element_rights_edit', 'iblock', NULL, 'iblock'),
	(88, 'landing_read', 'landing', NULL, 'module'),
	(89, 'landing_edit', 'landing', NULL, 'module'),
	(90, 'landing_sett', 'landing', NULL, 'module'),
	(91, 'landing_public', 'landing', NULL, 'module'),
	(92, 'landing_delete', 'landing', NULL, 'module'),
	(93, 'security_filter_bypass', 'security', NULL, 'module'),
	(94, 'security_edit_user_otp', 'security', NULL, 'module'),
	(95, 'security_module_settings_read', 'security', NULL, 'module'),
	(96, 'security_panel_view', 'security', NULL, 'module'),
	(97, 'security_filter_settings_read', 'security', NULL, 'module'),
	(98, 'security_otp_settings_read', 'security', NULL, 'module'),
	(99, 'security_iprule_admin_settings_read', 'security', NULL, 'module'),
	(100, 'security_session_settings_read', 'security', NULL, 'module'),
	(101, 'security_redirect_settings_read', 'security', NULL, 'module'),
	(102, 'security_stat_activity_settings_read', 'security', NULL, 'module'),
	(103, 'security_iprule_settings_read', 'security', NULL, 'module'),
	(104, 'security_antivirus_settings_read', 'security', NULL, 'module'),
	(105, 'security_frame_settings_read', 'security', NULL, 'module'),
	(106, 'security_module_settings_write', 'security', NULL, 'module'),
	(107, 'security_filter_settings_write', 'security', NULL, 'module'),
	(108, 'security_otp_settings_write', 'security', NULL, 'module'),
	(109, 'security_iprule_admin_settings_write', 'security', NULL, 'module'),
	(110, 'security_session_settings_write', 'security', NULL, 'module'),
	(111, 'security_redirect_settings_write', 'security', NULL, 'module'),
	(112, 'security_stat_activity_settings_write', 'security', NULL, 'module'),
	(113, 'security_iprule_settings_write', 'security', NULL, 'module'),
	(114, 'security_file_verifier_sign', 'security', NULL, 'module'),
	(115, 'security_file_verifier_collect', 'security', NULL, 'module'),
	(116, 'security_file_verifier_verify', 'security', NULL, 'module'),
	(117, 'security_antivirus_settings_write', 'security', NULL, 'module'),
	(118, 'security_frame_settings_write', 'security', NULL, 'module'),
	(119, 'seo_settings', 'seo', '', 'module'),
	(120, 'seo_tools', 'seo', '', 'module');
/*!40000 ALTER TABLE `b_operation` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_option
DROP TABLE IF EXISTS `b_option`;
CREATE TABLE IF NOT EXISTS `b_option` (
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MODULE_ID`,`NAME`),
  KEY `ix_option_name` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_option: ~101 rows (приблизительно)
DELETE FROM `b_option`;
/*!40000 ALTER TABLE `b_option` DISABLE KEYS */;
INSERT INTO `b_option` (`MODULE_ID`, `NAME`, `VALUE`, `DESCRIPTION`, `SITE_ID`) VALUES
	('blog', 'socNetNewPerms', 'Y', NULL, NULL),
	('fileman', '~allowed_components', '', NULL, NULL),
	('fileman', '~script_files', 'php,php3,php4,php5,php6,phtml,pl,asp,aspx,cgi,exe,ico,shtm,shtml', NULL, NULL),
	('fileman', 'ar_entities', 'none', NULL, NULL),
	('fileman', 'archive_step_time', '30', NULL, NULL),
	('fileman', 'default_edit', 'text', NULL, NULL),
	('fileman', 'default_edit_groups', '', NULL, NULL),
	('fileman', 'different_set', 'N', NULL, NULL),
	('fileman', 'editor_body_class', '', NULL, NULL),
	('fileman', 'editor_body_id', '', NULL, NULL),
	('fileman', 'google_map_api_key', '', NULL, NULL),
	('fileman', 'GROUP_DEFAULT_RIGHT', 'D', NULL, NULL),
	('fileman', 'GROUP_DEFAULT_TASK', '18', NULL, NULL),
	('fileman', 'hide_physical_struc', '', NULL, NULL),
	('fileman', 'log_menu', 'Y', NULL, NULL),
	('fileman', 'log_page', 'Y', NULL, NULL),
	('fileman', 'menutypes', 'a:1:{s:4:\\"main\\";s:23:\\"Главное меню\\";}', NULL, NULL),
	('fileman', 'ml_max_height', '1024', NULL, NULL),
	('fileman', 'ml_max_width', '1024', NULL, NULL),
	('fileman', 'ml_media_available_ext', 'jpg,jpeg,gif,png,flv,mp4,wmv,wma,mp3,ppt,aac', NULL, NULL),
	('fileman', 'ml_media_extentions', 'jpg,jpeg,gif,png,flv,mp4,wmv,wma,mp3,ppt', NULL, NULL),
	('fileman', 'ml_thumb_height', '105', NULL, NULL),
	('fileman', 'ml_thumb_width', '140', NULL, NULL),
	('fileman', 'ml_use_default', '1', NULL, NULL),
	('fileman', 'num_menu_param', '1', NULL, NULL),
	('fileman', 'propstypes', 'a:2:{s:11:\\"description\\";s:16:\\"Описание\\";s:8:\\"keywords\\";s:27:\\"Ключевые слова\\";}', NULL, NULL),
	('fileman', 'replace_new_lines', 'Y', NULL, NULL),
	('fileman', 'search_mask', '*.php', NULL, NULL),
	('fileman', 'search_max_open_file_size', '1024', NULL, NULL),
	('fileman', 'search_max_res_count', '', NULL, NULL),
	('fileman', 'search_time_step', '5', NULL, NULL),
	('fileman', 'show_inc_icons', 'N', NULL, NULL),
	('fileman', 'stickers_use_hotkeys', 'N', NULL, NULL),
	('fileman', 'use_code_editor', 'Y', NULL, NULL),
	('fileman', 'use_custom_spell', 'N', NULL, NULL),
	('fileman', 'use_editor_3', 'Y', NULL, NULL),
	('fileman', 'use_medialib', 'Y', NULL, NULL),
	('fileman', 'use_pspell', 'N', NULL, NULL),
	('fileman', 'use_separeted_dics', 'N', NULL, NULL),
	('fileman', 'use_translit', '1', NULL, NULL),
	('fileman', 'use_translit_google', '1', NULL, NULL),
	('fileman', 'user_dics_path', '/bitrix/modules/fileman/u_dics', NULL, NULL),
	('fileman', 'yandex_map_api_key', '', NULL, NULL),
	('forum', 'FILTER', 'N', NULL, NULL),
	('landing', 'pub_path_s1', '/lp/', NULL, NULL),
	('main', '~crypto_b_socialservices_user', 'a:2:{s:7:"OATOKEN";b:1;s:13:"REFRESH_TOKEN";b:1;}', NULL, NULL),
	('main', '~crypto_b_user_auth_code', 'a:1:{s:10:"OTP_SECRET";b:1;}', NULL, NULL),
	('main', '~crypto_b_user_phone_auth', 'a:1:{s:10:"OTP_SECRET";b:1;}', NULL, NULL),
	('main', '~new_license11_sign', 'Y', NULL, NULL),
	('main', 'admin_lid', 'ru', NULL, NULL),
	('main', 'admin_passwordh', 'FVoQemYUBgUtCUVcBhcGCgsTAQ==', NULL, NULL),
	('main', 'control_file_duplicates', 'Y', NULL, NULL),
	('main', 'distributive6', 'Y', NULL, NULL),
	('main', 'email_from', 'fed8055@yandex.ru', NULL, NULL),
	('main', 'GROUP_DEFAULT_TASK', '1', NULL, NULL),
	('main', 'optimize_css_files', 'Y', NULL, NULL),
	('main', 'optimize_js_files', 'Y', NULL, NULL),
	('main', 'PARAM_MAX_SITES', '2', NULL, NULL),
	('main', 'PARAM_MAX_USERS', '0', NULL, NULL),
	('main', 'rating_assign_authority_group', '4', NULL, NULL),
	('main', 'rating_assign_authority_group_add', '2', NULL, NULL),
	('main', 'rating_assign_authority_group_delete', '2', NULL, NULL),
	('main', 'rating_assign_rating_group', '3', NULL, NULL),
	('main', 'rating_assign_rating_group_add', '1', NULL, NULL),
	('main', 'rating_assign_rating_group_delete', '1', NULL, NULL),
	('main', 'rating_assign_type', 'auto', NULL, NULL),
	('main', 'rating_authority_rating', '2', NULL, NULL),
	('main', 'rating_authority_weight_formula', 'Y', NULL, NULL),
	('main', 'rating_community_authority', '30', NULL, NULL),
	('main', 'rating_community_last_visit', '90', NULL, NULL),
	('main', 'rating_community_size', '1', NULL, NULL),
	('main', 'rating_count_vote', '10', NULL, NULL),
	('main', 'rating_normalization', '10', NULL, NULL),
	('main', 'rating_normalization_type', 'auto', NULL, NULL),
	('main', 'rating_self_vote', 'Y', NULL, NULL),
	('main', 'rating_start_authority', '3', NULL, NULL),
	('main', 'rating_text_like_d', 'Это нравится', NULL, NULL),
	('main', 'rating_text_like_n', 'Не нравится', NULL, NULL),
	('main', 'rating_text_like_y', 'Нравится', NULL, NULL),
	('main', 'rating_vote_show', 'Y', NULL, NULL),
	('main', 'rating_vote_template', 'like', NULL, NULL),
	('main', 'rating_vote_type', 'like', NULL, NULL),
	('main', 'rating_vote_weight', '10', NULL, NULL),
	('main', 'secure_logout', 'Y', NULL, NULL),
	('main', 'server_uniq_id', '68774716b705c3c567dbde57961117d2', NULL, NULL),
	('main', 'signer_default_key', '36bf6b92a34573755ae578beff8f305c864aabe53d481ca16cb27cefdad01d8f899ab8cb291349fc855fb4dee9b27f7b953ed6dccf13b2dc928e6ab3e4126079', NULL, NULL),
	('main', 'site_checker_success', NULL, NULL, NULL),
	('main', 'update_site', 'www.bitrixsoft.com', NULL, NULL),
	('main', 'update_site_ns', 'Y', NULL, NULL),
	('main', 'vendor', '1c_bitrix', NULL, NULL),
	('messageservice', 'clean_up_period', '14', NULL, NULL),
	('rest', 'entity_iblock_type', 'rest_entity', NULL, NULL),
	('rest', 'server_path', '/rest', NULL, NULL),
	('search', 'dbnode_id', 'N', NULL, NULL),
	('search', 'dbnode_status', 'ok', NULL, NULL),
	('search', 'version', 'v2.0', NULL, NULL),
	('security', 'ipcheck_disable_file', '/bitrix/modules/ipcheck_disable_6a2a88ab542c8e6da12c5663f518dfc3', NULL, NULL),
	('security', 'redirect_sid', '37gk8nigkvc1wlc9p0bh9m03mk6sokzq', NULL, NULL),
	('socialservices', 'allow_encrypted_tokens', '1', NULL, NULL),
	('vote', 'VOTE_COMPATIBLE_OLD_TEMPLATE', 'N', NULL, NULL),
	('vote', 'VOTE_DIR', '', NULL, NULL);
/*!40000 ALTER TABLE `b_option` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_option_site
DROP TABLE IF EXISTS `b_option_site`;
CREATE TABLE IF NOT EXISTS `b_option_site` (
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MODULE_ID`,`NAME`,`SITE_ID`),
  KEY `ix_option_site_module_site` (`MODULE_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_option_site: ~4 rows (приблизительно)
DELETE FROM `b_option_site`;
/*!40000 ALTER TABLE `b_option_site` DISABLE KEYS */;
INSERT INTO `b_option_site` (`MODULE_ID`, `NAME`, `SITE_ID`, `VALUE`) VALUES
	('forum', 'FILTER_DICT_T', 'en', '4'),
	('forum', 'FILTER_DICT_T', 'ru', '2'),
	('forum', 'FILTER_DICT_W', 'en', '3'),
	('forum', 'FILTER_DICT_W', 'ru', '1');
/*!40000 ALTER TABLE `b_option_site` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_perf_cache
DROP TABLE IF EXISTS `b_perf_cache`;
CREATE TABLE IF NOT EXISTS `b_perf_cache` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `HIT_ID` int(18) DEFAULT NULL,
  `COMPONENT_ID` int(18) DEFAULT NULL,
  `NN` int(18) DEFAULT NULL,
  `CACHE_SIZE` float DEFAULT NULL,
  `OP_MODE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODULE_NAME` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMPONENT_NAME` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `BASE_DIR` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `INIT_DIR` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_NAME` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_PATH` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_PERF_CACHE_0` (`HIT_ID`,`NN`),
  KEY `IX_B_PERF_CACHE_1` (`COMPONENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_perf_cache: ~0 rows (приблизительно)
DELETE FROM `b_perf_cache`;
/*!40000 ALTER TABLE `b_perf_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_cache` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_perf_cluster
DROP TABLE IF EXISTS `b_perf_cluster`;
CREATE TABLE IF NOT EXISTS `b_perf_cluster` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `THREADS` int(11) DEFAULT NULL,
  `HITS` int(11) DEFAULT NULL,
  `ERRORS` int(11) DEFAULT NULL,
  `PAGES_PER_SECOND` float DEFAULT NULL,
  `PAGE_EXEC_TIME` float DEFAULT NULL,
  `PAGE_RESP_TIME` float DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_perf_cluster: ~0 rows (приблизительно)
DELETE FROM `b_perf_cluster`;
/*!40000 ALTER TABLE `b_perf_cluster` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_cluster` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_perf_component
DROP TABLE IF EXISTS `b_perf_component`;
CREATE TABLE IF NOT EXISTS `b_perf_component` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `HIT_ID` int(18) DEFAULT NULL,
  `NN` int(18) DEFAULT NULL,
  `CACHE_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CACHE_SIZE` int(11) DEFAULT NULL,
  `CACHE_COUNT_R` int(11) DEFAULT NULL,
  `CACHE_COUNT_W` int(11) DEFAULT NULL,
  `CACHE_COUNT_C` int(11) DEFAULT NULL,
  `COMPONENT_TIME` float DEFAULT NULL,
  `QUERIES` int(11) DEFAULT NULL,
  `QUERIES_TIME` float DEFAULT NULL,
  `COMPONENT_NAME` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_PERF_COMPONENT_0` (`HIT_ID`,`NN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_perf_component: ~0 rows (приблизительно)
DELETE FROM `b_perf_component`;
/*!40000 ALTER TABLE `b_perf_component` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_component` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_perf_error
DROP TABLE IF EXISTS `b_perf_error`;
CREATE TABLE IF NOT EXISTS `b_perf_error` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `HIT_ID` int(18) DEFAULT NULL,
  `ERRNO` int(18) DEFAULT NULL,
  `ERRSTR` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `ERRFILE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `ERRLINE` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_PERF_ERROR_0` (`HIT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_perf_error: ~0 rows (приблизительно)
DELETE FROM `b_perf_error`;
/*!40000 ALTER TABLE `b_perf_error` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_error` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_perf_history
DROP TABLE IF EXISTS `b_perf_history`;
CREATE TABLE IF NOT EXISTS `b_perf_history` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `TOTAL_MARK` float DEFAULT NULL,
  `ACCELERATOR_ENABLED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_perf_history: ~0 rows (приблизительно)
DELETE FROM `b_perf_history`;
/*!40000 ALTER TABLE `b_perf_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_history` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_perf_hit
DROP TABLE IF EXISTS `b_perf_hit`;
CREATE TABLE IF NOT EXISTS `b_perf_hit` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_HIT` datetime DEFAULT NULL,
  `IS_ADMIN` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUEST_METHOD` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SERVER_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SERVER_PORT` int(11) DEFAULT NULL,
  `SCRIPT_NAME` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUEST_URI` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `INCLUDED_FILES` int(11) DEFAULT NULL,
  `MEMORY_PEAK_USAGE` int(11) DEFAULT NULL,
  `CACHE_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CACHE_SIZE` int(11) DEFAULT NULL,
  `CACHE_COUNT_R` int(11) DEFAULT NULL,
  `CACHE_COUNT_W` int(11) DEFAULT NULL,
  `CACHE_COUNT_C` int(11) DEFAULT NULL,
  `QUERIES` int(11) DEFAULT NULL,
  `QUERIES_TIME` float DEFAULT NULL,
  `COMPONENTS` int(11) DEFAULT NULL,
  `COMPONENTS_TIME` float DEFAULT NULL,
  `SQL_LOG` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PAGE_TIME` float DEFAULT NULL,
  `PROLOG_TIME` float DEFAULT NULL,
  `PROLOG_BEFORE_TIME` float DEFAULT NULL,
  `AGENTS_TIME` float DEFAULT NULL,
  `PROLOG_AFTER_TIME` float DEFAULT NULL,
  `WORK_AREA_TIME` float DEFAULT NULL,
  `EPILOG_TIME` float DEFAULT NULL,
  `EPILOG_BEFORE_TIME` float DEFAULT NULL,
  `EVENTS_TIME` float DEFAULT NULL,
  `EPILOG_AFTER_TIME` float DEFAULT NULL,
  `MENU_RECALC` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_PERF_HIT_0` (`DATE_HIT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_perf_hit: ~0 rows (приблизительно)
DELETE FROM `b_perf_hit`;
/*!40000 ALTER TABLE `b_perf_hit` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_hit` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_perf_index_ban
DROP TABLE IF EXISTS `b_perf_index_ban`;
CREATE TABLE IF NOT EXISTS `b_perf_index_ban` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BAN_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLUMN_NAMES` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_perf_index_ban: ~0 rows (приблизительно)
DELETE FROM `b_perf_index_ban`;
/*!40000 ALTER TABLE `b_perf_index_ban` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_index_ban` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_perf_index_complete
DROP TABLE IF EXISTS `b_perf_index_complete`;
CREATE TABLE IF NOT EXISTS `b_perf_index_complete` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BANNED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLUMN_NAMES` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INDEX_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_perf_index_complete_0` (`TABLE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_perf_index_complete: ~0 rows (приблизительно)
DELETE FROM `b_perf_index_complete`;
/*!40000 ALTER TABLE `b_perf_index_complete` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_index_complete` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_perf_index_suggest
DROP TABLE IF EXISTS `b_perf_index_suggest`;
CREATE TABLE IF NOT EXISTS `b_perf_index_suggest` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SQL_MD5` char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SQL_COUNT` int(11) DEFAULT NULL,
  `SQL_TIME` float DEFAULT NULL,
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TABLE_ALIAS` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLUMN_NAMES` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SQL_TEXT` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `SQL_EXPLAIN` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_perf_index_suggest_0` (`SQL_MD5`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_perf_index_suggest: ~0 rows (приблизительно)
DELETE FROM `b_perf_index_suggest`;
/*!40000 ALTER TABLE `b_perf_index_suggest` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_index_suggest` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_perf_index_suggest_sql
DROP TABLE IF EXISTS `b_perf_index_suggest_sql`;
CREATE TABLE IF NOT EXISTS `b_perf_index_suggest_sql` (
  `SUGGEST_ID` int(11) NOT NULL,
  `SQL_ID` int(11) NOT NULL,
  PRIMARY KEY (`SUGGEST_ID`,`SQL_ID`),
  KEY `ix_b_perf_index_suggest_sql_0` (`SQL_ID`,`SUGGEST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_perf_index_suggest_sql: ~0 rows (приблизительно)
DELETE FROM `b_perf_index_suggest_sql`;
/*!40000 ALTER TABLE `b_perf_index_suggest_sql` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_index_suggest_sql` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_perf_sql
DROP TABLE IF EXISTS `b_perf_sql`;
CREATE TABLE IF NOT EXISTS `b_perf_sql` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `HIT_ID` int(18) DEFAULT NULL,
  `COMPONENT_ID` int(18) DEFAULT NULL,
  `NN` int(18) DEFAULT NULL,
  `QUERY_TIME` float DEFAULT NULL,
  `NODE_ID` int(18) DEFAULT NULL,
  `MODULE_NAME` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMPONENT_NAME` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `SQL_TEXT` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_PERF_SQL_0` (`HIT_ID`,`NN`),
  KEY `IX_B_PERF_SQL_1` (`COMPONENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_perf_sql: ~0 rows (приблизительно)
DELETE FROM `b_perf_sql`;
/*!40000 ALTER TABLE `b_perf_sql` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_sql` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_perf_sql_backtrace
DROP TABLE IF EXISTS `b_perf_sql_backtrace`;
CREATE TABLE IF NOT EXISTS `b_perf_sql_backtrace` (
  `SQL_ID` int(18) NOT NULL,
  `NN` int(18) NOT NULL,
  `FILE_NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINE_NO` int(18) DEFAULT NULL,
  `CLASS_NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FUNCTION_NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SQL_ID`,`NN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_perf_sql_backtrace: ~0 rows (приблизительно)
DELETE FROM `b_perf_sql_backtrace`;
/*!40000 ALTER TABLE `b_perf_sql_backtrace` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_sql_backtrace` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_perf_tab_column_stat
DROP TABLE IF EXISTS `b_perf_tab_column_stat`;
CREATE TABLE IF NOT EXISTS `b_perf_tab_column_stat` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLUMN_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TABLE_ROWS` float DEFAULT NULL,
  `COLUMN_ROWS` float DEFAULT NULL,
  `VALUE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_perf_tab_column_stat` (`TABLE_NAME`,`COLUMN_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_perf_tab_column_stat: ~0 rows (приблизительно)
DELETE FROM `b_perf_tab_column_stat`;
/*!40000 ALTER TABLE `b_perf_tab_column_stat` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_tab_column_stat` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_perf_tab_stat
DROP TABLE IF EXISTS `b_perf_tab_stat`;
CREATE TABLE IF NOT EXISTS `b_perf_tab_stat` (
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `TABLE_SIZE` float DEFAULT NULL,
  `TABLE_ROWS` float DEFAULT NULL,
  PRIMARY KEY (`TABLE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_perf_tab_stat: ~0 rows (приблизительно)
DELETE FROM `b_perf_tab_stat`;
/*!40000 ALTER TABLE `b_perf_tab_stat` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_tab_stat` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_perf_test
DROP TABLE IF EXISTS `b_perf_test`;
CREATE TABLE IF NOT EXISTS `b_perf_test` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `REFERENCE_ID` int(18) DEFAULT NULL,
  `NAME` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_PERF_TEST_0` (`REFERENCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_perf_test: ~0 rows (приблизительно)
DELETE FROM `b_perf_test`;
/*!40000 ALTER TABLE `b_perf_test` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_test` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_posting
DROP TABLE IF EXISTS `b_posting`;
CREATE TABLE IF NOT EXISTS `b_posting` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `STATUS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'D',
  `VERSION` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_SENT` datetime DEFAULT NULL,
  `SENT_BCC` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `FROM_FIELD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TO_FIELD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BCC_FIELD` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL_FILTER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SUBJECT` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `BODY_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `BODY` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `DIRECT_SEND` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CHARSET` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MSG_CHARSET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SUBSCR_FORMAT` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ERROR_EMAIL` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTO_SEND_TIME` datetime DEFAULT NULL,
  `BCC_TO_SEND` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_posting: ~0 rows (приблизительно)
DELETE FROM `b_posting`;
/*!40000 ALTER TABLE `b_posting` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_posting` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_posting_email
DROP TABLE IF EXISTS `b_posting_email`;
CREATE TABLE IF NOT EXISTS `b_posting_email` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `POSTING_ID` int(11) NOT NULL,
  `STATUS` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SUBSCRIPTION_ID` int(11) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_posting_email_status` (`POSTING_ID`,`STATUS`),
  KEY `ix_posting_email_email` (`POSTING_ID`,`EMAIL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_posting_email: ~0 rows (приблизительно)
DELETE FROM `b_posting_email`;
/*!40000 ALTER TABLE `b_posting_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_posting_email` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_posting_file
DROP TABLE IF EXISTS `b_posting_file`;
CREATE TABLE IF NOT EXISTS `b_posting_file` (
  `POSTING_ID` int(11) NOT NULL,
  `FILE_ID` int(11) NOT NULL,
  UNIQUE KEY `UK_POSTING_POSTING_FILE` (`POSTING_ID`,`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_posting_file: ~0 rows (приблизительно)
DELETE FROM `b_posting_file`;
/*!40000 ALTER TABLE `b_posting_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_posting_file` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_posting_group
DROP TABLE IF EXISTS `b_posting_group`;
CREATE TABLE IF NOT EXISTS `b_posting_group` (
  `POSTING_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  UNIQUE KEY `UK_POSTING_POSTING_GROUP` (`POSTING_ID`,`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_posting_group: ~0 rows (приблизительно)
DELETE FROM `b_posting_group`;
/*!40000 ALTER TABLE `b_posting_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_posting_group` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_posting_rubric
DROP TABLE IF EXISTS `b_posting_rubric`;
CREATE TABLE IF NOT EXISTS `b_posting_rubric` (
  `POSTING_ID` int(11) NOT NULL,
  `LIST_RUBRIC_ID` int(11) NOT NULL,
  UNIQUE KEY `UK_POSTING_POSTING_RUBRIC` (`POSTING_ID`,`LIST_RUBRIC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_posting_rubric: ~0 rows (приблизительно)
DELETE FROM `b_posting_rubric`;
/*!40000 ALTER TABLE `b_posting_rubric` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_posting_rubric` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_rating
DROP TABLE IF EXISTS `b_rating`;
CREATE TABLE IF NOT EXISTS `b_rating` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CALCULATION_METHOD` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'SUM',
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `POSITION` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `AUTHORITY` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `CALCULATED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CONFIGS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_rating: ~2 rows (приблизительно)
DELETE FROM `b_rating`;
/*!40000 ALTER TABLE `b_rating` DISABLE KEYS */;
INSERT INTO `b_rating` (`ID`, `ACTIVE`, `NAME`, `ENTITY_ID`, `CALCULATION_METHOD`, `CREATED`, `LAST_MODIFIED`, `LAST_CALCULATED`, `POSITION`, `AUTHORITY`, `CALCULATED`, `CONFIGS`) VALUES
	(1, 'N', 'Рейтинг', 'USER', 'SUM', '2021-01-22 17:16:56', NULL, NULL, 'Y', 'N', 'N', 'a:3:{s:4:"MAIN";a:2:{s:4:"VOTE";a:1:{s:4:"USER";a:2:{s:11:"COEFFICIENT";s:1:"1";s:5:"LIMIT";s:2:"30";}}s:6:"RATING";a:1:{s:5:"BONUS";a:2:{s:6:"ACTIVE";s:1:"Y";s:11:"COEFFICIENT";s:1:"1";}}}s:5:"FORUM";a:2:{s:4:"VOTE";a:2:{s:5:"TOPIC";a:3:{s:6:"ACTIVE";s:1:"Y";s:11:"COEFFICIENT";s:3:"0.5";s:5:"LIMIT";s:2:"30";}s:4:"POST";a:3:{s:6:"ACTIVE";s:1:"Y";s:11:"COEFFICIENT";s:3:"0.1";s:5:"LIMIT";s:2:"30";}}s:6:"RATING";a:1:{s:8:"ACTIVITY";a:9:{s:6:"ACTIVE";s:1:"Y";s:16:"TODAY_TOPIC_COEF";s:3:"0.4";s:15:"WEEK_TOPIC_COEF";s:3:"0.2";s:16:"MONTH_TOPIC_COEF";s:3:"0.1";s:14:"ALL_TOPIC_COEF";s:1:"0";s:15:"TODAY_POST_COEF";s:3:"0.2";s:14:"WEEK_POST_COEF";s:3:"0.1";s:15:"MONTH_POST_COEF";s:4:"0.05";s:13:"ALL_POST_COEF";s:1:"0";}}}s:4:"BLOG";a:2:{s:4:"VOTE";a:2:{s:4:"POST";a:3:{s:6:"ACTIVE";s:1:"Y";s:11:"COEFFICIENT";s:3:"0.5";s:5:"LIMIT";s:2:"30";}s:7:"COMMENT";a:3:{s:6:"ACTIVE";s:1:"Y";s:11:"COEFFICIENT";s:3:"0.1";s:5:"LIMIT";s:2:"30";}}s:6:"RATING";a:1:{s:8:"ACTIVITY";a:9:{s:6:"ACTIVE";s:1:"Y";s:15:"TODAY_POST_COEF";s:3:"0.4";s:14:"WEEK_POST_COEF";s:3:"0.2";s:15:"MONTH_POST_COEF";s:3:"0.1";s:13:"ALL_POST_COEF";s:1:"0";s:18:"TODAY_COMMENT_COEF";s:3:"0.2";s:17:"WEEK_COMMENT_COEF";s:3:"0.1";s:18:"MONTH_COMMENT_COEF";s:4:"0.05";s:16:"ALL_COMMENT_COEF";s:1:"0";}}}}'),
	(2, 'N', 'Авторитет', 'USER', 'SUM', '2021-01-22 17:16:56', NULL, NULL, 'Y', 'Y', 'N', 'a:3:{s:4:"MAIN";a:2:{s:4:"VOTE";a:1:{s:4:"USER";a:3:{s:6:"ACTIVE";s:1:"Y";s:11:"COEFFICIENT";s:1:"1";s:5:"LIMIT";s:1:"0";}}s:6:"RATING";a:1:{s:5:"BONUS";a:2:{s:6:"ACTIVE";s:1:"Y";s:11:"COEFFICIENT";s:1:"1";}}}s:5:"FORUM";a:2:{s:4:"VOTE";a:2:{s:5:"TOPIC";a:2:{s:11:"COEFFICIENT";s:1:"1";s:5:"LIMIT";s:2:"30";}s:4:"POST";a:2:{s:11:"COEFFICIENT";s:1:"1";s:5:"LIMIT";s:2:"30";}}s:6:"RATING";a:1:{s:8:"ACTIVITY";a:8:{s:16:"TODAY_TOPIC_COEF";s:2:"20";s:15:"WEEK_TOPIC_COEF";s:2:"10";s:16:"MONTH_TOPIC_COEF";s:1:"5";s:14:"ALL_TOPIC_COEF";s:1:"0";s:15:"TODAY_POST_COEF";s:3:"0.4";s:14:"WEEK_POST_COEF";s:3:"0.2";s:15:"MONTH_POST_COEF";s:3:"0.1";s:13:"ALL_POST_COEF";s:1:"0";}}}s:4:"BLOG";a:2:{s:4:"VOTE";a:2:{s:4:"POST";a:2:{s:11:"COEFFICIENT";s:1:"1";s:5:"LIMIT";s:2:"30";}s:7:"COMMENT";a:2:{s:11:"COEFFICIENT";s:1:"1";s:5:"LIMIT";s:2:"30";}}s:6:"RATING";a:1:{s:8:"ACTIVITY";a:8:{s:15:"TODAY_POST_COEF";s:3:"0.4";s:14:"WEEK_POST_COEF";s:3:"0.2";s:15:"MONTH_POST_COEF";s:3:"0.1";s:13:"ALL_POST_COEF";s:1:"0";s:18:"TODAY_COMMENT_COEF";s:3:"0.2";s:17:"WEEK_COMMENT_COEF";s:3:"0.1";s:18:"MONTH_COMMENT_COEF";s:4:"0.05";s:16:"ALL_COMMENT_COEF";s:1:"0";}}}}');
/*!40000 ALTER TABLE `b_rating` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_rating_component
DROP TABLE IF EXISTS `b_rating_component`;
CREATE TABLE IF NOT EXISTS `b_rating_component` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_ID` int(11) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ENTITY_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `RATING_TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `COMPLEX_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `CLASS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CALC_METHOD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `EXCEPTION_METHOD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `NEXT_CALCULATION` datetime DEFAULT NULL,
  `REFRESH_INTERVAL` int(11) NOT NULL,
  `CONFIG` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_RATING_ID_1` (`RATING_ID`,`ACTIVE`,`NEXT_CALCULATION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_rating_component: ~0 rows (приблизительно)
DELETE FROM `b_rating_component`;
/*!40000 ALTER TABLE `b_rating_component` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rating_component` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_rating_component_results
DROP TABLE IF EXISTS `b_rating_component_results`;
CREATE TABLE IF NOT EXISTS `b_rating_component_results` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `RATING_TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `COMPLEX_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `CURRENT_VALUE` decimal(18,4) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_ENTITY_TYPE_ID` (`ENTITY_TYPE_ID`),
  KEY `IX_COMPLEX_NAME` (`COMPLEX_NAME`),
  KEY `IX_RATING_ID_2` (`RATING_ID`,`COMPLEX_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_rating_component_results: ~0 rows (приблизительно)
DELETE FROM `b_rating_component_results`;
/*!40000 ALTER TABLE `b_rating_component_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rating_component_results` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_rating_prepare
DROP TABLE IF EXISTS `b_rating_prepare`;
CREATE TABLE IF NOT EXISTS `b_rating_prepare` (
  `ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_rating_prepare: ~0 rows (приблизительно)
DELETE FROM `b_rating_prepare`;
/*!40000 ALTER TABLE `b_rating_prepare` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rating_prepare` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_rating_results
DROP TABLE IF EXISTS `b_rating_results`;
CREATE TABLE IF NOT EXISTS `b_rating_results` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `CURRENT_VALUE` decimal(18,4) DEFAULT NULL,
  `PREVIOUS_VALUE` decimal(18,4) DEFAULT NULL,
  `CURRENT_POSITION` int(11) DEFAULT 0,
  `PREVIOUS_POSITION` int(11) DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `IX_RATING_3` (`RATING_ID`,`ENTITY_TYPE_ID`,`ENTITY_ID`),
  KEY `IX_RATING_4` (`RATING_ID`,`ENTITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_rating_results: ~0 rows (приблизительно)
DELETE FROM `b_rating_results`;
/*!40000 ALTER TABLE `b_rating_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rating_results` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_rating_rule
DROP TABLE IF EXISTS `b_rating_rule`;
CREATE TABLE IF NOT EXISTS `b_rating_rule` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `NAME` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION_MODULE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONDITION_CLASS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION_METHOD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION_CONFIG` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTION_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `ACTION_CONFIG` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ACTIVATE_CLASS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVATE_METHOD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DEACTIVATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DEACTIVATE_CLASS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DEACTIVATE_METHOD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LAST_APPLIED` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_rating_rule: ~5 rows (приблизительно)
DELETE FROM `b_rating_rule`;
/*!40000 ALTER TABLE `b_rating_rule` DISABLE KEYS */;
INSERT INTO `b_rating_rule` (`ID`, `ACTIVE`, `NAME`, `ENTITY_TYPE_ID`, `CONDITION_NAME`, `CONDITION_MODULE`, `CONDITION_CLASS`, `CONDITION_METHOD`, `CONDITION_CONFIG`, `ACTION_NAME`, `ACTION_CONFIG`, `ACTIVATE`, `ACTIVATE_CLASS`, `ACTIVATE_METHOD`, `DEACTIVATE`, `DEACTIVATE_CLASS`, `DEACTIVATE_METHOD`, `CREATED`, `LAST_MODIFIED`, `LAST_APPLIED`) VALUES
	(1, 'N', 'Добавление в группу пользователей, имеющих право голосовать за рейтинг', 'USER', 'AUTHORITY', NULL, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:"AUTHORITY";a:2:{s:16:"RATING_CONDITION";i:1;s:12:"RATING_VALUE";i:1;}}', 'ADD_TO_GROUP', 'a:1:{s:12:"ADD_TO_GROUP";a:1:{s:8:"GROUP_ID";s:1:"3";}}', 'N', 'CRatingRulesMain', 'addToGroup', 'N', 'CRatingRulesMain ', 'addToGroup', '2021-01-22 17:16:56', '2021-01-22 17:16:56', NULL),
	(2, 'N', 'Удаление из группы пользователей, не имеющих права голосовать за рейтинг', 'USER', 'AUTHORITY', NULL, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:"AUTHORITY";a:2:{s:16:"RATING_CONDITION";i:2;s:12:"RATING_VALUE";i:1;}}', 'REMOVE_FROM_GROUP', 'a:1:{s:17:"REMOVE_FROM_GROUP";a:1:{s:8:"GROUP_ID";s:1:"3";}}', 'N', 'CRatingRulesMain', 'removeFromGroup', 'N', 'CRatingRulesMain ', 'removeFromGroup', '2021-01-22 17:16:56', '2021-01-22 17:16:56', NULL),
	(3, 'N', 'Добавление в группу пользователей, имеющих право голосовать за авторитет', 'USER', 'AUTHORITY', NULL, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:"AUTHORITY";a:2:{s:16:"RATING_CONDITION";i:1;s:12:"RATING_VALUE";i:2;}}', 'ADD_TO_GROUP', 'a:1:{s:12:"ADD_TO_GROUP";a:1:{s:8:"GROUP_ID";s:1:"4";}}', 'N', 'CRatingRulesMain', 'addToGroup', 'N', 'CRatingRulesMain ', 'addToGroup', '2021-01-22 17:16:56', '2021-01-22 17:16:56', NULL),
	(4, 'N', 'Удаление из группы пользователей, не имеющих права голосовать за авторитет', 'USER', 'AUTHORITY', NULL, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:"AUTHORITY";a:2:{s:16:"RATING_CONDITION";i:2;s:12:"RATING_VALUE";i:2;}}', 'REMOVE_FROM_GROUP', 'a:1:{s:17:"REMOVE_FROM_GROUP";a:1:{s:8:"GROUP_ID";s:1:"4";}}', 'N', 'CRatingRulesMain', 'removeFromGroup', 'N', 'CRatingRulesMain ', 'removeFromGroup', '2021-01-22 17:16:56', '2021-01-22 17:16:56', NULL),
	(5, 'Y', 'Автоматическое голосование за авторитет пользователя', 'USER', 'VOTE', NULL, 'CRatingRulesMain', 'voteCheck', 'a:1:{s:4:"VOTE";a:6:{s:10:"VOTE_LIMIT";i:90;s:11:"VOTE_RESULT";i:10;s:16:"VOTE_FORUM_TOPIC";d:0.5;s:15:"VOTE_FORUM_POST";d:0.1;s:14:"VOTE_BLOG_POST";d:0.5;s:17:"VOTE_BLOG_COMMENT";d:0.1;}}', 'empty', 'a:0:{}', 'N', 'empty', 'empty', 'N', 'empty ', 'empty', '2021-01-22 17:16:56', '2021-01-22 17:16:56', NULL);
/*!40000 ALTER TABLE `b_rating_rule` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_rating_rule_vetting
DROP TABLE IF EXISTS `b_rating_rule_vetting`;
CREATE TABLE IF NOT EXISTS `b_rating_rule_vetting` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RULE_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `ACTIVATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `APPLIED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `RULE_ID` (`RULE_ID`,`ENTITY_TYPE_ID`,`ENTITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_rating_rule_vetting: ~0 rows (приблизительно)
DELETE FROM `b_rating_rule_vetting`;
/*!40000 ALTER TABLE `b_rating_rule_vetting` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rating_rule_vetting` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_rating_user
DROP TABLE IF EXISTS `b_rating_user`;
CREATE TABLE IF NOT EXISTS `b_rating_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_ID` int(11) NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `BONUS` decimal(18,4) DEFAULT 0.0000,
  `VOTE_WEIGHT` decimal(18,4) DEFAULT 0.0000,
  `VOTE_COUNT` int(11) DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `RATING_ID` (`RATING_ID`,`ENTITY_ID`),
  KEY `IX_B_RAT_USER_2` (`ENTITY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_rating_user: ~1 rows (приблизительно)
DELETE FROM `b_rating_user`;
/*!40000 ALTER TABLE `b_rating_user` DISABLE KEYS */;
INSERT INTO `b_rating_user` (`ID`, `RATING_ID`, `ENTITY_ID`, `BONUS`, `VOTE_WEIGHT`, `VOTE_COUNT`) VALUES
	(1, 2, 1, 3.0000, 30.0000, 13);
/*!40000 ALTER TABLE `b_rating_user` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_rating_vote
DROP TABLE IF EXISTS `b_rating_vote`;
CREATE TABLE IF NOT EXISTS `b_rating_vote` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_VOTING_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `OWNER_ID` int(11) NOT NULL,
  `VALUE` decimal(18,4) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `CREATED` datetime NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `USER_IP` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `REACTION` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_RAT_VOTE_ID` (`RATING_VOTING_ID`,`USER_ID`),
  KEY `IX_RAT_VOTE_ID_2` (`ENTITY_TYPE_ID`,`ENTITY_ID`,`USER_ID`),
  KEY `IX_RAT_VOTE_ID_3` (`OWNER_ID`,`CREATED`),
  KEY `IX_RAT_VOTE_ID_4` (`USER_ID`),
  KEY `IX_RAT_VOTE_ID_5` (`CREATED`,`VALUE`),
  KEY `IX_RAT_VOTE_ID_6` (`ACTIVE`),
  KEY `IX_RAT_VOTE_ID_7` (`RATING_VOTING_ID`,`CREATED`),
  KEY `IX_RAT_VOTE_ID_8` (`ENTITY_TYPE_ID`,`CREATED`),
  KEY `IX_RAT_VOTE_ID_9` (`CREATED`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_rating_vote: ~0 rows (приблизительно)
DELETE FROM `b_rating_vote`;
/*!40000 ALTER TABLE `b_rating_vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rating_vote` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_rating_vote_group
DROP TABLE IF EXISTS `b_rating_vote_group`;
CREATE TABLE IF NOT EXISTS `b_rating_vote_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GROUP_ID` int(11) NOT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `RATING_ID` (`GROUP_ID`,`TYPE`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_rating_vote_group: ~6 rows (приблизительно)
DELETE FROM `b_rating_vote_group`;
/*!40000 ALTER TABLE `b_rating_vote_group` DISABLE KEYS */;
INSERT INTO `b_rating_vote_group` (`ID`, `GROUP_ID`, `TYPE`) VALUES
	(5, 1, 'A'),
	(1, 1, 'R'),
	(3, 1, 'R'),
	(2, 3, 'R'),
	(4, 3, 'R'),
	(6, 4, 'A');
/*!40000 ALTER TABLE `b_rating_vote_group` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_rating_voting
DROP TABLE IF EXISTS `b_rating_voting`;
CREATE TABLE IF NOT EXISTS `b_rating_voting` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `OWNER_ID` int(11) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `CREATED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `TOTAL_VALUE` decimal(18,4) NOT NULL,
  `TOTAL_VOTES` int(11) NOT NULL,
  `TOTAL_POSITIVE_VOTES` int(11) NOT NULL,
  `TOTAL_NEGATIVE_VOTES` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_ENTITY_TYPE_ID_2` (`ENTITY_TYPE_ID`,`ENTITY_ID`,`ACTIVE`),
  KEY `IX_ENTITY_TYPE_ID_4` (`TOTAL_VALUE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_rating_voting: ~0 rows (приблизительно)
DELETE FROM `b_rating_voting`;
/*!40000 ALTER TABLE `b_rating_voting` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rating_voting` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_rating_voting_prepare
DROP TABLE IF EXISTS `b_rating_voting_prepare`;
CREATE TABLE IF NOT EXISTS `b_rating_voting_prepare` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_VOTING_ID` int(11) NOT NULL,
  `TOTAL_VALUE` decimal(18,4) NOT NULL,
  `TOTAL_VOTES` int(11) NOT NULL,
  `TOTAL_POSITIVE_VOTES` int(11) NOT NULL,
  `TOTAL_NEGATIVE_VOTES` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_RATING_VOTING_ID` (`RATING_VOTING_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_rating_voting_prepare: ~0 rows (приблизительно)
DELETE FROM `b_rating_voting_prepare`;
/*!40000 ALTER TABLE `b_rating_voting_prepare` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rating_voting_prepare` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_rating_voting_reaction
DROP TABLE IF EXISTS `b_rating_voting_reaction`;
CREATE TABLE IF NOT EXISTS `b_rating_voting_reaction` (
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `REACTION` varchar(8) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `TOTAL_VOTES` int(11) NOT NULL,
  PRIMARY KEY (`ENTITY_TYPE_ID`,`ENTITY_ID`,`REACTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_rating_voting_reaction: ~0 rows (приблизительно)
DELETE FROM `b_rating_voting_reaction`;
/*!40000 ALTER TABLE `b_rating_voting_reaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rating_voting_reaction` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_rating_weight
DROP TABLE IF EXISTS `b_rating_weight`;
CREATE TABLE IF NOT EXISTS `b_rating_weight` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_FROM` decimal(18,4) NOT NULL,
  `RATING_TO` decimal(18,4) NOT NULL,
  `WEIGHT` decimal(18,4) DEFAULT 0.0000,
  `COUNT` int(11) DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_rating_weight: ~1 rows (приблизительно)
DELETE FROM `b_rating_weight`;
/*!40000 ALTER TABLE `b_rating_weight` DISABLE KEYS */;
INSERT INTO `b_rating_weight` (`ID`, `RATING_FROM`, `RATING_TO`, `WEIGHT`, `COUNT`) VALUES
	(1, -1000000.0000, 1000000.0000, 1.0000, 10);
/*!40000 ALTER TABLE `b_rating_weight` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_rest_ap
DROP TABLE IF EXISTS `b_rest_ap`;
CREATE TABLE IF NOT EXISTS `b_rest_ap` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `PASSWORD` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `COMMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `DATE_CREATE` datetime DEFAULT NULL,
  `DATE_LOGIN` datetime DEFAULT NULL,
  `LAST_IP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_rest_ap` (`USER_ID`,`PASSWORD`,`ACTIVE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_rest_ap: ~0 rows (приблизительно)
DELETE FROM `b_rest_ap`;
/*!40000 ALTER TABLE `b_rest_ap` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rest_ap` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_rest_app
DROP TABLE IF EXISTS `b_rest_app`;
CREATE TABLE IF NOT EXISTS `b_rest_app` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CLIENT_ID` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `INSTALLED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `URL` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `URL_DEMO` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL_INSTALL` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VERSION` varchar(4) COLLATE utf8_unicode_ci DEFAULT '1',
  `SCOPE` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `STATUS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'F',
  `DATE_FINISH` date DEFAULT NULL,
  `IS_TRIALED` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `SHARED_KEY` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CLIENT_SECRET` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `APP_NAME` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACCESS` varchar(2000) COLLATE utf8_unicode_ci DEFAULT '',
  `APPLICATION_TOKEN` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `MOBILE` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `USER_INSTALL` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_rest_app1` (`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_rest_app: ~0 rows (приблизительно)
DELETE FROM `b_rest_app`;
/*!40000 ALTER TABLE `b_rest_app` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rest_app` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_rest_app_lang
DROP TABLE IF EXISTS `b_rest_app_lang`;
CREATE TABLE IF NOT EXISTS `b_rest_app_lang` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `APP_ID` int(11) NOT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `MENU_NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_rest_app_lang1` (`APP_ID`,`LANGUAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_rest_app_lang: ~0 rows (приблизительно)
DELETE FROM `b_rest_app_lang`;
/*!40000 ALTER TABLE `b_rest_app_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rest_app_lang` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_rest_app_log
DROP TABLE IF EXISTS `b_rest_app_log`;
CREATE TABLE IF NOT EXISTS `b_rest_app_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp(),
  `APP_ID` int(11) NOT NULL,
  `ACTION_TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `USER_ADMIN` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  KEY `ix_b_rest_app_log1` (`APP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_rest_app_log: ~0 rows (приблизительно)
DELETE FROM `b_rest_app_log`;
/*!40000 ALTER TABLE `b_rest_app_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rest_app_log` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_rest_ap_permission
DROP TABLE IF EXISTS `b_rest_ap_permission`;
CREATE TABLE IF NOT EXISTS `b_rest_ap_permission` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PASSWORD_ID` int(11) NOT NULL,
  `PERM` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_rest_ap_perm1` (`PASSWORD_ID`,`PERM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_rest_ap_permission: ~0 rows (приблизительно)
DELETE FROM `b_rest_ap_permission`;
/*!40000 ALTER TABLE `b_rest_ap_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rest_ap_permission` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_rest_event
DROP TABLE IF EXISTS `b_rest_event`;
CREATE TABLE IF NOT EXISTS `b_rest_event` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `APP_ID` int(11) DEFAULT NULL,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `EVENT_HANDLER` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` int(11) DEFAULT 0,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `COMMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `DATE_CREATE` datetime DEFAULT NULL,
  `APPLICATION_TOKEN` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `CONNECTOR_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `INTEGRATION_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_rest_event_app_event` (`APP_ID`,`EVENT_NAME`(50),`EVENT_HANDLER`(180),`USER_ID`,`CONNECTOR_ID`(70)),
  KEY `ix_b_rest_event_event_name` (`EVENT_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_rest_event: ~0 rows (приблизительно)
DELETE FROM `b_rest_event`;
/*!40000 ALTER TABLE `b_rest_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rest_event` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_rest_event_offline
DROP TABLE IF EXISTS `b_rest_event_offline`;
CREATE TABLE IF NOT EXISTS `b_rest_event_offline` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT current_timestamp(),
  `MESSAGE_ID` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `APP_ID` int(11) NOT NULL,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `EVENT_DATA` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `EVENT_ADDITIONAL` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `PROCESS_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `CONNECTOR_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `ERROR` int(3) DEFAULT 0,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_rest_event_offline1` (`MESSAGE_ID`(50),`APP_ID`,`CONNECTOR_ID`(100),`PROCESS_ID`(50)),
  KEY `ix_b_rest_event_offline2` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_rest_event_offline: ~0 rows (приблизительно)
DELETE FROM `b_rest_event_offline`;
/*!40000 ALTER TABLE `b_rest_event_offline` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rest_event_offline` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_rest_integration
DROP TABLE IF EXISTS `b_rest_integration`;
CREATE TABLE IF NOT EXISTS `b_rest_integration` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) DEFAULT NULL,
  `ELEMENT_CODE` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `TITLE` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `PASSWORD_ID` int(11) DEFAULT NULL,
  `APP_ID` int(11) DEFAULT NULL,
  `SCOPE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `QUERY` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `OUTGOING_EVENTS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `OUTGOING_NEEDED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OUTGOING_HANDLER_URL` varchar(2048) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WIDGET_NEEDED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WIDGET_HANDLER_URL` varchar(2048) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WIDGET_LIST` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `APPLICATION_TOKEN` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `APPLICATION_NEEDED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `APPLICATION_ONLY_API` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BOT_ID` int(11) DEFAULT NULL,
  `BOT_HANDLER_URL` varchar(2048) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_rest_integration: ~0 rows (приблизительно)
DELETE FROM `b_rest_integration`;
/*!40000 ALTER TABLE `b_rest_integration` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rest_integration` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_rest_log
DROP TABLE IF EXISTS `b_rest_log`;
CREATE TABLE IF NOT EXISTS `b_rest_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp(),
  `CLIENT_ID` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PASSWORD_ID` int(11) DEFAULT NULL,
  `SCOPE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `METHOD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUEST_METHOD` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUEST_URI` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUEST_AUTH` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUEST_DATA` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `RESPONSE_STATUS` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RESPONSE_DATA` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_rest_log: ~0 rows (приблизительно)
DELETE FROM `b_rest_log`;
/*!40000 ALTER TABLE `b_rest_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rest_log` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_rest_owner_entity
DROP TABLE IF EXISTS `b_rest_owner_entity`;
CREATE TABLE IF NOT EXISTS `b_rest_owner_entity` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `OWNER_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER` int(11) NOT NULL,
  `ENTITY_TYPE` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_b_rest_owner_entity` (`ENTITY_TYPE`,`ENTITY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_rest_owner_entity: ~0 rows (приблизительно)
DELETE FROM `b_rest_owner_entity`;
/*!40000 ALTER TABLE `b_rest_owner_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rest_owner_entity` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_rest_placement
DROP TABLE IF EXISTS `b_rest_placement`;
CREATE TABLE IF NOT EXISTS `b_rest_placement` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `APP_ID` int(11) DEFAULT NULL,
  `PLACEMENT` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PLACEMENT_HANDLER` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `GROUP_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `COMMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `DATE_CREATE` datetime DEFAULT NULL,
  `ADDITIONAL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_rest_placement1` (`APP_ID`,`PLACEMENT`(100),`PLACEMENT_HANDLER`(200)),
  KEY `ix_b_rest_placement3` (`PLACEMENT`(100),`ADDITIONAL`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_rest_placement: ~0 rows (приблизительно)
DELETE FROM `b_rest_placement`;
/*!40000 ALTER TABLE `b_rest_placement` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rest_placement` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_rest_stat
DROP TABLE IF EXISTS `b_rest_stat`;
CREATE TABLE IF NOT EXISTS `b_rest_stat` (
  `STAT_DATE` date NOT NULL,
  `APP_ID` int(11) NOT NULL,
  `METHOD_ID` int(11) NOT NULL,
  `HOUR_0` int(11) NOT NULL DEFAULT 0,
  `HOUR_1` int(11) NOT NULL DEFAULT 0,
  `HOUR_2` int(11) NOT NULL DEFAULT 0,
  `HOUR_3` int(11) NOT NULL DEFAULT 0,
  `HOUR_4` int(11) NOT NULL DEFAULT 0,
  `HOUR_5` int(11) NOT NULL DEFAULT 0,
  `HOUR_6` int(11) NOT NULL DEFAULT 0,
  `HOUR_7` int(11) NOT NULL DEFAULT 0,
  `HOUR_8` int(11) NOT NULL DEFAULT 0,
  `HOUR_9` int(11) NOT NULL DEFAULT 0,
  `HOUR_10` int(11) NOT NULL DEFAULT 0,
  `HOUR_11` int(11) NOT NULL DEFAULT 0,
  `HOUR_12` int(11) NOT NULL DEFAULT 0,
  `HOUR_13` int(11) NOT NULL DEFAULT 0,
  `HOUR_14` int(11) NOT NULL DEFAULT 0,
  `HOUR_15` int(11) NOT NULL DEFAULT 0,
  `HOUR_16` int(11) NOT NULL DEFAULT 0,
  `HOUR_17` int(11) NOT NULL DEFAULT 0,
  `HOUR_18` int(11) NOT NULL DEFAULT 0,
  `HOUR_19` int(11) NOT NULL DEFAULT 0,
  `HOUR_20` int(11) NOT NULL DEFAULT 0,
  `HOUR_21` int(11) NOT NULL DEFAULT 0,
  `HOUR_22` int(11) NOT NULL DEFAULT 0,
  `HOUR_23` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`APP_ID`,`STAT_DATE`,`METHOD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_rest_stat: ~0 rows (приблизительно)
DELETE FROM `b_rest_stat`;
/*!40000 ALTER TABLE `b_rest_stat` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rest_stat` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_rest_stat_app
DROP TABLE IF EXISTS `b_rest_stat_app`;
CREATE TABLE IF NOT EXISTS `b_rest_stat_app` (
  `APP_ID` int(11) NOT NULL,
  `APP_CODE` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`APP_ID`),
  KEY `ix_b_rest_stat_app_code` (`APP_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_rest_stat_app: ~0 rows (приблизительно)
DELETE FROM `b_rest_stat_app`;
/*!40000 ALTER TABLE `b_rest_stat_app` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rest_stat_app` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_rest_stat_method
DROP TABLE IF EXISTS `b_rest_stat_method`;
CREATE TABLE IF NOT EXISTS `b_rest_stat_method` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `METHOD_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT 'M',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_rest_stat_method` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_rest_stat_method: ~0 rows (приблизительно)
DELETE FROM `b_rest_stat_method`;
/*!40000 ALTER TABLE `b_rest_stat_method` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rest_stat_method` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_rest_usage_entity
DROP TABLE IF EXISTS `b_rest_usage_entity`;
CREATE TABLE IF NOT EXISTS `b_rest_usage_entity` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `ENTITY_CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SUB_ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SUB_ENTITY_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_b_rest_usage_entity` (`ENTITY_TYPE`,`ENTITY_ID`,`SUB_ENTITY_TYPE`,`SUB_ENTITY_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_rest_usage_entity: ~0 rows (приблизительно)
DELETE FROM `b_rest_usage_entity`;
/*!40000 ALTER TABLE `b_rest_usage_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rest_usage_entity` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_rest_usage_stat
DROP TABLE IF EXISTS `b_rest_usage_stat`;
CREATE TABLE IF NOT EXISTS `b_rest_usage_stat` (
  `STAT_DATE` date NOT NULL,
  `ENTITY_ID` int(11) NOT NULL DEFAULT 0,
  `IS_SENT` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `HOUR_0` int(11) NOT NULL DEFAULT 0,
  `HOUR_1` int(11) NOT NULL DEFAULT 0,
  `HOUR_2` int(11) NOT NULL DEFAULT 0,
  `HOUR_3` int(11) NOT NULL DEFAULT 0,
  `HOUR_4` int(11) NOT NULL DEFAULT 0,
  `HOUR_5` int(11) NOT NULL DEFAULT 0,
  `HOUR_6` int(11) NOT NULL DEFAULT 0,
  `HOUR_7` int(11) NOT NULL DEFAULT 0,
  `HOUR_8` int(11) NOT NULL DEFAULT 0,
  `HOUR_9` int(11) NOT NULL DEFAULT 0,
  `HOUR_10` int(11) NOT NULL DEFAULT 0,
  `HOUR_11` int(11) NOT NULL DEFAULT 0,
  `HOUR_12` int(11) NOT NULL DEFAULT 0,
  `HOUR_13` int(11) NOT NULL DEFAULT 0,
  `HOUR_14` int(11) NOT NULL DEFAULT 0,
  `HOUR_15` int(11) NOT NULL DEFAULT 0,
  `HOUR_16` int(11) NOT NULL DEFAULT 0,
  `HOUR_17` int(11) NOT NULL DEFAULT 0,
  `HOUR_18` int(11) NOT NULL DEFAULT 0,
  `HOUR_19` int(11) NOT NULL DEFAULT 0,
  `HOUR_20` int(11) NOT NULL DEFAULT 0,
  `HOUR_21` int(11) NOT NULL DEFAULT 0,
  `HOUR_22` int(11) NOT NULL DEFAULT 0,
  `HOUR_23` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`STAT_DATE`,`ENTITY_ID`),
  KEY `ix_b_rest_usage` (`ENTITY_ID`,`STAT_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_rest_usage_stat: ~0 rows (приблизительно)
DELETE FROM `b_rest_usage_stat`;
/*!40000 ALTER TABLE `b_rest_usage_stat` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rest_usage_stat` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_search_content
DROP TABLE IF EXISTS `b_search_content`;
CREATE TABLE IF NOT EXISTS `b_search_content` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_CHANGE` datetime NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CUSTOM_RANK` int(11) NOT NULL DEFAULT 0,
  `USER_ID` int(11) DEFAULT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ENTITY_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `TITLE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `BODY` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAGS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `PARAM1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `PARAM2` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `UPD` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_FROM` datetime DEFAULT NULL,
  `DATE_TO` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_B_SEARCH_CONTENT` (`MODULE_ID`,`ITEM_ID`),
  KEY `IX_B_SEARCH_CONTENT_1` (`MODULE_ID`,`PARAM1`(50),`PARAM2`(50)),
  KEY `IX_B_SEARCH_CONTENT_2` (`ENTITY_ID`(50),`ENTITY_TYPE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_search_content: ~14 rows (приблизительно)
DELETE FROM `b_search_content`;
/*!40000 ALTER TABLE `b_search_content` DISABLE KEYS */;
INSERT INTO `b_search_content` (`ID`, `DATE_CHANGE`, `MODULE_ID`, `ITEM_ID`, `CUSTOM_RANK`, `USER_ID`, `ENTITY_TYPE_ID`, `ENTITY_ID`, `URL`, `TITLE`, `BODY`, `TAGS`, `PARAM1`, `PARAM2`, `UPD`, `DATE_FROM`, `DATE_TO`) VALUES
	(4, '2021-01-25 07:31:44', 'main', 's1|/index.php', 0, NULL, NULL, NULL, '/index.php', '1С-Битрикс: Управление сайтом', 'Установка натяжных потолков и осветительных приборов\rУстановка\rнатяжных потолков\rи осветительных приборов\nСтабильно и качественно\rвыполняем свою работу на протяжении 8 лет\nУстановка\rнатяжных потолков\rи осветительных приборов\nСтабильно и качественно\rвыполняем свою работу на протяжении 8 лет\nУстановка\rнатяжных потолков\rи осветительных приборов\nСтабильно и качественно\rвыполняем свою работу на протяжении 8 лет\nНаши\rпроекты\nГлянцевые фактуры\nМатовые фактуры\nМногоуровневые потолки\nСкрытая подсветка\nТканевые потолки\nФотопечать\nНаши\rпроекты\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin\ngravida dolor sit amet lacus accumsan et viverra justo commodo. Proin sodales pulvinar tempor.\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam\nfermentum, nulla luctus pharetra vulputate, felis tellus mollis orci, sed rhoncus sapien nunc\neget.\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin\ngravida dolor sit amet lacus accumsan et viverra justo commodo. Proin sodales pulvinar tempor.\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam\nfermentum, nulla luctus pharetra vulputate, felis tellus mollis orci, sed rhoncus sapien nunc\neget.\nЗакажите замер бесплатно\nПолучите бесплатный расчет стоимости своего потолка прямо сейчас!\nОтзывы\rи благодарности\nОтзывы о нас на Флампе', '', '', '', NULL, NULL, NULL),
	(5, '2021-01-24 12:33:50', 'iblock', '4', 0, NULL, NULL, NULL, '=ID=4&EXTERNAL_ID=4&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=why_us&IBLOCK_ID=4&IBLOCK_CODE=why_us&IBLOCK_EXTERNAL_ID=&CODE=bolee-7-let', 'Более 7 лет', 'Работаем одним составом', '', 'why_us', '4', NULL, NULL, NULL),
	(6, '2021-01-24 12:34:23', 'iblock', '5', 0, NULL, NULL, NULL, '=ID=5&EXTERNAL_ID=5&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=why_us&IBLOCK_ID=4&IBLOCK_CODE=why_us&IBLOCK_EXTERNAL_ID=&CODE=besplatnyy-zamer', 'Бесплатный замер', 'Выезд в день обращения, производим расчет сразу на месте', '', 'why_us', '4', NULL, NULL, NULL),
	(7, '2021-01-24 13:01:02', 'iblock', '6', 0, NULL, NULL, NULL, '=ID=6&EXTERNAL_ID=6&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=reviews&IBLOCK_ID=5&IBLOCK_CODE=reviews&IBLOCK_EXTERNAL_ID=&CODE=reviews', 'благодарность1', '', '', 'reviews', '5', NULL, NULL, NULL),
	(8, '2021-01-24 13:01:30', 'iblock', '7', 0, NULL, NULL, NULL, '=ID=7&EXTERNAL_ID=7&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=reviews&IBLOCK_ID=5&IBLOCK_CODE=reviews&IBLOCK_EXTERNAL_ID=&CODE=', 'благодарность2', '', '', 'reviews', '5', NULL, NULL, NULL),
	(9, '2021-01-24 13:02:16', 'iblock', '8', 0, NULL, NULL, NULL, '=ID=8&EXTERNAL_ID=8&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=reviews&IBLOCK_ID=5&IBLOCK_CODE=reviews&IBLOCK_EXTERNAL_ID=&CODE=', 'благодарность3', '', '', 'reviews', '5', NULL, NULL, NULL),
	(10, '2021-01-24 13:02:34', 'iblock', '9', 0, NULL, NULL, NULL, '=ID=9&EXTERNAL_ID=9&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=reviews&IBLOCK_ID=5&IBLOCK_CODE=reviews&IBLOCK_EXTERNAL_ID=&CODE=', 'благодарность4', '', '', 'reviews', '5', NULL, NULL, NULL),
	(11, '2021-01-24 13:56:04', 'iblock', '10', 0, NULL, NULL, NULL, '=ID=10&EXTERNAL_ID=10&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=why_us&IBLOCK_ID=4&IBLOCK_CODE=why_us&IBLOCK_EXTERNAL_ID=&CODE=besplatno', 'Бесплатно', 'Сервисное обслуживание всех выполненных работ', '', 'why_us', '4', NULL, NULL, NULL),
	(12, '2021-01-24 13:56:30', 'iblock', '11', 0, NULL, NULL, NULL, '=ID=11&EXTERNAL_ID=11&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=why_us&IBLOCK_ID=4&IBLOCK_CODE=why_us&IBLOCK_EXTERNAL_ID=&CODE=vysokoe-kachestvo', 'Высокое качество', 'Монтажных работ\r\nи обслуживания', '', 'why_us', '4', NULL, NULL, NULL),
	(13, '2021-01-24 13:56:57', 'iblock', '12', 0, NULL, NULL, NULL, '=ID=12&EXTERNAL_ID=12&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=why_us&IBLOCK_ID=4&IBLOCK_CODE=why_us&IBLOCK_EXTERNAL_ID=&CODE=gos-zakazchiki', 'Гос. заказчики', 'Довольны нашей работой', '', 'why_us', '4', NULL, NULL, NULL),
	(14, '2021-01-24 14:28:51', 'iblock', '13', 0, NULL, NULL, NULL, '=ID=13&EXTERNAL_ID=13&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=contacts&IBLOCK_ID=6&IBLOCK_CODE=contacts&IBLOCK_EXTERNAL_ID=&CODE=', 'adress', 'г. Новосибирск, ул. Ленина, д.1, \r\nофис 100', '', 'contacts', '6', NULL, NULL, NULL),
	(15, '2021-01-24 14:28:30', 'iblock', '14', 0, NULL, NULL, NULL, '=ID=14&EXTERNAL_ID=14&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=contacts&IBLOCK_ID=6&IBLOCK_CODE=contacts&IBLOCK_EXTERNAL_ID=&CODE=', 'schedule', '10:00 - 20:00, \r\nбез выходных', '', 'contacts', '6', NULL, NULL, NULL),
	(16, '2021-01-24 14:26:37', 'iblock', '15', 0, NULL, NULL, NULL, '=ID=15&EXTERNAL_ID=15&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=contacts&IBLOCK_ID=6&IBLOCK_CODE=contacts&IBLOCK_EXTERNAL_ID=&CODE=', 'phone', '8 (383) 000-00-00', '', 'contacts', '6', NULL, NULL, NULL),
	(18, '2021-01-24 14:36:29', 'iblock', '17', 0, NULL, NULL, NULL, '=ID=17&EXTERNAL_ID=17&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=contacts&IBLOCK_ID=6&IBLOCK_CODE=contacts&IBLOCK_EXTERNAL_ID=&CODE=', 'email', 'ampir_nsk@mail.ru', '', 'contacts', '6', NULL, NULL, NULL);
/*!40000 ALTER TABLE `b_search_content` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_search_content_freq
DROP TABLE IF EXISTS `b_search_content_freq`;
CREATE TABLE IF NOT EXISTS `b_search_content_freq` (
  `STEM` int(11) NOT NULL DEFAULT 0,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FREQ` float DEFAULT NULL,
  `TF` float DEFAULT NULL,
  UNIQUE KEY `UX_B_SEARCH_CONTENT_FREQ` (`STEM`,`LANGUAGE_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_search_content_freq: ~0 rows (приблизительно)
DELETE FROM `b_search_content_freq`;
/*!40000 ALTER TABLE `b_search_content_freq` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_search_content_freq` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_search_content_param
DROP TABLE IF EXISTS `b_search_content_param`;
CREATE TABLE IF NOT EXISTS `b_search_content_param` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `PARAM_NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `PARAM_VALUE` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  KEY `IX_B_SEARCH_CONTENT_PARAM` (`SEARCH_CONTENT_ID`,`PARAM_NAME`),
  KEY `IX_B_SEARCH_CONTENT_PARAM_1` (`PARAM_NAME`,`PARAM_VALUE`(50),`SEARCH_CONTENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_search_content_param: ~0 rows (приблизительно)
DELETE FROM `b_search_content_param`;
/*!40000 ALTER TABLE `b_search_content_param` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_search_content_param` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_search_content_right
DROP TABLE IF EXISTS `b_search_content_right`;
CREATE TABLE IF NOT EXISTS `b_search_content_right` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `GROUP_CODE` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `UX_B_SEARCH_CONTENT_RIGHT` (`SEARCH_CONTENT_ID`,`GROUP_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_search_content_right: ~14 rows (приблизительно)
DELETE FROM `b_search_content_right`;
/*!40000 ALTER TABLE `b_search_content_right` DISABLE KEYS */;
INSERT INTO `b_search_content_right` (`SEARCH_CONTENT_ID`, `GROUP_CODE`) VALUES
	(4, 'G2'),
	(5, 'G1'),
	(6, 'G1'),
	(7, 'G1'),
	(8, 'G1'),
	(9, 'G1'),
	(10, 'G1'),
	(11, 'G1'),
	(12, 'G1'),
	(13, 'G1'),
	(14, 'G1'),
	(15, 'G1'),
	(16, 'G1'),
	(18, 'G1');
/*!40000 ALTER TABLE `b_search_content_right` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_search_content_site
DROP TABLE IF EXISTS `b_search_content_site`;
CREATE TABLE IF NOT EXISTS `b_search_content_site` (
  `SEARCH_CONTENT_ID` int(18) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `URL` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SEARCH_CONTENT_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_search_content_site: ~14 rows (приблизительно)
DELETE FROM `b_search_content_site`;
/*!40000 ALTER TABLE `b_search_content_site` DISABLE KEYS */;
INSERT INTO `b_search_content_site` (`SEARCH_CONTENT_ID`, `SITE_ID`, `URL`) VALUES
	(4, 's1', ''),
	(5, 's1', ''),
	(6, 's1', ''),
	(7, 's1', ''),
	(8, 's1', ''),
	(9, 's1', ''),
	(10, 's1', ''),
	(11, 's1', ''),
	(12, 's1', ''),
	(13, 's1', ''),
	(14, 's1', ''),
	(15, 's1', ''),
	(16, 's1', ''),
	(18, 's1', '');
/*!40000 ALTER TABLE `b_search_content_site` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_search_content_stem
DROP TABLE IF EXISTS `b_search_content_stem`;
CREATE TABLE IF NOT EXISTS `b_search_content_stem` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `STEM` int(11) NOT NULL,
  `TF` float NOT NULL,
  `PS` float NOT NULL,
  UNIQUE KEY `UX_B_SEARCH_CONTENT_STEM` (`STEM`,`LANGUAGE_ID`,`TF`,`PS`,`SEARCH_CONTENT_ID`),
  KEY `IND_B_SEARCH_CONTENT_STEM` (`SEARCH_CONTENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1;

-- Дамп данных таблицы bitrix2.b_search_content_stem: ~138 rows (приблизительно)
DELETE FROM `b_search_content_stem`;
/*!40000 ALTER TABLE `b_search_content_stem` DISABLE KEYS */;
INSERT INTO `b_search_content_stem` (`SEARCH_CONTENT_ID`, `LANGUAGE_ID`, `STEM`, `TF`, `PS`) VALUES
	(4, 'ru', 3, 0.1315, 262),
	(5, 'ru', 4, 0.2314, 1),
	(5, 'ru', 5, 0.2314, 3),
	(4, 'ru', 5, 0.2629, 41),
	(5, 'ru', 6, 0.2314, 4),
	(5, 'ru', 7, 0.2314, 5),
	(5, 'ru', 8, 0.2314, 6),
	(4, 'ru', 9, 0.2083, 244),
	(6, 'ru', 9, 0.2314, 1),
	(11, 'ru', 9, 0.2314, 1),
	(4, 'ru', 10, 0.1315, 242),
	(6, 'ru', 10, 0.2314, 2),
	(6, 'ru', 11, 0.2314, 3),
	(6, 'ru', 12, 0.2314, 5),
	(6, 'ru', 13, 0.2314, 6),
	(6, 'ru', 14, 0.2314, 7),
	(4, 'ru', 15, 0.1315, 246),
	(6, 'ru', 15, 0.2314, 8),
	(6, 'ru', 16, 0.2314, 9),
	(6, 'ru', 17, 0.2314, 11),
	(11, 'ru', 18, 0.2314, 2),
	(11, 'ru', 19, 0.2314, 3),
	(12, 'ru', 19, 0.2314, 6),
	(11, 'ru', 20, 0.2314, 4),
	(11, 'ru', 21, 0.2314, 5),
	(12, 'ru', 22, 0.2314, 4),
	(11, 'ru', 22, 0.2314, 6),
	(13, 'ru', 22, 0.2314, 10),
	(4, 'ru', 22, 0.2629, 37),
	(12, 'ru', 23, 0.2314, 1),
	(12, 'ru', 24, 0.2314, 2),
	(12, 'ru', 25, 0.2314, 3),
	(13, 'ru', 26, 0.2314, 1),
	(13, 'ru', 27, 0.2314, 7),
	(13, 'ru', 28, 0.2314, 8),
	(4, 'ru', 29, 0.2083, 64.5),
	(13, 'ru', 29, 0.2314, 9),
	(4, 'ru', 30, 0.2083, 258.5),
	(4, 'ru', 31, 0.1315, 259),
	(4, 'ru', 32, 0.1315, 264),
	(14, 'ru', 35, 0.2314, 8),
	(14, 'ru', 36, 0.2314, 9),
	(14, 'ru', 37, 0.2314, 15),
	(14, 'ru', 38, 0.2314, 23),
	(14, 'ru', 39, 0.2314, 24),
	(15, 'ru', 40, 0.2314, 2),
	(15, 'ru', 41, 0.3667, 4.5),
	(15, 'ru', 42, 0.2314, 5),
	(15, 'ru', 43, 0.2314, 8),
	(16, 'ru', 44, 0.2314, 3),
	(16, 'ru', 45, 0.2314, 4),
	(18, 'ru', 46, 0.2314, 2),
	(18, 'ru', 47, 0.2314, 3),
	(4, 'ru', 48, 0.1315, 1),
	(4, 'ru', 49, 0.1315, 2),
	(4, 'ru', 50, 0.1315, 3),
	(4, 'ru', 51, 0.3052, 20.5),
	(4, 'ru', 52, 0.3052, 21.5),
	(4, 'ru', 53, 0.3052, 22.5),
	(4, 'ru', 54, 0.4713, 51.1818),
	(4, 'ru', 55, 0.3052, 24.5),
	(4, 'ru', 56, 0.3052, 25.5),
	(4, 'ru', 57, 0.4167, 25.5),
	(4, 'ru', 58, 0.2629, 32),
	(4, 'ru', 59, 0.2629, 34),
	(4, 'ru', 60, 0.2629, 35),
	(4, 'ru', 61, 0.2629, 39),
	(4, 'ru', 63, 0.1315, 247),
	(4, 'ru', 67, 0.2083, 65.5),
	(4, 'ru', 68, 0.1315, 60),
	(4, 'ru', 69, 0.2083, 62),
	(4, 'ru', 70, 0.1315, 62),
	(4, 'ru', 71, 0.1315, 64),
	(4, 'ru', 72, 0.1315, 66),
	(4, 'ru', 73, 0.1315, 67),
	(4, 'ru', 74, 0.1315, 68),
	(4, 'ru', 75, 0.1315, 70),
	(4, 'ru', 76, 0.2083, 115),
	(4, 'ru', 77, 0.2083, 116),
	(4, 'ru', 78, 0.3052, 128),
	(4, 'ru', 79, 0.3052, 129),
	(4, 'ru', 80, 0.3052, 130),
	(4, 'ru', 81, 0.2083, 120),
	(4, 'ru', 82, 0.2083, 121),
	(4, 'ru', 83, 0.2083, 122),
	(4, 'ru', 84, 0.2083, 128),
	(4, 'ru', 85, 0.2083, 129),
	(4, 'ru', 86, 0.2083, 130),
	(4, 'ru', 87, 0.2083, 131),
	(4, 'ru', 88, 0.3052, 145),
	(4, 'ru', 89, 0.2083, 138),
	(4, 'ru', 90, 0.2083, 142),
	(4, 'ru', 91, 0.2083, 143),
	(4, 'ru', 92, 0.3052, 155),
	(4, 'ru', 93, 0.2083, 145),
	(4, 'ru', 94, 0.2083, 146),
	(4, 'ru', 95, 0.2083, 147),
	(4, 'ru', 96, 0.2083, 154),
	(4, 'ru', 97, 0.2083, 155),
	(4, 'ru', 98, 0.2083, 156),
	(4, 'ru', 99, 0.2083, 162),
	(4, 'ru', 100, 0.2083, 163),
	(4, 'ru', 101, 0.2083, 164),
	(4, 'ru', 102, 0.2083, 165),
	(4, 'ru', 103, 0.2083, 167),
	(4, 'ru', 104, 0.2083, 168),
	(4, 'ru', 105, 0.2083, 169),
	(4, 'ru', 106, 0.2083, 170),
	(4, 'ru', 107, 0.2083, 171),
	(4, 'ru', 108, 0.2083, 172),
	(4, 'ru', 109, 0.2083, 173),
	(4, 'ru', 110, 0.2083, 179),
	(4, 'ru', 111, 0.2083, 180),
	(4, 'ru', 112, 0.2083, 181),
	(4, 'ru', 113, 0.2083, 182),
	(4, 'ru', 114, 0.2083, 183),
	(4, 'ru', 115, 0.2083, 184),
	(4, 'ru', 116, 0.2083, 185),
	(4, 'ru', 117, 0.2083, 186),
	(4, 'ru', 118, 0.2083, 187),
	(4, 'ru', 119, 0.2083, 188),
	(4, 'ru', 120, 0.2083, 189),
	(4, 'ru', 121, 0.2083, 190),
	(4, 'ru', 122, 0.2083, 191),
	(4, 'ru', 123, 0.2083, 192),
	(4, 'ru', 124, 0.2083, 193),
	(4, 'ru', 125, 0.1315, 241),
	(4, 'ru', 126, 0.1315, 244),
	(4, 'ru', 127, 0.1315, 250),
	(4, 'ru', 128, 0.1315, 251),
	(7, 'ru', 135, 0.2314, 1),
	(8, 'ru', 136, 0.2314, 1),
	(9, 'ru', 137, 0.2314, 1),
	(10, 'ru', 138, 0.2314, 1),
	(18, 'ru', 142, 0.2314, 1),
	(16, 'ru', 143, 0.2314, 1),
	(15, 'ru', 144, 0.2314, 1),
	(14, 'ru', 145, 0.2314, 1);
/*!40000 ALTER TABLE `b_search_content_stem` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_search_content_text
DROP TABLE IF EXISTS `b_search_content_text`;
CREATE TABLE IF NOT EXISTS `b_search_content_text` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `SEARCH_CONTENT_MD5` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `SEARCHABLE_CONTENT` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SEARCH_CONTENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_search_content_text: ~14 rows (приблизительно)
DELETE FROM `b_search_content_text`;
/*!40000 ALTER TABLE `b_search_content_text` DISABLE KEYS */;
INSERT INTO `b_search_content_text` (`SEARCH_CONTENT_ID`, `SEARCH_CONTENT_MD5`, `SEARCHABLE_CONTENT`) VALUES
	(4, '73b8648f54483a0b5ebab50599337047', '1С-БИТРИКС: УПРАВЛЕНИЕ САЙТОМ\r\nУСТАНОВКА НАТЯЖНЫХ ПОТОЛКОВ И ОСВЕТИТЕЛЬНЫХ ПРИБОРОВ\rУСТАНОВКА\rНАТЯЖНЫХ ПОТОЛКОВ\rИ ОСВЕТИТЕЛЬНЫХ ПРИБОРОВ\nСТАБИЛЬНО И КАЧЕСТВЕННО\rВЫПОЛНЯЕМ СВОЮ РАБОТУ НА ПРОТЯЖЕНИИ 8 ЛЕТ\nУСТАНОВКА\rНАТЯЖНЫХ ПОТОЛКОВ\rИ ОСВЕТИТЕЛЬНЫХ ПРИБОРОВ\nСТАБИЛЬНО И КАЧЕСТВЕННО\rВЫПОЛНЯЕМ СВОЮ РАБОТУ НА ПРОТЯЖЕНИИ 8 ЛЕТ\nУСТАНОВКА\rНАТЯЖНЫХ ПОТОЛКОВ\rИ ОСВЕТИТЕЛЬНЫХ ПРИБОРОВ\nСТАБИЛЬНО И КАЧЕСТВЕННО\rВЫПОЛНЯЕМ СВОЮ РАБОТУ НА ПРОТЯЖЕНИИ 8 ЛЕТ\nНАШИ\rПРОЕКТЫ\nГЛЯНЦЕВЫЕ ФАКТУРЫ\nМАТОВЫЕ ФАКТУРЫ\nМНОГОУРОВНЕВЫЕ ПОТОЛКИ\nСКРЫТАЯ ПОДСВЕТКА\nТКАНЕВЫЕ ПОТОЛКИ\nФОТОПЕЧАТЬ\nНАШИ\rПРОЕКТЫ\nLOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT. AENEAN EUISMOD BIBENDUM LAOREET. PROIN\nGRAVIDA DOLOR SIT AMET LACUS ACCUMSAN ET VIVERRA JUSTO COMMODO. PROIN SODALES PULVINAR TEMPOR.\nCUM SOCIIS NATOQUE PENATIBUS ET MAGNIS DIS PARTURIENT MONTES, NASCETUR RIDICULUS MUS. NAM\nFERMENTUM, NULLA LUCTUS PHARETRA VULPUTATE, FELIS TELLUS MOLLIS ORCI, SED RHONCUS SAPIEN NUNC\nEGET.\nLOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT. AENEAN EUISMOD BIBENDUM LAOREET. PROIN\nGRAVIDA DOLOR SIT AMET LACUS ACCUMSAN ET VIVERRA JUSTO COMMODO. PROIN SODALES PULVINAR TEMPOR.\nCUM SOCIIS NATOQUE PENATIBUS ET MAGNIS DIS PARTURIENT MONTES, NASCETUR RIDICULUS MUS. NAM\nFERMENTUM, NULLA LUCTUS PHARETRA VULPUTATE, FELIS TELLUS MOLLIS ORCI, SED RHONCUS SAPIEN NUNC\nEGET.\nЗАКАЖИТЕ ЗАМЕР БЕСПЛАТНО\nПОЛУЧИТЕ БЕСПЛАТНЫЙ РАСЧЕТ СТОИМОСТИ СВОЕГО ПОТОЛКА ПРЯМО СЕЙЧАС!\nОТЗЫВЫ\rИ БЛАГОДАРНОСТИ\nОТЗЫВЫ О НАС НА ФЛАМПЕ\r\n'),
	(5, 'a478156a7f37b19b29eb6ce86f38e6e3', 'БОЛЕЕ 7 ЛЕТ\r\nРАБОТАЕМ ОДНИМ СОСТАВОМ\r\n'),
	(6, '1a7e54b3f8e7f128e78d67b00bdbd889', 'БЕСПЛАТНЫЙ ЗАМЕР\r\nВЫЕЗД В ДЕНЬ ОБРАЩЕНИЯ, ПРОИЗВОДИМ РАСЧЕТ СРАЗУ НА МЕСТЕ\r\n'),
	(7, '6661ef01349da850c3e7109097c238cf', 'БЛАГОДАРНОСТЬ1\r\n\r\n'),
	(8, '7d63ee721b44b201a968430c0c0d8277', 'БЛАГОДАРНОСТЬ2\r\n\r\n'),
	(9, '69f9cc676dd87376da74f6047ad2a8b3', 'БЛАГОДАРНОСТЬ3\r\n\r\n'),
	(10, '4844d9d04f3c94f569a13f6423c2625f', 'БЛАГОДАРНОСТЬ4\r\n\r\n'),
	(11, '9584def4e3467d813cdfeadb8fbe842b', 'БЕСПЛАТНО\r\nСЕРВИСНОЕ ОБСЛУЖИВАНИЕ ВСЕХ ВЫПОЛНЕННЫХ РАБОТ\r\n'),
	(12, 'ff685e2cf29585bcd5724bb703a5f062', 'ВЫСОКОЕ КАЧЕСТВО\r\nМОНТАЖНЫХ РАБОТ\r\nИ ОБСЛУЖИВАНИЯ\r\n'),
	(13, '899299f1e0adb6868d81c9f341f66f6a', 'ГОС. ЗАКАЗЧИКИ\r\nДОВОЛЬНЫ НАШЕЙ РАБОТОЙ\r\n'),
	(14, '43a5010672bdf5c3ded24f3d43e395e5', 'ADRESS\r\nГ. НОВОСИБИРСК, УЛ. ЛЕНИНА, Д.1, \r\nОФИС 100\r\n'),
	(15, '1a3af696d71eb98a6d78d8fdb9f3eb77', 'SCHEDULE\r\n10:00 - 20:00, \r\nБЕЗ ВЫХОДНЫХ\r\n'),
	(16, '40fb2a4922e4748d1b36d918fdd236c0', 'PHONE\r\n8 (383) 000-00-00\r\n'),
	(18, 'b19715e3024efaccc8a05e997bb364c9', 'EMAIL\r\nAMPIR_NSK@MAIL.RU\r\n');
/*!40000 ALTER TABLE `b_search_content_text` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_search_content_title
DROP TABLE IF EXISTS `b_search_content_title`;
CREATE TABLE IF NOT EXISTS `b_search_content_title` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `POS` int(11) NOT NULL,
  `WORD` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `UX_B_SEARCH_CONTENT_TITLE` (`SITE_ID`,`WORD`,`SEARCH_CONTENT_ID`,`POS`),
  KEY `IND_B_SEARCH_CONTENT_TITLE` (`SEARCH_CONTENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1;

-- Дамп данных таблицы bitrix2.b_search_content_title: ~21 rows (приблизительно)
DELETE FROM `b_search_content_title`;
/*!40000 ALTER TABLE `b_search_content_title` DISABLE KEYS */;
INSERT INTO `b_search_content_title` (`SEARCH_CONTENT_ID`, `SITE_ID`, `POS`, `WORD`) VALUES
	(4, 's1', 0, '1С-БИТРИКС'),
	(5, 's1', 6, '7'),
	(14, 's1', 0, 'ADRESS'),
	(18, 's1', 0, 'EMAIL'),
	(16, 's1', 0, 'PHONE'),
	(15, 's1', 0, 'SCHEDULE'),
	(11, 's1', 0, 'БЕСПЛАТНО'),
	(6, 's1', 0, 'БЕСПЛАТНЫЙ'),
	(7, 's1', 0, 'БЛАГОДАРНОСТЬ1'),
	(8, 's1', 0, 'БЛАГОДАРНОСТЬ2'),
	(9, 's1', 0, 'БЛАГОДАРНОСТЬ3'),
	(10, 's1', 0, 'БЛАГОДАРНОСТЬ4'),
	(5, 's1', 0, 'БОЛЕЕ'),
	(12, 's1', 0, 'ВЫСОКОЕ'),
	(13, 's1', 0, 'ГОС'),
	(13, 's1', 5, 'ЗАКАЗЧИКИ'),
	(6, 's1', 11, 'ЗАМЕР'),
	(12, 's1', 8, 'КАЧЕСТВО'),
	(5, 's1', 8, 'ЛЕТ'),
	(4, 's1', 23, 'САЙТОМ'),
	(4, 's1', 12, 'УПРАВЛЕНИЕ');
/*!40000 ALTER TABLE `b_search_content_title` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_search_custom_rank
DROP TABLE IF EXISTS `b_search_custom_rank`;
CREATE TABLE IF NOT EXISTS `b_search_custom_rank` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `APPLIED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `RANK` int(11) NOT NULL DEFAULT 0,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `PARAM1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `PARAM2` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `ITEM_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IND_B_SEARCH_CUSTOM_RANK` (`SITE_ID`,`MODULE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_search_custom_rank: ~0 rows (приблизительно)
DELETE FROM `b_search_custom_rank`;
/*!40000 ALTER TABLE `b_search_custom_rank` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_search_custom_rank` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_search_phrase
DROP TABLE IF EXISTS `b_search_phrase`;
CREATE TABLE IF NOT EXISTS `b_search_phrase` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `RESULT_COUNT` int(11) NOT NULL,
  `PAGES` int(11) NOT NULL,
  `SESSION_ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `PHRASE` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAGS` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL_TO` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL_TO_404` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL_TO_SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STAT_SESS_ID` int(18) DEFAULT NULL,
  `EVENT1` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IND_PK_B_SEARCH_PHRASE_SESS_PH` (`SESSION_ID`,`PHRASE`(50)),
  KEY `IND_PK_B_SEARCH_PHRASE_SESS_TG` (`SESSION_ID`,`TAGS`(50)),
  KEY `IND_PK_B_SEARCH_PHRASE_TIME` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_search_phrase: ~0 rows (приблизительно)
DELETE FROM `b_search_phrase`;
/*!40000 ALTER TABLE `b_search_phrase` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_search_phrase` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_search_stem
DROP TABLE IF EXISTS `b_search_stem`;
CREATE TABLE IF NOT EXISTS `b_search_stem` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `STEM` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_B_SEARCH_STEM` (`STEM`)
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_search_stem: ~145 rows (приблизительно)
DELETE FROM `b_search_stem`;
/*!40000 ALTER TABLE `b_search_stem` DISABLE KEYS */;
INSERT INTO `b_search_stem` (`ID`, `STEM`) VALUES
	(41, '00'),
	(45, '000-00-00'),
	(40, '10'),
	(39, '100'),
	(48, '1С-БИТРИКС'),
	(42, '20'),
	(44, '383'),
	(91, 'ACCUMSAN'),
	(82, 'ADIPISCING'),
	(145, 'ADRESS'),
	(84, 'AENEAN'),
	(80, 'AMET'),
	(46, 'AMPIR_NSK'),
	(86, 'BIBENDUM'),
	(141, 'BR'),
	(95, 'COMMODO'),
	(81, 'CONSECTETUR'),
	(99, 'CUM'),
	(104, 'DIS'),
	(78, 'DOLOR'),
	(124, 'EGET'),
	(83, 'ELIT'),
	(142, 'EMAIL'),
	(92, 'ET'),
	(85, 'EUISMOD'),
	(116, 'FELIS'),
	(111, 'FERMENTUM'),
	(89, 'GRAVIDA'),
	(139, 'HREF'),
	(77, 'IPSUM'),
	(94, 'JUSTO'),
	(90, 'LACUS'),
	(87, 'LAOREET'),
	(76, 'LOREM'),
	(113, 'LUCTUS'),
	(103, 'MAGNIS'),
	(47, 'MAIL'),
	(140, 'MAILTO'),
	(118, 'MOLLIS'),
	(106, 'MONTES'),
	(109, 'MUS'),
	(110, 'NAM'),
	(107, 'NASCETUR'),
	(101, 'NATOQUE'),
	(112, 'NULLA'),
	(123, 'NUNC'),
	(119, 'ORCI'),
	(105, 'PARTURIENT'),
	(102, 'PENATIBUS'),
	(114, 'PHARETRA'),
	(143, 'PHONE'),
	(88, 'PROIN'),
	(97, 'PULVINAR'),
	(121, 'RHONCUS'),
	(108, 'RIDICULUS'),
	(122, 'SAPIEN'),
	(144, 'SCHEDULE'),
	(120, 'SED'),
	(79, 'SIT'),
	(100, 'SOCIIS'),
	(96, 'SODALES'),
	(117, 'TELLUS'),
	(98, 'TEMPOR'),
	(93, 'VIVERRA'),
	(115, 'VULPUTATE'),
	(9, 'БЕСПЛАТН'),
	(31, 'БЛАГОДАРН'),
	(135, 'БЛАГОДАРНОСТЬ1'),
	(136, 'БЛАГОДАРНОСТЬ2'),
	(137, 'БЛАГОДАРНОСТЬ3'),
	(138, 'БЛАГОДАРНОСТЬ4'),
	(132, 'БЛИЖАЙШ'),
	(4, 'БОЛ'),
	(129, 'ВВЕД'),
	(133, 'ВРЕМ'),
	(20, 'ВСЕХ'),
	(2, 'ВЫБИРА'),
	(11, 'ВЫЕЗД'),
	(21, 'ВЫПОЛНЕН'),
	(60, 'ВЫПОЛНЯ'),
	(23, 'ВЫСОК'),
	(43, 'ВЫХОДН'),
	(68, 'ГЛЯНЦЕВ'),
	(26, 'ГОС'),
	(130, 'ДАН'),
	(12, 'ДЕН'),
	(28, 'ДОВОЛЬН'),
	(125, 'ЗАКАЖ'),
	(134, 'ЗАКАЗА'),
	(27, 'ЗАКАЗЧИК'),
	(10, 'ЗАМЕР'),
	(64, 'ЗАПОЛН'),
	(34, 'ИНФОРМАЦ'),
	(24, 'КАЧЕСТВ'),
	(59, 'КАЧЕСТВЕН'),
	(33, 'КОНТАКТН'),
	(37, 'ЛЕНИН'),
	(5, 'ЛЕТ'),
	(70, 'МАТОВ'),
	(17, 'МЕСТ'),
	(71, 'МНОГОУРОВНЕВ'),
	(25, 'МОНТАЖН'),
	(3, 'НАС'),
	(52, 'НАТЯЖН'),
	(29, 'НАШ'),
	(35, 'НОВОСИБИРСК'),
	(13, 'ОБРАЩЕН'),
	(19, 'ОБСЛУЖИВАН'),
	(7, 'ОДН'),
	(55, 'ОСВЕТИТЕЛЬН'),
	(30, 'ОТЗЫВ'),
	(38, 'ОФИС'),
	(131, 'ПЕРЕЗВОН'),
	(73, 'ПОДСВЕТК'),
	(65, 'ПОЛ'),
	(126, 'ПОЛУЧ'),
	(54, 'ПОТОЛК'),
	(53, 'ПОТОЛКОВ'),
	(1, 'ПОЧ'),
	(57, 'ПРИБОР'),
	(56, 'ПРИБОРОВ'),
	(67, 'ПРОЕКТ'),
	(14, 'ПРОИЗВОД'),
	(61, 'ПРОТЯЖЕН'),
	(127, 'ПРЯМ'),
	(22, 'РАБОТ'),
	(6, 'РАБОТА'),
	(66, 'РАССЧИТА'),
	(15, 'РАСЧЕТ'),
	(50, 'САЙТ'),
	(128, 'СЕЙЧАС'),
	(18, 'СЕРВИСН'),
	(72, 'СКРЫТ'),
	(8, 'СОСТАВ'),
	(16, 'СРАЗ'),
	(58, 'СТАБИЛЬН'),
	(63, 'СТОИМОСТ'),
	(74, 'ТКАНЕВ'),
	(62, 'УЗНА'),
	(36, 'УЛ'),
	(49, 'УПРАВЛЕН'),
	(51, 'УСТАНОВК'),
	(69, 'ФАКТУР'),
	(32, 'ФЛАМП'),
	(75, 'ФОТОПЕЧА');
/*!40000 ALTER TABLE `b_search_stem` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_search_suggest
DROP TABLE IF EXISTS `b_search_suggest`;
CREATE TABLE IF NOT EXISTS `b_search_suggest` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `FILTER_MD5` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `PHRASE` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `RATE` float NOT NULL,
  `TIMESTAMP_X` datetime NOT NULL,
  `RESULT_COUNT` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IND_B_SEARCH_SUGGEST` (`FILTER_MD5`,`PHRASE`(50),`RATE`),
  KEY `IND_B_SEARCH_SUGGEST_PHRASE` (`PHRASE`(50),`RATE`),
  KEY `IND_B_SEARCH_SUGGEST_TIME` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_search_suggest: ~0 rows (приблизительно)
DELETE FROM `b_search_suggest`;
/*!40000 ALTER TABLE `b_search_suggest` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_search_suggest` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_search_tags
DROP TABLE IF EXISTS `b_search_tags`;
CREATE TABLE IF NOT EXISTS `b_search_tags` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`SEARCH_CONTENT_ID`,`SITE_ID`,`NAME`),
  KEY `IX_B_SEARCH_TAGS_0` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1;

-- Дамп данных таблицы bitrix2.b_search_tags: ~0 rows (приблизительно)
DELETE FROM `b_search_tags`;
/*!40000 ALTER TABLE `b_search_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_search_tags` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_search_user_right
DROP TABLE IF EXISTS `b_search_user_right`;
CREATE TABLE IF NOT EXISTS `b_search_user_right` (
  `USER_ID` int(11) NOT NULL,
  `GROUP_CODE` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `UX_B_SEARCH_USER_RIGHT` (`USER_ID`,`GROUP_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_search_user_right: ~0 rows (приблизительно)
DELETE FROM `b_search_user_right`;
/*!40000 ALTER TABLE `b_search_user_right` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_search_user_right` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_security_sitecheck
DROP TABLE IF EXISTS `b_security_sitecheck`;
CREATE TABLE IF NOT EXISTS `b_security_sitecheck` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TEST_DATE` datetime DEFAULT NULL,
  `RESULTS` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_security_sitecheck: ~0 rows (приблизительно)
DELETE FROM `b_security_sitecheck`;
/*!40000 ALTER TABLE `b_security_sitecheck` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_security_sitecheck` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_sec_filter_mask
DROP TABLE IF EXISTS `b_sec_filter_mask`;
CREATE TABLE IF NOT EXISTS `b_sec_filter_mask` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SORT` int(11) NOT NULL DEFAULT 10,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILTER_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIKE_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREG_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_sec_filter_mask: ~0 rows (приблизительно)
DELETE FROM `b_sec_filter_mask`;
/*!40000 ALTER TABLE `b_sec_filter_mask` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_filter_mask` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_sec_frame_mask
DROP TABLE IF EXISTS `b_sec_frame_mask`;
CREATE TABLE IF NOT EXISTS `b_sec_frame_mask` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SORT` int(11) NOT NULL DEFAULT 10,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FRAME_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIKE_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREG_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_sec_frame_mask: ~0 rows (приблизительно)
DELETE FROM `b_sec_frame_mask`;
/*!40000 ALTER TABLE `b_sec_frame_mask` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_frame_mask` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_sec_iprule
DROP TABLE IF EXISTS `b_sec_iprule`;
CREATE TABLE IF NOT EXISTS `b_sec_iprule` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RULE_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'M',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ADMIN_SECTION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT 500,
  `ACTIVE_FROM` datetime DEFAULT NULL,
  `ACTIVE_FROM_TIMESTAMP` int(11) DEFAULT NULL,
  `ACTIVE_TO` datetime DEFAULT NULL,
  `ACTIVE_TO_TIMESTAMP` int(11) DEFAULT NULL,
  `NAME` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_sec_iprule_active_to` (`ACTIVE_TO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_sec_iprule: ~0 rows (приблизительно)
DELETE FROM `b_sec_iprule`;
/*!40000 ALTER TABLE `b_sec_iprule` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_iprule` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_sec_iprule_excl_ip
DROP TABLE IF EXISTS `b_sec_iprule_excl_ip`;
CREATE TABLE IF NOT EXISTS `b_sec_iprule_excl_ip` (
  `IPRULE_ID` int(11) NOT NULL,
  `RULE_IP` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT 500,
  `IP_START` bigint(18) DEFAULT NULL,
  `IP_END` bigint(18) DEFAULT NULL,
  PRIMARY KEY (`IPRULE_ID`,`RULE_IP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_sec_iprule_excl_ip: ~0 rows (приблизительно)
DELETE FROM `b_sec_iprule_excl_ip`;
/*!40000 ALTER TABLE `b_sec_iprule_excl_ip` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_iprule_excl_ip` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_sec_iprule_excl_mask
DROP TABLE IF EXISTS `b_sec_iprule_excl_mask`;
CREATE TABLE IF NOT EXISTS `b_sec_iprule_excl_mask` (
  `IPRULE_ID` int(11) NOT NULL,
  `RULE_MASK` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT 500,
  `LIKE_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREG_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`IPRULE_ID`,`RULE_MASK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_sec_iprule_excl_mask: ~0 rows (приблизительно)
DELETE FROM `b_sec_iprule_excl_mask`;
/*!40000 ALTER TABLE `b_sec_iprule_excl_mask` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_iprule_excl_mask` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_sec_iprule_incl_ip
DROP TABLE IF EXISTS `b_sec_iprule_incl_ip`;
CREATE TABLE IF NOT EXISTS `b_sec_iprule_incl_ip` (
  `IPRULE_ID` int(11) NOT NULL,
  `RULE_IP` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT 500,
  `IP_START` bigint(18) DEFAULT NULL,
  `IP_END` bigint(18) DEFAULT NULL,
  PRIMARY KEY (`IPRULE_ID`,`RULE_IP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_sec_iprule_incl_ip: ~0 rows (приблизительно)
DELETE FROM `b_sec_iprule_incl_ip`;
/*!40000 ALTER TABLE `b_sec_iprule_incl_ip` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_iprule_incl_ip` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_sec_iprule_incl_mask
DROP TABLE IF EXISTS `b_sec_iprule_incl_mask`;
CREATE TABLE IF NOT EXISTS `b_sec_iprule_incl_mask` (
  `IPRULE_ID` int(11) NOT NULL,
  `RULE_MASK` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT 500,
  `LIKE_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREG_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`IPRULE_ID`,`RULE_MASK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_sec_iprule_incl_mask: ~0 rows (приблизительно)
DELETE FROM `b_sec_iprule_incl_mask`;
/*!40000 ALTER TABLE `b_sec_iprule_incl_mask` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_iprule_incl_mask` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_sec_recovery_codes
DROP TABLE IF EXISTS `b_sec_recovery_codes`;
CREATE TABLE IF NOT EXISTS `b_sec_recovery_codes` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `USED` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `USING_DATE` datetime DEFAULT NULL,
  `USING_IP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_sec_recovery_codes_user_id` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_sec_recovery_codes: ~0 rows (приблизительно)
DELETE FROM `b_sec_recovery_codes`;
/*!40000 ALTER TABLE `b_sec_recovery_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_recovery_codes` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_sec_redirect_url
DROP TABLE IF EXISTS `b_sec_redirect_url`;
CREATE TABLE IF NOT EXISTS `b_sec_redirect_url` (
  `IS_SYSTEM` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT 500,
  `URL` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `PARAMETER_NAME` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_sec_redirect_url: ~3 rows (приблизительно)
DELETE FROM `b_sec_redirect_url`;
/*!40000 ALTER TABLE `b_sec_redirect_url` DISABLE KEYS */;
INSERT INTO `b_sec_redirect_url` (`IS_SYSTEM`, `SORT`, `URL`, `PARAMETER_NAME`) VALUES
	('Y', 10, '/bitrix/redirect.php', 'goto'),
	('Y', 20, '/bitrix/rk.php', 'goto'),
	('Y', 30, '/bitrix/click.php', 'goto');
/*!40000 ALTER TABLE `b_sec_redirect_url` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_sec_session
DROP TABLE IF EXISTS `b_sec_session`;
CREATE TABLE IF NOT EXISTS `b_sec_session` (
  `SESSION_ID` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `SESSION_DATA` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SESSION_ID`),
  KEY `ix_b_sec_session_time` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_sec_session: ~0 rows (приблизительно)
DELETE FROM `b_sec_session`;
/*!40000 ALTER TABLE `b_sec_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_session` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_sec_user
DROP TABLE IF EXISTS `b_sec_user`;
CREATE TABLE IF NOT EXISTS `b_sec_user` (
  `USER_ID` int(11) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SECRET` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TYPE` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `PARAMS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `ATTEMPTS` int(18) DEFAULT NULL,
  `INITIAL_DATE` datetime DEFAULT NULL,
  `SKIP_MANDATORY` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DEACTIVATE_UNTIL` datetime DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_sec_user: ~0 rows (приблизительно)
DELETE FROM `b_sec_user`;
/*!40000 ALTER TABLE `b_sec_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_user` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_sec_virus
DROP TABLE IF EXISTS `b_sec_virus`;
CREATE TABLE IF NOT EXISTS `b_sec_virus` (
  `ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `TIMESTAMP_X` datetime NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SENT` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `INFO` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_sec_virus: ~0 rows (приблизительно)
DELETE FROM `b_sec_virus`;
/*!40000 ALTER TABLE `b_sec_virus` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_virus` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_sec_white_list
DROP TABLE IF EXISTS `b_sec_white_list`;
CREATE TABLE IF NOT EXISTS `b_sec_white_list` (
  `ID` int(11) NOT NULL,
  `WHITE_SUBSTR` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_sec_white_list: ~0 rows (приблизительно)
DELETE FROM `b_sec_white_list`;
/*!40000 ALTER TABLE `b_sec_white_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_white_list` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_seo_adv_autolog
DROP TABLE IF EXISTS `b_seo_adv_autolog`;
CREATE TABLE IF NOT EXISTS `b_seo_adv_autolog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `CAMPAIGN_ID` int(11) NOT NULL,
  `CAMPAIGN_XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `BANNER_ID` int(11) NOT NULL,
  `BANNER_XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CAUSE_CODE` int(11) DEFAULT 0,
  `SUCCESS` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_adv_autolog1` (`ENGINE_ID`),
  KEY `ix_b_seo_adv_autolog2` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_seo_adv_autolog: ~0 rows (приблизительно)
DELETE FROM `b_seo_adv_autolog`;
/*!40000 ALTER TABLE `b_seo_adv_autolog` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_adv_autolog` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_seo_adv_banner
DROP TABLE IF EXISTS `b_seo_adv_banner`;
CREATE TABLE IF NOT EXISTS `b_seo_adv_banner` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `OWNER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SETTINGS` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `CAMPAIGN_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) DEFAULT NULL,
  `AUTO_QUANTITY_OFF` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `AUTO_QUANTITY_ON` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_banner` (`ENGINE_ID`,`XML_ID`),
  KEY `ix_b_seo_adv_banner1` (`CAMPAIGN_ID`),
  KEY `ix_b_seo_adv_banner2` (`AUTO_QUANTITY_OFF`,`AUTO_QUANTITY_ON`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_seo_adv_banner: ~0 rows (приблизительно)
DELETE FROM `b_seo_adv_banner`;
/*!40000 ALTER TABLE `b_seo_adv_banner` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_adv_banner` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_seo_adv_campaign
DROP TABLE IF EXISTS `b_seo_adv_campaign`;
CREATE TABLE IF NOT EXISTS `b_seo_adv_campaign` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `OWNER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `SETTINGS` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_campaign` (`ENGINE_ID`,`XML_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_seo_adv_campaign: ~0 rows (приблизительно)
DELETE FROM `b_seo_adv_campaign`;
/*!40000 ALTER TABLE `b_seo_adv_campaign` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_adv_campaign` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_seo_adv_group
DROP TABLE IF EXISTS `b_seo_adv_group`;
CREATE TABLE IF NOT EXISTS `b_seo_adv_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `OWNER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `CAMPAIGN_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_group` (`ENGINE_ID`,`XML_ID`),
  KEY `ix_b_seo_adv_group1` (`CAMPAIGN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_seo_adv_group: ~0 rows (приблизительно)
DELETE FROM `b_seo_adv_group`;
/*!40000 ALTER TABLE `b_seo_adv_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_adv_group` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_seo_adv_link
DROP TABLE IF EXISTS `b_seo_adv_link`;
CREATE TABLE IF NOT EXISTS `b_seo_adv_link` (
  `LINK_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `LINK_ID` int(18) NOT NULL,
  `BANNER_ID` int(11) NOT NULL,
  PRIMARY KEY (`LINK_TYPE`,`LINK_ID`,`BANNER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_seo_adv_link: ~0 rows (приблизительно)
DELETE FROM `b_seo_adv_link`;
/*!40000 ALTER TABLE `b_seo_adv_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_adv_link` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_seo_adv_log
DROP TABLE IF EXISTS `b_seo_adv_log`;
CREATE TABLE IF NOT EXISTS `b_seo_adv_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `REQUEST_URI` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `REQUEST_DATA` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `RESPONSE_TIME` float NOT NULL,
  `RESPONSE_STATUS` int(5) DEFAULT NULL,
  `RESPONSE_DATA` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_adv_log1` (`ENGINE_ID`),
  KEY `ix_b_seo_adv_log2` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_seo_adv_log: ~0 rows (приблизительно)
DELETE FROM `b_seo_adv_log`;
/*!40000 ALTER TABLE `b_seo_adv_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_adv_log` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_seo_adv_order
DROP TABLE IF EXISTS `b_seo_adv_order`;
CREATE TABLE IF NOT EXISTS `b_seo_adv_order` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `CAMPAIGN_ID` int(11) NOT NULL,
  `BANNER_ID` int(11) NOT NULL,
  `ORDER_ID` int(11) NOT NULL,
  `SUM` float DEFAULT 0,
  `PROCESSED` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_order` (`ENGINE_ID`,`CAMPAIGN_ID`,`BANNER_ID`,`ORDER_ID`),
  KEY `ix_b_seo_adv_order1` (`ORDER_ID`,`PROCESSED`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_seo_adv_order: ~0 rows (приблизительно)
DELETE FROM `b_seo_adv_order`;
/*!40000 ALTER TABLE `b_seo_adv_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_adv_order` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_seo_adv_region
DROP TABLE IF EXISTS `b_seo_adv_region`;
CREATE TABLE IF NOT EXISTS `b_seo_adv_region` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `OWNER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `PARENT_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_region` (`ENGINE_ID`,`XML_ID`),
  KEY `ix_b_seo_adv_region1` (`PARENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_seo_adv_region: ~0 rows (приблизительно)
DELETE FROM `b_seo_adv_region`;
/*!40000 ALTER TABLE `b_seo_adv_region` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_adv_region` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_seo_keywords
DROP TABLE IF EXISTS `b_seo_keywords`;
CREATE TABLE IF NOT EXISTS `b_seo_keywords` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `KEYWORDS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_keywords_url` (`URL`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_seo_keywords: ~0 rows (приблизительно)
DELETE FROM `b_seo_keywords`;
/*!40000 ALTER TABLE `b_seo_keywords` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_keywords` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_seo_search_engine
DROP TABLE IF EXISTS `b_seo_search_engine`;
CREATE TABLE IF NOT EXISTS `b_seo_search_engine` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `SORT` int(5) DEFAULT 100,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CLIENT_SECRET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REDIRECT_URI` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_search_engine_code` (`CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_seo_search_engine: ~3 rows (приблизительно)
DELETE FROM `b_seo_search_engine`;
/*!40000 ALTER TABLE `b_seo_search_engine` DISABLE KEYS */;
INSERT INTO `b_seo_search_engine` (`ID`, `CODE`, `ACTIVE`, `SORT`, `NAME`, `CLIENT_ID`, `CLIENT_SECRET`, `REDIRECT_URI`, `SETTINGS`) VALUES
	(1, 'google', 'Y', 200, 'Google', '868942902147-qrrd6ce1ajfkpse8ieq4gkpdeanvtnno.apps.googleusercontent.com', 'EItMlJpZLC2WRPKB6QsA5bV9', 'urn:ietf:wg:oauth:2.0:oob', NULL),
	(2, 'yandex', 'Y', 300, 'Yandex', 'f848c7bfc1d34a94ba6d05439f81bbd7', 'da0e73b2d9cc4e809f3170e49cb9df01', 'https://oauth.yandex.ru/verification_code', NULL),
	(3, 'yandex_direct', 'Y', 400, 'Yandex.Direct', '', '', 'https://oauth.yandex.ru/verification_code', NULL);
/*!40000 ALTER TABLE `b_seo_search_engine` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_seo_service_log
DROP TABLE IF EXISTS `b_seo_service_log`;
CREATE TABLE IF NOT EXISTS `b_seo_service_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime NOT NULL,
  `TYPE` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `GROUP_ID` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_seo_service_log: ~0 rows (приблизительно)
DELETE FROM `b_seo_service_log`;
/*!40000 ALTER TABLE `b_seo_service_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_service_log` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_seo_service_rtg_queue
DROP TABLE IF EXISTS `b_seo_service_rtg_queue`;
CREATE TABLE IF NOT EXISTS `b_seo_service_rtg_queue` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime DEFAULT NULL,
  `TYPE` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACCOUNT_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUDIENCE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `PARENT_ID` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTACT_TYPE` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTION` char(3) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_AUTO_REMOVE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_SEO_SRV_RTG_QUEUE_1` (`ACTION`,`DATE_AUTO_REMOVE`),
  KEY `IX_B_SEO_SRV_RTG_QUEUE_2` (`TYPE`,`ACTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_seo_service_rtg_queue: ~0 rows (приблизительно)
DELETE FROM `b_seo_service_rtg_queue`;
/*!40000 ALTER TABLE `b_seo_service_rtg_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_service_rtg_queue` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_seo_service_subscription
DROP TABLE IF EXISTS `b_seo_service_subscription`;
CREATE TABLE IF NOT EXISTS `b_seo_service_subscription` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime DEFAULT NULL,
  `TYPE` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `GROUP_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CALLBACK_SERVER_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HAS_AUTH` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `IX_B_SEO_SERVICE_SUB_1` (`TYPE`,`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_seo_service_subscription: ~0 rows (приблизительно)
DELETE FROM `b_seo_service_subscription`;
/*!40000 ALTER TABLE `b_seo_service_subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_service_subscription` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_seo_service_webhook
DROP TABLE IF EXISTS `b_seo_service_webhook`;
CREATE TABLE IF NOT EXISTS `b_seo_service_webhook` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime DEFAULT NULL,
  `TYPE` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `EXTERNAL_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SECURITY_CODE` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_SEO_SERVICE_WEBHOOK_1` (`TYPE`,`EXTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_seo_service_webhook: ~0 rows (приблизительно)
DELETE FROM `b_seo_service_webhook`;
/*!40000 ALTER TABLE `b_seo_service_webhook` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_service_webhook` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_seo_sitemap
DROP TABLE IF EXISTS `b_seo_sitemap`;
CREATE TABLE IF NOT EXISTS `b_seo_sitemap` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `DATE_RUN` datetime DEFAULT NULL,
  `SETTINGS` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_seo_sitemap: ~0 rows (приблизительно)
DELETE FROM `b_seo_sitemap`;
/*!40000 ALTER TABLE `b_seo_sitemap` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_sitemap` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_seo_sitemap_entity
DROP TABLE IF EXISTS `b_seo_sitemap_entity`;
CREATE TABLE IF NOT EXISTS `b_seo_sitemap_entity` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENTITY_TYPE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `SITEMAP_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_sitemap_entity_1` (`ENTITY_TYPE`,`ENTITY_ID`),
  KEY `ix_b_seo_sitemap_entity_2` (`SITEMAP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_seo_sitemap_entity: ~0 rows (приблизительно)
DELETE FROM `b_seo_sitemap_entity`;
/*!40000 ALTER TABLE `b_seo_sitemap_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_sitemap_entity` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_seo_sitemap_iblock
DROP TABLE IF EXISTS `b_seo_sitemap_iblock`;
CREATE TABLE IF NOT EXISTS `b_seo_sitemap_iblock` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_ID` int(11) NOT NULL,
  `SITEMAP_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_sitemap_iblock_1` (`IBLOCK_ID`),
  KEY `ix_b_seo_sitemap_iblock_2` (`SITEMAP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_seo_sitemap_iblock: ~0 rows (приблизительно)
DELETE FROM `b_seo_sitemap_iblock`;
/*!40000 ALTER TABLE `b_seo_sitemap_iblock` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_sitemap_iblock` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_seo_sitemap_runtime
DROP TABLE IF EXISTS `b_seo_sitemap_runtime`;
CREATE TABLE IF NOT EXISTS `b_seo_sitemap_runtime` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PID` int(11) NOT NULL,
  `PROCESSED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ITEM_PATH` varchar(700) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ITEM_ID` int(11) DEFAULT NULL,
  `ITEM_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'D',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `ACTIVE_ELEMENT` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  KEY `ix_seo_sitemap_runtime1` (`PID`,`PROCESSED`,`ITEM_TYPE`,`ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_seo_sitemap_runtime: ~0 rows (приблизительно)
DELETE FROM `b_seo_sitemap_runtime`;
/*!40000 ALTER TABLE `b_seo_sitemap_runtime` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_sitemap_runtime` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_seo_yandex_direct_stat
DROP TABLE IF EXISTS `b_seo_yandex_direct_stat`;
CREATE TABLE IF NOT EXISTS `b_seo_yandex_direct_stat` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CAMPAIGN_ID` int(11) NOT NULL,
  `BANNER_ID` int(11) NOT NULL,
  `DATE_DAY` date NOT NULL,
  `CURRENCY` char(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SUM` float DEFAULT 0,
  `SUM_SEARCH` float DEFAULT 0,
  `SUM_CONTEXT` float DEFAULT 0,
  `CLICKS` int(7) DEFAULT 0,
  `CLICKS_SEARCH` int(7) DEFAULT 0,
  `CLICKS_CONTEXT` int(7) DEFAULT 0,
  `SHOWS` int(7) DEFAULT 0,
  `SHOWS_SEARCH` int(7) DEFAULT 0,
  `SHOWS_CONTEXT` int(7) DEFAULT 0,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_seo_yandex_direct_stat` (`BANNER_ID`,`DATE_DAY`),
  KEY `ix_seo_yandex_direct_stat1` (`CAMPAIGN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_seo_yandex_direct_stat: ~0 rows (приблизительно)
DELETE FROM `b_seo_yandex_direct_stat`;
/*!40000 ALTER TABLE `b_seo_yandex_direct_stat` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_yandex_direct_stat` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_short_uri
DROP TABLE IF EXISTS `b_short_uri`;
CREATE TABLE IF NOT EXISTS `b_short_uri` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `URI` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `URI_CRC` int(18) NOT NULL,
  `SHORT_URI` varbinary(250) NOT NULL,
  `SHORT_URI_CRC` int(18) NOT NULL,
  `STATUS` int(18) NOT NULL DEFAULT 301,
  `MODIFIED` datetime NOT NULL,
  `LAST_USED` datetime DEFAULT NULL,
  `NUMBER_USED` int(18) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `ux_b_short_uri_1` (`SHORT_URI_CRC`),
  KEY `ux_b_short_uri_2` (`URI_CRC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_short_uri: ~0 rows (приблизительно)
DELETE FROM `b_short_uri`;
/*!40000 ALTER TABLE `b_short_uri` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_short_uri` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_site_template
DROP TABLE IF EXISTS `b_site_template`;
CREATE TABLE IF NOT EXISTS `b_site_template` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT 500,
  `TEMPLATE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_site_template_site` (`SITE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_site_template: ~1 rows (приблизительно)
DELETE FROM `b_site_template`;
/*!40000 ALTER TABLE `b_site_template` DISABLE KEYS */;
INSERT INTO `b_site_template` (`ID`, `SITE_ID`, `CONDITION`, `SORT`, `TEMPLATE`) VALUES
	(1, 's1', '', 1, 'main');
/*!40000 ALTER TABLE `b_site_template` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_smile
DROP TABLE IF EXISTS `b_smile`;
CREATE TABLE IF NOT EXISTS `b_smile` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `SET_ID` int(18) NOT NULL DEFAULT 0,
  `SORT` int(10) NOT NULL DEFAULT 150,
  `TYPING` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CLICKABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `HIDDEN` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IMAGE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `IMAGE_DEFINITION` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'SD',
  `IMAGE_WIDTH` int(11) NOT NULL DEFAULT 0,
  `IMAGE_HEIGHT` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_smile: ~24 rows (приблизительно)
DELETE FROM `b_smile`;
/*!40000 ALTER TABLE `b_smile` DISABLE KEYS */;
INSERT INTO `b_smile` (`ID`, `TYPE`, `SET_ID`, `SORT`, `TYPING`, `CLICKABLE`, `HIDDEN`, `IMAGE`, `IMAGE_DEFINITION`, `IMAGE_WIDTH`, `IMAGE_HEIGHT`) VALUES
	(1, 'S', 2, 100, ':) :-)', 'Y', 'N', 'bx_smile_smile.png', 'UHD', 20, 20),
	(2, 'S', 2, 105, ';) ;-)', 'Y', 'N', 'bx_smile_wink.png', 'UHD', 20, 20),
	(3, 'S', 2, 110, ':D :-D', 'Y', 'N', 'bx_smile_biggrin.png', 'UHD', 20, 20),
	(4, 'S', 2, 115, '8-)', 'Y', 'N', 'bx_smile_cool.png', 'UHD', 20, 20),
	(5, 'S', 2, 120, ':facepalm:', 'Y', 'N', 'bx_smile_facepalm.png', 'UHD', 20, 20),
	(6, 'S', 2, 125, ':{} :-{}', 'Y', 'N', 'bx_smile_kiss.png', 'UHD', 20, 20),
	(7, 'S', 2, 130, ':( :-(', 'Y', 'N', 'bx_smile_sad.png', 'UHD', 20, 20),
	(8, 'S', 2, 135, ':| :-|', 'Y', 'N', 'bx_smile_neutral.png', 'UHD', 20, 20),
	(9, 'S', 2, 140, ':oops:', 'Y', 'N', 'bx_smile_redface.png', 'UHD', 20, 20),
	(10, 'S', 2, 145, ':cry: :~(', 'Y', 'N', 'bx_smile_cry.png', 'UHD', 20, 20),
	(11, 'S', 2, 150, ':evil: >:-<', 'Y', 'N', 'bx_smile_evil.png', 'UHD', 20, 20),
	(12, 'S', 2, 155, ':o :-o :shock:', 'Y', 'N', 'bx_smile_eek.png', 'UHD', 20, 20),
	(13, 'S', 2, 160, ':/ :-/', 'Y', 'N', 'bx_smile_confuse.png', 'UHD', 20, 20),
	(14, 'S', 2, 165, ':idea:', 'Y', 'N', 'bx_smile_idea.png', 'UHD', 20, 20),
	(15, 'S', 2, 170, ':?:', 'Y', 'N', 'bx_smile_question.png', 'UHD', 20, 20),
	(16, 'S', 2, 175, ':!:', 'Y', 'N', 'bx_smile_exclaim.png', 'UHD', 20, 20),
	(17, 'S', 2, 180, ':like:', 'Y', 'N', 'bx_smile_like.png', 'UHD', 20, 20),
	(18, 'I', 2, 175, 'ICON_NOTE', 'Y', 'N', 'bx_icon_1.gif', 'SD', 15, 15),
	(19, 'I', 2, 180, 'ICON_DIRRECTION', 'Y', 'N', 'bx_icon_2.gif', 'SD', 15, 15),
	(20, 'I', 2, 185, 'ICON_IDEA', 'Y', 'N', 'bx_icon_3.gif', 'SD', 15, 15),
	(21, 'I', 2, 190, 'ICON_ATTANSION', 'Y', 'N', 'bx_icon_4.gif', 'SD', 15, 15),
	(22, 'I', 2, 195, 'ICON_QUESTION', 'Y', 'N', 'bx_icon_5.gif', 'SD', 15, 15),
	(23, 'I', 2, 200, 'ICON_BAD', 'Y', 'N', 'bx_icon_6.gif', 'SD', 15, 15),
	(24, 'I', 2, 205, 'ICON_GOOD', 'Y', 'N', 'bx_icon_7.gif', 'SD', 15, 15);
/*!40000 ALTER TABLE `b_smile` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_smile_lang
DROP TABLE IF EXISTS `b_smile_lang`;
CREATE TABLE IF NOT EXISTS `b_smile_lang` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `SID` int(11) NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_SMILE_SL` (`TYPE`,`SID`,`LID`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_smile_lang: ~38 rows (приблизительно)
DELETE FROM `b_smile_lang`;
/*!40000 ALTER TABLE `b_smile_lang` DISABLE KEYS */;
INSERT INTO `b_smile_lang` (`ID`, `TYPE`, `SID`, `LID`, `NAME`) VALUES
	(1, 'P', 1, 'ru', 'Стандартная галерея'),
	(2, 'P', 1, 'en', 'Standard gallery'),
	(3, 'G', 2, 'ru', 'Основной набор'),
	(4, 'G', 2, 'en', 'Default pack'),
	(5, 'S', 1, 'ru', 'С улыбкой'),
	(6, 'S', 1, 'en', 'Smile'),
	(7, 'S', 2, 'ru', 'Шутливо'),
	(8, 'S', 2, 'en', 'Wink'),
	(9, 'S', 3, 'ru', 'Широкая улыбка'),
	(10, 'S', 3, 'en', 'Big grin'),
	(11, 'S', 4, 'ru', 'Здорово'),
	(12, 'S', 4, 'en', 'Cool'),
	(13, 'S', 5, 'ru', 'Разочарование'),
	(14, 'S', 5, 'en', 'Facepalm'),
	(15, 'S', 6, 'ru', 'Поцелуй'),
	(16, 'S', 6, 'en', 'Kiss'),
	(17, 'S', 7, 'ru', 'Печально'),
	(18, 'S', 7, 'en', 'Sad'),
	(19, 'S', 8, 'ru', 'Скептически'),
	(20, 'S', 8, 'en', 'Skeptic'),
	(21, 'S', 9, 'ru', 'Смущенный'),
	(22, 'S', 9, 'en', 'Embarrassed'),
	(23, 'S', 10, 'ru', 'Очень грустно'),
	(24, 'S', 10, 'en', 'Crying'),
	(25, 'S', 11, 'ru', 'Со злостью'),
	(26, 'S', 11, 'en', 'Angry'),
	(27, 'S', 12, 'ru', 'Удивленно'),
	(28, 'S', 12, 'en', 'Surprised'),
	(29, 'S', 13, 'ru', 'Смущенно'),
	(30, 'S', 13, 'en', 'Confused'),
	(31, 'S', 14, 'ru', 'Идея'),
	(32, 'S', 14, 'en', 'Idea'),
	(33, 'S', 15, 'ru', 'Вопрос'),
	(34, 'S', 15, 'en', 'Question'),
	(35, 'S', 16, 'ru', 'Восклицание'),
	(36, 'S', 16, 'en', 'Exclamation'),
	(37, 'S', 17, 'ru', 'Нравится'),
	(38, 'S', 17, 'en', 'Like');
/*!40000 ALTER TABLE `b_smile_lang` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_smile_set
DROP TABLE IF EXISTS `b_smile_set`;
CREATE TABLE IF NOT EXISTS `b_smile_set` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'G',
  `PARENT_ID` int(18) NOT NULL DEFAULT 0,
  `STRING_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(10) NOT NULL DEFAULT 150,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_smile_set: ~2 rows (приблизительно)
DELETE FROM `b_smile_set`;
/*!40000 ALTER TABLE `b_smile_set` DISABLE KEYS */;
INSERT INTO `b_smile_set` (`ID`, `TYPE`, `PARENT_ID`, `STRING_ID`, `SORT`) VALUES
	(1, 'P', 0, 'bitrix', 150),
	(2, 'G', 1, 'bitrix_main', 150);
/*!40000 ALTER TABLE `b_smile_set` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_sms_template
DROP TABLE IF EXISTS `b_sms_template`;
CREATE TABLE IF NOT EXISTS `b_sms_template` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SENDER` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RECEIVER` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_sms_message_name` (`EVENT_NAME`(50))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_sms_template: ~3 rows (приблизительно)
DELETE FROM `b_sms_template`;
/*!40000 ALTER TABLE `b_sms_template` DISABLE KEYS */;
INSERT INTO `b_sms_template` (`ID`, `EVENT_NAME`, `ACTIVE`, `SENDER`, `RECEIVER`, `MESSAGE`, `LANGUAGE_ID`) VALUES
	(1, 'SMS_USER_CONFIRM_NUMBER', 'Y', '#DEFAULT_SENDER#', '#USER_PHONE#', 'Код подтверждения #CODE#', NULL),
	(2, 'SMS_USER_RESTORE_PASSWORD', 'Y', '#DEFAULT_SENDER#', '#USER_PHONE#', 'Код для восстановления пароля #CODE#', NULL),
	(3, 'SMS_EVENT_LOG_NOTIFICATION', 'Y', '#DEFAULT_SENDER#', '#PHONE_NUMBER#', '#NAME#: #ADDITIONAL_TEXT# (событий: #EVENT_COUNT#)', NULL);
/*!40000 ALTER TABLE `b_sms_template` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_sms_template_site
DROP TABLE IF EXISTS `b_sms_template_site`;
CREATE TABLE IF NOT EXISTS `b_sms_template_site` (
  `TEMPLATE_ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`TEMPLATE_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_sms_template_site: ~3 rows (приблизительно)
DELETE FROM `b_sms_template_site`;
/*!40000 ALTER TABLE `b_sms_template_site` DISABLE KEYS */;
INSERT INTO `b_sms_template_site` (`TEMPLATE_ID`, `SITE_ID`) VALUES
	(1, 's1'),
	(2, 's1'),
	(3, 's1');
/*!40000 ALTER TABLE `b_sms_template_site` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_sm_version_history
DROP TABLE IF EXISTS `b_sm_version_history`;
CREATE TABLE IF NOT EXISTS `b_sm_version_history` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime DEFAULT NULL,
  `VERSIONS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_sm_version_history: ~0 rows (приблизительно)
DELETE FROM `b_sm_version_history`;
/*!40000 ALTER TABLE `b_sm_version_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sm_version_history` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_socialservices_ap
DROP TABLE IF EXISTS `b_socialservices_ap`;
CREATE TABLE IF NOT EXISTS `b_socialservices_ap` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT current_timestamp(),
  `USER_ID` int(11) NOT NULL,
  `DOMAIN` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ENDPOINT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LOGIN` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PASSWORD` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_AUTHORIZE` datetime DEFAULT NULL,
  `SETTINGS` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_socialservices_ap1` (`USER_ID`,`DOMAIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_socialservices_ap: ~0 rows (приблизительно)
DELETE FROM `b_socialservices_ap`;
/*!40000 ALTER TABLE `b_socialservices_ap` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_socialservices_ap` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_socialservices_contact
DROP TABLE IF EXISTS `b_socialservices_contact`;
CREATE TABLE IF NOT EXISTS `b_socialservices_contact` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT current_timestamp(),
  `USER_ID` int(11) NOT NULL,
  `CONTACT_USER_ID` int(11) DEFAULT NULL,
  `CONTACT_XML_ID` int(11) DEFAULT NULL,
  `CONTACT_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTACT_LAST_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTACT_PHOTO` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_AUTHORIZE` datetime DEFAULT NULL,
  `NOTIFY` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `ix_b_socialservices_contact1` (`USER_ID`),
  KEY `ix_b_socialservices_contact2` (`CONTACT_USER_ID`),
  KEY `ix_b_socialservices_contact3` (`TIMESTAMP_X`),
  KEY `ix_b_socialservices_contact4` (`LAST_AUTHORIZE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_socialservices_contact: ~0 rows (приблизительно)
DELETE FROM `b_socialservices_contact`;
/*!40000 ALTER TABLE `b_socialservices_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_socialservices_contact` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_socialservices_contact_connect
DROP TABLE IF EXISTS `b_socialservices_contact_connect`;
CREATE TABLE IF NOT EXISTS `b_socialservices_contact_connect` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT current_timestamp(),
  `CONTACT_ID` int(11) DEFAULT NULL,
  `LINK_ID` int(11) DEFAULT NULL,
  `CONTACT_PROFILE_ID` int(11) NOT NULL,
  `CONTACT_PORTAL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONNECT_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT 'P',
  `LAST_AUTHORIZE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_socialservices_contact_connect1` (`CONTACT_ID`),
  KEY `ix_b_socialservices_contact_connect2` (`LINK_ID`),
  KEY `ix_b_socialservices_contact_connect3` (`LAST_AUTHORIZE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_socialservices_contact_connect: ~0 rows (приблизительно)
DELETE FROM `b_socialservices_contact_connect`;
/*!40000 ALTER TABLE `b_socialservices_contact_connect` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_socialservices_contact_connect` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_socialservices_message
DROP TABLE IF EXISTS `b_socialservices_message`;
CREATE TABLE IF NOT EXISTS `b_socialservices_message` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `SOCSERV_USER_ID` int(11) NOT NULL,
  `PROVIDER` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INSERT_DATE` datetime DEFAULT NULL,
  `SUCCES_SENT` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_socialservices_message: ~0 rows (приблизительно)
DELETE FROM `b_socialservices_message`;
/*!40000 ALTER TABLE `b_socialservices_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_socialservices_message` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_socialservices_user
DROP TABLE IF EXISTS `b_socialservices_user`;
CREATE TABLE IF NOT EXISTS `b_socialservices_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LOGIN` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_PHOTO` int(11) DEFAULT NULL,
  `EXTERNAL_AUTH_ID` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `XML_ID` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `CAN_DELETE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `PERSONAL_WWW` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERMISSIONS` varchar(555) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OATOKEN` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `OATOKEN_EXPIRES` int(11) DEFAULT NULL,
  `OASECRET` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `REFRESH_TOKEN` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEND_ACTIVITY` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `SITE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INITIALIZED` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_SOCIALSERVICES_USER` (`XML_ID`,`EXTERNAL_AUTH_ID`),
  KEY `IX_B_SOCIALSERVICES_US_3` (`LOGIN`),
  KEY `IX_B_SOCIALSERVICES_US_4` (`USER_ID`,`EXTERNAL_AUTH_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_socialservices_user: ~0 rows (приблизительно)
DELETE FROM `b_socialservices_user`;
/*!40000 ALTER TABLE `b_socialservices_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_socialservices_user` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_socialservices_user_link
DROP TABLE IF EXISTS `b_socialservices_user_link`;
CREATE TABLE IF NOT EXISTS `b_socialservices_user_link` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `SOCSERV_USER_ID` int(11) NOT NULL,
  `LINK_USER_ID` int(11) DEFAULT NULL,
  `LINK_UID` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `LINK_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINK_LAST_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINK_PICTURE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINK_EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_socialservices_user_link_5` (`SOCSERV_USER_ID`),
  KEY `ix_b_socialservices_user_link_6` (`LINK_USER_ID`,`TIMESTAMP_X`),
  KEY `ix_b_socialservices_user_link_7` (`LINK_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_socialservices_user_link: ~0 rows (приблизительно)
DELETE FROM `b_socialservices_user_link`;
/*!40000 ALTER TABLE `b_socialservices_user_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_socialservices_user_link` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_socialservices_zoom_meeting
DROP TABLE IF EXISTS `b_socialservices_zoom_meeting`;
CREATE TABLE IF NOT EXISTS `b_socialservices_zoom_meeting` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENTITY_TYPE_ID` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `CONFERENCE_URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONFERENCE_EXTERNAL_ID` bigint(20) unsigned NOT NULL,
  `CONFERENCE_PASSWORD` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `JOINED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONFERENCE_CREATED` datetime DEFAULT NULL,
  `CONFERENCE_STARTED` datetime DEFAULT NULL,
  `CONFERENCE_ENDED` datetime DEFAULT NULL,
  `DURATION` int(11) DEFAULT NULL,
  `TITLE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `SHORT_LINK` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HAS_RECORDING` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_SOCIALSERVICES_ZOOM_MEETING_1` (`CONFERENCE_EXTERNAL_ID`),
  KEY `IX_B_SOCIALSERVICES_ZOOM_MEETING_2` (`ENTITY_TYPE_ID`,`ENTITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_socialservices_zoom_meeting: ~0 rows (приблизительно)
DELETE FROM `b_socialservices_zoom_meeting`;
/*!40000 ALTER TABLE `b_socialservices_zoom_meeting` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_socialservices_zoom_meeting` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_socialservices_zoom_meeting_recording
DROP TABLE IF EXISTS `b_socialservices_zoom_meeting_recording`;
CREATE TABLE IF NOT EXISTS `b_socialservices_zoom_meeting_recording` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EXTERNAL_ID` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `MEETING_ID` int(11) NOT NULL,
  `START_DATE` datetime NOT NULL,
  `END_DATE` datetime NOT NULL,
  `FILE_TYPE` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `FILE_SIZE` int(11) NOT NULL,
  `PLAY_URL` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DOWNLOAD_URL` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RECORDING_TYPE` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `DOWNLOAD_TOKEN` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `PASSWORD` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_SOCIALSERVICES_ZOOM_MEETING_RECORDING_1` (`MEETING_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_socialservices_zoom_meeting_recording: ~0 rows (приблизительно)
DELETE FROM `b_socialservices_zoom_meeting_recording`;
/*!40000 ALTER TABLE `b_socialservices_zoom_meeting_recording` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_socialservices_zoom_meeting_recording` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_sticker
DROP TABLE IF EXISTS `b_sticker`;
CREATE TABLE IF NOT EXISTS `b_sticker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PAGE_URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PAGE_TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` datetime NOT NULL,
  `DATE_UPDATE` datetime NOT NULL,
  `MODIFIED_BY` int(18) NOT NULL,
  `CREATED_BY` int(18) NOT NULL,
  `PERSONAL` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CONTENT` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `POS_TOP` int(11) DEFAULT NULL,
  `POS_LEFT` int(11) DEFAULT NULL,
  `WIDTH` int(11) DEFAULT NULL,
  `HEIGHT` int(11) DEFAULT NULL,
  `COLOR` int(11) DEFAULT NULL,
  `COLLAPSED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `COMPLETED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CLOSED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DELETED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `MARKER_TOP` int(11) DEFAULT NULL,
  `MARKER_LEFT` int(11) DEFAULT NULL,
  `MARKER_WIDTH` int(11) DEFAULT NULL,
  `MARKER_HEIGHT` int(11) DEFAULT NULL,
  `MARKER_ADJUST` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_sticker: ~0 rows (приблизительно)
DELETE FROM `b_sticker`;
/*!40000 ALTER TABLE `b_sticker` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sticker` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_sticker_group_task
DROP TABLE IF EXISTS `b_sticker_group_task`;
CREATE TABLE IF NOT EXISTS `b_sticker_group_task` (
  `GROUP_ID` int(11) NOT NULL,
  `TASK_ID` int(11) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`TASK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_sticker_group_task: ~0 rows (приблизительно)
DELETE FROM `b_sticker_group_task`;
/*!40000 ALTER TABLE `b_sticker_group_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sticker_group_task` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_subscription
DROP TABLE IF EXISTS `b_subscription`;
CREATE TABLE IF NOT EXISTS `b_subscription` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime NOT NULL,
  `DATE_UPDATE` datetime DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FORMAT` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `CONFIRM_CODE` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONFIRMED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DATE_CONFIRM` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_SUBSCRIPTION_EMAIL` (`EMAIL`,`USER_ID`),
  KEY `IX_DATE_CONFIRM` (`CONFIRMED`,`DATE_CONFIRM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_subscription: ~0 rows (приблизительно)
DELETE FROM `b_subscription`;
/*!40000 ALTER TABLE `b_subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_subscription` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_subscription_rubric
DROP TABLE IF EXISTS `b_subscription_rubric`;
CREATE TABLE IF NOT EXISTS `b_subscription_rubric` (
  `SUBSCRIPTION_ID` int(11) NOT NULL,
  `LIST_RUBRIC_ID` int(11) NOT NULL,
  UNIQUE KEY `UK_SUBSCRIPTION_RUBRIC` (`SUBSCRIPTION_ID`,`LIST_RUBRIC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_subscription_rubric: ~0 rows (приблизительно)
DELETE FROM `b_subscription_rubric`;
/*!40000 ALTER TABLE `b_subscription_rubric` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_subscription_rubric` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_task
DROP TABLE IF EXISTS `b_task`;
CREATE TABLE IF NOT EXISTS `b_task` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `LETTER` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SYS` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BINDING` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'module',
  PRIMARY KEY (`ID`),
  KEY `ix_task` (`MODULE_ID`,`BINDING`,`LETTER`,`SYS`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_task: ~54 rows (приблизительно)
DELETE FROM `b_task`;
/*!40000 ALTER TABLE `b_task` DISABLE KEYS */;
INSERT INTO `b_task` (`ID`, `NAME`, `LETTER`, `MODULE_ID`, `SYS`, `DESCRIPTION`, `BINDING`) VALUES
	(1, 'main_denied', 'D', 'main', 'Y', NULL, 'module'),
	(2, 'main_change_profile', 'P', 'main', 'Y', NULL, 'module'),
	(3, 'main_view_all_settings', 'R', 'main', 'Y', NULL, 'module'),
	(4, 'main_view_all_settings_change_profile', 'T', 'main', 'Y', NULL, 'module'),
	(5, 'main_edit_subordinate_users', 'V', 'main', 'Y', NULL, 'module'),
	(6, 'main_full_access', 'W', 'main', 'Y', NULL, 'module'),
	(7, 'fm_folder_access_denied', 'D', 'main', 'Y', NULL, 'file'),
	(8, 'fm_folder_access_read', 'R', 'main', 'Y', NULL, 'file'),
	(9, 'fm_folder_access_write', 'W', 'main', 'Y', NULL, 'file'),
	(10, 'fm_folder_access_full', 'X', 'main', 'Y', NULL, 'file'),
	(11, 'fm_folder_access_workflow', 'U', 'main', 'Y', NULL, 'file'),
	(12, 'bitrixcloud_deny', 'D', 'bitrixcloud', 'Y', NULL, 'module'),
	(13, 'bitrixcloud_control', 'W', 'bitrixcloud', 'Y', NULL, 'module'),
	(14, 'clouds_denied', 'D', 'clouds', 'Y', NULL, 'module'),
	(15, 'clouds_browse', 'F', 'clouds', 'Y', NULL, 'module'),
	(16, 'clouds_upload', 'U', 'clouds', 'Y', NULL, 'module'),
	(17, 'clouds_full_access', 'W', 'clouds', 'Y', NULL, 'module'),
	(18, 'fileman_denied', 'D', 'fileman', 'Y', '', 'module'),
	(19, 'fileman_allowed_folders', 'F', 'fileman', 'Y', '', 'module'),
	(20, 'fileman_full_access', 'W', 'fileman', 'Y', '', 'module'),
	(21, 'medialib_denied', 'D', 'fileman', 'Y', '', 'medialib'),
	(22, 'medialib_view', 'F', 'fileman', 'Y', '', 'medialib'),
	(23, 'medialib_only_new', 'R', 'fileman', 'Y', '', 'medialib'),
	(24, 'medialib_edit_items', 'V', 'fileman', 'Y', '', 'medialib'),
	(25, 'medialib_editor', 'W', 'fileman', 'Y', '', 'medialib'),
	(26, 'medialib_full', 'X', 'fileman', 'Y', '', 'medialib'),
	(27, 'stickers_denied', 'D', 'fileman', 'Y', '', 'stickers'),
	(28, 'stickers_read', 'R', 'fileman', 'Y', '', 'stickers'),
	(29, 'stickers_edit', 'W', 'fileman', 'Y', '', 'stickers'),
	(30, 'hblock_denied', 'D', 'highloadblock', 'Y', NULL, 'module'),
	(31, 'hblock_read', 'R', 'highloadblock', 'Y', NULL, 'module'),
	(32, 'hblock_write', 'W', 'highloadblock', 'Y', NULL, 'module'),
	(33, 'iblock_deny', 'D', 'iblock', 'Y', NULL, 'iblock'),
	(34, 'iblock_read', 'R', 'iblock', 'Y', NULL, 'iblock'),
	(35, 'iblock_element_add', 'E', 'iblock', 'Y', NULL, 'iblock'),
	(36, 'iblock_admin_read', 'S', 'iblock', 'Y', NULL, 'iblock'),
	(37, 'iblock_admin_add', 'T', 'iblock', 'Y', NULL, 'iblock'),
	(38, 'iblock_limited_edit', 'U', 'iblock', 'Y', NULL, 'iblock'),
	(39, 'iblock_full_edit', 'W', 'iblock', 'Y', NULL, 'iblock'),
	(40, 'iblock_full', 'X', 'iblock', 'Y', NULL, 'iblock'),
	(41, 'landing_right_denied', 'D', 'landing', 'Y', NULL, 'module'),
	(42, 'landing_right_read', 'R', 'landing', 'Y', NULL, 'module'),
	(43, 'landing_right_edit', 'U', 'landing', 'Y', NULL, 'module'),
	(44, 'landing_right_sett', 'V', 'landing', 'Y', NULL, 'module'),
	(45, 'landing_right_public', 'W', 'landing', 'Y', NULL, 'module'),
	(46, 'landing_right_delete', 'X', 'landing', 'Y', NULL, 'module'),
	(47, 'security_denied', 'D', 'security', 'Y', NULL, 'module'),
	(48, 'security_filter', 'F', 'security', 'Y', NULL, 'module'),
	(49, 'security_otp', 'S', 'security', 'Y', NULL, 'module'),
	(50, 'security_view_all_settings', 'T', 'security', 'Y', NULL, 'module'),
	(51, 'security_full_access', 'W', 'security', 'Y', NULL, 'module'),
	(52, 'seo_denied', 'D', 'seo', 'Y', '', 'module'),
	(53, 'seo_edit', 'F', 'seo', 'Y', '', 'module'),
	(54, 'seo_full_access', 'W', 'seo', 'Y', '', 'module');
/*!40000 ALTER TABLE `b_task` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_task_operation
DROP TABLE IF EXISTS `b_task_operation`;
CREATE TABLE IF NOT EXISTS `b_task_operation` (
  `TASK_ID` int(18) NOT NULL,
  `OPERATION_ID` int(18) NOT NULL,
  PRIMARY KEY (`TASK_ID`,`OPERATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_task_operation: ~233 rows (приблизительно)
DELETE FROM `b_task_operation`;
/*!40000 ALTER TABLE `b_task_operation` DISABLE KEYS */;
INSERT INTO `b_task_operation` (`TASK_ID`, `OPERATION_ID`) VALUES
	(2, 2),
	(2, 3),
	(3, 2),
	(3, 4),
	(3, 5),
	(3, 6),
	(3, 7),
	(4, 2),
	(4, 3),
	(4, 4),
	(4, 5),
	(4, 6),
	(4, 7),
	(5, 2),
	(5, 3),
	(5, 5),
	(5, 6),
	(5, 7),
	(5, 8),
	(5, 9),
	(6, 2),
	(6, 3),
	(6, 4),
	(6, 5),
	(6, 6),
	(6, 7),
	(6, 10),
	(6, 11),
	(6, 12),
	(6, 13),
	(6, 14),
	(6, 15),
	(6, 16),
	(6, 17),
	(6, 18),
	(8, 19),
	(8, 20),
	(8, 21),
	(9, 19),
	(9, 20),
	(9, 21),
	(9, 22),
	(9, 23),
	(9, 24),
	(9, 25),
	(9, 26),
	(9, 27),
	(9, 28),
	(9, 29),
	(9, 30),
	(9, 31),
	(9, 32),
	(9, 33),
	(9, 34),
	(10, 19),
	(10, 20),
	(10, 21),
	(10, 22),
	(10, 23),
	(10, 24),
	(10, 25),
	(10, 26),
	(10, 27),
	(10, 28),
	(10, 29),
	(10, 30),
	(10, 31),
	(10, 32),
	(10, 33),
	(10, 34),
	(10, 35),
	(11, 19),
	(11, 20),
	(11, 21),
	(11, 24),
	(11, 28),
	(13, 36),
	(13, 37),
	(13, 38),
	(15, 39),
	(16, 39),
	(16, 40),
	(17, 39),
	(17, 40),
	(17, 41),
	(19, 44),
	(19, 45),
	(19, 46),
	(19, 47),
	(19, 48),
	(19, 49),
	(19, 50),
	(19, 52),
	(19, 53),
	(20, 42),
	(20, 43),
	(20, 44),
	(20, 45),
	(20, 46),
	(20, 47),
	(20, 48),
	(20, 49),
	(20, 50),
	(20, 51),
	(20, 52),
	(20, 53),
	(20, 54),
	(22, 55),
	(23, 55),
	(23, 56),
	(23, 60),
	(24, 55),
	(24, 60),
	(24, 61),
	(24, 62),
	(25, 55),
	(25, 56),
	(25, 57),
	(25, 58),
	(25, 60),
	(25, 61),
	(25, 62),
	(26, 55),
	(26, 56),
	(26, 57),
	(26, 58),
	(26, 59),
	(26, 60),
	(26, 61),
	(26, 62),
	(28, 63),
	(29, 63),
	(29, 64),
	(29, 65),
	(29, 66),
	(31, 67),
	(32, 68),
	(32, 69),
	(34, 70),
	(34, 71),
	(35, 72),
	(36, 70),
	(36, 71),
	(36, 73),
	(37, 70),
	(37, 71),
	(37, 72),
	(37, 73),
	(38, 70),
	(38, 71),
	(38, 72),
	(38, 73),
	(38, 74),
	(38, 75),
	(38, 76),
	(38, 77),
	(39, 70),
	(39, 71),
	(39, 72),
	(39, 73),
	(39, 74),
	(39, 75),
	(39, 76),
	(39, 77),
	(39, 78),
	(39, 79),
	(39, 80),
	(39, 81),
	(40, 70),
	(40, 71),
	(40, 72),
	(40, 73),
	(40, 74),
	(40, 75),
	(40, 76),
	(40, 77),
	(40, 78),
	(40, 79),
	(40, 80),
	(40, 81),
	(40, 82),
	(40, 83),
	(40, 84),
	(40, 85),
	(40, 86),
	(40, 87),
	(42, 88),
	(43, 89),
	(44, 90),
	(45, 91),
	(46, 92),
	(48, 93),
	(49, 94),
	(50, 95),
	(50, 96),
	(50, 97),
	(50, 98),
	(50, 99),
	(50, 100),
	(50, 101),
	(50, 102),
	(50, 103),
	(50, 104),
	(50, 105),
	(51, 93),
	(51, 94),
	(51, 95),
	(51, 96),
	(51, 97),
	(51, 98),
	(51, 99),
	(51, 100),
	(51, 101),
	(51, 102),
	(51, 103),
	(51, 104),
	(51, 105),
	(51, 106),
	(51, 107),
	(51, 108),
	(51, 109),
	(51, 110),
	(51, 111),
	(51, 112),
	(51, 113),
	(51, 114),
	(51, 115),
	(51, 116),
	(51, 117),
	(51, 118),
	(53, 120),
	(54, 119),
	(54, 120);
/*!40000 ALTER TABLE `b_task_operation` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_translate_diff
DROP TABLE IF EXISTS `b_translate_diff`;
CREATE TABLE IF NOT EXISTS `b_translate_diff` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FILE_ID` int(18) NOT NULL,
  `PATH_ID` int(18) NOT NULL,
  `LANG_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `AGAINST_LANG_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `EXCESS_COUNT` int(18) NOT NULL DEFAULT 0,
  `DEFICIENCY_COUNT` int(18) DEFAULT 0,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IXU_TRNSL_DIFF` (`FILE_ID`,`LANG_ID`,`AGAINST_LANG_ID`),
  KEY `IX_TRNSL_DIFF_PATH` (`PATH_ID`,`LANG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_translate_diff: ~0 rows (приблизительно)
DELETE FROM `b_translate_diff`;
/*!40000 ALTER TABLE `b_translate_diff` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_translate_diff` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_translate_file
DROP TABLE IF EXISTS `b_translate_file`;
CREATE TABLE IF NOT EXISTS `b_translate_file` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `PATH_ID` int(18) NOT NULL,
  `LANG_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `FULL_PATH` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `PHRASE_COUNT` int(18) NOT NULL DEFAULT 0,
  `INDEXED` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `INDEXED_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_TRNSL_FL_PATH` (`PATH_ID`,`LANG_ID`),
  KEY `IX_TRNSL_FULL_PATH` (`FULL_PATH`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_translate_file: ~0 rows (приблизительно)
DELETE FROM `b_translate_file`;
/*!40000 ALTER TABLE `b_translate_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_translate_file` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_translate_path
DROP TABLE IF EXISTS `b_translate_path`;
CREATE TABLE IF NOT EXISTS `b_translate_path` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `PARENT_ID` int(18) NOT NULL DEFAULT 0,
  `DEPTH_LEVEL` int(18) NOT NULL DEFAULT 0,
  `SORT` int(18) NOT NULL DEFAULT 0,
  `PATH` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `IS_LANG` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IS_DIR` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `OBLIGATORY_LANGS` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INDEXED` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `INDEXED_TIME` datetime DEFAULT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ASSIGNMENT` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_TRNSL_PTH_NAME` (`PARENT_ID`,`NAME`),
  KEY `IX_TRNSL_PTH_PARENT` (`PARENT_ID`,`IS_DIR`,`IS_LANG`),
  KEY `IX_TRNSL_PTH_PATH` (`PATH`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_translate_path: ~0 rows (приблизительно)
DELETE FROM `b_translate_path`;
/*!40000 ALTER TABLE `b_translate_path` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_translate_path` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_translate_path_lang
DROP TABLE IF EXISTS `b_translate_path_lang`;
CREATE TABLE IF NOT EXISTS `b_translate_path_lang` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `PATH` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_TRNSL_LNG_PATH` (`PATH`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_translate_path_lang: ~0 rows (приблизительно)
DELETE FROM `b_translate_path_lang`;
/*!40000 ALTER TABLE `b_translate_path_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_translate_path_lang` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_translate_path_tree
DROP TABLE IF EXISTS `b_translate_path_tree`;
CREATE TABLE IF NOT EXISTS `b_translate_path_tree` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `PARENT_ID` int(18) NOT NULL,
  `PATH_ID` int(18) NOT NULL,
  `DEPTH_LEVEL` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_TRNSL_ANCESTOR` (`PARENT_ID`,`DEPTH_LEVEL`,`PATH_ID`),
  UNIQUE KEY `IX_TRNSL_DESCENDANT` (`PATH_ID`,`PARENT_ID`,`DEPTH_LEVEL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_translate_path_tree: ~0 rows (приблизительно)
DELETE FROM `b_translate_path_tree`;
/*!40000 ALTER TABLE `b_translate_path_tree` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_translate_path_tree` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_translate_phrase
DROP TABLE IF EXISTS `b_translate_phrase`;
CREATE TABLE IF NOT EXISTS `b_translate_phrase` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FILE_ID` int(18) NOT NULL,
  `PATH_ID` int(18) NOT NULL,
  `LANG_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PHRASE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IXU_TRNSL_PHR_PATH_CODE` (`PATH_ID`,`LANG_ID`,`CODE`),
  KEY `IX_TRNSL_PHR_PATH` (`PATH_ID`,`CODE`),
  KEY `IX_TRNSL_FILE` (`FILE_ID`),
  FULLTEXT KEY `IXF_TRNSL_PHR` (`PHRASE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1;

-- Дамп данных таблицы bitrix2.b_translate_phrase: ~0 rows (приблизительно)
DELETE FROM `b_translate_phrase`;
/*!40000 ALTER TABLE `b_translate_phrase` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_translate_phrase` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_ui_entity_editor_config
DROP TABLE IF EXISTS `b_ui_entity_editor_config`;
CREATE TABLE IF NOT EXISTS `b_ui_entity_editor_config` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CATEGORY` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_TYPE_ID` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `CONFIG` text COLLATE utf8_unicode_ci NOT NULL,
  `COMMON` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ENTITY_TYPE_ID` (`ENTITY_TYPE_ID`),
  KEY `CATEGORY` (`CATEGORY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_ui_entity_editor_config: ~0 rows (приблизительно)
DELETE FROM `b_ui_entity_editor_config`;
/*!40000 ALTER TABLE `b_ui_entity_editor_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_ui_entity_editor_config` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_ui_entity_editor_config_ac
DROP TABLE IF EXISTS `b_ui_entity_editor_config_ac`;
CREATE TABLE IF NOT EXISTS `b_ui_entity_editor_config_ac` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ACCESS_CODE` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `CONFIG_ID` int(10) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ACCESS_CODE` (`ACCESS_CODE`),
  KEY `CONFIG_ID` (`CONFIG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_ui_entity_editor_config_ac: ~0 rows (приблизительно)
DELETE FROM `b_ui_entity_editor_config_ac`;
/*!40000 ALTER TABLE `b_ui_entity_editor_config_ac` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_ui_entity_editor_config_ac` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_undo
DROP TABLE IF EXISTS `b_undo`;
CREATE TABLE IF NOT EXISTS `b_undo` (
  `ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UNDO_TYPE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UNDO_HANDLER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTENT` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `TIMESTAMP_X` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_undo: ~11 rows (приблизительно)
DELETE FROM `b_undo`;
/*!40000 ALTER TABLE `b_undo` DISABLE KEYS */;
INSERT INTO `b_undo` (`ID`, `MODULE_ID`, `UNDO_TYPE`, `UNDO_HANDLER`, `CONTENT`, `USER_ID`, `TIMESTAMP_X`) VALUES
	('1234c438034fc0f3ae4ceeb8fc2f8b272', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:"absPath";s:53:"C:/openserver/domains/localhost/bitrix2.loc/index.php";s:7:"content";s:14011:"<?\nrequire($_SERVER["DOCUMENT_ROOT"]."/bitrix/header.php");\n$APPLICATION->SetTitle("1С-Битрикс: Управление сайтом");\n?><div class="page_wrap">\n <section class="first__section">\n	<h1 class="hidden">Установка натяжных потолков и осветительных приборов</h1>\n	<div class="first__slider__wrap">\n		<div class="first__slider__inner js_slider">\n			<div class="first__slide">\n				<div class="first__slide__image" style="background-image: url(\'content/slide.jpg\')">\n				</div>\n				<div class="first__slide__content">\n					<div class="container">\n						<div class="first__title">\n <span class="orange">Установка</span> натяжных потолков<br>\n							 и осветительных приборов\n						</div>\n						<div class="first__slide__delimer">\n						</div>\n						<div class="first__slide__text">\n							Стабильно и качественно<br>\n							выполняем свою работу на протяжении 8 лет\n						</div>\n					</div>\n				</div>\n			</div>\n			<div class="first__slide">\n				<div class="first__slide__image" style="background-image: url(\'content/slide.jpg\')">\n				</div>\n				<div class="first__slide__content">\n					<div class="container">\n						<div class="first__title">\n <span class="orange">Установка</span> натяжных потолков<br>\n							 и осветительных приборов\n						</div>\n						<div class="first__slide__delimer">\n						</div>\n						<div class="first__slide__text">\n							 Стабильно и качественно<br>\n							 выполняем свою работу на протяжении 8 лет\n						</div>\n					</div>\n				</div>\n			</div>\n			<div class="first__slide">\n				<div class="first__slide__image" style="background-image: url(\'content/slide.jpg\')">\n				</div>\n				<div class="first__slide__content">\n					<div class="container">\n						<div class="first__title">\n <span class="orange">Установка</span> натяжных потолков<br>\n							 и осветительных приборов\n						</div>\n						<div class="first__slide__delimer">\n						</div>\n						<div class="first__slide__text">\n							 Стабильно и качественно<br>\n							 выполняем свою работу на протяжении 8 лет\n						</div>\n					</div>\n				</div>\n			</div>\n		</div>\n	</div>\n	<div class="first__section__form">\n		<div class="first__form__title">\n			 Узнайте стоимость установки натяжного потолка\n		</div>\n		<div class="first__form__body">\n			<form class="form js_form">\n				<div class="form__field form__required">\n <input type="text" class="form__control" placeholder="Имя" data-required="true" data-rule="name">\n				</div>\n				<div class="form__field form__required">\n <input type="text" class="form__control phone-mask" placeholder="Телефон" data-required="true" data-rule="phone">\n				</div>\n <span class="error__text">Заполните все поля</span> <button class="button button__first__form">Рассчитать стоимость</button>\n			</form>\n		</div>\n	</div>\n </section> <section class="projects__section section1">\n	<div class="container">\n		<div class="section__title section__title__large text__center">\n <span class="orange">Наши</span> проекты\n		</div>\n		<div class="project__list">\n			<div class="project__item">\n <a href="#" class="project__link js_view_gallery" data-id="0">\n				<div class="project__image" style="background-image: url(\'content/project1.jpg\')">\n				</div>\n				<div class="project__text">\n					 Глянцевые фактуры\n				</div>\n </a>\n			</div>\n			<div class="project__item">\n <a href="#" class="project__link js_view_gallery" data-id="1">\n				<div class="project__image" style="background-image: url(\'content/project2.jpg\')">\n				</div>\n				<div class="project__text">\n					 Матовые фактуры\n				</div>\n </a>\n			</div>\n			<div class="project__item">\n <a href="#" class="project__link js_view_gallery" data-id="2">\n				<div class="project__image" style="background-image: url(\'content/project3.jpg\')">\n				</div>\n				<div class="project__text">\n					 Многоуровневые потолки\n				</div>\n </a>\n			</div>\n			<div class="project__item">\n <a href="#" class="project__link js_view_gallery" data-id="3">\n				<div class="project__image" style="background-image: url(\'content/project4.jpg\')">\n				</div>\n				<div class="project__text">\n					 Скрытая подсветка\n				</div>\n </a>\n			</div>\n			<div class="project__item">\n <a href="#" class="project__link js_view_gallery" data-id="4">\n				<div class="project__image" style="background-image: url(\'content/project5.jpg\')">\n				</div>\n				<div class="project__text">\n					 Тканевые потолки\n				</div>\n </a>\n			</div>\n			<div class="project__item">\n <a href="#" class="project__link js_view_gallery" data-id="5">\n				<div class="project__image" style="background-image: url(\'content/project6.jpg\')">\n				</div>\n				<div class="project__text">\n					 Фотопечать\n				</div>\n </a>\n			</div>\n		</div>\n	</div>\n </section>\n</div>\n <section class="about__section section2">\n<div class="container clearfix">\n	<div class="about__section__left">\n		<div class="section__title section__middle">\n <span class="orange">Наши</span> проекты\n		</div>\n		<div class="section__delimer">\n		</div>\n		<div class="section__text">\n			<p>\n				 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet lacus accumsan et viverra justo commodo. Proin sodales pulvinar tempor. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam fermentum, nulla luctus pharetra vulputate, felis tellus mollis orci, sed rhoncus sapien nunc eget.\n			</p>\n			<p>\n				 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet lacus accumsan et viverra justo commodo. Proin sodales pulvinar tempor. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam fermentum, nulla luctus pharetra vulputate, felis tellus mollis orci, sed rhoncus sapien nunc eget.\n			</p>\n		</div>\n	</div>\n	<div class="about__section__right">\n		<div class="about__image">\n <img src="../../../content/about.jpg">\n		</div>\n	</div>\n</div>\n </section>\n\n<?$APPLICATION->IncludeComponent(\n	"bitrix:news.list",\n	"WhyUs",\n	Array(\n		"ACTIVE_DATE_FORMAT" => "d.m.Y",\n		"ADD_SECTIONS_CHAIN" => "Y",\n		"AJAX_MODE" => "N",\n		"AJAX_OPTION_ADDITIONAL" => "",\n		"AJAX_OPTION_HISTORY" => "N",\n		"AJAX_OPTION_JUMP" => "N",\n		"AJAX_OPTION_STYLE" => "Y",\n		"CACHE_FILTER" => "N",\n		"CACHE_GROUPS" => "Y",\n		"CACHE_TIME" => "36000000",\n		"CACHE_TYPE" => "A",\n		"CHECK_DATES" => "Y",\n		"DETAIL_URL" => "",\n		"DISPLAY_BOTTOM_PAGER" => "Y",\n		"DISPLAY_DATE" => "Y",\n		"DISPLAY_NAME" => "Y",\n		"DISPLAY_PICTURE" => "Y",\n		"DISPLAY_PREVIEW_TEXT" => "Y",\n		"DISPLAY_TOP_PAGER" => "N",\n		"FIELD_CODE" => array(0=>"",1=>"",),\n		"FILTER_NAME" => "",\n		"HIDE_LINK_WHEN_NO_DETAIL" => "N",\n		"IBLOCK_ID" => "4",\n		"IBLOCK_TYPE" => "why_us",\n		"INCLUDE_IBLOCK_INTO_CHAIN" => "Y",\n		"INCLUDE_SUBSECTIONS" => "Y",\n		"MESSAGE_404" => "",\n		"NEWS_COUNT" => "5",\n		"PAGER_BASE_LINK_ENABLE" => "N",\n		"PAGER_DESC_NUMBERING" => "N",\n		"PAGER_DESC_NUMBERING_CACHE_TIME" => "36000",\n		"PAGER_SHOW_ALL" => "N",\n		"PAGER_SHOW_ALWAYS" => "N",\n		"PAGER_TEMPLATE" => ".default",\n		"PAGER_TITLE" => "Новости",\n		"PARENT_SECTION" => "",\n		"PARENT_SECTION_CODE" => "",\n		"PREVIEW_TRUNCATE_LEN" => "",\n		"PROPERTY_CODE" => array(0=>"",1=>"",),\n		"SET_BROWSER_TITLE" => "Y",\n		"SET_LAST_MODIFIED" => "N",\n		"SET_META_DESCRIPTION" => "Y",\n		"SET_META_KEYWORDS" => "Y",\n		"SET_STATUS_404" => "N",\n		"SET_TITLE" => "Y",\n		"SHOW_404" => "N",\n		"SORT_BY1" => "ACTIVE_FROM",\n		"SORT_BY2" => "SORT",\n		"SORT_ORDER1" => "DESC",\n		"SORT_ORDER2" => "ASC",\n		"STRICT_SECTION_CHECK" => "N"\n	)\n);?> <section class="call__section section4">\n<div class="container clearfix">\n	<div class="call__section__left">\n		<div class="section__title section__middle">\n			 Закажите замер бесплатно\n		</div>\n		<div class="section__delimer">\n		</div>\n		<div class="section__text">\n			 Получите бесплатный расчет стоимости своего потолка прямо сейчас!\n		</div>\n	</div>\n	<div class="call__section__right">\n		<div class="call__section__form">\n			<form class="form js_form">\n				<div class="form__fields__wrap">\n					<div class="form__field form__required">\n <input type="text" class="form__control" placeholder="Имя" data-required="true" data-rule="name">\n					</div>\n					<div class="form__field form__required">\n <input type="text" class="form__control phone-mask" placeholder="Телефон" data-required="true" data-rule="phone">\n					</div>\n <span class="error__text">Заполните все поля</span>\n				</div>\n				<div class="form__fields__wrap">\n					<div class="form__field call__text">\n						 Введите Ваши данные, и мы перезвоним Вам в ближайшее время\n					</div>\n					<div class="form__field">\n <button class="button button__call__form">Заказать замер</button>\n					</div>\n				</div>\n			</form>\n		</div>\n	</div>\n</div>\n </section> <section class="reviews__section section5">\n<div class="container">\n	<div class="section__title section__title__large text__center">\n		<span class="orange">Отзывы</span> и благодарности\n	</div>\n	<div class="clearfix">\n		<div class="flamp__block">\n <a class="flamp-widget" href="https://novosibirsk.flamp.ru/firm/ampir_novosibirsk_ooo-141266769810424" data-flamp-widget-type="responsive-new" data-flamp-widget-count="1" data-flamp-widget-id="141266769810424" data-flamp-widget-width="100%">Отзывы о нас на Флампе</a>\n			<script>!function (d, s) {\n                            var js, fjs = d.getElementsByTagName(s)[0];\n                            js = d.createElement(s);\n                            js.async = 1;\n                            js.src = "//widget.flamp.ru/loader.js";\n                            fjs.parentNode.insertBefore(js, fjs);\n                        }(document, "script");</script>\n		</div>\n\n<?$APPLICATION->IncludeComponent(\n	"bitrix:news.list",\n	"reviews",\n	Array(\n		"ACTIVE_DATE_FORMAT" => "d.m.Y",\n		"ADD_SECTIONS_CHAIN" => "Y",\n		"AJAX_MODE" => "N",\n		"AJAX_OPTION_ADDITIONAL" => "",\n		"AJAX_OPTION_HISTORY" => "N",\n		"AJAX_OPTION_JUMP" => "N",\n		"AJAX_OPTION_STYLE" => "Y",\n		"CACHE_FILTER" => "N",\n		"CACHE_GROUPS" => "Y",\n		"CACHE_TIME" => "36000000",\n		"CACHE_TYPE" => "A",\n		"CHECK_DATES" => "Y",\n		"DETAIL_URL" => "",\n		"DISPLAY_BOTTOM_PAGER" => "Y",\n		"DISPLAY_DATE" => "Y",\n		"DISPLAY_NAME" => "Y",\n		"DISPLAY_PICTURE" => "Y",\n		"DISPLAY_PREVIEW_TEXT" => "Y",\n		"DISPLAY_TOP_PAGER" => "N",\n		"FIELD_CODE" => array(0=>"",1=>"",),\n		"FILTER_NAME" => "",\n		"HIDE_LINK_WHEN_NO_DETAIL" => "N",\n		"IBLOCK_ID" => "5",\n		"IBLOCK_TYPE" => "reviews",\n		"INCLUDE_IBLOCK_INTO_CHAIN" => "Y",\n		"INCLUDE_SUBSECTIONS" => "Y",\n		"MESSAGE_404" => "",\n		"NEWS_COUNT" => "10",\n		"PAGER_BASE_LINK_ENABLE" => "N",\n		"PAGER_DESC_NUMBERING" => "N",\n		"PAGER_DESC_NUMBERING_CACHE_TIME" => "36000",\n		"PAGER_SHOW_ALL" => "N",\n		"PAGER_SHOW_ALWAYS" => "N",\n		"PAGER_TEMPLATE" => ".default",\n		"PAGER_TITLE" => "Новости",\n		"PARENT_SECTION" => "",\n		"PARENT_SECTION_CODE" => "",\n		"PREVIEW_TRUNCATE_LEN" => "",\n		"PROPERTY_CODE" => array(0=>"",1=>"",),\n		"SET_BROWSER_TITLE" => "Y",\n		"SET_LAST_MODIFIED" => "N",\n		"SET_META_DESCRIPTION" => "Y",\n		"SET_META_KEYWORDS" => "Y",\n		"SET_STATUS_404" => "N",\n		"SET_TITLE" => "Y",\n		"SHOW_404" => "N",\n		"SORT_BY1" => "ACTIVE_FROM",\n		"SORT_BY2" => "SORT",\n		"SORT_ORDER1" => "DESC",\n		"SORT_ORDER2" => "ASC",\n		"STRICT_SECTION_CHECK" => "N"\n	)\n);?>\n	</div>\n</div>\n </section>\n\n\n\n<?$APPLICATION->IncludeComponent(\n	"bitrix:news.list", \n	"contacts", \n	array(\n		"ACTIVE_DATE_FORMAT" => "d.m.Y",\n		"ADD_SECTIONS_CHAIN" => "Y",\n		"AJAX_MODE" => "N",\n		"AJAX_OPTION_ADDITIONAL" => "",\n		"AJAX_OPTION_HISTORY" => "N",\n		"AJAX_OPTION_JUMP" => "N",\n		"AJAX_OPTION_STYLE" => "Y",\n		"CACHE_FILTER" => "N",\n		"CACHE_GROUPS" => "Y",\n		"CACHE_TIME" => "36000000",\n		"CACHE_TYPE" => "A",\n		"CHECK_DATES" => "Y",\n		"DETAIL_URL" => "",\n		"DISPLAY_BOTTOM_PAGER" => "Y",\n		"DISPLAY_DATE" => "Y",\n		"DISPLAY_NAME" => "Y",\n		"DISPLAY_PICTURE" => "Y",\n		"DISPLAY_PREVIEW_TEXT" => "Y",\n		"DISPLAY_TOP_PAGER" => "N",\n		"FIELD_CODE" => array(\n			0 => "",\n			1 => "",\n		),\n		"FILTER_NAME" => "",\n		"HIDE_LINK_WHEN_NO_DETAIL" => "N",\n		"IBLOCK_ID" => "6",\n		"IBLOCK_TYPE" => "contacts",\n		"INCLUDE_IBLOCK_INTO_CHAIN" => "Y",\n		"INCLUDE_SUBSECTIONS" => "Y",\n		"MESSAGE_404" => "",\n		"NEWS_COUNT" => "4",\n		"PAGER_BASE_LINK_ENABLE" => "N",\n		"PAGER_DESC_NUMBERING" => "N",\n		"PAGER_DESC_NUMBERING_CACHE_TIME" => "36000",\n		"PAGER_SHOW_ALL" => "N",\n		"PAGER_SHOW_ALWAYS" => "N",\n		"PAGER_TEMPLATE" => ".default",\n		"PAGER_TITLE" => "Новости",\n		"PARENT_SECTION" => "",\n		"PARENT_SECTION_CODE" => "",\n		"PREVIEW_TRUNCATE_LEN" => "",\n		"PROPERTY_CODE" => array(\n			0 => "",\n			1 => "",\n		),\n		"SET_BROWSER_TITLE" => "Y",\n		"SET_LAST_MODIFIED" => "N",\n		"SET_META_DESCRIPTION" => "Y",\n		"SET_META_KEYWORDS" => "Y",\n		"SET_STATUS_404" => "N",\n		"SET_TITLE" => "Y",\n		"SHOW_404" => "N",\n		"SORT_BY1" => "ACTIVE_FROM",\n		"SORT_BY2" => "SORT",\n		"SORT_ORDER1" => "ASC",\n		"SORT_ORDER2" => "ASC",\n		"STRICT_SECTION_CHECK" => "N",\n		"COMPONENT_TEMPLATE" => "contacts",\n		"TEMPLATE_THEME" => "blue",\n		"MEDIA_PROPERTY" => "",\n		"SLIDER_PROPERTY" => "",\n		"SEARCH_PAGE" => "/search/",\n		"USE_RATING" => "N",\n		"USE_SHARE" => "N"\n	),\n	false\n);?> <section class="map__section">\n<div class="map__2gis" id="map">\n</div>\n </section> <a href="#" class="to__top"></a><?require($_SERVER["DOCUMENT_ROOT"]."/bitrix/footer.php");?>";}', 1, 1611474185),
	('1433b0102db47d825630be0d1d6c21c70', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:"absPath";s:53:"C:/openserver/domains/localhost/bitrix2.loc/index.php";s:7:"content";s:21168:"<?\nrequire($_SERVER["DOCUMENT_ROOT"]."/bitrix/header.php");\n$APPLICATION->SetTitle("1С-Битрикс: Управление сайтом");\n?>\n\n<div class="page_wrap">\n    <section class="first__section">\n	    <h1 class="hidden">Установка натяжных потолков и осветительных приборов</h1>\n        <div class="first__slider__wrap">\n            <div class="first__slider__inner js_slider">\n                <div class="first__slide">\n                    <div class="first__slide__image" style="background-image: url(\'content/slide.jpg\')"></div>\n                    <div class="first__slide__content">\n                        <div class="container">\n                            <div class="first__title">\n                                <span class="orange">Установка</span> натяжных потолков<br>\n                                 и осветительных приборов\n                            </div>\n                            <div class="first__slide__delimer"></div>\n                            <div class="first__slide__text">Стабильно и качественно<br>выполняем свою работу на\n                                протяжении 8 лет\n                            </div>\n                        </div>\n                    </div>\n                </div>\n                <div class="first__slide">\n                    <div class="first__slide__image" style="background-image: url(\'content/slide.jpg\')"></div>\n                    <div class="first__slide__content">\n                        <div class="container">\n                            <div class="first__title">\n                                <span class="orange">Установка</span> натяжных потолков<br>\n                                 и осветительных приборов\n                            </div>\n                            <div class="first__slide__delimer">\n                            </div>\n                            <div class="first__slide__text">\n                                 Стабильно и качественно<br>\n                                 выполняем свою работу на протяжении 8 лет\n                            </div>\n                        </div>\n                    </div>\n                </div>\n                <div class="first__slide">\n                    <div class="first__slide__image" style="background-image: url(\'content/slide.jpg\')">\n                    </div>\n                    <div class="first__slide__content">\n                        <div class="container">\n                            <div class="first__title">\n                                <span class="orange">Установка</span> натяжных потолков<br>\n                                 и осветительных приборов\n                            </div>\n                            <div class="first__slide__delimer">\n                            </div>\n                            <div class="first__slide__text">\n                                 Стабильно и качественно<br>\n                                 выполняем свою работу на протяжении 8 лет\n                            </div>\n                        </div>\n                    </div>\n                </div>\n            </div>\n        </div>\n	<div class="first__section__form">\n		<div class="first__form__title">\n			 Узнайте стоимость установки натяжного потолка\n		</div>\n		<div class="first__form__body">\n			<form class="form js_form">\n				<div class="form__field form__required">\n                    <input type="text" class="form__control" placeholder="Имя" data-required="true" data-rule="name">\n				</div>\n				<div class="form__field form__required">\n                    <input type="text" class="form__control phone-mask" placeholder="Телефон" data-required="true" data-rule="phone">\n				</div>\n                <span class="error__text">Заполните все поля</span> <button class="button button__first__form">Рассчитать стоимость</button>\n			</form>\n		</div>\n	</div>\n </section> <section class="projects__section section1">\n	<div class="container">\n		<div class="section__title section__title__large text__center">\n            <span class="orange">Наши</span> проекты\n		</div>\n		<div class="project__list">\n			<div class="project__item">\n                <a href="#" class="project__link js_view_gallery" data-id="0">\n                    <div class="project__image" style="background-image: url(\'content/project1.jpg\')">\n                    </div>\n                    <div class="project__text">\n                         Глянцевые фактуры\n                    </div>\n                </a>\n			</div>\n			<div class="project__item">\n                <a href="#" class="project__link js_view_gallery" data-id="1">\n                    <div class="project__image" style="background-image: url(\'content/project2.jpg\')">\n                    </div>\n                    <div class="project__text">\n                         Матовые фактуры\n                    </div>\n                </a>\n			</div>\n			<div class="project__item">\n                <a href="#" class="project__link js_view_gallery" data-id="2">\n                    <div class="project__image" style="background-image: url(\'content/project3.jpg\')">\n                    </div>\n                    <div class="project__text">\n                         Многоуровневые потолки\n                    </div>\n                </a>\n			</div>\n			<div class="project__item">\n                <a href="#" class="project__link js_view_gallery" data-id="3">\n                    <div class="project__image" style="background-image: url(\'content/project4.jpg\')">\n                    </div>\n                    <div class="project__text">\n                         Скрытая подсветка\n                    </div>\n                </a>\n			</div>\n			<div class="project__item">\n                <a href="#" class="project__link js_view_gallery" data-id="4">\n                    <div class="project__image" style="background-image: url(\'content/project5.jpg\')">\n                    </div>\n                    <div class="project__text">\n                         Тканевые потолки\n                    </div>\n                </a>\n			</div>\n			<div class="project__item">\n                <a href="#" class="project__link js_view_gallery" data-id="5">\n                    <div class="project__image" style="background-image: url(\'content/project6.jpg\')">\n                    </div>\n                    <div class="project__text">\n                         Фотопечать\n                    </div>\n                </a>\n			</div>\n		</div>\n	</div>\n </section>\n</div>\n <section class="about__section section2">\n<div class="container clearfix">\n	<div class="about__section__left">\n		<div class="section__title section__middle">\n <span class="orange">Наши</span> проекты\n		</div>\n		<div class="section__delimer">\n		</div>\n		<div class="section__text">\n			<p>\n				 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet lacus accumsan et viverra justo commodo. Proin sodales pulvinar tempor. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam fermentum, nulla luctus pharetra vulputate, felis tellus mollis orci, sed rhoncus sapien nunc eget.\n			</p>\n			<p>\n				 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet lacus accumsan et viverra justo commodo. Proin sodales pulvinar tempor. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam fermentum, nulla luctus pharetra vulputate, felis tellus mollis orci, sed rhoncus sapien nunc eget.\n			</p>\n		</div>\n	</div>\n	<div class="about__section__right">\n		<div class="about__image">\n <img src="../../../content/about.jpg">\n		</div>\n	</div>\n</div>\n </section>\n<!--<section class="why__section section3">\n        <div class="container">\n            <div class="section__title section__title__large text__center"><span class="orange">Почему</span> выбирают нас\n            </div>\n\n            <div class="why__list">\n                <div class="why__item">\n                    <div class="why__item__image">\n                        <img src="content/why1.png"/>\n                    </div>\n                    <div class="why__item__title">Более 7 лет</div>\n                    <div class="why__item__text">Работаем одним составом</div>\n                </div>\n                <div class="why__item">\n                    <div class="why__item__image">\n                        <img src="content/why2.png"/>\n                    </div>\n                    <div class="why__item__title">Бесплатный замер</div>\n                    <div class="why__item__text">Выезд в день обращения, производим расчет сразу на месте</div>\n                </div>\n                <div class="why__item">\n                    <div class="why__item__image">\n                        <img src="content/why3.png"/>\n                    </div>\n                    <div class="why__item__title">Бесплатно</div>\n                    <div class="why__item__text">Сервисное обслуживание всех выполненных работ</div>\n                </div>\n                <div class="why__item">\n                    <div class="why__item__image">\n                        <img src="content/why4.png"/>\n                    </div>\n                    <div class="why__item__title">Высокое качество</div>\n                    <div class="why__item__text">Монтажных работ<br/>и обслуживания</div>\n                </div>\n                <div class="why__item">\n                    <div class="why__item__image">\n                        <img src="content/why5.png"/>\n                    </div>\n                    <div class="why__item__title">Гос. заказчики</div>\n                    <div class="why__item__text">Довольны нашей работой</div>\n                </div>\n            </div>\n        </div>\n    </section>-->\n\n<?$APPLICATION->IncludeComponent(\n	"bitrix:news.list",\n	"WhyUs",\n	Array(\n		"ACTIVE_DATE_FORMAT" => "d.m.Y",\n		"ADD_SECTIONS_CHAIN" => "Y",\n		"AJAX_MODE" => "N",\n		"AJAX_OPTION_ADDITIONAL" => "",\n		"AJAX_OPTION_HISTORY" => "N",\n		"AJAX_OPTION_JUMP" => "N",\n		"AJAX_OPTION_STYLE" => "Y",\n		"CACHE_FILTER" => "N",\n		"CACHE_GROUPS" => "Y",\n		"CACHE_TIME" => "36000000",\n		"CACHE_TYPE" => "A",\n		"CHECK_DATES" => "Y",\n		"DETAIL_URL" => "",\n		"DISPLAY_BOTTOM_PAGER" => "Y",\n		"DISPLAY_DATE" => "Y",\n		"DISPLAY_NAME" => "Y",\n		"DISPLAY_PICTURE" => "Y",\n		"DISPLAY_PREVIEW_TEXT" => "Y",\n		"DISPLAY_TOP_PAGER" => "N",\n		"FIELD_CODE" => array(0=>"",1=>"",),\n		"FILTER_NAME" => "",\n		"HIDE_LINK_WHEN_NO_DETAIL" => "N",\n		"IBLOCK_ID" => "4",\n		"IBLOCK_TYPE" => "why_us",\n		"INCLUDE_IBLOCK_INTO_CHAIN" => "Y",\n		"INCLUDE_SUBSECTIONS" => "Y",\n		"MESSAGE_404" => "",\n		"NEWS_COUNT" => "5",\n		"PAGER_BASE_LINK_ENABLE" => "N",\n		"PAGER_DESC_NUMBERING" => "N",\n		"PAGER_DESC_NUMBERING_CACHE_TIME" => "36000",\n		"PAGER_SHOW_ALL" => "N",\n		"PAGER_SHOW_ALWAYS" => "N",\n		"PAGER_TEMPLATE" => ".default",\n		"PAGER_TITLE" => "Новости",\n		"PARENT_SECTION" => "",\n		"PARENT_SECTION_CODE" => "",\n		"PREVIEW_TRUNCATE_LEN" => "",\n		"PROPERTY_CODE" => array(0=>"",1=>"",),\n		"SET_BROWSER_TITLE" => "Y",\n		"SET_LAST_MODIFIED" => "N",\n		"SET_META_DESCRIPTION" => "Y",\n		"SET_META_KEYWORDS" => "Y",\n		"SET_STATUS_404" => "N",\n		"SET_TITLE" => "Y",\n		"SHOW_404" => "N",\n		"SORT_BY1" => "ACTIVE_FROM",\n		"SORT_BY2" => "SORT",\n		"SORT_ORDER1" => "DESC",\n		"SORT_ORDER2" => "ASC",\n		"STRICT_SECTION_CHECK" => "N"\n	)\n);?>\n\n    <section class="call__section section4">\n<div class="container clearfix">\n	<div class="call__section__left">\n		<div class="section__title section__middle">\n			 Закажите замер бесплатно\n		</div>\n		<div class="section__delimer">\n		</div>\n		<div class="section__text">\n			 Получите бесплатный расчет стоимости своего потолка прямо сейчас!\n		</div>\n	</div>\n	<div class="call__section__right">\n		<div class="call__section__form">\n			<form class="form js_form">\n				<div class="form__fields__wrap">\n					<div class="form__field form__required">\n <input type="text" class="form__control" placeholder="Имя" data-required="true" data-rule="name">\n					</div>\n					<div class="form__field form__required">\n <input type="text" class="form__control phone-mask" placeholder="Телефон" data-required="true" data-rule="phone">\n					</div>\n <span class="error__text">Заполните все поля</span>\n				</div>\n				<div class="form__fields__wrap">\n					<div class="form__field call__text">\n						 Введите Ваши данные, и мы перезвоним Вам в ближайшее время\n					</div>\n					<div class="form__field">\n <button class="button button__call__form">Заказать замер</button>\n					</div>\n				</div>\n			</form>\n		</div>\n	</div>\n</div>\n </section>\n\n<section class="reviews__section section5">\n        <div class="container">\n            <div class="section__title section__title__large text__center"><span class="orange">Отзывы</span> и\n                благодарности\n            </div>\n            <div class="clearfix">\n                <div class="flamp__block">\n                    <a class="flamp-widget" href="https://novosibirsk.flamp.ru/firm/ampir_novosibirsk_ooo-141266769810424"\n                       data-flamp-widget-type="responsive-new" data-flamp-widget-count="1"\n                       data-flamp-widget-id="141266769810424" data-flamp-widget-width="100%">Отзывы о нас на Флампе</a>\n                    <script>!function (d, s) {\n                            var js, fjs = d.getElementsByTagName(s)[0];\n                            js = d.createElement(s);\n                            js.async = 1;\n                            js.src = "//widget.flamp.ru/loader.js";\n                            fjs.parentNode.insertBefore(js, fjs);\n                        }(document, "script");</script>\n                </div>\n                <?$APPLICATION->IncludeComponent(\n                    "bitrix:news.list",\n                    "reviews",\n                    Array(\n                        "ACTIVE_DATE_FORMAT" => "d.m.Y",\n                        "ADD_SECTIONS_CHAIN" => "Y",\n                        "AJAX_MODE" => "N",\n                        "AJAX_OPTION_ADDITIONAL" => "",\n                        "AJAX_OPTION_HISTORY" => "N",\n                        "AJAX_OPTION_JUMP" => "N",\n                        "AJAX_OPTION_STYLE" => "Y",\n                        "CACHE_FILTER" => "N",\n                        "CACHE_GROUPS" => "Y",\n                        "CACHE_TIME" => "36000000",\n                        "CACHE_TYPE" => "A",\n                        "CHECK_DATES" => "Y",\n                        "DETAIL_URL" => "",\n                        "DISPLAY_BOTTOM_PAGER" => "Y",\n                        "DISPLAY_DATE" => "Y",\n                        "DISPLAY_NAME" => "Y",\n                        "DISPLAY_PICTURE" => "Y",\n                        "DISPLAY_PREVIEW_TEXT" => "Y",\n                        "DISPLAY_TOP_PAGER" => "N",\n                        "FIELD_CODE" => array(0=>"",1=>"",),\n                        "FILTER_NAME" => "",\n                        "HIDE_LINK_WHEN_NO_DETAIL" => "N",\n                        "IBLOCK_ID" => "5",\n                        "IBLOCK_TYPE" => "reviews",\n                        "INCLUDE_IBLOCK_INTO_CHAIN" => "Y",\n                        "INCLUDE_SUBSECTIONS" => "Y",\n                        "MESSAGE_404" => "",\n                        "NEWS_COUNT" => "10",\n                        "PAGER_BASE_LINK_ENABLE" => "N",\n                        "PAGER_DESC_NUMBERING" => "N",\n                        "PAGER_DESC_NUMBERING_CACHE_TIME" => "36000",\n                        "PAGER_SHOW_ALL" => "N",\n                        "PAGER_SHOW_ALWAYS" => "N",\n                        "PAGER_TEMPLATE" => ".default",\n                        "PAGER_TITLE" => "Новости",\n                        "PARENT_SECTION" => "",\n                        "PARENT_SECTION_CODE" => "",\n                        "PREVIEW_TRUNCATE_LEN" => "",\n                        "PROPERTY_CODE" => array(0=>"",1=>"",),\n                        "SET_BROWSER_TITLE" => "Y",\n                        "SET_LAST_MODIFIED" => "N",\n                        "SET_META_DESCRIPTION" => "Y",\n                        "SET_META_KEYWORDS" => "Y",\n                        "SET_STATUS_404" => "N",\n                        "SET_TITLE" => "Y",\n                        "SHOW_404" => "N",\n                        "SORT_BY1" => "ACTIVE_FROM",\n                        "SORT_BY2" => "SORT",\n                        "SORT_ORDER1" => "DESC",\n                        "SORT_ORDER2" => "ASC",\n                        "STRICT_SECTION_CHECK" => "N"\n                    )\n                );?>\n\n            </div>\n        </div>\n    </section>\n\n\n\n    <section class="contacts__section section6">\n<div class="container">\n	<div class="section__title section__title__large text__center">\n <span class="orange">Контактная</span> информация\n	</div>\n	<div class="contacts__list">\n		<div class="contacts__item">\n			<div class="contacts__image">\n <img src="content/c1.png">\n			</div>\n			<div class="contacts__text">\n				 г. Новосибирск, ул. Ленина, д.1,<br>\n				 офис 100\n			</div>\n		</div>\n		<div class="contacts__item">\n			<div class="contacts__image">\n <img src="content/c2.png">\n			</div>\n			<div class="contacts__text">\n				 10:00 - 20:00,<br>\n				 без выходных\n			</div>\n		</div>\n		<div class="contacts__item">\n			<div class="contacts__image">\n <img src="content/c3.png">\n			</div>\n			<div class="contacts__text">\n				 8 (383) 000-00-00\n			</div>\n		</div>\n		<div class="contacts__item">\n			<div class="contacts__image">\n                <img src="content/c4.png">\n			</div>\n			<div class="contacts__text">\n                <a href="mailto:ampir_nsk@mail.ru">ampir_nsk@mail.ru</a><br>\n                <?$APPLICATION->IncludeComponent(\n                "bitrix:main.include",\n                "",\n                    Array(\n                        "AREA_FILE_SHOW" => "page",\n                        "AREA_FILE_SUFFIX" => "inc",\n                        "EDIT_TEMPLATE" => ""\n                    )\n                );?>\n                <br>\n			</div>\n		</div>\n	</div>\n</div>\n </section>\n<?//$APPLICATION->IncludeComponent(\n//	"bitrix:news.list",\n//	".default",\n//	array(\n//		"ACTIVE_DATE_FORMAT" => "d.m.Y",\n//		"ADD_SECTIONS_CHAIN" => "Y",\n//		"AJAX_MODE" => "N",\n//		"AJAX_OPTION_ADDITIONAL" => "",\n//		"AJAX_OPTION_HISTORY" => "N",\n//		"AJAX_OPTION_JUMP" => "N",\n//		"AJAX_OPTION_STYLE" => "Y",\n//		"CACHE_FILTER" => "N",\n//		"CACHE_GROUPS" => "Y",\n//		"CACHE_TIME" => "36000000",\n//		"CACHE_TYPE" => "A",\n//		"CHECK_DATES" => "Y",\n//		"DETAIL_URL" => "",\n//		"DISPLAY_BOTTOM_PAGER" => "Y",\n//		"DISPLAY_DATE" => "Y",\n//		"DISPLAY_NAME" => "Y",\n//		"DISPLAY_PICTURE" => "Y",\n//		"DISPLAY_PREVIEW_TEXT" => "Y",\n//		"DISPLAY_TOP_PAGER" => "N",\n//		"FIELD_CODE" => array(\n//			0 => "",\n//			1 => "",\n//		),\n//		"FILTER_NAME" => "",\n//		"HIDE_LINK_WHEN_NO_DETAIL" => "N",\n//		"IBLOCK_ID" => "6",\n//		"IBLOCK_TYPE" => "contacts",\n//		"INCLUDE_IBLOCK_INTO_CHAIN" => "Y",\n//		"INCLUDE_SUBSECTIONS" => "Y",\n//		"MESSAGE_404" => "",\n//		"NEWS_COUNT" => "1",\n//		"PAGER_BASE_LINK_ENABLE" => "N",\n//		"PAGER_DESC_NUMBERING" => "N",\n//		"PAGER_DESC_NUMBERING_CACHE_TIME" => "36000",\n//		"PAGER_SHOW_ALL" => "N",\n//		"PAGER_SHOW_ALWAYS" => "N",\n//		"PAGER_TEMPLATE" => ".default",\n//		"PAGER_TITLE" => "Новости",\n//		"PARENT_SECTION" => "",\n//		"PARENT_SECTION_CODE" => "",\n//		"PREVIEW_TRUNCATE_LEN" => "",\n//		"PROPERTY_CODE" => array(\n//			0 => "",\n//			1 => "",\n//		),\n//		"SET_BROWSER_TITLE" => "Y",\n//		"SET_LAST_MODIFIED" => "N",\n//		"SET_META_DESCRIPTION" => "Y",\n//		"SET_META_KEYWORDS" => "Y",\n//		"SET_STATUS_404" => "N",\n//		"SET_TITLE" => "Y",\n//		"SHOW_404" => "N",\n//		"SORT_BY1" => "ACTIVE_FROM",\n//		"SORT_BY2" => "SORT",\n//		"SORT_ORDER1" => "DESC",\n//		"SORT_ORDER2" => "ASC",\n//		"STRICT_SECTION_CHECK" => "N",\n//		"COMPONENT_TEMPLATE" => ".default",\n//		"TEMPLATE_THEME" => "blue",\n//		"MEDIA_PROPERTY" => "",\n//		"SLIDER_PROPERTY" => "",\n//		"SEARCH_PAGE" => "/search/",\n//		"USE_RATING" => "N",\n//		"USE_SHARE" => "N"\n//	),\n//	false\n//);?>\n\n    <section class="map__section">\n<div class="map__2gis" id="map">\n</div>\n </section> <a href="#" class="to__top"></a><?require($_SERVER["DOCUMENT_ROOT"]."/bitrix/footer.php");?>";}', 1, 1611472097),
	('17b8e8b288dd198e23901d933049b8e05', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:"absPath";s:57:"C:/openserver/domains/localhost/bitrix2.loc/index_inc.php";s:7:"content";N;}', 1, 1611467640),
	('1870af62c9c72327d46268baef1fd32dc', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:"absPath";s:53:"C:/openserver/domains/localhost/bitrix2.loc/index.php";s:7:"content";s:17189:"<?\nrequire($_SERVER["DOCUMENT_ROOT"]."/bitrix/header.php");\n$APPLICATION->SetTitle("1С-Битрикс: Управление сайтом");\n?><div class="page_wrap">\n <section class="first__section">\n	<h1 class="hidden">Установка натяжных потолков и осветительных приборов</h1>\n	<div class="first__slider__wrap">\n		<div class="first__slider__inner js_slider">\n			<div class="first__slide">\n				<div class="first__slide__image" style="background-image: url(\'content/slide.jpg\')">\n				</div>\n				<div class="first__slide__content">\n					<div class="container">\n						<div class="first__title">\n <span class="orange">Установка</span> натяжных потолков<br>\n							 и осветительных приборов\n						</div>\n						<div class="first__slide__delimer">\n						</div>\n						<div class="first__slide__text">\n							Стабильно и качественно<br>\n							выполняем свою работу на протяжении 8 лет\n						</div>\n					</div>\n				</div>\n			</div>\n			<div class="first__slide">\n				<div class="first__slide__image" style="background-image: url(\'content/slide.jpg\')">\n				</div>\n				<div class="first__slide__content">\n					<div class="container">\n						<div class="first__title">\n <span class="orange">Установка</span> натяжных потолков<br>\n							 и осветительных приборов\n						</div>\n						<div class="first__slide__delimer">\n						</div>\n						<div class="first__slide__text">\n							 Стабильно и качественно<br>\n							 выполняем свою работу на протяжении 8 лет\n						</div>\n					</div>\n				</div>\n			</div>\n			<div class="first__slide">\n				<div class="first__slide__image" style="background-image: url(\'content/slide.jpg\')">\n				</div>\n				<div class="first__slide__content">\n					<div class="container">\n						<div class="first__title">\n <span class="orange">Установка</span> натяжных потолков<br>\n							 и осветительных приборов\n						</div>\n						<div class="first__slide__delimer">\n						</div>\n						<div class="first__slide__text">\n							 Стабильно и качественно<br>\n							 выполняем свою работу на протяжении 8 лет\n						</div>\n					</div>\n				</div>\n			</div>\n		</div>\n	</div>\n	<div class="first__section__form">\n		<div class="first__form__title">\n			 Узнайте стоимость установки натяжного потолка\n		</div>\n		<div class="first__form__body">\n			<form class="form js_form">\n				<div class="form__field form__required">\n <input type="text" class="form__control" placeholder="Имя" data-required="true" data-rule="name">\n				</div>\n				<div class="form__field form__required">\n <input type="text" class="form__control phone-mask" placeholder="Телефон" data-required="true" data-rule="phone">\n				</div>\n <span class="error__text">Заполните все поля</span> <button class="button button__first__form">Рассчитать стоимость</button>\n			</form>\n		</div>\n	</div>\n </section> <section class="projects__section section1">\n	<div class="container">\n		<div class="section__title section__title__large text__center">\n <span class="orange">Наши</span> проекты\n		</div>\n		<div class="project__list">\n			<div class="project__item">\n <a href="#" class="project__link js_view_gallery" data-id="0">\n				<div class="project__image" style="background-image: url(\'content/project1.jpg\')">\n				</div>\n				<div class="project__text">\n					 Глянцевые фактуры\n				</div>\n </a>\n			</div>\n			<div class="project__item">\n <a href="#" class="project__link js_view_gallery" data-id="1">\n				<div class="project__image" style="background-image: url(\'content/project2.jpg\')">\n				</div>\n				<div class="project__text">\n					 Матовые фактуры\n				</div>\n </a>\n			</div>\n			<div class="project__item">\n <a href="#" class="project__link js_view_gallery" data-id="2">\n				<div class="project__image" style="background-image: url(\'content/project3.jpg\')">\n				</div>\n				<div class="project__text">\n					 Многоуровневые потолки\n				</div>\n </a>\n			</div>\n			<div class="project__item">\n <a href="#" class="project__link js_view_gallery" data-id="3">\n				<div class="project__image" style="background-image: url(\'content/project4.jpg\')">\n				</div>\n				<div class="project__text">\n					 Скрытая подсветка\n				</div>\n </a>\n			</div>\n			<div class="project__item">\n <a href="#" class="project__link js_view_gallery" data-id="4">\n				<div class="project__image" style="background-image: url(\'content/project5.jpg\')">\n				</div>\n				<div class="project__text">\n					 Тканевые потолки\n				</div>\n </a>\n			</div>\n			<div class="project__item">\n <a href="#" class="project__link js_view_gallery" data-id="5">\n				<div class="project__image" style="background-image: url(\'content/project6.jpg\')">\n				</div>\n				<div class="project__text">\n					 Фотопечать\n				</div>\n </a>\n			</div>\n		</div>\n	</div>\n </section>\n</div>\n <section class="about__section section2">\n<div class="container clearfix">\n	<div class="about__section__left">\n		<div class="section__title section__middle">\n <span class="orange">Наши</span> проекты\n		</div>\n		<div class="section__delimer">\n		</div>\n		<div class="section__text">\n			<p>\n				 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet lacus accumsan et viverra justo commodo. Proin sodales pulvinar tempor. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam fermentum, nulla luctus pharetra vulputate, felis tellus mollis orci, sed rhoncus sapien nunc eget.\n			</p>\n			<p>\n				 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet lacus accumsan et viverra justo commodo. Proin sodales pulvinar tempor. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam fermentum, nulla luctus pharetra vulputate, felis tellus mollis orci, sed rhoncus sapien nunc eget.\n			</p>\n		</div>\n	</div>\n	<div class="about__section__right">\n		<div class="about__image">\n <img src="../../../content/about.jpg">\n		</div>\n	</div>\n</div>\n </section>\n\n<?$APPLICATION->IncludeComponent(\n	"bitrix:news.list",\n	"WhyUs",\n	Array(\n		"ACTIVE_DATE_FORMAT" => "d.m.Y",\n		"ADD_SECTIONS_CHAIN" => "Y",\n		"AJAX_MODE" => "N",\n		"AJAX_OPTION_ADDITIONAL" => "",\n		"AJAX_OPTION_HISTORY" => "N",\n		"AJAX_OPTION_JUMP" => "N",\n		"AJAX_OPTION_STYLE" => "Y",\n		"CACHE_FILTER" => "N",\n		"CACHE_GROUPS" => "Y",\n		"CACHE_TIME" => "36000000",\n		"CACHE_TYPE" => "A",\n		"CHECK_DATES" => "Y",\n		"DETAIL_URL" => "",\n		"DISPLAY_BOTTOM_PAGER" => "Y",\n		"DISPLAY_DATE" => "Y",\n		"DISPLAY_NAME" => "Y",\n		"DISPLAY_PICTURE" => "Y",\n		"DISPLAY_PREVIEW_TEXT" => "Y",\n		"DISPLAY_TOP_PAGER" => "N",\n		"FIELD_CODE" => array(0=>"",1=>"",),\n		"FILTER_NAME" => "",\n		"HIDE_LINK_WHEN_NO_DETAIL" => "N",\n		"IBLOCK_ID" => "4",\n		"IBLOCK_TYPE" => "why_us",\n		"INCLUDE_IBLOCK_INTO_CHAIN" => "Y",\n		"INCLUDE_SUBSECTIONS" => "Y",\n		"MESSAGE_404" => "",\n		"NEWS_COUNT" => "5",\n		"PAGER_BASE_LINK_ENABLE" => "N",\n		"PAGER_DESC_NUMBERING" => "N",\n		"PAGER_DESC_NUMBERING_CACHE_TIME" => "36000",\n		"PAGER_SHOW_ALL" => "N",\n		"PAGER_SHOW_ALWAYS" => "N",\n		"PAGER_TEMPLATE" => ".default",\n		"PAGER_TITLE" => "Новости",\n		"PARENT_SECTION" => "",\n		"PARENT_SECTION_CODE" => "",\n		"PREVIEW_TRUNCATE_LEN" => "",\n		"PROPERTY_CODE" => array(0=>"",1=>"",),\n		"SET_BROWSER_TITLE" => "Y",\n		"SET_LAST_MODIFIED" => "N",\n		"SET_META_DESCRIPTION" => "Y",\n		"SET_META_KEYWORDS" => "Y",\n		"SET_STATUS_404" => "N",\n		"SET_TITLE" => "Y",\n		"SHOW_404" => "N",\n		"SORT_BY1" => "ACTIVE_FROM",\n		"SORT_BY2" => "SORT",\n		"SORT_ORDER1" => "DESC",\n		"SORT_ORDER2" => "ASC",\n		"STRICT_SECTION_CHECK" => "N"\n	)\n);?> <section class="call__section section4">\n<div class="container clearfix">\n	<div class="call__section__left">\n		<div class="section__title section__middle">\n			 Закажите замер бесплатно\n		</div>\n		<div class="section__delimer">\n		</div>\n		<div class="section__text">\n			 Получите бесплатный расчет стоимости своего потолка прямо сейчас!\n		</div>\n	</div>\n	<div class="call__section__right">\n		<div class="call__section__form">\n			<form class="form js_form">\n				<div class="form__fields__wrap">\n					<div class="form__field form__required">\n <input type="text" class="form__control" placeholder="Имя" data-required="true" data-rule="name">\n					</div>\n					<div class="form__field form__required">\n <input type="text" class="form__control phone-mask" placeholder="Телефон" data-required="true" data-rule="phone">\n					</div>\n <span class="error__text">Заполните все поля</span>\n				</div>\n				<div class="form__fields__wrap">\n					<div class="form__field call__text">\n						 Введите Ваши данные, и мы перезвоним Вам в ближайшее время\n					</div>\n					<div class="form__field">\n <button class="button button__call__form">Заказать замер</button>\n					</div>\n				</div>\n			</form>\n		</div>\n	</div>\n</div>\n </section> <section class="reviews__section section5">\n<div class="container">\n	<div class="section__title section__title__large text__center">\n		<span class="orange">Отзывы</span> и благодарности\n	</div>\n	<div class="clearfix">\n		<div class="flamp__block">\n <a class="flamp-widget" href="https://novosibirsk.flamp.ru/firm/ampir_novosibirsk_ooo-141266769810424" data-flamp-widget-type="responsive-new" data-flamp-widget-count="1" data-flamp-widget-id="141266769810424" data-flamp-widget-width="100%">Отзывы о нас на Флампе</a>\n			<script>!function (d, s) {\n                            var js, fjs = d.getElementsByTagName(s)[0];\n                            js = d.createElement(s);\n                            js.async = 1;\n                            js.src = "//widget.flamp.ru/loader.js";\n                            fjs.parentNode.insertBefore(js, fjs);\n                        }(document, "script");</script>\n		</div>\n\n<?$APPLICATION->IncludeComponent(\n	"bitrix:news.list",\n	"reviews",\n	Array(\n		"ACTIVE_DATE_FORMAT" => "d.m.Y",\n		"ADD_SECTIONS_CHAIN" => "Y",\n		"AJAX_MODE" => "N",\n		"AJAX_OPTION_ADDITIONAL" => "",\n		"AJAX_OPTION_HISTORY" => "N",\n		"AJAX_OPTION_JUMP" => "N",\n		"AJAX_OPTION_STYLE" => "Y",\n		"CACHE_FILTER" => "N",\n		"CACHE_GROUPS" => "Y",\n		"CACHE_TIME" => "36000000",\n		"CACHE_TYPE" => "A",\n		"CHECK_DATES" => "Y",\n		"DETAIL_URL" => "",\n		"DISPLAY_BOTTOM_PAGER" => "Y",\n		"DISPLAY_DATE" => "Y",\n		"DISPLAY_NAME" => "Y",\n		"DISPLAY_PICTURE" => "Y",\n		"DISPLAY_PREVIEW_TEXT" => "Y",\n		"DISPLAY_TOP_PAGER" => "N",\n		"FIELD_CODE" => array(0=>"",1=>"",),\n		"FILTER_NAME" => "",\n		"HIDE_LINK_WHEN_NO_DETAIL" => "N",\n		"IBLOCK_ID" => "5",\n		"IBLOCK_TYPE" => "reviews",\n		"INCLUDE_IBLOCK_INTO_CHAIN" => "Y",\n		"INCLUDE_SUBSECTIONS" => "Y",\n		"MESSAGE_404" => "",\n		"NEWS_COUNT" => "10",\n		"PAGER_BASE_LINK_ENABLE" => "N",\n		"PAGER_DESC_NUMBERING" => "N",\n		"PAGER_DESC_NUMBERING_CACHE_TIME" => "36000",\n		"PAGER_SHOW_ALL" => "N",\n		"PAGER_SHOW_ALWAYS" => "N",\n		"PAGER_TEMPLATE" => ".default",\n		"PAGER_TITLE" => "Новости",\n		"PARENT_SECTION" => "",\n		"PARENT_SECTION_CODE" => "",\n		"PREVIEW_TRUNCATE_LEN" => "",\n		"PROPERTY_CODE" => array(0=>"",1=>"",),\n		"SET_BROWSER_TITLE" => "Y",\n		"SET_LAST_MODIFIED" => "N",\n		"SET_META_DESCRIPTION" => "Y",\n		"SET_META_KEYWORDS" => "Y",\n		"SET_STATUS_404" => "N",\n		"SET_TITLE" => "Y",\n		"SHOW_404" => "N",\n		"SORT_BY1" => "ACTIVE_FROM",\n		"SORT_BY2" => "SORT",\n		"SORT_ORDER1" => "DESC",\n		"SORT_ORDER2" => "ASC",\n		"STRICT_SECTION_CHECK" => "N"\n	)\n);?>\n	</div>\n</div>\n </section>\n\n\n\n<?$APPLICATION->IncludeComponent("bitrix:news.list", "contacts", Array(\n	"ACTIVE_DATE_FORMAT" => "d.m.Y",	// Формат показа даты\n		"ADD_SECTIONS_CHAIN" => "Y",	// Включать раздел в цепочку навигации\n		"AJAX_MODE" => "N",	// Включить режим AJAX\n		"AJAX_OPTION_ADDITIONAL" => "",	// Дополнительный идентификатор\n		"AJAX_OPTION_HISTORY" => "N",	// Включить эмуляцию навигации браузера\n		"AJAX_OPTION_JUMP" => "N",	// Включить прокрутку к началу компонента\n		"AJAX_OPTION_STYLE" => "Y",	// Включить подгрузку стилей\n		"CACHE_FILTER" => "N",	// Кешировать при установленном фильтре\n		"CACHE_GROUPS" => "Y",	// Учитывать права доступа\n		"CACHE_TIME" => "36000000",	// Время кеширования (сек.)\n		"CACHE_TYPE" => "A",	// Тип кеширования\n		"CHECK_DATES" => "Y",	// Показывать только активные на данный момент элементы\n		"DETAIL_URL" => "",	// URL страницы детального просмотра (по умолчанию - из настроек инфоблока)\n		"DISPLAY_BOTTOM_PAGER" => "Y",	// Выводить под списком\n		"DISPLAY_DATE" => "Y",	// Выводить дату элемента\n		"DISPLAY_NAME" => "Y",	// Выводить название элемента\n		"DISPLAY_PICTURE" => "Y",	// Выводить изображение для анонса\n		"DISPLAY_PREVIEW_TEXT" => "Y",	// Выводить текст анонса\n		"DISPLAY_TOP_PAGER" => "N",	// Выводить над списком\n		"FIELD_CODE" => array(	// Поля\n			0 => "",\n			1 => "",\n		),\n		"FILTER_NAME" => "",	// Фильтр\n		"HIDE_LINK_WHEN_NO_DETAIL" => "N",	// Скрывать ссылку, если нет детального описания\n		"IBLOCK_ID" => "6",	// Код информационного блока\n		"IBLOCK_TYPE" => "contacts",	// Тип информационного блока (используется только для проверки)\n		"INCLUDE_IBLOCK_INTO_CHAIN" => "Y",	// Включать инфоблок в цепочку навигации\n		"INCLUDE_SUBSECTIONS" => "Y",	// Показывать элементы подразделов раздела\n		"MESSAGE_404" => "",	// Сообщение для показа (по умолчанию из компонента)\n		"NEWS_COUNT" => "4",	// Количество новостей на странице\n		"PAGER_BASE_LINK_ENABLE" => "N",	// Включить обработку ссылок\n		"PAGER_DESC_NUMBERING" => "N",	// Использовать обратную навигацию\n		"PAGER_DESC_NUMBERING_CACHE_TIME" => "36000",	// Время кеширования страниц для обратной навигации\n		"PAGER_SHOW_ALL" => "N",	// Показывать ссылку "Все"\n		"PAGER_SHOW_ALWAYS" => "N",	// Выводить всегда\n		"PAGER_TEMPLATE" => ".default",	// Шаблон постраничной навигации\n		"PAGER_TITLE" => "Новости",	// Название категорий\n		"PARENT_SECTION" => "",	// ID раздела\n		"PARENT_SECTION_CODE" => "",	// Код раздела\n		"PREVIEW_TRUNCATE_LEN" => "",	// Максимальная длина анонса для вывода (только для типа текст)\n		"PROPERTY_CODE" => array(	// Свойства\n			0 => "",\n			1 => "",\n		),\n		"SET_BROWSER_TITLE" => "Y",	// Устанавливать заголовок окна браузера\n		"SET_LAST_MODIFIED" => "N",	// Устанавливать в заголовках ответа время модификации страницы\n		"SET_META_DESCRIPTION" => "Y",	// Устанавливать описание страницы\n		"SET_META_KEYWORDS" => "Y",	// Устанавливать ключевые слова страницы\n		"SET_STATUS_404" => "N",	// Устанавливать статус 404\n		"SET_TITLE" => "Y",	// Устанавливать заголовок страницы\n		"SHOW_404" => "N",	// Показ специальной страницы\n		"SORT_BY1" => "ACTIVE_FROM",	// Поле для первой сортировки новостей\n		"SORT_BY2" => "SORT",	// Поле для второй сортировки новостей\n		"SORT_ORDER1" => "DESC",	// Направление для первой сортировки новостей\n		"SORT_ORDER2" => "ASC",	// Направление для второй сортировки новостей\n		"STRICT_SECTION_CHECK" => "N",	// Строгая проверка раздела для показа списка\n		"COMPONENT_TEMPLATE" => ".default",\n		"TEMPLATE_THEME" => "blue",\n		"MEDIA_PROPERTY" => "",\n		"SLIDER_PROPERTY" => "",\n		"SEARCH_PAGE" => "/search/",\n		"USE_RATING" => "N",\n		"USE_SHARE" => "N"\n	),\n	false\n);?> <section class="map__section">\n<div class="map__2gis" id="map">\n</div>\n </section> <a href="#" class="to__top"></a><?require($_SERVER["DOCUMENT_ROOT"]."/bitrix/footer.php");?>";}', 1, 1611474166),
	('18d63deeecb77dca0a99ee4eba926a78c', 'fileman', 'edit_menu', 'CFileman::UndoEditFile', 'a:2:{s:7:"absPath";s:58:"C:/openserver/domains/localhost/bitrix2.loc/.left.menu.php";s:7:"content";s:94:"<?\n$aMenuLinks = Array(\n	Array(\n		"О нас", \n		"/", \n		Array(), \n		Array(), \n		"" \n	)\n);\n?>";}', 1, 1611474293),
	('1b427b547df850aab055b9071f967e579', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:"absPath";s:57:"C:/openserver/domains/localhost/bitrix2.loc/index_inc.php";s:7:"content";s:6:"хуй";}', 1, 1611467685),
	('1c48d81b279cacd464c6e2cd19bdd1b72', 'fileman', 'edit_menu', 'CFileman::UndoEditFile', 'a:2:{s:7:"absPath";s:58:"C:/openserver/domains/localhost/bitrix2.loc/.left.menu.php";s:7:"content";s:583:"<?\n$aMenuLinks = Array(\n	Array(\n		"Наши проекты", \n		"#section1", \n		Array(), \n		Array(), \n		"" \n	),\n	Array(\n		"О компании", \n		"#section2", \n		Array(), \n		Array(), \n		"" \n	),\n	Array(\n		"Наши преимущества", \n		"#section3", \n		Array(), \n		Array(), \n		"" \n	),\n	Array(\n		"Заказать замер", \n		"#section4", \n		Array(), \n		Array(), \n		"" \n	),\n	Array(\n		"Отзывы о нас", \n		"#section5", \n		Array(), \n		Array(), \n		"" \n	),\n	Array(\n		"#section6", \n		"Контактная информация", \n		Array(), \n		Array(), \n		"" \n	)\n);\n?>";}', 1, 1611474413),
	('1da87b0da2ccdf88615bd8c2c6f041589', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:"absPath";s:53:"C:/openserver/domains/localhost/bitrix2.loc/index.php";s:7:"content";s:24008:"<?\nrequire($_SERVER["DOCUMENT_ROOT"]."/bitrix/header.php");\n$APPLICATION->SetTitle("1С-Битрикс: Управление сайтом");\n?><div class="page_wrap">\n <section class="first__section">\n	<h1 class="hidden">Установка натяжных потолков и осветительных приборов</h1>\n	<div class="first__slider__wrap">\n		<div class="first__slider__inner js_slider">\n			<div class="first__slide">\n				<div class="first__slide__image" style="background-image: url(\'content/slide.jpg\')">\n				</div>\n				<div class="first__slide__content">\n					<div class="container">\n						<div class="first__title">\n <span class="orange">Установка</span> натяжных потолков<br>\n							 и осветительных приборов\n						</div>\n						<div class="first__slide__delimer">\n						</div>\n						<div class="first__slide__text">\n							 Стабильно и качественно<br>\n							 выполняем свою работу на протяжении 8 лет\n						</div>\n					</div>\n				</div>\n			</div>\n			<div class="first__slide">\n				<div class="first__slide__image" style="background-image: url(\'content/slide.jpg\')">\n				</div>\n				<div class="first__slide__content">\n					<div class="container">\n						<div class="first__title">\n <span class="orange">Установка</span> натяжных потолков<br>\n							 и осветительных приборов\n						</div>\n						<div class="first__slide__delimer">\n						</div>\n						<div class="first__slide__text">\n							 Стабильно и качественно<br>\n							 выполняем свою работу на протяжении 8 лет\n						</div>\n					</div>\n				</div>\n			</div>\n			<div class="first__slide">\n				<div class="first__slide__image" style="background-image: url(\'content/slide.jpg\')">\n				</div>\n				<div class="first__slide__content">\n					<div class="container">\n						<div class="first__title">\n <span class="orange">Установка</span> натяжных потолков<br>\n							 и осветительных приборов\n						</div>\n						<div class="first__slide__delimer">\n						</div>\n						<div class="first__slide__text">\n							 Стабильно и качественно<br>\n							 выполняем свою работу на протяжении 8 лет\n						</div>\n					</div>\n				</div>\n			</div>\n		</div>\n	</div>\n	<div class="first__section__form">\n		<div class="first__form__title">\n			 Узнайте стоимость установки натяжного потолка\n		</div>\n		<div class="first__form__body">\n			<form class="form js_form">\n				<div class="form__field form__required">\n <input type="text" class="form__control" placeholder="Имя" data-required="true" data-rule="name">\n				</div>\n				<div class="form__field form__required">\n <input type="text" class="form__control phone-mask" placeholder="Телефон" data-required="true" data-rule="phone">\n				</div>\n <span class="error__text">Заполните все поля</span> <button class="button button__first__form">Рассчитать стоимость</button>\n			</form>\n		</div>\n	</div>\n </section> <section class="projects__section section1">\n	<div class="container">\n		<div class="section__title section__title__large text__center">\n <span class="orange">Наши</span> проекты\n		</div>\n		<div class="project__list">\n			<div class="project__item">\n <a href="#" class="project__link js_view_gallery" data-id="0">\n				<div class="project__image" style="background-image: url(\'content/project1.jpg\')">\n				</div>\n				<div class="project__text">\n					 Глянцевые фактуры\n				</div>\n </a>\n			</div>\n			<div class="project__item">\n <a href="#" class="project__link js_view_gallery" data-id="1">\n				<div class="project__image" style="background-image: url(\'content/project2.jpg\')">\n				</div>\n				<div class="project__text">\n					 Матовые фактуры\n				</div>\n </a>\n			</div>\n			<div class="project__item">\n <a href="#" class="project__link js_view_gallery" data-id="2">\n				<div class="project__image" style="background-image: url(\'content/project3.jpg\')">\n				</div>\n				<div class="project__text">\n					 Многоуровневые потолки\n				</div>\n </a>\n			</div>\n			<div class="project__item">\n <a href="#" class="project__link js_view_gallery" data-id="3">\n				<div class="project__image" style="background-image: url(\'content/project4.jpg\')">\n				</div>\n				<div class="project__text">\n					 Скрытая подсветка\n				</div>\n </a>\n			</div>\n			<div class="project__item">\n <a href="#" class="project__link js_view_gallery" data-id="4">\n				<div class="project__image" style="background-image: url(\'content/project5.jpg\')">\n				</div>\n				<div class="project__text">\n					 Тканевые потолки\n				</div>\n </a>\n			</div>\n			<div class="project__item">\n <a href="#" class="project__link js_view_gallery" data-id="5">\n				<div class="project__image" style="background-image: url(\'content/project6.jpg\')">\n				</div>\n				<div class="project__text">\n					 Фотопечать\n				</div>\n </a>\n			</div>\n		</div>\n	</div>\n </section>\n</div>\n <section class="about__section section2">\n<div class="container clearfix">\n	<div class="about__section__left">\n		<div class="section__title section__middle">\n <span class="orange">Наши</span> проекты\n		</div>\n		<div class="section__delimer">\n		</div>\n		<div class="section__text">\n			<p>\n				 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet lacus accumsan et viverra justo commodo. Proin sodales pulvinar tempor. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam fermentum, nulla luctus pharetra vulputate, felis tellus mollis orci, sed rhoncus sapien nunc eget.\n			</p>\n			<p>\n				 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet lacus accumsan et viverra justo commodo. Proin sodales pulvinar tempor. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam fermentum, nulla luctus pharetra vulputate, felis tellus mollis orci, sed rhoncus sapien nunc eget.\n			</p>\n		</div>\n	</div>\n	<div class="about__section__right">\n		<div class="about__image">\n <img src="../../../content/about.jpg">\n		</div>\n	</div>\n</div>\n </section>\n\n<!--<section class="why__section section3">\n        <div class="container">\n            <div class="section__title section__title__large text__center"><span class="orange">Почему</span> выбирают нас\n            </div>\n\n            <div class="why__list">\n                <div class="why__item">\n                    <div class="why__item__image">\n                        <img src="content/why1.png"/>\n                    </div>\n                    <div class="why__item__title">Более 7 лет</div>\n                    <div class="why__item__text">Работаем одним составом</div>\n                </div>\n                <div class="why__item">\n                    <div class="why__item__image">\n                        <img src="content/why2.png"/>\n                    </div>\n                    <div class="why__item__title">Бесплатный замер</div>\n                    <div class="why__item__text">Выезд в день обращения, производим расчет сразу на месте</div>\n                </div>\n                <div class="why__item">\n                    <div class="why__item__image">\n                        <img src="content/why3.png"/>\n                    </div>\n                    <div class="why__item__title">Бесплатно</div>\n                    <div class="why__item__text">Сервисное обслуживание всех выполненных работ</div>\n                </div>\n                <div class="why__item">\n                    <div class="why__item__image">\n                        <img src="content/why4.png"/>\n                    </div>\n                    <div class="why__item__title">Высокое качество</div>\n                    <div class="why__item__text">Монтажных работ<br/>и обслуживания</div>\n                </div>\n                <div class="why__item">\n                    <div class="why__item__image">\n                        <img src="content/why5.png"/>\n                    </div>\n                    <div class="why__item__title">Гос. заказчики</div>\n                    <div class="why__item__text">Довольны нашей работой</div>\n                </div>\n            </div>\n        </div>\n    </section>-->\n<?$APPLICATION->IncludeComponent("bitrix:news.list", "WhyUs", Array(\n	"ACTIVE_DATE_FORMAT" => "d.m.Y",	// Формат показа даты\n		"ADD_SECTIONS_CHAIN" => "Y",	// Включать раздел в цепочку навигации\n		"AJAX_MODE" => "N",	// Включить режим AJAX\n		"AJAX_OPTION_ADDITIONAL" => "",	// Дополнительный идентификатор\n		"AJAX_OPTION_HISTORY" => "N",	// Включить эмуляцию навигации браузера\n		"AJAX_OPTION_JUMP" => "N",	// Включить прокрутку к началу компонента\n		"AJAX_OPTION_STYLE" => "Y",	// Включить подгрузку стилей\n		"CACHE_FILTER" => "N",	// Кешировать при установленном фильтре\n		"CACHE_GROUPS" => "Y",	// Учитывать права доступа\n		"CACHE_TIME" => "36000000",	// Время кеширования (сек.)\n		"CACHE_TYPE" => "A",	// Тип кеширования\n		"CHECK_DATES" => "Y",	// Показывать только активные на данный момент элементы\n		"DETAIL_URL" => "",	// URL страницы детального просмотра (по умолчанию - из настроек инфоблока)\n		"DISPLAY_BOTTOM_PAGER" => "Y",	// Выводить под списком\n		"DISPLAY_DATE" => "Y",	// Выводить дату элемента\n		"DISPLAY_NAME" => "Y",	// Выводить название элемента\n		"DISPLAY_PICTURE" => "Y",	// Выводить изображение для анонса\n		"DISPLAY_PREVIEW_TEXT" => "Y",	// Выводить текст анонса\n		"DISPLAY_TOP_PAGER" => "N",	// Выводить над списком\n		"FIELD_CODE" => array(	// Поля\n			0 => "",\n			1 => "",\n		),\n		"FILTER_NAME" => "",	// Фильтр\n		"HIDE_LINK_WHEN_NO_DETAIL" => "N",	// Скрывать ссылку, если нет детального описания\n		"IBLOCK_ID" => "4",	// Код информационного блока\n		"IBLOCK_TYPE" => "why_us",	// Тип информационного блока (используется только для проверки)\n		"INCLUDE_IBLOCK_INTO_CHAIN" => "Y",	// Включать инфоблок в цепочку навигации\n		"INCLUDE_SUBSECTIONS" => "Y",	// Показывать элементы подразделов раздела\n		"MESSAGE_404" => "",	// Сообщение для показа (по умолчанию из компонента)\n		"NEWS_COUNT" => "5",	// Количество новостей на странице\n		"PAGER_BASE_LINK_ENABLE" => "N",	// Включить обработку ссылок\n		"PAGER_DESC_NUMBERING" => "N",	// Использовать обратную навигацию\n		"PAGER_DESC_NUMBERING_CACHE_TIME" => "36000",	// Время кеширования страниц для обратной навигации\n		"PAGER_SHOW_ALL" => "N",	// Показывать ссылку "Все"\n		"PAGER_SHOW_ALWAYS" => "N",	// Выводить всегда\n		"PAGER_TEMPLATE" => ".default",	// Шаблон постраничной навигации\n		"PAGER_TITLE" => "Новости",	// Название категорий\n		"PARENT_SECTION" => "",	// ID раздела\n		"PARENT_SECTION_CODE" => "",	// Код раздела\n		"PREVIEW_TRUNCATE_LEN" => "",	// Максимальная длина анонса для вывода (только для типа текст)\n		"PROPERTY_CODE" => array(	// Свойства\n			0 => "",\n			1 => "",\n		),\n		"SET_BROWSER_TITLE" => "Y",	// Устанавливать заголовок окна браузера\n		"SET_LAST_MODIFIED" => "N",	// Устанавливать в заголовках ответа время модификации страницы\n		"SET_META_DESCRIPTION" => "Y",	// Устанавливать описание страницы\n		"SET_META_KEYWORDS" => "Y",	// Устанавливать ключевые слова страницы\n		"SET_STATUS_404" => "N",	// Устанавливать статус 404\n		"SET_TITLE" => "Y",	// Устанавливать заголовок страницы\n		"SHOW_404" => "N",	// Показ специальной страницы\n		"SORT_BY1" => "ACTIVE_FROM",	// Поле для первой сортировки новостей\n		"SORT_BY2" => "SORT",	// Поле для второй сортировки новостей\n		"SORT_ORDER1" => "DESC",	// Направление для первой сортировки новостей\n		"SORT_ORDER2" => "ASC",	// Направление для второй сортировки новостей\n		"STRICT_SECTION_CHECK" => "N",	// Строгая проверка раздела для показа списка\n	),\n	false\n);?> <section class="call__section section4">\n\n<div class="container clearfix">\n	<div class="call__section__left">\n		<div class="section__title section__middle">\n			 Закажите замер бесплатно\n		</div>\n		<div class="section__delimer">\n		</div>\n		<div class="section__text">\n			 Получите бесплатный расчет стоимости своего потолка прямо сейчас!\n		</div>\n	</div>\n	<div class="call__section__right">\n		<div class="call__section__form">\n			<form class="form js_form">\n				<div class="form__fields__wrap">\n					<div class="form__field form__required">\n <input type="text" class="form__control" placeholder="Имя" data-required="true" data-rule="name">\n					</div>\n					<div class="form__field form__required">\n <input type="text" class="form__control phone-mask" placeholder="Телефон" data-required="true" data-rule="phone">\n					</div>\n <span class="error__text">Заполните все поля</span>\n				</div>\n				<div class="form__fields__wrap">\n					<div class="form__field call__text">\n						 Введите Ваши данные, и мы перезвоним Вам в ближайшее время\n					</div>\n					<div class="form__field">\n <button class="button button__call__form">Заказать замер</button>\n					</div>\n				</div>\n			</form>\n		</div>\n	</div>\n</div>\n </section>\n<!--<section class="reviews__section section5">\n        <div class="container">\n            <div class="section__title section__title__large text__center"><span class="orange">Отзывы</span> и\n                благодарности\n            </div>\n            <div class="clearfix">\n                <div class="flamp__block">\n                    <a class="flamp-widget" href="https://novosibirsk.flamp.ru/firm/ampir_novosibirsk_ooo-141266769810424"\n                       data-flamp-widget-type="responsive-new" data-flamp-widget-count="1"\n                       data-flamp-widget-id="141266769810424" data-flamp-widget-width="100%">Отзывы о нас на Флампе</a>\n                    <script>!function (d, s) {\n                            var js, fjs = d.getElementsByTagName(s)[0];\n                            js = d.createElement(s);\n                            js.async = 1;\n                            js.src = "//widget.flamp.ru/loader.js";\n                            fjs.parentNode.insertBefore(js, fjs);\n                        }(document, "script");</script>\n                </div>\n                <div class="reviews__slider__block">\n                    <div class="reviews__slider js__reviews">\n                        <div class="review__slide">\n                            <div class="review__item">\n                                <div class="review__image review__image_left_top">\n                                    <a href="content/r1.jpg" class="fancybox" rel="reviews">\n                                        <img src="content/r1.jpg"/>\n                                    </a>\n                                </div>\n                                <div class="review__image review__image_right_bottom">\n                                    <a href="content/r2.jpg" class="fancybox" rel="reviews">\n                                        <img src="content/r2.jpg"/>\n                                    </a>\n                                </div>\n                            </div>\n                        </div>\n                        <div class="review__slide">\n                            <div class="review__item">\n                                <div class="review__image review__image_left_top">\n                                    <a href="content/r1.jpg" class="fancybox" rel="reviews">\n                                        <img src="content/r1.jpg"/>\n                                    </a>\n                                </div>\n                                <div class="review__image review__image_right_bottom">\n                                    <a href="content/r2.jpg" class="fancybox" rel="reviews">\n                                        <img src="content/r2.jpg"/>\n                                    </a>\n                                </div>\n                            </div>\n                        </div>\n                        <div class="review__slide">\n                            <div class="review__item">\n                                <div class="review__image review__image_left_top">\n                                    <a href="content/r1.jpg" class="fancybox" rel="reviews">\n                                        <img src="content/r1.jpg"/>\n                                    </a>\n                                </div>\n                                <div class="review__image review__image_right_bottom">\n                                    <a href="content/r2.jpg" class="fancybox" rel="reviews">\n                                        <img src="content/r2.jpg"/>\n                                    </a>\n                                </div>\n                            </div>\n                        </div>\n                    </div>\n                </div>\n            </div>\n        </div>\n    </section>--> <?$APPLICATION->IncludeComponent(\n	"bitrix:news.list",\n	"",\n	Array(\n		"ACTIVE_DATE_FORMAT" => "d.m.Y",\n		"ADD_SECTIONS_CHAIN" => "Y",\n		"AJAX_MODE" => "N",\n		"AJAX_OPTION_ADDITIONAL" => "",\n		"AJAX_OPTION_HISTORY" => "N",\n		"AJAX_OPTION_JUMP" => "N",\n		"AJAX_OPTION_STYLE" => "Y",\n		"CACHE_FILTER" => "N",\n		"CACHE_GROUPS" => "Y",\n		"CACHE_TIME" => "36000000",\n		"CACHE_TYPE" => "A",\n		"CHECK_DATES" => "Y",\n		"DETAIL_URL" => "",\n		"DISPLAY_BOTTOM_PAGER" => "Y",\n		"DISPLAY_DATE" => "Y",\n		"DISPLAY_NAME" => "Y",\n		"DISPLAY_PICTURE" => "Y",\n		"DISPLAY_PREVIEW_TEXT" => "Y",\n		"DISPLAY_TOP_PAGER" => "N",\n		"FIELD_CODE" => array("",""),\n		"FILTER_NAME" => "",\n		"HIDE_LINK_WHEN_NO_DETAIL" => "N",\n		"IBLOCK_ID" => "5",\n		"IBLOCK_TYPE" => "reviews",\n		"INCLUDE_IBLOCK_INTO_CHAIN" => "Y",\n		"INCLUDE_SUBSECTIONS" => "Y",\n		"MESSAGE_404" => "",\n		"NEWS_COUNT" => "1",\n		"PAGER_BASE_LINK_ENABLE" => "N",\n		"PAGER_DESC_NUMBERING" => "N",\n		"PAGER_DESC_NUMBERING_CACHE_TIME" => "36000",\n		"PAGER_SHOW_ALL" => "N",\n		"PAGER_SHOW_ALWAYS" => "N",\n		"PAGER_TEMPLATE" => ".default",\n		"PAGER_TITLE" => "Новости",\n		"PARENT_SECTION" => "",\n		"PARENT_SECTION_CODE" => "",\n		"PREVIEW_TRUNCATE_LEN" => "",\n		"PROPERTY_CODE" => array("",""),\n		"SET_BROWSER_TITLE" => "Y",\n		"SET_LAST_MODIFIED" => "N",\n		"SET_META_DESCRIPTION" => "Y",\n		"SET_META_KEYWORDS" => "Y",\n		"SET_STATUS_404" => "N",\n		"SET_TITLE" => "Y",\n		"SHOW_404" => "N",\n		"SORT_BY1" => "ACTIVE_FROM",\n		"SORT_BY2" => "SORT",\n		"SORT_ORDER1" => "DESC",\n		"SORT_ORDER2" => "ASC",\n		"STRICT_SECTION_CHECK" => "N"\n	)\n);?> <section class="contacts__section section6">\n        <div class="container">\n            <div class="section__title section__title__large text__center"><span class="orange">Контактная</span> информация\n            </div>\n\n            <div class="contacts__list">\n                <div class="contacts__item">\n                    <div class="contacts__image">\n                        <img src="content/c1.png"/>\n                    </div>\n                    <div class="contacts__text">г. Новосибирск, ул. Ленина, д.1,<br/>офис 100</div>\n                </div>\n                <div class="contacts__item">\n                    <div class="contacts__image">\n                        <img src="content/c2.png"/>\n                    </div>\n                    <div class="contacts__text">10:00 - 20:00,<br/>без выходных</div>\n                </div>\n                <div class="contacts__item">\n                    <div class="contacts__image">\n                        <img src="content/c3.png"/>\n                    </div>\n                    <div class="contacts__text">8 (383) 000-00-00</div>\n                </div>\n                <div class="contacts__item">\n                    <div class="contacts__image">\n                        <img src="content/c4.png"/>\n                    </div>\n                    <div class="contacts__text">ampir_nsk@mail.ru</div>\n                </div>\n            </div>\n        </div>\n    </section>\n<?//$APPLICATION->IncludeComponent(\n//	"bitrix:news.list",\n//	".default",\n//	array(\n//		"ACTIVE_DATE_FORMAT" => "d.m.Y",\n//		"ADD_SECTIONS_CHAIN" => "Y",\n//		"AJAX_MODE" => "N",\n//		"AJAX_OPTION_ADDITIONAL" => "",\n//		"AJAX_OPTION_HISTORY" => "N",\n//		"AJAX_OPTION_JUMP" => "N",\n//		"AJAX_OPTION_STYLE" => "Y",\n//		"CACHE_FILTER" => "N",\n//		"CACHE_GROUPS" => "Y",\n//		"CACHE_TIME" => "36000000",\n//		"CACHE_TYPE" => "A",\n//		"CHECK_DATES" => "Y",\n//		"DETAIL_URL" => "",\n//		"DISPLAY_BOTTOM_PAGER" => "Y",\n//		"DISPLAY_DATE" => "Y",\n//		"DISPLAY_NAME" => "Y",\n//		"DISPLAY_PICTURE" => "Y",\n//		"DISPLAY_PREVIEW_TEXT" => "Y",\n//		"DISPLAY_TOP_PAGER" => "N",\n//		"FIELD_CODE" => array(\n//			0 => "",\n//			1 => "",\n//		),\n//		"FILTER_NAME" => "",\n//		"HIDE_LINK_WHEN_NO_DETAIL" => "N",\n//		"IBLOCK_ID" => "6",\n//		"IBLOCK_TYPE" => "contacts",\n//		"INCLUDE_IBLOCK_INTO_CHAIN" => "Y",\n//		"INCLUDE_SUBSECTIONS" => "Y",\n//		"MESSAGE_404" => "",\n//		"NEWS_COUNT" => "1",\n//		"PAGER_BASE_LINK_ENABLE" => "N",\n//		"PAGER_DESC_NUMBERING" => "N",\n//		"PAGER_DESC_NUMBERING_CACHE_TIME" => "36000",\n//		"PAGER_SHOW_ALL" => "N",\n//		"PAGER_SHOW_ALWAYS" => "N",\n//		"PAGER_TEMPLATE" => ".default",\n//		"PAGER_TITLE" => "Новости",\n//		"PARENT_SECTION" => "",\n//		"PARENT_SECTION_CODE" => "",\n//		"PREVIEW_TRUNCATE_LEN" => "",\n//		"PROPERTY_CODE" => array(\n//			0 => "",\n//			1 => "",\n//		),\n//		"SET_BROWSER_TITLE" => "Y",\n//		"SET_LAST_MODIFIED" => "N",\n//		"SET_META_DESCRIPTION" => "Y",\n//		"SET_META_KEYWORDS" => "Y",\n//		"SET_STATUS_404" => "N",\n//		"SET_TITLE" => "Y",\n//		"SHOW_404" => "N",\n//		"SORT_BY1" => "ACTIVE_FROM",\n//		"SORT_BY2" => "SORT",\n//		"SORT_ORDER1" => "DESC",\n//		"SORT_ORDER2" => "ASC",\n//		"STRICT_SECTION_CHECK" => "N",\n//		"COMPONENT_TEMPLATE" => ".default",\n//		"TEMPLATE_THEME" => "blue",\n//		"MEDIA_PROPERTY" => "",\n//		"SLIDER_PROPERTY" => "",\n//		"SEARCH_PAGE" => "/search/",\n//		"USE_RATING" => "N",\n//		"USE_SHARE" => "N"\n//	),\n//	false\n//);?>\n\n    <section class="map__section">\n    <div class="map__2gis" id="map">\n    </div>\n     </section> <a href="#" class="to__top"></a><?require($_SERVER["DOCUMENT_ROOT"]."/bitrix/footer.php");?>";}', 1, 1611467613),
	('1e383bf88c775808c557d8ab87e8ec8f8', 'fileman', 'edit_menu', 'CFileman::UndoEditFile', 'a:2:{s:7:"absPath";s:58:"C:/openserver/domains/localhost/bitrix2.loc/.left.menu.php";s:7:"content";s:200:"<?\n$aMenuLinks = Array(\n	Array(\n		"Наши проекты", \n		"#section1", \n		Array(), \n		Array(), \n		"" \n	),\n	Array(\n		"О компании", \n		"#section2", \n		Array(), \n		Array(), \n		"" \n	)\n);\n?>";}', 1, 1611474393),
	('23c554a10951daf3f77452d19e2854089', 'main', 'autosave', 'CAutoSave::_Restore', 'a:11:{s:9:"submitbtn";s:0:"";s:4:"mode";s:6:"public";s:4:"save";s:1:"Y";s:4:"site";s:2:"s1";s:8:"template";s:12:"page_inc.php";s:10:"templateID";s:4:"main";s:9:"subdialog";s:0:"";s:8:"back_url";s:38:"/?bitrix_include_areas=Y&clear_cache=Y";s:5:"title";s:0:"";s:4:"path";s:14:"/index_inc.php";s:11:"filesrc_pub";s:86:"<img src="content/c4.png">\n<div class="contacts__text">\n	ampir_nsk@mail.ru\n</div>\n<br>";}', 1, 1611472018),
	('2b542474be772daac154df5686f12bbd1', 'main', 'autosave', 'CAutoSave::_Restore', 'a:3:{s:3:"sql";s:21:"select *\nfrom b_event";s:7:"execute";s:0:"";s:18:"editTab_active_tab";s:4:"tab1";}', 1, 1611555802);
/*!40000 ALTER TABLE `b_undo` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_urlpreview_metadata
DROP TABLE IF EXISTS `b_urlpreview_metadata`;
CREATE TABLE IF NOT EXISTS `b_urlpreview_metadata` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `URL` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `DATE_INSERT` datetime NOT NULL,
  `DATE_EXPIRE` datetime DEFAULT NULL,
  `TITLE` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `IMAGE_ID` int(11) DEFAULT NULL,
  `IMAGE` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMBED` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXTRA` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_URLPREVIEW_METADATA_URL` (`URL`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_urlpreview_metadata: ~0 rows (приблизительно)
DELETE FROM `b_urlpreview_metadata`;
/*!40000 ALTER TABLE `b_urlpreview_metadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_urlpreview_metadata` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_urlpreview_route
DROP TABLE IF EXISTS `b_urlpreview_route`;
CREATE TABLE IF NOT EXISTS `b_urlpreview_route` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ROUTE` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CLASS` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `PARAMETERS` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_URLPREVIEW_ROUTE_ROUTE` (`ROUTE`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_urlpreview_route: ~0 rows (приблизительно)
DELETE FROM `b_urlpreview_route`;
/*!40000 ALTER TABLE `b_urlpreview_route` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_urlpreview_route` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_user
DROP TABLE IF EXISTS `b_user`;
CREATE TABLE IF NOT EXISTS `b_user` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `LOGIN` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `PASSWORD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CHECKWORD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_LOGIN` datetime DEFAULT NULL,
  `DATE_REGISTER` datetime NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_PROFESSION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_WWW` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_ICQ` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_GENDER` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_BIRTHDATE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_PHOTO` int(18) DEFAULT NULL,
  `PERSONAL_PHONE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_FAX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_MOBILE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_PAGER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_STREET` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_MAILBOX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_CITY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_STATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_ZIP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_COUNTRY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_NOTES` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_COMPANY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_DEPARTMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_POSITION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_WWW` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_PHONE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_FAX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_PAGER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_STREET` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_MAILBOX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_CITY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_STATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_ZIP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_COUNTRY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_PROFILE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_LOGO` int(18) DEFAULT NULL,
  `WORK_NOTES` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `ADMIN_NOTES` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `STORED_HASH` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_BIRTHDAY` date DEFAULT NULL,
  `EXTERNAL_AUTH_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CHECKWORD_TIME` datetime DEFAULT NULL,
  `SECOND_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONFIRM_CODE` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LOGIN_ATTEMPTS` int(18) DEFAULT NULL,
  `LAST_ACTIVITY_DATE` datetime DEFAULT NULL,
  `AUTO_TIME_ZONE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIME_ZONE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIME_ZONE_OFFSET` int(18) DEFAULT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BX_USER_ID` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BLOCKED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_login` (`LOGIN`,`EXTERNAL_AUTH_ID`),
  KEY `ix_b_user_email` (`EMAIL`),
  KEY `ix_b_user_activity_date` (`LAST_ACTIVITY_DATE`),
  KEY `IX_B_USER_XML_ID` (`XML_ID`),
  KEY `ix_user_last_login` (`LAST_LOGIN`),
  KEY `ix_user_date_register` (`DATE_REGISTER`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_user: ~1 rows (приблизительно)
DELETE FROM `b_user`;
/*!40000 ALTER TABLE `b_user` DISABLE KEYS */;
INSERT INTO `b_user` (`ID`, `TIMESTAMP_X`, `LOGIN`, `PASSWORD`, `CHECKWORD`, `ACTIVE`, `NAME`, `LAST_NAME`, `EMAIL`, `LAST_LOGIN`, `DATE_REGISTER`, `LID`, `PERSONAL_PROFESSION`, `PERSONAL_WWW`, `PERSONAL_ICQ`, `PERSONAL_GENDER`, `PERSONAL_BIRTHDATE`, `PERSONAL_PHOTO`, `PERSONAL_PHONE`, `PERSONAL_FAX`, `PERSONAL_MOBILE`, `PERSONAL_PAGER`, `PERSONAL_STREET`, `PERSONAL_MAILBOX`, `PERSONAL_CITY`, `PERSONAL_STATE`, `PERSONAL_ZIP`, `PERSONAL_COUNTRY`, `PERSONAL_NOTES`, `WORK_COMPANY`, `WORK_DEPARTMENT`, `WORK_POSITION`, `WORK_WWW`, `WORK_PHONE`, `WORK_FAX`, `WORK_PAGER`, `WORK_STREET`, `WORK_MAILBOX`, `WORK_CITY`, `WORK_STATE`, `WORK_ZIP`, `WORK_COUNTRY`, `WORK_PROFILE`, `WORK_LOGO`, `WORK_NOTES`, `ADMIN_NOTES`, `STORED_HASH`, `XML_ID`, `PERSONAL_BIRTHDAY`, `EXTERNAL_AUTH_ID`, `CHECKWORD_TIME`, `SECOND_NAME`, `CONFIRM_CODE`, `LOGIN_ATTEMPTS`, `LAST_ACTIVITY_DATE`, `AUTO_TIME_ZONE`, `TIME_ZONE`, `TIME_ZONE_OFFSET`, `TITLE`, `BX_USER_ID`, `LANGUAGE_ID`, `BLOCKED`) VALUES
	(1, NULL, 'admin', '$6$Ue20J25qBKJtxpej$NkGn/7X9PouV74YnBBnGnsXd52om02qMk/NWZGa3cjXSJIMXn.09U0cfy/JeMeZh5xbBDQWOUx9klGdc8orkA/', '$6$KK3CkziLX0uxKioa$0PsuiEZv1mYuW7.OUwLa0E9YuXt7xMzPDY0S4TsxFeyWAdynyX1tG4OejIIYt4XUQS9vWufQVrLqiUC.Gds8P.', 'Y', '', '', 'fed8055@yandex.ru', '2021-01-25 11:27:45', '2021-01-22 17:19:47', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-22 17:19:47', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N');
/*!40000 ALTER TABLE `b_user` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_user_access
DROP TABLE IF EXISTS `b_user_access`;
CREATE TABLE IF NOT EXISTS `b_user_access` (
  `USER_ID` int(11) DEFAULT NULL,
  `PROVIDER_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACCESS_CODE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `ix_ua_user_provider` (`USER_ID`,`PROVIDER_ID`),
  KEY `ix_ua_user_access` (`USER_ID`,`ACCESS_CODE`),
  KEY `ix_ua_access` (`ACCESS_CODE`),
  KEY `ix_ua_provider` (`PROVIDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_user_access: ~6 rows (приблизительно)
DELETE FROM `b_user_access`;
/*!40000 ALTER TABLE `b_user_access` DISABLE KEYS */;
INSERT INTO `b_user_access` (`USER_ID`, `PROVIDER_ID`, `ACCESS_CODE`) VALUES
	(0, 'group', 'G2'),
	(1, 'group', 'G1'),
	(1, 'group', 'G3'),
	(1, 'group', 'G4'),
	(1, 'group', 'G2'),
	(1, 'user', 'U1');
/*!40000 ALTER TABLE `b_user_access` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_user_access_check
DROP TABLE IF EXISTS `b_user_access_check`;
CREATE TABLE IF NOT EXISTS `b_user_access_check` (
  `USER_ID` int(11) DEFAULT NULL,
  `PROVIDER_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `ix_uac_user_provider` (`USER_ID`,`PROVIDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_user_access_check: ~0 rows (приблизительно)
DELETE FROM `b_user_access_check`;
/*!40000 ALTER TABLE `b_user_access_check` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_user_access_check` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_user_auth_action
DROP TABLE IF EXISTS `b_user_auth_action`;
CREATE TABLE IF NOT EXISTS `b_user_auth_action` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `PRIORITY` int(11) NOT NULL DEFAULT 100,
  `ACTION` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTION_DATE` datetime NOT NULL,
  `APPLICATION_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_auth_action_user` (`USER_ID`,`PRIORITY`),
  KEY `ix_auth_action_date` (`ACTION_DATE`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_user_auth_action: ~0 rows (приблизительно)
DELETE FROM `b_user_auth_action`;
/*!40000 ALTER TABLE `b_user_auth_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_user_auth_action` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_user_auth_code
DROP TABLE IF EXISTS `b_user_auth_code`;
CREATE TABLE IF NOT EXISTS `b_user_auth_code` (
  `USER_ID` int(11) NOT NULL,
  `CODE_TYPE` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'email',
  `OTP_SECRET` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `ATTEMPTS` int(11) DEFAULT 0,
  `DATE_SENT` datetime DEFAULT NULL,
  `DATE_RESENT` datetime DEFAULT NULL,
  PRIMARY KEY (`USER_ID`,`CODE_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_user_auth_code: ~0 rows (приблизительно)
DELETE FROM `b_user_auth_code`;
/*!40000 ALTER TABLE `b_user_auth_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_user_auth_code` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_user_counter
DROP TABLE IF EXISTS `b_user_counter`;
CREATE TABLE IF NOT EXISTS `b_user_counter` (
  `USER_ID` int(18) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '**',
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CNT` int(18) NOT NULL DEFAULT 0,
  `LAST_DATE` datetime DEFAULT NULL,
  `TIMESTAMP_X` datetime NOT NULL DEFAULT '3000-01-01 00:00:00',
  `TAG` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PARAMS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `SENT` char(1) COLLATE utf8_unicode_ci DEFAULT '0',
  PRIMARY KEY (`USER_ID`,`SITE_ID`,`CODE`),
  KEY `ix_buc_tag` (`TAG`),
  KEY `ix_buc_code` (`CODE`),
  KEY `ix_buc_ts` (`TIMESTAMP_X`),
  KEY `ix_buc_sent_userid` (`SENT`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_user_counter: ~0 rows (приблизительно)
DELETE FROM `b_user_counter`;
/*!40000 ALTER TABLE `b_user_counter` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_user_counter` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_user_digest
DROP TABLE IF EXISTS `b_user_digest`;
CREATE TABLE IF NOT EXISTS `b_user_digest` (
  `USER_ID` int(11) NOT NULL,
  `DIGEST_HA1` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_user_digest: ~0 rows (приблизительно)
DELETE FROM `b_user_digest`;
/*!40000 ALTER TABLE `b_user_digest` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_user_digest` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_user_field
DROP TABLE IF EXISTS `b_user_field`;
CREATE TABLE IF NOT EXISTS `b_user_field` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENTITY_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(11) DEFAULT NULL,
  `MULTIPLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `MANDATORY` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SHOW_FILTER` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SHOW_IN_LIST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `EDIT_IN_LIST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `IS_SEARCHABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SETTINGS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_user_type_entity` (`ENTITY_ID`,`FIELD_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_user_field: ~7 rows (приблизительно)
DELETE FROM `b_user_field`;
/*!40000 ALTER TABLE `b_user_field` DISABLE KEYS */;
INSERT INTO `b_user_field` (`ID`, `ENTITY_ID`, `FIELD_NAME`, `USER_TYPE_ID`, `XML_ID`, `SORT`, `MULTIPLE`, `MANDATORY`, `SHOW_FILTER`, `SHOW_IN_LIST`, `EDIT_IN_LIST`, `IS_SEARCHABLE`, `SETTINGS`) VALUES
	(1, 'BLOG_POST', 'UF_BLOG_POST_DOC', 'file', 'UF_BLOG_POST_DOC', 100, 'Y', 'N', 'N', 'N', 'Y', 'Y', 'a:0:{}'),
	(2, 'BLOG_COMMENT', 'UF_BLOG_COMMENT_DOC', 'file', 'UF_BLOG_COMMENT_DOC', 100, 'Y', 'N', 'N', 'N', 'Y', 'Y', 'a:0:{}'),
	(3, 'BLOG_POST', 'UF_BLOG_POST_URL_PRV', 'url_preview', 'UF_BLOG_POST_URL_PRV', 100, 'N', 'N', 'N', 'N', 'Y', 'Y', 'a:0:{}'),
	(4, 'BLOG_COMMENT', 'UF_BLOG_COMM_URL_PRV', 'url_preview', 'UF_BLOG_COMM_URL_PRV', 100, 'N', 'N', 'N', 'N', 'Y', 'Y', 'a:0:{}'),
	(5, 'BLOG_POST', 'UF_GRATITUDE', 'integer', 'UF_GRATITUDE', 100, 'N', 'N', 'N', 'N', 'Y', 'N', 'a:0:{}'),
	(6, 'FORUM_MESSAGE', 'UF_FORUM_MES_URL_PRV', 'url_preview', 'UF_FORUM_MES_URL_PRV', 100, 'N', 'N', 'N', 'N', 'Y', 'N', 'a:0:{}'),
	(7, 'FORUM_MESSAGE', 'UF_TASK_COMMENT_TYPE', 'integer', 'UF_TASK_COMMENT_TYPE', 100, 'N', 'N', 'N', 'N', 'Y', 'N', 'a:0:{}');
/*!40000 ALTER TABLE `b_user_field` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_user_field_confirm
DROP TABLE IF EXISTS `b_user_field_confirm`;
CREATE TABLE IF NOT EXISTS `b_user_field_confirm` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(18) NOT NULL,
  `DATE_CHANGE` timestamp NULL DEFAULT NULL,
  `FIELD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FIELD_VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONFIRM_CODE` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `ATTEMPTS` int(18) DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `ix_b_user_field_confirm1` (`USER_ID`,`CONFIRM_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_user_field_confirm: ~0 rows (приблизительно)
DELETE FROM `b_user_field_confirm`;
/*!40000 ALTER TABLE `b_user_field_confirm` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_user_field_confirm` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_user_field_enum
DROP TABLE IF EXISTS `b_user_field_enum`;
CREATE TABLE IF NOT EXISTS `b_user_field_enum` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_FIELD_ID` int(11) DEFAULT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SORT` int(11) NOT NULL DEFAULT 500,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_user_field_enum` (`USER_FIELD_ID`,`XML_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_user_field_enum: ~0 rows (приблизительно)
DELETE FROM `b_user_field_enum`;
/*!40000 ALTER TABLE `b_user_field_enum` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_user_field_enum` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_user_field_lang
DROP TABLE IF EXISTS `b_user_field_lang`;
CREATE TABLE IF NOT EXISTS `b_user_field_lang` (
  `USER_FIELD_ID` int(11) NOT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `EDIT_FORM_LABEL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIST_COLUMN_LABEL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIST_FILTER_LABEL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ERROR_MESSAGE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HELP_MESSAGE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`USER_FIELD_ID`,`LANGUAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_user_field_lang: ~0 rows (приблизительно)
DELETE FROM `b_user_field_lang`;
/*!40000 ALTER TABLE `b_user_field_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_user_field_lang` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_user_field_permission
DROP TABLE IF EXISTS `b_user_field_permission`;
CREATE TABLE IF NOT EXISTS `b_user_field_permission` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ENTITY_TYPE_ID` tinyint(2) unsigned NOT NULL,
  `USER_FIELD_ID` int(10) unsigned NOT NULL,
  `ACCESS_CODE` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `PERMISSION_ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ROLE_ID` (`ENTITY_TYPE_ID`),
  KEY `GROUP_ID` (`USER_FIELD_ID`),
  KEY `PERMISSION_ID` (`PERMISSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_user_field_permission: ~0 rows (приблизительно)
DELETE FROM `b_user_field_permission`;
/*!40000 ALTER TABLE `b_user_field_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_user_field_permission` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_user_group
DROP TABLE IF EXISTS `b_user_group`;
CREATE TABLE IF NOT EXISTS `b_user_group` (
  `USER_ID` int(18) NOT NULL,
  `GROUP_ID` int(18) NOT NULL,
  `DATE_ACTIVE_FROM` datetime DEFAULT NULL,
  `DATE_ACTIVE_TO` datetime DEFAULT NULL,
  UNIQUE KEY `ix_user_group` (`USER_ID`,`GROUP_ID`),
  KEY `ix_user_group_group` (`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_user_group: ~3 rows (приблизительно)
DELETE FROM `b_user_group`;
/*!40000 ALTER TABLE `b_user_group` DISABLE KEYS */;
INSERT INTO `b_user_group` (`USER_ID`, `GROUP_ID`, `DATE_ACTIVE_FROM`, `DATE_ACTIVE_TO`) VALUES
	(1, 1, NULL, NULL),
	(1, 3, NULL, NULL),
	(1, 4, NULL, NULL);
/*!40000 ALTER TABLE `b_user_group` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_user_hit_auth
DROP TABLE IF EXISTS `b_user_hit_auth`;
CREATE TABLE IF NOT EXISTS `b_user_hit_auth` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(18) NOT NULL,
  `HASH` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_USER_HIT_AUTH_1` (`HASH`),
  KEY `IX_USER_HIT_AUTH_2` (`USER_ID`),
  KEY `IX_USER_HIT_AUTH_3` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_user_hit_auth: ~0 rows (приблизительно)
DELETE FROM `b_user_hit_auth`;
/*!40000 ALTER TABLE `b_user_hit_auth` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_user_hit_auth` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_user_index
DROP TABLE IF EXISTS `b_user_index`;
CREATE TABLE IF NOT EXISTS `b_user_index` (
  `USER_ID` int(11) NOT NULL,
  `SEARCH_USER_CONTENT` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEARCH_DEPARTMENT_CONTENT` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEARCH_ADMIN_CONTENT` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECOND_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_POSITION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UF_DEPARTMENT_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`USER_ID`),
  FULLTEXT KEY `IXF_B_USER_INDEX_1` (`SEARCH_USER_CONTENT`),
  FULLTEXT KEY `IXF_B_USER_INDEX_2` (`SEARCH_DEPARTMENT_CONTENT`),
  FULLTEXT KEY `IXF_B_USER_INDEX_3` (`SEARCH_ADMIN_CONTENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_user_index: ~1 rows (приблизительно)
DELETE FROM `b_user_index`;
/*!40000 ALTER TABLE `b_user_index` DISABLE KEYS */;
INSERT INTO `b_user_index` (`USER_ID`, `SEARCH_USER_CONTENT`, `SEARCH_DEPARTMENT_CONTENT`, `SEARCH_ADMIN_CONTENT`, `NAME`, `LAST_NAME`, `SECOND_NAME`, `WORK_POSITION`, `UF_DEPARTMENT_NAME`) VALUES
	(1, '001', '', '001 srq8055 lnaqrk srq8055@lnaqrk.eh nqzva', '', '', '', '', '');
/*!40000 ALTER TABLE `b_user_index` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_user_index_selector
DROP TABLE IF EXISTS `b_user_index_selector`;
CREATE TABLE IF NOT EXISTS `b_user_index_selector` (
  `USER_ID` int(11) NOT NULL,
  `SEARCH_SELECTOR_CONTENT` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`USER_ID`),
  FULLTEXT KEY `IXF_B_USER_INDEX_SELECTOR_1` (`SEARCH_SELECTOR_CONTENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_user_index_selector: ~1 rows (приблизительно)
DELETE FROM `b_user_index_selector`;
/*!40000 ALTER TABLE `b_user_index_selector` DISABLE KEYS */;
INSERT INTO `b_user_index_selector` (`USER_ID`, `SEARCH_SELECTOR_CONTENT`) VALUES
	(1, '');
/*!40000 ALTER TABLE `b_user_index_selector` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_user_option
DROP TABLE IF EXISTS `b_user_option`;
CREATE TABLE IF NOT EXISTS `b_user_option` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `CATEGORY` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMMON` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_user_category_name` (`USER_ID`,`CATEGORY`,`NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=234 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_user_option: ~33 rows (приблизительно)
DELETE FROM `b_user_option`;
/*!40000 ALTER TABLE `b_user_option` DISABLE KEYS */;
INSERT INTO `b_user_option` (`ID`, `USER_ID`, `CATEGORY`, `NAME`, `VALUE`, `COMMON`) VALUES
	(1, 0, 'intranet', '~gadgets_admin_index', 'a:1:{i:0;a:1:{s:7:"GADGETS";a:8:{s:20:"ADMIN_INFO@333333333";a:3:{s:6:"COLUMN";i:0;s:3:"ROW";i:0;s:4:"HIDE";s:1:"N";}s:19:"HTML_AREA@444444444";a:5:{s:6:"COLUMN";i:0;s:3:"ROW";i:1;s:4:"HIDE";s:1:"N";s:8:"USERDATA";a:1:{s:7:"content";s:797:"<table class="bx-gadgets-info-site-table" cellspacing="0"><tr>	<td class="bx-gadget-gray">Создатель сайта:</td>	<td>Группа компаний &laquo;1С-Битрикс&raquo;.</td>	<td class="bx-gadgets-info-site-logo" rowspan="5"><img src="/bitrix/components/bitrix/desktop/templates/admin/images/site_logo.png"></td></tr><tr>	<td class="bx-gadget-gray">Адрес сайта:</td>	<td><a href="http://www.1c-bitrix.ru">www.1c-bitrix.ru</a></td></tr><tr>	<td class="bx-gadget-gray">Сайт сдан:</td>	<td>12 декабря 2010 г.</td></tr><tr>	<td class="bx-gadget-gray">Ответственное лицо:</td>	<td>Иван Иванов</td></tr><tr>	<td class="bx-gadget-gray">E-mail:</td>	<td><a href="mailto:info@1c-bitrix.ru">info@1c-bitrix.ru</a></td></tr></table>";}s:8:"SETTINGS";a:1:{s:9:"TITLE_STD";s:34:"Информация о сайте";}}s:25:"ADMIN_CHECKLIST@777888999";a:3:{s:6:"COLUMN";i:0;s:3:"ROW";i:2;s:4:"HIDE";s:1:"N";}s:19:"RSSREADER@777777777";a:4:{s:6:"COLUMN";i:1;s:3:"ROW";i:3;s:4:"HIDE";s:1:"N";s:8:"SETTINGS";a:3:{s:9:"TITLE_STD";s:33:"Новости 1С-Битрикс";s:3:"CNT";i:10;s:7:"RSS_URL";s:45:"https://www.1c-bitrix.ru/about/life/news/rss/";}}s:24:"ADMIN_SECURITY@555555555";a:3:{s:6:"COLUMN";i:1;s:3:"ROW";i:0;s:4:"HIDE";s:1:"N";}s:25:"ADMIN_SITESPEED@666666777";a:3:{s:6:"COLUMN";i:1;s:3:"ROW";i:1;s:4:"HIDE";s:1:"N";}s:23:"ADMIN_PERFMON@666666666";a:3:{s:6:"COLUMN";i:1;s:3:"ROW";i:2;s:4:"HIDE";s:1:"N";}s:23:"ADMIN_MARKETPALCE@22549";a:3:{s:6:"COLUMN";i:1;s:3:"ROW";i:3;s:4:"HIDE";s:1:"N";}}}}', 'Y'),
	(2, 1, 'admin_panel', 'settings', 'a:1:{s:4:"edit";s:2:"on";}', 'N'),
	(3, 1, 'hot_keys', 'user_defined', 'b:1;', 'N'),
	(4, 1, 'fileman', 'code_editor', 'a:1:{s:5:"theme";s:5:"light";}', 'N'),
	(6, 1, 'favorite', 'favorite_menu', 'a:1:{s:5:"stick";s:1:"N";}', 'N'),
	(8, 1, 'admin_menu', 'pos', 'a:1:{s:8:"sections";s:153:"menu_iblock_/why_us,menu_system,menu_module_settings,menu_iblock_%2Fwhy_us%2F4,menu_iblock_/reviews,menu_iblock_%2Freviews%2F5,menu_templates,menu_iblock";}', 'N'),
	(11, 1, 'main.interface.grid', 'tbl_iblock_admin_750dd17d83198dd551018232269fa242', 'a:3:{s:5:"views";a:1:{s:7:"default";a:3:{s:7:"columns";s:0:"";s:13:"columns_sizes";a:2:{s:6:"expand";i:1;s:7:"columns";a:0:{}}s:15:"sticked_columns";a:0:{}}}s:7:"filters";a:0:{}s:12:"current_view";s:7:"default";}', 'N'),
	(22, 1, 'main.interface.grid', 'tbl_iblock_750dd17d83198dd551018232269fa242', 'a:3:{s:5:"views";a:1:{s:7:"default";a:3:{s:7:"columns";s:0:"";s:13:"columns_sizes";a:2:{s:6:"expand";i:1;s:7:"columns";a:0:{}}s:15:"sticked_columns";a:0:{}}}s:7:"filters";a:0:{}s:12:"current_view";s:7:"default";}', 'N'),
	(23, 1, 'main.interface.grid', 'tbl_iblock_section_5ee644eec4b6e7ed627feaa7c5d599f3', 'a:3:{s:5:"views";a:1:{s:7:"default";a:3:{s:7:"columns";s:0:"";s:13:"columns_sizes";a:2:{s:6:"expand";i:1;s:7:"columns";a:0:{}}s:15:"sticked_columns";a:0:{}}}s:7:"filters";a:0:{}s:12:"current_view";s:7:"default";}', 'N'),
	(24, 1, 'main.interface.grid', 'tbl_iblock_admin_06fbe8df2d0c42241944323fa0e6581f', 'a:3:{s:5:"views";a:1:{s:7:"default";a:3:{s:7:"columns";s:0:"";s:13:"columns_sizes";a:2:{s:6:"expand";i:1;s:7:"columns";a:0:{}}s:15:"sticked_columns";a:0:{}}}s:7:"filters";a:0:{}s:12:"current_view";s:7:"default";}', 'N'),
	(25, 1, 'main.ui.filter', 'tbl_iblock_section_c64742b88d3c240da483303e66eada45', 'a:6:{s:14:"use_pin_preset";b:1;s:15:"deleted_presets";a:0:{}s:15:"default_presets";a:0:{}s:7:"default";s:14:"default_filter";s:6:"filter";s:14:"default_filter";s:7:"filters";a:1:{s:10:"tmp_filter";a:2:{s:6:"fields";a:1:{s:10:"SECTION_ID";s:1:"0";}s:11:"filter_rows";s:10:"SECTION_ID";}}}', 'N'),
	(31, 1, 'main.interface.grid', 'tbl_iblock_section_c64742b88d3c240da483303e66eada45', 'a:3:{s:5:"views";a:1:{s:7:"default";a:3:{s:7:"columns";s:0:"";s:13:"columns_sizes";a:2:{s:6:"expand";i:1;s:7:"columns";a:0:{}}s:15:"sticked_columns";a:0:{}}}s:7:"filters";a:0:{}s:12:"current_view";s:7:"default";}', 'N'),
	(32, 1, 'main.interface.grid', 'tbl_iblock_06fbe8df2d0c42241944323fa0e6581f', 'a:3:{s:5:"views";a:1:{s:7:"default";a:3:{s:7:"columns";s:0:"";s:13:"columns_sizes";a:2:{s:6:"expand";i:1;s:7:"columns";a:0:{}}s:15:"sticked_columns";a:0:{}}}s:7:"filters";a:0:{}s:12:"current_view";s:7:"default";}', 'N'),
	(35, 1, 'main.interface.grid', 'tbl_iblock_admin_4136a932eb7724a00cb87c3fb9e1ea1d', 'a:3:{s:5:"views";a:1:{s:7:"default";a:3:{s:7:"columns";s:0:"";s:13:"columns_sizes";a:2:{s:6:"expand";i:1;s:7:"columns";a:0:{}}s:15:"sticked_columns";a:0:{}}}s:7:"filters";a:0:{}s:12:"current_view";s:7:"default";}', 'N'),
	(44, 1, 'main.interface.grid', 'tbl_iblock_admin_74dcb1cec50854d2f880279f3dd19da9', 'a:3:{s:5:"views";a:1:{s:7:"default";a:3:{s:7:"columns";s:0:"";s:13:"columns_sizes";a:2:{s:6:"expand";i:1;s:7:"columns";a:0:{}}s:15:"sticked_columns";a:0:{}}}s:7:"filters";a:0:{}s:12:"current_view";s:7:"default";}', 'N'),
	(51, 1, 'main.ui.filter', 'tbl_iblock_element_c64742b88d3c240da483303e66eada45', 'a:6:{s:14:"use_pin_preset";b:1;s:15:"deleted_presets";a:0:{}s:15:"default_presets";a:0:{}s:7:"default";s:14:"default_filter";s:6:"filter";s:14:"default_filter";s:7:"filters";a:1:{s:14:"default_filter";a:0:{}}}', 'N'),
	(56, 1, 'main.interface.grid', 'tbl_iblock_element_c64742b88d3c240da483303e66eada45', 'a:3:{s:5:"views";a:1:{s:7:"default";a:3:{s:7:"columns";s:0:"";s:13:"columns_sizes";a:2:{s:6:"expand";i:1;s:7:"columns";a:0:{}}s:15:"sticked_columns";a:0:{}}}s:7:"filters";a:0:{}s:12:"current_view";s:7:"default";}', 'N'),
	(64, 1, 'html_editor', 'type_selector_DESCRIPTION', 'a:1:{s:4:"type";s:6:"editor";}', 'N'),
	(66, 1, 'html_editor', 'user_settings_', 'a:4:{s:13:"taskbar_shown";s:1:"1";s:14:"split_vertical";s:1:"0";s:4:"view";s:5:"split";s:11:"split_ratio";s:18:"0.8312100813702726";}', 'N'),
	(78, 1, 'bx.windowmanager.9.5', 'size_/bitrix/admin/public_file_edit.php', 'a:2:{s:5:"width";s:4:"1472";s:6:"height";s:3:"756";}', 'N'),
	(89, 1, 'html_editor', 'type_selector_PREVIEW_TEXT4', 'a:1:{s:4:"type";s:4:"html";}', 'N'),
	(106, 1, 'main.ui.filter', 'tbl_iblock_section_881cf6fa4474b7416b1203428b3ee67e', 'a:6:{s:14:"use_pin_preset";b:1;s:15:"deleted_presets";a:0:{}s:15:"default_presets";a:0:{}s:7:"default";s:14:"default_filter";s:6:"filter";s:14:"default_filter";s:7:"filters";a:1:{s:10:"tmp_filter";a:2:{s:6:"fields";a:1:{s:10:"SECTION_ID";s:1:"0";}s:11:"filter_rows";s:10:"SECTION_ID";}}}', 'N'),
	(112, 1, 'main.interface.grid', 'tbl_iblock_section_881cf6fa4474b7416b1203428b3ee67e', 'a:3:{s:5:"views";a:1:{s:7:"default";a:3:{s:7:"columns";s:0:"";s:13:"columns_sizes";a:2:{s:6:"expand";i:1;s:7:"columns";a:0:{}}s:15:"sticked_columns";a:0:{}}}s:7:"filters";a:0:{}s:12:"current_view";s:7:"default";}', 'N'),
	(119, 1, 'main.ui.filter', 'tbl_iblock_element_881cf6fa4474b7416b1203428b3ee67e', 'a:6:{s:14:"use_pin_preset";b:1;s:15:"deleted_presets";a:0:{}s:15:"default_presets";a:0:{}s:7:"default";s:14:"default_filter";s:6:"filter";s:14:"default_filter";s:7:"filters";a:1:{s:14:"default_filter";a:0:{}}}', 'N'),
	(124, 1, 'main.interface.grid', 'tbl_iblock_element_881cf6fa4474b7416b1203428b3ee67e', 'a:3:{s:5:"views";a:1:{s:7:"default";a:3:{s:7:"columns";s:0:"";s:13:"columns_sizes";a:2:{s:6:"expand";i:1;s:7:"columns";a:0:{}}s:15:"sticked_columns";a:0:{}}}s:7:"filters";a:0:{}s:12:"current_view";s:7:"default";}', 'N'),
	(125, 1, 'html_editor', 'type_selector_PREVIEW_TEXT5', 'a:1:{s:4:"type";s:6:"editor";}', 'N'),
	(135, 1, 'main.ui.filter', 'tbl_iblock_element_4e72250554f2e3d7ddb9c0b865d72254', 'a:6:{s:14:"use_pin_preset";b:1;s:15:"deleted_presets";a:0:{}s:15:"default_presets";a:0:{}s:7:"default";s:14:"default_filter";s:6:"filter";s:14:"default_filter";s:7:"filters";a:1:{s:14:"default_filter";a:0:{}}}', 'N'),
	(141, 1, 'main.interface.grid', 'tbl_iblock_element_4e72250554f2e3d7ddb9c0b865d72254', 'a:3:{s:5:"views";a:1:{s:7:"default";a:3:{s:7:"columns";s:0:"";s:13:"columns_sizes";a:2:{s:6:"expand";i:1;s:7:"columns";a:0:{}}s:15:"sticked_columns";a:0:{}}}s:7:"filters";a:0:{}s:12:"current_view";s:7:"default";}', 'N'),
	(142, 1, 'html_editor', 'type_selector_PREVIEW_TEXT6', 'a:1:{s:4:"type";s:4:"html";}', 'N'),
	(157, 1, 'bx.windowmanager.9.5', 'size_/bitrix/admin/component_props.php', 'a:2:{s:5:"width";s:3:"968";s:6:"height";s:3:"503";}', 'N'),
	(158, 1, 'bx.windowmanager.9.5', 'size_bx_component_properties_res', 'a:2:{s:5:"width";s:3:"954";s:6:"height";s:3:"543";}', 'N'),
	(164, 1, 'bx.windowmanager.9.5', 'size_/bitrix/admin/iblock_element_edit.php', 'a:2:{s:5:"width";s:4:"1125";s:6:"height";s:3:"613";}', 'N'),
	(204, 1, 'bx.windowmanager.9.5', 'size_/bitrix/admin/public_file_edit_src.php', 'a:2:{s:5:"width";s:3:"836";s:6:"height";s:3:"549";}', 'N'),
	(211, 1, 'main.interface.grid', 'tbl_iblock_74dcb1cec50854d2f880279f3dd19da9', 'a:3:{s:5:"views";a:1:{s:7:"default";a:3:{s:7:"columns";s:0:"";s:13:"columns_sizes";a:2:{s:6:"expand";i:1;s:7:"columns";a:0:{}}s:15:"sticked_columns";a:0:{}}}s:7:"filters";a:0:{}s:12:"current_view";s:7:"default";}', 'N'),
	(230, 1, 'filter', 'element_redirect_filter', 'a:1:{s:4:"rows";s:1:"0";}', 'N');
/*!40000 ALTER TABLE `b_user_option` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_user_password
DROP TABLE IF EXISTS `b_user_password`;
CREATE TABLE IF NOT EXISTS `b_user_password` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_ID` bigint(20) NOT NULL,
  `PASSWORD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CHANGE` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_user_password_user_date` (`USER_ID`,`DATE_CHANGE`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_user_password: ~1 rows (приблизительно)
DELETE FROM `b_user_password`;
/*!40000 ALTER TABLE `b_user_password` DISABLE KEYS */;
INSERT INTO `b_user_password` (`ID`, `USER_ID`, `PASSWORD`, `DATE_CHANGE`) VALUES
	(1, 1, '$6$Ue20J25qBKJtxpej$NkGn/7X9PouV74YnBBnGnsXd52om02qMk/NWZGa3cjXSJIMXn.09U0cfy/JeMeZh5xbBDQWOUx9klGdc8orkA/', '2021-01-22 13:19:47');
/*!40000 ALTER TABLE `b_user_password` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_user_phone_auth
DROP TABLE IF EXISTS `b_user_phone_auth`;
CREATE TABLE IF NOT EXISTS `b_user_phone_auth` (
  `USER_ID` int(11) NOT NULL,
  `PHONE_NUMBER` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `OTP_SECRET` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `ATTEMPTS` int(11) DEFAULT 0,
  `CONFIRMED` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `DATE_SENT` datetime DEFAULT NULL,
  PRIMARY KEY (`USER_ID`),
  UNIQUE KEY `ix_user_phone_auth_number` (`PHONE_NUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_user_phone_auth: ~0 rows (приблизительно)
DELETE FROM `b_user_phone_auth`;
/*!40000 ALTER TABLE `b_user_phone_auth` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_user_phone_auth` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_user_profile_history
DROP TABLE IF EXISTS `b_user_profile_history`;
CREATE TABLE IF NOT EXISTS `b_user_profile_history` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `EVENT_TYPE` int(11) DEFAULT NULL,
  `DATE_INSERT` datetime DEFAULT NULL,
  `REMOTE_ADDR` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_AGENT` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUEST_URI` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `UPDATED_BY_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_profile_history_user` (`USER_ID`),
  KEY `ix_profile_history_date` (`DATE_INSERT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_user_profile_history: ~0 rows (приблизительно)
DELETE FROM `b_user_profile_history`;
/*!40000 ALTER TABLE `b_user_profile_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_user_profile_history` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_user_profile_record
DROP TABLE IF EXISTS `b_user_profile_record`;
CREATE TABLE IF NOT EXISTS `b_user_profile_record` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `HISTORY_ID` int(11) NOT NULL,
  `FIELD` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATA` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_profile_record_history_field` (`HISTORY_ID`,`FIELD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_user_profile_record: ~0 rows (приблизительно)
DELETE FROM `b_user_profile_record`;
/*!40000 ALTER TABLE `b_user_profile_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_user_profile_record` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_user_session
DROP TABLE IF EXISTS `b_user_session`;
CREATE TABLE IF NOT EXISTS `b_user_session` (
  `SESSION_ID` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `SESSION_DATA` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SESSION_ID`),
  KEY `ix_user_session_time` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_user_session: ~0 rows (приблизительно)
DELETE FROM `b_user_session`;
/*!40000 ALTER TABLE `b_user_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_user_session` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_user_stored_auth
DROP TABLE IF EXISTS `b_user_stored_auth`;
CREATE TABLE IF NOT EXISTS `b_user_stored_auth` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(18) NOT NULL,
  `DATE_REG` datetime NOT NULL,
  `LAST_AUTH` datetime NOT NULL,
  `STORED_HASH` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `TEMP_HASH` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IP_ADDR` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ux_user_hash` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_user_stored_auth: ~2 rows (приблизительно)
DELETE FROM `b_user_stored_auth`;
/*!40000 ALTER TABLE `b_user_stored_auth` DISABLE KEYS */;
INSERT INTO `b_user_stored_auth` (`ID`, `USER_ID`, `DATE_REG`, `LAST_AUTH`, `STORED_HASH`, `TEMP_HASH`, `IP_ADDR`) VALUES
	(1, 1, '2021-01-22 17:19:47', '2021-01-22 17:19:47', '2cc54299cf7a5a78fd17067a8d94cebb', 'N', 2130706433),
	(2, 1, '2021-01-22 21:45:06', '2021-01-25 11:27:45', '496fd186682e93f571c403ebe07578d6', 'N', 2130706433);
/*!40000 ALTER TABLE `b_user_stored_auth` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_utm_blog_comment
DROP TABLE IF EXISTS `b_utm_blog_comment`;
CREATE TABLE IF NOT EXISTS `b_utm_blog_comment` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VALUE_ID` int(11) NOT NULL,
  `FIELD_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `VALUE_INT` int(11) DEFAULT NULL,
  `VALUE_DOUBLE` float DEFAULT NULL,
  `VALUE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_utm_BLOG_COMMENT_1` (`FIELD_ID`),
  KEY `ix_utm_BLOG_COMMENT_2` (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_utm_blog_comment: ~0 rows (приблизительно)
DELETE FROM `b_utm_blog_comment`;
/*!40000 ALTER TABLE `b_utm_blog_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_utm_blog_comment` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_utm_blog_post
DROP TABLE IF EXISTS `b_utm_blog_post`;
CREATE TABLE IF NOT EXISTS `b_utm_blog_post` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VALUE_ID` int(11) NOT NULL,
  `FIELD_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `VALUE_INT` int(11) DEFAULT NULL,
  `VALUE_DOUBLE` float DEFAULT NULL,
  `VALUE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_utm_BLOG_POST_1` (`FIELD_ID`),
  KEY `ix_utm_BLOG_POST_2` (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_utm_blog_post: ~0 rows (приблизительно)
DELETE FROM `b_utm_blog_post`;
/*!40000 ALTER TABLE `b_utm_blog_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_utm_blog_post` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_utm_forum_message
DROP TABLE IF EXISTS `b_utm_forum_message`;
CREATE TABLE IF NOT EXISTS `b_utm_forum_message` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VALUE_ID` int(11) NOT NULL,
  `FIELD_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `VALUE_INT` int(11) DEFAULT NULL,
  `VALUE_DOUBLE` float DEFAULT NULL,
  `VALUE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_utm_FORUM_MESSAGE_1` (`FIELD_ID`),
  KEY `ix_utm_FORUM_MESSAGE_2` (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_utm_forum_message: ~0 rows (приблизительно)
DELETE FROM `b_utm_forum_message`;
/*!40000 ALTER TABLE `b_utm_forum_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_utm_forum_message` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_uts_blog_comment
DROP TABLE IF EXISTS `b_uts_blog_comment`;
CREATE TABLE IF NOT EXISTS `b_uts_blog_comment` (
  `VALUE_ID` int(11) NOT NULL,
  `UF_BLOG_COMMENT_DOC` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `UF_BLOG_COMM_URL_PRV` int(11) DEFAULT NULL,
  PRIMARY KEY (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_uts_blog_comment: ~0 rows (приблизительно)
DELETE FROM `b_uts_blog_comment`;
/*!40000 ALTER TABLE `b_uts_blog_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_uts_blog_comment` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_uts_blog_post
DROP TABLE IF EXISTS `b_uts_blog_post`;
CREATE TABLE IF NOT EXISTS `b_uts_blog_post` (
  `VALUE_ID` int(11) NOT NULL,
  `UF_BLOG_POST_DOC` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `UF_BLOG_POST_URL_PRV` int(11) DEFAULT NULL,
  `UF_GRATITUDE` int(18) DEFAULT NULL,
  PRIMARY KEY (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_uts_blog_post: ~0 rows (приблизительно)
DELETE FROM `b_uts_blog_post`;
/*!40000 ALTER TABLE `b_uts_blog_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_uts_blog_post` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_uts_forum_message
DROP TABLE IF EXISTS `b_uts_forum_message`;
CREATE TABLE IF NOT EXISTS `b_uts_forum_message` (
  `VALUE_ID` int(11) NOT NULL,
  `UF_FORUM_MES_URL_PRV` int(11) DEFAULT NULL,
  `UF_TASK_COMMENT_TYPE` int(18) DEFAULT NULL,
  PRIMARY KEY (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_uts_forum_message: ~0 rows (приблизительно)
DELETE FROM `b_uts_forum_message`;
/*!40000 ALTER TABLE `b_uts_forum_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_uts_forum_message` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_vote
DROP TABLE IF EXISTS `b_vote`;
CREATE TABLE IF NOT EXISTS `b_vote` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CHANNEL_ID` int(18) NOT NULL DEFAULT 0,
  `C_SORT` int(18) DEFAULT 100,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ANONYMITY` int(11) NOT NULL DEFAULT 0,
  `NOTIFY` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `AUTHOR_ID` int(18) DEFAULT NULL,
  `TIMESTAMP_X` datetime NOT NULL,
  `DATE_START` datetime NOT NULL,
  `DATE_END` datetime NOT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COUNTER` int(11) NOT NULL DEFAULT 0,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'html',
  `IMAGE_ID` int(18) DEFAULT NULL,
  `EVENT1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EVENT2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EVENT3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UNIQUE_TYPE` int(18) NOT NULL DEFAULT 2,
  `KEEP_IP_SEC` int(18) DEFAULT NULL,
  `OPTIONS` int(18) DEFAULT 1,
  `TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RESULT_TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_CHANNEL_ID` (`CHANNEL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_vote: ~0 rows (приблизительно)
DELETE FROM `b_vote`;
/*!40000 ALTER TABLE `b_vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_vote` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_vote_answer
DROP TABLE IF EXISTS `b_vote_answer`;
CREATE TABLE IF NOT EXISTS `b_vote_answer` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `TIMESTAMP_X` datetime NOT NULL,
  `QUESTION_ID` int(18) NOT NULL DEFAULT 0,
  `C_SORT` int(18) DEFAULT 100,
  `IMAGE_ID` int(18) DEFAULT NULL,
  `MESSAGE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'html',
  `COUNTER` int(18) NOT NULL DEFAULT 0,
  `FIELD_TYPE` int(5) NOT NULL DEFAULT 0,
  `FIELD_WIDTH` int(18) DEFAULT NULL,
  `FIELD_HEIGHT` int(18) DEFAULT NULL,
  `FIELD_PARAM` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLOR` varchar(7) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_QUESTION_ID` (`QUESTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_vote_answer: ~0 rows (приблизительно)
DELETE FROM `b_vote_answer`;
/*!40000 ALTER TABLE `b_vote_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_vote_answer` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_vote_attached_object
DROP TABLE IF EXISTS `b_vote_attached_object`;
CREATE TABLE IF NOT EXISTS `b_vote_attached_object` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `OBJECT_ID` int(11) NOT NULL,
  `MODULE_ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_TYPE` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `CREATE_TIME` datetime NOT NULL,
  `CREATED_BY` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_VOTE_AO_1` (`OBJECT_ID`),
  KEY `IX_VOTE_AO_2` (`MODULE_ID`,`ENTITY_TYPE`,`ENTITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_vote_attached_object: ~0 rows (приблизительно)
DELETE FROM `b_vote_attached_object`;
/*!40000 ALTER TABLE `b_vote_attached_object` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_vote_attached_object` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_vote_channel
DROP TABLE IF EXISTS `b_vote_channel`;
CREATE TABLE IF NOT EXISTS `b_vote_channel` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `SYMBOLIC_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `C_SORT` int(18) DEFAULT 100,
  `FIRST_SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `HIDDEN` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `TIMESTAMP_X` datetime NOT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `VOTE_SINGLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `USE_CAPTCHA` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_vote_channel: ~0 rows (приблизительно)
DELETE FROM `b_vote_channel`;
/*!40000 ALTER TABLE `b_vote_channel` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_vote_channel` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_vote_channel_2_group
DROP TABLE IF EXISTS `b_vote_channel_2_group`;
CREATE TABLE IF NOT EXISTS `b_vote_channel_2_group` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CHANNEL_ID` int(18) NOT NULL DEFAULT 0,
  `GROUP_ID` int(18) NOT NULL DEFAULT 0,
  `PERMISSION` int(18) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `IX_VOTE_CHANNEL_ID_GROUP_ID` (`CHANNEL_ID`,`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_vote_channel_2_group: ~0 rows (приблизительно)
DELETE FROM `b_vote_channel_2_group`;
/*!40000 ALTER TABLE `b_vote_channel_2_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_vote_channel_2_group` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_vote_channel_2_site
DROP TABLE IF EXISTS `b_vote_channel_2_site`;
CREATE TABLE IF NOT EXISTS `b_vote_channel_2_site` (
  `CHANNEL_ID` int(18) NOT NULL DEFAULT 0,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`CHANNEL_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_vote_channel_2_site: ~0 rows (приблизительно)
DELETE FROM `b_vote_channel_2_site`;
/*!40000 ALTER TABLE `b_vote_channel_2_site` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_vote_channel_2_site` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_vote_event
DROP TABLE IF EXISTS `b_vote_event`;
CREATE TABLE IF NOT EXISTS `b_vote_event` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `VOTE_ID` int(18) NOT NULL DEFAULT 0,
  `VOTE_USER_ID` int(18) NOT NULL DEFAULT 0,
  `DATE_VOTE` datetime NOT NULL,
  `STAT_SESSION_ID` int(18) DEFAULT NULL,
  `IP` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VALID` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `VISIBLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  KEY `IX_USER_ID` (`VOTE_USER_ID`),
  KEY `IX_B_VOTE_EVENT_2` (`VOTE_ID`,`IP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_vote_event: ~0 rows (приблизительно)
DELETE FROM `b_vote_event`;
/*!40000 ALTER TABLE `b_vote_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_vote_event` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_vote_event_answer
DROP TABLE IF EXISTS `b_vote_event_answer`;
CREATE TABLE IF NOT EXISTS `b_vote_event_answer` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `EVENT_QUESTION_ID` int(18) NOT NULL DEFAULT 0,
  `ANSWER_ID` int(18) NOT NULL DEFAULT 0,
  `MESSAGE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_EVENT_QUESTION_ID` (`EVENT_QUESTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_vote_event_answer: ~0 rows (приблизительно)
DELETE FROM `b_vote_event_answer`;
/*!40000 ALTER TABLE `b_vote_event_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_vote_event_answer` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_vote_event_question
DROP TABLE IF EXISTS `b_vote_event_question`;
CREATE TABLE IF NOT EXISTS `b_vote_event_question` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `EVENT_ID` int(18) NOT NULL DEFAULT 0,
  `QUESTION_ID` int(18) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `IX_EVENT_ID` (`EVENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_vote_event_question: ~0 rows (приблизительно)
DELETE FROM `b_vote_event_question`;
/*!40000 ALTER TABLE `b_vote_event_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_vote_event_question` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_vote_question
DROP TABLE IF EXISTS `b_vote_question`;
CREATE TABLE IF NOT EXISTS `b_vote_question` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `TIMESTAMP_X` datetime NOT NULL,
  `VOTE_ID` int(18) NOT NULL DEFAULT 0,
  `C_SORT` int(18) DEFAULT 100,
  `IMAGE_ID` int(18) DEFAULT NULL,
  `QUESTION` text COLLATE utf8_unicode_ci NOT NULL,
  `QUESTION_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'html',
  `FIELD_TYPE` int(5) NOT NULL DEFAULT 0,
  `REQUIRED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `COUNTER` int(11) NOT NULL DEFAULT 0,
  `DIAGRAM` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `DIAGRAM_TYPE` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'histogram',
  `TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TEMPLATE_NEW` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_VOTE_ID` (`VOTE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_vote_question: ~0 rows (приблизительно)
DELETE FROM `b_vote_question`;
/*!40000 ALTER TABLE `b_vote_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_vote_question` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix2.b_vote_user
DROP TABLE IF EXISTS `b_vote_user`;
CREATE TABLE IF NOT EXISTS `b_vote_user` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `COOKIE_ID` int(18) NOT NULL,
  `AUTH_USER_ID` int(18) DEFAULT NULL,
  `COUNTER` int(18) NOT NULL DEFAULT 0,
  `DATE_FIRST` datetime NOT NULL,
  `DATE_LAST` datetime NOT NULL,
  `LAST_IP` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STAT_GUEST_ID` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_VOTE_COOKIE_USER` (`COOKIE_ID`,`AUTH_USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix2.b_vote_user: ~0 rows (приблизительно)
DELETE FROM `b_vote_user`;
/*!40000 ALTER TABLE `b_vote_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_vote_user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
