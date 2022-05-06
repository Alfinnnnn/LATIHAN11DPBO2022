/*
Navicat MySQL Data Transfer

Source Server         : MyKoneksi
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : db_lp11

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2022-05-06 23:17:54
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `author`
-- ----------------------------
DROP TABLE IF EXISTS `author`;
CREATE TABLE `author` (
  `id_author` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`id_author`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of author
-- ----------------------------
INSERT INTO `author` VALUES ('1', 'Richard Adkins', 'Senior');
INSERT INTO `author` VALUES ('2', 'Pein Akatsuki', 'Senior');
INSERT INTO `author` VALUES ('4', 'Ken Northwood', 'Pendatang Baru');
INSERT INTO `author` VALUES ('5', 'ad', 'Pendatang Baru');
INSERT INTO `author` VALUES ('6', 'Marchella FP', 'Senior');

-- ----------------------------
-- Table structure for `buku`
-- ----------------------------
DROP TABLE IF EXISTS `buku`;
CREATE TABLE `buku` (
  `id_buku` int(11) NOT NULL AUTO_INCREMENT,
  `judul_buku` varchar(100) NOT NULL,
  `penerbit` varchar(100) NOT NULL,
  `deskripsi` text NOT NULL,
  `status` varchar(50) NOT NULL,
  `id_author` int(11) NOT NULL,
  PRIMARY KEY (`id_buku`),
  KEY `id_author` (`id_author`),
  CONSTRAINT `buku_ibfk_1` FOREIGN KEY (`id_author`) REFERENCES `author` (`id_author`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of buku
-- ----------------------------
INSERT INTO `buku` VALUES ('1', 'Alan Wade', 'Premium #', 'Cerita dibalik cerita', 'Best Seller', '2');
INSERT INTO `buku` VALUES ('2', 'Awan', 'Akamedia', 'buku tentang cerita awan, hujan, langit', 'Best Seller', '1');
INSERT INTO `buku` VALUES ('4', 'Puisi Patrick Star', 'Patrick', 'mawar itu biru, violet itu merah', '-', '2');
INSERT INTO `buku` VALUES ('5', 'NKCTHI', 'GRAMEDIA', 'Cerita hidup Awan', '-', '6');

-- ----------------------------
-- Table structure for `member`
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `nim` varchar(50) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jurusan` varchar(100) NOT NULL,
  PRIMARY KEY (`nim`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('2001521', 'Surya', 'Ilmu Komedi');
INSERT INTO `member` VALUES ('2001522', 'Alfin', 'Filsafat membathin');
