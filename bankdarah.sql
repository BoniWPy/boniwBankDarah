-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 28 Jun 2019 pada 16.03
-- Versi server: 10.1.35-MariaDB
-- Versi PHP: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bankdarah`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `nama` varchar(32) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `password`, `nama`, `level`) VALUES
(1, 'Admin', '21232f297a57a5a743894a0e4a801fc3', 'Administrator', 1),
(2, 'delvi', '21232f297a57a5a743894a0e4a801fc3', 'delvionita', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `darah`
--

CREATE TABLE `darah` (
  `id_darah` int(15) NOT NULL,
  `golongan` varchar(10) NOT NULL,
  `ukuran` varchar(25) NOT NULL,
  `stok` int(10) NOT NULL,
  `jenis` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `darah`
--

INSERT INTO `darah` (`id_darah`, `golongan`, `ukuran`, `stok`, `jenis`) VALUES
(1, 'A (PRC)', '2.5', 10, 'PRC'),
(2, 'A (WB)', '3.5', 2, 'WB'),
(3, 'AB (PRC)', '2.5', 10, 'PRC'),
(4, 'AB (WB)', '3.5', 6, 'WB'),
(5, 'O (PRC)', '2.5', 11, 'PRC'),
(6, 'O (WB)', '3.5', 7, 'WB'),
(7, 'B (PRC)', '2.5', 11, 'PRC'),
(8, 'B (WB)', '3.5', 7, 'WB');

-- --------------------------------------------------------

--
-- Struktur dari tabel `keranjang`
--

CREATE TABLE `keranjang` (
  `id_keranjang` int(25) NOT NULL,
  `id_perawat` int(25) NOT NULL,
  `id_darah` int(25) NOT NULL,
  `jumlah` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `konfirmasi`
--

CREATE TABLE `konfirmasi` (
  `id_konfirmasi` int(25) NOT NULL,
  `id_penjualan` int(25) NOT NULL,
  `id_perawat` int(25) NOT NULL,
  `foto` varchar(150) NOT NULL,
  `keterangan` varchar(30) NOT NULL,
  `tanggal` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `konfirmasi`
--

INSERT INTO `konfirmasi` (`id_konfirmasi`, `id_penjualan`, `id_perawat`, `foto`, `keterangan`, `tanggal`) VALUES
(4, 1, 6, '22012018064018Struk-Transfer.jpg', 'Kirim/Lunas', '2018-01-22'),
(7, 2, 6, '22012018064913Struk-Transfer.jpg', 'Kirim/Lunas', '2018-01-22');

-- --------------------------------------------------------

--
-- Struktur dari tabel `perawat`
--

CREATE TABLE `perawat` (
  `id_perawat` int(11) NOT NULL,
  `username` varchar(100) CHARACTER SET latin1 NOT NULL,
  `password` varchar(100) CHARACTER SET latin1 NOT NULL,
  `nama` varchar(32) CHARACTER SET latin1 NOT NULL,
  `nik` int(11) NOT NULL,
  `gedung` varchar(50) NOT NULL,
  `no_hp` varchar(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `perawat`
--

INSERT INTO `perawat` (`id_perawat`, `username`, `password`, `nama`, `nik`, `gedung`, `no_hp`) VALUES
(12, 'dadang', 'a3a516bc0535e73455476bc37ac71051', 'dadang', 12345, '0', '12345');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesanan`
--

CREATE TABLE `pesanan` (
  `id_pesanan` int(11) NOT NULL,
  `pasien` varchar(150) NOT NULL,
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(150) NOT NULL,
  `id_darah` int(11) NOT NULL,
  `golongan` varchar(150) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `status` enum('waiting','confirm','cancel') NOT NULL DEFAULT 'waiting',
  `note` text,
  `data` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pesanan`
--

INSERT INTO `pesanan` (`id_pesanan`, `pasien`, `id_user`, `nama_user`, `id_darah`, `golongan`, `jumlah`, `status`, `note`, `data`, `created_at`, `updated_at`) VALUES
(2, 'TESTER', 4, 'aku user', 1, 'A (PRC)', 5, 'waiting', NULL, '{\"bagian\":\"BAGIAN\",\"kamar\":\"Kamar\",\"dokter\":\"DOKTER\",\"diagnosa\":\"DIAG\",\"hb\":\"123\",\"nama_pasien\":\"TESTER\",\"nomor_register\":\"123498324\",\"jenis_kelamin\":\"laki-laki\",\"umur\":\"23\",\"alamat\":\"asdasd\",\"darah\":\"1\",\"jumlah\":\"5\"}', '2019-06-28 13:26:30', '2019-06-28 13:26:30'),
(3, 'PASIEN VB', 4, 'aku user', 1, 'A (PRC)', 5, 'cancel', 'Maaf gajadi', '{\"bagian\":\"PASIEN VB\",\"kamar\":\"asd\",\"dokter\":\"pijasd\",\"diagnosa\":\"ijapsd\",\"hb\":\"d9wuad\",\"nama_pasien\":\"PASIEN VB\",\"nomor_register\":\"29487013\",\"jenis_kelamin\":\"laki-laki\",\"umur\":\"38\",\"alamat\":\"dapowjdpaw\",\"darah\":\"1\",\"jumlah\":\"5\"}', '2019-06-28 13:33:19', '2019-06-28 13:33:19');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id_user` int(150) NOT NULL,
  `nik` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  `nama_user` varchar(150) NOT NULL,
  `role` enum('admin','user') NOT NULL,
  `no_hp` varchar(13) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id_user`, `nik`, `password`, `nama_user`, `role`, `no_hp`, `created_at`, `updated_at`) VALUES
(1, '00001', '21232f297a57a5a743894a0e4a801fc3', 'admin', 'admin', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, '00002', 'ee11cbb19052e40b07aac0ca060c23ee', 'aku user', 'user', '085550553104', '2019-06-23 08:00:44', '2019-06-23 08:00:44'),
(5, '00003', '202cb962ac59075b964b07152d234b70', '08123123', 'user', NULL, '2019-06-28 18:33:41', '2019-06-28 18:33:41'),
(6, '0004', '202cb962ac59075b964b07152d234b70', 'TESTER123', 'admin', '1231232', '2019-06-28 18:35:21', '2019-06-28 18:35:21');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `darah`
--
ALTER TABLE `darah`
  ADD PRIMARY KEY (`id_darah`);

--
-- Indeks untuk tabel `keranjang`
--
ALTER TABLE `keranjang`
  ADD PRIMARY KEY (`id_keranjang`);

--
-- Indeks untuk tabel `konfirmasi`
--
ALTER TABLE `konfirmasi`
  ADD PRIMARY KEY (`id_konfirmasi`);

--
-- Indeks untuk tabel `perawat`
--
ALTER TABLE `perawat`
  ADD PRIMARY KEY (`id_perawat`);

--
-- Indeks untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id_pesanan`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `darah`
--
ALTER TABLE `darah`
  MODIFY `id_darah` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `keranjang`
--
ALTER TABLE `keranjang`
  MODIFY `id_keranjang` int(25) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `konfirmasi`
--
ALTER TABLE `konfirmasi`
  MODIFY `id_konfirmasi` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `perawat`
--
ALTER TABLE `perawat`
  MODIFY `id_perawat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `id_pesanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(150) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
