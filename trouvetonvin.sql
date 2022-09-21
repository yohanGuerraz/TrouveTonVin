-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mer. 21 sep. 2022 à 17:10
-- Version du serveur :  10.3.32-MariaDB
-- Version de PHP : 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `trouvetonvin`
--

-- --------------------------------------------------------

--
-- Structure de la table `abonnement`
--

CREATE TABLE `abonnement` (
  `idabonnement` int(11) NOT NULL,
  `nom_abonnement` varchar(45) NOT NULL,
  `prix_abonnement` varchar(45) NOT NULL,
  `reduction_abonnement` int(11) NOT NULL,
  `detail_abonnement` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `abonnement`
--

INSERT INTO `abonnement` (`idabonnement`, `nom_abonnement`, `prix_abonnement`, `reduction_abonnement`, `detail_abonnement`) VALUES
(1, 'Aucun Abonnement', '0', 0, 'Aucun Abonnement'),
(2, 'Abonnement Mensuel', '9.99', 20, 'Abonnement Mensuel, 20% de réduction !');

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE `admin` (
  `idadmin` int(11) NOT NULL,
  `Nom_admin` varchar(45) NOT NULL,
  `Mdp_admin` varchar(99) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `idcategorie` int(11) NOT NULL,
  `nom_categorie` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`idcategorie`, `nom_categorie`) VALUES
(1, 'Vin Rouge'),
(2, 'Vin Blanc'),
(3, 'Package');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `idcommande` int(11) NOT NULL,
  `date_commande` date NOT NULL DEFAULT current_timestamp(),
  `etat_idetat` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`idcommande`, `date_commande`, `etat_idetat`) VALUES
(1, '2022-08-28', 1);

-- --------------------------------------------------------

--
-- Structure de la table `commandeDetail`
--

