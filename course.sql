/*
SQLyog Ultimate v11.27 (32 bit)
MySQL - 5.6.24 : Database - hibernate_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`hibernate_db` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `hibernate_db`;

/*Table structure for table `hibernate_sequence` */

DROP TABLE IF EXISTS `hibernate_sequence`;

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `hibernate_sequence` */

insert  into `hibernate_sequence`(`next_val`) values (3);

/*Table structure for table `loginuser` */

DROP TABLE IF EXISTS `loginuser`;

CREATE TABLE `loginuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `loginName` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `roleId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1h0wi4jajqm6pmol9r6sxuadd` (`roleId`),
  CONSTRAINT `FK1h0wi4jajqm6pmol9r6sxuadd` FOREIGN KEY (`roleId`) REFERENCES `role` (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `loginuser` */

insert  into `loginuser`(`id`,`email`,`loginName`,`password`,`roleId`) values (8,'999@qq.com','1234','1234',21),(9,'123@qq.com','123','123',23),(14,'123@qq.com','jack','123',25);

/*Table structure for table `menu` */

DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
  `menuId` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  `menuName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`menuId`),
  KEY `FKbfc1llceenf99rg3fybss8u77` (`parentId`),
  CONSTRAINT `FKbfc1llceenf99rg3fybss8u77` FOREIGN KEY (`parentId`) REFERENCES `menu` (`menuId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `menu` */

insert  into `menu`(`menuId`,`url`,`parentId`,`menuName`) values (4,'role/listUI.do',5,'角色管理'),(5,'***',NULL,'后台管理'),(6,'user/listUI.do',5,'用户管理'),(7,'menu/listUI.do',5,'菜单管理'),(8,'power/listUI.do',5,'权限管理'),(9,'**',NULL,'产品业务'),(10,'product/listUI.do',9,'产品管理');

/*Table structure for table `power` */

DROP TABLE IF EXISTS `power`;

CREATE TABLE `power` (
  `powerId` int(11) NOT NULL AUTO_INCREMENT,
  `menuId` int(11) DEFAULT NULL,
  `powerName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`powerId`),
  KEY `FKjo1jbrfeam6qp8fwon37mvif9` (`menuId`),
  CONSTRAINT `FKjo1jbrfeam6qp8fwon37mvif9` FOREIGN KEY (`menuId`) REFERENCES `menu` (`menuId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `power` */

insert  into `power`(`powerId`,`menuId`,`powerName`) values (4,6,'删改用户'),(5,4,'更改角色'),(8,7,'更改菜单'),(9,8,'更改权限'),(10,10,'更改产品');

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `productId` int(11) NOT NULL AUTO_INCREMENT,
  `price` int(11) DEFAULT NULL,
  `productName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`productId`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

/*Data for the table `product` */

insert  into `product`(`productId`,`price`,`productName`) values (30,1,'鸡蛋'),(31,222,'牛奶'),(32,20,'饼干'),(33,10,'可乐'),(34,100,'运动鞋'),(35,30,'测试用1'),(36,NULL,'测试用1'),(37,NULL,'测试用1'),(48,222,'地方'),(49,123,'海水'),(50,333,'二维码');

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `roleId` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

/*Data for the table `role` */

insert  into `role`(`roleId`,`roleName`) values (21,'管理员'),(23,'普通'),(25,'全部');

/*Table structure for table `rolepowerall` */

DROP TABLE IF EXISTS `rolepowerall`;

CREATE TABLE `rolepowerall` (
  `roleId` int(11) NOT NULL,
  `powerId` int(11) NOT NULL,
  PRIMARY KEY (`roleId`,`powerId`),
  KEY `FKk7f7co2k8vm2hb1ahcpt9y7l4` (`powerId`),
  CONSTRAINT `FK1530wticgnemb549fdno1wpo8` FOREIGN KEY (`roleId`) REFERENCES `role` (`roleId`),
  CONSTRAINT `FKk7f7co2k8vm2hb1ahcpt9y7l4` FOREIGN KEY (`powerId`) REFERENCES `power` (`powerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `rolepowerall` */

insert  into `rolepowerall`(`roleId`,`powerId`) values (21,4),(25,4),(21,5),(25,5),(21,8),(25,8),(21,9),(25,9),(23,10),(25,10);

/*Table structure for table `userinfo` */

DROP TABLE IF EXISTS `userinfo`;

CREATE TABLE `userinfo` (
  `id` int(11) NOT NULL,
  `birthday` date DEFAULT NULL,
  `realName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `userinfo` */

insert  into `userinfo`(`id`,`birthday`,`realName`) values (8,'2016-10-19','管理员A'),(9,'2016-11-03','员工01'),(14,'2016-09-28','jack');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
