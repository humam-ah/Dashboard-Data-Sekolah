-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 17 Jan 2024 pada 00.06
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sekolah`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `eskul`
--

CREATE TABLE `eskul` (
  `id_eskul` int(11) NOT NULL,
  `nama_eskul` varchar(30) NOT NULL,
  `guru_nip` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `eskul`
--

INSERT INTO `eskul` (`id_eskul`, `nama_eskul`, `guru_nip`) VALUES
(1, 'Futsal', 348928),
(2, 'Basket', 348930),
(3, 'Osis', 348927);

-- --------------------------------------------------------

--
-- Struktur dari tabel `gender`
--

CREATE TABLE `gender` (
  `id_gender` int(11) NOT NULL,
  `gender` char(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `gender`
--

INSERT INTO `gender` (`id_gender`, `gender`) VALUES
(0, 'Perempuan'),
(1, 'Laki-laki');

-- --------------------------------------------------------

--
-- Struktur dari tabel `guru`
--

CREATE TABLE `guru` (
  `nip` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `gender_id_gender` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `guru`
--

INSERT INTO `guru` (`nip`, `nama`, `alamat`, `tanggal_lahir`, `gender_id_gender`) VALUES
(348927, 'Indah setianii', 'Jl. Gatot Subroto NO. 88, Tegal', '1987-12-08', 0),
(348928, 'Budi Santoso', 'Jl. Ahmad Yani NO. 123, Semarang', '1985-05-15', 1),
(348929, 'Rina Wijaya', 'Jl. Pahlawan NO. 45, Yogyakarta', '1990-08-22', 0),
(348930, 'Agus Priyanto', 'Jl. Sudirman NO. 55, Jakarta', '1986-02-10', 1),
(348931, 'Sari Dewi', 'Jl. Diponegoro NO. 33, Surakarta', '1989-07-18', 0),
(348932, 'Hendro Wahono', 'Jl. Thamrin NO. 20, Jakarta', '1984-09-25', 1),
(348933, 'Maya Sari', 'Jl. Gajah Mada NO. 10, Malang', '1992-04-14', 0),
(348934, 'Andi Kusuma', 'Jl. Panglima Sudirman NO. 77, Semarang', '1983-11-20', 1),
(348935, 'Nina Susanti', 'Jl. A. Yani NO. 15, Solo', '1995-01-30', 0),
(3489999, 'Humam', 'Tembok Lor, Kabupaten Tegal, Jawa Tengah', '2024-01-16', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas`
--

CREATE TABLE `kelas` (
  `id_kelas` int(11) NOT NULL,
  `kapasitas` char(2) NOT NULL,
  `nama_kelas` char(9) NOT NULL,
  `guru_nip` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `kapasitas`, `nama_kelas`, `guru_nip`) VALUES
(11, '30', '10 IPA 1', 348930),
(12, '30', '10 IPA 2', 348928),
(21, '30', '11 IPA 1', 348929),
(22, '30', '11 IPA 2', 348930),
(31, '30', '12 IPA 1', 348931),
(32, '30', '12 IPA 2', 348932);

-- --------------------------------------------------------

--
-- Struktur dari tabel `komposisi_eskul`
--

