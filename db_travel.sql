/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : db_travel

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2019-04-02 13:40:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for buyticket
-- ----------------------------
DROP TABLE IF EXISTS `buyticket`;
CREATE TABLE `buyticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `uid` int(11) DEFAULT NULL COMMENT '会员id',
  `sid` varchar(255) DEFAULT NULL COMMENT '预定地点',
  `num` int(11) DEFAULT NULL COMMENT '数量',
  `price` int(11) DEFAULT NULL COMMENT '总价',
  `check` int(11) DEFAULT NULL COMMENT '审核（未审核0，通过1，不通过2）',
  `fenlei` varchar(255) DEFAULT NULL COMMENT '分类',
  `sdate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of buyticket
-- ----------------------------
INSERT INTO `buyticket` VALUES ('24', '5', '孝感自家旅馆1', '2', '146', '1', '酒店', '2019-02-14');
INSERT INTO `buyticket` VALUES ('25', '5', '武汉万达汉秀', '5', '1095', '1', '景点', '2019-02-14');
INSERT INTO `buyticket` VALUES ('26', '5', '武汉海昌极地海洋世界', '2', '300', '1', '景点', '2019-02-14');
INSERT INTO `buyticket` VALUES ('27', '2', '武汉万达汉秀', '2', '438', '0', '景点', '2019-03-26');
INSERT INTO `buyticket` VALUES ('28', '2', '水乡风情线', '2', '1600', '1', '线路', '2019-04-02');

-- ----------------------------
-- Table structure for feedback
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `fback` varchar(2550) DEFAULT NULL COMMENT '反馈',
  `pid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL COMMENT '用户id',
  `ftime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of feedback
-- ----------------------------
INSERT INTO `feedback` VALUES ('1', '没有意见', '3', '5', '2019-03-26 14:00:00');

-- ----------------------------
-- Table structure for feiyong
-- ----------------------------
DROP TABLE IF EXISTS `feiyong`;
CREATE TABLE `feiyong` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `uid` int(11) DEFAULT NULL COMMENT '用户id',
  `feiyong` decimal(10,2) DEFAULT NULL COMMENT '费用',
  `ftime` varchar(255) DEFAULT NULL COMMENT '时间',
  `content` varchar(255) DEFAULT NULL COMMENT '费用项目',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of feiyong
-- ----------------------------
INSERT INTO `feiyong` VALUES ('1', '2', '300.00', '2019-04-02 13:30:55', '门票');
INSERT INTO `feiyong` VALUES ('4', '2', '300.00', '2019-04-02 13:36:16', 'wan');