CREATE TABLE `commandeDetail` (
  `idcommandeDetail` int(11) NOT NULL,
  `commande_idcommande` int(11) NOT NULL,
  `utilisateurs_idutilisateurs` int(11) NOT NULL,
  `produit_idproduit` int(11) NOT NULL,
  `qte_produit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `commandeDetail`
--

INSERT INTO `commandeDetail` (`idcommandeDetail`, `commande_idcommande`, `utilisateurs_idutilisateurs`, `produit_idproduit`, `qte_produit`) VALUES
(1, 1, 1, 1, 2),
(3, 1, 1, 2, 3);

-- --------------------------------------------------------

--
-- Structure de la table `etat`
--

CREATE TABLE `etat` (
  `idetat` int(11) NOT NULL,
  `nom_etat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `etat`
--

INSERT INTO `etat` (`idetat`, `nom_etat`) VALUES
(1, 'Commande en Cours de Préparation'),
(2, 'Commande en cours d\'expédition');

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `idProduit` int(11) NOT NULL,
  `nom_Produit` varchar(45) NOT NULL,
  `prix_Produit` int(11) NOT NULL,
  `qte_Produit` int(11) NOT NULL,
  `detaile_Produit` varchar(500) NOT NULL,
  `photo_Produit` varchar(100) NOT NULL,
  `Viticulteur_idViticulteur` int(11) NOT NULL,
  `categorie_idcategorie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`idProduit`, `nom_Produit`, `prix_Produit`, `qte_Produit`, `detaile_Produit`, `photo_Produit`, `Viticulteur_idViticulteur`, `categorie_idcategorie`) VALUES
(1, 'Bordeaux', 10, 5, 'c\'est bon, c\'est très cher, achète', 'NO PHOTO, NO FUTURE', 1, 1),
(2, 'Gewurtztraminer', 5, 10, 'C\'est moins bon, c\'est moins cher,\r\nachète quand même', 'NO PHOTO, NO PAST', 1, 2),
(3, 'Promo Package été', 40, 40, 'REDUCTION CHOC sur le Package été ! Prenez tant que vous le pouvez !', 'NO PHOTO, NO PROBLEM', 1, 3);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `idUtilisateur` int(11) NOT NULL,
  `nom_Utilisateur` varchar(45) NOT NULL,
  `prenom_Utilisateur` varchar(45) NOT NULL,
  `mail_Utilisateur` varchar(45) NOT NULL,
  `mdp_Utilisateur` varchar(45) NOT NULL,
  `telephone_Utilisateur` varchar(45) NOT NULL,
  `adresse_Utilisateur` varchar(100) NOT NULL,
  `codepostal_Utilisateur` varchar(10) NOT NULL,
  `abonnement_idabonnement` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`idUtilisateur`, `nom_Utilisateur`, `prenom_Utilisateur`, `mail_Utilisateur`, `mdp_Utilisateur`, `telephone_Utilisateur`, `adresse_Utilisateur`, `codepostal_Utilisateur`, `abonnement_idabonnement`) VALUES
(1, 'guerraz', 'yohan', 'yohanguerraz@gmail.com', 'Yohan3101.', '0677187473', '8 Route du Malheur', '69200', 1),
(2, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(3, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(4, 'UPDATED NAME', 'TOTOLOCHOBOLO', 'TUTULOCHBULU@gmail.com', '1234567891', '0405060809', '9 Route des Procrastinateurs', '74000', 2),
(5, 'UPDATED NAME', 'TOTOLOCHOBOLO', 'TUTULOCHBULU@gmail.com', '1234567891', '0405060809', '9 Route des Procrastinateurs', '74000', 2),
(6, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(7, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(8, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(9, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(10, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(11, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(12, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(13, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(14, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(15, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(16, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(17, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(18, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(19, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(20, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(21, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(22, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(23, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(24, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(25, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(26, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(27, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(28, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(29, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(30, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(31, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(32, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(33, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(34, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(35, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(36, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(37, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(38, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(39, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(40, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(41, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(42, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(43, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(44, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(45, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(46, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(47, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(48, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(49, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(50, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(51, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(52, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(53, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(54, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(55, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(56, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(57, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(58, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(59, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(60, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(61, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(62, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(63, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(64, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(65, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(66, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(67, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(68, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(69, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(70, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(71, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(72, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(73, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(74, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(75, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(76, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(77, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(78, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(79, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(80, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(81, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(82, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(83, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(84, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(85, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(86, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(87, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(88, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(89, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(90, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(91, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(92, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(93, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(94, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(95, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(96, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(97, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(98, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(99, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(100, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(101, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(102, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(103, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(104, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(105, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(106, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(107, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(108, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(109, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(110, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(111, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(112, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(113, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(114, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(115, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(116, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(117, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(118, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(119, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(120, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(121, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(122, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(123, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(124, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(125, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(126, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(127, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(128, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(129, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(130, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(131, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(132, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(133, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(134, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(135, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(136, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(137, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(138, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(139, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(140, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(141, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(142, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(143, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(144, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(145, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(146, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(147, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(148, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(149, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(150, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(151, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(152, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(153, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(154, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(155, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(156, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(157, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(158, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(159, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(160, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(161, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(162, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(163, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(164, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(165, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(166, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(167, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(168, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(169, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(170, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(171, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(172, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(173, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(174, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(175, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(176, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(177, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(178, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(179, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(180, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(181, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(182, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2),
(183, 'TUTU', 'LOCHBULU', 'TUTULOCHBULU@gmail.com', '1234567891', '0601020304', '8 rue TUTULOCHBULU', '74000', 2);

-- --------------------------------------------------------

--
-- Structure de la table `viticulteur`
--

CREATE TABLE `viticulteur` (
  `idViticulteur` int(11) NOT NULL,
  `nom_viticulteur` varchar(45) NOT NULL,
  `prenom_viticulteur` varchar(45) NOT NULL,
  `mail_viticulteur` varchar(45) NOT NULL,
  `mdp_viticulteur` varchar(45) NOT NULL,
  `telephone_viticulteur` varchar(45) NOT NULL,
  `adresse_viticulteur` varchar(200) NOT NULL,
  `codepostal_viticulteur` varchar(45) NOT NULL,
  `nom_entreprise_viticulteur` varchar(150) NOT NULL,
  `img_viticulteur` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `viticulteur`
--

INSERT INTO `viticulteur` (`idViticulteur`, `nom_viticulteur`, `prenom_viticulteur`, `mail_viticulteur`, `mdp_viticulteur`, `telephone_viticulteur`, `adresse_viticulteur`, `codepostal_viticulteur`, `nom_entreprise_viticulteur`, `img_viticulteur`) VALUES
(1, 'Jacques', 'Jean', 'JeanJacques@gmail.com', 'tutulochbulu', '0177485823', '8 route du bonheur', '69000', 'Toto-Trobo', NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `abonnement`
--
ALTER TABLE `abonnement`
  ADD PRIMARY KEY (`idabonnement`);

--
-- Index pour la table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`idadmin`);

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`idcategorie`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`idcommande`),
  ADD KEY `etat_idetat` (`etat_idetat`);

--
-- Index pour la table `commandeDetail`
--
ALTER TABLE `commandeDetail`
  ADD PRIMARY KEY (`idcommandeDetail`),
  ADD KEY `commande_idcommande` (`commande_idcommande`),
  ADD KEY `produit_idproduit` (`produit_idproduit`),
  ADD KEY `utilisateurs_idutilisateurs` (`utilisateurs_idutilisateurs`);

--
-- Index pour la table `etat`
--
ALTER TABLE `etat`
  ADD PRIMARY KEY (`idetat`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`idProduit`,`categorie_idcategorie`),
  ADD KEY `fk_Produit_Viticulteur1_idx` (`Viticulteur_idViticulteur`),
  ADD KEY `fk_Produit_categorie1_idx` (`categorie_idcategorie`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`idUtilisateur`,`abonnement_idabonnement`),
  ADD KEY `fk_utilisateurs_abonnement_idx` (`abonnement_idabonnement`);

--
-- Index pour la table `viticulteur`
--
ALTER TABLE `viticulteur`
  ADD PRIMARY KEY (`idViticulteur`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `abonnement`
--
ALTER TABLE `abonnement`
  MODIFY `idabonnement` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `admin`
--
ALTER TABLE `admin`
  MODIFY `idadmin` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `idcategorie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `idcommande` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `commandeDetail`
--
ALTER TABLE `commandeDetail`
  MODIFY `idcommandeDetail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `etat`
--
ALTER TABLE `etat`
  MODIFY `idetat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `idProduit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `idUtilisateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=184;

--
-- AUTO_INCREMENT pour la table `viticulteur`
--
ALTER TABLE `viticulteur`
  MODIFY `idViticulteur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `fk_etat_idetat` FOREIGN KEY (`etat_idetat`) REFERENCES `etat` (`idetat`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `commandeDetail`
--
ALTER TABLE `commandeDetail`
  ADD CONSTRAINT `fk_commande_idcommande` FOREIGN KEY (`commande_idcommande`) REFERENCES `commande` (`idcommande`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_produit_idproduit` FOREIGN KEY (`produit_idproduit`) REFERENCES `produit` (`idProduit`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_utilisateurs_idutilisateurs` FOREIGN KEY (`utilisateurs_idutilisateurs`) REFERENCES `utilisateur` (`idutilisateur`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `fk_Produit_Viticulteur1` FOREIGN KEY (`Viticulteur_idViticulteur`) REFERENCES `viticulteur` (`idViticulteur`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Produit_categorie1` FOREIGN KEY (`categorie_idcategorie`) REFERENCES `categorie` (`idcategorie`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `fk_utilisateurs_abonnement` FOREIGN KEY (`abonnement_idabonnement`) REFERENCES `abonnement` (`idabonnement`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
