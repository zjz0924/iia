/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50045
Source Host           : localhost:3306
Source Database       : iia

Target Server Type    : MYSQL
Target Server Version : 50045
File Encoding         : 65001

Date: 2017-07-14 01:31:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `account`
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` bigint(20) unsigned NOT NULL auto_increment,
  `username` varchar(32) default NULL COMMENT '用户名',
  `nickname` varchar(32) default NULL COMMENT '昵称',
  `password` varchar(50) default NULL COMMENT '密码',
  `mobile` varchar(16) default NULL COMMENT '手机',
  `create_time` timestamp NOT NULL default '0000-00-00 00:00:00' COMMENT '创建时间',
  `lock` enum('N','Y') default 'N' COMMENT '状态',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UNQ_name` USING BTREE (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('1', 'admin', 'admin', 'E10ADC3949BA59ABBE56E057F20F883E', '13750017489', '2016-12-18 23:06:04', 'N');
INSERT INTO `account` VALUES ('2', 'jack', 'z_0924', 'E10ADC3949BA59ABBE56E057F20F883E', '13318668638', '2016-12-27 21:52:05', 'N');
INSERT INTO `account` VALUES ('5', 'tom', 'tom', 'E10ADC3949BA59ABBE56E057F20F883E', '13750017489', '2017-05-23 22:35:18', 'N');
INSERT INTO `account` VALUES ('6', 'johnson', 'johnson', 'E10ADC3949BA59ABBE56E057F20F883E', '13750017489', '2017-06-21 23:30:14', 'N');
INSERT INTO `account` VALUES ('7', 'bill', 'bill', 'E10ADC3949BA59ABBE56E057F20F883E', '13318668638', '2017-06-21 23:30:12', 'N');
INSERT INTO `account` VALUES ('8', 'lily', 'lily', 'E10ADC3949BA59ABBE56E057F20F883E', '13750017489', '2017-06-21 23:30:34', 'N');
INSERT INTO `account` VALUES ('9', 'ava', 'ava', 'E10ADC3949BA59ABBE56E057F20F883E', '13750017489', '2017-06-21 23:30:54', 'N');
INSERT INTO `account` VALUES ('10', 'Niki', 'Niki', 'E10ADC3949BA59ABBE56E057F20F883E', '', '2017-06-21 23:32:36', 'N');
INSERT INTO `account` VALUES ('11', 'Linda', 'Linda', 'EAF450085C15C3B880C66D0B78F2C041', '', '2017-06-21 23:32:49', 'N');
INSERT INTO `account` VALUES ('12', 'Fred', 'Fred', 'E10ADC3949BA59ABBE56E057F20F883E', '', '2017-06-21 23:33:04', 'N');
INSERT INTO `account` VALUES ('13', 'William', 'William', 'E10ADC3949BA59ABBE56E057F20F883E', '', '2017-06-21 23:33:15', 'N');

-- ----------------------------
-- Table structure for `activity`
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity` (
  `id` bigint(20) NOT NULL auto_increment,
  `title` varchar(250) NOT NULL,
  `content` longtext,
  `create_time` timestamp NULL default NULL,
  `creator` bigint(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity
-- ----------------------------
INSERT INTO `activity` VALUES ('4', '深圳市宝安区互联网行业协会第一届第三次会员大会圆满成功', '<p><strong>深圳市宝安区互联网行业协会第一届第三次会员大会</strong></p>\n\n<p>深圳市宝安区互联网行业协会第一届第三次会员代表大会于2014年11月26日下午13：30分在深圳市前岸国际酒店4楼国际宴会厅召开，符合《章程》要求。会议由黄贵贤秘书长主持，宝安区经济促进局-陈逸群、宝安区科技创新局-张岱、深圳市东方富海投资管理有限公司-梅健到会并作了讲话，永年金融集团董事助理-艾向磊、创东方投资集团投资总监-張宸也参加了会议。</p>\n\n<p><img alt=\"\" src=\"http://localhost:8081/editor/activity/image/1499877003011.png\" style=\"height:685px; width:451px\" /></p>', '2017-07-13 00:30:09', '1');

-- ----------------------------
-- Table structure for `contact`
-- ----------------------------
DROP TABLE IF EXISTS `contact`;
CREATE TABLE `contact` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) default NULL,
  `address` varchar(250) default NULL,
  `url` varchar(200) default NULL,
  `phone` varchar(50) default NULL,
  `fax` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of contact
-- ----------------------------
INSERT INTO `contact` VALUES ('1', '深圳市宝安区互联网协会', '深圳市宝安区西乡宝源路宝安互联网产业基地A区5栋1楼', 'http://www.iiachina.org', '0755-29128006', '0755-29539332');

-- ----------------------------
-- Table structure for `group`
-- ----------------------------
DROP TABLE IF EXISTS `group`;
CREATE TABLE `group` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `create_time` timestamp NULL default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of group
-- ----------------------------
INSERT INTO `group` VALUES ('1', '待审会员', '2017-07-13 23:37:01');
INSERT INTO `group` VALUES ('2', '会长单位', '2017-07-13 23:38:50');
INSERT INTO `group` VALUES ('5', '副会长单位', '2017-07-14 00:54:10');

-- ----------------------------
-- Table structure for `introduction`
-- ----------------------------
DROP TABLE IF EXISTS `introduction`;
CREATE TABLE `introduction` (
  `id` int(11) NOT NULL auto_increment,
  `content` longtext,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of introduction
-- ----------------------------
INSERT INTO `introduction` VALUES ('1', '<h1 style=\"text-align:center\"><span style=\"color:#B22222\">深圳市宝安区互联网行业协会</span></h1>\n\n<h1 style=\"text-align:center\"><strong>ShenZhen&nbsp;Baoan&nbsp;District&nbsp;Internet&nbsp;Industry&nbsp;Association</strong></h1>\n\n<p>&nbsp;</p>\n\n<p>&nbsp; &nbsp; &nbsp;深圳市宝安区互联网行业协会成立于&nbsp;2012年6月5日，是面向深圳宝安地区从事互联网行业领域有关业务的单位自愿参加的非营利性社会组织。目的在于更好地团结互联网企业、互联网从业人员以及投资商，形成互联网企业联盟共赢，资源互补，共同营造一个良好互联网创新的发展环境，推动互联网产业积极快速发展。本协会接受业务主管单位深圳市宝安区经济促进局的业务指导和监督管理，接受社团登记管理机关深圳市宝安区民政局的监督管理。协会的宗旨；遵守宪法、法律、法规和国家政策；遵守社会道德风尚；在邓小平理论和&ldquo;三个代表&rdquo;重要思想指导下，为政府服务，为会员服务，为社会服务；按照&ldquo;公正、团结、服务&rdquo;的原则开展工作，在政府和从事互联网的企、事业单位之间、企业与企业之间发挥纽带和桥梁作用，以市场化的运作手段推动并引领宝安、深圳乃至全国互联网行业的发展。发挥互联网产业对社会、经济、文化发展和社会主义精神文明建设的积极推动作用。</p>\n\n<p>深圳市互联网行业及其配套企业近2600多家，产值70亿元，从业人员15万。深圳已成为世界互联网产业发展最快的地区，同时依靠其雄厚的互联网技术人才，也是创新产品和高新技术的研发基地。</p>\n\n<p>深圳市宝安区互联网行业协会团结深圳市宝安区范围内从事互联网事业及互联网相关产业的企事业单位、个人，以及关心和致力于推动深圳市互联网产业发展的企事业单位，秉承协会&ldquo;团结、服务、技术、融合&rdquo;宗旨，致力于推进深圳互联网事业的健康发展，在政府、企业、社会之间搭建沟通与协调平台并提供良好服务。</p>\n\n<p>地&nbsp; 址：深圳市宝安区西乡源路宝安互联网产业基地A区5栋一楼</p>\n\n<p>联系人：徐小姐 &nbsp;13425134821</p>\n\n<p>电&nbsp;&nbsp;话：0755-29128006</p>\n\n<p>传&nbsp;&nbsp;真：0755-29539332</p>\n\n<p>&nbsp;</p>\n');
INSERT INTO `introduction` VALUES ('2', '<h1 style=\"text-align:center\"><strong>深圳市宝安区互联网行业协会组织结构图</strong></h1>\n\n<p>&nbsp;</p>\n\n<p><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<img alt=\"\" src=\"http://localhost:8081/editor/introduction/architecture/image/1499347856642.png\" style=\"height:479px; width:735px\" /></strong></p>\n');
INSERT INTO `introduction` VALUES ('3', '<h2 style=\"text-align: center;\">&nbsp;<strong>深圳市宝安区互联网行业协会章程</strong></h2>\n\n<p>&nbsp;</p>\n\n<p>第一章&nbsp;&nbsp;&nbsp;总&nbsp;&nbsp;则</p>\n\n<p>&nbsp;</p>\n\n<p>第一条&nbsp;&nbsp;本协会的名称为深圳市宝安区互联网行业协会（英文名称：ShenZhen Baoan District Internet Industry Association英文缩写IIA）。</p>\n\n<p>第二条&nbsp;&nbsp;本协会性质；本协会依照中华人民共和国法律成立，面向深圳宝安地区从事互联网行业领域有关业务的单位自愿参加的非营利性社会组织。</p>\n\n<p>第三条&nbsp;&nbsp;本协会的宗旨；遵守宪法、法律、法规和国家政策；遵守社会道德风尚；在邓小平理论和&ldquo;三个代表&rdquo;重要思想指导下，为政府服务，为会员服务，为社会服务；按照&ldquo;公正、团结、服务&rdquo;的原则开展工作，在政府和从事互联网的企、事业单位之间、企业与企业之间发挥纽带和桥梁作用，以市场化的运作手段推动并引领宝安、深圳乃至全国互联网行业的发展。</p>\n\n<p>第四条&nbsp;&nbsp;本协会接受业务主管单位深圳市宝安区经济促进局的业务指导和监督管理，接受社团登记管理机关深圳市宝安区民政局的监督管理。</p>\n\n<p>第五条&nbsp;&nbsp;深圳市宝安区互联网行业协会设在深圳市宝安区西乡街道兴业路60-1区浪漫港湾18栋A座一楼招商中心。</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p><strong>业务范围</strong></p>\n\n<p>&nbsp;</p>\n\n<p>第六条&nbsp;&nbsp;本协会坚持实事求是、注重实效和民主协商的原则开展以下业务：</p>\n\n<p>（一）宣传贯彻国家有关的方针、政策、法规、条例；向政府有关部门提出有关互联网行业发展的政策意见和建议；协助政府制（修）定有关互联网行业的发展政策、地方法规及地方行业标准，并推动其贯彻执行；</p>\n\n<p>（二）了解企业互联网行业开展的情况，及时向政府有关部门反映会员要求，维护会员合法权益，反对不正当竞争，反对侵害他人知识产权，促进&quot;行规行约&quot;的建立和完善；</p>\n\n<p>（三）向政府有关部门及会员提供互联网行业发展情况，市场发展趋势，经济预测等信息，帮助会员解决开展互联网行业过程中的困难和问题，做好信息咨询服务和政策、技术、产业、市场导向工作；&nbsp;</p>\n\n<p>（四）广泛开展互联网行业学术交流；积极开展互联网行业知识的普及教育和技能讲座；总结互联网行业发展过程中的经验和教训，介绍先进典型；&nbsp;</p>\n\n<p>（五）加强国际合作与交流，组织深圳市宝安区内外互联网新产品、新技术展览、展销，为企业开拓国内外市场服务；&nbsp;</p>\n\n<p>（六）建立深圳市宝安区互联网示范基地，积极推广互联网认证讲座、协助政府有关部门做好互联网行业工程质量监督工作，研究推广适合中国国情的互联网行业新技术；&nbsp;&nbsp;（七）协助企事业提高产品、服务质量，积极参加有关互联网产品、认证及质量监督活动，全心全意为广大会员服务；</p>\n\n<p>（八）开发信息资源，编辑出版互联网行业培训教程及书刊、声像资料；&nbsp;</p>\n\n<p>（九）完成政府部门、企事业单位委托协会办理的其他事项。&nbsp;</p>\n\n<p>（十）为协会会员提供服务。</p>\n\n<p>&nbsp;</p>\n\n<p><strong>会员</strong></p>\n\n<p>&nbsp;</p>\n\n<p>第七条&nbsp;&nbsp;本协会的会员为本行业的经济组织。</p>\n\n<p>第八条&nbsp;&nbsp;申请加入本协会的会员，必须具备下列条件：&nbsp;<br />\n（一）拥护本协会的章程；&nbsp;</p>\n\n<p>（二）有加入本协会的意愿；&nbsp;</p>\n\n<p>（三）在本协会的业务领域内具有一定的影响；&nbsp;</p>\n\n<p>（四）应持有工商营业执照或其它相关合法证件。</p>\n\n<p>第九条&nbsp;&nbsp;会员入会的程序是：</p>\n\n<p>（一）提交入会申请书；</p>\n\n<p>（二）经理事会讨论通过；</p>\n\n<p>（三）由深圳市宝安区互联网行业协会秘书处办理具体入会手续；</p>\n\n<p>（四）由理事会或理事会授权的机构发给会员证。&nbsp;</p>\n\n<p>第十条&nbsp;&nbsp;会员享有下列权利：</p>\n\n<p>（一）本协会的选举权、被选举权和表决权；</p>\n\n<p>（二）参加协会活动；</p>\n\n<p>（三）获得本协会服务的优先权；</p>\n\n<p>（四）对本协会工作的提议案权、建议权和监督权；&nbsp;</p>\n\n<p>（五）介绍和推荐新会员；</p>\n\n<p>（六）入会自愿、退会自由。</p>\n\n<p>第十一条&nbsp;&nbsp;会员履行下列义务：　</p>\n\n<p>（一）遵守本协会章程；&nbsp;</p>\n\n<p>（二）执行本协会的决议；&nbsp;</p>\n\n<p>（三）按规定交纳会费；&nbsp;</p>\n\n<p>（四）维护本协会及本行业的合法权益；&nbsp;</p>\n\n<p>（五）完成本协会交办的工作；&nbsp;</p>\n\n<p>（六）向本协会反映情况，提供有关资料；&nbsp;</p>\n\n<p>（七）会员缴纳会费的标准：</p>\n\n<p>会长单位每年缴纳会费25000元；</p>\n\n<p>副会长单位每年缴纳会费20000元；</p>\n\n<p>常务理事单位每年缴纳会费5000元；</p>\n\n<p>理事单位每年缴纳会费3000元；</p>\n\n<p>一般会员单位每年缴纳会费2000元；</p>\n\n<p>第十二条&nbsp;&nbsp;会员退会应书面通知本协会，并交回会员证。会员一年不交纳会费或不参加本协会活动的，视为自动退会。</p>\n\n<p>第十三条&nbsp;&nbsp;会员如有严重违反本章程的行为，经理事会或常务理事会表决通过，予以除名。组织机构和负责人产生、罢免 。</p>\n\n<p>第十四条&nbsp;&nbsp;本协会的最高权力机构是会员代表大会，会员代表大会的职权是：&nbsp;</p>\n\n<p>（一）制定和修改章程；&nbsp;</p>\n\n<p>（二）选举和罢免理事；&nbsp;</p>\n\n<p>（三）审议理事会的工作报告和财务报告；&nbsp;</p>\n\n<p>（四）决定终止事宜；&nbsp;</p>\n\n<p>（五）决定其他重大事宜。&nbsp;</p>\n\n<p>第十五条&nbsp;&nbsp;会员大会须有2/3以上的会员出席方能召开，其决议须经到会会员半数以上表决通过方能生效。&nbsp;</p>\n\n<p>第十六条&nbsp;&nbsp;会员大会每届4年（会员大会每届最长不超过5年）。因特殊情况需提前或延期换届的，须由理事会表决通过，报业务主管单位审查并经社团登记管理机关批准同意。但延期换届最长不超过1年。&nbsp;</p>\n\n<p>第十七条&nbsp;&nbsp;理事会是会员代表大会的执行机构，在闭会期间领导本协会开展日常工作，对会员代表大会负责。&nbsp;</p>\n\n<p>第十八条&nbsp;&nbsp;理事会的职权是：&nbsp;</p>\n\n<p>（一）执行会员代表大会的决议；&nbsp;</p>\n\n<p>（二）选举和罢免会长、执行会长、副会长、秘书长；&nbsp;</p>\n\n<p>（三）筹备召开会员代表大会；&nbsp;</p>\n\n<p>（四）向会员代表大会报告工作和财务状况；&nbsp;</p>\n\n<p>（五）决定会员的处分和除名；&nbsp;</p>\n\n<p>（六）决定设立办事机构、分支机构、代表机构和实体机构；&nbsp;</p>\n\n<p>（七）决定秘书长、各机构主要负责人的聘任；&nbsp;</p>\n\n<p>（八）领导本协会各机构开展工作；&nbsp;</p>\n\n<p>（九）制定内部管理制度；&nbsp;</p>\n\n<p>（十）决定其他重大事项。&nbsp;</p>\n\n<p>第十九条&nbsp;&nbsp;理事会须有2/3以上理事出席方能召开，其决议须经到会理事2/3以上表决通过方能生效。&nbsp;</p>\n\n<p>第二十条&nbsp;&nbsp;理事会每年至少召开一次会议；情况特殊的，也可采取通讯形式召开。&nbsp;</p>\n\n<p>第二十一条&nbsp;&nbsp;本协会设立常务理事会（理事人数较多时，可设立常务理事会）。常务理事会由理事会选举产生，在理事会闭会期间行使第十八条第一、三、五、六、七、八、九项的职权，对理事会负责（常务理事人数不超过理事人数的1/3）。&nbsp;</p>\n\n<p>第二十二条&nbsp;&nbsp;常务理事会须有2/3以上常务理事出席方能召开，其决议须经到会常务理事2/3以上表决通过方能生效。&nbsp;</p>\n\n<p>第二十三条&nbsp;&nbsp;常务理事会至少半年召开一次会议；情况特殊的也可采用通讯形式召开。&nbsp;</p>\n\n<p>第二十四条&nbsp;&nbsp;本会设立分支机构、代表机构的规则、程序：</p>\n\n<p>（一）由本行业协会秘书处提出设立分支机构的具体方案；</p>\n\n<p>（二）将具体方案提交会长办公会议讨论通过；</p>\n\n<p>（三）将通过后的具体方案提交理事会审议批准。</p>\n\n<p>（四）报社会团体登记管理机关审批。</p>\n\n<p>第二十五条&nbsp;&nbsp;本会设立监事，由会员代表大会选举产生。监事会任期与理事会任期相同，期满可以连任。会长、执行会长、副会长、理事、秘书长不得兼任监事。</p>\n\n<p>第二十六条&nbsp;&nbsp;本协会的会长、执行会长、副会长、秘书长必须具备下列条件：&nbsp;</p>\n\n<p>（一）坚持党的路线、方针、政策，政治素质好；&nbsp;</p>\n\n<p>（二）在本协会业务领域内有较大影响；&nbsp;</p>\n\n<p>（三）会长、执行会长、副会长、秘书长最高任职年龄不超过70周岁，秘书长为专职；&nbsp;</p>\n\n<p>（四）身体健康，能坚持正常工作；&nbsp;</p>\n\n<p>（五）未受过剥夺政治权利的刑事处罚的；&nbsp;</p>\n\n<p>（六）具有完全民事行为能力。&nbsp;</p>\n\n<p>第二十七条&nbsp;&nbsp;本协会的秘书长、会长不能在同一企业中产生；会长不得兼任秘书长；会长、执行会长、副会长、秘书长如超过最高任职年龄的，须经理事会表决通过，报业务主管单位审查并经社团登记管理机关批准同意后，方可任职。&nbsp;</p>\n\n<p>第二十八条&nbsp;&nbsp;本协会会长、执行会长、副会长、秘书长任期4年[会长、执行会长、副会长、秘书长任期最长不超过两届]因特殊情况需延长任期的，须经会员代表大会2/3以上会员代表表决通过，报业务主管单位审查并经社团登记管理机关批准同意后方可任职。</p>\n\n<p>第二十九条&nbsp;&nbsp;本协会会长一人，执行会长一人，副会长若干人。会长为本协会法定代表人[社团法定代表人一般应由会长担任。如因特殊情况须由执行会长、副会长或秘书长担任法定代表人，应报业务主管单位审查并经社团登记管理机关批准同意后，方可担任，并在章程中写明]。&nbsp;</p>\n\n<p>本协会法定代表人不兼任其他协会的法定代表人。</p>\n\n<p>第三十条&nbsp;&nbsp;本协会会长行使下列职权：&nbsp;</p>\n\n<p>（一）召集和主持理事会；&nbsp;</p>\n\n<p>（二）检查会员代表大会、理事会决议的落实情况；&nbsp;</p>\n\n<p>（三）代表本协会签署有关重要文件。</p>\n\n<p>第三十一条&nbsp;&nbsp;本协会执行会长行使下列职权：</p>\n\n<p>（一）领导协会工作，负责协会发展谋划和协会自身建设，提出指导意见；</p>\n\n<p>（二）负责衔接政府领导工作，贯彻政府领导指示；</p>\n\n<p>（三）召集和主持会长办公会、会长扩大会和会员大会；</p>\n\n<p>（四）检查、督促、指导会员单位对会员大会、会长扩大会和会长办公会决议的落实、执行；</p>\n\n<p>（五）代表协会签署有关文件、协议、合同等；</p>\n\n<p>（六）带领协会班子成员执行协会活动计划;</p>\n\n<p>（七）安排或组织所属单位和会员企业开展科技、文艺、体育等活动;</p>\n\n<p>（八）主持制定、完善财务管理制度并监督执行;</p>\n\n<p>（九）组织相关工作考核，并进行奖励和表彰活动。&nbsp;</p>\n\n<p>第三十二条&nbsp;&nbsp;本团秘书长行事下列职权：&nbsp;</p>\n\n<p>（一）主持办事机构开展日常工作，组织实施年度工作计划；&nbsp;</p>\n\n<p>（二）协调各分支机构、代表机构、实体机构开展工作；&nbsp;</p>\n\n<p>（三）提名副秘书长以及各办事机构、分支机构、代表机构和实体机构主要负责人，交理事会或常务理事会决定；&nbsp;</p>\n\n<p>（四）决定办事机构、代表机构、实体机构专职工作人员的聘用。&nbsp;</p>\n\n<p>（五）处理其他日常事务。</p>\n\n<p>第三十三条&nbsp;&nbsp;监事会行使下列职权：</p>\n\n<p>（一）向会员代表大会报告年度工作。</p>\n\n<p>（二）监督会员代表大会和理事会的选举、罢免；监督理事会履行会员代表大会的决议。</p>\n\n<p>（三）检查协会财务和会计资料，向登记管理机关以及税务、会计主管部门反映情况。</p>\n\n<p>（四）监事列席理事会会议，有权向理事会提出质询和建议。</p>\n\n<p>（五）监督理事会遵守法律和章程的情况。当会长、执行会长、副会长、理事和秘书长等管理人员的行为损害协会利益时，要求其予以纠正，必要时向会员代表大会或政府相关部门报告。</p>\n\n<p>监事应当遵守有关法律法规和协会章程，接受会员代表大会领导，切实履行职责。</p>\n\n<p>&nbsp;</p>\n\n<p>第五章&nbsp;&nbsp;资产管理、使用原则&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p>第三十四条&nbsp;&nbsp;本协会经费来源：&nbsp;</p>\n\n<p>（一）会费；&nbsp;</p>\n\n<p>（二）捐赠；&nbsp;</p>\n\n<p>（三）政府资助；&nbsp;</p>\n\n<p>（四）在核准的业务范围内开展活动或服务的收入；&nbsp;</p>\n\n<p>（五）利息；&nbsp;</p>\n\n<p>（六）其他合法收入。&nbsp;</p>\n\n<p>第三十五条&nbsp;&nbsp;本协会按照国家有关规定收取会员会费。&nbsp;</p>\n\n<p>第三十六条&nbsp;&nbsp;本协会经费必须用于本章程规定的业务范围和事业的发展，不得在会员中分配。&nbsp;</p>\n\n<p>第三十七条&nbsp;&nbsp;本协会建立严格的财务管理制度，保证会计资料合法、真实、准确、完整。&nbsp;</p>\n\n<p>第三十八条&nbsp;&nbsp;本协会配备具有专业资格的会计人员。会计不得兼任出纳。会计人员必须进行会计核算，实行会计监督。会计人员调动工作或离职时，必须与接管人员办清交接手续。&nbsp;</p>\n\n<p>第三十九条&nbsp;&nbsp;本协会的资产管理必须执行国家规定的财务管理制度，接受会员代表大会和财政部门的监督。资产来源属于国家拨款或者社会捐赠、资助的，必须接受审计机关的监督，并将有关情况以适当方式向社会公布。&nbsp;</p>\n\n<p>第四十条&nbsp;&nbsp;本协会换届或更换法定代表人之前必须接受社团登记管理机关和业务主管单位组织的财务审计。&nbsp;</p>\n\n<p>第四十一条&nbsp;&nbsp;本协会的资产，任何单位、个人不得侵占、私分和挪用。&nbsp;</p>\n\n<p>第四十二条&nbsp;&nbsp;本协会专职工作人员的工资和保险、福利待遇，参照国家对事业单位的有关规定执行。&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p>第四十三条&nbsp;&nbsp;对本协会章程的修改，须经理事会表决后报会员代表大会审议。&nbsp;</p>\n\n<p>第四十四条&nbsp;&nbsp;本协会修改的章程，须在会员代表大会通过后15日内，经业务主管单位审查同意，并报社团登记管理机关核准后生效。&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p><strong>终止程序及终止后的财产处理&nbsp;</strong></p>\n\n<p>&nbsp;</p>\n\n<p>第四十五条&nbsp;&nbsp;本协会完成宗旨或自行解散或由于分立、合并等原因需要注销的，由理事会或常务理事会提出终止动议。&nbsp;</p>\n\n<p>第四十六条&nbsp;&nbsp;本协会终止动议须经会员代表大会表决通过，并报业务主管（指导）单位审查同意。&nbsp;</p>\n\n<p>第四十七条&nbsp;&nbsp;本协会终止前，须在主管单位及有关机关指导下成立清算组织，清理债权债务，处理善后事宜。清算期间，不开展清算以外的活动。&nbsp;</p>\n\n<p>第四十八条&nbsp;&nbsp;本协会经社团登记管理机关办理注销登记手续后即为终止。&nbsp;</p>\n\n<p>第四十九条&nbsp;&nbsp;本协会终止后的剩余财产，在主管单位和社团登记管理机关的监督下，按照国家有关规定，用于发展与本协会宗旨相关的事业。&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p>第八章&nbsp;&nbsp;&nbsp;附则&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p>第五十条&nbsp;&nbsp;本章程经__2012___年___04__月__11___日会员代表大会表决通过。&nbsp;</p>\n\n<p>第五十一条&nbsp;&nbsp;本章程的解释权属本会的理事会。&nbsp;</p>\n\n<p>第五十二条&nbsp;&nbsp;本章程自社团登记管理机关核准之日起生效。&nbsp;</p>\n');
INSERT INTO `introduction` VALUES ('4', '<p>举办微信营销策略讲座。针对宝安产业升级转型，很多生产厂家都积极开拓网上销售渠道，向价值曲线的高端转移和探索，实现线上线下的结合，利用微信这一免费资源实现企业效益的高速增长。</p>\n\n<p><img alt=\"\" src=\"http://localhost:8081/editor/soundPic/image/1499353202549.png\" style=\"height:523px; width:788px\" /></p>\n');

-- ----------------------------
-- Table structure for `law`
-- ----------------------------
DROP TABLE IF EXISTS `law`;
CREATE TABLE `law` (
  `id` bigint(20) NOT NULL auto_increment,
  `title` varchar(250) NOT NULL,
  `content` longtext,
  `create_time` timestamp NULL default NULL,
  `creator` bigint(20) default NULL,
  `type` int(11) default NULL COMMENT '1.政策管理  2. 法律法规',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of law
-- ----------------------------
INSERT INTO `law` VALUES ('1', '关于参加第五届中国电子信息博览会的通知', '<p>各有关单位：</p>\n\n<p>&nbsp;&nbsp;&nbsp; 为了充分展示新一代信息技术产业最新发展成就、促进产业核心技术突破、引领信息技术产业的供给侧改革，工业和信息化部和深圳市人民政府定于2017年4月9日至11日在深圳市共同举办第五届中国电子信息博览会（以下简称&ldquo;博览会&rdquo;）。为做好博览会筹备和举办工作，现将有关事项通知如下：</p>\n\n<p><strong>一、博览会基本情况</strong></p>\n\n<p>（一）名称：&ldquo;第五届中国电子信息博览会&rdquo;（China Information Technology Expo 2017；英文简写：CITE 2017）。</p>\n\n<p>（二）时间：2017年4月9日至11日。</p>\n\n<p>（三）地点：深圳会展中心（深圳市福田区福华三路）</p>\n\n<p>（四）规模：102500平方米。</p>\n\n<p>（五）目标定位：力争办成&ldquo;行业领先、亚洲第一、世界第一&rdquo;，具有较大国际影响力的电子信息产业年度盛会。</p>\n\n<p>（六）专业特色：重点展示大数据、智慧家庭、智能硬件、虚拟现实、传感器与物联网、人工智能、&ldquo;互联网+&rdquo;等行业热点，同时展示平板显示、智能制造与3D打印、机器人与智能系统、电子仪器与设备、锂电新能源、电子元器件等细分领域的最新产品和技术，覆盖电子信息全产业链。</p>\n\n<p>（七）同期活动：博览会同期组织一场高端主论坛、举办40余个主题、近100场专题论坛、一系列新产品新技术发布活动、一系列商贸洽谈活动以及一系列国际产业交流活动，覆盖电子信息产业各个专业领域，为展商将提供最为丰富的交流机会。</p>\n\n<p><strong>二、展区规划</strong></p>\n\n<p>1号馆：CITE主题馆：数字视听展区：智能电视、音响、数字家庭、数码产品；移动智能终端展区：智能手机、平板电脑、智能汽车；软件与互联网展区：互联网、云计算、大数据、软件产品与信息服务；</p>\n\n<p>2号馆：新型显示与应用馆：OLED显示展区、车载显示展区、医疗显示展区、教育显示展区、可穿戴显示展区、交通显示展区与应用终端展区、显示设备材料展区、新型材料展区；</p>\n\n<p>3号馆：智能制造馆：大数据展区、智能机器人展区、3D打印展区、智能监控和辨识展区、智慧工厂自动化展区；</p>\n\n<p>4号馆：机器人与智能系统馆：机器人展区、智能标签（RFID）与芯片智能卡展区等；</p>\n\n<p>5号馆：人工智能馆；</p>\n\n<p>6号馆：健康电子和创客馆：健康电子展区、创客展区；</p>\n\n<p>7号馆：电子仪器与设备馆：电子仪器、仪表、测试测量展区，电子工具、专用设备展区；</p>\n\n<p>8号馆：锂电新能源馆：锂电池展区、锂电设备材料展区；</p>\n\n<p>9号馆：电子元器件馆：高端元器件展区、特种元器件展区。</p>\n\n<p><strong>三、</strong><strong>展会</strong><strong>组织</strong></p>\n\n<p>（一）主办单位</p>\n\n<p>工业和信息化部、深圳市人民政府</p>\n\n<ul>\n	<li>承办单位</li>\n</ul>\n\n<p>中国电子器材总公司、深圳市平板显示行业协会</p>\n\n<p>（三）协办单位</p>\n\n<p>深圳市福田区人民政府</p>\n\n<p>（四）战略合作单位</p>\n\n<p>深圳市宝安区大数据产业技术创新联盟</p>\n\n<p><strong>&nbsp;四、有关说明</strong></p>\n\n<p>温馨提示:本次展会规模大，参展企业多，聚集全球众多名企，可吸引近30万人参观采购，现诚邀相关企业踊跃报名参加。</p>\n\n<ul>\n	<li>企业参展报名截止时间：2017年3月15日</li>\n	<li>展会费用</li>\n</ul>\n\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;净地面积人民币1500元/㎡,标准展位（3*3㎡）人民币15000元/个。(2017年3月15日前优惠价8折）</p>\n\n<ul>\n	<li>展会补贴</li>\n</ul>\n\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;补贴标准：原则上对电博会本地参展企业各区经促局按照展位费50%标准给予补贴，市中小服务署补贴20％-50%，以当年财政拨款额度为准。具体补贴情况见市经信委文件（深经贸信息电子字【2016】114号）。（展会补贴可以由联盟代办，也可以由企业自行申请。）</p>\n\n<p><strong>用餐及住宿：参展企业自行安排。</strong></p>\n\n<p>（四）报名方式</p>\n\n<p>请各意向参展单位联系宝安区大数据产业技术创新联盟秘书处，联系人曾小姐：0755-27860990/15012962486，电子邮箱：<a href=\"mailto:3107221553@qq.com\">3107221553@qq.com</a></p>', '2017-07-12 00:08:11', '1', '1');
INSERT INTO `law` VALUES ('2', '关于开展宝安区2016年金融类、物流类特色紧缺人才岗位需求预申报工作的通知', '<p>各相关企业：</p>\n\n<p>　　按照区委区政府统一部署，我区决定于近期实施宝安区2016年紧缺人才引进&ldquo;1000工程&rdquo;，其中计划面向金融、物流特色产业领域分别引进20名紧缺人才，并为他们提供住房保障等优惠政策，助力相关企业招才引智。为保障有关工作顺利开展，根据区委组织部《关于做好宝安区2016年紧缺人才引进&ldquo;1000工程&rdquo;岗位需求预申报工作的通知》要求，现开展2016年金融类、物流类特色紧缺人才岗位需求预申报工作，具体内容和要求如下：</p>\n\n<p>　　一、金融类、物流类特色紧缺人才引进工作的实施范围</p>\n\n<p>　　（一）主要面向我区的各类物流、金融企业，其中物流企业必须为注册在我区的独立法人企业，金融企业可为注册在我区的独立法人企业和一级分支机构。</p>\n\n<p>　　（二）房地产企业、有自建保障性住房项目、已申请我区&ldquo;1000工程&rdquo;其他类紧缺人才的企业不纳入范围。</p>\n\n<p>　　二、新引进紧缺人才的基本条件</p>\n\n<p>　　新引进紧缺人才应遵纪守法，诚实守信，具有良好的职业道德，同时符合以下基本条件：</p>\n\n<p>　　（一）具有硕士及以上学历学位，或中级及以上专业技术资格，或高级工及以上职业资格；</p>\n\n<p>　　（二）企业根据工作需要设定的岗位资格条件；</p>\n\n<p>　　（三）2016年紧缺人才引进&ldquo;1000工程&rdquo;公告发布后（计划时间为8月底至9月上旬，以实际发布日期为准），从区外新引进到我区企业全职工作的人才。</p>\n\n<p>　　三、新引进紧缺人才可享受的优惠政策</p>\n\n<p>　　符合条件的新引进的紧缺人才可享受以下优惠政策（暂定，具体以区政府正式发布的&ldquo;1000工程&rdquo;公告为准）：</p>\n\n<p>　　（一）新引进的紧缺人才在深圳市未拥有自有形式住房、未享受过住房优惠政策的，在所在重点企业工作期间，可以入住面积50平方米以上的公共租赁住房（租金标准不高于市规定的公共租赁住房租金标准），并享受实际缴交租金三分之一、不超过三年的租金补贴。</p>\n\n<p>　　（二）新引进紧缺人才符合《宝安区高层次人才分类标准》规定条件的，经认定后，可获得最长10年、每月5000元的租房补贴，或免租入住最长10年、面积90平方米左右的住房。</p>\n\n<p>　　（三）申请的保障住房位置和面积将结合企业所在地、意向，根据匹配原则和房源具体情况由区进行统一调配。</p>\n\n<p>　　（四）本项政策不可与市《关于促进人才优先发展的若干措施》第五十一条&ldquo;新引进人才租房和生活补贴&rdquo;同时享受。</p>\n\n<p>　　四、新引进紧缺人才岗位需求的预申报</p>\n\n<p>　　（一） 根据全区工作时间进度要求，请预申报企业于8月23日（星期二）中午12:00前报送至联络邮箱bajmj1304@163.com，逾期不报视为自动放弃资格。</p>\n\n<p>　　（二）将根据金融类、物流类人才引进工作方案（见附件3，暂行稿，以最终正式稿为准）按照企业提交申报信息中的企业资质、营收规模、纳税情况、岗位紧缺性等因素综合打分并分配名额，获得名额的企业需按申报材料清单（见附件4）提交纸质材料到宝安区经济促进局（新安三路海关大厦807室物流商务科、金融发展科）.</p>\n\n<p>　　附件：1.宝安区2016年紧缺人才岗位需求申报表（金融）；</p>\n\n<p>　　2、宝安区2016年紧缺人才岗位需求申报表（物流）；</p>\n\n<p>　　3.宝安区2016年金融类、物流类紧缺人才引进工作方案（暂行）；</p>\n\n<p>　　4.申报材料清单；</p>\n\n<p>　　5.宝安区委组织部关于做好宝安区2016年紧缺人才引进&ldquo;1000工程&rdquo;岗位需求申报工作的通知</p>\n\n<p>　　</p>\n\n<p>　　</p>\n\n<p>　　&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 深圳市宝安区经济促进局</p>\n\n<p>　　2016年8月19日</p>\n\n<p>　　（联系人：傅先生，27660683；尤小姐，27848630）</p>\n\n<p>&nbsp;</p>\n\n<p>附件下载：1.<a href=\"http://www.iiachina.org/upfiles/image/file/20160823/20160823084703_91883.xlsx\" target=\"_blank\">宝安区2016年金融类特色产业紧缺人才引进岗位需求申报表</a></p>\n\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.<a href=\"http://www.iiachina.org/upfiles/image/file/20160823/20160823084746_47076.xlsx\" target=\"_blank\">宝安区2016年物流类特色产业紧缺人才引进岗位需求申报表</a></p>\n\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3.<a href=\"http://www.iiachina.org/upfiles/image/file/20160823/20160823084837_95638.docx\" target=\"_blank\">2016年金融、物流特色产业紧缺人才引进工作方案（暂行）</a></p>\n\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4.<a href=\"http://www.iiachina.org/upfiles/image/file/20160823/20160823084923_85964.docx\" target=\"_blank\">申报材料清单</a></p>\n\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5.<a href=\"http://www.iiachina.org/upfiles/image/file/20160823/20160823085004_52525.docx\" target=\"_blank\">关于做好宝安区2016年紧缺人才引进&ldquo;1000工程&rdquo;岗位需求预申报工作的通知</a></p>\n\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6.<a href=\"http://www.iiachina.org/upfiles/image/file/20160823/20160823085055_39833.docx\" target=\"_blank\">联系电子邮箱</a></p>', '2017-07-12 00:08:38', '1', '1');
INSERT INTO `law` VALUES ('4', '国务院印发《“十三五”国家科技创新规划》', '<p>&nbsp;经李克强总理签批，国务院近日印发《&ldquo;十三五&rdquo;国家科技创新规划》（以下简称《规划》），明确提出了未来五年国家科技创新的指导思想、总体要求、战略任务和改革举措。<br />\n　　<br />\n&nbsp; &nbsp; 《规划》强调，坚持创新是引领发展的第一动力，以深入实施创新驱动发展战略、支撑供给侧结构性改革为主线，全面深化科技体制改革，大力推进以科技创新为核心的全面创新，塑造更多依靠创新驱动、更多发挥先发优势的引领型发展，确保如期进入创新型国家行列，为建成世界科技强国奠定坚实基础。<br />\n　　<br />\n&nbsp; &nbsp; 《规划》描绘了未来五年科技创新发展的蓝图，确立了&ldquo;十三五&rdquo;科技创新的总体目标。国家科技实力和创新能力大幅跃升，国家综合创新能力世界排名进入前15位，迈进创新型国家行列；创新驱动发展成效显著，与2015年相比，科技进步贡献率从55.3%提高到60%，知识密集型服务业增加值占国内生产总值的比例从15.6%提高到20%；科技创新能力显著增强，通过《专利合作条约》（PCT）途径提交的专利申请量比2015年翻一番，研发投入强度达到2.5%。<br />\n　　<br />\n&nbsp; &nbsp; 《规划》提出建设高效协同的国家创新体系，并从培育充满活力的创新主体、系统布局高水平创新基地、打造高端引领的创新增长极、构建开放协同的创新网络、建立现代创新治理结构、营造良好创新生态等六个方面提出了总体要求。努力促进各类创新主体协同互动、创新要素顺畅流动高效配置，形成创新驱动发展的实践载体、制度安排和环境保障。<br />\n　　<br />\n&nbsp; &nbsp; 《规划》围绕支撑国家重大战略，充分发挥科技创新在推动产业迈向中高端、增添发展新动能、拓展发展新空间、提高发展质量和效益中的核心引领作用，重点强化六方面的任务部署。一是围绕构筑国家先发优势，加强兼顾当前和长远的重大战略布局。二是围绕增强原始创新能力，培育重要战略创新力量。三是围绕拓展创新发展空间，统筹国内国际两个大局。四是围绕推进大众创业万众创新，构建良好创新创业生态。五是围绕破除束缚创新和成果转化的制度障碍，全面深化科技体制改革。六是围绕夯实创新的群众和社会基础，加强科普和创新文化建设。<br />\n　　<br />\n&nbsp; &nbsp; 《规划》从落实和完善创新政策法规、完善科技创新投入机制、加强规划实施与管理等三方面提出了保障措施，强调完善支持创新的普惠性政策体系，深入实施知识产权战略和技术标准战略，建立多元化科技投入体系等。</p>', '2017-07-12 00:09:23', '1', '2');
INSERT INTO `law` VALUES ('5', '2016《中国制造业与互联网融合发展蓝皮书》发布', '<p>今年，我国将&ldquo;中国制造+互联网&rdquo;纳入&ldquo;十三五&rdquo;规划纲要，今年5月最新发布了《国务院关于深化制造业与互联网融合发展的指导意见》，深化制造业与互联网融合已经成为国家层面的重大部署。<br />\n<br />\n&nbsp; &nbsp; 7月28日，在工业和信息化部领导下，中国互联网与工业创新联盟、中国信息通信研究院等单位组织召开了2016(第二届)中国互联网与工业融合创新峰会。在本次峰会上发布了《中国制造业与互联网融合发展蓝皮书(2016)》(以下简称蓝皮书)。<br />\n<br />\n&nbsp; &nbsp; 本报告较全面分析和总结了当前融合发展的最新态势、热点领域、主要模式和区域特征，在此基础上对融合发展的趋势趋势和存在的问题进行了探讨。<br />\n<br />\n　　蓝皮书指出，总体来看，我国制造业与互联网融合发展是以制造企业为核心，以相关信息服务企业为支撑，由环节渗透向综合集成发展演进。互联网从生产流程的研、产、供、销、服等各个环节逐步适应于制造业，呈现&ldquo;五环渗透&rdquo;、&ldquo;由外向内&rdquo;的特点，随着融合的不断深化，当前呈现以智能化、协同化、定制化、服务化和平台化&ldquo;五化转型&rdquo;为特征的新态势，其驱动力量在于网络连接的不断扩大、数据交互的逐步打通和应用服务的活跃创新。<br />\n<br />\n　　在发展制造业与互联网融合发展的道路上同时面临很多的问题和挑战。蓝皮书指出，互联网在企业中的普及率较高，但在不同环节、不同领域间，以及不同企业、行业以及区域间的发展水平和应用程度存在较大的差距，企业在推进制造业与互联网融合进程中也面临诸多的问题和挑战。</p>\n\n<p>&nbsp;</p>\n\n<p><img alt=\"\" src=\"http://localhost:8081/editor/law/2/image/1499789394936.jpg\" style=\"height:465px; width:700px\" /></p>', '2017-07-12 00:09:59', '1', '2');

-- ----------------------------
-- Table structure for `link`
-- ----------------------------
DROP TABLE IF EXISTS `link`;
CREATE TABLE `link` (
  `id` bigint(11) NOT NULL auto_increment,
  `logo` varchar(255) default NULL COMMENT '公司logo',
  `name` varchar(100) default NULL COMMENT '公司名称',
  `url` varchar(100) default NULL COMMENT '地址',
  `sort` int(11) default '0' COMMENT '排序号',
  `create_time` timestamp NULL default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of link
-- ----------------------------
INSERT INTO `link` VALUES ('3', 'link/1498065758026.jpg', '百度', 'http://www.baidu.com', '1', '2017-06-22 01:22:38');
INSERT INTO `link` VALUES ('4', 'link/1498066213414.jpg', 'google', 'https://www.google.com', null, '2017-06-22 01:30:13');

-- ----------------------------
-- Table structure for `member`
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id` bigint(20) NOT NULL auto_increment,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) default NULL,
  `email` varchar(50) default NULL,
  `url` varchar(50) default NULL,
  `address` varchar(200) default NULL,
  `name` varchar(100) default NULL,
  `group_id` bigint(20) default NULL,
  `create_time` timestamp NULL default NULL,
  `creator` bigint(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('1', 'jack', 'e@ZUGLmZIA', 'junzhuo.zhen@ericsson.com', '', '', '', '2', '2017-07-14 00:35:48', '1');
INSERT INTO `member` VALUES ('2', 'Mr yang', '123451', '2926283177@qq.com', 'http://hdipctaobao.cn.china.cn/', '', '深圳安锐通科技有限公司', '1', '2017-07-14 00:40:02', '1');

-- ----------------------------
-- Table structure for `member_server`
-- ----------------------------
DROP TABLE IF EXISTS `member_server`;
CREATE TABLE `member_server` (
  `id` bigint(20) NOT NULL auto_increment,
  `title` varchar(250) NOT NULL,
  `content` longtext,
  `create_time` timestamp NULL default NULL,
  `creator` bigint(20) default NULL,
  `is_show` enum('N','Y','') default 'Y' COMMENT '1. 培训内容  2. 调查表',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member_server
-- ----------------------------
INSERT INTO `member_server` VALUES ('1', '入会须知', '<p>为加强会员管理，提高工作效率和服务质量，促进协会发展，根据协会章程，制定如下管理办法。 　　&nbsp;</p>\n\n<p><strong>一、会员入会&nbsp;</strong></p>\n\n<p>1．凡承认协会章程，按时交纳会费的广东省行政区域内从事互联网业务及与互联网相关研究、开发、生产、销售、维护、教育和管理工作的单位或个人均可申请参加本协会。&nbsp;<br />\n2．入会由申请单位或个人提出书面申请，向协会办公室领取（或从协会网站www.iia.org.&ldquo;入会须栏下载）入会申请表和协会章程。&nbsp;<br />\n3．申请单位填写申请表并加盖单位公章后递交协会办公室。&nbsp;<br />\n4．协会办公室接受申请表后将及时审核，五个工作日内提交秘书处审批。&nbsp;<br />\n5．协会秘书处在十个工作日内对申请表进行研究，提出批准意见。&nbsp;<br />\n6．协会办公室对批准入会的单位收取当年会费，并及时颁发会员证书和牌匾，同时在协会网站&ldquo;通知与公告&rdquo;栏向社会公布。</p>\n\n<p><br />\n<strong>&nbsp;二、会员管理&nbsp;</strong></p>\n\n<p>1．协会办公室设专人管理会籍，将会员资料录入会员资料库。&nbsp;<br />\n2．会员要与协会保持经常性联系，向协会反映情况，以便协会帮助会员解决问题和向有关部门反映会员意见，提供信息、咨询等多方面服务。&nbsp;<br />\n3．协会应深入会员单位征求意见和建议，密切双方关系，每年有计划地安排访问会员单位。&nbsp;<br />\n4．每年在第一季度，即1月至3月会员自觉向协会交纳会费，收费情况详见《深圳市宝安互联网行业协会章程》。欢迎会员单位用赞助性会费支持协会工作。会员如有特殊困难可要求减免会费，要求减免会费应先向协会提交书面申请，并出具相关的财税报告等证明材料，由协会秘书处审核后提交理事会审批。&nbsp;<br />\n5．协会免费向会员不定期寄发会刊或工作通讯、深圳市互联网发展状况报告，在协会网站和会刊（或工作通讯）中通报协会工作和活动，报道业界动态，传达上级指示和行业政策及法律法规等。&nbsp;<br />\n6．协会对按时交纳会费和主动与协会保持密切联系的会员实行参加活动优先，活动收费优惠。&nbsp;<br />\n7．对协会作出贡献的会员单位或个人，由办公室推荐报秘书处，理事会批准，视贡献大小分别给予通报表扬、嘉奖和授予荣誉称号奖励。&nbsp;<br />\n8．对违反协会章程和其它规定的会员，可视情节轻重，由办公室报秘书处或理事会批准，分别给予通报批评、停止服务、警告和取消会员资格处分。&nbsp;<br />\n9．对无故一年不交纳会费，视为自动退会，在会员库中注销会员资格并对外公布。一年内不参加协会活动的会员，协会秘书处和理事会给予批评。&nbsp;<br />\n10．会员退会应有本单位或本人提出的书面申请，填写退会申请表，经秘书处批准退会。会员退会时协会办公室应让其清理完与协会有关的经济和其它未尽事务，收回会员证和牌匾，在会员库中注销会员资格并对外公布。</p>', '2017-07-12 23:53:11', '1', 'Y');
INSERT INTO `member_server` VALUES ('3', '入会程序', '<p><strong>会员入会程序</strong></p>\n\n<p>为加强会员管理，提高工作效率和服务质量，促进协会发展，根据协会章程，加入协会程序:</p>\n\n<p>1．凡承认协会章程，按时交纳会费的广东省行政区域内从事互联网业务及与互联网相关研究、开发、生产、销售、维护、教育和管理工作的单位或个人均可申请参加本协会。</p>\n\n<p>2．入会由申请单位或个人提出书面或电子挡申请，向协会办公室领取（或从协会网站www.iia.org.&ldquo;申请入会栏下载）入会申请表和协会章程。</p>\n\n<p>3．申请单位填写申请表并加盖单位公章后,附营业执照副本或其他合法准许营业证件的复印件，500字企业简介,网上递交或递交至协会办公室.</p>\n\n<p>4．协会秘书处在十五个工作日内对申请表进行研究，提出批准意见。</p>\n\n<p>5.&nbsp;协会办公室对批准入会的单位收取当年会费，协会开具发票并及时颁发会员证书和牌匾，同时在协会网站&ldquo;通知与公告&rdquo;栏向社会公布。</p>\n\n<p>6、申请担任副会长及常务副会长单位的会员须向会员部提供以下资料：</p>\n\n<p>（1）入会申请表；</p>\n\n<p>（2）单位简介；</p>\n\n<p>（3）副会长简介。</p>\n\n<p>会员部将拟任副会长的名单提交秘书处初审同意后，报会长办公会议（或通讯会议）批准。</p>\n\n<p>&nbsp;</p>\n\n<p>提出口头或书面申请&nbsp;&rarr;&nbsp;填写入会申请表，提交单位营业执照复印件、单位简介资料&nbsp;&rarr;&nbsp;本会会员部受理、报请执行理事会核准&rarr;&nbsp;发放入会通知&rarr;交纳会费&rarr;&nbsp;颁发会员牌证、履行服务承诺。</p>', '2017-07-12 23:49:15', '1', 'Y');
INSERT INTO `member_server` VALUES ('4', '会员权利与义务', '<p><strong>本协会会员除享有本协会《章程》已规定的会员权利外，还享有下列权利：</strong></p>\n\n<p>（一）免费或优惠参加本协会组织的互联网高级论坛与交流活动；</p>\n\n<p>（二）免费或优惠获得协会提供的网上信息服务；</p>\n\n<p>（三）参加协会组织的其他业务活动的优先权和优惠权；</p>\n\n<p>（四）协会在每年第一季度向会员进行服务需求调查，以会员的需求作为改进工作的目标，保证会员单位获得直接或间接的服务。</p>\n\n<p>（五）协会会员在参加由协会组织、承办或与其他有关部门合办的各类活动时，享有优先参与权，并依照活动内容减免活动费用。</p>\n\n<p>（六）协会尽可能为会员提供帮助，为会员单位搭建互动平台，每年定期或按会员需求不定期走访会员单位。</p>\n\n<p>（七）了解协会工作情况和工作计划；</p>', '2017-07-12 23:55:33', '1', 'Y');

-- ----------------------------
-- Table structure for `news`
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` bigint(20) NOT NULL auto_increment,
  `title` varchar(250) NOT NULL,
  `content` longtext,
  `create_time` timestamp NULL default NULL,
  `creator` bigint(20) default NULL,
  `type` bigint(20) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('1', '协会参加“2016年宝安区社会组织党建工作业务培训会”', '<p>为贯彻落实中央《关于加强社会组织党的建设工作的意见（试行）》和市、区社会组织党建工作座谈会精神，加快推进全区社会组织党的建设工作，2016年7月29日上午，宝安区民政局在区社会组织培育服务中心（宝民一路广场大厦14层1401室）组织召开了2016年宝安区社会组织党建工作业务培训会,共51家全区性社会组织的党务工作人员参加。</p>\n\n<p>　　会上，首先由民政局社会组织管理办公室负责人传达了市、区社会组织党建工作座谈会精神，对当前全区社会组织党建工作的推进情况进行了说明和部署。随后，邀请区委组织部组织科业务骨干对党组织的设置、党员关系接转、党组织生活开展、党费使用等内容进行了详细讲解，内容细致深入，讲解精彩生动，现场气氛热烈、互动频繁，取得预期良好效果。</p>\n\n<p><img alt=\"\" src=\"http://localhost:8081/editor/news/image/1499786406301.jpg\" style=\"height:465px; width:700px\" /></p>\n\n<p><img alt=\"\" src=\"http://localhost:8081/editor/news/image/1499786416533.jpg\" style=\"height:465px; width:700px\" /></p>\n\n<p>&nbsp;</p>', '2017-07-11 23:20:58', '1', '2');
INSERT INTO `news` VALUES ('2', '《国家网络空间安全战略》发布', '<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;国家互联网信息办公室今天发布《国家网络空间安全战略》（以下简称《战略》）。国家网信办发言人表示，《战略》经中央网络安全和信息化领导小组批准，贯彻落实习近平总书记网络强国战略思想，阐明了中国关于网络空间发展和安全的重大立场和主张，明确了战略方针和主要任务，切实维护国家在网络空间的主权、安全、发展利益，是指导国家网络安全工作的纲领性文件。<br />\n<br />\n　　《战略》指出，互联网等信息网络已经成为信息传播的新渠道、生产生活的新空间、经济发展的新引擎、文化繁荣的新载体、社会治理的新平台、交流合作的新纽带、国家主权的新疆域。随着信息技术深入发展，网络安全形势日益严峻，利用网络干涉他国内政以及大规模网络监控、窃密等活动严重危害国家政治安全和用户信息安全，关键信息基础设施遭受攻击破坏、发生重大安全事件严重危害国家经济安全和公共利益，网络谣言、颓废文化和淫秽、暴力、迷信等有害信息侵蚀文化安全和青少年身心健康，网络恐怖和违法犯罪大量存在，直接威胁人民生命财产安全、社会秩序，围绕网络空间资源控制权、规则制定权、战略主动权的国际竞争日趋激烈，网络空间军备竞赛挑战世界和平。网络空间机遇和挑战并存，机遇大于挑战。必须坚持积极利用、科学发展、依法管理、确保安全，坚决维护网络安全，最大限度利用网络空间发展潜力，更好惠及13亿多中国人民，造福全人类，坚定维护世界和平。</p>', '2017-07-11 23:22:22', '1', '3');
INSERT INTO `news` VALUES ('3', '中国网络空间防御技术获重大突破 将改变网络安全游戏规则', '<p>&nbsp; &nbsp; &nbsp; &nbsp;经科技部授权上海市科学技术委员会组织的测试评估，由解放军信息工程大学、复旦大学、浙江大学和中国科学院信息工程研究所等科研团队联合承担的国家&ldquo;863计划&rdquo;重点项目研究成果&ldquo;网络空间拟态防御理论及核心方法&rdquo;近期通过验证，测评结果与理论预期完全吻合。这标志着我国在网络防御领域取得重大理论和方法创新，将打破网络空间&ldquo;易攻难守&rdquo;的战略格局，改变网络安全游戏规则。<br />\n<br />\n　　拟态，是指一种生物模拟另一种生物或环境的现象。2008年，中国工程院院士邬江兴从条纹章鱼能模仿十几种海洋生物的形态和行为中受到启发，提出了研发拟态计算机的构想。在科技部和上海市的共同支持下，拟态计算原理样机研制成功并入选&ldquo;2013年度中国十大科技进展&rdquo;。在此基础上，研发团队针对网络空间不确定性威胁等重大安全问题，开展基于拟态伪装的主动防御理论研究并取得重大突破，所提出的&ldquo;动态异构冗余体制架构&rdquo;，能够将基于未知漏洞后门的不确定性威胁或已知的未知风险变为极小概率事件。<br />\n　　<br />\n&nbsp; &nbsp; 2016年1月起，由国内9家权威评测机构组成的联合测试验证团队，对拟态防御原理验证系统进行了为期6个月的验证测试，先后有21名院士和110余名专家参与不同阶段的测评工作。测评专家委员会发布的《拟态防御原理验证系统测评意见》认为：拟态防御机制能够独立且有效地应对或抵御基于漏洞、后门等已知风险或不确定威胁。受测系统达到拟态防御理论预期，并使利用&ldquo;有毒带菌&rdquo;构件实现可管可控的信息系统成为可能，对基于&ldquo;后门工程和隐匿漏洞&rdquo;的&ldquo;卖方市场&rdquo;攻势战略具有颠覆性意义。<br />\n　　<br />\n&nbsp; &nbsp; 邬江兴介绍说，我国是遭受网络攻击最严重的国家之一。据国家互联网应急中心数据显示，仅2015年的抽样监测，我国有1978万余台主机被10.5万余个木马和僵尸网络控制端控制。由于现有的网络防御体制采用的是&ldquo;后天获得性免疫&rdquo;机制，先&ldquo;亡了羊&rdquo;，才能通过打补丁、封门堵漏来&ldquo;补牢&rdquo;，对于不能感知和认知的网络攻击几乎不设防，而拟态防御理论与方法能够有效应对这些问题。<br />\n　　<br />\n&nbsp; &nbsp; 邬江兴还表示，网络空间拟态防御理论与方法是全人类的共同财富，中国科学家愿意将这一技术与世界分享，为构建网络空间命运共同体作出贡献。</p>', '2017-07-11 23:22:52', '1', '3');

-- ----------------------------
-- Table structure for `news_type`
-- ----------------------------
DROP TABLE IF EXISTS `news_type`;
CREATE TABLE `news_type` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `create_time` timestamp NULL default NULL,
  `is_show` enum('N','Y','') default 'Y',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news_type
-- ----------------------------
INSERT INTO `news_type` VALUES ('2', '协会新闻', '2017-07-11 22:13:16', 'Y');
INSERT INTO `news_type` VALUES ('3', '互联网要闻', '2017-07-11 22:13:18', 'Y');
INSERT INTO `news_type` VALUES ('4', '互联网国内要闻', '2017-07-11 22:13:20', 'N');
INSERT INTO `news_type` VALUES ('5', '互联网国际新闻', '2017-07-11 22:13:22', 'N');
INSERT INTO `news_type` VALUES ('9', '媒体报道', '2017-07-11 23:28:47', 'Y');

-- ----------------------------
-- Table structure for `scroll_pic`
-- ----------------------------
DROP TABLE IF EXISTS `scroll_pic`;
CREATE TABLE `scroll_pic` (
  `id` bigint(20) NOT NULL auto_increment,
  `content` varchar(255) default NULL,
  `url` varchar(255) default NULL,
  `sort` int(11) default NULL,
  `create_time` timestamp NULL default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of scroll_pic
-- ----------------------------
INSERT INTO `scroll_pic` VALUES ('1', '你好吗劳而无功 进基本原则载是墓 基本原则载基本原则载东奔西走 基本原则载基本原则载基本原则载苦', 'scollPic/1498474653905.jpg', '5', '2017-06-26 18:57:34');
INSERT INTO `scroll_pic` VALUES ('2', 'abc', 'scollPic/1498474955434.jpg', '2', '2017-06-26 19:02:20');
INSERT INTO `scroll_pic` VALUES ('3', 'asdfasdfasdf', 'scollPic/1499263389864.jpg', null, '2017-07-05 22:03:09');

-- ----------------------------
-- Table structure for `server_type`
-- ----------------------------
DROP TABLE IF EXISTS `server_type`;
CREATE TABLE `server_type` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `create_time` timestamp NULL default NULL,
  `is_show` enum('N','Y','') default 'Y',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of server_type
-- ----------------------------
INSERT INTO `server_type` VALUES ('10', '入会须知', '2017-07-12 23:22:38', 'Y');
INSERT INTO `server_type` VALUES ('11', '入会程序', '2017-07-12 23:22:50', 'Y');
INSERT INTO `server_type` VALUES ('13', '会员权利与义务', '2017-07-12 23:23:18', 'Y');

-- ----------------------------
-- Table structure for `sound_pic`
-- ----------------------------
DROP TABLE IF EXISTS `sound_pic`;
CREATE TABLE `sound_pic` (
  `id` bigint(20) NOT NULL auto_increment,
  `title` varchar(250) NOT NULL,
  `content` longtext,
  `create_time` timestamp NULL default NULL,
  `creator` bigint(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sound_pic
-- ----------------------------
INSERT INTO `sound_pic` VALUES ('1', '微信营销策略讲座活动', '<p>举办微信营销策略讲座。针对宝安产业升级转型，很多生产厂家都积极开拓网上销售渠道，向价值曲线的高端转移和探索，实现线上线下的结合，利用微信这一免费资源实现企业效益的高速增长。</p>\n\n<p><img alt=\"\" src=\"http://localhost:8081/editor/soundPic/image/1499353794621.png\" style=\"height:523px; width:788px\" /></p>', '2017-07-06 23:10:01', '1');
INSERT INTO `sound_pic` VALUES ('2', '微信营销策略讲座活动1', '<p>举办微信营销策略讲座。针对宝安产业升级转型，很多生产厂家都积极开拓网上销售渠道，向价值曲线的高端转移和探索，实现线上线下的结合，利用微信这一免费资源实现企业效益的高速增长。</p>\n\n<p><img alt=\"\" src=\"http://localhost:8081/editor/soundPic/image/1499353794621.png\" style=\"height:523px; width:788px\" /></p>\n\n<p><img alt=\"\" src=\"http://localhost:8081/editor/soundPic/image/1499355566926.png\" style=\"height:523px; width:788px\" /></p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>', '2017-07-06 23:39:36', '1');

-- ----------------------------
-- Table structure for `train`
-- ----------------------------
DROP TABLE IF EXISTS `train`;
CREATE TABLE `train` (
  `id` bigint(20) NOT NULL auto_increment,
  `title` varchar(250) NOT NULL,
  `content` longtext,
  `create_time` timestamp NULL default NULL,
  `creator` bigint(20) default NULL,
  `type` int(11) default NULL COMMENT '1. 培训内容  2. 调查表',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of train
-- ----------------------------
INSERT INTO `train` VALUES ('1', '用“五心”服务助推产业发展', '<p>7月15日，由区经促局、区科创局、区人才办与致公党宝安总支共同主办的&ldquo;孵化培育&middot;创新升级-科技型中小企业培育发展论坛&rdquo;在宝安区举行，深圳市委常委、常务副市长张虎发来贺信，贺信中表达了对本次论坛的重视和支持，同时也向前来出席论坛的宝安区的领导、嘉宾、专家、企业主表示问候和感谢！区委书记黄敏，区领导郑新强、黄耀东、杨浩勃出席论坛。</p>\n\n<p>　　在宝安区大力推动产业名城建设的过程中，科技型中小企业是值得关注的重要力量，其在提升我区企业竞争力和科技创新能力、推动产业转型、吸纳高端人才等方面均发挥着重要作用。黄敏在讲话中指出，宝安是深圳市的国土大区、人口大区，中小企业众多，为宝安经济发展做出了巨大的贡献。&ldquo;为促进宝安产业更好发展，区委区政府将在政务服务方面提供&lsquo;宝式服务&rsquo;，决心把宝安打造为全国政务服务最好的区域。&rdquo;黄敏说，做好服务工作需要做到真心、诚心、细心、耐心、专心，欢迎大家多给我们提出意见和建议。</p>\n\n<p>　　黄敏强调，宝安区委区政府的施政理念就是产业第一、企业为尊、纳税为荣、就业为重、民生为本；没有产业发展就没有宝安的未来，必须尊重企业和企业家，提倡纳税为荣，使整个社会自觉纳税、依法纳税，创造就业机会扩大就业，让市民群众过上幸福生活。</p>\n\n<p>　　本次论坛分为科技型中小企业发展主题演讲、科技型中小企业项目路演及圆桌论坛等环节。区政协副主席杨浩勃在论坛上以致公党深圳市委会副主委、宝安总支主委的身份，就致公党宝安支部开展的&ldquo;关于大力建设孵化育成体系、培育壮大宝安区科技型中小企业&rdquo;的调研课题作了主旨演讲，向来宾介绍课题调研成果。2015年，致公党宝安总支专门成立课题组，通过问卷调查、文献研究、实地调研等方式，对宝安区科技型中小企业的发展现状及问题进行了调查研究，并在2016年市区&ldquo;两会&rdquo;期间提交了培育发展科技型中小企业的提案。</p>\n\n<p>　　在论坛设立的科技型中小企业项目路演环节，深圳市百事达卓越科技股份有限公司、深圳市科卫泰实业发展有限公司、深圳市德宝威科技有限公司三家企业分别展示了新材料、非开挖双层罐改造、智能机器人项目、工业级无人机项目以及网络智能机器人，吸引了一批投资机构的关注。</p>\n\n<p>　　7月15日，由区经促局、区科创局、区人才办与致公党宝安总支共同主办的&ldquo;孵化培育&middot;创新升级-科技型中小企业培育发展论坛&rdquo;在宝安区举行，深圳市委常委、常务副市长张虎发来贺信，贺信中表达了对本次论坛的重视和支持，同时也向前来出席论坛的宝安区的领导、嘉宾、专家、企业主表示问候和感谢！区委书记黄敏，区领导郑新强、黄耀东、杨浩勃出席论坛。</p>\n\n<p>　　在宝安区大力推动产业名城建设的过程中，科技型中小企业是值得关注的重要力量，其在提升我区企业竞争力和科技创新能力、推动产业转型、吸纳高端人才等方面均发挥着重要作用。黄敏在讲话中指出，宝安是深圳市的国土大区、人口大区，中小企业众多，为宝安经济发展做出了巨大的贡献。&ldquo;为促进宝安产业更好发展，区委区政府将在政务服务方面提供&lsquo;宝式服务&rsquo;，决心把宝安打造为全国政务服务最好的区域。&rdquo;黄敏说，做好服务工作需要做到真心、诚心、细心、耐心、专心，欢迎大家多给我们提出意见和建议。</p>\n\n<p>　　黄敏强调，宝安区委区政府的施政理念就是产业第一、企业为尊、纳税为荣、就业为重、民生为本；没有产业发展就没有宝安的未来，必须尊重企业和企业家，提倡纳税为荣，使整个社会自觉纳税、依法纳税，创造就业机会扩大就业，让市民群众过上幸福生活。</p>\n\n<p>　　本次论坛分为科技型中小企业发展主题演讲、科技型中小企业项目路演及圆桌论坛等环节。区政协副主席杨浩勃在论坛上以致公党深圳市委会副主委、宝安总支主委的身份，就致公党宝安支部开展的&ldquo;关于大力建设孵化育成体系、培育壮大宝安区科技型中小企业&rdquo;的调研课题作了主旨演讲，向来宾介绍课题调研成果。2015年，致公党宝安总支专门成立课题组，通过问卷调查、文献研究、实地调研等方式，对宝安区科技型中小企业的发展现状及问题进行了调查研究，并在2016年市区&ldquo;两会&rdquo;期间提交了培育发展科技型中小企业的提案。</p>\n\n<p>　　在论坛设立的科技型中小企业项目路演环节，深圳市百事达卓越科技股份有限公司、深圳市科卫泰实业发展有限公司、深圳市德宝威科技有限公司三家企业分别展示了新材料、非开挖双层罐改造、智能机器人项目、工业级无人机项目以及网络智能机器人，吸引了一批投资机构的关注。</p>', '2017-07-12 00:53:56', '1', '1');
INSERT INTO `train` VALUES ('2', 'ITSS的需求', '<p><strong>一、谁需要ITSS</strong><br />\n&nbsp; &nbsp; ITSS既是一套成体系的标准库，又是一套指导IT服务选择和供应的方法学。我国境内需要IT服务、提供IT服务或从事IT服务相关的理论研究和技术研发的单位或个人都需要ITSS，包括：行业主管部门：用于规范和引导信息技术服务业的发展。</p>\n\n<p>1.IT服务需方：</p>\n\n<p>&nbsp; &nbsp; 主要用于实施标准化的IT服务，或选择合格的IT服务提供商。这样的需方主要包括：中央及地方各级政府部门信息中心；金融、电信、电力、石化等全国性或区域性行业企业的IT部门；全国各省市的各类大中型企业的IT部门；其它有IT服务需求的组织。</p>\n\n<p>2.IT服务供方：</p>\n\n<p>&nbsp; &nbsp; 主要用于提供标准化的IT服务，提升服务质量并确保服务可信赖。这样的供方主要包括：以IT咨询为主营业务的企业；以设计开发为主营业务的企业；以信息系统集成为主营业务的企业；以数据处理和运营为主营业务的企业；其它提供IT服务的组织。</p>\n\n<p>3.高校和科研院所：</p>\n\n<p>用于指导IT服务相关的理论研究、技术研发和学科设置。</p>\n\n<p>4.个人：</p>\n\n<p>主要通过研究和学习ITSS，全面理解和掌握IT服务的内容和标准化知识，以及实施IT服务的方法，从而提升个人技能。（</p>\n\n<p>&nbsp;</p>\n\n<p><strong>二、为什么需要ITS</strong><strong>S</strong><br />\n<br />\n1.没有ITSS的IT服务<br />\n20世纪80年代以来，计算技术逐步从以主机为核心演变到分布式计算，从2007年云计算概念的提出到现在的逐步推广应用，标志着IT的应用已从以建设为主的阶段全面转移到以服务为核心的阶段。规划设计、运行维护、运营、数据处理等新型服务模式不断被市场认可，&ldquo;IT服务&rdquo;已成为行业内一个通用的概念。然而，下述问题却一直困扰着IT服务市场：<br />\n（1）.什么是IT服务？不同的企业、不同的个人对这个问题有不同的表述方式，不同的研究机构对其有不同的定义，甚至联合国、WTO这样的全球性官方机构也没有明确的定义。</p>\n\n<p>（2）.什么样的IT服务是可信赖的？传统的硬件产品主要依据《电子产品三包法》提供维保服务，但具体的服务内容完全由原厂商制定，用户缺乏话语权；软件产品的售后服务缺乏通用的标准支持，也主要由厂商制定。从而形成了千差万别的服务，保障服务质量的主要依据就是厂商的品牌和信誉，但用户却为此付出了代价。</p>\n\n<p>2.当IT服务供需双方面临上述问题时，最直接的影响是：</p>\n\n<p>&nbsp; &nbsp; 对IT服务需方：<br />\n需求方面：难以全面理清和管理IT服务需求。<br />\n供应商选择方面：缺乏选择IT服务供应商的合理依据，被迫选择有品牌和技术实力强大的服务商，或者因价格问题，不得不选择满足不了需求的服务商，最终受损的是用户自己。<br />\n供应商管理方面：难以对IT服务供应商进行过程管理和考核，容易陷入&ldquo;一放就乱、一抓就换&rdquo;的困境。<br />\n人员方面：难以招聘到合格的IT服务人员，同时因服务本身对特定人员个体的依赖性，给IT服务造成的影响较大。<br />\n&nbsp; &nbsp; 对IT服务供方：<br />\nIT服务工程师方面：需要自己耗费大量时间和精力培养初级IT服务工程师。<br />\nIT服务管理人员方面：培养合格的管理人员周期长、成本高、难度大。<br />\nIT服务产品化方面：IT服务业务产品化、规模化困难，同时面临自身的技术和管理挑战、客户接受程度的挑战等难题。<br />\n3.使用ITSS的好处<br />\n使用ITSS，对IT服务供需双方来讲，将带来以下潜在收益：<br />\n&nbsp; &nbsp; 对IT服务需方：<br />\n提升IT服务质量：通过量化和监控最终用户满意度，IT服务需方可以更好地控制和提升用户满意度，从而有助于全面提升服务质量。<br />\n优化IT服务成本：不可预测的支出往往导致服务成本频繁变动，同时也意味着难以持续控制并降低IT服务成本，通过使用ITSS，将有助于量化服务成本，从而达到优化成本的目的。<br />\n强化IT服务效能：通过ITSS实施标准化的IT服务，有助于更合理地分配和使用IT服务，让所采购的IT服务能够得到最充分、最合理的使用。<br />\n降低IT服务风险：通过ITSS实施标准化的IT服务，也就意味着更稳定、更可靠的IT服务，降低业务中断风险，并可以有效避免被单一IT服务厂商绑定。<br />\n&nbsp; &nbsp; 对IT服务供方：<br />\n提升IT服务质量：IT服务供需双方基于同一标准衡量IT服务质量，可使IT服务供方一方面通过IT服务的标准化来提升IT服务质量，另一方面可使提升的IT服务质量被IT服务需方认可，转换为经济效益。<br />\n优化IT服务成本：ITSS使IT服务供方可以将多项IT服务成本从企业内成本转换成社会成本，比如初级IT服务工程师培养、客户IT服务教育等。这种转变一方面直接降低了IT服务供方的成本，另一方面为IT服务供方的业务快速发展提供了可能。<br />\n强化IT服务效能：服务标准化是服务产品化的前提，服务产品化是服务产业化的前提。ITSS让IT服务供方实现IT服务的规模化成为可能。</p>\n\n<p>降低IT服务风险。IT服务测试和监理等第三方服务，可降低IT服务项目验收风险；部分IT服务成本从企业内转换到企业外，可降低IT服务企业运营风险。</p>\n\n<p>&nbsp;</p>\n\n<p><strong>三、如何实施ITSS</strong><strong>?</strong><br />\n&nbsp; &nbsp; 实施ITSS，对需方来说，以满足服务需求为目标；对供方来说，以指导业务发展、提升服务质量为目标，并结合实际需要，采用建立质量管理体系方法论，从规划设计、部署实施、监督检查、持续改进等方面综合考虑如何实施ITSS。<br />\n一般来说，实施ITSS分为四个阶段，即需求分析、规划设计、部署实施和评估改进。在实施ITSS的过程中，需要根据ITSS标准的各项要求，对人员、流程、技术和资源四个关键因素进行全面整合，并与IT服务全生命周期的规范化管理相结合。</p>', '2017-07-12 00:54:46', '1', '1');
INSERT INTO `train` VALUES ('3', '关于举办“企业专利布局与规划策略”讲座活动的通知', '<p>宝安区各科技企业：</p>\n\n<p>为提升宝安区企业知识产权保护意识，推动企业转型升级，宝安区科技创新服务中心将于8月24日下午15时在飞扬科技创新园举办&ldquo;企业专利布局与规划策略&rdquo;讲座活动。讲座特邀国家专利评议联盟评审专家、专利代理人、深圳中科院知识产权投资有限公司运营部总经理王晓刚到会并发表主题演讲。</p>\n\n<p>一、讲座时间</p>\n\n<p>8月24日（周三）下午15:00-17:00</p>\n\n<p>二、讲座地点</p>\n\n<p>深圳市宝安区宝城67区隆昌路8号飞扬科技园B栋1楼会议室</p>\n\n<p>三、讲座内容</p>\n\n<p>1、企业专利布局的必要性；</p>\n\n<p>2、企业专利布局规划策略；</p>\n\n<p>3、企业专利申请策略。</p>\n\n<p>四、参会对象：知识产权负责人，主管专利负责人或企业负责人</p>\n\n<p>五、报名方式</p>\n\n<p>1、报名电话：85252234 &nbsp;桂小姐</p>\n\n<p>2、报名邮箱：444266481@qq.com</p>\n\n<p>本次活动免费，欢迎各科技企业踊跃报名，下载并填写报名回执，并发送到邮箱<a href=\"mailto:444266481@qq.com\">444266481@qq.com</a></p>\n\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 附件：<a href=\"http://www.iiachina.org/upfiles/image/file/20160822/20160822090355_10409.xls\" target=\"_blank\">报名回执</a></p>\n\n<p style=\"text-align: right;\"><a href=\"http://www.iiachina.org/upfiles/image/file/20160822/20160822090355_10409.xls\" target=\"_blank\">宝安区科技创新服务中心</a></p>\n\n<p style=\"text-align: right;\"><a href=\"http://www.iiachina.org/upfiles/image/file/20160822/20160822090355_10409.xls\" target=\"_blank\">二〇一六年八月十八日</a></p>', '2017-07-12 00:55:32', '1', '2');
INSERT INTO `train` VALUES ('4', '关于开展宝安互联网产业基地宽带网络质量调查的通知', '<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<img alt=\"\" src=\"http://localhost:8081/editor/train/2/image/1499792176289.jpg\" style=\"height:242px; width:349px\" /></p>\n\n<p>&nbsp;</p>\n\n<p><strong>园区各有关企业：</strong></p>\n\n<p>宽带网络是支撑互联网企业发展的重要基础，为提升园区宽带网络质量，提高企业信息化效率，我协会开展对宝安互联网产业基地宽带网络质量进行抽样调查和意见收集工作。请各有关企业登录协会网站:<a href=\"http://www.iiachina.org/\">www.iiachina.org</a>&nbsp;认真填写《宝安互联网产业基地宽带网络质量调查表》并于9月15日前将调查表填好发送到邮箱:<a href=\"mailto:szbaiia@126.com\" target=\"_blank\">szbaiia@126.com</a>或纸质方式交回协会办公室，我会将调查结果统筹反映给相关部门及园区运营商。</p>\n\n<p>协会联系人：徐小姐&nbsp;13425134821&nbsp;0755-29128006</p>\n\n<p>协会地址：深圳市宝安区互联网产业基地A区5栋1楼</p>\n\n<p>附：<a href=\"http://www.iiachina.org/upfiles/image/file/20140829/20140829081951_43818.doc\" target=\"_blank\">《宝安互联网产业基地宽带网络质量调查表》</a></p>\n\n<p>深圳市宝安区互联网行业协会<br />\n2014年9月1日</p>\n\n<p><a href=\"http://www.iiachina.org/index.php/page-24-147.html#wfform\" id=\"showdiv\">在线填写调查表请点击：</a></p>', '2017-07-12 00:56:25', '1', '2');
