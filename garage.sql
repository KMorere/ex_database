-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 27 nov. 2025 à 13:57
-- Version du serveur : 8.4.7
-- Version de PHP : 8.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `garage`
--

-- --------------------------------------------------------

--
-- Structure de la table `g_article`
--

DROP TABLE IF EXISTS `g_article`;
CREATE TABLE IF NOT EXISTS `g_article` (
  `a_id` int NOT NULL AUTO_INCREMENT,
  `a_ref` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `a_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `a_marque` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `a_quantite` int NOT NULL,
  `a_prix` decimal(5,2) NOT NULL,
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `g_article`
--

INSERT INTO `g_article` (`a_id`, `a_ref`, `a_type`, `a_marque`, `a_quantite`, `a_prix`) VALUES
(1, '7CK215G', 'Filtre à air', 'VALEO', 119, 10.00),
(2, 'Q9DREJ6', 'Filtre à pollen', 'BOSCH', 51, 12.00),
(3, '7CK215G', 'Filtre à air', 'MAN FILTER', 11, 9.00),
(4, 'Q9DREJ6', 'Filtre à carburant', 'MAN FILTER', 77, 11.00),
(5, 'W7FGJ2S', 'Filtre à huile', 'BOSCH', 18, 13.00),
(6, 'S0PAHZF', 'Filtre à pollen', 'BOSCH', 149, 15.00),
(7, 'DBAYMQE', 'Filtre à pollen', 'BOSCH', 72, 17.00),
(8, '3XTBQ0F', 'Filtre à carburant', 'BOSCH', 27, 21.00),
(9, 'ZM3D8CY', 'Filtre à huile', 'MECAFILTER', 21, 8.00),
(10, '7I8BP13', 'Filtre à huile', 'MECAFILTER', 103, 7.00),
(11, '7I8BP13', 'Filtre à air', 'MECAFILTER', 103, 13.00),
(12, 'YPEWALU', 'Filtre à carburant', 'MECAFILTER', 66, 10.00),
(13, '958TEVW', 'Filtre à huile', 'PURFLUX', 65, 16.00),
(14, 'BK9P3DX', 'Filtre à pollen', 'PURFLUX', 38, 11.00),
(15, '1HRM0Q5', 'Filtre à air', 'PURFLUX', 76, 9.00),
(16, 'BP5D3IW', 'filtre à carburant', 'PURFLUX', 35, 12.00);

-- --------------------------------------------------------

--
-- Structure de la table `g_article_voiture`
--

DROP TABLE IF EXISTS `g_article_voiture`;
CREATE TABLE IF NOT EXISTS `g_article_voiture` (
  `voiture_id` int NOT NULL,
  `article_id` int NOT NULL,
  PRIMARY KEY (`voiture_id`,`article_id`),
  KEY `voiture_id` (`voiture_id`),
  KEY `article_id` (`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `g_article_voiture`
--

INSERT INTO `g_article_voiture` (`voiture_id`, `article_id`) VALUES
(20, 1),
(20, 2);

-- --------------------------------------------------------

--
-- Structure de la table `g_client`
--

DROP TABLE IF EXISTS `g_client`;
CREATE TABLE IF NOT EXISTS `g_client` (
  `c_id` int NOT NULL AUTO_INCREMENT,
  `c_nom` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `c_prenom` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `c_tel` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `c_adresse` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `g_client`
--

INSERT INTO `g_client` (`c_id`, `c_nom`, `c_prenom`, `c_tel`, `c_adresse`) VALUES
(1, 'Regorz', 'Constantin', '(724) 4757281', '14 Summer Ridge Point'),
(2, 'Williscroft', 'Kirk', '(581) 3577540', '5392 Northview Hill'),
(3, 'Kenion', 'Karry', '(766) 3677542', '5260 Dwight Crossing'),
(4, 'Tartt', 'Avis', '(537) 9136392', '6750 Fremont Junction'),
(5, 'Szepe', 'Isa', '(491) 7729484', '66151 Calypso Crossing'),
(6, 'Bradford', 'Albina', '(877) 6125949', '17352 Sloan Court'),
(7, 'Terren', 'Raven', '(128) 9742060', '6667 Homewood Circle'),
(8, 'Falck', 'Scarlett', '(627) 1226861', '71185 Crescent Oaks Place'),
(9, 'Fowgies', 'Den', '(393) 1707501', '336 Texas Pass'),
(10, 'Chastel', 'Crawford', '(942) 3897323', '10660 Eastlawn Trail');

-- --------------------------------------------------------

--
-- Structure de la table `g_facture`
--

DROP TABLE IF EXISTS `g_facture`;
CREATE TABLE IF NOT EXISTS `g_facture` (
  `f_id` int NOT NULL AUTO_INCREMENT,
  `f_total` int NOT NULL,
  `f_fk_o_id` int NOT NULL,
  `f_taux` int NOT NULL,
  PRIMARY KEY (`f_id`),
  KEY `o_fk` (`f_fk_o_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `g_facture`
--

INSERT INTO `g_facture` (`f_id`, `f_total`, `f_fk_o_id`, `f_taux`) VALUES
(1, 245, 1, 35),
(2, 70, 2, 35);

-- --------------------------------------------------------

--
-- Structure de la table `g_ordre`
--

DROP TABLE IF EXISTS `g_ordre`;
CREATE TABLE IF NOT EXISTS `g_ordre` (
  `o_id` int NOT NULL AUTO_INCREMENT,
  `o_date` datetime NOT NULL,
  `o_temps` int NOT NULL,
  `o_fk_c_id` int DEFAULT NULL,
  PRIMARY KEY (`o_id`),
  KEY `c_fk` (`o_fk_c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `g_ordre`
--

INSERT INTO `g_ordre` (`o_id`, `o_date`, `o_temps`, `o_fk_c_id`) VALUES
(1, '2023-02-14 00:00:00', 7, 1),
(2, '2023-02-16 00:00:00', 2, 2),
(3, '2023-07-17 00:00:00', 5, 1),
(4, '2024-02-14 00:00:00', 3, 3);

-- --------------------------------------------------------

--
-- Structure de la table `g_ordre_article`
--

DROP TABLE IF EXISTS `g_ordre_article`;
CREATE TABLE IF NOT EXISTS `g_ordre_article` (
  `ordre_id` int NOT NULL,
  `article_id` int NOT NULL,
  `a_quantite` smallint DEFAULT NULL,
  PRIMARY KEY (`article_id`,`ordre_id`),
  KEY `ordre_id` (`ordre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `g_ordre_article`
--

INSERT INTO `g_ordre_article` (`ordre_id`, `article_id`, `a_quantite`) VALUES
(1, 1, 1),
(3, 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `g_voiture`
--

DROP TABLE IF EXISTS `g_voiture`;
CREATE TABLE IF NOT EXISTS `g_voiture` (
  `v_id` int NOT NULL AUTO_INCREMENT,
  `v_marque` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `v_type` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `v_energie` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`v_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `g_voiture`
--

INSERT INTO `g_voiture` (`v_id`, `v_marque`, `v_type`, `v_energie`) VALUES
(20, 'FIAT', '500', 'ESSENCE'),
(21, 'TOYOTA', 'YARIS', 'DIESEL'),
(22, 'PEUGEOT', '208', 'ESSENCE');

-- --------------------------------------------------------

--
-- Structure de la table `g_voiture_client`
--

DROP TABLE IF EXISTS `g_voiture_client`;
CREATE TABLE IF NOT EXISTS `g_voiture_client` (
  `voiture_id` int NOT NULL,
  `client_id` int NOT NULL,
  `vc_plaque` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`voiture_id`,`client_id`),
  KEY `client_id` (`client_id`),
  KEY `voiture_id` (`voiture_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `g_voiture_client`
--

INSERT INTO `g_voiture_client` (`voiture_id`, `client_id`, `vc_plaque`) VALUES
(20, 1, 'AB12CDE'),
(21, 2, 'FG34HIJ');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `g_article_voiture`
--
ALTER TABLE `g_article_voiture`
  ADD CONSTRAINT `article_id` FOREIGN KEY (`article_id`) REFERENCES `g_article` (`a_id`),
  ADD CONSTRAINT `voiture_id` FOREIGN KEY (`voiture_id`) REFERENCES `g_voiture` (`v_id`);

--
-- Contraintes pour la table `g_facture`
--
ALTER TABLE `g_facture`
  ADD CONSTRAINT `o_fk` FOREIGN KEY (`f_fk_o_id`) REFERENCES `g_ordre` (`o_id`);

--
-- Contraintes pour la table `g_ordre`
--
ALTER TABLE `g_ordre`
  ADD CONSTRAINT `c_fk` FOREIGN KEY (`o_fk_c_id`) REFERENCES `g_client` (`c_id`);

--
-- Contraintes pour la table `g_ordre_article`
--
ALTER TABLE `g_ordre_article`
  ADD CONSTRAINT `g_ordre_article_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `g_article` (`a_id`),
  ADD CONSTRAINT `g_ordre_article_ibfk_2` FOREIGN KEY (`ordre_id`) REFERENCES `g_ordre` (`o_id`);

--
-- Contraintes pour la table `g_voiture_client`
--
ALTER TABLE `g_voiture_client`
  ADD CONSTRAINT `g_voiture_client_ibfk_1` FOREIGN KEY (`voiture_id`) REFERENCES `g_voiture` (`v_id`),
  ADD CONSTRAINT `g_voiture_client_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `g_client` (`c_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
