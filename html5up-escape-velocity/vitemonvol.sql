-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : ven. 03 déc. 2021 à 16:44
-- Version du serveur : 8.0.27
-- Version de PHP : 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `vitemonvol`
--

-- --------------------------------------------------------

--
-- Structure de la table `circuit`
--

CREATE TABLE `circuit` (
  `id` int NOT NULL,
  `nom` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nombre_place_total` int NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `prix` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `circuit`
--

INSERT INTO `circuit` (`id`, `nom`, `description`, `nombre_place_total`, `date_debut`, `date_fin`, `prix`) VALUES
(1, 'Voyage sur l\'achipel nippon', 'Venez visiter les villes les plus emblématiques du Japon, pays entre tradition et modernité, durant ce voyage, vous pourrez visitez des temples comme le fameux centre commercial Pokemon, puis descendrer vers des petits villages de campagnes, pour visitez le mont fuji, et bien plus encore!', 30, '2022-04-15', '2022-04-30', 2500),
(2, 'Visite historique en Grèce', 'Venez participer a notre circuit sur l\'histoire de la grèce, la mythologie Grec, son évolution au fil des années, ses traditions, ses spécialités culinaire, le tout saupoudré de baignade dans la mer méditerranée', 20, '2022-09-01', '2022-09-15', 1000),
(3, 'Voyage au pays des caribous', 'Prenez place ! Destination le Canada, Vous pourrez visité les refuges pour animaux, la production d\'érable dans une usine spécialisé, dégustation de produits locaux. Et encore plein d\'autres activitées vous attende', 25, '2022-07-01', '2022-07-10', 3000);

-- --------------------------------------------------------

--
-- Structure de la table `circuit_deplacement`
--

CREATE TABLE `circuit_deplacement` (
  `id_circuit` int NOT NULL,
  `id_deplacement` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `circuit_deplacement`
--

INSERT INTO `circuit_deplacement` (`id_circuit`, `id_deplacement`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(2, 5),
(2, 6),
(2, 7),
(3, 8),
(3, 9),
(3, 10);

-- --------------------------------------------------------

--
-- Structure de la table `deplacement`
--

CREATE TABLE `deplacement` (
  `id` int NOT NULL,
  `planning_jour` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `heure_depart` time NOT NULL,
  `heure_arrivee` time NOT NULL,
  `id_ville_depart` int NOT NULL,
  `id_ville_arrivee` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `deplacement`
--

INSERT INTO `deplacement` (`id`, `planning_jour`, `heure_depart`, `heure_arrivee`, `id_ville_depart`, `id_ville_arrivee`) VALUES
(1, 'A notre arrivé sur l\'archipel, nous resterons quelques jours sur Tokyo afin de visiter les temples et commerces traditionnel de la capital, puis visiterons les quartiers branché de la ville.', '08:30:00', '21:00:00', 1, 1),
(2, 'Petit détour dans la campagne japonaise afin de visiter une auberge traditionnel ainsi que le mont Fuji.', '08:30:00', '21:00:00', 1, 2),
(3, 'Nous allons ensuite passer quelques jours à Kyoto, ville ou se trouve notamment une zone traditionnel, avec sa forêt de bambou, ses petits commerces, les habits traditionnels, etc... Bref un dépaysement total.', '08:30:00', '21:00:00', 2, 3),
(4, 'Nous Finirons notre voyage a Osaka, la ou se situe l\'un des plus beau château du Japon.', '08:30:00', '21:00:00', 3, 4),
(5, 'Après être descendu de l\'avion, notre première expédition sera à Athènes, vous pourrez y découvrir des reliques datant de l\'époque greco-romaine, mais si l\'histoire ne vous intéresse pas, vous pouvez toujours visiter les différents endroits de la ville, et leurs productions locals.', '08:30:00', '21:00:00', 5, 5),
(6, 'Le péloponnèse est un endroit riche en histoire, nature, et villes à visiter. Vous pouvez tout autant visiter des ruines, et juste après, vous baignez dans la méditerranée', '08:30:00', '21:00:00', 5, 6),
(7, 'Thessalonique, nous y passerons pour y visiter les allées champetre ainsi que la gastronomie local à base de fruit de mer et autre produit de la mer.', '08:30:00', '21:00:00', 6, 7),
(8, 'Nous allons passer la plupart de notre temps à Vancouver, pour visiter les monuments locaux, les produits locaux, mais égalment la visiter d\'industrie uniquement visible au Canada comme une Usine à sirop d\'érable.', '08:30:00', '21:00:00', 8, 8),
(9, 'Départ pour Kamloops pour profiter d\'une randonnée dans la nature dans le parc naturel local, ou on pourra y voir notamment des cascades, des caribous et bien d\'autres chose !.', '08:30:00', '21:00:00', 8, 9),
(10, 'Retour à Vancouver pour une journée libre, ou vous pourrez en profiter pour faire les boutiques, avant de reprendre l\'avion à 19h.', '08:30:00', '19:00:00', 9, 8);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` int NOT NULL,
  `nom` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mdp` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `nom`, `prenom`, `mail`, `mdp`, `is_admin`) VALUES
(1, 'admin', 'nimda', 'admin@vitemonvol.fr', 'root', 1),
(2, 'Punto', 'léticia', 'Léticia@punto.fr', '1234', 0),
(3, 'Dorcel', 'Jacques', 'dorcel.jacques@gmail.com', 'jp1938', 0);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur_circuit`
--

CREATE TABLE `utilisateur_circuit` (
  `id` int NOT NULL,
  `date_reservation` date DEFAULT NULL,
  `id_utilisateur` int NOT NULL,
  `id_circuit` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `utilisateur_circuit`
--

INSERT INTO `utilisateur_circuit` (`id`, `date_reservation`, `id_utilisateur`, `id_circuit`) VALUES
(1, '2021-10-13', 2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `ville`
--

CREATE TABLE `ville` (
  `id` int NOT NULL,
  `nom` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `hotel` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `ville`
--

INSERT INTO `ville` (`id`, `nom`, `hotel`) VALUES
(1, 'Tokyo', 'Red Planet Tokyo Asakusa'),
(2, 'Hakone', 'Hakone Yutowa'),
(3, 'Kyoto', 'Shinmachi Bettei'),
(4, 'Osaka', 'Nest Hotel Osaka Umeda'),
(5, 'Athènes', 'Candia hotel'),
(6, 'Péloponnèse', 'Nikki Beach Resort & Spa'),
(7, 'Thessalonique', 'Electra Palace Thessaloniki'),
(8, 'Vancouver', 'Moda Hotel'),
(9, 'Kamloops', 'The Plaza Hotel');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `circuit`
--
ALTER TABLE `circuit`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `circuit_deplacement`
--
ALTER TABLE `circuit_deplacement`
  ADD KEY `id_circuit` (`id_circuit`),
  ADD KEY `id_deplacement` (`id_deplacement`);

--
-- Index pour la table `deplacement`
--
ALTER TABLE `deplacement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_ville_depart` (`id_ville_depart`),
  ADD KEY `id_ville_arrivee` (`id_ville_arrivee`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `utilisateur_circuit`
--
ALTER TABLE `utilisateur_circuit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_utilisateur` (`id_utilisateur`),
  ADD KEY `id_circuit` (`id_circuit`);

--
-- Index pour la table `ville`
--
ALTER TABLE `ville`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `circuit`
--
ALTER TABLE `circuit`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `deplacement`
--
ALTER TABLE `deplacement`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `utilisateur_circuit`
--
ALTER TABLE `utilisateur_circuit`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `ville`
--
ALTER TABLE `ville`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `circuit_deplacement`
--
ALTER TABLE `circuit_deplacement`
  ADD CONSTRAINT `circuit_deplacement_ibfk_1` FOREIGN KEY (`id_circuit`) REFERENCES `circuit` (`id`),
  ADD CONSTRAINT `circuit_deplacement_ibfk_2` FOREIGN KEY (`id_deplacement`) REFERENCES `deplacement` (`id`);

--
-- Contraintes pour la table `deplacement`
--
ALTER TABLE `deplacement`
  ADD CONSTRAINT `deplacement_ibfk_1` FOREIGN KEY (`id_ville_depart`) REFERENCES `ville` (`id`),
  ADD CONSTRAINT `deplacement_ibfk_2` FOREIGN KEY (`id_ville_arrivee`) REFERENCES `ville` (`id`);

--
-- Contraintes pour la table `utilisateur_circuit`
--
ALTER TABLE `utilisateur_circuit`
  ADD CONSTRAINT `utilisateur_circuit_ibfk_1` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id`),
  ADD CONSTRAINT `utilisateur_circuit_ibfk_2` FOREIGN KEY (`id_circuit`) REFERENCES `circuit` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