CREATE TABLE `komposisi_eskul` (
  `id_komp_eskul` int(11) NOT NULL,
  `siswa_nis` int(11) NOT NULL,
  `eskul_id_eskul` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `komposisi_eskul`
--

INSERT INTO `komposisi_eskul` (`id_komp_eskul`, `siswa_nis`, `eskul_id_eskul`) VALUES
(2, 13463, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `komposisi_kelas`
--

CREATE TABLE `komposisi_kelas` (
  `id_komp_kelas` int(11) NOT NULL,
  `siswa_nis` int(11) NOT NULL,
  `kelas_id_kelas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `komposisi_kelas`
--

INSERT INTO `komposisi_kelas` (`id_komp_kelas`, `siswa_nis`, `kelas_id_kelas`) VALUES
(3, 13458, 12),
(5, 13462, 21),
(6, 13464, 21),
(7, 13465, 22),
(8, 13457, 22),
(9, 13463, 31),
(12, 13456, 11);

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa`
--

CREATE TABLE `siswa` (
  `nis` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `gender_id_gender` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `siswa`
--

INSERT INTO `siswa` (`nis`, `nama`, `alamat`, `tanggal_lahir`, `gender_id_gender`) VALUES
(13456, 'Andri Setiawan', 'Jl. Ahmad Yani No. 87, Kota Tegal', '2006-07-19', 1),
(13457, 'Rina Wijaya', 'Jl. Gatot Subroto No. 123, Tegal', '2005-05-12', 0),
(13458, 'Budi Santoso', 'Jl. Magelang No. 10, Tegal', '2006-02-25', 1),
(13459, 'Siti Rahayu', 'Jl. Wahid Hasyim No. 45, Tegal', '2006-09-14', 0),
(13461, 'Dewi Anggraeni', 'Jl. Pahlawan No. 33, Tegal', '2005-08-22', 0),
(13462, 'Eko Prasetyo', 'Jl. Kartini No. 21, Tegal', '2006-11-14', 1),
(13463, 'Sari Fitriani', 'Jl. Surya Kencana No. 44, Tegal', '2006-04-07', 0),
(13464, 'Ferry Wijaya', 'Jl. Veteran No. 89, Tegal', '2005-12-19', 1),
(13465, 'Lina Novita', 'Jl. Merdeka No. 10, Tegal', '2006-04-02', 0);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `eskul`
--
ALTER TABLE `eskul`
  ADD PRIMARY KEY (`id_eskul`),
  ADD KEY `eskul_guru_fk` (`guru_nip`);

--
-- Indeks untuk tabel `gender`
--
ALTER TABLE `gender`
  ADD PRIMARY KEY (`id_gender`);

--
-- Indeks untuk tabel `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`nip`),
  ADD KEY `guru_gender_fk` (`gender_id_gender`);

--
-- Indeks untuk tabel `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id_kelas`),
  ADD KEY `kelas_guru_fk` (`guru_nip`);

--
-- Indeks untuk tabel `komposisi_eskul`
--
ALTER TABLE `komposisi_eskul`
  ADD PRIMARY KEY (`id_komp_eskul`),
  ADD KEY `komposisi_eskul_siswa_fk` (`siswa_nis`),
  ADD KEY `komposisi_eskul_eskul_fk` (`eskul_id_eskul`);

--
-- Indeks untuk tabel `komposisi_kelas`
--
ALTER TABLE `komposisi_kelas`
  ADD PRIMARY KEY (`id_komp_kelas`),
  ADD KEY `komposisi_kelas_siswa_fk` (`siswa_nis`),
  ADD KEY `komposisi_kelas_kelas_fk` (`kelas_id_kelas`);

--
-- Indeks untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`nis`),
  ADD KEY `siswa_gender_fk` (`gender_id_gender`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `eskul`
--
ALTER TABLE `eskul`
  MODIFY `id_eskul` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id_kelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT untuk tabel `komposisi_eskul`
--
ALTER TABLE `komposisi_eskul`
  MODIFY `id_komp_eskul` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `komposisi_kelas`
--
ALTER TABLE `komposisi_kelas`
  MODIFY `id_komp_kelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `eskul`
--
ALTER TABLE `eskul`
  ADD CONSTRAINT `eskul_guru_fk` FOREIGN KEY (`guru_nip`) REFERENCES `guru` (`nip`);

--
-- Ketidakleluasaan untuk tabel `guru`
--
ALTER TABLE `guru`
  ADD CONSTRAINT `guru_gender_fk` FOREIGN KEY (`gender_id_gender`) REFERENCES `gender` (`id_gender`);

--
-- Ketidakleluasaan untuk tabel `kelas`
--
ALTER TABLE `kelas`
  ADD CONSTRAINT `kelas_guru_fk` FOREIGN KEY (`guru_nip`) REFERENCES `guru` (`nip`);

--
-- Ketidakleluasaan untuk tabel `komposisi_eskul`
--
ALTER TABLE `komposisi_eskul`
  ADD CONSTRAINT `komposisi_eskul_eskul_fk` FOREIGN KEY (`eskul_id_eskul`) REFERENCES `eskul` (`id_eskul`),
  ADD CONSTRAINT `komposisi_eskul_siswa_fk` FOREIGN KEY (`siswa_nis`) REFERENCES `siswa` (`nis`);

--
-- Ketidakleluasaan untuk tabel `komposisi_kelas`
--
ALTER TABLE `komposisi_kelas`
  ADD CONSTRAINT `komposisi_kelas_kelas_fk` FOREIGN KEY (`kelas_id_kelas`) REFERENCES `kelas` (`id_kelas`),
  ADD CONSTRAINT `komposisi_kelas_siswa_fk` FOREIGN KEY (`siswa_nis`) REFERENCES `siswa` (`nis`);

--
-- Ketidakleluasaan untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD CONSTRAINT `siswa_gender_fk` FOREIGN KEY (`gender_id_gender`) REFERENCES `gender` (`id_gender`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
