-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 27. Jun 2018 um 15:34
-- Server-Version: 10.1.33-MariaDB
-- PHP-Version: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr10_anna_oemer_biglibrary`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `authors`
--

CREATE TABLE `authors` (
  `id` smallint(5) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `media` enum('book','cd','dvd') NOT NULL,
  `fk_isbn` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `authors`
--

INSERT INTO `authors` (`id`, `firstName`, `surname`, `media`, `fk_isbn`) VALUES
(1, 'Daphney', 'Nienow', 'book', '333978473'),
(2, 'Favian', 'Beer', 'dvd', '333978470'),
(3, 'Kay', 'Hamill', 'book', '333978475'),
(4, 'Micaela', 'Roob', 'book', '333978477'),
(5, 'Camille', 'Koss', 'book', '333978479'),
(6, 'Marilie', 'Fay', 'dvd', '333978476'),
(7, 'Chance', 'Feeney', 'cd', '333978478'),
(8, 'Ariane', 'Johnston', 'cd', '333978471'),
(9, 'Garrick', 'Heathcote', 'cd', '333978472'),
(10, 'Dejah', 'Wisoky', 'dvd', '333978474');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `media`
--

CREATE TABLE `media` (
  `isbn` varchar(30) NOT NULL,
  `title` varchar(30) NOT NULL,
  `image` varchar(50) NOT NULL,
  `short_description` varchar(100) NOT NULL,
  `publish_date` date NOT NULL,
  `type` enum('book','cd','dvd') NOT NULL,
  `status` enum('reserved','available') DEFAULT NULL,
  `genre` varchar(30) DEFAULT NULL,
  `fk_author` smallint(5) DEFAULT NULL,
  `fk_publisher` smallint(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `media`
--

INSERT INTO `media` (`isbn`, `title`, `image`, `short_description`, `publish_date`, `type`, `status`, `genre`, `fk_author`, `fk_publisher`) VALUES
('333978470', 'Hope', 'http://lorempixel.com/640/480/', 'Suscipit non minus minus sed autem ut. Ducimus dolor quasi accusantium sed amet vitae voluptatem. Er', '2002-01-06', 'dvd', 'reserved', 'Action', NULL, NULL),
('333978471', 'Love', 'http://lorempixel.com/640/481/', 'Repellendus eligendi voluptatum libero ipsa ullam. Quo molestias repellendus repellat consequatur. I', '2001-01-19', 'cd', 'reserved', 'Rock', NULL, NULL),
('333978472', 'Passion', 'http://lorempixel.com/640/482/', 'Aliquam quos omnis sit modi. Odio rerum minima enim sit iste ea laborum qui. Similique sint repudian', '1972-04-06', 'cd', 'available', 'Folk', NULL, NULL),
('333978473', 'Blue', 'http://lorempixel.com/640/483/', 'Molestias architecto dolores incidunt nulla eum aut quis. Debitis soluta quia eius et aut. Est nulla', '1984-12-13', 'book', 'available', 'Novel', NULL, NULL),
('333978474', 'Less', 'http://lorempixel.com/640/484/', 'Quaerat magni sit et sed veniam maiores. Est eius ut eos deleniti officia. Exercitationem dolor repe', '2012-11-15', 'dvd', 'available', 'Romance', NULL, NULL),
('333978475', 'More', 'http://lorempixel.com/640/485/', 'Autem ea magnam enim quia. Cupiditate aut adipisci tempore excepturi eaque molestiae.', '2005-07-18', 'book', 'available', 'Sci-Fi', NULL, NULL),
('333978476', 'Red', 'http://lorempixel.com/640/486/', 'Omnis eligendi voluptates omnis. Et iste ut perferendis saepe in.', '1978-11-17', 'dvd', 'reserved', 'Comedy', NULL, NULL),
('333978477', 'Purple', 'http://lorempixel.com/640/487/', 'Officia velit eligendi repellendus. Maxime nemo ducimus sed. Ut aliquam enim et ut eos et sunt. Opti', '1973-08-25', 'book', 'reserved', 'Biography', NULL, NULL),
('333978478', 'Fun', 'http://lorempixel.com/640/488/', 'Odit sapiente mollitia similique ratione voluptatem. Rerum consequatur doloremque nisi. Odio necessi', '1981-01-09', 'cd', 'available', 'Pop', NULL, NULL),
('333978479', 'Motivation', 'http://lorempixel.com/640/489/', 'Esse ut magni deleniti ex natus distinctio porro. Et consectetur veritatis dicta libero rem tempore ', '2016-09-20', 'book', 'available', 'Fiction', NULL, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `publisher`
--

CREATE TABLE `publisher` (
  `id` smallint(5) NOT NULL,
  `name` varchar(30) NOT NULL,
  `street` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `citycode` int(11) NOT NULL,
  `country` varchar(50) NOT NULL,
  `size` enum('small','big','medium') NOT NULL,
  `fk_isbn` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `publisher`
--

INSERT INTO `publisher` (`id`, `name`, `street`, `city`, `citycode`, `country`, `size`, `fk_isbn`) VALUES
(1, 'King', 'Elenora Squares', 'Gideonton', 84158, 'Hungary', 'small', '333978479'),
(2, 'Balistreri', 'Delfina Stravenue', 'Pamelaport', 68602, 'Martinique', 'small', '333978478'),
(3, 'Ullrich', 'Kulas Motorway', 'Harrisville', 30526, 'Timor-Leste', 'medium', '333978477'),
(4, 'Mueller', 'Keebler Camp', 'New Princeview', 95273, 'Israel', 'big', '333978476'),
(5, 'Hirthe', 'Kari View', 'West Novellahaven', 64076, 'Estonia', 'medium', '333978475'),
(6, 'Zboncak', 'Lexie Valley', 'West Kendall', 65755, 'Jamaica', 'medium', '333978474'),
(7, 'Hayes', 'Fidel Vista', 'Alexandrafort', 79156, 'Panama', 'small', '333978473'),
(8, 'Dickens', 'Bernita Extensions', 'Lake Mireya', 5529, 'Bahamas', 'small', '333978472'),
(9, 'Kihn', 'Gusikowski Point', 'North Alaynafort', 54975, 'Gibraltar', 'big', '333978471'),
(10, 'Dickens', 'Soledad Spur', 'Lake Prudence', 86700, 'Ghana', 'medium', '333978470');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `users`
--

CREATE TABLE `users` (
  `userId` int(11) NOT NULL,
  `userName` varchar(30) NOT NULL,
  `userEmail` varchar(60) NOT NULL,
  `userPass` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `users`
--

INSERT INTO `users` (`userId`, `userName`, `userEmail`, `userPass`) VALUES
(1, 'Mario', 'mario@mario.at', '9baaf0eb865e822f7fa269cb362e7b6cda50ba5ec5e582201ca418980ac5aaa2');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_isbn` (`fk_isbn`);

