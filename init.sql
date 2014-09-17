drop database view_test;
create database view_test;
use view_test;

CREATE TABLE `blog` (
  `id` INT(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(16),
  PRIMARY KEY(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `article` (
  `id` INT(10) unsigned NOT NULL AUTO_INCREMENT,
  `blog_id` INT(10) unsigned,
  `title` VARCHAR(16),
  `content` VARCHAR(32),
  `created_at` INT(10) unsigned,
  PRIMARY KEY(`id`),
  KEY(`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE VIEW `articles` AS
  SELECT
    article.id,
    article.title,
    article.content,
    article.created_at,
    blog.id AS blog_id,
    blog.name AS blog_name
  FROM article
    INNER JOIN blog
      ON article.blog_id = blog.id;

