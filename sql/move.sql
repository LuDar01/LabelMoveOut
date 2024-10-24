/*
SQLyog Community v12.4.2 (64 bit)
MySQL - 10.4.32-MariaDB : Database - moveout
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`moveout` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `moveout`;

/*Table structure for table `labels` */

DROP TABLE IF EXISTS `labels`;

CREATE TABLE `labels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TYPE` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `iconClass` text DEFAULT NULL,
  `file_url` text DEFAULT NULL,
  `qr_code_url` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `labels` */

insert  into `labels`(`id`,`TYPE`,`description`,`iconClass`,`file_url`,`qr_code_url`) values 
(10,'hazardous','xx','fa fa-exclamation-triangle','https://s3labels.s3.eu-north-1.amazonaws.com/2cbd8d4104ade9c0055f2fd9456d0072','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJQAAACUCAYAAAB1PADUAAAAAklEQVR4AewaftIAAASzSURBVO3BQY4kRxIEQdNA/f/Lun2j7yWARHo1yaGJ4I9ULTmpWnRSteikatFJ1aKTqkUnVYtOqhadVC06qVp0UrXopGrRSdWik6pFJ1WLTqoWffISkN+k5gkgk5o3gHyTmgnIb1LzxknVopOqRSdViz5ZpmYTkCeAfJOaTUCeULMJyKaTqkUnVYtOqhZ98mVAnlDzBJBJzQ2QGzUTkEnNBGRSMwH5JiBPqPmmk6pFJ1WLTqoWfVJXap4AMqmZgExq/iQnVYtOqhadVC365A8HZFJzA+QJNTdA/ktOqhadVC06qVr0yZep+U1AboBMat4AMqm5UbNJzT/JSdWik6pFJ1WLPlkG5O+kZgIyqZmATGomIJOaCcgbQCY1N0D+yU6qFp1ULTqpWoQ/8i8GZFIzAXlDzQRkUlN/OaladFK16KRq0ScvAZnUTEA2qZnUTEAmNTdAJjUTkCeATGpugExqJiCb1HzTSdWik6pFJ1WL8EcWAZnUPAFkUjMBmdTcAJnUvAHkRs0E5EbNBOQNNU8AmdS8cVK16KRq0UnVIvyRLwIyqXkCyBtqJiCTmk1AbtTcALlRMwGZ1PydTqoWnVQtOqla9MlLQCY1TwC5UTMBuVEzAZnUPAFkUjMBmdRMQN5QMwGZ1DwBZFKz6aRq0UnVopOqRfgjXwRkk5oJyKTmCSCTmieA3Ki5ATKpeQPIjZpvOqladFK16KRq0SfLgNyouQEyqblR8wSQSc0E5Ak1N0Bu1ExA3lAzAbkBMql546Rq0UnVopOqRZ+8BGRSMwG5AXIDZFIzAXlCzSYgk5pJzRNqJiDfpGbTSdWik6pFJ1WLPlkGZJOaGzVvALlRMwGZ1PwmNROQGzUTkEnNppOqRSdVi06qFn2yTM0TaiYgE5AbNZvUTECeADKpuQEyqZnU3Ki5ATKp+aaTqkUnVYtOqhbhj7wA5JvUTEA2qXkCyCY1N0A2qZmATGreOKladFK16KRq0SfL1NwAuVEzAZnUbAIyqblRswnIjZoJyKRmAvKEmk0nVYtOqhadVC365JepuQEyqZmAPKHmRs0NkEnNBGRSMwG5UXMDZFIzAZnU3ACZ1Gw6qVp0UrXopGrRJ78MyKTmBsikZgIyqbkBMqm5UXOjZgIyqbkB8gSQJ4DcAJnUvHFSteikatFJ1SL8kX8xIDdqngDyhJongNyoeQLIJjVvnFQtOqladFK16JOXgPwmNZOaJ4BMajYB2QRkUvOGmm86qVp0UrXopGrRJ8vUbAJyA+RGzRtqJiA3ap4AcqPmDTU3QCY1b5xULTqpWnRSteiTLwPyhJo31ExAnlAzAbkB8oSaGyBvqJmATGq+6aRq0UnVopOqRZ/U/wEyqXkCyBtq3gDyhJpNJ1WLTqoWnVQt+uQPA+QNNTdAnlDzBpAn1NwAmdRsOqladFK16KRq0Sdfpuab1ExAbtTcAHlCzRNAnlAzAZnUTEAmNb/ppGrRSdWik6pFnywD8puATGpugNyomYDcAHlCzQ2QSc0TaiYgk5pvOqladFK16KRqEf5I1ZKTqkUnVYtOqhadVC06qVp0UrXopGrRSdWik6pFJ1WLTqoWnVQtOqladFK16KRq0f8AYpclL6m2c9cAAAAASUVORK5CYII='),
(11,'heavy','aas','fa fa-dolly','https://s3labels.s3.eu-north-1.amazonaws.com/5b5508e4fe1dcdf36428f555063be7fc','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJQAAACUCAYAAAB1PADUAAAAAklEQVR4AewaftIAAAToSURBVO3BQY4kRxIEQdNA/f/Lun0i/BRAIr2aM1wTwR+pWnJSteikatFJ1aKTqkUnVYtOqhadVC06qVp0UrXopGrRSdWik6pFJ1WLTqoWnVQt+uQlIL9JzRNAnlAzAZnU3AB5Qs0NkN+k5o2TqkUnVYtOqhZ9skzNJiBPAJnUTEAmNTdqboA8oWYCMqm5UbMJyKaTqkUnVYtOqhZ98mVAnlCzCcik5gkgN2omIDdANgF5Qs03nVQtOqladFK16JP/M0AmNROQSc0NkEnNBGRS8192UrXopGrRSdWiT/7j1NwAmdQ8oeYNIJOav9lJ1aKTqkUnVYs++TI13wTkBsikZlLzBJAbNZOaCcgmNX+Sk6pFJ1WLTqoWfbIMyL9JzQTkBsikZgIyqZmA3ACZ1ExAngDyJzupWnRSteikahH+SP0DyKRmAvKGmv+yk6pFJ1WLTqoWffISkEnNDZBJzQTkRs0EZFLzBJBJzQRkUjMBmdQ8AeRGzQRkUvMnOaladFK16KRq0SfLgExq3lAzAXkCyKTmBsikZgJyA2RSc6NmAjIBmdTcAJnU3ACZ1LxxUrXopGrRSdUi/JEXgNyouQHyhpoJyKRmAjKpmYA8oWYC8oaaCcikZgLyhppNJ1WLTqoWnVQt+uQlNU8AmdRMQCY1N0C+Sc0NkEnNDZAbIJOaCcif7KRq0UnVopOqRfgji4DcqJmAbFJzA2RScwPkRs0EZFLzBJAbNTdAJjUTkBs1b5xULTqpWnRStQh/5IuATGpugExqfhOQTWomIJOaCcik5g0gk5pvOqladFK16KRq0ScvAblRMwG5UTMBmdS8AeQNNTdAbtRsAjKpuQFyo+aNk6pFJ1WLTqoW4Y+8AOQJNW8AmdTcALlR8wSQSc0E5Ak1N0Bu1ExAJjUTkEnNppOqRSdVi06qFn3ykpoJyBtAngByo+YGyI2aSc0TaiYgN0AmNX+Tk6pFJ1WLTqoW4Y98EZAbNROQSc0bQCY1N0A2qbkBMqmZgNyoeQPIpOaNk6pFJ1WLTqoWffISkEnNpOYJNROQJ9TcAJnUTGomIE+oeULNJiCTmgnIN51ULTqpWnRSteiTl9RsAjKpeQLIjZoJyKTmRs0NkEnNBGRSc6NmAnKj5t90UrXopGrRSdUi/JEXgExqJiBPqJmATGomIE+oeQPIjZongGxSMwGZ1HzTSdWik6pFJ1WLPnlJzY2aN9S8oWYCcqNmAnKjZgJyo+ZGzRNAngByo+aNk6pFJ1WLTqoWffISkN+kZlJzA+QNNTdAvgnIpOYJNROQSc2mk6pFJ1WLTqoWfbJMzSYgN0Bu1LwB5EbNDZAJyBNq3gAyqZmATGreOKladFK16KRq0SdfBuQJNU+omYDcAJnU3Kh5AsiNmgnIBGSTmgnIpGbTSdWik6pFJ1WLPvnLAbkB8k1AJjVvqJmAPAHkRs0EZFLzxknVopOqRSdViz75y6m5ATKpmYA8oWZSswnIpOYGyKTm33RSteikatFJ1aJPvkzNbwIyqblRMwGZ1ExAJjUTkBs1N2q+CcikZtNJ1aKTqkUnVYs+WQbkNwG5AbJJzQTkCSBvAJnUTEAmNb/ppGrRSdWik6pF+CNVS06qFp1ULTqpWnRSteikatFJ1aKTqkUnVYtOqhadVC06qVp0UrXopGrRSdWik6pF/wMI0k00n18KygAAAABJRU5ErkJggg=='),
(12,'fragile','ww','fa-solid fa-wine-glass','https://s3labels.s3.eu-north-1.amazonaws.com/1b2a213d25df5013d63b2aa2d2d64c5e','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJQAAACUCAYAAAB1PADUAAAAAklEQVR4AewaftIAAATCSURBVO3BQY4kRxIEQdNA/f/Lun1bPwWQSK/mcGgi+CNVS06qFp1ULTqpWnRSteikatFJ1aKTqkUnVYtOqhadVC06qVp0UrXopGrRSdWik6pFn7wE5DepeQPIpOYJIN+kZgLym9S8cVK16KRq0UnVok+WqdkE5AkgN2omIJOaGzWbgDyhZhOQTSdVi06qFp1ULfrky4A8oeYJIJOaCcgbQCY1E5BJzQTkm4A8oeabTqoWnVQtOqla9MlfBsik5kbNjZongExqJiCTmr/JSdWik6pFJ1WLPvnLqHkCyBtqboD8l5xULTqpWnRSteiTL1Pzm4A8oWYC8gSQSc2Nmk1q/iQnVYtOqhadVC36ZBmQf5KaCcikZgIyqZmATGomIG8AmdTcAPmTnVQtOqladFK1CH/kXwzIE2omIDdqJiCTmvq/k6pFJ1WLTqoWffISkEnNBGSTmknNBGRSc6PmBsgTQCY1N0AmNROQTWq+6aRq0UnVopOqRfgjXwTkCTWbgExq3gByo2YCcqNmAvKGmieATGreOKladFK16KRq0ScvAXlDzQTkDTVPAJnU3Ki5AXKj5g01E5A31Gw6qVp0UrXopGrRJy+peQPIpOYGyA2QSc0bQCY1E5BJzQTkDTUTkEnNE0AmNZtOqhadVC06qVqEP/ICkEnNDZBJzQ2QGzUTkDfUPAHkRs0NkEnNG0Bu1HzTSdWik6pFJ1WLPlkG5EbNDZBJzQRkAjKpeQPIE2pugNyomYC8oWYCcgNkUvPGSdWik6pFJ1WL8Ee+CMgTaiYgN2pugNyomYC8oWYTkCfUTEAmNd90UrXopGrRSdWiT5YBuVFzA2RSMwF5Qs0EZAJyo2YCMqn5TWomIDdqJiCTmk0nVYtOqhadVC3CH3kByKTmBsik5gbIjZo3gExqJiA3aiYgk5obIJOaTUAmNd90UrXopGrRSdWiT/5hQCY1k5oJyATkm9RMQCYgN0Bu1NwA+SYgk5o3TqoWnVQtOqla9MmXAblRcwNkUjMBmdRMQG7UPKFmE5AbNROQSc0E5Ak1m06qFp1ULTqpWvTJl6m5AXKjZgIyqXkDyKRmAjKpmYBMaiYgN2pugExqJiCTmhsgk5pNJ1WLTqoWnVQt+uQPo2YC8k1qbtTcqJmATGpugDwB5AkgN0AmNW+cVC06qVp0UrUIf+RfDMikZgIyqbkB8oSaJ4DcqHkCyCY1b5xULTqpWnRSteiTl4D8JjWTmieATGo2AdkEZFLzhppvOqladFK16KRq0SfL1GwCcgPkRs0NkBs1T6h5AsiNmjfU3ACZ1LxxUrXopGrRSdWiT74MyBNqNgGZ1ExqboBsUnMD5A01E5BJzTedVC06qVp0UrXok/8YIDdqJjVPAHlDzRtAnlCz6aRq0UnVopOqRZ/8ZdRMQCY1N0A2qXkDyBNqboBMajadVC06qVp0UrXoky9T801qJiCTmgnIjZoJyI2aJ4A8oWYCMqmZgExqftNJ1aKTqkUnVYs+WQbkNwGZ1ExAJjVPqJmATECeUHMDZFLzhJoJyKTmm06qFp1ULTqpWoQ/UrXkpGrRSdWik6pFJ1WLTqoWnVQtOqladFK16KRq0UnVopOqRSdVi06qFp1ULTqpWvQ/7R4uNZvi6LUAAAAASUVORK5CYII=');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `google_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`email`,`password`,`verified`,`created_at`,`google_id`) values 
(1,'gold collect','gold005dev@gmail.com',NULL,0,'2024-10-24 10:01:28','102618422070290637082');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
