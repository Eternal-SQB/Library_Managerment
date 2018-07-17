/*
 Navicat Premium Data Transfer

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : localhost:3306
 Source Schema         : books

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : 65001

 Date: 01/07/2018 12:19:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for app01_author
-- ----------------------------
DROP TABLE IF EXISTS `app01_author`;
CREATE TABLE `app01_author`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `age` int(11) NOT NULL,
  `ad_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ad_id`(`ad_id`) USING BTREE,
  CONSTRAINT `app01_author_ad_id_384abbeb_fk_app01_authordetail_id` FOREIGN KEY (`ad_id`) REFERENCES `app01_authordetail` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app01_author
-- ----------------------------
INSERT INTO `app01_author` VALUES (1, 'alex', 25, 1);
INSERT INTO `app01_author` VALUES (2, 'egon', 26, 2);
INSERT INTO `app01_author` VALUES (3, 'yuan', 27, 3);
INSERT INTO `app01_author` VALUES (4, 'tom', 45, 4);
INSERT INTO `app01_author` VALUES (5, 'peter', 54, 5);
INSERT INTO `app01_author` VALUES (6, 'wusir', 35, 6);
INSERT INTO `app01_author` VALUES (7, 'mjj', 44, 7);

-- ----------------------------
-- Table structure for app01_authordetail
-- ----------------------------
DROP TABLE IF EXISTS `app01_authordetail`;
CREATE TABLE `app01_authordetail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gf` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tel` bigint(20) NOT NULL,
  `addr` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app01_authordetail
-- ----------------------------
INSERT INTO `app01_authordetail` VALUES (1, '铁锤', 110, '北京');
INSERT INTO `app01_authordetail` VALUES (2, '钢蛋', 111, '北京');
INSERT INTO `app01_authordetail` VALUES (3, '山炮', 112, '北京');
INSERT INTO `app01_authordetail` VALUES (4, '张三', 113, '南京');
INSERT INTO `app01_authordetail` VALUES (5, '李四', 115, '上海');
INSERT INTO `app01_authordetail` VALUES (6, '王五', 116, '苏州');
INSERT INTO `app01_authordetail` VALUES (7, '赵六', 117, '深圳');

-- ----------------------------
-- Table structure for app01_book
-- ----------------------------
DROP TABLE IF EXISTS `app01_book`;
CREATE TABLE `app01_book`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pub_date` date NOT NULL,
  `prices` decimal(8, 2) NOT NULL,
  `publish_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `app01_book_publish_id_d96d3535_fk_app01_publish_id`(`publish_id`) USING BTREE,
  CONSTRAINT `app01_book_publish_id_d96d3535_fk_app01_publish_id` FOREIGN KEY (`publish_id`) REFERENCES `app01_publish` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app01_book
-- ----------------------------
INSERT INTO `app01_book` VALUES (1, '九阳真经', '2017-06-01', 500.00, 1);
INSERT INTO `app01_book` VALUES (2, '玉女心经', '2018-02-06', 127.00, 1);
INSERT INTO `app01_book` VALUES (3, '葵花宝典', '2018-01-03', 231.00, 1);
INSERT INTO `app01_book` VALUES (4, '乾坤大挪移', '2017-06-16', 127.00, 3);
INSERT INTO `app01_book` VALUES (5, '北冥神功', '2016-06-03', 342.00, 5);
INSERT INTO `app01_book` VALUES (6, '龙象般若功', '2015-06-12', 143.00, 1);
INSERT INTO `app01_book` VALUES (7, '小无相功', '2014-06-06', 167.00, 2);
INSERT INTO `app01_book` VALUES (8, 'py龙抓手', '2014-07-16', 289.00, 4);
INSERT INTO `app01_book` VALUES (9, 'py九阴真经', '2015-11-26', 349.00, 2);
INSERT INTO `app01_book` VALUES (10, '易筋经', '2015-12-17', 512.00, 5);

-- ----------------------------
-- Table structure for app01_book_authors
-- ----------------------------
DROP TABLE IF EXISTS `app01_book_authors`;
CREATE TABLE `app01_book_authors`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `app01_book_authors_book_id_author_id_36f1e11a_uniq`(`book_id`, `author_id`) USING BTREE,
  INDEX `app01_book_authors_author_id_5acae95a_fk_app01_author_id`(`author_id`) USING BTREE,
  CONSTRAINT `app01_book_authors_author_id_5acae95a_fk_app01_author_id` FOREIGN KEY (`author_id`) REFERENCES `app01_author` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `app01_book_authors_book_id_19c7077f_fk_app01_book_id` FOREIGN KEY (`book_id`) REFERENCES `app01_book` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app01_book_authors
-- ----------------------------
INSERT INTO `app01_book_authors` VALUES (33, 1, 1);
INSERT INTO `app01_book_authors` VALUES (32, 1, 2);
INSERT INTO `app01_book_authors` VALUES (31, 1, 3);
INSERT INTO `app01_book_authors` VALUES (3, 2, 1);
INSERT INTO `app01_book_authors` VALUES (4, 2, 3);
INSERT INTO `app01_book_authors` VALUES (5, 2, 5);
INSERT INTO `app01_book_authors` VALUES (35, 3, 3);
INSERT INTO `app01_book_authors` VALUES (36, 3, 5);
INSERT INTO `app01_book_authors` VALUES (34, 3, 6);
INSERT INTO `app01_book_authors` VALUES (8, 4, 3);
INSERT INTO `app01_book_authors` VALUES (9, 4, 5);
INSERT INTO `app01_book_authors` VALUES (10, 4, 7);
INSERT INTO `app01_book_authors` VALUES (11, 5, 3);
INSERT INTO `app01_book_authors` VALUES (12, 5, 5);
INSERT INTO `app01_book_authors` VALUES (13, 6, 1);
INSERT INTO `app01_book_authors` VALUES (14, 6, 3);
INSERT INTO `app01_book_authors` VALUES (15, 7, 2);
INSERT INTO `app01_book_authors` VALUES (16, 7, 4);
INSERT INTO `app01_book_authors` VALUES (17, 8, 3);
INSERT INTO `app01_book_authors` VALUES (18, 9, 2);
INSERT INTO `app01_book_authors` VALUES (19, 9, 7);
INSERT INTO `app01_book_authors` VALUES (20, 10, 1);
INSERT INTO `app01_book_authors` VALUES (21, 10, 4);
INSERT INTO `app01_book_authors` VALUES (22, 10, 7);

-- ----------------------------
-- Table structure for app01_publish
-- ----------------------------
DROP TABLE IF EXISTS `app01_publish`;
CREATE TABLE `app01_publish`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app01_publish
-- ----------------------------
INSERT INTO `app01_publish` VALUES (1, '北京出版社', '北京', '145@qq.com');
INSERT INTO `app01_publish` VALUES (2, '上海出版社', '上海', '564@qq.com');
INSERT INTO `app01_publish` VALUES (3, '南京出版社', '南京', '125@qq.com');
INSERT INTO `app01_publish` VALUES (4, '苏州出版社', '苏州', '7842qq.com');
INSERT INTO `app01_publish` VALUES (5, '深圳出版社', '深圳', '5612@qq.com');

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (5, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (8, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (9, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (10, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (11, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (12, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (13, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (14, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (15, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (16, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (17, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (18, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (19, 'Can add author', 7, 'add_author');
INSERT INTO `auth_permission` VALUES (20, 'Can change author', 7, 'change_author');
INSERT INTO `auth_permission` VALUES (21, 'Can delete author', 7, 'delete_author');
INSERT INTO `auth_permission` VALUES (22, 'Can add author detail', 8, 'add_authordetail');
INSERT INTO `auth_permission` VALUES (23, 'Can change author detail', 8, 'change_authordetail');
INSERT INTO `auth_permission` VALUES (24, 'Can delete author detail', 8, 'delete_authordetail');
INSERT INTO `auth_permission` VALUES (25, 'Can add book', 9, 'add_book');
INSERT INTO `auth_permission` VALUES (26, 'Can change book', 9, 'change_book');
INSERT INTO `auth_permission` VALUES (27, 'Can delete book', 9, 'delete_book');
INSERT INTO `auth_permission` VALUES (28, 'Can add publish', 10, 'add_publish');
INSERT INTO `auth_permission` VALUES (29, 'Can change publish', 10, 'change_publish');
INSERT INTO `auth_permission` VALUES (30, 'Can delete publish', 10, 'delete_publish');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (7, 'app01', 'author');
INSERT INTO `django_content_type` VALUES (8, 'app01', 'authordetail');
INSERT INTO `django_content_type` VALUES (9, 'app01', 'book');
INSERT INTO `django_content_type` VALUES (10, 'app01', 'publish');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime(6) NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2018-06-29 09:36:49.895359');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2018-06-29 09:36:51.384026');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2018-06-29 09:36:51.623703');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2018-06-29 09:36:51.638714');
INSERT INTO `django_migrations` VALUES (5, 'app01', '0001_initial', '2018-06-29 09:36:52.539261');
INSERT INTO `django_migrations` VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2018-06-29 09:36:52.685516');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2018-06-29 09:36:52.771524');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2018-06-29 09:36:53.007741');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2018-06-29 09:36:53.024754');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2018-06-29 09:36:53.098805');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2018-06-29 09:36:53.104810');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2018-06-29 09:36:53.118821');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2018-06-29 09:36:53.206556');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2018-06-29 09:36:53.308667');
INSERT INTO `django_migrations` VALUES (15, 'sessions', '0001_initial', '2018-06-29 09:36:53.426181');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime(6) NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
