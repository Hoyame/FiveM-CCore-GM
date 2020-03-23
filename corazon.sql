-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  lun. 23 mars 2020 à 22:21
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
-- Structure de la table `joueurs`
--

DROP TABLE IF EXISTS `joueurs`;
CREATE TABLE IF NOT EXISTS `joueurs` (
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
-- Déchargement des données de la table `joueurs`
--

INSERT INTO `joueurs` (`id`, `license`, `steam`, `live`, `xbox`, `discord`, `ban`, `firstConnection`, `charID`) VALUES
(NULL, 'license:0952c2029a28248d70dc879a193c1b91aa5475fe', NULL, NULL, NULL, NULL, 0, 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `joueurs_d1_perso`
--

DROP TABLE IF EXISTS `joueurs_d1_perso`;
CREATE TABLE IF NOT EXISTS `joueurs_d1_perso` (
  `license` varchar(50) NOT NULL,
  `lastPos` longtext DEFAULT NULL,
  `dataPed` longtext DEFAULT NULL,
  `dataSkin` longtext DEFAULT NULL,
  `pEspece` int(11) NOT NULL DEFAULT 1000,
  `pBanque` int(11) NOT NULL DEFAULT 500,
  `pSale` int(11) NOT NULL DEFAULT 0,
  `pJob` varchar(50) DEFAULT NULL,
  `sPerm` varchar(50) DEFAULT NULL,
  `iNom` varchar(50) DEFAULT NULL,
  `iLieu` varchar(100) DEFAULT NULL,
  `iDate` longtext DEFAULT NULL,
  `ipArme` int(11) NOT NULL DEFAULT 0,
  `ipCamion` int(11) NOT NULL DEFAULT 0,
  `ipVoiture` int(11) NOT NULL DEFAULT 0,
  `ipMoto` int(11) NOT NULL DEFAULT 0,
  `fNom` varchar(50) DEFAULT NULL,
  `fLieu` varchar(100) DEFAULT NULL,
  `fDate` longtext DEFAULT NULL,
  `fJob` varchar(50) DEFAULT NULL,
  `fpArme` int(11) NOT NULL DEFAULT 0,
  `fpCamion` int(11) NOT NULL DEFAULT 0,
  `fpVoiture` int(11) NOT NULL DEFAULT 0,
  `fpMoto` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`license`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `joueurs_d1_perso`
--

INSERT INTO `joueurs_d1_perso` (`license`, `lastPos`, `dataPed`, `dataSkin`, `pEspece`, `pBanque`, `pSale`, `pJob`, `sPerm`, `iNom`, `iLieu`, `iDate`, `ipArme`, `ipCamion`, `ipVoiture`, `ipMoto`, `fNom`, `fLieu`, `fDate`, `fJob`, `fpArme`, `fpCamion`, `fpVoiture`, `fpMoto`) VALUES
('license:0952c2029a28248d70dc879a193c1b91aa5475fe', '{356.83120727539, -998.85699462891,  29.412805557251}', 'mp_m_freemode_01', '{\"chimpBoneLength\":0.55,\"beardOpacity\":1.0,\"eyebrowForward\":0.8,\"noseWidth\":0.73,\"complexionStyle\":1,\"lipstickOpacity\":1,\"chimpBoneWidth\":0.18,\"makeupOpacity\":1,\"eyeStyle\":1,\"ressemblance\":0.72,\"ageingStyle\":1,\"beardStyle\":1,\"nosePeaklowering\":0.1,\"hairStyle\":47,\"hairColorTwo\":5,\"blemishesOpacity\":1,\"lipsThickness\":1,\"skinAspectStyle\":1,\"nosePeakLength\":0.96,\"frecklesOpacity\":1,\"lipstickColorTwo\":1,\"beardColorTwo\":1,\"chimpHole\":0.68,\"cheeksBoneWidth\":0.93,\"faceMum\":4,\"hairColorOne\":3,\"complexionOpacity\":1,\"blemishesStyle\":1,\"skinMix\":0.17,\"makeupStyle\":1,\"skinAspectOpacity\":1,\"makeupColorOne\":1,\"noseBoneTwist\":0.01,\"noseBoneHeight\":0.72,\"jawBoneBackLength\":0.85,\"ageingOpacity\":1,\"lipstickColorOne\":1,\"frecklesStyle\":1,\"cheeksBoneHeight\":0.68,\"beardColorOne\":1,\"chimpBoneLowering\":0.96,\"lipstickStyle\":1,\"eyebrowHeight\":0.99,\"faceDad\":3,\"eyeOpening\":0.02}', 1000, 500, 0, NULL, NULL, 'Czon', 'Blaine County', '03/06/1999', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `joueurs_d2_perso`
--

DROP TABLE IF EXISTS `joueurs_d2_perso`;
CREATE TABLE IF NOT EXISTS `joueurs_d2_perso` (
  `license` varchar(50) NOT NULL,
  `lastPos` longtext DEFAULT NULL,
  `dataPed` longtext DEFAULT NULL,
  `dataSkin` longtext DEFAULT NULL,
  `pEspece` int(11) NOT NULL DEFAULT 1000,
  `pBanque` int(11) NOT NULL DEFAULT 500,
  `pSale` int(11) NOT NULL DEFAULT 0,
  `pJob` varchar(50) DEFAULT NULL,
  `sPerm` varchar(50) DEFAULT NULL,
  `iNom` varchar(50) DEFAULT NULL,
  `iLieu` varchar(100) DEFAULT NULL,
  `iDate` longtext DEFAULT NULL,
  `ipArme` int(11) NOT NULL DEFAULT 0,
  `ipCamion` int(11) NOT NULL DEFAULT 0,
  `ipVoiture` int(11) NOT NULL DEFAULT 0,
  `ipMoto` int(11) NOT NULL DEFAULT 0,
  `fNom` varchar(50) DEFAULT NULL,
  `fLieu` varchar(100) DEFAULT NULL,
  `fDate` longtext DEFAULT NULL,
  `fJob` varchar(50) DEFAULT NULL,
  `fpArme` int(11) NOT NULL DEFAULT 0,
  `fpCamion` int(11) NOT NULL DEFAULT 0,
  `fpVoiture` int(11) NOT NULL DEFAULT 0,
  `fpMoto` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`license`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `joueurs_d2_perso`
--

INSERT INTO `joueurs_d2_perso` (`license`, `lastPos`, `dataPed`, `dataSkin`, `pEspece`, `pBanque`, `pSale`, `pJob`, `sPerm`, `iNom`, `iLieu`, `iDate`, `ipArme`, `ipCamion`, `ipVoiture`, `ipMoto`, `fNom`, `fLieu`, `fDate`, `fJob`, `fpArme`, `fpCamion`, `fpVoiture`, `fpMoto`) VALUES
('license:0952c2029a28248d70dc879a193c1b91aa5475fe', NULL, NULL, NULL, 1000, 500, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
