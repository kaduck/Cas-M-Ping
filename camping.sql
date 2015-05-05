-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mer 29 Avril 2015 à 22:57
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `camping`
--

-- --------------------------------------------------------

--
-- Structure de la table `caravan`
--

CREATE TABLE IF NOT EXISTS `caravan` (
  `car_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'caravans id name',
  `car_society_name` varchar(20) NOT NULL COMMENT 'society name who rent caravans',
  `car_price` double NOT NULL COMMENT 'caravans_price',
  `car_nb_person` int(11) NOT NULL COMMENT 'the number of person who can live into the caravan',
  `car_id_location` int(11) NOT NULL COMMENT 'location number where the caravans was rented',
  PRIMARY KEY (`car_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Contenu de la table `caravan`
--

INSERT INTO `caravan` (`car_id`, `car_society_name`, `car_price`, `car_nb_person`, `car_id_location`) VALUES
(5, 'zob', 545, 12, 1),
(6, 'pignouf', 444, 12, 22),
(7, 'glandu', 777, 7, 2);

-- --------------------------------------------------------

--
-- Structure de la table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `cust_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'customer''s ID ',
  `cust_name` varchar(15) NOT NULL COMMENT 'customer''s name',
  `cust_address` varchar(255) NOT NULL COMMENT 'customer''s address',
  `cust_postal_code` varchar(10) NOT NULL COMMENT 'customer''s postal code',
  `cust_city` varchar(20) NOT NULL COMMENT 'customer''s city',
  `cust_phone_number` varchar(13) NOT NULL COMMENT 'customer''s phone number',
  `cust_record_number` varchar(15) NOT NULL COMMENT 'customer''s record number',
  PRIMARY KEY (`cust_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `customer`
--

INSERT INTO `customer` (`cust_id`, `cust_name`, `cust_address`, `cust_postal_code`, `cust_city`, `cust_phone_number`, `cust_record_number`) VALUES
(1, 'henrui', '9 res face nord', '31841', 'townToons', '+33561070707', 'B55A-C'),
(2, 'Faufifonfec', '15 régiment de Nabo le liech ', '88756', 'chtimis', '069698985', 'AB5-66Z'),
(3, 'Naboléon', '35 rue du grand grand', '78965', 'vieniVicci', '456123542', 'BBBBBBB-1'),
(4, 'Supositwar', 'Dans ton *** ', '1111111', 'Rect***', '7878452654', 'BI*E'),
(5, 'Huntermarché', 'ça pu des pieds', '87985', 'vanerque', '15678921', 'BEDEAU'),
(6, 'Jackcélerre ', 'Avenus susain bold', 'tombouctou', 'pipout', '654456654', '007');

-- --------------------------------------------------------

--
-- Structure de la table `link_car_location`
--

CREATE TABLE IF NOT EXISTS `link_car_location` (
  `lcl_car_id` int(11) NOT NULL,
  `lcl_rent_id` int(11) NOT NULL,
  PRIMARY KEY (`lcl_car_id`,`lcl_rent_id`),
  KEY `lcl_rend_constraint` (`lcl_rent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `link_rent_rental`
--

CREATE TABLE IF NOT EXISTS `link_rent_rental` (
  `lle_rent_id` int(11) NOT NULL,
  `lle_loc_id` int(11) NOT NULL,
  PRIMARY KEY (`lle_rent_id`,`lle_loc_id`),
  KEY `rent_index` (`lle_rent_id`),
  KEY `lle_location_constraint` (`lle_loc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `link_season_location`
--

CREATE TABLE IF NOT EXISTS `link_season_location` (
  `link_seas_id` int(11) NOT NULL,
  `link_location_id` int(11) NOT NULL,
  PRIMARY KEY (`link_seas_id`,`link_location_id`),
  KEY `link_location_constraint` (`link_location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `location`
--

CREATE TABLE IF NOT EXISTS `location` (
  `loc_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'location''s id',
  `loc_sec_id` int(11) NOT NULL,
  `loc_type_id` int(11) NOT NULL,
  PRIMARY KEY (`loc_id`),
  UNIQUE KEY `loc_sec_index` (`loc_sec_id`),
  KEY `loc_type_index` (`loc_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `rental`
--

CREATE TABLE IF NOT EXISTS `rental` (
  `rent_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id from rentals date',
  `rent_name` varchar(20) NOT NULL COMMENT 'renteur''s name',
  `rent_begin` date NOT NULL COMMENT 'begin date of the rent',
  `rent_end` date NOT NULL COMMENT 'end date of the rent',
  `rent_nb_person` int(11) NOT NULL COMMENT 'nb person of the rent',
  `rent_location_state` text NOT NULL COMMENT 'rent''s state after the rent',
  `rent_caution_state` double NOT NULL COMMENT 'rent''s state payment',
  `rent_days_number` int(11) NOT NULL COMMENT 'rent''s days number',
  `rent_price` double NOT NULL COMMENT 'rent''s price',
  `rent_cust_id` int(11) NOT NULL COMMENT 'foreign key from customer''s table',
  PRIMARY KEY (`rent_id`),
  KEY `cust_foreign_key` (`rent_cust_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `season`
--

CREATE TABLE IF NOT EXISTS `season` (
  `seas_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'season''s id',
  `seas_name` varchar(20) NOT NULL COMMENT 'season''s name',
  `seas_start_date` date NOT NULL COMMENT 'season''s start date',
  `seas_end_date` date NOT NULL COMMENT 'season''s  end date',
  `seas_coeff` double NOT NULL COMMENT 'season''s coeff',
  PRIMARY KEY (`seas_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Contenu de la table `season`
--

INSERT INTO `season` (`seas_id`, `seas_name`, `seas_start_date`, `seas_end_date`, `seas_coeff`) VALUES
(5, 'Haute', '2015-03-20', '2015-06-11', 1),
(6, '1er Moyenne', '2015-03-15', '2015-06-19', 0.8),
(7, '2ème Moyenne', '2015-09-12', '2015-11-15', 0.7),
(8, 'Basse', '2015-11-16', '0000-00-00', 0);

-- --------------------------------------------------------

--
-- Structure de la table `sector`
--

CREATE TABLE IF NOT EXISTS `sector` (
  `sec_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'sector''s id',
  `sec_name` varchar(30) NOT NULL COMMENT 'sector''s name',
  PRIMARY KEY (`sec_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `sector`
--

INSERT INTO `sector` (`sec_id`, `sec_name`) VALUES
(1, 'Lac'),
(2, 'Forêt'),
(3, 'Jardin'),
(4, 'Clairière');

-- --------------------------------------------------------

--
-- Structure de la table `type_location`
--

CREATE TABLE IF NOT EXISTS `type_location` (
  `type_location_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'type location''s id',
  `type_location_name` varchar(20) NOT NULL COMMENT 'location''s name',
  `type_location_price` double NOT NULL COMMENT 'location''s price',
  PRIMARY KEY (`type_location_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `type_location`
--

INSERT INTO `type_location` (`type_location_id`, `type_location_name`, `type_location_price`) VALUES
(1, 'terrain nu', 15),
(2, 'mobil home standard', 50),
(3, 'mobil home deluxe', 80),
(4, 'caravans 3 places', 30),
(5, 'caravans 5 places', 45);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `link_car_location`
--
ALTER TABLE `link_car_location`
  ADD CONSTRAINT `lcl_rend_constraint` FOREIGN KEY (`lcl_rent_id`) REFERENCES `rental` (`rent_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lcl_car_constraint` FOREIGN KEY (`lcl_car_id`) REFERENCES `caravan` (`car_id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `link_rent_rental`
--
ALTER TABLE `link_rent_rental`
  ADD CONSTRAINT `lle_location_constraint` FOREIGN KEY (`lle_loc_id`) REFERENCES `location` (`loc_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lle_rent_constraint` FOREIGN KEY (`lle_rent_id`) REFERENCES `rental` (`rent_id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `link_season_location`
--
ALTER TABLE `link_season_location`
  ADD CONSTRAINT `link_location_constraint` FOREIGN KEY (`link_location_id`) REFERENCES `location` (`loc_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `link_season_constraint` FOREIGN KEY (`link_seas_id`) REFERENCES `season` (`seas_id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `location_sector_constraint` FOREIGN KEY (`loc_sec_id`) REFERENCES `sector` (`sec_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `location_type_location_constraint` FOREIGN KEY (`loc_type_id`) REFERENCES `type_location` (`type_location_id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `rental`
--
ALTER TABLE `rental`
  ADD CONSTRAINT `rental_customers_constraint` FOREIGN KEY (`rent_cust_id`) REFERENCES `customer` (`cust_id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;