/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.5.27 : Database - reserve
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`reserve` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `reserve`;

/*Table structure for table `dishes` */

DROP TABLE IF EXISTS `dishes`;

CREATE TABLE `dishes` (
  `did` varchar(50) NOT NULL,
  `dname` varchar(20) DEFAULT NULL,
  `price` varchar(10) DEFAULT NULL,
  `wuid` int(11) DEFAULT NULL,
  `num` varchar(10) DEFAULT NULL,
  `suid` int(10) DEFAULT NULL,
  `state` int(11) DEFAULT '0',
  PRIMARY KEY (`did`),
  KEY `dishes_worker_wid_fk` (`wuid`),
  KEY `dishes_student_sid_fk` (`suid`),
  CONSTRAINT `dishes_student_sid_fk` FOREIGN KEY (`suid`) REFERENCES `student` (`sid`),
  CONSTRAINT `dishes_worker_wid_fk` FOREIGN KEY (`wuid`) REFERENCES `worker` (`wid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `dishes` */

insert  into `dishes`(`did`,`dname`,`price`,`wuid`,`num`,`suid`,`state`) values ('04ae92e3514b4d56865e0daa34b05b0f','大块牛肉面','10',1,NULL,194804195,1),('0634c477b5a7466d876201c4d881ddc0','牛肉面','81',1,'1',194804195,1),('06e5076a5c4848a3971956d5a46f5a60','大块牛肉面','10',1,'1',194804195,1),('09acb8dfd84d4e96a72167a68293f3e7','牛肉面','81',1,'1',194804195,0),('210e0da714344521a96db5eed57e5eb8','大块牛肉面','10',1,'1',194804195,1),('2cbf8502c42f4fb3a859b03fe9d0e2be','牛肉面','81',1,'1',194804195,0),('3ce78fe336d0449abdee134684b2f95e','大块牛肉面','10',1,'1',194804195,0),('42e9f9f8579546e79c3c14e898327cfb','牛肉面','81',1,'3',194804195,1),('4880d5657e8b4677bad77d529185839a','牛肉面','81',1,'1',194804195,0),('4e7bedc1e8064550b8e7940970694083','牛肉面','81',1,'1',194804195,0),('509c2e43461e4afdb50742a9efc851c2','牛肉面','81',1,'1',194804195,0),('5817af01be2c49488cef70b48d83ab1c','牛肉面','81',1,'3',194804195,1),('588cfdb6f20346cdaf42368d99c02f4f','大块牛肉面','10',1,'1',194804195,1),('5df90969c85f4601b835b4f7d9e3aa22','大块牛肉面','10',1,'1',194804195,1),('5f7d40a2386a49f7b59789c377b07e7c','大块牛肉面','10',1,'1',194804195,1),('66a4a841e97f484098e20ea39179dcac','牛肉面','81',1,'3',194804195,1),('6825400492f64335a35632a92f767414','大块牛肉面','10',1,NULL,194804195,1),('73157227d38b4a399b23e6f5a87971a0','牛肉面','81',1,'1',194804195,0),('795af95542bd46969910ed0318b8947d','大块牛肉面','10',1,'1',194804195,1),('7a4dff522ddb4d92a6bd4bc646bec9c6','大块牛肉面','10',1,'1',194804195,1),('7bde0742b8d1428981b26e7570c44c94','大块牛肉面','10',1,'1',194804195,0),('88838651787b4a02bf5b6f73501d29f4','大块牛肉面','10',1,'1',194804195,0),('9089dd61666d4f549a93a8fadb750d7b','牛肉面','81',1,'1',194804195,0),('924983bb412e49089e4da367bee63587','大块牛肉面','10',1,'1',194804195,1),('asd','牛肉面','82',1,'1',194804195,1),('b3923fbaff95412aaedc7cbf797a497e','大块牛肉面','10',1,'1',194804195,0),('ba0846b86608446787adbaeba54e2968','牛肉面','81',1,'1',194804195,0),('bcd4b61033df46138e7c1fa94bd08905','大块牛肉面','10',1,'1',194804195,1),('c65deab09de54894a5834dc0371e3719','牛肉面','81',1,'2',194804195,0),('cb458092716a423abc8649b7ddf638b8','牛肉面','81',1,'1',194804195,0),('cd389e1359f24f7698738ec74755ab04','大块牛肉面','10',1,'1',194804195,0),('d7a5c326bdbc46028ca740534b9dc6e7','大块牛肉面','10',1,'1',194804195,0),('e3048a8d7c6a43a39fb542640aa80ecd','大块牛肉面','10',1,'10',194804195,0),('eb30aa0dd2bf4c1eb8519f189f8c3bb2','牛肉面','81',1,'1',194804195,0),('efbc476a2fc44b94bb0b6b834e93eaf2','牛肉面','81',1,'1',194804195,0),('f070d7ac7d4d4462836acdcdb82d157c','牛肉面','81',1,'1',194804195,0),('f86530629b55498080f704aae6951291','大块牛肉面','10',1,'11',194804195,0),('f89abc50919b448e91c32bc4be343c7f','大块牛肉面','10',1,'1',194804195,0);

/*Table structure for table `meal` */

DROP TABLE IF EXISTS `meal`;

CREATE TABLE `meal` (
  `mid` varchar(50) NOT NULL,
  `mname` varchar(20) DEFAULT NULL,
  `mprice` varchar(10) DEFAULT NULL,
  `wmid` int(10) DEFAULT NULL,
  PRIMARY KEY (`mid`),
  KEY `meal_worker_wid_fk` (`wmid`),
  CONSTRAINT `meal_worker_wid_fk` FOREIGN KEY (`wmid`) REFERENCES `worker` (`wid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `meal` */

insert  into `meal`(`mid`,`mname`,`mprice`,`wmid`) values ('45b0a66110bc4ef586c3dc53f98ab553','大块牛肉面','10',1),('jhgfd','牛肉面','81',1);

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `sid` int(10) NOT NULL,
  `sname` varchar(20) NOT NULL,
  `grade` varchar(10) DEFAULT NULL,
  `sphone` varchar(20) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `spassword` varchar(20) DEFAULT '123456',
  `classname` varchar(20) DEFAULT NULL,
  `wechat` varchar(20) DEFAULT NULL,
  `qq` varchar(20) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `student` */

insert  into `student`(`sid`,`sname`,`grade`,`sphone`,`sex`,`spassword`,`classname`,`wechat`,`qq`,`date`,`id`) values (194804110,'刘世',NULL,'18738898333','男',',2019,111','java3','','1585762241','2021-11-13','qwe'),(194804161,'刘通','','15090319809','男','123','java3','15090319809','1445794691','2001-10-26','7775483532074a30a60c983ddfab2512'),(194804195,'石钊宇',NULL,'17530528827',NULL,'123',NULL,NULL,NULL,NULL,'bcf563fc61bd4346b879015e089ffd63'),(2030920207,'王瑾',NULL,'17313218668',NULL,'wj550202',NULL,NULL,NULL,NULL,'6dcd3dd1d36b4742bfeb23c815dc431e');

/*Table structure for table `super` */

DROP TABLE IF EXISTS `super`;

CREATE TABLE `super` (
  `id` varchar(20) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `super` */

insert  into `super`(`id`,`password`) values ('501','123');

/*Table structure for table `worker` */

DROP TABLE IF EXISTS `worker`;

CREATE TABLE `worker` (
  `wid` int(10) NOT NULL,
  `wname` varchar(20) DEFAULT NULL,
  `wpassword` varchar(20) DEFAULT '123456',
  `wphone` varchar(20) DEFAULT NULL,
  `id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`wid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `worker` */

insert  into `worker`(`wid`,`wname`,`wpassword`,`wphone`,`id`) values (1,'牛肉','11','120120120','ef'),(2,'qwe','123456','12','wef'),(3,'早饭','123456','114','w'),(4,'米饭','123456','11','wefdwe'),(6,'早饭','123456','110','we'),(7,'麻辣烫','123456','123','erfvwfc'),(8,'自选','123456','123','qwefdew'),(9,'小卖部','123456','123','grte');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
