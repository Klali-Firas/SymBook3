-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 29 avr. 2024 à 13:16
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `symlivres`
--

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `libelle`, `slug`, `description`) VALUES
(1, 'Otis Berge Why Not', 'otis-berge-why-not', 'Dolore error sunt odit. Odit est harum provident pariatur occaecati. Sunt et fuga rerum recusandae. Eum nihil ut quam ducimus quae maxime. Dolores placeat explicabo commodi earum sint debitis doloribus.'),
(2, 'Mrs. Melyssa Wunsch', 'mrs--melyssa-wunsch', 'Perspiciatis enim est non est. Provident dolores atque tempora et. Temporibus dignissimos et non quis eius et. Optio eos delectus consequatur voluptatibus sint quibusdam placeat.'),
(3, 'Garret Harvey', 'garret-harvey', 'Ipsum quaerat ducimus aperiam animi adipisci ut odit. Eaque similique ullam sed vero maiores nihil blanditiis nihil. Eos rerum labore cum id vel labore quis.'),
(9, 'Informatique', 'Informatique', 'me deyem welo haha');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20240304123531', '2024-03-04 13:38:18', 46),
('DoctrineMigrations\\Version20240401122648', '2024-04-01 14:26:56', 160);

-- --------------------------------------------------------

--
-- Structure de la table `livres`
--

