-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 25 Bulan Mei 2022 pada 19.16
-- Versi server: 8.0.28-0ubuntu0.20.04.3
-- Versi PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_engine`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_monitor`
--

CREATE TABLE `tb_monitor` (
  `no` int NOT NULL,
  `tegangan` decimal(10,0) NOT NULL,
  `celcius` decimal(10,0) NOT NULL,
  `fahrenheit` decimal(10,0) NOT NULL,
  `dt_update` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `tb_monitor`
--

INSERT INTO `tb_monitor` (`no`, `tegangan`, `celcius`, `fahrenheit`, `dt_update`) VALUES
(1, '80', '27', '80', '2022-05-25 19:06:19'),
(2, '80', '27', '80', '2022-05-25 19:06:28'),
(8, '80', '27', '80', '2022-05-25 19:08:47'),
(9, '80', '27', '80', '2022-05-25 19:09:40'),
(10, '80', '27', '80', '2022-05-25 19:10:44'),
(11, '80', '27', '80', '2022-05-25 19:10:50'),
(12, '80', '27', '80', '2022-05-25 19:12:23'),
(13, '80', '27', '80', '2022-05-25 19:12:46'),
(14, '80', '27', '80', '2022-05-25 19:13:11'),
(15, '80', '27', '80', '2022-05-25 19:13:13');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_monitor`
--
ALTER TABLE `tb_monitor`
  ADD PRIMARY KEY (`no`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_monitor`
--
ALTER TABLE `tb_monitor`
  MODIFY `no` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
