/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : 1

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2016-03-27 19:21:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `ebcms_article`
-- ----------------------------
DROP TABLE IF EXISTS `ebcms_article`;
CREATE TABLE `ebcms_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '节点ID',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '简介',
  `thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '缩略图',
  `tpl` varchar(255) NOT NULL DEFAULT '' COMMENT '模板',
  `ext` text COMMENT '扩展信息',
  `click` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击量',
  `mark` varchar(255) NOT NULL DEFAULT '' COMMENT '标志',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `baidu` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否被百度收录',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `locked` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '锁定',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='文章基本内容表';

-- ----------------------------
-- Records of ebcms_article
-- ----------------------------
INSERT INTO `ebcms_article` VALUES ('1', '1', '公司简介', '易贝网络科技 易贝cms', '四川易贝网络科技有限公司成立于2015年8月，由5名刚毕业的大学生共同创立。', '', '', null, '14', 'gsjj', '0', '0', '1459075074', '1459074966', '0', '1', '0');
INSERT INTO `ebcms_article` VALUES ('2', '1', '联系我们', '易贝网络公司地址', '地址：成都高新区环球中心A座13楼电话：18000534006', '', '', null, '12', 'lxwm', '0', '0', '1459075081', '1459075008', '0', '1', '0');
INSERT INTO `ebcms_article` VALUES ('3', '1', '人才招聘', '招聘 php工程师 前端工程师', 'PHP工程师 1名&nbsp;1、精通php开发，熟悉常用的相关开源技术模块&nbsp;&nbsp;2、精通MYSQL，熟悉配置、维护、性能优化；熟悉各种条件查询、复合查询等的编写能力；并有良好的数据设计能力；&nbsp;3、熟悉相关Web开发技术，了解HTML、Javascript、XML、CSS、Ajax等技术；&nbsp;4、有大量的跨语言/跨平台/多系统协同应等复杂系统用开发经验。前端工程师 3名&nbsp;1、精通各种前端技术，包括HTML/CSS/JavaScript/Node.JS', '', '', null, '15', '', '0', '0', '1459075056', '1459075056', '0', '1', '0');
INSERT INTO `ebcms_article` VALUES ('4', '2', '易贝内容管理系统正式发布！', 'ebcms发布 ebcms 易贝内容管理系统', '易贝企业内容管理系统是由四川易贝网络公司自主开发的一套供企业用户管理自家官网的内容管理系统，我们深刻的考虑到企业用户的需求以及人员专业能力，在综合了市面上主流的企业内容管理系统之后，我们的开发团队开发除了这样一款优秀的企业内容管理系统我们的系统在功能和操作实用以及二次开发便利性等三个方面做了更多的考虑权衡，我们的这套企业内容管理系统更适合企业网站建设！', '', '', null, '1', '', '0', '0', '1459075181', '1459075181', '0', '1', '0');
INSERT INTO `ebcms_article` VALUES ('5', '2', '易贝后台开发框架开源发布', '易贝后台框架 易贝后台开发框架', '易贝后台开发框架是四川易贝网络公司自主开发的一套共开发者使用的后台开发框架，综合多种系统，吸纳大量前辈的开发经验，总结除了这么一套在日常系统开发中经常用到的或是必不可少的一些基础功能，我们将这些基础功能集成在一个系统中，这对于开发者来说，无意是快捷开发的一件利器。', '', '', null, '0', '', '0', '0', '1459075218', '1459075218', '0', '1', '0');
INSERT INTO `ebcms_article` VALUES ('6', '3', '关于三八妇女节放假的通知', '放假 妇女节', '经公司研究决定，三八妇女节放假1天，请各部门做好放假前相关事宜。', '', '', null, '2', '', '0', '0', '1459075264', '1459075264', '0', '1', '0');

-- ----------------------------
-- Table structure for `ebcms_article_body`
-- ----------------------------
DROP TABLE IF EXISTS `ebcms_article_body`;
CREATE TABLE `ebcms_article_body` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '节点ID',
  `body` text NOT NULL COMMENT '内容主体',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='文章详细内容表';

-- ----------------------------
-- Records of ebcms_article_body
-- ----------------------------
INSERT INTO `ebcms_article_body` VALUES ('1', '&lt;p&gt;四川易贝网络科技有限公司成立于2015年8月，由5名刚毕业的大学生共同创立。&lt;/p&gt;');
INSERT INTO `ebcms_article_body` VALUES ('2', '&lt;p&gt;地址：成都高新区环球中心A座13楼&lt;/p&gt;&lt;p&gt;电话：18000534006&lt;/p&gt;');
INSERT INTO `ebcms_article_body` VALUES ('3', '&lt;h3&gt;PHP工程师 1名&lt;/h3&gt;&lt;p&gt;&amp;nbsp;1、精通php开发，熟悉常用的相关开源技术模块&amp;nbsp;&lt;/p&gt;&lt;p&gt;&amp;nbsp;2、精通MYSQL，熟悉配置、维护、性能优化；熟悉各种条件查询、复合查询等的编写能力；并有良好的数据设计能力；&lt;/p&gt;&lt;p&gt;&amp;nbsp;3、熟悉相关Web开发技术，了解HTML、Javascript、XML、CSS、Ajax等技术；&lt;/p&gt;&lt;p&gt;&amp;nbsp;4、有大量的跨语言/跨平台/多系统协同应等复杂系统用开发经验。&lt;/p&gt;&lt;h3&gt;前端工程师 3名&lt;br style=&quot;box-sizing: border-box; outline: none;&quot;/&gt;&lt;/h3&gt;&lt;p&gt;&amp;nbsp;1、精通各种前端技术，包括HTML/CSS/JavaScript/Node.JS等；&amp;nbsp;&lt;/p&gt;&lt;p&gt;&amp;nbsp;2、对前端工程化与模块化开发有一定了解，并有实践经验（如RequireJS/SeaJS/jquery等）；&amp;nbsp;&lt;/p&gt;&lt;p&gt;&amp;nbsp;3、熟悉一门非前端的语言（如Java/PHP/C/C++/Python/Ruby）；&amp;nbsp;&lt;/p&gt;&lt;p&gt;&amp;nbsp;4、具备良好的团队协作精神，能利用自身技术能力提升团队整体研发效率，提高团队影响力；&lt;/p&gt;&lt;p&gt;&amp;nbsp;5、对前端技术有持续的热情，个性乐观开朗，逻辑性强，善于和各种背景的人合作。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;');
INSERT INTO `ebcms_article_body` VALUES ('4', '&lt;p&gt;易贝企业内容管理系统是由四川易贝网络公司自主开发的一套供企业用户管理自家官网的内容管理系统，我们深刻的考虑到企业用户的需求以及人员专业能力，在综合了市面上主流的企业内容管理系统之后，我们的开发团队开发除了这样一款优秀的企业内容管理系统&lt;/p&gt;&lt;p&gt;&lt;br style=&quot;box-sizing: border-box; outline: none;&quot;/&gt;&lt;/p&gt;&lt;p&gt;我们的系统在功能和操作实用以及二次开发便利性等三个方面做了更多的考虑权衡，我们的这套企业内容管理系统更适合企业网站建设！&lt;/p&gt;');
INSERT INTO `ebcms_article_body` VALUES ('5', '&lt;p&gt;易贝后台开发框架是四川易贝网络公司自主开发的一套共开发者使用的后台开发框架，综合多种系统，吸纳大量前辈的开发经验，总结除了这么一套在日常系统开发中经常用到的或是必不可少的一些基础功能，我们将这些基础功能集成在一个系统中，这对于开发者来说，无意是快捷开发的一件利器。&lt;/p&gt;');
INSERT INTO `ebcms_article_body` VALUES ('6', '&lt;p&gt;经公司研究决定，三八妇女节放假1天，请各部门做好放假前相关事宜。&lt;/p&gt;');

-- ----------------------------
-- Table structure for `ebcms_article_category`
-- ----------------------------
DROP TABLE IF EXISTS `ebcms_article_category`;
CREATE TABLE `ebcms_article_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '节点ID',
  `pid` int(10) unsigned NOT NULL COMMENT '父ID',
  `mark` varchar(255) NOT NULL DEFAULT '' COMMENT '标识',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '简介',
  `model` varchar(255) NOT NULL DEFAULT '' COMMENT '模型',
  `ext` text COMMENT '扩展信息',
  `pagenum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分页大小',
  `tpl` varchar(255) NOT NULL DEFAULT '' COMMENT '模板',
  `tpl_detail` varchar(255) NOT NULL DEFAULT '' COMMENT '内容页模板',
  `datatype` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '读取内容',
  `order` varchar(255) NOT NULL DEFAULT 'id desc' COMMENT '排序',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `locked` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否锁定',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='文章分类表';

-- ----------------------------
-- Records of ebcms_article_category
-- ----------------------------
INSERT INTO `ebcms_article_category` VALUES ('1', '0', 'gongsixiangguan', '公司相关', '', '', '', null, '20', '', '', '1', 'id desc', '1459074709', '1459074709', '0', '1', '0');
INSERT INTO `ebcms_article_category` VALUES ('2', '0', 'gongsidongtai', '公司动态', '', '', '', null, '20', '', '', '1', 'id desc', '1459074743', '1459074743', '0', '1', '0');
INSERT INTO `ebcms_article_category` VALUES ('3', '0', 'tongzhigonggao', '通知公告', '', '', '', null, '20', '', '', '1', 'id desc', '1459074760', '1459074760', '0', '1', '0');

-- ----------------------------
-- Table structure for `ebcms_attachment`
-- ----------------------------
DROP TABLE IF EXISTS `ebcms_attachment`;
CREATE TABLE `ebcms_attachment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '图片id',
  `uid` int(11) unsigned NOT NULL DEFAULT '1' COMMENT 'userid',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `instruction` varchar(255) NOT NULL DEFAULT '' COMMENT '图片说明',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '原始名称',
  `type` varchar(255) NOT NULL DEFAULT '',
  `size` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '图片大小',
  `ext` varchar(20) NOT NULL DEFAULT '' COMMENT '类型',
  `md5` varchar(32) NOT NULL DEFAULT '' COMMENT 'md5',
  `sha1` char(40) NOT NULL DEFAULT '',
  `savename` varchar(200) NOT NULL DEFAULT '' COMMENT '地区英文名称',
  `savepath` varchar(200) NOT NULL DEFAULT '' COMMENT '保存路径',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `sort` int(11) unsigned NOT NULL DEFAULT '99' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '审核状态',
  `locked` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '锁定',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表';

-- ----------------------------
-- Records of ebcms_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for `ebcms_auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `ebcms_auth_group`;
CREATE TABLE `ebcms_auth_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `group` varchar(255) NOT NULL DEFAULT '' COMMENT '分组',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '简介',
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` text NOT NULL COMMENT '规则',
  `c_rules` text NOT NULL COMMENT '栏目权限规则',
  `menus` text NOT NULL COMMENT '菜单权限',
  `iconcls` varchar(255) NOT NULL DEFAULT '' COMMENT '小图标',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '99' COMMENT '排序',
  `locked` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '锁定',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='后台账户分组表';

-- ----------------------------
-- Records of ebcms_auth_group
-- ----------------------------
INSERT INTO `ebcms_auth_group` VALUES ('1', '0', '系统', '', '管理员', '1', '2,3,5,193,194,195,8,44,45,46,47,48,9,49,50,51,52,53,11,59,60,61,62,63,12,64,65,66,67,68,161,13,69,70,71,72,73,14,74,75,76,77,78,162,163,15,79,80,81,82,83,164,18,90,91,92,19,93,94,95,96,20,97,98,99,100,101,102,103,21,104,105,106,107,108,167,168,22,109,110,111,112,113,23,114,115,116,117,118,26,128,129,130,28,140,169,30,150,196,6,35,34,36,37,38,7,39,40,41,42,43,197,10,54,55,56,57,58', '', '72,74,79,80,81,95,96,6,13,92,98,103,100,105,106', '', '99', '1');
INSERT INTO `ebcms_auth_group` VALUES ('2', '0', '系统', '', '工程师', '1', '2,3,5,193,194,195,8,44,45,46,48,9,49,50,51,53,11,59,60,61,63,12,64,65,66,68,161,13,69,70,71,73,19,93,94,96,196,6,35,34,36,37,7,39,40,41,43,197,10,54,55,56,58', '', '72,74,79,80,81,95,117,96,6', '', '99', '1');
INSERT INTO `ebcms_auth_group` VALUES ('3', '0', '系统', '', '编辑', '1', '2,3,193,194,195,64,65,66,68,161,196,7,39,40,41,43', '', '72,74,95', '', '99', '1');
INSERT INTO `ebcms_auth_group` VALUES ('4', '0', '系统', '', '客服', '1', '2,3,193,194,195,13,69,70,71,73,14,74,162,197,10,54,55,56,58,223,224,225,226,227,228,229,230,231,232,233', '', '72,80,81', '', '99', '1');

