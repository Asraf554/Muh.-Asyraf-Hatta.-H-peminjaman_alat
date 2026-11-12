-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: peminjaman_alat
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `activity_logs`
--

DROP TABLE IF EXISTS `activity_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `activity` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_logs_user_id_foreign` (`user_id`),
  CONSTRAINT `activity_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_logs`
--

LOCK TABLES `activity_logs` WRITE;
/*!40000 ALTER TABLE `activity_logs` DISABLE KEYS */;
INSERT INTO `activity_logs` VALUES (1,2,'Menyetujui peminjaman #1','2026-11-09 07:12:22','2026-11-09 07:12:22'),(2,2,'Menolak peminjaman #2','2026-11-09 07:12:25','2026-11-09 07:12:25'),(3,2,'Menolak peminjaman #3','2026-11-09 07:12:27','2026-11-09 07:12:27'),(4,2,'Menyetujui peminjaman #4','2026-11-09 07:12:28','2026-11-09 07:12:28'),(5,2,'Menolak peminjaman #5','2026-11-09 07:13:46','2026-11-09 07:13:46'),(6,1,'Login','2026-11-09 07:20:43','2026-11-09 07:20:43'),(7,2,'Menyetujui peminjaman #6','2026-11-09 07:31:29','2026-11-09 07:31:29'),(8,1,'Logout','2026-11-12 03:16:45','2026-11-12 03:16:45'),(9,2,'Login','2026-11-12 03:16:54','2026-11-12 03:16:54'),(10,2,'Mengubah alat Laptop','2026-11-12 03:20:05','2026-11-12 03:20:05'),(11,2,'Pengembalian peminjaman #1','2026-11-12 03:20:05','2026-11-12 03:20:05'),(12,2,'Mengubah alat Crimping Tool','2026-11-12 03:20:17','2026-11-12 03:20:17'),(13,2,'Pengembalian peminjaman #4','2026-11-12 03:20:17','2026-11-12 03:20:17'),(14,2,'Mengubah alat Crimping Tool','2026-11-12 03:20:58','2026-11-12 03:20:58'),(15,2,'Pengembalian peminjaman #6','2026-11-12 03:20:58','2026-11-12 03:20:58'),(16,2,'Logout','2026-11-12 03:21:19','2026-11-12 03:21:19'),(17,3,'Login','2026-11-12 03:21:33','2026-11-12 03:21:33'),(18,3,'Logout','2026-11-12 03:28:50','2026-11-12 03:28:50'),(19,1,'Login','2026-11-12 03:28:57','2026-11-12 03:28:57'),(20,1,'Logout','2026-11-12 03:33:23','2026-11-12 03:33:23'),(21,2,'Login','2026-11-12 03:33:28','2026-11-12 03:33:28'),(22,2,'Logout','2026-11-12 03:38:15','2026-11-12 03:38:15'),(23,1,'Login','2026-11-12 03:38:24','2026-11-12 03:38:24'),(24,1,'Logout','2026-11-12 03:44:57','2026-11-12 03:44:57'),(25,3,'Login','2026-11-12 03:45:05','2026-11-12 03:45:05'),(26,3,'Menambah peminjaman #7','2026-11-12 03:45:47','2026-11-12 03:45:47'),(27,3,'Logout','2026-11-12 03:45:55','2026-11-12 03:45:55'),(28,2,'Login','2026-11-12 03:46:04','2026-11-12 03:46:04'),(29,2,'Mengubah alat PC Client/Laptop','2026-11-12 03:46:14','2026-11-12 03:46:14'),(30,2,'Menyetujui peminjaman #7','2026-11-12 03:46:14','2026-11-12 03:46:14'),(31,2,'Mengubah alat PC Client/Laptop','2026-11-12 03:46:18','2026-11-12 03:46:18'),(32,2,'Pengembalian peminjaman #7','2026-11-12 03:46:18','2026-11-12 03:46:18'),(33,2,'Logout','2026-11-12 03:46:23','2026-11-12 03:46:23'),(34,3,'Login','2026-11-12 03:46:37','2026-11-12 03:46:37'),(35,3,'Logout','2026-11-12 04:00:02','2026-11-12 04:00:02'),(36,1,'Login','2026-11-12 04:00:07','2026-11-12 04:00:07'),(37,1,'Logout','2026-11-12 04:00:33','2026-11-12 04:00:33'),(38,2,'Login','2026-11-12 04:00:41','2026-11-12 04:00:41');
/*!40000 ALTER TABLE `activity_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
INSERT INTO `cache` VALUES ('peminjaman_alat_cache_livewire-rate-limiter:16d36dff9abd246c67dfac3e63b993a169af77e6','i:2;',1794484867),('peminjaman_alat_cache_livewire-rate-limiter:16d36dff9abd246c67dfac3e63b993a169af77e6:timer','i:1794484867;',1794484867);
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Elektronik','2026-11-08 23:02:50','2026-11-08 23:02:50'),(2,'Jaringan','2026-11-08 23:02:50','2026-11-08 23:02:50'),(3,'olahragad','2026-11-09 05:13:07','2026-11-09 05:13:19'),(6,'Alat','2026-11-12 03:31:19','2026-11-12 03:31:19'),(7,'Komponen','2026-11-12 03:31:19','2026-11-12 03:31:19');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loans`
--

DROP TABLE IF EXISTS `loans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loans` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `tool_id` bigint(20) unsigned NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 1,
  `loan_date` date NOT NULL,
  `due_date` date NOT NULL,
  `return_date` date DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'menunggu',
  `fine` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `loans_user_id_foreign` (`user_id`),
  KEY `loans_tool_id_foreign` (`tool_id`),
  CONSTRAINT `loans_tool_id_foreign` FOREIGN KEY (`tool_id`) REFERENCES `tools` (`id`) ON DELETE CASCADE,
  CONSTRAINT `loans_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loans`
--

LOCK TABLES `loans` WRITE;
/*!40000 ALTER TABLE `loans` DISABLE KEYS */;
INSERT INTO `loans` VALUES (1,1,2,4,'2026-11-06','2019-03-23','2026-11-12','dikembalikan',13955000,'2026-11-09 05:43:49','2026-11-12 03:20:05'),(2,3,2,1,'2020-01-02','2021-02-22',NULL,'ditolak',0,'2026-11-09 05:45:39','2026-11-09 07:12:25'),(3,3,1,1,'2026-11-09','2026-11-09',NULL,'ditolak',0,'2026-11-09 05:46:13','2026-11-09 07:12:27'),(4,3,3,1,'2026-11-09','2026-12-10','2026-11-12','dikembalikan',0,'2026-11-09 05:46:33','2026-11-12 03:20:17'),(5,3,4,1,'2026-11-09','2026-10-09',NULL,'ditolak',0,'2026-11-09 05:47:39','2026-11-09 07:13:45'),(6,4,3,1,'2026-11-09','3323-01-31','3323-02-01','dikembalikan',5000,'2026-11-09 07:31:22','2026-11-12 03:20:58'),(7,3,16,1,'2026-11-12','2026-12-12','2026-11-12','dikembalikan',0,'2026-11-12 03:45:47','2026-11-12 03:46:18');
/*!40000 ALTER TABLE `loans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2026_11_09_041854_create_categories_table',1),(5,'2026_11_09_041924_create_tools_table',1),(6,'2026_11_09_044505_create_loans_table',2),(7,'2026_11_09_044621_create_activity_logs_table',2),(8,'2026_11_12_000000_add_specification_to_tools_table',3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('hnIAsE6WB8mmC8AJLwvdSwgZj2D24NeJfLSOWyGE',2,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36','YTo2OntzOjY6Il90b2tlbiI7czo0MDoiNFpGdVZVam9ZYVpBV0NHdWJReUZHemhSYW5CeWYwNG02SFhJZk5jcSI7czo4OiJmaWxhbWVudCI7YToyOntzOjEzOiJub3RpZmljYXRpb25zIjthOjE6e3M6NzoibWFpbGJveCI7czo0MDoiUjZvM1lXZUJJM1d5NDMyeTB0MEhkVktreFV4ZU1KS1FEckFWZXZ3QiI7fXM6NjoidGFibGVzIjthOjE6e3M6NjQ6Ijg5MDY3YjNiNTIwN2MxZWRmZWZiNTM4N2MxMjYzMDE3MTk4ODhiODczY2UyZWMwYWQ0M2M5YWMwMmQxZmEzMDEiO2E6MTp7czo3OiJjb2x1bW5zIjthOjEwOntpOjA7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6OToidXNlci5uYW1lIjtzOjU6ImxhYmVsIjtzOjg6IlBlbWluamFtIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo5OiJ0b29sLm5hbWUiO3M6NToibGFiZWwiO3M6NDoiQWxhdCI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjI7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MzoicXR5IjtzOjU6ImxhYmVsIjtzOjY6Ikp1bWxhaCI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjM7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6OToibG9hbl9kYXRlIjtzOjU6ImxhYmVsIjtzOjEwOiJUZ2wgUGluamFtIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6NDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo4OiJkdWVfZGF0ZSI7czo1OiJsYWJlbCI7czoxMToiSmF0dWggVGVtcG8iO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aTo1O2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjExOiJyZXR1cm5fZGF0ZSI7czo1OiJsYWJlbCI7czoxMToiVGdsIEtlbWJhbGkiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aTo2O2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjY6InN0YXR1cyI7czo1OiJsYWJlbCI7czo2OiJTdGF0dXMiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aTo3O2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjQ6ImZpbmUiO3M6NToibGFiZWwiO3M6NToiRGVuZGEiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aTo4O2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjU6ImxhYmVsIjtzOjEwOiJDcmVhdGVkIGF0IjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MDtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MTtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO2I6MTt9aTo5O2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjU6ImxhYmVsIjtzOjEwOiJVcGRhdGVkIGF0IjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MDtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MTtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO2I6MTt9fX19fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjMzOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYWRtaW4vbG9hbnMiO3M6NToicm91dGUiO3M6MzY6ImZpbGFtZW50LmFkbWluLnJlc291cmNlcy5sb2Fucy5pbmRleCI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjQ6ImM0ZjYxYmViNzU3NzUzMGNjYjJiZGI3ZTZlNjUxZDgzMjQ0OWNkNjBjZDVmZjYwMWViMDFkYzA1NDNkZjk4OTAiO30=',1794485961);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tools`
--

DROP TABLE IF EXISTS `tools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tools` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) unsigned NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `specification` text DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `condition` varchar(255) NOT NULL DEFAULT 'baik',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tools_code_unique` (`code`),
  KEY `tools_category_id_foreign` (`category_id`),
  CONSTRAINT `tools_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tools`
--

LOCK TABLES `tools` WRITE;
/*!40000 ALTER TABLE `tools` DISABLE KEYS */;
INSERT INTO `tools` VALUES (1,1,'ELK-01','Proyektord',NULL,3,'baik','2026-11-08 23:02:50','2026-11-09 05:20:25'),(2,1,'ELK-02','Laptop',NULL,10,'baik','2026-11-08 23:02:50','2026-11-12 03:20:05'),(3,2,'JRG-01','Crimping Tool',NULL,15,'baik','2026-11-08 23:02:50','2026-11-12 03:20:58'),(4,2,'Boi','Yeaahhhh',NULL,0,'baik','2026-11-09 05:20:44','2026-11-09 05:20:44'),(16,6,'ALT-01','PC Client/Laptop','Processor: Setara 2,0 GHz\nRAM: 4 GB\nHarddisk\nNIC: 10/100 Mbps\nMonitor 14\"\nMouse\nKeyboard',1,'baik','2026-11-12 03:31:19','2026-11-12 03:46:18'),(17,6,'ALT-02','Koneksi Internet','Minimal 1 Mbps',1,'baik','2026-11-12 03:31:19','2026-11-12 03:43:10'),(18,7,'KMP-01','Sistem Operasi','Sesuai Kebutuhan',1,'baik','2026-11-12 03:31:19','2026-11-12 03:43:10'),(19,7,'KMP-02','Text Editor/Tools Pemrograman','Sesuai Kebutuhan',1,'baik','2026-11-12 03:31:19','2026-11-12 03:43:10'),(20,7,'KMP-03','Aplikasi Server Basis Data','Sesuai Kebutuhan',1,'baik','2026-11-12 03:31:19','2026-11-12 03:43:10'),(21,7,'KMP-04','Debugging Tools','Sesuai Kebutuhan',1,'baik','2026-11-12 03:31:19','2026-11-12 03:43:10'),(22,7,'KMP-05','Aplikasi Pengolahan Kata','Sesuai Kebutuhan',1,'baik','2026-11-12 03:31:19','2026-11-12 03:43:10');
/*!40000 ALTER TABLE `tools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'peminjam',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','admin@sekolah.test','admin',NULL,'$2y$12$hh441T.XDKnnWqLQW9AfLuRiIQWlJ/2k8pg2oIMps8DFBpVDNlQ/W',NULL,'2026-11-08 23:02:49','2026-11-08 23:02:49'),(2,'Petugas','petugas@sekolah.test','petugas',NULL,'$2y$12$x89CO.zrPO2KnClx78zbPOO1/169fvnJfCsKB/y1xQ2IG4VTswZ3u',NULL,'2026-11-08 23:02:49','2026-11-08 23:02:49'),(3,'Rina','siswa@sekolah.test','peminjam',NULL,'$2y$12$VrKz3iM3/cmCnYjiD8o5duBTPldAX2VWur/X6eBKIoT9q26tHuB9K',NULL,'2026-11-08 23:02:50','2026-11-08 23:02:50'),(4,'Bio','kratos@gmail.com','peminjam',NULL,'$2y$12$dkauTRWoxxa9T0r0PdXNIeBOr4/4PgGH5qfyHT3gG9g39mo5QJ8w.',NULL,'2026-11-09 05:35:15','2026-11-09 05:35:15');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-12 21:06:43
