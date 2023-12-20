-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: keycloak
-- ------------------------------------------------------
-- Server version	5.7.43


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE IF NOT EXISTS `keycloak` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `keycloak`;
--
-- Table structure for table `ADMIN_EVENT_ENTITY`
--

DROP TABLE IF EXISTS `ADMIN_EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ADMIN_EVENT_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `ADMIN_EVENT_TIME` bigint(20) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `OPERATION_TYPE` varchar(255) DEFAULT NULL,
  `AUTH_REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_CLIENT_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `RESOURCE_PATH` varchar(2550) DEFAULT NULL,
  `REPRESENTATION` text,
  `ERROR` varchar(255) DEFAULT NULL,
  `RESOURCE_TYPE` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ADMIN_EVENT_TIME` (`REALM_ID`,`ADMIN_EVENT_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADMIN_EVENT_ENTITY`
--

LOCK TABLES `ADMIN_EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ASSOCIATED_POLICY`
--

DROP TABLE IF EXISTS `ASSOCIATED_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ASSOCIATED_POLICY` (
  `POLICY_ID` varchar(36) NOT NULL,
  `ASSOCIATED_POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`POLICY_ID`,`ASSOCIATED_POLICY_ID`),
  KEY `IDX_ASSOC_POL_ASSOC_POL_ID` (`ASSOCIATED_POLICY_ID`),
  CONSTRAINT `FK_FRSR5S213XCX4WNKOG82SSRFY` FOREIGN KEY (`ASSOCIATED_POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPAS14XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ASSOCIATED_POLICY`
--

LOCK TABLES `ASSOCIATED_POLICY` WRITE;
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_EXECUTION`
--

DROP TABLE IF EXISTS `AUTHENTICATION_EXECUTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATION_EXECUTION` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `AUTHENTICATOR` varchar(36) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `REQUIREMENT` int(11) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `AUTHENTICATOR_FLOW` bit(1) NOT NULL DEFAULT b'0',
  `AUTH_FLOW_ID` varchar(36) DEFAULT NULL,
  `AUTH_CONFIG` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_EXEC_REALM_FLOW` (`REALM_ID`,`FLOW_ID`),
  KEY `IDX_AUTH_EXEC_FLOW` (`FLOW_ID`),
  CONSTRAINT `FK_AUTH_EXEC_FLOW` FOREIGN KEY (`FLOW_ID`) REFERENCES `AUTHENTICATION_FLOW` (`ID`),
  CONSTRAINT `FK_AUTH_EXEC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_EXECUTION`
--

LOCK TABLES `AUTHENTICATION_EXECUTION` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('00f1d564-7c0d-4113-8f09-c8420cc01b4d',NULL,'registration-profile-action','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','1863d640-f601-4487-88fd-30557b3c47e9',0,40,_binary '\0',NULL,NULL),('011f0d25-ba77-402b-bdbf-49c31fff180f',NULL,'conditional-user-configured','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','ab5657e5-8923-4742-8bc7-b3c8c1333b09',0,10,_binary '\0',NULL,NULL),('03f66a32-a3e9-4629-b6f7-35b1576ab91d',NULL,'direct-grant-validate-otp','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','4ac26b20-e336-439e-a548-c430e9390ad9',0,20,_binary '\0',NULL,NULL),('04237a67-fb36-4630-95ef-bfc1d44ab222',NULL,'auth-otp-form','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','e3acb97d-0814-4502-873c-227bc2766c63',0,20,_binary '\0',NULL,NULL),('0804352b-f8ed-4e2c-9400-1e895b35828b',NULL,NULL,'d22d3c39-cfbc-4bb2-99cd-9761f6004a33','bb22e647-30b4-4481-bc56-4b1d574df0e7',2,20,_binary '','0ea0bd2e-38fb-441f-ab82-8d58dbdfc88e',NULL),('087ecf09-04a1-4303-9468-7c1a690e7450',NULL,'basic-auth-otp','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','56a33b29-52a2-4a47-be4d-4043922c3a3f',3,20,_binary '\0',NULL,NULL),('0afdd9d1-46f2-48d8-8a16-82aec78e57a5',NULL,'idp-create-user-if-unique','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','9175412a-fb35-4d80-9345-825e938b8270',2,10,_binary '\0',NULL,'ce246dc2-4805-4ab3-8fb3-46e679d20fc6'),('0d0683e9-bca5-4fc3-8286-0cf2d64b6d35',NULL,'idp-email-verification','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','54c6fabb-3f5d-4685-b6e5-a327e84c72d2',2,10,_binary '\0',NULL,NULL),('0e320b48-d8e0-4466-b1b2-1b7404c6da6e',NULL,'idp-username-password-form','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','d5388ed2-9361-42fe-976b-50db7c0a8c6a',0,10,_binary '\0',NULL,NULL),('0f2c84ba-5499-46d8-9798-0c04665aa36a',NULL,'http-basic-authenticator','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','da214e0d-f516-4f39-9504-8e4379e29df0',0,10,_binary '\0',NULL,NULL),('0f4800fc-b7a3-4aa2-a04a-39c7accc76dc',NULL,'registration-page-form','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','42e65d2f-8e24-4162-bc3f-0e20db1eb867',0,10,_binary '','e5ab8bb7-f450-437b-b7db-24744fed1cbd',NULL),('1f041d0a-9319-4577-8436-0fd5a8f70b82',NULL,NULL,'2eabb7d4-0c33-46d6-84b9-8461bcb3177a','51da8aa3-fa64-48bf-a3a0-3c8ac37ec8d0',1,20,_binary '','3550a95e-5966-4073-be2a-137c9d5242ec',NULL),('1fba8fc4-20e1-43ed-bd30-9205345c1aac',NULL,'auth-spnego','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','56a33b29-52a2-4a47-be4d-4043922c3a3f',3,30,_binary '\0',NULL,NULL),('213bfa3d-3ecf-412c-9a5a-4999fef72171',NULL,'registration-recaptcha-action','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','1863d640-f601-4487-88fd-30557b3c47e9',3,60,_binary '\0',NULL,NULL),('2264849d-418d-4414-a170-07f88c74b55e',NULL,'registration-password-action','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','e5ab8bb7-f450-437b-b7db-24744fed1cbd',0,50,_binary '\0',NULL,NULL),('2b64e69a-4da3-45d3-ad89-9ae418e7fc7c',NULL,NULL,'2eabb7d4-0c33-46d6-84b9-8461bcb3177a','623f8b21-4a21-4048-b264-64e8926311c3',1,20,_binary '','e3acb97d-0814-4502-873c-227bc2766c63',NULL),('2d77a8a2-f32d-4cb9-bc03-dfcebccf102b',NULL,'reset-password','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','7dd4d3cb-890a-4f05-ae6c-3c9b90a7bd77',0,30,_binary '\0',NULL,NULL),('302d1295-adad-42da-9c0d-30aabc2a5b34',NULL,'registration-user-creation','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','1863d640-f601-4487-88fd-30557b3c47e9',0,20,_binary '\0',NULL,NULL),('36befe23-5851-4a43-829f-051244ddea2c',NULL,NULL,'2eabb7d4-0c33-46d6-84b9-8461bcb3177a','7dd4d3cb-890a-4f05-ae6c-3c9b90a7bd77',1,40,_binary '','ab5657e5-8923-4742-8bc7-b3c8c1333b09',NULL),('3b4080aa-a53e-4a26-b7be-6fbafbe8cdac',NULL,'reset-otp','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','ab5657e5-8923-4742-8bc7-b3c8c1333b09',0,20,_binary '\0',NULL,NULL),('3c1c91ce-03cb-482f-aa8f-860f70566324',NULL,'client-x509','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','f9187fa8-d161-4270-9d59-da2d7bd5ee87',2,40,_binary '\0',NULL,NULL),('3e31a143-9a8a-413d-bee1-4e52d2467b13',NULL,'docker-http-basic-authenticator','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','580c7b3b-6a71-4d2d-9e0c-73a02448499b',0,10,_binary '\0',NULL,NULL),('41c40caf-869e-4738-a85e-ea936d49ebb7',NULL,NULL,'d22d3c39-cfbc-4bb2-99cd-9761f6004a33','09d1dbdb-c791-45a5-a5f8-9fe23ce04ca5',1,30,_binary '','4ac26b20-e336-439e-a548-c430e9390ad9',NULL),('48bd645a-51e9-4824-b2a6-ba4ffd518a5b',NULL,'no-cookie-redirect','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','61ecbec7-b756-4468-8d69-3f810ffaad01',0,10,_binary '\0',NULL,NULL),('4928de47-6eee-4565-bbae-01634794d962',NULL,'conditional-user-configured','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','1218c060-52d0-498c-b605-515910f8a77e',0,10,_binary '\0',NULL,NULL),('4962bcab-af9c-4739-9527-27434c11033e',NULL,'registration-recaptcha-action','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','e5ab8bb7-f450-437b-b7db-24744fed1cbd',3,60,_binary '\0',NULL,NULL),('49e0c169-e65e-42ac-8135-37909fc41c23',NULL,'reset-credential-email','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','7dd4d3cb-890a-4f05-ae6c-3c9b90a7bd77',0,20,_binary '\0',NULL,NULL),('4e2034d1-ede4-4642-88b7-4f287de4e384',NULL,'idp-confirm-link','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','0ea0bd2e-38fb-441f-ab82-8d58dbdfc88e',0,10,_binary '\0',NULL,NULL),('4f918e5f-aa9a-4571-865d-f411a3585322',NULL,'conditional-user-configured','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','68642809-34f3-4010-a9d9-b0b737775391',0,10,_binary '\0',NULL,NULL),('509a99c8-c7d1-46aa-bf64-e0c886052f60',NULL,'direct-grant-validate-username','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','09d1dbdb-c791-45a5-a5f8-9fe23ce04ca5',0,10,_binary '\0',NULL,NULL),('56fdffd7-6bb2-435f-981d-4e30799ab1d5',NULL,'auth-spnego','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','ff8b4677-78eb-46d4-8086-4d588eda3018',3,30,_binary '\0',NULL,NULL),('570f95fe-d14e-4d7d-be9f-bfdc5f4381c1',NULL,NULL,'d22d3c39-cfbc-4bb2-99cd-9761f6004a33','0ea0bd2e-38fb-441f-ab82-8d58dbdfc88e',0,20,_binary '','24053064-20ea-47a2-985f-09f53537e233',NULL),('584263fb-c598-4563-a062-4678e8bd8cf2',NULL,'reset-credentials-choose-user','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','c57ef679-35a0-45c3-986e-5db8ff0f2ef3',0,10,_binary '\0',NULL,NULL),('5a465669-0b70-404e-b579-9218ff0c3b61',NULL,NULL,'d22d3c39-cfbc-4bb2-99cd-9761f6004a33','24053064-20ea-47a2-985f-09f53537e233',2,20,_binary '','d5388ed2-9361-42fe-976b-50db7c0a8c6a',NULL),('5de43ddd-4c50-497d-b0ed-4a3c68021f87',NULL,'http-basic-authenticator','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','61acb6a8-02a9-4e97-9c33-c47b0fac3c2a',0,10,_binary '\0',NULL,NULL),('602ec3b1-246e-41d3-8c59-c02d6961eb16',NULL,'idp-create-user-if-unique','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','bb22e647-30b4-4481-bc56-4b1d574df0e7',2,10,_binary '\0',NULL,'0fa9c239-5ef1-41d6-a2d7-2eed0dc58a26'),('609a4b3c-db1c-454e-a8f2-85c231fb8f02',NULL,'docker-http-basic-authenticator','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','46d95ef5-46c0-4b5c-b2fb-07234c03540d',0,10,_binary '\0',NULL,NULL),('6182f19f-ec26-4889-95fb-7ce100cb0adc',NULL,'auth-otp-form','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','c5a7b110-2903-461f-9ae4-2111e08797e8',0,20,_binary '\0',NULL,NULL),('66e148b3-8afa-46ad-ba5c-83ef8c736fec',NULL,NULL,'d22d3c39-cfbc-4bb2-99cd-9761f6004a33','d5388ed2-9361-42fe-976b-50db7c0a8c6a',1,20,_binary '','c5a7b110-2903-461f-9ae4-2111e08797e8',NULL),('69c3a048-54af-4450-8bcd-81f51db0c94d',NULL,'auth-spnego','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','b58e9895-d9a9-4d9e-8a10-13811dc8d93d',3,20,_binary '\0',NULL,NULL),('6ddd4711-cf53-4e82-ad8f-49c0a53efa19',NULL,'registration-password-action','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','1863d640-f601-4487-88fd-30557b3c47e9',0,50,_binary '\0',NULL,NULL),('6f0e2252-149e-4742-96d8-b3156fa2e86a',NULL,'idp-review-profile','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','b0013091-dbbf-4725-b125-ea98bfbe78df',0,10,_binary '\0',NULL,'37b0e9a8-577d-4af6-ab6d-6ff814fb3b61'),('70b8dbc0-b686-41eb-9938-38fcb27e6c7f',NULL,'client-secret','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','d04187cb-0bdb-4b26-adbb-f690e53fb13d',2,10,_binary '\0',NULL,NULL),('71baad28-cf2f-4975-8601-f4a1346d7e0a',NULL,'auth-cookie','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','dc0d4d23-1f56-47ba-afe9-155f4d70d49d',2,10,_binary '\0',NULL,NULL),('7324b248-d7c3-4bd0-86e1-168a3ae2ebd5',NULL,'direct-grant-validate-otp','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','1218c060-52d0-498c-b605-515910f8a77e',0,20,_binary '\0',NULL,NULL),('751f7cb2-69d5-43d9-b10b-32d697cc1122',NULL,NULL,'2eabb7d4-0c33-46d6-84b9-8461bcb3177a','e3ccef28-8594-4c90-a6ac-e0c6030d8622',0,20,_binary '','54c6fabb-3f5d-4685-b6e5-a327e84c72d2',NULL),('79dedc7d-30cf-42cc-ac75-378fa7dcfedf',NULL,'no-cookie-redirect','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','209cedf2-579a-4dbc-bfe9-f4a5d072447b',0,10,_binary '\0',NULL,NULL),('7cd987c7-9040-4172-b52e-33f4e7726703',NULL,'reset-credential-email','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','c57ef679-35a0-45c3-986e-5db8ff0f2ef3',0,20,_binary '\0',NULL,NULL),('7fa9e884-e1c9-477c-8a02-b3d2db3c1f0e',NULL,NULL,'2eabb7d4-0c33-46d6-84b9-8461bcb3177a','c1ef1a4d-a1dd-49d6-96d1-b24dffedab2b',1,30,_binary '','1218c060-52d0-498c-b605-515910f8a77e',NULL),('80ddbea0-f9a7-4ecd-bdff-a05ed612a4a7',NULL,'basic-auth-otp','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','ff8b4677-78eb-46d4-8086-4d588eda3018',3,20,_binary '\0',NULL,NULL),('82d54442-262d-44eb-881d-80bc17372c7d',NULL,NULL,'2eabb7d4-0c33-46d6-84b9-8461bcb3177a','9175412a-fb35-4d80-9345-825e938b8270',2,20,_binary '','e3ccef28-8594-4c90-a6ac-e0c6030d8622',NULL),('86582517-cd7c-4efd-96c5-4740c50c970e',NULL,'identity-provider-redirector','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','b58e9895-d9a9-4d9e-8a10-13811dc8d93d',2,25,_binary '\0',NULL,NULL),('875517cf-8359-4100-895a-52161bd296ba',NULL,'registration-page-form','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','6f7c4405-5d1a-4797-a79d-730c45fe858d',0,10,_binary '','1863d640-f601-4487-88fd-30557b3c47e9',NULL),('89376683-261a-42a9-8403-0112b885e74f',NULL,NULL,'2eabb7d4-0c33-46d6-84b9-8461bcb3177a','b58e9895-d9a9-4d9e-8a10-13811dc8d93d',2,30,_binary '','51da8aa3-fa64-48bf-a3a0-3c8ac37ec8d0',NULL),('8a1ff7bd-22af-4e78-81b7-a82c2ea53aaa',NULL,NULL,'d22d3c39-cfbc-4bb2-99cd-9761f6004a33','dc0d4d23-1f56-47ba-afe9-155f4d70d49d',2,30,_binary '','357bfe11-982f-4b4e-b009-c55666a8e2f7',NULL),('8a5c9e6f-3b0f-4e09-956f-440c1e16ead8',NULL,'idp-email-verification','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','24053064-20ea-47a2-985f-09f53537e233',2,10,_binary '\0',NULL,NULL),('8da992e2-bc60-4afb-a204-09c1e3a82bd0',NULL,'reset-otp','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','68642809-34f3-4010-a9d9-b0b737775391',0,20,_binary '\0',NULL,NULL),('8de98ef3-0e68-4c4c-b027-62482d469fc1',NULL,NULL,'d22d3c39-cfbc-4bb2-99cd-9761f6004a33','c57ef679-35a0-45c3-986e-5db8ff0f2ef3',1,40,_binary '','68642809-34f3-4010-a9d9-b0b737775391',NULL),('90ea1292-2037-41ee-93fd-660c626ebb48',NULL,'idp-confirm-link','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','e3ccef28-8594-4c90-a6ac-e0c6030d8622',0,10,_binary '\0',NULL,NULL),('a0d60354-0ae8-4a2e-866d-fb5c89203c3f',NULL,'client-jwt','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','d04187cb-0bdb-4b26-adbb-f690e53fb13d',2,20,_binary '\0',NULL,NULL),('a2f3ddbd-88b3-43fe-b60b-d82f14b81ec6',NULL,'auth-cookie','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','b58e9895-d9a9-4d9e-8a10-13811dc8d93d',2,10,_binary '\0',NULL,NULL),('a432adeb-eb26-476e-abbb-ee81f560f6dc',NULL,'client-secret','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','f9187fa8-d161-4270-9d59-da2d7bd5ee87',2,10,_binary '\0',NULL,NULL),('a54bd3ec-4aea-4eb0-b2c2-550fbabe33ca',NULL,'conditional-user-configured','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','3550a95e-5966-4073-be2a-137c9d5242ec',0,10,_binary '\0',NULL,NULL),('a6de3ff2-c298-45d4-9449-5c336a56f1ae',NULL,'auth-username-password-form','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','357bfe11-982f-4b4e-b009-c55666a8e2f7',0,10,_binary '\0',NULL,NULL),('ac1c3813-4d7a-4c29-afc5-f910b556f73b',NULL,'basic-auth','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','ff8b4677-78eb-46d4-8086-4d588eda3018',0,10,_binary '\0',NULL,NULL),('b130fcdb-675b-43b5-aadc-cd43c6106710',NULL,'conditional-user-configured','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','fc75e6a1-4d8c-481a-b1c1-9b427ad85e87',0,10,_binary '\0',NULL,NULL),('b42421b7-a14f-4400-b6a5-5fe91c7796a4',NULL,'basic-auth','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','56a33b29-52a2-4a47-be4d-4043922c3a3f',0,10,_binary '\0',NULL,NULL),('b56cd1be-cee6-4a50-bcc5-dc249a704ca3',NULL,NULL,'2eabb7d4-0c33-46d6-84b9-8461bcb3177a','54c6fabb-3f5d-4685-b6e5-a327e84c72d2',2,20,_binary '','623f8b21-4a21-4048-b264-64e8926311c3',NULL),('bd20bcd2-0c1b-47ca-8191-a2a13fe10e6f',NULL,'reset-credentials-choose-user','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','7dd4d3cb-890a-4f05-ae6c-3c9b90a7bd77',0,10,_binary '\0',NULL,NULL),('be40c3e7-a657-4416-9176-eca361fdfff8',NULL,'client-secret-jwt','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','f9187fa8-d161-4270-9d59-da2d7bd5ee87',2,30,_binary '\0',NULL,NULL),('c22317f7-9e5d-43da-91f2-51081d6e1fa8',NULL,'client-secret-jwt','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','d04187cb-0bdb-4b26-adbb-f690e53fb13d',2,30,_binary '\0',NULL,NULL),('c527a354-9491-43a5-925c-b210fb9e158c',NULL,'reset-password','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','c57ef679-35a0-45c3-986e-5db8ff0f2ef3',0,30,_binary '\0',NULL,NULL),('c9da146f-ad90-4797-9a7f-4c9a7d2a110b',NULL,'client-x509','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','d04187cb-0bdb-4b26-adbb-f690e53fb13d',2,40,_binary '\0',NULL,NULL),('ca84314b-1780-4c11-aa0f-7eae7b67a9ca',NULL,NULL,'d22d3c39-cfbc-4bb2-99cd-9761f6004a33','61ecbec7-b756-4468-8d69-3f810ffaad01',0,20,_binary '','ff8b4677-78eb-46d4-8086-4d588eda3018',NULL),('cae3feb9-5708-47cb-b4c1-3848fe1980fb',NULL,NULL,'2eabb7d4-0c33-46d6-84b9-8461bcb3177a','209cedf2-579a-4dbc-bfe9-f4a5d072447b',0,20,_binary '','56a33b29-52a2-4a47-be4d-4043922c3a3f',NULL),('cc6278dd-d7ea-4b64-97b6-1c1dc46f3602',NULL,'idp-username-password-form','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','623f8b21-4a21-4048-b264-64e8926311c3',0,10,_binary '\0',NULL,NULL),('ce169bc9-a0d8-4398-85e5-3bcae3c50e1d',NULL,'conditional-user-configured','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','c5a7b110-2903-461f-9ae4-2111e08797e8',0,10,_binary '\0',NULL,NULL),('d44893f9-d52f-496e-97bb-eec5297ffc4e',NULL,'registration-profile-action','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','e5ab8bb7-f450-437b-b7db-24744fed1cbd',0,40,_binary '\0',NULL,NULL),('d5a95ca3-7589-4a84-91c6-1fb6ae367107',NULL,'direct-grant-validate-password','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','c1ef1a4d-a1dd-49d6-96d1-b24dffedab2b',0,20,_binary '\0',NULL,NULL),('d886ff31-fb37-47cb-9696-d9331e6d1338',NULL,NULL,'d22d3c39-cfbc-4bb2-99cd-9761f6004a33','b0013091-dbbf-4725-b125-ea98bfbe78df',0,20,_binary '','bb22e647-30b4-4481-bc56-4b1d574df0e7',NULL),('dcaba2af-ad45-4a2b-994c-de339465b549',NULL,NULL,'d22d3c39-cfbc-4bb2-99cd-9761f6004a33','357bfe11-982f-4b4e-b009-c55666a8e2f7',1,20,_binary '','fc75e6a1-4d8c-481a-b1c1-9b427ad85e87',NULL),('e3c96632-483a-4aa9-9508-10f6e05fd8df',NULL,'direct-grant-validate-password','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','09d1dbdb-c791-45a5-a5f8-9fe23ce04ca5',0,20,_binary '\0',NULL,NULL),('e4e93e62-377b-43ed-b68f-a94793bdf4cf',NULL,'auth-otp-form','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','fc75e6a1-4d8c-481a-b1c1-9b427ad85e87',0,20,_binary '\0',NULL,NULL),('e6bb7a53-0026-485b-ba30-d447b50da329',NULL,'registration-user-creation','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','e5ab8bb7-f450-437b-b7db-24744fed1cbd',0,20,_binary '\0',NULL,NULL),('e953d60a-673e-45e6-9e39-e6d1d237fdfb',NULL,'conditional-user-configured','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','e3acb97d-0814-4502-873c-227bc2766c63',0,10,_binary '\0',NULL,NULL),('efe2cd82-25a1-4669-9607-4a199a37dbfc',NULL,'identity-provider-redirector','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','dc0d4d23-1f56-47ba-afe9-155f4d70d49d',2,25,_binary '\0',NULL,NULL),('f3b35ef3-8b71-422e-9c67-72b72581e776',NULL,'direct-grant-validate-username','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','c1ef1a4d-a1dd-49d6-96d1-b24dffedab2b',0,10,_binary '\0',NULL,NULL),('f3bf65bc-277e-45f6-a41f-c54750539a28',NULL,'idp-review-profile','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','16e58a69-246b-41ac-9947-046e4c2ee4c0',0,10,_binary '\0',NULL,'5a6cc013-df73-4056-8993-f09d88cb77d7'),('f970512a-de57-4903-a4c4-025eea6625eb',NULL,NULL,'2eabb7d4-0c33-46d6-84b9-8461bcb3177a','16e58a69-246b-41ac-9947-046e4c2ee4c0',0,20,_binary '','9175412a-fb35-4d80-9345-825e938b8270',NULL),('fade76ac-b37b-4bf6-af34-f2504ccc0e92',NULL,'conditional-user-configured','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','4ac26b20-e336-439e-a548-c430e9390ad9',0,10,_binary '\0',NULL,NULL),('fd0b53dc-3e82-4ea8-bf4d-351e5812d245',NULL,'auth-username-password-form','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','51da8aa3-fa64-48bf-a3a0-3c8ac37ec8d0',0,10,_binary '\0',NULL,NULL),('fde5940d-0f40-454f-911d-737533dfb086',NULL,'auth-otp-form','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','3550a95e-5966-4073-be2a-137c9d5242ec',0,20,_binary '\0',NULL,NULL),('ff4cfbb0-62db-4632-915f-8f20d951d4a5',NULL,'auth-spnego','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','dc0d4d23-1f56-47ba-afe9-155f4d70d49d',3,20,_binary '\0',NULL,NULL),('ffc61dd1-83f3-4e35-a950-6db1b078d18a',NULL,'client-jwt','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','f9187fa8-d161-4270-9d59-da2d7bd5ee87',2,20,_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_FLOW`
--

DROP TABLE IF EXISTS `AUTHENTICATION_FLOW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATION_FLOW` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) NOT NULL DEFAULT 'basic-flow',
  `TOP_LEVEL` bit(1) NOT NULL DEFAULT b'0',
  `BUILT_IN` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_FLOW_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_FLOW_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_FLOW`
--

LOCK TABLES `AUTHENTICATION_FLOW` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('09d1dbdb-c791-45a5-a5f8-9fe23ce04ca5','direct grant','OpenID Connect Resource Owner Grant','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','basic-flow',_binary '',_binary ''),('0ea0bd2e-38fb-441f-ab82-8d58dbdfc88e','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','basic-flow',_binary '\0',_binary ''),('1218c060-52d0-498c-b605-515910f8a77e','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','basic-flow',_binary '\0',_binary ''),('16e58a69-246b-41ac-9947-046e4c2ee4c0','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','basic-flow',_binary '',_binary ''),('1863d640-f601-4487-88fd-30557b3c47e9','registration form','registration form','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','form-flow',_binary '\0',_binary ''),('209cedf2-579a-4dbc-bfe9-f4a5d072447b','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','basic-flow',_binary '',_binary ''),('24053064-20ea-47a2-985f-09f53537e233','Account verification options','Method with which to verity the existing account','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','basic-flow',_binary '\0',_binary ''),('3550a95e-5966-4073-be2a-137c9d5242ec','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','basic-flow',_binary '\0',_binary ''),('357bfe11-982f-4b4e-b009-c55666a8e2f7','forms','Username, password, otp and other auth forms.','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','basic-flow',_binary '\0',_binary ''),('42e65d2f-8e24-4162-bc3f-0e20db1eb867','registration','registration flow','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','basic-flow',_binary '',_binary ''),('46d95ef5-46c0-4b5c-b2fb-07234c03540d','docker auth','Used by Docker clients to authenticate against the IDP','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','basic-flow',_binary '',_binary ''),('4ac26b20-e336-439e-a548-c430e9390ad9','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','basic-flow',_binary '\0',_binary ''),('51da8aa3-fa64-48bf-a3a0-3c8ac37ec8d0','forms','Username, password, otp and other auth forms.','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','basic-flow',_binary '\0',_binary ''),('54c6fabb-3f5d-4685-b6e5-a327e84c72d2','Account verification options','Method with which to verity the existing account','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','basic-flow',_binary '\0',_binary ''),('56a33b29-52a2-4a47-be4d-4043922c3a3f','Authentication Options','Authentication options.','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','basic-flow',_binary '\0',_binary ''),('580c7b3b-6a71-4d2d-9e0c-73a02448499b','docker auth','Used by Docker clients to authenticate against the IDP','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','basic-flow',_binary '',_binary ''),('61acb6a8-02a9-4e97-9c33-c47b0fac3c2a','saml ecp','SAML ECP Profile Authentication Flow','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','basic-flow',_binary '',_binary ''),('61ecbec7-b756-4468-8d69-3f810ffaad01','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','basic-flow',_binary '',_binary ''),('623f8b21-4a21-4048-b264-64e8926311c3','Verify Existing Account by Re-authentication','Reauthentication of existing account','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','basic-flow',_binary '\0',_binary ''),('68642809-34f3-4010-a9d9-b0b737775391','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','basic-flow',_binary '\0',_binary ''),('6f7c4405-5d1a-4797-a79d-730c45fe858d','registration','registration flow','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','basic-flow',_binary '',_binary ''),('7dd4d3cb-890a-4f05-ae6c-3c9b90a7bd77','reset credentials','Reset credentials for a user if they forgot their password or something','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','basic-flow',_binary '',_binary ''),('9175412a-fb35-4d80-9345-825e938b8270','User creation or linking','Flow for the existing/non-existing user alternatives','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','basic-flow',_binary '\0',_binary ''),('ab5657e5-8923-4742-8bc7-b3c8c1333b09','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','basic-flow',_binary '\0',_binary ''),('b0013091-dbbf-4725-b125-ea98bfbe78df','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','basic-flow',_binary '',_binary ''),('b58e9895-d9a9-4d9e-8a10-13811dc8d93d','browser','browser based authentication','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','basic-flow',_binary '',_binary ''),('bb22e647-30b4-4481-bc56-4b1d574df0e7','User creation or linking','Flow for the existing/non-existing user alternatives','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','basic-flow',_binary '\0',_binary ''),('c1ef1a4d-a1dd-49d6-96d1-b24dffedab2b','direct grant','OpenID Connect Resource Owner Grant','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','basic-flow',_binary '',_binary ''),('c57ef679-35a0-45c3-986e-5db8ff0f2ef3','reset credentials','Reset credentials for a user if they forgot their password or something','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','basic-flow',_binary '',_binary ''),('c5a7b110-2903-461f-9ae4-2111e08797e8','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','basic-flow',_binary '\0',_binary ''),('d04187cb-0bdb-4b26-adbb-f690e53fb13d','clients','Base authentication for clients','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','client-flow',_binary '',_binary ''),('d5388ed2-9361-42fe-976b-50db7c0a8c6a','Verify Existing Account by Re-authentication','Reauthentication of existing account','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','basic-flow',_binary '\0',_binary ''),('da214e0d-f516-4f39-9504-8e4379e29df0','saml ecp','SAML ECP Profile Authentication Flow','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','basic-flow',_binary '',_binary ''),('dc0d4d23-1f56-47ba-afe9-155f4d70d49d','browser','browser based authentication','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','basic-flow',_binary '',_binary ''),('e3acb97d-0814-4502-873c-227bc2766c63','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','basic-flow',_binary '\0',_binary ''),('e3ccef28-8594-4c90-a6ac-e0c6030d8622','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','basic-flow',_binary '\0',_binary ''),('e5ab8bb7-f450-437b-b7db-24744fed1cbd','registration form','registration form','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','form-flow',_binary '\0',_binary ''),('f9187fa8-d161-4270-9d59-da2d7bd5ee87','clients','Base authentication for clients','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','client-flow',_binary '',_binary ''),('fc75e6a1-4d8c-481a-b1c1-9b427ad85e87','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','basic-flow',_binary '\0',_binary ''),('ff8b4677-78eb-46d4-8086-4d588eda3018','Authentication Options','Authentication options.','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','basic-flow',_binary '\0',_binary '');
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATOR_CONFIG` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_CONFIG_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG`
--

LOCK TABLES `AUTHENTICATOR_CONFIG` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG` VALUES ('0fa9c239-5ef1-41d6-a2d7-2eed0dc58a26','create unique user config','d22d3c39-cfbc-4bb2-99cd-9761f6004a33'),('37b0e9a8-577d-4af6-ab6d-6ff814fb3b61','review profile config','d22d3c39-cfbc-4bb2-99cd-9761f6004a33'),('5a6cc013-df73-4056-8993-f09d88cb77d7','review profile config','2eabb7d4-0c33-46d6-84b9-8461bcb3177a'),('ce246dc2-4805-4ab3-8fb3-46e679d20fc6','create unique user config','2eabb7d4-0c33-46d6-84b9-8461bcb3177a');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG_ENTRY`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG_ENTRY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATOR_CONFIG_ENTRY` (
  `AUTHENTICATOR_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`AUTHENTICATOR_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG_ENTRY`
--

LOCK TABLES `AUTHENTICATOR_CONFIG_ENTRY` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG_ENTRY` VALUES ('0fa9c239-5ef1-41d6-a2d7-2eed0dc58a26','false','require.password.update.after.registration'),('37b0e9a8-577d-4af6-ab6d-6ff814fb3b61','missing','update.profile.on.first.login'),('5a6cc013-df73-4056-8993-f09d88cb77d7','missing','update.profile.on.first.login'),('ce246dc2-4805-4ab3-8fb3-46e679d20fc6','false','require.password.update.after.registration');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BROKER_LINK`
--

DROP TABLE IF EXISTS `BROKER_LINK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BROKER_LINK` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  `BROKER_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text,
  `USER_ID` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BROKER_LINK`
--

LOCK TABLES `BROKER_LINK` WRITE;
/*!40000 ALTER TABLE `BROKER_LINK` DISABLE KEYS */;
/*!40000 ALTER TABLE `BROKER_LINK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT`
--

DROP TABLE IF EXISTS `CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT` (
  `ID` varchar(36) NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FULL_SCOPE_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int(11) DEFAULT NULL,
  `PUBLIC_CLIENT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` varchar(255) DEFAULT NULL,
  `BASE_URL` varchar(255) DEFAULT NULL,
  `BEARER_ONLY` bit(1) NOT NULL DEFAULT b'0',
  `MANAGEMENT_URL` varchar(255) DEFAULT NULL,
  `SURROGATE_AUTH_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  `NODE_REREG_TIMEOUT` int(11) DEFAULT '0',
  `FRONTCHANNEL_LOGOUT` bit(1) NOT NULL DEFAULT b'0',
  `CONSENT_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `NAME` varchar(255) DEFAULT NULL,
  `SERVICE_ACCOUNTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_AUTHENTICATOR_TYPE` varchar(255) DEFAULT NULL,
  `ROOT_URL` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `REGISTRATION_TOKEN` varchar(255) DEFAULT NULL,
  `STANDARD_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'1',
  `IMPLICIT_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DIRECT_ACCESS_GRANTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ALWAYS_DISPLAY_IN_CONSOLE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_B71CJLBENV945RB6GCON438AT` (`REALM_ID`,`CLIENT_ID`),
  KEY `IDX_CLIENT_ID` (`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT`
--

LOCK TABLES `CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT` VALUES ('008382ce-2097-4f94-a588-2e1701dfe0aa',_binary '',_binary '\0','account',0,_binary '',NULL,'/realms/cinema/account/',_binary '\0',NULL,_binary '\0','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('0b343fff-8234-4a4c-8b7f-c05f7437d505',_binary '',_binary '\0','admin-cli',0,_binary '',NULL,NULL,_binary '\0',NULL,_binary '\0','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0'),('0e2f922e-a2c3-4619-99b4-104c9a5357ec',_binary '',_binary '\0','broker',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('2bb6fb5c-745e-43f9-9086-6cbd0f202106',_binary '',_binary '\0','account',0,_binary '',NULL,'/realms/master/account/',_binary '\0',NULL,_binary '\0','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('3623b32e-1e08-4d22-8cb1-e1a39b192f48',_binary '',_binary '\0','master-realm',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','d22d3c39-cfbc-4bb2-99cd-9761f6004a33',NULL,0,_binary '\0',_binary '\0','master Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('5feb6c4a-2ec7-403b-99e1-97b6f9e4aa7a',_binary '',_binary '\0','security-admin-console',0,_binary '',NULL,'/admin/master/console/',_binary '\0',NULL,_binary '\0','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('666e1ac8-1776-419b-930f-462940887496',_binary '',_binary '\0','account-console',0,_binary '',NULL,'/realms/cinema/account/',_binary '\0',NULL,_binary '\0','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('984a23a6-c416-4b39-8730-09f0a1b76d49',_binary '',_binary '\0','cinema-realm',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','d22d3c39-cfbc-4bb2-99cd-9761f6004a33',NULL,0,_binary '\0',_binary '\0','cinema Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('9a3f9fd0-a451-4bc9-9a5d-66c968abc283',_binary '',_binary '\0','broker',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('c3e522a9-5bf4-47d7-888e-ae8fe7b88049',_binary '',_binary '\0','security-admin-console',0,_binary '',NULL,'/admin/cinema/console/',_binary '\0',NULL,_binary '\0','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('c9ae182b-0344-4d9c-80a9-af90e8a91e0a',_binary '',_binary '\0','account-console',0,_binary '',NULL,'/realms/master/account/',_binary '\0',NULL,_binary '\0','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('d5bb52e7-dda5-4bc6-82df-e78da0f9a622',_binary '',_binary '','cinema-api',0,_binary '\0','5qWmCCrmYELxGC6joRAJKI7YX8bU8qbW','',_binary '\0','',_binary '\0','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','openid-connect',-1,_binary '',_binary '\0','Cinema Api',_binary '','client-secret','','Client for cinema API',NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('d909397f-17d1-43b8-ad1c-414729ccb72e',_binary '',_binary '\0','admin-cli',0,_binary '',NULL,NULL,_binary '\0',NULL,_binary '\0','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0'),('e380d0a1-72e4-4fc1-b617-bc1970b17633',_binary '',_binary '\0','realm-management',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','openid-connect',0,_binary '\0',_binary '\0','${client_realm-management}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0');
/*!40000 ALTER TABLE `CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_ATTRIBUTES` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(4000) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  KEY `IDX_CLIENT_ATT_BY_NAME_VALUE` (`NAME`,`VALUE`(255)),
  CONSTRAINT `FK3C47C64BEACCA966` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_ATTRIBUTES`
--

LOCK TABLES `CLIENT_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_ATTRIBUTES` VALUES ('008382ce-2097-4f94-a588-2e1701dfe0aa','+','post.logout.redirect.uris'),('2bb6fb5c-745e-43f9-9086-6cbd0f202106','+','post.logout.redirect.uris'),('5feb6c4a-2ec7-403b-99e1-97b6f9e4aa7a','S256','pkce.code.challenge.method'),('5feb6c4a-2ec7-403b-99e1-97b6f9e4aa7a','+','post.logout.redirect.uris'),('666e1ac8-1776-419b-930f-462940887496','S256','pkce.code.challenge.method'),('666e1ac8-1776-419b-930f-462940887496','+','post.logout.redirect.uris'),('c3e522a9-5bf4-47d7-888e-ae8fe7b88049','S256','pkce.code.challenge.method'),('c3e522a9-5bf4-47d7-888e-ae8fe7b88049','+','post.logout.redirect.uris'),('c9ae182b-0344-4d9c-80a9-af90e8a91e0a','S256','pkce.code.challenge.method'),('c9ae182b-0344-4d9c-80a9-af90e8a91e0a','+','post.logout.redirect.uris'),('d5bb52e7-dda5-4bc6-82df-e78da0f9a622','false','backchannel.logout.revoke.offline.tokens'),('d5bb52e7-dda5-4bc6-82df-e78da0f9a622','true','backchannel.logout.session.required'),('d5bb52e7-dda5-4bc6-82df-e78da0f9a622','1703014850','client.secret.creation.time'),('d5bb52e7-dda5-4bc6-82df-e78da0f9a622','false','display.on.consent.screen'),('d5bb52e7-dda5-4bc6-82df-e78da0f9a622','true','oauth2.device.authorization.grant.enabled'),('d5bb52e7-dda5-4bc6-82df-e78da0f9a622','false','oidc.ciba.grant.enabled');
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_AUTH_FLOW_BINDINGS`
--

DROP TABLE IF EXISTS `CLIENT_AUTH_FLOW_BINDINGS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_AUTH_FLOW_BINDINGS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `BINDING_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`BINDING_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_AUTH_FLOW_BINDINGS`
--

LOCK TABLES `CLIENT_AUTH_FLOW_BINDINGS` WRITE;
/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_INITIAL_ACCESS`
--

DROP TABLE IF EXISTS `CLIENT_INITIAL_ACCESS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_INITIAL_ACCESS` (
  `ID` varchar(36) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `TIMESTAMP` int(11) DEFAULT NULL,
  `EXPIRATION` int(11) DEFAULT NULL,
  `COUNT` int(11) DEFAULT NULL,
  `REMAINING_COUNT` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_INIT_ACC_REALM` (`REALM_ID`),
  CONSTRAINT `FK_CLIENT_INIT_ACC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_INITIAL_ACCESS`
--

LOCK TABLES `CLIENT_INITIAL_ACCESS` WRITE;
/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_NODE_REGISTRATIONS`
--

DROP TABLE IF EXISTS `CLIENT_NODE_REGISTRATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_NODE_REGISTRATIONS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` int(11) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  CONSTRAINT `FK4129723BA992F594` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_NODE_REGISTRATIONS`
--

LOCK TABLES `CLIENT_NODE_REGISTRATIONS` WRITE;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_CLI_SCOPE` (`REALM_ID`,`NAME`),
  KEY `IDX_REALM_CLSCOPE` (`REALM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE`
--

LOCK TABLES `CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE` VALUES ('08f86efb-6e6c-4ad1-98b9-8e5012522951','address','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','OpenID Connect built-in scope: address','openid-connect'),('091bbbc4-4e5e-4be6-99a4-1125f23752d9','phone','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','OpenID Connect built-in scope: phone','openid-connect'),('0f0626fd-30cf-4ac4-a3b5-0e532b9ff602','role_list','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','SAML role list','saml'),('12b2691e-e3f5-45a8-824d-cd268d851c07','web-origins','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('1cc7aabb-8189-4262-bcb6-060bd15764bf','offline_access','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','OpenID Connect built-in scope: offline_access','openid-connect'),('1df52d35-b24d-4f03-be0f-db7c10273db0','roles','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','OpenID Connect scope for add user roles to the access token','openid-connect'),('218caddf-16df-4535-ad37-14979d6a8ca1','email','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','OpenID Connect built-in scope: email','openid-connect'),('55338902-b018-4f4c-a336-63e1bc719b82','profile','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','OpenID Connect built-in scope: profile','openid-connect'),('5c9e885a-363b-4ee2-819a-515962679547','role_list','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','SAML role list','saml'),('5ccdda95-d52c-4181-adcc-74a934c1b86c','address','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','OpenID Connect built-in scope: address','openid-connect'),('5cd556af-7e38-4e57-8ce6-6a9ea3d2a113','microprofile-jwt','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','Microprofile - JWT built-in scope','openid-connect'),('6596a5d6-6973-4ffa-92ce-d8f067eadc63','roles','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','OpenID Connect scope for add user roles to the access token','openid-connect'),('68d8366c-476b-4d66-8ab4-66f33b71764d','acr','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','OpenID Connect scope for add acr (authentication context class reference) to the token','openid-connect'),('9ec49961-8485-45b9-80ee-7dd7cb9a4613','microprofile-jwt','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','Microprofile - JWT built-in scope','openid-connect'),('abb6e108-c022-4733-968a-495a82a12c8c','phone','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','OpenID Connect built-in scope: phone','openid-connect'),('bd96178b-4c96-467d-9560-20d2c1bb2e3d','web-origins','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('be3b20ab-4858-425b-be00-2b1ddc66b273','acr','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','OpenID Connect scope for add acr (authentication context class reference) to the token','openid-connect'),('d99485bc-7bd8-42f1-ac50-3d011efee1ce','profile','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','OpenID Connect built-in scope: profile','openid-connect'),('ed4713b9-c1c6-4ea8-93d7-14ffe4a7f926','offline_access','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','OpenID Connect built-in scope: offline_access','openid-connect'),('edf0cd87-c000-4953-9a35-1d367848a84a','email','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','OpenID Connect built-in scope: email','openid-connect');
/*!40000 ALTER TABLE `CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_ATTRIBUTES` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `VALUE` varchar(2048) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`NAME`),
  KEY `IDX_CLSCOPE_ATTRS` (`SCOPE_ID`),
  CONSTRAINT `FK_CL_SCOPE_ATTR_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ATTRIBUTES`
--

LOCK TABLES `CLIENT_SCOPE_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('08f86efb-6e6c-4ad1-98b9-8e5012522951','${addressScopeConsentText}','consent.screen.text'),('08f86efb-6e6c-4ad1-98b9-8e5012522951','true','display.on.consent.screen'),('08f86efb-6e6c-4ad1-98b9-8e5012522951','true','include.in.token.scope'),('091bbbc4-4e5e-4be6-99a4-1125f23752d9','${phoneScopeConsentText}','consent.screen.text'),('091bbbc4-4e5e-4be6-99a4-1125f23752d9','true','display.on.consent.screen'),('091bbbc4-4e5e-4be6-99a4-1125f23752d9','true','include.in.token.scope'),('0f0626fd-30cf-4ac4-a3b5-0e532b9ff602','${samlRoleListScopeConsentText}','consent.screen.text'),('0f0626fd-30cf-4ac4-a3b5-0e532b9ff602','true','display.on.consent.screen'),('12b2691e-e3f5-45a8-824d-cd268d851c07','','consent.screen.text'),('12b2691e-e3f5-45a8-824d-cd268d851c07','false','display.on.consent.screen'),('12b2691e-e3f5-45a8-824d-cd268d851c07','false','include.in.token.scope'),('1cc7aabb-8189-4262-bcb6-060bd15764bf','${offlineAccessScopeConsentText}','consent.screen.text'),('1cc7aabb-8189-4262-bcb6-060bd15764bf','true','display.on.consent.screen'),('1df52d35-b24d-4f03-be0f-db7c10273db0','${rolesScopeConsentText}','consent.screen.text'),('1df52d35-b24d-4f03-be0f-db7c10273db0','true','display.on.consent.screen'),('1df52d35-b24d-4f03-be0f-db7c10273db0','false','include.in.token.scope'),('218caddf-16df-4535-ad37-14979d6a8ca1','${emailScopeConsentText}','consent.screen.text'),('218caddf-16df-4535-ad37-14979d6a8ca1','true','display.on.consent.screen'),('218caddf-16df-4535-ad37-14979d6a8ca1','true','include.in.token.scope'),('55338902-b018-4f4c-a336-63e1bc719b82','${profileScopeConsentText}','consent.screen.text'),('55338902-b018-4f4c-a336-63e1bc719b82','true','display.on.consent.screen'),('55338902-b018-4f4c-a336-63e1bc719b82','true','include.in.token.scope'),('5c9e885a-363b-4ee2-819a-515962679547','${samlRoleListScopeConsentText}','consent.screen.text'),('5c9e885a-363b-4ee2-819a-515962679547','true','display.on.consent.screen'),('5ccdda95-d52c-4181-adcc-74a934c1b86c','${addressScopeConsentText}','consent.screen.text'),('5ccdda95-d52c-4181-adcc-74a934c1b86c','true','display.on.consent.screen'),('5ccdda95-d52c-4181-adcc-74a934c1b86c','true','include.in.token.scope'),('5cd556af-7e38-4e57-8ce6-6a9ea3d2a113','false','display.on.consent.screen'),('5cd556af-7e38-4e57-8ce6-6a9ea3d2a113','true','include.in.token.scope'),('6596a5d6-6973-4ffa-92ce-d8f067eadc63','${rolesScopeConsentText}','consent.screen.text'),('6596a5d6-6973-4ffa-92ce-d8f067eadc63','true','display.on.consent.screen'),('6596a5d6-6973-4ffa-92ce-d8f067eadc63','false','include.in.token.scope'),('68d8366c-476b-4d66-8ab4-66f33b71764d','false','display.on.consent.screen'),('68d8366c-476b-4d66-8ab4-66f33b71764d','false','include.in.token.scope'),('9ec49961-8485-45b9-80ee-7dd7cb9a4613','false','display.on.consent.screen'),('9ec49961-8485-45b9-80ee-7dd7cb9a4613','true','include.in.token.scope'),('abb6e108-c022-4733-968a-495a82a12c8c','${phoneScopeConsentText}','consent.screen.text'),('abb6e108-c022-4733-968a-495a82a12c8c','true','display.on.consent.screen'),('abb6e108-c022-4733-968a-495a82a12c8c','true','include.in.token.scope'),('bd96178b-4c96-467d-9560-20d2c1bb2e3d','','consent.screen.text'),('bd96178b-4c96-467d-9560-20d2c1bb2e3d','false','display.on.consent.screen'),('bd96178b-4c96-467d-9560-20d2c1bb2e3d','false','include.in.token.scope'),('be3b20ab-4858-425b-be00-2b1ddc66b273','false','display.on.consent.screen'),('be3b20ab-4858-425b-be00-2b1ddc66b273','false','include.in.token.scope'),('d99485bc-7bd8-42f1-ac50-3d011efee1ce','${profileScopeConsentText}','consent.screen.text'),('d99485bc-7bd8-42f1-ac50-3d011efee1ce','true','display.on.consent.screen'),('d99485bc-7bd8-42f1-ac50-3d011efee1ce','true','include.in.token.scope'),('ed4713b9-c1c6-4ea8-93d7-14ffe4a7f926','${offlineAccessScopeConsentText}','consent.screen.text'),('ed4713b9-c1c6-4ea8-93d7-14ffe4a7f926','true','display.on.consent.screen'),('edf0cd87-c000-4953-9a35-1d367848a84a','${emailScopeConsentText}','consent.screen.text'),('edf0cd87-c000-4953-9a35-1d367848a84a','true','display.on.consent.screen'),('edf0cd87-c000-4953-9a35-1d367848a84a','true','include.in.token.scope');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_CLIENT`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_CLIENT` (
  `CLIENT_ID` varchar(255) NOT NULL,
  `SCOPE_ID` varchar(255) NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`CLIENT_ID`,`SCOPE_ID`),
  KEY `IDX_CLSCOPE_CL` (`CLIENT_ID`),
  KEY `IDX_CL_CLSCOPE` (`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_CLIENT`
--

LOCK TABLES `CLIENT_SCOPE_CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('008382ce-2097-4f94-a588-2e1701dfe0aa','08f86efb-6e6c-4ad1-98b9-8e5012522951',_binary '\0'),('008382ce-2097-4f94-a588-2e1701dfe0aa','091bbbc4-4e5e-4be6-99a4-1125f23752d9',_binary '\0'),('008382ce-2097-4f94-a588-2e1701dfe0aa','12b2691e-e3f5-45a8-824d-cd268d851c07',_binary ''),('008382ce-2097-4f94-a588-2e1701dfe0aa','1df52d35-b24d-4f03-be0f-db7c10273db0',_binary ''),('008382ce-2097-4f94-a588-2e1701dfe0aa','55338902-b018-4f4c-a336-63e1bc719b82',_binary ''),('008382ce-2097-4f94-a588-2e1701dfe0aa','5cd556af-7e38-4e57-8ce6-6a9ea3d2a113',_binary '\0'),('008382ce-2097-4f94-a588-2e1701dfe0aa','68d8366c-476b-4d66-8ab4-66f33b71764d',_binary ''),('008382ce-2097-4f94-a588-2e1701dfe0aa','ed4713b9-c1c6-4ea8-93d7-14ffe4a7f926',_binary '\0'),('008382ce-2097-4f94-a588-2e1701dfe0aa','edf0cd87-c000-4953-9a35-1d367848a84a',_binary ''),('0b343fff-8234-4a4c-8b7f-c05f7437d505','08f86efb-6e6c-4ad1-98b9-8e5012522951',_binary '\0'),('0b343fff-8234-4a4c-8b7f-c05f7437d505','091bbbc4-4e5e-4be6-99a4-1125f23752d9',_binary '\0'),('0b343fff-8234-4a4c-8b7f-c05f7437d505','12b2691e-e3f5-45a8-824d-cd268d851c07',_binary ''),('0b343fff-8234-4a4c-8b7f-c05f7437d505','1df52d35-b24d-4f03-be0f-db7c10273db0',_binary ''),('0b343fff-8234-4a4c-8b7f-c05f7437d505','55338902-b018-4f4c-a336-63e1bc719b82',_binary ''),('0b343fff-8234-4a4c-8b7f-c05f7437d505','5cd556af-7e38-4e57-8ce6-6a9ea3d2a113',_binary '\0'),('0b343fff-8234-4a4c-8b7f-c05f7437d505','68d8366c-476b-4d66-8ab4-66f33b71764d',_binary ''),('0b343fff-8234-4a4c-8b7f-c05f7437d505','ed4713b9-c1c6-4ea8-93d7-14ffe4a7f926',_binary '\0'),('0b343fff-8234-4a4c-8b7f-c05f7437d505','edf0cd87-c000-4953-9a35-1d367848a84a',_binary ''),('0e2f922e-a2c3-4619-99b4-104c9a5357ec','1cc7aabb-8189-4262-bcb6-060bd15764bf',_binary '\0'),('0e2f922e-a2c3-4619-99b4-104c9a5357ec','218caddf-16df-4535-ad37-14979d6a8ca1',_binary ''),('0e2f922e-a2c3-4619-99b4-104c9a5357ec','5ccdda95-d52c-4181-adcc-74a934c1b86c',_binary '\0'),('0e2f922e-a2c3-4619-99b4-104c9a5357ec','6596a5d6-6973-4ffa-92ce-d8f067eadc63',_binary ''),('0e2f922e-a2c3-4619-99b4-104c9a5357ec','9ec49961-8485-45b9-80ee-7dd7cb9a4613',_binary '\0'),('0e2f922e-a2c3-4619-99b4-104c9a5357ec','abb6e108-c022-4733-968a-495a82a12c8c',_binary '\0'),('0e2f922e-a2c3-4619-99b4-104c9a5357ec','bd96178b-4c96-467d-9560-20d2c1bb2e3d',_binary ''),('0e2f922e-a2c3-4619-99b4-104c9a5357ec','be3b20ab-4858-425b-be00-2b1ddc66b273',_binary ''),('0e2f922e-a2c3-4619-99b4-104c9a5357ec','d99485bc-7bd8-42f1-ac50-3d011efee1ce',_binary ''),('2bb6fb5c-745e-43f9-9086-6cbd0f202106','1cc7aabb-8189-4262-bcb6-060bd15764bf',_binary '\0'),('2bb6fb5c-745e-43f9-9086-6cbd0f202106','218caddf-16df-4535-ad37-14979d6a8ca1',_binary ''),('2bb6fb5c-745e-43f9-9086-6cbd0f202106','5ccdda95-d52c-4181-adcc-74a934c1b86c',_binary '\0'),('2bb6fb5c-745e-43f9-9086-6cbd0f202106','6596a5d6-6973-4ffa-92ce-d8f067eadc63',_binary ''),('2bb6fb5c-745e-43f9-9086-6cbd0f202106','9ec49961-8485-45b9-80ee-7dd7cb9a4613',_binary '\0'),('2bb6fb5c-745e-43f9-9086-6cbd0f202106','abb6e108-c022-4733-968a-495a82a12c8c',_binary '\0'),('2bb6fb5c-745e-43f9-9086-6cbd0f202106','bd96178b-4c96-467d-9560-20d2c1bb2e3d',_binary ''),('2bb6fb5c-745e-43f9-9086-6cbd0f202106','be3b20ab-4858-425b-be00-2b1ddc66b273',_binary ''),('2bb6fb5c-745e-43f9-9086-6cbd0f202106','d99485bc-7bd8-42f1-ac50-3d011efee1ce',_binary ''),('3623b32e-1e08-4d22-8cb1-e1a39b192f48','1cc7aabb-8189-4262-bcb6-060bd15764bf',_binary '\0'),('3623b32e-1e08-4d22-8cb1-e1a39b192f48','218caddf-16df-4535-ad37-14979d6a8ca1',_binary ''),('3623b32e-1e08-4d22-8cb1-e1a39b192f48','5ccdda95-d52c-4181-adcc-74a934c1b86c',_binary '\0'),('3623b32e-1e08-4d22-8cb1-e1a39b192f48','6596a5d6-6973-4ffa-92ce-d8f067eadc63',_binary ''),('3623b32e-1e08-4d22-8cb1-e1a39b192f48','9ec49961-8485-45b9-80ee-7dd7cb9a4613',_binary '\0'),('3623b32e-1e08-4d22-8cb1-e1a39b192f48','abb6e108-c022-4733-968a-495a82a12c8c',_binary '\0'),('3623b32e-1e08-4d22-8cb1-e1a39b192f48','bd96178b-4c96-467d-9560-20d2c1bb2e3d',_binary ''),('3623b32e-1e08-4d22-8cb1-e1a39b192f48','be3b20ab-4858-425b-be00-2b1ddc66b273',_binary ''),('3623b32e-1e08-4d22-8cb1-e1a39b192f48','d99485bc-7bd8-42f1-ac50-3d011efee1ce',_binary ''),('5feb6c4a-2ec7-403b-99e1-97b6f9e4aa7a','1cc7aabb-8189-4262-bcb6-060bd15764bf',_binary '\0'),('5feb6c4a-2ec7-403b-99e1-97b6f9e4aa7a','218caddf-16df-4535-ad37-14979d6a8ca1',_binary ''),('5feb6c4a-2ec7-403b-99e1-97b6f9e4aa7a','5ccdda95-d52c-4181-adcc-74a934c1b86c',_binary '\0'),('5feb6c4a-2ec7-403b-99e1-97b6f9e4aa7a','6596a5d6-6973-4ffa-92ce-d8f067eadc63',_binary ''),('5feb6c4a-2ec7-403b-99e1-97b6f9e4aa7a','9ec49961-8485-45b9-80ee-7dd7cb9a4613',_binary '\0'),('5feb6c4a-2ec7-403b-99e1-97b6f9e4aa7a','abb6e108-c022-4733-968a-495a82a12c8c',_binary '\0'),('5feb6c4a-2ec7-403b-99e1-97b6f9e4aa7a','bd96178b-4c96-467d-9560-20d2c1bb2e3d',_binary ''),('5feb6c4a-2ec7-403b-99e1-97b6f9e4aa7a','be3b20ab-4858-425b-be00-2b1ddc66b273',_binary ''),('5feb6c4a-2ec7-403b-99e1-97b6f9e4aa7a','d99485bc-7bd8-42f1-ac50-3d011efee1ce',_binary ''),('666e1ac8-1776-419b-930f-462940887496','08f86efb-6e6c-4ad1-98b9-8e5012522951',_binary '\0'),('666e1ac8-1776-419b-930f-462940887496','091bbbc4-4e5e-4be6-99a4-1125f23752d9',_binary '\0'),('666e1ac8-1776-419b-930f-462940887496','12b2691e-e3f5-45a8-824d-cd268d851c07',_binary ''),('666e1ac8-1776-419b-930f-462940887496','1df52d35-b24d-4f03-be0f-db7c10273db0',_binary ''),('666e1ac8-1776-419b-930f-462940887496','55338902-b018-4f4c-a336-63e1bc719b82',_binary ''),('666e1ac8-1776-419b-930f-462940887496','5cd556af-7e38-4e57-8ce6-6a9ea3d2a113',_binary '\0'),('666e1ac8-1776-419b-930f-462940887496','68d8366c-476b-4d66-8ab4-66f33b71764d',_binary ''),('666e1ac8-1776-419b-930f-462940887496','ed4713b9-c1c6-4ea8-93d7-14ffe4a7f926',_binary '\0'),('666e1ac8-1776-419b-930f-462940887496','edf0cd87-c000-4953-9a35-1d367848a84a',_binary ''),('9a3f9fd0-a451-4bc9-9a5d-66c968abc283','08f86efb-6e6c-4ad1-98b9-8e5012522951',_binary '\0'),('9a3f9fd0-a451-4bc9-9a5d-66c968abc283','091bbbc4-4e5e-4be6-99a4-1125f23752d9',_binary '\0'),('9a3f9fd0-a451-4bc9-9a5d-66c968abc283','12b2691e-e3f5-45a8-824d-cd268d851c07',_binary ''),('9a3f9fd0-a451-4bc9-9a5d-66c968abc283','1df52d35-b24d-4f03-be0f-db7c10273db0',_binary ''),('9a3f9fd0-a451-4bc9-9a5d-66c968abc283','55338902-b018-4f4c-a336-63e1bc719b82',_binary ''),('9a3f9fd0-a451-4bc9-9a5d-66c968abc283','5cd556af-7e38-4e57-8ce6-6a9ea3d2a113',_binary '\0'),('9a3f9fd0-a451-4bc9-9a5d-66c968abc283','68d8366c-476b-4d66-8ab4-66f33b71764d',_binary ''),('9a3f9fd0-a451-4bc9-9a5d-66c968abc283','ed4713b9-c1c6-4ea8-93d7-14ffe4a7f926',_binary '\0'),('9a3f9fd0-a451-4bc9-9a5d-66c968abc283','edf0cd87-c000-4953-9a35-1d367848a84a',_binary ''),('c3e522a9-5bf4-47d7-888e-ae8fe7b88049','08f86efb-6e6c-4ad1-98b9-8e5012522951',_binary '\0'),('c3e522a9-5bf4-47d7-888e-ae8fe7b88049','091bbbc4-4e5e-4be6-99a4-1125f23752d9',_binary '\0'),('c3e522a9-5bf4-47d7-888e-ae8fe7b88049','12b2691e-e3f5-45a8-824d-cd268d851c07',_binary ''),('c3e522a9-5bf4-47d7-888e-ae8fe7b88049','1df52d35-b24d-4f03-be0f-db7c10273db0',_binary ''),('c3e522a9-5bf4-47d7-888e-ae8fe7b88049','55338902-b018-4f4c-a336-63e1bc719b82',_binary ''),('c3e522a9-5bf4-47d7-888e-ae8fe7b88049','5cd556af-7e38-4e57-8ce6-6a9ea3d2a113',_binary '\0'),('c3e522a9-5bf4-47d7-888e-ae8fe7b88049','68d8366c-476b-4d66-8ab4-66f33b71764d',_binary ''),('c3e522a9-5bf4-47d7-888e-ae8fe7b88049','ed4713b9-c1c6-4ea8-93d7-14ffe4a7f926',_binary '\0'),('c3e522a9-5bf4-47d7-888e-ae8fe7b88049','edf0cd87-c000-4953-9a35-1d367848a84a',_binary ''),('c9ae182b-0344-4d9c-80a9-af90e8a91e0a','1cc7aabb-8189-4262-bcb6-060bd15764bf',_binary '\0'),('c9ae182b-0344-4d9c-80a9-af90e8a91e0a','218caddf-16df-4535-ad37-14979d6a8ca1',_binary ''),('c9ae182b-0344-4d9c-80a9-af90e8a91e0a','5ccdda95-d52c-4181-adcc-74a934c1b86c',_binary '\0'),('c9ae182b-0344-4d9c-80a9-af90e8a91e0a','6596a5d6-6973-4ffa-92ce-d8f067eadc63',_binary ''),('c9ae182b-0344-4d9c-80a9-af90e8a91e0a','9ec49961-8485-45b9-80ee-7dd7cb9a4613',_binary '\0'),('c9ae182b-0344-4d9c-80a9-af90e8a91e0a','abb6e108-c022-4733-968a-495a82a12c8c',_binary '\0'),('c9ae182b-0344-4d9c-80a9-af90e8a91e0a','bd96178b-4c96-467d-9560-20d2c1bb2e3d',_binary ''),('c9ae182b-0344-4d9c-80a9-af90e8a91e0a','be3b20ab-4858-425b-be00-2b1ddc66b273',_binary ''),('c9ae182b-0344-4d9c-80a9-af90e8a91e0a','d99485bc-7bd8-42f1-ac50-3d011efee1ce',_binary ''),('d5bb52e7-dda5-4bc6-82df-e78da0f9a622','08f86efb-6e6c-4ad1-98b9-8e5012522951',_binary '\0'),('d5bb52e7-dda5-4bc6-82df-e78da0f9a622','091bbbc4-4e5e-4be6-99a4-1125f23752d9',_binary '\0'),('d5bb52e7-dda5-4bc6-82df-e78da0f9a622','12b2691e-e3f5-45a8-824d-cd268d851c07',_binary ''),('d5bb52e7-dda5-4bc6-82df-e78da0f9a622','1df52d35-b24d-4f03-be0f-db7c10273db0',_binary ''),('d5bb52e7-dda5-4bc6-82df-e78da0f9a622','55338902-b018-4f4c-a336-63e1bc719b82',_binary ''),('d5bb52e7-dda5-4bc6-82df-e78da0f9a622','5cd556af-7e38-4e57-8ce6-6a9ea3d2a113',_binary '\0'),('d5bb52e7-dda5-4bc6-82df-e78da0f9a622','68d8366c-476b-4d66-8ab4-66f33b71764d',_binary ''),('d5bb52e7-dda5-4bc6-82df-e78da0f9a622','ed4713b9-c1c6-4ea8-93d7-14ffe4a7f926',_binary '\0'),('d5bb52e7-dda5-4bc6-82df-e78da0f9a622','edf0cd87-c000-4953-9a35-1d367848a84a',_binary ''),('d909397f-17d1-43b8-ad1c-414729ccb72e','1cc7aabb-8189-4262-bcb6-060bd15764bf',_binary '\0'),('d909397f-17d1-43b8-ad1c-414729ccb72e','218caddf-16df-4535-ad37-14979d6a8ca1',_binary ''),('d909397f-17d1-43b8-ad1c-414729ccb72e','5ccdda95-d52c-4181-adcc-74a934c1b86c',_binary '\0'),('d909397f-17d1-43b8-ad1c-414729ccb72e','6596a5d6-6973-4ffa-92ce-d8f067eadc63',_binary ''),('d909397f-17d1-43b8-ad1c-414729ccb72e','9ec49961-8485-45b9-80ee-7dd7cb9a4613',_binary '\0'),('d909397f-17d1-43b8-ad1c-414729ccb72e','abb6e108-c022-4733-968a-495a82a12c8c',_binary '\0'),('d909397f-17d1-43b8-ad1c-414729ccb72e','bd96178b-4c96-467d-9560-20d2c1bb2e3d',_binary ''),('d909397f-17d1-43b8-ad1c-414729ccb72e','be3b20ab-4858-425b-be00-2b1ddc66b273',_binary ''),('d909397f-17d1-43b8-ad1c-414729ccb72e','d99485bc-7bd8-42f1-ac50-3d011efee1ce',_binary ''),('e380d0a1-72e4-4fc1-b617-bc1970b17633','08f86efb-6e6c-4ad1-98b9-8e5012522951',_binary '\0'),('e380d0a1-72e4-4fc1-b617-bc1970b17633','091bbbc4-4e5e-4be6-99a4-1125f23752d9',_binary '\0'),('e380d0a1-72e4-4fc1-b617-bc1970b17633','12b2691e-e3f5-45a8-824d-cd268d851c07',_binary ''),('e380d0a1-72e4-4fc1-b617-bc1970b17633','1df52d35-b24d-4f03-be0f-db7c10273db0',_binary ''),('e380d0a1-72e4-4fc1-b617-bc1970b17633','55338902-b018-4f4c-a336-63e1bc719b82',_binary ''),('e380d0a1-72e4-4fc1-b617-bc1970b17633','5cd556af-7e38-4e57-8ce6-6a9ea3d2a113',_binary '\0'),('e380d0a1-72e4-4fc1-b617-bc1970b17633','68d8366c-476b-4d66-8ab4-66f33b71764d',_binary ''),('e380d0a1-72e4-4fc1-b617-bc1970b17633','ed4713b9-c1c6-4ea8-93d7-14ffe4a7f926',_binary '\0'),('e380d0a1-72e4-4fc1-b617-bc1970b17633','edf0cd87-c000-4953-9a35-1d367848a84a',_binary '');
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_ROLE_MAPPING` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`ROLE_ID`),
  KEY `IDX_CLSCOPE_ROLE` (`SCOPE_ID`),
  KEY `IDX_ROLE_CLSCOPE` (`ROLE_ID`),
  CONSTRAINT `FK_CL_SCOPE_RM_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ROLE_MAPPING`
--

LOCK TABLES `CLIENT_SCOPE_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ROLE_MAPPING` VALUES ('1cc7aabb-8189-4262-bcb6-060bd15764bf','dd1c2672-b530-4b1c-bc88-6eada6266269'),('ed4713b9-c1c6-4ea8-93d7-14ffe4a7f926','0ed9a06b-70e6-4bca-a19f-1cb442715264');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION`
--

DROP TABLE IF EXISTS `CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `REDIRECT_URI` varchar(255) DEFAULT NULL,
  `STATE` varchar(255) DEFAULT NULL,
  `TIMESTAMP` int(11) DEFAULT NULL,
  `SESSION_ID` varchar(36) DEFAULT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(36) DEFAULT NULL,
  `CURRENT_ACTION` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_SESSION_SESSION` (`SESSION_ID`),
  CONSTRAINT `FK_B4AO2VCVAT6UKAU74WBWTFQO1` FOREIGN KEY (`SESSION_ID`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION`
--

LOCK TABLES `CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_AUTH_STATUS`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_AUTH_STATUS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_AUTH_STATUS` (
  `AUTHENTICATOR` varchar(36) NOT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`AUTHENTICATOR`),
  CONSTRAINT `AUTH_STATUS_CONSTRAINT` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_AUTH_STATUS`
--

LOCK TABLES `CLIENT_SESSION_AUTH_STATUS` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_NOTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51C2736` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_NOTE`
--

LOCK TABLES `CLIENT_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_PROT_MAPPER`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_PROT_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_PROT_MAPPER` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`PROTOCOL_MAPPER_ID`),
  CONSTRAINT `FK_33A8SGQW18I532811V7O2DK89` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_PROT_MAPPER`
--

LOCK TABLES `CLIENT_SESSION_PROT_MAPPER` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_ROLE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_ROLE` (
  `ROLE_ID` varchar(255) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`ROLE_ID`),
  CONSTRAINT `FK_11B7SGQW18I532811V7O2DV76` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_ROLE`
--

LOCK TABLES `CLIENT_SESSION_ROLE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_USER_SESSION_NOTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(2048) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK_CL_USR_SES_NOTE` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_USER_SESSION_NOTE`
--

LOCK TABLES `CLIENT_USER_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT`
--

DROP TABLE IF EXISTS `COMPONENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPONENT` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_TYPE` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `SUB_TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPONENT_REALM` (`REALM_ID`),
  KEY `IDX_COMPONENT_PROVIDER_TYPE` (`PROVIDER_TYPE`),
  CONSTRAINT `FK_COMPONENT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT`
--

LOCK TABLES `COMPONENT` WRITE;
/*!40000 ALTER TABLE `COMPONENT` DISABLE KEYS */;
INSERT INTO `COMPONENT` VALUES ('01921d69-c80e-4a2e-8ac1-631994389170','Max Clients Limit','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','anonymous'),('05e5ecce-382f-4cee-be20-7241c8c545e5','aes-generated','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','aes-generated','org.keycloak.keys.KeyProvider','d22d3c39-cfbc-4bb2-99cd-9761f6004a33',NULL),('0b2dc85c-62f2-4ab1-883d-79c3b3f55021','Allowed Protocol Mapper Types','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','authenticated'),('23965871-bfed-4405-ac92-b9da2bab2dd0','rsa-generated','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','rsa-generated','org.keycloak.keys.KeyProvider','2eabb7d4-0c33-46d6-84b9-8461bcb3177a',NULL),('27945c3f-a0e0-4594-9375-42a1a7d83205','Allowed Protocol Mapper Types','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','authenticated'),('3c1b9a5f-6524-4f84-a539-c3ed4257407c','Allowed Client Scopes','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','authenticated'),('54719f27-46a6-4cef-864d-7008c37606cb','Allowed Protocol Mapper Types','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','anonymous'),('56c2f9be-4942-4084-af1c-17520610bd44','Consent Required','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','anonymous'),('622da6c3-c789-4fa3-a4ff-44bc9e917ded','rsa-enc-generated','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','rsa-enc-generated','org.keycloak.keys.KeyProvider','2eabb7d4-0c33-46d6-84b9-8461bcb3177a',NULL),('70b92ab1-37c9-4fe0-bca1-4c0c8524bae3','Trusted Hosts','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','anonymous'),('71f1c515-a60a-45bb-a880-ec4d8993fb40','Full Scope Disabled','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','anonymous'),('8938128d-fee3-4141-b582-490184790353','Trusted Hosts','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','anonymous'),('8f65f8d9-889b-4936-aa51-082798bc1efa','Allowed Client Scopes','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','authenticated'),('9d123d10-d1b2-4e6b-b8e7-1ac2a8f0a2a6','Full Scope Disabled','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','anonymous'),('a4634793-9ff2-4e04-b0a1-f682349a345a','rsa-generated','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','rsa-generated','org.keycloak.keys.KeyProvider','d22d3c39-cfbc-4bb2-99cd-9761f6004a33',NULL),('b6910619-7155-4758-9204-922e4c1a1e9d','rsa-enc-generated','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','rsa-enc-generated','org.keycloak.keys.KeyProvider','d22d3c39-cfbc-4bb2-99cd-9761f6004a33',NULL),('beedb21b-7123-4f0d-87f3-5c1eff1ecdc3','hmac-generated','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','hmac-generated','org.keycloak.keys.KeyProvider','d22d3c39-cfbc-4bb2-99cd-9761f6004a33',NULL),('c83539d5-5ce6-4826-9c7b-ad829d7e18a5','aes-generated','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','aes-generated','org.keycloak.keys.KeyProvider','2eabb7d4-0c33-46d6-84b9-8461bcb3177a',NULL),('d8ed97b9-d63b-433f-9cde-842de2ee89e7','Max Clients Limit','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','anonymous'),('db901485-66ec-42f2-80f3-35f8870c4de1','Consent Required','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','anonymous'),('e32adca5-995f-4771-b484-9bd87dce3eca','Allowed Protocol Mapper Types','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','anonymous'),('e80a96bc-1ef5-434f-a1de-1dd2ba6c2470','Allowed Client Scopes','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','anonymous'),('ea7b69ab-630d-48a5-9087-ce894de42df1','Allowed Client Scopes','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','anonymous'),('efa94721-cfff-46e3-9eec-a73a9db5ce35','hmac-generated','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','hmac-generated','org.keycloak.keys.KeyProvider','2eabb7d4-0c33-46d6-84b9-8461bcb3177a',NULL);
/*!40000 ALTER TABLE `COMPONENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT_CONFIG`
--

DROP TABLE IF EXISTS `COMPONENT_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPONENT_CONFIG` (
  `ID` varchar(36) NOT NULL,
  `COMPONENT_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPO_CONFIG_COMPO` (`COMPONENT_ID`),
  CONSTRAINT `FK_COMPONENT_CONFIG` FOREIGN KEY (`COMPONENT_ID`) REFERENCES `COMPONENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT_CONFIG`
--

LOCK TABLES `COMPONENT_CONFIG` WRITE;
/*!40000 ALTER TABLE `COMPONENT_CONFIG` DISABLE KEYS */;
INSERT INTO `COMPONENT_CONFIG` VALUES ('0ac8aae3-89a0-4ee9-9847-deda2f1401b7','27945c3f-a0e0-4594-9375-42a1a7d83205','allowed-protocol-mapper-types','saml-user-property-mapper'),('0caea4e4-336c-414e-861c-c9035302baab','70b92ab1-37c9-4fe0-bca1-4c0c8524bae3','client-uris-must-match','true'),('163ab09e-cfcf-4614-87b4-e59f7930f0e3','0b2dc85c-62f2-4ab1-883d-79c3b3f55021','allowed-protocol-mapper-types','saml-user-property-mapper'),('16b8a07d-a56a-48f3-8db3-a090d9efc763','23965871-bfed-4405-ac92-b9da2bab2dd0','privateKey','MIIEpQIBAAKCAQEAnLs/nXOF80tCSeR0ECL5MFY6cA0drAwV0Vpab/379hfl2p9qLAJqRqFSlIqEKdDJqtLjXt2A7xHQcQcyn1/uBjKQKCcyCvNgEgL4KSPOS2G/chuRTsavfkZUn1OxOZFWwz7Zf5aBMTipzRl6ioz3zbXLCZiR0IpgNIsqgNBk7DIdi0cDbSL56n8xx0x6a+xxjkWLg/iRZfhyFjmBG1RtjaunQtFW3qKSTeZOyLhHOW06gjcgbz/sIk/vsYeN6Sr/o5UqOv+FTD187usaBnKz0t+gnn7Lr6lrhWDdHCkacKwEUXFKYFmAF0/RaNZDtnpptrrimZrnnvMwC9MGZonKrQIDAQABAoIBAAj3u87rVmg9JPiruNUC3fAyltsPcmRZjVayYpyoKHuvErNHeMs2LioxaSi0+OqYQYRj1vz4E+cEmsEaMNQmqIIJRZn5OCdL6pzNN7F0P4Ws/PJvT7P1XALlIkq61AKfusT8JR9kQgB00LO6t/oSe8v05r5QplM2Klqx9cdzZRA7QjIODHvc2C+T6ybrp4Bns1Y/myfxCux/oFGVVL6ke0NzzDHxSwilNT0OER49lzRn6VakUYT09nHi7Oj1l/Jkl4j27lG1gJp7tNF/lOuSbrDk5/oyNqSlvOaLu4TvOGPdTsXbucPp4Tbhiginp1TiemPwwT/0ktgu8RKfRp53PE8CgYEA187iAePSqjzKBNfqo9SQDg4tFNqq10Yenu/Tx5p58dqHV2hjF4wZfa9yOfltvlK+Dp1/62EJlQYG94reAgYaQZRqp3JfihR4acaEiFlH1OgzkhGKoQItPHJ+BCTlC1w4pB/0PcgDp+wqT5prf75LEUGdl9TjnsTaqleoIXUtQgMCgYEAuevBzfzH57KdsqQSN+TvhCAZ0vVu+8wL4QRmdASZOUoMP4gh4MAUmPzCMVklxngf+1ma/U5Or2S9SsPmB0YlFJCBXVzCdX1oEidn/Eq1uYob/mjB/9v8ISCcUgrMIeTOxKQOd3NM7S2ExZikUVp44EBgpl871R4EF5d+RO+v+Y8CgYEAgYRkF4ZHVGwPQkDjTVew7P6NB8sEZRZsIi8FBvIq5X+lYkv/zI4Ebm3xO+H6fxLhhZv4vacLPSjU3ZO2Ebjf4SPVrpDxzcjjS3gc6kfK2HhTGwL0FBVeWLzN7GbIH71FMRsMVlfH+eu+qO+gPJZULxMWJZ1azlqOcVUSTqIoe0kCgYEApTtFLlAtSVmQlScDmfE4fHAbA0VksRsSo5RJiWpc0nFgmUXe9eM/aweXfkwAKnav1a449E4X2ADryfp4AJbydWhH0DWUDN67Ewc6fxnWj2KSpnNrlnxngvl8c91steKncFNtF/O8tjzx9rpFrpd9Pa95NeMFRc47TMwySAnMlzkCgYEAlxpWJtaq4TCPeOgBPoWSGXdy4BsafK25wJqV9a6gX68+KOPs4nXLAVN5zj12TWqIJiPJWIFjc8jNsrDNZsso5ztogyET72VjzfNbtFb8EnXdneOmsQ8W5PEJy+V2rlP1UvUUTmAucz7jrW7O7PEOD8GaaQZgskKcS+ONnyY2QL0='),('189e0e5e-7a0c-43b2-a122-77b0766dad55','c83539d5-5ce6-4826-9c7b-ad829d7e18a5','priority','100'),('1e2ff161-32c0-4449-b062-0c1bfd33b8ee','01921d69-c80e-4a2e-8ac1-631994389170','max-clients','200'),('21bfbe9a-e0a2-44f1-aa66-cdef94f5388b','ea7b69ab-630d-48a5-9087-ce894de42df1','allow-default-scopes','true'),('238ea4c3-a261-4f2b-9fdf-2eecc7d8f6b6','b6910619-7155-4758-9204-922e4c1a1e9d','priority','100'),('3151eea4-01a1-4aa4-861e-51ef93a3501a','23965871-bfed-4405-ac92-b9da2bab2dd0','certificate','MIICmzCCAYMCBgGMg5faajANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZjaW5lbWEwHhcNMjMxMjE5MTkzODM2WhcNMzMxMjE5MTk0MDE2WjARMQ8wDQYDVQQDDAZjaW5lbWEwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCcuz+dc4XzS0JJ5HQQIvkwVjpwDR2sDBXRWlpv/fv2F+Xan2osAmpGoVKUioQp0Mmq0uNe3YDvEdBxBzKfX+4GMpAoJzIK82ASAvgpI85LYb9yG5FOxq9+RlSfU7E5kVbDPtl/loExOKnNGXqKjPfNtcsJmJHQimA0iyqA0GTsMh2LRwNtIvnqfzHHTHpr7HGORYuD+JFl+HIWOYEbVG2Nq6dC0VbeopJN5k7IuEc5bTqCNyBvP+wiT++xh43pKv+jlSo6/4VMPXzu6xoGcrPS36CefsuvqWuFYN0cKRpwrARRcUpgWYAXT9Fo1kO2emm2uuKZmuee8zAL0wZmicqtAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAEtckNlKegDQ1Y4BUxUBR/KzJghSp14iYvr1t2C+M9Tc94k3UJIf5rmrjeHhG6b5zn1WW+gAOnUBnhjeT6jczXBHORv94z3mtHXvuKIl9iOPq7OFG3ScXnHLEuy1yPVS3WDIGVE4kaD+uxkwps8jMVNgoirBfIQdmRQfT5jjylmkI/GMnuJvvWnuYNPf4NjNkVVIurS7BBuvMXZ6hjPGFQ/nf29DkWe3edpN/vumpmLr9Cob/RikyVSlbgmSATIwPbMRPzbwIq7+DipsWDP1oNnxdyVIpAXuOsDOICCA3KBR13HcLe+HZ3T7cjuWgNhNYIL48VnIzvmP4wWtKaI1wAY='),('331df1e1-42bf-4864-8215-c9cf52993b4d','beedb21b-7123-4f0d-87f3-5c1eff1ecdc3','algorithm','HS256'),('376c343d-fd7b-4335-910c-f3a5d494e667','0b2dc85c-62f2-4ab1-883d-79c3b3f55021','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('38036ae3-80f0-42a2-ac3a-1c5e7da597f2','27945c3f-a0e0-4594-9375-42a1a7d83205','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('39709a33-a500-4397-ab82-2d7400093a05','efa94721-cfff-46e3-9eec-a73a9db5ce35','kid','6b3cf8b9-e5b3-4a67-8378-1b22597e079d'),('3b73a220-f8c3-4463-84fe-0c40033c5a3f','beedb21b-7123-4f0d-87f3-5c1eff1ecdc3','secret','6hxu49leBYVvWd_-5UNemKAMkzb--odH_8CLh9m801aw9bJPU-cn3XTAdN1XjY_fE2kFtT6PQxNXY901rer0rw'),('3cad5f08-b54f-4457-b76f-dd475ba74053','54719f27-46a6-4cef-864d-7008c37606cb','allowed-protocol-mapper-types','saml-role-list-mapper'),('3e2ee266-bb11-417d-bc1e-691ef7290b57','e80a96bc-1ef5-434f-a1de-1dd2ba6c2470','allow-default-scopes','true'),('410dd8a4-8e0d-4d08-baef-06bc97a41cd1','a4634793-9ff2-4e04-b0a1-f682349a345a','privateKey','MIIEogIBAAKCAQEAw7PmGpXbaBFCXxg4gMLxz2rfxR+VeqKepWxjb+o6EBxmO3Xc4QuHI5Sm82vaSYX4nYq8niJWVL2uQApV2cZNOmiOS1TvxHSP+9iTf1MzQeb3gF6iigBd1Tqhq61jjQ6YRJZxyzlhrxppIT3w3rOcygxOQI4taZ1x1ES2NvjtveCIBpdpdMvPdHWE+VwrOeZkMs67Nsd0YW5Y/6SBcN5LyeAyzwvtPY3gZem4BjuAtC7pknsp+1O0OAnKUF7A4/k8lYGbuU76j8J6HkV+ui6Hutef54IYe6SE7xY4tgG1xOS76MwO304Jd+8tu1PhOAWbFBcldCt8wQZT9Uput3xSVQIDAQABAoIBAB7X1bpXZ2Sroa78kX0jnDohISK/Y07YXdH69uH+w4dh/m+9F+Jk73e5WCWRmC3RvjjQEoGGrl39Jf8EUfr4QJglvdVcDczDxSR/QeHFglTO2q+B2rKOs7slGjFFKqUiyXc30bfic4WGD08UpMdofduvHE8ayUf1ryix6pjX2xo7SA5ijk1p6NRSNREKJMVP5QXVR+TsNnjEI8jhHzVgJXnP2pqVDxJCNZiDqXQqYFaNCNNr5+CWIdOx5ICdqUNWgaII6vq6rQCJx0LNWSG4Z8XihCb5n/LGq4iMq2VcsL4gBiN/3gTNsUDlYSFGqRYjeBDKSOEuprvB+thmVdaf6GECgYEA4hoGTeb9PNxOemGteophZHk2FpxfB8Ov+Dm7cUmw0eeL27SlwD9UeUiieMp4WEBUmgRtMqeQJyyYsJJ7Kui1XC7rWdUq0MsdXhuZR7u5cCpAhAtSzUNxhLBGaQh3qeXFXjuWRiveQ58VEnsJBg3fn66ShUwCwjgX3vhoflgj7TUCgYEA3ZTP5XFC859lIyLYk12n+ZQs7Ve26lbt+5/PytwjTJ1v4ocPPn1fGTV/228Yv1P2rjK/EtuH26SPKpIYgVd3LsB7R0J9CX+sWHDgmZZ2yj1/OJ+fGHMUZvS3tYECsR517Yd8pPZwKWtcMNwnLmX1uF746EUrXToj6O4BychsFKECgYA2jDbHJpojy7a3OceDj80NU1zkOZeHpQNYLH13SGL7URRhzgRLDDxSAl8IKzi7edGvUrARj3FssgqoVr6WTIwskDlBc/cfZlFQefIR501GrTrhYGX6lXHWpDxobJ2KBKAIKvIHPeAiikeoLLyxlDlGKfS5aewkdSn1JhL3oEYSnQKBgEFip1JycKpJT+PlZXle+rFYO0WyS4StMD6/MucOvM/f6WM0LZhoEIb01YzgJLJYyYMv8FhVNarnzWNnhxmrwLyoCfjGMvV5mlbiwDQyRU16hi8kUyM42j1jW06RCkVP0sbL40kee4yNZL/6RwmXBsJoLBUGTDyPaodSrG5p2RLhAoGAe0pJSPMWt0VoXSqrfxTe0QOBC8I+gzSp6AlJZvQDhyct1cJ7Lh7qdx9wsn/7yj4ELsVFM3gTP2cl1w6wqNN6NVhpoq3IkWu3PN/T5cKWl6pvB2E/jPjeZLXWqdnHBV/HPSrVtWTHsf2KekzX0oIQsNMiL6sHQAUMNXZM2ncyqDo='),('41f8b680-f3b7-4871-85d8-4cc9b2d5ea87','27945c3f-a0e0-4594-9375-42a1a7d83205','allowed-protocol-mapper-types','oidc-address-mapper'),('471942ba-28e2-497f-89a2-32f440671910','efa94721-cfff-46e3-9eec-a73a9db5ce35','algorithm','HS256'),('471d87c2-9540-4e6a-866e-670da7c36d18','0b2dc85c-62f2-4ab1-883d-79c3b3f55021','allowed-protocol-mapper-types','oidc-address-mapper'),('47a0babb-1fc1-4194-a49c-2a763ad73fcd','8938128d-fee3-4141-b582-490184790353','host-sending-registration-request-must-match','true'),('4b10fa06-62ee-45d6-8072-e6bb5c86364b','8938128d-fee3-4141-b582-490184790353','client-uris-must-match','true'),('4b8f1d72-cfbe-42e9-ae47-623e76b775ef','622da6c3-c789-4fa3-a4ff-44bc9e917ded','algorithm','RSA-OAEP'),('4d92de37-47b1-4c03-81c7-3aa6a1bbec0f','8f65f8d9-889b-4936-aa51-082798bc1efa','allow-default-scopes','true'),('4fe95cd7-9138-40ed-89af-b3ae105a8354','54719f27-46a6-4cef-864d-7008c37606cb','allowed-protocol-mapper-types','oidc-full-name-mapper'),('573ef63a-ad0b-47e8-aac4-2830fe8a8de1','54719f27-46a6-4cef-864d-7008c37606cb','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('5b5f9761-794d-4d83-8be7-c1d16280338e','622da6c3-c789-4fa3-a4ff-44bc9e917ded','keyUse','ENC'),('5c190b95-08ec-43d9-b60f-972d10137a90','e32adca5-995f-4771-b484-9bd87dce3eca','allowed-protocol-mapper-types','oidc-address-mapper'),('5de4b12d-58dd-42bd-8c32-56b8d82724a5','0b2dc85c-62f2-4ab1-883d-79c3b3f55021','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('5e8087b1-a27c-4525-be44-74ab40038566','0b2dc85c-62f2-4ab1-883d-79c3b3f55021','allowed-protocol-mapper-types','saml-role-list-mapper'),('5f5e54c4-8f6a-43b9-bcd2-94476f892f09','27945c3f-a0e0-4594-9375-42a1a7d83205','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('671f399e-4097-484e-b951-cd2c2b831f86','27945c3f-a0e0-4594-9375-42a1a7d83205','allowed-protocol-mapper-types','oidc-full-name-mapper'),('6d4f059c-403f-47fc-9afe-97aa6880e344','e32adca5-995f-4771-b484-9bd87dce3eca','allowed-protocol-mapper-types','oidc-full-name-mapper'),('6e9bf894-0e12-4e6f-bb64-a368bd0b8327','622da6c3-c789-4fa3-a4ff-44bc9e917ded','priority','100'),('72fee0ce-2d3a-401f-b1f4-9636c2e56696','70b92ab1-37c9-4fe0-bca1-4c0c8524bae3','host-sending-registration-request-must-match','true'),('73e767e2-68bd-4c9c-824b-c296c929f542','23965871-bfed-4405-ac92-b9da2bab2dd0','priority','100'),('74efbf7e-4642-4936-be33-a6836ad8d809','a4634793-9ff2-4e04-b0a1-f682349a345a','certificate','MIICmzCCAYMCBgGMg5eD0zANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjMxMjE5MTkzODE0WhcNMzMxMjE5MTkzOTU0WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDDs+YaldtoEUJfGDiAwvHPat/FH5V6op6lbGNv6joQHGY7ddzhC4cjlKbza9pJhfidiryeIlZUva5AClXZxk06aI5LVO/EdI/72JN/UzNB5veAXqKKAF3VOqGrrWONDphElnHLOWGvGmkhPfDes5zKDE5Aji1pnXHURLY2+O294IgGl2l0y890dYT5XCs55mQyzrs2x3Rhblj/pIFw3kvJ4DLPC+09jeBl6bgGO4C0LumSeyn7U7Q4CcpQXsDj+TyVgZu5TvqPwnoeRX66Loe615/nghh7pITvFji2AbXE5LvozA7fTgl37y27U+E4BZsUFyV0K3zBBlP1Sm63fFJVAgMBAAEwDQYJKoZIhvcNAQELBQADggEBALnJ2onGV0YDfo4xMFJYYqMFmk6UakPH9RmAz+n44lDL4iSIAR6HJC3Mz+cSYo5iG7LTJmwJTSTH9f/W5Q9y5Y8yvb5MM08rNvC+2VRi9ulbj9KV6VQH/AwnvDwffr30Z8SeFd+BVAf+j6Yto/pAm46yPf9GoCKpHnd07hM2Ga1LlvaJFms8933sQuOgAWcUghcXtk6IaXwsnlwRX8BBTrv6cPSJHFMRfzNoSzquLT3Mb0nhniL4lGziI3yK7xQVDRfn29VKJZaHm8FyeiTSmqV8+OGNYpA47TaTlZcRbKF204uQQ4QPFzgKbjd5A9sZ7aoTO8NDi1zfaY83AFlgay0='),('76fbd63c-4acc-4e17-9887-8ead92e874b1','beedb21b-7123-4f0d-87f3-5c1eff1ecdc3','kid','27abb4c3-90c6-4732-8357-6ddf081564cd'),('7857ddb0-2f76-47d3-a0e9-4476e37a52d3','b6910619-7155-4758-9204-922e4c1a1e9d','algorithm','RSA-OAEP'),('79323707-a9b2-4eaa-8f1e-15ee1642e0a8','0b2dc85c-62f2-4ab1-883d-79c3b3f55021','allowed-protocol-mapper-types','oidc-full-name-mapper'),('83d5600a-73b1-47ef-a285-78228a465f46','3c1b9a5f-6524-4f84-a539-c3ed4257407c','allow-default-scopes','true'),('8b7a6ab3-0732-4c07-ac6a-bb653f518997','622da6c3-c789-4fa3-a4ff-44bc9e917ded','privateKey','MIIEogIBAAKCAQEAn4kyr252bnkDl+Xnd/ezljcx742vGKJOma7XZS2mbOqn9FwBabcvPU3I9FPnTPK6Fc9RDXYwX98yMDSjRlHoS0U/8L1Ggvlm/Q4FaMu6almPBgQLSWapvRUi4XI3C03qH6r2puTdd0nVtLRltqtsx+RYS7N3uYwDzuc9IQqu1sXxqVUW0LjRYORubwgwrxrLqtgal7tsxBSI92b8QosGcMZo0OBu74VpKpNZc0qLP2w6GYfmQZtG7TdRd/sNj3q6+JsoTk7jDNgexSacGXV7OQfAuby5TC/nQ8yxciqK8TVJgLNvobzTRjXJ2obdaXYxlxXyJNV0HvGktzEBFZUYXQIDAQABAoIBACcXnGbmf3jEiH/hIx3/gW8OqVrU8hHsO6xm7nrpe712pp83KFV6QMYZ2GMeaDAvzi9n9KmCy4nCjG7JhzTE/1HqbyeTicKwUG8zz1mFinFi7qv/s7BRysf9dOWfciN//R2za+sra6U+X3J/PelMCkTVDFnIaU77IzfA6/a7wmn4BgvftDdk+lhNoUBiC1w4SdExv7YX6q3eA2raYMMj/XPnYrb8FOiQd1Kbh45tkvPm24P3gp65nNLlxC+/0A5Za72BIuu+4rMlpmJrJqWh0SW7eD9FFz2qRJ5V5X9De956JVzCb8D+LKhWhStdVBuffyVwYU23OOf7prUvxh5VBoECgYEA0WVLIM+by0tyCYTBUPDmV1/ygTusE9qkTcqyehMAlKGg946FVtZEfV+TGk3aSufzKOX9JCLhqGn67ZsxNUk/sH7EcKV0bE/xhCtpnLK2sPNPQgq/KI35xFbCDhrIlIrHRJychXG3UrgeuI7l646959XKUmMRKeoWBicdoAzkib0CgYEAwwsNlAMaWYwpV7tHBYT7RcS1655pyRPlD054zILmwC2JanZb/RFnkHsCop6/wpLnoPpcR8BhmVbtBHZFP7bdGRA21g+1jYRyhwYM4MgfbeZyNdovkJp6pbK0VcC9DGpiCKupKtKHA6GpwCP5lhj177xsyS/EykJNqvOjCVLcoyECgYAM33pP6RN92wSGu0ebL0Qp6PcipMV+bvmc4rI4OQTXHlyj+3oNDZ0mTALiIhkic8IKKKF4YECZNvK7Osg6q2cj9ZckCbfvlLaXVofmn0IF/N9JgxmfZ6MMQ/0oGtNr9mArwqkItyX7CuCwnfBam+rm3sjSac67Ue3KsQrsNP6zzQKBgHFpj++tDjlbwv58q4OOG/4psA7eAm0l4F/SJXPl+f9teyYoxLyWzj25CYM+BAtEGOQGMHqYZyge35tkmke+MTpNr1UxtUQg6+ePoRVjyMLC6U5fHKFc8kw/aZUjicoaYf7gsnFwEYoPCwHq6UpaIUfRrQAfgrKJc1gga4EUaa+BAoGAEaozsGPhy/b7Dn9FXRV90yxg7f+G0CZ8RXeCZzHx0wVfkyub9Ln2l58n0CkhKtbqqYtQ5zVxftN9WrtaakCsS56E8ip+MMb/ba/moB4VjjjZwohWJEi9PkIykWTeaDHu0hCMuQjkwpCFzc+Fqjug9+ZfObPYtBBT6hsop9wpYsU='),('8d5865f5-da5f-401e-997a-f8b9b0d6116d','0b2dc85c-62f2-4ab1-883d-79c3b3f55021','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('94aa0930-db3a-4d25-9b84-b9af60013aac','e32adca5-995f-4771-b484-9bd87dce3eca','allowed-protocol-mapper-types','saml-user-property-mapper'),('98359144-89a4-4266-bd91-c7eb1ccc4580','05e5ecce-382f-4cee-be20-7241c8c545e5','secret','oSG9DUWFN-Gl5pUsckF4tQ'),('9d722aab-61a0-47eb-9308-f6e3b6e401f4','e32adca5-995f-4771-b484-9bd87dce3eca','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('9d92814e-8c5c-469d-b965-1bc9375ec8c9','0b2dc85c-62f2-4ab1-883d-79c3b3f55021','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('9dcc8586-3fd6-4a60-a5ed-f46e02b48db6','e32adca5-995f-4771-b484-9bd87dce3eca','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('9de96489-6f37-4898-ba96-710d36cfde5d','e32adca5-995f-4771-b484-9bd87dce3eca','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('9e14231c-88eb-4d7c-858d-bbee00c34ab2','54719f27-46a6-4cef-864d-7008c37606cb','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('9e850d44-63da-4356-b8f9-10cb9bac60b5','efa94721-cfff-46e3-9eec-a73a9db5ce35','secret','bBDF-NoJ5Mx15O_XF3zdwP5Jg5pb4vamwx5YRKq09pXadeozpqPON8-Q_eZCiah80iStM2qVg498WUCFNjD78A'),('a20fdb03-c15b-4b11-9b53-8d69b328aafe','54719f27-46a6-4cef-864d-7008c37606cb','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('a3cd0686-aff5-429d-8dd7-bc74340c1ce9','a4634793-9ff2-4e04-b0a1-f682349a345a','priority','100'),('a8319ea3-a0ed-48a1-a1d6-1970a0b81b77','05e5ecce-382f-4cee-be20-7241c8c545e5','priority','100'),('b0ccd629-0087-4b1e-9f6c-6a299806012a','05e5ecce-382f-4cee-be20-7241c8c545e5','kid','4e78b900-d79b-428f-b065-fd5de3a7cfa9'),('b11401c9-e035-4f4a-a040-9011f38e7898','54719f27-46a6-4cef-864d-7008c37606cb','allowed-protocol-mapper-types','saml-user-property-mapper'),('b1d0023d-340a-4cb1-aa2d-6be5f988b268','54719f27-46a6-4cef-864d-7008c37606cb','allowed-protocol-mapper-types','oidc-address-mapper'),('bc5b0d7f-e7ea-46d9-b42f-a5709d658be9','beedb21b-7123-4f0d-87f3-5c1eff1ecdc3','priority','100'),('d2aa74a8-f965-49d9-a8e5-ce9a0aba5b3f','27945c3f-a0e0-4594-9375-42a1a7d83205','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('d2fdc964-b8ee-4c6a-adb0-1d1b35579ace','54719f27-46a6-4cef-864d-7008c37606cb','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('d4874e9c-2ced-443c-999d-7aa398451255','622da6c3-c789-4fa3-a4ff-44bc9e917ded','certificate','MIICmzCCAYMCBgGMg5fayjANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZjaW5lbWEwHhcNMjMxMjE5MTkzODM2WhcNMzMxMjE5MTk0MDE2WjARMQ8wDQYDVQQDDAZjaW5lbWEwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCfiTKvbnZueQOX5ed397OWNzHvja8Yok6ZrtdlLaZs6qf0XAFpty89Tcj0U+dM8roVz1ENdjBf3zIwNKNGUehLRT/wvUaC+Wb9DgVoy7pqWY8GBAtJZqm9FSLhcjcLTeofqvam5N13SdW0tGW2q2zH5FhLs3e5jAPO5z0hCq7WxfGpVRbQuNFg5G5vCDCvGsuq2BqXu2zEFIj3ZvxCiwZwxmjQ4G7vhWkqk1lzSos/bDoZh+ZBm0btN1F3+w2Perr4myhOTuMM2B7FJpwZdXs5B8C5vLlML+dDzLFyKorxNUmAs2+hvNNGNcnaht1pdjGXFfIk1XQe8aS3MQEVlRhdAgMBAAEwDQYJKoZIhvcNAQELBQADggEBACUmjI2KvfaCV1ReNIpl8nwfUKtmDl0MoQ/xgLnvp+1AzObxanlEZhN7O1DaX4EKb9RMNY6j9PUWkY1FkwTKKse4TlRfsJwoX3Md+EFntJIxGTAMwcdFJssZGRDk1jGcp124auWO9uxZPBn/mgODGifDEI+3x5aaPzwreWp9q8QRuBVemZMF4OaBXWJCR5YvGuYF7IkBGjKscAMpPIzi+4eupWkEcXFTA0Sztf6m0NQFe3UhN/hPZzX3L0inBFAl0T9EPhbxI0x0sVtYZeyUURVURU4XXBXgmCQnsJ7iOmW+wwy+G9hnT9oiHAZ8V4yycs6hsFPgmgQvvQxkpRYlSns='),('d53ab4f4-b4e3-4867-8803-01539d195608','b6910619-7155-4758-9204-922e4c1a1e9d','keyUse','ENC'),('d5db14f9-6f5a-4309-b7b5-4cdb9b89abdb','27945c3f-a0e0-4594-9375-42a1a7d83205','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('e1dabf3e-edd4-4e62-8264-45b10f8f0170','27945c3f-a0e0-4594-9375-42a1a7d83205','allowed-protocol-mapper-types','saml-role-list-mapper'),('e65a4057-263b-4f37-b456-b72469b5c395','e32adca5-995f-4771-b484-9bd87dce3eca','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('e666be60-229c-4874-8d3d-b626d625d1d6','efa94721-cfff-46e3-9eec-a73a9db5ce35','priority','100'),('eab0c8ed-e4c6-4e95-989f-f75886b6ac47','d8ed97b9-d63b-433f-9cde-842de2ee89e7','max-clients','200'),('f55eebfe-3ba6-4fc8-ae4b-7034b0b24e86','a4634793-9ff2-4e04-b0a1-f682349a345a','keyUse','SIG'),('f56332ac-99a5-4595-842f-dbfff4fcc523','b6910619-7155-4758-9204-922e4c1a1e9d','certificate','MIICmzCCAYMCBgGMg5eEnzANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjMxMjE5MTkzODE0WhcNMzMxMjE5MTkzOTU0WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDEaaX6LJbxDp/FIPeiGj3tTeaTUQ/AEVPRJeSIjpe0yKErhI6eojkXLduSU/ngEZEyC3r0zXqts9kQq2mw9tfYmJAJgggmkjByDB5uht7eNM8IAif1jT3wZf5G5Uy+6eQEckdVFCRKw6ZU83ULgC6PTsxofQA4tdUMHr7NgKv/nYQ77pJfjcH4aghyF4QpgbkdmxUp9uJYWK4PuZAbfU2fwIWSE3CG86mDX23ZGd9YATPVzOChKPzHHm7PDM9re6Y84ukhRamgdVqxhDAf/WSGz7a3lKFrMslx/NixmMwQ6SpZUuoADKiOOHKLU2KMi1t/CruQjt9Dets7DW3RQdg3AgMBAAEwDQYJKoZIhvcNAQELBQADggEBALIzBHMtskTwWOxjCrB+gjYOgQHBAFkyDvhZElgJW1dXNJXUH94eZGbz90e4NwjxPrHD1SMfN4rjmFpgsVhaVEXwJip0LN4XH1Gj5dhGE8Knb6xF3eN33kwq5ZbSMSpPDdt6JobmRsh9KKPE02oxQl58VoNFQZr99FUiWY+qB3d7FuvsSuq333qKEjbvCP4nf8BCMg1kk9SPXur6cSOZBuK0FjKXEiiWo55XSsk1AOjgOVf4qWQfkP6EaiaKY+q21g2IQpjt5rkt6MPF9w/KctJl2c6jtdBGcT5K457lgYsiFjZkO9nXxpkOjw6cU9qkVixD9MAEw93GUYitDrrMrAw='),('f5815f74-b565-4df7-8822-816d4e49d88c','c83539d5-5ce6-4826-9c7b-ad829d7e18a5','secret','sPHVaekKGCmiubMtnOqn1w'),('f91b44ca-565e-4381-8ef0-29bb20f9f90a','c83539d5-5ce6-4826-9c7b-ad829d7e18a5','kid','2ad93fd8-9ca2-4882-96b2-0441fed81a6d'),('fcbf446d-df06-4da5-8853-fc42ba471846','b6910619-7155-4758-9204-922e4c1a1e9d','privateKey','MIIEowIBAAKCAQEAxGml+iyW8Q6fxSD3oho97U3mk1EPwBFT0SXkiI6XtMihK4SOnqI5Fy3bklP54BGRMgt69M16rbPZEKtpsPbX2JiQCYIIJpIwcgwebobe3jTPCAIn9Y098GX+RuVMvunkBHJHVRQkSsOmVPN1C4Auj07MaH0AOLXVDB6+zYCr/52EO+6SX43B+GoIcheEKYG5HZsVKfbiWFiuD7mQG31Nn8CFkhNwhvOpg19t2RnfWAEz1czgoSj8xx5uzwzPa3umPOLpIUWpoHVasYQwH/1khs+2t5ShazLJcfzYsZjMEOkqWVLqAAyojjhyi1NijItbfwq7kI7fQ3rbOw1t0UHYNwIDAQABAoIBAA/qu9+lQ2ovlDUGcer6E3CqsnfXxt36yX8Wggmq/JJS+/Sp3mDupo/BUJzwHzzQT6LtmT5DdKClBX87VOpZZq6P1oRevEhb6n8jikfMuDzrrKdqfVCB7LYRneSi6nBCRg8yL6OuaS6B4nXZ8O9IqP1GFnyVPLJb0fMUfsPqnIWvWraGOV6Vlt61kkXMwMfs7f5SWACv0K0fd6hyE0TGWwTV4npb8axVr4qYj/uuO9WQLkR1qd6r4p9yc3Ph9+fAiNwb6/T0D6iCN0/WufxQfnBflrXM80oq1P/7XWUgZUYzdDmfXym2JKfdhtMXPFz3wHjioK/QQzUWN6mK8zAZN9kCgYEA8ncCBtNjMMH2EVisBZvXY+08LVzPUpaO8Fv0Shp9MiaYdbp+KdMoBNr+41iNGnLOmt8CKxh58SA7OtjGKubMPAOSSL+rWuyJcQ+pFRIXUzgZE6wgV7ptIuuPuS+HGyzJNxt6ijQbQ7INIIH/x1h6vI4ubZO1PbkoqNJ/d7KFHQsCgYEAz2CFyK08Fz9lsseGEuLNw9koRvNKfYon/HcY6tyHnNZ624gHnAGTciDsx82dOrXc2sbh7TDfL1p76UgBiAtjXwKRdG1c9xe0lecrFLzlgEZG2lBBMIYC29hmZ6R+zPbKwchlkVgZYkG4wnYp13IksyepR446tWH0pjNoFnYPNQUCgYByq8welEz+G02YKJq60FiO3v0t6w32XlRd4u9nOJ3rYQuL6laOy1nK6hPQS+n4D0IdRslMvne1jWvVyf32/k6rN3kwxM1y5BmgiiqKV5MGfaqGfkqRkw7YjBXeHFdGh+jmEi3jPP+EBaplrHXevr7VfF0C3+/AsFhFd8BnSNvhvwKBgG/amy6Lqg7MBjmw/vMu3FeXyO7ECVi/bSPyxUDg5FDHKwtASwJtoy767Vwz3mutbkue3HuIUcmD37QLP7A2nEnB49zNpEguxBvazVTpMkzHGy5j/VWD4wTbqxiaFD7Pmrt9MLN9tmtWEabp/1WS3pK3gMn0wFvXUxNWRP1gfoFVAoGBAJRBBT1c0YlKfEG9kMW/rXPeZ2xm8ldjm9cMOpWxs8abnuPP77tb6MG0xS7db7cAQ95lW8ZDuHWXscelKXW5ehz7zaqf7HfRY2t6fQZNQtqvAniE4ukuW8azHWAK9kLDt8dAg9AWRqsJzILOJ37o1/F2iEL8hny4gogR7trMY5Na'),('fe434c12-651c-4d88-b243-3bb6c939fab7','23965871-bfed-4405-ac92-b9da2bab2dd0','keyUse','SIG'),('fe88ca24-ef37-4150-ad4a-a62946f993cc','e32adca5-995f-4771-b484-9bd87dce3eca','allowed-protocol-mapper-types','saml-role-list-mapper');
/*!40000 ALTER TABLE `COMPONENT_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPOSITE_ROLE`
--

DROP TABLE IF EXISTS `COMPOSITE_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPOSITE_ROLE` (
  `COMPOSITE` varchar(36) NOT NULL,
  `CHILD_ROLE` varchar(36) NOT NULL,
  PRIMARY KEY (`COMPOSITE`,`CHILD_ROLE`),
  KEY `IDX_COMPOSITE` (`COMPOSITE`),
  KEY `IDX_COMPOSITE_CHILD` (`CHILD_ROLE`),
  CONSTRAINT `FK_A63WVEKFTU8JO1PNJ81E7MCE2` FOREIGN KEY (`COMPOSITE`) REFERENCES `KEYCLOAK_ROLE` (`ID`),
  CONSTRAINT `FK_GR7THLLB9LU8Q4VQA4524JJY8` FOREIGN KEY (`CHILD_ROLE`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPOSITE_ROLE`
--

LOCK TABLES `COMPOSITE_ROLE` WRITE;
/*!40000 ALTER TABLE `COMPOSITE_ROLE` DISABLE KEYS */;
INSERT INTO `COMPOSITE_ROLE` VALUES ('06413a4e-ecf1-494f-bd93-df6ff3386f67','35e01bf5-eba4-4672-bb98-cd11be287366'),('18d47af0-ac11-4e5b-964d-75f1fc047411','e0818034-29eb-4e96-aaf3-fad08c79897c'),('29a38910-88af-4029-a576-a532e63985f5','023ae14c-026f-49ce-8af6-dcec3c58021f'),('3d29462c-2263-4195-acb9-3f74d8504881','1bf2faf2-b855-4d85-854a-67ef05c5fb7e'),('3d29462c-2263-4195-acb9-3f74d8504881','44eff37d-0ff0-4245-827b-22f1d4a795f0'),('56dc331d-5454-424d-876b-415b3673cde6','8c602de5-1f98-449a-b14d-1195dab3859f'),('56dc331d-5454-424d-876b-415b3673cde6','a66b6d41-0cd2-4183-9e3f-5b07df8042bc'),('78c6f0ba-871f-4327-99f3-33474a9d5906','04306184-0eb8-4e0c-b821-b92077427cb1'),('78c6f0ba-871f-4327-99f3-33474a9d5906','080467cc-8fb1-45a9-942b-7e79cd6dc1dc'),('78c6f0ba-871f-4327-99f3-33474a9d5906','1d265b0c-e6cd-4c43-8d03-8e2775db602d'),('78c6f0ba-871f-4327-99f3-33474a9d5906','1d68b3ed-5f97-4c69-b21b-9deaf10c3b96'),('78c6f0ba-871f-4327-99f3-33474a9d5906','2056d0e0-1b9f-429d-9276-13a6451a4cbd'),('78c6f0ba-871f-4327-99f3-33474a9d5906','251872a5-3bc6-4834-b1b5-b6732f47a0ba'),('78c6f0ba-871f-4327-99f3-33474a9d5906','253f86ea-ce65-44a9-8460-cdeb2b935845'),('78c6f0ba-871f-4327-99f3-33474a9d5906','266baf94-e338-4aed-a3f1-2baeeaaf6b07'),('78c6f0ba-871f-4327-99f3-33474a9d5906','27d3cda3-5b78-4fb9-9ea1-cdb036a486d7'),('78c6f0ba-871f-4327-99f3-33474a9d5906','45e49d3e-7976-453a-b725-9fe2b507ddce'),('78c6f0ba-871f-4327-99f3-33474a9d5906','49d388de-aedd-402d-a9ed-6d1b2919d813'),('78c6f0ba-871f-4327-99f3-33474a9d5906','52de5ce6-59dd-4321-a00a-d65670803065'),('78c6f0ba-871f-4327-99f3-33474a9d5906','56dc331d-5454-424d-876b-415b3673cde6'),('78c6f0ba-871f-4327-99f3-33474a9d5906','572a64d7-99fd-438a-ade6-48bba75dfa36'),('78c6f0ba-871f-4327-99f3-33474a9d5906','77dd0e86-4548-42ea-ae8c-b47bdfefe572'),('78c6f0ba-871f-4327-99f3-33474a9d5906','787a2f58-5ced-4e17-af27-c3836deb8099'),('78c6f0ba-871f-4327-99f3-33474a9d5906','7f9d9b5d-41b2-44d4-b0f0-840d16966308'),('78c6f0ba-871f-4327-99f3-33474a9d5906','8c602de5-1f98-449a-b14d-1195dab3859f'),('78c6f0ba-871f-4327-99f3-33474a9d5906','8e9baa8b-8f4a-4495-8d7e-bf1c36f7f5a6'),('78c6f0ba-871f-4327-99f3-33474a9d5906','96fd5d78-b4ba-4b0a-9163-a5e9fd81275a'),('78c6f0ba-871f-4327-99f3-33474a9d5906','990c4773-d8da-450e-b4ec-e8f9ab40db25'),('78c6f0ba-871f-4327-99f3-33474a9d5906','a1f092f3-f780-4a91-81ef-7dc8fa635f96'),('78c6f0ba-871f-4327-99f3-33474a9d5906','a66b6d41-0cd2-4183-9e3f-5b07df8042bc'),('78c6f0ba-871f-4327-99f3-33474a9d5906','a813537b-b969-4e6b-aab9-7aff677e0b91'),('78c6f0ba-871f-4327-99f3-33474a9d5906','b0a4ea27-9476-4c20-9729-c074dd38b84a'),('78c6f0ba-871f-4327-99f3-33474a9d5906','b2f93568-452c-4db7-a8df-e090f9929d96'),('78c6f0ba-871f-4327-99f3-33474a9d5906','b55687e5-441e-4ccb-81d0-3a82e14a83b8'),('78c6f0ba-871f-4327-99f3-33474a9d5906','b9130f76-739d-4cda-b51c-44d731efbb65'),('78c6f0ba-871f-4327-99f3-33474a9d5906','c065d367-1f04-4879-8ca7-653a136e377a'),('78c6f0ba-871f-4327-99f3-33474a9d5906','c31cf313-7813-4bd5-8a09-8f1a41a4ac04'),('78c6f0ba-871f-4327-99f3-33474a9d5906','c5672fed-1d66-4d00-9013-65e84ee35767'),('78c6f0ba-871f-4327-99f3-33474a9d5906','cec51ad7-dbe5-46e6-8f0f-a45655d6d791'),('78c6f0ba-871f-4327-99f3-33474a9d5906','d12eb93f-3812-417e-9f85-91f060d54b8d'),('78c6f0ba-871f-4327-99f3-33474a9d5906','dd8ebd9b-e288-40e9-9765-fda43e5ccbf4'),('78c6f0ba-871f-4327-99f3-33474a9d5906','ee22a5dc-46cc-4f58-aa14-468d55c151e6'),('78c6f0ba-871f-4327-99f3-33474a9d5906','fb76bc1e-25e6-431d-9ccd-203537ea2eee'),('78c6f0ba-871f-4327-99f3-33474a9d5906','fec9d6c2-2b35-4f85-a7e1-a42707c079b2'),('88f424a2-f016-44e9-b1c9-fa2a5bc25c68','053b27c0-f42e-440a-be7c-b7dcb9188589'),('9cc9531e-c593-4f1f-9459-8a02bf6aa557','023ae14c-026f-49ce-8af6-dcec3c58021f'),('9cc9531e-c593-4f1f-9459-8a02bf6aa557','095c11c1-758b-46e9-93a6-494111b09c38'),('9cc9531e-c593-4f1f-9459-8a02bf6aa557','1bf2faf2-b855-4d85-854a-67ef05c5fb7e'),('9cc9531e-c593-4f1f-9459-8a02bf6aa557','2886c558-a4a9-4f95-bcf6-c7a63d979fe9'),('9cc9531e-c593-4f1f-9459-8a02bf6aa557','29a38910-88af-4029-a576-a532e63985f5'),('9cc9531e-c593-4f1f-9459-8a02bf6aa557','2dcfdf7d-eab2-492c-8898-dc297a78fbcd'),('9cc9531e-c593-4f1f-9459-8a02bf6aa557','3d29462c-2263-4195-acb9-3f74d8504881'),('9cc9531e-c593-4f1f-9459-8a02bf6aa557','44eff37d-0ff0-4245-827b-22f1d4a795f0'),('9cc9531e-c593-4f1f-9459-8a02bf6aa557','7c48afea-d98b-4cb1-bf35-1f95a49d452c'),('9cc9531e-c593-4f1f-9459-8a02bf6aa557','92a53ff5-057e-40ad-9837-11a4d92a1488'),('9cc9531e-c593-4f1f-9459-8a02bf6aa557','9a6ff5e4-f69d-488e-ba9b-3c513f8375de'),('9cc9531e-c593-4f1f-9459-8a02bf6aa557','a3a3fb91-c82b-430f-a0fa-38e2498ccb09'),('9cc9531e-c593-4f1f-9459-8a02bf6aa557','a3f6c8b5-550e-4cb8-9086-ffbc0e1f864d'),('9cc9531e-c593-4f1f-9459-8a02bf6aa557','b69ba1b0-cb52-401a-a4c9-2681bb55629d'),('9cc9531e-c593-4f1f-9459-8a02bf6aa557','c798049b-dfdc-41a5-b80c-e6212045c296'),('9cc9531e-c593-4f1f-9459-8a02bf6aa557','d3c4df4e-3372-49ee-b5da-07af7528dae8'),('9cc9531e-c593-4f1f-9459-8a02bf6aa557','e50fbbc9-e1cf-4d7e-bf83-5b5c1257e9bf'),('9cc9531e-c593-4f1f-9459-8a02bf6aa557','e5e0073a-dc14-46f6-8c16-17f17f01712e'),('b2f93568-452c-4db7-a8df-e090f9929d96','a1f092f3-f780-4a91-81ef-7dc8fa635f96'),('b2f93568-452c-4db7-a8df-e090f9929d96','c065d367-1f04-4879-8ca7-653a136e377a'),('b9130f76-739d-4cda-b51c-44d731efbb65','266baf94-e338-4aed-a3f1-2baeeaaf6b07'),('cc56e898-b4b6-4fcd-a6d8-f61adefb7d01','041d9bd6-a56e-4093-a5a2-e6d0a13cf383'),('cc56e898-b4b6-4fcd-a6d8-f61adefb7d01','0ed9a06b-70e6-4bca-a19f-1cb442715264'),('cc56e898-b4b6-4fcd-a6d8-f61adefb7d01','88f424a2-f016-44e9-b1c9-fa2a5bc25c68'),('cc56e898-b4b6-4fcd-a6d8-f61adefb7d01','e36bcd30-f31d-4bd4-bcca-a92108dbd4ba'),('da901236-8ca4-4dca-b1ec-90ce28ebecb2','3624833a-60af-4cd5-b310-4def30c9ba7d'),('da901236-8ca4-4dca-b1ec-90ce28ebecb2','c5ee7ce3-498c-4305-a821-151b1c4317bc'),('da901236-8ca4-4dca-b1ec-90ce28ebecb2','dd1c2672-b530-4b1c-bc88-6eada6266269'),('da901236-8ca4-4dca-b1ec-90ce28ebecb2','ec079f44-da93-4f73-8db4-a52ae08b7ad1'),('ec079f44-da93-4f73-8db4-a52ae08b7ad1','fb5a8935-a89b-4268-98fc-e2a69b523c45'),('fec9d6c2-2b35-4f85-a7e1-a42707c079b2','fb76bc1e-25e6-431d-9ccd-203537ea2eee');
/*!40000 ALTER TABLE `COMPOSITE_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CREDENTIAL`
--

DROP TABLE IF EXISTS `CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CREDENTIAL` (
  `ID` varchar(36) NOT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `USER_LABEL` varchar(255) DEFAULT NULL,
  `SECRET_DATA` longtext,
  `CREDENTIAL_DATA` longtext,
  `PRIORITY` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_CREDENTIAL` (`USER_ID`),
  CONSTRAINT `FK_PFYR0GLASQYL0DEI3KL69R6V0` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CREDENTIAL`
--

LOCK TABLES `CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `CREDENTIAL` DISABLE KEYS */;
INSERT INTO `CREDENTIAL` VALUES ('785fa2c3-3a37-4c78-81ba-a94cc0d60cba',NULL,'password','c2d25e5d-fffc-4b00-aadf-8eceb1f51b2b',1703014794973,NULL,'{\"value\":\"6BLmYpKjo16CwYFpQ+8J4tKtbaK5Ktaoc0uClbVEN16/vQKf+YtfqlyAcTyhPaHsaPJNB0O077912tYGUgjdcA==\",\"salt\":\"cIqraREDtaFx+5CDdV9CTQ==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10);
/*!40000 ALTER TABLE `CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOG`
--

DROP TABLE IF EXISTS `DATABASECHANGELOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DATABASECHANGELOG` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOG`
--

LOCK TABLES `DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOG` VALUES ('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/jpa-changelog-1.0.0.Final.xml','2023-12-19 19:39:09',1,'EXECUTED','8:bda77d94bf90182a1e30c24f1c155ec7','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'4.8.0',NULL,NULL,'3014743986'),('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/db2-jpa-changelog-1.0.0.Final.xml','2023-12-19 19:39:09',2,'MARK_RAN','8:1ecb330f30986693d1cba9ab579fa219','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'4.8.0',NULL,NULL,'3014743986'),('1.1.0.Beta1','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Beta1.xml','2023-12-19 19:39:10',3,'EXECUTED','8:cb7ace19bc6d959f305605d255d4c843','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...','',NULL,'4.8.0',NULL,NULL,'3014743986'),('1.1.0.Final','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Final.xml','2023-12-19 19:39:10',4,'EXECUTED','8:80230013e961310e6872e871be424a63','renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY','',NULL,'4.8.0',NULL,NULL,'3014743986'),('1.2.0.Beta1','psilva@redhat.com','META-INF/jpa-changelog-1.2.0.Beta1.xml','2023-12-19 19:39:13',5,'EXECUTED','8:67f4c20929126adc0c8e9bf48279d244','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'4.8.0',NULL,NULL,'3014743986'),('1.2.0.Beta1','psilva@redhat.com','META-INF/db2-jpa-changelog-1.2.0.Beta1.xml','2023-12-19 19:39:13',6,'MARK_RAN','8:7311018b0b8179ce14628ab412bb6783','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'4.8.0',NULL,NULL,'3014743986'),('1.2.0.RC1','bburke@redhat.com','META-INF/jpa-changelog-1.2.0.CR1.xml','2023-12-19 19:39:16',7,'EXECUTED','8:037ba1216c3640f8785ee6b8e7c8e3c1','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'4.8.0',NULL,NULL,'3014743986'),('1.2.0.RC1','bburke@redhat.com','META-INF/db2-jpa-changelog-1.2.0.CR1.xml','2023-12-19 19:39:16',8,'MARK_RAN','8:7fe6ffe4af4df289b3157de32c624263','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'4.8.0',NULL,NULL,'3014743986'),('1.2.0.Final','keycloak','META-INF/jpa-changelog-1.2.0.Final.xml','2023-12-19 19:39:16',9,'EXECUTED','8:9c136bc3187083a98745c7d03bc8a303','update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT','',NULL,'4.8.0',NULL,NULL,'3014743986'),('1.3.0','bburke@redhat.com','META-INF/jpa-changelog-1.3.0.xml','2023-12-19 19:39:18',10,'EXECUTED','8:b5f09474dca81fb56a97cf5b6553d331','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...','',NULL,'4.8.0',NULL,NULL,'3014743986'),('1.4.0','bburke@redhat.com','META-INF/jpa-changelog-1.4.0.xml','2023-12-19 19:39:20',11,'EXECUTED','8:ca924f31bd2a3b219fdcfe78c82dacf4','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'4.8.0',NULL,NULL,'3014743986'),('1.4.0','bburke@redhat.com','META-INF/db2-jpa-changelog-1.4.0.xml','2023-12-19 19:39:20',12,'MARK_RAN','8:8acad7483e106416bcfa6f3b824a16cd','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'4.8.0',NULL,NULL,'3014743986'),('1.5.0','bburke@redhat.com','META-INF/jpa-changelog-1.5.0.xml','2023-12-19 19:39:20',13,'EXECUTED','8:9b1266d17f4f87c78226f5055408fd5e','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'4.8.0',NULL,NULL,'3014743986'),('1.6.1_from15','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2023-12-19 19:39:20',14,'EXECUTED','8:d80ec4ab6dbfe573550ff72396c7e910','addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...','',NULL,'4.8.0',NULL,NULL,'3014743986'),('1.6.1_from16-pre','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2023-12-19 19:39:20',15,'MARK_RAN','8:d86eb172171e7c20b9c849b584d147b2','delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION','',NULL,'4.8.0',NULL,NULL,'3014743986'),('1.6.1_from16','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2023-12-19 19:39:20',16,'MARK_RAN','8:5735f46f0fa60689deb0ecdc2a0dea22','dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...','',NULL,'4.8.0',NULL,NULL,'3014743986'),('1.6.1','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2023-12-19 19:39:20',17,'EXECUTED','8:d41d8cd98f00b204e9800998ecf8427e','empty','',NULL,'4.8.0',NULL,NULL,'3014743986'),('1.7.0','bburke@redhat.com','META-INF/jpa-changelog-1.7.0.xml','2023-12-19 19:39:22',18,'EXECUTED','8:5c1a8fd2014ac7fc43b90a700f117b23','createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...','',NULL,'4.8.0',NULL,NULL,'3014743986'),('1.8.0','mposolda@redhat.com','META-INF/jpa-changelog-1.8.0.xml','2023-12-19 19:39:24',19,'EXECUTED','8:1f6c2c2dfc362aff4ed75b3f0ef6b331','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'4.8.0',NULL,NULL,'3014743986'),('1.8.0-2','keycloak','META-INF/jpa-changelog-1.8.0.xml','2023-12-19 19:39:24',20,'EXECUTED','8:dee9246280915712591f83a127665107','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'4.8.0',NULL,NULL,'3014743986'),('1.8.0','mposolda@redhat.com','META-INF/db2-jpa-changelog-1.8.0.xml','2023-12-19 19:39:24',21,'MARK_RAN','8:9eb2ee1fa8ad1c5e426421a6f8fdfa6a','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'4.8.0',NULL,NULL,'3014743986'),('1.8.0-2','keycloak','META-INF/db2-jpa-changelog-1.8.0.xml','2023-12-19 19:39:24',22,'MARK_RAN','8:dee9246280915712591f83a127665107','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'4.8.0',NULL,NULL,'3014743986'),('1.9.0','mposolda@redhat.com','META-INF/jpa-changelog-1.9.0.xml','2023-12-19 19:39:24',23,'EXECUTED','8:d9fa18ffa355320395b86270680dd4fe','update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...','',NULL,'4.8.0',NULL,NULL,'3014743986'),('1.9.1','keycloak','META-INF/jpa-changelog-1.9.1.xml','2023-12-19 19:39:24',24,'EXECUTED','8:90cff506fedb06141ffc1c71c4a1214c','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'4.8.0',NULL,NULL,'3014743986'),('1.9.1','keycloak','META-INF/db2-jpa-changelog-1.9.1.xml','2023-12-19 19:39:24',25,'MARK_RAN','8:11a788aed4961d6d29c427c063af828c','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'4.8.0',NULL,NULL,'3014743986'),('1.9.2','keycloak','META-INF/jpa-changelog-1.9.2.xml','2023-12-19 19:39:25',26,'EXECUTED','8:a4218e51e1faf380518cce2af5d39b43','createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...','',NULL,'4.8.0',NULL,NULL,'3014743986'),('authz-2.0.0','psilva@redhat.com','META-INF/jpa-changelog-authz-2.0.0.xml','2023-12-19 19:39:26',27,'EXECUTED','8:d9e9a1bfaa644da9952456050f07bbdc','createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...','',NULL,'4.8.0',NULL,NULL,'3014743986'),('authz-2.5.1','psilva@redhat.com','META-INF/jpa-changelog-authz-2.5.1.xml','2023-12-19 19:39:26',28,'EXECUTED','8:d1bf991a6163c0acbfe664b615314505','update tableName=RESOURCE_SERVER_POLICY','',NULL,'4.8.0',NULL,NULL,'3014743986'),('2.1.0-KEYCLOAK-5461','bburke@redhat.com','META-INF/jpa-changelog-2.1.0.xml','2023-12-19 19:39:28',29,'EXECUTED','8:88a743a1e87ec5e30bf603da68058a8c','createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...','',NULL,'4.8.0',NULL,NULL,'3014743986'),('2.2.0','bburke@redhat.com','META-INF/jpa-changelog-2.2.0.xml','2023-12-19 19:39:28',30,'EXECUTED','8:c5517863c875d325dea463d00ec26d7a','addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...','',NULL,'4.8.0',NULL,NULL,'3014743986'),('2.3.0','bburke@redhat.com','META-INF/jpa-changelog-2.3.0.xml','2023-12-19 19:39:29',31,'EXECUTED','8:ada8b4833b74a498f376d7136bc7d327','createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...','',NULL,'4.8.0',NULL,NULL,'3014743986'),('2.4.0','bburke@redhat.com','META-INF/jpa-changelog-2.4.0.xml','2023-12-19 19:39:29',32,'EXECUTED','8:b9b73c8ea7299457f99fcbb825c263ba','customChange','',NULL,'4.8.0',NULL,NULL,'3014743986'),('2.5.0','bburke@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2023-12-19 19:39:29',33,'EXECUTED','8:07724333e625ccfcfc5adc63d57314f3','customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION','',NULL,'4.8.0',NULL,NULL,'3014743986'),('2.5.0-unicode-oracle','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2023-12-19 19:39:29',34,'MARK_RAN','8:8b6fd445958882efe55deb26fc541a7b','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'4.8.0',NULL,NULL,'3014743986'),('2.5.0-unicode-other-dbs','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2023-12-19 19:39:30',35,'EXECUTED','8:29b29cfebfd12600897680147277a9d7','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'4.8.0',NULL,NULL,'3014743986'),('2.5.0-duplicate-email-support','slawomir@dabek.name','META-INF/jpa-changelog-2.5.0.xml','2023-12-19 19:39:30',36,'EXECUTED','8:73ad77ca8fd0410c7f9f15a471fa52bc','addColumn tableName=REALM','',NULL,'4.8.0',NULL,NULL,'3014743986'),('2.5.0-unique-group-names','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2023-12-19 19:39:30',37,'EXECUTED','8:64f27a6fdcad57f6f9153210f2ec1bdb','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'4.8.0',NULL,NULL,'3014743986'),('2.5.1','bburke@redhat.com','META-INF/jpa-changelog-2.5.1.xml','2023-12-19 19:39:30',38,'EXECUTED','8:27180251182e6c31846c2ddab4bc5781','addColumn tableName=FED_USER_CONSENT','',NULL,'4.8.0',NULL,NULL,'3014743986'),('3.0.0','bburke@redhat.com','META-INF/jpa-changelog-3.0.0.xml','2023-12-19 19:39:30',39,'EXECUTED','8:d56f201bfcfa7a1413eb3e9bc02978f9','addColumn tableName=IDENTITY_PROVIDER','',NULL,'4.8.0',NULL,NULL,'3014743986'),('3.2.0-fix','keycloak','META-INF/jpa-changelog-3.2.0.xml','2023-12-19 19:39:30',40,'MARK_RAN','8:91f5522bf6afdc2077dfab57fbd3455c','addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS','',NULL,'4.8.0',NULL,NULL,'3014743986'),('3.2.0-fix-with-keycloak-5416','keycloak','META-INF/jpa-changelog-3.2.0.xml','2023-12-19 19:39:30',41,'MARK_RAN','8:0f01b554f256c22caeb7d8aee3a1cdc8','dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS','',NULL,'4.8.0',NULL,NULL,'3014743986'),('3.2.0-fix-offline-sessions','hmlnarik','META-INF/jpa-changelog-3.2.0.xml','2023-12-19 19:39:30',42,'EXECUTED','8:ab91cf9cee415867ade0e2df9651a947','customChange','',NULL,'4.8.0',NULL,NULL,'3014743986'),('3.2.0-fixed','keycloak','META-INF/jpa-changelog-3.2.0.xml','2023-12-19 19:39:33',43,'EXECUTED','8:ceac9b1889e97d602caf373eadb0d4b7','addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...','',NULL,'4.8.0',NULL,NULL,'3014743986'),('3.3.0','keycloak','META-INF/jpa-changelog-3.3.0.xml','2023-12-19 19:39:33',44,'EXECUTED','8:84b986e628fe8f7fd8fd3c275c5259f2','addColumn tableName=USER_ENTITY','',NULL,'4.8.0',NULL,NULL,'3014743986'),('authz-3.4.0.CR1-resource-server-pk-change-part1','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2023-12-19 19:39:33',45,'EXECUTED','8:a164ae073c56ffdbc98a615493609a52','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE','',NULL,'4.8.0',NULL,NULL,'3014743986'),('authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2023-12-19 19:39:33',46,'EXECUTED','8:70a2b4f1f4bd4dbf487114bdb1810e64','customChange','',NULL,'4.8.0',NULL,NULL,'3014743986'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2023-12-19 19:39:33',47,'MARK_RAN','8:7be68b71d2f5b94b8df2e824f2860fa2','dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE','',NULL,'4.8.0',NULL,NULL,'3014743986'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2023-12-19 19:39:35',48,'EXECUTED','8:bab7c631093c3861d6cf6144cd944982','addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...','',NULL,'4.8.0',NULL,NULL,'3014743986'),('authn-3.4.0.CR1-refresh-token-max-reuse','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2023-12-19 19:39:35',49,'EXECUTED','8:fa809ac11877d74d76fe40869916daad','addColumn tableName=REALM','',NULL,'4.8.0',NULL,NULL,'3014743986'),('3.4.0','keycloak','META-INF/jpa-changelog-3.4.0.xml','2023-12-19 19:39:36',50,'EXECUTED','8:fac23540a40208f5f5e326f6ceb4d291','addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...','',NULL,'4.8.0',NULL,NULL,'3014743986'),('3.4.0-KEYCLOAK-5230','hmlnarik@redhat.com','META-INF/jpa-changelog-3.4.0.xml','2023-12-19 19:39:36',51,'EXECUTED','8:2612d1b8a97e2b5588c346e817307593','createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...','',NULL,'4.8.0',NULL,NULL,'3014743986'),('3.4.1','psilva@redhat.com','META-INF/jpa-changelog-3.4.1.xml','2023-12-19 19:39:36',52,'EXECUTED','8:9842f155c5db2206c88bcb5d1046e941','modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.8.0',NULL,NULL,'3014743986'),('3.4.2','keycloak','META-INF/jpa-changelog-3.4.2.xml','2023-12-19 19:39:36',53,'EXECUTED','8:2e12e06e45498406db72d5b3da5bbc76','update tableName=REALM','',NULL,'4.8.0',NULL,NULL,'3014743986'),('3.4.2-KEYCLOAK-5172','mkanis@redhat.com','META-INF/jpa-changelog-3.4.2.xml','2023-12-19 19:39:36',54,'EXECUTED','8:33560e7c7989250c40da3abdabdc75a4','update tableName=CLIENT','',NULL,'4.8.0',NULL,NULL,'3014743986'),('4.0.0-KEYCLOAK-6335','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2023-12-19 19:39:37',55,'EXECUTED','8:87a8d8542046817a9107c7eb9cbad1cd','createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS','',NULL,'4.8.0',NULL,NULL,'3014743986'),('4.0.0-CLEANUP-UNUSED-TABLE','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2023-12-19 19:39:37',56,'EXECUTED','8:3ea08490a70215ed0088c273d776311e','dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING','',NULL,'4.8.0',NULL,NULL,'3014743986'),('4.0.0-KEYCLOAK-6228','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2023-12-19 19:39:37',57,'EXECUTED','8:2d56697c8723d4592ab608ce14b6ed68','dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...','',NULL,'4.8.0',NULL,NULL,'3014743986'),('4.0.0-KEYCLOAK-5579-fixed','mposolda@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2023-12-19 19:39:41',58,'EXECUTED','8:3e423e249f6068ea2bbe48bf907f9d86','dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...','',NULL,'4.8.0',NULL,NULL,'3014743986'),('authz-4.0.0.CR1','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.CR1.xml','2023-12-19 19:39:42',59,'EXECUTED','8:15cabee5e5df0ff099510a0fc03e4103','createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...','',NULL,'4.8.0',NULL,NULL,'3014743986'),('authz-4.0.0.Beta3','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.Beta3.xml','2023-12-19 19:39:42',60,'EXECUTED','8:4b80200af916ac54d2ffbfc47918ab0e','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY','',NULL,'4.8.0',NULL,NULL,'3014743986'),('authz-4.2.0.Final','mhajas@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2023-12-19 19:39:42',61,'EXECUTED','8:66564cd5e168045d52252c5027485bbb','createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...','',NULL,'4.8.0',NULL,NULL,'3014743986'),('authz-4.2.0.Final-KEYCLOAK-9944','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2023-12-19 19:39:43',62,'EXECUTED','8:1c7064fafb030222be2bd16ccf690f6f','addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS','',NULL,'4.8.0',NULL,NULL,'3014743986'),('4.2.0-KEYCLOAK-6313','wadahiro@gmail.com','META-INF/jpa-changelog-4.2.0.xml','2023-12-19 19:39:43',63,'EXECUTED','8:2de18a0dce10cdda5c7e65c9b719b6e5','addColumn tableName=REQUIRED_ACTION_PROVIDER','',NULL,'4.8.0',NULL,NULL,'3014743986'),('4.3.0-KEYCLOAK-7984','wadahiro@gmail.com','META-INF/jpa-changelog-4.3.0.xml','2023-12-19 19:39:43',64,'EXECUTED','8:03e413dd182dcbd5c57e41c34d0ef682','update tableName=REQUIRED_ACTION_PROVIDER','',NULL,'4.8.0',NULL,NULL,'3014743986'),('4.6.0-KEYCLOAK-7950','psilva@redhat.com','META-INF/jpa-changelog-4.6.0.xml','2023-12-19 19:39:43',65,'EXECUTED','8:d27b42bb2571c18fbe3fe4e4fb7582a7','update tableName=RESOURCE_SERVER_RESOURCE','',NULL,'4.8.0',NULL,NULL,'3014743986'),('4.6.0-KEYCLOAK-8377','keycloak','META-INF/jpa-changelog-4.6.0.xml','2023-12-19 19:39:43',66,'EXECUTED','8:698baf84d9fd0027e9192717c2154fb8','createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...','',NULL,'4.8.0',NULL,NULL,'3014743986'),('4.6.0-KEYCLOAK-8555','gideonray@gmail.com','META-INF/jpa-changelog-4.6.0.xml','2023-12-19 19:39:43',67,'EXECUTED','8:ced8822edf0f75ef26eb51582f9a821a','createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT','',NULL,'4.8.0',NULL,NULL,'3014743986'),('4.7.0-KEYCLOAK-1267','sguilhen@redhat.com','META-INF/jpa-changelog-4.7.0.xml','2023-12-19 19:39:43',68,'EXECUTED','8:f0abba004cf429e8afc43056df06487d','addColumn tableName=REALM','',NULL,'4.8.0',NULL,NULL,'3014743986'),('4.7.0-KEYCLOAK-7275','keycloak','META-INF/jpa-changelog-4.7.0.xml','2023-12-19 19:39:43',69,'EXECUTED','8:6662f8b0b611caa359fcf13bf63b4e24','renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...','',NULL,'4.8.0',NULL,NULL,'3014743986'),('4.8.0-KEYCLOAK-8835','sguilhen@redhat.com','META-INF/jpa-changelog-4.8.0.xml','2023-12-19 19:39:44',70,'EXECUTED','8:9e6b8009560f684250bdbdf97670d39e','addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM','',NULL,'4.8.0',NULL,NULL,'3014743986'),('authz-7.0.0-KEYCLOAK-10443','psilva@redhat.com','META-INF/jpa-changelog-authz-7.0.0.xml','2023-12-19 19:39:44',71,'EXECUTED','8:4223f561f3b8dc655846562b57bb502e','addColumn tableName=RESOURCE_SERVER','',NULL,'4.8.0',NULL,NULL,'3014743986'),('8.0.0-adding-credential-columns','keycloak','META-INF/jpa-changelog-8.0.0.xml','2023-12-19 19:39:44',72,'EXECUTED','8:215a31c398b363ce383a2b301202f29e','addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL','',NULL,'4.8.0',NULL,NULL,'3014743986'),('8.0.0-updating-credential-data-not-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2023-12-19 19:39:44',73,'EXECUTED','8:83f7a671792ca98b3cbd3a1a34862d3d','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'4.8.0',NULL,NULL,'3014743986'),('8.0.0-updating-credential-data-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2023-12-19 19:39:44',74,'MARK_RAN','8:f58ad148698cf30707a6efbdf8061aa7','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'4.8.0',NULL,NULL,'3014743986'),('8.0.0-credential-cleanup-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2023-12-19 19:39:45',75,'EXECUTED','8:79e4fd6c6442980e58d52ffc3ee7b19c','dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...','',NULL,'4.8.0',NULL,NULL,'3014743986'),('8.0.0-resource-tag-support','keycloak','META-INF/jpa-changelog-8.0.0.xml','2023-12-19 19:39:45',76,'EXECUTED','8:87af6a1e6d241ca4b15801d1f86a297d','addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL','',NULL,'4.8.0',NULL,NULL,'3014743986'),('9.0.0-always-display-client','keycloak','META-INF/jpa-changelog-9.0.0.xml','2023-12-19 19:39:45',77,'EXECUTED','8:b44f8d9b7b6ea455305a6d72a200ed15','addColumn tableName=CLIENT','',NULL,'4.8.0',NULL,NULL,'3014743986'),('9.0.0-drop-constraints-for-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2023-12-19 19:39:45',78,'MARK_RAN','8:2d8ed5aaaeffd0cb004c046b4a903ac5','dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...','',NULL,'4.8.0',NULL,NULL,'3014743986'),('9.0.0-increase-column-size-federated-fk','keycloak','META-INF/jpa-changelog-9.0.0.xml','2023-12-19 19:39:46',79,'EXECUTED','8:e290c01fcbc275326c511633f6e2acde','modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...','',NULL,'4.8.0',NULL,NULL,'3014743986'),('9.0.0-recreate-constraints-after-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2023-12-19 19:39:46',80,'MARK_RAN','8:c9db8784c33cea210872ac2d805439f8','addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...','',NULL,'4.8.0',NULL,NULL,'3014743986'),('9.0.1-add-index-to-client.client_id','keycloak','META-INF/jpa-changelog-9.0.1.xml','2023-12-19 19:39:46',81,'EXECUTED','8:95b676ce8fc546a1fcfb4c92fae4add5','createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT','',NULL,'4.8.0',NULL,NULL,'3014743986'),('9.0.1-KEYCLOAK-12579-drop-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2023-12-19 19:39:46',82,'MARK_RAN','8:38a6b2a41f5651018b1aca93a41401e5','dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'4.8.0',NULL,NULL,'3014743986'),('9.0.1-KEYCLOAK-12579-add-not-null-constraint','keycloak','META-INF/jpa-changelog-9.0.1.xml','2023-12-19 19:39:46',83,'EXECUTED','8:3fb99bcad86a0229783123ac52f7609c','addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP','',NULL,'4.8.0',NULL,NULL,'3014743986'),('9.0.1-KEYCLOAK-12579-recreate-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2023-12-19 19:39:46',84,'MARK_RAN','8:64f27a6fdcad57f6f9153210f2ec1bdb','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'4.8.0',NULL,NULL,'3014743986'),('9.0.1-add-index-to-events','keycloak','META-INF/jpa-changelog-9.0.1.xml','2023-12-19 19:39:46',85,'EXECUTED','8:ab4f863f39adafd4c862f7ec01890abc','createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY','',NULL,'4.8.0',NULL,NULL,'3014743986'),('map-remove-ri','keycloak','META-INF/jpa-changelog-11.0.0.xml','2023-12-19 19:39:46',86,'EXECUTED','8:13c419a0eb336e91ee3a3bf8fda6e2a7','dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9','',NULL,'4.8.0',NULL,NULL,'3014743986'),('map-remove-ri','keycloak','META-INF/jpa-changelog-12.0.0.xml','2023-12-19 19:39:46',87,'EXECUTED','8:e3fb1e698e0471487f51af1ed80fe3ac','dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...','',NULL,'4.8.0',NULL,NULL,'3014743986'),('12.1.0-add-realm-localization-table','keycloak','META-INF/jpa-changelog-12.0.0.xml','2023-12-19 19:39:47',88,'EXECUTED','8:babadb686aab7b56562817e60bf0abd0','createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS','',NULL,'4.8.0',NULL,NULL,'3014743986'),('default-roles','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-12-19 19:39:47',89,'EXECUTED','8:72d03345fda8e2f17093d08801947773','addColumn tableName=REALM; customChange','',NULL,'4.8.0',NULL,NULL,'3014743986'),('default-roles-cleanup','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-12-19 19:39:47',90,'EXECUTED','8:61c9233951bd96ffecd9ba75f7d978a4','dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES','',NULL,'4.8.0',NULL,NULL,'3014743986'),('13.0.0-KEYCLOAK-16844','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-12-19 19:39:47',91,'EXECUTED','8:ea82e6ad945cec250af6372767b25525','createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION','',NULL,'4.8.0',NULL,NULL,'3014743986'),('map-remove-ri-13.0.0','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-12-19 19:39:47',92,'EXECUTED','8:d3f4a33f41d960ddacd7e2ef30d126b3','dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...','',NULL,'4.8.0',NULL,NULL,'3014743986'),('13.0.0-KEYCLOAK-17992-drop-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-12-19 19:39:47',93,'MARK_RAN','8:1284a27fbd049d65831cb6fc07c8a783','dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT','',NULL,'4.8.0',NULL,NULL,'3014743986'),('13.0.0-increase-column-size-federated','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-12-19 19:39:47',94,'EXECUTED','8:9d11b619db2ae27c25853b8a37cd0dea','modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT','',NULL,'4.8.0',NULL,NULL,'3014743986'),('13.0.0-KEYCLOAK-17992-recreate-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-12-19 19:39:47',95,'MARK_RAN','8:3002bb3997451bb9e8bac5c5cd8d6327','addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...','',NULL,'4.8.0',NULL,NULL,'3014743986'),('json-string-accomodation-fixed','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-12-19 19:39:47',96,'EXECUTED','8:dfbee0d6237a23ef4ccbb7a4e063c163','addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE','',NULL,'4.8.0',NULL,NULL,'3014743986'),('14.0.0-KEYCLOAK-11019','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-12-19 19:39:47',97,'EXECUTED','8:75f3e372df18d38c62734eebb986b960','createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION','',NULL,'4.8.0',NULL,NULL,'3014743986'),('14.0.0-KEYCLOAK-18286','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-12-19 19:39:47',98,'MARK_RAN','8:7fee73eddf84a6035691512c85637eef','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.8.0',NULL,NULL,'3014743986'),('14.0.0-KEYCLOAK-18286-revert','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-12-19 19:39:47',99,'MARK_RAN','8:7a11134ab12820f999fbf3bb13c3adc8','dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.8.0',NULL,NULL,'3014743986'),('14.0.0-KEYCLOAK-18286-supported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-12-19 19:39:47',100,'EXECUTED','8:f43dfba07ba249d5d932dc489fd2b886','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.8.0',NULL,NULL,'3014743986'),('14.0.0-KEYCLOAK-18286-unsupported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-12-19 19:39:47',101,'MARK_RAN','8:18186f0008b86e0f0f49b0c4d0e842ac','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.8.0',NULL,NULL,'3014743986'),('KEYCLOAK-17267-add-index-to-user-attributes','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-12-19 19:39:47',102,'EXECUTED','8:09c2780bcb23b310a7019d217dc7b433','createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE','',NULL,'4.8.0',NULL,NULL,'3014743986'),('KEYCLOAK-18146-add-saml-art-binding-identifier','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-12-19 19:39:47',103,'EXECUTED','8:276a44955eab693c970a42880197fff2','customChange','',NULL,'4.8.0',NULL,NULL,'3014743986'),('15.0.0-KEYCLOAK-18467','keycloak','META-INF/jpa-changelog-15.0.0.xml','2023-12-19 19:39:48',104,'EXECUTED','8:ba8ee3b694d043f2bfc1a1079d0760d7','addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...','',NULL,'4.8.0',NULL,NULL,'3014743986'),('17.0.0-9562','keycloak','META-INF/jpa-changelog-17.0.0.xml','2023-12-19 19:39:48',105,'EXECUTED','8:5e06b1d75f5d17685485e610c2851b17','createIndex indexName=IDX_USER_SERVICE_ACCOUNT, tableName=USER_ENTITY','',NULL,'4.8.0',NULL,NULL,'3014743986'),('18.0.0-10625-IDX_ADMIN_EVENT_TIME','keycloak','META-INF/jpa-changelog-18.0.0.xml','2023-12-19 19:39:48',106,'EXECUTED','8:4b80546c1dc550ac552ee7b24a4ab7c0','createIndex indexName=IDX_ADMIN_EVENT_TIME, tableName=ADMIN_EVENT_ENTITY','',NULL,'4.8.0',NULL,NULL,'3014743986'),('19.0.0-10135','keycloak','META-INF/jpa-changelog-19.0.0.xml','2023-12-19 19:39:48',107,'EXECUTED','8:af510cd1bb2ab6339c45372f3e491696','customChange','',NULL,'4.8.0',NULL,NULL,'3014743986');
/*!40000 ALTER TABLE `DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOGLOCK`
--

DROP TABLE IF EXISTS `DATABASECHANGELOGLOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DATABASECHANGELOGLOCK` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOGLOCK`
--

LOCK TABLES `DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOGLOCK` VALUES (1,_binary '\0',NULL,NULL),(1000,_binary '\0',NULL,NULL),(1001,_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEFAULT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `DEFAULT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DEFAULT_CLIENT_SCOPE` (
  `REALM_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`REALM_ID`,`SCOPE_ID`),
  KEY `IDX_DEFCLS_REALM` (`REALM_ID`),
  KEY `IDX_DEFCLS_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_R_DEF_CLI_SCOPE_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEFAULT_CLIENT_SCOPE`
--

LOCK TABLES `DEFAULT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `DEFAULT_CLIENT_SCOPE` VALUES ('2eabb7d4-0c33-46d6-84b9-8461bcb3177a','08f86efb-6e6c-4ad1-98b9-8e5012522951',_binary '\0'),('2eabb7d4-0c33-46d6-84b9-8461bcb3177a','091bbbc4-4e5e-4be6-99a4-1125f23752d9',_binary '\0'),('2eabb7d4-0c33-46d6-84b9-8461bcb3177a','0f0626fd-30cf-4ac4-a3b5-0e532b9ff602',_binary ''),('2eabb7d4-0c33-46d6-84b9-8461bcb3177a','12b2691e-e3f5-45a8-824d-cd268d851c07',_binary ''),('2eabb7d4-0c33-46d6-84b9-8461bcb3177a','1df52d35-b24d-4f03-be0f-db7c10273db0',_binary ''),('2eabb7d4-0c33-46d6-84b9-8461bcb3177a','55338902-b018-4f4c-a336-63e1bc719b82',_binary ''),('2eabb7d4-0c33-46d6-84b9-8461bcb3177a','5cd556af-7e38-4e57-8ce6-6a9ea3d2a113',_binary '\0'),('2eabb7d4-0c33-46d6-84b9-8461bcb3177a','68d8366c-476b-4d66-8ab4-66f33b71764d',_binary ''),('2eabb7d4-0c33-46d6-84b9-8461bcb3177a','ed4713b9-c1c6-4ea8-93d7-14ffe4a7f926',_binary '\0'),('2eabb7d4-0c33-46d6-84b9-8461bcb3177a','edf0cd87-c000-4953-9a35-1d367848a84a',_binary ''),('d22d3c39-cfbc-4bb2-99cd-9761f6004a33','1cc7aabb-8189-4262-bcb6-060bd15764bf',_binary '\0'),('d22d3c39-cfbc-4bb2-99cd-9761f6004a33','218caddf-16df-4535-ad37-14979d6a8ca1',_binary ''),('d22d3c39-cfbc-4bb2-99cd-9761f6004a33','5c9e885a-363b-4ee2-819a-515962679547',_binary ''),('d22d3c39-cfbc-4bb2-99cd-9761f6004a33','5ccdda95-d52c-4181-adcc-74a934c1b86c',_binary '\0'),('d22d3c39-cfbc-4bb2-99cd-9761f6004a33','6596a5d6-6973-4ffa-92ce-d8f067eadc63',_binary ''),('d22d3c39-cfbc-4bb2-99cd-9761f6004a33','9ec49961-8485-45b9-80ee-7dd7cb9a4613',_binary '\0'),('d22d3c39-cfbc-4bb2-99cd-9761f6004a33','abb6e108-c022-4733-968a-495a82a12c8c',_binary '\0'),('d22d3c39-cfbc-4bb2-99cd-9761f6004a33','bd96178b-4c96-467d-9560-20d2c1bb2e3d',_binary ''),('d22d3c39-cfbc-4bb2-99cd-9761f6004a33','be3b20ab-4858-425b-be00-2b1ddc66b273',_binary ''),('d22d3c39-cfbc-4bb2-99cd-9761f6004a33','d99485bc-7bd8-42f1-ac50-3d011efee1ce',_binary '');
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EVENT_ENTITY`
--

DROP TABLE IF EXISTS `EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EVENT_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `DETAILS_JSON` varchar(2550) DEFAULT NULL,
  `ERROR` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `SESSION_ID` varchar(255) DEFAULT NULL,
  `EVENT_TIME` bigint(20) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_EVENT_TIME` (`REALM_ID`,`EVENT_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EVENT_ENTITY`
--

LOCK TABLES `EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_IDENTITY`
--

DROP TABLE IF EXISTS `FEDERATED_IDENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FEDERATED_IDENTITY` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FEDERATED_USER_ID` varchar(255) DEFAULT NULL,
  `FEDERATED_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`),
  KEY `IDX_FEDIDENTITY_USER` (`USER_ID`),
  KEY `IDX_FEDIDENTITY_FEDUSER` (`FEDERATED_USER_ID`),
  CONSTRAINT `FK404288B92EF007A6` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_IDENTITY`
--

LOCK TABLES `FEDERATED_IDENTITY` WRITE;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_USER`
--

DROP TABLE IF EXISTS `FEDERATED_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FEDERATED_USER` (
  `ID` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_USER`
--

LOCK TABLES `FEDERATED_USER` WRITE;
/*!40000 ALTER TABLE `FEDERATED_USER` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `FED_USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `VALUE` varchar(2024) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_ATTRIBUTE` (`USER_ID`,`REALM_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ATTRIBUTE`
--

LOCK TABLES `FED_USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CONSENT` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint(20) DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CONSENT` (`USER_ID`,`CLIENT_ID`),
  KEY `IDX_FU_CONSENT_RU` (`REALM_ID`,`USER_ID`),
  KEY `IDX_FU_CNSNT_EXT` (`USER_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT`
--

LOCK TABLES `FED_USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT_CL_SCOPE`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT_CL_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CONSENT_CL_SCOPE` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT_CL_SCOPE`
--

LOCK TABLES `FED_USER_CONSENT_CL_SCOPE` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CREDENTIAL`
--

DROP TABLE IF EXISTS `FED_USER_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CREDENTIAL` (
  `ID` varchar(36) NOT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) DEFAULT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `USER_LABEL` varchar(255) DEFAULT NULL,
  `SECRET_DATA` longtext,
  `CREDENTIAL_DATA` longtext,
  `PRIORITY` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CREDENTIAL` (`USER_ID`,`TYPE`),
  KEY `IDX_FU_CREDENTIAL_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CREDENTIAL`
--

LOCK TABLES `FED_USER_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `FED_USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP` (`USER_ID`,`GROUP_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `FED_USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `FED_USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_REQUIRED_ACTION` (
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_FU_REQUIRED_ACTION` (`USER_ID`,`REQUIRED_ACTION`),
  KEY `IDX_FU_REQUIRED_ACTION_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_REQUIRED_ACTION`
--

LOCK TABLES `FED_USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `FED_USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_FU_ROLE_MAPPING` (`USER_ID`,`ROLE_ID`),
  KEY `IDX_FU_ROLE_MAPPING_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ROLE_MAPPING`
--

LOCK TABLES `FED_USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ATTRIBUTE`
--

DROP TABLE IF EXISTS `GROUP_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GROUP_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_GROUP_ATTR_GROUP` (`GROUP_ID`),
  CONSTRAINT `FK_GROUP_ATTRIBUTE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ATTRIBUTE`
--

LOCK TABLES `GROUP_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `GROUP_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GROUP_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`GROUP_ID`),
  KEY `IDX_GROUP_ROLE_MAPP_GROUP` (`GROUP_ID`),
  CONSTRAINT `FK_GROUP_ROLE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ROLE_MAPPING`
--

LOCK TABLES `GROUP_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER` (
  `INTERNAL_ID` varchar(36) NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ALIAS` varchar(255) DEFAULT NULL,
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `STORE_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `AUTHENTICATE_BY_DEFAULT` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ADD_TOKEN_ROLE` bit(1) NOT NULL DEFAULT b'1',
  `TRUST_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `FIRST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `POST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `LINK_ONLY` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`INTERNAL_ID`),
  UNIQUE KEY `UK_2DAELWNIBJI49AVXSRTUF6XJ33` (`PROVIDER_ALIAS`,`REALM_ID`),
  KEY `IDX_IDENT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK2B4EBC52AE5C3B34` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER`
--

LOCK TABLES `IDENTITY_PROVIDER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_CONFIG`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER_CONFIG` (
  `IDENTITY_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FKDC4897CF864C4E43` FOREIGN KEY (`IDENTITY_PROVIDER_ID`) REFERENCES `IDENTITY_PROVIDER` (`INTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_CONFIG`
--

LOCK TABLES `IDENTITY_PROVIDER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_MAPPER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `IDP_ALIAS` varchar(255) NOT NULL,
  `IDP_MAPPER_NAME` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ID_PROV_MAPP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_IDPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_MAPPER`
--

LOCK TABLES `IDENTITY_PROVIDER_MAPPER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDP_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `IDP_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDP_MAPPER_CONFIG` (
  `IDP_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDP_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_IDPMCONFIG` FOREIGN KEY (`IDP_MAPPER_ID`) REFERENCES `IDENTITY_PROVIDER_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDP_MAPPER_CONFIG`
--

LOCK TABLES `IDP_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_GROUP`
--

DROP TABLE IF EXISTS `KEYCLOAK_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KEYCLOAK_GROUP` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `PARENT_GROUP` varchar(36) NOT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SIBLING_NAMES` (`REALM_ID`,`PARENT_GROUP`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_GROUP`
--

LOCK TABLES `KEYCLOAK_GROUP` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` DISABLE KEYS */;
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_ROLE`
--

DROP TABLE IF EXISTS `KEYCLOAK_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KEYCLOAK_ROLE` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_REALM_CONSTRAINT` varchar(255) DEFAULT NULL,
  `CLIENT_ROLE` bit(1) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `CLIENT` varchar(36) DEFAULT NULL,
  `REALM` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_J3RWUVD56ONTGSUHOGM184WW2-2` (`NAME`,`CLIENT_REALM_CONSTRAINT`),
  KEY `IDX_KEYCLOAK_ROLE_CLIENT` (`CLIENT`),
  KEY `IDX_KEYCLOAK_ROLE_REALM` (`REALM`),
  CONSTRAINT `FK_6VYQFE4CN4WLQ8R6KT5VDSJ5C` FOREIGN KEY (`REALM`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_ROLE`
--

LOCK TABLES `KEYCLOAK_ROLE` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` DISABLE KEYS */;
INSERT INTO `KEYCLOAK_ROLE` VALUES ('023ae14c-026f-49ce-8af6-dcec3c58021f','e380d0a1-72e4-4fc1-b617-bc1970b17633',_binary '','${role_query-clients}','query-clients','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','e380d0a1-72e4-4fc1-b617-bc1970b17633',NULL),('041d9bd6-a56e-4093-a5a2-e6d0a13cf383','2eabb7d4-0c33-46d6-84b9-8461bcb3177a',_binary '\0','${role_uma_authorization}','uma_authorization','2eabb7d4-0c33-46d6-84b9-8461bcb3177a',NULL,NULL),('04306184-0eb8-4e0c-b821-b92077427cb1','3623b32e-1e08-4d22-8cb1-e1a39b192f48',_binary '','${role_manage-identity-providers}','manage-identity-providers','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','3623b32e-1e08-4d22-8cb1-e1a39b192f48',NULL),('053b27c0-f42e-440a-be7c-b7dcb9188589','008382ce-2097-4f94-a588-2e1701dfe0aa',_binary '','${role_manage-account-links}','manage-account-links','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','008382ce-2097-4f94-a588-2e1701dfe0aa',NULL),('06413a4e-ecf1-494f-bd93-df6ff3386f67','2bb6fb5c-745e-43f9-9086-6cbd0f202106',_binary '','${role_manage-consent}','manage-consent','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','2bb6fb5c-745e-43f9-9086-6cbd0f202106',NULL),('080467cc-8fb1-45a9-942b-7e79cd6dc1dc','3623b32e-1e08-4d22-8cb1-e1a39b192f48',_binary '','${role_manage-clients}','manage-clients','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','3623b32e-1e08-4d22-8cb1-e1a39b192f48',NULL),('095c11c1-758b-46e9-93a6-494111b09c38','e380d0a1-72e4-4fc1-b617-bc1970b17633',_binary '','${role_query-realms}','query-realms','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','e380d0a1-72e4-4fc1-b617-bc1970b17633',NULL),('0ed9a06b-70e6-4bca-a19f-1cb442715264','2eabb7d4-0c33-46d6-84b9-8461bcb3177a',_binary '\0','${role_offline-access}','offline_access','2eabb7d4-0c33-46d6-84b9-8461bcb3177a',NULL,NULL),('18d47af0-ac11-4e5b-964d-75f1fc047411','008382ce-2097-4f94-a588-2e1701dfe0aa',_binary '','${role_manage-consent}','manage-consent','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','008382ce-2097-4f94-a588-2e1701dfe0aa',NULL),('1bf2faf2-b855-4d85-854a-67ef05c5fb7e','e380d0a1-72e4-4fc1-b617-bc1970b17633',_binary '','${role_query-users}','query-users','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','e380d0a1-72e4-4fc1-b617-bc1970b17633',NULL),('1d265b0c-e6cd-4c43-8d03-8e2775db602d','3623b32e-1e08-4d22-8cb1-e1a39b192f48',_binary '','${role_view-identity-providers}','view-identity-providers','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','3623b32e-1e08-4d22-8cb1-e1a39b192f48',NULL),('1d68b3ed-5f97-4c69-b21b-9deaf10c3b96','3623b32e-1e08-4d22-8cb1-e1a39b192f48',_binary '','${role_impersonation}','impersonation','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','3623b32e-1e08-4d22-8cb1-e1a39b192f48',NULL),('2056d0e0-1b9f-429d-9276-13a6451a4cbd','984a23a6-c416-4b39-8730-09f0a1b76d49',_binary '','${role_view-realm}','view-realm','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','984a23a6-c416-4b39-8730-09f0a1b76d49',NULL),('251872a5-3bc6-4834-b1b5-b6732f47a0ba','984a23a6-c416-4b39-8730-09f0a1b76d49',_binary '','${role_manage-events}','manage-events','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','984a23a6-c416-4b39-8730-09f0a1b76d49',NULL),('253f86ea-ce65-44a9-8460-cdeb2b935845','3623b32e-1e08-4d22-8cb1-e1a39b192f48',_binary '','${role_view-realm}','view-realm','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','3623b32e-1e08-4d22-8cb1-e1a39b192f48',NULL),('266baf94-e338-4aed-a3f1-2baeeaaf6b07','3623b32e-1e08-4d22-8cb1-e1a39b192f48',_binary '','${role_query-clients}','query-clients','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','3623b32e-1e08-4d22-8cb1-e1a39b192f48',NULL),('27d3cda3-5b78-4fb9-9ea1-cdb036a486d7','3623b32e-1e08-4d22-8cb1-e1a39b192f48',_binary '','${role_view-events}','view-events','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','3623b32e-1e08-4d22-8cb1-e1a39b192f48',NULL),('2886c558-a4a9-4f95-bcf6-c7a63d979fe9','e380d0a1-72e4-4fc1-b617-bc1970b17633',_binary '','${role_view-events}','view-events','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','e380d0a1-72e4-4fc1-b617-bc1970b17633',NULL),('29a38910-88af-4029-a576-a532e63985f5','e380d0a1-72e4-4fc1-b617-bc1970b17633',_binary '','${role_view-clients}','view-clients','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','e380d0a1-72e4-4fc1-b617-bc1970b17633',NULL),('2dcfdf7d-eab2-492c-8898-dc297a78fbcd','e380d0a1-72e4-4fc1-b617-bc1970b17633',_binary '','${role_manage-identity-providers}','manage-identity-providers','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','e380d0a1-72e4-4fc1-b617-bc1970b17633',NULL),('35e01bf5-eba4-4672-bb98-cd11be287366','2bb6fb5c-745e-43f9-9086-6cbd0f202106',_binary '','${role_view-consent}','view-consent','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','2bb6fb5c-745e-43f9-9086-6cbd0f202106',NULL),('3624833a-60af-4cd5-b310-4def30c9ba7d','2bb6fb5c-745e-43f9-9086-6cbd0f202106',_binary '','${role_view-profile}','view-profile','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','2bb6fb5c-745e-43f9-9086-6cbd0f202106',NULL),('36bb1428-242f-42d6-89f5-4ac5f31e2905','2bb6fb5c-745e-43f9-9086-6cbd0f202106',_binary '','${role_delete-account}','delete-account','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','2bb6fb5c-745e-43f9-9086-6cbd0f202106',NULL),('3d29462c-2263-4195-acb9-3f74d8504881','e380d0a1-72e4-4fc1-b617-bc1970b17633',_binary '','${role_view-users}','view-users','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','e380d0a1-72e4-4fc1-b617-bc1970b17633',NULL),('44eff37d-0ff0-4245-827b-22f1d4a795f0','e380d0a1-72e4-4fc1-b617-bc1970b17633',_binary '','${role_query-groups}','query-groups','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','e380d0a1-72e4-4fc1-b617-bc1970b17633',NULL),('45e49d3e-7976-453a-b725-9fe2b507ddce','3623b32e-1e08-4d22-8cb1-e1a39b192f48',_binary '','${role_create-client}','create-client','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','3623b32e-1e08-4d22-8cb1-e1a39b192f48',NULL),('46f6c3b7-8650-42c9-ab26-58f95916210c','2bb6fb5c-745e-43f9-9086-6cbd0f202106',_binary '','${role_view-applications}','view-applications','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','2bb6fb5c-745e-43f9-9086-6cbd0f202106',NULL),('49d388de-aedd-402d-a9ed-6d1b2919d813','3623b32e-1e08-4d22-8cb1-e1a39b192f48',_binary '','${role_query-realms}','query-realms','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','3623b32e-1e08-4d22-8cb1-e1a39b192f48',NULL),('52de5ce6-59dd-4321-a00a-d65670803065','984a23a6-c416-4b39-8730-09f0a1b76d49',_binary '','${role_impersonation}','impersonation','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','984a23a6-c416-4b39-8730-09f0a1b76d49',NULL),('56dc331d-5454-424d-876b-415b3673cde6','984a23a6-c416-4b39-8730-09f0a1b76d49',_binary '','${role_view-users}','view-users','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','984a23a6-c416-4b39-8730-09f0a1b76d49',NULL),('572a64d7-99fd-438a-ade6-48bba75dfa36','3623b32e-1e08-4d22-8cb1-e1a39b192f48',_binary '','${role_manage-users}','manage-users','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','3623b32e-1e08-4d22-8cb1-e1a39b192f48',NULL),('6114fbc1-957f-4b57-93ad-fadf851a90f3','008382ce-2097-4f94-a588-2e1701dfe0aa',_binary '','${role_delete-account}','delete-account','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','008382ce-2097-4f94-a588-2e1701dfe0aa',NULL),('77dd0e86-4548-42ea-ae8c-b47bdfefe572','3623b32e-1e08-4d22-8cb1-e1a39b192f48',_binary '','${role_view-authorization}','view-authorization','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','3623b32e-1e08-4d22-8cb1-e1a39b192f48',NULL),('787a2f58-5ced-4e17-af27-c3836deb8099','3623b32e-1e08-4d22-8cb1-e1a39b192f48',_binary '','${role_manage-realm}','manage-realm','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','3623b32e-1e08-4d22-8cb1-e1a39b192f48',NULL),('78c6f0ba-871f-4327-99f3-33474a9d5906','d22d3c39-cfbc-4bb2-99cd-9761f6004a33',_binary '\0','${role_admin}','admin','d22d3c39-cfbc-4bb2-99cd-9761f6004a33',NULL,NULL),('7c48afea-d98b-4cb1-bf35-1f95a49d452c','e380d0a1-72e4-4fc1-b617-bc1970b17633',_binary '','${role_view-realm}','view-realm','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','e380d0a1-72e4-4fc1-b617-bc1970b17633',NULL),('7f9d9b5d-41b2-44d4-b0f0-840d16966308','d22d3c39-cfbc-4bb2-99cd-9761f6004a33',_binary '\0','${role_create-realm}','create-realm','d22d3c39-cfbc-4bb2-99cd-9761f6004a33',NULL,NULL),('88f424a2-f016-44e9-b1c9-fa2a5bc25c68','008382ce-2097-4f94-a588-2e1701dfe0aa',_binary '','${role_manage-account}','manage-account','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','008382ce-2097-4f94-a588-2e1701dfe0aa',NULL),('8c602de5-1f98-449a-b14d-1195dab3859f','984a23a6-c416-4b39-8730-09f0a1b76d49',_binary '','${role_query-groups}','query-groups','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','984a23a6-c416-4b39-8730-09f0a1b76d49',NULL),('8e9baa8b-8f4a-4495-8d7e-bf1c36f7f5a6','984a23a6-c416-4b39-8730-09f0a1b76d49',_binary '','${role_view-identity-providers}','view-identity-providers','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','984a23a6-c416-4b39-8730-09f0a1b76d49',NULL),('92a53ff5-057e-40ad-9837-11a4d92a1488','e380d0a1-72e4-4fc1-b617-bc1970b17633',_binary '','${role_manage-realm}','manage-realm','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','e380d0a1-72e4-4fc1-b617-bc1970b17633',NULL),('96fd5d78-b4ba-4b0a-9163-a5e9fd81275a','984a23a6-c416-4b39-8730-09f0a1b76d49',_binary '','${role_manage-users}','manage-users','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','984a23a6-c416-4b39-8730-09f0a1b76d49',NULL),('97fa1092-cd85-45a6-85ff-8d1d127e31c9','0e2f922e-a2c3-4619-99b4-104c9a5357ec',_binary '','${role_read-token}','read-token','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','0e2f922e-a2c3-4619-99b4-104c9a5357ec',NULL),('990c4773-d8da-450e-b4ec-e8f9ab40db25','984a23a6-c416-4b39-8730-09f0a1b76d49',_binary '','${role_create-client}','create-client','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','984a23a6-c416-4b39-8730-09f0a1b76d49',NULL),('9a6ff5e4-f69d-488e-ba9b-3c513f8375de','e380d0a1-72e4-4fc1-b617-bc1970b17633',_binary '','${role_manage-authorization}','manage-authorization','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','e380d0a1-72e4-4fc1-b617-bc1970b17633',NULL),('9cc9531e-c593-4f1f-9459-8a02bf6aa557','e380d0a1-72e4-4fc1-b617-bc1970b17633',_binary '','${role_realm-admin}','realm-admin','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','e380d0a1-72e4-4fc1-b617-bc1970b17633',NULL),('a1f092f3-f780-4a91-81ef-7dc8fa635f96','3623b32e-1e08-4d22-8cb1-e1a39b192f48',_binary '','${role_query-users}','query-users','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','3623b32e-1e08-4d22-8cb1-e1a39b192f48',NULL),('a3a3fb91-c82b-430f-a0fa-38e2498ccb09','e380d0a1-72e4-4fc1-b617-bc1970b17633',_binary '','${role_create-client}','create-client','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','e380d0a1-72e4-4fc1-b617-bc1970b17633',NULL),('a3f6c8b5-550e-4cb8-9086-ffbc0e1f864d','e380d0a1-72e4-4fc1-b617-bc1970b17633',_binary '','${role_view-authorization}','view-authorization','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','e380d0a1-72e4-4fc1-b617-bc1970b17633',NULL),('a634f65c-3e53-45ff-9d48-385fbea87fb2','d5bb52e7-dda5-4bc6-82df-e78da0f9a622',_binary '','Admin role for Cinema Api','admin','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','d5bb52e7-dda5-4bc6-82df-e78da0f9a622',NULL),('a66b6d41-0cd2-4183-9e3f-5b07df8042bc','984a23a6-c416-4b39-8730-09f0a1b76d49',_binary '','${role_query-users}','query-users','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','984a23a6-c416-4b39-8730-09f0a1b76d49',NULL),('a813537b-b969-4e6b-aab9-7aff677e0b91','3623b32e-1e08-4d22-8cb1-e1a39b192f48',_binary '','${role_manage-events}','manage-events','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','3623b32e-1e08-4d22-8cb1-e1a39b192f48',NULL),('b0a4ea27-9476-4c20-9729-c074dd38b84a','3623b32e-1e08-4d22-8cb1-e1a39b192f48',_binary '','${role_manage-authorization}','manage-authorization','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','3623b32e-1e08-4d22-8cb1-e1a39b192f48',NULL),('b2f93568-452c-4db7-a8df-e090f9929d96','3623b32e-1e08-4d22-8cb1-e1a39b192f48',_binary '','${role_view-users}','view-users','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','3623b32e-1e08-4d22-8cb1-e1a39b192f48',NULL),('b55687e5-441e-4ccb-81d0-3a82e14a83b8','984a23a6-c416-4b39-8730-09f0a1b76d49',_binary '','${role_view-authorization}','view-authorization','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','984a23a6-c416-4b39-8730-09f0a1b76d49',NULL),('b69ba1b0-cb52-401a-a4c9-2681bb55629d','e380d0a1-72e4-4fc1-b617-bc1970b17633',_binary '','${role_manage-clients}','manage-clients','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','e380d0a1-72e4-4fc1-b617-bc1970b17633',NULL),('b9130f76-739d-4cda-b51c-44d731efbb65','3623b32e-1e08-4d22-8cb1-e1a39b192f48',_binary '','${role_view-clients}','view-clients','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','3623b32e-1e08-4d22-8cb1-e1a39b192f48',NULL),('bc589d45-5190-4057-ab05-431bbec1d1fa','9a3f9fd0-a451-4bc9-9a5d-66c968abc283',_binary '','${role_read-token}','read-token','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','9a3f9fd0-a451-4bc9-9a5d-66c968abc283',NULL),('c065d367-1f04-4879-8ca7-653a136e377a','3623b32e-1e08-4d22-8cb1-e1a39b192f48',_binary '','${role_query-groups}','query-groups','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','3623b32e-1e08-4d22-8cb1-e1a39b192f48',NULL),('c31cf313-7813-4bd5-8a09-8f1a41a4ac04','984a23a6-c416-4b39-8730-09f0a1b76d49',_binary '','${role_manage-realm}','manage-realm','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','984a23a6-c416-4b39-8730-09f0a1b76d49',NULL),('c5672fed-1d66-4d00-9013-65e84ee35767','984a23a6-c416-4b39-8730-09f0a1b76d49',_binary '','${role_view-events}','view-events','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','984a23a6-c416-4b39-8730-09f0a1b76d49',NULL),('c5ee7ce3-498c-4305-a821-151b1c4317bc','d22d3c39-cfbc-4bb2-99cd-9761f6004a33',_binary '\0','${role_uma_authorization}','uma_authorization','d22d3c39-cfbc-4bb2-99cd-9761f6004a33',NULL,NULL),('c798049b-dfdc-41a5-b80c-e6212045c296','e380d0a1-72e4-4fc1-b617-bc1970b17633',_binary '','${role_view-identity-providers}','view-identity-providers','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','e380d0a1-72e4-4fc1-b617-bc1970b17633',NULL),('c9c32fef-80ee-446c-9384-2ccba10a06e0','d5bb52e7-dda5-4bc6-82df-e78da0f9a622',_binary '','User role for Cinema Api','user','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','d5bb52e7-dda5-4bc6-82df-e78da0f9a622',NULL),('cc56e898-b4b6-4fcd-a6d8-f61adefb7d01','2eabb7d4-0c33-46d6-84b9-8461bcb3177a',_binary '\0','${role_default-roles}','default-roles-cinema','2eabb7d4-0c33-46d6-84b9-8461bcb3177a',NULL,NULL),('cec51ad7-dbe5-46e6-8f0f-a45655d6d791','984a23a6-c416-4b39-8730-09f0a1b76d49',_binary '','${role_manage-clients}','manage-clients','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','984a23a6-c416-4b39-8730-09f0a1b76d49',NULL),('d12eb93f-3812-417e-9f85-91f060d54b8d','984a23a6-c416-4b39-8730-09f0a1b76d49',_binary '','${role_manage-identity-providers}','manage-identity-providers','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','984a23a6-c416-4b39-8730-09f0a1b76d49',NULL),('d3c4df4e-3372-49ee-b5da-07af7528dae8','e380d0a1-72e4-4fc1-b617-bc1970b17633',_binary '','${role_impersonation}','impersonation','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','e380d0a1-72e4-4fc1-b617-bc1970b17633',NULL),('da901236-8ca4-4dca-b1ec-90ce28ebecb2','d22d3c39-cfbc-4bb2-99cd-9761f6004a33',_binary '\0','${role_default-roles}','default-roles-master','d22d3c39-cfbc-4bb2-99cd-9761f6004a33',NULL,NULL),('db334363-ada4-49c7-acbc-fc77133bf455','008382ce-2097-4f94-a588-2e1701dfe0aa',_binary '','${role_view-applications}','view-applications','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','008382ce-2097-4f94-a588-2e1701dfe0aa',NULL),('dd1c2672-b530-4b1c-bc88-6eada6266269','d22d3c39-cfbc-4bb2-99cd-9761f6004a33',_binary '\0','${role_offline-access}','offline_access','d22d3c39-cfbc-4bb2-99cd-9761f6004a33',NULL,NULL),('dd8ebd9b-e288-40e9-9765-fda43e5ccbf4','984a23a6-c416-4b39-8730-09f0a1b76d49',_binary '','${role_query-realms}','query-realms','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','984a23a6-c416-4b39-8730-09f0a1b76d49',NULL),('e0818034-29eb-4e96-aaf3-fad08c79897c','008382ce-2097-4f94-a588-2e1701dfe0aa',_binary '','${role_view-consent}','view-consent','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','008382ce-2097-4f94-a588-2e1701dfe0aa',NULL),('e36bcd30-f31d-4bd4-bcca-a92108dbd4ba','008382ce-2097-4f94-a588-2e1701dfe0aa',_binary '','${role_view-profile}','view-profile','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','008382ce-2097-4f94-a588-2e1701dfe0aa',NULL),('e50fbbc9-e1cf-4d7e-bf83-5b5c1257e9bf','e380d0a1-72e4-4fc1-b617-bc1970b17633',_binary '','${role_manage-users}','manage-users','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','e380d0a1-72e4-4fc1-b617-bc1970b17633',NULL),('e5e0073a-dc14-46f6-8c16-17f17f01712e','e380d0a1-72e4-4fc1-b617-bc1970b17633',_binary '','${role_manage-events}','manage-events','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','e380d0a1-72e4-4fc1-b617-bc1970b17633',NULL),('ec079f44-da93-4f73-8db4-a52ae08b7ad1','2bb6fb5c-745e-43f9-9086-6cbd0f202106',_binary '','${role_manage-account}','manage-account','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','2bb6fb5c-745e-43f9-9086-6cbd0f202106',NULL),('ee22a5dc-46cc-4f58-aa14-468d55c151e6','984a23a6-c416-4b39-8730-09f0a1b76d49',_binary '','${role_manage-authorization}','manage-authorization','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','984a23a6-c416-4b39-8730-09f0a1b76d49',NULL),('fb5a8935-a89b-4268-98fc-e2a69b523c45','2bb6fb5c-745e-43f9-9086-6cbd0f202106',_binary '','${role_manage-account-links}','manage-account-links','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','2bb6fb5c-745e-43f9-9086-6cbd0f202106',NULL),('fb76bc1e-25e6-431d-9ccd-203537ea2eee','984a23a6-c416-4b39-8730-09f0a1b76d49',_binary '','${role_query-clients}','query-clients','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','984a23a6-c416-4b39-8730-09f0a1b76d49',NULL),('fec9d6c2-2b35-4f85-a7e1-a42707c079b2','984a23a6-c416-4b39-8730-09f0a1b76d49',_binary '','${role_view-clients}','view-clients','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','984a23a6-c416-4b39-8730-09f0a1b76d49',NULL);
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MIGRATION_MODEL`
--

DROP TABLE IF EXISTS `MIGRATION_MODEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MIGRATION_MODEL` (
  `ID` varchar(36) NOT NULL,
  `VERSION` varchar(36) DEFAULT NULL,
  `UPDATE_TIME` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IDX_UPDATE_TIME` (`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MIGRATION_MODEL`
--

LOCK TABLES `MIGRATION_MODEL` WRITE;
/*!40000 ALTER TABLE `MIGRATION_MODEL` DISABLE KEYS */;
INSERT INTO `MIGRATION_MODEL` VALUES ('p3hxv','19.0.3',1703014792);
/*!40000 ALTER TABLE `MIGRATION_MODEL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_CLIENT_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OFFLINE_CLIENT_SESSION` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `TIMESTAMP` int(11) DEFAULT NULL,
  `DATA` longtext,
  `CLIENT_STORAGE_PROVIDER` varchar(36) NOT NULL DEFAULT 'local',
  `EXTERNAL_CLIENT_ID` varchar(255) NOT NULL DEFAULT 'local',
  PRIMARY KEY (`USER_SESSION_ID`,`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`OFFLINE_FLAG`),
  KEY `IDX_US_SESS_ID_ON_CL_SESS` (`USER_SESSION_ID`),
  KEY `IDX_OFFLINE_CSS_PRELOAD` (`CLIENT_ID`,`OFFLINE_FLAG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_CLIENT_SESSION`
--

LOCK TABLES `OFFLINE_CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_USER_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OFFLINE_USER_SESSION` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `CREATED_ON` int(11) NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `DATA` longtext,
  `LAST_SESSION_REFRESH` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`USER_SESSION_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_CREATEDON` (`CREATED_ON`),
  KEY `IDX_OFFLINE_USS_PRELOAD` (`OFFLINE_FLAG`,`CREATED_ON`,`USER_SESSION_ID`),
  KEY `IDX_OFFLINE_USS_BY_USER` (`USER_ID`,`REALM_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_BY_USERSESS` (`REALM_ID`,`OFFLINE_FLAG`,`USER_SESSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_USER_SESSION`
--

LOCK TABLES `OFFLINE_USER_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POLICY_CONFIG`
--

DROP TABLE IF EXISTS `POLICY_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `POLICY_CONFIG` (
  `POLICY_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` longtext,
  PRIMARY KEY (`POLICY_ID`,`NAME`),
  CONSTRAINT `FKDC34197CF864C4E43` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POLICY_CONFIG`
--

LOCK TABLES `POLICY_CONFIG` WRITE;
/*!40000 ALTER TABLE `POLICY_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `POLICY_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROTOCOL_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `PROTOCOL` varchar(255) NOT NULL,
  `PROTOCOL_MAPPER_NAME` varchar(255) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `CLIENT_SCOPE_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_PROTOCOL_MAPPER_CLIENT` (`CLIENT_ID`),
  KEY `IDX_CLSCOPE_PROTMAP` (`CLIENT_SCOPE_ID`),
  CONSTRAINT `FK_CLI_SCOPE_MAPPER` FOREIGN KEY (`CLIENT_SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`),
  CONSTRAINT `FK_PCM_REALM` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER`
--

LOCK TABLES `PROTOCOL_MAPPER` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER` VALUES ('02ea25e9-b091-41a2-91da-15360f2f45ab','role list','saml','saml-role-list-mapper',NULL,'5c9e885a-363b-4ee2-819a-515962679547'),('042671a3-254c-460a-9d21-3559bb0dbdfd','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'d99485bc-7bd8-42f1-ac50-3d011efee1ce'),('062f7beb-f403-4005-9875-2f0270e8d620','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'d99485bc-7bd8-42f1-ac50-3d011efee1ce'),('0979862a-07e4-4a06-8391-c90cc35babb3','address','openid-connect','oidc-address-mapper',NULL,'5ccdda95-d52c-4181-adcc-74a934c1b86c'),('1cd1983b-9315-4273-9c24-faa7da66e081','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'d99485bc-7bd8-42f1-ac50-3d011efee1ce'),('25f7d4a4-c724-410f-af01-2979929c6a3e','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'d99485bc-7bd8-42f1-ac50-3d011efee1ce'),('2d8e266c-d14e-45ac-ba2e-96c169c72cb9','address','openid-connect','oidc-address-mapper',NULL,'08f86efb-6e6c-4ad1-98b9-8e5012522951'),('2f91750d-d10e-4806-be29-8346d24c77c0','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'d99485bc-7bd8-42f1-ac50-3d011efee1ce'),('32a0616b-b9d1-4b9b-a44a-02fc698ed0bc','audience resolve','openid-connect','oidc-audience-resolve-mapper','666e1ac8-1776-419b-930f-462940887496',NULL),('3523a344-ef32-459f-a401-ac38a9084251','username','openid-connect','oidc-usermodel-property-mapper',NULL,'d99485bc-7bd8-42f1-ac50-3d011efee1ce'),('399c9fc9-63f8-438d-967b-e720065c58fa','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'55338902-b018-4f4c-a336-63e1bc719b82'),('3cbbd628-bd66-4fc4-ab9a-824d63fa4531','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'55338902-b018-4f4c-a336-63e1bc719b82'),('3e19155a-2f40-4b3b-8fcd-3ce93bb71c35','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'091bbbc4-4e5e-4be6-99a4-1125f23752d9'),('3f2ce41d-0afc-494c-9083-27adde12e052','email','openid-connect','oidc-usermodel-property-mapper',NULL,'218caddf-16df-4535-ad37-14979d6a8ca1'),('40bc065c-6b25-43ac-a802-5c3064bd34d5','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'bd96178b-4c96-467d-9560-20d2c1bb2e3d'),('4164f41e-b906-4749-8b01-360b1a21c847','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'6596a5d6-6973-4ffa-92ce-d8f067eadc63'),('41654596-6f4b-46bf-85ef-9d506ec2c09d','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'d99485bc-7bd8-42f1-ac50-3d011efee1ce'),('42657ba4-3eaf-407a-94a4-b77a7aa7f733','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'55338902-b018-4f4c-a336-63e1bc719b82'),('426da8fb-7050-4bc7-a931-562a3fc74dfd','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'9ec49961-8485-45b9-80ee-7dd7cb9a4613'),('4ceb5cfa-1a3a-4001-866e-5e7e85c79796','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'12b2691e-e3f5-45a8-824d-cd268d851c07'),('4e327b26-9917-4fed-b877-96ec0f11e4d8','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'55338902-b018-4f4c-a336-63e1bc719b82'),('504fbbaa-d52f-4801-99d5-8f14c7e7fe7e','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'d99485bc-7bd8-42f1-ac50-3d011efee1ce'),('575eb18d-2027-431e-97ed-a7884395815c','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'55338902-b018-4f4c-a336-63e1bc719b82'),('57ae25b4-83ee-4531-a52e-3bc228c3fa7b','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'5cd556af-7e38-4e57-8ce6-6a9ea3d2a113'),('5996d221-5fe1-45f6-8d70-ecaca8aac588','acr loa level','openid-connect','oidc-acr-mapper',NULL,'be3b20ab-4858-425b-be00-2b1ddc66b273'),('64f4545a-73ac-4358-a423-eefa4ad05d6a','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'d99485bc-7bd8-42f1-ac50-3d011efee1ce'),('6751f12a-358b-4624-af07-9b33805d731f','Client ID','openid-connect','oidc-usersessionmodel-note-mapper','d5bb52e7-dda5-4bc6-82df-e78da0f9a622',NULL),('6aa4623b-1dda-466a-89db-6cc09077eded','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'edf0cd87-c000-4953-9a35-1d367848a84a'),('6bf8dd1d-72cb-4188-b0af-0aeb4ef12fc0','audience resolve','openid-connect','oidc-audience-resolve-mapper','c9ae182b-0344-4d9c-80a9-af90e8a91e0a',NULL),('7361d77b-5b7d-4ecc-ac66-085f58f5a140','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'55338902-b018-4f4c-a336-63e1bc719b82'),('75e54139-9e02-40fe-a34c-e92b865eef53','email','openid-connect','oidc-usermodel-property-mapper',NULL,'edf0cd87-c000-4953-9a35-1d367848a84a'),('7c7024fc-2cca-46fa-a6ac-dd5934f60a2c','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'1df52d35-b24d-4f03-be0f-db7c10273db0'),('7ddf601f-612b-4c39-8aa1-2afdc757ed1b','full name','openid-connect','oidc-full-name-mapper',NULL,'d99485bc-7bd8-42f1-ac50-3d011efee1ce'),('88acf5b9-fd6b-4a8e-a213-e6b436aadb69','username','openid-connect','oidc-usermodel-property-mapper',NULL,'55338902-b018-4f4c-a336-63e1bc719b82'),('8e319364-9b33-457b-9f77-bd3730e47fa8','acr loa level','openid-connect','oidc-acr-mapper',NULL,'68d8366c-476b-4d66-8ab4-66f33b71764d'),('8f2213d9-700e-47f6-a070-0ce14a1e9362','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'55338902-b018-4f4c-a336-63e1bc719b82'),('91716682-2116-456b-b4f9-d7b770e2cb4f','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'d99485bc-7bd8-42f1-ac50-3d011efee1ce'),('95b80aa0-1f77-4b47-bb3f-af0cdcec2078','Client Host','openid-connect','oidc-usersessionmodel-note-mapper','d5bb52e7-dda5-4bc6-82df-e78da0f9a622',NULL),('98401cbc-7a25-41ea-a868-e931286b4f29','locale','openid-connect','oidc-usermodel-attribute-mapper','5feb6c4a-2ec7-403b-99e1-97b6f9e4aa7a',NULL),('98d8d672-bb6b-4bd3-bbbc-4a723a748de7','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'9ec49961-8485-45b9-80ee-7dd7cb9a4613'),('9b7b1e48-42d9-44b6-9897-d0adfd48e1c1','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'55338902-b018-4f4c-a336-63e1bc719b82'),('a4244cf7-fed0-48a8-9c59-41815401c757','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'1df52d35-b24d-4f03-be0f-db7c10273db0'),('ad13de49-320e-4673-9b96-36d1d0742a49','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'abb6e108-c022-4733-968a-495a82a12c8c'),('ae78de1a-ba71-4994-bac1-6f4f8b3388c6','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'55338902-b018-4f4c-a336-63e1bc719b82'),('b66d7d1a-f18f-431b-90b6-18c79f5fb740','locale','openid-connect','oidc-usermodel-attribute-mapper','c3e522a9-5bf4-47d7-888e-ae8fe7b88049',NULL),('cd2bcc4e-6fd7-4a81-b8d8-c10f2b3398f5','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'218caddf-16df-4535-ad37-14979d6a8ca1'),('d0aa08e7-5ca1-4c08-8521-3b1c7b34975d','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'d99485bc-7bd8-42f1-ac50-3d011efee1ce'),('d68348dc-8001-4cac-9045-9efa5e9a1865','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'091bbbc4-4e5e-4be6-99a4-1125f23752d9'),('d9e77efc-5b5e-4aa3-a62c-fec723eafd23','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'55338902-b018-4f4c-a336-63e1bc719b82'),('df93ebb0-8177-4360-9284-0c8248010202','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'5cd556af-7e38-4e57-8ce6-6a9ea3d2a113'),('e10507ac-e56e-4e06-b5d5-cc0b97e35f9b','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'55338902-b018-4f4c-a336-63e1bc719b82'),('e12ad2aa-2dfd-4dcd-849b-98061233a2fb','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'1df52d35-b24d-4f03-be0f-db7c10273db0'),('e3b80b7c-8849-49de-8a27-be066e8540b9','role list','saml','saml-role-list-mapper',NULL,'0f0626fd-30cf-4ac4-a3b5-0e532b9ff602'),('e53efdf5-be56-429e-8d74-a9fb65b01c43','full name','openid-connect','oidc-full-name-mapper',NULL,'55338902-b018-4f4c-a336-63e1bc719b82'),('e671eb55-44ab-4a65-a404-3eb98acfb2ed','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'55338902-b018-4f4c-a336-63e1bc719b82'),('ec9c312e-cdc1-4044-97de-5407eb0721f7','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'d99485bc-7bd8-42f1-ac50-3d011efee1ce'),('ecafd16c-bbb2-4d27-8842-7c30ba00b49f','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'6596a5d6-6973-4ffa-92ce-d8f067eadc63'),('f8aa0c41-02e8-4626-9366-870ccc63627a','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'6596a5d6-6973-4ffa-92ce-d8f067eadc63'),('fd075b5d-75ce-4a2b-a334-80f42ce1b933','Client IP Address','openid-connect','oidc-usersessionmodel-note-mapper','d5bb52e7-dda5-4bc6-82df-e78da0f9a622',NULL),('fd1f0611-2587-47a1-9d45-5855cc595b4b','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'abb6e108-c022-4733-968a-495a82a12c8c'),('fe3d275a-9073-42a2-97f2-ff287fea34d8','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'d99485bc-7bd8-42f1-ac50-3d011efee1ce');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROTOCOL_MAPPER_CONFIG` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`PROTOCOL_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_PMCONFIG` FOREIGN KEY (`PROTOCOL_MAPPER_ID`) REFERENCES `PROTOCOL_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER_CONFIG`
--

LOCK TABLES `PROTOCOL_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('02ea25e9-b091-41a2-91da-15360f2f45ab','Role','attribute.name'),('02ea25e9-b091-41a2-91da-15360f2f45ab','Basic','attribute.nameformat'),('02ea25e9-b091-41a2-91da-15360f2f45ab','false','single'),('042671a3-254c-460a-9d21-3559bb0dbdfd','true','access.token.claim'),('042671a3-254c-460a-9d21-3559bb0dbdfd','nickname','claim.name'),('042671a3-254c-460a-9d21-3559bb0dbdfd','true','id.token.claim'),('042671a3-254c-460a-9d21-3559bb0dbdfd','String','jsonType.label'),('042671a3-254c-460a-9d21-3559bb0dbdfd','nickname','user.attribute'),('042671a3-254c-460a-9d21-3559bb0dbdfd','true','userinfo.token.claim'),('062f7beb-f403-4005-9875-2f0270e8d620','true','access.token.claim'),('062f7beb-f403-4005-9875-2f0270e8d620','family_name','claim.name'),('062f7beb-f403-4005-9875-2f0270e8d620','true','id.token.claim'),('062f7beb-f403-4005-9875-2f0270e8d620','String','jsonType.label'),('062f7beb-f403-4005-9875-2f0270e8d620','lastName','user.attribute'),('062f7beb-f403-4005-9875-2f0270e8d620','true','userinfo.token.claim'),('0979862a-07e4-4a06-8391-c90cc35babb3','true','access.token.claim'),('0979862a-07e4-4a06-8391-c90cc35babb3','true','id.token.claim'),('0979862a-07e4-4a06-8391-c90cc35babb3','country','user.attribute.country'),('0979862a-07e4-4a06-8391-c90cc35babb3','formatted','user.attribute.formatted'),('0979862a-07e4-4a06-8391-c90cc35babb3','locality','user.attribute.locality'),('0979862a-07e4-4a06-8391-c90cc35babb3','postal_code','user.attribute.postal_code'),('0979862a-07e4-4a06-8391-c90cc35babb3','region','user.attribute.region'),('0979862a-07e4-4a06-8391-c90cc35babb3','street','user.attribute.street'),('0979862a-07e4-4a06-8391-c90cc35babb3','true','userinfo.token.claim'),('1cd1983b-9315-4273-9c24-faa7da66e081','true','access.token.claim'),('1cd1983b-9315-4273-9c24-faa7da66e081','picture','claim.name'),('1cd1983b-9315-4273-9c24-faa7da66e081','true','id.token.claim'),('1cd1983b-9315-4273-9c24-faa7da66e081','String','jsonType.label'),('1cd1983b-9315-4273-9c24-faa7da66e081','picture','user.attribute'),('1cd1983b-9315-4273-9c24-faa7da66e081','true','userinfo.token.claim'),('25f7d4a4-c724-410f-af01-2979929c6a3e','true','access.token.claim'),('25f7d4a4-c724-410f-af01-2979929c6a3e','website','claim.name'),('25f7d4a4-c724-410f-af01-2979929c6a3e','true','id.token.claim'),('25f7d4a4-c724-410f-af01-2979929c6a3e','String','jsonType.label'),('25f7d4a4-c724-410f-af01-2979929c6a3e','website','user.attribute'),('25f7d4a4-c724-410f-af01-2979929c6a3e','true','userinfo.token.claim'),('2d8e266c-d14e-45ac-ba2e-96c169c72cb9','true','access.token.claim'),('2d8e266c-d14e-45ac-ba2e-96c169c72cb9','true','id.token.claim'),('2d8e266c-d14e-45ac-ba2e-96c169c72cb9','country','user.attribute.country'),('2d8e266c-d14e-45ac-ba2e-96c169c72cb9','formatted','user.attribute.formatted'),('2d8e266c-d14e-45ac-ba2e-96c169c72cb9','locality','user.attribute.locality'),('2d8e266c-d14e-45ac-ba2e-96c169c72cb9','postal_code','user.attribute.postal_code'),('2d8e266c-d14e-45ac-ba2e-96c169c72cb9','region','user.attribute.region'),('2d8e266c-d14e-45ac-ba2e-96c169c72cb9','street','user.attribute.street'),('2d8e266c-d14e-45ac-ba2e-96c169c72cb9','true','userinfo.token.claim'),('2f91750d-d10e-4806-be29-8346d24c77c0','true','access.token.claim'),('2f91750d-d10e-4806-be29-8346d24c77c0','updated_at','claim.name'),('2f91750d-d10e-4806-be29-8346d24c77c0','true','id.token.claim'),('2f91750d-d10e-4806-be29-8346d24c77c0','long','jsonType.label'),('2f91750d-d10e-4806-be29-8346d24c77c0','updatedAt','user.attribute'),('2f91750d-d10e-4806-be29-8346d24c77c0','true','userinfo.token.claim'),('3523a344-ef32-459f-a401-ac38a9084251','true','access.token.claim'),('3523a344-ef32-459f-a401-ac38a9084251','preferred_username','claim.name'),('3523a344-ef32-459f-a401-ac38a9084251','true','id.token.claim'),('3523a344-ef32-459f-a401-ac38a9084251','String','jsonType.label'),('3523a344-ef32-459f-a401-ac38a9084251','username','user.attribute'),('3523a344-ef32-459f-a401-ac38a9084251','true','userinfo.token.claim'),('399c9fc9-63f8-438d-967b-e720065c58fa','true','access.token.claim'),('399c9fc9-63f8-438d-967b-e720065c58fa','website','claim.name'),('399c9fc9-63f8-438d-967b-e720065c58fa','true','id.token.claim'),('399c9fc9-63f8-438d-967b-e720065c58fa','String','jsonType.label'),('399c9fc9-63f8-438d-967b-e720065c58fa','website','user.attribute'),('399c9fc9-63f8-438d-967b-e720065c58fa','true','userinfo.token.claim'),('3cbbd628-bd66-4fc4-ab9a-824d63fa4531','true','access.token.claim'),('3cbbd628-bd66-4fc4-ab9a-824d63fa4531','middle_name','claim.name'),('3cbbd628-bd66-4fc4-ab9a-824d63fa4531','true','id.token.claim'),('3cbbd628-bd66-4fc4-ab9a-824d63fa4531','String','jsonType.label'),('3cbbd628-bd66-4fc4-ab9a-824d63fa4531','middleName','user.attribute'),('3cbbd628-bd66-4fc4-ab9a-824d63fa4531','true','userinfo.token.claim'),('3e19155a-2f40-4b3b-8fcd-3ce93bb71c35','true','access.token.claim'),('3e19155a-2f40-4b3b-8fcd-3ce93bb71c35','phone_number_verified','claim.name'),('3e19155a-2f40-4b3b-8fcd-3ce93bb71c35','true','id.token.claim'),('3e19155a-2f40-4b3b-8fcd-3ce93bb71c35','boolean','jsonType.label'),('3e19155a-2f40-4b3b-8fcd-3ce93bb71c35','phoneNumberVerified','user.attribute'),('3e19155a-2f40-4b3b-8fcd-3ce93bb71c35','true','userinfo.token.claim'),('3f2ce41d-0afc-494c-9083-27adde12e052','true','access.token.claim'),('3f2ce41d-0afc-494c-9083-27adde12e052','email','claim.name'),('3f2ce41d-0afc-494c-9083-27adde12e052','true','id.token.claim'),('3f2ce41d-0afc-494c-9083-27adde12e052','String','jsonType.label'),('3f2ce41d-0afc-494c-9083-27adde12e052','email','user.attribute'),('3f2ce41d-0afc-494c-9083-27adde12e052','true','userinfo.token.claim'),('4164f41e-b906-4749-8b01-360b1a21c847','true','access.token.claim'),('4164f41e-b906-4749-8b01-360b1a21c847','realm_access.roles','claim.name'),('4164f41e-b906-4749-8b01-360b1a21c847','String','jsonType.label'),('4164f41e-b906-4749-8b01-360b1a21c847','true','multivalued'),('4164f41e-b906-4749-8b01-360b1a21c847','foo','user.attribute'),('41654596-6f4b-46bf-85ef-9d506ec2c09d','true','access.token.claim'),('41654596-6f4b-46bf-85ef-9d506ec2c09d','birthdate','claim.name'),('41654596-6f4b-46bf-85ef-9d506ec2c09d','true','id.token.claim'),('41654596-6f4b-46bf-85ef-9d506ec2c09d','String','jsonType.label'),('41654596-6f4b-46bf-85ef-9d506ec2c09d','birthdate','user.attribute'),('41654596-6f4b-46bf-85ef-9d506ec2c09d','true','userinfo.token.claim'),('42657ba4-3eaf-407a-94a4-b77a7aa7f733','true','access.token.claim'),('42657ba4-3eaf-407a-94a4-b77a7aa7f733','locale','claim.name'),('42657ba4-3eaf-407a-94a4-b77a7aa7f733','true','id.token.claim'),('42657ba4-3eaf-407a-94a4-b77a7aa7f733','String','jsonType.label'),('42657ba4-3eaf-407a-94a4-b77a7aa7f733','locale','user.attribute'),('42657ba4-3eaf-407a-94a4-b77a7aa7f733','true','userinfo.token.claim'),('426da8fb-7050-4bc7-a931-562a3fc74dfd','true','access.token.claim'),('426da8fb-7050-4bc7-a931-562a3fc74dfd','upn','claim.name'),('426da8fb-7050-4bc7-a931-562a3fc74dfd','true','id.token.claim'),('426da8fb-7050-4bc7-a931-562a3fc74dfd','String','jsonType.label'),('426da8fb-7050-4bc7-a931-562a3fc74dfd','username','user.attribute'),('426da8fb-7050-4bc7-a931-562a3fc74dfd','true','userinfo.token.claim'),('4e327b26-9917-4fed-b877-96ec0f11e4d8','true','access.token.claim'),('4e327b26-9917-4fed-b877-96ec0f11e4d8','updated_at','claim.name'),('4e327b26-9917-4fed-b877-96ec0f11e4d8','true','id.token.claim'),('4e327b26-9917-4fed-b877-96ec0f11e4d8','long','jsonType.label'),('4e327b26-9917-4fed-b877-96ec0f11e4d8','updatedAt','user.attribute'),('4e327b26-9917-4fed-b877-96ec0f11e4d8','true','userinfo.token.claim'),('504fbbaa-d52f-4801-99d5-8f14c7e7fe7e','true','access.token.claim'),('504fbbaa-d52f-4801-99d5-8f14c7e7fe7e','profile','claim.name'),('504fbbaa-d52f-4801-99d5-8f14c7e7fe7e','true','id.token.claim'),('504fbbaa-d52f-4801-99d5-8f14c7e7fe7e','String','jsonType.label'),('504fbbaa-d52f-4801-99d5-8f14c7e7fe7e','profile','user.attribute'),('504fbbaa-d52f-4801-99d5-8f14c7e7fe7e','true','userinfo.token.claim'),('575eb18d-2027-431e-97ed-a7884395815c','true','access.token.claim'),('575eb18d-2027-431e-97ed-a7884395815c','birthdate','claim.name'),('575eb18d-2027-431e-97ed-a7884395815c','true','id.token.claim'),('575eb18d-2027-431e-97ed-a7884395815c','String','jsonType.label'),('575eb18d-2027-431e-97ed-a7884395815c','birthdate','user.attribute'),('575eb18d-2027-431e-97ed-a7884395815c','true','userinfo.token.claim'),('57ae25b4-83ee-4531-a52e-3bc228c3fa7b','true','access.token.claim'),('57ae25b4-83ee-4531-a52e-3bc228c3fa7b','upn','claim.name'),('57ae25b4-83ee-4531-a52e-3bc228c3fa7b','true','id.token.claim'),('57ae25b4-83ee-4531-a52e-3bc228c3fa7b','String','jsonType.label'),('57ae25b4-83ee-4531-a52e-3bc228c3fa7b','username','user.attribute'),('57ae25b4-83ee-4531-a52e-3bc228c3fa7b','true','userinfo.token.claim'),('5996d221-5fe1-45f6-8d70-ecaca8aac588','true','access.token.claim'),('5996d221-5fe1-45f6-8d70-ecaca8aac588','true','id.token.claim'),('64f4545a-73ac-4358-a423-eefa4ad05d6a','true','access.token.claim'),('64f4545a-73ac-4358-a423-eefa4ad05d6a','gender','claim.name'),('64f4545a-73ac-4358-a423-eefa4ad05d6a','true','id.token.claim'),('64f4545a-73ac-4358-a423-eefa4ad05d6a','String','jsonType.label'),('64f4545a-73ac-4358-a423-eefa4ad05d6a','gender','user.attribute'),('64f4545a-73ac-4358-a423-eefa4ad05d6a','true','userinfo.token.claim'),('6751f12a-358b-4624-af07-9b33805d731f','true','access.token.claim'),('6751f12a-358b-4624-af07-9b33805d731f','clientId','claim.name'),('6751f12a-358b-4624-af07-9b33805d731f','true','id.token.claim'),('6751f12a-358b-4624-af07-9b33805d731f','String','jsonType.label'),('6751f12a-358b-4624-af07-9b33805d731f','clientId','user.session.note'),('6aa4623b-1dda-466a-89db-6cc09077eded','true','access.token.claim'),('6aa4623b-1dda-466a-89db-6cc09077eded','email_verified','claim.name'),('6aa4623b-1dda-466a-89db-6cc09077eded','true','id.token.claim'),('6aa4623b-1dda-466a-89db-6cc09077eded','boolean','jsonType.label'),('6aa4623b-1dda-466a-89db-6cc09077eded','emailVerified','user.attribute'),('6aa4623b-1dda-466a-89db-6cc09077eded','true','userinfo.token.claim'),('7361d77b-5b7d-4ecc-ac66-085f58f5a140','true','access.token.claim'),('7361d77b-5b7d-4ecc-ac66-085f58f5a140','nickname','claim.name'),('7361d77b-5b7d-4ecc-ac66-085f58f5a140','true','id.token.claim'),('7361d77b-5b7d-4ecc-ac66-085f58f5a140','String','jsonType.label'),('7361d77b-5b7d-4ecc-ac66-085f58f5a140','nickname','user.attribute'),('7361d77b-5b7d-4ecc-ac66-085f58f5a140','true','userinfo.token.claim'),('75e54139-9e02-40fe-a34c-e92b865eef53','true','access.token.claim'),('75e54139-9e02-40fe-a34c-e92b865eef53','email','claim.name'),('75e54139-9e02-40fe-a34c-e92b865eef53','true','id.token.claim'),('75e54139-9e02-40fe-a34c-e92b865eef53','String','jsonType.label'),('75e54139-9e02-40fe-a34c-e92b865eef53','email','user.attribute'),('75e54139-9e02-40fe-a34c-e92b865eef53','true','userinfo.token.claim'),('7ddf601f-612b-4c39-8aa1-2afdc757ed1b','true','access.token.claim'),('7ddf601f-612b-4c39-8aa1-2afdc757ed1b','true','id.token.claim'),('7ddf601f-612b-4c39-8aa1-2afdc757ed1b','true','userinfo.token.claim'),('88acf5b9-fd6b-4a8e-a213-e6b436aadb69','true','access.token.claim'),('88acf5b9-fd6b-4a8e-a213-e6b436aadb69','preferred_username','claim.name'),('88acf5b9-fd6b-4a8e-a213-e6b436aadb69','true','id.token.claim'),('88acf5b9-fd6b-4a8e-a213-e6b436aadb69','String','jsonType.label'),('88acf5b9-fd6b-4a8e-a213-e6b436aadb69','username','user.attribute'),('88acf5b9-fd6b-4a8e-a213-e6b436aadb69','true','userinfo.token.claim'),('8e319364-9b33-457b-9f77-bd3730e47fa8','true','access.token.claim'),('8e319364-9b33-457b-9f77-bd3730e47fa8','true','id.token.claim'),('8f2213d9-700e-47f6-a070-0ce14a1e9362','true','access.token.claim'),('8f2213d9-700e-47f6-a070-0ce14a1e9362','picture','claim.name'),('8f2213d9-700e-47f6-a070-0ce14a1e9362','true','id.token.claim'),('8f2213d9-700e-47f6-a070-0ce14a1e9362','String','jsonType.label'),('8f2213d9-700e-47f6-a070-0ce14a1e9362','picture','user.attribute'),('8f2213d9-700e-47f6-a070-0ce14a1e9362','true','userinfo.token.claim'),('91716682-2116-456b-b4f9-d7b770e2cb4f','true','access.token.claim'),('91716682-2116-456b-b4f9-d7b770e2cb4f','locale','claim.name'),('91716682-2116-456b-b4f9-d7b770e2cb4f','true','id.token.claim'),('91716682-2116-456b-b4f9-d7b770e2cb4f','String','jsonType.label'),('91716682-2116-456b-b4f9-d7b770e2cb4f','locale','user.attribute'),('91716682-2116-456b-b4f9-d7b770e2cb4f','true','userinfo.token.claim'),('95b80aa0-1f77-4b47-bb3f-af0cdcec2078','true','access.token.claim'),('95b80aa0-1f77-4b47-bb3f-af0cdcec2078','clientHost','claim.name'),('95b80aa0-1f77-4b47-bb3f-af0cdcec2078','true','id.token.claim'),('95b80aa0-1f77-4b47-bb3f-af0cdcec2078','String','jsonType.label'),('95b80aa0-1f77-4b47-bb3f-af0cdcec2078','clientHost','user.session.note'),('98401cbc-7a25-41ea-a868-e931286b4f29','true','access.token.claim'),('98401cbc-7a25-41ea-a868-e931286b4f29','locale','claim.name'),('98401cbc-7a25-41ea-a868-e931286b4f29','true','id.token.claim'),('98401cbc-7a25-41ea-a868-e931286b4f29','String','jsonType.label'),('98401cbc-7a25-41ea-a868-e931286b4f29','locale','user.attribute'),('98401cbc-7a25-41ea-a868-e931286b4f29','true','userinfo.token.claim'),('98d8d672-bb6b-4bd3-bbbc-4a723a748de7','true','access.token.claim'),('98d8d672-bb6b-4bd3-bbbc-4a723a748de7','groups','claim.name'),('98d8d672-bb6b-4bd3-bbbc-4a723a748de7','true','id.token.claim'),('98d8d672-bb6b-4bd3-bbbc-4a723a748de7','String','jsonType.label'),('98d8d672-bb6b-4bd3-bbbc-4a723a748de7','true','multivalued'),('98d8d672-bb6b-4bd3-bbbc-4a723a748de7','foo','user.attribute'),('9b7b1e48-42d9-44b6-9897-d0adfd48e1c1','true','access.token.claim'),('9b7b1e48-42d9-44b6-9897-d0adfd48e1c1','gender','claim.name'),('9b7b1e48-42d9-44b6-9897-d0adfd48e1c1','true','id.token.claim'),('9b7b1e48-42d9-44b6-9897-d0adfd48e1c1','String','jsonType.label'),('9b7b1e48-42d9-44b6-9897-d0adfd48e1c1','gender','user.attribute'),('9b7b1e48-42d9-44b6-9897-d0adfd48e1c1','true','userinfo.token.claim'),('a4244cf7-fed0-48a8-9c59-41815401c757','true','access.token.claim'),('a4244cf7-fed0-48a8-9c59-41815401c757','realm_access.roles','claim.name'),('a4244cf7-fed0-48a8-9c59-41815401c757','String','jsonType.label'),('a4244cf7-fed0-48a8-9c59-41815401c757','true','multivalued'),('a4244cf7-fed0-48a8-9c59-41815401c757','foo','user.attribute'),('ad13de49-320e-4673-9b96-36d1d0742a49','true','access.token.claim'),('ad13de49-320e-4673-9b96-36d1d0742a49','phone_number_verified','claim.name'),('ad13de49-320e-4673-9b96-36d1d0742a49','true','id.token.claim'),('ad13de49-320e-4673-9b96-36d1d0742a49','boolean','jsonType.label'),('ad13de49-320e-4673-9b96-36d1d0742a49','phoneNumberVerified','user.attribute'),('ad13de49-320e-4673-9b96-36d1d0742a49','true','userinfo.token.claim'),('ae78de1a-ba71-4994-bac1-6f4f8b3388c6','true','access.token.claim'),('ae78de1a-ba71-4994-bac1-6f4f8b3388c6','profile','claim.name'),('ae78de1a-ba71-4994-bac1-6f4f8b3388c6','true','id.token.claim'),('ae78de1a-ba71-4994-bac1-6f4f8b3388c6','String','jsonType.label'),('ae78de1a-ba71-4994-bac1-6f4f8b3388c6','profile','user.attribute'),('ae78de1a-ba71-4994-bac1-6f4f8b3388c6','true','userinfo.token.claim'),('b66d7d1a-f18f-431b-90b6-18c79f5fb740','true','access.token.claim'),('b66d7d1a-f18f-431b-90b6-18c79f5fb740','locale','claim.name'),('b66d7d1a-f18f-431b-90b6-18c79f5fb740','true','id.token.claim'),('b66d7d1a-f18f-431b-90b6-18c79f5fb740','String','jsonType.label'),('b66d7d1a-f18f-431b-90b6-18c79f5fb740','locale','user.attribute'),('b66d7d1a-f18f-431b-90b6-18c79f5fb740','true','userinfo.token.claim'),('cd2bcc4e-6fd7-4a81-b8d8-c10f2b3398f5','true','access.token.claim'),('cd2bcc4e-6fd7-4a81-b8d8-c10f2b3398f5','email_verified','claim.name'),('cd2bcc4e-6fd7-4a81-b8d8-c10f2b3398f5','true','id.token.claim'),('cd2bcc4e-6fd7-4a81-b8d8-c10f2b3398f5','boolean','jsonType.label'),('cd2bcc4e-6fd7-4a81-b8d8-c10f2b3398f5','emailVerified','user.attribute'),('cd2bcc4e-6fd7-4a81-b8d8-c10f2b3398f5','true','userinfo.token.claim'),('d0aa08e7-5ca1-4c08-8521-3b1c7b34975d','true','access.token.claim'),('d0aa08e7-5ca1-4c08-8521-3b1c7b34975d','middle_name','claim.name'),('d0aa08e7-5ca1-4c08-8521-3b1c7b34975d','true','id.token.claim'),('d0aa08e7-5ca1-4c08-8521-3b1c7b34975d','String','jsonType.label'),('d0aa08e7-5ca1-4c08-8521-3b1c7b34975d','middleName','user.attribute'),('d0aa08e7-5ca1-4c08-8521-3b1c7b34975d','true','userinfo.token.claim'),('d68348dc-8001-4cac-9045-9efa5e9a1865','true','access.token.claim'),('d68348dc-8001-4cac-9045-9efa5e9a1865','phone_number','claim.name'),('d68348dc-8001-4cac-9045-9efa5e9a1865','true','id.token.claim'),('d68348dc-8001-4cac-9045-9efa5e9a1865','String','jsonType.label'),('d68348dc-8001-4cac-9045-9efa5e9a1865','phoneNumber','user.attribute'),('d68348dc-8001-4cac-9045-9efa5e9a1865','true','userinfo.token.claim'),('d9e77efc-5b5e-4aa3-a62c-fec723eafd23','true','access.token.claim'),('d9e77efc-5b5e-4aa3-a62c-fec723eafd23','given_name','claim.name'),('d9e77efc-5b5e-4aa3-a62c-fec723eafd23','true','id.token.claim'),('d9e77efc-5b5e-4aa3-a62c-fec723eafd23','String','jsonType.label'),('d9e77efc-5b5e-4aa3-a62c-fec723eafd23','firstName','user.attribute'),('d9e77efc-5b5e-4aa3-a62c-fec723eafd23','true','userinfo.token.claim'),('df93ebb0-8177-4360-9284-0c8248010202','true','access.token.claim'),('df93ebb0-8177-4360-9284-0c8248010202','groups','claim.name'),('df93ebb0-8177-4360-9284-0c8248010202','true','id.token.claim'),('df93ebb0-8177-4360-9284-0c8248010202','String','jsonType.label'),('df93ebb0-8177-4360-9284-0c8248010202','true','multivalued'),('df93ebb0-8177-4360-9284-0c8248010202','foo','user.attribute'),('e10507ac-e56e-4e06-b5d5-cc0b97e35f9b','true','access.token.claim'),('e10507ac-e56e-4e06-b5d5-cc0b97e35f9b','family_name','claim.name'),('e10507ac-e56e-4e06-b5d5-cc0b97e35f9b','true','id.token.claim'),('e10507ac-e56e-4e06-b5d5-cc0b97e35f9b','String','jsonType.label'),('e10507ac-e56e-4e06-b5d5-cc0b97e35f9b','lastName','user.attribute'),('e10507ac-e56e-4e06-b5d5-cc0b97e35f9b','true','userinfo.token.claim'),('e12ad2aa-2dfd-4dcd-849b-98061233a2fb','true','access.token.claim'),('e12ad2aa-2dfd-4dcd-849b-98061233a2fb','resource_access.${client_id}.roles','claim.name'),('e12ad2aa-2dfd-4dcd-849b-98061233a2fb','String','jsonType.label'),('e12ad2aa-2dfd-4dcd-849b-98061233a2fb','true','multivalued'),('e12ad2aa-2dfd-4dcd-849b-98061233a2fb','foo','user.attribute'),('e3b80b7c-8849-49de-8a27-be066e8540b9','Role','attribute.name'),('e3b80b7c-8849-49de-8a27-be066e8540b9','Basic','attribute.nameformat'),('e3b80b7c-8849-49de-8a27-be066e8540b9','false','single'),('e53efdf5-be56-429e-8d74-a9fb65b01c43','true','access.token.claim'),('e53efdf5-be56-429e-8d74-a9fb65b01c43','true','id.token.claim'),('e53efdf5-be56-429e-8d74-a9fb65b01c43','true','userinfo.token.claim'),('e671eb55-44ab-4a65-a404-3eb98acfb2ed','true','access.token.claim'),('e671eb55-44ab-4a65-a404-3eb98acfb2ed','zoneinfo','claim.name'),('e671eb55-44ab-4a65-a404-3eb98acfb2ed','true','id.token.claim'),('e671eb55-44ab-4a65-a404-3eb98acfb2ed','String','jsonType.label'),('e671eb55-44ab-4a65-a404-3eb98acfb2ed','zoneinfo','user.attribute'),('e671eb55-44ab-4a65-a404-3eb98acfb2ed','true','userinfo.token.claim'),('ec9c312e-cdc1-4044-97de-5407eb0721f7','true','access.token.claim'),('ec9c312e-cdc1-4044-97de-5407eb0721f7','zoneinfo','claim.name'),('ec9c312e-cdc1-4044-97de-5407eb0721f7','true','id.token.claim'),('ec9c312e-cdc1-4044-97de-5407eb0721f7','String','jsonType.label'),('ec9c312e-cdc1-4044-97de-5407eb0721f7','zoneinfo','user.attribute'),('ec9c312e-cdc1-4044-97de-5407eb0721f7','true','userinfo.token.claim'),('ecafd16c-bbb2-4d27-8842-7c30ba00b49f','true','access.token.claim'),('ecafd16c-bbb2-4d27-8842-7c30ba00b49f','resource_access.${client_id}.roles','claim.name'),('ecafd16c-bbb2-4d27-8842-7c30ba00b49f','String','jsonType.label'),('ecafd16c-bbb2-4d27-8842-7c30ba00b49f','true','multivalued'),('ecafd16c-bbb2-4d27-8842-7c30ba00b49f','foo','user.attribute'),('fd075b5d-75ce-4a2b-a334-80f42ce1b933','true','access.token.claim'),('fd075b5d-75ce-4a2b-a334-80f42ce1b933','clientAddress','claim.name'),('fd075b5d-75ce-4a2b-a334-80f42ce1b933','true','id.token.claim'),('fd075b5d-75ce-4a2b-a334-80f42ce1b933','String','jsonType.label'),('fd075b5d-75ce-4a2b-a334-80f42ce1b933','clientAddress','user.session.note'),('fd1f0611-2587-47a1-9d45-5855cc595b4b','true','access.token.claim'),('fd1f0611-2587-47a1-9d45-5855cc595b4b','phone_number','claim.name'),('fd1f0611-2587-47a1-9d45-5855cc595b4b','true','id.token.claim'),('fd1f0611-2587-47a1-9d45-5855cc595b4b','String','jsonType.label'),('fd1f0611-2587-47a1-9d45-5855cc595b4b','phoneNumber','user.attribute'),('fd1f0611-2587-47a1-9d45-5855cc595b4b','true','userinfo.token.claim'),('fe3d275a-9073-42a2-97f2-ff287fea34d8','true','access.token.claim'),('fe3d275a-9073-42a2-97f2-ff287fea34d8','given_name','claim.name'),('fe3d275a-9073-42a2-97f2-ff287fea34d8','true','id.token.claim'),('fe3d275a-9073-42a2-97f2-ff287fea34d8','String','jsonType.label'),('fe3d275a-9073-42a2-97f2-ff287fea34d8','firstName','user.attribute'),('fe3d275a-9073-42a2-97f2-ff287fea34d8','true','userinfo.token.claim');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM`
--

DROP TABLE IF EXISTS `REALM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM` (
  `ID` varchar(36) NOT NULL,
  `ACCESS_CODE_LIFESPAN` int(11) DEFAULT NULL,
  `USER_ACTION_LIFESPAN` int(11) DEFAULT NULL,
  `ACCESS_TOKEN_LIFESPAN` int(11) DEFAULT NULL,
  `ACCOUNT_THEME` varchar(255) DEFAULT NULL,
  `ADMIN_THEME` varchar(255) DEFAULT NULL,
  `EMAIL_THEME` varchar(255) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_EXPIRATION` bigint(20) DEFAULT NULL,
  `LOGIN_THEME` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int(11) DEFAULT NULL,
  `PASSWORD_POLICY` varchar(2550) DEFAULT NULL,
  `REGISTRATION_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `RESET_PASSWORD_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `SOCIAL` bit(1) NOT NULL DEFAULT b'0',
  `SSL_REQUIRED` varchar(255) DEFAULT NULL,
  `SSO_IDLE_TIMEOUT` int(11) DEFAULT NULL,
  `SSO_MAX_LIFESPAN` int(11) DEFAULT NULL,
  `UPDATE_PROFILE_ON_SOC_LOGIN` bit(1) NOT NULL DEFAULT b'0',
  `VERIFY_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `MASTER_ADMIN_CLIENT` varchar(36) DEFAULT NULL,
  `LOGIN_LIFESPAN` int(11) DEFAULT NULL,
  `INTERNATIONALIZATION_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_LOCALE` varchar(255) DEFAULT NULL,
  `REG_EMAIL_AS_USERNAME` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_DETAILS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EDIT_USERNAME_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `OTP_POLICY_COUNTER` int(11) DEFAULT '0',
  `OTP_POLICY_WINDOW` int(11) DEFAULT '1',
  `OTP_POLICY_PERIOD` int(11) DEFAULT '30',
  `OTP_POLICY_DIGITS` int(11) DEFAULT '6',
  `OTP_POLICY_ALG` varchar(36) DEFAULT 'HmacSHA1',
  `OTP_POLICY_TYPE` varchar(36) DEFAULT 'totp',
  `BROWSER_FLOW` varchar(36) DEFAULT NULL,
  `REGISTRATION_FLOW` varchar(36) DEFAULT NULL,
  `DIRECT_GRANT_FLOW` varchar(36) DEFAULT NULL,
  `RESET_CREDENTIALS_FLOW` varchar(36) DEFAULT NULL,
  `CLIENT_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `OFFLINE_SESSION_IDLE_TIMEOUT` int(11) DEFAULT '0',
  `REVOKE_REFRESH_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `ACCESS_TOKEN_LIFE_IMPLICIT` int(11) DEFAULT '0',
  `LOGIN_WITH_EMAIL_ALLOWED` bit(1) NOT NULL DEFAULT b'1',
  `DUPLICATE_EMAILS_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `DOCKER_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `REFRESH_TOKEN_MAX_REUSE` int(11) DEFAULT '0',
  `ALLOW_USER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `SSO_MAX_LIFESPAN_REMEMBER_ME` int(11) NOT NULL,
  `SSO_IDLE_TIMEOUT_REMEMBER_ME` int(11) NOT NULL,
  `DEFAULT_ROLE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_ORVSDMLA56612EAEFIQ6WL5OI` (`NAME`),
  KEY `IDX_REALM_MASTER_ADM_CLI` (`MASTER_ADMIN_CLIENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM`
--

LOCK TABLES `REALM` WRITE;
/*!40000 ALTER TABLE `REALM` DISABLE KEYS */;
INSERT INTO `REALM` VALUES ('2eabb7d4-0c33-46d6-84b9-8461bcb3177a',60,300,300,NULL,NULL,NULL,_binary '',_binary '\0',0,NULL,'cinema',0,NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0','EXTERNAL',1800,36000,_binary '\0',_binary '\0','984a23a6-c416-4b39-8730-09f0a1b76d49',1800,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','b58e9895-d9a9-4d9e-8a10-13811dc8d93d','6f7c4405-5d1a-4797-a79d-730c45fe858d','c1ef1a4d-a1dd-49d6-96d1-b24dffedab2b','7dd4d3cb-890a-4f05-ae6c-3c9b90a7bd77','d04187cb-0bdb-4b26-adbb-f690e53fb13d',2592000,_binary '\0',900,_binary '',_binary '\0','580c7b3b-6a71-4d2d-9e0c-73a02448499b',0,_binary '\0',0,0,'cc56e898-b4b6-4fcd-a6d8-f61adefb7d01'),('d22d3c39-cfbc-4bb2-99cd-9761f6004a33',60,300,60,NULL,NULL,NULL,_binary '',_binary '\0',0,NULL,'master',0,NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0','EXTERNAL',1800,36000,_binary '\0',_binary '\0','3623b32e-1e08-4d22-8cb1-e1a39b192f48',1800,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','dc0d4d23-1f56-47ba-afe9-155f4d70d49d','42e65d2f-8e24-4162-bc3f-0e20db1eb867','09d1dbdb-c791-45a5-a5f8-9fe23ce04ca5','c57ef679-35a0-45c3-986e-5db8ff0f2ef3','f9187fa8-d161-4270-9d59-da2d7bd5ee87',2592000,_binary '\0',900,_binary '',_binary '\0','46d95ef5-46c0-4b5c-b2fb-07234c03540d',0,_binary '\0',0,0,'da901236-8ca4-4dca-b1ec-90ce28ebecb2');
/*!40000 ALTER TABLE `REALM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ATTRIBUTE`
--

DROP TABLE IF EXISTS `REALM_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_ATTRIBUTE` (
  `NAME` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  PRIMARY KEY (`NAME`,`REALM_ID`),
  KEY `IDX_REALM_ATTR_REALM` (`REALM_ID`),
  CONSTRAINT `FK_8SHXD6L3E9ATQUKACXGPFFPTW` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ATTRIBUTE`
--

LOCK TABLES `REALM_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` DISABLE KEYS */;
INSERT INTO `REALM_ATTRIBUTE` VALUES ('actionTokenGeneratedByAdminLifespan','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','43200'),('actionTokenGeneratedByUserLifespan','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','300'),('bruteForceProtected','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','false'),('bruteForceProtected','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','false'),('cibaAuthRequestedUserHint','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','login_hint'),('cibaBackchannelTokenDeliveryMode','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','poll'),('cibaExpiresIn','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','120'),('cibaInterval','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','5'),('defaultSignatureAlgorithm','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','RS256'),('defaultSignatureAlgorithm','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','RS256'),('displayName','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','Keycloak'),('displayNameHtml','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','<div class=\"kc-logo-text\"><span>Keycloak</span></div>'),('failureFactor','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','30'),('failureFactor','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','30'),('maxDeltaTimeSeconds','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','43200'),('maxDeltaTimeSeconds','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','43200'),('maxFailureWaitSeconds','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','900'),('maxFailureWaitSeconds','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','900'),('minimumQuickLoginWaitSeconds','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','60'),('minimumQuickLoginWaitSeconds','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','60'),('oauth2DeviceCodeLifespan','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','600'),('oauth2DevicePollingInterval','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','5'),('offlineSessionMaxLifespan','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','5184000'),('offlineSessionMaxLifespan','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','5184000'),('offlineSessionMaxLifespanEnabled','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','false'),('offlineSessionMaxLifespanEnabled','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','false'),('parRequestUriLifespan','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','60'),('permanentLockout','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','false'),('permanentLockout','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','false'),('quickLoginCheckMilliSeconds','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','1000'),('quickLoginCheckMilliSeconds','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','1000'),('waitIncrementSeconds','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','60'),('waitIncrementSeconds','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','60'),('webAuthnPolicyAttestationConveyancePreference','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','not specified'),('webAuthnPolicyAttestationConveyancePreferencePasswordless','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','not specified'),('webAuthnPolicyAuthenticatorAttachment','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','not specified'),('webAuthnPolicyAuthenticatorAttachmentPasswordless','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','not specified'),('webAuthnPolicyAvoidSameAuthenticatorRegister','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','false'),('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','false'),('webAuthnPolicyCreateTimeout','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','0'),('webAuthnPolicyCreateTimeoutPasswordless','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','0'),('webAuthnPolicyRequireResidentKey','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','not specified'),('webAuthnPolicyRequireResidentKeyPasswordless','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','not specified'),('webAuthnPolicyRpEntityName','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','keycloak'),('webAuthnPolicyRpEntityNamePasswordless','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','keycloak'),('webAuthnPolicyRpId','2eabb7d4-0c33-46d6-84b9-8461bcb3177a',''),('webAuthnPolicyRpIdPasswordless','2eabb7d4-0c33-46d6-84b9-8461bcb3177a',''),('webAuthnPolicySignatureAlgorithms','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','ES256'),('webAuthnPolicySignatureAlgorithmsPasswordless','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','ES256'),('webAuthnPolicyUserVerificationRequirement','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','not specified'),('webAuthnPolicyUserVerificationRequirementPasswordless','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','not specified'),('_browser_header.contentSecurityPolicy','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),('_browser_header.contentSecurityPolicy','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),('_browser_header.contentSecurityPolicyReportOnly','2eabb7d4-0c33-46d6-84b9-8461bcb3177a',''),('_browser_header.contentSecurityPolicyReportOnly','d22d3c39-cfbc-4bb2-99cd-9761f6004a33',''),('_browser_header.strictTransportSecurity','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','max-age=31536000; includeSubDomains'),('_browser_header.strictTransportSecurity','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','max-age=31536000; includeSubDomains'),('_browser_header.xContentTypeOptions','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','nosniff'),('_browser_header.xContentTypeOptions','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','nosniff'),('_browser_header.xFrameOptions','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','SAMEORIGIN'),('_browser_header.xFrameOptions','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','SAMEORIGIN'),('_browser_header.xRobotsTag','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','none'),('_browser_header.xRobotsTag','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','none'),('_browser_header.xXSSProtection','2eabb7d4-0c33-46d6-84b9-8461bcb3177a','1; mode=block'),('_browser_header.xXSSProtection','d22d3c39-cfbc-4bb2-99cd-9761f6004a33','1; mode=block');
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_DEFAULT_GROUPS`
--

DROP TABLE IF EXISTS `REALM_DEFAULT_GROUPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_DEFAULT_GROUPS` (
  `REALM_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`GROUP_ID`),
  UNIQUE KEY `CON_GROUP_ID_DEF_GROUPS` (`GROUP_ID`),
  KEY `IDX_REALM_DEF_GRP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_DEF_GROUPS_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_DEFAULT_GROUPS`
--

LOCK TABLES `REALM_DEFAULT_GROUPS` WRITE;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ENABLED_EVENT_TYPES`
--

DROP TABLE IF EXISTS `REALM_ENABLED_EVENT_TYPES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_ENABLED_EVENT_TYPES` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_TYPES_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NWEDRF5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ENABLED_EVENT_TYPES`
--

LOCK TABLES `REALM_ENABLED_EVENT_TYPES` WRITE;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_EVENTS_LISTENERS`
--

DROP TABLE IF EXISTS `REALM_EVENTS_LISTENERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_EVENTS_LISTENERS` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_LIST_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NXEV9F5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_EVENTS_LISTENERS`
--

LOCK TABLES `REALM_EVENTS_LISTENERS` WRITE;
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` DISABLE KEYS */;
INSERT INTO `REALM_EVENTS_LISTENERS` VALUES ('2eabb7d4-0c33-46d6-84b9-8461bcb3177a','jboss-logging'),('d22d3c39-cfbc-4bb2-99cd-9761f6004a33','jboss-logging');
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_LOCALIZATIONS`
--

DROP TABLE IF EXISTS `REALM_LOCALIZATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_LOCALIZATIONS` (
  `REALM_ID` varchar(255) NOT NULL,
  `LOCALE` varchar(255) NOT NULL,
  `TEXTS` longtext NOT NULL,
  PRIMARY KEY (`REALM_ID`,`LOCALE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_LOCALIZATIONS`
--

LOCK TABLES `REALM_LOCALIZATIONS` WRITE;
/*!40000 ALTER TABLE `REALM_LOCALIZATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_LOCALIZATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_REQUIRED_CREDENTIAL`
--

DROP TABLE IF EXISTS `REALM_REQUIRED_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_REQUIRED_CREDENTIAL` (
  `TYPE` varchar(255) NOT NULL,
  `FORM_LABEL` varchar(255) DEFAULT NULL,
  `INPUT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`TYPE`),
  CONSTRAINT `FK_5HG65LYBEVAVKQFKI3KPONH9V` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_REQUIRED_CREDENTIAL`
--

LOCK TABLES `REALM_REQUIRED_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` DISABLE KEYS */;
INSERT INTO `REALM_REQUIRED_CREDENTIAL` VALUES ('password','password',_binary '',_binary '','2eabb7d4-0c33-46d6-84b9-8461bcb3177a'),('password','password',_binary '',_binary '','d22d3c39-cfbc-4bb2-99cd-9761f6004a33');
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SMTP_CONFIG`
--

DROP TABLE IF EXISTS `REALM_SMTP_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_SMTP_CONFIG` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`NAME`),
  CONSTRAINT `FK_70EJ8XDXGXD0B9HH6180IRR0O` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SMTP_CONFIG`
--

LOCK TABLES `REALM_SMTP_CONFIG` WRITE;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SUPPORTED_LOCALES`
--

DROP TABLE IF EXISTS `REALM_SUPPORTED_LOCALES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_SUPPORTED_LOCALES` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_SUPP_LOCAL_REALM` (`REALM_ID`),
  CONSTRAINT `FK_SUPPORTED_LOCALES_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SUPPORTED_LOCALES`
--

LOCK TABLES `REALM_SUPPORTED_LOCALES` WRITE;
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REDIRECT_URIS`
--

DROP TABLE IF EXISTS `REDIRECT_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REDIRECT_URIS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_REDIR_URI_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_1BURS8PB4OUJ97H5WUPPAHV9F` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REDIRECT_URIS`
--

LOCK TABLES `REDIRECT_URIS` WRITE;
/*!40000 ALTER TABLE `REDIRECT_URIS` DISABLE KEYS */;
INSERT INTO `REDIRECT_URIS` VALUES ('008382ce-2097-4f94-a588-2e1701dfe0aa','/realms/cinema/account/*'),('2bb6fb5c-745e-43f9-9086-6cbd0f202106','/realms/master/account/*'),('5feb6c4a-2ec7-403b-99e1-97b6f9e4aa7a','/admin/master/console/*'),('666e1ac8-1776-419b-930f-462940887496','/realms/cinema/account/*'),('c3e522a9-5bf4-47d7-888e-ae8fe7b88049','/admin/cinema/console/*'),('c9ae182b-0344-4d9c-80a9-af90e8a91e0a','/realms/master/account/*');
/*!40000 ALTER TABLE `REDIRECT_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_CONFIG`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIRED_ACTION_CONFIG` (
  `REQUIRED_ACTION_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REQUIRED_ACTION_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_CONFIG`
--

LOCK TABLES `REQUIRED_ACTION_CONFIG` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_PROVIDER`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIRED_ACTION_PROVIDER` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_ACTION` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_REQ_ACT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_REQ_ACT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_PROVIDER`
--

LOCK TABLES `REQUIRED_ACTION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` DISABLE KEYS */;
INSERT INTO `REQUIRED_ACTION_PROVIDER` VALUES ('19ed97f8-417e-40a0-8ea7-5ecff953208c','delete_account','Delete Account','d22d3c39-cfbc-4bb2-99cd-9761f6004a33',_binary '\0',_binary '\0','delete_account',60),('1f7591f2-3068-4c11-a55f-ee8441f79503','CONFIGURE_TOTP','Configure OTP','d22d3c39-cfbc-4bb2-99cd-9761f6004a33',_binary '',_binary '\0','CONFIGURE_TOTP',10),('32537868-8a6f-4d45-94b8-965533b821e9','UPDATE_PASSWORD','Update Password','d22d3c39-cfbc-4bb2-99cd-9761f6004a33',_binary '',_binary '\0','UPDATE_PASSWORD',30),('4d294d94-9d6f-4c4d-900b-e1fa44075e8f','webauthn-register-passwordless','Webauthn Register Passwordless','d22d3c39-cfbc-4bb2-99cd-9761f6004a33',_binary '',_binary '\0','webauthn-register-passwordless',80),('617530b7-bbd2-4f9f-943e-b7424a9437c5','webauthn-register','Webauthn Register','2eabb7d4-0c33-46d6-84b9-8461bcb3177a',_binary '',_binary '\0','webauthn-register',70),('71e68606-5393-4851-868c-d5c41aed3637','UPDATE_PROFILE','Update Profile','2eabb7d4-0c33-46d6-84b9-8461bcb3177a',_binary '',_binary '\0','UPDATE_PROFILE',40),('77038075-8078-4bcb-a7f5-1fdfd23866e8','UPDATE_PROFILE','Update Profile','d22d3c39-cfbc-4bb2-99cd-9761f6004a33',_binary '',_binary '\0','UPDATE_PROFILE',40),('7ca104ad-c65f-4b6c-84f3-63dbb0955aee','update_user_locale','Update User Locale','2eabb7d4-0c33-46d6-84b9-8461bcb3177a',_binary '',_binary '\0','update_user_locale',1000),('7fb70bd3-8b20-49fe-8969-4741790edf2d','webauthn-register','Webauthn Register','d22d3c39-cfbc-4bb2-99cd-9761f6004a33',_binary '',_binary '\0','webauthn-register',70),('83f27ec1-f3e5-4847-ab73-a8e59d137029','delete_account','Delete Account','2eabb7d4-0c33-46d6-84b9-8461bcb3177a',_binary '\0',_binary '\0','delete_account',60),('99d9a910-a34a-48ea-8811-7e6b2c08014e','update_user_locale','Update User Locale','d22d3c39-cfbc-4bb2-99cd-9761f6004a33',_binary '',_binary '\0','update_user_locale',1000),('a3a2d256-a749-4b27-99f6-9ed48b56ed20','terms_and_conditions','Terms and Conditions','2eabb7d4-0c33-46d6-84b9-8461bcb3177a',_binary '\0',_binary '\0','terms_and_conditions',20),('a62feda1-c31d-4c09-b0d3-fe5ab6c654cc','VERIFY_EMAIL','Verify Email','d22d3c39-cfbc-4bb2-99cd-9761f6004a33',_binary '',_binary '\0','VERIFY_EMAIL',50),('afbfa84a-48c9-4ea0-8253-893911eb5f11','VERIFY_EMAIL','Verify Email','2eabb7d4-0c33-46d6-84b9-8461bcb3177a',_binary '',_binary '\0','VERIFY_EMAIL',50),('b820fb4b-c0bf-4317-95ab-258495e7000a','CONFIGURE_TOTP','Configure OTP','2eabb7d4-0c33-46d6-84b9-8461bcb3177a',_binary '',_binary '\0','CONFIGURE_TOTP',10),('ce13b030-e838-4400-8c40-692f2bfd9f6e','webauthn-register-passwordless','Webauthn Register Passwordless','2eabb7d4-0c33-46d6-84b9-8461bcb3177a',_binary '',_binary '\0','webauthn-register-passwordless',80),('e1a9baa8-370a-4afd-a493-f1fb70e85f8f','terms_and_conditions','Terms and Conditions','d22d3c39-cfbc-4bb2-99cd-9761f6004a33',_binary '\0',_binary '\0','terms_and_conditions',20),('f1ea813b-b2b6-4ed8-ab70-ffde5d30566c','UPDATE_PASSWORD','Update Password','2eabb7d4-0c33-46d6-84b9-8461bcb3177a',_binary '',_binary '\0','UPDATE_PASSWORD',30);
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `RESOURCE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `RESOURCE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_5HRM2VLF9QL5FU022KQEPOVBR` (`RESOURCE_ID`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU022KQEPOVBR` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_ATTRIBUTE`
--

LOCK TABLES `RESOURCE_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_POLICY` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`POLICY_ID`),
  KEY `IDX_RES_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRPOS53XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRPP213XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_POLICY`
--

LOCK TABLES `RESOURCE_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SCOPE` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`SCOPE_ID`),
  KEY `IDX_RES_SCOPE_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_FRSRPOS13XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRPS213XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SCOPE`
--

LOCK TABLES `RESOURCE_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER` (
  `ID` varchar(36) NOT NULL,
  `ALLOW_RS_REMOTE_MGMT` bit(1) NOT NULL DEFAULT b'0',
  `POLICY_ENFORCE_MODE` varchar(15) NOT NULL,
  `DECISION_STRATEGY` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER`
--

LOCK TABLES `RESOURCE_SERVER` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_PERM_TICKET`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_PERM_TICKET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_PERM_TICKET` (
  `ID` varchar(36) NOT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  `REQUESTER` varchar(255) DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint(20) NOT NULL,
  `GRANTED_TIMESTAMP` bigint(20) DEFAULT NULL,
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5PMT` (`OWNER`,`REQUESTER`,`RESOURCE_SERVER_ID`,`RESOURCE_ID`,`SCOPE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG82SSPMT` (`RESOURCE_SERVER_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG83SSPMT` (`RESOURCE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG84SSPMT` (`SCOPE_ID`),
  KEY `FK_FRSRPO2128CX4WNKOG82SSRFY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSPMT` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG83SSPMT` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG84SSPMT` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`),
  CONSTRAINT `FK_FRSRPO2128CX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_PERM_TICKET`
--

LOCK TABLES `RESOURCE_SERVER_PERM_TICKET` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_POLICY` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `TYPE` varchar(255) NOT NULL,
  `DECISION_STRATEGY` varchar(20) DEFAULT NULL,
  `LOGIC` varchar(20) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRPT700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SERV_POL_RES_SERV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRPO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_POLICY`
--

LOCK TABLES `RESOURCE_SERVER_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_RESOURCE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_RESOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_RESOURCE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `OWNER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5HA6` (`NAME`,`OWNER`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_RES_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_RESOURCE`
--

LOCK TABLES `RESOURCE_SERVER_RESOURCE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_SCOPE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRST700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_SCOPE_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRSO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_SCOPE`
--

LOCK TABLES `RESOURCE_SERVER_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_URIS`
--

DROP TABLE IF EXISTS `RESOURCE_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_URIS` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`VALUE`),
  CONSTRAINT `FK_RESOURCE_SERVER_URIS` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_URIS`
--

LOCK TABLES `RESOURCE_URIS` WRITE;
/*!40000 ALTER TABLE `RESOURCE_URIS` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROLE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `ROLE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ROLE_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ROLE_ATTRIBUTE` (`ROLE_ID`),
  CONSTRAINT `FK_ROLE_ATTRIBUTE_ID` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROLE_ATTRIBUTE`
--

LOCK TABLES `ROLE_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_MAPPING`
--

DROP TABLE IF EXISTS `SCOPE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SCOPE_MAPPING` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`ROLE_ID`),
  KEY `IDX_SCOPE_MAPPING_ROLE` (`ROLE_ID`),
  CONSTRAINT `FK_OUSE064PLMLR732LXJCN1Q5F1` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_MAPPING`
--

LOCK TABLES `SCOPE_MAPPING` WRITE;
/*!40000 ALTER TABLE `SCOPE_MAPPING` DISABLE KEYS */;
INSERT INTO `SCOPE_MAPPING` VALUES ('666e1ac8-1776-419b-930f-462940887496','88f424a2-f016-44e9-b1c9-fa2a5bc25c68'),('c9ae182b-0344-4d9c-80a9-af90e8a91e0a','ec079f44-da93-4f73-8db4-a52ae08b7ad1');
/*!40000 ALTER TABLE `SCOPE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_POLICY`
--

DROP TABLE IF EXISTS `SCOPE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SCOPE_POLICY` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`POLICY_ID`),
  KEY `IDX_SCOPE_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRASP13XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPASS3XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_POLICY`
--

LOCK TABLES `SCOPE_POLICY` WRITE;
/*!40000 ALTER TABLE `SCOPE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `SCOPE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USERNAME_LOGIN_FAILURE`
--

DROP TABLE IF EXISTS `USERNAME_LOGIN_FAILURE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USERNAME_LOGIN_FAILURE` (
  `REALM_ID` varchar(36) NOT NULL,
  `USERNAME` varchar(255) NOT NULL,
  `FAILED_LOGIN_NOT_BEFORE` int(11) DEFAULT NULL,
  `LAST_FAILURE` bigint(20) DEFAULT NULL,
  `LAST_IP_FAILURE` varchar(255) DEFAULT NULL,
  `NUM_FAILURES` int(11) DEFAULT NULL,
  PRIMARY KEY (`REALM_ID`,`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERNAME_LOGIN_FAILURE`
--

LOCK TABLES `USERNAME_LOGIN_FAILURE` WRITE;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ATTRIBUTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_ATTRIBUTE` (`USER_ID`),
  KEY `IDX_USER_ATTRIBUTE_NAME` (`NAME`,`VALUE`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU043KQEPOVBR` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ATTRIBUTE`
--

LOCK TABLES `USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `USER_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT`
--

DROP TABLE IF EXISTS `USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_CONSENT` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint(20) DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_JKUWUVD56ONTGSUHOGM8UEWRT` (`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`USER_ID`),
  KEY `IDX_USER_CONSENT` (`USER_ID`),
  CONSTRAINT `FK_GRNTCSNT_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT`
--

LOCK TABLES `USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `USER_CONSENT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_CONSENT_CLIENT_SCOPE` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`),
  KEY `IDX_USCONSENT_CLSCOPE` (`USER_CONSENT_ID`),
  CONSTRAINT `FK_GRNTCSNT_CLSC_USC` FOREIGN KEY (`USER_CONSENT_ID`) REFERENCES `USER_CONSENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT_CLIENT_SCOPE`
--

LOCK TABLES `USER_CONSENT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ENTITY`
--

DROP TABLE IF EXISTS `USER_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `EMAIL_CONSTRAINT` varchar(255) DEFAULT NULL,
  `EMAIL_VERIFIED` bit(1) NOT NULL DEFAULT b'0',
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FEDERATION_LINK` varchar(255) DEFAULT NULL,
  `FIRST_NAME` varchar(255) DEFAULT NULL,
  `LAST_NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint(20) DEFAULT NULL,
  `SERVICE_ACCOUNT_CLIENT_LINK` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_DYKN684SL8UP1CRFEI6ECKHD7` (`REALM_ID`,`EMAIL_CONSTRAINT`),
  UNIQUE KEY `UK_RU8TT6T700S9V50BU18WS5HA6` (`REALM_ID`,`USERNAME`),
  KEY `IDX_USER_EMAIL` (`EMAIL`),
  KEY `IDX_USER_SERVICE_ACCOUNT` (`REALM_ID`,`SERVICE_ACCOUNT_CLIENT_LINK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ENTITY`
--

LOCK TABLES `USER_ENTITY` WRITE;
/*!40000 ALTER TABLE `USER_ENTITY` DISABLE KEYS */;
INSERT INTO `USER_ENTITY` VALUES ('c2d25e5d-fffc-4b00-aadf-8eceb1f51b2b',NULL,'dc735183-7c94-46bf-aae5-3c73a8d8c377',_binary '\0',_binary '',NULL,NULL,NULL,'d22d3c39-cfbc-4bb2-99cd-9761f6004a33','admin',1703014794934,NULL,0),('ecf9eb4e-6259-4bdd-89f9-a5ea1e5648c4',NULL,'f929f0ab-6ca7-4dde-88eb-dd4f00ffa9f2',_binary '\0',_binary '',NULL,NULL,NULL,'2eabb7d4-0c33-46d6-84b9-8461bcb3177a','service-account-cinema-api',1703014850816,'d5bb52e7-dda5-4bc6-82df-e78da0f9a622',0);
/*!40000 ALTER TABLE `USER_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_CONFIG` (
  `USER_FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FK_T13HPU1J94R2EBPEKR39X5EU5` FOREIGN KEY (`USER_FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_CONFIG`
--

LOCK TABLES `USER_FEDERATION_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `FEDERATION_MAPPER_TYPE` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_MAP_FED_PRV` (`FEDERATION_PROVIDER_ID`),
  KEY `IDX_USR_FED_MAP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_FEDMAPPERPM_FEDPRV` FOREIGN KEY (`FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`),
  CONSTRAINT `FK_FEDMAPPERPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER`
--

LOCK TABLES `USER_FEDERATION_MAPPER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_MAPPER_CONFIG` (
  `USER_FEDERATION_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_FEDMAPPER_CFG` FOREIGN KEY (`USER_FEDERATION_MAPPER_ID`) REFERENCES `USER_FEDERATION_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER_CONFIG`
--

LOCK TABLES `USER_FEDERATION_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_PROVIDER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_PROVIDER` (
  `ID` varchar(36) NOT NULL,
  `CHANGED_SYNC_PERIOD` int(11) DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `FULL_SYNC_PERIOD` int(11) DEFAULT NULL,
  `LAST_SYNC` int(11) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `PROVIDER_NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_PRV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_1FJ32F6PTOLW2QY60CD8N01E8` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_PROVIDER`
--

LOCK TABLES `USER_FEDERATION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_USER_GROUP_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_USER_GROUP_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_REQUIRED_ACTION` (
  `USER_ID` varchar(36) NOT NULL,
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_USER_REQACTIONS` (`USER_ID`),
  CONSTRAINT `FK_6QJ3W1JW9CVAFHE19BWSIUVMD` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_REQUIRED_ACTION`
--

LOCK TABLES `USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(255) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_USER_ROLE_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_C4FQV34P1MBYLLOXANG7B1Q3L` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ROLE_MAPPING`
--

LOCK TABLES `USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `USER_ROLE_MAPPING` VALUES ('2056d0e0-1b9f-429d-9276-13a6451a4cbd','c2d25e5d-fffc-4b00-aadf-8eceb1f51b2b'),('251872a5-3bc6-4834-b1b5-b6732f47a0ba','c2d25e5d-fffc-4b00-aadf-8eceb1f51b2b'),('56dc331d-5454-424d-876b-415b3673cde6','c2d25e5d-fffc-4b00-aadf-8eceb1f51b2b'),('78c6f0ba-871f-4327-99f3-33474a9d5906','c2d25e5d-fffc-4b00-aadf-8eceb1f51b2b'),('8c602de5-1f98-449a-b14d-1195dab3859f','c2d25e5d-fffc-4b00-aadf-8eceb1f51b2b'),('8e9baa8b-8f4a-4495-8d7e-bf1c36f7f5a6','c2d25e5d-fffc-4b00-aadf-8eceb1f51b2b'),('96fd5d78-b4ba-4b0a-9163-a5e9fd81275a','c2d25e5d-fffc-4b00-aadf-8eceb1f51b2b'),('990c4773-d8da-450e-b4ec-e8f9ab40db25','c2d25e5d-fffc-4b00-aadf-8eceb1f51b2b'),('a66b6d41-0cd2-4183-9e3f-5b07df8042bc','c2d25e5d-fffc-4b00-aadf-8eceb1f51b2b'),('b55687e5-441e-4ccb-81d0-3a82e14a83b8','c2d25e5d-fffc-4b00-aadf-8eceb1f51b2b'),('c31cf313-7813-4bd5-8a09-8f1a41a4ac04','c2d25e5d-fffc-4b00-aadf-8eceb1f51b2b'),('c5672fed-1d66-4d00-9013-65e84ee35767','c2d25e5d-fffc-4b00-aadf-8eceb1f51b2b'),('cec51ad7-dbe5-46e6-8f0f-a45655d6d791','c2d25e5d-fffc-4b00-aadf-8eceb1f51b2b'),('d12eb93f-3812-417e-9f85-91f060d54b8d','c2d25e5d-fffc-4b00-aadf-8eceb1f51b2b'),('da901236-8ca4-4dca-b1ec-90ce28ebecb2','c2d25e5d-fffc-4b00-aadf-8eceb1f51b2b'),('dd8ebd9b-e288-40e9-9765-fda43e5ccbf4','c2d25e5d-fffc-4b00-aadf-8eceb1f51b2b'),('ee22a5dc-46cc-4f58-aa14-468d55c151e6','c2d25e5d-fffc-4b00-aadf-8eceb1f51b2b'),('fb76bc1e-25e6-431d-9ccd-203537ea2eee','c2d25e5d-fffc-4b00-aadf-8eceb1f51b2b'),('fec9d6c2-2b35-4f85-a7e1-a42707c079b2','c2d25e5d-fffc-4b00-aadf-8eceb1f51b2b'),('1bf2faf2-b855-4d85-854a-67ef05c5fb7e','ecf9eb4e-6259-4bdd-89f9-a5ea1e5648c4'),('29a38910-88af-4029-a576-a532e63985f5','ecf9eb4e-6259-4bdd-89f9-a5ea1e5648c4'),('3d29462c-2263-4195-acb9-3f74d8504881','ecf9eb4e-6259-4bdd-89f9-a5ea1e5648c4'),('7c48afea-d98b-4cb1-bf35-1f95a49d452c','ecf9eb4e-6259-4bdd-89f9-a5ea1e5648c4'),('cc56e898-b4b6-4fcd-a6d8-f61adefb7d01','ecf9eb4e-6259-4bdd-89f9-a5ea1e5648c4'),('e50fbbc9-e1cf-4d7e-bf83-5b5c1257e9bf','ecf9eb4e-6259-4bdd-89f9-a5ea1e5648c4');
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SESSION`
--

DROP TABLE IF EXISTS `USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_SESSION` (
  `ID` varchar(36) NOT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `LAST_SESSION_REFRESH` int(11) DEFAULT NULL,
  `LOGIN_USERNAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `STARTED` int(11) DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `USER_SESSION_STATE` int(11) DEFAULT NULL,
  `BROKER_SESSION_ID` varchar(255) DEFAULT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION`
--

LOCK TABLES `USER_SESSION` WRITE;
/*!40000 ALTER TABLE `USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_SESSION_NOTE` (
  `USER_SESSION` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`USER_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51D3472` FOREIGN KEY (`USER_SESSION`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION_NOTE`
--

LOCK TABLES `USER_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WEB_ORIGINS`
--

DROP TABLE IF EXISTS `WEB_ORIGINS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WEB_ORIGINS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_WEB_ORIG_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_LOJPHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WEB_ORIGINS`
--

LOCK TABLES `WEB_ORIGINS` WRITE;
/*!40000 ALTER TABLE `WEB_ORIGINS` DISABLE KEYS */;
INSERT INTO `WEB_ORIGINS` VALUES ('5feb6c4a-2ec7-403b-99e1-97b6f9e4aa7a','+'),('c3e522a9-5bf4-47d7-888e-ae8fe7b88049','+');
/*!40000 ALTER TABLE `WEB_ORIGINS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-19 16:47:01
