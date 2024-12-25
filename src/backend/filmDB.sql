-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: filmsdb
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `CategorieID` int NOT NULL AUTO_INCREMENT,
  `NomCategorie` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`CategorieID`),
  UNIQUE KEY `NomCategorie` (`NomCategorie`),
  UNIQUE KEY `CategorieID_UNIQUE` (`CategorieID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (5,'Action'),(8,'Animation'),(13,'Aventure'),(12,'Biographie'),(10,'Comédie'),(2,'Crime'),(3,'Drame'),(6,'Fantastique'),(14,'Guerre'),(11,'Horreur'),(9,'Musical'),(7,'Romance'),(1,'Science-fiction'),(4,'Thriller');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `films`
--

DROP TABLE IF EXISTS `films`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `films` (
  `FilmID` int NOT NULL AUTO_INCREMENT,
  `Titre` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Annee` int NOT NULL,
  `RealisateurID` int DEFAULT NULL,
  `Description` text,
  `ImageURL` text,
  `CategorieID` int DEFAULT NULL,
  PRIMARY KEY (`FilmID`),
  KEY `RealisateurID` (`RealisateurID`),
  KEY `CategorieID` (`CategorieID`),
  CONSTRAINT `films_ibfk_1` FOREIGN KEY (`RealisateurID`) REFERENCES `realisateurs` (`RealisateurID`),
  CONSTRAINT `films_ibfk_2` FOREIGN KEY (`CategorieID`) REFERENCES `categories` (`CategorieID`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `films`
--

LOCK TABLES `films` WRITE;
/*!40000 ALTER TABLE `films` DISABLE KEYS */;
INSERT INTO `films` VALUES (1,'Inception',2010,1,'Un voleur expérimenté dans l\'art de l\'extraction de rêves se voit offrir une chance de retrouver sa vie d\'avant.','https://m.media-amazon.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_.jpg',1),(2,'Pulp Fiction',1994,2,'Les vies de deux tueurs à gages, d\'un boxeur, de la femme d\'un gangster et de deux braqueurs s\'entremêlent.','https://m.media-amazon.com/images/M/MV5BNGNhMDIzZTUtNTBlZi00MTRlLWFjM2ItYzViMjE3YzI5MjljXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg',2),(3,'Le Parrain',1972,3,'Le patriarche d\'une dynastie du crime organisé transfère le contrôle de son empire clandestin à son fils réticent.','https://m.media-amazon.com/images/M/MV5BM2MyNjYxNmUtYTAwNi00MTYxLWJmNWYtYzZlODY3ZTk3OTFlXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg',3),(4,'Matrix',1999,4,'Un programmeur découvre que la réalité telle que nous la connaissons est une simulation créée par des machines.','https://m.media-amazon.com/images/M/MV5BNzQzOTk3OTAtNDQ0Zi00ZTVkLWI0MTEtMDllZjNkYzNjNTc4L2ltYWdlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_.jpg',1),(5,'Forrest Gump',1994,5,'L\'histoire d\'un homme simple d\'esprit qui accomplit involontairement de grandes choses et influence plusieurs événements historiques.','https://m.media-amazon.com/images/M/MV5BNWIwODRlZTUtY2U3ZS00Yzg1LWJhNzYtMmZiYmEyNmU1NjMzXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_.jpg',3),(6,'Interstellar',2014,1,'Une équipe d\'explorateurs voyage à travers un trou de ver pour assurer la survie de l\'humanité.','https://m.media-amazon.com/images/M/MV5BZjdkOTU3MDktN2IxOS00OGEyLWFmMjktY2FiMmZkNWIyODZiXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg',1),(7,'Le Silence des Agneaux',1991,6,'Une jeune stagiaire du FBI doit recevoir l\'aide d\'un tueur en série emprisonné pour en arrêter un autre.','https://m.media-amazon.com/images/M/MV5BNjNhZTk0ZmEtNjJhMi00YzFlLWE1MmEtYzM1M2ZmMGMwMTU4XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_.jpg',4),(8,'Fight Club',1999,7,'Un employé de bureau insomniaque et un vendeur de savon charismatique forment un club de combat clandestin.','https://m.media-amazon.com/images/M/MV5BMmEzNTkxYjQtZTc0MC00YTVjLTg5ZTEtZWMwOWVlYzY0NWIwXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg',3),(9,'Les Évadés',1994,8,'Deux hommes se lient d\'amitié pendant plusieurs années dans une prison, trouvant réconfort et rédemption à travers des actes de décence commune.','https://m.media-amazon.com/images/M/MV5BMDFkYTc0MGEtZmNhMC00ZDIzLWFmNTEtODM1ZmRlYWMwMWFmXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg',3),(10,'Gladiator',2000,9,'Un général romain devenu esclave doit se venger de l\'empereur corrompu qui a assassiné sa famille.','https://m.media-amazon.com/images/M/MV5BMDliMmNhNDEtODUyOS00MjNlLTgxODEtN2U3NzIxMGVkZTA1L2ltYWdlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_.jpg',5),(11,'Le Seigneur des Anneaux',2001,10,'Un jeune hobbit entreprend un voyage épique pour détruire un anneau maléfique et sauver la Terre du Milieu.','https://m.media-amazon.com/images/M/MV5BN2EyZjM3NzUtNWUzMi00MTgxLWI0NTctMzY4M2VlOTdjZWRiXkEyXkFqcGdeQXVyNDUzOTQ5MjY@._V1_.jpg',6),(12,'Titanic',1997,11,'Une histoire d\'amour tragique se déroule pendant le voyage inaugural du Titanic.','https://m.media-amazon.com/images/M/MV5BMDdmZGU3NDQtY2E5My00ZTliLWIzOTUtMTY4ZGI1YjdiNjk3XkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_.jpg',7),(13,'Le Roi Lion',1994,12,'Un jeune lion prince doit surmonter la tragédie et prendre ses responsabilités en tant que roi.','https://m.media-amazon.com/images/M/MV5BYTYxNGMyZTYtMjE3MS00MzNjLWFjNmYtMDk3N2FmM2JiM2M1XkEyXkFqcGdeQXVyNjY5NDU4NzI@._V1_.jpg',8),(14,'Avatar',2009,11,'Un marine paraplégique est envoyé sur une lune extraterrestre et se retrouve déchiré entre suivre ses ordres et protéger le monde qu\'il considère comme sa maison.','https://m.media-amazon.com/images/M/MV5BMTYwOTEwNjAzMl5BMl5BanBnXkFtZTcwODc5MTUwMw@@._V1_.jpg',1),(15,'Jurassic Park',1993,13,'Un parc d\'attractions présentant des dinosaures génétiquement recréés tourne au cauchemar.','https://m.media-amazon.com/images/M/MV5BMjM2MDgxMDg0Nl5BMl5BanBnXkFtZTgwNTM2OTM5NDE@._V1_.jpg',1),(16,'The Dark Knight',2008,1,'Batman s\'allie au procureur Harvey Dent pour démanteler le crime organisé à Gotham, mais se retrouve confronté au Joker, un criminel imprévisible.','https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_.jpg',5),(17,'La La Land',2016,14,'Une histoire d\'amour entre un pianiste de jazz et une aspirante actrice dans la ville de Los Angeles.','https://m.media-amazon.com/images/M/MV5BMzUzNDM2NzM2MV5BMl5BanBnXkFtZTgwNTM3NTg4OTE@._V1_.jpg',9),(18,'Parasite',2019,15,'Une famille pauvre s\'immisce dans la vie d\'une famille riche, avec des conséquences inattendues.','https://m.media-amazon.com/images/M/MV5BYWZjMjk3ZTItODQ2ZC00NTY5LWE0ZDYtZTI3MjcwN2Q5NTVkXkEyXkFqcGdeQXVyODk4OTc3MTY@._V1_.jpg',4),(19,'Spider-Man: Into the Spider-Verse',2018,16,'Miles Morales devient Spider-Man et découvre qu\'il existe d\'autres versions de lui-même à travers le multivers.','https://m.media-amazon.com/images/M/MV5BMjMwNDkxMTgzOF5BMl5BanBnXkFtZTgwNTkwNTQ3NjM@._V1_.jpg',8),(20,'The Grand Budapest Hotel',2014,17,'Les aventures de Gustave H, un concierge légendaire d\'un célèbre hôtel européen, et de Zero Moustafa, le groom qui devient son ami le plus fidèle.','https://m.media-amazon.com/images/M/MV5BMzM5NjUxOTEyMl5BMl5BanBnXkFtZTgwNjEyMDM0MDE@._V1_.jpg',10),(21,'Mad Max: Fury Road',2015,18,'Dans un monde post-apocalyptique, Max s\'associe à Furiosa pour échapper à un seigneur de guerre tyrannique.','https://m.media-amazon.com/images/M/MV5BN2EwM2I5OWMtMGQyMi00Zjg1LWJkNTctZTdjYTA4OGUwZjMyXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg',5),(22,'Whiplash',2014,14,'Un jeune batteur de jazz prometteur est poussé à ses limites par un professeur impitoyable.','https://m.media-amazon.com/images/M/MV5BOTA5NDZlZGUtMjAxOS00YTRkLTkwYmMtYWQ0NWEwZDZiNjEzXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg',3),(23,'Get Out',2017,19,'Un jeune photographe afro-américain découvre des secrets troublants lors d\'une visite chez les parents de sa petite amie blanche.','https://m.media-amazon.com/images/M/MV5BMjUxMDQwNjcyNl5BMl5BanBnXkFtZTgwNzcwMzc0MTI@._V1_.jpg',11),(24,'Blade Runner 2049',2017,20,'Un blade runner découvre un secret qui pourrait plonger la société dans le chaos et le mène à la recherche de Rick Deckard, disparu depuis 30 ans.','https://m.media-amazon.com/images/M/MV5BNzA1Njg4NzYxOV5BMl5BanBnXkFtZTgwODk5NjU3MzI@._V1_.jpg',1),(25,'Black Panther',2018,21,'T\'Challa, héritier du royaume caché mais avancé du Wakanda, doit s\'avancer pour mener son peuple vers un nouvel avenir.','https://m.media-amazon.com/images/M/MV5BMTg1MTY2MjYzNV5BMl5BanBnXkFtZTgwMTc4NTMwNDI@._V1_.jpg',5),(26,'Dune',2021,20,'Paul Atreides, un jeune homme brillant, doit se rendre sur la planète la plus dangereuse de l\'univers pour assurer l\'avenir de sa famille et de son peuple.','https://m.media-amazon.com/images/M/MV5BN2FjNmEyNWMtYzM0ZS00NjIyLTg5YzYtYThlMGVjNzE1OGViXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_.jpg',1),(27,'The French Dispatch',2021,17,'Une collection d\'histoires du dernier numéro d\'un magazine américain publié dans une ville française fictive du 20e siècle.','https://m.media-amazon.com/images/M/MV5BNmQxZTNiODYtNzBhYy00MzVlLWJlN2UtNTc4YWZjMDIwMmEzXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_.jpg',10),(28,'Everything Everywhere All at Once',2022,22,'Une immigrée chinoise se retrouve mêlée à une aventure folle où elle seule peut sauver le monde en explorant d\'autres univers.','https://m.media-amazon.com/images/M/MV5BYTdiOTIyZTQtNmQ1OS00NjZlLWIyMTgtYzk5Y2M3ZDVmMDk1XkEyXkFqcGdeQXVyMTAzMDg4NzU0._V1_.jpg',1),(29,'The Power of the Dog',2021,23,'Un éleveur charismatique inspire la crainte et l\'admiration dans le Montana des années 1920, jusqu\'à ce que l\'amour menace de tout révéler.','https://m.media-amazon.com/images/M/MV5BZGRhYjE2NWUtN2FkNy00NGI3LTkxYWMtMDk4Yjg5ZjI3MWI2XkEyXkFqcGdeQXVyMTEyMjM2NDc2._V1_.jpg',3),(30,'The Batman',2022,24,'Batman enquête sur un tueur en série qui laisse des énigmes cryptiques après ses crimes à Gotham City.','https://m.media-amazon.com/images/M/MV5BMDdmMTBiNTYtMDIzNi00NGVlLWIzMDYtZTk3MTQ3NGQxZGEwXkEyXkFqcGdeQXVyMzMwOTU5MDk@._V1_.jpg',5),(31,'Top Gun: Maverick',2022,25,'Après 30 ans de service, Pete \'Maverick\' Mitchell forme une nouvelle génération de pilotes de l\'aéronavale pour une mission spéciale.','https://m.media-amazon.com/images/M/MV5BZWYzOGEwNTgtNWU3NS00ZTQ0LWJkODUtMmVhMjIwMjA1ZmQwXkEyXkFqcGdeQXVyMjkwOTAyMDU@._V1_.jpg',5),(32,'Oppenheimer',2023,1,'L\'histoire du scientifique américain J. Robert Oppenheimer et de son rôle dans le développement de la bombe atomique.','https://m.media-amazon.com/images/M/MV5BMDBmYTZjNjUtN2M1MS00MTQ2LTk2ODgtNzc2M2QyZGE5NTVjXkEyXkFqcGdeQXVyNzAwMjU2MTY@._V1_.jpg',12),(33,'Barbie',2023,26,'Barbie, qui vit dans le monde parfait de Barbieland, part à la découverte du monde réel.','https://m.media-amazon.com/images/M/MV5BNjU3N2QxNzYtMjk1NC00MTc4LTk1NTQtMmUxNTljM2I0NDA5XkEyXkFqcGdeQXVyODE5NzE3OTE@._V1_.jpg',13),(34,'Poor Things',2023,27,'Une jeune femme ramenée à la vie par un scientifique brillant mais peu orthodoxe s\'échappe avec un avocat débauché.','https://m.media-amazon.com/images/M/MV5BNGIyYWMzNjktNDE3MC00YWQyLWEyMmEtN2ZmNzZhZDk3NGJlXkEyXkFqcGdeQXVyMTUzMTg2ODkz._V1_.jpg',6),(35,'Killers of the Flower Moon',2023,28,'Dans les années 1920, des membres de la tribu Osage sont assassinés après la découverte de pétrole sur leurs terres.','https://m.media-amazon.com/images/M/MV5BMjE4ZTZlNDAtM2Q3YS00YjFhLThjN2UtODg2ZGNlN2E2MWU2XkEyXkFqcGdeQXVyMTUzMTg2ODkz._V1_.jpg',2),(36,'The Whale',2022,29,'Un professeur d\'anglais reclus vivant avec une obésité sévère tente de renouer avec sa fille adolescente.','https://www.movieposters.com/cdn/shop/products/scan_63d691e4-b962-400b-8a16-0ba4c43452e8_480x.progressive.jpg?v=1669321014',3),(37,'Nope',2022,19,'Les habitants d\'une vallée isolée de Californie sont témoins d\'une découverte étrange et terrifiante.','https://www.movieposters.com/cdn/shop/products/scan_eb10f5eb-0b3c-494b-b195-7946e3ae5fd2_480x.progressive.jpg?v=1659472999',11),(38,'The Fabelmans',2022,13,'Un jeune homme découvre un secret de famille bouleversant et explore le pouvoir du cinéma pour l\'aider à voir la vérité.','https://www.movieposters.com/cdn/shop/products/fabelmans_ver2_480x.progressive.jpg?v=1666983796',3),(39,'Elvis',2022,30,'L\'histoire de la vie et de la musique d\'Elvis Presley, vue à travers le prisme de sa relation compliquée avec son manager.','https://www.movieposters.com/cdn/shop/products/elvis_4ymd3y96_480x.progressive.jpg?v=1655925999',12),(40,'Don\'t Look Up',2021,31,'Deux astronomes tentent d\'avertir l\'humanité d\'une comète destructrice qui se dirige vers la Terre.','https://www.movieposters.com/cdn/shop/files/scan002_89d275d0-0c95-40e4-9459-4eb1454db37c_480x.progressive.jpg?v=1699388759',1),(41,'Encanto',2021,32,'Une jeune fille colombienne doit faire face à la frustration d\'être la seule membre de sa famille sans pouvoirs magiques.','https://www.movieposters.com/cdn/shop/products/encanto_svovuwhk_480x.progressive.jpg?v=1636562050',8),(42,'The Prestige',2006,1,'Deux magiciens rivaux s\'affrontent pour créer l\'ultime tour de magie.','https://www.movieposters.com/cdn/shop/files/prestige.mp.140332_480x.progressive.jpg?v=1709237534',3),(43,'The Social Network',2010,7,'L\'histoire de la création de Facebook et des conflits qui en ont découlé.','https://www.movieposters.com/cdn/shop/products/84d64a25ef3d23b652c5ea42f419e0d8_a1f6f969-9077-4792-83f6-a20e83fea71a_480x.progressive.jpg?v=1573591596',12),(45,'Inglourious Basterds',2009,2,'Dans la France occupée par les nazis, un groupe de soldats juifs américains complote pour assassiner des dirigeants nazis.','https://www.movieposters.com/cdn/shop/products/inglourious-basterds-style1.24x36_480x.progressive.jpg?v=1615395292',14),(46,'Coco',2017,33,'Un jeune garçon passionné de musique entreprend un voyage dans le monde des morts pour découvrir l\'histoire de sa famille.','https://lumiere-a.akamaihd.net/v1/images/p_coco_19736_fd5fa537.jpeg?region=0%2C0%2C540%2C810',8),(47,'The Grand Budapest Hotel',2014,17,'Les aventures de Gustave H, un concierge légendaire d\'un célèbre hôtel européen, et de Zero Moustafa, le groom qui devient son ami le plus fidèle.','https://cdn.shopify.com/s/files/1/0057/3728/3618/products/44b26f88e0fb3f1bf0a0660c099b8b19_b27d3a0c-9867-4ef1-a59d-f5304521c18d_500x749.jpg?v=1573594939',10),(48,'The Wolf of Wall Street',2013,28,'L\'ascension et la chute de Jordan Belfort, un courtier en bourse new-yorkais.','https://cdn.shopify.com/s/files/1/0057/3728/3618/files/wolfofwallstreet.24x36_500x749.jpg?v=1707502909',12),(49,'Inside Out',2015,34,'Les émotions d\'une jeune fille prennent vie et l\'aident à traverser les défis de la vie.','https://cdn.shopify.com/s/files/1/0057/3728/3618/files/inside_out_two_ver2_500x749.jpg?v=1711998871',8),(50,'The Revenant',2015,35,'Un trappeur lutte pour sa survie après avoir été attaqué par un ours et laissé pour mort.','https://cdn.shopify.com/s/files/1/0057/3728/3618/products/7c3677a5235e512286e8ab48470a8f20_67445574-3981-43da-a026-67f9d6aeb7e3_500x749.jpg?v=1573588584',13),(51,'The Imitation Game',2014,36,'L\'histoire d\'Alan Turing, qui a aidé à déchiffrer le code Enigma pendant la Seconde Guerre mondiale.','https://cdn.shopify.com/s/files/1/0057/3728/3618/products/imitationgame.promo_500x749.jpg?v=1616181893',12),(53,'Sonic 3',2024,24,'sonic 3 le film','https://www.paramountpictures.fr/content/uploads/2022/08/52_AFF-INSTA-PAYOFF_SO3.jpg',5),(56,'Sonic 2 le film',2022,39,'Sonic veut maintenant prouver qu’il a l’étoffe d\' un véritable héros. Un défi de taille se présente à lui quand le Dr Robotnik refait son apparition. Accompagné de son nouveau complice Knuckles','https://fr.web.img5.acsta.net/pictures/22/03/14/15/39/4137538.jpg',8),(57,'dfxxdfdf',5478,40,'dfsqvdqez','https://png.pngtree.com/png-vector/20190820/ourmid/pngtree-no-image-vector-illustration-isolated-png-image_1694547.jpg',3);
/*!40000 ALTER TABLE `films` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realisateurs`
--

DROP TABLE IF EXISTS `realisateurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `realisateurs` (
  `RealisateurID` int NOT NULL AUTO_INCREMENT,
  `NomRealisateur` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`RealisateurID`),
  UNIQUE KEY `NomRealisateur` (`NomRealisateur`),
  UNIQUE KEY `RealisateurID_UNIQUE` (`RealisateurID`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realisateurs`
--

LOCK TABLES `realisateurs` WRITE;
/*!40000 ALTER TABLE `realisateurs` DISABLE KEYS */;
INSERT INTO `realisateurs` VALUES (31,'Adam McKay'),(35,'Alejandro González Iñárritu'),(30,'Baz Luhrmann'),(15,'Bong Joon-ho'),(32,'Byron Howard, Jared Bush'),(1,'Christopher Nolan'),(14,'Damien Chazelle'),(22,'Daniel Kwan, Daniel Scheinert'),(29,'Darren Aronofsky'),(7,'David Fincher'),(20,'Denis Villeneuve'),(3,'Francis Ford Coppola'),(8,'Frank Darabont'),(18,'George Miller'),(26,'Greta Gerwig'),(11,'James Cameron'),(23,'Jane Campion'),(39,'Jeff Fowler'),(6,'Jonathan Demme'),(19,'Jordan Peele'),(25,'Joseph Kosinski'),(4,'Lana et Lilly Wachowski'),(33,'Lee Unkrich, Adrian Molina'),(28,'Martin Scorsese'),(24,'Matt Reeves'),(36,'Morten Tyldum'),(34,'Pete Docter, Ronnie del Carmen'),(10,'Peter Jackson'),(16,'Peter Ramsey, Bob Persichetti, Rodney Rothman'),(2,'Quentin Tarantino'),(9,'Ridley Scott'),(5,'Robert Zemeckis'),(12,'Roger Allers, Rob Minkoff'),(21,'Ryan Coogler'),(13,'Steven Spielberg'),(17,'Wes Anderson'),(40,'xfgxgfb'),(27,'Yorgos Lanthimos');
/*!40000 ALTER TABLE `realisateurs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-24 23:00:31
