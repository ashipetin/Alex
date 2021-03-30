#
# TABLE STRUCTURE FOR: catalogs
#

DROP TABLE IF EXISTS `catalogs`;

CREATE TABLE `catalogs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Название раздела',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name` (`name`(10))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Разделы интернет-магазина';

INSERT INTO `catalogs` (`id`, `name`) VALUES ('1', 'Процессоры');
INSERT INTO `catalogs` (`id`, `name`) VALUES ('2', 'Материнские платы');
INSERT INTO `catalogs` (`id`, `name`) VALUES ('3', 'Видеокарты');
INSERT INTO `catalogs` (`id`, `name`) VALUES ('4', 'Жесткие диски');
INSERT INTO `catalogs` (`id`, `name`) VALUES ('5', 'Оперативная память');


#
# TABLE STRUCTURE FOR: discounts
#

DROP TABLE IF EXISTS `discounts`;

CREATE TABLE `discounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `discount` float unsigned DEFAULT NULL COMMENT 'Величина скидки от 0.0 до 1.0',
  `started_at` datetime DEFAULT NULL,
  `finished_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_of_user_id` (`user_id`),
  KEY `index_of_product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Скидки';

#
# TABLE STRUCTURE FOR: orders
#

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_of_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Заказы';

INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('1', 1, '1989-04-26 14:11:05', '1970-10-25 08:35:53');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('2', 2, '2020-05-20 02:43:51', '2010-04-23 14:15:18');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('3', 3, '2019-02-26 21:37:51', '1975-12-02 21:39:35');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('4', 4, '1975-06-06 09:43:02', '2009-12-21 20:12:20');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('5', 5, '1993-06-03 20:47:29', '2000-02-19 12:26:47');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('6', 6, '1988-11-03 19:13:30', '2015-10-15 04:03:35');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('7', 1, '1972-12-01 02:32:30', '2019-07-05 11:43:50');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('8', 2, '2008-07-01 02:48:17', '2019-12-03 16:31:24');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('9', 3, '1986-03-25 00:11:13', '2014-06-10 12:36:14');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('10', 4, '1989-01-10 10:56:04', '2017-08-17 12:53:16');


#
# TABLE STRUCTURE FOR: orders_products
#

DROP TABLE IF EXISTS `orders_products`;

CREATE TABLE `orders_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `total` int(10) unsigned DEFAULT 1 COMMENT 'Количество заказанных товарных позиций',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Состав заказа';

#
# TABLE STRUCTURE FOR: products
#

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Название',
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Описание',
  `price` decimal(11,2) DEFAULT NULL COMMENT 'Цена',
  `catalog_id` int(10) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_of_catalog_id` (`catalog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Товарные позиции';

INSERT INTO `products` (`id`, `name`, `description`, `price`, `catalog_id`, `created_at`, `updated_at`) VALUES ('1', 'Intel Core i3-8100', 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.', '7890.00', 1, '2021-03-30 18:28:36', '2021-03-30 18:28:36');
INSERT INTO `products` (`id`, `name`, `description`, `price`, `catalog_id`, `created_at`, `updated_at`) VALUES ('2', 'Intel Core i5-7400', 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.', '12700.00', 1, '2021-03-30 18:28:36', '2021-03-30 18:28:36');
INSERT INTO `products` (`id`, `name`, `description`, `price`, `catalog_id`, `created_at`, `updated_at`) VALUES ('3', 'AMD FX-8320E', 'Процессор для настольных персональных компьютеров, основанных на платформе AMD.', '4780.00', 1, '2021-03-30 18:28:36', '2021-03-30 18:28:36');
INSERT INTO `products` (`id`, `name`, `description`, `price`, `catalog_id`, `created_at`, `updated_at`) VALUES ('4', 'AMD FX-8320', 'Процессор для настольных персональных компьютеров, основанных на платформе AMD.', '7120.00', 1, '2021-03-30 18:28:36', '2021-03-30 18:28:36');
INSERT INTO `products` (`id`, `name`, `description`, `price`, `catalog_id`, `created_at`, `updated_at`) VALUES ('5', 'ASUS ROG MAXIMUS X HERO', 'Материнская плата ASUS ROG MAXIMUS X HERO, Z370, Socket 1151-V2, DDR4, ATX', '19310.00', 2, '2021-03-30 18:28:36', '2021-03-30 18:28:36');
INSERT INTO `products` (`id`, `name`, `description`, `price`, `catalog_id`, `created_at`, `updated_at`) VALUES ('6', 'Gigabyte H310M S2H', 'Материнская плата Gigabyte H310M S2H, H310, Socket 1151-V2, DDR4, mATX', '4790.00', 2, '2021-03-30 18:28:36', '2021-03-30 18:28:36');
INSERT INTO `products` (`id`, `name`, `description`, `price`, `catalog_id`, `created_at`, `updated_at`) VALUES ('7', 'MSI B250M GAMING PRO', 'Материнская плата MSI B250M GAMING PRO, B250, Socket 1151, DDR4, mATX', '5060.00', 2, '2021-03-30 18:28:36', '2021-03-30 18:28:36');


#
# TABLE STRUCTURE FOR: rubrics
#

DROP TABLE IF EXISTS `rubrics`;

CREATE TABLE `rubrics` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Название раздела',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Разделы интернет-магазина';

INSERT INTO `rubrics` (`id`, `name`) VALUES ('1', 'Видеокарты');
INSERT INTO `rubrics` (`id`, `name`) VALUES ('2', 'Память');


#
# TABLE STRUCTURE FOR: storehouses
#

DROP TABLE IF EXISTS `storehouses`;

CREATE TABLE `storehouses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Название',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Склады';

#
# TABLE STRUCTURE FOR: storehouses_products
#

DROP TABLE IF EXISTS `storehouses_products`;

CREATE TABLE `storehouses_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `storehouse_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `value` int(10) unsigned DEFAULT NULL COMMENT 'Запас товарной позиции на складе',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Запасы на складе';

#
# TABLE STRUCTURE FOR: users
#

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Имя покупателя',
  `birthday_at` date DEFAULT NULL COMMENT 'Дата рождения',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Покупатели';

INSERT INTO `users` (`id`, `name`, `birthday_at`, `created_at`, `updated_at`) VALUES ('1', 'Геннадий', '1990-10-05', '2021-03-30 18:28:36', '2021-03-30 18:28:36');
INSERT INTO `users` (`id`, `name`, `birthday_at`, `created_at`, `updated_at`) VALUES ('2', 'Наталья', '1984-11-12', '2021-03-30 18:28:36', '2021-03-30 18:28:36');
INSERT INTO `users` (`id`, `name`, `birthday_at`, `created_at`, `updated_at`) VALUES ('3', 'Александр', '1985-05-20', '2021-03-30 18:28:36', '2021-03-30 18:28:36');
INSERT INTO `users` (`id`, `name`, `birthday_at`, `created_at`, `updated_at`) VALUES ('4', 'Сергей', '1988-02-14', '2021-03-30 18:28:36', '2021-03-30 18:28:36');
INSERT INTO `users` (`id`, `name`, `birthday_at`, `created_at`, `updated_at`) VALUES ('5', 'Иван', '1998-01-12', '2021-03-30 18:28:36', '2021-03-30 18:28:36');
INSERT INTO `users` (`id`, `name`, `birthday_at`, `created_at`, `updated_at`) VALUES ('6', 'Мария', '1992-08-29', '2021-03-30 18:28:36', '2021-03-30 18:28:36');


