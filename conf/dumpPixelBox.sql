-- MySQL dump 10.13  Distrib 8.0.20, for macos10.15 (x86_64)
--
-- Host: localhost    Database: csc317db
-- ------------------------------------------------------
-- Server version	8.0.23

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


use heroku_98a05bc21c9369f

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comment` varchar(128) NOT NULL,
  `created` datetime NOT NULL,
  `fk_userid` int NOT NULL,
  `fk_postid` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_userid_idx` (`fk_userid`),
  KEY `fk_postid_idx` (`fk_postid`),
  CONSTRAINT `fk_postid` FOREIGN KEY (`fk_postid`) REFERENCES `posts` (`id`),
  CONSTRAINT `fk_userid` FOREIGN KEY (`fk_userid`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'I have a dog like yours!!','2020-05-19 23:08:26',32,41),(2,'Where did you take this picture?!?','2020-05-19 23:46:54',32,41),(3,'I love your dog','2020-05-19 23:48:39',32,41),(4,'My Grandpa owns a van like this!','2020-05-20 00:29:58',32,21),(9,'What camera did you use?','2020-05-20 00:31:27',32,21),(10,'Where was this taken?','2020-05-20 02:37:21',32,18),(11,'is it hungry','2020-05-20 02:41:52',32,18),(35,'i have nothing in mind','2020-05-20 12:18:25',32,15);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `description` varchar(4096) NOT NULL,
  `photopath` varchar(4096) NOT NULL,
  `thumbnail` varchar(4096) NOT NULL,
  `active` int NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `fk_userid` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `posts to users_idx` (`fk_userid`),
  CONSTRAINT `posts to users` FOREIGN KEY (`fk_userid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'Camera Girl','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ','public/images/uploads/90e394097ab431621d2e4406912770d3b2c0480d6f77.jpeg','public/images/uploads/thumbnail-90e394097ab431621d2e4406912770d3b2c0480d6f77.jpeg',0,'2020-05-19 04:12:10',1),(2,'Camping Nights','Mi proin sed libero enim sed faucibus turpis. Justo eget magna fermentum iaculis eu non diam phasellus. Ultrices vitae auctor eu augue ut lectus arcu bibendum at. ','public/images/uploads/31e564a236ff14b2137d5c252ebc9c6cce86a43c338e.jpeg','public/images/uploads/thumbnail-31e564a236ff14b2137d5c252ebc9c6cce86a43c338e.jpeg',0,'2020-05-19 04:12:52',1),(3,'Deer','Amet massa vitae tortor condimentum lacinia quis vel eros. Massa sed elementum tempus egestas sed sed risus pretium.','public/images/uploads/c00039fe71223bf1e1908e9f33284e7233b9ac339da9.jpeg','public/images/uploads/thumbnail-c00039fe71223bf1e1908e9f33284e7233b9ac339da9.jpeg',0,'2020-05-19 04:13:37',1),(4,'Dust Pine Tree','Orci nulla pellentesque dignissim enim sit. Mauris pharetra et ultrices neque ornare aenean euismod. Eu facilisis sed odio morbi.','public/images/uploads/435ee0498221b548fbc1edc50e9149fa8a6da32bde55.jpeg','public/images/uploads/thumbnail-435ee0498221b548fbc1edc50e9149fa8a6da32bde55.jpeg',0,'2020-05-19 04:14:06',1),(5,'Foggy Mountain','Nunc faucibus a pellentesque sit amet porttitor eget.','public/images/uploads/977f24a6d76a0396fbf65f2c5fac6e09b332e2c93af0.jpeg','public/images/uploads/thumbnail-977f24a6d76a0396fbf65f2c5fac6e09b332e2c93af0.jpeg',0,'2020-05-19 04:14:33',1),(6,'Hawaiian Nature','Vulputate ut pharetra sit amet aliquam id diam. Amet nisl purus in mollis nunc sed id. Lorem mollis aliquam ut porttitor leo a diam sollicitudin.','public/images/uploads/877fc5c849c532ee7e7f111021d77c929c7366c0becf.jpeg','public/images/uploads/thumbnail-877fc5c849c532ee7e7f111021d77c929c7366c0becf.jpeg',0,'2020-05-19 04:15:13',1),(7,'Hike','Purus semper eget duis at tellus at urna. Consectetur adipiscing elit duis tristique sollicitudin nibh sit amet commodo.','public/images/uploads/72c54a91527eece093e604e6edd7b2e06d31a69096d8.jpeg','public/images/uploads/thumbnail-72c54a91527eece093e604e6edd7b2e06d31a69096d8.jpeg',0,'2020-05-19 04:15:32',1),(8,'Hot Air Balloon','Mi ipsum faucibus vitae aliquet nec ullamcorper sit. Nulla porttitor massa id neque aliquam vestibulum morbi. Placerat vestibulum lectus mauris ultrices eros.','public/images/uploads/884761aa2431f707c936dff662d068186662479ce46e.jpeg','public/images/uploads/thumbnail-884761aa2431f707c936dff662d068186662479ce46e.jpeg',0,'2020-05-19 04:16:00',1),(9,'Jeep','Duis ultricies lacus sed turpis tincidunt id aliquet risus feugiat. Ipsum dolor sit amet consectetur adipiscing.','public/images/uploads/17efc4a2e71a0916983992dbd9071f58f22bbf55d621.jpeg','public/images/uploads/thumbnail-17efc4a2e71a0916983992dbd9071f58f22bbf55d621.jpeg',0,'2020-05-19 04:16:47',1),(10,'Landscape','Blandit volutpat maecenas volutpat blandit aliquam etiam erat velit. Faucibus nisl tincidunt eget nullam non. Tristique sollicitudin nibh sit amet commodo nulla facilisi nullam vehicula. Congue quisque egestas diam in arcu cursus euismod quis.','public/images/uploads/bac6832dbe5f8de9740abf7792ede3bf49d628442113.jpeg','public/images/uploads/thumbnail-bac6832dbe5f8de9740abf7792ede3bf49d628442113.jpeg',0,'2020-05-19 04:18:04',1),(11,'Majestic','Est ante in nibh mauris cursus mattis molestie. Nisl rhoncus mattis rhoncus urna neque viverra. ','public/images/uploads/0f13abafeda8f54f5e9c17d207b620fa312cd2acd0d3.jpeg','public/images/uploads/thumbnail-0f13abafeda8f54f5e9c17d207b620fa312cd2acd0d3.jpeg',0,'2020-05-19 04:18:31',1),(12,'National Park','Turpis massa sed elementum tempus egestas sed sed. Placerat orci nulla pellentesque dignissim enim sit. Nullam vehicula ipsum a arcu cursus vitae. Ullamcorper morbi tincidunt ornare massa eget.','public/images/uploads/f9857fa89200f066dd3888000a603ea72ef2136829c9.jpeg','public/images/uploads/thumbnail-f9857fa89200f066dd3888000a603ea72ef2136829c9.jpeg',0,'2020-05-19 04:19:32',1),(13,'Ocean Beach','Ut venenatis tellus in metus. Ultrices sagittis orci a scelerisque purus semper eget duis at.','public/images/uploads/fb51df3989da8c9fe97b3d7fd7731c8aa0b575b69fd4.jpeg','public/images/uploads/thumbnail-fb51df3989da8c9fe97b3d7fd7731c8aa0b575b69fd4.jpeg',0,'2020-05-19 04:20:22',1),(14,'Outdoor Nature','Id leo in vitae turpis massa sed elementum tempus egestas. In metus vulputate eu scelerisque felis imperdiet. Sapien faucibus et molestie ac. Tincidunt dui ut ornare lectus. Metus vulputate eu scelerisque felis.','public/images/uploads/30821079bc2c9f0584c0ae2c30ca1d93ee7d6e7c19b2.jpeg','public/images/uploads/thumbnail-30821079bc2c9f0584c0ae2c30ca1d93ee7d6e7c19b2.jpeg',0,'2020-05-19 04:20:45',1),(15,'Pineapple Grass','Tempor id eu nisl nunc mi ipsum faucibus. A scelerisque purus semper eget duis at tellus at urna.','public/images/uploads/d8e536f83f5ceffcaf52e7ecd924c42461423d99d3ac.jpeg','public/images/uploads/thumbnail-d8e536f83f5ceffcaf52e7ecd924c42461423d99d3ac.jpeg',0,'2020-05-19 04:21:06',1),(16,'Road','Commodo ullamcorper a lacus vestibulum sed arcu non odio. Mauris cursus mattis molestie a iaculis. Tristique risus nec feugiat in fermentum posuere. Id velit ut tortor pretium.','public/images/uploads/91dd78322d836ca34074c851e4ac170a4fb365800bdc.jpeg','public/images/uploads/thumbnail-91dd78322d836ca34074c851e4ac170a4fb365800bdc.jpeg',0,'2020-05-19 04:21:27',1),(17,'Rocks','At augue eget arcu dictum varius. Tellus rutrum tellus pellentesque eu tincidunt tortor aliquam nulla facilisi.','public/images/uploads/7ca6744d7ad686f065003d31a7ffd2c582486001a5f4.jpeg','public/images/uploads/thumbnail-7ca6744d7ad686f065003d31a7ffd2c582486001a5f4.jpeg',0,'2020-05-19 04:21:47',1),(18,'Seagull','Faucibus et molestie ac feugiat sed lectus vestibulum mattis. Ultrices dui sapien eget mi.','public/images/uploads/f1e09281f0f78dc7ce4db2e34749056b03819b82f044.jpeg','public/images/uploads/thumbnail-f1e09281f0f78dc7ce4db2e34749056b03819b82f044.jpeg',0,'2020-05-19 04:22:10',1),(19,'Skyscraper','Nec feugiat nisl pretium fusce id. Gravida dictum fusce ut placerat orci nulla.','public/images/uploads/3b8379b3124903b5cb824228cf2c3fe73af31726a58d.jpeg','public/images/uploads/thumbnail-3b8379b3124903b5cb824228cf2c3fe73af31726a58d.jpeg',0,'2020-05-19 04:22:36',1),(20,'Vintage Cameras','Blandit massa enim nec dui nunc mattis enim ut tellus. Pellentesque elit eget gravida cum sociis natoque. Magna sit amet purus gravida quis blandit turpis cursus. Sagittis purus sit amet volutpat consequat mauris nunc.','public/images/uploads/b7365348b3402a9ad65c2736d687b908815de8b748c6.jpeg','public/images/uploads/thumbnail-b7365348b3402a9ad65c2736d687b908815de8b748c6.jpeg',0,'2020-05-19 04:23:11',1),(21,'Volkswagen','Sagittis purus sit amet volutpat consequat mauris nunc congue. In fermentum et sollicitudin ac orci phasellus egestas tellus.','public/images/uploads/64df20ec6ee1344dc3f1991a4229a5b6906ea9fe43c5.jpeg','public/images/uploads/thumbnail-64df20ec6ee1344dc3f1991a4229a5b6906ea9fe43c5.jpeg',0,'2020-05-19 04:23:43',1),(41,'Winter Dog','Habitant morbi tristique senectus et netus et. Mi bibendum neque egestas congue quisque egestas.','public/images/uploads/87fd474ac95f93fe8a7e712117b9bd72971871f47674.jpeg','public/images/uploads/thumbnail-87fd474ac95f93fe8a7e712117b9bd72971871f47674.jpeg',0,'2020-05-19 04:24:02',1);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `expires` int unsigned NOT NULL,
  `data` mediumtext CHARACTER SET utf8 COLLATE utf8_bin,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('OTpy2BFySAgzHIrizR5r4tkWoGwVDoCK',1589980945,'{\"cookie\":{\"originalMaxAge\":9000000,\"expires\":\"2020-05-20T13:22:10.031Z\",\"secure\":false,\"httpOnly\":false,\"path\":\"/\"},\"username\":\"Bob33\",\"userID\":32}');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `usertype` int NOT NULL DEFAULT '0',
  `active` int NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Jose97','jose@email.com','$2b$10$ywwxa1CjZlvbYWj2x5LRzum8kXKNTUnIYMQCQ/w6ZFSIgWU9s4WES',0,0,'2020-05-19 03:59:12'),(32,'Bob33','bob@gmail.com','$2b$10$RKxmopCGJYIkIr9vahMs..MKsUxbKK7PsUET62MsKT2cS7jGTNtGy',0,0,'2020-05-19 13:49:48');
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

-- Dump completed on 2022-03-24 23:28:15
