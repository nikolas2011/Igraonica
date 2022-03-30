-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 06, 2021 at 07:53 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ns`
--

-- --------------------------------------------------------

--
-- Table structure for table `igraonica`
--

CREATE TABLE `igraonica` (
  `idIgraonice` int(10) NOT NULL,
  `nazivIgraonice` varchar(50) NOT NULL,
  `adresaIgraonice` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `igraonica`
--

INSERT INTO `igraonica` (`idIgraonice`, `nazivIgraonice`, `adresaIgraonice`) VALUES
(1, 'Kids', 'Nevesinjska 11'),
(2, 'Plus', 'Milesevska 11'),
(3, 'Sky', 'Sazonova 40'),
(4, 'Fun', 'Kneza Milosa 123'),
(8, 'Sunce', 'Hadzi Milentijeva 2');

-- --------------------------------------------------------

--
-- Table structure for table `korisnik`
--

CREATE TABLE `korisnik` (
  `idKorisnika` int(10) NOT NULL,
  `ime` varchar(30) NOT NULL,
  `prezime` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `telefon` varchar(15) NOT NULL,
  `lozinka` varchar(30) NOT NULL,
  `tipKorisnika` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `korisnik`
--

INSERT INTO `korisnik` (`idKorisnika`, `ime`, `prezime`, `email`, `telefon`, `lozinka`, `tipKorisnika`) VALUES
(2, 'Nikola', 'Spaskovski', 'spaskovskinikola@gmail.com', '0651283123', '12345678', 'Korisnik'),
(3, 'Marko', 'Nikolic', 'markoni@gmail.com', '0651238213', '123456', 'Administrator'),
(4, 'Jana', 'Spaskovski', 'janasp', '061234154', 'janasp12', 'Menadzer'),
(5, 'Jovan', 'Petrovic', 'jocapet@hotmail.com', '0691237854', 'jovan123', 'Korisnik'),
(6, 'Stefan', 'Todorovic', 'stefantodor@yahoo.com', '0621239999', 'stefan000', 'Korisnik');

-- --------------------------------------------------------

--
-- Table structure for table `rezervacija`
--

CREATE TABLE `rezervacija` (
  `idRezervacije` int(10) NOT NULL,
  `datumOdrzavanja` date NOT NULL,
  `vremeOdrzavanja` time NOT NULL,
  `tipProslave` varchar(50) NOT NULL,
  `cena` int(10) NOT NULL,
  `idKorisnika` int(11) NOT NULL,
  `idTermina` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rezervacija`
--

INSERT INTO `rezervacija` (`idRezervacije`, `datumOdrzavanja`, `vremeOdrzavanja`, `tipProslave`, `cena`, `idKorisnika`, `idTermina`) VALUES
(11, '2021-09-23', '16:30:00', 'Animacija', 3000, 2, 7),
(12, '2021-09-08', '19:20:00', 'Diskoteka', 3000, 1, 3),
(13, '2021-09-25', '15:30:00', 'Animacija', 2800, 9, 2),
(14, '2021-09-19', '15:30:00', 'Sportske aktivnosti', 2500, 3, 9);

-- --------------------------------------------------------

--
-- Table structure for table `termin`
--

CREATE TABLE `termin` (
  `idTermina` int(10) NOT NULL,
  `datum` date NOT NULL,
  `vreme` time NOT NULL,
  `tipProslave` varchar(20) NOT NULL,
  `cena` int(11) NOT NULL,
  `slobodno` varchar(5) NOT NULL,
  `idIgraonice` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `termin`
--

INSERT INTO `termin` (`idTermina`, `datum`, `vreme`, `tipProslave`, `cena`, `slobodno`, `idIgraonice`) VALUES
(1, '2021-09-16', '18:42:50', 'Rodjendan', 1000, 'da', 4),
(2, '2021-09-09', '10:18:00', 'Sportske igre', 1200, 'da', 1),
(4, '2021-09-12', '17:00:00', 'Rodjendan', 2000, 'da', 2),
(5, '2021-09-10', '10:39:21', 'Druge aktivnosti', 3000, 'ne', 1),
(6, '2021-09-21', '19:00:00', 'Diksoteka', 2000, 'da', 3),
(7, '2021-09-23', '16:30:00', 'Animacija', 3000, 'da', 5),
(8, '2021-09-14', '18:45:00', 'Animacija', 2500, 'da', 1),
(9, '2021-10-01', '15:20:00', 'Diskoteka', 23000, 'da', 5),
(10, '2021-09-12', '19:22:36', 'Sportske igre', 3200, 'da', 1),
(11, '2021-10-01', '18:45:00', 'Sportske aktivnosti', 2500, 'da', 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `igraonica`
--
ALTER TABLE `igraonica`
  ADD PRIMARY KEY (`idIgraonice`);

--
-- Indexes for table `korisnik`
--
ALTER TABLE `korisnik`
  ADD PRIMARY KEY (`idKorisnika`);

--
-- Indexes for table `rezervacija`
--
ALTER TABLE `rezervacija`
  ADD PRIMARY KEY (`idRezervacije`);

--
-- Indexes for table `termin`
--
ALTER TABLE `termin`
  ADD PRIMARY KEY (`idTermina`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `igraonica`
--
ALTER TABLE `igraonica`
  MODIFY `idIgraonice` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `korisnik`
--
ALTER TABLE `korisnik`
  MODIFY `idKorisnika` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `rezervacija`
--
ALTER TABLE `rezervacija`
  MODIFY `idRezervacije` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `termin`
--
ALTER TABLE `termin`
  MODIFY `idTermina` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
