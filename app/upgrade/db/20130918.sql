INSERT INTO `[#DB_PREFIX#]system_setting` (`varname`, `value`) VALUES ('new_question_force_add_topic', 's:1:"N";');
INSERT INTO `[#DB_PREFIX#]system_setting` (`varname`, `value`) VALUES ('unfold_question_comments', 's:1:"N";');

CREATE TABLE `[#DB_PREFIX#]article` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text,
  `comments` int(10) DEFAULT '0',
  `views` int(10) DEFAULT '0',
  `add_time` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`,`comments`,`views`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8;

ALTER TABLE `[#DB_PREFIX#]topic_question` CHANGE `topic_question_id` `id` INT( 11 ) NOT NULL AUTO_INCREMENT COMMENT '自增 ID';

ALTER TABLE `[#DB_PREFIX#]topic_question` CHANGE `question_id`  `item_id` INT( 11 ) NULL DEFAULT '0';

ALTER TABLE `[#DB_PREFIX#]topic_question` ADD `type` VARCHAR( 16 ) NULL, ADD INDEX ( `type` );

RENAME TABLE `[#DB_PREFIX#]topic_question` TO `[#DB_PREFIX#]topic_relation`;

UPDATE `[#DB_PREFIX#]topic_relation` SET `type` = 'question';

CREATE TABLE `[#DB_PREFIX#]article_comments` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `article_id` int(10) NOT NULL,
  `message` text NOT NULL,
  `add_time` int(10) NOT NULL,
  `at_uid` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `article_id` (`article_id`),
  KEY `add_time` (`add_time`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8;