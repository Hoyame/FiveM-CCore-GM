-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 02 avr. 2020 à 13:15
-- Version du serveur :  10.4.10-MariaDB
-- Version de PHP :  7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `corazon`
--

-- --------------------------------------------------------

--
-- Structure de la table `players`
--

DROP TABLE IF EXISTS `players`;
CREATE TABLE IF NOT EXISTS `players` (
  `id` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `license` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `steam` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `live` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `xbox` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `discord` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `ban` int(10) NOT NULL DEFAULT 0,
  `firstConnection` int(11) NOT NULL DEFAULT 1,
  `charID` int(11) DEFAULT NULL,
  PRIMARY KEY (`license`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `players`
--

INSERT INTO `players` (`id`, `license`, `steam`, `live`, `xbox`, `discord`, `ban`, `firstConnection`, `charID`) VALUES
(NULL, 'license:0952c2029a28248d70dc879a193c1b91aa5475fe', NULL, NULL, NULL, NULL, 0, 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `players_d1_char`
--

DROP TABLE IF EXISTS `players_d1_char`;
CREATE TABLE IF NOT EXISTS `players_d1_char` (
  `license` varchar(50) NOT NULL,
  `lastPos` longtext DEFAULT NULL,
  `dataPed` longtext DEFAULT NULL,
  `dataSkin` longtext DEFAULT NULL,
  `pCash` int(11) NOT NULL DEFAULT 1000,
  `pBank` int(11) NOT NULL DEFAULT 500,
  `pDirty` int(11) NOT NULL DEFAULT 0,
  `pJob` varchar(50) DEFAULT NULL,
  `pJobGrade` longtext DEFAULT NULL,
  `sPerm` varchar(50) DEFAULT NULL,
  `iNom` varchar(50) DEFAULT NULL,
  `iLocation` varchar(100) DEFAULT NULL,
  `iDate` longtext DEFAULT NULL,
  `ipArme` int(11) NOT NULL DEFAULT 0,
  `ipTruck` int(11) NOT NULL DEFAULT 0,
  `ipCar` int(11) NOT NULL DEFAULT 0,
  `ipMotorbike` int(11) NOT NULL DEFAULT 0,
  `fNom` varchar(50) DEFAULT NULL,
  `fLocation` varchar(100) DEFAULT NULL,
  `fDate` longtext DEFAULT NULL,
  `fJob` varchar(50) DEFAULT NULL,
  `fpArme` int(11) NOT NULL DEFAULT 0,
  `fpTruck` int(11) NOT NULL DEFAULT 0,
  `fpCar` int(11) NOT NULL DEFAULT 0,
  `fpMotorbike` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`license`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `players_d1_char`
--

INSERT INTO `players_d1_char` (`license`, `lastPos`, `dataPed`, `dataSkin`, `pCash`, `pBank`, `pDirty`, `pJob`, `pJobGrade`, `sPerm`, `iNom`, `iLocation`, `iDate`, `ipArme`, `ipTruck`, `ipCar`, `ipMotorbike`, `fNom`, `fLocation`, `fDate`, `fJob`, `fpArme`, `fpTruck`, `fpCar`, `fpMotorbike`) VALUES
('license:0952c2029a28248d70dc879a193c1b91aa5475fe', '{334.4111328125, -1009.5668945313,  29.295711517334}', 'mp_m_freemode_01', '{\"blemishesStyle\":1,\"lipstickColorOne\":1,\"nosePeakLength\":0.01,\"complexionOpacity\":1,\"ageingOpacity\":1,\"faceMum\":5,\"jawBoneBackLength\":0.12,\"blemishesOpacity\":1,\"frecklesStyle\":1,\"beardStyle\":26,\"frecklesOpacity\":1,\"chimpBoneWidth\":0.17,\"faceDad\":2,\"beardOpacity\":1,\"makeupColorOne\":1,\"lipstickColorTwo\":1,\"makeupStyle\":1,\"complexionStyle\":1,\"noseWidth\":0.46,\"ressemblance\":0.55,\"makeupOpacity\":1,\"hairStyle\":47,\"nosePeaklowering\":0.01,\"cheeksBoneWidth\":1.0,\"hairColorTwo\":5,\"hairColorOne\":4,\"eyeOpening\":1.0,\"beardColorOne\":1,\"lipstickStyle\":1,\"ageingStyle\":1,\"cheeksBoneHeight\":0.4,\"beardColorTwo\":1,\"chimpBoneLowering\":0.17,\"noseBoneTwist\":0.08,\"lipstickOpacity\":1,\"skinAspectStyle\":1,\"chimpHole\":0.45,\"skinMix\":0.35,\"lipsThickness\":1.0,\"eyeStyle\":1,\"skinAspectOpacity\":1,\"eyebrowForward\":0.57,\"eyebrowHeight\":0.0,\"chimpBoneLength\":0.43,\"noseBoneHeight\":0.59}', 1000, 500, 0, NULL, NULL, NULL, 'Name', 'Blaine County', '03/06/1999', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `players_d2_char`
--

DROP TABLE IF EXISTS `players_d2_char`;
CREATE TABLE IF NOT EXISTS `players_d2_char` (
  `license` varchar(50) NOT NULL,
  `lastPos` longtext DEFAULT NULL,
  `dataPed` longtext DEFAULT NULL,
  `dataSkin` longtext DEFAULT NULL,
  `pCash` int(11) NOT NULL DEFAULT 1000,
  `pBank` int(11) NOT NULL DEFAULT 500,
  `pDirty` int(11) NOT NULL DEFAULT 0,
  `pJob` varchar(50) DEFAULT NULL,
  `pJobGrade` longtext DEFAULT NULL,
  `sPerm` varchar(50) DEFAULT NULL,
  `iNom` varchar(50) DEFAULT NULL,
  `iLocation` varchar(100) DEFAULT NULL,
  `iDate` longtext DEFAULT NULL,
  `ipArme` int(11) NOT NULL DEFAULT 0,
  `ipTruck` int(11) NOT NULL DEFAULT 0,
  `ipCar` int(11) NOT NULL DEFAULT 0,
  `ipMotorbike` int(11) NOT NULL DEFAULT 0,
  `fNom` varchar(50) DEFAULT NULL,
  `fLocation` varchar(100) DEFAULT NULL,
  `fDate` longtext DEFAULT NULL,
  `fJob` varchar(50) DEFAULT NULL,
  `fpArme` int(11) NOT NULL DEFAULT 0,
  `fpTruck` int(11) NOT NULL DEFAULT 0,
  `fpCar` int(11) NOT NULL DEFAULT 0,
  `fpMotorbike` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`license`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `players_d2_char`
--

INSERT INTO `players_d2_char` (`license`, `lastPos`, `dataPed`, `dataSkin`, `pCash`, `pBank`, `pDirty`, `pJob`, `pJobGrade`, `sPerm`, `iNom`, `iLocation`, `iDate`, `ipArme`, `ipTruck`, `ipCar`, `ipMotorbike`, `fNom`, `fLocation`, `fDate`, `fJob`, `fpArme`, `fpTruck`, `fpCar`, `fpMotorbike`) VALUES
('license:0952c2029a28248d70dc879a193c1b91aa5475fe', NULL, NULL, NULL, 1000, 500, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
