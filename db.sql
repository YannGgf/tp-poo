-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           5.7.33 - MySQL Community Server (GPL)
-- SE du serveur:                Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour ma_base_de_donnees



CREATE DATABASE IF NOT EXISTS `poo_php` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `poo_php`;

-- Listage de la structure dpour les table du RBNB--

CREATE TABLE IF NOT EXISTS `annonce` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(100) NOT NULL DEFAULT '0',
  `address` text NOT NULL,
  `nb_client` int(150) NOT NULL DEFAULT 1,
  `prix` int(110) NOT NULL DEFAULT 0,
  `descritption` text NOT NULL,
  `type` varchar(11) NOT NULL DEFAULT '0',
  `equipement_id` int(11) DEFAULT 0,
  `annonceur_id` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `equipement_id` (`equipement_id`),
  KEY `annonceur_id` (`annonceur_id`),
  CONSTRAINT `equipement_id` FOREIGN KEY (`equipement_id`) REFERENCES `equipement` (`id`),
  CONSTRAINT `annonceur_id` FOREIGN KEY (`annonceur_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;


  INSERT INTO `annonce` (`id`, `label`, `address`, `nb_client`, `prix`, `descritption`, `type`, `equipement_id`, `annonceur_id` ) VALUES
  	(1, 'ravisant chateau des sith', '3 rue du seigneur Vador couloir 33A Etoile noir', 56, 4500, 'le ravissant chateau est une chambre luxueuse reservé aux haut gradé de l\'empire elle est situé a bord de l\'étoile noir', 'chateau sith', 1, 1),
  	(2, 'Chambre 9 3/4', '26 avenue des socier 4chambre de la tour d\'astronomie', 4, 520, 'la chambre 9 3/4 est une chambre d\'hôte situé à Poudlard le petit dejeuner vous y sera servit avec du jus de citrouille votre logement vous offre une place VIP pour les match de quiditch', 'chateau de sorcier', 2, 2),
  	(3, 'La suite Stark', '32 rue comodor street', 10, 5000, 'la suite stark est une suite luxueuse très sofistiqué conçu et amnagé par le célebre Tony Stark plus connu sous le nom de Iron-Man, situer au 512eme etage de la tour des Avengers une surplomber la ville de NewYork avec une vue imprenable et provitez de de votre batême de l\'air en armure', 'hotel luxueux', 3 ,3),
  	(4, 'séjour cosy sur le notromo', '251° 251456221X 5645657Y 56463451853Z dans l\'espace', 8, 1200,'Ayez le privilège d\'embarquer a bord du Notromo pour une viré dans l\'espace au coté du charmant Xenomorph (Alien) pour pouvoir dormir à la belle étoile', 'vaisseau spatiale', 4, 4);



   CREATE TABLE IF NOT EXISTS `user` (
     `id` int(11) NOT NULL AUTO_INCREMENT,
     `firstname` varchar(100) NOT NULL DEFAULT 'x',
     `lastname` varchar(100) NOT NULL DEFAULT 'x',
     `telephone` int(150) NOT NULL DEFAULT 1,
     `email` varchar(110) NOT NULL DEFAULT 'x',
     `address` varchar(110) NOT NULL DEFAULT 'x',
     `is_annonceur` BOOLEAN DEFAULT 0,
     `is_admin` BOOLEAN DEFAULT 0,
    PRIMARY KEY (`id`)
   ) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;



 INSERT INTO `user` (`id`, `firstname`, `lastname`, `telephone`, `email`, `address`, `is_annonceur`, `is_admin`) VALUES
 	(1, 'Dark', 'Sidious', 666666666, 'Empereur-Palpatine@L\'empire.com', 'L\'étoile noir', 1, 0),
   (2, 'Albus', 'Dumbledore', 643122462, 'Albus.Dumbledore@Poudlard.com', 'Poudlard', 1, 0),
   (3, 'Nick', 'Fury', 618527325, 'Nick_Fury@SHIELD.com', 'Tour des Avengers', 1, 0),
   (4, 'Xenomorph', 'Alien', 688888888, 'Alien@Nostromo.com', 'Vaisseau Nostromo', 1, 0);

  CREATE TABLE IF NOT EXISTS `equipement` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `have_cafetiere` BOOLEAN DEFAULT 0,
    `have_four` BOOLEAN DEFAULT 0,
    `have_frigot` BOOLEAN DEFAULT 0,
    `have_internet` BOOLEAN DEFAULT 0,
    `have_reseau` BOOLEAN DEFAULT 0,
    `have_mer` BOOLEAN DEFAULT 0,
    `have_hotelier` BOOLEAN DEFAULT 0,
    PRIMARY KEY (`id`)
  ) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;


 INSERT INTO `equipement` (`id`, `have_cafetiere`, `have_four`, `have_frigot`, `have_internet`, `have_reseau`, `have_mer`, `have_hotelier`) VALUES
 	(1, 1, 1, 1, 1, 1, 0, 1),
   (2, 0, 0, 0, 0, 0, 1, 0),
   (3, 1, 1, 1, 1, 1, 0, 1),
   (4, 1, 1, 1, 1, 1, 0, 0);


    CREATE TABLE IF NOT EXISTS `reservation` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `date_debut` int(150) NOT NULL DEFAULT 0,
    `date_fin` int(150) NOT NULL DEFAULT 0,
    `user_id` int(150) NOT NULL DEFAULT 0,
    `annonce_id` int(150) NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY `user_id` (`user_id`),
    KEY `annonce_id` (`annonce_id`),
    CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
    CONSTRAINT `annonce_id` FOREIGN KEY (`annonce_id`) REFERENCES `annonce` (`id`)
  ) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;