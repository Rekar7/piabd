-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 25 Lut 2022, 12:14
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
-- Baza danych: `projekt`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `autor`
--

CREATE TABLE `autor` (
  `id_autora` int(10) UNSIGNED NOT NULL,
  `nazwisko` varchar(255) NOT NULL,
  `imie` varchar(255) NOT NULL,
  `narodowosc` varchar(255) NOT NULL,
  `okres_tworczosci` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `autor`
--

INSERT INTO `autor` (`id_autora`, `nazwisko`, `imie`, `narodowosc`, `okres_tworczosci`) VALUES
(1, 'Xina', 'Jing', 'Chiny', 'Od 1999'),
(2, 'Hubert', 'Zbigniew', 'Polska', 'Od 2002 do 2004'),
(3, 'Clarke', 'Anthony', 'Wielka Brytania', 'Od 1984'),
(4, 'Dżuwaszil', 'Dimitri', 'Ukraina', 'Od 1998'),
(5, 'Von Kaisburg', 'Joseph', 'Niemcy', 'Od 1879 do 1914'),
(6, 'Alhazred', 'Abdul', 'Arab - kraj nieznany', 'Około 730 rok'),
(7, 'Abnett', 'Dan', 'Wielka Brytania', 'Od 2000'),
(8, 'Vagabondo', 'Giovanni', 'Włochy', 'Od 1965 do 2002'),
(9, 'De Casa', 'Enrique', 'Hiszpania', 'Od 1675 do 1700'),
(10, 'Goldberg', 'Artur', 'Niemcy', 'Od 1942');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klient`
--

CREATE TABLE `klient` (
  `id_klienta` int(10) UNSIGNED NOT NULL,
  `nazwisko` varchar(255) NOT NULL,
  `imie` varchar(255) NOT NULL,
  `adres` varchar(255) DEFAULT NULL,
  `telefon` varchar(20) DEFAULT NULL,
  `adres_email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `klient`
--

INSERT INTO `klient` (`id_klienta`, `nazwisko`, `imie`, `adres`, `telefon`, `adres_email`) VALUES
(1, 'Suchodolski', 'Wojciech', 'Bydgoszcz ul. Jana Pawła II 13/4', '854 543 435', 'suchodolskiwojciech@opoczta.pl'),
(2, 'Kuminowicz', 'Robert', 'Zalaski Wielkie 15a', '639 043 623', 'kuminowiczzalaskirobert@wikipedia.co.zw'),
(3, 'Czaplicki', 'Michał', 'Choroszcz plac Brodowicza 1', '609 213 742', 'czaplickimichal@discord.gg'),
(4, 'Katarzyna', 'Anna', 'Gdańsk Zwycięstwa 8/21', '968 236 747', '37annakatarzyna21@vatican.va'),
(5, 'Umarov', 'Gulszat', 'Karaganda ul. Nosolev 4', '4992 701 283', 'gulszat_umarov@kazachstancheats.kz'),
(6, 'Lincki', 'Marian', 'Staro Gleby 15b', '313 536 634', 'LinckiMarian23@aldacraft.pl'),
(7, 'Jennicka', 'Marianna', 'Chłopki Średnie 9f', '535 087 535', 'Mariannauberkoks1337@dragon-survival.eu'),
(8, 'Gaben', 'Newell', 'Walwa 3', '244 523 235', 'Gabenscamnewell@valve.com'),
(9, 'Ostrowski', 'Mieczysław', 'Koszalin Szpitalna 3/2', '321 643 646', 'mietek2137@gmail.com'),
(10, 'Joncki', 'Barabasz', 'Miastko Jedności 3', '420 523 451', 'barabaszkamiljoncki@poczta.ru');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ksiazka`
--

CREATE TABLE `ksiazka` (
  `id_ksiazki` int(10) UNSIGNED NOT NULL,
  `id_autora` int(10) UNSIGNED NOT NULL,
  `tytul` varchar(255) NOT NULL,
  `cena_ksiazki` decimal(10,2) NOT NULL,
  `wydawnictwo` varchar(255) NOT NULL,
  `miejsce_wydania` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `ksiazka`
--

INSERT INTO `ksiazka` (`id_ksiazki`, `id_autora`, `tytul`, `cena_ksiazki`, `wydawnictwo`, `miejsce_wydania`) VALUES
(1, 5, 'Święte Cesarstwo Rzymskie w XV wieku', '39.99', 'Biała Mewa', 'Polska'),
(2, 8, 'Przygody Czerwonych Ludzików', '19.99', 'Nowa Era', 'Polska'),
(3, 6, 'Al Azif - Necronomicon', '159.99', 'الكتب ممنوعة - Księgi zakazane', 'Arabia Saudyjska'),
(4, 4, 'Bastion', '49.99', 'Vespar', 'Polska'),
(5, 1, 'Sukces Chin w XXI wieku', '59.99', 'Chińskie Bajki', 'Polska'),
(6, 3, 'Megastruktura', '45.99', 'PolandCanIntoSpace', 'Polska'),
(7, 10, 'Wpływ NFT i kryptowalut na współczesną ekonomię', '59.99', 'ChcemyPieniędzy', 'Polska'),
(8, 2, 'Herobrine - Początek', '2.99', 'TopNotch', 'Polska'),
(9, 7, 'Into the Dark Millenium', '49.99', 'Black Library', 'Wielka Brytania'),
(10, 9, 'Ostateczne rozwiązanie kwestii aragońskiej', '29.99', 'Świat Historii', 'Polska');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zamowienia`
--

CREATE TABLE `zamowienia` (
  `id_zamowienia` int(10) UNSIGNED NOT NULL,
  `id_klienta` int(10) UNSIGNED NOT NULL,
  `id_ksiazki` int(10) UNSIGNED NOT NULL,
  `data_zamowienia` datetime NOT NULL,
  `data_wyslania` datetime NOT NULL,
  `koszt_wysylki` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `zamowienia`
--

INSERT INTO `zamowienia` (`id_zamowienia`, `id_klienta`, `id_ksiazki`, `data_zamowienia`, `data_wyslania`, `koszt_wysylki`) VALUES
(1, 9, 5, '2022-01-18 11:52:04', '2022-02-25 07:47:13', '5.99'),
(2, 8, 3, '2022-02-17 11:55:21', '2022-02-28 13:24:43', '11.99'),
(3, 1, 4, '2022-02-23 13:00:21', '2022-02-27 14:20:21', '2.99'),
(4, 3, 8, '2022-02-23 13:55:21', '2022-03-02 09:45:21', '20.99'),
(5, 5, 7, '2022-01-03 11:55:21', '2022-01-12 15:55:21', '15.99'),
(6, 4, 10, '2021-11-16 14:55:21', '2022-07-20 08:41:21', '30.99'),
(7, 6, 9, '2022-01-18 08:50:21', '2022-01-21 12:36:21', '2.50'),
(8, 7, 1, '2021-10-12 14:46:21', '2021-10-22 15:47:21', '14.99'),
(9, 10, 6, '2022-02-02 14:34:21', '2022-02-24 11:43:21', '12.99'),
(10, 2, 2, '2022-02-14 12:25:21', '2022-02-23 11:55:21', '5.99');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`id_autora`);

--
-- Indeksy dla tabeli `klient`
--
ALTER TABLE `klient`
  ADD PRIMARY KEY (`id_klienta`);

--
-- Indeksy dla tabeli `ksiazka`
--
ALTER TABLE `ksiazka`
  ADD PRIMARY KEY (`id_ksiazki`),
  ADD KEY `id_autora` (`id_autora`);

--
-- Indeksy dla tabeli `zamowienia`
--
ALTER TABLE `zamowienia`
  ADD PRIMARY KEY (`id_zamowienia`),
  ADD KEY `id_klienta` (`id_klienta`),
  ADD KEY `id_ksiazki` (`id_ksiazki`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `autor`
--
ALTER TABLE `autor`
  MODIFY `id_autora` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT dla tabeli `klient`
--
ALTER TABLE `klient`
  MODIFY `id_klienta` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `ksiazka`
--
ALTER TABLE `ksiazka`
  MODIFY `id_ksiazki` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `zamowienia`
--
ALTER TABLE `zamowienia`
  MODIFY `id_zamowienia` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `ksiazka`
--
ALTER TABLE `ksiazka`
  ADD CONSTRAINT `ksiazka_ibfk_1` FOREIGN KEY (`id_autora`) REFERENCES `autor` (`id_autora`);

--
-- Ograniczenia dla tabeli `zamowienia`
--
ALTER TABLE `zamowienia`
  ADD CONSTRAINT `zamowienia_ibfk_1` FOREIGN KEY (`id_klienta`) REFERENCES `klient` (`id_klienta`),
  ADD CONSTRAINT `zamowienia_ibfk_2` FOREIGN KEY (`id_ksiazki`) REFERENCES `ksiazka` (`id_ksiazki`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