-- ----------------------------
-- Table structure for food
-- ----------------------------
DROP TABLE IF EXISTS `food`;
CREATE TABLE `food` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `intro` text COMMENT '介绍',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `img1` varchar(255) DEFAULT NULL COMMENT '图片',
  `img2` varchar(255) DEFAULT NULL COMMENT '图片',
  `img3` varchar(255) DEFAULT NULL COMMENT '图片',
  `isdel` int(11) DEFAULT NULL COMMENT '删除标记  0 / 1',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `coordinate` varchar(255) DEFAULT NULL COMMENT '坐标',
  `price` double(11,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of food
-- ----------------------------
INSERT INTO `food` VALUES ('1', '无与伦比的用餐环境——仿佛在水族馆里用餐', '七钻帆船酒店AL MAHARA 海底餐厅——午/晚餐', 'food01.jpg', 'food02.jpg', 'food03.jpg', '0', '迪拜卓美亚帆船酒店G层,即地下一层，乘坐电梯可直达', '114.310545,30.596439', '219.00');
INSERT INTO `food` VALUES ('2', '地处绝佳位置，享受超高性价比，让味蕾环游世界！', '澳门金沙888拉斯维加斯美食天地自助餐（午餐/晚餐）', 'food04.jpg', 'food05.jpg', 'food06.jpg', '0', '澳门友谊马路金沙娱乐场(孙逸仙大马路口) 金沙2楼 ', '113.950248,30.922124', '150.00');
INSERT INTO `food` VALUES ('3', '高端酒店餐厅用餐环境优雅高贵，服务周到，海鲜食材新鲜，高级厨师料理的烤龙虾，还有现场音乐表演，让您畅享浪漫的越南海鲜和越南美食！', '【超高品质】芽庄洲际酒店自助海鲜晚餐（含烤龙虾）', 'food07.jpg', 'food08.jpg', 'food09.jpg', '0', '芽庄洲际酒店InterContinental Nha Trang', '113.938528,30.915272', '73.00');

-- ----------------------------
-- Table structure for grogshop
-- ----------------------------
DROP TABLE IF EXISTS `grogshop`;
CREATE TABLE `grogshop` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `intro` text COMMENT '身份（管理员0，前台1，会员2）',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `img1` varchar(255) DEFAULT NULL COMMENT '图片',
  `img2` varchar(255) DEFAULT NULL COMMENT '图片',
  `img3` varchar(255) DEFAULT NULL COMMENT '图片',
  `isdel` int(11) DEFAULT NULL COMMENT '删除标记  0 / 1',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `coordinate` varchar(255) DEFAULT NULL COMMENT '坐标',
  `price` double(11,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of grogshop
-- ----------------------------
INSERT INTO `grogshop` VALUES ('1', '温馨提示：2019武汉马拉松定于4月9日（星期日）举行，江城明珠豪生大酒店正位于沿江大道赛道上，接市政府通知在4月8日22时-4月9日赛事结束期间，对赛事道路实施交通管制措施。建议在此期间有订房的客人尽量提前安排行程，如遇任何出入相关问题，可拨打027-82776666提前联系酒店，酒店工作人员将进行指引和迎接。上述信息如有变化，我们将及时更新通知！武汉江城明珠豪生大酒店拥有全武汉最具特色的金色球顶。地处美丽的汉口江滩，与武汉市政府为邻，距离汉口最繁华的金融商业圈和娱乐中心仅咫尺之遥。设备完好、格局典雅的客房，大部分都可以饱览长江美景。酒店11间设施完备的多功能会议室，配备一流的影音设备，能够满足各种会议需求。两间最大的宴会厅分别位于酒店5楼和6楼，拥有落地式玻璃窗，美丽江景一览无余，最多可容纳900人同时进行会议。酒店拥有7间各具特色的中、西、泰式餐厅及酒廊，使之成为武汉用餐场所的理想选择。位于大堂的维也纳咖啡厅，提供正宗的维也纳美食；2楼环球自助餐厅每日提供午间商务套餐和自助晚餐，款款均由餐厅大厨精心烹饪；4楼明珠食府用餐环境古色古香、隽永高雅，拥有各色江景包房7间，是一所综合视觉与味觉的双重感官享受的精品中餐厅；39楼的空中酒廊是宾客繁忙过后理想的消遣之所；泰国金兰花皇家旋转餐厅位于酒店41楼，在宾客俯瞰长江和全城美景的同时，还可尽情享用最地道的泰国风味菜肴、海鲜及烤肉。酒店开业时间2006年5月，楼高43层，客房总数393间（套）。', '武汉江城明珠豪生大酒店', 'juidian01.jpg', 'juidian02.jpg', 'juidian03.jpg', '0', '沿江大道182号距离大智路地铁站1.0公里,步行至此1.5公里', '114.310545,30.596439', '219.00');
INSERT INTO `grogshop` VALUES ('2', ' 2019年开业 酒店 0712-5555555  预订电话 4007-777-777', '孝感乾坤国际大酒店', 'juidian04.jpg', 'juidian05.jpg', 'juidian06.jpg', '0', '乾坤大道9号距离槐荫公园0.4公里,步行至此0.5公里', '113.950248,30.922124', '150.00');
INSERT INTO `grogshop` VALUES ('3', '自家旅馆位于孝感市槐荫大道特12 号汽车站出口东侧100米，靠近汽车站，与湖北职业技术学院相隔1000米，地理位置优越，交通便利。宾馆装修风格简约，舒适如家，以经济型的价格，周到的服务，热诚欢迎您的光临。本店WIFI已全面覆盖，热水24小时供应，设有迷你单间，小单间，标准单间大床房，标准双人间，每个房间都有独立的卫生间。注：特价房不含空调。可以给入住本店的客人提供正规的机打发票。', '孝感自家旅馆1', 'juidian07.jpg', 'juidian08.jpg', 'juidian09.jpg', '0', '孝感市槐荫大道汽车站出口右侧100米距离董永公园1.7公里', '113.938528,30.915272', '73.00');

-- ----------------------------
-- Table structure for pricture
-- ----------------------------
DROP TABLE IF EXISTS `pricture`;
CREATE TABLE `pricture` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `userid` int(11) DEFAULT NULL COMMENT '用户id',
  `img` varchar(255) DEFAULT NULL COMMENT '图片',
  `describe` text COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pricture
-- ----------------------------
INSERT INTO `pricture` VALUES ('3', '标题1', '5', 'pri20180526163838466.jpg', '还在吃炸鸡');
INSERT INTO `pricture` VALUES ('5', '标题2', '6', 'pri20180526164122158.jpg', '接着吃炸鸡');

-- ----------------------------
-- Table structure for recreation
-- ----------------------------
DROP TABLE IF EXISTS `recreation`;
CREATE TABLE `recreation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `intro` text COMMENT '身份（管理员0，前台1，会员2）',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `img1` varchar(255) DEFAULT NULL COMMENT '图片',
  `img2` varchar(255) DEFAULT NULL COMMENT '图片',
  `img3` varchar(255) DEFAULT NULL COMMENT '图片',
  `isdel` int(11) DEFAULT NULL COMMENT '删除标记  0 / 1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of recreation
-- ----------------------------
INSERT INTO `recreation` VALUES ('1', '①武汉欢乐谷实行“一票通玩”制，园区餐饮、交通及投币游戏等需要另外付费;\r\n②游客每人限享受一种优惠政策,拥有享受多重折扣资格的,按最低折扣计算优惠票入园。1.1米（不含1.1米）以下儿童、65周岁（含65周岁）以上长者、残疾人入园须有安全监护能力的购票成人陪同入园。\r\n③门票当天有效，出园需入园，需再次购票;\r\n④学生票适用人群为全日制统招大学生，入园时需要携带本人学生证;\r\n⑤为保证取票、入园顺利，预订时请务必填写真实姓名、手机号码等信息;\r\n⑥景区所有项目均会定期进行日检、周检、月检和年度检修，相关检修工作可能会造成部分项目运行时间的延迟或暂停对游客开放，详情以出游当天景区现场公告为准；\r\n⑦在不能满足设备安全运行的恶劣天气，无法抗拒的自然灾害情况下（如雷电、雨雪、冰雹、大雾、暴雨、台风等），景区设备将临时关闭或部分关闭，由此造成的不可游玩敬请谅解；\r\n⑧为了您的游玩安全：园内部分项目不适合高血压、心脏病患者、颈椎背部疾病患者、饮酒过度者、孕妇等人群游玩；部分项目对参与游客的身高、腰围、体重等设有要求限制，有上述病情、症状或限制者，为了您的人身安全，请遵守景区现场规定，且自行确认并选择自己适合的安全项目游玩。\r\n备注：全网每天一个身份证可以预订5张票，儿童票预订可输入大人的身份证号码。', '武汉欢乐谷特价活动', 'yule01.jpg', 'yule02.jpg', 'yule03.jpg', '0');

-- ----------------------------
-- Table structure for scenicspot
-- ----------------------------
DROP TABLE IF EXISTS `scenicspot`;
CREATE TABLE `scenicspot` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `intro` text COMMENT '身份（管理员0，前台1，会员2）',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `price` double(11,2) DEFAULT NULL,
  `tnum` int(11) DEFAULT NULL COMMENT '票数上限',
  `img1` varchar(255) DEFAULT NULL COMMENT '图片',
  `img2` varchar(255) DEFAULT NULL COMMENT '图片',
  `img3` varchar(255) DEFAULT NULL COMMENT '图片',
  `srr` text COMMENT '路线图',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `coordinate` varchar(255) DEFAULT NULL COMMENT '坐标',
  `dianji` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of scenicspot
-- ----------------------------
INSERT INTO `scenicspot` VALUES ('1', '有时候，一眼决定了一生。汉秀，就是如此。', '武汉万达汉秀', '219.00', '95', 'jingdian01.jpg', 'jingdian02.jpg', 'jingdian03.jpg', '无', '湖北省武汉武昌万达中央文化区', '114.354166,30.558081', '8');
INSERT INTO `scenicspot` VALUES ('2', '游走海底隧道，寻找海底两万里', '武汉海昌极地海洋世界', '150.00', '16', 'jingdian04.jpg', 'jingdian05.jpg', 'jingdian06.jpg', '1）表演类：\r\n美人鱼：10:00、14:30；\r\n欢乐秀场：10:30、13:00、15:50；\r\n海洋剧场：11:30、15:00；\r\n2）科普类：\r\n北极熊展馆：10:00、14:00；\r\n企鹅展馆：10:15、15:15；\r\n海象展馆：11:10、13:40；\r\n极地课堂：9:40、13:05；\r\n海洋讲解：12:10、15:40。\r\n【周末及节假日】时间如下：\r\n1）表演类：\r\n美人鱼：10:00、12:30、15:00；\r\n欢乐秀场：10:30、13:00、15:20；\r\n海洋剧场：11:30、14:00、16:00；\r\n2）科普类：\r\n北极熊展馆：10:00、14:00；\r\n企鹅展馆：10:15、15:15；\r\n海象展馆：11:10、13:40；\r\n极地课堂：9:40、13:05；\r\n海洋讲解：12:10、14:40；', '湖北省武汉市东西湖区金银谭大道96号', '114.285587,30.669357', '3');

-- ----------------------------
-- Table structure for tuan
-- ----------------------------
DROP TABLE IF EXISTS `tuan`;
CREATE TABLE `tuan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `nums` int(11) DEFAULT NULL,
  `cnums` int(11) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  `isdel` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tuan
-- ----------------------------

-- ----------------------------
-- Table structure for tuanxi
-- ----------------------------
DROP TABLE IF EXISTS `tuanxi`;
CREATE TABLE `tuanxi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tuanxi
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `username` varchar(255) NOT NULL COMMENT '账号',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `role` int(11) NOT NULL COMMENT '身份（管理员0，前台1，会员2）',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `sex` int(11) DEFAULT NULL COMMENT '性别（男0，女1）',
  `phone` varchar(255) DEFAULT NULL COMMENT '电话',
  `idcard` varchar(255) DEFAULT NULL COMMENT '身份证',
  `isdel` int(11) DEFAULT NULL COMMENT '删除标记  0 / 1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '123', '0', '张三丰', '1', '13572233900', '611112198801223011', '0');
INSERT INTO `user` VALUES ('2', 'u1', '123', '1', '李四一', '1', '13572233900', '611112198801223011', '0');
INSERT INTO `user` VALUES ('5', 'u2', '123', '1', '张三', '1', '13678909854', '111111111111111111', '0');
INSERT INTO `user` VALUES ('6', 'u3', '123', '1', '李四', '1', '13811111111', '111111111111111111', '0');
INSERT INTO `user` VALUES ('12', 'u4', '111', '1', '444', '1', '13456789093', '123456789098767890', '0');

-- ----------------------------
-- Table structure for xianlu
-- ----------------------------
DROP TABLE IF EXISTS `xianlu`;
CREATE TABLE `xianlu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `intro` varchar(255) DEFAULT NULL COMMENT '介绍',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `tnum` int(11) DEFAULT NULL COMMENT '票数',
  `img1` varchar(255) DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xianlu
-- ----------------------------
INSERT INTO `xianlu` VALUES ('1', '水乡风情线', '水乡风情线', '800.00', '200', 'pri20190402125747332.jpg');