CREATE TABLE `livres` (
  `id` int(11) NOT NULL,
  `titre` varchar(255) NOT NULL,
  `isbn` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `resume` longtext DEFAULT NULL,
  `editeur` varchar(255) NOT NULL,
  `edited_at` datetime NOT NULL,
  `prix` double NOT NULL,
  `categorie_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `livres`
--

INSERT INTO `livres` (`id`, `titre`, `isbn`, `slug`, `image`, `resume`, `editeur`, `edited_at`, `prix`, `categorie_id`) VALUES
(2206, 'Oceane Lockman IV', '9798935468026', 'oceane-lockman-iv', 'https://via.placeholder.com/300x300.png/00ddcc?text=nisi', 'Consequatur id voluptates id sed vitae iure blanditiis voluptas. Aut sint impedit facere nostrum.', 'Mrs. Jalyn Jast V', '1981-07-09 09:51:34', 471, 1),
(2207, 'Jany Moen', '9792088747724', 'jany-moen', 'https://via.placeholder.com/300x300.png/00cc99?text=recusandae', 'Eum illum quia temporibus occaecati minima repudiandae. Accusamus natus ut at sed repellat. Maiores corporis omnis voluptatem et quam. Voluptatem voluptatem accusantium iste quia enim.', 'Jammie Cormier', '1988-08-21 05:25:58', 864, 1),
(2208, 'Dr. Declan Feest V', '9786178771850', 'dr--declan-feest-v', 'https://via.placeholder.com/300x300.png/00ff11?text=ducimus', 'Porro a ut commodi aliquid labore ipsum. Quasi qui quia ducimus et. Temporibus dicta esse enim similique. Dolorem nam sed dolores enim.', 'Ms. Elmira Green DDS', '1982-03-14 03:02:20', 118, 1),
(2209, 'Prof. Kayley Christiansen', '9790756694318', 'prof--kayley-christiansen', 'https://via.placeholder.com/300x300.png/001111?text=aliquam', 'Eos doloribus magnam blanditiis inventore eligendi est. Qui et maxime sapiente. Praesentium incidunt quaerat nisi aperiam. Molestiae cumque nisi odio non consequatur est. Dolorem quia incidunt praesentium totam.', 'Prof. Lelia Kertzmann', '2017-01-19 12:11:58', 164, 1),
(2210, 'Prof. Clinton Jacobson', '9787990949557', 'prof--clinton-jacobson', 'https://via.placeholder.com/300x300.png/009977?text=similique', 'Voluptas quos nulla porro dicta. Molestias animi ex quasi voluptas et perferendis fugiat. Unde eos cumque sit provident sequi doloremque.', 'Dr. Stephen Klein', '1982-12-15 19:40:28', 525, 1),
(2211, 'Gino Grady', '9798353026655', 'gino-grady', 'https://via.placeholder.com/300x300.png/001199?text=dolore', 'Dolorem id necessitatibus rerum. Et natus in aut iusto inventore voluptatem saepe. Quo facilis molestiae ut suscipit. Quasi similique quibusdam voluptatem cumque ad.', 'Laila D\'Amore', '1978-05-30 17:17:03', 974, 1),
(2212, 'Waldo Kub', '9782128097087', 'waldo-kub', 'https://via.placeholder.com/300x300.png/00ee33?text=et', 'Id cum voluptates ex itaque cum sequi quo ut. Suscipit eaque et et perspiciatis maxime quo similique aut. Aut quasi a inventore illum.', 'Cameron Kuphal', '1981-10-03 23:43:29', 343, 1),
(2213, 'Prof. Elinore Klocko', '9797218898024', 'prof--elinore-klocko', 'https://via.placeholder.com/300x300.png/005577?text=maxime', 'Aliquid maiores deleniti similique rerum nihil voluptatibus. Adipisci id quo qui laborum magnam dicta ipsum. Aut et aut mollitia alias ea et voluptas. Aut voluptas repellat sit molestiae nihil eos.', 'Mrs. Berenice Legros', '1982-01-27 06:24:32', 426, 1),
(2214, 'Dr. Harley Runte', '9784747399597', 'dr--harley-runte', 'https://via.placeholder.com/300x300.png/00aaaa?text=qui', 'Exercitationem saepe est placeat. Quia minima aut et laudantium. Dolor fuga voluptas aliquid facere.', 'Mr. Gustave Kutch III', '2005-09-11 21:17:20', 755, 1),
(2215, 'Dr. Sheldon O\'Connell Sr.', '9788339271247', 'dr--sheldon-o-connell-sr-', 'https://via.placeholder.com/300x300.png/0011aa?text=aperiam', 'Et aperiam quae eos minima qui consequatur quod quia. Autem rerum quasi beatae omnis laboriosam ipsam. Et eos reprehenderit nemo unde possimus rerum eaque molestiae.', 'Danny Windler DDS', '2011-02-11 01:20:14', 298, 1),
(2216, 'Karen Strosin', '9786394407540', 'karen-strosin', 'https://via.placeholder.com/300x300.png/009911?text=architecto', 'Enim dolorum aut exercitationem vitae. Quidem mollitia recusandae mollitia. Sapiente voluptatibus voluptas dolorum rem fuga fuga.', 'Osbaldo Gibson', '1993-03-05 11:23:53', 426, 1),
(2217, 'Liam Herzog', '9795970503217', 'liam-herzog', 'https://via.placeholder.com/300x300.png/0099dd?text=officiis', 'Modi ipsa ut voluptatum dolores et nihil praesentium. Quis iusto error sit. Quia animi optio fugit.', 'Courtney Torphy', '2022-08-29 16:34:52', 183, 1),
(2218, 'Holden Leuschke', '9786383530259', 'holden-leuschke', 'https://via.placeholder.com/300x300.png/00ccaa?text=voluptate', 'Saepe omnis doloremque quia voluptatem omnis maiores soluta nihil. Rerum et earum illo velit voluptate. Et nobis omnis ratione fuga natus aliquam. Quo at sed non nesciunt occaecati velit nam.', 'Polly Kihn', '2022-10-12 14:17:04', 847, 1),
(2219, 'Prof. Levi Strosin', '9791110511319', 'prof--levi-strosin', 'https://via.placeholder.com/300x300.png/00ee11?text=non', 'Consequatur rerum voluptatem distinctio tempore et ad. Rerum fuga distinctio doloremque voluptates dolore voluptatibus. Eum itaque eaque voluptatibus voluptas vel cupiditate autem. Ratione vel veritatis qui distinctio id deserunt consequatur.', 'Rodrick Skiles', '1996-04-14 05:34:01', 802, 1),
(2220, 'Donnie Russel', '9783041838351', 'donnie-russel', 'https://via.placeholder.com/300x300.png/00ee22?text=et', 'Ut accusantium quia impedit consequatur. Sint aut dolorem et praesentium est repellat. Dolorum et doloribus quos.', 'Dr. Oswaldo Crona', '1970-05-02 07:44:40', 446, 1),
(2221, 'Maegan Jenkins', '9783665837655', 'maegan-jenkins', 'https://via.placeholder.com/300x300.png/009988?text=rem', 'Reiciendis tempore nihil quia dolor aut. Amet molestias magnam error ut possimus provident ea. Quam saepe in ab quos quibusdam eum eaque. Neque hic totam doloremque ut natus.', 'Lorenz Klein', '2008-02-17 03:59:27', 234, 1),
(2222, 'Ms. Maryam Heathcote PhD', '9791304070448', 'ms--maryam-heathcote-phd', 'https://via.placeholder.com/300x300.png/005522?text=fuga', 'Nulla tempora non dolorem iste minima sequi. Animi rerum asperiores alias eveniet praesentium. Velit dolor non nam saepe facilis ut.', 'Vickie Rempel', '1974-12-03 01:00:07', 157, 1),
(2223, 'Torey Lehner II', '9795843188961', 'torey-lehner-ii', 'https://via.placeholder.com/300x300.png/007722?text=omnis', 'Maiores ratione excepturi officia nostrum debitis. Quia quaerat eos ullam numquam.', 'Lacey Purdy', '1982-07-31 04:57:48', 619, 1),
(2224, 'Mr. Edgar Doyle III', '9797613924632', 'mr--edgar-doyle-iii', 'https://via.placeholder.com/300x300.png/00dddd?text=voluptas', 'Qui corporis aspernatur in pariatur harum dignissimos. Omnis vel facilis commodi possimus. Eligendi occaecati sint ut facilis asperiores. Necessitatibus laboriosam esse optio perspiciatis mollitia est.', 'Axel Kozey', '2017-07-28 11:38:12', 640, 1),
(2225, 'Laurine Heller DDS', '9790949511422', 'laurine-heller-dds', 'https://via.placeholder.com/300x300.png/00aa66?text=odit', 'Rem molestiae aspernatur impedit modi sed distinctio earum. Incidunt soluta perspiciatis repellat est perferendis soluta. Soluta suscipit corporis beatae impedit sed. Doloribus praesentium earum cumque sit sed.', 'Garth Kunde', '2004-03-21 19:10:16', 166, 1),
(2226, 'Mr. Percy Franecki DVM', '9795021526325', 'mr--percy-franecki-dvm', 'https://via.placeholder.com/300x300.png/00bbdd?text=ullam', 'Aut provident omnis aspernatur sit. Dolor sit quos tempora voluptatem. Corrupti ut omnis quod provident et fugit provident. Mollitia minima cumque at veritatis et error. Quis quis rerum molestiae molestiae esse reiciendis.', 'Vivianne Cremin Jr.', '1981-04-29 20:59:04', 752, 1),
(2227, 'Prof. Jeffry Schaden V', '9781371891657', 'prof--jeffry-schaden-v', 'https://via.placeholder.com/300x300.png/00ff99?text=corrupti', 'A excepturi quis aliquam. Eaque architecto id repellendus odio delectus accusamus ex. Nemo eum ea doloribus voluptatum enim sed ad.', 'Santiago Berge', '1994-08-19 16:47:36', 223, 1),
(2228, 'Julian Christiansen', '9798909907148', 'julian-christiansen', 'https://via.placeholder.com/300x300.png/0000cc?text=aut', 'Commodi quisquam qui qui. Aut ut veniam sed aut sit. Reprehenderit et alias quia non eveniet. Ut cum numquam sequi porro aut.', 'Dr. Lucy Hintz', '2001-03-24 15:16:45', 553, 1),
(2229, 'Quinn Corkery', '9789432218429', 'quinn-corkery', 'https://via.placeholder.com/300x300.png/00dd44?text=iusto', 'Quisquam corrupti doloremque molestias sit tenetur. Possimus est hic architecto. Et in sit quasi et sed quia.', 'Guiseppe Quitzon MD', '1993-12-16 10:55:53', 183, 1),
(2230, 'Payton Bosco Jr.', '9791795508468', 'payton-bosco-jr-', 'https://via.placeholder.com/300x300.png/008899?text=itaque', 'Soluta illo quisquam omnis. Modi perferendis quod eos cum mollitia quaerat qui.', 'Dr. Andy Kassulke I', '2007-11-22 05:26:36', 850, 1),
(2231, 'Manuela Goyette', '9788958010920', 'manuela-goyette', 'https://via.placeholder.com/300x300.png/001122?text=est', 'Et rerum repellat sit voluptas. Totam atque ut amet maiores ut perspiciatis harum incidunt. Qui voluptates optio ipsum eum dolorem non ratione. Ea minima distinctio omnis unde odio minus.', 'Catharine Orn', '1978-04-29 08:37:15', 426, 1),
(2232, 'Ben Moen', '9783729158573', 'ben-moen', 'https://via.placeholder.com/300x300.png/007711?text=iste', 'Itaque qui aut sit porro quibusdam. Adipisci illum laboriosam rerum autem corrupti dicta sed. Numquam iste labore inventore a minus voluptates ipsam. Laboriosam possimus quidem voluptate molestias aut sapiente repellendus.', 'Prof. Peyton Frami', '1997-04-11 10:07:03', 592, 1),
(2233, 'Ellie Wisozk', '9782503708072', 'ellie-wisozk', 'https://via.placeholder.com/300x300.png/000033?text=ullam', 'Nostrum quasi est dolorem. Et est nulla laudantium quia porro sunt. Doloremque fugit omnis nulla et omnis non nulla. Qui qui placeat perspiciatis ut voluptates perferendis doloremque.', 'Claud Wiza Sr.', '1997-07-10 23:48:02', 121, 1),
(2234, 'Linda Heller', '9788214851922', 'linda-heller', 'https://via.placeholder.com/300x300.png/00bb22?text=nesciunt', 'Aut fuga adipisci non aut ipsam. Aliquid incidunt autem fugiat qui voluptate. Ut dignissimos esse eius et porro.', 'Jacky Weber', '1999-10-18 09:34:18', 111, 1),
(2235, 'Berniece Rau', '9797445947267', 'berniece-rau', 'https://via.placeholder.com/300x300.png/0044ee?text=aut', 'Enim est ab illum officiis ut magni ea. Voluptatem consequatur iste dolores consequatur. Enim eaque asperiores iusto.', 'Ms. Celestine Kilback DDS', '1977-12-17 12:56:36', 957, 1),
(2236, 'Ms. Marjorie Douglas', '9797981833604', 'ms--marjorie-douglas', 'https://via.placeholder.com/300x300.png/008888?text=nihil', 'Qui sapiente repudiandae omnis provident voluptatem. Voluptas eum et aut. Itaque non aliquid assumenda. Ex sint omnis deleniti consequatur aut ratione eius. Exercitationem suscipit libero consequatur enim quo voluptate doloribus.', 'Catalina Dibbert', '1981-04-03 17:05:37', 784, 1),
(2237, 'Jake Rodriguez', '9785019207237', 'jake-rodriguez', 'https://via.placeholder.com/300x300.png/009944?text=aut', 'Harum voluptatem nulla velit quod sit. Distinctio pariatur laudantium quaerat enim. Voluptate pariatur dolor non aut dolorem blanditiis.', 'Shane Grant IV', '2022-03-28 15:11:04', 602, 1),
(2238, 'Bertram Rolfson', '9794518770906', 'bertram-rolfson', 'https://via.placeholder.com/300x300.png/004488?text=rerum', 'Maiores deserunt sed aspernatur et quae dolor. Culpa ut quibusdam voluptatem explicabo. Earum et non est. Alias maxime rerum eum culpa.', 'Brennon Daniel', '2017-07-05 10:26:39', 631, 1),
(2239, 'Maye Yost V', '9794629752655', 'maye-yost-v', 'https://via.placeholder.com/300x300.png/008800?text=voluptatibus', 'Ullam consectetur consequatur iste dolor. Qui totam laborum et sed eos nobis dolore. Possimus impedit nostrum quibusdam harum.', 'Caterina Keeling', '1977-11-19 16:33:16', 971, 1),
(2240, 'Mr. David Dare MD', '9788669163892', 'mr--david-dare-md', 'https://via.placeholder.com/300x300.png/00ddbb?text=excepturi', 'Rerum delectus aut amet consequuntur. Assumenda tenetur facilis provident ut esse esse. Consequatur illum optio officia atque.', 'Osborne Romaguera', '2014-06-24 18:13:29', 432, 1),
(2241, 'Madison Quitzon II', '9786118469748', 'madison-quitzon-ii', 'https://via.placeholder.com/300x300.png/00bbee?text=aliquid', 'Est alias reprehenderit voluptas. Autem labore consequatur qui illum sit eum. Animi tempore aliquam dolorum dolor qui. Eius repudiandae voluptatem qui.', 'Mr. Wilbert Frami', '2012-01-24 18:31:55', 748, 1),
(2242, 'Cleo Lueilwitz', '9795155037919', 'cleo-lueilwitz', 'https://via.placeholder.com/300x300.png/00ff22?text=eius', 'Qui id minima nobis voluptatem ab eligendi atque. Fugit ut minus non aliquam. Beatae asperiores quia voluptas in quam. Itaque dolorem consectetur libero culpa eos odio architecto.', 'Nikko Kunze', '1992-02-11 15:41:10', 705, 1),
(2243, 'Jane Green', '9793820521312', 'jane-green', 'https://via.placeholder.com/300x300.png/0011cc?text=fuga', 'Id et facilis libero non. Laboriosam illo pariatur labore non asperiores. In ut aliquid deleniti odit rem. Laborum maiores qui vel provident beatae voluptatem voluptas.', 'Jackie Braun', '2017-08-17 02:35:09', 709, 1),
(2244, 'Lonie Welch', '9782626990156', 'lonie-welch', 'https://via.placeholder.com/300x300.png/00ff33?text=nulla', 'Ut non quibusdam omnis quibusdam tempora fuga aut voluptatem. Tempora qui exercitationem sit dolor iste. Et eos laborum incidunt alias nihil dolores.', 'Dr. Elnora Christiansen', '2000-07-22 00:56:17', 454, 1),
(2245, 'Blake Lynch MD', '9787257373033', 'blake-lynch-md', 'https://via.placeholder.com/300x300.png/00ffee?text=beatae', 'Error est unde odit doloribus vel eum. Occaecati reiciendis vitae ut debitis quis. Consequatur numquam reprehenderit quis neque ea nulla. Consequatur omnis animi eius voluptas autem cupiditate ipsam.', 'Domenica Daniel', '2020-04-04 18:00:31', 687, 1),
(2246, 'Mauricio Nolan', '9796957993533', 'mauricio-nolan', 'https://via.placeholder.com/300x300.png/0044bb?text=vel', 'Sed consequatur odit maiores hic maxime. Ex molestiae et deserunt sed sit. Quo et fugiat eos labore.', 'Derek Ledner II', '1992-07-30 04:28:44', 431, 1),
(2247, 'Lynn Gerlach', '9788686716781', 'lynn-gerlach', 'https://via.placeholder.com/300x300.png/000000?text=voluptatem', 'Voluptatem aspernatur sequi earum voluptate. Et reiciendis sint et temporibus voluptas dolore provident.', 'Mr. Brayan Gaylord IV', '1980-10-04 22:12:09', 195, 1),
(2248, 'Lora Dickens', '9784138436542', 'lora-dickens', 'https://via.placeholder.com/300x300.png/0077bb?text=perferendis', 'Et quo pariatur alias debitis omnis dolor quasi. Id blanditiis excepturi illum. Non rem ab rerum eius rem. Consectetur distinctio expedita fuga exercitationem quis ipsum tempore.', 'Mrs. Sarina Tremblay', '2008-11-25 23:46:19', 775, 1),
(2249, 'Shane Weimann', '9784071575483', 'shane-weimann', 'https://via.placeholder.com/300x300.png/00aabb?text=ipsam', 'Commodi perspiciatis ut a. Vitae exercitationem qui ut qui. Dicta iusto voluptates maxime quia nulla.', 'Lewis Welch', '2008-05-25 22:41:20', 783, 1),
(2250, 'Polly Hoppe', '9788298407718', 'polly-hoppe', 'https://via.placeholder.com/300x300.png/0088ff?text=qui', 'Sunt commodi nisi nulla eaque tempore vitae. Nisi nobis accusantium maiores est vero animi cumque. Laborum nihil debitis nemo neque illum eum fuga.', 'Hillary Gottlieb V', '1980-11-26 18:51:56', 925, 1),
(2251, 'Mya Donnelly', '9786462177979', 'mya-donnelly', 'https://via.placeholder.com/300x300.png/00dd55?text=non', 'Quo sit et fuga ea libero. Sequi quo ullam sed maxime aut quasi. Non eius repellat ad voluptatibus neque pariatur non. Ipsum nulla qui aspernatur id.', 'Wallace Koelpin', '2008-05-08 18:43:59', 754, 1),
(2252, 'Mr. Tyreek Upton', '9784653353669', 'mr--tyreek-upton', 'https://via.placeholder.com/300x300.png/008888?text=impedit', 'Esse accusantium sed eaque perferendis. Maxime autem molestias repellendus. In maiores facilis similique. Sapiente pariatur voluptatum ad itaque perferendis ut modi. Et repellendus corrupti mollitia dolor quisquam suscipit sapiente.', 'Dion Gerlach', '2001-01-26 13:13:39', 630, 1),
(2253, 'Sophia Anderson', '9780178573230', 'sophia-anderson', 'https://via.placeholder.com/300x300.png/0011ee?text=aperiam', 'Error maiores est rerum facilis excepturi et voluptas. Consequatur libero cum quisquam quidem in molestiae. Dolorem illo aliquam voluptates iste sapiente.', 'Dr. Casimer Turcotte', '1998-06-26 15:18:56', 257, 1),
(2254, 'Miss Linnie Ruecker', '9798730233683', 'miss-linnie-ruecker', 'https://via.placeholder.com/300x300.png/0055bb?text=autem', 'Vel ad a officia. Eius asperiores repellendus saepe distinctio. Ut esse optio autem et recusandae debitis.', 'Miss Era Hand Sr.', '1981-04-11 12:20:28', 693, 1),
(2255, 'Mason Schaden', '9782362375514', 'mason-schaden', 'https://via.placeholder.com/300x300.png/0088ee?text=repellendus', 'Et repellendus voluptatem necessitatibus perspiciatis est ut. Eveniet nobis id qui voluptate quia. Minima non assumenda tempore odio odit ipsum. Commodi facere rerum animi debitis impedit.', 'Vicente Glover', '1998-06-24 19:56:58', 574, 1),
(2256, 'David Konopelski', '9796135529486', 'david-konopelski', 'https://via.placeholder.com/300x300.png/007799?text=pariatur', 'Omnis dolor et recusandae dolorem ut. Voluptatem voluptas est minus repellendus.', 'Susanna Kris', '2004-01-25 18:27:06', 156, 1),
(2257, 'Mireille Goyette', '9796221573492', 'mireille-goyette', 'https://via.placeholder.com/300x300.png/00ee22?text=ipsam', 'Nihil id eos omnis possimus rerum qui. Facere facere ea rerum animi ducimus accusamus. Similique qui nisi sequi maiores.', 'Emely Quigley', '1983-06-03 17:17:00', 242, 1),
(2258, 'Rex Kunze IV', '9784812100516', 'rex-kunze-iv', 'https://via.placeholder.com/300x300.png/00dd55?text=voluptas', 'Nulla maiores et voluptatem ut sequi molestias reprehenderit. Voluptas est molestiae perferendis nostrum unde vel. Eaque ut dolores ea error nostrum. Voluptas sequi impedit sed enim voluptates ea.', 'Jacinthe Dare', '2004-06-29 02:35:20', 380, 1),
(2259, 'Arely Howe', '9797083338953', 'arely-howe', 'https://via.placeholder.com/300x300.png/0011cc?text=est', 'Perferendis aperiam sit qui nihil culpa. Alias deserunt incidunt alias dolore consequatur. Nulla pariatur dolores iure sed.', 'Helmer Wehner III', '1973-10-20 09:33:40', 685, 1),
(2260, 'Willie Durgan', '9794018748627', 'willie-durgan', 'https://via.placeholder.com/300x300.png/001188?text=totam', 'Dolor eos adipisci optio repudiandae repellat. Et ut dolor architecto laborum. Rem sit dolorum ab qui vitae. Quasi eum earum mollitia explicabo cupiditate.', 'Mr. Tevin Armstrong', '1987-02-18 01:04:44', 709, 1),
(2261, 'Prof. Henri Skiles IV', '9790293424478', 'prof--henri-skiles-iv', 'https://via.placeholder.com/300x300.png/00ddcc?text=blanditiis', 'Et iusto id eveniet rerum. Et dicta ut est veniam rem voluptates. Corporis blanditiis unde similique.', 'Bridgette Kling', '1983-04-22 07:38:34', 563, 1),
(2262, 'Joey Haley V', '9785603006680', 'joey-haley-v', 'https://via.placeholder.com/300x300.png/00dd77?text=rerum', 'Quas omnis aperiam exercitationem sit magnam nihil. Eos pariatur enim similique vero aut. Qui eos aut ut qui. Culpa et quisquam totam eum harum sed est.', 'Paris Hartmann DDS', '1972-09-20 08:54:03', 194, 2),
(2263, 'Charlotte Heathcote', '9790596550805', 'charlotte-heathcote', 'https://via.placeholder.com/300x300.png/003399?text=consectetur', 'Nam debitis occaecati saepe sint. Illum necessitatibus fuga voluptates quia. Reiciendis amet distinctio veritatis rerum ullam.', 'Mr. Godfrey Wiza Jr.', '2017-08-26 18:10:01', 898, 2),
(2264, 'Earlene Goyette', '9790616987901', 'earlene-goyette', 'https://via.placeholder.com/300x300.png/002277?text=ex', 'Unde et ipsum maiores eos qui tempore. Consequatur itaque ut eos placeat beatae perferendis. At est voluptate cumque officiis.', 'Dr. Iliana Rowe', '1986-10-28 09:59:01', 360, 2),
(2265, 'Ms. Brenna Murray DDS', '9793447498233', 'ms--brenna-murray-dds', 'https://via.placeholder.com/300x300.png/00aa55?text=eos', 'Sequi eligendi ipsum sapiente voluptatem adipisci. Minus ex sapiente animi tempora expedita alias. Iure nam dolore nemo aliquid ducimus et qui.', 'Lexi Bradtke', '2017-08-03 16:46:03', 824, 2),
(2266, 'Malinda Kunze', '9790124020152', 'malinda-kunze', 'https://via.placeholder.com/300x300.png/005588?text=eum', 'Cum omnis est laudantium ut qui. Doloribus debitis autem id deleniti corrupti reiciendis expedita est. In libero mollitia ipsam aspernatur. Quo qui neque aut architecto.', 'Oscar Murray', '1995-02-06 04:23:35', 614, 2),
(2267, 'Mrs. Ressie Effertz Jr.', '9780410023455', 'mrs--ressie-effertz-jr-', 'https://via.placeholder.com/300x300.png/0055ee?text=et', 'Et est id consequatur eum est doloremque. Ab reprehenderit incidunt et ea. Consequatur esse hic ut qui non. Deserunt ut dolore exercitationem fugit blanditiis qui.', 'Dr. Olin Bernier', '1996-10-31 03:12:11', 273, 2),
(2268, 'Scarlett Crooks', '9781879825598', 'scarlett-crooks', 'https://via.placeholder.com/300x300.png/004455?text=totam', 'Eos voluptates totam maiores enim fugiat et eum cumque. Repudiandae voluptatem rerum quam. Molestiae eos occaecati est vel in consequatur eius. Quia ea asperiores ut dolores eligendi reiciendis.', 'Geo Rowe', '1981-11-05 13:08:21', 791, 2),
(2269, 'Prof. Carolina Borer', '9794726297165', 'prof--carolina-borer', 'https://via.placeholder.com/300x300.png/0066ee?text=fugit', 'Occaecati quia qui deserunt soluta rerum. Facere modi porro facere libero repellendus exercitationem. Et consequatur laborum quisquam excepturi. Quos velit error dicta et. Consequatur nobis magnam voluptatem culpa enim quia saepe.', 'Miss Chelsie Huels IV', '2020-01-10 23:54:55', 981, 2),
(2270, 'Pattie Carroll', '9796091314904', 'pattie-carroll', 'https://via.placeholder.com/300x300.png/0044cc?text=id', 'Ut omnis qui velit facere amet qui. Eligendi nobis quasi tempora. Voluptas repellendus omnis autem. Voluptatem accusamus ut quis laboriosam quibusdam est ducimus dolor.', 'Prof. Madelynn Streich', '2019-04-09 21:59:42', 323, 2),
(2271, 'Alize Kilback', '9795578992390', 'alize-kilback', 'https://via.placeholder.com/300x300.png/0033ee?text=aut', 'Rerum et aut maxime in. Architecto ad sed voluptatem itaque aut ipsa et. Possimus totam occaecati accusamus in recusandae voluptatem et.', 'Henry Kuhn', '2016-01-10 06:58:48', 589, 2),
(2272, 'Mr. Nathan Lebsack V', '9788219781149', 'mr--nathan-lebsack-v', 'https://via.placeholder.com/300x300.png/00dd66?text=aspernatur', 'Eum ex enim inventore ea facere sunt. Aliquam ipsum dolore atque molestiae iure. Aut blanditiis blanditiis voluptatem necessitatibus deleniti magni assumenda. Nihil assumenda quod voluptatum ut nemo quos.', 'Broderick Klocko', '2000-01-27 16:00:26', 963, 2),
(2273, 'Dr. Odessa Murray', '9790544776394', 'dr--odessa-murray', 'https://via.placeholder.com/300x300.png/007700?text=cum', 'Ratione sunt eum voluptatum consequuntur eum. Est culpa sunt recusandae. Cum quam nihil nisi temporibus error voluptas aut ut.', 'Mr. Raoul Bogisich Sr.', '1983-10-17 01:56:17', 852, 2),
(2274, 'Theodore Towne MD', '9785228402270', 'theodore-towne-md', 'https://via.placeholder.com/300x300.png/00bbbb?text=magni', 'At adipisci cupiditate ullam occaecati laboriosam soluta illo. Aliquam dolorem voluptas et est vel. Officiis nisi corporis suscipit. Id ex sit amet voluptatibus suscipit.', 'Hilma Fay', '2021-02-04 21:27:25', 279, 2),
(2275, 'Name Leuschke', '9784782737309', 'name-leuschke', 'https://via.placeholder.com/300x300.png/001133?text=nemo', 'Voluptatem aut et quia doloremque sint assumenda. Consequuntur quaerat illo consequuntur et adipisci. Voluptates iure eum distinctio. Qui dolor et consequuntur saepe similique inventore.', 'Bridgette Jast', '1985-08-17 18:14:31', 584, 2),
(2276, 'Desiree Lakin', '9798369053058', 'desiree-lakin', 'https://via.placeholder.com/300x300.png/007788?text=sit', 'Occaecati eligendi minus itaque. Soluta aut excepturi sunt laboriosam et. Quis accusamus adipisci dolorum accusamus cum. Eveniet autem natus tempora pariatur error quo culpa.', 'Daija Hammes', '2012-11-03 08:10:34', 960, 2),
(2277, 'Adolphus Halvorson', '9788066866594', 'adolphus-halvorson', 'https://via.placeholder.com/300x300.png/00ccff?text=consequatur', 'Labore veritatis vero quo delectus aperiam eos officiis. Ratione nulla nesciunt voluptatem voluptas minima beatae. Magni et sit quia sint nobis assumenda.', 'Clifton Eichmann', '1977-06-15 16:22:25', 348, 2),
(2278, 'Theodore Hagenes', '9799432618419', 'theodore-hagenes', 'https://via.placeholder.com/300x300.png/00cc33?text=voluptate', 'Animi velit aut reprehenderit ullam quo rerum nihil. Itaque necessitatibus a tenetur officia reprehenderit. Fugiat numquam consequuntur assumenda quidem impedit. Architecto velit quaerat soluta et esse perspiciatis deserunt.', 'Heaven Torphy', '1982-04-08 18:02:12', 505, 2),
(2279, 'Dustin Strosin', '9782626539515', 'dustin-strosin', 'https://via.placeholder.com/300x300.png/00bb33?text=sint', 'Repellat et repudiandae quos natus quis hic qui repellendus. Inventore saepe enim incidunt magnam sunt aut quia. Voluptas alias consequatur rerum sapiente dolorem.', 'Howard Emard', '1997-03-04 22:53:45', 712, 2),
(2280, 'Mario McDermott', '9792642046089', 'mario-mcdermott', 'https://via.placeholder.com/300x300.png/0044dd?text=eveniet', 'Fuga et voluptatem aut fugit. Minima suscipit numquam dolorum et. Quia aut quia dolore aperiam. Voluptatem ut enim esse. Architecto voluptas ad suscipit soluta ipsa.', 'Prof. Annamarie Tromp', '2006-09-21 07:33:04', 414, 2),
(2281, 'Angelita Stokes', '9788875471668', 'angelita-stokes', 'https://via.placeholder.com/300x300.png/00bbff?text=expedita', 'Eos numquam est nihil est. Velit qui ratione quam ut ab est. Blanditiis voluptas non maxime necessitatibus eos consequatur. Ducimus ab possimus ratione eum fuga odio nihil.', 'Coralie Hegmann Sr.', '1987-12-04 03:13:13', 345, 2),
(2282, 'Dr. Frances Mueller IV', '9793252087646', 'dr--frances-mueller-iv', 'https://via.placeholder.com/300x300.png/0077ee?text=dolores', 'Qui animi et amet at voluptatum et est. Sit quia officia soluta iste. Eum culpa vero mollitia alias harum ut. Dolores perferendis iusto neque eos ipsam eaque.', 'Jackie White', '1993-05-19 01:14:40', 411, 2),
(2283, 'Harmony Glover Jr.', '9799188174078', 'harmony-glover-jr-', 'https://via.placeholder.com/300x300.png/000022?text=modi', 'Consequuntur est ut qui laudantium totam assumenda ad. Voluptatum ipsum quis id aspernatur. Eum omnis nihil quam modi autem asperiores architecto fugiat. Molestiae necessitatibus eaque nostrum occaecati quibusdam et velit. Ea harum dolores accusamus id.', 'Gerry Weissnat', '1997-02-16 02:52:19', 461, 2),
(2284, 'Triston Hettinger PhD', '9780604740540', 'triston-hettinger-phd', 'https://via.placeholder.com/300x300.png/006622?text=cupiditate', 'Nesciunt sed molestiae dolor saepe est quis. Aliquam eveniet cumque maiores vel recusandae. Eos ipsa nam sapiente doloremque sequi molestiae molestiae. Animi porro ut hic distinctio ducimus eum quasi.', 'Christy Schinner DVM', '1991-11-14 04:36:03', 175, 2),
(2285, 'Prof. Noble Greenfelder', '9798995021599', 'prof--noble-greenfelder', 'https://via.placeholder.com/300x300.png/004422?text=ullam', 'Debitis maxime iure vel incidunt sit. Perferendis sunt mollitia facilis cupiditate. Libero et velit porro itaque ut est. Assumenda sunt velit ratione corrupti dolorum enim itaque illum.', 'Jedediah Schulist', '2008-04-14 06:49:07', 592, 2),
(2286, 'Jerry Miller V', '9781768909491', 'jerry-miller-v', 'https://via.placeholder.com/300x300.png/00aa99?text=asperiores', 'Et cupiditate ea ut. Qui perspiciatis optio est assumenda eos accusantium quibusdam quis. Beatae est dolores id quae illum voluptatem quasi.', 'Mr. Jo Hamill', '2023-01-07 14:09:38', 573, 2),
(2287, 'Miss Darby Kshlerin', '9787901391567', 'miss-darby-kshlerin', 'https://via.placeholder.com/300x300.png/003355?text=quae', 'Culpa ipsa magni aut. Voluptatem sit provident explicabo iste velit. Pariatur aut qui rerum. Adipisci voluptatem deleniti non iusto quas.', 'Dorcas Rolfson', '2003-06-13 03:08:56', 826, 2),
(2288, 'Llewellyn Murphy', '9798406852781', 'llewellyn-murphy', 'https://via.placeholder.com/300x300.png/000077?text=quasi', 'Ea sit earum sit dolorum dicta. Quia quod fuga ea sunt tempore. Sed atque voluptatibus facilis placeat.', 'Orval Reichert III', '1974-11-12 20:11:56', 934, 2),
(2289, 'Adriana Ziemann', '9791449782855', 'adriana-ziemann', 'https://via.placeholder.com/300x300.png/007733?text=tenetur', 'Doloribus quas soluta rem molestias dolor. Quos velit facere rerum laudantium molestias minima iste. Natus dolor est cumque tenetur nisi sit. Similique nam est iusto.', 'Watson Ferry', '1989-03-02 13:06:24', 589, 2),
(2290, 'Granville Hodkiewicz', '9796460448278', 'granville-hodkiewicz', 'https://via.placeholder.com/300x300.png/006600?text=tempora', 'Aliquam voluptatem reprehenderit omnis ut eius dignissimos. Voluptas doloribus et voluptas eum temporibus consequatur ipsam. Praesentium quos amet quo. Dolores excepturi est ab.', 'Alf O\'Hara', '1971-05-20 10:26:05', 319, 2),
(2291, 'Opal Huels', '9792284125036', 'opal-huels', 'https://via.placeholder.com/300x300.png/0055aa?text=beatae', 'Quia dolor sapiente quae similique aperiam est. Sunt aut velit consequatur iure repudiandae consequatur. Iste esse omnis eos nobis et eum in. Dolore qui repudiandae atque rerum.', 'Cesar Feest MD', '1995-10-02 15:11:22', 331, 2),
(2292, 'Dr. Ashleigh Pfeffer DVM', '9797251606198', 'dr--ashleigh-pfeffer-dvm', 'https://via.placeholder.com/300x300.png/00aa77?text=suscipit', 'Commodi quibusdam dolores quo. Ut veniam nobis quasi at voluptatem perspiciatis et. Quas ut natus dolorem fugiat. Rem veniam ab voluptatem est neque corrupti accusamus asperiores. Repellat perferendis harum reiciendis necessitatibus.', 'Dave Schowalter', '1970-03-23 19:14:38', 535, 2),
(2293, 'Luisa Schmidt', '9784617332389', 'luisa-schmidt', 'https://via.placeholder.com/300x300.png/0066bb?text=est', 'Et autem voluptatem magni enim ducimus voluptas. Architecto tempore suscipit sequi omnis. Quia dolorem qui vitae.', 'Mr. Abdul Swaniawski', '2004-06-19 19:22:54', 189, 2),
(2294, 'Edd Schiller', '9793392323895', 'edd-schiller', 'https://via.placeholder.com/300x300.png/0055ee?text=perferendis', 'Minima ea omnis doloribus dicta et praesentium aliquid blanditiis. Consequuntur dignissimos facilis maxime enim deleniti consequatur fuga. In aut rerum numquam esse perferendis qui eum. Aliquid sed veniam est velit.', 'Brandt Larkin DVM', '1993-02-04 11:58:04', 461, 2),
(2295, 'Zechariah Kub', '9794275716674', 'zechariah-kub', 'https://via.placeholder.com/300x300.png/0066dd?text=amet', 'Non maxime et in sequi ut ut. Veritatis dolor cumque aspernatur consequatur et rerum ipsum. Odio commodi iusto aut.', 'Miss Selina Fritsch', '2012-11-03 04:02:23', 932, 2),
(2296, 'Jovan Parisian', '9790863289896', 'jovan-parisian', 'https://via.placeholder.com/300x300.png/006622?text=autem', 'Sit et nisi adipisci assumenda veritatis adipisci optio in. Nam minus saepe nostrum aut vel dolorum repellat. Distinctio minima fuga repellendus commodi dolor est similique est.', 'Justyn Gleason', '2005-07-10 14:49:38', 714, 2),
(2297, 'Dr. Simone Ankunding MD', '9793825936111', 'dr--simone-ankunding-md', 'https://via.placeholder.com/300x300.png/005566?text=veritatis', 'Et aut quas aut. Perferendis qui et quam harum aperiam. Ut voluptatem doloribus ullam quas aliquam ipsa. Ut eius ipsam in et quia.', 'Douglas Marks', '2020-08-30 17:54:32', 602, 2),
(2298, 'Enos Bernhard', '9789630026475', 'enos-bernhard', 'https://via.placeholder.com/300x300.png/00eecc?text=alias', 'Aut omnis et quia unde et distinctio. Et ducimus cum repudiandae nostrum distinctio mollitia. Fuga in rerum ipsum deserunt exercitationem atque.', 'Dr. Rosendo Thompson', '2001-10-20 20:34:10', 819, 2),
(2299, 'Lucile Botsford', '9784514970202', 'lucile-botsford', 'https://via.placeholder.com/300x300.png/00dd33?text=ratione', 'Distinctio esse nisi autem et ab omnis. Atque dolor aut optio sint sint aut. Voluptas natus autem labore deleniti deleniti sint quia.', 'Pinkie Ondricka', '2009-07-28 08:43:47', 451, 2),
(2300, 'Valentine Parker Sr.', '9780055140210', 'valentine-parker-sr-', 'https://via.placeholder.com/300x300.png/006688?text=expedita', 'Ea eaque ducimus dignissimos animi dolores magnam. Nisi laborum hic repellendus voluptate et esse officiis. Debitis qui aut sunt sit recusandae enim eveniet. Qui sunt eligendi aut quo ut odio totam. Incidunt et autem delectus.', 'Pamela Gibson', '2007-02-04 12:41:40', 183, 2),
(2301, 'Jacky Jacobi', '9793877838449', 'jacky-jacobi', 'https://via.placeholder.com/300x300.png/004466?text=sit', 'Rerum id quod sint dolorum sint ex expedita. Omnis nam qui pariatur beatae natus neque qui. Velit et voluptatibus in blanditiis earum et dolore et. Ex doloremque asperiores corporis est.', 'Rubye Donnelly', '2006-08-29 11:42:28', 309, 2),
(2302, 'Felton Lebsack', '9786663035443', 'felton-lebsack', 'https://via.placeholder.com/300x300.png/0000ee?text=aut', 'Cum omnis non qui voluptas. Quae ut veniam repudiandae mollitia magni. Temporibus vel ipsum at voluptas praesentium omnis adipisci.', 'Prof. Izabella Stokes DDS', '2019-12-21 11:01:29', 926, 2),
(2303, 'Norene Denesik', '9798451699294', 'norene-denesik', 'https://via.placeholder.com/300x300.png/00bbaa?text=necessitatibus', 'Id labore minima ipsum similique rerum consequatur aliquid. Ducimus labore officiis dolorum sapiente velit. Quam porro sapiente provident at sit est.', 'Audrey Morar', '2020-03-18 20:08:14', 233, 2),
(2304, 'Dixie Kunde', '9798158503528', 'dixie-kunde', 'https://via.placeholder.com/300x300.png/0088cc?text=vel', 'Dolores voluptas et maiores et. Vel voluptatem sint placeat. Quaerat et ipsam tempora enim natus ut. Inventore ipsa laboriosam saepe voluptatem nesciunt aspernatur.', 'Dr. Rollin Rodriguez IV', '1978-08-10 16:52:20', 189, 2),
(2305, 'Devan Parisian IV', '9793830879939', 'devan-parisian-iv', 'https://via.placeholder.com/300x300.png/00eecc?text=cupiditate', 'Distinctio incidunt sint sunt maxime explicabo recusandae aut sed. Exercitationem eum eligendi officiis ut veniam laudantium vero in. Dicta atque cumque et unde maxime voluptate aut impedit.', 'Ophelia Buckridge Jr.', '2013-07-18 01:13:30', 494, 2),
(2306, 'Rigoberto Grady', '9786086711498', 'rigoberto-grady', 'https://via.placeholder.com/300x300.png/006688?text=provident', 'Sequi quis ut labore odit enim aut. Veritatis sunt labore ipsam qui nihil officia nihil. Quia aut error sint molestiae mollitia.', 'Wava Heathcote', '1988-09-04 07:30:21', 822, 2),
(2307, 'Isabella Predovic', '9797229409011', 'isabella-predovic', 'https://via.placeholder.com/300x300.png/005599?text=laudantium', 'Eos aut rem aperiam quis tenetur ea. Molestiae iste ut ex beatae quae iste. Ratione quo et et ad minus rerum doloremque. Amet occaecati cupiditate mollitia et deserunt praesentium atque consequuntur.', 'Oren West', '1983-05-29 13:27:33', 873, 2),
(2308, 'Nathanial Corwin', '9782988464845', 'nathanial-corwin', 'https://via.placeholder.com/300x300.png/001188?text=quia', 'Modi doloribus necessitatibus velit quod minima modi ut porro. Omnis distinctio deleniti ab earum. Vero ea totam dolore itaque aliquid minus. Quidem inventore quo quos.', 'Michaela Carroll', '2007-12-07 20:07:15', 457, 2),
(2309, 'Eldora Dibbert', '9799881432246', 'eldora-dibbert', 'https://via.placeholder.com/300x300.png/00cc55?text=ullam', 'Quos voluptate quia voluptates amet quidem est sit. Ut sint sit officiis sint.', 'Miss Eveline Kassulke Jr.', '1996-04-16 09:24:33', 685, 2),
(2310, 'Carmella Koch', '9783654554488', 'carmella-koch', 'https://via.placeholder.com/300x300.png/00eedd?text=sit', 'Beatae mollitia laborum aut tempora. Non harum itaque deserunt et. Rerum ullam explicabo optio quis qui. Vel vero itaque sit quos enim quia. Dolores numquam nostrum nemo in nostrum nobis quas.', 'Selena Fritsch', '2004-05-20 13:32:19', 505, 2),
(2311, 'Chelsey Jaskolski III', '9784162182781', 'chelsey-jaskolski-iii', 'https://via.placeholder.com/300x300.png/00ee88?text=placeat', 'At quia aperiam asperiores ratione quis quaerat. Unde id ut et aliquid. Voluptatem est consequatur optio rerum iusto ut facilis ut.', 'Elnora McKenzie', '1970-11-07 19:55:41', 748, 2),
(2312, 'Rubye Thompson', '9782996798499', 'rubye-thompson', 'https://via.placeholder.com/300x300.png/00ff66?text=quasi', 'Dignissimos et eligendi saepe ut. Eveniet suscipit architecto aut vero.', 'Esther Langworth', '1996-07-18 08:29:20', 736, 2),
(2313, 'Kobe Kutch V', '9791988768259', 'kobe-kutch-v', 'https://via.placeholder.com/300x300.png/00bbaa?text=voluptatibus', 'Ut id placeat commodi tempora possimus officiis. Officiis totam molestiae vel dignissimos debitis excepturi sed. Et voluptatibus in quis officia numquam quae aperiam.', 'Olin Walsh III', '1994-09-30 11:18:27', 834, 2),
(2314, 'Christine Torp', '9798850013929', 'christine-torp', 'https://via.placeholder.com/300x300.png/007722?text=rerum', 'Minus et occaecati voluptatum saepe vel repellendus ratione. Ut omnis nisi et. Quo consequatur est quae consequuntur perspiciatis ab. Ut explicabo corporis non adipisci.', 'Ms. Kasey Smitham', '2005-07-21 01:52:10', 408, 2),
(2315, 'Brayan Stroman', '9798823180474', 'brayan-stroman', 'https://via.placeholder.com/300x300.png/009966?text=dolores', 'Voluptas exercitationem ut repellat repellat qui architecto. Eligendi repellat architecto quibusdam ullam alias qui dignissimos. Sint maxime iusto vel quibusdam facere labore. Et molestiae iusto non nemo culpa magnam.', 'Estell Zemlak', '2019-08-10 08:47:33', 144, 3),
(2316, 'Mr. Zachariah Kihn', '9795658675922', 'mr--zachariah-kihn', 'https://via.placeholder.com/300x300.png/00aa44?text=qui', 'Doloribus itaque enim dolores et et. Occaecati provident repellendus nam. Asperiores ipsam libero saepe animi nihil. Sunt qui veritatis voluptates aut.', 'Lupe Schneider Sr.', '2013-06-13 00:14:22', 435, 3),
(2317, 'Enoch Walsh Jr.', '9781414252926', 'enoch-walsh-jr-', 'https://via.placeholder.com/300x300.png/005511?text=omnis', 'Non quidem ratione iste dolorem. Veritatis asperiores qui repellat quasi eum. Odit assumenda hic ut natus commodi consectetur reiciendis.', 'Aiyana Hamill Sr.', '2013-10-29 16:40:36', 639, 3),
(2318, 'Miss Euna Wisozk', '9784327610005', 'miss-euna-wisozk', 'https://via.placeholder.com/300x300.png/00eecc?text=ipsum', 'Assumenda voluptate veniam quaerat est. Illum aut amet eum quasi. Vel reprehenderit quaerat facere sed.', 'Nicole Cummings', '1989-10-10 16:34:03', 607, 3),
(2319, 'Mr. Billy Runolfsson PhD', '9790235088867', 'mr--billy-runolfsson-phd', 'https://via.placeholder.com/300x300.png/005566?text=repellat', 'Temporibus dolor vero dolorem at est rem. Aspernatur omnis ab et recusandae dolorem odit et. Distinctio impedit aut animi aut aliquid minus. Sit in quia et error quo illo.', 'Dr. Cortney Bruen', '1970-07-25 15:06:57', 632, 3),
(2320, 'Peyton Steuber', '9788418570810', 'peyton-steuber', 'https://via.placeholder.com/300x300.png/0055ee?text=omnis', 'Tempora vel eos eligendi numquam sint at. Aliquid quia id facere eius modi aut. Cum eum enim reprehenderit vel.', 'Mrs. Shanie Grady', '2018-01-27 03:22:28', 575, 3),
(2321, 'Shania Schowalter', '9795597919118', 'shania-schowalter', 'https://via.placeholder.com/300x300.png/002288?text=qui', 'Pariatur ipsam voluptas quia. Totam voluptatem soluta deleniti necessitatibus deserunt. Ad dolorum est eaque reprehenderit.', 'Boyd Christiansen III', '2004-08-06 20:24:17', 146, 3),
(2322, 'Burley Cartwright I', '9782471743761', 'burley-cartwright-i', 'https://via.placeholder.com/300x300.png/0011dd?text=cupiditate', 'Molestiae exercitationem magnam sed voluptate dolorem temporibus rerum. Rerum sapiente pariatur cumque consectetur in ea et. Unde assumenda beatae praesentium suscipit consectetur quia. Ut qui quod nam et nihil eveniet ducimus.', 'Mr. Kendrick Reynolds', '1998-05-18 18:22:28', 683, 3),
(2323, 'Liana Pagac PhD', '9784927003009', 'liana-pagac-phd', 'https://via.placeholder.com/300x300.png/0033dd?text=officiis', 'Eius omnis omnis eos ut. Vitae voluptates voluptatem voluptate vero. Qui veritatis quis consequatur aperiam et omnis delectus.', 'Kendra Pagac', '1995-06-12 19:02:07', 882, 3),
(2324, 'Genevieve Marquardt', '9794840057508', 'genevieve-marquardt', 'https://via.placeholder.com/300x300.png/0000bb?text=sit', 'Impedit quo a voluptas ut sequi et. Quo est voluptas magni et iure sapiente. Eius fugit aliquam consectetur nesciunt culpa earum ut dolores.', 'Estevan Grimes', '1979-09-25 10:40:48', 396, 3),
(2325, 'Rubie Green', '9792869709712', 'rubie-green', 'https://via.placeholder.com/300x300.png/0066cc?text=non', 'Fugit sed est qui repellat deleniti expedita. Inventore aut ipsam architecto non dolorum corrupti optio. Fugit sit vel necessitatibus molestiae praesentium asperiores quidem. Voluptatem exercitationem nostrum provident ad molestiae rem et.', 'Mr. Guillermo Runolfsdottir', '1985-05-20 09:20:27', 391, 3),
(2326, 'Ronaldo Mayert', '9783607894746', 'ronaldo-mayert', 'https://via.placeholder.com/300x300.png/005555?text=dolorum', 'Ex quam ducimus nihil amet omnis molestiae provident id. Ea et unde explicabo accusamus quia veritatis. Rerum quaerat aut nesciunt mollitia. Id cupiditate qui fugit cupiditate autem. Itaque non accusantium similique nam at dolores.', 'Mr. Owen Kautzer', '2016-11-10 17:28:31', 610, 3),
(2327, 'Miss Christa Eichmann DDS', '9797284616768', 'miss-christa-eichmann-dds', 'https://via.placeholder.com/300x300.png/00dd44?text=veritatis', 'Quo quidem nemo qui perferendis maxime ad rerum. Sed quo distinctio aut expedita qui et. Repudiandae et dolorem est sed et deleniti voluptatem.', 'Keyon McDermott', '2019-07-28 02:02:12', 442, 3),
(2328, 'Jalon Bailey', '9787888308282', 'jalon-bailey', 'https://via.placeholder.com/300x300.png/004400?text=repellendus', 'Nulla dolorem sunt reprehenderit laborum sed molestiae dolores aspernatur. Omnis sunt nobis rem. Consequuntur id nulla architecto et.', 'Dr. Humberto Marks', '1987-12-19 15:24:24', 192, 3),
(2329, 'Callie Rippin DDS', '9793230401426', 'callie-rippin-dds', 'https://via.placeholder.com/300x300.png/00eeee?text=necessitatibus', 'Rerum eum aspernatur et et. Voluptatem omnis atque expedita et quo qui consequatur. Adipisci maiores cupiditate hic voluptatum. A accusamus vel ut eveniet non dolor nisi labore. Et cumque animi voluptatem corporis animi aut placeat et.', 'Darien Monahan', '1980-02-02 18:58:00', 276, 3),
(2330, 'Emmalee Schamberger', '9784260660426', 'emmalee-schamberger', 'https://via.placeholder.com/300x300.png/004455?text=enim', 'Reiciendis perspiciatis mollitia dolorem accusamus dolorem. Ut aut illum dolor dolore molestiae. Temporibus tempore excepturi qui minus sed. Atque ut ad vero pariatur molestiae et.', 'Jordan Gusikowski', '1976-03-05 18:16:36', 596, 3),
(2331, 'Trever Donnelly', '9791505776590', 'trever-donnelly', 'https://via.placeholder.com/300x300.png/0099ee?text=expedita', 'Dolorum occaecati qui vitae ut et aut voluptas blanditiis. Adipisci reiciendis soluta aut.', 'Gardner Donnelly', '1973-11-24 17:05:34', 415, 3),
(2332, 'Melisa Marvin IV', '9798357973948', 'melisa-marvin-iv', 'https://via.placeholder.com/300x300.png/00ffee?text=voluptate', 'Quod velit assumenda quibusdam aut voluptate culpa. Ea earum qui accusamus. Modi aliquid placeat consequatur sint. Sit magni eos animi doloribus.', 'Patrick Koelpin', '2007-08-30 10:36:49', 378, 3),
(2333, 'Phyllis Bode', '9797302750009', 'phyllis-bode', 'https://via.placeholder.com/300x300.png/00aa77?text=illum', 'Molestiae quo distinctio et error sed tempora et. Maxime minima ipsum quibusdam. Necessitatibus et illo delectus a. Doloribus magni fugit blanditiis hic nulla accusantium. Nam sed ullam debitis eaque natus dolor consequatur quidem.', 'Prof. Dorothea Kuhic', '1984-07-08 13:35:43', 201, 3),
(2334, 'Dixie Bogan', '9790874398167', 'dixie-bogan', 'https://via.placeholder.com/300x300.png/0044cc?text=quia', 'Voluptatibus deleniti dolor consequuntur cupiditate tenetur voluptatum fugiat. Consequatur est nihil voluptatem maxime aspernatur amet dignissimos. Quo quae et aperiam aspernatur voluptatem numquam itaque quia. Quisquam perferendis et aut.', 'Nasir Champlin', '1986-11-23 08:18:53', 119, 3),
(2335, 'Dino Ledner', '9781988575346', 'dino-ledner', 'https://via.placeholder.com/300x300.png/00ffaa?text=accusamus', 'Ipsum itaque deleniti quibusdam cupiditate molestiae dolorem adipisci. Explicabo assumenda quo vel dicta voluptatem. Consequuntur maiores voluptas reiciendis quia voluptas.', 'Cleve Littel', '1992-07-16 17:49:14', 210, 3),
(2336, 'Oma Hyatt', '9798175760997', 'oma-hyatt', 'https://via.placeholder.com/300x300.png/006666?text=nihil', 'Unde eaque aperiam aut. Eum ut eveniet aut aut. Ut ad voluptatum repellat architecto molestiae. Molestiae corrupti consectetur molestias mollitia exercitationem ut.', 'Miss Name Turcotte', '2023-11-26 20:03:27', 441, 3),
(2337, 'Matteo Gutkowski III', '9780714287683', 'matteo-gutkowski-iii', 'https://via.placeholder.com/300x300.png/007711?text=libero', 'Quam voluptas aperiam ut delectus doloremque quo sint. Voluptatem excepturi ipsam dolor tempora non. Libero soluta veritatis omnis. Numquam qui aliquid ullam. Perspiciatis qui adipisci velit est sed illum eum occaecati.', 'Elisha Yundt', '1980-11-27 06:43:46', 296, 3),
(2338, 'Levi Weissnat', '9798611024188', 'levi-weissnat', 'https://via.placeholder.com/300x300.png/0055bb?text=explicabo', 'Dolores similique sunt est neque. Non laudantium harum doloribus consequatur. Nam amet alias deleniti quo distinctio. Ullam repudiandae voluptatem qui dicta vero voluptates.', 'Vida Eichmann', '1996-08-31 14:35:48', 885, 3),
(2339, 'Lemuel Wolff', '9793737091861', 'lemuel-wolff', 'https://via.placeholder.com/300x300.png/0022cc?text=illum', 'Non qui tenetur aut rerum. Eos labore doloremque occaecati eum. Ut qui quia nihil enim.', 'Adrienne Reynolds', '2001-01-21 03:10:24', 161, 3),
(2340, 'Lisa Kemmer', '9790067626794', 'lisa-kemmer', 'https://via.placeholder.com/300x300.png/00aa44?text=voluptatem', 'Officiis earum quas voluptas est nam accusamus reiciendis consequuntur. Ea voluptatum aut repellat rerum. Neque enim voluptas minima dignissimos qui vero quo sit. Ut ipsum eos id aut.', 'Cooper Wiza', '1985-07-21 02:33:38', 694, 3),
(2341, 'Flavio Nikolaus', '9790101366938', 'flavio-nikolaus', 'https://via.placeholder.com/300x300.png/00aa55?text=quo', 'Ipsum quod voluptas veniam quo eligendi. Minima qui qui sit ea accusantium magni. Nihil ipsa optio temporibus voluptatum. Dolor sed voluptatem alias.', 'Otis Daugherty', '2009-04-26 21:55:36', 551, 3),
(2342, 'Ms. Verla Nitzsche', '9784439660769', 'ms--verla-nitzsche', 'https://via.placeholder.com/300x300.png/00ff22?text=est', 'Earum et rerum non necessitatibus quia. Illo tempora animi qui minus necessitatibus ut earum. Aut sed dolore harum voluptatibus aliquam. Harum et accusamus illo quia.', 'Mrs. Leda Jaskolski MD', '1970-03-30 01:00:17', 544, 3),
(2343, 'Savannah Bednar', '9780830344710', 'savannah-bednar', 'https://via.placeholder.com/300x300.png/007700?text=earum', 'Iusto mollitia aspernatur repellendus magni omnis veritatis culpa. Commodi dolores libero necessitatibus ratione. Aperiam tempora esse voluptatibus tempora.', 'Miss Lilly Willms', '2006-04-11 17:40:16', 131, 3),
(2344, 'Prof. Vella Dooley', '9785033666256', 'prof--vella-dooley', 'https://via.placeholder.com/300x300.png/007799?text=quidem', 'Magnam mollitia et quae excepturi quibusdam eos consectetur. Possimus est autem rerum consectetur non. Quas voluptatem est qui mollitia delectus. Est qui aut ut suscipit.', 'Mrs. Drew Mertz V', '1990-06-09 06:29:17', 145, 3),
(2345, 'Dusty Herman', '9793282230555', 'dusty-herman', 'https://via.placeholder.com/300x300.png/009988?text=labore', 'Ipsam nihil necessitatibus et temporibus consequatur. Quaerat dolore perferendis harum deleniti. Repellendus qui et neque quia quia sit iste. Qui ut quis sunt architecto. Incidunt commodi et est veniam repudiandae.', 'Joel Schmidt', '1974-08-18 08:54:45', 546, 3),
(2346, 'Allan Hagenes', '9784626903006', 'allan-hagenes', 'https://via.placeholder.com/300x300.png/00aa44?text=non', 'Vero eius iusto omnis quidem. Dicta impedit ut aspernatur perspiciatis. Necessitatibus maiores ad voluptatem ut sunt. Deleniti consequatur rem autem ad aliquid omnis quia velit.', 'Dr. Keegan Runolfsson DVM', '2007-09-15 13:04:11', 805, 3),
(2347, 'Rosina Jerde', '9795580377802', 'rosina-jerde', 'https://via.placeholder.com/300x300.png/00ee55?text=quidem', 'Voluptas cum quia sed eligendi. Non omnis at eaque distinctio. Laborum sit quis deserunt voluptas.', 'Marcel Johns', '1993-08-11 12:39:44', 174, 3),
(2348, 'Dr. Green Eichmann', '9798001499985', 'dr--green-eichmann', 'https://via.placeholder.com/300x300.png/0099aa?text=dolores', 'Quos dicta ducimus iste inventore doloremque. Quis sint et blanditiis deserunt eligendi a dolores. Cupiditate sed dolores qui vel qui laudantium expedita nihil.', 'Harold Harvey', '1975-10-09 11:36:39', 664, 3),
(2349, 'Franco Ortiz', '9793791696330', 'franco-ortiz', 'https://via.placeholder.com/300x300.png/001166?text=qui', 'Numquam ratione nihil a autem dignissimos nulla. Soluta corporis molestiae ab fugiat. Sint qui sunt ad ut architecto odio debitis velit. Qui modi sunt id officia ea.', 'Prof. Amir Gorczany DDS', '1996-07-09 17:18:57', 644, 3),
(2350, 'Miss Candace Spinka', '9784341474850', 'miss-candace-spinka', 'https://via.placeholder.com/300x300.png/0000aa?text=et', 'Iure ut reiciendis aspernatur. Numquam non et in temporibus. Dignissimos distinctio vel id aut ipsa.', 'Brody Koss', '1993-01-26 20:18:44', 924, 3),
(2351, 'Ms. Ericka Hudson', '9781077534575', 'ms--ericka-hudson', 'https://via.placeholder.com/300x300.png/00dd66?text=ut', 'Non corrupti et enim voluptate. Aliquid sit consectetur consectetur quisquam. Voluptatem quia et quasi qui consequuntur perspiciatis. Reiciendis repellat ad qui et quia quibusdam.', 'Lolita Renner', '2014-05-22 11:39:15', 823, 3),
(2352, 'Alisa Simonis', '9795261247523', 'alisa-simonis', 'https://via.placeholder.com/300x300.png/0055ee?text=itaque', 'Consequatur culpa explicabo ratione sint laboriosam maiores odit assumenda. Nam qui voluptates et molestias explicabo id quia. At omnis similique voluptates optio exercitationem ut molestiae.', 'Ronaldo Murphy', '2020-05-07 11:20:48', 655, 3);
INSERT INTO `livres` (`id`, `titre`, `isbn`, `slug`, `image`, `resume`, `editeur`, `edited_at`, `prix`, `categorie_id`) VALUES
(2353, 'Mr. Nat Anderson Sr.', '9783361340619', 'mr--nat-anderson-sr-', 'https://via.placeholder.com/300x300.png/00ccdd?text=harum', 'Reiciendis nihil qui minima ipsum quo qui. Dolores ut et veniam quidem ipsa ipsum animi. Provident officiis sed deleniti eius ut quaerat. Eveniet magnam error nesciunt error.', 'Itzel Towne', '1971-09-24 21:46:03', 248, 3),
(2354, 'Immanuel Watsica', '9781057074565', 'immanuel-watsica', 'https://via.placeholder.com/300x300.png/00aa99?text=eos', 'Odit ut veritatis facilis aut earum. Consequuntur recusandae totam est minus vel accusantium. Et veritatis illo dolor beatae voluptatem.', 'Ariane Upton', '1983-11-30 23:41:57', 755, 3),
(2355, 'Mrs. Veda Predovic', '9788862814645', 'mrs--veda-predovic', 'https://via.placeholder.com/300x300.png/00cc22?text=aut', 'Exercitationem animi quo aliquid officiis saepe aliquam. Voluptas rerum quis eligendi quo. Quaerat atque placeat dignissimos ipsa deserunt velit recusandae.', 'Myrtis Emard', '2013-12-20 06:17:57', 446, 3),
(2356, 'Taylor Keeling', '9783969752630', 'taylor-keeling', 'https://via.placeholder.com/300x300.png/0011cc?text=excepturi', 'Reiciendis in cum quis saepe officia harum. Quae laborum explicabo repellendus et deserunt corporis. A vel corrupti nulla et pariatur consequatur. Dignissimos cupiditate sunt voluptatem vitae sunt nulla.', 'Lois Wilderman Jr.', '1995-03-15 00:40:42', 431, 3),
(2357, 'Kari Hahn DDS', '9780861968442', 'kari-hahn-dds', 'https://via.placeholder.com/300x300.png/005511?text=exercitationem', 'Enim maxime repellat et. Fugit necessitatibus vero praesentium ea ut nisi. Qui qui veritatis doloribus.', 'Miss Marcelina Quitzon DVM', '1984-03-27 05:12:08', 678, 3),
(2358, 'Zoey Strosin', '9783409280402', 'zoey-strosin', 'https://via.placeholder.com/300x300.png/006644?text=reiciendis', 'Harum cum ipsa soluta laboriosam non suscipit. Non sint et dolorem tempore non ipsa vero. Harum sed suscipit velit voluptate dolorem.', 'Dr. Jolie Ward', '1993-09-08 11:55:35', 445, 3),
(2359, 'Prof. Brannon Roob', '9798631776807', 'prof--brannon-roob', 'https://via.placeholder.com/300x300.png/002244?text=soluta', 'Nemo inventore dolorum reiciendis aut tenetur voluptas qui blanditiis. Excepturi quaerat non hic dolor voluptatem. Eligendi inventore natus vel labore sequi aut. Voluptatem id sapiente maiores est.', 'Mrs. Magdalena Anderson PhD', '1982-04-03 00:15:59', 502, 3),
(2360, 'Ms. Eleanora Orn', '9797545424484', 'ms--eleanora-orn', 'https://via.placeholder.com/300x300.png/00ccff?text=eligendi', 'Inventore ex eum fuga dolore magni. Dolor sunt sint voluptates. Culpa veniam molestias doloremque consequuntur quam corporis voluptate. Perspiciatis placeat excepturi in magnam quia veritatis modi maiores.', 'Nikolas Emmerich', '1974-08-28 23:03:05', 310, 3),
(2361, 'Dr. Zander O\'Hara', '9788134353780', 'dr--zander-o-hara', 'https://via.placeholder.com/300x300.png/00aa55?text=occaecati', 'Sit numquam soluta dignissimos harum necessitatibus reiciendis aliquid. Itaque recusandae pariatur illo ut itaque voluptas fugiat eligendi. Sit omnis sit velit qui explicabo cumque.', 'Kian Bergnaum', '2005-06-07 23:59:43', 299, 3),
(2362, 'Shaylee Block', '9790582894777', 'shaylee-block', 'https://via.placeholder.com/300x300.png/00bbcc?text=aut', 'Id eaque temporibus porro rerum qui veritatis doloribus. Id omnis dignissimos dolor ut ab quia. Nostrum impedit nihil at illo nam aliquam. Ducimus hic blanditiis mollitia perferendis rerum est fuga. Ad similique a omnis consequatur praesentium quo enim.', 'Dillon Skiles', '1971-11-16 13:07:18', 163, 3),
(2363, 'Angelina Nader', '9795003982743', 'angelina-nader', 'https://via.placeholder.com/300x300.png/006633?text=eaque', 'Aut dolorem blanditiis perspiciatis porro ducimus veniam sint. Deserunt distinctio fugit sunt dignissimos iure.', 'Prof. Euna Cronin MD', '1976-04-16 20:53:51', 830, 3),
(2364, 'Ava Quigley', '9796303206928', 'ava-quigley', 'https://via.placeholder.com/300x300.png/00dddd?text=saepe', 'Consectetur omnis doloribus enim vel illum vero fugit. Consectetur et omnis dolorem voluptatem. Dolor doloribus doloremque est assumenda facilis quo laudantium.', 'Dewayne Feest III', '2011-05-09 22:36:57', 885, 3),
(2365, 'Brannon Morar', '9792277886739', 'brannon-morar', 'https://via.placeholder.com/300x300.png/0099ee?text=error', 'Quasi molestiae sunt qui deleniti officia aut placeat numquam. Animi ut eveniet provident accusamus et voluptas nemo. Omnis blanditiis in aspernatur in. Velit officia asperiores iure aut.', 'Ernestina Reichel', '1995-12-19 02:15:10', 440, 3),
(2366, 'Prof. Baron Pfeffer Sr.', '9780209780880', 'prof--baron-pfeffer-sr-', 'https://via.placeholder.com/300x300.png/00ccee?text=et', 'Illo incidunt libero sint ducimus. Est error blanditiis non accusantium reprehenderit eos.', 'Dolly Crona', '1970-08-24 09:51:52', 665, 3),
(2367, 'Wilbert Kirlin', '9786189646772', 'wilbert-kirlin', 'https://via.placeholder.com/300x300.png/003333?text=quia', 'Magni tempora et accusantium fugit id voluptas. Nobis eum perspiciatis ipsa eum et dolorem. Praesentium ea ratione fugit possimus inventore.', 'Jacklyn Rolfson Jr.', '1979-01-17 10:04:02', 358, 3),
(2368, 'Cecelia Lesch', '9787724232368', 'cecelia-lesch', 'https://via.placeholder.com/300x300.png/006600?text=aut', 'Magnam pariatur eos ipsam amet nemo qui ducimus deleniti. Totam aut totam ad in ut est aut exercitationem. Similique sunt autem aut velit aspernatur omnis dolorem ea.', 'Mr. Henry Kutch', '1974-12-03 23:55:47', 305, 3),
(2369, 'Jed O\'Keefe', '9782168809022', 'jed-o-keefe', 'https://via.placeholder.com/300x300.png/00aaff?text=sed', 'Veritatis molestiae ea molestias. Id vel temporibus illo et illo sint. Quaerat et porro minima autem a. Vero voluptas temporibus sint iusto est eligendi.', 'Pasquale Ortiz MD', '1995-12-05 07:12:41', 229, 3),
(2370, 'Mr. Jerald Collins', '9781293087008', 'mr--jerald-collins', 'https://via.placeholder.com/300x300.png/004400?text=nam', 'Officiis repellat est dignissimos quos. Hic qui enim consequatur odio hic at. Voluptas quia qui aut modi. Ut excepturi velit unde ratione sunt atque.', 'Celestine Skiles II', '2023-11-19 13:14:08', 177, 3),
(2371, 'Loy Rice V', '9794972868393', 'loy-rice-v', 'https://via.placeholder.com/300x300.png/007777?text=voluptates', 'Molestiae explicabo voluptate explicabo at. Rem aperiam maiores qui fugiat aut. Dolores rerum ex aut laudantium.', 'Gunner Lang', '1995-11-10 07:36:28', 902, 3),
(2372, 'Marge Treutel', '9787585482209', 'marge-treutel', 'https://via.placeholder.com/300x300.png/00bb55?text=explicabo', 'Et voluptatum omnis rerum aut quidem. Illum officiis nihil sint quis est porro asperiores.', 'Arjun Wilderman', '1985-01-29 08:00:31', 942, 3),
(2373, 'Thad Blick', '9795259620314', 'thad-blick', 'https://via.placeholder.com/300x300.png/007777?text=sequi', 'Dicta architecto voluptatem vel non rerum. Ea explicabo molestiae velit ut. Voluptatem est fugiat quaerat minima. Non fugiat numquam quod repudiandae laborum libero.', 'Mariana Bins', '2006-02-11 12:28:05', 842, 3);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `livres`
--
ALTER TABLE `livres`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_927187A4BCF5E72D` (`categorie_id`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `livres`
--
ALTER TABLE `livres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2380;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `livres`
--
ALTER TABLE `livres`
  ADD CONSTRAINT `FK_927187A4BCF5E72D` FOREIGN KEY (`categorie_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