--
-- Indizes für die Tabelle `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`isbn`),
  ADD KEY `fk_author` (`fk_author`),
  ADD KEY `fk_publisher` (`fk_publisher`);

--
-- Indizes für die Tabelle `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_isbn` (`fk_isbn`);

--
-- Indizes für die Tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userId`),
  ADD UNIQUE KEY `userEmail` (`userEmail`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `authors`
--
ALTER TABLE `authors`
  MODIFY `id` smallint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT für Tabelle `publisher`
--
ALTER TABLE `publisher`
  MODIFY `id` smallint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT für Tabelle `users`
--
ALTER TABLE `users`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `authors`
--
ALTER TABLE `authors`
  ADD CONSTRAINT `authors_ibfk_1` FOREIGN KEY (`fk_isbn`) REFERENCES `media` (`isbn`);

--
-- Constraints der Tabelle `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `media_ibfk_1` FOREIGN KEY (`fk_author`) REFERENCES `authors` (`id`),
  ADD CONSTRAINT `media_ibfk_2` FOREIGN KEY (`fk_publisher`) REFERENCES `publisher` (`id`);

--
-- Constraints der Tabelle `publisher`
--
ALTER TABLE `publisher`
  ADD CONSTRAINT `publisher_ibfk_1` FOREIGN KEY (`fk_isbn`) REFERENCES `media` (`isbn`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
