-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 21 Lut 2022, 15:42
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
-- Baza danych: `projekt_ksiegarnia`
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
  `okres_tworczosci` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(9, 'Ostrowski', 'Mieczysław', 'Koszalin Szpitalna 3/2', '321 643 646', 'mietek2137@gmail.com');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ksiazka`
--

CREATE TABLE `ksiazka` (
  `id_ksiazki` int(10) UNSIGNED NOT NULL,
  `id_autora` int(10) UNSIGNED NOT NULL,
  `tytul` varchar(255) NOT NULL,
  `cena_ksiazki` decimal(10,0) NOT NULL,
  `wydawnictwo` varchar(255) NOT NULL,
  `miejsce_wydania` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `koszt_wysylki` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
-- AUTO_INCREMENT dla tabeli `klient`
--
ALTER TABLE `klient`
  MODIFY `id_klienta` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT dla tabeli `ksiazka`
--
ALTER TABLE `ksiazka`
  MODIFY `id_ksiazki` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `zamowienia`
--
ALTER TABLE `zamowienia`
  MODIFY `id_zamowienia` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

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
