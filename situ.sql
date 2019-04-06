/*
Navicat MySQL Data Transfer

Source Server         : aaaaa
Source Server Version : 50133
Source Host           : localhost:3306
Source Database       : situ

Target Server Type    : MYSQL
Target Server Version : 50133
File Encoding         : 65001

Date: 2019-03-09 14:52:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `activity`
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ids` varchar(128) DEFAULT NULL,
  `courseinfo` text NOT NULL,
  `planinfo` text NOT NULL,
  `dateinfo` text NOT NULL,
  `school` varchar(128) NOT NULL,
  `college` varchar(128) NOT NULL,
  `name` varchar(128) NOT NULL,
  `count` int(11) DEFAULT NULL,
  `classcount` int(11) DEFAULT NULL,
  `source_operator_id` int(11) NOT NULL,
  `option` varchar(128) NOT NULL,
  `attention` varchar(128) DEFAULT NULL,
  `type` int(11) NOT NULL,
  `Instructor_user_id` int(11) DEFAULT '0',
  `createdate` varchar(128) NOT NULL,
  `operator_id` int(11) NOT NULL,
  `charge_operator_id` int(11) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `comments` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity
-- ----------------------------
INSERT INTO `activity` VALUES ('1', '1,2', ' Java大数据 ', ' 8月到9月 ', '2018-09-13 - 2018-10-16', '青岛大学', '数据科学与软件工程学院', 'Java夏校内开课', '50', '2', '1', '110', ' 无 ', '0', '1', '2018-09-25', '1', '1', '0', '');
INSERT INTO `activity` VALUES ('5', '3', 'Java大数据', '8月到9月', '2018-08-29 - 2018-10-16', '青岛农业大学', '理学与数学学院', 'UI设计课程', '60', '2', '1', '100', '无', '1', '1', '2018-09-26', '1', '1', '0', '');
INSERT INTO `activity` VALUES ('6', '6,26,27,36,37,43,44,45,46', ' web前端 ', ' 8月到9月 ', '2018-09-04 - 2018-10-16', '青岛大学', '数据科学与软件工程学院', '前端校内开课', '45', '2', '1', '100', ' 无 ', '0', '1', '2018-09-27', '1', '1', '0', '');
INSERT INTO `activity` VALUES ('10', '48', '        ', '        ', '2018-10-20 - 2018-11-12', '青岛农业大学', '理学与数学学院', 'Python课程', '50', '2', '1', '110', '        ', '0', '45', '2018-10-06', '1', '1', '0', '  ');

-- ----------------------------
-- Table structure for `activity_checkwork`
-- ----------------------------
DROP TABLE IF EXISTS `activity_checkwork`;
CREATE TABLE `activity_checkwork` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` varchar(128) NOT NULL,
  `check1` int(11) NOT NULL,
  `check2` int(11) NOT NULL,
  `check3` int(11) NOT NULL,
  `lastdate` varchar(128) DEFAULT NULL,
  `operator_id` int(11) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity_checkwork
-- ----------------------------
INSERT INTO `activity_checkwork` VALUES ('17', '5', '3', '空', '0', '0', '0', null, '1', null);
INSERT INTO `activity_checkwork` VALUES ('18', '1', '1', '2018-09-28', '1', '4', '3', '2018-10-10 09:25:11', '1', '');
INSERT INTO `activity_checkwork` VALUES ('19', '1', '2', '2018-09-28', '1', '4', '1', '2018-10-10 09:25:17', '1', '');
INSERT INTO `activity_checkwork` VALUES ('34', '6', '6', '2018-09-28', '1', '1', '0', '2018-09-29 11:01:15', '1', '');
INSERT INTO `activity_checkwork` VALUES ('35', '6', '26', '2018-09-28', '1', '1', '0', '2018-09-29 11:01:15', '1', '');
INSERT INTO `activity_checkwork` VALUES ('36', '6', '27', '2018-09-28', '1', '1', '0', '2018-09-29 11:01:15', '1', '');
INSERT INTO `activity_checkwork` VALUES ('37', '6', '36', '2018-09-28', '1', '1', '0', '2018-09-29 11:01:15', '1', '');
INSERT INTO `activity_checkwork` VALUES ('46', '6', '6', '2018-09-29', '1', '0', '0', '2018-09-29 11:25:09', '1', '');
INSERT INTO `activity_checkwork` VALUES ('47', '6', '26', '2018-09-29', '1', '0', '0', '2018-09-29 11:25:09', '1', '');
INSERT INTO `activity_checkwork` VALUES ('48', '6', '27', '2018-09-29', '1', '0', '0', '2018-09-29 11:25:09', '1', '');
INSERT INTO `activity_checkwork` VALUES ('49', '6', '36', '2018-09-29', '1', '0', '0', '2018-09-29 11:25:09', '1', '');
INSERT INTO `activity_checkwork` VALUES ('50', '6', '37', '2018-09-28', '1', '1', '0', '2018-10-10 09:25:53', '1', '');
INSERT INTO `activity_checkwork` VALUES ('51', '6', '37', '2018-09-29', '0', '0', '0', null, '1', null);
INSERT INTO `activity_checkwork` VALUES ('52', '6', '43', '2018-09-29', '0', '0', '0', null, '1', null);
INSERT INTO `activity_checkwork` VALUES ('53', '6', '44', '2018-09-29', '0', '0', '0', null, '1', null);
INSERT INTO `activity_checkwork` VALUES ('54', '6', '45', '2018-09-29', '0', '0', '0', null, '1', null);
INSERT INTO `activity_checkwork` VALUES ('55', '6', '46', '2018-09-29', '0', '0', '0', null, '1', null);
INSERT INTO `activity_checkwork` VALUES ('56', '6', '43', '2018-09-28', '1', '1', '0', '2018-10-10 09:25:53', '1', '');
INSERT INTO `activity_checkwork` VALUES ('57', '6', '44', '2018-09-28', '1', '1', '0', '2018-10-10 09:25:53', '1', '');
INSERT INTO `activity_checkwork` VALUES ('58', '6', '45', '2018-09-28', '1', '1', '0', '2018-10-10 09:25:53', '1', '');
INSERT INTO `activity_checkwork` VALUES ('59', '6', '46', '2018-09-28', '1', '1', '0', '2018-10-10 09:25:53', '1', '');
INSERT INTO `activity_checkwork` VALUES ('60', '10', '48', '', '0', '0', '0', null, '1', null);
INSERT INTO `activity_checkwork` VALUES ('61', '10', '48', '2018-10-01', '0', '0', '0', null, '1', null);
INSERT INTO `activity_checkwork` VALUES ('62', '10', '48', '2018-10-17', '1', '2', '1', '2018-10-17 10:41:38', '1', '');

-- ----------------------------
-- Table structure for `activity_college`
-- ----------------------------
DROP TABLE IF EXISTS `activity_college`;
CREATE TABLE `activity_college` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `school_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity_college
-- ----------------------------
INSERT INTO `activity_college` VALUES ('1', '数据科学与软件工程学院', '1');
INSERT INTO `activity_college` VALUES ('2', '理学与信息科学学院', '2');

-- ----------------------------
-- Table structure for `activity_evaluation`
-- ----------------------------
DROP TABLE IF EXISTS `activity_evaluation`;
CREATE TABLE `activity_evaluation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `point` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `comments` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity_evaluation
-- ----------------------------
INSERT INTO `activity_evaluation` VALUES ('1', '6', '6', '100', '0', '');
INSERT INTO `activity_evaluation` VALUES ('2', '6', '26', '100', '0', '');
INSERT INTO `activity_evaluation` VALUES ('13', '6', '27', '100', '0', '');
INSERT INTO `activity_evaluation` VALUES ('14', '6', '36', '100', '0', '');
INSERT INTO `activity_evaluation` VALUES ('15', '5', '3', null, null, null);
INSERT INTO `activity_evaluation` VALUES ('16', '6', '37', '100', '0', '');
INSERT INTO `activity_evaluation` VALUES ('17', '6', '43', '100', '0', '');
INSERT INTO `activity_evaluation` VALUES ('18', '6', '44', '100', '0', '');
INSERT INTO `activity_evaluation` VALUES ('19', '6', '45', '100', '0', '');
INSERT INTO `activity_evaluation` VALUES ('20', '6', '46', '100', '0', '');
INSERT INTO `activity_evaluation` VALUES ('21', '10', '48', null, null, null);
INSERT INTO `activity_evaluation` VALUES ('22', '1', '1', null, null, null);
INSERT INTO `activity_evaluation` VALUES ('23', '1', '2', null, null, null);

-- ----------------------------
-- Table structure for `activity_feedback`
-- ----------------------------
DROP TABLE IF EXISTS `activity_feedback`;
CREATE TABLE `activity_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(128) DEFAULT NULL,
  `activity_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `opt1` varchar(128) DEFAULT NULL,
  `opt2` varchar(128) DEFAULT NULL,
  `opt3` varchar(128) DEFAULT NULL,
  `opt4` varchar(128) DEFAULT NULL,
  `opt5` varchar(128) DEFAULT NULL,
  `opt6` varchar(128) DEFAULT NULL,
  `opt7` varchar(128) DEFAULT NULL,
  `opt8` varchar(128) DEFAULT NULL,
  `opt9` varchar(128) DEFAULT NULL,
  `opt10` varchar(128) DEFAULT NULL,
  `text1` varchar(128) DEFAULT NULL,
  `text2` varchar(128) DEFAULT NULL,
  `text3` varchar(128) DEFAULT NULL,
  `text4` varchar(128) DEFAULT NULL,
  `text5` varchar(128) DEFAULT NULL,
  `text6` varchar(128) DEFAULT NULL,
  `text7` varchar(128) DEFAULT NULL,
  `text8` varchar(128) DEFAULT NULL,
  `text9` varchar(128) DEFAULT NULL,
  `text10` varchar(128) DEFAULT NULL,
  `result` varchar(128) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity_feedback
-- ----------------------------
INSERT INTO `activity_feedback` VALUES ('1', '2018-10-17', '10', '3', 'A', 'A', 'B', 'B', null, null, null, null, null, null, '还行', '大家都很积极', '基本都完成', null, null, null, null, null, null, null, '好的', '0');

-- ----------------------------
-- Table structure for `activity_market`
-- ----------------------------
DROP TABLE IF EXISTS `activity_market`;
CREATE TABLE `activity_market` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(255) NOT NULL,
  `operator_id` int(11) NOT NULL,
  `activity_id` int(11) NOT NULL,
  `json` varchar(255) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity_market
-- ----------------------------
INSERT INTO `activity_market` VALUES ('1', '2018-09-28', '1', '6', '[{\"level\":\"0\",\"info\":\"sadas\"},{\"name\":\"陈玉伟\",\"level\":\"0\",\"info\":\"s\"}]', '今天谈了几个学生', '争取人');
INSERT INTO `activity_market` VALUES ('2', '2018-09-29', '1', '6', '[{\"info\":\"xx\"}]', '今天谈了几个学生', '争取人');
INSERT INTO `activity_market` VALUES ('3', '2018-09-28', '1', '10', '[{\"name\":\"x\",\"level\":\"0\",\"info\":\"ss\"}]', '今天谈了几个学生', '争取人');
INSERT INTO `activity_market` VALUES ('4', '2018-09-29', '1', '10', '', '今天谈了几个学生', '争取人');
INSERT INTO `activity_market` VALUES ('5', '2018-10-01', '1', '10', '', '', '争取人');
INSERT INTO `activity_market` VALUES ('6', '2018-10-17', '1', '10', '[{\"name\":\"陈玉伟\",\"level\":\"0\",\"info\":\"zzz\"}]', '今天谈了几个学生', '争取人');
INSERT INTO `activity_market` VALUES ('7', '空', '1', '5', '', '今天谈了几个学生', '争取人');
INSERT INTO `activity_market` VALUES ('8', '2018-09-28', '1', '1', '', null, null);

-- ----------------------------
-- Table structure for `activity_notice`
-- ----------------------------
DROP TABLE IF EXISTS `activity_notice`;
CREATE TABLE `activity_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) NOT NULL,
  `date` varchar(128) NOT NULL,
  `operator_id` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `info` text,
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity_notice
-- ----------------------------

-- ----------------------------
-- Table structure for `activity_operator`
-- ----------------------------
DROP TABLE IF EXISTS `activity_operator`;
CREATE TABLE `activity_operator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `niki` varchar(32) NOT NULL,
  `pass` varchar(128) NOT NULL DEFAULT '123',
  `name` varchar(16) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `tel` varchar(32) NOT NULL,
  `power` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `comments` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity_operator
-- ----------------------------
INSERT INTO `activity_operator` VALUES ('1', '17863902943', '123', '刘兴晖', '0', '178639029423', '1', '0', null);
INSERT INTO `activity_operator` VALUES ('2', 'x', '123', '陈玉伟', '1', '17863902943', '0', '0', 'aa');
INSERT INTO `activity_operator` VALUES ('3', '18567402934', '123', '王吉兴', '0', '18567402934', '1', '0', null);

-- ----------------------------
-- Table structure for `activity_question`
-- ----------------------------
DROP TABLE IF EXISTS `activity_question`;
CREATE TABLE `activity_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) NOT NULL,
  `ques1` varchar(128) NOT NULL,
  `ques2` varchar(128) NOT NULL,
  `ques3` varchar(128) NOT NULL,
  `ques4` varchar(128) NOT NULL,
  `ques5` varchar(128) NOT NULL,
  `ques6` varchar(128) NOT NULL,
  `ques7` varchar(128) NOT NULL,
  `text1` varchar(128) NOT NULL,
  `text2` varchar(128) NOT NULL,
  `text3` varchar(128) NOT NULL,
  `text4` varchar(128) NOT NULL,
  `text5` varchar(128) NOT NULL,
  `text6` varchar(128) NOT NULL,
  `text7` varchar(128) NOT NULL,
  `option1` varchar(128) NOT NULL,
  `option2` varchar(128) NOT NULL,
  `option3` varchar(128) NOT NULL,
  `option4` varchar(128) NOT NULL,
  `option5` varchar(128) NOT NULL,
  `option6` varchar(128) DEFAULT NULL,
  `option7` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity_question
-- ----------------------------
INSERT INTO `activity_question` VALUES ('1', '1', '在本周学习过程中，你的学习状态如何？', '在本周学习过程中，是否能跟上讲师的进度？', '在本周学习过程中，是否能跟上讲师的进度？', '在本周学习过程中，是否能跟上讲师的进度？', '本周未完成你认为同学们的学习氛围如何？', '你认为同学们的学习氛围如何？', '通过本周学习，自我感觉较上周进步的程度如何？', '状态不好的原因：', '在本周课程中，感觉自己哪个环节比较薄弱？（知识点）', '你认为的原因', '你认为的原因', '本周未完成哪些作业？', '你认为的原因：', '较差的原因：', '', '', '', '', '', '', '');

-- ----------------------------
-- Table structure for `activity_report`
-- ----------------------------
DROP TABLE IF EXISTS `activity_report`;
CREATE TABLE `activity_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) NOT NULL,
  `operator_id` int(11) NOT NULL,
  `date` varchar(128) NOT NULL,
  `tprogress` varchar(128) DEFAULT NULL,
  `sprogress` varchar(128) DEFAULT NULL,
  `cprogress` varchar(128) DEFAULT NULL,
  `json` varchar(128) DEFAULT NULL,
  `comments` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity_report
-- ----------------------------
INSERT INTO `activity_report` VALUES ('1', '6', '1', '2018-09-28', null, null, null, '[{\"info\":\"x\"},{\"name\":\"xx\",\"info\":\"a\"}]', null);
INSERT INTO `activity_report` VALUES ('2', '6', '1', '2018-09-29', null, null, null, '', null);
INSERT INTO `activity_report` VALUES ('3', '10', '1', '2018-10-01', null, null, null, '', null);
INSERT INTO `activity_report` VALUES ('4', '10', '1', '2018-09-28', null, null, null, '', null);
INSERT INTO `activity_report` VALUES ('5', '10', '1', '2018-10-17', '', '', '', '[{\"name\":\"陈玉伟\",\"info\":\"上课迟到\"}]', '');

-- ----------------------------
-- Table structure for `activity_school`
-- ----------------------------
DROP TABLE IF EXISTS `activity_school`;
CREATE TABLE `activity_school` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity_school
-- ----------------------------
INSERT INTO `activity_school` VALUES ('1', '青岛大学');
INSERT INTO `activity_school` VALUES ('2', '青岛农业大学');

-- ----------------------------
-- Table structure for `activity_summary`
-- ----------------------------
DROP TABLE IF EXISTS `activity_summary`;
CREATE TABLE `activity_summary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) NOT NULL,
  `operator_id` int(11) NOT NULL,
  `createdate` varchar(128) NOT NULL,
  `option` varchar(11) DEFAULT '0000',
  `sstatus` int(11) DEFAULT NULL,
  `tstatus` int(11) DEFAULT NULL,
  `cstatus` int(11) DEFAULT NULL,
  `xstatus` int(11) DEFAULT NULL,
  `summary` varchar(128) DEFAULT NULL,
  `proposal` varchar(128) DEFAULT NULL,
  `comments` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity_summary
-- ----------------------------
INSERT INTO `activity_summary` VALUES ('1', '6', '1', '2018-09-28 22:12', '2222', '2', '2', '2', '2', 's', 's', '');
INSERT INTO `activity_summary` VALUES ('2', '5', '1', '2018-09-28 22:13', '2112', '2', '1', '2', '1', '', '', '');
INSERT INTO `activity_summary` VALUES ('3', '10', '1', '2018-10-06 17:08', '1132', '1', '1', '2', '3', '还可以', '不错', '');
INSERT INTO `activity_summary` VALUES ('4', '1', '1', '2018-10-11 10:31', '0000', null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `activity_time`
-- ----------------------------
DROP TABLE IF EXISTS `activity_time`;
CREATE TABLE `activity_time` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) NOT NULL,
  `date` varchar(128) NOT NULL,
  `time1` varchar(128) NOT NULL,
  `time2` varchar(128) NOT NULL,
  `time3` varchar(128) NOT NULL,
  `time4` varchar(128) NOT NULL,
  `time5` varchar(128) NOT NULL,
  `time6` varchar(128) NOT NULL,
  `roominfo` text NOT NULL,
  `operator_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `comments` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity_time
-- ----------------------------
INSERT INTO `activity_time` VALUES ('1', '1', '2018-09-28', '8:00-9:50', '10:10-12:00', '13:30-15:20', '15:30-17:30', '18:30-20:30', '20:30-21:00', '博学楼201', '1', '1', '无');
INSERT INTO `activity_time` VALUES ('2', '6', '2018-09-28', '02:03', '02:02', '03:03', '', '', '', '青岛大学数据科学与软件工程学院', '1', '0', '');
INSERT INTO `activity_time` VALUES ('3', '6', '2018-09-29', '08:00', '10:00', '11:00', '', '', '', '青岛大学数据科学与软件工程学院', '1', '0', '');
INSERT INTO `activity_time` VALUES ('4', '10', '2018-10-17', '08:00', '12:00', '14:00', '17:00', '19:00', '21:00', '青岛大学数据科学与软件工程学院', '1', '0', '15点开会');
INSERT INTO `activity_time` VALUES ('5', '10', '2018-10-01', '08:00', '12:00', '14:00', '17:00', '19:00', '21:00', '青岛大学数据科学与软件工程学院', '1', '0', '早上9点填就业登记表');

-- ----------------------------
-- Table structure for `activity_user`
-- ----------------------------
DROP TABLE IF EXISTS `activity_user`;
CREATE TABLE `activity_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT '0',
  `niki` varchar(32) NOT NULL,
  `pass` varchar(128) NOT NULL DEFAULT '123',
  `name` varchar(16) NOT NULL,
  `sex` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `tel` varchar(32) NOT NULL,
  `qq` varchar(128) NOT NULL,
  `classinfo` varchar(128) DEFAULT NULL,
  `ylevel` int(11) DEFAULT NULL,
  `glevel` int(11) DEFAULT NULL,
  `slevel` int(11) DEFAULT NULL,
  `school_id` int(11) NOT NULL,
  `college_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `info` varchar(128) DEFAULT NULL,
  `createdate` varchar(128) DEFAULT NULL,
  `operator_id` int(11) NOT NULL,
  `comments` varchar(128) DEFAULT NULL,
  `gstatus` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity_user
-- ----------------------------
INSERT INTO `activity_user` VALUES ('1', '0', '13249496750', '123', '刘明辉', '0', '0', '13249496750', '1960008141', 'Java04', '0', '1', '2', '1', '1', '0', '11', '2018-09-14', '1', null, '1');
INSERT INTO `activity_user` VALUES ('2', '0', 'cyw', '123', '陈玉伟', '0', '0', '17863902943', '4', 'java05', '0', '0', '0', '2', '2', '0', 'java04', '2018-09-14', '1', 'a', '1');
INSERT INTO `activity_user` VALUES ('3', '5', '李克勤', '123', '李克勤', '0', '0', '13245583290', '1431482390', 'java05', '0', '0', '1', '2', '2', '0', '0', '2018-09-14', '1', null, '1');
INSERT INTO `activity_user` VALUES ('4', '0', '崔天琪', '123', '崔天琪', '0', '0', '115864902493', '974745591', 'java01', '0', '0', '3', '2', '2', '0', '0', '2018-09-14', '1', '', '0');
INSERT INTO `activity_user` VALUES ('6', '0', '王海坤', '123', '王海坤', '0', '0', '150143293021', '141265608', 'java05', '0', '0', '2', '1', '1', '0', 'java05', '2018-09-27', '1', 'aa', '1');
INSERT INTO `activity_user` VALUES ('26', '0', 'xx', '123', '刘兴晖', '0', '0', '13245683309', '23478548', 'java05', '0', '0', '0', '1', '1', '0', 'java04', '2018-09-27', '1', 'aa', '1');
INSERT INTO `activity_user` VALUES ('27', '0', 'asdas', '123', '崔天气', '0', '0', '150 1432 9306', '4352', 'java05', '0', '0', '0', '1', '1', '0', 'java04', '2018-09-28', '1', 'aa', '1');
INSERT INTO `activity_user` VALUES ('28', '0', 'cyw', '123', '崔地气', '0', '0', '13244683909', '436237634', 'java05', '0', '0', '0', '1', '1', '0', 'java04', '2018-09-28', '1', 'aa', '1');
INSERT INTO `activity_user` VALUES ('29', '0', 'cyw', '123', '崔七七', '0', '0', '13244683909', '436237634', 'java05', '0', '0', '0', '1', '1', '0', 'java04', '2018-09-28', '1', 'aa', '0');
INSERT INTO `activity_user` VALUES ('30', '0', 'cyw', '123', '崔天琪r', '0', '0', '13244683909', '436237634', 'java05', '0', '0', '0', '1', '1', '0', 'java04', '2018-09-28', '1', 'aa', '0');
INSERT INTO `activity_user` VALUES ('31', '0', 'cyw', '123', '崔天琪e', '0', '0', '13244683909', '436237634', 'java05', '0', '0', '0', '1', '1', '0', 'java04', '2018-09-28', '1', 'aa', '0');
INSERT INTO `activity_user` VALUES ('32', '0', 'cyw', '123', '崔天琪w', '0', '0', '13244683909', '436237634', 'java05', '0', '0', '0', '1', '1', '0', 'java04', '2018-09-28', '1', 'aa', '1');
INSERT INTO `activity_user` VALUES ('33', '0', 'xx3', '123', '崔天琪h', '0', '0', '17860902943', '43623769', 'java05', '0', '0', '0', '1', '1', '0', 'java04', '2018-09-28', '1', 'aa', '0');
INSERT INTO `activity_user` VALUES ('34', '0', 'xx', '123', '崔天', '0', '0', '17865902943', '43622762', 'java05', '0', '0', '0', '1', '1', '0', 'java04', '2018-09-28', '1', 'aa', '0');
INSERT INTO `activity_user` VALUES ('35', '0', 'xx', '123', '小崔', '0', '0', '17863902943', '4', 'java05', '0', '0', '0', '1', '1', '0', 'java04', '2018-09-28', '1', 'aa', '0');
INSERT INTO `activity_user` VALUES ('36', '0', '3242352', '123', '小崔', '0', '0', '525', '663367', '4242', '0', '0', '0', '1', '1', '0', 'java04', '2018-09-28', '1', 'aa', '1');
INSERT INTO `activity_user` VALUES ('37', '0', 'xxSS', '123', '安卓', '0', '0', '17863590243', '4234234', 'java05', '0', '0', '0', '1', '1', '0', 'java04', '2018-09-29', '1', 'aa', '0');
INSERT INTO `activity_user` VALUES ('38', '0', 'xx', '123', '玉为', '0', '0', '13245683909', '436823762', 'java05', '0', '0', '0', '1', '1', '0', 'java04', '2018-10-06', '1', 'aa', '0');
INSERT INTO `activity_user` VALUES ('39', '0', 'x', '123', '学习', '0', '0', '17863982943', '454835', 'Java05', '0', '0', '0', '1', '1', '0', 'java04', '2018-10-06', '1', 'aa', '0');
INSERT INTO `activity_user` VALUES ('40', '0', 'xx', '123', '奋斗', '0', '0', '13245683909', '42349234', 'java05', '0', '0', '0', '1', '1', '0', 'java04', '2018-10-06', '1', 'aa', '0');
INSERT INTO `activity_user` VALUES ('41', '41', 'xx', '123', '建国', '0', '0', '178639029943', '436823762', 'java05', '0', '0', '0', '1', '1', '0', 'java04', '2018-10-06', '1', 'aa', '0');
INSERT INTO `activity_user` VALUES ('42', '0', '陈违约', '123', '陈违约', '0', '0', '13145403560', '135836939', 'java05', '0', '0', '0', '1', '1', '0', 'java04', '2018-10-06', '1', 'aa', '0');
INSERT INTO `activity_user` VALUES ('43', '0', '陈违约', '123', '陈违约y', '0', '0', '17863902943', '439623762', 'java05', '0', '0', '0', '1', '1', '0', 'java04', '2018-10-06', '1', 'aa', '1');
INSERT INTO `activity_user` VALUES ('44', '0', '陈违约', '123', '陈违约x', '0', '0', '13295683909', '43623062', 'java05', '0', '0', '0', '1', '1', '0', 'java04', '2018-10-06', '1', '12', '0');
INSERT INTO `activity_user` VALUES ('45', '0', 'llll', '123', '李俊', '0', '1', '00000000000000', '9999999999999999', 'java05', '0', '0', '0', '1', '1', '0', 'java04', '2018-10-06', '1', 'aa', '0');
INSERT INTO `activity_user` VALUES ('46', '0', '78h', '123', '张加传', '0', '1', '150 14328306', '43623769234', 'java05', '0', '0', '0', '1', '1', '0', 'java04', '2018-10-06', '1', 'aa', '0');
INSERT INTO `activity_user` VALUES ('47', '1', 'xx', '123', '王琳', '0', '1', '17863902943', '4', 'java05', '0', '0', '0', '1', '1', '0', 'java04', '2018-10-07', '1', 'aa', '0');
INSERT INTO `activity_user` VALUES ('48', '0', 'xxggg', '123', '裕昌', '0', '0', '17863902943gg', '4', '4242', '0', '0', '0', '1', '1', '0', 'java04', '2018-10-07', '1', '12', '0');

-- ----------------------------
-- Table structure for `activity_usergroup`
-- ----------------------------
DROP TABLE IF EXISTS `activity_usergroup`;
CREATE TABLE `activity_usergroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `ids` varchar(128) DEFAULT NULL,
  `project` varchar(128) DEFAULT NULL,
  `path` varchar(128) DEFAULT NULL,
  `point1` int(11) DEFAULT NULL,
  `point2` int(11) DEFAULT '0',
  `point3` int(11) DEFAULT '0',
  `point4` int(11) DEFAULT '0',
  `point5` int(11) DEFAULT '0',
  `point6` int(11) DEFAULT '0',
  `point7` int(11) DEFAULT '0',
  `point8` int(11) DEFAULT '0',
  `point9` int(11) DEFAULT '0',
  `point10` int(11) DEFAULT '0',
  `createdate` varchar(128) DEFAULT NULL,
  `operator_id` int(11) NOT NULL,
  `comments` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity_usergroup
-- ----------------------------
INSERT INTO `activity_usergroup` VALUES ('1', '1', null, '1,2', '会员管理系统', '', null, null, null, null, null, null, null, null, null, null, '2018-09-23', '1', '');
INSERT INTO `activity_usergroup` VALUES ('3', '5', null, '3', '会员管理系统', null, '90', '80', '78', '89', '76', '0', '90', '87', '78', '89', '2018-09-26', '1', null);
INSERT INTO `activity_usergroup` VALUES ('4', '6', 'xx', '26,27,43', 's', 's', '90', '80', '68', '89', '98', '78', '75', '89', '78', '67', '2018-09-27', '1', '');
INSERT INTO `activity_usergroup` VALUES ('5', '6', 'xx', '6', 's', 's', '98', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2018-09-28', '1', null);
INSERT INTO `activity_usergroup` VALUES ('6', '6', 'xx', '32,36', 's', 's', null, '0', '0', '0', '0', '0', '0', '0', '0', '0', '2018-09-29', '1', '');
INSERT INTO `activity_usergroup` VALUES ('7', '10', '小组一', '28', '会员管理系统', 's', null, '0', '0', '0', '0', '0', '0', '0', '0', '0', '2018-10-08', '1', '');
INSERT INTO `activity_usergroup` VALUES ('8', '10', 'xx', '48', 's', '', null, '0', '0', '0', '0', '0', '0', '0', '0', '0', '2018-10-11', '1', null);
