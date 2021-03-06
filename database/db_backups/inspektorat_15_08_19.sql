-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 15, 2019 at 08:15 AM
-- Server version: 5.7.24
-- PHP Version: 7.1.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inspektorat`
--

-- --------------------------------------------------------

--
-- Table structure for table `detail_kegiatan`
--

DROP TABLE IF EXISTS `detail_kegiatan`;
CREATE TABLE IF NOT EXISTS `detail_kegiatan` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `kegiatan_id` bigint(20) UNSIGNED NOT NULL,
  `skpd_id` bigint(20) UNSIGNED NOT NULL,
  `nama_kegiatan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tujuan_kegiatan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `detail_kegiatan_skpd_id_foreign` (`skpd_id`),
  KEY `detail_kegiatan_kegiatan_id_foreign` (`kegiatan_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `detail_kegiatan`
--

INSERT INTO `detail_kegiatan` (`id`, `kegiatan_id`, `skpd_id`, `nama_kegiatan`, `tujuan_kegiatan`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'jalan memutar kabupaten', 'agar sehat ', 2, NULL, NULL),
(2, 2, 10, 'agar lingkungan bersih', 'menjaga lingkungan', 2, NULL, NULL),
(3, 3, 30, 'dinas pariwisata', 'dinas pariwisata', 2, NULL, NULL),
(8, 14, 42, 'asdasdads', 'dsaadsdsadsa', 2, '2019-08-15 01:13:20', '2019-08-15 01:13:20');

-- --------------------------------------------------------

--
-- Table structure for table `detail_spt`
--

DROP TABLE IF EXISTS `detail_spt`;
CREATE TABLE IF NOT EXISTS `detail_spt` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `spt_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `peran` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lama` int(11) DEFAULT NULL,
  `dupak` double(8,2) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `detail_spt_spt_id_foreign` (`spt_id`),
  KEY `detail_spt_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `detail_spt`
--

INSERT INTO `detail_spt` (`id`, `spt_id`, `user_id`, `peran`, `lama`, `dupak`, `status`) VALUES
(15, 5, 4, 'Pembantu Penanggung jawab', 2, NULL, NULL),
(14, 5, 2, 'Pembantu Penanggung jawab', 1, NULL, NULL),
(21, 11, 8, 'Pengendali Mutu', 1, 0.26, NULL),
(16, 5, 5, 'Supervisor', 22, NULL, NULL),
(17, 8, 10, 'Pengendali Mutu', 2, 303.00, NULL),
(18, 8, 10, 'Pengendali Teknis', 14, 2.18, NULL),
(20, 11, 8, 'Pengendali Teknis', 2, 0.39, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jenis_spt`
--

DROP TABLE IF EXISTS `jenis_spt`;
CREATE TABLE IF NOT EXISTS `jenis_spt` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dasar` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `isi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `view_mode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'standar',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jenis_spt`
--

INSERT INTO `jenis_spt` (`id`, `name`, `dasar`, `isi`, `view_mode`, `created_at`, `updated_at`) VALUES
(1, 'Audit Kinerja Desa', '<ol><li>Undang - Undang Republik Indonesia Nomor 23 Tahun&nbsp; 2014&nbsp; tentang&nbsp; Pemerintah Daerah;</li><li>Peraturan Pemerintah Republik Indonesia Nomor 12 Tahun 2017&nbsp; &nbsp; &nbsp;tentang Pembinaan dan Pengawasan Penyelenggaraan&nbsp; &nbsp; Pemerintahan Daerah;</li><li>Peraturan Menteri Dalam Negeri Nomor 110 Tahun 2017 tentang Kebijakan Pengawasan Penyelenggaraan Pemerintah Daerah Tahun 2018;</li><li>Peraturan Menteri Pendayagunaan Aparatur Negara Nomor PER/05/M.PAN/03/2008 tanggal 31 Maret 2008 tentang Standar Audit Aparat Pengawasan Intern Pemerintah;</li><li>Peraturan Pemerintah Nomor 60 Tahun 2008 tentang Sistem Pengendalian Intern Pemerintah;</li><li>Program Kerja Pengawasan Tahunan (PKPT) Inspektorat Daerah Kabupaten Sidoarjo Tahun 2018;</li></ol>', '<p>Untuk Melaksanakan Audit Kinerja di %lokasi% atas Kegiatan&nbsp; Pelaksanaan Pengawasan Internal secara berkala Tahun %tahun%.</p><p>Jangka waktu pemeriksaan&nbsp; efektif selama&nbsp; &nbsp;%terbilang%&nbsp; hari&nbsp; kerja pada periode&nbsp; &nbsp;tanggal&nbsp; &nbsp; &nbsp; %tgl_mulai% s.d %tgl_akhir%</p><p>Kepada pihak-pihak yang bersangkutan diminta kesediaannya untuk memberikan bantuan serta keterangan-keterangan yang diperlukan guna kelancaran dalam penyelesaian tugas dimaksud.</p>', 'standar', '2019-05-26 16:10:08', '2019-05-26 16:23:01'),
(2, 'Evaluasi SKPD', '<ol><li>Undang-Undang Republik Indonesia Nomor 23 2014 tentang Pemerintah Daerah;</li><li>Peraturan Pemerintah Republik Indonesia Nomor 12 Tahun 2017 tentang Pembinaan dan Pengawasan Penyelenggaraan Pemerintahan Daerah;</li><li>Peraturan Negeri Dalam Negeri Nomor 110 Tahun 2017 tentang Kebijakan Pembinaan dan Pengawasan Penyelenggaraan Pemerintah Daerah Tahun 2018;</li><li>Program Kerja Pengawasan Tahunan (PKPT) Inspektorat Daerah Kabupaten Sidoarjo Tahun 2018;</li></ol>', '<p><span style=\"font-size: 1rem;\">Untuk melaksanakan %nama% %lokasi%.</span><br></p><p>Jangka waktu pemeriksaan tersebut efektif selama %lama% kerja pada periode %tgl_mulai%&nbsp; &nbsp; s.d %tgl_akhir%.</p><p>Kepada pihak-pihak yang bersangkutan diminta kesediaannya untuk memberikan bantuan serta keterangan-keterangan yang diperlukan guna kelancaran dalam penyelesaian tugas dimaksud.</p>', 'standar', '2019-05-28 11:53:36', '2019-06-11 16:05:50'),
(3, 'Evaluasi AKIP', '<p>Surat Kepala Badan Kepegawaian Daerah Kabupaten Sidoarjo tanggal 8 Desember 2017 Nomor : x.800/2738/404.6.4/2017, perihal Permohonan Audit Kepegawaian.<br></p>', '<p>Untuk melakukan pemeriksaan guna menyelesaikan %nama%, di %lokasi%.</p><p>Jangka waktu pemeriksaan tersebut efektif selama %lama% kerja pada periode tanggal&nbsp; &nbsp; %tgl_mulai%&nbsp; &nbsp;s.d&nbsp; &nbsp; %tgl_akhir%.</p><p>Kepada pihak-pihak yang bersangkutan diminta kesediaannya untuk memberikan bantuan serta keterangan-keterangan yang diperlukan guna kelancaran dalam penyelesaian tugas dimaksud.</p><div><br></div>', 'standar', '2019-05-28 13:19:50', '2019-06-11 14:02:48'),
(4, 'PKKN', '<p><span style=\"font-size:12.0pt;font-family:&quot;Maiandra GD&quot;,&quot;sans-serif&quot;;\r\nmso-fareast-font-family:&quot;Arial Unicode MS&quot;;mso-bidi-font-family:Tahoma;\r\nmso-ansi-language:EN-US;mso-fareast-language:EN-US;mso-bidi-language:AR-SA\">Surat\r\ndari Kejaksaan Negeri Kabupaten Sidoarjo &nbsp;tanggal 9 Agustus 2018 Nomor : B-329/O.5.30/Fd.1/08/2018\r\nperihal Bantuan Penghitungan Kerugian &nbsp;Keuangan Negara</span><br></p>', '<p>Untuk melaksanakan Audit Lanjutan terhadap Penghitungan Kerugian Keuangan Negara terhadap %nama% %lokasi% yang berasal dari APBD Pemerintah Propinsi Jawa Timur Tahun Anggaran 2016.</p><p>Jangka waktu pemeriksaan tersebut efektif&nbsp; selama&nbsp; %lama% kerja pada periode tanggal&nbsp; &nbsp;%tgl_mulai% s.d %tgl_akhir%.</p><p>Kepada pihak-pihak yang bersangkutan diminta kesediaannya untuk memberikan bantuan serta keterangan-keterangan yang diperlukan guna kelancaran dalam penyelesaian tugas dimaksud.</p><div><br></div>', 'standar', '2019-06-11 14:25:10', '2019-06-11 14:25:10'),
(5, 'Konsulting', '<ol><li>Undang-Undang Republik Indonesia Nomor 23 2014 tentang Pemerintah Daerah;</li><li>Peraturan Pemerintah Republik Indonesia Nomor 12 Tahun 2017 tentang Pembinaan dan Pengawasan Penyelenggaraan Pemerintahan Daerah;</li><li>Peraturan Negeri Dalam Negeri Nomor 110 Tahun 2017 tentang Kebijakan Pembinaan dan Pengawasan Penyelenggaraan Pemerintah Daerah Tahun 2018;</li><li>Program Kerja Pengawasan Tahunan (PKPT) Inspektorat Daerah Kabupaten Sidoarjo Tahun 2018;</li></ol>', '<p><span style=\"font-size: 1rem;\">Untuk melaksanakan Program Konsulting %nama% di %lokasi%.</span><br></p><p>Jangka waktu pemeriksaan tersebut efektif selama %lama% kerja pada periode tanggal&nbsp; &nbsp;%tgl_mulai% s.d %tgl_akhir%.</p><p>Kepada pihak-pihak yang bersangkutan diminta kesediaannya untuk memberikan bantuan serta keterangan-keterangan yang diperlukan guna kelancaran dalam penyelesaian tugas dimaksud.</p><div><br></div>', 'standar', '2019-06-11 16:53:16', '2019-06-11 16:53:16'),
(6, 'LKPD', '<ol><li>Undang-Undang Republik Indonesia Nomor 23 Tahun 2014 tentang Pemerintah Daerah;</li><li>Peraturan Pemerintah Republik Indonesia Nomor 12 Tahun 2017 tentang Pembinaan dan Pengawasan Penyelenggaraan Pemerintahan Daerah;</li><li>Peraturan Negeri Dalam Negeri Nomor 110 Tahun 2017 tentang Kebijakan Pembinaan dan Pengawasan Penyelenggaraan Pemerintah Daerah Tahun 2018;</li><li>Peraturan Pemerintah Nomor 8 Tahun 2006 tentang Laporan Keuangan dan Kinerja Instansi Pemerintah;</li><li>Program Kerja Pengawasan Tahunan (PKPT) Inspektorat Daerah Kabupaten Sidoarjo Tahun 2018;</li></ol>', '<p>Untuk melaksanakan %nama% Laporan Keuangan Pemerintah Daerah (LKPD) Tahun 2017 pada tanggal&nbsp; &nbsp; %tgl_mulai%&nbsp; &nbsp; s.d&nbsp; &nbsp; %tgl_akhir%, didahului&nbsp; dengan Pra Reviu.</p><p>Kepada pihak-pihak yang bersangkutan diminta kesediaannya untuk memberikan bantuan serta keterangan-keterangan yang diperlukan guna kelancaran dalam penyelesaian tugas dimaksud.</p>', 'standar', '2019-06-11 16:56:51', '2019-06-28 07:53:09'),
(7, 'Monev', '<p>Surat Kepala Badan Kepegawaian Daerah Kabupaten Sidoarjo tanggal 8 Desember 2017 Nomor : x.800/2738/404.6.4/2017, perihal Permohonan Audit Kepegawaian.<br></p>', '<p>Untuk melakukan pemeriksaan guna menyelesaikan %nama%,&nbsp; %lokasi%.</p><p>Jangka waktu pemeriksaan tersebut efektif selama %lama% kerja pada periode tanggal&nbsp; &nbsp; %tgl_mulai% s.d %tgl_akhir%.</p><p>Kepada pihak-pihak yang bersangkutan diminta kesediaannya untuk memberikan bantuan serta keterangan-keterangan yang diperlukan guna kelancaran dalam penyelesaian tugas dimaksud.</p><div><br></div>', 'standar', '2019-06-11 17:04:43', '2019-06-11 17:04:43'),
(8, 'Reguler', '<p>Surat Kepala Badan Kepegawaian Daerah Kabupaten Sidoarjo tanggal 8 Desember 2017 Nomor : x.800/2738/404.6.4/2017, perihal Permohonan Audit Kepegawaian.<br></p>', '<div>Melaksanakan %nama%. Di %lokasi%.</div><div>Jangka waktu pemeriksaan tersebut efektif selama %lama% kerja pada periode tanggal %tgl_mulai% s.d %tgl_akhir%.</div><div>Kepada pihak-pihak yang bersangkutan diminta kesediaannya untuk memberikan bantuan serta keterangan-keterangan yang diperlukan guna kelancaran dalam penyelesaian tugas dimaksud.</div>', 'standar', '2019-06-11 17:28:12', '2019-06-11 17:32:19'),
(9, 'Renja', '<ol><li>Undang - Undang Republik Indonesia Nomor 23 Tahun&nbsp; 2014&nbsp; Tentang&nbsp; Pemerintah Daerah;</li><li>Peraturan Pemerintah Republik Indonesia Nomor 12 Tahun 2017&nbsp; &nbsp; &nbsp;tentang Pedoman Pembinaan dan Pengawasan Penyelenggaraan&nbsp; &nbsp; Pemerintahan Daerah;</li><li>Peraturan Menteri Dalam Negeri Nomor 110 Tahun 2017 tentang Kebijakan Pembinaan dan Pengawasan Penyelenggaraan Pemerintah Daerah Tahun 2018;</li><li>Peraturan Pemerintah Nomor 58 Tahun 2005 tentang Pengelolaan Keuangan Daerah;</li><li>Peraturan Menteri Dalam Negeri Nomor 13 Tahun 2006 tentang Pedoman Pengelolaan Keuangan Daerah sebagaimana telah diubah beberapa kali terakhir dengan Peraturan Pemerintah Dalam Negeri Nomor 21 Tahun 2011 tentang Perubahan kedua Peraturan Menteri Dalam Negeri Nomor 13 Tahun 2006 tentang Pedoman Pengelolaan Keuangan Daerah;</li><li>Program Kerja Pengawasan Tahunan (PKPT) Inspektorat Daerah Kabupaten Sidoarjo Tahun 2018;</li></ol>', '<p style=\"text-align: justify; \">Untuk Melaksanakan Reviu Renja %nama%, sebagaimana daftar terlampir.</p><p style=\"text-align: justify; \">Jangka waktu pemeriksaan tersebut efektif selama %lama% kerja pada periode&nbsp; &nbsp;tanggal&nbsp; &nbsp; &nbsp;%tgl_mulai% s.d %tgl_akhir%</p><p style=\"text-align: justify; \">Kepada pihak-pihak yang bersangkutan diminta kesediaannya untuk memberikan bantuan serta keterangan-keterangan yang diperlukan guna kelancaran dalam penyelesaian tugas dimaksud.</p><div style=\"text-align: justify; \"><br></div>', 'split', '2019-06-12 12:39:26', '2019-06-12 12:39:26'),
(10, 'Renstra', '<ol><li>Undang - Undang Republik Indonesia Nomor 23 Tahun&nbsp; 2014&nbsp; Tentang&nbsp; Pemerintah Daerah;</li><li>Peraturan Pemerintah Republik Indonesia Nomor 79 Tahun 2005&nbsp; &nbsp; &nbsp;Tentang Pedoman Pembinaan dan Pengawasan Penyelenggaraan&nbsp; &nbsp; Pemerintahan Daerah;</li><li>Peraturan Pemerintah Nomor 58 Tahun 2005 tentang Pengelolaan Keuangan Daerah;</li><li>Peraturan Menteri Dalam Negeri Nomor 13 Tahun 2006 tentang Pedoman Pengelolaan Keuangan Daerah sebagaimana telah diubah beberapa kali terakhir dengan Peraturan Pemerintah Dalam Negeri Nomor 21 Tahun 2011 tentang Perubahan kedua Peraturan Menteri Dalam Negeri Nomor 13 Tahun Tahun 2006 tentang Pedoman Pengelolaan Keuangan Daerah;</li><li>Peraturan Menteri Dalam Negeri Nomor 76 Tahun 2016 tentang Kebijakan Pembinaan dan Pengawasan Penyelenggaraan Pemerintah Daerah Tahun 2017;</li><li>Surat Menteri Dalam Negeri Nomor : 50/781/B.1/1J/tanggal 24 Agustus 2016 tentang Pedoman Pelaksanaan Reviu Dokumen RPJMD dan Renstra SKPD;</li><li>Program Kerja Pengawasan Tahunan (PKPT) Inspektorat Daerah Kabupaten Sidoarjo Tahun 2017;</li></ol>', '<p>Untuk Melaksanakan %nama% %lokasi%.</p><p>Jangka waktu pemeriksaan efektif selama&nbsp; %lama% kerja pada periode tanggal&nbsp; &nbsp; %tgl_mulai% s.d %tgl_akhir%.</p><p>Kepada pihak-pihak yang bersangkutan diminta kesediaannya untuk memberikan bantuan serta keterangan-keterangan yang diperlukan guna kelancaran dalam penyelesaian tugas dimaksud.</p>', 'split', '2019-06-28 07:07:07', '2019-06-28 07:38:30');

-- --------------------------------------------------------

--
-- Table structure for table `kegiatan`
--

DROP TABLE IF EXISTS `kegiatan`;
CREATE TABLE IF NOT EXISTS `kegiatan` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sasaran_kegiatan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail_tujuan_kegiatan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kegiatan`
--

INSERT INTO `kegiatan` (`id`, `sasaran_kegiatan`, `detail_tujuan_kegiatan`, `created_at`, `updated_at`) VALUES
(1, 'jalan jalan ', 'agar kaki kita sehat', NULL, NULL),
(2, 'menyapu lingkungan', 'kerja bakti menyapu lingkungan masyarakat', NULL, NULL),
(3, 'dinas pariwisata', 'dinas pariwisata', NULL, NULL),
(7, 'mbuhkah', 'ndaktahu', '2019-08-14 23:56:54', '2019-08-14 23:56:54'),
(14, 'adsasddsaads', 'dsasdaadsdsa', '2019-08-15 01:13:20', '2019-08-15 01:13:20');

-- --------------------------------------------------------

--
-- Table structure for table `laporan_spt`
--

DROP TABLE IF EXISTS `laporan_spt`;
CREATE TABLE IF NOT EXISTS `laporan_spt` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `spt_id` bigint(20) UNSIGNED NOT NULL,
  `file` blob NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `laporan_spt_user_id_foreign` (`user_id`),
  KEY `laporan_spt_spt_id_foreign` (`spt_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `laporan_spt`
--

INSERT INTO `laporan_spt` (`id`, `user_id`, `spt_id`, `file`, `created_at`, `updated_at`) VALUES
(1, 4, 5, 0x89504e470d0a1a0a0000000d494844520000003c0000003c10060000006a6c0531000000097048597300000b1300000b1301009a9c1800000a4f6943435050686f746f73686f70204943432070726f66696c65000078da9d53675453e9163df7def4424b8880944b6f5215082052428b801491262a2109104a8821a1d91551c1114545041bc8a088038e8e808c15512c0c8a0ad807e421a28e83a3888acafbe17ba36bd6bcf7e6cdfeb5d73ee7acf39db3cf07c0080c9648335135800ca9421e11e083c7c4c6e1e42e40810a2470001008b3642173fd230100f87e3c3c2b22c007be000178d30b0800c04d9bc0301c87ff0fea42995c01808401c07491384b08801400407a8e42a600404601809d98265300a0040060cb6362e300502d0060277fe6d300809df8997b01005b94211501a09100201365884400683b00accf568a450058300014664bc43900d82d00304957664800b0b700c0ce100bb200080c00305188852900047b0060c8232378008499001446f2573cf12bae10e72a00007899b23cb9243945815b082d710757572e1e28ce49172b14366102619a402ec27999193281340fe0f3cc0000a0911511e083f3fd78ce0eaecece368eb60e5f2deabf06ff226262e3fee5cfab70400000e1747ed1fe2c2fb31a803b06806dfea225ee04685e0ba075f78b66b20f40b500a0e9da57f370f87e3c3c45a190b9d9d9e5e4e4d84ac4425b61ca577dfe67c25fc057fd6cf97e3cfcf7f5e0bee22481325d814704f8e0c2ccf44ca51ccf92098462dce68f47fcb70bfffc1dd322c44962b9582a14e35112718e449a8cf332a52289429229c525d2ff64e2df2cfb033edf3500b06a3e017b912da85d6303f64b27105874c0e2f70000f2bb6fc1d4280803806883e1cf77ffef3ffd47a02500806649927100005e44242e54cab33fc708000044a0812ab0411bf4c1182cc0061cc105dcc10bfc6036844224c4c24210420a64801c726029ac82422886cdb01d2a602fd4401d34c051688693700e2ec255b80e3d700ffa61089ec128bc81090441c808136121da8801628a58238e08179985f821c14804128b2420c9881451224b91354831528a542055481df23d720239875c46ba913bc8003282fc86bc47319481b2513dd40cb543b9a8371a8446a20bd06474319a8f16a09bd072b41a3d8c36a1e7d0ab680fda8f3e43c730c0e8180733c46c302ec6c342b1382c099363cbb122ac0cabc61ab056ac03bb89f563cfb17704128145c0093604774220611e4148584c584ed848a8201c243411da093709038451c2272293a84bb426ba11f9c4186232318758482c23d6128f132f107b8843c437241289433227b9900249b1a454d212d246d26e5223e92ca99b34481a2393c9da646bb20739942c202bc885e49de4c3e433e41be421f25b0a9d624071a4f853e22852ca6a4a19e510e534e5066598324155a39a52dda8a15411358f5a42ada1b652af5187a81334759a39cd8316494ba5ada295d31a681768f769afe874ba11dd951e4e97d057d2cbe947e897e803f4770c0d861583c7886728199b18071867197718af984ca619d38b19c754303731eb98e7990f996f55582ab62a7c1591ca0a954a9526951b2a2f54a9aaa6aadeaa0b55f355cb548fa95e537dae46553353e3a909d496ab55aa9d50eb531b5367a93ba887aa67a86f543fa47e59fd890659c34cc34f43a451a0b15fe3bcc6200b6319b3782c216b0dab86758135c426b1cdd97c762abb98fd1dbb8b3daaa9a13943334a3357b352f394663f07e39871f89c744e09e728a797f37e8ade14ef29e2291ba6344cb931655c6baa96979658ab48ab51ab47ebbd36aeeda79da6bd45bb59fb810e41c74a275c2747678fce059de753d953dda70aa7164d3d3af5ae2eaa6ba51ba1bb4477bf6ea7ee989ebe5e809e4c6fa7de79bde7fa1c7d2ffd54fd6dfaa7f5470c5806b30c2406db0cce183cc535716f3c1d2fc7dbf151435dc34043a561956197e18491b9d13ca3d5468d460f8c69c65ce324e36dc66dc6a326062621264b4dea4dee9a524db9a629a63b4c3b4cc7cdcccda2cdd699359b3d31d732e79be79bd79bdfb7605a785a2cb6a8b6b86549b2e45aa659eeb6bc6e855a3959a558555a5db346ad9dad25d6bbadbba711a7b94e934eab9ed667c3b0f1b6c9b6a9b719b0e5d806dbaeb66db67d6167621767b7c5aec3ee93bd937dba7d8dfd3d070d87d90eab1d5a1d7e73b472143a563ade9ace9cee3f7dc5f496e92f6758cf10cfd833e3b613cb29c4699d539bd347671767b97383f3888b894b82cb2e973e2e9b1bc6ddc8bde44a74f5715de17ad2f59d9bb39bc2eda8dbafee36ee69ee87dc9fcc349f299e593373d0c3c843e051e5d13f0b9f95306bdfac7e4f434f8167b5e7232f632f9157add7b0b7a577aaf761ef173ef63e729fe33ee33c37de32de595fcc37c0b7c8b7cb4fc36f9e5f85df437f23ff64ff7affd100a78025016703898141815b02fbf87a7c21bf8e3f3adb65f6b2d9ed418ca0b94115418f82ad82e5c1ad2168c8ec90ad21f7e798ce91ce690e85507ee8d6d00761e6618bc37e0c2785878557863f8e7088581ad131973577d1dc4373df44fa449644de9b67314f39af2d4a352a3eaa2e6a3cda37ba34ba3fc62e6659ccd5589d58496c4b1c392e2aae366e6cbedffcedf387e29de20be37b17982fc85d7079a1cec2f485a716a92e122c3a96404c884e3894f041102aa8168c25f21377258e0a79c21dc267222fd136d188d8435c2a1e4ef2482a4d7a92ec91bc357924c533a52ce5b98427a990bc4c0d4cdd9b3a9e169a76206d323d3abd31839291907142aa214d93b667ea67e66676cbac6585b2fec56e8bb72f1e9507c96bb390ac05592d0ab642a6e8545a28d72a07b267655766bfcd89ca3996ab9e2bcdedccb3cadb90379cef9fffed12c212e192b6a5864b572d1d58e6bdac6a39b23c7179db0ae315052b865606ac3cb88ab62a6dd54fabed5797ae7ebd267a4d6b815ec1ca82c1b5016beb0b550ae5857debdcd7ed5d4f582f59dfb561fa869d1b3e15898aae14db1797157fd828dc78e51b876fcabf99dc94b4a9abc4b964cf66d266e9e6de2d9e5b0e96aa97e6970e6e0dd9dab40ddf56b4edf5f645db2f97cd28dbbb83b643b9a3bf3cb8bc65a7c9cecd3b3f54a454f454fa5436eed2ddb561d7f86ed1ee1b7bbcf634ecd5db5bbcf7fd3ec9bedb5501554dd566d565fb49fbb3f73fae89aae9f896fb6d5dad4e6d71edc703d203fd07230eb6d7b9d4d51dd23d54528fd62beb470ec71fbefe9def772d0d360d558d9cc6e223704479e4e9f709dff71e0d3ada768c7bace107d31f761d671d2f6a429af29a469b539afb5b625bba4fcc3ed1d6eade7afc47db1f0f9c343c59794af354c969dae982d39367f2cf8c9d959d7d7e2ef9dc60dba2b67be763cedf6a0f6fefba1074e1d245ff8be73bbc3bce5cf2b874f2b2dbe51357b8579aaf3a5f6dea74ea3cfe93d34fc7bb9cbb9aaeb95c6bb9ee7abdb57b66f7e91b9e37ceddf4bd79f116ffd6d59e393dddbdf37a6ff7c5f7f5df16dd7e7227fdcecbbbd97727eeadbc4fbc5ff440ed41d943dd87d53f5bfedcd8efdc7f6ac077a0f3d1dc47f7068583cffe91f58f0f43058f998fcb860d86eb9e383e3939e23f72fde9fca743cf64cf269e17fea2fecbae17162f7ef8d5ebd7ced198d1a197f29793bf6d7ca5fdeac0eb19afdbc6c2c61ebec97833315ef456fbedc177dc771defa3df0f4fe47c207f28ff68f9b1f553d0a7fb93199393ff040398f3fc63332ddb000000206348524d00007a25000080830000f9ff000080e9000075300000ea6000003a980000176f925fc5460000425b4944415478daecbd6b785557bdefff9973cd75c9ca951042086948d334a5698a694c6944c48814316244a4c84644448a1411111111232222222222b21129c61429c588881429521a29a594d294a6699ad23484908610422e2b2beb32af63fc5f64b1b53dba3d5bcff93fcfd9cf1e6fbec9989735c7f8ccdfb88fdf54a494524afe27fc370deaff64c1ff00fe9ff0ff70d06efda1288aa228ffeaed5ca78734a57e48471d1cd2d4a543ea8fbd50fe6543ea3d1cd3bd431a973ea49e13b1a7baf4ff5676cab1436a4e1bd268f7901a8b623a7348233b633a6348fb82437add33a481c62175cafef547fa97ea6075f29066ec19d2e92b3fe19fb56caefabb6f543f76e03b877ed0fb6aed1f9efbf80b8ef99117ee78e9ebafbc61bd70e90b6f3d7be54e71dbb52f5e7ff286231fbcf6feeb3fbcf1867c30fad5e84fa3bf9796fc3b417c5f8c749efaab88efca64f13bf99f85d7e457a594523af25129e5bde269f119f90f83f8b648767e2fa5509c7f77ee8f453eff8faf93c9e257e20352de4ac7ad74dd4ae7ad74bf70c74b5f7be50deb85dadf3df7b1171cf323bfbee737aedf2b7db2e2ecac9c7f3bfabbd76ee5e33bf3f5563effff06d89f3aa4ef9d7bffe9f7adfec0ac47bf75f1a1860f34bdcfbefe9f64c15bf28b524a297f2ec7bcebc80fffd3ac7b4b7e564af925f1a6f8ec7f72d693f276f1b89452cafe18d821601f77feec3cf837ce7f403c2eeefeabffef118f8a31ff98a3f35be776fbf1bfbaffcf84dbf9d15f9df073e916b7feff8394ce87ec67ec8ffe8dfb58ceb79df8ff35fe563edecad75bf9fcce7cffbf063861ea907e64de96efec7871cfc31d5f1bf876f08160585efbab67fc937caf94e2b278bff34729ed7efb21eb65f9bf17de8ce90f62fad7d77d5fbc293e22a5f3a27387fdef523a1fb67f650f7f0760aff8fadf04ef155f97d289b31fb12e4b296e77be65f74a299e1289ce77e4ff3fe1e7317dec2f51f6e376bcf5dd779cf59cfca094f233e245f171296fe5ebad7cbe95efefe4f07f0cb0d63aa41fd8bff78ec7de7ea2bff78752cac7e55f5980f31efbfbd6c03b1ef853e28fefb0986f3957fe13cbf886fd90f54d29c50dfb01f31b528a478c70f41e2965a2f191d093524acb8886874929a5fd6bfd0f524a299f723e1db322277693af4a292c71aff3957715bbbf96524a79a7fd4d29a5745eb13e2da5f305eb45f30352da57adef99b7d2f10d29e53de2abceeb52ca4f887f77a2523a9fb21fb3bdff07200f17ffe63cf3aeb8bffd82fdf9aff3f556d83becb1579e78a3f7e7431c26550ca97bd2ff21c063e6ce4efa4cf3c2d4676e8fc487af849f9696fd8465589fff0f2b9176d4bedffa9194d677cde7cdd152da0f59ff6edefccb7129e5d7c5f3523a9fb0bf6dbd18cbf87e29a5347f1efa9294e2f6d097de7c434a111ebc7ef12529f56ff4fdacee5929a3dfe8fd59dd3352467fd173fd853ba4b45e0f0cbcfc1e29cd5f04bed1f85929a58cfcb2edc7524a197db4f73129e5e391a7ba0c29eda7069f6ffbb4945246efb87ab794f25a24f1ca4829ad47069e6afebc94323efc85d6d7a4749e0addd7fa7929f570bfbc3c5a4af954f4f5fe1f4929a5f172b05f4a299d2f47875a06f1d69fa59452bc607f3b96aeabef48df5ff4177f27feafd4fe82f52b332aa513673f68fdf21dc71f14fffeaef3ff2465243e7c25fc2769cdddb6a0fa8bb9a7bf34c42527e95f047ccb7267f5bdfaebc6372e7dc8e99537e51d6228812fc84429a5948f88df4a29dee77cc6fe9594ce08fbfdd677a4948f8b6785122b7a5c52da1f3347eb1f93527c2f3aa6ff67524a19fae5abdf92d2bcdc77f3fc1fa59432f4db57df96523c1f7ca5f1eb528acf063f7a31514a7b44ffa79efb8e94d11b377e7fca2d65f4d9abfff6fbdf4819f9fde5b88397a534ddbd5f39f37529e58783cfbff8252945e2c0cfce7f534ae7f6c0e7ce7d584afbb9c0fb5ffa9594f295c1cf35dc2da5fd68e027f53f91d288eb79fe85e1525aa37a076b7ba534ff78f3a5dae1521af2c6cd3f3f28a53178e393cfbc2aa5fdb1fe6f3ef725298d9ff6fdee957e29cdd7073e7ef93629a58c5eeb7f444aeb47d1af84de1303f1c25fd26b3ae6bdc6d7a5946f8a4171ff5fe2ff4a1f11bff9abfc31ecdbad2f4a698d301f347e148b774b291f113f71de90d27ada8a371f91f21687212e9f5af7cedecb7fd24dfadb61d8ba7f5bfdb9e90f1f78e4a97bf30bc6ddf9b4da431ad9b483956b561acbc0ddeaa9f36c07e59c8a0ad8110bcb0faa5f1dab5e00916fcc085f0057b3ddd0330198e74c6cdf06c66c7385530e9e7c6d7a9c0fd828569b1bc11c6fac32cac069b7b6f736813c19ed7eb30a642b479554f06469e7947960e5462abbdf00630b8bbaea41bd98dc9cb915accdf6a6a00f5c5bb5d05d53c1b54f2df1ad04d123f203734029556be3c6815aa126254f016d998bf8f1608c3796dc4801273ddada590aaeadae9dfe46d009cf367783d4a31d3d41f01e1879e6ee0e907eaa0379e01aaf647ace832ea2ab5377804f4d5a376211b040348879203b64b9d040a955cea91e1042e8c20655557dea0e000ec852205366c810683dee0bee23601fb284d907da2ef74677056868195a36dc537957cf1ded6aeac727cd2cfcf4f605979f3c73b8f1372bfe1c6b84f5fd2f04955b16fcb7fbc1f7e6fee2beeac4c77f70e6e52f147e66ed439353525c9aabc1751cd0e9a10dcc0473ac390e3c21cf254f3d50c479b91ec4c4e8ecc0665027389e1bd5006255b816f4e248da1513dc87dc8b12bac1ae9791944cd07c6a7578073855d1f597cf0047c57cad0694d9be79097de02419a74280cbef6ef1f8419e36d4eba7c14eedab78eb83e09e3cdafcc868b0034e59dc3cf09c746d0d6d06a54e9b999d0efac60803e5a0ec51ce5ecf07778b77ebe842d07cee8451f3c05c634c1a50413dc181c1031039d13ffecd42f0ccf41e4ad90fce0251ec3f01e6f99be3de5a0f4a857f916b12c41d1a9950321bdc459e4d29c74174880c651cc8496a5dfa1470cf4cd832622780eb94f704387b9d3aa7045cb5aea3aec37fdfb4ac226b9a3503dcf5ee13eea3808f34728034c653013f2fabae3d90d2bf61e9c7163ef9d93b26be6fe8aaa6a9ffc591acf4dc51fbd3b78c288aaf5717aa256a3a18e38d52632c18f54693710ee45c59260b418c15a94200eb8da4501188e2e8bce61cb027eb076eb480b5465f1030c12e0dce6db81d8cfa8879b316ccbabef52f2e0623b7477b7d1dd849039bb4569067b5f9a3ce80ec33ab5d3b40a9b24b9c3630fdc1dcfeddc002f7e2b4123026d8d5ea5cb0b65c1f7be1dbe03daaa524f4805362db5633582b022dcf4e07f6c8427713a8c1484aef61307774ee7ceafd10d9dc3de5c51460b99367cf00236520f7ed1ef035264ccc5c06067d5daffe08c4c5beacf3bf83b8c6e14599a5203afa57dcfc280c66bcc593af4124d45bd070019c4a7b61f80498532325970f4164c38df2736d20d6853c3767822b5b192f8bc09c6fce372b4064084d0440ac10f3c4549045325d021ada45ed08584bac85d60c90a5324b0242153da20946cf4edf935e91703cc6a9e09f1caa1c569e54939890b8c4355f16cb7429c09dedee749f06055a390bee4ef761f756b07698ebcc99605506ab1bcbc1e88e1e0aec0027c3e066278845d1a3add3c0c9310bb4dd202706a774a783e8bc19b9340cc45c7d91fb2c9829cecefe1a889addea8b1f85a8da37a975353859e10e671ae873da7c6f7e13222b3b93da5e0157914f1d7902ccb37dfb9afb2062b72f7dfe1cc856f3889909d696807ef93e50ce45ebaecd02bbc973749c1fe44a26d933c15a13c8ef4c03b1c5a809d58299116c0be482def276cf0b7f026f5572f69d1f06a5da5de7de04e6b8fefccbcf807a296d77c1c741cc0e56df008cb6b68bb5bf07737bd7bae70e8368b0fb221341c9511aed39101cd73df5c24ab0d70fccbe5a0ccc73769a0025a4a28338290e881d20b324b20bf445fa327d3eb83a5cc75cbbc036eda0dd0aac650e1321a13db12c7e87ba3dc6e9e03f0938f178dc761fdee54a36e95297ad2035d9212f80b24b5da656802e74bf6e83724199289743a83430fbcd63409abde8e602e08835b5ab11cca6be7d9d6f825c6a2ff75d0747180722c78115ae8a615341e41949ddef016d29d97d9f067b756845ef0550538dfd916761f0c8e5d67a3758474293c20960e45cd7da33c12e19c80d6d03a74edb967006acd4a8ffe6e7c018db9bd19706a64f9f676d02a3b56bd3b323c153ed2af35581d9a6d58c7a00d443b4063e09d1f1fd653dcde03f3e62e27dcb4027b02f64833ea96bef5bf78339ceb19d7320168bf10355a04c8f6e0a4d05ad7cc4eef10360ac0a9e1fe801e3c0f543f537c199d339fb99ef82bd4e5f1e380fd8faf4fef960548426b42c00b97870cae502b07718b9d18b20aa9c4dce0a900ce5af6b41acc42c36c61bf9400e3a6d601fb6f7d9dbc01bf0acf5f8948458bf38f39f6c64c5edf2967b0f7952192e2e8a0da20f6413b5723fe00374f0043d7dee3eb02fe84bc3b5c0d94876af074497827b1b0c6eea6deb1e065a955d1cfd0e88f3de2e7f3f88b5c6c6483fd895e62a6701280bad939d7de02ef1cf8d3b0f72e14076a8108207fa7a6e4c07a5de1788df0ac3f30af21e7043685757d5ab2f82c81045f21cb80f783b9227813c67ae1dec81f0bcc0c1e09d20d39d935481679db3b74b032b5daf1f5809de49de29771e043d37d4d17d159838b8b0ed07e0ac499e9921419936e2d8b8f160b474ebcd5b409e0b8f0f6c02b542dd15dc0f8eed5486e682df1c5e31fecfa0ae892fbda313225b7ad6bed1035ab3e5b9ba12b40d729aba1b7ccdc915d9d360e074fbd18e364838313af0de85e04e15abbd2ab8270eafced5c1f499f9662ab827ba13b46eb037db217b0698d3ccd9e661f0a678756f08bc0d9e359e5ce54c8cd387fe49c0de6ef76eb7d0e62bdf91017692c30136c9a34c055dd7b3f402f08ef5aade10a821d9ea6480d869cf19fc2e884a235d7d0cd42a638fac033bd7a81f980d2e9ddd493ae88170285c09ea763bdf898068b257069b20b4b47bdaf56c500ff4b53aade0ac1c9c2f0390babed477c752f02ef76ef70f87c105de4af77da0d9de345716382b9455f126d8857aa8f708a879a2d04a87e8d4f00ce712b83cae697a0b18fa8de96f94813f63d4997b74d072bca6bf02d8ae6c73fd1822eb7aa6bcbd07123bd2fa6ed32130a96fe6d53c609c3a2e3107a43fecb93901d4e3a2b11d302ef46e8bbf0c6aad6bd9b065609cb70bdddd604d09eeedab026d4eb4367a0abc958909499340ae8a54073e0d7acf404de325b0fbccf5916d609d566ae33a21ae6ed8aa51b92011e57233b8711f7303ce51a7d2990d72abac96c7c1d3e3d9edf6289b8638f95ef92701bbdb64926c914749d53bf434bd1bbca6a7de7302bcfbbc2b3cd3c1683335230d9c25c1957de3419f1fd8d2f502b866bbb5e45320bb8c59ac047b42efc46bd3c13b47b4c5ed07c3176c368e42fc8ac4727b198416dc1cdb9b0af6b2e0696727446a3bbe69ee84910bc6ef2ede0af1cb933ce95e90b9f652672df89be296a60541cf1dc8e92a02b53179564a0fb8d67bb7c79f8490d993d7990baef9e8c30e40b42d9cd6b60a9c0e75c36b474009266ece9b032c90273c06c829aefd4a2d2879a19a4005582bf5adf1a7c12b86e7a4c781ecb666c6f7836db25d5d045645b8f4cd4de02994e7adf5e0cc77e525bd0cc3e6dfb9f9c1357073ce6b8dc76783969178c46985486d7bc9a52bc02e9f277d11445bdf3efd56310c9b7c478bfb7e08afec3aab6ba04df1774c4b036dbc678e37e32f249c326781b3129c7a71de39095a956b86ab98f2d8ecdbe3ff2460cd768f756d77f530413da4ae540e80b1daa8328e83bbc49da25580fb84866683c8b627e947c0551f1718be13e482609ddc007af9cd2d4da7203ce506033ef0345a6b4236246f4c6f486f85c145bd279b16c1e0c18e47c3ebc15debac76eb204efb482e849496ac05b75f03759b7793a70cc47ca74926817ba37b7cf20b105e23cef5b840f7f4fb836bc15790b829e5342893a21d0dada06f91bb9276806bb3ec89df02ce89d09a8e8bc04a23184e0225d7bd78f846106de6ceb75f033b53f18c9c0d4ea07b49c70e701f4f99eb3b0baed6b8d2cc52f06f4e11c5bf00bb315a32f638b8abdc1effb740d8e2829c03eec5bed09879a0ac7bef9cac1ad02e3807defe082827dde999f7825d185adc7000c4818cbe926721d21d50af8c01578937cb3c074efb40c2f5ad2052921332e700b359c83ad0a668856e01769613b19b400a5927aa181ac97a488b0d5d72f0bfd8c8d296c87132284f92c0623945e68036554b75b543343b9aa7a78379b4ffd4b5d5a0cfbfe6fbcd87c1b5ce5d30ea51189c7963c2b5c370a3bacef5da3e10cd04934b2171e6b0f9c3f2c135539b216a2092d0b9aaff14a8e9c62ed902d7c7b75f8c1e82d173df7b676121b8c7c7f97c7bc1b5397ec188d9e0daac6e743780eb9c5297d0007e917430d50f4a6af464780638cbac554a235867e40c6642606e47f7d5292096a8eda3f3c0d8d43f7ea00002b3af9bf53f02d9e364276f073bcd3c135d08ee72cf3cd50fe1e503a742d7c0e80ed70f6c03a95aa77b3bc19c6e1c0d1e80c8f6e0aa011506a7de3873f1ab102e0cd6b59d86e0f2be86cbc7c0d3a8ec562bc15c6796b9e781eba0ecb3ca40c9f165df7d0f248e8b4b4f3904f147e27dc53aa454261516754378c28dae17570379f6743d1f5cfbd445ae5290ab6585280457baabd97518b4a5da19573ab1f962d7ea7fd2825d1f76376969ae328a9442a54d390662aa182f5240cbd4ea5d7bc0392caaec0dd0bde18d63f57f8648eaf5f972150cecbbf6e3b7f641fc46cf56e53ca455ddf19edb03a02e5032ad00f467b7ab374a203abb3379603a84f3fb56d9dd3062e3dd9fbd2b1b92cbd21f1f6e8098e9aa4caa04177195a9f500e258ef36509a4cd5a8026d9eba21750dc862cdeefa2344d7df3875ad0cbc9be2fb527d60cce9753507c0d1473d9f7d1aac5991b6f84ef01cebea69180fd1f98987725f00f756cfca912e101b8df6ae28b81bfc73468c84c8da9ef337ff006252f2c1373e03d699f09e57678335db582f42201707d777fe00d8a86ed75340d8d176fb3ab836faa78d79146c9d2dae5418f0b96bf4cd90dc3a6a7efe4b10dc11dc14f816445aa30d896e18362febe05d21b03b8ca9b201946ebd2170064489bb34ae08ec146b865d0cda45ad425b0e4ea39de1ac2302dc0fae19ff2460b54ce6ca26b9198fa814b3c46e907df2b4ac03da39ca16088deb5dd4bd1542799d33fade0bc686c1f70c8e83a4dc94096c82d4c9b71bf926586d7ab11d84eb556fd6b72d00ab677084198248dbcde5d105e05f3d421b3d09469ebd53cdf18379dad9acfd12128f0c27a318c03737ee2c80723a7515d01099199e06ce46f392380cc3d387b5e5fc197afbacb6161df484fed4ae9d206b9c497a15dc3cd6f6f45b5d303c326a7ece12e86bb9fc7cfd0ed0cc84cb0d1f0265625a69f609502bddfbb56af0a56ae3234f817dd66ad01e076f509b90f234c863ee957dbb41e4473b8c2960fbd599a935a064bae71867c0da3eb0fc5a135c0fbe1ef7620092e7671fbb2d1d7ca75252e22e40b8e9c6cc2b9bc1d5a16e8a3443cfe2b7c5cd29203c727fdf37c19591903ee245086dbd39e3ca3970cff4a4a72e01aad84f0d28254aba1202e5a2b2850cb2629cbe1e03f6e5ff2260c5ef5438454e1a38eb9c99ce02a08ad9a4030122748326864d19bd0f92a6a6edc2050311eb4d351f5c67d4ccf81650cb5d13d2eaa123ff95fb1ab7837bbddf979e0e516da0a0af115c5b1277a6154366fbbd323f0d928f2507928f80af7d78d1a8cf01f8cec5cd07d0f62a35009e50c21e50b2239d4995a0e584d2fb6702d9f60e970623a6a735e4e5807e327173ca5930f343f9461e5c2a3ddfdb3a1e862d48fb5de274909b7cdb6edb01d74f361c6a380199e70a9eb5f68298acccb53e02dad6c4ace447a0bfa3bb3850096135d291bc10869565ac1bf653705ab4b3620b040ff744fa774362eb88c5be1e48c8cade57b016ba3734fff8f976e8296bdf78ad1b28bd526d3441faf1826bd987c0bd35aed4dd0a5a916bb7b90b8233fb36f4a7807b8771d0b80d44bae744ce34d0aa4591380cf6517baabd01dc95da69ed02b836ab2bd4236403bf0575fcdf03fc0fea60a5d239e754d9ebb0e992fbe462086f0eef0e6d03c7134ebbd904fadeabe3cf2d837079c076f68167a7abc4a985b8dc945f8fce86eeb6abdfe8a98170be3121ae0f02e3fa2bad1630960f96381530a6f8de91776e81e133d32b527680d6ecaf4cfe3040a29d1202a05a2c0450f7297301b4856a1580763cee34b8966b0bbc3320da33d810fc0d84660572422f825229f6260421ab226f4a6101a47a4654a684e0da86a64fb55c004f66fc4b44209835b042590d37c7bebdf9fa1470a76a27924ac1d3a61ef077c0c88c9cb9f73c0303d33a2a6fead057da7af0f593e01c8a72ed2284371b9b43a7e05a6ac343cded603446e6843470e7a57a12278267b2ffacb70314e15b1a7f18ac39e142bd1eb4b1b4b9a681986b541a9540839e1d5e0aca667ba6d80737f774543639e02ed78e2a35e09ee6ee761f85689fdea35f0247759aedff984352a7fdb3ab2ad3e456e1719680593070aaab13d4ec48d1cd46185cdd965e3f0fa2cb5a1a0f3f0bc9f3863726ed0659e5fbc11ddba0beeeb597ac0ae848bdda18980d9e3dbea3c34f837fb23acdce87b16bef7ff2aef990d1925193be1d9c75ca76ef29d07cc3e78d1807105fe1ab0070e5296b008c04bd004094da170092dbe31bc19590d2969e0ff13d094dc95f06b5d83a614d84814bd782d705b434bf3cabc3077e3d2935bd1c6e6674b6196910d87fedb9c038482d193ed7950ad7522e7de66a1d34ce7df697e7f7c15b5517bef742235caf7f437bfe0760140efca9f712dce87a6378c711085e6adbd29e03a9e9a97adc1e3022e2a47a1e06165e31af8420d4d77734b00c06445fca602e84cef5750e3683dd2c0bd47520b22dd3990181405fb2be1782fbafc7773643a820303630015cbb22937bcb40ad63ad4c05a3d568364e83d6ad6d764d02314ea409f33f38edff27eb60500f2a1a3658f3af9baf15c1e0b16b352ffc1c586289400984eb07abc255601fd32fc66d849bb93dbf118be0ecf7dfdc71fd0254e43e30af602268a614fa64702658abec3370a5b979c78d7aa85bf152c9d504c82d2f39989b0979d3e32a12832096f62e090b48292f389faf0178d7683e00eaec2c0077b7ba1b6074715a109831b8be6f125cf3746c78fdfbd053d3f687ee45a0a9ae83ea0c70edf59cd26aa1606761cf1dc7e0e6f8ebdb8379103865edf76c80b83cdf34ff6e180cf5acbab908065bbbebc53c706ff12df796815ae5eaf1d6c3407bb4dc2e8751f5b2d8331fb483f632fb34685b9dafea8510ccef3d686480b350779b1a6867dc3b7dfb21b4ca3cecec877056ff8dc849484c895fee3b0a76b3f369d76e704f7439ae4ed08b6fc675e7424ad9988ee4f51058df39a97d3df81ad226661d02d1e4a43b0d20e7ca53b2f13f4ada49ff3460abd13929f381b261c5636c508f76b5bf5104817181487836383b5da1743f742fe8fef3b50c881e8f4ce520dc953d86ac6dd035f64624b81d72e78f7d2da11182bb5ca97ec09ee9cc241b3296c7af8bab84e08c9ebd610f3437bdfefd4be3616c5ec98efbbf00a094383a80dc21570184fd7a1380d7f66800e1dcf029d09246d58e288002a66c2cfb28d01e3a3ff06170ec9e8ff43c0c51b5ffcbfd33c0f1584566138c50d3670cd3a06fd18dc1e01c1898d75762076174fe5d93538f81eb44f25dee12b02bac54633a8874f37b3442cfa2807f700bf44f8f24886320e7f7af510f802ea29395e5303c7b647a6a2584853e3f500209b3920ec67583bac83791ade0de94e8784a80146daa7b0fd8b631cb2e03dfc1f419be220894079e314e817e29a8f45681ab5a2fec1d0067957332632d28296aa75a0db24eb6c9f6ffc2bae8bfbbe2e3a238290e80da96b42b6b1f249c2d2a9ef334a4e5453aae7e05deec395ff6742aa4040b16dea5c394b31f5af7b1a7e1d7177ffa851da3e1cd275ee59506f8e46d936e7bdf06483b6b1df64f016f867b875600ee1df1b7c53782ab35e533c39bc0bd32eb898c8701b2b232b603c80cab14c01a4717805e113e083030bbf724c040f5e062e0b4b9297a116c9f3d5fcc01add4b7d4b5045c9a3fd7f755f09f157b136f03c31ff685b74072509da7ee047f816f8f7604866f88ffa1bb15640e4f510f494923270c2b02b5ccd7a0ad029162fc30d203bef31dc73bf2207992d3a975819ce6fb96ef02b4d5348bb7bbc0aab0d68b55a01de3a86b16842bc3938cf9e03aa3ae765d026fb9fb8ffe0eb07cc65816816e1a2fca0560315811dc00aead2e57e2593083c1cf07274344ebf25cba1be2ce8cdc7e7717a8dd94b304e406b1546c1e5a4fc5edff1260795c1e00395f9489021021d72a9f1ffa577936e59c85acfcb2e98b1e84e4ad23ce6436807f617261d25808eeeefbd6f52f43ef3eb3d6da0667dfd3f8e38e93f0f2c75f9fd4b11b3c1ff274ba764371cd9d5733cbe09eaac2c9ae26b8ed6cfafa518f01e8854613405c922c06e85d1ec807225d336e68105dd7bda6ffa3f0d6862bfbae6d84f0e1e801e7076077db8f8aabe05f91e8897b12128ffa4a5dfb41a65821e3002467fb357733b8d7baf62a3eb0b3cd0c910fa4b996ba74d096bb662a4b21b239bcd2580b71058a296780daa31cf34d84b84bf187871f86c8fcfeb77a0ac05511f76a621b24f6258cf26c80c8f6c804bb148276b4cc52415be4ca911de06d519aa3934059aad60e3b01c1f64077340809e392e6c4cf03fd4468b79e0d72aa3fc3690255288dde5418aceeca7ef369f02dbf375bdc07f6399120ecbf70f997b7ae888bf2843c006281982ac642c48e6447b2c0f2d9d95629488f6b8a7b2274d676a4b4274097de96df520fbd1f0fd4f5b743708f287657c0fd7b3effb96fff1e467f6cca639f7e12d67dfe4f65af0660e1bfef29ad9d075579073f7a6e15c8a43ea16f0670668b1a806824d40370fdfcb50ce8e1f596963f40c4ecb1fbab61d8c18489f1499076feded0833f84a46def79bae231689b1dfa69fa6178f8899ffcf4e953f0912f7cefd12317e013bffdeee38717c3b28fefb8efe9197071e6eb5fb8de03c30f8fd939623a246767b5a5b580675e42996f2bd8997a867d0ca2638397a265e04b752df5ac034f2e6bb58de0ec8a98a606769195634f025de89bed06b096194df63a5066c91ab241572d9fbd189480734a3905d7b775dd115a074a9a1a5027c1405ea49866e0b05cc13970ca6ccd3906fda76fceef6e02512672850aca6c0af1ff85cbbf5e445f90c74535e867f566bd193c6b3dd99e76a09955b208c4788130c1876faf770ef4aceb3e7d53803b1af7ddc434309a9d9dd666c868285626c483344f773f5f0004d03c59f089c5b3729794c11d57475f721d80c1713d8f04cb21097362da0180c1869e89d0d7d434b36d3404f37b02a10cf0360d4b8833c1ef1fb177f821b8ed4259eb475a01869d189d09a74bce5e3ef722bc787b5beedbb3a0a0fa76cfd80e18ab16ce1b7f160e9efc63fbc1cd70a79ddb3c2a0b3eba3ced4ce25120cbb960af03cffae851572704d3236b8d0d20aacd66d30f62b16b963a01d40ee25d15105d33b0333416c41e2b57f441ffcce04c6b16a8d92c563b20656a7cad2b07ac6a99917401cc62fdf3f200a873e56c9101c31b523e9b340522170715bb00fcfef8c7e2349039e62a7d2c18d38daf59e720b23f7a3a72195c275db5da44901764adb8b5e4e7fe7fc182e5457142ee0777c87dc0bd02a2d9d1d2e804101345b65041bfa0b7ea2da0cfd197188bc14e9253390176c47d3ea905babb6eeebe3e1b5a67ff61ebcf97c26befbbf0d0b907414e5036b101ac0be1b6fec9e06db56a9c6af0ac8dab4a9e0e6095d83920e65d9d78e32508f45cffd6400f24ec8b5bad9d84b890afd8dd08ea1ca32bd20776c6d5aa578bfef2dc6fdd7e655fdb1cf0eadae9d489704f5ad6b13b2740e9a8e207effd13f8db3d19be1ab8f7813bc68eca04701d5133c128341638fbc075465ba06c018e3893642544d3c2bbccd5e0d944919806e60a738238071db3af35f4ce0771de39c112b026d8abc40cb87dfe6d979274483ee0bfa02d077f55dc12ff5eb81ebcf181a00ffc13e25a3c6920ba3c35713340ce52abdc4b415ba7ae751d05bdcd78d43a00768335dece044f837bad67127836bbc7bbff8acbbf5c44cb8bf2843c087695b3dd5e0fca4e65116510ee0ca746b241e9564e283b40cbd11a5d55e06f4e2c4a3421f7be7baedc3717524f249f893f08e1e36f462efe01462686c7dd3c03ef2b18ada757437dc9b9b2932dd0d2d59274e904f8d6271c483a0e30981b6e82e891ee40df12704f76529de940ae6b9eb205fc4bdc8b5d0510b74e9daf6d87aebadaf3474702d4af3f71013ef4fd71fadd7360dcf41176da0ab8b6fae64196c3ae0ffeeca73fb91de6a69564dd1e8487f6cfbaef818f01c8392e3f788a5c475c8721541bd6cc4b20f2cc0ebb0b5c73ec9fc97ae8adbcf1d9c122b00bac198e07062283078cf130100cb7d87320bb2eb32aa501e2eb9446631bd819ce423905d40cd7046d17781728d3390b23f25394b88330a0f63e10d903de1257ab6b3e845307bfa71f0579d03aeb5c02759bdc292b414c12394283f0e1c8a548c75fb8fceb802fc973e208900f348193e3243921f0edf216793ac1344dcc20387b9cadce0a3096186bcc1550643eb06cc24be0c6bd2bde84319577cccdd4e1c1c67bba73b7c2fba7e5648cd0e083db72cb334e43e9a23b2b6f1f0b5cc8ac1dbe14205a13ed062b69e0403400ea6154311ebcab94055481b3d798e41c005f8f6782e70c6465e5eecd7443dfe1974e9cba06ef2d48f8bea3c2679e78efc9d1b930b16484e8698245bfbabfe4ce5cf8ee971f1a9834b4da73b9af04405cd27e00ca7e75aada0afeb1aca608a21d8395fa0130a6ea05960d9a6ab53847a1e7609f16e982fe96c11dd1725027bbceb8126058b67f956b3e445787b64517c260496492ab1ac46e71485908491be2b769d9e0da47d069026d89d84e02c42724cdf11e0071c148302b413ba04c52d781e864a17b03d893ed49560178d3bcc73ccb41d6cb5af1afd7c172b3e8924df21cc80562869808568e9560f58035c53a601d07658312545ac0eeb02fd96de05de949725f04f7c6c4b684c530e26cd2b4c42d90b45491da57e0813513baeff6c178df9893c33f0d6fa55c7e2ab00e4656977efdde8780959eeb6a1b803e2bdc05f641bdc97240345a5bc47970d65b1bed7d602d8fee30c6437cebc884a14988a4f6e1ad903a3363f598f741eaccbe9c813fc2a2baccccd47e109b8dddc654f01c4a2e4c7a1d20ed9bc30e0378bbbc0b01e40277334078efc013105e3b70215201aee3d635310b9cb5fa2cab1e5ced6a8db800bd09fdadc1d930f0313dd30e40ee47b4ed9e0d609405670532c03caa1f5236c2c06452947c48cef2243913c029884e3572e1c6b9de7bf416b00ae43ef732b8edd0c81cff4250729d063a406ed602ae55e039e39ee03d03ca44255e79068c2afd98d102e2a228923a7037c3ff15c0b3ad8356c45ac059e39871c1d84a96daae6e568bc1bddfbdd23d135843aad4813e3ae906e1114234c1db4bdf0a5e3a04692fc677c4bd0424b91f4c7809c03c659c01eb88d16e3f0c5d9bfbb7870e40fee9cc96917f06884e1a2805608ae5057639dfb697412825946d6c06efa4844fbb57414a87ff605c0b802fcbef06881f1bdf0320d3dd3b0146ee1f730ab492e1aa7d0c3864e684730032ea6f9b07107f207131405be88d4500d129e64670ea8c426736b81618b6bd06f48b91f9c6043096872e46378195229a9de9d0fcdd9b138263c1e9d442de2d60bbad426b1c583de194c85c1850ed0d71cb20be23e9a4f72004537af5d04a9870f881874776c08886bc0f67654257414756743e9cb59f9bdb5c0d19752323090248b2abcc16089f885498d560f4187f3286833a454d73099097e41959f32f5bb0d36d6c317c660dd572ae9c24732955362bf328057bbe3dddce03b547bda4e8c025ba6901e7985def9c82ee7d6f77b43e01f718694b866503b8c2da4880f0899e5e38b1eab9efbf1e84a2b31ffa59e97480ec60da2f019acacfa402c85da1cbe09da9dd2d968327d5fcb25d0e217f2f917d907c345989df02e0eed2be0a209ac5310063ae550b3022d5df31f47bd12600a74ed901a09f899e07b07759e301c25dc17d008e6e9c0757897a4efc09ac6983d9fa0470669ad3ed5910ad8cb69879d0a10fe68596416881b5dbde0472ab92e9ae83e0cd60e7e058704df4ed2703dcbb13b2e36c18c81e080eb6c28443455f4c5d01a30f3d987f8f09604dd60e4336d9ddae5af09dbeb0b2dd03ce16c7a3ac80c1f981eef00ac8ec19ff58510768e75cab5d0f0175ca54250472ae5cf01f45f4fbfee93a583e29d3a42675846b956b9c0b50e0bc520df298d82e5680c811b66801a13bf5e230c885325fead03feeca7bae9c053562a16781d17e657c7d32b417d63fd7741ace7dbb73cecd0ac84ec92e4f71406e3ed5f7c72fc20b3d8f3df5ec57e09773fefdbbcfef860beb5fbbe7ba09cfccba9cd975096e9477a504a78393173eaccf06105d43fbe7c3b5a18900ee2c5105d037bd7b0e00c78c0880d86696020cb4dddc0b70b5f1ad1900f2a46502187ae437104dbf9917e80273c9c0cde858f06c72d689a9109dadafb6c6c21b693d39035b41cf71cec854089e3293ec4cb05758db8de93030d94c734d036d9b6cb03b206f52da027513e4a8ef2fccee0308afb26b01d4f5430b6e82c1c03288aa51bf75048227fb76845a41ac135d5a2df84edc697ff02a58b3ac0a6b32382d769d7d1a6440b6ca8bffc1e9ec3f0b788ecc90291284dc2496895960755add563b70840d721e0855b4895a882ed1d7465741b423bc29d4018150dfbaee7170a338bc7bf030d8f3e4dc703e7852445ba41ee2bea316d833e17b5b7ef8c7c71e82c6fd4f7eec6c0dacbb7c66fcab87e1893fbcd2fad62cd8f3e4ab97dafaa0e9f65e7d701784a68516473743f7f96bbf0c8c07b831edfafb01d471e6648050d380092076475b00a22706d700b84f294100fbacb91dc0bd7c285be452eb124064756805c8c58327a253c1a81a9cad2f05eb6024626c80489eae9987e1b20c1e0eaf00b957b9a08c8544532b560310f21947ec1c08b6eab94e0f78caec8b914e78efd2c94f666d0610f9ee19f0f6cae75aafa402c42f76b74174f2cdca601d288bec16fb3c047242c7a2536058da1d1fbdb3169c9eb8aa916d606f722aede5e04a7335b90e80d3e324391388b97e903bfe59c0db64ae4c931e88886869b402d4c3ea2a65328804d127ce8368740e8b0da009d76e6d0ac80d4660703bdcf863efd16b13e0cd376f965def044efa765ad3c1bb226ea633151eda38ba2d793d887d4653781ad4efecf6f72e81b83cef16b5083212120fb82330edcaf065de0af8786f665772098ca873ad51b2c169efaf8f548251f476516735c0e0c5eefb00dcb9b609607785871c21448c214f1f2b8c5900962fd40da04db1f201ccd68127414e8a6eeb5d02e145377e1d6c84e8fe8119fa42d05b423e6331bc98dd7d38900b3d95d1596631e47e26a9d1bf197207e357797680bddc5e20fa20b1de755256831db28e530caedab86e4f0e0cf45ca6e712386b9c69ce4e0099e7d8f07afb854f755d807077745ab40f8c25768e9a04f1c7de5bf3f16ba06dd0ce68e960d5598dd605103be43ab918227ba2154631315f26e2c27fb50e8ec58b9de1ade1399139f2f28819c316254d5410a56296a807d9294fca5d20ab65bd9c0af2900cc966b00ee813a21bc0ffb06b8efb260cfb7c42833b006f9c7ff5be9e4b909a66153915f0fcacae533df9a07670ca190b759f19ac0aad85090f0daf712d879427e2e6fa53a13bdd44ac80965ff76c0da443c2575ca66b1e8c4b8bae883b08298bbb07dc63c1cb3d1bfba7007896c73900669e7be8f53deacd06308e5b02c07bce15041079fa44a0a03f782d19f4e2ce49bdf3a05bbced19d80d3d1b0657452a203ac54a7522f0d2433d6b07fc10dfe5d35c3b20f180a24a1bc46491602d03a544d6b0193c7e16730ccca0b141544373dde997bba643e4a0d8a52d80a2ea87e6e51f80d696234daf4c8467775e48793b02be1e77444b83f7f83ff5d68c0f0115f1cbd2e3c148356c2304de4d9e4c4f03c8163155140385b2487623864675c4a762dcfe1c53fb1f59706c4b8458294b65117908d73e6d8e2b174492e812e7c0ceb33d763b448ba3a5d1b1e05438694e3b886c658e4b0373936c55b640728ab2c8d90b3f78cf99fc360d965bcf2e6ccd82139fb8b96c3005defe9ddd6c1743facbbe59ec8451c7fdad9e20a4a4bba72afb605489ef946243ceebf17be34c88fc51ec742ae10f4f758deddd0ad5f3cf37b5d4c09b938e5d6b9c0a666dfd8e574e8173b2a3b3f97300dde5973f0e606ebff13300b5a27f10c008753d0c8ed67db26b3bdc08bcf5bebeb3d031bde764301bd4c9e659671bfcfecdce9c9e72b00a4492b314465df22dd23c703d3c9813ed848e1f0cae88a6837ac1f1d8b5a03558278c9da0ce5027685dd0beebea91de6e28aafec00bf119d055f0c2d62bebe0d0e6a35f6c390dd152ab4a4e8631a7ee4dc9cb00aa6f9bf7c02e908be558d907ea51758e9a0a224df4880b606846b631169c1c51eeaca133c6e9d2df33d87747f8629a13bb30574e96936429429f154dd17780daade4b01b6496e816b52091d3e43430671af38c8920977a36f853c17bd47d9b5f8513bfefdcd15e0aa143913a7d3628f56299c8819c6d8933dd3b61f430ef4e791c7c3b28713aa0e51b03c200f2d6265d48098079ca29175b20ba4de48b24286e1e9699a481f8b5dc63ad87ab2b229e480fecbff6d28e96295014bcd215dc02e5d99f706eab027748ad8c5f015a4246d1701bc0680d5600ad6d4d9d4be0eae4fafebe0ee83c727d66781344cbcd63f65aa8cb8fea7626bce90d5685c642feee94f3be54881bafec52baa16775b45b5f08c1837603f3e0811329db5d07213a4baf3157802ad42c03e83b1e0d6aebe19747b77ff752217475e8edf6147052b47b7ce340fff4503ff976efc7bef8c80d186cb7135c8d60f658b5560318878d4263122474c69f8daf02c71447e41c883646d7e8d3e466e0b3e07c38c62d25a63db72c59fd3b8027c68e1785f746e6442650e49ee90eb86b40d48bfd622d58a7ac1a6b2b2826352c01e39479cc3800d64e6b9a7d18eef9e6fb7ff3c02a88a6499f7a096e27718367326497f98f683a0c9fa68d533741fc1665a39a0dc3577996c475c3edde611732cfc2d59d7aba3a0794836cf13640a0cc28b20be1b58e7e11f480bb86566f1de4edf25f88ef84b1772575faf7c095ec8171fde3e0e7fe275ebd3c192ed4ffe9c7ed7ba17efb138fd62f83d7da0f3efafa69787a4acda88eb5f0d2fa967d7d63a1b6b55bed3f077fbad9db3c500d177f12e80ccc85fca4e43cff24c8287377ab2a44abac147b360855ee5636424f91b55c1c01b9cb59ad9c07f3a468d79a406eb76a8c5da0acd19747c642609c7ec8dc0f89ed9eed719ba0dd886c37d6c0079e2bfff3c4e310081867e47870d63a539d74d00a5c475c73c037cb7bc63b1b44b338243682b25799a714827ed8c8316bd816e3746bd96cd1bb0d578d6dfcbe15115b86c9f2d88565a1b27067e48034e55eb94e2c00a18a567112a861116341d488f5ce2c705d52d7bac681324bf1530f195befcbfee06b70ffd63b37dfb10a5a16874b9db930e1ab698bd33221f94bdec3898df0f6737a8e93002fff3c9c2da683679c735054c3c2f2f76e8d5f0d9392469b5a06145f8c2f8bef03bbd74a137be0d447ba8edcdc0f7db5ba4e230cab8aab4a58097147d5f3be56b8fef0e0f150087ef5cc2b333a9ba176c52b97fa6be046e06d2db408ae24f5fb07f6c31f2fdf9cd67718fe7c4f207f7026b4cfd7538d1a48deeabea89c077f2ac7c445d0bbadc99606f13bdd6bbd11f09ed24ae2a641c20ed739b5133a5e8a46ec9970f5be488fd504d63471d6550837274693ac7da01593ea2982d70607f6e8f550fcec9d655999103fffbeba4ffe10c259e1b99195602db1e69a65602e34e71bd320d2118d440310dda31fd58f809c4096b4219c1fbe143924636e95eca3316edb6fada5bb055a7d97e5c6de00e564cc635b532818da10ce1527c47eb155ae067bb5bdc49e01a2491c74d683b0c545b11f8c8011d2bb40ddac16a99de03ee6c6ed87498fcf7d66513264b424d6a71c84964f46373a07c05ae2a4dba970c5a78fb376c15b33fbf4fe7228694ecbd1cf41dbc9febd663a7cfd67f5953d0242ab9cdd4e0314fd3eaed13f15b434b9516b82f35feb3d154c8060cdc0f1e844c86d4b28f59a9017e71f171781db5e722d70d6c2f547426d8321f8756f5bcbcd42f8ed077a6607fbe0adf3912aab15125adccb3cc51027545da905354bacb1ba21f18c52e61440dc4cd7784f0d880a79583361f42bde56f72c1896aed57b32c05923f72a19d07bd4b09d4ab8f2f9c0f8d07ab839d25cae3642ef4fcd769109ea3eb1529c06d120aaed2c10d5ce4a6732a8fbd4c94a08e47a3951aaa09c54e62969e02ed79a5ceb80549a650da879f429e760e0d2e0b6c139b7ba475676cc5e2bdf6dc9da3b1b55c45c002831e056696820fcd5709f1c211be567c5516acd6d668fb91c5cf35c17551b64873822d6837b99bbcebd07c444a7cc9901768dbdc65e0ce64a8a5df3e0f33f5b9cfb6f12be7be847bffe45338cfbb4bf5dab806199da45771fe475b9f769c7a0f148fb8ef036e85915d72d0fc29ffa9ab7742f802b040be574d89138ce93d102d375571163e1c7dab5eedeb170ee9b4cb152e0de970c9fe2037149c9512320be230e8a0418d648a392004a964b5008e1f3eeddda49187ece3d856e483ca795abab21d462559ae590dee22d716ba07d4df1bb4ae146b93d5b99095dc7cdade61ac8784a2c51d742f23497ada5c0f067155d6c861bbbed320ec31b227cccec8282fac46ecf4918f3bda4b15a2b84c37d9da2116efce0f2f2eef1f0bed6fe3b9b4f82d998b9b0280542798333825d60efb71bec3688ab8b3b10b70eb489da36ed12b05299c504080d0fed09678975c007c0bc12031c739d286eb9403cabbdab729e15031c88f95a5c173836903af069e74f52ca09729c1b579e6b8b5a0d2220ce8b79a08fd3a7e9c7c0dde42e72770239e41304b55069530e82ba4cdda02c01bb28edc0dd7ea878b874da3d5f8213f79c9ff65a2b14d47873d50bc04e12a882d7c6859af53cf8f8ee74e15b065f0f951eca4f8599777eb0fdaead709f397620ce071d59cf0c3456c3c78e0433fd4d702431383f5206c14d763ee970e75bee19d641b89e6796da1d90bc475beb6a86c1326bb9d307fe13b2568e0777be7a5c6b84608f79d2f4c0a81edf02ef61c8fcacef745c27d4f50f6e8b98109de6bd98b4118a46e534249583bbbfd7ee2b8296623ddbca869ed79d26b112e472e6294b205424ba5d75e07b41e43809603786315680f94967869c0fb7bf901af02c84e64da726ff76138c39fb6f917b768219325619abc097e46bf3d581d8eef43917c1d2a9a301dce94e9da88681db065e1ff8b68839468b7e360638d69a5662635c32457d2760e59605c75a6181593766dc18df9d1f2eb79bec24a7049c42a7d49900e65eb3dadc0dce74a7c8490273beb1d4580cc67a73935909e65c73963905ac222bdf4e02c336379be9706fd2278c055f8071e9a3a765ac8273b3070eebe7a1a7ccdaebcc83e6ddd1c38e0d8fbdfde6fec005f8fae064d35f0cf7f515ddae6c076a3b539b2f81b32472d62c87223d4e75ed826c9fcff6fb616093b3515d0fd75e3667c9853070c82e56d32030cf9a25cf80bf4bdbe49d0dd17ab144dd055da566859d00693e3557c981f8a522cf3902a7bf112c31d78368195970db1a987bcfb712bff310942e5bf6b16f39f0fec8c3c9154bc0dda1ac56aba1757a74836805b3c6d9267a40df27fa580ccfdd1cacb1bba0e98e60bab501448fb3dc3904de71da34250dacaae1e70a3c30b836b47db00bdc59ee1af70cb067d813ed5c30a698f3cc0520329d3ca700944eb543e984cedceb495d9e70ccbbce405b8c9bfdce361469dabb5a5db72ae7dc21e95efdf2ae978fd72d6df9a247f17cfde182e1d8a9966df441383554169e0372a69c2e2e8248a3963de059e1c9723783dc243358014e92936407206ea62fe43b068aa92c504ec247ebbea47df5fdd0dfbef1879b7f0b172ff51ee85a03593bb425ca4e30679b3344057cba7edf852b39e0ff91eb42fb5c48d9eb6a55d261a0c52e91f970b9d1e8b13c903ddfe3d73c70cfaab80a3508d7b3cc1d722c8ce9f355fa4e83dde3d458ed10779e16fc90e2d3d2dc6590b04e1c94cbe1da3167b9b2153aaae2c68fa880990f2cf9e52209e932ebd7d9f38193c03e189c1bd6c2d3209493bcf07e17cc3ef7edabf73c038f8ed8b0eac72678775b7d83672129a89cb696c1b526a3c86a07b35ce4883a4898e7298f0f40f9173fe67de822984923eeca4f84e8725dd54df0a5fb82de7a903ed9c31e705f726f76cf00512c92e47a70fcce06673b5cfedde5cf5d7eaa23b601bcfbd606f05bbb0c6f3948f3b96eb9d389bd01b137417d32b6bbf0b1fe9dbddd3d81dbefbfe7897b6b8a02f71f1cfdc4a8be11cb9445ca28e587fc04cc0be607cc3180c28b5483f5b2d5662e00f9a85c2f3bc1d3e656dda720fa9caeeab920678933f228889f32a86e85f7443e90fcfe4ce83bffeac8577f090d4f0f78226740dfc5a07a0fe43de559e6ea009fa6ee524a40fb93d49c1f825f71f5f308a40e7397aaf1306687db54fde03395543e0a8197edb3ce12c8deefeed46e80285166bb33e0cdace88fccc7a13755a4ab4f0347133e989e0befbbfaa92b9f6a80a9a7e6fe626e21c49f4bbc9e2cc0b861ee35ee07354569568f81f31ea744fc1ebccf7ae67a8641b4588cd26ec0bd1f2a1e5d7c0a9a8fbc34fed54a505a458af82124cef43ce37b0eee34336f1bfe1bc8fc735e30bf12b2de571a999201da0f5cbaab0e5c4b5d25ea5630ea8ddbcc7270f7bacfb87f0b6683f925eb2ac47f36615cfc1678e98dfadb9a7e2c53aa77ffea3b7b7f74f803439c4e7d3556e236c5eae09fc4b8b668efec18cb43319d1033fdd943faf2d7f63df1b8f789bb3a5eb9db77e7c26feebc0db77f68d0db55a3ad734d07a7ce5eefec07f71c6dba3b1f74dd2c326681b79c2ee51c28ed342afb8112296402a879ea725709385d4ab7128119fe6fa4576642e9c9f60d571ac0d8633c657d15ce7fe077bb7eb30342e37aec9b7950b8c2b7416d82910fab67453df49876952886c80e318979a0bdc8116539249ea1589d0b2feed53dae20249ebefd70de0e288ecb6b1db30d467efbae97ef7a2f8c68ba6d4c6e014427ea63a2ad40b66c23170432240075ae9aa91681382d42a201c41c51280a41540dfd6f4fb20bed4250e7c757c79f85f2af7dadf3ab5f821b81cb896f8660d4837738796f802f31f991d44f40d4d197ea4f815c278eca2d20b3941c990b7a50cf338e80a7c953e95e072c6307a7415be9d1dc7e30261827ad26782cbcffe7076ebc3d7ba8cc7d3979884f7f618c5bacca955d31aea5cabb1a590b62963c275672af1ad2bb62cdf147eeff7ccac2be87d77d61c242e3332f7dea3eef99e0f4e09a817d60659babcc46b053ed8bd62e70529d0407f03679377aa600fbe5410e037395d9fc8dddac669239c35a0fca2eb62b5bc13dcf93a385fe72fcd28133df3df906bcf4e4c9536752202da04c94732178d1396d6f05b143d6b30c9c3acea97570f79a71937326c01daf4f7ef99323c0d79e9c97dc07be793ee1adfd5f7f5f5fa35f303d20a7c8796209684d5a95b616dccbdd13b58cff2bdec35554b0abad164705f75ecf3af76a70cd76edd3fac053e869f76c8184fcc484a41ed8f3ec63d1dffcd098571df855d6debd8f550ddde217f70de9ebb1d6b3191bba946b63bfb15779573f38e6b19c58eb8c63b1223d66e965e386f433633ed9fea9c0ec7dd38fcef9f2ccaf4fff8aff70caeca4aef8f124d95dd61ceb1238f39d5ca713e4457954ec02abc09a66cd07edbcb6555b08ec92dbe506b016d95bed43a0956a1ead0d100804986bcdb3a60e9e4d9e891edf5f654ba92c935381f3ca69e524c863f28cbc08ca746592520c7a9abec238046c60a3dc029e06f70ecf2250ce29b59c00a5413da5fe9587b94867644ef400f833fd07e3e6fe8d17afce4c3127833dd95ee96c01659652ce7488ab8a2b89eb02bae8a607c8209d34c08f9f04500a28641c848f444aa25b40b1155d01e297fa7d7167217ade2835b68056e82a714d04d94c89b20152d6a554a5b480ae999add87f8d5e3fbdffeedb7a2cb0f77fe4eabd978226670fb63556b6d2c258198077d629ee4a9be6517ef766598f6aef4c58a6e35362496191be9fa50acce7ef0b951f5a3c765b5bd6ff282f6f9f3e72fbe63cf9dee9c68e6a794ead17b33b78eda0466b139d64c00ad586b706d03b1d7d92db60307958d2c02bd3cba576f005fc8b7c33b1da2c7f4146326c495fb7abc3580898e0ed8d8d810b9181daf57827a493da71c07df1cafeaadfbcb0347cfe8b9c642889be46bf556fd25de1676a1331d34556b741d03abdcda6cd78093ea143a53c173d0b3c43d01545bed509bc01867549a4740d9a8ae529680a7c29de2ee86687174b7de0c718d71cb7d05808a8616b34715c4625129b7806aab3d6a3744d3f41d7a07781add35ee5de0aef014b97341cc70aa4413b04a39a9d8d031f9dac2ebcbe14679ef85a0471e79e2d99abb0e8dec6c7823f7f592868b6763209f8ad5adb5b14f035c8b3923156bdf359e71ab351d7837e0774f3ed8eff2ba13eb6765950c6971fe903ef0fb986fcbc963f6df3ee58eb2bb7c7757dfdd79f7bcf44599e7334e64ecf1edf4cdf6757a9729c5b25416c942c8f9dc98476e1ba3a22e55c62b1aa9720f3bd90e989898fc3f1b946cb2c906d6b251d90a91a6e8fee802b9a3eb13ddbfe97e58ce536a39a75c04fdb831d6d82f4fb74f7f7b51c7e668c1a5f997fa2e95dfd8d131aefd505bc3e55891fb466c9ef75c6c51ce4bb16f5b74c4c05a63ffc1e491fdf79c91fe03d05aec87879f1ad23b636f5061ecdb02b931e0e9f3631ef362ad734f73ecfa58bca734d65a8fa9328eff564166bd7352c78ce593132b528dd884fd602c3f6e4e1fd2ab8fc6ead6fa217d3336bb7733c6c14efa4760ff37bdcdf2ee7eb2feaef73566c9fed883a4c7dcf98c8aed5c4d13b13a3cf635114fac95ee8e59be2f56f46bb78a96d2ff66803b6296166b4598b19142eb7c0c70ac441c281ed2de58a57223d68bb9b97148c331bfdda2f3efccfed97fdb10fff1de24fb6f2f04b8756319abfdc2b1e8b69805de7a8eb8d8e7747c31705a0cb8169b05d1628d01d786d805b5ffcd00c72cd2890dfddab1afa938b72c3bd66fd563034b91d8248f55fd7716d3a5bdcbd0f4bf07f67fd782ffde0be17b97a6bcebf8ad7e5880ff09ff9590f22e90b7c085dea5f63f027b2bfc7f03007e8218b92b8846f60000000049454e44ae426082, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `laravel_logger_activity`
--

DROP TABLE IF EXISTS `laravel_logger_activity`;
CREATE TABLE IF NOT EXISTS `laravel_logger_activity` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `userType` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `route` longtext COLLATE utf8mb4_unicode_ci,
  `ipAddress` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userAgent` text COLLATE utf8mb4_unicode_ci,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referer` longtext COLLATE utf8mb4_unicode_ci,
  `methodType` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=145 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `laravel_logger_activity`
--

INSERT INTO `laravel_logger_activity` (`id`, `description`, `userType`, `userId`, `route`, `ipAddress`, `userAgent`, `locale`, `referer`, `methodType`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 1, 'http://www.inspektoratv2.go.id/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektoratv2.go.id/login', 'POST', '2019-06-11 13:45:12', '2019-06-11 13:45:12', NULL),
(2, 'coba2', 'LaravelLogger::laravel-logger.userTypes.registered', 1, 'http://www.inspektoratv2.go.id/admin/user/LogUsers', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektoratv2.go.id/', 'GET', '2019-06-11 13:45:23', '2019-06-11 13:45:23', NULL),
(3, 'coba 3', 'LaravelLogger::laravel-logger.userTypes.registered', 1, 'http://www.inspektoratv2.go.id/admin/user/LogUsers', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektoratv2.go.id/', 'GET', '2019-06-11 14:18:50', '2019-06-11 14:18:50', NULL),
(4, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 1, 'http://www.inspektoratv2.go.id/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektoratv2.go.id/login', 'POST', '2019-06-12 10:59:49', '2019-06-12 10:59:49', NULL),
(5, 'Logged Out', 'LaravelLogger::laravel-logger.userTypes.registered', 1, 'http://www.inspektoratv2.go.id/logout', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektoratv2.go.id/admin/user/view-activity', 'POST', '2019-06-12 11:29:43', '2019-06-12 11:29:43', NULL),
(6, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 1, 'http://www.inspektoratv2.go.id/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektoratv2.go.id/login', 'POST', '2019-06-12 11:29:50', '2019-06-12 11:29:50', NULL),
(7, 'Logged Out', 'LaravelLogger::laravel-logger.userTypes.guest', NULL, 'http://www.inspektorat.git/logout', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/', 'POST', '2019-07-05 00:51:25', '2019-07-05 00:51:25', NULL),
(8, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 6, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-07-05 00:51:37', '2019-07-05 00:51:37', NULL),
(9, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 6, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-07-07 18:41:34', '2019-07-07 18:41:34', NULL),
(10, 'Logged Out', 'LaravelLogger::laravel-logger.userTypes.registered', 6, 'http://www.inspektorat.git/logout', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/admin/activity/bindex', 'POST', '2019-07-07 19:22:31', '2019-07-07 19:22:31', NULL),
(11, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 3, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-07-08 18:30:36', '2019-07-08 18:30:36', NULL),
(12, 'Logged Out', 'LaravelLogger::laravel-logger.userTypes.registered', 3, 'http://www.inspektorat.git/logout', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/admin/users', 'POST', '2019-07-08 20:09:48', '2019-07-08 20:09:48', NULL),
(13, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 6, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-07-08 20:30:02', '2019-07-08 20:30:02', NULL),
(14, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 6, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-07-08 23:31:59', '2019-07-08 23:31:59', NULL),
(15, 'Logged Out', 'LaravelLogger::laravel-logger.userTypes.registered', 6, 'http://www.inspektorat.git/logout', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/', 'POST', '2019-07-09 00:37:54', '2019-07-09 00:37:54', NULL),
(16, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 6, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-07-09 19:14:29', '2019-07-09 19:14:29', NULL),
(17, 'Logged Out', 'LaravelLogger::laravel-logger.userTypes.registered', 6, 'http://www.inspektorat.git/logout', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/admin/spt', 'POST', '2019-07-09 20:21:45', '2019-07-09 20:21:45', NULL),
(18, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 6, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-07-09 20:23:11', '2019-07-09 20:23:11', NULL),
(19, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 5, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-07-09 23:44:06', '2019-07-09 23:44:06', NULL),
(20, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 6, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-07-10 18:27:58', '2019-07-10 18:27:58', NULL),
(21, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 6, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-07-10 23:37:18', '2019-07-10 23:37:18', NULL),
(22, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 6, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-07-11 18:47:23', '2019-07-11 18:47:23', NULL),
(23, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 6, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-07-11 23:27:34', '2019-07-11 23:27:34', NULL),
(24, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 6, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-07-14 18:20:23', '2019-07-14 18:20:23', NULL),
(25, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 6, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-07-15 00:08:24', '2019-07-15 00:08:24', NULL),
(26, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 6, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-07-15 18:39:39', '2019-07-15 18:39:39', NULL),
(27, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 6, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-07-16 17:56:30', '2019-07-16 17:56:30', NULL),
(28, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 6, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-07-17 18:17:28', '2019-07-17 18:17:28', NULL),
(29, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 6, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-07-17 23:53:20', '2019-07-17 23:53:20', NULL),
(30, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 6, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-07-18 18:16:50', '2019-07-18 18:16:50', NULL),
(31, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 6, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-07-18 23:59:47', '2019-07-18 23:59:47', NULL),
(32, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 6, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-07-21 18:07:42', '2019-07-21 18:07:42', NULL),
(33, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 6, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-07-21 20:25:24', '2019-07-21 20:25:24', NULL),
(34, 'Logged Out', 'LaravelLogger::laravel-logger.userTypes.registered', 6, 'http://www.inspektorat.git/logout', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/admin/resiko/vindex', 'POST', '2019-07-22 00:18:36', '2019-07-22 00:18:36', NULL),
(35, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 6, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-07-22 00:20:39', '2019-07-22 00:20:39', NULL),
(36, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 6, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-07-22 18:10:56', '2019-07-22 18:10:56', NULL),
(37, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 6, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-07-23 20:05:44', '2019-07-23 20:05:44', NULL),
(38, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 6, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-07-24 19:04:21', '2019-07-24 19:04:21', NULL),
(39, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 6, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-07-24 19:04:21', '2019-07-24 19:04:21', NULL),
(40, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 6, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-07-25 06:30:00', '2019-07-25 06:30:00', NULL),
(41, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 6, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-07-25 18:00:44', '2019-07-25 18:00:44', NULL),
(42, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 6, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-07-26 00:32:16', '2019-07-26 00:32:16', NULL),
(43, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 6, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-07-26 00:32:16', '2019-07-26 00:32:16', NULL),
(44, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 6, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-07-28 18:00:50', '2019-07-28 18:00:50', NULL),
(45, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 6, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-07-28 23:31:31', '2019-07-28 23:31:31', NULL),
(46, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 6, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-07-29 19:10:58', '2019-07-29 19:10:58', NULL),
(47, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 6, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-07-29 23:27:22', '2019-07-29 23:27:22', NULL),
(48, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 6, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-07-30 18:24:28', '2019-07-30 18:24:28', NULL),
(49, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 6, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-07-31 18:05:07', '2019-07-31 18:05:07', NULL),
(50, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 1, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-07-31 20:41:22', '2019-07-31 20:41:22', NULL),
(51, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 6, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-07-31 20:41:44', '2019-07-31 20:41:44', NULL),
(52, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 6, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-07-31 23:22:53', '2019-07-31 23:22:53', NULL),
(53, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 6, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-08-03 02:41:18', '2019-08-03 02:41:18', NULL),
(54, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 6, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-08-04 18:26:08', '2019-08-04 18:26:08', NULL),
(55, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 6, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-08-04 18:26:08', '2019-08-04 18:26:08', NULL),
(56, 'Logged Out', 'LaravelLogger::laravel-logger.userTypes.registered', 6, 'http://www.inspektorat.git/logout', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/admin/resiko/vindex', 'POST', '2019-08-04 19:08:40', '2019-08-04 19:08:40', NULL),
(57, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 6, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-08-04 19:10:15', '2019-08-04 19:10:15', NULL),
(58, 'Logged Out', 'LaravelLogger::laravel-logger.userTypes.registered', 6, 'http://www.inspektorat.git/logout', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/admin/resiko/vindex', 'POST', '2019-08-04 23:59:14', '2019-08-04 23:59:14', NULL),
(59, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 3, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-08-04 23:59:32', '2019-08-04 23:59:32', NULL),
(60, 'Logged Out', 'LaravelLogger::laravel-logger.userTypes.registered', 3, 'http://www.inspektorat.git/logout', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/admin', 'POST', '2019-08-04 23:59:54', '2019-08-04 23:59:54', NULL),
(61, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 2, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-08-04 23:59:59', '2019-08-04 23:59:59', NULL),
(62, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 6, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-08-05 19:13:27', '2019-08-05 19:13:27', NULL),
(63, 'Logged Out', 'LaravelLogger::laravel-logger.userTypes.registered', 6, 'http://www.inspektorat.git/logout', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/kkp', 'POST', '2019-08-05 21:42:15', '2019-08-05 21:42:15', NULL),
(64, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 4, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-08-05 21:42:20', '2019-08-05 21:42:20', NULL),
(65, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 6, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-08-05 23:46:43', '2019-08-05 23:46:43', NULL),
(66, 'Logged Out', 'LaravelLogger::laravel-logger.userTypes.registered', 6, 'http://www.inspektorat.git/logout', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/kkp', 'POST', '2019-08-05 23:48:16', '2019-08-05 23:48:16', NULL),
(67, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 6, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-08-06 18:15:31', '2019-08-06 18:15:31', NULL),
(68, 'Logged Out', 'LaravelLogger::laravel-logger.userTypes.registered', 6, 'http://www.inspektorat.git/logout', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/admin/audit/indexf', 'POST', '2019-08-06 20:56:05', '2019-08-06 20:56:05', NULL),
(69, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 4, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-08-06 20:57:36', '2019-08-06 20:57:36', NULL),
(70, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 4, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-08-06 21:20:04', '2019-08-06 21:20:04', NULL),
(71, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 4, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-08-07 18:34:25', '2019-08-07 18:34:25', NULL),
(72, 'Failed Login Attempt', 'LaravelLogger::laravel-logger.userTypes.guest', NULL, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9', 'http://www.inspektorat.git/login', 'POST', '2019-08-07 19:23:14', '2019-08-07 19:23:14', NULL),
(73, 'Failed Login Attempt', 'LaravelLogger::laravel-logger.userTypes.guest', NULL, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9', 'http://www.inspektorat.git/login', 'POST', '2019-08-07 19:23:21', '2019-08-07 19:23:21', NULL),
(74, 'Failed Login Attempt', 'LaravelLogger::laravel-logger.userTypes.guest', NULL, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9', 'http://www.inspektorat.git/login', 'POST', '2019-08-07 19:23:26', '2019-08-07 19:23:26', NULL),
(75, 'Failed Login Attempt', 'LaravelLogger::laravel-logger.userTypes.guest', NULL, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9', 'http://www.inspektorat.git/login', 'POST', '2019-08-07 19:23:37', '2019-08-07 19:23:37', NULL),
(76, 'Failed Login Attempt', 'LaravelLogger::laravel-logger.userTypes.guest', NULL, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9', 'http://www.inspektorat.git/login', 'POST', '2019-08-07 19:24:06', '2019-08-07 19:24:06', NULL),
(77, 'Failed Login Attempt', 'LaravelLogger::laravel-logger.userTypes.guest', NULL, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9', 'http://www.inspektorat.git/login', 'POST', '2019-08-07 19:24:11', '2019-08-07 19:24:11', NULL),
(78, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 6, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-08-07 19:24:33', '2019-08-07 19:24:33', NULL),
(79, 'Logged Out', 'LaravelLogger::laravel-logger.userTypes.registered', 6, 'http://www.inspektorat.git/logout', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/admin/spt', 'POST', '2019-08-07 19:48:33', '2019-08-07 19:48:33', NULL),
(80, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 7, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-08-07 19:48:38', '2019-08-07 19:48:38', NULL),
(81, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 4, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-08-07 19:52:30', '2019-08-07 19:52:30', NULL),
(82, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 4, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-08-07 23:16:50', '2019-08-07 23:16:50', NULL),
(83, 'Logged Out', 'LaravelLogger::laravel-logger.userTypes.registered', 4, 'http://www.inspektorat.git/logout', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/admin', 'POST', '2019-08-07 23:34:33', '2019-08-07 23:34:33', NULL),
(84, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 3, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-08-07 23:34:42', '2019-08-07 23:34:42', NULL),
(85, 'Logged Out', 'LaravelLogger::laravel-logger.userTypes.registered', 3, 'http://www.inspektorat.git/logout', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/admin', 'POST', '2019-08-07 23:37:26', '2019-08-07 23:37:26', NULL),
(86, 'Failed Login Attempt', 'LaravelLogger::laravel-logger.userTypes.guest', NULL, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-08-07 23:37:44', '2019-08-07 23:37:44', NULL),
(87, 'Failed Login Attempt', 'LaravelLogger::laravel-logger.userTypes.guest', NULL, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-08-07 23:38:29', '2019-08-07 23:38:29', NULL),
(88, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 2, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-08-07 23:38:34', '2019-08-07 23:38:34', NULL),
(89, 'Logged Out', 'LaravelLogger::laravel-logger.userTypes.registered', 2, 'http://www.inspektorat.git/logout', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/admin', 'POST', '2019-08-07 23:48:34', '2019-08-07 23:48:34', NULL),
(90, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 3, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-08-07 23:48:40', '2019-08-07 23:48:40', NULL),
(91, 'Logged Out', 'LaravelLogger::laravel-logger.userTypes.registered', 3, 'http://www.inspektorat.git/logout', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/admin', 'POST', '2019-08-07 23:52:39', '2019-08-07 23:52:39', NULL),
(92, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 2, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-08-07 23:52:45', '2019-08-07 23:52:45', NULL),
(93, 'Logged Out', 'LaravelLogger::laravel-logger.userTypes.registered', 2, 'http://www.inspektorat.git/logout', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/admin', 'POST', '2019-08-07 23:57:09', '2019-08-07 23:57:09', NULL),
(94, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 6, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-08-07 23:57:14', '2019-08-07 23:57:14', NULL),
(95, 'Logged Out', 'LaravelLogger::laravel-logger.userTypes.registered', 6, 'http://www.inspektorat.git/logout', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/admin/resiko/vindex', 'POST', '2019-08-08 00:06:18', '2019-08-08 00:06:18', NULL),
(96, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 2, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-08-08 00:06:25', '2019-08-08 00:06:25', NULL),
(97, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 4, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-08-08 20:27:30', '2019-08-08 20:27:30', NULL),
(98, 'Logged Out', 'LaravelLogger::laravel-logger.userTypes.registered', 4, 'http://www.inspektorat.git/logout', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/admin', 'POST', '2019-08-08 20:27:51', '2019-08-08 20:27:51', NULL),
(99, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 2, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-08-08 20:28:04', '2019-08-08 20:28:04', NULL),
(100, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 7, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-08-08 21:12:57', '2019-08-08 21:12:57', NULL),
(101, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 7, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-08-08 23:24:07', '2019-08-08 23:24:07', NULL),
(102, 'Logged Out', 'LaravelLogger::laravel-logger.userTypes.registered', 7, 'http://www.inspektorat.git/logout', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/admin', 'POST', '2019-08-08 23:24:43', '2019-08-08 23:24:43', NULL),
(103, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 7, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-08-09 00:25:44', '2019-08-09 00:25:44', NULL),
(104, 'Logged Out', 'LaravelLogger::laravel-logger.userTypes.registered', 7, 'http://www.inspektorat.git/logout', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/admin/spt', 'POST', '2019-08-09 00:26:01', '2019-08-09 00:26:01', NULL),
(105, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 2, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-08-09 00:26:14', '2019-08-09 00:26:14', NULL),
(106, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 6, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-08-11 18:33:32', '2019-08-11 18:33:32', NULL),
(107, 'Logged Out', 'LaravelLogger::laravel-logger.userTypes.registered', 6, 'http://www.inspektorat.git/logout', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/admin/spt', 'POST', '2019-08-11 18:43:44', '2019-08-11 18:43:44', NULL),
(108, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 3, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-08-11 18:43:50', '2019-08-11 18:43:50', NULL),
(109, 'Logged Out', 'LaravelLogger::laravel-logger.userTypes.registered', 3, 'http://www.inspektorat.git/logout', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/admin', 'POST', '2019-08-11 18:50:58', '2019-08-11 18:50:58', NULL),
(110, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 4, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-08-11 18:51:05', '2019-08-11 18:51:05', NULL),
(111, 'Logged Out', 'LaravelLogger::laravel-logger.userTypes.registered', 4, 'http://www.inspektorat.git/logout', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/admin', 'POST', '2019-08-11 18:52:18', '2019-08-11 18:52:18', NULL),
(112, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 2, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-08-11 18:52:26', '2019-08-11 18:52:26', NULL),
(113, 'Logged Out', 'LaravelLogger::laravel-logger.userTypes.registered', 2, 'http://www.inspektorat.git/logout', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/', 'POST', '2019-08-11 18:58:25', '2019-08-11 18:58:25', NULL),
(114, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 7, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-08-11 18:58:35', '2019-08-11 18:58:35', NULL),
(115, 'Logged Out', 'LaravelLogger::laravel-logger.userTypes.registered', 7, 'http://www.inspektorat.git/logout', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/admin', 'POST', '2019-08-11 18:58:59', '2019-08-11 18:58:59', NULL),
(116, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 3, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-08-11 18:59:06', '2019-08-11 18:59:06', NULL),
(117, 'Logged Out', 'LaravelLogger::laravel-logger.userTypes.registered', 3, 'http://www.inspektorat.git/logout', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/admin', 'POST', '2019-08-11 19:00:32', '2019-08-11 19:00:32', NULL),
(118, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 6, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-08-11 19:01:31', '2019-08-11 19:01:31', NULL),
(119, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 6, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-08-11 23:23:16', '2019-08-11 23:23:16', NULL),
(120, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 2, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-08-12 17:46:05', '2019-08-12 17:46:05', NULL),
(121, 'Logged Out', 'LaravelLogger::laravel-logger.userTypes.registered', 2, 'http://www.inspektorat.git/logout', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/admin', 'POST', '2019-08-12 17:46:41', '2019-08-12 17:46:41', NULL),
(122, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 4, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-08-12 17:46:49', '2019-08-12 17:46:49', NULL),
(123, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 6, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-08-12 17:51:58', '2019-08-12 17:51:58', NULL),
(124, 'Logged Out', 'LaravelLogger::laravel-logger.userTypes.registered', 6, 'http://www.inspektorat.git/logout', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/admin/spt', 'POST', '2019-08-12 19:15:06', '2019-08-12 19:15:06', NULL),
(125, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 4, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-08-12 23:27:30', '2019-08-12 23:27:30', NULL),
(126, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 4, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-08-13 00:03:23', '2019-08-13 00:03:23', NULL),
(127, 'Logged Out', 'LaravelLogger::laravel-logger.userTypes.registered', 4, 'http://www.inspektorat.git/logout', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/', 'POST', '2019-08-13 00:31:20', '2019-08-13 00:31:20', NULL),
(128, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 2, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-08-13 00:31:32', '2019-08-13 00:31:32', NULL),
(129, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 2, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-08-13 19:10:17', '2019-08-13 19:10:17', NULL),
(130, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 6, 'http://www.inspektorat.git/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/login', 'POST', '2019-08-13 19:33:00', '2019-08-13 19:33:00', NULL),
(131, 'Logged Out', 'LaravelLogger::laravel-logger.userTypes.registered', 6, 'http://www.inspektorat.git/logout', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/admin', 'POST', '2019-08-13 19:36:52', '2019-08-13 19:36:52', NULL),
(132, 'Logged Out', 'LaravelLogger::laravel-logger.userTypes.registered', 2, 'http://www.inspektorat.git/logout', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.git/admin/resiko/skpd/vindex', 'POST', '2019-08-13 19:51:57', '2019-08-13 19:51:57', NULL),
(133, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 7, 'http://www.inspektorat.com/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.com/login', 'POST', '2019-08-13 21:01:30', '2019-08-13 21:01:30', NULL),
(134, 'Logged Out', 'LaravelLogger::laravel-logger.userTypes.registered', 7, 'http://www.inspektorat.com/logout', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.com/admin', 'POST', '2019-08-13 21:01:44', '2019-08-13 21:01:44', NULL),
(135, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 6, 'http://www.inspektorat.com/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.com/login', 'POST', '2019-08-13 21:01:52', '2019-08-13 21:01:52', NULL),
(136, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 6, 'http://www.inspektorat.com/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.com/login', 'POST', '2019-08-13 23:25:03', '2019-08-13 23:25:03', NULL),
(137, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 2, 'http://www.inspektorat.com/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.com/login', 'POST', '2019-08-14 19:14:11', '2019-08-14 19:14:11', NULL),
(138, 'Logged Out', 'LaravelLogger::laravel-logger.userTypes.registered', 2, 'http://www.inspektorat.com/logout', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.com/admin', 'POST', '2019-08-14 19:25:55', '2019-08-14 19:25:55', NULL);
INSERT INTO `laravel_logger_activity` (`id`, `description`, `userType`, `userId`, `route`, `ipAddress`, `userAgent`, `locale`, `referer`, `methodType`, `created_at`, `updated_at`, `deleted_at`) VALUES
(139, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 2, 'http://www.inspektorat.com/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.com/login', 'POST', '2019-08-14 19:26:06', '2019-08-14 19:26:06', NULL),
(140, 'Logged Out', 'LaravelLogger::laravel-logger.userTypes.registered', 2, 'http://www.inspektorat.com/logout', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.com/', 'POST', '2019-08-14 19:28:53', '2019-08-14 19:28:53', NULL),
(141, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 2, 'http://www.inspektorat.com/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.com/login', 'POST', '2019-08-14 19:29:04', '2019-08-14 19:29:04', NULL),
(142, 'Logged Out', 'LaravelLogger::laravel-logger.userTypes.registered', 2, 'http://www.inspektorat.com/logout', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.com/', 'POST', '2019-08-14 19:29:09', '2019-08-14 19:29:09', NULL),
(143, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 2, 'http://www.inspektorat.com/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.com/login', 'POST', '2019-08-14 19:31:32', '2019-08-14 19:31:32', NULL),
(144, 'Logged In', 'LaravelLogger::laravel-logger.userTypes.registered', 2, 'http://www.inspektorat.com/login', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'en-US,en;q=0.9,id;q=0.8', 'http://www.inspektorat.com/login', 'POST', '2019-08-14 23:09:10', '2019-08-14 23:09:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
CREATE TABLE IF NOT EXISTS `media` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `collection_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(10) UNSIGNED NOT NULL,
  `manipulations` json NOT NULL,
  `custom_properties` json NOT NULL,
  `responsive_images` json NOT NULL,
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_model_type_model_id_index` (`model_type`,`model_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `model_type`, `model_id`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `size`, `manipulations`, `custom_properties`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(6, 'App\\models\\Profile', 1, 'pic', 'rock-n-roll', 'rock-n-roll.jpg', 'image/jpeg', 'public', 87645, '[]', '{\"generated_conversions\": {\"thumb\": true}}', '[]', 1, '2019-05-21 10:07:30', '2019-05-21 10:07:31');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_04_28_081130_create_permission_tables', 1),
(4, '2019_05_07_135656_create_profiles_table', 1),
(5, '2019_05_10_080615_create_media_table', 1),
(8, '2019_05_16_151751_create_jenis_spts_table', 2),
(14, '2019_05_16_152107_create_spts_table', 3),
(15, '2019_05_28_061257_detail_spt', 3),
(16, '2017_11_04_103444_create_laravel_logger_activity_table', 4),
(17, '2019_07_05_034614_create_activity_log_table', 5),
(18, '2019_07_05_073248_create_activity_log_table', 6),
(19, '2019_07_10_061616_tr_tkegiatan', 7),
(20, '2019_07_10_062632_tr_resiko', 8),
(21, '2019_07_10_063557_tr_tkegiatan', 9),
(22, '2019_07_11_064138_tr_tkegiatan', 10),
(23, '2019_07_15_013018_skpd', 11),
(24, '2019_07_15_013101_kegiatan', 11),
(25, '2019_07_15_013110_resiko', 11),
(26, '2019_07_15_015103_detail_kegiatan', 12),
(27, '2019_07_15_024320_kegiatan', 13),
(28, '2019_07_15_025158_resiko', 14),
(29, '2019_07_15_025855_detail_kegiatan', 14),
(30, '2019_07_16_065959_skpd', 15),
(31, '2019_07_25_140742_kegiatan', 16),
(32, '2019_07_25_140820_detail_kegiatan', 16),
(33, '2019_08_06_013728_create_kkp_tabel', 17),
(34, '2019_08_06_070554_create_laporan-spt_tabel', 18);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\User', 5),
(1, 'App\\User', 6),
(3, 'App\\User', 3),
(4, 'App\\User', 2),
(5, 'App\\User', 4),
(5, 'App\\User', 8),
(5, 'App\\User', 9),
(5, 'App\\User', 10),
(6, 'App\\User', 7);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Administer roles & permissions', 'web', '2019-05-16 01:51:30', '2019-05-16 01:51:30'),
(2, 'Access admin page', 'web', '2019-05-16 01:51:30', '2019-05-16 01:51:30'),
(3, 'Create SPT', 'web', '2019-05-19 12:55:33', '2019-05-19 12:55:33'),
(4, 'Edit SPT', 'web', '2019-05-19 12:55:43', '2019-05-19 12:55:43'),
(5, 'Delete SPT', 'web', '2019-05-19 12:55:50', '2019-05-19 12:55:50'),
(6, 'View SPT', 'web', '2019-05-19 12:55:59', '2019-05-19 12:55:59'),
(7, 'Edit Signed SPT', 'web', '2019-05-19 12:58:47', '2019-05-19 12:58:47'),
(8, 'Sign SPT', 'web', '2019-06-26 06:23:50', '2019-06-26 06:23:50');

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
CREATE TABLE IF NOT EXISTS `profiles` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zipcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover` blob,
  `pic` blob,
  `about` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `profiles_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`id`, `user_id`, `address`, `city`, `country`, `zipcode`, `cover`, `pic`, `about`, `created_at`, `updated_at`) VALUES
(1, 1, 'Jalan jalan saja yuk', NULL, NULL, NULL, NULL, NULL, NULL, '2019-05-20 21:28:14', '2019-05-20 21:28:14');

-- --------------------------------------------------------

--
-- Table structure for table `resiko`
--

DROP TABLE IF EXISTS `resiko`;
CREATE TABLE IF NOT EXISTS `resiko` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama_resiko` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kemungkinan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dampak` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `kegiatan_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kegiatan_kegiatan_id_foreign` (`kegiatan_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'web', '2019-05-16 01:51:30', '2019-05-19 13:01:02'),
(2, 'guest', 'web', '2019-05-16 01:51:31', '2019-05-16 01:51:31'),
(3, 'TU Umum', 'web', '2019-05-19 12:57:43', '2019-05-19 12:57:43'),
(4, 'TU Perencanaan', 'web', '2019-05-19 12:58:21', '2019-05-19 12:58:21'),
(5, 'Auditor', 'web', '2019-05-30 17:08:50', '2019-05-30 17:08:50'),
(6, 'Inspektur', 'web', '2019-06-26 06:24:15', '2019-06-26 06:24:15');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(3, 1),
(3, 4),
(4, 1),
(4, 4),
(5, 1),
(6, 1),
(6, 3),
(6, 4),
(6, 5),
(6, 6),
(7, 1),
(7, 3),
(8, 1),
(8, 6);

-- --------------------------------------------------------

--
-- Table structure for table `skpd`
--

DROP TABLE IF EXISTS `skpd`;
CREATE TABLE IF NOT EXISTS `skpd` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama_skpd` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tujuan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sasaran` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `skpd`
--

INSERT INTO `skpd` (`id`, `nama_skpd`, `tujuan`, `sasaran`, `created_at`, `updated_at`) VALUES
(1, 'Dinas Pendidikan', 'jalan jalan', 'jalan kaki agar kaki sehat dan panjang umur', '2019-07-16 00:04:55', '2019-07-16 00:04:55'),
(10, 'Dinas Kebersihan', 'menerapkan lingkungan bersih kepada masyarakat', 'kebersihan lingkungan', '2019-07-16 18:42:00', '2019-07-16 18:42:00'),
(34, 'Dinas Pariwisata', 'gak tahu', 'apalagi', '2019-08-14 23:56:54', '2019-08-14 23:56:54'),
(30, 'Dinas Pariwisata', 'Dinas Pariwisata', 'Dinas Pariwisata', '2019-07-18 19:16:23', '2019-07-18 19:16:23'),
(42, 'Dinas Pariwisata', 'asdasdas', 'dsaadsasddsa', '2019-08-15 01:13:20', '2019-08-15 01:13:20');

-- --------------------------------------------------------

--
-- Table structure for table `spt`
--

DROP TABLE IF EXISTS `spt`;
CREATE TABLE IF NOT EXISTS `spt` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `jenis_spt_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nomor` int(11) DEFAULT NULL,
  `tgl_mulai` timestamp NOT NULL,
  `tgl_akhir` timestamp NOT NULL,
  `lokasi` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `approval_status` enum('approved','rejected','processing') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'processing',
  `approval_by` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Approval User ID',
  `notes` text COLLATE utf8mb4_unicode_ci COMMENT 'give note if approval status rejected',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `spt_jenis_spt_id_foreign` (`jenis_spt_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `spt`
--

INSERT INTO `spt` (`id`, `jenis_spt_id`, `name`, `nomor`, `tgl_mulai`, `tgl_akhir`, `lokasi`, `approval_status`, `approval_by`, `notes`, `created_at`, `updated_at`) VALUES
(5, 5, 'Penjemuran Ikan Asin di Sepanjang', 303, '2019-06-03 10:00:00', '2019-06-25 10:00:00', 'Sepanjang Taman Sidoarjo', 'approved', 7, NULL, '2019-06-23 18:26:49', '2019-07-04 00:59:20'),
(11, 8, 'tambak candi', NULL, '2019-08-15 17:00:00', '2019-08-19 17:00:00', 'candi', 'approved', 6, NULL, '2019-08-13 19:33:34', '2019-08-13 19:34:35'),
(6, 6, 'Reviu Renstra Tahun 2016-2021', NULL, '2019-07-01 00:00:00', '2019-07-05 00:00:00', 'Kecamatan Sidoarjo Kabupaten Sidoarjo', 'approved', 7, NULL, '2019-06-28 07:11:20', '2019-07-01 08:30:34'),
(7, 5, 'Perencanaan Angaran APBD', NULL, '2019-07-03 00:00:00', '2019-07-05 00:00:00', 'Desa Balongbendo Kecamatan Krian', 'rejected', 7, 'tolak aja', '2019-07-02 01:53:39', '2019-07-02 02:16:44'),
(8, 10, 'test', NULL, '2019-07-05 00:00:00', '2019-07-19 00:00:00', 'Pagerwojo', 'processing', NULL, NULL, '2019-07-02 02:56:25', '2019-07-02 02:56:25'),
(9, 6, '03/07/2019', 201, '2019-07-03 00:00:00', '2019-07-05 00:00:00', 'Dimanapun kau berada', 'approved', 6, NULL, '2019-07-03 02:47:08', '2019-07-04 01:05:27'),
(10, 7, 'perancangan', 531, '2019-07-09 10:00:00', '2019-07-10 10:00:00', 'SDN wonoayu', 'approved', 6, NULL, '2019-07-08 13:31:50', '2019-07-10 11:36:33');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jabatan` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pangkat` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `nip`, `jabatan`, `pangkat`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(6, 'Super', 'Admin', 'admin@local.host', 'admin@local.host', '90909090', 'Inspektur Kabupaten', 'I/A', NULL, '$2y$10$5.6Cs4VHw0doRvG6pIPYT.Ygrx2VV7J4nFdHD1U66McsvwL2DTpdO', 'iut3eg9P1zYQqqJG8K5oKiFRHdjzlFyfBd0YSTVJ09sDwKucV3nlI0xIezBN', '2019-06-18 12:32:57', '2019-06-18 12:32:57'),
(2, 'Bag', 'Perencanaan', 'rencana@local.host', '08885656', '', NULL, NULL, NULL, '$2y$10$ie3FCXY1.lE4IcRFFR9pc.JjqyW.JbW5pg9furifvhyKXIdZvpn16', 'Wm7etFXxKtHeU9cGPCR8UnI3yliFbh434iCDbWJLiCLrHKzjXvnqwLvnlhBx', '2019-06-03 03:11:39', '2019-06-03 03:11:39'),
(3, 'Bag', 'Umum', 'umum@local.host', '856789', '', NULL, NULL, NULL, '$2y$10$RmvHlAsX5zsWQzc/2T80S.f4N.gkrjf58v/xuzoY5ZGJ3Lp9TPi2i', 'kAexF5pvqytiptWHC0hV0OowE49cZmFe6HFb7fxXLI2ubYRFejAtIXAcB8Li', '2019-06-03 03:12:15', '2019-06-03 03:12:15'),
(4, 'Auditor', 'Auditor', 'audit@local.host', '88877888', '', NULL, NULL, NULL, '$2y$10$TgpT8ooFc8SkZ/TMnMinru2mXP1aSzvXs6v4RsYTbywxxDIomaQGO', NULL, '2019-06-03 03:13:02', '2019-06-03 03:13:02'),
(5, 'Tegar', 'WPIP', 'tegar@local.host', '+628567892', NULL, NULL, NULL, NULL, '$2y$10$GI0kjoxWCtpDOGFFX5oy3uVlB.itkdo8tCUP3ordw6D/6uT7mgDnS', NULL, '2019-06-17 18:09:02', '2019-06-17 18:09:02'),
(7, 'User', 'Inspektur', 'inspektur@local.host', '08226767890', '4567890', 'Inspektur Kabupaten', 'I/A', NULL, '$2y$10$6fQsHp1kb7AvrYX7P2HtVe4oe8/L9fBvLH2ghxJBXI0o6ryEUHrA2', 'rRV5KLp6l8ixedFdZUFtt2NRr518QWESDPXp9DlcBpeb7F47zicWLb00PSgY', '2019-07-01 06:48:31', '2019-07-01 06:48:31'),
(8, 'Auditor', 'Utama', 'utama@local.host', '123123123', '351351', 'Auditor Utama', 'IV/A', NULL, '$2y$10$QwVPABChpEeqLVEhqUu3Du1W7ITkJrx8gTA28XYJoyownUsIpVnD.', 'hx05JRh5O4Bp1GioHoW7HCGtDK8Ed352Bp7ATNwINmQgWenhjX5NVAIdOo67', '2019-07-03 02:03:37', '2019-07-03 02:03:37'),
(9, 'Auditor', 'Madya', 'madya@local.host', '3717171', '5455454545454', 'Auditor Madya', 'III/B', NULL, '$2y$10$gWzZRpx7FgCbVqs77ANui.UcEVgGKR2OiFNeXK4nZi6mmIeR5IAna', NULL, '2019-07-03 02:04:52', '2019-07-03 02:04:52'),
(10, 'Auditor', 'Muda', 'muda@local.host', '08226767890', '3414124124', 'Auditor Muda', 'III/B', NULL, '$2y$10$7bX/nGmRj01UclbcfuezV.J9yftnBvSztnG8R/AtM16ZaFN.pgXuq', NULL, '2019-07-03 02:05:34', '2019-07-03 02:05:34');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
