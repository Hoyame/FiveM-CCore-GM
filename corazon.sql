-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u8
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Mar 17 Mars 2020 à 22:23
-- Version du serveur :  10.0.38-MariaDB-0+deb8u1
-- Version de PHP :  5.6.40-0+deb8u9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `corazon`
--

-- --------------------------------------------------------

--
-- Structure de la table `joueurs`
--

CREATE TABLE IF NOT EXISTS `joueurs` (
  `id` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `license` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `steam` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `live` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `xbox` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `discord` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `ban` int(10) NOT NULL DEFAULT '0',
  `firstConnection` int(11) NOT NULL DEFAULT '1',
  `charID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Contenu de la table `joueurs`
--

INSERT INTO `joueurs` (`id`, `license`, `steam`, `live`, `xbox`, `discord`, `ban`, `firstConnection`, `charID`) VALUES
(NULL, 'license:0952c2029a28248d70dc879a193c1b91aa5475fe', NULL, NULL, NULL, NULL, 0, 0, 1),
(NULL, 'license:1d5591181278673b68b3d603a21df06d4d9fe53b', NULL, NULL, NULL, NULL, 0, 0, 1),
(NULL, 'license:cb64c910611849d02fe63cb6bea50c7d21227d39', NULL, NULL, NULL, NULL, 0, 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `joueurs_d1_perso`
--

CREATE TABLE IF NOT EXISTS `joueurs_d1_perso` (
  `license` varchar(50) NOT NULL,
  `dataPed` longtext,
  `dataSkin` longtext,
  `pEspece` int(11) NOT NULL DEFAULT '1000',
  `pBanque` int(11) NOT NULL DEFAULT '500',
  `pSale` int(11) NOT NULL DEFAULT '0',
  `pJob` varchar(50) DEFAULT NULL,
  `sPerm` varchar(50) DEFAULT NULL,
  `iNom` varchar(50) DEFAULT NULL,
  `iLieu` varchar(100) DEFAULT NULL,
  `iJour` int(11) DEFAULT NULL,
  `iMois` varchar(50) DEFAULT NULL,
  `iAnnée` int(11) DEFAULT NULL,
  `ipArme` int(11) NOT NULL DEFAULT '0',
  `ipCamion` int(11) NOT NULL DEFAULT '0',
  `ipVoiture` int(11) NOT NULL DEFAULT '0',
  `ipMoto` int(11) NOT NULL DEFAULT '0',
  `fNom` varchar(50) DEFAULT NULL,
  `fLieu` varchar(100) DEFAULT NULL,
  `fJour` int(11) DEFAULT NULL,
  `fMois` varchar(50) DEFAULT NULL,
  `fAnnée` int(11) DEFAULT NULL,
  `fJob` varchar(50) DEFAULT NULL,
  `fpArme` int(11) NOT NULL DEFAULT '0',
  `fpCamion` int(11) NOT NULL DEFAULT '0',
  `fpVoiture` int(11) NOT NULL DEFAULT '0',
  `fpMoto` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `joueurs_d1_perso`
--

INSERT INTO `joueurs_d1_perso` (`license`, `dataPed`, `dataSkin`, `pEspece`, `pBanque`, `pSale`, `pJob`, `sPerm`, `iNom`, `iLieu`, `iJour`, `iMois`, `iAnnée`, `ipArme`, `ipCamion`, `ipVoiture`, `ipMoto`, `fNom`, `fLieu`, `fJour`, `fMois`, `fAnnée`, `fJob`, `fpArme`, `fpCamion`, `fpVoiture`, `fpMoto`) VALUES
('license:cb64c910611849d02fe63cb6bea50c7d21227d39', NULL, '{"torso_1":0,"watches_1":-1,"helmet_2":-1,"complexion_2":1,"beard_3":3,"face":8,"arms_2":0,"chain_2":0,"glasses_2":0,"hair_1":21,"ears_1":-1,"torso_2":0,"tshirt_1":0,"eyebrows_1":19,"hair_2":0,"beard_4":3,"watches_2":-1,"pants_2":0,"hair_color_2":3,"skin":8,"shoes_1":0,"chain_1":0,"tshirt_2":0,"ears_2":-1,"beard_1":2,"shoes_2":0,"sex":0,"glasses_1":0,"helmet_1":-1,"pants_1":0,"hair_color_1":3,"arms":0,"moles_2":1,"eye_color":8}', 1000, 500, 0, NULL, NULL, 'NOS', 'Los Santos', 27, 'Octobre', 1992, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0),
('license:0952c2029a28248d70dc879a193c1b91aa5475fe', NULL, NULL, 1000, 500, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `joueurs_d2_perso`
--

CREATE TABLE IF NOT EXISTS `joueurs_d2_perso` (
  `license` varchar(50) NOT NULL,
  `dataPed` longtext,
  `dataSkin` longtext,
  `pEspece` int(11) NOT NULL DEFAULT '1000',
  `pBanque` int(11) NOT NULL DEFAULT '500',
  `pSale` int(11) NOT NULL DEFAULT '0',
  `pJob` varchar(50) DEFAULT NULL,
  `sPerm` varchar(50) DEFAULT NULL,
  `iNom` varchar(50) DEFAULT NULL,
  `iLieu` varchar(100) DEFAULT NULL,
  `iJour` int(11) DEFAULT NULL,
  `iMois` varchar(50) DEFAULT NULL,
  `iAnnée` int(11) DEFAULT NULL,
  `ipArme` int(11) NOT NULL DEFAULT '0',
  `ipCamion` int(11) NOT NULL DEFAULT '0',
  `ipVoiture` int(11) NOT NULL DEFAULT '0',
  `ipMoto` int(11) NOT NULL DEFAULT '0',
  `fNom` varchar(50) DEFAULT NULL,
  `fLieu` varchar(100) DEFAULT NULL,
  `fJour` int(11) DEFAULT NULL,
  `fMois` varchar(50) DEFAULT NULL,
  `fAnnée` int(11) DEFAULT NULL,
  `fJob` varchar(50) DEFAULT NULL,
  `fpArme` int(11) NOT NULL DEFAULT '0',
  `fpCamion` int(11) NOT NULL DEFAULT '0',
  `fpVoiture` int(11) NOT NULL DEFAULT '0',
  `fpMoto` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `joueurs_d2_perso`
--

INSERT INTO `joueurs_d2_perso` (`license`, `dataPed`, `dataSkin`, `pEspece`, `pBanque`, `pSale`, `pJob`, `sPerm`, `iNom`, `iLieu`, `iJour`, `iMois`, `iAnnée`, `ipArme`, `ipCamion`, `ipVoiture`, `ipMoto`, `fNom`, `fLieu`, `fJour`, `fMois`, `fAnnée`, `fJob`, `fpArme`, `fpCamion`, `fpVoiture`, `fpMoto`) VALUES
('license:cb64c910611849d02fe63cb6bea50c7d21227d39', NULL, NULL, 1000, 500, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0),
('license:0952c2029a28248d70dc879a193c1b91aa5475fe', NULL, NULL, 1000, 500, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `joueurs`
--
ALTER TABLE `joueurs`
 ADD PRIMARY KEY (`license`);

--
-- Index pour la table `joueurs_d1_perso`
--
ALTER TABLE `joueurs_d1_perso`
 ADD PRIMARY KEY (`license`);

--
-- Index pour la table `joueurs_d2_perso`
--
ALTER TABLE `joueurs_d2_perso`
 ADD PRIMARY KEY (`license`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