-- ----------------------------
-- Table structure for `ebcms_auth_group_access`
-- ----------------------------
DROP TABLE IF EXISTS `ebcms_auth_group_access`;
CREATE TABLE `ebcms_auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='后台账号角色权限表';

-- ----------------------------
-- Records of ebcms_auth_group_access
-- ----------------------------
INSERT INTO `ebcms_auth_group_access` VALUES ('8', '1');
INSERT INTO `ebcms_auth_group_access` VALUES ('9', '1');

-- ----------------------------
-- Table structure for `ebcms_auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `ebcms_auth_rule`;
CREATE TABLE `ebcms_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `group` varchar(255) NOT NULL DEFAULT '' COMMENT '分组',
  `name` char(80) NOT NULL DEFAULT '',
  `title` char(20) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `condition` char(100) NOT NULL DEFAULT '',
  `iconcls` varchar(255) NOT NULL DEFAULT '' COMMENT '小图标',
  `sort` int(4) unsigned NOT NULL DEFAULT '99' COMMENT '排序',
  `locked` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '锁定',
  `sys_mark` varchar(255) NOT NULL DEFAULT '' COMMENT '系统标志',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=234 DEFAULT CHARSET=utf8 COMMENT='后台账户权限规则表';

-- ----------------------------
-- Records of ebcms_auth_rule
-- ----------------------------
INSERT INTO `ebcms_auth_rule` VALUES ('2', '0', '节点权限', 'Admin', '核心后台', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('3', '2', '节点权限', 'Admin_Index_index', '首页', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('5', '3', '节点权限', 'Admin_Index_runtime', '清理缓存', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('6', '196', '节点权限', 'Article_Category_index', '文章分类', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('7', '196', '节点权限', 'Article_Article_index', '文章管理', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('8', '2', '节点权限', 'Admin_Navcate_index', '导航分类', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('9', '2', '节点权限', 'Admin_Nav_index', '导航管理', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('10', '197', '节点权限', 'Link_Link_index', '友情链接', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('35', '6', '节点权限', 'Article_Category_save', '修改 文章分类', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('11', '2', '节点权限', 'Admin_Recommendcate_index', '推荐分类', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('12', '2', '节点权限', 'Admin_Recommend_index', '推荐管理', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('13', '2', '节点权限', 'Admin_Guestbook_index', '留言管理', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('14', '2', '节点权限', 'Admin_User_index', '会员管理', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('15', '2', '节点权限', 'Admin_Group_index', '会员组别管理', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('18', '2', '节点权限', 'Admin_Template_index', '模板管理', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('19', '2', '节点权限', 'Admin_Attachment_index', '附件管理', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('20', '2', '节点权限', 'Admin_Database_index', '数据库管理', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('21', '2', '节点权限', 'Admin_Cron_index', '定时任务管理', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('22', '2', '节点权限', 'Admin_Model_index', '模型管理', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('23', '2', '节点权限', 'Admin_Modelfield_index', '模型字段管理', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('26', '2', '节点权限', 'Admin_Datadict_index', '数据字典', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('28', '2', '节点权限', 'Admin_Config_index', '配置管理', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('30', '2', '节点权限', 'Admin_Conf_index', '核心配置管理', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('34', '6', '节点权限', 'Article_Category_add', '添加 文章分类', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('36', '6', '节点权限', 'Article_Category_status', '审核 文章分类', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('37', '6', '节点权限', 'Article_Category_delete', '删除 文章分类', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('38', '6', '节点权限', 'Article_Category_lock', '锁定 文章分类', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('39', '7', '节点权限', 'Article_Article_add', '添加 文章', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('40', '7', '节点权限', 'Article_Article_save', '修改 文章', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('41', '7', '节点权限', 'Article_Article_status', '审核 文章', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('42', '7', '节点权限', 'Article_Article_lock', '锁定 文章', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('43', '7', '节点权限', 'Article_Article_delete', '删除 文章', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('44', '8', '节点权限', 'Admin_Navcate_add', '添加 导航分类', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('45', '8', '节点权限', 'Admin_Navcate_save', '修改 导航分类', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('46', '8', '节点权限', 'Admin_Navcate_status', '审核 导航分类', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('47', '8', '节点权限', 'Admin_Navcate_lock', '锁定 导航分类', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('48', '8', '节点权限', 'Admin_Navcate_delete', '删除 导航分类', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('49', '9', '节点权限', 'Admin_Nav_add', '添加 导航', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('50', '9', '节点权限', 'Admin_Nav_save', '修改 导航', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('51', '9', '节点权限', 'Admin_Nav_status', '审核 导航', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('52', '9', '节点权限', 'Admin_Nav_lock', '锁定 导航', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('53', '9', '节点权限', 'Admin_Nav_delete', '删除 导航', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('54', '10', '节点权限', 'Link_Link_add', '添加 友情链接', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('55', '10', '节点权限', 'Link_Link_save', '修改 友情链接', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('56', '10', '节点权限', 'Link_Link_status', '审核 友情链接', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('57', '10', '节点权限', 'Link_Link_lock', '锁定 友情链接', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('58', '10', '节点权限', 'Link_Link_delete', '删除 友情链接', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('59', '11', '节点权限', 'Admin_Recommendcate_add', '添加 推荐位', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('60', '11', '节点权限', 'Admin_Recommendcate_save', '修改 推荐位', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('61', '11', '节点权限', 'Admin_Recommendcate_status', '审核 推荐位', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('62', '11', '节点权限', 'Admin_Recommendcate_lock', '锁定 推荐位', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('63', '11', '节点权限', 'Admin_Recommendcate_delete', '删除 推荐位', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('64', '12', '节点权限', 'Admin_Recommend_add', '添加 推荐内容', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('65', '12', '节点权限', 'Admin_Recommend_save', '修改 推荐内容', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('66', '12', '节点权限', 'Admin_Recommend_status', '审核 推荐内容', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('67', '12', '节点权限', 'Admin_Recommend_lock', '锁定 推荐内容', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('68', '12', '节点权限', 'Admin_Recommend_delete', '删除 推荐内容', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('69', '13', '节点权限', 'Admin_Guestbook_save', '修改 留言', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('70', '13', '节点权限', 'Admin_Guestbook_status', '审核 留言', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('71', '13', '节点权限', 'Admin_Guestbook_reply', '回复 留言', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('72', '13', '节点权限', 'Admin_Guestbook_lock', '锁定 留言', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('73', '13', '节点权限', 'Admin_Guestbook_delete', '删除 留言', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('74', '14', '节点权限', 'Admin_User_add', '添加 会员', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('75', '14', '节点权限', 'Admin_User_save', '修改 会员', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('76', '14', '节点权限', 'Admin_User_status', '审核 会员', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('77', '14', '节点权限', 'Admin_User_lock', '锁定 会员', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('78', '14', '节点权限', 'Admin_User_delete', '删除 会员', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('79', '15', '节点权限', 'Admin_Group_add', '添加 会员组', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('80', '15', '节点权限', 'Admin_Group_save', '修改 会员组', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('81', '15', '节点权限', 'Admin_Group_status', '审核 会员组', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('82', '15', '节点权限', 'Admin_Group_lock', '锁定 会员组', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('83', '15', '节点权限', 'Admin_Group_delete', '删除 会员组', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('90', '18', '节点权限', 'Admin_Template_add', '添加 模板', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('91', '18', '节点权限', 'Admin_Template_save', '修改 模板', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('92', '18', '节点权限', 'Admin_Template_delete', '删除 模板', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('93', '19', '节点权限', 'Admin_Attachment_save', '修改 附件', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('94', '19', '节点权限', 'Admin_Attachment_status', '审核 附件', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('95', '19', '节点权限', 'Admin_Attachment_lock', '锁定 附件', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('96', '19', '节点权限', 'Admin_Attachment_delete', '删除 附件', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('97', '20', '节点权限', 'Admin_Database_exports', '备份 数据库', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('98', '20', '节点权限', 'Admin_Database_showcreate', '查看 表信息', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('99', '20', '节点权限', 'Admin_Database_repair', '修复 数据库', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('100', '20', '节点权限', 'Admin_Database_optimize', '优化 数据库', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('101', '20', '节点权限', 'Admin_Database_delete', '删除 备份', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('102', '20', '节点权限', 'Admin_Database_imports', '还原 备份', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('103', '20', '节点权限', 'Admin_Database_showsql', '预览 备份包', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('104', '21', '节点权限', 'Admin_Cron_add', '添加 定时任务', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('105', '21', '节点权限', 'Admin_Cron_save', '修改 定时任务', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('106', '21', '节点权限', 'Admin_Cron_status', '审核 定时任务', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('107', '21', '节点权限', 'Admin_Cron_lock', '锁定 定时任务', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('108', '21', '节点权限', 'Admin_Cron_delete', '删除 定时任务', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('109', '22', '节点权限', 'Admin_Model_add', '添加 模型', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('110', '22', '节点权限', 'Admin_Model_save', '修改 模型', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('111', '22', '节点权限', 'Admin_Model_status', '审核 模型', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('112', '22', '节点权限', 'Admin_Model_lock', '锁定 模型', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('113', '22', '节点权限', 'Admin_Model_delete', '删除 模型', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('114', '23', '节点权限', 'Admin_Modelfield_add', '添加 模型字段', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('115', '23', '节点权限', 'Admin_Modelfield_save', '修改 模型字段', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('116', '23', '节点权限', 'Admin_Modelfield_status', '审核 模型字段', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('117', '23', '节点权限', 'Admin_Modelfield_lock', '锁定 模型字段', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('118', '23', '节点权限', 'Admin_Modelfield_delete', '删除 模型字段', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('128', '26', '节点权限', 'Admin_Datadict_delete', '删除 数据字典', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('129', '26', '节点权限', 'Admin_Datadict_add', '添加 数据字典', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('130', '26', '节点权限', 'Admin_Datadict_save', '修改 数据字典', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('140', '28', '节点权限', 'Admin_Config_save', '修改 配置', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('150', '30', '节点权限', 'Admin_Conf_save', '修改 核心配置', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('161', '12', '节点权限', 'Admin_Recommend_push', '推送到推荐位', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('162', '14', '节点权限', 'Admin_User_password', '重置密码', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('163', '14', '节点权限', 'Admin_User_group', '分配用户组', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('164', '15', '节点权限', 'Admin_Group_rule', '分配权限', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('167', '21', '节点权限', 'Admin_Cron_build', '生成 定时任务', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('168', '21', '节点权限', 'Admin_Cron_config', '配置 定时任务', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('169', '28', '节点权限', 'Admin_Config_build', '生成 配置', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('193', '3', '节点权限', 'Admin_Index_ueditor', '编辑器 附件上传', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('194', '3', '节点权限', 'Admin_Index_upload', '附件上传', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('195', '3', '节点权限', 'Admin_Index_password', '修改密码', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('196', '0', '节点权限', 'Article', '文章模块', '1', '1', '', '', '99', '1', '');
INSERT INTO `ebcms_auth_rule` VALUES ('197', '0', '节点权限', 'Link', '友情链接模块', '1', '1', '', '', '99', '1', '');

-- ----------------------------
-- Table structure for `ebcms_behavior`
-- ----------------------------
DROP TABLE IF EXISTS `ebcms_behavior`;
CREATE TABLE `ebcms_behavior` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `behavior` varchar(255) NOT NULL DEFAULT '' COMMENT '行为名称',
  `hook` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `module` varchar(255) NOT NULL DEFAULT '' COMMENT '生效模块',
  `iconcls` varchar(20) NOT NULL DEFAULT '' COMMENT '图标类',
  `instruction` varchar(255) NOT NULL DEFAULT '' COMMENT '说明',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `sort` int(4) unsigned NOT NULL DEFAULT '99' COMMENT '排序',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `locked` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '锁定',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='行为表';

-- ----------------------------
-- Records of ebcms_behavior
-- ----------------------------
INSERT INTO `ebcms_behavior` VALUES ('22', '0', 'Common\\\\Behavior\\\\CronRunBehavior', 'app_end', 'Common', 'icon-zone', '', '1970', '1970', '1', '1', '1');
INSERT INTO `ebcms_behavior` VALUES ('19', '0', 'Behavior\\\\TokenBuildBehavior', 'view_filter', 'Common', 'icon-zone', '', '1970', '1970', '1', '1', '1');
INSERT INTO `ebcms_behavior` VALUES ('24', '0', 'Home\\\\Behavior\\\\ClickBehavior', 'app_end', 'Home', 'icon-time', '', '1970', '1970', '1', '1', '1');
INSERT INTO `ebcms_behavior` VALUES ('26', '0', 'Home\\\\Behavior\\\\MobileBehavior', 'home_init', 'Home', '', '', '0', '0', '0', '1', '1');

-- ----------------------------
-- Table structure for `ebcms_conf`
-- ----------------------------
DROP TABLE IF EXISTS `ebcms_conf`;
CREATE TABLE `ebcms_conf` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `title` varchar(250) NOT NULL DEFAULT '' COMMENT '标题',
  `name` char(40) NOT NULL DEFAULT '' COMMENT '配置项',
  `value` text COMMENT '配置值',
  `render` varchar(255) NOT NULL DEFAULT '' COMMENT '类型',
  `form` varchar(255) NOT NULL DEFAULT '' COMMENT '表单类型',
  `config` text COMMENT '类型配置',
  `instruction` text COMMENT '说明',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `sort` int(4) unsigned NOT NULL DEFAULT '99' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `locked` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '锁定',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=187 DEFAULT CHARSET=utf8 COMMENT='基本配置表';

-- ----------------------------
-- Records of ebcms_conf
-- ----------------------------
INSERT INTO `ebcms_conf` VALUES ('1', '2', '0', '列出的文件类型', 'fileManagerAllowFiles', '.png\r\n.jpg\r\n.jpeg\r\n.gif\r\n.bmp\r\n.flv\r\n.swf\r\n.mkv\r\n.avi\r\n.rm\r\n.rmvb\r\n.mpeg\r\n.mpg\r\n.ogg\r\n.ogv\r\n.mov\r\n.wmv\r\n.mp4\r\n.webm\r\n.mp3\r\n.wav\r\n.mid\r\n.rar\r\n.zip\r\n.tar\r\n.gz\r\n.7z\r\n.bz2\r\n.cab\r\n.iso\r\n.doc\r\n.docx\r\n.xls\r\n.xlsx\r\n.ppt\r\n.pptx\r\n.pdf\r\n.txt\r\n.md\r\n.xml', 'item', 'form_multitextbox', '{\"height\":\"\",\"width\":\"\",\"maxlength\":\"\",\"minlength\":\"\",\"prompt\":\"\"}', '', '2016', '2015', '1', '1', '1');
INSERT INTO `ebcms_conf` VALUES ('2', '2', '0', '每次列出文件数量', 'fileManagerListSize', '20', 'number', 'form_numberbox', '{\"min\":1,\"max\":100,\"required\":true}', '', '2015', '2015', '1', '1', '1');
INSERT INTO `ebcms_conf` VALUES ('3', '2', '0', '文件访问路径前缀', 'fileManagerUrlPrefix', 'http://{{$_SERVER[\'HTTP_HOST\']}}{{__ROOT__}}{{__GROUP__}}/Uploads', 'string', 'form_textbox', '\"\"', '', '1457507340', '2015', '1', '1', '1');
INSERT INTO `ebcms_conf` VALUES ('4', '2', '0', '指定要列出文件的目录', 'fileManagerListPath', '/file/', 'string', 'form_textbox', '\"\"', '', '2015', '2015', '1', '1', '1');
INSERT INTO `ebcms_conf` VALUES ('5', '2', '0', '执行文件管理的action名称', 'fileManagerActionName', 'listfile', 'string', 'form_textbox', '\"\"', '', '2015', '2015', '1', '1', '1');
INSERT INTO `ebcms_conf` VALUES ('6', '2', '0', '列出的文件类型', 'imageManagerAllowFiles', '.png\r\n.jpg\r\n.jpeg\r\n.gif\r\n.bmp', 'item', 'form_multitextbox', '{\"height\":\"\",\"width\":\"\",\"maxlength\":\"\",\"minlength\":\"\",\"prompt\":\"\"}', '', '2016', '2015', '1', '1', '1');
INSERT INTO `ebcms_conf` VALUES ('7', '2', '0', '插入的图片浮动方式', 'imageManagerInsertAlign', 'none', 'string', 'form_textbox', '\"\"', '', '2015', '2015', '1', '1', '1');
INSERT INTO `ebcms_conf` VALUES ('8', '2', '0', '图片访问路径前缀', 'imageManagerUrlPrefix', 'http://{{$_SERVER[\'HTTP_HOST\']}}{{__ROOT__}}{{__GROUP__}}/Uploads', 'string', 'form_textbox', '\"\"', '', '1457507334', '2015', '1', '1', '1');
INSERT INTO `ebcms_conf` VALUES ('9', '2', '0', '每次列出文件数量', 'imageManagerListSize', '20', 'number', 'form_numberbox', '{\"min\":1,\"max\":100,\"requried\":true}', '', '2015', '2015', '1', '1', '1');
INSERT INTO `ebcms_conf` VALUES ('10', '2', '0', ' 指定要列出图片的目录', 'imageManagerListPath', '/image/', 'string', 'form_textbox', '\"\"', '', '2015', '2015', '1', '1', '1');
INSERT INTO `ebcms_conf` VALUES ('11', '2', '0', ' 执行图片管理的action名称', 'imageManagerActionName', 'listimage', 'string', 'form_textbox', '\"\"', '', '2015', '2015', '1', '1', '1');
INSERT INTO `ebcms_conf` VALUES ('12', '2', '0', '上传文件格式显示', 'fileAllowFiles', '.png\r\n.jpg\r\n.jpeg\r\n.gif\r\n.bmp\r\n.flv\r\n.swf\r\n.mkv\r\n.avi\r\n.rm\r\n.rmvb\r\n.mpeg\r\n.mpg\r\n.ogg\r\n.ogv\r\n.mov\r\n.wmv\r\n.mp4\r\n.webm\r\n.mp3\r\n.wav\r\n.mid\r\n.rar\r\n.zip\r\n.tar\r\n.gz\r\n.7z\r\n.bz2\r\n.cab\r\n.iso\r\n.doc\r\n.docx\r\n.xls\r\n.xlsx\r\n.ppt\r\n.pptx\r\n.pdf\r\n.txt\r\n.md\r\n.xml', 'item', 'form_multitextbox', '{\"height\":\"\",\"width\":\"\",\"maxlength\":\"\",\"minlength\":\"\",\"prompt\":\"\"}', '允许上传的附件类型', '2016', '2015', '1', '1', '0');
INSERT INTO `ebcms_conf` VALUES ('13', '2', '0', '上传大小限制', 'fileMaxSize', '51200000', 'number', 'form_numberbox', '{\"min\":1,\"max\":51200000,\"requried\":true}', '上传文件时候的文件大小限制', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_conf` VALUES ('14', '2', '0', ' 文件访问路径前缀', 'fileUrlPrefix', 'http://{{$_SERVER[\'HTTP_HOST\']}}{{__ROOT__}}{{__GROUP__}}/Uploads', 'string', 'form_textbox', '\"\"', '', '1457507328', '2015', '1', '1', '1');
INSERT INTO `ebcms_conf` VALUES ('15', '2', '0', '上传保存路径', 'filePathFormat', '/file/{yyyy}{mm}{dd}/', 'string', 'form_textbox', '\"\"', '', '2015', '2015', '1', '1', '1');
INSERT INTO `ebcms_conf` VALUES ('16', '2', '0', '提交的文件表单名称', 'fileFieldName', 'upfile', 'string', 'form_textbox', '\"\"', '', '2015', '2015', '1', '1', '1');
INSERT INTO `ebcms_conf` VALUES ('17', '2', '0', '执行上传视频的action名称', 'fileActionName', 'uploadfile', 'string', 'form_textbox', '\"\"', '', '2015', '2015', '1', '1', '1');
INSERT INTO `ebcms_conf` VALUES ('18', '2', '0', '上传视频格式显示', 'videoAllowFiles', '.flv\r\n.swf\r\n.mkv\r\n.avi\r\n.rm\r\n.rmvb\r\n.mpeg\r\n.mpg\r\n.ogg\r\n.ogv\r\n.mov\r\n.wmv\r\n.mp4\r\n.webm\r\n.mp3\r\n.wav\r\n.mid', 'item', 'form_multitextbox', '{\"height\":\"\",\"width\":\"\",\"maxlength\":\"\",\"minlength\":\"\",\"prompt\":\"\"}', '允许上传的视频格式', '2016', '2015', '1', '1', '0');
INSERT INTO `ebcms_conf` VALUES ('19', '2', '0', '上传大小限制', 'videoMaxSize', '102400000', 'string', 'form_numberbox', '\"\"', '视频上传大小限制', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_conf` VALUES ('20', '2', '0', '执行上传视频的action名称', 'videoActionName', 'uploadvideo', 'string', 'form_textbox', '\"\"', '', '2015', '2015', '1', '1', '1');
INSERT INTO `ebcms_conf` VALUES ('21', '2', '0', '提交的视频表单名称', 'videoFieldName', 'upfile', 'string', 'form_textbox', '\"\"', '', '2015', '2015', '1', '1', '1');
INSERT INTO `ebcms_conf` VALUES ('22', '2', '0', '上传保存路径', 'videoPathFormat', '/video/{yyyy}{mm}{dd}/', 'string', 'form_textbox', '\"\"', '', '2015', '2015', '1', '1', '1');
INSERT INTO `ebcms_conf` VALUES ('23', '2', '0', '视频访问路径前缀', 'videoUrlPrefix', 'http://{{$_SERVER[\'HTTP_HOST\']}}{{__ROOT__}}{{__GROUP__}}/Uploads', 'string', 'form_textbox', '\"\"', '', '1457507322', '2015', '1', '1', '1');
INSERT INTO `ebcms_conf` VALUES ('24', '2', '0', '抓取图片格式显示', 'catcherAllowFiles', '.png\r\n.jpg\r\n.jpeg\r\n.gif\r\n.bmp', 'item', 'form_multitextbox', '{\"height\":\"\",\"width\":\"\",\"maxlength\":\"\",\"minlength\":\"\",\"prompt\":\"\"}', '允许远程抓取的图片类型', '2016', '2015', '1', '1', '0');
INSERT INTO `ebcms_conf` VALUES ('25', '2', '0', '上传大小限制', 'catcherMaxSize', '2048000', 'number', 'form_numberbox', '\"\"', '远程抓取的文件大小限制', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_conf` VALUES ('26', '2', '0', '图片访问路径前缀', 'catcherUrlPrefix', 'http://{{$_SERVER[\'HTTP_HOST\']}}{{__ROOT__}}{{__GROUP__}}/Uploads', 'string', 'form_textbox', '\"\"', '', '1457507316', '2015', '1', '1', '1');
INSERT INTO `ebcms_conf` VALUES ('27', '2', '0', '上传保存路径', 'catcherPathFormat', '/image/{yyyy}{mm}{dd}/', 'string', 'form_textbox', '\"\"', '', '2015', '2015', '1', '1', '1');
INSERT INTO `ebcms_conf` VALUES ('28', '2', '0', '提交的图片列表表单名称', 'catcherFieldName', 'source', 'string', 'form_textbox', '\"\"', '', '2015', '2015', '1', '1', '1');
INSERT INTO `ebcms_conf` VALUES ('29', '2', '0', '执行抓取远程图片的action名称', 'catcherActionName', 'catchimage', 'string', 'form_textbox', '\"\"', '', '2015', '2015', '1', '1', '1');
INSERT INTO `ebcms_conf` VALUES ('30', '2', '0', '不必远程抓取的地址', 'catcherLocalDomain', '127.0.0.1\r\nlocalhost\r\nimg.baidu.com', 'item', 'form_multitextbox', '{\"height\":\"\",\"width\":\"\",\"maxlength\":\"\",\"minlength\":\"\",\"prompt\":\"\"}', '这些域名下面的图片不会被抓取到本地', '2016', '2015', '1', '1', '0');
INSERT INTO `ebcms_conf` VALUES ('31', '2', '0', '插入的图片浮动方式', 'snapscreenInsertAlign', 'none', 'string', 'form_textbox', '\"\"', '', '2015', '2015', '1', '1', '1');
INSERT INTO `ebcms_conf` VALUES ('32', '2', '0', '图片访问路径前缀', 'snapscreenUrlPrefix', 'http://{{$_SERVER[\'HTTP_HOST\']}}{{__ROOT__}}{{__GROUP__}}/Uploads', 'string', 'form_textbox', '\"\"', '', '1457507294', '2015', '1', '1', '1');
INSERT INTO `ebcms_conf` VALUES ('33', '2', '0', '上传保存路径', 'snapscreenPathFormat', '/image/{yyyy}{mm}{dd}/', 'string', 'form_textbox', '\"\"', '', '2015', '2015', '1', '1', '1');
INSERT INTO `ebcms_conf` VALUES ('34', '2', '0', '执行上传截图的action名称', 'snapscreenActionName', 'uploadimage', 'string', 'form_textbox', '\"\"', '', '2015', '2015', '1', '1', '1');
INSERT INTO `ebcms_conf` VALUES ('35', '2', '0', '插入的插图浮动方式', 'scrawlInsertAlign', 'none', 'string', 'form_textbox', '\"\"', '', '2015', '2015', '1', '1', '1');
INSERT INTO `ebcms_conf` VALUES ('36', '2', '0', '图片访问路径前缀', 'scrawlUrlPrefix', 'http://{{$_SERVER[\'HTTP_HOST\']}}{{__ROOT__}}{{__GROUP__}}/Uploads', 'string', 'form_textbox', '\"\"', '', '1457507300', '2015', '1', '1', '1');
INSERT INTO `ebcms_conf` VALUES ('37', '2', '0', '上传大小限制', 'scrawlMaxSize', '2048000', 'number', 'form_numberbox', '\"\"', '涂鸦上传的图片大小限制', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_conf` VALUES ('38', '2', '0', '涂鸦上传保存路径', 'scrawlPathFormat', '/image/{yyyy}{mm}{dd}/', 'string', 'form_textbox', '\"\"', '', '2015', '2015', '1', '1', '1');
INSERT INTO `ebcms_conf` VALUES ('39', '2', '0', '提交的图片表单名称', 'scrawlFieldName', 'upfile', 'string', 'form_textbox', '\"\"', '', '2015', '2015', '1', '1', '1');
INSERT INTO `ebcms_conf` VALUES ('40', '2', '0', '执行上传涂鸦的action名称', 'scrawlActionName', 'uploadscrawl', 'string', 'form_textbox', '\"\"', '', '2015', '2015', '1', '1', '1');
INSERT INTO `ebcms_conf` VALUES ('41', '2', '0', '图片上传保存路径', 'imagePathFormat', '/image/{yyyy}{mm}{dd}/', 'string', 'form_textbox', '\"\"', '/* {filename} 原文件名,配置这项需要注意中文乱码问题 */\r\n/* {rand:6} 随机数,后面的数字是随机数的位数 */\r\n/* {time} 时间戳 */\r\n/* {yyyy} 四位年份 */\r\n/* {yy} 两位年份 */\r\n/* {mm} 两位月份 */\r\n/* {dd} 两位日期 */\r\n/* {hh} 两位小时 */\r\n/* {ii} 两位分钟 */\r\n/* {ss} 两位秒 */\r\n/* 非法字符 \\ : * ? &quot; &lt; &gt; | */', '2015', '2015', '1', '1', '1');
INSERT INTO `ebcms_conf` VALUES ('42', '2', '0', '是否压缩图片', 'imageCompressEnable', '1', 'bool', 'form_bool', '\"\"', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_conf` VALUES ('43', '2', '0', '图片压缩最长边限制', 'imageCompressBorder', '1600', 'number', 'form_numberbox', '\"\"', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_conf` VALUES ('44', '2', '0', '插入的图片浮动方式', 'imageInsertAlign', 'none', 'string', 'form_textbox', '\"\"', '', '2015', '2015', '1', '1', '1');
INSERT INTO `ebcms_conf` VALUES ('45', '2', '0', '图片访问路径前缀', 'imageUrlPrefix', 'http://{{$_SERVER[\'HTTP_HOST\']}}{{__ROOT__}}{{__GROUP__}}/Uploads', 'string', 'form_textbox', '\"\"', '', '1457507307', '2015', '1', '1', '1');
INSERT INTO `ebcms_conf` VALUES ('46', '2', '0', '上传图片格式', 'imageAllowFiles', '.png\r\n.jpg\r\n.jpeg\r\n.gif\r\n.bmp', 'item', 'form_multitextbox', '{\"height\":\"\",\"width\":\"\",\"maxlength\":\"\",\"minlength\":\"\",\"prompt\":\"\"}', '图片上传功能的图片上传类型限制', '2016', '2015', '1', '1', '0');
INSERT INTO `ebcms_conf` VALUES ('47', '2', '0', '上传大小限制，单位B', 'imageMaxSize', '2048000', 'number', 'form_numberbox', '\"\"', '图片上传功能的图片大小限制', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_conf` VALUES ('48', '2', '0', '提交的图片表单名称', 'imageFieldName', 'upfile', 'string', 'form_textbox', '\"\"', '', '2015', '2015', '1', '1', '1');
INSERT INTO `ebcms_conf` VALUES ('49', '2', '0', '执行上传图片的action名称', 'imageActionName', 'uploadimage', 'string', 'form_textbox', '\"\"', '', '2015', '2015', '1', '1', '1');
INSERT INTO `ebcms_conf` VALUES ('50', '3', '0', '文件夹命名', 'subName', 'date\r\nYmd', 'item', 'form_multitextbox', '{\"required\":\"1\",\"height\":\"\",\"width\":\"\",\"maxlength\":\"\",\"minlength\":\"\",\"prompt\":\"\"}', '保存路径的文件夹命名规则', '2016', '2015', '70', '1', '1');
INSERT INTO `ebcms_conf` VALUES ('51', '3', '0', '文件命名规则', 'saveName', 'uniqid\r\n', 'item', 'form_multitextbox', '{\"required\":\"1\",\"maxlength\":\"\",\"minlength\":\"\",\"validtype\":\"\",\"prompt\":\"\"}', '文件命名规则', '1457661705', '2015', '60', '1', '1');
INSERT INTO `ebcms_conf` VALUES ('52', '3', '0', '文件大小限制', 'maxSize', '3145728', 'number', 'form_numberbox', '{\"min\":1,\"max\":2048000,\"requried\":true}', '单位B', '2015', '2015', '40', '1', '0');
INSERT INTO `ebcms_conf` VALUES ('53', '3', '0', '保存路径', 'savePath', '/image/', 'string', 'form_textbox', '{\"multiline\":false}', '相对于上传根目录', '2015', '2015', '80', '1', '1');
INSERT INTO `ebcms_conf` VALUES ('54', '3', '0', 'autoSub', 'autoSub', '1', 'bool', 'form_bool', '\"\"', '', '2015', '2015', '50', '1', '1');
INSERT INTO `ebcms_conf` VALUES ('55', '3', '0', '允许的文件类型', 'exts', 'jpg\r\ngif\r\npng\r\njpeg\r\nzip\r\nrar\r\ndoc\r\ndocx\r\ntxt', 'item', 'form_multitextbox', '{\"height\":\"10\",\"width\":\"\",\"maxlength\":\"\",\"minlength\":\"\",\"prompt\":\"\"}', '建议剔除可能对系统安全造成威胁的文件，例如php等', '1457662052', '2015', '30', '1', '0');
INSERT INTO `ebcms_conf` VALUES ('56', '3', '0', '上传的根目录', 'rootPath', '.{{__GROUP__}}/Uploads', 'string', 'form_textbox', '\"\"', '可不填，默认为/Uploads', '2015', '2015', '90', '1', '1');
INSERT INTO `ebcms_conf` VALUES ('57', '4', '0', '字体大小', 'fontSize', '35', 'number', 'form_numberbox', '{\"required\":true,\"min\":14,\"max\":40,\"showTip\":true}', '不要设置过大，一般填写验证码图片高度的1/3', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_conf` VALUES ('58', '4', '0', '图片高度', 'imageH', '80', 'number', 'form_numberbox', '{\"min\":40,\"max\":120,\"required\":true,\"showTip\":true}', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_conf` VALUES ('59', '4', '0', '图片宽度', 'imageW', '300', 'number', 'form_numberbox', '{\"min\":200,\"max\":600,\"required\":true,\"showTip\":true}', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_conf` VALUES ('60', '4', '0', '字符设置', 'codeSet', '89', 'string', 'form_textbox', '{\"required\":true}', '建议剔除容易引起混淆的字符，比如0o之类的', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_conf` VALUES ('61', '4', '0', '使用干扰线', 'useCurve', '1', 'bool', 'form_bool', '\"\"', '干扰线能防止机器识别，提高系统安全性，但是会降低用户体验', '2016', '2015', '1', '1', '0');
INSERT INTO `ebcms_conf` VALUES ('62', '4', '0', '使用噪点', 'useNoise', '1', 'bool', 'form_bool', '\"\"', '噪点能防止机器识别，提高系统安全性，但是会降低用户体验', '2016', '2015', '1', '1', '0');
INSERT INTO `ebcms_conf` VALUES ('63', '4', '0', '字符个数', 'length', '5', 'number', 'form_numberbox', '{\"min\":1,\"max\":10,\"requried\":true,\"showTip\":true}', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_conf` VALUES ('139', '12', '0', '字体大小', 'fontSize', '25', 'number', 'form_textbox', '{\"min\":14,\"max\":40,\"required\":true}', '', '1457683204', '2015', '60', '1', '0');
INSERT INTO `ebcms_conf` VALUES ('140', '12', '0', '图片高度', 'imageH', '50', 'number', 'form_textbox', '', '', '1457683195', '2015', '80', '1', '0');
INSERT INTO `ebcms_conf` VALUES ('141', '12', '0', '图片宽度', 'imageW', '200', 'number', 'form_textbox', '', '', '1457683186', '2015', '90', '1', '0');
INSERT INTO `ebcms_conf` VALUES ('142', '12', '0', '非中文字符设置', 'codeSet', '123456789', 'string', 'form_textbox', '{\"maxlength\":\"\",\"minlength\":\"\",\"validtype\":\"\",\"prompt\":\"\\u4e0d\\u586b\\u5219\\u968f\\u673a\\u83b7\\u53d6\"}', '建议剔除不易识别的字符 例如 0o il 等等 此处填写非中文', '1457685675', '2015', '30', '1', '0');
INSERT INTO `ebcms_conf` VALUES ('143', '12', '0', '背景划线', 'useCurve', '0', 'bool', 'form_bool', '', '', '1457683951', '2015', '50', '1', '0');
INSERT INTO `ebcms_conf` VALUES ('144', '12', '0', '背景噪点', 'useNoise', '0', 'bool', 'form_bool', '', '', '1457683946', '2015', '50', '1', '0');
INSERT INTO `ebcms_conf` VALUES ('145', '12', '0', '字符个数', 'length', '4', 'number', 'form_textbox', '', '推荐5个', '1457683110', '2015', '70', '1', '0');
INSERT INTO `ebcms_conf` VALUES ('146', '13', '0', '图片水印', 'img', '', 'string', 'form_textbox', '', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_conf` VALUES ('147', '13', '146', '水印图片地址', 'source', '', 'string', 'form_textbox', '', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_conf` VALUES ('148', '13', '146', '位置', 'locate', '3', 'string', 'form_textbox', '', '1 ; 左上角\r\n2 ; 上居中\r\n3 ; 右上角\r\n4 ; 左居中\r\n5 ; 居中\r\n6 ; 右居中\r\n7 ; 左下角\r\n8 ; 下居中\r\n9 ; 右下角', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_conf` VALUES ('149', '13', '146', '透明度', 'alpha', '', 'number', 'form_textbox', '', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_conf` VALUES ('150', '13', '0', '文字水印', 'text', '', 'string', 'form_textbox', '', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_conf` VALUES ('151', '13', '150', '文字', 'text', '', 'string', 'form_textbox', '', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_conf` VALUES ('152', '13', '150', '字体路径', 'font', '', 'string', 'form_textbox', '', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_conf` VALUES ('153', '13', '150', '文字大小', 'size', '', 'number', 'form_textbox', '', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_conf` VALUES ('154', '13', '150', '文字颜色', 'color', '', 'string', 'form_textbox', '', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_conf` VALUES ('155', '13', '150', '位置', 'locate', '', 'string', 'form_textbox', '', '1 ; 左上角\r\n2 ; 上居中\r\n3 ; 右上角\r\n4 ; 左居中\r\n5 ; 居中\r\n6 ; 右居中\r\n7 ; 左下角\r\n8 ; 下居中\r\n9 ; 右下角', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_conf` VALUES ('156', '13', '150', '位置偏移量', 'offset', '', 'number', 'form_textbox', '', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_conf` VALUES ('157', '13', '150', '倾斜度', 'angle', '', 'number', 'form_textbox', '', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_conf` VALUES ('158', '13', '0', '缩略图处理', 'thumb', '', 'string', 'form_textbox', '', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_conf` VALUES ('159', '13', '158', '高', 'height', '120', 'number', 'form_textbox', '', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_conf` VALUES ('160', '13', '158', '宽', 'width', '150', 'number', 'form_textbox', '', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_conf` VALUES ('161', '13', '158', '截取方式', 'type', '3', 'number', 'form_textbox', '', '1 ; 等比例缩放\r\n2 ; 缩放后填充\r\n3 ; 居中裁剪\r\n4 ; 左上角裁剪\r\n5 ; 右下角裁剪\r\n6 ; 固定尺寸缩放', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_conf` VALUES ('173', '17', '0', '自定义配置', 'baidu_tongji', '&lt;script&gt;\r\nvar _hmt = _hmt || [];\r\n(function() {\r\n  var hm = document.createElement(&quot;script&quot;);\r\n  hm.src = &quot;//hm.baidu.com/hm.js?6af64ee107a7acaf4a80bfd5236265ea&quot;;\r\n  var s = document.getElementsByTagName(&quot;script&quot;)[0]; \r\n  s.parentNode.insertBefore(hm, s);\r\n})();\r\n&lt;/script&gt;', 'string', 'form_hidden', '', '百度统计代码', '0', '0', '1', '1', '1');
INSERT INTO `ebcms_conf` VALUES ('181', '12', '0', '背景图片', 'useImgBg', '1', 'bool', 'form_bool', '', '', '1457683288', '1457683288', '50', '1', '0');
INSERT INTO `ebcms_conf` VALUES ('182', '12', '0', '字体', 'fontttf', '', 'string', 'form_textbox', '{\"maxlength\":\"\",\"minlength\":\"\",\"validtype\":\"\",\"prompt\":\"\\u4e0d\\u586b\\u5219\\u968f\\u673a\\u83b7\\u53d6\"}', '默认随机获取', '1457685483', '1457683319', '10', '1', '0');
INSERT INTO `ebcms_conf` VALUES ('183', '12', '0', '是否开启中文验证码', 'useZh', '0', 'bool', 'form_bool', '', '', '1457683351', '1457683351', '40', '1', '0');
INSERT INTO `ebcms_conf` VALUES ('184', '12', '0', '加密密钥', 'seKey', 'ebcms', 'string', 'form_textbox', '', '', '1457685426', '1457683387', '1', '1', '1');
INSERT INTO `ebcms_conf` VALUES ('185', '12', '0', '中文字符', 'zhSet', '', 'string', 'form_textbox', '{\"maxlength\":\"\",\"minlength\":\"\",\"validtype\":\"\",\"prompt\":\"\\u4e0d\\u586b\\u5219\\u968f\\u673a\\u83b7\\u53d6\"}', '开启中文字符验证码后 此项生效', '1457685722', '1457683410', '20', '1', '0');
INSERT INTO `ebcms_conf` VALUES ('186', '17', '0', '自定义配置', 'guestbook_tips', '&lt;div class=&quot;panel panel-default&quot;&gt;\r\n	&lt;div class=&quot;panel-heading&quot;&gt;欢迎留言&lt;/div&gt;\r\n	&lt;div class=&quot;panel-body&quot;&gt;\r\n		欢迎留言，请尽量填写能方便联系到您的联系方式，我们将尽快联系您！\r\n	&lt;/div&gt;\r\n&lt;/div&gt;', 'string', 'form_hidden', null, '留言左侧说明', '0', '0', '1', '1', '1');

-- ----------------------------
-- Table structure for `ebcms_confcate`
-- ----------------------------
DROP TABLE IF EXISTS `ebcms_confcate`;
CREATE TABLE `ebcms_confcate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '节点ID',
  `group` varchar(255) NOT NULL DEFAULT 'Common' COMMENT '分组',
  `name` varchar(255) NOT NULL DEFAULT 'Common' COMMENT '生效模块',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '名称',
  `instruction` varchar(255) NOT NULL DEFAULT '' COMMENT '说明',
  `iconcls` varchar(255) NOT NULL DEFAULT '' COMMENT '图标',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `locked` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否锁定',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='基本配置分类表';

-- ----------------------------
-- Records of ebcms_confcate
-- ----------------------------
INSERT INTO `ebcms_confcate` VALUES ('2', '常规配置', 'UEDITOR', '百度编辑器', '', 'icon-plugin', '2015', '2015', '255', '1', '0');
INSERT INTO `ebcms_confcate` VALUES ('3', '常规配置', 'UPLOAD_CONFIG', '上传配置', '', 'icon-file', '2015', '2015', '54', '1', '0');
INSERT INTO `ebcms_confcate` VALUES ('4', '常规配置', 'VERIFY', '验证码', '', 'icon-nuclear', '2015', '2015', '38', '1', '0');
INSERT INTO `ebcms_confcate` VALUES ('12', '常规配置', 'HOME_VERIFY', '验证码', '', 'icon-wait', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_confcate` VALUES ('13', '常规配置', 'THUMB', '图片处理', '', 'icon-zone', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_confcate` VALUES ('15', '定时任务', 'cron_clearbackuplockfile', '清理备份文件', '', 'icon-world', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_confcate` VALUES ('17', '常规配置', 'CUSTOM_CONFIG', '自定义配置', '', '', '1457591124', '1457591124', '0', '1', '0');

-- ----------------------------
-- Table structure for `ebcms_config`
-- ----------------------------
DROP TABLE IF EXISTS `ebcms_config`;
CREATE TABLE `ebcms_config` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `title` varchar(250) NOT NULL DEFAULT '' COMMENT '标题',
  `name` char(40) NOT NULL DEFAULT '' COMMENT '配置项',
  `value` text COMMENT '配置值',
  `render` varchar(255) NOT NULL DEFAULT '' COMMENT '类型',
  `form` varchar(255) NOT NULL DEFAULT '' COMMENT '表单类型',
  `config` text COMMENT '类型配置',
  `instruction` text COMMENT '说明',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `sort` int(4) unsigned NOT NULL DEFAULT '99' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `locked` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '锁定',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=245 DEFAULT CHARSET=utf8 COMMENT='核心配置表';

-- ----------------------------
-- Records of ebcms_config
-- ----------------------------
INSERT INTO `ebcms_config` VALUES ('1', '2', '0', '模块获取变量', 'VAR_MODULE', 'm', 'string', 'form_textbox', '', '', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('2', '2', '0', '控制器获取变量', 'VAR_CONTROLLER', 'c', 'string', 'form_textbox', '', '', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('3', '2', '0', '操作获取变量', 'VAR_ACTION', 'a', 'string', 'form_textbox', '', '', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('4', '2', '0', 'AJAX提交变量', 'VAR_AJAX_SUBMIT', 'ajax', 'string', 'form_textbox', '', '', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('5', '2', '0', 'VAR_JSONP_HANDLER', 'VAR_JSONP_HANDLER', 'callback', 'string', 'form_textbox', '', '', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('6', '2', '0', 'PATHINFO获取变量', 'VAR_PATHINFO', 's', 'string', 'form_textbox', '', '兼容模式PATHINFO获取变量例如 ?s=/module/action/id/1 后面的参数取决于URL_PATHINFO_DEPR', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('7', '2', '0', '模板切换变量', 'VAR_TEMPLATE', 't', 'string', 'form_textbox', '', '', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('8', '2', '0', '插件控制器命名空间变量', 'VAR_ADDON', 'addon', 'string', 'form_textbox', '', '默认的插件控制器命名空间变量 3.2.2新增', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('9', '3', '0', '应用类库是否使用命名空间', 'APP_USE_NAMESPACE', '1', 'bool', 'form_bool', '', '应用类库是否使用命名空间 3.2.1新增', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('10', '3', '0', '是否开启子域名部署', 'APP_SUB_DOMAIN_DEPLOY', '0', 'item', 'form_textbox', '{\"multiline\":true,\"height\":120}', '', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('11', '3', '0', '子域名部署规则', 'APP_SUB_DOMAIN_RULES', '', 'item', 'form_textbox', '{\"multiline\":true,\"height\":120}', '', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('12', '3', '0', '域名后缀', 'APP_DOMAIN_SUFFIX', '', 'string', 'form_textbox', '', '如果是com.cn net.cn 之类的后缀必须设置', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('13', '3', '0', '操作方法后缀', 'ACTION_SUFFIX', '', 'string', 'form_textbox', '', '', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('14', '3', '0', '是否允许多模块', 'MULTI_MODULE', '1', 'bool', 'form_bool', '', '如果为false 则必须设置 DEFAULT_MODULE', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('15', '3', '0', '禁止访问的模块列表', 'MODULE_DENY_LIST', 'Common\r\nRuntime', 'item', 'form_textbox', '{\"multiline\":true,\"height\":120}', '', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('16', '3', '0', '允许访问的模块列表', 'MODULE_ALLOW_LIST', '', 'item', 'form_textbox', '{\"multiline\":true,\"height\":120}', '', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('17', '3', '0', '控制器层级', 'CONTROLLER_LEVEL', '1', 'number', 'form_numberbox', '', '', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('18', '3', '0', '自动加载类库层', 'APP_AUTOLOAD_LAYER', 'Controller,Model', 'string', 'form_textbox', '', '（针对非命名空间定义类库） 3.2.1新增', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('19', '3', '0', '自动加载的路径', 'APP_AUTOLOAD_PATH', '', 'string', 'form_textbox', '{\"width\":\"\",\"prompt\":\"\",\"maxlength\":\"\",\"minlength\":\"\",\"validtype\":\"\",\"required\":\"0\"}', '（针对非命名空间定义类库） 3.2.1新增', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('20', '4', '0', '默认的模型层名称', 'DEFAULT_M_LAYER', 'Model', 'string', 'form_textbox', '', '', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('21', '4', '0', '默认的控制器层名称', 'DEFAULT_C_LAYER', 'Controller', 'string', 'form_textbox', '', '', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('22', '4', '0', '默认的视图层名称', 'DEFAULT_V_LAYER', 'View', 'string', 'form_textbox', '', '', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('23', '4', '0', '默认语言', 'DEFAULT_LANG', 'zh-cn', 'string', 'form_textbox', '', '', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('24', '4', '0', '默认模板主题名称', 'DEFAULT_THEME', '', 'string', 'form_textbox', '', '', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('25', '4', '0', '默认模块', 'DEFAULT_MODULE', 'Home', 'string', 'form_textbox', '', '', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('26', '4', '0', '默认控制器名称', 'DEFAULT_CONTROLLER', 'Index', 'string', 'form_textbox', '', '', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('27', '4', '0', '默认操作名称', 'DEFAULT_ACTION', 'index', 'string', 'form_textbox', '', '', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('28', '4', '0', '默认输出编码', 'DEFAULT_CHARSET', 'utf-8', 'string', 'form_textbox', '', '', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('29', '4', '0', '默认时区', 'DEFAULT_TIMEZONE', 'PRC', 'string', 'form_textbox', '', '', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('30', '4', '0', '默认AJAX 数据返回格式', 'DEFAULT_AJAX_RETURN', 'JSON', 'string', 'form_textbox', '', '可选JSON XML ...', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('31', '4', '0', '默认JSONP格式返回的处理方法', 'DEFAULT_JSONP_HANDLER', 'jsonpReturn', 'string', 'form_textbox', '', '', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('32', '4', '0', '默认参数过滤方法', 'DEFAULT_FILTER', 'htmlspecialchars', 'string', 'form_textbox', '{\"width\":\"\",\"prompt\":\"\",\"maxlength\":\"\",\"minlength\":\"\",\"validtype\":\"\",\"required\":\"0\"}', '用于I函数...', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('33', '5', '0', '404 跳转页面', 'URL_404_REDIRECT', '', 'string', 'form_textbox', '', '部署模式有效', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('34', '5', '0', 'URL映射定义规则', 'URL_MAP_RULES', '[]', 'json', 'form_textbox', '{\"multiline\":true,\"height\":120}', '', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('35', '5', '0', '路由规则', 'URL_ROUTE_RULES', '[]', 'json', 'form_textbox', '{\"multiline\":true,\"height\":120}', '默认路由规则 针对模块', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('36', '5', '0', '是否开启URL路由', 'URL_ROUTER_ON', '0', 'bool', 'form_bool', '', '', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('37', '5', '0', 'URL访问模式', 'URL_MODEL', '0', 'number', 'form_radio', '{\"disabled\":\"0\",\"values\":\"\\u666e\\u901a\\u6a21\\u5f0f|0\\r\\nPATHINFO \\u6a21\\u5f0f\\uff08\\u9ed8\\u8ba4\\uff09|1\\r\\n\\u4f2a\\u9759\\u6001\\u6a21\\u5f0f|2\\r\\n\\u517c\\u5bb9\\u6a21\\u5f0f|3\"}', '可选参数0、1、2、3,代表以下四种模式：\r\n// 0 (普通模式); 1 (PATHINFO 模式); 2 (REWRITE  模式); 3 (兼容模式)  默认为PATHINFO 模式', '1457491215', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('38', '5', '0', '伪静态后缀', 'URL_HTML_SUFFIX', 'html', 'string', 'form_textbox', '', '', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('39', '5', '0', 'PATHINFO分隔符', 'URL_PATHINFO_DEPR', '/', 'string', 'form_textbox', '', 'PATHINFO模式下，各参数之间的分割符号', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('40', '5', '0', 'URL禁止访问的后缀', 'URL_DENY_SUFFIX', 'ico|png|gif|jpg|js|css', 'string', 'form_textbox', '', '', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('41', '5', '0', '是否区分大小写', 'URL_CASE_INSENSITIVE', '0', 'bool', 'form_bool', '', '默认false 表示URL区分大小写 true则表示不区分大小写', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('42', '5', '0', 'URL_PATHINFO_FETCH', 'URL_PATHINFO_FETCH', 'ORIG_PATH_INFO,REDIRECT_PATH_INFO,REDIRECT_URL', 'string', 'form_textbox', '', '用于兼容判断PATH_INFO 参数的SERVER替代变量列表', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('43', '5', '0', 'URL_REQUEST_URI', 'URL_REQUEST_URI', 'REQUEST_URI', 'string', 'form_textbox', '', '获取当前页面地址的系统变量 默认为REQUEST_URI', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('44', '5', '0', '绑定到参数', 'URL_PARAMS_BIND', '1', 'bool', 'form_bool', '', 'URL变量绑定到Action方法参数', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('45', '5', '0', '变量绑定类型', 'URL_PARAMS_BIND_TYPE', '0', 'number', 'form_numberbox', '', '0 按变量名绑定 1 按变量顺序绑定', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('46', '6', '0', '错误跳转对应的模板文件', 'TMPL_ACTION_ERROR', '{{THINK_PATH}}Tpl/dispatch_jump.tpl', 'string', 'form_textbox', '', '', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('47', '6', '0', '是否去除模板文件里面的html空格与换行', 'TMPL_STRIP_SPACE', '1', 'bool', 'form_bool', '', '', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('48', '6', '0', '模板引擎', 'TMPL_ENGINE_TYPE', 'Think', 'string', 'form_textbox', '', '', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('49', '6', '0', '模板文件分割符', 'TMPL_FILE_DEPR', '/', 'string', 'form_textbox', '', '', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('50', '6', '0', '模板文件后缀', 'TMPL_TEMPLATE_SUFFIX', '.html', 'string', 'form_textbox', '', '', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('51', '6', '0', '模板输出类型', 'TMPL_CONTENT_TYPE', 'text/html', 'string', 'form_textbox', '', '', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('52', '6', '0', '异常页面的模板文件', 'TMPL_EXCEPTION_FILE', '{{THINK_PATH}}Tpl/think_exception.tpl', 'string', 'form_textbox', '', '', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('53', '6', '0', '成功跳转对应的模板文件', 'TMPL_ACTION_SUCCESS', '{{THINK_PATH}}Tpl/dispatch_jump.tpl', 'string', 'form_textbox', '', '', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('54', '6', '0', '自动侦测模板主题', 'TMPL_DETECT_THEME', '0', 'bool', 'form_bool', '', '', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('55', '6', '0', '模板缓存后缀', 'TMPL_CACHFILE_SUFFIX', '.php', 'string', 'form_textbox', '', '', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('56', '6', '0', '模板引擎禁用函数', 'TMPL_DENY_FUNC_LIST', 'echo,exit', 'string', 'form_textbox', '', '', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('57', '6', '0', '禁用PHP原生代码', 'TMPL_DENY_PHP', '0', 'bool', 'form_bool', '', '', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('58', '6', '0', '开始标记', 'TMPL_L_DELIM', '{', 'string', 'form_textbox', '', '模板引擎普通标签开始标记', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('59', '6', '0', '结束标记', 'TMPL_R_DELIM', '}', 'string', 'form_textbox', '', '模板引擎普通标签结束标记', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('60', '6', '0', '模板变量识别', 'TMPL_VAR_IDENTIFY', 'array', 'string', 'form_textbox', '', '留空自动判断,参数为\'obj\'则表示对象', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('61', '6', '0', '模板编译缓存', 'TMPL_CACHE_ON', '1', 'bool', 'form_bool', '', '是否开启模板编译缓存,设为false则每次都会重新编译', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('62', '6', '0', '模板缓存前缀标识', 'TMPL_CACHE_PREFIX', '', 'string', 'form_textbox', '', '模板缓存前缀标识，可以动态改变', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('63', '6', '0', '模板缓存有效期', 'TMPL_CACHE_TIME', '0', 'number', 'form_numberbox', '', ' 0 为永久，(以数字为值，单位:秒)', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('64', '6', '0', '布局标识符', 'TMPL_LAYOUT_ITEM', '{__CONTENT__}', 'string', 'form_textbox', '', '布局模板的内容替换标识', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('65', '6', '0', '是否启用布局', 'LAYOUT_ON', '0', 'bool', 'form_bool', '', '', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('66', '6', '0', '当前布局名称', 'LAYOUT_NAME', 'layout', 'string', 'form_textbox', '', '默认为layout', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('67', '7', '0', '错误显示信息', 'ERROR_MESSAGE', '页面错误！请稍后再试～', 'string', 'form_textbox', '', '非调试模式有效', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('68', '7', '0', '错误定向页面', 'ERROR_PAGE', '', 'string', 'form_textbox', '', '', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('69', '7', '0', '显示错误信息', 'SHOW_ERROR_MSG', '0', 'bool', 'form_bool', '', '', '2015', '2015', '1', '0', '1');
INSERT INTO `ebcms_config` VALUES ('70', '7', '0', '记录数', 'TRACE_MAX_RECORD', '100', 'number', 'form_numberbox', '', '每个级别的错误信息 最大记录数', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('71', '8', '0', '是否记录', 'LOG_RECORD', '0', 'bool', 'form_bool', '', '默认不记录日志', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('72', '8', '0', '日志记录类型', 'LOG_TYPE', 'File', 'string', 'form_textbox', '', '默认为文件方式', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('73', '8', '0', '记录级别', 'LOG_LEVEL', 'EMERG,ALERT,CRIT,ERR', 'string', 'form_textbox', '', '允许记录的日志级别', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('74', '8', '0', '记录异常日志', 'LOG_EXCEPTION_RECORD', '0', 'bool', 'form_bool', '', '是否记录异常信息日志', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('75', '9', '0', '是否校验缓存', 'DATA_CACHE_CHECK', '0', 'bool', 'form_bool', '', '', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('76', '9', '0', '是否压缩缓存', 'DATA_CACHE_COMPRESS', '0', 'bool', 'form_bool', '', '', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('77', '9', '0', '缓存有效期', 'DATA_CACHE_TIME', '0', 'number', 'form_numberbox', '', '0表示永久缓存', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('78', '9', '0', '缓存前缀', 'DATA_CACHE_PREFIX', '', 'string', 'form_textbox', '', '', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('79', '9', '0', '缓存类型', 'DATA_CACHE_TYPE', 'File', 'string', 'form_textbox', '', '支持:File|Db|Apc|Memcache|Shmop|Sqlite|Xcache|Apachenote|Eaccelerator等，前提需要您的服务器支持', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('80', '9', '0', '缓存路径', 'DATA_CACHE_PATH', '{{TEMP_PATH}}', 'string', 'form_textbox', '', '(仅对File方式缓存有效)', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('81', '9', '0', '使用子目录缓存', 'DATA_CACHE_SUBDIR', '0', 'bool', 'form_bool', '', '(自动根据缓存标识的哈希创建子目录)', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('82', '9', '0', '子目录缓存级别', 'DATA_PATH_LEVEL', '1', 'number', 'form_numberbox', '', '', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('83', '10', '0', '自动开启', 'SESSION_AUTO_START', '1', 'bool', 'form_bool', '\"\"', '是否自动开启Session', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('84', '10', '0', '配置数组', 'SESSION_OPTIONS', '', 'string', 'form_textbox', '', '支持type name id path expire domain 等参数', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('85', '10', '0', 'hander类型', 'SESSION_TYPE', '', 'string', 'form_textbox', '', '默认无需设置 除非扩展了session hander驱动', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('86', '10', '0', 'session 前缀', 'SESSION_PREFIX', '{{substr(__ROOT__,1)}}_', 'string', 'form_textbox', '{\"required\":\"0\",\"editable\":\"1\",\"maxlength\":\"\",\"minlength\":\"\",\"validtype\":\"\",\"readonly\":\"0\",\"disabled\":\"0\",\"prompt\":\"\",\"width\":\"\"}', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_config` VALUES ('87', '11', '0', 'Cookie有效期', 'COOKIE_EXPIRE', '0', 'number', 'form_numberbox', '', '', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('88', '11', '0', 'Cookie有效域名', 'COOKIE_DOMAIN', '', 'string', 'form_textbox', '', '', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('89', '11', '0', 'Cookie路径', 'COOKIE_PATH', '{{__ROOT__}}/', 'string', 'form_textbox', '\"\"', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_config` VALUES ('90', '11', '0', 'Cookie前缀', 'COOKIE_PREFIX', '{{substr(__ROOT__,1)}}_', 'string', 'form_textbox', '{\"required\":\"0\",\"editable\":\"1\",\"maxlength\":\"\",\"minlength\":\"\",\"validtype\":\"\",\"readonly\":\"0\",\"disabled\":\"0\",\"prompt\":\"\",\"width\":\"\"}', '避免冲突', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_config` VALUES ('91', '11', '0', 'COOKIE_HTTPONLY', 'COOKIE_HTTPONLY', '', 'string', 'form_textbox', '', 'Cookie的httponly属性 3.2.2新增', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('92', '12', '0', '服务器地址', 'DB_HOST', '127.0.0.1', 'string', 'form_textbox', '{\"required\":true}', '若发现数据库执行慢，可尝试切换数据库地址\r\nlocalhost\r\n127.0.0.1', '2015', '2015', '99', '1', '0');
INSERT INTO `ebcms_config` VALUES ('93', '12', '0', '端口', 'DB_PORT', '80', 'number', 'form_numberbox', '\"\"', 'mysql的默认端口是3306，可不填', '2015', '2015', '97', '0', '0');
INSERT INTO `ebcms_config` VALUES ('94', '12', '0', '数据库类型', 'DB_TYPE', 'mysql', 'string', 'form_radio', '{\"values\":\"Mysql|mysql\"}', '', '2015', '2015', '95', '1', '0');
INSERT INTO `ebcms_config` VALUES ('95', '12', '0', '用户名', 'DB_USER', 'root', 'string', 'form_textbox', '\"\"', '不建议使用超级账户', '2015', '2015', '71', '1', '0');
INSERT INTO `ebcms_config` VALUES ('96', '12', '0', '密码', 'DB_PWD', 'root', 'string', 'form_textbox', '\"\"', '', '2015', '2015', '60', '1', '0');
INSERT INTO `ebcms_config` VALUES ('97', '12', '0', '数据库名', 'DB_NAME', '1', 'string', 'form_textbox', '\"\"', '', '2015', '2015', '59', '1', '0');
INSERT INTO `ebcms_config` VALUES ('98', '12', '0', '数据库表前缀', 'DB_PREFIX', 'ebcms_', 'string', 'form_textbox', '\"\"', '若非必要，此项请不要修改\r\n修改后需要手动对数据库表前缀重命名', '2015', '2015', '41', '1', '0');
INSERT INTO `ebcms_config` VALUES ('99', '12', '0', '字段缓存', 'DB_FIELDS_CACHE', '', 'string', 'form_textbox', '', '', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('100', '12', '0', '其他参数', 'DB_PARAMS', '{&quot;8&quot;:0}', 'json', 'form_textbox', '{\"multiline\":true,\"height\":120}', '', '2015', '2015', '1', '1', '1');
INSERT INTO `ebcms_config` VALUES ('101', '12', '0', '数据库调试', 'DB_DEBUG', '1', 'bool', 'form_bool', '', '', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('102', '12', '0', 'Lite模式', 'DB_LITE', '0', 'bool', 'form_bool', '', '3.2.3新增 ', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('103', '12', '0', '数据库字符集', 'DB_CHARSET', 'utf8', 'string', 'form_textbox', '', '', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('104', '12', '0', '数据库部署方式', 'DB_DEPLOY_TYPE', '0', 'number', 'form_numberbox', '', '0 集中式(单一服务器),1 分布式(主从服务器)', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('105', '12', '0', '数据库写入数据自动参数绑定', 'DB_BIND_PARAM', '0', 'number', 'form_numberbox', '', '', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('106', '12', '0', '读写分离', 'DB_RW_SEPARATE', '0', 'bool', 'form_bool', '', '主从式有效', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('107', '12', '0', '主服务器数量', 'DB_MASTER_NUM', '1', 'number', 'form_numberbox', '', '主从式有效', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('108', '12', '0', '从服务器序号', 'DB_SLAVE_NO', '', 'number', 'form_numberbox', '', '主从式有效', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('119', '22', '0', '超级管理员邮箱', 'SUPERADMIN', '1540837821@qq.com', 'string', 'form_textbox', '\"\"', '超级管理员邮箱', '1457589079', '2015', '1', '1', '0');
INSERT INTO `ebcms_config` VALUES ('126', '15', '0', '是否开启表单令牌', 'TOKEN_ON', '1', 'bool', 'form_bool', '', '注意，开启表单令牌之前，请务必在配置目录下的tags.php中添加\r\n\'view_filter\' =&gt; array(\'Behavior\\\\TokenBuildBehavior\'),', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_config` VALUES ('127', '15', '0', '令牌表单', 'TOKEN_NAME', '__hash__', 'string', 'form_textbox', '', '该字段请不要用常规的表单域，一般请使用双下划线避免重复', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_config` VALUES ('128', '15', '0', '令牌类型', 'TOKEN_TYPE', 'md5', 'string', 'form_textbox', '', '令牌域值的生成算法', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_config` VALUES ('129', '15', '0', '开启安全重置', 'TOKEN_RESET', '0', 'bool', 'form_bool', '', '表单令牌是否', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_config` VALUES ('130', '16', '0', '备份路径', 'DATA_BACKUP_PATH', '.{{__GROUP__}}/Backup', 'string', 'form_textbox', '\"\"', '为了系统安全，建议您将备份目录设置在网站目录之外，例如：../Backup', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_config` VALUES ('131', '16', '0', '卷大小', 'DATA_BACKUP_PART_SIZE', '2048000', 'number', 'form_numberbox', '', '单位B', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_config` VALUES ('132', '16', '0', '是否启用ZIP压缩', 'DATA_BACKUP_COMPRESS', '0', 'bool', 'form_bool', '', '不建议开启', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_config` VALUES ('133', '16', '0', '压缩等级', 'DATA_BACKUP_COMPRESS_LEVEL', '4', 'number', 'form_numberbox', '', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_config` VALUES ('140', '19', '0', '模板替换配置', 'TMPL_PARSE_STRING', '', 'string', 'form_textbox', '\"\"', '', '2015', '2015', '1', '1', '1');
INSERT INTO `ebcms_config` VALUES ('141', '19', '140', 'THIRD', '__THIRD__', '{{__ROOT__.__GROUP__}}/Public/Third', 'string', 'form_textbox', '\"\"', '', '2016', '2015', '1', '1', '0');
INSERT INTO `ebcms_config` VALUES ('142', '19', '140', 'CSS', '__CSS__', '{{__ROOT__.__GROUP__}}/Public/Css', 'string', 'form_textbox', '\"\"', '', '2016', '2015', '1', '1', '0');
INSERT INTO `ebcms_config` VALUES ('143', '19', '140', 'JS', '__JS__', '{{__ROOT__.__GROUP__}}/Public/Js', 'string', 'form_textbox', '\"\"', '', '2016', '2015', '1', '1', '0');
INSERT INTO `ebcms_config` VALUES ('144', '19', '140', 'IMAGE', '__IMAGE__', '{{__ROOT__.__GROUP__}}/Public/Image', 'string', 'form_textbox', '\"\"', '', '2016', '2015', '1', '1', '0');
INSERT INTO `ebcms_config` VALUES ('145', '19', '0', '是否显示调试信息', 'SHOW_PAGE_TRACE', '0', 'bool', 'form_bool', '', '', '1457503590', '2015', '1', '0', '1');
INSERT INTO `ebcms_config` VALUES ('146', '19', '0', '是否开启后台操作日志记录', 'OPLOG', '1', 'bool', 'form_bool', '', '开启后仅仅对后台操作性能有一定影响，对前台没有任何影响，可放心开启', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_config` VALUES ('147', '19', '0', '是否开启调试信息记录', 'DEVLOG', '0', 'bool', 'form_bool', '', '', '2015', '2015', '1', '1', '1');
INSERT INTO `ebcms_config` VALUES ('148', '19', '0', '模板管理中可以编辑的文件类型', 'EDITFILE_EXT', 'html\r\ncss\r\njs\r\ntxt', 'item', 'form_multitextbox', '{\"multiline\":true,\"height\":120}', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_config` VALUES ('149', '19', '0', 'URL模式', 'URL_MODEL', '0', 'bool', 'form_bool', '', '', '2015', '2015', '1', '1', '1');
INSERT INTO `ebcms_config` VALUES ('150', '21', '0', '关闭网站', 'SITE_CLOSED', '0', 'bool', 'form_bool', '', '仅仅关闭前台', '2015', '2015', '99', '1', '0');
INSERT INTO `ebcms_config` VALUES ('151', '21', '0', '关闭原因', 'SITE_CLOSED_REASON', '网站维护中...', 'string', 'form_multitextbox', '', '', '2015', '2015', '98', '1', '0');
INSERT INTO `ebcms_config` VALUES ('152', '21', '0', '显示调试信息', 'SHOW_PAGE_TRACE', '1', 'bool', 'form_bool', '', '网站上线后建议关闭', '2015', '2015', '40', '1', '0');
INSERT INTO `ebcms_config` VALUES ('153', '21', '0', '模版主题', 'DEFAULT_THEME', 'default', 'string', 'form_textbox', '', '更改模板主题名称可以防止别人下载模板文件，\r\n更改后，还要到网站里面修改对应的文件夹名称', '2015', '2015', '71', '1', '0');
INSERT INTO `ebcms_config` VALUES ('154', '21', '0', '模板替换', 'TMPL_PARSE_STRING', '', 'string', 'form_hidden', '', '', '2015', '2015', '70', '1', '1');
INSERT INTO `ebcms_config` VALUES ('155', '21', '154', '第三方组件', '__THIRD__', '{{__ROOT__}}{{__GROUP__}}/Public/Third', 'string', 'form_textbox', '\"\"', '', '2016', '2015', '66', '1', '0');
INSERT INTO `ebcms_config` VALUES ('156', '21', '154', 'CSS样式表', '__CSS__', '{{__ROOT__}}{{__GROUP__}}/Public/Css', 'string', 'form_textbox', '\"\"', '', '2016', '2015', '67', '1', '0');
INSERT INTO `ebcms_config` VALUES ('157', '21', '154', 'JS资源地址', '__JS__', '{{__ROOT__}}{{__GROUP__}}/Public/Js', 'string', 'form_textbox', '\"\"', '', '2016', '2015', '68', '1', '0');
INSERT INTO `ebcms_config` VALUES ('158', '21', '154', '资源图片地址', '__IMAGE__', '{{__ROOT__}}{{__GROUP__}}/Public/Image', 'string', 'form_textbox', '\"\"', '', '2016', '2015', '69', '1', '0');
INSERT INTO `ebcms_config` VALUES ('173', '22', '0', '认证KEY', 'USER_AUTH_KEY', 'user_id', 'string', 'form_textbox', '', '', '2016', '2016', '0', '1', '1');
INSERT INTO `ebcms_config` VALUES ('174', '22', '0', '超级管理员认证识别号', 'ADMIN_AUTH_KEY', 'superadmin', 'string', 'form_textbox', '', '', '2016', '2016', '0', '1', '1');
INSERT INTO `ebcms_config` VALUES ('161', '21', '0', 'TAGLIB_BUILD_IN', 'TAGLIB_BUILD_IN', 'Cx,Home\\Taglib\\Qy', 'string', 'form_textbox', '', '', '2015', '2015', '1', '1', '1');
INSERT INTO `ebcms_config` VALUES ('162', '21', '0', '是否开启留言验证码', 'GUESTBOOK_VERIFY', '1', 'bool', 'form_bool', '', '', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_config` VALUES ('163', '24', '186', '是否记录点击量', 'RECORD_CLICK', '1', 'bool', 'form_bool', '', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_config` VALUES ('164', '24', '188', '留言分页数', 'GUESTBOOK_PAGENUM', '20', 'number', 'form_numberbox', '', '留言板的分页条数，默认20条', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_config` VALUES ('165', '19', '0', 'TAGLIB_BUILD_IN', 'TAGLIB_BUILD_IN', 'Cx,Common\\Taglib\\Core', 'string', 'form_textbox', '\"\"', '', '2015', '2015', '1', '1', '1');
INSERT INTO `ebcms_config` VALUES ('166', '22', '0', '权限认证配置', 'AUTH_CONFIG', '', 'string', 'form_textbox', '\"\"', '', '2015', '2015', '1', '1', '1');
INSERT INTO `ebcms_config` VALUES ('167', '22', '166', '认证开关', 'AUTH_ON', '1', 'bool', 'form_bool', '\"\"', '', '2015', '2015', '1', '1', '1');
INSERT INTO `ebcms_config` VALUES ('168', '22', '166', '认证模式', 'AUTH_TYPE', '2', 'number', 'form_radio', '{\"disabled\":\"0\",\"values\":\"\\u666e\\u901a\\u8ba4\\u8bc1|1\\r\\n\\u5b9e\\u65f6\\u8ba4\\u8bc1|2\"}', '普通认证：变更权限重新登陆生效\r\n实时认证：变更权限实时生效', '2016', '2015', '1', '1', '0');
INSERT INTO `ebcms_config` VALUES ('169', '22', '166', '分组表', 'AUTH_GROUP', '{{C(&quot;DB_PREFIX&quot;)}}auth_group', 'string', 'form_textbox', '\"\"', '', '2016', '2015', '1', '0', '1');
INSERT INTO `ebcms_config` VALUES ('170', '22', '166', '分组权限表', 'AUTH_GROUP_ACCESS', '{{C(&quot;DB_PREFIX&quot;)}}auth_group_access', 'string', 'form_textbox', '\"\"', '', '2016', '2015', '1', '0', '1');
INSERT INTO `ebcms_config` VALUES ('171', '22', '166', '权限规则表', 'AUTH_RULE', '{{C(&quot;DB_PREFIX&quot;)}}auth_rule', 'string', 'form_textbox', '\"\"', '', '2016', '2015', '1', '0', '1');
INSERT INTO `ebcms_config` VALUES ('172', '22', '166', '用户信息表', 'AUTH_USER', '{{C(&quot;DB_PREFIX&quot;)}}user', 'string', 'form_textbox', '\"\"', '', '2016', '2015', '1', '0', '1');
INSERT INTO `ebcms_config` VALUES ('244', '24', '240', 'SEO简介', 'description', '简介', 'string', 'form_multitextbox', '', '', '1459061342', '1459061342', '7', '1', '0');
INSERT INTO `ebcms_config` VALUES ('243', '24', '240', 'SEO关键字', 'keywords', '关键字', 'string', 'form_textbox', '', '', '1459061320', '1459061312', '8', '1', '0');
INSERT INTO `ebcms_config` VALUES ('242', '24', '240', 'SEO标题', 'title', '搜索中心', 'string', 'form_textbox', '', '', '1459061252', '1459061252', '9', '1', '0');
INSERT INTO `ebcms_config` VALUES ('241', '24', '240', '分页大小', 'pagenum', '20', 'number', 'form_numberbox', '', '', '1459061194', '1459061187', '1', '1', '0');
INSERT INTO `ebcms_config` VALUES ('240', '24', '0', '搜索模块', 'SEARCH', '', 'string', 'form_textbox', '', '', '1459061165', '1459061165', '10', '1', '0');
INSERT INTO `ebcms_config` VALUES ('185', '22', '0', '系统安全码', 'SAFE_CODE', '7a98af17e63a0ac09ce2e96d03992fbc', 'string', 'form_textbox', '', '安全码，系统安装时随机生成，使用过程中请勿随意更改！否则可能会影响系统的正常运行！', '1457011195', '1457011048', '0', '1', '0');
INSERT INTO `ebcms_config` VALUES ('186', '24', '0', '文章模块', 'ARTICLE', '', 'string', 'form_textbox', '', '', '1457318230', '1457318230', '90', '1', '0');
INSERT INTO `ebcms_config` VALUES ('188', '24', '0', '留言模块', 'GUESTBOOK', '', 'string', 'form_textbox', '', '', '1457318273', '1457318273', '20', '1', '0');
INSERT INTO `ebcms_config` VALUES ('189', '24', '186', 'SEO标题', 'title', '文章中心', 'string', 'form_textbox', '', '', '1459061259', '1457318315', '93', '1', '0');
INSERT INTO `ebcms_config` VALUES ('190', '24', '186', 'SEO关键字', 'keywords', '关键字', 'string', 'form_textbox', '', '', '1459061268', '1457318330', '91', '1', '0');
INSERT INTO `ebcms_config` VALUES ('191', '24', '186', 'SEO简介', 'description', '简介', 'string', 'form_multitextbox', '', '', '1459061264', '1457318365', '92', '1', '0');
INSERT INTO `ebcms_config` VALUES ('192', '24', '186', '封面分页', 'pageable', '0', 'bool', 'form_bool', '', '', '1457318677', '1457318677', '88', '1', '0');
INSERT INTO `ebcms_config` VALUES ('193', '24', '186', '分页大小', 'pagenum', '5', 'number', 'form_numberbox', '', '', '1457318722', '1457318722', '87', '1', '0');
INSERT INTO `ebcms_config` VALUES ('194', '24', '186', '内容排序', 'order', 'id desc', 'string', 'form_select', '{\"disabled\":\"0\",\"values\":\"id \\u4ece\\u5927\\u5230\\u5c0f(\\u63a8\\u8350)|id desc\\r\\nid \\u4ece\\u5c0f\\u5230\\u5927|id asc\\r\\n\\u6392\\u5e8f \\u4ece\\u5927\\u5230\\u5c0f|sort desc,id desc\\r\\n\\u6392\\u5e8f \\u4ece\\u5c0f\\u5230\\u8fbe|sort asc,id desc\\r\\n\\u66f4\\u65b0\\u65f6\\u95f4 \\u4ece\\u5927\\u5230\\u5c0f|update_time desc,id desc\\r\\n\\u66f4\\u65b0\\u65f6\\u95f4 \\u4ece\\u5c0f\\u5230\\u8fbe|update_time desc,id desc\"}', '', '1457319088', '1457318822', '86', '1', '0');
INSERT INTO `ebcms_config` VALUES ('196', '24', '188', '留言验证码', 'verify', '1', 'bool', 'form_bool', '', '', '1459060659', '1457333350', '10', '1', '0');
INSERT INTO `ebcms_config` VALUES ('203', '24', '188', 'SEO标题', 'title', '留言中心', 'string', 'form_textbox', '', '', '1459061275', '1457333647', '19', '1', '0');
INSERT INTO `ebcms_config` VALUES ('204', '24', '188', 'SEO关键字', 'keywords', '留言板', 'string', 'form_textbox', '', '', '1459061279', '1457333661', '18', '1', '0');
INSERT INTO `ebcms_config` VALUES ('205', '24', '188', 'SEO简介', 'description', '留言中心', 'string', 'form_multitextbox', '', '', '1459061284', '1457333680', '17', '1', '0');
INSERT INTO `ebcms_config` VALUES ('206', '21', '0', '网站SEO', 'site', '', 'string', 'form_textbox', '', '', '1457333944', '1457333944', '80', '1', '1');
INSERT INTO `ebcms_config` VALUES ('207', '21', '206', '网站标题', 'title', '易贝内容管理系统', 'string', 'form_textbox', '', '', '1457333973', '1457333973', '79', '1', '0');
INSERT INTO `ebcms_config` VALUES ('208', '21', '206', '网站关键字', 'keywords', '内容管理系统,企业cms,企业内容管理系统,开源内容管理系统,易贝内容管理系统', 'string', 'form_textbox', '', '', '1457334034', '1457334026', '78', '1', '0');
INSERT INTO `ebcms_config` VALUES ('209', '21', '206', '网站简介', 'description', '易贝内容管理系统是一款免费的内容管理系统，完全开源。', 'string', 'form_multitextbox', '', '', '1457334078', '1457334073', '77', '1', '0');
INSERT INTO `ebcms_config` VALUES ('215', '21', '0', 'URL模式', 'URL_MODEL', '1', 'number', 'form_radio', '{\"disabled\":\"0\",\"values\":\"\\u666e\\u901a\\u6a21\\u5f0f|0\\r\\nPATHINFO \\u6a21\\u5f0f\\uff08\\u9ed8\\u8ba4\\uff09|1\\r\\n\\u4f2a\\u9759\\u6001\\u6a21\\u5f0f|2\\r\\n\\u517c\\u5bb9\\u6a21\\u5f0f|3\"}', '', '1457491160', '1457491145', '0', '1', '0');
INSERT INTO `ebcms_config` VALUES ('216', '21', '0', '手机网站', 'CHECK_MOBILE', '0', 'bool', 'form_bool', '', '需要有对应的模板，文件为当前模板_mobile 例如default_mobile', '1457578776', '1457578776', '0', '1', '0');

-- ----------------------------
-- Table structure for `ebcms_configcate`
-- ----------------------------
DROP TABLE IF EXISTS `ebcms_configcate`;
CREATE TABLE `ebcms_configcate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '节点ID',
  `group` varchar(255) NOT NULL DEFAULT '' COMMENT '分组',
  `module` varchar(255) NOT NULL DEFAULT 'Common' COMMENT '生效模块',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '名称',
  `instruction` varchar(255) NOT NULL DEFAULT '' COMMENT '说明',
  `iconcls` varchar(255) NOT NULL DEFAULT '' COMMENT '图标',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `locked` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否锁定',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='核心配置分类表';

-- ----------------------------
-- Records of ebcms_configcate
-- ----------------------------
INSERT INTO `ebcms_configcate` VALUES ('2', '基本配置', 'Common', '系统变量名', '', 'icon-zone', '2015', '2015', '99', '0', '0');
INSERT INTO `ebcms_configcate` VALUES ('3', '基本配置', 'Common', '应用设定', '', 'icon-zone', '2015', '2015', '95', '0', '0');
INSERT INTO `ebcms_configcate` VALUES ('4', '基本配置', 'Common', '默认设定', '', 'icon-zone', '2015', '2015', '88', '0', '0');
INSERT INTO `ebcms_configcate` VALUES ('5', '基本配置', 'Common', 'URL配置', '', 'icon-ruler_crop', '2015', '2015', '79', '0', '0');
INSERT INTO `ebcms_configcate` VALUES ('6', '基本配置', 'Common', '模板配置', '', 'icon-blog', '2015', '2015', '74', '0', '0');
INSERT INTO `ebcms_configcate` VALUES ('7', '基本配置', 'Common', '错误设置', '', 'icon-zone', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_configcate` VALUES ('8', '基本配置', 'Common', '日志设置', '', 'icon-zone', '2015', '2015', '1', '0', '0');
INSERT INTO `ebcms_configcate` VALUES ('9', '基本配置', 'Common', '数据缓存设置', '', 'icon-zone', '2015', '2015', '22', '0', '0');
INSERT INTO `ebcms_configcate` VALUES ('10', '基本配置', 'Common', 'SESSION设置', '', 'icon-zone', '2015', '2015', '10', '1', '0');
INSERT INTO `ebcms_configcate` VALUES ('11', '基本配置', 'Common', 'Cookie设置', '', 'icon-zone', '2015', '2015', '7', '1', '0');
INSERT INTO `ebcms_configcate` VALUES ('12', '基本配置', 'Common', '数据库配置', '', 'icon-database', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_configcate` VALUES ('15', '后台配置', 'Admin|Article|Link', '表单令牌', '开启表单令牌能防止数据重复提交', 'icon-accept', '1459060699', '2015', '97', '1', '0');
INSERT INTO `ebcms_configcate` VALUES ('16', '后台配置', 'Admin', '数据备份', '', 'icon-databases', '2015', '2015', '96', '1', '0');
INSERT INTO `ebcms_configcate` VALUES ('19', '后台配置', 'Admin|Article|Link', '其他配置', '', 'icon-zone', '1459060693', '2015', '1', '1', '0');
INSERT INTO `ebcms_configcate` VALUES ('21', '前台配置', 'Home', '基本配置', '', '', '2015', '2015', '80', '1', '0');
INSERT INTO `ebcms_configcate` VALUES ('22', '基本配置', 'Common', 'AUTH认证', '', 'icon-zone', '2016', '2015', '3', '1', '0');
INSERT INTO `ebcms_configcate` VALUES ('24', '前台配置', 'Home', '模块配置', '', '', '1457318203', '1457318139', '50', '1', '0');

-- ----------------------------
-- Table structure for `ebcms_cron`
-- ----------------------------
DROP TABLE IF EXISTS `ebcms_cron`;
CREATE TABLE `ebcms_cron` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `cron` varchar(20) NOT NULL DEFAULT '' COMMENT '任务文件',
  `intervals` int(10) unsigned NOT NULL DEFAULT '3600' COMMENT '任务执行间隔时间',
  `initruntime` datetime NOT NULL DEFAULT '1970-00-00 00:00:00' COMMENT '初始执行时间',
  `config` text COMMENT '扩展信息',
  `times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行次数',
  `iconcls` varchar(20) NOT NULL DEFAULT '' COMMENT '图标类',
  `instruction` varchar(255) NOT NULL DEFAULT '' COMMENT '说明',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `sort` int(4) unsigned NOT NULL DEFAULT '99' COMMENT '排序',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `locked` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '锁定',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='定时任务表';

-- ----------------------------
-- Records of ebcms_cron
-- ----------------------------
INSERT INTO `ebcms_cron` VALUES ('14', '0', 'clearbackuplockfile', '60', '2015-10-09 00:00:00', '', '9971', 'icon-zone', '清理一天之前的备份安全文件', '1458999855', '2015', '1', '1', '0');

-- ----------------------------
-- Table structure for `ebcms_datadict`
-- ----------------------------
DROP TABLE IF EXISTS `ebcms_datadict`;
CREATE TABLE `ebcms_datadict` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `category_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '分类ID',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '标题',
  `value` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `ext` text COMMENT '扩展信息',
  `instruction` varchar(255) NOT NULL DEFAULT '' COMMENT '说明',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '99' COMMENT '排序',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `locked` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '锁定',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=326 DEFAULT CHARSET=utf8 COMMENT='数据字典表';

-- ----------------------------
-- Records of ebcms_datadict
-- ----------------------------
INSERT INTO `ebcms_datadict` VALUES ('1', '0', '2', '点击推事件', 'click', '{\"tpl_list\":\"123123\",\"model\":\"mysql\",\"pagenum\":\"3\",\"tpl_detail\":\"sadf\",\"test\":\"2015-11-16 16:34:25\"}', 'f123', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('2', '0', '2', '跳转URL', 'view', '', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('3', '0', '2', '扫码推事件', 'scancode_push', '', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('4', '0', '2', '扫码等收消息', 'scancode_waitmsg', '', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('5', '0', '2', '系统拍照发图', 'pic_sysphoto', '', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('6', '0', '2', '弹拍照或相册', 'pic_photo_or_album', '', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('7', '0', '2', '弹微信相册', 'pic_weixin', '', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('8', '0', '2', '地理位置', 'location_select', '', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('9', '0', '3', '后台菜单', 'admin', '', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('10', '0', '4', '图片文件', 'jpeg,jpg,gif,bmp,png', '', '', '2015', '2015', '20', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('11', '10', '4', 'JPG', 'jpg', '', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('12', '10', '4', 'PNG', 'png', '', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('13', '10', '4', 'GIF', 'gif', '', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('14', '10', '4', 'BMP', 'bmp', '', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('15', '10', '4', 'JPEG', 'jpeg', '', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('16', '0', '4', '视频文件', 'rmvb,rmb,mkv,mp4,3gp,avi', '', '', '2015', '2015', '10', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('17', '16', '4', 'RMVB', 'rmvb', '', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('18', '16', '4', 'MKV', 'mkv', '', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('19', '16', '4', 'RMB', 'rmb', '', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('20', '16', '4', 'AVI', 'avi', '', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('21', '16', '4', 'MP4', 'mp4', '', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('22', '16', '4', '3GP', '3gp', '', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('23', '0', '4', '其他类型', 'zip,rar,7z', '', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('24', '0', '5', '前台模板', '{{dir_encrypt(\'.\'.__GROUP__.\'/Application/Home/View\')}}', '', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('25', '0', '5', 'Css样式', '{{dir_encrypt(\'.\'.__GROUP__.\'/Public/Css\')}}', '', '', '2015', '2015', '1', '1', '1');
INSERT INTO `ebcms_datadict` VALUES ('26', '0', '5', 'JS代码', '{{dir_encrypt(\'.\'.__GROUP__.\'/Public/Js\')}}', '', '', '2015', '2015', '1', '1', '1');
INSERT INTO `ebcms_datadict` VALUES ('27', '0', '6', '字符', 'string', '', 'required:true/false //是否必填\r\n', '2015', '2015', '250', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('29', '0', '6', '整数', 'number', '', '\r\n\r\n\r\n\r\n\r\n\r\n\r\n**注意事项**\r\n*双大括号括起来的标示变量，例如:{{time()}}、{{__FILE__}、{{$value}}等等', '2015', '2015', '222', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('30', '0', '6', '布尔', 'bool', '', '0或1\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n**注意事项**\r\n*双大括号括起来的标示变量，例如:{{time()}}、{{__FILE__}、{{$value}}等等', '2015', '2015', '210', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('31', '0', '6', '浮点数', 'float', '', '一行一条，例如：\r\n中国\r\n日本\r\n韩国\r\n德国\r\n\r\n\r\n\r\n**注意事项**\r\n*双大括号括起来的标示变量，例如:{{time()}}、{{__FILE__}、{{$value}}等等', '2015', '2015', '195', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('273', '0', '15', '否', '0', '', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('32', '0', '6', 'JSON', 'json', '', '标准的json数据格式！\r\n例如：\r\n{\r\n&quot;key1&quot;:&quot;value1&quot;,\r\n&quot;key2&quot;:&quot;value2&quot;\r\n}\r\n例如：\r\n[&quot;value1&quot;,&quot;value2&quot;]\r\n**注意事项**\r\n*双大括号括起来的标示变量，例如:{{time()}}、{{__FILE__}、{{$value}}等等', '2015', '2015', '40', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('33', '0', '6', 'INI', 'ini', '', 'key1=value1;\r\nkey2=value2;\r\n\r\n\r\n\r\n\r\n\r\n\r\n**注意事项**\r\n*双大括号括起来的标示变量，例如:{{time()}}、{{__FILE__}、{{$value}}等等', '2015', '2015', '25', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('34', '0', '6', 'YAML', 'yaml', '', '\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n**注意事项**\r\n*双大括号括起来的标示变量，例如:{{time()}}、{{__FILE__}、{{$value}}等等', '2015', '2015', '14', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('35', '0', '6', 'XML', 'xml', '', '\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n**注意事项**\r\n*双大括号括起来的标示变量，例如:{{time()}}、{{__FILE__}、{{$value}}等等', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('200', '0', '9', '当前栏目', '1', '', '', '2015', '2015', '247', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('201', '0', '9', '不调用', '0', '', '', '2015', '2015', '232', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('202', '0', '9', '当前栏目及子栏目', '2', '', '', '2015', '2015', '198', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('203', '0', '9', '所有子孙栏目', '3', '', '', '2015', '2015', '165', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('204', '0', '9', '所有栏目', '4', '', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('205', '0', '10', '首页', 'Home/Index/index', '', '', '2015', '0', '9', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('206', '0', '10', '新闻', 'Home/Article/index', '', '', '2015', '0', '8', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('207', '206', '10', '栏目', 'Home/Article/category?id=栏目ID', '', '', '2015', '0', '2', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('215', '0', '10', '留言', 'Home/Guestbook/index', '', '', '2015', '0', '1', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('216', '0', '12', '记录操作日志', 'Common\\\\Behavior\\\\OplogBehavior', '{\"configmodel\":\"2\"}', '操作日志记录是哈哈哈哈哈', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('217', '0', '12', '代理检测', 'Behavior\\\\AgentCheckBehavior', '{\"configmodel\":\"3\"}', 'LIMIT_PROXY_VISIT 是否启用代理屏蔽', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('218', '0', '12', 'Boris行为扩展', 'Behavior\\\\BorisBehavior', '', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('219', '0', '12', '浏览器防刷新检测', 'Behavior\\\\BrowserCheckBehavior', '', '一般有验证码之类的页面请不要启用', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('221', '0', '12', '操作路由检测', 'Behavior\\\\CheckActionRouteBehavior', '', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('222', '0', '12', '语言检测', 'Behavior\\\\CheckLangBehavior', '', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('223', '0', '12', 'Chrome页面Trace显示输出', 'Behavior\\\\ChromeShowPageTraceBehavior', '', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('225', '0', '12', '自动执行任务', 'Common\\\\Behavior\\\\CronRunBehavior', '', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('226', '0', '12', '火狐页面Trace显示输出', 'Behavior\\\\FireShowPageTraceBehavior', '', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('229', '0', '12', '机器人检测', 'Behavior\\\\RobotCheckBehavior', '', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('231', '0', '12', '运行时间信息显示', 'Behavior\\\\ShowRuntimeBehavior', '', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('232', '0', '12', '表单令牌生成', 'Behavior\\\\TokenBuildBehavior', '', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('233', '0', '12', 'ThinkPHP升级短信通知', 'Behavior\\\\UpgradeNoticeBehavior', '', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('235', '0', '11', '应用初始化', 'app_init', '', '', '2015', '2015', '250', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('236', '0', '11', '模块检测', 'module_check', '', '', '2015', '2015', '224', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('237', '0', '11', '检测路由规则', 'path_info', '', '', '2015', '2015', '216', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('238', '0', '11', '应用开始标签', 'app_begin', '', '', '2015', '2015', '200', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('239', '0', '11', '动作开始标签', 'action_begin', '', '', '2015', '2015', '194', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('240', '0', '11', '视图开始标签', 'view_begin', '', '', '2015', '2015', '185', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('241', '0', '11', '模版编译过滤标签', 'template_filter', '', '', '2015', '2015', '175', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('242', '0', '11', '视图解析标签', 'view_parse', '', '', '2015', '2015', '162', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('243', '0', '11', '内容过滤标签', 'view_filter', '', '', '2015', '2015', '154', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('244', '0', '11', 'ajax返回标签', 'ajax_return', '', '', '2015', '2015', '136', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('245', '0', '11', '执行后续操作', 'action_end', '', '', '2015', '2015', '126', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('246', '0', '11', '应用结束标签', 'app_end', '', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('247', '0', '11', 'URL调度结束标签', 'url_dispatch', '', '', '2015', '2015', '239', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('248', '0', '11', '视图结束标签', 'view_end', '', '', '2015', '2015', '145', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('269', '0', '13', '清理备份安全文件', 'clearbackuplockfile', '{\"model\":\"6\"}', '清理一天之前的备份安全文件', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('251', '0', '14', '1分钟', '60', '', '', '2015', '2015', '50', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('252', '0', '14', '5分钟', '300', '', '', '2015', '2015', '49', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('253', '0', '14', '10分钟', '600', '', '', '2015', '2015', '48', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('254', '0', '14', '15分钟', '900', '', '', '2015', '2015', '47', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('255', '0', '14', '30分钟', '1800', '', '', '2015', '2015', '46', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('256', '0', '14', '1小时', '3600', '', '', '2015', '2015', '45', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('257', '0', '14', '2小时', '7200', '', '', '2015', '2015', '44', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('258', '0', '14', '3小时', '10800', '', '', '2015', '2015', '43', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('259', '0', '14', '4小时', '14400', '', '', '2015', '2015', '42', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('260', '0', '14', '5小时', '18000', '', '', '2015', '2015', '41', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('261', '0', '14', '6小时', '21600', '', '', '2015', '2015', '40', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('262', '0', '14', '8小时', '28800', '', '', '2015', '2015', '39', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('263', '0', '14', '10小时', '36000', '', '', '2015', '2015', '38', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('264', '0', '14', '12小时', '39600', '', '', '2015', '2015', '37', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('265', '0', '14', '1天', '86400', '', '', '2015', '2015', '36', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('266', '0', '14', '2天', '172800', '', '', '2015', '2015', '35', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('267', '0', '14', '3天', '259200', '', '', '2015', '2015', '34', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('268', '0', '14', '5天', '432000', '', '', '2015', '2015', '33', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('270', '0', '11', '后台权限认证之后', 'auth_after', '', 'sadfasdfsadf', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('290', '0', '6', '枚举', 'item', '', '一样一个，例如\r\nhaha\r\nhehe\r\nxixi', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('276', '0', '17', 'mysql', 'mysql', '', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('274', '0', '15', '是', '1', '', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('275', '0', '16', '对不起，你的配置可能错误', '0', '', '', '2015', '2015', '1', '1', '1');
INSERT INTO `ebcms_datadict` VALUES ('292', '0', '12', '记录点击量', 'Home\\\\Behavior\\\\ClickBehavior', '', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('293', '206', '10', '内容', 'Home/Article/detail?id=文章id', '', '', '1457273447', '2015', '1', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('297', '0', '20', '添加', 'add', '', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('298', '0', '20', '修改', 'save', '', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('299', '0', '21', '单行文本', 'textbox', '', '', '2015', '2015', '241', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('300', '0', '21', '编辑器', 'ueditor', '', '', '2015', '2015', '217', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('301', '0', '21', '布尔选择', 'bool', '', '', '2015', '2015', '212', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('302', '0', '21', '数字框', 'numberbox', '', '', '2015', '2015', '215', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('303', '0', '21', '下拉选项', 'combotree', '', '', '2015', '2015', '211', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('304', '0', '21', '图片', 'image', '', '', '2015', '2015', '210', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('305', '0', '21', '多图', 'images', '', '', '2015', '2015', '209', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('306', '0', '21', '附件', 'file', '', '', '2015', '2015', '208', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('307', '0', '21', '多附件', 'files', '', '', '2015', '2015', '207', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('308', '0', '21', '日期', 'datebox', '', '', '2015', '2015', '159', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('309', '0', '21', '日期时间', 'datetimebox', '', '', '2015', '2015', '147', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('310', '0', '21', '时间', 'timespinner', '', '', '2015', '2015', '138', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('311', '0', '21', '隐藏域', 'hidden', '', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('313', '0', '21', '多行文本', 'multitextbox', '', '', '2015', '2015', '231', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('314', '0', '21', '数据字典', 'datadict', '', '', '2015', '2015', '167', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('315', '0', '22', '超链接', 'url', '', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('316', '0', '22', '电子邮箱', 'email', '{\"test\":\"332\"}', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('318', '0', '21', '单选', 'radio', '', '', '2015', '2015', '199', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('319', '0', '21', '复选', 'checkbox', '', '', '2015', '2015', '200', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('324', '0', '12', '手机端检查', 'Home\\\\Behavior\\\\MobileBehavior', '', '', '1457578602', '1457578584', '0', '1', '0');
INSERT INTO `ebcms_datadict` VALUES ('325', '0', '11', 'Home开始', 'home_init', '', '', '1457578633', '1457578633', '0', '1', '0');

-- ----------------------------
-- Table structure for `ebcms_datadictcate`
-- ----------------------------
DROP TABLE IF EXISTS `ebcms_datadictcate`;
CREATE TABLE `ebcms_datadictcate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `group` varchar(255) NOT NULL DEFAULT '' COMMENT '分组',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '标题',
  `field` varchar(20) NOT NULL DEFAULT '' COMMENT '字段',
  `model_id` varchar(255) NOT NULL DEFAULT '' COMMENT '模型',
  `iconcls` varchar(20) NOT NULL DEFAULT '' COMMENT '图标类',
  `instruction` varchar(255) NOT NULL DEFAULT '' COMMENT '说明',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `sort` int(4) unsigned NOT NULL DEFAULT '99' COMMENT '排序',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `locked` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '锁定',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='数据字典分类表';

-- ----------------------------
-- Records of ebcms_datadictcate
-- ----------------------------
INSERT INTO `ebcms_datadictcate` VALUES ('2', '核心字典', '微信菜单类型', 'wx_menu_type', '6', '', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_datadictcate` VALUES ('3', '核心字典', '菜单分类', 'menutype', '10', '未填写', '未填写', '2015', '2015', '1', '1', '1');
INSERT INTO `ebcms_datadictcate` VALUES ('4', '核心字典', '附件分类', 'attachtype', '', '未填写', '', '2015', '2015', '44', '1', '1');
INSERT INTO `ebcms_datadictcate` VALUES ('5', '核心字典', '模板分类', 'tpltype', '', '', '', '2015', '2015', '1', '1', '1');
INSERT INTO `ebcms_datadictcate` VALUES ('6', '核心字典', '配置解析类型', 'configtype', '', '', '', '2015', '2015', '99', '1', '1');
INSERT INTO `ebcms_datadictcate` VALUES ('9', '核心字典', '内容调用方式', 'recursion', '', '', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_datadictcate` VALUES ('10', '核心字典', '导航实例', 'navexample', '', '', '', '2015', '2015', '1', '1', '1');
INSERT INTO `ebcms_datadictcate` VALUES ('11', '核心字典', '系统钩子', 'hook', '', '', '', '2015', '2015', '55', '1', '0');
INSERT INTO `ebcms_datadictcate` VALUES ('12', '核心字典', '系统行为', 'behavior', '', '', '', '2016', '2015', '66', '1', '0');
INSERT INTO `ebcms_datadictcate` VALUES ('13', '核心字典', '定时任务', 'cron', '4', '', '', '2015', '2015', '77', '1', '0');
INSERT INTO `ebcms_datadictcate` VALUES ('14', '核心字典', '秒', 'second', '', '', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_datadictcate` VALUES ('15', '核心字典', '布尔选项', 'bool', '', '', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_datadictcate` VALUES ('16', '核心字典', '错误', 'error', '', '', '系统个项目，请不要删除', '2015', '2015', '1', '1', '1');
INSERT INTO `ebcms_datadictcate` VALUES ('17', '核心字典', '数据类型', 'db_type', '', '', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_datadictcate` VALUES ('20', '核心字典', '表单模板', 'formtpl', '0', '', '', '2015', '2015', '1', '1', '0');
INSERT INTO `ebcms_datadictcate` VALUES ('21', '核心字典', '表单字段类型', 'formfieldtype', '0', '', '', '2015', '2015', '88', '1', '0');
INSERT INTO `ebcms_datadictcate` VALUES ('22', '核心字典', '表单认证类型', 'formvalidtype', '1', '', '', '2015', '2015', '1', '1', '0');

-- ----------------------------
-- Table structure for `ebcms_form`
-- ----------------------------
DROP TABLE IF EXISTS `ebcms_form`;
CREATE TABLE `ebcms_form` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '节点ID',
  `group` varchar(255) NOT NULL DEFAULT '' COMMENT '分组',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '名称',
  `instruction` varchar(255) NOT NULL DEFAULT '' COMMENT '说明',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `locked` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否锁定',
  `sys_mark` varchar(255) NOT NULL DEFAULT '' COMMENT '系统标致',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=111 DEFAULT CHARSET=utf8 COMMENT='表单表';

-- ----------------------------
-- Records of ebcms_form
-- ----------------------------
INSERT INTO `ebcms_form` VALUES ('19', '表单配置', '单行文本', 'form_textbox', '', '101', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_form` VALUES ('20', '表单配置', '布尔选项', 'form_bool', '', '56', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_form` VALUES ('21', '表单配置', '隐藏域', 'form_hidden', '', '1', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_form` VALUES ('22', '表单配置', '百度编辑器', 'form_ueditor', '', '86', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_form` VALUES ('23', '表单配置', '数字框', 'form_numberbox', '', '91', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_form` VALUES ('24', '表单配置', '图片', 'form_image', '', '69', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_form` VALUES ('25', '表单配置', '多图上传', 'form_images', '', '66', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_form` VALUES ('26', '表单配置', '附件', 'form_file', '', '68', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_form` VALUES ('27', '表单配置', '多附件', 'form_files', '', '62', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_form` VALUES ('28', '表单配置', '日期', 'form_datebox', '', '33', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_form` VALUES ('29', '表单配置', '时间', 'form_time', '', '31', '2016', '2015', '1', '0', '');
INSERT INTO `ebcms_form` VALUES ('30', '表单配置', '时间日期', 'form_datetimebox', '', '32', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_form` VALUES ('32', '表单配置', '下拉选项（数据源）', 'form_combotree', '', '45', '1457272266', '2015', '1', '0', '');
INSERT INTO `ebcms_form` VALUES ('33', '表单配置', '多行文本', 'form_multitextbox', '', '97', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_form` VALUES ('34', '表单配置', '数据字典', 'form_datadict', '', '47', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_form` VALUES ('47', '模板管理', '添加', 'Admin_Template_add', '', '121', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_form` VALUES ('48', '模板管理', '修改', 'Admin_Template_save', '', '1', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_form` VALUES ('49', '附件管理', '编辑', 'Admin_Attachment_save', '', '124', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_form` VALUES ('50', '用户管理', '添加角色', 'Admin_Group_add', '', '66', '2016', '2015', '1', '0', '');
INSERT INTO `ebcms_form` VALUES ('51', '用户管理', '修改角色', 'Admin_Group_save', '', '56', '2016', '2015', '1', '0', '');
INSERT INTO `ebcms_form` VALUES ('52', '用户管理', '添加用户', 'Admin_User_add', '', '136', '2016', '2015', '1', '0', '');
INSERT INTO `ebcms_form` VALUES ('53', '用户管理', '修改用户', 'Admin_User_save', '', '75', '2016', '2015', '1', '0', '');
INSERT INTO `ebcms_form` VALUES ('54', '模型管理', '添加模型', 'Admin_Model_add', '', '141', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_form` VALUES ('55', '模型管理', '修改模型', 'Admin_Model_save', '', '71', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_form` VALUES ('56', '模型管理', '添加字段', 'Admin_Modelfield_add', '', '60', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_form` VALUES ('57', '模型管理', '修改字段', 'Admin_Modelfield_save', '', '1', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_form` VALUES ('64', '表单配置', '单选', 'form_radio', '', '72', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_form` VALUES ('65', '表单配置', '复选', 'form_checkbox', '', '71', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_form` VALUES ('70', '定时任务', '添加', 'Admin_Cron_add', '', '125', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_form` VALUES ('71', '定时任务', '修改', 'Admin_Cron_save', '', '1', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_form` VALUES ('76', '内容管理', '添加分类', 'Article_Category_add', '', '160', '1457501688', '2015', '1', '0', '');
INSERT INTO `ebcms_form` VALUES ('77', '内容管理', '修改分类', 'Article_Category_save', '', '50', '1457501694', '2015', '1', '0', '');
INSERT INTO `ebcms_form` VALUES ('78', '内容管理', '添加内容', 'Article_Article_add', '', '30', '1457501646', '2015', '1', '0', '');
INSERT INTO `ebcms_form` VALUES ('79', '内容管理', '修改内容', 'Article_Article_save', '', '20', '1457501651', '2015', '1', '0', '');
INSERT INTO `ebcms_form` VALUES ('80', '导航管理', '添加导航', 'Admin_Nav_add', '', '155', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_form` VALUES ('81', '导航管理', '修改导航', 'Admin_Nav_save', '', '50', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_form` VALUES ('82', '导航管理', '添加导航分类', 'Admin_Navcate_add', '', '30', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_form` VALUES ('83', '导航管理', '修改导航分类', 'Admin_Navcate_save', '', '20', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_form` VALUES ('84', '友情链接', '添加友情链接', 'Link_Link_add', '', '154', '1457503395', '2015', '1', '0', '');
INSERT INTO `ebcms_form` VALUES ('85', '友情链接', '修改友情链接', 'Link_Link_save', '', '1', '1457503399', '2015', '1', '0', '');
INSERT INTO `ebcms_form` VALUES ('86', '留言中心', '修改留言', 'Admin_Guestbook_save', '', '153', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_form` VALUES ('87', '留言中心', '回复留言', 'Admin_Guestbook_reply', '', '50', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_form` VALUES ('88', '推荐管理', '添加推荐位', 'Admin_Recommendcate_add', '', '152', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_form` VALUES ('89', '推荐管理', '修改推荐位', 'Admin_Recommendcate_save', '', '45', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_form` VALUES ('90', '推荐管理', '添加推荐内容', 'Admin_Recommend_add', '', '40', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_form` VALUES ('91', '推荐管理', '修改推荐内容', 'Admin_Recommend_save', '', '35', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_form` VALUES ('98', '基本表单', '修改密码', 'Admin_Index_password', '', '102', '2016', '2016', '1', '0', '');
INSERT INTO `ebcms_form` VALUES ('110', '用户管理', '修改密码', 'Admin_User_password', '', '0', '1459056880', '1459056880', '1', '0', '');
INSERT INTO `ebcms_form` VALUES ('107', '表单配置', '下拉选项（枚举）', 'form_select', '', '44', '1457272331', '1457272331', '1', '0', '');
INSERT INTO `ebcms_form` VALUES ('108', '自定义配置', '添加', 'Admin_Conf_addcustom', '', '108', '1457593299', '1457591227', '1', '0', '');
INSERT INTO `ebcms_form` VALUES ('109', '自定义配置', '修改', 'Admin_Conf_savecustom', '', '1', '1457593304', '1457591250', '1', '0', '');

-- ----------------------------
-- Table structure for `ebcms_formfield`
-- ----------------------------
DROP TABLE IF EXISTS `ebcms_formfield`;
CREATE TABLE `ebcms_formfield` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类',
  `group` varchar(250) NOT NULL DEFAULT '' COMMENT '分组',
  `title` varchar(250) NOT NULL DEFAULT '' COMMENT '标题',
  `subtable` varchar(250) NOT NULL DEFAULT '' COMMENT '副表',
  `extfield` varchar(250) NOT NULL DEFAULT '' COMMENT '扩展字段',
  `name` char(40) NOT NULL DEFAULT '' COMMENT '键',
  `value` text COMMENT '默认值',
  `defaultvaluetype` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '取值类型',
  `defaultvalue` text COMMENT '默认值',
  `type` varchar(255) NOT NULL DEFAULT '' COMMENT '表单类型',
  `config` text COMMENT '表单配置',
  `instruction` text COMMENT '表单说明',
  `sort` int(4) unsigned NOT NULL DEFAULT '99' COMMENT '排序',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `locked` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '锁定',
  `sys_mark` varchar(255) NOT NULL DEFAULT '' COMMENT '系统标致',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=663 DEFAULT CHARSET=utf8 COMMENT='表单字段表';

-- ----------------------------
-- Records of ebcms_formfield
-- ----------------------------
INSERT INTO `ebcms_formfield` VALUES ('10', '11', '阿斯顿发', '附件', '', '', 'attachment', '', '0', '', 'form_files', '', '', '1', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('72', '31', '基本配置', '是否必填', '', 'config', 'required', '', '3', 'required', 'form_bool', '', '', '50', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('26', '19', '基本配置', 'id', '', '', 'id', '', '1', 'id', 'form_hidden', '', '', '1', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('71', '31', '基本配置', 'id', '', '', 'id', '', '1', 'id', 'form_hidden', '', '', '1', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('27', '19', '基本配置', '是否必填', '', 'config', 'required', '', '3', 'required', 'form_bool', '', '', '45', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('32', '33', '基本配置', '宽度', '', 'config', 'width', '', '3', 'width', 'form_numberbox', '', '不填写表示 100% ', '30', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('29', '33', '基本配置', '是否必填', '', 'config', 'required', '', '3', 'required', 'form_bool', '', '', '48', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('30', '33', '基本配置', 'id', '', '', 'id', '', '1', 'id', 'form_hidden', '', '', '1', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('31', '33', '基本配置', '高度', '', 'config', 'height', '', '3', 'height', 'form_numberbox', '', '最好不要超过200 默认120', '31', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('39', '19', '基本配置', '是否只读', '', 'config', 'readonly', '', '3', 'readonly', 'form_bool', '', '', '40', '1457834503', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('34', '33', '基本配置', '提示字符', '', 'config', 'prompt', '', '3', 'prompt', 'form_textbox', '{\"width\":\"\",\"prompt\":\"\",\"maxlength\":\"\",\"minlength\":\"\",\"validtype\":\"\",\"required\":\"0\"}', '', '15', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('36', '33', '基本配置', '是否失效', '', 'config', 'disabled', '', '3', 'disabled', 'form_bool', '', '', '45', '1457834547', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('41', '19', '基本配置', '提示字符', '', 'config', 'prompt', '', '3', 'prompt', 'form_textbox', '{\"width\":\"\",\"prompt\":\"\",\"maxlength\":\"\",\"minlength\":\"\",\"validtype\":\"\",\"required\":\"0\"}', '', '5', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('42', '33', '基本配置', '最少字符数', '', 'config', 'minlength', '', '3', 'minlength', 'form_numberbox', '', '默认0', '20', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('43', '33', '基本配置', '最大字符数', '', 'config', 'maxlength', '', '3', 'maxlength', 'form_numberbox', '', '默认999999', '21', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('45', '34', '基本配置', 'id', '', '', 'id', '', '1', 'id', 'form_hidden', '', '', '1', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('47', '34', '基本配置', '是否必填', '', 'config', 'required', '', '3', 'required', 'form_bool', '', '', '45', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('48', '34', '基本配置', '提示字符', '', 'config', 'prompt', '', '3', 'prompt', 'form_textbox', '', '', '10', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('53', '34', '基本配置', '是否失效', '', 'config', 'disabled', '', '3', 'disabled', 'form_bool', '', '', '30', '1457835284', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('55', '34', '基本配置', '数据来源', '', 'config', 'datadict', '', '3', 'datadict', 'form_textbox', '', '', '50', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('56', '32', '基本配置', 'id', '', '', 'id', '', '1', 'id', 'form_hidden', '', '', '1', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('57', '32', '基本配置', '模型名称', '', 'config', 'model', '', '3', 'model', 'form_textbox', '', '', '50', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('58', '32', '其他配置', '宽度', '', 'config', 'width', '', '3', 'width', 'form_numberbox', '', '', '1', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('60', '32', '基本配置', '是否必填', '', 'config', 'required', '', '3', 'required', 'form_bool', '', '', '45', '1457835341', '2015', '0', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('61', '32', '基本配置', '提示字符', '', 'config', 'prompt', '', '3', 'prompt', 'form_textbox', '', '', '10', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('63', '32', '基本配置', '是否失效', '', 'config', 'disabled', '', '3', 'disabled', 'form_bool', '', '', '43', '1457835349', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('567', '32', '基本配置', '树型化', '', 'config', 'tree', '', '3', 'tree', 'form_bool', '', '', '35', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('68', '32', '其他配置', '递归字段', '', 'config', 'pid', '', '3', 'pid', 'form_textbox', '', '通常请不要修改 默认pid', '30', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('69', '32', '基本配置', '根选项', '', 'config', 'rootitem', '', '3', 'rootitem', 'form_bool', '', '根选项开启后 所有条目都会在根选项之下，通常用于选择父级 默认0', '40', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('73', '31', '基本配置', '提示信息', '', 'config', 'prompt', '', '3', 'prompt', 'form_textbox', '', '', '35', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('74', '31', '基本配置', '是否只读', '', 'config', 'readonly', '', '3', 'readonly', 'form_bool', '', '', '30', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('75', '31', '基本配置', '是否失效', '', 'config', 'disabled', '', '3', 'disabled', 'form_bool', '', '', '10', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('76', '31', '基本配置', '是否可编辑', '', 'config', 'editable', '', '3', 'editable', 'form_bool', '', '', '40', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('77', '30', '基本配置', 'id', '', '', 'id', '', '1', 'id', 'form_hidden', '', '', '1', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('78', '29', '基本配置', 'id', '', '', 'id', '', '1', 'id', 'form_hidden', '', '', '1', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('79', '28', '基本配置', 'id', '', '', 'id', '', '1', 'id', 'form_hidden', '', '', '1', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('80', '27', '基本配置', 'id', '', '', 'id', '', '1', 'id', 'form_hidden', '', '', '1', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('81', '26', '基本配置', 'id', '', '', 'id', '', '1', 'id', 'form_hidden', '', '', '1', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('82', '25', '基本配置', 'id', '', '', 'id', '', '1', 'id', 'form_hidden', '', '', '1', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('83', '24', '基本配置', 'id', '', '', 'id', '', '1', 'id', 'form_hidden', '', '', '1', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('84', '23', '基本配置', 'id', '', '', 'id', '', '1', 'id', 'form_hidden', '', '', '1', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('85', '22', '基本配置', 'id', '', '', 'id', '', '1', 'id', 'form_hidden', '', '', '1', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('86', '21', '基本配置', 'id', '', '', 'id', '', '1', 'id', 'form_hidden', '', '', '1', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('87', '20', '基本配置', 'id', '', '', 'id', '', '1', 'id', 'form_hidden', '', '', '1', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('88', '19', '基本配置', '认证类型', '', 'config', 'validtype', '', '3', 'validtype', 'form_datadict', '{\"datadict\":\"formvalidtype\",\"required\":\"0\",\"rootitem\":\"1\",\"disabled\":\"0\",\"prompt\":\"\"}', '', '30', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('89', '34', '基本配置', '根选项', '', 'config', 'rootitem', '', '3', 'rootitem', 'form_bool', '', '', '40', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('90', '23', '基本配置', '最小值', '', 'config', 'min', '', '3', 'min', 'form_numberbox', '', '', '25', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('91', '23', '基本配置', '最大值', '', 'config', 'max', '', '3', 'max', 'form_numberbox', '', '', '30', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('97', '23', '基本配置', '是否必填', '', 'config', 'required', '', '3', 'required', 'form_bool', '', '', '45', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('99', '23', '基本配置', '提示信息', '', 'config', 'prompt', '', '3', 'prompt', 'form_textbox', '', '', '15', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('101', '23', '基本配置', '是否失效', '', 'config', 'disabled', '', '3', 'disabled', 'form_bool', '', '', '40', '1457834603', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('104', '22', '基本配置', '高度', '', 'config', 'initialframeheight', '', '3', 'initialframeheight', 'form_numberbox', '', '', '50', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('105', '22', '基本配置', '显示元素路径', '', 'config', 'elementpathenabled', '', '3', 'elementpathenabled', 'form_bool', '', '', '20', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('106', '22', '基本配置', '开启字数统计', '', 'config', 'wordcount', '', '3', 'wordcount', 'form_bool', '', '', '30', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('107', '22', '基本配置', '最大字符数', '', 'config', 'maximumwords', '', '3', 'maximumwords', 'form_numberbox', '{\"required\":\"0\",\"editable\":\"1\",\"readonly\":\"0\",\"max\":\"\",\"min\":\"\",\"prompt\":\"\",\"disabled\":\"0\",\"width\":\"\",\"prefix\":\"\",\"suffix\":\"\",\"groupseparator\":\"\",\"decimalseparator\":\"\",\"precision\":\"\"}', '', '40', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('108', '22', '基本配置', '自动高度', '', 'config', 'autoheightenabled', '', '3', 'autoheightenabled', 'form_bool', '', '', '45', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('112', '24', '基本配置', '允许的类型', '', 'config', 'extensions', '', '3', 'extensions', 'form_textbox', '', '多个类型用‘,’分割，例如：jpg,png,gif,bmp', '40', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('113', '24', '基本配置', '是否必填', '', 'config', 'required', '', '3', 'required', 'form_bool', '', '', '50', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('114', '24', '基本配置', '提示信息', '', 'config', 'prompt', '', '3', 'prompt', 'form_textbox', '', '', '20', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('116', '24', '基本配置', '是否失效', '', 'config', 'disabled', '', '3', 'disabled', 'form_bool', '', '', '45', '1457835074', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('118', '26', '基本配置', '允许的类型', '', 'config', 'extensions', '', '3', 'extensions', 'form_textbox', '', '', '35', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('119', '26', '基本配置', '是否必填', '', 'config', 'required', '', '3', 'required', 'form_bool', '', '', '50', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('121', '26', '基本配置', '是否失效', '', 'config', 'disabled', '', '3', 'disabled', 'form_bool', '', '', '40', '1457835114', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('123', '25', '基本配置', '允许的类型', '', 'config', 'extensions', '', '3', 'extensions', 'form_textbox', '', '', '40', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('124', '25', '基本配置', '是否失效', '', 'config', 'disabled', '', '3', 'disabled', 'form_bool', '', '', '45', '1457835154', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('126', '25', '基本配置', '是否必填', '', 'config', 'required', '', '3', 'required', 'form_bool', '', '', '50', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('127', '27', '基本配置', '允许的类型', '', 'config', 'extensions', '', '3', 'extensions', 'form_textbox', '', '', '40', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('129', '27', '基本配置', '是否必填', '', 'config', 'required', '', '3', 'required', 'form_bool', '', '', '50', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('132', '27', '基本配置', '是否失效', '', 'config', 'disabled', '', '3', 'disabled', 'form_bool', '', '', '45', '1457835190', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('133', '28', '基本配置', '面板宽度', '', 'config', 'panelwidth', '', '3', 'panelwidth', 'form_numberbox', '', '默认180', '15', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('134', '28', '基本配置', '面板高度', '', 'config', 'panelheight', '', '3', 'panelheight', 'form_numberbox', '', '默认自动', '10', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('139', '28', '基本配置', '是否失效', '', 'config', 'disabled', '', '3', 'disabled', 'form_bool', '', '', '40', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('140', '28', '基本配置', '是否只读', '', 'config', 'readonly', '', '3', 'readonly', 'form_bool', '', '', '35', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('141', '28', '基本配置', '提示字符', '', 'config', 'prompt', '', '3', 'prompt', 'form_textbox', '', '', '25', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('142', '26', '基本配置', '提示字符', '', 'config', 'prompt', '', '3', 'prompt', 'form_textbox', '', '', '20', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('143', '25', '基本配置', '提示字符', '', 'config', 'prompt', '', '3', 'prompt', 'form_textbox', '', '', '20', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('144', '27', '基本配置', '提示字符', '', 'config', 'prompt', '', '3', 'prompt', 'form_textbox', '', '', '20', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('146', '30', '基本配置', '是否必填', '', 'config', 'required', '', '3', 'required', 'form_bool', '', '', '45', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('147', '28', '基本配置', '是否必填', '', 'config', 'required', '', '3', 'required', 'form_bool', '', '', '45', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('148', '30', '基本配置', '提示字符', '', 'config', 'prompt', '', '3', 'prompt', 'form_textbox', '', '', '30', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('149', '30', '基本配置', '是否只读', '', 'config', 'readonly', '', '3', 'readonly', 'form_bool', '', '', '35', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('150', '30', '基本配置', '是否失效', '', 'config', 'disabled', '', '3', 'disabled', 'form_bool', '', '', '40', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('158', '29', '基本配置', '是否必填', '', 'config', 'required', '', '3', 'required', 'form_bool', '', '', '50', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('160', '29', '基本配置', '是否失效', '', 'config', 'disabled', '', '3', 'disabled', 'form_bool', '', '', '40', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('161', '29', '基本配置', '是否只读', '', 'config', 'readonly', '', '3', 'readonly', 'form_bool', '', '', '30', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('190', '32', '其他配置', '查询条件', '', 'config', 'queryparams', '', '3', 'queryparams', 'form_multitextbox', '', '', '40', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('258', '47', '基本信息', '目录', '', '', 'title', '', '3', 'title', 'form_textbox', '{\"required\":\"1\",\"readonly\":\"1\",\"disabled\":\"0\",\"maxlength\":\"\",\"minlength\":\"\",\"validtype\":\"\",\"prompt\":\"\"}', '', '40', '1459058072', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('259', '47', '基本信息', '文件名', '', '', 'name', '', '0', 'newfile.txt', 'form_textbox', '{\"required\":\"1\",\"readonly\":\"0\",\"disabled\":\"0\",\"maxlength\":\"\",\"minlength\":\"\",\"validtype\":\"\",\"prompt\":\"\"}', '请填写完整的文件名 包含后缀', '30', '1459058077', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('260', '47', '基本信息', '路径', '', '', 'path', '', '1', 'path', 'form_hidden', '', '', '1', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('261', '47', '基本信息', '内容', '', '', 'content', '', '0', '默认值，呵呵', 'form_multitextbox', '{\"required\":\"1\",\"disabled\":\"0\",\"height\":\"20\",\"width\":\"\",\"maxlength\":\"\",\"minlength\":\"0\",\"prompt\":\"\"}', '', '20', '2016', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('262', '48', '基本信息', '文件', '', '', 'title', '', '3', 'title', 'form_textbox', '{\"required\":\"1\",\"readonly\":\"1\",\"disabled\":\"0\",\"maxlength\":\"\",\"minlength\":\"\",\"validtype\":\"\",\"prompt\":\"\"}', '', '40', '1459058061', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('263', '48', '基本信息', '内容', '', '', 'content', '', '3', 'content', 'form_multitextbox', '{\"required\":\"0\",\"disabled\":\"0\",\"height\":\"20\",\"width\":\"\",\"maxlength\":\"\",\"minlength\":\"0\",\"prompt\":\"\"}', '', '30', '2016', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('264', '48', '基本信息', '文件路径', '', '', 'filename', '', '1', 'filename', 'form_hidden', '', '', '1', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('267', '49', '基本信息', 'id', '', '', 'id', '', '1', 'id', 'form_hidden', '', '', '1', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('268', '49', '基本信息', '标题', '', '', 'title', '', '3', 'title', 'form_textbox', '', '', '99', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('269', '49', '基本信息', '简介', '', '', 'instruction', '', '3', 'instruction', 'form_multitextbox', '{\"width\":\"\",\"height\":\"\",\"prompt\":\"\",\"minlength\":\"1\",\"maxlength\":\"250\",\"validtype\":\"\"}', '', '22', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('270', '51', '基本信息', 'id', '', '', 'id', '', '1', 'id', 'form_hidden', '', '', '10', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('271', '51', '基本信息', '父级', '', '', 'pid', '', '3', 'pid', 'form_combotree', '{\"model\":\"group\",\"disabled\":\"0\",\"rootitem\":\"1\",\"tree\":\"1\",\"prompt\":\"\",\"queryparams\":\"\",\"pid\":\"\",\"textfield\":\"title\",\"valuefield\":\"\",\"width\":\"\"}', '', '99', '2016', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('272', '51', '基本信息', '名称', '', '', 'title', '', '3', 'title', 'form_textbox', '', '', '82', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('273', '51', '基本信息', '图标', '', '', 'iconcls', '', '3', 'iconcls', 'form_textbox', '', '', '30', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('274', '50', '基本信息', '父级', '', '', 'pid', '', '1', 'pid', 'form_combotree', '{\"model\":\"group\",\"disabled\":\"0\",\"rootitem\":\"1\",\"tree\":\"1\",\"prompt\":\"\",\"queryparams\":\"\",\"pid\":\"\",\"textfield\":\"title\",\"valuefield\":\"\",\"width\":\"\"}', '', '98', '2016', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('275', '50', '基本信息', '名称', '', '', 'title', '', '0', '', 'form_textbox', '', '', '91', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('276', '50', '基本信息', '图标', '', '', 'iconcls', '', '0', '', 'form_textbox', '', '', '20', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('277', '52', '基本信息', '昵称', '', '', 'nickname', '', '0', '', 'form_textbox', '{\"width\":\"\",\"prompt\":\"2-6\\u4e2a\\u5b57\\u7b26\",\"maxlength\":\"6\",\"minlength\":\"2\",\"validtype\":\"\",\"required\":\"1\",\"editable\":\"1\",\"disabled\":\"0\",\"readonly\":\"0\"}', '', '50', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('278', '52', '基本信息', '密码', '', '', 'password', '', '0', '', 'form_textbox', '{\"width\":\"\",\"prompt\":\"5-10\\u4e2a\\u5b57\\u7b26\",\"maxlength\":\"10\",\"minlength\":\"5\",\"validtype\":\"\",\"required\":\"1\",\"editable\":\"1\",\"disabled\":\"0\",\"readonly\":\"0\"}', '', '40', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('279', '53', '基本信息', '昵称', '', '', 'nickname', '', '3', 'nickname', 'form_textbox', '{\"width\":\"\",\"prompt\":\"\",\"maxlength\":\"6\",\"minlength\":\"2\",\"validtype\":\"\",\"required\":\"1\",\"editable\":\"1\",\"disabled\":\"0\",\"readonly\":\"0\"}', '', '40', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('280', '53', '基本信息', 'id', '', '', 'id', '', '1', 'id', 'form_hidden', '', '', '1', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('281', '19', '基本配置', '最小字符数', '', 'config', 'minlength', '', '3', 'minlength', 'form_numberbox', '', '', '34', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('282', '19', '基本配置', '最多字符数', '', 'config', 'maxlength', '', '3', 'maxlength', 'form_numberbox', '', '', '35', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('283', '55', '基本信息', 'id', '', '', 'id', '', '1', 'id', 'form_hidden', '', '', '1', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('284', '55', '基本信息', '标题', '', '', 'title', '', '3', 'title', 'form_textbox', '{\"required\":\"1\",\"editable\":\"1\",\"maxlength\":\"\",\"minlength\":\"\",\"validtype\":\"\",\"readonly\":\"0\",\"disabled\":\"0\",\"prompt\":\"\",\"width\":\"\"}', '', '97', '1457524594', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('338', '64', '基本配置', 'id', '', '', 'id', '', '1', 'id', 'form_hidden', '', '', '1', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('286', '55', '基本信息', '图标', '', '', 'iconcls', '', '3', 'iconcls', 'form_textbox', '', '', '77', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('287', '55', '基本信息', '说明', '', '', 'instruction', '', '3', 'instruction', 'form_multitextbox', '', '', '46', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('288', '55', '基本信息', '排序', '', '', 'sort', '', '3', 'sort', 'form_numberbox', '', '', '10', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('289', '55', '基本信息', '分组', '', '', 'group', '', '3', 'group', 'form_textbox', '{\"required\":\"1\",\"editable\":\"1\",\"maxlength\":\"\",\"minlength\":\"\",\"validtype\":\"\",\"readonly\":\"0\",\"disabled\":\"0\",\"prompt\":\"\",\"width\":\"\"}', '', '99', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('290', '54', '基本信息', '分组', '', '', 'group', '', '0', '', 'form_textbox', '{\"required\":\"1\",\"editable\":\"1\",\"maxlength\":\"\",\"minlength\":\"\",\"validtype\":\"\",\"readonly\":\"0\",\"disabled\":\"0\",\"prompt\":\"\",\"width\":\"\"}', '', '99', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('291', '54', '基本信息', '标题', '', '', 'title', '', '0', '', 'form_textbox', '{\"required\":\"1\",\"editable\":\"1\",\"maxlength\":\"\",\"minlength\":\"\",\"validtype\":\"\",\"readonly\":\"0\",\"disabled\":\"0\",\"prompt\":\"\",\"width\":\"\"}', '', '96', '1457524589', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('339', '64', '基本配置', '可选值', '', 'config', 'values', '', '3', 'values', 'form_multitextbox', '', '一行一个，例如：\r\n哈哈|haha\r\n中国|china\r\n北京|beijing', '50', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('293', '54', '基本信息', '说明', '', '', 'instruction', '', '0', '', 'form_multitextbox', '', '', '75', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('294', '54', '基本信息', '图标', '', '', 'iconcls', '', '0', '', 'form_textbox', '', '', '79', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('295', '54', '基本信息', '排序', '', '', 'sort', '', '0', '', 'form_numberbox', '', '', '10', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('296', '57', '基本信息', 'id', '', '', 'id', '', '1', 'id', 'form_hidden', '', '', '1', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('297', '57', '基本信息', '分组', '', '', 'group', '', '3', 'group', 'form_textbox', '{\"required\":\"1\",\"editable\":\"1\",\"maxlength\":\"\",\"minlength\":\"\",\"validtype\":\"\",\"readonly\":\"0\",\"disabled\":\"0\",\"prompt\":\"\",\"width\":\"\"}', '', '99', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('298', '57', '基本信息', '标题', '', '', 'title', '', '3', 'title', 'form_textbox', '{\"required\":\"1\",\"editable\":\"1\",\"maxlength\":\"\",\"minlength\":\"\",\"validtype\":\"\",\"readonly\":\"0\",\"disabled\":\"0\",\"prompt\":\"\",\"width\":\"\"}', '', '95', '1457524606', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('299', '57', '基本信息', '字段', '', '', 'name', '', '3', 'name', 'form_textbox', '{\"required\":\"1\",\"editable\":\"1\",\"maxlength\":\"\",\"minlength\":\"\",\"validtype\":\"\",\"readonly\":\"0\",\"disabled\":\"0\",\"prompt\":\"\",\"width\":\"\"}', '', '94', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('300', '57', '基本信息', '默认值', '', '', 'value', '', '3', 'value', 'form_multitextbox', '', '', '87', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('301', '57', '基本信息', '表单类型', '', '', 'type', '', '3', 'type', 'form_combotree', '{\"model\":\"form\",\"disabled\":\"0\",\"rootitem\":\"0\",\"tree\":\"0\",\"prompt\":\"\",\"queryparams\":\"group|eq|\\u8868\\u5355\\u914d\\u7f6e\",\"pid\":\"\",\"textfield\":\"\",\"valuefield\":\"name\",\"width\":\"\"}', '', '93', '2016', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('302', '57', '基本信息', '说明', '', '', 'instruction', '', '3', 'instruction', 'form_multitextbox', '', '', '67', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('303', '57', '基本信息', '排序', '', '', 'sort', '', '3', 'sort', 'form_numberbox', '', '', '10', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('304', '56', '基本信息', '分组', '', '', 'group', '', '0', '', 'form_textbox', '{\"required\":\"1\",\"editable\":\"1\",\"maxlength\":\"\",\"minlength\":\"\",\"validtype\":\"\",\"readonly\":\"0\",\"disabled\":\"0\",\"prompt\":\"\",\"width\":\"\"}', '', '99', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('305', '56', '基本信息', '标题', '', '', 'title', '', '0', '', 'form_textbox', '{\"required\":\"1\",\"editable\":\"1\",\"maxlength\":\"10\",\"minlength\":\"1\",\"validtype\":\"\",\"readonly\":\"0\",\"disabled\":\"0\",\"prompt\":\"\",\"width\":\"\"}', '', '96', '1457524600', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('306', '56', '基本信息', '字段', '', '', 'name', '', '0', '', 'form_textbox', '{\"required\":\"1\",\"editable\":\"1\",\"maxlength\":\"20\",\"minlength\":\"1\",\"validtype\":\"\",\"readonly\":\"0\",\"disabled\":\"0\",\"prompt\":\"\",\"width\":\"\"}', '', '89', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('307', '56', '基本信息', '默认值', '', '', 'value', '', '0', '', 'form_multitextbox', '', '', '78', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('308', '56', '基本信息', '表单类型', '', '', 'type', '', '0', '', 'form_combotree', '{\"model\":\"form\",\"disabled\":\"0\",\"rootitem\":\"0\",\"tree\":\"0\",\"prompt\":\"\",\"queryparams\":\"group|eq|\\u8868\\u5355\\u914d\\u7f6e\",\"pid\":\"\",\"textfield\":\"\",\"valuefield\":\"name\",\"width\":\"\"}', '', '91', '2016', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('309', '56', '基本信息', '说明', '', '', 'instruction', '', '0', '', 'form_multitextbox', '', '', '60', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('310', '56', '基本信息', '排序', '', '', 'sort', '', '0', '', 'form_numberbox', '', '', '1', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('573', '51', '基本信息', '分组', '', '', 'group', '', '3', 'group', 'form_radio', '{\"disabled\":\"0\",\"values\":\"\\u7cfb\\u7edf|\\u7cfb\\u7edf\\r\\n\\u666e\\u901a|\\u666e\\u901a\"}', '', '99', '2016', '2016', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('650', '65', '基本信息', '是否只读', '', 'config', 'readonly', '', '3', 'readonly', 'form_bool', '', '', '70', '1457835028', '1457835028', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('571', '65', '基本信息', '是否失效', '', 'config', 'disabled', '', '3', 'disabled', 'form_bool', '', '', '99', '1457835011', '2016', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('572', '50', '基本信息', '分组', '', '', 'group', '', '3', 'group', 'form_radio', '{\"disabled\":\"0\",\"values\":\"\\u7cfb\\u7edf|\\u7cfb\\u7edf\\r\\n\\u666e\\u901a|\\u666e\\u901a\"}', '', '99', '2016', '2016', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('343', '65', '基本信息', '可选值', '', 'config', 'values', '', '3', 'values', 'form_multitextbox', '', '一样一个，用|分割键值对，例如：\r\n红色|red\r\n绿色|green\r\n黑色|black\r\n灰色|gray', '50', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('342', '65', '基本信息', 'id', '', '', 'id', '', '1', 'id', 'form_hidden', '', '', '1', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('409', '70', '基本信息', '文件', '', '', 'cron', '', '0', '', 'form_textbox', '{\"datadict\":\"cron\",\"required\":\"1\",\"rootitem\":\"0\",\"prompt\":\"\",\"width\":\"\",\"editable\":\"0\",\"disabled\":\"0\",\"readonly\":\"0\",\"validtype\":\"\",\"maxlength\":\"\",\"minlength\":\"\"}', '请填写网站目录 /Application/Common/Cron/ 下的文件名称\r\n配置项 对应 模型管理中 定时任务分组下的对应文件名模型', '50', '2016', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('410', '70', '基本信息', '初始执行时间', '', '', 'initruntime', '', '0', '', 'form_datetimebox', '{\"timeseparator\":\"\",\"spinnerwidth\":\"\",\"closetext\":\"\",\"currenttext\":\"\",\"okText\":\"\",\"editable\":\"0\",\"disabled\":\"0\",\"readonly\":\"0\",\"prompt\":\"\"}', '', '45', '2016', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('411', '70', '基本信息', '执行时间间隔', '', '', 'intervals', '', '0', '', 'form_datadict', '{\"datadict\":\"second\",\"required\":\"1\",\"rootitem\":\"0\",\"prompt\":\"\",\"width\":\"\",\"editable\":\"1\",\"disabled\":\"0\",\"readonly\":\"0\",\"validtype\":\"\",\"maxlength\":\"\",\"minlength\":\"\"}', '', '40', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('412', '70', '基本信息', '说明', '', '', 'instruction', '', '0', '', 'form_multitextbox', '', '', '20', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('413', '70', '基本信息', '排序', '', '', 'sort', '', '0', '', 'form_numberbox', '', '', '10', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('414', '71', '基本信息', 'id', '', '', 'id', '', '1', 'id', 'form_hidden', '', '', '0', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('415', '71', '基本信息', '文件', '', '', 'cron', '', '3', 'cron', 'form_textbox', '{\"datadict\":\"cron\",\"required\":\"1\",\"prompt\":\"\",\"width\":\"\",\"editable\":\"0\",\"disabled\":\"0\",\"readonly\":\"0\",\"validtype\":\"\",\"maxlength\":\"\",\"minlength\":\"\"}', '请填写网站目录 /Application/Common/Cron/ 下的文件名称\r\n配置项 对应 模型管理中 定时任务分组下的对应文件名模型', '50', '2016', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('416', '71', '基本信息', '初始执行时间', '', '', 'initruntime', '', '3', 'initruntime', 'form_datetimebox', '', '', '45', '2016', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('417', '71', '基本信息', '执行时间间隔', '', '', 'intervals', '', '3', 'intervals', 'form_datadict', '{\"datadict\":\"second\",\"required\":\"1\",\"rootitem\":\"0\",\"prompt\":\"\",\"width\":\"\",\"editable\":\"0\",\"disabled\":\"0\",\"readonly\":\"0\",\"validtype\":\"\",\"maxlength\":\"\",\"minlength\":\"\"}', '', '40', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('418', '71', '基本信息', '说明', '', '', 'instruction', '', '3', 'instruction', 'form_multitextbox', '', '', '20', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('419', '71', '基本信息', '排序', '', '', 'sort', '', '3', 'sort', 'form_numberbox', '', '', '10', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('420', '70', '基本信息', '图标', '', '', 'iconcls', '', '0', '', 'form_textbox', '', '', '30', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('421', '71', '基本信息', '图标', '', '', 'iconcls', '', '3', 'iconcls', 'form_textbox', '', '', '30', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('422', '76', '基本信息', '父级', '', '', 'pid', '', '1', 'pid', 'form_combotree', '{\"model\":\"article_category\",\"disabled\":\"0\",\"rootitem\":\"1\",\"tree\":\"1\",\"prompt\":\"\",\"queryparams\":\"\",\"pid\":\"\",\"textfield\":\"\",\"valuefield\":\"\",\"width\":\"\"}', '', '90', '1457504178', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('647', '23', '基本配置', '是否只读', '', 'config', 'readonly', '', '3', 'readonly', 'form_bool', '', '', '38', '1457834630', '1457834630', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('648', '64', '基本配置', '是否只读', '', 'config', 'readonly', '', '3', 'readonly', 'form_bool', '', '', '55', '1457834949', '1457834919', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('649', '64', '基本配置', '是否失效', '', 'config', 'disabled', '', '3', 'disabled', 'form_bool', '', '', '60', '1457834943', '1457834943', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('424', '76', '基本信息', '标识', '', '', 'mark', '', '0', '', 'form_textbox', '{\"required\":\"1\",\"editable\":\"1\",\"maxlength\":\"20\",\"minlength\":\"2\",\"validtype\":\"\",\"readonly\":\"0\",\"disabled\":\"0\",\"prompt\":\"\\u8bf7\\u586b\\u5199\\u82f1\\u6587\\u5b57\\u7b26\",\"width\":\"\"}', '', '80', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('425', '76', '基本信息', '模型', '', '', 'model', '', '0', '', 'form_combotree', '{\"model\":\"model\",\"disabled\":\"0\",\"rootitem\":\"1\",\"tree\":\"0\",\"prompt\":\"\",\"queryparams\":\"group|eq|\\u6587\\u7ae0\\u6a21\\u578b\",\"pid\":\"\",\"textfield\":\"\",\"valuefield\":\"\",\"width\":\"\"}', '', '41', '2016', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('426', '76', '基本信息', '内容页模板', '', '', 'tpl_detail', '', '0', '', 'form_textbox', '', '', '21', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('427', '76', '基本信息', '列表页模板', '', '', 'tpl', '', '0', '', 'form_textbox', '', '', '22', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('428', '76', '基本信息', '列表分页大小', '', '', 'pagenum', '', '0', '20', 'form_numberbox', '', '0 表示不分页', '33', '1457273033', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('429', '76', '基本信息', '标题', '', '', 'title', '', '0', '', 'form_textbox', '{\"required\":\"0\",\"editable\":\"1\",\"maxlength\":\"80\",\"minlength\":\"\",\"validtype\":\"\",\"readonly\":\"0\",\"disabled\":\"0\",\"prompt\":\"\",\"width\":\"\"}', '', '75', '1457833405', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('430', '76', '基本信息', '关键字', '', '', 'keywords', '', '0', '', 'form_textbox', '{\"required\":\"0\",\"editable\":\"1\",\"maxlength\":\"80\",\"minlength\":\"\",\"validtype\":\"\",\"readonly\":\"0\",\"disabled\":\"0\",\"prompt\":\"\",\"width\":\"\"}', '', '74', '1457833411', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('431', '76', '基本信息', '摘要', '', '', 'description', '', '0', '', 'form_multitextbox', '{\"required\":\"0\",\"height\":\"\",\"width\":\"\",\"editable\":\"1\",\"maxlength\":\"255\",\"minlength\":\"\",\"validtype\":\"\",\"prompt\":\"\",\"readonly\":\"0\",\"disabled\":\"0\"}', '', '73', '1457833417', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('432', '76', '基本信息', '排序', '', '', 'sort', '', '0', '', 'form_numberbox', '', '', '2', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('433', '77', '基本信息', '父级', '', '', 'pid', '', '3', 'pid', 'form_combotree', '{\"model\":\"article_category\",\"disabled\":\"0\",\"rootitem\":\"1\",\"tree\":\"1\",\"prompt\":\"\",\"queryparams\":\"\",\"pid\":\"\",\"textfield\":\"\",\"valuefield\":\"\",\"width\":\"\"}', '', '90', '1457504174', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('645', '19', '基本配置', '是否失效', '', 'config', 'disabled', '', '3', 'disabled', 'form_bool', '', '', '38', '1457834468', '1457834468', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('646', '33', '基本配置', '是否只读', '', 'config', 'readonly', '', '3', 'readonly', 'form_bool', '', '', '40', '1457834535', '1457834535', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('435', '77', '基本信息', '标识', '', '', 'mark', '', '3', 'mark', 'form_textbox', '{\"required\":\"1\",\"editable\":\"1\",\"maxlength\":\"\",\"minlength\":\"\",\"validtype\":\"\",\"readonly\":\"0\",\"disabled\":\"0\",\"prompt\":\"\",\"width\":\"\"}', '', '80', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('436', '77', '基本信息', '模型', '', '', 'model', '', '3', 'model', 'form_combotree', '{\"model\":\"model\",\"disabled\":\"0\",\"rootitem\":\"1\",\"tree\":\"0\",\"prompt\":\"\",\"queryparams\":\"group|eq|\\u6587\\u7ae0\\u6a21\\u578b\",\"pid\":\"\",\"textfield\":\"\",\"valuefield\":\"\",\"width\":\"\"}', '', '41', '2016', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('437', '77', '基本信息', '列表页模板', '', '', 'tpl', '', '3', 'tpl', 'form_textbox', '', '', '22', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('438', '77', '基本信息', '列表页分页大小', '', '', 'pagenum', '', '3', 'pagenum', 'form_numberbox', '', '0 表示不分页', '33', '1457273045', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('439', '77', '基本信息', '内容页模板', '', '', 'tpl_detail', '', '3', 'tpl_detail', 'form_textbox', '', '', '21', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('440', '77', '基本信息', '标题', '', '', 'title', '', '3', 'title', 'form_textbox', '', '', '75', '1457833347', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('441', '77', '基本信息', '关键字', '', '', 'keywords', '', '3', 'keywords', 'form_textbox', '', '', '74', '1457833353', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('442', '77', '基本信息', '摘要', '', '', 'description', '', '3', 'description', 'form_multitextbox', '', '', '73', '1457833359', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('443', '77', '基本信息', '排序', '', '', 'sort', '', '3', 'sort', 'form_numberbox', '', '', '2', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('444', '77', '基本信息', 'id', '', '', 'id', '', '1', 'id', 'form_hidden', '', '', '1', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('445', '79', '基本信息', '标题', '', '', 'title', '', '3', 'title', 'form_textbox', '', '', '50', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('446', '79', '基本信息', '缩略图', '', '', 'thumb', '', '3', 'thumb', 'form_image', '', '', '45', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('447', '79', '基本信息', '内容', 'article_body', '', 'body', '', '3', 'body', 'form_ueditor', '', '', '40', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('448', '79', '基本信息', '关键字', '', '', 'keywords', '', '3', 'keywords', 'form_textbox', '', '', '47', '2016', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('449', '79', '基本信息', '摘要', '', '', 'description', '', '3', 'description', 'form_multitextbox', '', '', '46', '2016', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('450', '79', '其他信息', '模板', '', '', 'tpl', '', '3', 'tpl', 'form_textbox', '', '', '30', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('451', '79', '基本信息', 'id', '', '', 'id', '', '1', 'id', 'form_hidden', '', '', '12', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('452', '79', '其他信息', '标识', '', '', 'mark', '', '3', 'mark', 'form_textbox', '', '', '25', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('453', '79', '其他信息', '排序', '', '', 'sort', '', '3', 'sort', 'form_numberbox', '', '', '10', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('454', '78', '基本信息', '分类', '', '', 'category_id', '', '1', 'category_id', 'form_hidden', '', '', '0', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('455', '78', '基本信息', '标题', '', '', 'title', '', '0', '', 'form_textbox', '', '', '50', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('456', '78', '基本信息', '缩略图', '', '', 'thumb', '', '0', '', 'form_image', '', '', '45', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('457', '78', '基本信息', '内容', '', 'article_body', 'body', '', '0', '', 'form_ueditor', '', '', '40', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('458', '78', '基本信息', '关键字', '', '', 'keywords', '', '0', '', 'form_textbox', '', '', '47', '2016', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('459', '78', '基本信息', '摘要', '', '', 'description', '', '0', '', 'form_multitextbox', '', '', '46', '2016', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('460', '78', '其他信息', '标志', '', '', 'mark', '', '0', '', 'form_textbox', '', '', '30', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('461', '78', '其他信息', '模板', '', '', 'tpl', '', '0', '', 'form_textbox', '', '', '25', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('462', '78', '其他信息', '排序', '', '', 'sort', '', '0', '', 'form_numberbox', '', '', '10', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('468', '83', '基本信息', '标题', '', '', 'title', '', '3', 'title', 'form_textbox', '', '', '50', '1457524648', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('464', '82', '基本信息', '标题', '', '', 'title', '', '0', '', 'form_textbox', '', '', '35', '1457524642', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('465', '82', '基本信息', '标识', '', '', 'mark', '', '0', '', 'form_textbox', '', '', '30', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('466', '82', '基本信息', '模型', '', '', 'model', '', '0', '', 'form_combotree', '{\"model\":\"model\",\"disabled\":\"0\",\"rootitem\":\"1\",\"tree\":\"0\",\"prompt\":\"\",\"queryparams\":\"group|eq|\\u5bfc\\u822a\\u6a21\\u578b\",\"pid\":\"\",\"textfield\":\"\",\"valuefield\":\"\",\"width\":\"\"}', '', '25', '2016', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('467', '82', '基本信息', '排序', '', '', 'sort', '', '0', '', 'form_numberbox', '', '', '10', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('469', '83', '基本信息', '标识', '', '', 'mark', '', '3', 'mark', 'form_textbox', '', '', '45', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('470', '83', '基本信息', '模型', '', '', 'model', '', '3', 'model', 'form_combotree', '{\"model\":\"model\",\"disabled\":\"0\",\"rootitem\":\"1\",\"tree\":\"0\",\"prompt\":\"\",\"queryparams\":\"group|eq|\\u5bfc\\u822a\\u6a21\\u578b\",\"pid\":\"\",\"textfield\":\"\",\"valuefield\":\"\",\"width\":\"\"}', '', '30', '2016', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('471', '83', '基本信息', '排序', '', '', 'sort', '', '3', 'sort', 'form_numberbox', '', '', '10', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('472', '83', '基本信息', 'id', '', '', 'id', '', '1', 'id', 'form_hidden', '', '', '1', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('473', '80', '基本信息', '分类', '', '', 'category_id', '', '1', 'category_id', 'form_hidden', '', '', '50', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('474', '80', '基本信息', '父级', '', '', 'pid', '', '1', 'pid', 'form_combotree', '{\"model\":\"nav\",\"disabled\":\"0\",\"rootitem\":\"1\",\"tree\":\"1\",\"prompt\":\"\",\"queryparams\":\"category_id|eq|(I)category_id\",\"pid\":\"\",\"textfield\":\"\",\"valuefield\":\"\",\"width\":\"\"}', '', '45', '2016', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('475', '80', '基本信息', '标题', '', '', 'title', '', '0', '', 'form_textbox', '', '', '40', '1457524622', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('476', '80', '基本信息', '链接地址', '', '', 'url', '', '0', '', 'form_textbox', '', '', '35', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('477', '80', '基本信息', '排序', '', '', 'sort', '', '0', '', 'form_numberbox', '', '', '10', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('478', '56', '基本信息', '分类', '', '', 'category_id', '', '1', 'category_id', 'form_hidden', '', '', '2', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('479', '81', '基本信息', '父类', '', '', 'pid', '', '3', 'pid', 'form_combotree', '{\"model\":\"nav\",\"disabled\":\"0\",\"rootitem\":\"1\",\"tree\":\"1\",\"prompt\":\"\",\"queryparams\":\"category_id|eq|($)category_id\",\"pid\":\"\",\"textfield\":\"\",\"valuefield\":\"\",\"width\":\"\"}', '', '45', '2016', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('480', '81', '基本信息', '标题', '', '', 'title', '', '3', 'title', 'form_textbox', '', '', '40', '1457524630', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('481', '81', '基本信息', '链接', '', '', 'url', '', '3', 'url', 'form_textbox', '', '', '35', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('482', '81', '基本信息', '排序', '', '', 'sort', '', '3', 'sort', 'form_numberbox', '', '', '30', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('483', '81', '基本信息', 'id', '', '', 'id', '', '1', 'id', 'form_hidden', '', '', '1', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('484', '81', '基本信息', '分类', '', '', 'category_id', '', '3', 'category_id', 'form_hidden', '', '', '0', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('485', '85', '基本信息', 'id', '', '', 'id', '', '1', 'id', 'form_hidden', '', '', '0', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('486', '85', '基本信息', '名称', '', '', 'title', '', '3', 'title', 'form_textbox', '', '', '45', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('487', '85', '基本信息', '链接', '', '', 'url', '', '3', 'url', 'form_textbox', '{\"required\":\"1\",\"editable\":\"1\",\"maxlength\":\"\",\"minlength\":\"\",\"validtype\":\"url\",\"readonly\":\"0\",\"disabled\":\"0\",\"prompt\":\"\",\"width\":\"\"}', '', '40', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('488', '85', '基本信息', 'LOGO', '', '', 'logo', '', '3', 'logo', 'form_image', '', '', '35', '2016', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('489', '85', '基本信息', '简介', '', '', 'description', '', '3', 'description', 'form_multitextbox', '', '', '30', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('490', '85', '基本信息', '备注', '', '', 'info', '', '3', 'info', 'form_multitextbox', '', '', '25', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('491', '85', '基本信息', '排序', '', '', 'sort', '', '3', 'sort', 'form_textbox', '', '', '20', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('492', '84', '基本信息', '名称', '', '', 'title', '', '0', '', 'form_textbox', '', '', '45', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('493', '84', '基本信息', '网址', '', '', 'url', '', '0', '', 'form_textbox', '{\"required\":\"1\",\"editable\":\"1\",\"maxlength\":\"\",\"minlength\":\"\",\"validtype\":\"url\",\"readonly\":\"0\",\"disabled\":\"0\",\"prompt\":\"\",\"width\":\"\"}', '', '40', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('494', '84', '基本信息', 'LOGO', '', '', 'logo', '', '0', '', 'form_image', '', '', '35', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('495', '84', '基本信息', '简介', '', '', 'description', '', '0', '', 'form_multitextbox', '', '', '30', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('496', '84', '基本信息', '备注', '', '', 'info', '', '0', '', 'form_multitextbox', '', '', '25', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('497', '84', '基本信息', '排序', '', '', 'sort', '', '0', '', 'form_numberbox', '', '', '20', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('498', '85', '基本信息', '分组', '', '', 'group', '', '3', 'group', 'form_radio', '{\"disabled\":\"0\",\"values\":\"\\u9ed8\\u8ba4\\u5206\\u7ec4|\\u9ed8\\u8ba4\\u5206\\u7ec4\"}', '', '50', '2016', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('499', '84', '基本信息', '分组', '', '', 'group', '', '0', '默认分组', 'form_radio', '{\"disabled\":\"0\",\"values\":\"\\u9ed8\\u8ba4\\u5206\\u7ec4|\\u9ed8\\u8ba4\\u5206\\u7ec4\"}', '', '50', '2016', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('500', '86', '基本信息', '留言内容', '', '', 'content', '', '3', 'content', 'form_multitextbox', '{\"required\":\"1\",\"height\":\"\",\"width\":\"\",\"editable\":\"1\",\"maxlength\":\"\",\"minlength\":\"\",\"validtype\":\"\",\"prompt\":\"\",\"readonly\":\"0\",\"disabled\":\"0\"}', '', '45', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('501', '86', '基本信息', '回复内容', '', '', 'reply', '', '3', 'reply', 'form_multitextbox', '{\"required\":\"0\",\"height\":\"\",\"width\":\"\",\"editable\":\"0\",\"maxlength\":\"\",\"minlength\":\"\",\"validtype\":\"\",\"prompt\":\"\",\"readonly\":\"1\",\"disabled\":\"1\"}', '', '40', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('502', '86', '基本信息', 'id', '', '', 'id', '', '1', 'id', 'form_hidden', '', '', '0', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('503', '87', '基本信息', '留言内容', '', '', 'content', '', '3', 'content', 'form_multitextbox', '{\"required\":\"1\",\"height\":\"\",\"width\":\"\",\"editable\":\"0\",\"maxlength\":\"\",\"minlength\":\"\",\"validtype\":\"\",\"prompt\":\"\",\"readonly\":\"1\",\"disabled\":\"1\"}', '', '45', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('504', '87', '基本信息', '回复内容', '', '', 'reply', '', '3', 'reply', 'form_multitextbox', '{\"required\":\"1\",\"height\":\"\",\"width\":\"\",\"editable\":\"1\",\"maxlength\":\"\",\"minlength\":\"\",\"validtype\":\"\",\"prompt\":\"\",\"readonly\":\"0\",\"disabled\":\"0\"}', '', '40', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('505', '87', '基本信息', 'id', '', '', 'id', '', '1', 'id', 'form_hidden', '', '', '12', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('506', '88', '基本信息', '分组', '', '', 'group', '', '0', '默认分组', 'form_textbox', '{\"required\":\"1\",\"editable\":\"1\",\"maxlength\":\"\",\"minlength\":\"\",\"validtype\":\"\",\"readonly\":\"0\",\"disabled\":\"0\",\"prompt\":\"\",\"width\":\"\"}', '', '50', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('507', '88', '基本信息', '标题', '', '', 'title', '', '0', '', 'form_textbox', '{\"required\":\"1\",\"editable\":\"1\",\"maxlength\":\"20\",\"minlength\":\"1\",\"validtype\":\"\",\"readonly\":\"0\",\"disabled\":\"0\",\"prompt\":\"\",\"width\":\"\"}', '', '45', '1457524679', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('508', '88', '基本信息', '标识', '', '', 'mark', '', '0', '', 'form_textbox', '{\"required\":\"1\",\"editable\":\"1\",\"maxlength\":\"20\",\"minlength\":\"2\",\"validtype\":\"\",\"readonly\":\"0\",\"disabled\":\"0\",\"prompt\":\"\\u82f1\\u6587\\u6807\\u8bc6\",\"width\":\"\"}', '', '40', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('509', '88', '基本信息', '模型', '', '', 'model', '', '0', '', 'form_combotree', '{\"model\":\"model\",\"disabled\":\"0\",\"rootitem\":\"1\",\"tree\":\"0\",\"prompt\":\"\",\"queryparams\":\"group|eq|\\u63a8\\u8350\\u6a21\\u578b\",\"pid\":\"\",\"textfield\":\"\",\"valuefield\":\"\",\"width\":\"\"}', '', '30', '2016', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('510', '88', '基本信息', '图标', '', '', 'iconcls', '', '0', '', 'form_textbox', '', '', '25', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('511', '88', '基本信息', '排序', '', '', 'sort', '', '0', '', 'form_numberbox', '', '', '20', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('512', '89', '基本信息', 'id', '', '', 'id', '', '1', 'id', 'form_hidden', '', '', '0', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('513', '89', '基本信息', '分组', '', '', 'group', '', '3', 'group', 'form_textbox', '{\"required\":\"1\",\"editable\":\"1\",\"maxlength\":\"20\",\"minlength\":\"2\",\"validtype\":\"\",\"readonly\":\"0\",\"disabled\":\"0\",\"prompt\":\"\",\"width\":\"\"}', '', '50', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('514', '89', '基本信息', '标题', '', '', 'title', '', '3', 'title', 'form_textbox', '', '', '45', '1457524686', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('515', '89', '基本信息', '标识', '', '', 'mark', '', '3', 'mark', 'form_textbox', '{\"required\":\"1\",\"editable\":\"1\",\"maxlength\":\"10\",\"minlength\":\"2\",\"validtype\":\"\",\"readonly\":\"0\",\"disabled\":\"0\",\"prompt\":\"\\u82f1\\u6587\\u5b57\\u7b26\",\"width\":\"\"}', '', '40', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('516', '89', '基本信息', '模型', '', '', 'model', '', '3', 'model', 'form_combotree', '{\"model\":\"model\",\"disabled\":\"0\",\"rootitem\":\"1\",\"tree\":\"0\",\"prompt\":\"\",\"queryparams\":\"group|eq|\\u63a8\\u8350\\u6a21\\u578b\",\"pid\":\"\",\"textfield\":\"\",\"valuefield\":\"\",\"width\":\"\"}', '', '35', '2016', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('517', '89', '基本信息', '图标', '', '', 'iconcls', '', '3', 'iconcls', 'form_textbox', '', '', '30', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('518', '89', '基本信息', '排序', '', '', 'sort', '', '3', 'sort', 'form_numberbox', '', '', '10', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('519', '91', '基本信息', '推荐位', '', '', 'category_id', '', '3', 'category_id', 'form_hidden', '{\"url\":\"Admin\\/Recommendcate\\/index\",\"required\":\"1\",\"editable\":\"0\",\"rootitem\":\"0\",\"readonly\":\"0\",\"disabled\":\"0\",\"prompt\":\"\",\"queryparams\":\"\",\"textfield\":\"\",\"pid\":\"\",\"validtype\":\"\",\"minlength\":\"\",\"maxlength\":\"\",\"width\":\"\"}', '', '50', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('520', '91', '基本信息', 'id', '', '', 'id', '', '1', 'id', 'form_hidden', '', '', '22', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('521', '91', '基本信息', '标题', '', '', 'title', '', '3', 'title', 'form_textbox', '{\"required\":\"1\",\"editable\":\"1\",\"maxlength\":\"\",\"minlength\":\"\",\"validtype\":\"\",\"readonly\":\"0\",\"disabled\":\"0\",\"prompt\":\"\",\"width\":\"\"}', '', '45', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('522', '91', '基本信息', '图片', '', '', 'thumb', '', '3', 'thumb', 'form_image', '{\"required\":\"0\",\"disabled\":\"0\",\"readonly\":\"0\",\"extensions\":\"\",\"prompt\":\"\"}', '', '35', '1459055374', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('523', '91', '基本信息', '链接地址', '', '', 'url', '', '3', 'url', 'form_textbox', '{\"required\":\"0\",\"editable\":\"1\",\"maxlength\":\"\",\"minlength\":\"\",\"validtype\":\"\",\"readonly\":\"0\",\"disabled\":\"0\",\"prompt\":\"\",\"width\":\"\"}', '', '40', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('524', '91', '基本信息', '摘要', '', '', 'description', '', '3', 'description', 'form_multitextbox', '{\"required\":\"0\",\"height\":\"\",\"width\":\"\",\"editable\":\"1\",\"maxlength\":\"255\",\"minlength\":\"\",\"validtype\":\"\",\"prompt\":\"\",\"readonly\":\"0\",\"disabled\":\"0\"}', '', '30', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('525', '91', '基本信息', '排序', '', '', 'sort', '', '3', 'sort', 'form_numberbox', '', '', '10', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('526', '90', '基本信息', '推荐位', '', '', 'category_id', '', '1', 'category_id', 'form_hidden', '', '', '50', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('527', '90', '基本信息', '标题', '', '', 'title', '', '0', '', 'form_textbox', '', '', '45', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('528', '90', '基本信息', '链接地址', '', '', 'url', '', '0', '', 'form_textbox', '', '', '40', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('529', '90', '基本信息', '图片', '', '', 'thumb', '', '0', '', 'form_image', '', '', '35', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('530', '90', '基本信息', '摘要', '', '', 'description', '', '0', '', 'form_multitextbox', '', '', '30', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('531', '90', '基本信息', '排序', '', '', 'sort', '', '0', '', 'form_numberbox', '', '', '10', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('565', '32', '其他配置', '显示字段', '', 'config', 'textfield', '', '3', 'textfield', 'form_textbox', '', '默认为text', '9', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('566', '32', '其他配置', '值字段', '', 'config', 'valuefield', '', '3', 'valuefield', 'form_textbox', '', '默认为id', '6', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('574', '98', '基本信息', '旧密码', '', '', 'oldpassword', '', '0', '', 'form_textbox', '', '', '50', '2016', '2016', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('575', '98', '基本信息', '新密码', '', '', 'password', '', '0', '', 'form_textbox', '', '', '45', '2016', '2016', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('576', '98', '基本信息', '重复密码', '', '', 'passwordtwo', '', '0', '', 'form_textbox', '', '', '40', '2016', '2016', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('577', '52', '基本信息', '邮箱', '', '', 'email', '', '0', '', 'form_textbox', '', '', '99', '1456668417', '2016', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('578', '53', '基本信息', '邮箱', '', '', 'email', '', '3', 'email', 'form_textbox', '', '', '90', '1456668402', '2016', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('617', '76', '基本信息', '列表数据来源', '', '', 'datatype', '', '0', '1', 'form_radio', '{\"disabled\":\"0\",\"values\":\"\\u4e0d\\u8bfb\\u53d6|0\\r\\n\\u5f53\\u524d\\u680f\\u76ee|1\\r\\n\\u5b50\\u680f\\u76ee|2\\r\\n\\u6240\\u6709\\u5b50\\u7ea7\\u680f\\u76ee|3\\r\\n\\u4e0d\\u9650\\u680f\\u76ee|4\"}', '', '32', '1457272063', '1457270483', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('618', '77', '基本信息', '列表数据来源', '', '', 'datatype', '', '3', 'datatype', 'form_radio', '{\"values\":\"\\u4e0d\\u8bfb\\u53d6|0\\r\\n\\u5f53\\u524d\\u680f\\u76ee|1\\r\\n\\u5b50\\u680f\\u76ee|2\\r\\n\\u6240\\u6709\\u5b50\\u7ea7\\u680f\\u76ee|3\\r\\n\\u4e0d\\u9650\\u680f\\u76ee|4\"}', '', '32', '1457270634', '1457270608', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('619', '77', '基本信息', '列表排序', '', '', 'order', '', '3', 'order', 'form_select', '{\"values\":\"id \\u4ece\\u5927\\u5230\\u5c0f(\\u63a8\\u8350)|id desc\\r\\nid \\u4ece\\u5c0f\\u5230\\u5927|id asc\\r\\n\\u6392\\u5e8f \\u4ece\\u5927\\u5230\\u5c0f|sort desc,id desc\\r\\n\\u6392\\u5e8f \\u4ece\\u5c0f\\u5230\\u8fbe|sort asc,id desc\\r\\n\\u66f4\\u65b0\\u65f6\\u95f4 \\u4ece\\u5927\\u5230\\u5c0f|update_time desc,id desc\\r\\n\\u66f4\\u65b0\\u65f6\\u95f4 \\u4ece\\u5c0f\\u5230\\u8fbe|update_time desc,id desc\"}', '', '31', '1457272965', '1457271515', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('620', '76', '基本信息', '列表排序', '', '', 'order', '', '0', 'id desc', 'form_select', '{\"disabled\":\"0\",\"values\":\"id \\u4ece\\u5927\\u5230\\u5c0f(\\u63a8\\u8350)|id desc\\r\\nid \\u4ece\\u5c0f\\u5230\\u5927|id asc\\r\\n\\u6392\\u5e8f \\u4ece\\u5927\\u5230\\u5c0f|sort desc,id desc\\r\\n\\u6392\\u5e8f \\u4ece\\u5c0f\\u5230\\u8fbe|sort asc,id desc\\r\\n\\u66f4\\u65b0\\u65f6\\u95f4 \\u4ece\\u5927\\u5230\\u5c0f|update_time desc,id desc\\r\\n\\u66f4\\u65b0\\u65f6\\u95f4 \\u4ece\\u5c0f\\u5230\\u8fbe|update_time desc,id desc\"}', '', '31', '1457272947', '1457271659', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('621', '107', '基本信息', '是否失效', '', 'config', 'disabled', '', '3', 'disabled', 'form_bool', '', '', '99', '1457835383', '1457272451', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('622', '107', '基本信息', '可选值', '', 'config', 'values', '', '3', 'values', 'form_multitextbox', '', '', '50', '1457272486', '1457272486', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('623', '107', '基本信息', 'id', '', '', 'id', '', '3', 'id', 'form_hidden', '', '', '1', '1457272520', '1457272520', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('660', '110', '基本信息', 'id', '', '', 'id', '', '1', 'id', 'form_hidden', '', '', '1', '1459056988', '1459056988', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('661', '110', '基本信息', '邮箱', '', '', 'email', '', '3', 'email', 'form_textbox', '{\"required\":\"1\",\"readonly\":\"1\",\"disabled\":\"1\",\"maxlength\":\"\",\"minlength\":\"\",\"validtype\":\"email\",\"prompt\":\"\"}', '', '50', '1459057022', '1459057009', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('662', '110', '基本信息', '密码', '', '', 'password', '', '0', '', 'form_textbox', '{\"required\":\"1\",\"maxlength\":\"10\",\"minlength\":\"5\",\"validtype\":\"\",\"prompt\":\"\"}', '', '40', '1459057056', '1459057044', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('628', '108', '基本信息', '父级', '', '', 'pid', '', '0', '0', 'form_hidden', '', '', '90', '1457591539', '1457591539', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('629', '108', '基本信息', '标题', '', '', 'title', '', '0', '自定义配置', 'form_hidden', '', '', '80', '1457591584', '1457591584', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('630', '108', '基本信息', '表单类型', '', '', 'form', '', '0', 'form_hidden', 'form_hidden', '', '', '70', '1457591660', '1457591622', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('631', '108', '基本信息', '键', '', '', 'name', '', '0', '', 'form_textbox', '', '英文字符', '60', '1457591703', '1457591703', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('632', '108', '基本信息', '值', '', '', 'value', '', '0', '', 'form_multitextbox', '', '', '50', '1457591739', '1457591739', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('633', '108', '基本信息', '解析类型', '', '', 'render', '', '0', 'string', 'form_hidden', '', '', '60', '1457591824', '1457591824', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('634', '108', '基本信息', '备注', '', '', 'instruction', '', '0', '', 'form_multitextbox', '', '', '30', '1457591851', '1457591851', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('635', '108', '基本信息', '排序', '', '', 'sort', '', '0', '1', 'form_hidden', '', '', '20', '1457591890', '1457591890', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('636', '108', '基本信息', '分类', '', '', 'category_id', '', '0', '17', 'form_hidden', '', '', '99', '1457591914', '1457591914', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('637', '109', '基本信息', '键', '', '', 'name', '', '3', 'name', 'form_textbox', '', '', '40', '1457592182', '1457592182', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('638', '109', '基本信息', '值', '', '', 'value', '', '3', 'value', 'form_multitextbox', '', '', '30', '1457592202', '1457592202', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('639', '109', '基本信息', '备注', '', '', 'instruction', '', '3', 'instruction', 'form_multitextbox', '', '', '20', '1457592292', '1457592226', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('640', '109', '基本信息', 'id', '', '', 'id', '', '3', 'id', 'form_hidden', '', '', '10', '1457592245', '1457592245', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('643', '50', '基本信息', '简介', '', '', 'description', '', '0', '', 'form_multitextbox', '', '', '10', '1457752347', '1457752347', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('644', '51', '基本信息', '简介', '', '', 'description', '', '3', 'description', 'form_multitextbox', '', '', '20', '1457752386', '1457752386', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('651', '24', '基本配置', '是否只读', '', 'config', 'readonly', '', '3', 'readonly', 'form_bool', '', '', '42', '1457835095', '1457835095', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('652', '26', '基本配置', '是否只读', '', 'config', 'readonly', '', '3', 'readonly', 'form_bool', '', '', '37', '1457835134', '1457835134', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('653', '25', '基本配置', '是否只读', '', 'config', 'readonly', '', '3', 'readonly', 'form_bool', '', '', '42', '1457835173', '1457835173', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('654', '27', '基本配置', '是否只读', '', 'config', 'readonly', '', '3', 'readonly', 'form_bool', '', '', '42', '1457835211', '1457835211', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('655', '20', '基本配置', '是否失效', '', 'config', 'disabled', '', '3', 'disabled', 'form_bool', '', '', '50', '1457835240', '1457835240', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('656', '20', '基本配置', '是否只读', '', 'config', 'readonly', '', '3', 'readonly', 'form_bool', '', '', '40', '1457835261', '1457835261', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('657', '34', '基本配置', '是否只读', '', 'config', 'readonly', '', '3', 'readonly', 'form_bool', '', '', '25', '1457835304', '1457835304', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('658', '32', '基本配置', '是否只读', '', 'config', 'readonly', '', '3', 'readonly', 'form_bool', '', '', '42', '1457835368', '1457835368', '1', '0', '');
INSERT INTO `ebcms_formfield` VALUES ('659', '107', '基本信息', '是否只读', '', 'config', 'readonly', '', '3', 'readonly', 'form_bool', '', '', '80', '1457835411', '1457835403', '1', '0', '');

-- ----------------------------
-- Table structure for `ebcms_guestbook`
-- ----------------------------
DROP TABLE IF EXISTS `ebcms_guestbook`;
CREATE TABLE `ebcms_guestbook` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '节点ID',
  `nickname` varchar(255) NOT NULL DEFAULT '' COMMENT '昵称',
  `mobile` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '手机号码',
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT '留言内容',
  `reply` varchar(255) NOT NULL DEFAULT '' COMMENT '回复内容',
  `reply_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '回复时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `locked` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '锁定',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='留言板表';

-- ----------------------------
-- Records of ebcms_guestbook
-- ----------------------------
INSERT INTO `ebcms_guestbook` VALUES ('1', '张飞', '18585458875', '你好，感觉你们的系统不错，请问免费吗？', '你好，只需要保留我们系统的版权信息，您可以完全免费使用我们的系统。', '2016', '2016', '0', '1', '1');
INSERT INTO `ebcms_guestbook` VALUES ('2', '呵呵', '18255652652', '你们的系统开源吗？', '你好，完全开源，可用于商业用途！', '2016', '1457833789', '0', '1', '0');

-- ----------------------------
-- Table structure for `ebcms_link`
-- ----------------------------
DROP TABLE IF EXISTS `ebcms_link`;
CREATE TABLE `ebcms_link` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '节点ID',
  `group` varchar(255) NOT NULL DEFAULT '' COMMENT '分组',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '简介',
  `info` varchar(255) NOT NULL DEFAULT '' COMMENT '其他信息',
  `logo` varchar(255) NOT NULL DEFAULT '' COMMENT '图片地址',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '连接地址',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `locked` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否锁定',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='友情链接表';

-- ----------------------------
-- Records of ebcms_link
-- ----------------------------
INSERT INTO `ebcms_link` VALUES ('1', '默认分组', '易贝内容管理系统', '开源免费的内容管理系统', '联系qq1540837821', '', 'http://www.ebcms.com', '1457755049', '1457755039', '99', '1', '0');
INSERT INTO `ebcms_link` VALUES ('2', '默认分组', 'ThinkPHP', '国内著名的PHP开发框架', '', '', 'http://www.thinkphp.cn', '1457755101', '1457755101', '0', '1', '0');

-- ----------------------------
-- Table structure for `ebcms_menu`
-- ----------------------------
DROP TABLE IF EXISTS `ebcms_menu`;
CREATE TABLE `ebcms_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '菜菜单ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '类型',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '标题',
  `url` varchar(250) NOT NULL DEFAULT '' COMMENT '附加参数',
  `iconcls` varchar(40) NOT NULL DEFAULT '' COMMENT '图标',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `sort` int(4) unsigned NOT NULL DEFAULT '99' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `locked` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '锁定',
  `sys_mark` varchar(255) NOT NULL DEFAULT '' COMMENT '系统标志',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=120 DEFAULT CHARSET=utf8 COMMENT='功能菜单表';

-- ----------------------------
-- Records of ebcms_menu
-- ----------------------------
INSERT INTO `ebcms_menu` VALUES ('6', '96', 'admin', '附件管理', 'Admin/Attachment/index', 'iconfont icon-fujian', '1457527925', '2015', '19', '1', '1', '');
INSERT INTO `ebcms_menu` VALUES ('13', '96', 'admin', '模板管理', 'Admin/Template/index', 'iconfont icon-sheweimoban', '1457527938', '2015', '14', '1', '1', '');
INSERT INTO `ebcms_menu` VALUES ('72', '0', 'admin', '基本管理', '', 'icon-rainbow', '2015', '2015', '50', '1', '0', '');
INSERT INTO `ebcms_menu` VALUES ('74', '72', 'admin', '文章管理', 'Article/Article/index', 'iconfont icon-wenzhang', '1457527733', '2015', '50', '1', '0', '');
INSERT INTO `ebcms_menu` VALUES ('79', '72', 'admin', '导航管理', 'Admin/Nav/index', 'iconfont icon-caidan', '1457527841', '2015', '10', '1', '0', '');
INSERT INTO `ebcms_menu` VALUES ('80', '72', 'admin', '友情链接', 'Link/Link/index', 'iconfont icon-lianjie', '1457527798', '2015', '20', '1', '1', '');
INSERT INTO `ebcms_menu` VALUES ('81', '72', 'admin', '留言中心', 'Admin/Guestbook/index', 'iconfont icon-fangbianregistration-copy', '1457527781', '2015', '30', '1', '0', '');
INSERT INTO `ebcms_menu` VALUES ('92', '96', 'admin', '备份优化', 'Admin/Database/index', 'iconfont icon-mysqlshujuku', '1457745746', '2015', '10', '1', '1', '');
INSERT INTO `ebcms_menu` VALUES ('95', '72', 'admin', '推荐管理', 'Admin/Recommend/index', 'iconfont icon-tuijian', '1457527711', '2015', '40', '1', '0', '');
INSERT INTO `ebcms_menu` VALUES ('96', '0', 'admin', '站点设置', '', 'icon-zone', '2015', '2015', '30', '1', '0', '');
INSERT INTO `ebcms_menu` VALUES ('98', '96', 'admin', '定时任务', 'Admin/Cron/index', 'iconfont icon-dingshirenwu', '1457527912', '2015', '55', '1', '0', '');
INSERT INTO `ebcms_menu` VALUES ('100', '0', 'admin', '会员管理', '', 'icon-group', '2015', '2015', '40', '1', '0', '');
INSERT INTO `ebcms_menu` VALUES ('103', '96', 'admin', '模型管理', 'Admin/Model/index', 'iconfont icon-zuowumoxing', '1457527900', '2015', '99', '1', '0', '');
INSERT INTO `ebcms_menu` VALUES ('105', '100', 'admin', '会员管理', 'Admin/User/index', 'iconfont icon-huiyuan21', '1457527868', '2015', '90', '1', '0', '');
INSERT INTO `ebcms_menu` VALUES ('106', '100', 'admin', '角色管理', 'Admin/Group/index', 'iconfont icon-jiaoseguanli-copy', '1457527883', '2015', '85', '1', '0', '');

-- ----------------------------
-- Table structure for `ebcms_model`
-- ----------------------------
DROP TABLE IF EXISTS `ebcms_model`;
CREATE TABLE `ebcms_model` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '节点ID',
  `group` varchar(255) NOT NULL DEFAULT '' COMMENT '分组',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `instruction` varchar(255) NOT NULL DEFAULT '' COMMENT '说明',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `locked` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否锁定',
  `sys_mark` varchar(255) NOT NULL DEFAULT '' COMMENT '系统标志',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='模型表';

-- ----------------------------
-- Records of ebcms_model
-- ----------------------------
INSERT INTO `ebcms_model` VALUES ('1', '文章模型', '产品模型', '', '9', '2016', '2015', '1', '0', '');
INSERT INTO `ebcms_model` VALUES ('2', '导航模型', '顶部导航', '', '7', '2015', '2015', '1', '0', '');
INSERT INTO `ebcms_model` VALUES ('3', '推荐模型', '默认模型', '', '5', '2016', '2015', '1', '0', '');
INSERT INTO `ebcms_model` VALUES ('4', '系统模型', '地区模型', '', '3', '2016', '2016', '1', '0', '');
INSERT INTO `ebcms_model` VALUES ('5', '定时任务', 'clearoplog', '', '1', '2016', '2016', '1', '0', '');

-- ----------------------------
-- Table structure for `ebcms_modelfield`
-- ----------------------------
DROP TABLE IF EXISTS `ebcms_modelfield`;
CREATE TABLE `ebcms_modelfield` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类',
  `group` varchar(250) NOT NULL DEFAULT '' COMMENT '分组',
  `title` varchar(250) NOT NULL DEFAULT '' COMMENT '标题',
  `name` char(40) NOT NULL DEFAULT '' COMMENT '键',
  `value` text COMMENT '默认值',
  `type` varchar(255) NOT NULL DEFAULT '' COMMENT '表单类型',
  `config` text COMMENT '表单配置',
  `instruction` text COMMENT '表单说明',
  `sort` int(4) unsigned NOT NULL DEFAULT '99' COMMENT '排序',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `locked` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '锁定',
  `sys_mark` varchar(255) NOT NULL DEFAULT '' COMMENT '系统标志',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='模型字段表';

-- ----------------------------
-- Records of ebcms_modelfield
-- ----------------------------
INSERT INTO `ebcms_modelfield` VALUES ('13', '1', '产品资料', '产品图', 'pics', '', 'form_images', '', '', '0', '2016', '2016', '1', '0', '');
INSERT INTO `ebcms_modelfield` VALUES ('2', '2', '测试扩展', '小图标', 'icon', '', 'form_image', '{\"required\":\"0\",\"disabled\":\"0\",\"extensions\":\"\",\"prompt\":\"\"}', '', '2', '2016', '2015', '0', '0', '');
INSERT INTO `ebcms_modelfield` VALUES ('3', '2', '测试分组。', '大图标', 'bigicon', '', 'form_image', '{\"required\":\"0\",\"disabled\":\"0\",\"extensions\":\"\",\"prompt\":\"\"}', '', '1', '2016', '2015', '0', '0', '');
INSERT INTO `ebcms_modelfield` VALUES ('4', '3', '我去', '测试字段', 'fuck', 'fuck默认值', 'form_textbox', '', '1', '0', '2016', '2015', '1', '0', '');
INSERT INTO `ebcms_modelfield` VALUES ('5', '3', '测试字段', '123', 'asd', '阿斯顿发', 'form_textbox', '', '', '0', '2016', '2015', '1', '0', '');
INSERT INTO `ebcms_modelfield` VALUES ('6', '4', '测试分组', '国家坐标', 'fucs', '123', 'form_textbox', '', '说明', '2', '2016', '2016', '1', '0', '');
INSERT INTO `ebcms_modelfield` VALUES ('7', '4', '123', '图标', 'pic', '', 'form_image', '', '', '3', '2016', '2016', '1', '0', '');
INSERT INTO `ebcms_modelfield` VALUES ('8', '4', '阿斯蒂芬', '阿斯蒂芬', 'asd', '阿斯蒂芬萨芬', 'form_ueditor', '', '阿斯蒂芬', '0', '2016', '2016', '1', '0', '');
INSERT INTO `ebcms_modelfield` VALUES ('9', '5', '常规', '执行时间间隔', 'times', '阿斯蒂芬', 'form_image', '', '', '0', '2016', '2016', '1', '0', '');
INSERT INTO `ebcms_modelfield` VALUES ('14', '1', '基本信息', '测试字段', 'ff', '', 'form_checkbox', '{\"disabled\":\"0\",\"values\":\"\\u7ea2\\u8272|red\\r\\n\\u7eff\\u8272|green\\r\\n\\u9ed1\\u8272|black\\r\\n\\u7070\\u8272|gray\"}', '', '0', '1457573430', '1457573415', '1', '0', '');

-- ----------------------------
-- Table structure for `ebcms_nav`
-- ----------------------------
DROP TABLE IF EXISTS `ebcms_nav`;
CREATE TABLE `ebcms_nav` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '节点ID',
  `pid` int(10) unsigned NOT NULL COMMENT '父ID',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'category_id 冗余',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '连接地址',
  `ext` text COMMENT '扩展信息',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `locked` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '锁定',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='导航表';

-- ----------------------------
-- Records of ebcms_nav
-- ----------------------------
INSERT INTO `ebcms_nav` VALUES ('1', '0', '1', '首页', 'Home/Index/index', null, '1459074879', '1459074879', '9', '1', '0');
INSERT INTO `ebcms_nav` VALUES ('2', '0', '1', '公司简介', 'Home/Article/detail?id=1', null, '1459074901', '1459074901', '8', '1', '0');
INSERT INTO `ebcms_nav` VALUES ('3', '0', '1', '公司动态', 'Home/Article/category?id=2', null, '1459075292', '1459075365', '7', '1', '0');
INSERT INTO `ebcms_nav` VALUES ('4', '0', '1', '通知公告', 'Home/Article/category?id=3', null, '1459075317', '1459075369', '6', '1', '0');
INSERT INTO `ebcms_nav` VALUES ('5', '0', '1', '人才招聘', 'Home/Article/detail?id=3', null, '1459075397', '1459075413', '5', '1', '0');
INSERT INTO `ebcms_nav` VALUES ('6', '0', '1', '联系我们', 'Home/Article/detail?id=2', null, '1459075424', '1459075424', '4', '1', '0');
INSERT INTO `ebcms_nav` VALUES ('7', '0', '1', '留言', 'Home/Guestbook/index', null, '1459075478', '1459075478', '1', '1', '0');

-- ----------------------------
-- Table structure for `ebcms_navcate`
-- ----------------------------
DROP TABLE IF EXISTS `ebcms_navcate`;
CREATE TABLE `ebcms_navcate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '节点ID',
  `mark` varchar(255) NOT NULL DEFAULT '' COMMENT '标识',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `model` varchar(255) NOT NULL DEFAULT '' COMMENT '导航模型',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `locked` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否锁定',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='导航分类表';

-- ----------------------------
-- Records of ebcms_navcate
-- ----------------------------
INSERT INTO `ebcms_navcate` VALUES ('1', 'main', '主导航', '', '1459074820', '1459074820', '9', '1', '0');
INSERT INTO `ebcms_navcate` VALUES ('2', 'footer', '底部导航', '', '1459074846', '1459074837', '1', '1', '0');

-- ----------------------------
-- Table structure for `ebcms_recommend`
-- ----------------------------
DROP TABLE IF EXISTS `ebcms_recommend`;
CREATE TABLE `ebcms_recommend` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '节点ID',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '缩略图',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '简介',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `ext` text COMMENT '扩展信息',
  `module` varchar(255) NOT NULL DEFAULT '' COMMENT '模块',
  `content_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `locked` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '锁定',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='推荐内容表';

-- ----------------------------
-- Records of ebcms_recommend
-- ----------------------------
INSERT INTO `ebcms_recommend` VALUES ('1', '1', '啊手动阀手动阀s', '', 'asdfasdfasdf', '', null, '', '0', '1459075849', '1459075849', '0', '1', '0');
INSERT INTO `ebcms_recommend` VALUES ('2', '1', '基于ThinkPHP的开源内容管理系统', '', 'sadfasfd', '', null, '', '0', '1459075864', '1459075864', '0', '1', '0');
INSERT INTO `ebcms_recommend` VALUES ('3', '2', '易贝后台开发框架开源发布', '', '易贝后台开发框架是四川易贝网络公司自主开发的一套共开发者使用的后台开发框架，综合多种系统，吸纳大量前辈的开发经验，总结除了这么一套在日常系统开发中经常用到的或是必不可少的一些基础功能，我们将这些基础功能集成在一个系统中，这对于开发者来说，无意是快捷开发的一件利器。', '/1/index.php/Home/Article/detail/id/5.html', null, 'article', '5', '0', '0', '0', '1', '0');
INSERT INTO `ebcms_recommend` VALUES ('4', '2', '易贝内容管理系统正式发布！', '', '易贝企业内容管理系统是由四川易贝网络公司自主开发的一套供企业用户管理自家官网的内容管理系统，我们深刻的考虑到企业用户的需求以及人员专业能力，在综合了市面上主流的企业内容管理系统之后，我们的开发团队开发除了这样一款优秀的企业内容管理系统我们的系统在功能和操作实用以及二次开发便利性等三个方面做了更多的考虑权衡，我们的这套企业内容管理系统更适合企业网站建设！', '/1/index.php/Home/Article/detail/id/4.html', null, 'article', '4', '0', '0', '0', '1', '0');
INSERT INTO `ebcms_recommend` VALUES ('5', '2', '关于三八妇女节放假的通知', '', '经公司研究决定，三八妇女节放假1天，请各部门做好放假前相关事宜。', '/1/index.php/Home/Article/detail/id/6.html', null, 'article', '6', '0', '0', '0', '1', '0');
INSERT INTO `ebcms_recommend` VALUES ('6', '1', '人才招聘', '', 'PHP工程师 1名 1、精通php开发，熟悉常用的相关开源技术模块  2、精通MYSQL，熟悉配置、维护、性能优化；熟悉各种条件查询、复合查询等的编写能力；并有良好的数据设计能力； 3、熟悉相关Web开发技术，了解HTML、Javascript、XML、CSS、Ajax等技术； 4、有大量的跨语言/跨平台/多系统协同应等复杂系统用开发经验。前端工程师 3名 1、精通各种前端技术，包括HTML/CSS/JavaScript/Node.JS', '/1/index.php/Home/Article/detail/id/3.html', null, 'article', '3', '0', '0', '0', '1', '0');
INSERT INTO `ebcms_recommend` VALUES ('7', '1', '公司简介', '', '四川易贝网络科技有限公司成立于2015年8月，由5名刚毕业的大学生共同创立。', '/1/index.php/Home/Article/detail/id/1.html', null, 'article', '1', '0', '0', '0', '1', '0');

-- ----------------------------
-- Table structure for `ebcms_recommendcate`
-- ----------------------------
DROP TABLE IF EXISTS `ebcms_recommendcate`;
CREATE TABLE `ebcms_recommendcate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `group` varchar(255) NOT NULL DEFAULT '' COMMENT '分组',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `mark` varchar(255) NOT NULL DEFAULT '' COMMENT '标识',
  `model` varchar(255) NOT NULL DEFAULT '' COMMENT '模型',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  `iconcls` varchar(255) NOT NULL DEFAULT '' COMMENT '小图标',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `locked` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否锁定',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='推荐位表';

-- ----------------------------
-- Records of ebcms_recommendcate
-- ----------------------------
INSERT INTO `ebcms_recommendcate` VALUES ('1', '默认分组', '大轮播图', 'slide', '', '1459075773', '1459075773', '', '9', '1', '0');
INSERT INTO `ebcms_recommendcate` VALUES ('2', '默认分组', '首页推荐文章', 'index_recommend', '', '1459075929', '1459075929', '', '8', '1', '0');

-- ----------------------------
-- Table structure for `ebcms_tag`
-- ----------------------------
DROP TABLE IF EXISTS `ebcms_tag`;
CREATE TABLE `ebcms_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '节点ID',
  `tag` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `locked` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '锁定',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='TAG表';

-- ----------------------------
-- Records of ebcms_tag
-- ----------------------------
INSERT INTO `ebcms_tag` VALUES ('1', '易贝网络科技', '1459074966', '1459074966', '0', '1', '0');
INSERT INTO `ebcms_tag` VALUES ('2', '易贝cms', '1459074966', '1459074966', '0', '1', '0');
INSERT INTO `ebcms_tag` VALUES ('3', '易贝网络公司地址', '1459075008', '1459075008', '0', '1', '0');
INSERT INTO `ebcms_tag` VALUES ('4', '招聘', '1459075056', '1459075056', '0', '1', '0');
INSERT INTO `ebcms_tag` VALUES ('5', 'php工程师', '1459075056', '1459075056', '0', '1', '0');
INSERT INTO `ebcms_tag` VALUES ('6', '前端工程师', '1459075056', '1459075056', '0', '1', '0');
INSERT INTO `ebcms_tag` VALUES ('7', 'ebcms发布', '1459075182', '1459075182', '0', '1', '0');
INSERT INTO `ebcms_tag` VALUES ('8', 'ebcms', '1459075182', '1459075182', '0', '1', '0');
INSERT INTO `ebcms_tag` VALUES ('9', '易贝内容管理系统', '1459075182', '1459075182', '0', '1', '0');
INSERT INTO `ebcms_tag` VALUES ('10', '易贝后台框架', '1459075218', '1459075218', '0', '1', '0');
INSERT INTO `ebcms_tag` VALUES ('11', '易贝后台开发框架', '1459075218', '1459075218', '0', '1', '0');
INSERT INTO `ebcms_tag` VALUES ('12', '放假', '1459075264', '1459075264', '0', '1', '0');
INSERT INTO `ebcms_tag` VALUES ('13', '妇女节', '1459075264', '1459075264', '0', '1', '0');

-- ----------------------------
-- Table structure for `ebcms_tags`
-- ----------------------------
DROP TABLE IF EXISTS `ebcms_tags`;
CREATE TABLE `ebcms_tags` (
  `c_id` int(10) unsigned NOT NULL COMMENT '内容ID',
  `tag_id` int(10) unsigned NOT NULL COMMENT '标签ID',
  `type` enum('forum','article') NOT NULL DEFAULT 'article' COMMENT '类型'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='TAG关联表';

-- ----------------------------
-- Records of ebcms_tags
-- ----------------------------
INSERT INTO `ebcms_tags` VALUES ('1', '2', 'article');
INSERT INTO `ebcms_tags` VALUES ('1', '1', 'article');
INSERT INTO `ebcms_tags` VALUES ('2', '3', 'article');
INSERT INTO `ebcms_tags` VALUES ('3', '4', 'article');
INSERT INTO `ebcms_tags` VALUES ('3', '5', 'article');
INSERT INTO `ebcms_tags` VALUES ('3', '6', 'article');
INSERT INTO `ebcms_tags` VALUES ('4', '7', 'article');
INSERT INTO `ebcms_tags` VALUES ('4', '8', 'article');
INSERT INTO `ebcms_tags` VALUES ('4', '9', 'article');
INSERT INTO `ebcms_tags` VALUES ('5', '10', 'article');
INSERT INTO `ebcms_tags` VALUES ('5', '11', 'article');
INSERT INTO `ebcms_tags` VALUES ('6', '12', 'article');
INSERT INTO `ebcms_tags` VALUES ('6', '13', 'article');

-- ----------------------------
-- Table structure for `ebcms_user`
-- ----------------------------
DROP TABLE IF EXISTS `ebcms_user`;
CREATE TABLE `ebcms_user` (
  `id` int(3) unsigned NOT NULL AUTO_INCREMENT COMMENT '后台人员ID',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT 'QQ号码',
  `nickname` char(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '头像',
  `motto` varchar(255) NOT NULL DEFAULT '' COMMENT '座右铭',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `login_times` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '登陆次数',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登陆ip地址',
  `jifen` int(11) NOT NULL DEFAULT '0' COMMENT '积分',
  `jinbi` int(11) NOT NULL DEFAULT '0' COMMENT '金币',
  `login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登陆时间',
  `safe_code` varchar(255) NOT NULL DEFAULT '' COMMENT '安全码',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `sort` int(4) unsigned NOT NULL DEFAULT '99' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `locked` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '锁定',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='后台账户表';

-- ----------------------------
-- Records of ebcms_user
-- ----------------------------
INSERT INTO `ebcms_user` VALUES ('1', '1540837821@qq.com', '15408378', '', '', 'f9c202f6438dbcb14e71451046b1e4de', '24', '0', '6', '3', '1459074658', '', '1457745916', '1457695413', '99', '1', '1');
INSERT INTO `ebcms_user` VALUES ('8', '381429578@qq.com', 'e8cc3079', '', '', 'c0e1b57bbe412a95be17bdf2a02fe16b', '0', '', '0', '0', '0', '', '1457749674', '1457749674', '99', '1', '1');
INSERT INTO `ebcms_user` VALUES ('9', 'kujiw@qq.com', 'ff3a65f6', '', '', 'c0e1b57bbe412a95be17bdf2a02fe16b', '1', '0', '0', '0', '1457753135', '', '1457749924', '1457749924', '99', '1', '1');
