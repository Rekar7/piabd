-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 21 Lut 2022, 14:05
-- Wersja serwera: 10.4.13-MariaDB
-- Wersja PHP: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `pracownicy`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klienci`
--

CREATE TABLE `klienci` (
  `nr_klienta` int(11) NOT NULL,
  `nazwisko` varchar(150) DEFAULT NULL,
  `imie` varchar(80) DEFAULT NULL,
  `pesel` char(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `klienci`
--

INSERT INTO `klienci` (`nr_klienta`, `nazwisko`, `imie`, `pesel`) VALUES
(1, 'Wiśniewski', 'Mikołaj', '82040112389'),
(2, 'Kaniewski', 'Marcin', '73122990123'),
(3, 'Galas', 'Jan', NULL),
(4, 'Zimna', 'Maria', '58081501876'),
(5, 'Wiśniewska', 'Joanna', NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `miejsca`
--

CREATE TABLE `miejsca` (
  `nr_miejsca` int(11) NOT NULL,
  `ulica` varchar(150) DEFAULT NULL,
  `numer` varchar(20) DEFAULT NULL,
  `miasto` varchar(150) DEFAULT NULL,
  `kod` varchar(10) DEFAULT NULL,
  `telefon` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `miejsca`
--

INSERT INTO `miejsca` (`nr_miejsca`, `ulica`, `numer`, `miasto`, `kod`, `telefon`) VALUES
(1, 'Mała', '13', 'Poznań', '60-002', '(61) 123 09 09'),
(2, 'Wąska', '4/12A', 'Kraków', '30-012', '(12) 234 23 23'),
(3, 'Grunwaldzka', '34', 'Warszawa', '00-123', '(22) 876 87 76');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pracownicy`
--

CREATE TABLE `pracownicy` (
  `nr_pracownika` int(11) NOT NULL,
  `imie` varchar(80) NOT NULL,
  `nazwisko` varchar(150) NOT NULL,
  `placa_zasadnicza` decimal(10,2) DEFAULT 0.00,
  `premia` decimal(10,2) DEFAULT 0.00,
  `pesel` char(11) NOT NULL,
  `stanowisko` varchar(150) DEFAULT NULL,
  `nr_miejsca` int(11) DEFAULT NULL,
  `przelozony` int(11) DEFAULT NULL,
  `data_dodania` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `pracownicy`
--

INSERT INTO `pracownicy` (`nr_pracownika`, `imie`, `nazwisko`, `placa_zasadnicza`, `premia`, `pesel`, `stanowisko`, `nr_miejsca`, `przelozony`, `data_dodania`) VALUES
(1, 'Jan', 'Kowalski', '2300.00', '250.00', '82091104357', 'Manager', 1, 7, '0000-00-00 00:00:00'),
(2, 'Karol', 'Nowak', '2700.00', '100.00', '80010112876', 'Specjalista', 1, 1, '0000-00-00 00:00:00'),
(3, 'Marzena', 'Przepiórka', '2700.00', NULL, '73121209421', 'Specjalista', NULL, 1, '0000-00-00 00:00:00'),
(4, 'Paweł', 'Burzych', '1900.00', '500.00', '5501121098', 'Specjalista', 2, 7, '0000-00-00 00:00:00'),
(5, 'Marek', 'Makłowicz', '2000.00', NULL, '93120112098', 'Specjalista', 2, 7, '0000-00-00 00:00:00'),
(6, 'Magdalena', 'Naramowicka', '2100.00', '200.00', '82011904350', 'Specjalista', 1, 1, '0000-00-00 00:00:00'),
(7, 'Jacek', 'Witos', '3000.00', '500.00', '54013101234', 'Manager', 3, 7, '0000-00-00 00:00:00'),
(8, 'Maksymilian', 'Markowski', '2000.00', NULL, '90013401234', 'Młodszy specjalista', 1, 7, '0000-00-00 00:00:00'),
(10, 'Teodor', 'Chorsza', '2222.00', '222.00', '81010108956', 'Specjalista', NULL, NULL, '0000-00-00 00:00:00'),
(11, 'Teodor1', 'Chorsza1', '2222.00', '222.00', '81010108956', 'Specjalista', NULL, NULL, '2020-04-25 14:43:16');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `klienci`
--
ALTER TABLE `klienci`
  ADD PRIMARY KEY (`nr_klienta`);

--
-- Indeksy dla tabeli `miejsca`
--
ALTER TABLE `miejsca`
  ADD PRIMARY KEY (`nr_miejsca`);

--
-- Indeksy dla tabeli `pracownicy`
--
ALTER TABLE `pracownicy`
  ADD PRIMARY KEY (`nr_pracownika`),
  ADD KEY `nr_miejsca` (`nr_miejsca`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `klienci`
--
ALTER TABLE `klienci`
  MODIFY `nr_klienta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `miejsca`
--
ALTER TABLE `miejsca`
  MODIFY `nr_miejsca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `pracownicy`
--
ALTER TABLE `pracownicy`
  MODIFY `nr_pracownika` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `pracownicy`
--
ALTER TABLE `pracownicy`
  ADD CONSTRAINT `pracownicy_ibfk_1` FOREIGN KEY (`nr_miejsca`) REFERENCES `miejsca` (`nr_miejsca`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
