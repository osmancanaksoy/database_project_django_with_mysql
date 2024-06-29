-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Anamakine: localhost:3306
-- Üretim Zamanı: 24 Ara 2022, 13:52:29
-- Sunucu sürümü: 8.0.31-0ubuntu0.22.04.1
-- PHP Sürümü: 8.1.2-1ubuntu2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `ecommerce`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add category', 7, 'add_category'),
(26, 'Can change category', 7, 'change_category'),
(27, 'Can delete category', 7, 'delete_category'),
(28, 'Can view category', 7, 'view_category'),
(29, 'Can add main_ category', 8, 'add_main_category'),
(30, 'Can change main_ category', 8, 'change_main_category'),
(31, 'Can delete main_ category', 8, 'delete_main_category'),
(32, 'Can view main_ category', 8, 'view_main_category'),
(33, 'Can add musteri', 9, 'add_musteri'),
(34, 'Can change musteri', 9, 'change_musteri'),
(35, 'Can delete musteri', 9, 'delete_musteri'),
(36, 'Can view musteri', 9, 'view_musteri'),
(37, 'Can add product', 10, 'add_product'),
(38, 'Can change product', 10, 'change_product'),
(39, 'Can delete product', 10, 'delete_product'),
(40, 'Can view product', 10, 'view_product'),
(41, 'Can add product_ color', 11, 'add_product_color'),
(42, 'Can change product_ color', 11, 'change_product_color'),
(43, 'Can delete product_ color', 11, 'delete_product_color'),
(44, 'Can view product_ color', 11, 'view_product_color'),
(45, 'Can add product_ size', 12, 'add_product_size'),
(46, 'Can change product_ size', 12, 'change_product_size'),
(47, 'Can delete product_ size', 12, 'delete_product_size'),
(48, 'Can view product_ size', 12, 'view_product_size'),
(49, 'Can add section', 13, 'add_section'),
(50, 'Can change section', 13, 'change_section'),
(51, 'Can delete section', 13, 'delete_section'),
(52, 'Can view section', 13, 'view_section'),
(53, 'Can add slider', 14, 'add_slider'),
(54, 'Can change slider', 14, 'change_slider'),
(55, 'Can delete slider', 14, 'delete_slider'),
(56, 'Can view slider', 14, 'view_slider'),
(57, 'Can add sub_ category', 15, 'add_sub_category'),
(58, 'Can change sub_ category', 15, 'change_sub_category'),
(59, 'Can delete sub_ category', 15, 'delete_sub_category'),
(60, 'Can view sub_ category', 15, 'view_sub_category'),
(61, 'Can add product_ image', 16, 'add_product_image'),
(62, 'Can change product_ image', 16, 'change_product_image'),
(63, 'Can delete product_ image', 16, 'delete_product_image'),
(64, 'Can view product_ image', 16, 'view_product_image'),
(65, 'Can add additional_ information', 17, 'add_additional_information'),
(66, 'Can change additional_ information', 17, 'change_additional_information'),
(67, 'Can delete additional_ information', 17, 'delete_additional_information'),
(68, 'Can view additional_ information', 17, 'view_additional_information'),
(69, 'Can add customer', 18, 'add_customer'),
(70, 'Can change customer', 18, 'change_customer'),
(71, 'Can delete customer', 18, 'delete_customer'),
(72, 'Can view customer', 18, 'view_customer'),
(73, 'Can add wish_ list', 19, 'add_wish_list'),
(74, 'Can change wish_ list', 19, 'change_wish_list'),
(75, 'Can delete wish_ list', 19, 'delete_wish_list'),
(76, 'Can view wish_ list', 19, 'view_wish_list'),
(77, 'Can add cart', 20, 'add_cart'),
(78, 'Can change cart', 20, 'change_cart'),
(79, 'Can delete cart', 20, 'delete_cart'),
(80, 'Can view cart', 20, 'view_cart'),
(81, 'Can add cart_ item', 21, 'add_cart_item'),
(82, 'Can change cart_ item', 21, 'change_cart_item'),
(83, 'Can delete cart_ item', 21, 'delete_cart_item'),
(84, 'Can view cart_ item', 21, 'view_cart_item'),
(85, 'Can add product_ review', 22, 'add_product_review'),
(86, 'Can change product_ review', 22, 'change_product_review'),
(87, 'Can delete product_ review', 22, 'delete_product_review'),
(88, 'Can view product_ review', 22, 'view_product_review'),
(89, 'Can add branch', 23, 'add_branch'),
(90, 'Can change branch', 23, 'change_branch'),
(91, 'Can delete branch', 23, 'delete_branch'),
(92, 'Can view branch', 23, 'view_branch'),
(93, 'Can add address', 24, 'add_address'),
(94, 'Can change address', 24, 'change_address'),
(95, 'Can delete address', 24, 'delete_address'),
(96, 'Can view address', 24, 'view_address');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$390000$iQlppN4RN8EuKfPIsKsEXR$FZJpb6M7AnY9GValz+1ChECcoXwI1UasPjn5Y1Vgtdg=', '2022-12-21 23:43:12.736393', 1, 'admin', '', '', 'admin@admin.com', 1, 1, '2022-12-19 00:58:58.091325'),
(3, 'pbkdf2_sha256$390000$6EAWb4Pa7yz8QDcNZgBcnj$tRoVSYv9Kry6Dz656EaIA5wUE5gLYOwwR2+wAxAvFFs=', '2022-12-22 07:51:06.945064', 1, 'osman', 'Osman Can', 'AKSOY', 'osman@osman.com', 1, 1, '2022-12-21 22:28:38.000000');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2022-12-19 00:59:49.555008', '1', 'Kadın', 1, '[{\"added\": {}}]', 8, 1),
(2, '2022-12-19 00:59:55.868326', '1', 'Kadın', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 8, 1),
(3, '2022-12-19 01:00:00.535964', '2', 'Erkek', 1, '[{\"added\": {}}]', 8, 1),
(4, '2022-12-19 01:00:10.120472', '3', 'Çocuk', 1, '[{\"added\": {}}]', 8, 1),
(5, '2022-12-19 01:00:25.110873', '4', 'Güzellik Ürünleri', 1, '[{\"added\": {}}]', 8, 1),
(6, '2022-12-19 01:01:00.073653', '1', 'Yeni Gelenler', 1, '[{\"added\": {}}]', 7, 1),
(7, '2022-12-19 01:01:17.529753', '2', 'Çok Satanlar', 1, '[{\"added\": {}}]', 7, 1),
(8, '2022-12-19 01:01:30.216478', '3', 'Basic', 1, '[{\"added\": {}}]', 7, 1),
(9, '2022-12-19 01:01:40.655135', '4', 'Kaban', 1, '[{\"added\": {}}]', 7, 1),
(10, '2022-12-19 01:01:49.523606', '5', 'Ceket', 1, '[{\"added\": {}}]', 7, 1),
(11, '2022-12-19 01:02:00.769554', '6', 'Blazer', 1, '[{\"added\": {}}]', 7, 1),
(12, '2022-12-19 01:02:09.955529', '7', 'Yelek', 1, '[{\"added\": {}}]', 7, 1),
(13, '2022-12-19 01:02:45.609156', '8', 'Elbise', 1, '[{\"added\": {}}]', 7, 1),
(14, '2022-12-19 01:02:53.543956', '9', 'Triko', 1, '[{\"added\": {}}]', 7, 1),
(15, '2022-12-19 01:03:04.157297', '10', 'Gömlek', 1, '[{\"added\": {}}]', 7, 1),
(16, '2022-12-19 01:03:09.223168', '11', 'Top', 1, '[{\"added\": {}}]', 7, 1),
(17, '2022-12-19 01:05:20.090266', '12', 'T-Shirt', 1, '[{\"added\": {}}]', 7, 1),
(18, '2022-12-19 01:05:33.311059', '13', 'Sweatshirt', 1, '[{\"added\": {}}]', 7, 1),
(19, '2022-12-19 01:05:48.472441', '14', 'Pantolon', 1, '[{\"added\": {}}]', 7, 1),
(20, '2022-12-19 01:06:01.840837', '15', 'Jean', 1, '[{\"added\": {}}]', 7, 1),
(21, '2022-12-19 01:06:11.437326', '16', 'Etek', 1, '[{\"added\": {}}]', 7, 1),
(22, '2022-12-19 01:06:51.259724', '17', 'Takım Elbise', 1, '[{\"added\": {}}]', 7, 1),
(23, '2022-12-19 01:07:01.009917', '18', 'Ayakkabı', 1, '[{\"added\": {}}]', 7, 1),
(24, '2022-12-19 01:07:15.392566', '19', 'Çanta', 1, '[{\"added\": {}}]', 7, 1),
(25, '2022-12-19 01:07:26.414808', '20', 'Aksesuar', 1, '[{\"added\": {}}]', 7, 1),
(26, '2022-12-19 01:07:38.820856', '21', 'Basic', 1, '[{\"added\": {}}]', 7, 1),
(27, '2022-12-19 01:07:54.891001', '22', 'Mont', 1, '[{\"added\": {}}]', 7, 1),
(28, '2022-12-19 01:08:07.642522', '23', 'Kaban', 1, '[{\"added\": {}}]', 7, 1),
(29, '2022-12-19 01:08:15.847587', '24', 'Blazer', 1, '[{\"added\": {}}]', 7, 1),
(30, '2022-12-19 01:08:27.608494', '25', 'Yelek', 1, '[{\"added\": {}}]', 7, 1),
(31, '2022-12-19 01:08:41.297349', '26', 'Sweatshirt', 1, '[{\"added\": {}}]', 7, 1),
(32, '2022-12-19 01:08:54.748009', '27', 'Kazak', 1, '[{\"added\": {}}]', 7, 1),
(33, '2022-12-19 01:09:16.703955', '28', 'Pantolon', 1, '[{\"added\": {}}]', 7, 1),
(34, '2022-12-19 01:09:27.530243', '29', 'Jean', 1, '[{\"added\": {}}]', 7, 1),
(35, '2022-12-19 01:09:38.576678', '30', 'Gömlek', 1, '[{\"added\": {}}]', 7, 1),
(36, '2022-12-19 01:09:51.229296', '31', 'T-shirt', 1, '[{\"added\": {}}]', 7, 1),
(37, '2022-12-19 01:10:11.012913', '32', 'Eşofman Takımı', 1, '[{\"added\": {}}]', 7, 1),
(38, '2022-12-19 01:10:21.577210', '33', 'Ayakkabı', 1, '[{\"added\": {}}]', 7, 1),
(39, '2022-12-19 01:10:32.399391', '34', 'Çanta', 1, '[{\"added\": {}}]', 7, 1),
(40, '2022-12-19 01:10:49.856816', '35', 'Kız', 1, '[{\"added\": {}}]', 7, 1),
(41, '2022-12-19 01:11:27.890614', '35', 'Kız Çocuk', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Slug\"]}}]', 7, 1),
(42, '2022-12-19 01:11:54.301176', '36', 'Erkek Çocuk', 1, '[{\"added\": {}}]', 7, 1),
(43, '2022-12-19 01:12:13.556611', '37', 'Parfüm', 1, '[{\"added\": {}}]', 7, 1),
(44, '2022-12-19 01:12:22.284181', '38', 'Dudak', 1, '[{\"added\": {}}]', 7, 1),
(45, '2022-12-19 01:12:26.366493', '38', 'Dudak', 2, '[{\"changed\": {\"fields\": [\"Main category\"]}}]', 7, 1),
(46, '2022-12-19 01:13:08.786679', '39', 'Göz', 1, '[{\"added\": {}}]', 7, 1),
(47, '2022-12-19 01:13:47.287139', '40', 'Yüz', 1, '[{\"added\": {}}]', 7, 1),
(48, '2022-12-19 01:13:58.257426', '41', 'Oje', 1, '[{\"added\": {}}]', 7, 1),
(49, '2022-12-19 01:14:13.850505', '42', 'Fırça', 1, '[{\"added\": {}}]', 7, 1),
(50, '2022-12-19 01:15:16.163662', '1', '0-6 Ay', 1, '[{\"added\": {}}]', 15, 1),
(51, '2022-12-19 01:15:50.053124', '2', '6 Ay - 5 Yaş', 1, '[{\"added\": {}}]', 15, 1),
(52, '2022-12-19 01:15:54.473255', '1', '0-6 Ay', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 15, 1),
(53, '2022-12-19 01:16:20.457077', '3', '6 - 14 Yaş', 1, '[{\"added\": {}}]', 15, 1),
(54, '2022-12-19 01:16:42.570795', '4', '0 - 6 Ay', 1, '[{\"added\": {}}]', 15, 1),
(55, '2022-12-19 01:16:52.076673', '1', '0 - 6 Ay', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 15, 1),
(56, '2022-12-19 01:17:16.090882', '5', '6 Ay - 5 Yaş', 1, '[{\"added\": {}}]', 15, 1),
(57, '2022-12-19 01:17:34.688979', '6', '6 - 14 Yaş', 1, '[{\"added\": {}}]', 15, 1),
(58, '2022-12-19 01:41:57.082054', '1', 'black', 1, '[{\"added\": {}}]', 11, 1),
(59, '2022-12-19 01:42:01.628368', '1', 'M', 1, '[{\"added\": {}}]', 12, 1),
(60, '2022-12-19 01:56:27.459303', '4', 'Güzellik Ürünleri', 3, '', 8, 1),
(61, '2022-12-19 01:56:27.462771', '3', 'Çocuk', 3, '', 8, 1),
(62, '2022-12-19 01:56:27.466433', '2', 'Erkek', 3, '', 8, 1),
(63, '2022-12-19 01:56:27.469988', '1', 'Kadın', 3, '', 8, 1),
(64, '2022-12-19 01:56:49.717867', '5', 'Kadın Giyim', 1, '[{\"added\": {}}]', 8, 1),
(65, '2022-12-19 01:56:56.821919', '6', 'Erkek Giyim', 1, '[{\"added\": {}}]', 8, 1),
(66, '2022-12-19 01:57:33.596589', '7', 'Kız Çocuk', 1, '[{\"added\": {}}]', 8, 1),
(67, '2022-12-19 01:57:54.199523', '8', 'Erkek Çocuk', 1, '[{\"added\": {}}]', 8, 1),
(68, '2022-12-19 01:58:07.916356', '9', 'Güzellik Ürünleri', 1, '[{\"added\": {}}]', 8, 1),
(69, '2022-12-19 01:59:38.603614', '5', 'Kadın', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Slug\"]}}]', 8, 1),
(70, '2022-12-19 01:59:50.172958', '6', 'Erkek', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Slug\"]}}]', 8, 1),
(71, '2022-12-19 02:00:53.535596', '43', 'Giysi -- Kadın', 1, '[{\"added\": {}}]', 7, 1),
(72, '2022-12-19 02:01:23.950348', '44', 'Giyim -- Erkek', 1, '[{\"added\": {}}]', 7, 1),
(73, '2022-12-19 02:01:36.331026', '43', 'Giyim -- Kadın', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Slug\"]}}]', 7, 1),
(74, '2022-12-19 02:01:51.331259', '45', 'Giyim -- Kız Çocuk', 1, '[{\"added\": {}}]', 7, 1),
(75, '2022-12-19 02:02:24.471206', '46', 'Giyim -- Erkek Çocuk', 1, '[{\"added\": {}}]', 7, 1),
(76, '2022-12-19 02:03:02.745250', '9', 'Kişisel Bakım', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Slug\"]}}]', 8, 1),
(77, '2022-12-19 02:03:22.089180', '47', 'Güzellik Ürünleri -- Kişisel Bakım', 1, '[{\"added\": {}}]', 7, 1),
(78, '2022-12-19 02:04:01.641658', '7', 'Kadın -- Giyim -- Yeni Gelenler', 1, '[{\"added\": {}}]', 15, 1),
(79, '2022-12-19 02:04:26.189684', '8', 'Kadın -- Giyim -- Çok Satanlar', 1, '[{\"added\": {}}]', 15, 1),
(80, '2022-12-19 02:04:36.991928', '9', 'Kadın -- Giyim -- Basic', 1, '[{\"added\": {}}]', 15, 1),
(81, '2022-12-19 02:05:25.925908', '10', 'Kadın -- Giyim -- Kaban', 1, '[{\"added\": {}}]', 15, 1),
(82, '2022-12-19 02:05:35.226271', '11', 'Kadın -- Giyim -- Ceket', 1, '[{\"added\": {}}]', 15, 1),
(83, '2022-12-19 02:05:50.346832', '12', 'Kadın -- Giyim -- Blazer', 1, '[{\"added\": {}}]', 15, 1),
(84, '2022-12-19 02:06:03.968794', '13', 'Kadın -- Giyim -- Yelek', 1, '[{\"added\": {}}]', 15, 1),
(85, '2022-12-19 02:06:11.496852', '14', 'Kadın -- Giyim -- Elbise', 1, '[{\"added\": {}}]', 15, 1),
(86, '2022-12-19 02:06:20.307366', '15', 'Kadın -- Giyim -- Triko', 1, '[{\"added\": {}}]', 15, 1),
(87, '2022-12-19 02:06:27.162540', '16', 'Kadın -- Giyim -- Top', 1, '[{\"added\": {}}]', 15, 1),
(88, '2022-12-19 02:06:42.642335', '17', 'Kadın -- Giyim -- T-Shirt', 1, '[{\"added\": {}}]', 15, 1),
(89, '2022-12-19 02:07:02.631188', '18', 'Kadın -- Giyim -- Sweatshirt', 1, '[{\"added\": {}}]', 15, 1),
(90, '2022-12-19 02:07:24.462139', '19', 'Kadın -- Giyim -- Pantolon', 1, '[{\"added\": {}}]', 15, 1),
(91, '2022-12-19 02:08:06.992436', '20', 'Kadın -- Giyim -- Jean', 1, '[{\"added\": {}}]', 15, 1),
(92, '2022-12-19 02:08:14.662831', '21', 'Kadın -- Giyim -- Etek', 1, '[{\"added\": {}}]', 15, 1),
(93, '2022-12-19 02:08:23.250243', '22', 'Kadın -- Giyim -- Takım Elbise', 1, '[{\"added\": {}}]', 15, 1),
(94, '2022-12-19 02:09:45.712255', '23', 'Kadın -- Giyim -- Ayakkabı', 1, '[{\"added\": {}}]', 15, 1),
(95, '2022-12-19 02:10:14.331497', '46', 'Moda -- Erkek Çocuk', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Slug\"]}}]', 7, 1),
(96, '2022-12-19 02:10:22.685940', '45', 'Moda -- Kız Çocuk', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Slug\"]}}]', 7, 1),
(97, '2022-12-19 02:10:33.229332', '44', 'Moda -- Erkek', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Slug\"]}}]', 7, 1),
(98, '2022-12-19 02:10:45.853125', '43', 'Moda -- Kadın', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Slug\"]}}]', 7, 1),
(99, '2022-12-19 02:11:04.856179', '24', 'Kadın -- Moda -- Çanta', 1, '[{\"added\": {}}]', 15, 1),
(100, '2022-12-19 02:12:04.686207', '24', 'Kadın -- Moda -- Çanta', 3, '', 15, 1),
(101, '2022-12-19 02:12:04.689402', '23', 'Kadın -- Moda -- Ayakkabı', 3, '', 15, 1),
(102, '2022-12-19 02:12:04.692320', '22', 'Kadın -- Moda -- Takım Elbise', 3, '', 15, 1),
(103, '2022-12-19 02:12:14.044468', '25', 'Kadın -- Moda -- Gömlek', 1, '[{\"added\": {}}]', 15, 1),
(104, '2022-12-19 02:12:29.901753', '26', 'Kadın -- Moda -- Takım Elbise', 1, '[{\"added\": {}}]', 15, 1),
(105, '2022-12-19 02:12:41.976461', '27', 'Kadın -- Moda -- Ayakkabı', 1, '[{\"added\": {}}]', 15, 1),
(106, '2022-12-19 02:12:55.797991', '28', 'Kadın -- Moda -- Çanta', 1, '[{\"added\": {}}]', 15, 1),
(107, '2022-12-19 02:13:04.995924', '29', 'Kadın -- Moda -- Aksesuar', 1, '[{\"added\": {}}]', 15, 1),
(108, '2022-12-19 02:13:18.866068', '30', 'Erkek -- Moda -- Basic', 1, '[{\"added\": {}}]', 15, 1),
(109, '2022-12-19 02:13:35.303023', '31', 'Erkek -- Moda -- Mont', 1, '[{\"added\": {}}]', 15, 1),
(110, '2022-12-19 02:13:46.553994', '32', 'Erkek -- Moda -- Kaban', 1, '[{\"added\": {}}]', 15, 1),
(111, '2022-12-19 02:13:55.328215', '33', 'Erkek -- Moda -- Blazer', 1, '[{\"added\": {}}]', 15, 1),
(112, '2022-12-19 02:14:04.534206', '34', 'Erkek -- Moda -- Yelek', 1, '[{\"added\": {}}]', 15, 1),
(113, '2022-12-19 02:14:18.775734', '35', 'Erkek -- Moda -- Sweatshirt', 1, '[{\"added\": {}}]', 15, 1),
(114, '2022-12-19 02:14:26.148543', '36', 'Erkek -- Moda -- Kazak', 1, '[{\"added\": {}}]', 15, 1),
(115, '2022-12-19 02:14:38.611891', '37', 'Erkek -- Moda -- Pantolon', 1, '[{\"added\": {}}]', 15, 1),
(116, '2022-12-19 02:14:50.531320', '38', 'Erkek -- Moda -- Jean', 1, '[{\"added\": {}}]', 15, 1),
(117, '2022-12-19 02:15:04.935070', '39', 'Erkek -- Moda -- Gömlek', 1, '[{\"added\": {}}]', 15, 1),
(118, '2022-12-19 02:15:24.929615', '40', 'Erkek -- Moda -- T-Shirt', 1, '[{\"added\": {}}]', 15, 1),
(119, '2022-12-19 02:15:40.235095', '41', 'Erkek -- Moda -- Eşofman Takımı', 1, '[{\"added\": {}}]', 15, 1),
(120, '2022-12-19 02:16:05.632168', '42', 'Erkek -- Moda -- Ayakkabı', 1, '[{\"added\": {}}]', 15, 1),
(121, '2022-12-19 02:16:14.641432', '43', 'Erkek -- Moda -- Çanta', 1, '[{\"added\": {}}]', 15, 1),
(122, '2022-12-19 02:17:11.842538', '9', 'Kişisel Bakım', 3, '', 8, 1),
(123, '2022-12-19 02:17:11.845727', '8', 'Erkek Çocuk', 3, '', 8, 1),
(124, '2022-12-19 02:17:11.850310', '7', 'Kız Çocuk', 3, '', 8, 1),
(125, '2022-12-19 02:17:25.322897', '10', 'Çocuk', 1, '[{\"added\": {}}]', 8, 1),
(126, '2022-12-19 02:17:37.094963', '11', 'Kişisel Bakım', 1, '[{\"added\": {}}]', 8, 1),
(127, '2022-12-19 02:17:56.804182', '48', 'Kız Çocuk -- Çocuk', 1, '[{\"added\": {}}]', 7, 1),
(128, '2022-12-19 02:18:14.842218', '49', 'Erkek Çocuk -- Çocuk', 1, '[{\"added\": {}}]', 7, 1),
(129, '2022-12-19 02:18:28.347062', '50', 'Güzellik Ürünleri -- Çocuk', 1, '[{\"added\": {}}]', 7, 1),
(130, '2022-12-19 02:19:05.848456', '50', 'Güzellik Ürünleri -- Kişisel Bakım', 2, '[{\"changed\": {\"fields\": [\"Main category\"]}}]', 7, 1),
(131, '2022-12-19 02:20:00.896003', '44', 'Çocuk -- Kız Çocuk -- 0 - 6 Ay', 1, '[{\"added\": {}}]', 15, 1),
(132, '2022-12-19 02:20:32.201429', '45', 'Çocuk -- Kız Çocuk -- 6 Ay - 5 Yaş', 1, '[{\"added\": {}}]', 15, 1),
(133, '2022-12-19 02:20:37.666452', '44', 'Çocuk -- Kız Çocuk -- 0 - 6 Ay', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 15, 1),
(134, '2022-12-19 02:21:00.283487', '46', 'Çocuk -- Kız Çocuk -- 6 - 14 Yaş', 1, '[{\"added\": {}}]', 15, 1),
(135, '2022-12-19 02:21:18.744456', '47', 'Çocuk -- Erkek Çocuk -- 0 - 6 Ay', 1, '[{\"added\": {}}]', 15, 1),
(136, '2022-12-19 02:21:40.412753', '48', 'Çocuk -- Erkek Çocuk -- 6 Ay - 5 Yaş', 1, '[{\"added\": {}}]', 15, 1),
(137, '2022-12-19 02:22:01.688476', '49', 'Çocuk -- Erkek Çocuk -- 6 - 14 Yaş', 1, '[{\"added\": {}}]', 15, 1),
(138, '2022-12-19 02:22:17.329022', '50', 'Kişisel Bakım -- Güzellik Ürünleri -- Parfüm', 1, '[{\"added\": {}}]', 15, 1),
(139, '2022-12-19 02:22:25.508641', '51', 'Kişisel Bakım -- Güzellik Ürünleri -- Dudak', 1, '[{\"added\": {}}]', 15, 1),
(140, '2022-12-19 02:22:36.808959', '52', 'Kişisel Bakım -- Güzellik Ürünleri -- Göz', 1, '[{\"added\": {}}]', 15, 1),
(141, '2022-12-19 02:22:47.278854', '53', 'Kişisel Bakım -- Güzellik Ürünleri -- Yüz', 1, '[{\"added\": {}}]', 15, 1),
(142, '2022-12-19 02:22:54.947593', '54', 'Kişisel Bakım -- Güzellik Ürünleri -- Oje', 1, '[{\"added\": {}}]', 15, 1),
(143, '2022-12-19 02:23:06.507569', '55', 'Kişisel Bakım -- Güzellik Ürünleri -- Fırça', 1, '[{\"added\": {}}]', 15, 1),
(144, '2022-12-19 02:25:07.269471', '1', 'Kadin Deri Ceket', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"product_ image\", \"object\": \"Product_Image object (1)\"}}, {\"added\": {\"name\": \"product_ image\", \"object\": \"Product_Image object (2)\"}}, {\"added\": {\"name\": \"product_ image\", \"object\": \"Product_Image object (3)\"}}]', 10, 1),
(145, '2022-12-19 02:26:22.113175', '2', 'white', 1, '[{\"added\": {}}]', 11, 1),
(146, '2022-12-19 02:26:32.423328', '2', '36', 1, '[{\"added\": {}}]', 12, 1),
(147, '2022-12-19 02:27:24.723484', '2', 'Kadın Ayakkabı', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"product_ image\", \"object\": \"Product_Image object (4)\"}}, {\"added\": {\"name\": \"product_ image\", \"object\": \"Product_Image object (5)\"}}, {\"added\": {\"name\": \"product_ image\", \"object\": \"Product_Image object (6)\"}}]', 10, 1),
(148, '2022-12-19 02:27:35.383703', '2', 'Kadın Ayakkabı', 2, '[{\"changed\": {\"fields\": [\"Sub category\"]}}]', 10, 1),
(149, '2022-12-19 02:29:02.448266', '3', 'blue', 1, '[{\"added\": {}}]', 11, 1),
(150, '2022-12-19 02:29:09.385290', '3', 'L', 1, '[{\"added\": {}}]', 12, 1),
(151, '2022-12-19 02:29:18.226254', '3', 'Kadın Jean', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"product_ image\", \"object\": \"Product_Image object (7)\"}}, {\"added\": {\"name\": \"product_ image\", \"object\": \"Product_Image object (8)\"}}, {\"added\": {\"name\": \"product_ image\", \"object\": \"Product_Image object (9)\"}}]', 10, 1),
(152, '2022-12-19 02:43:41.884125', '1', 'ayakkabi-slider', 1, '[{\"added\": {}}]', 14, 1),
(153, '2022-12-19 02:44:40.701478', '1', 'Seçili Ayakkabılarda', 2, '[{\"changed\": {\"fields\": [\"Slider name\", \"Sale\", \"Discount\"]}}]', 14, 1),
(154, '2022-12-19 02:46:31.936769', '2', 'Seçili Ceketlerde', 1, '[{\"added\": {}}]', 14, 1),
(155, '2022-12-19 02:47:05.109785', '3', 'Seçili Jeanlerde', 1, '[{\"added\": {}}]', 14, 1),
(156, '2022-12-19 03:17:00.088196', '44', 'Erkek -- Erkek Moda', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 7, 1),
(157, '2022-12-19 03:17:09.014455', '43', 'Kadın -- Kadın Moda', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 7, 1),
(158, '2022-12-19 03:18:02.453790', '4', 'red', 1, '[{\"added\": {}}]', 11, 1),
(159, '2022-12-19 03:18:10.152478', '4', 'XL', 1, '[{\"added\": {}}]', 12, 1),
(160, '2022-12-19 03:18:30.122288', '4', 'Erkek Deri Mont', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"product_ image\", \"object\": \"Product_Image object (10)\"}}, {\"added\": {\"name\": \"product_ image\", \"object\": \"Product_Image object (11)\"}}, {\"added\": {\"name\": \"product_ image\", \"object\": \"Product_Image object (12)\"}}]', 10, 1),
(161, '2022-12-19 03:29:01.143441', '4', 'Erkek Deri Mont', 2, '[]', 10, 1),
(162, '2022-12-19 03:29:26.529089', '4', 'Erkek Deri Mont', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 10, 1),
(163, '2022-12-19 03:30:32.700259', '4', 'Erkek Deri Mont', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}, {\"changed\": {\"name\": \"product_ image\", \"object\": \"Product_Image object (10)\", \"fields\": [\"Image url\"]}}, {\"changed\": {\"name\": \"product_ image\", \"object\": \"Product_Image object (11)\", \"fields\": [\"Image url\"]}}, {\"changed\": {\"name\": \"product_ image\", \"object\": \"Product_Image object (12)\", \"fields\": [\"Image url\"]}}]', 10, 1),
(164, '2022-12-19 04:51:43.169618', '4', 'Erkek Deri Mont', 2, '[]', 10, 1),
(165, '2022-12-19 04:52:55.065957', '1', 'Kadin Deri Ceket', 2, '[{\"changed\": {\"fields\": [\"Image\", \"Information\"]}}]', 10, 1),
(166, '2022-12-19 04:57:03.102905', '5', 'deneme', 1, '[{\"added\": {}}]', 10, 1),
(167, '2022-12-19 04:57:33.977381', '1', 'Kadin Deri Ceket', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 10, 1),
(168, '2022-12-21 21:53:37.877778', '1', 'Customer object (1)', 1, '[{\"added\": {}}]', 18, 1),
(169, '2022-12-21 21:54:56.739028', '2', 'Customer object (2)', 1, '[{\"added\": {}}]', 18, 1),
(170, '2022-12-21 22:08:40.384175', '3', 'Customer object (3)', 1, '[{\"added\": {}}]', 18, 1),
(171, '2022-12-21 23:43:20.592974', '3', 'osman', 2, '[{\"changed\": {\"fields\": [\"Staff status\", \"Superuser status\"]}}]', 4, 1),
(172, '2022-12-21 23:44:22.416371', '1', 'osman Kadin Deri Ceket', 1, '[{\"added\": {}}]', 22, 3),
(173, '2022-12-22 00:21:48.307478', '2', 'osman Kadin Deri Ceket', 1, '[{\"added\": {}}]', 22, 3),
(174, '2022-12-22 23:03:18.186211', '1', 'Trabzon Şube', 1, '[{\"added\": {}}]', 23, 3),
(175, '2022-12-23 00:14:10.259561', '2', 'Rize Şube', 1, '[{\"added\": {}}]', 23, 3),
(176, '2022-12-23 00:15:41.954758', '1', 'Trabzon Şube', 2, '[{\"changed\": {\"fields\": [\"Phone\"]}}]', 23, 3),
(177, '2022-12-23 00:15:51.109529', '2', 'Rize Şube', 2, '[{\"changed\": {\"fields\": [\"Phone\"]}}]', 23, 3),
(178, '2022-12-23 00:16:51.683567', '3', 'Kırşehir Şube', 1, '[{\"added\": {}}]', 23, 3),
(179, '2022-12-23 00:17:44.486884', '4', 'Samsun Şube', 1, '[{\"added\": {}}]', 23, 3);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(17, 'store', 'additional_information'),
(24, 'store', 'address'),
(23, 'store', 'branch'),
(20, 'store', 'cart'),
(21, 'store', 'cart_item'),
(7, 'store', 'category'),
(18, 'store', 'customer'),
(8, 'store', 'main_category'),
(9, 'store', 'musteri'),
(10, 'store', 'product'),
(11, 'store', 'product_color'),
(16, 'store', 'product_image'),
(22, 'store', 'product_review'),
(12, 'store', 'product_size'),
(13, 'store', 'section'),
(14, 'store', 'slider'),
(15, 'store', 'sub_category'),
(19, 'store', 'wish_list');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-12-19 00:58:29.142555'),
(2, 'auth', '0001_initial', '2022-12-19 00:58:29.638065'),
(3, 'admin', '0001_initial', '2022-12-19 00:58:29.746712'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-12-19 00:58:29.756326'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-12-19 00:58:29.766489'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-12-19 00:58:29.839876'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-12-19 00:58:29.885234'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-12-19 00:58:29.903779'),
(9, 'auth', '0004_alter_user_username_opts', '2022-12-19 00:58:29.912223'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-12-19 00:58:29.950333'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-12-19 00:58:29.954731'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-12-19 00:58:29.962431'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-12-19 00:58:30.013670'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-12-19 00:58:30.058478'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-12-19 00:58:30.081680'),
(16, 'auth', '0011_update_proxy_permissions', '2022-12-19 00:58:30.089938'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-12-19 00:58:30.140297'),
(18, 'sessions', '0001_initial', '2022-12-19 00:58:30.173322'),
(19, 'store', '0001_initial', '2022-12-19 00:58:30.866375'),
(20, 'store', '0002_alter_product_sub_category', '2022-12-19 01:40:52.380968'),
(21, 'store', '0003_remove_product_section_delete_section', '2022-12-19 01:55:40.489665'),
(22, 'store', '0004_rename_beden_product_size_name_and_more', '2022-12-19 03:36:28.549039'),
(23, 'store', '0005_alter_product_image', '2022-12-19 04:54:31.307032'),
(24, 'store', '0006_cart', '2022-12-21 20:33:17.587184'),
(25, 'store', '0007_customer', '2022-12-21 20:33:17.668401'),
(26, 'store', '0008_rename_profil_photo_customer_profile_photo', '2022-12-21 20:33:17.707574'),
(27, 'store', '0009_remove_cart_product_wish_list', '2022-12-21 20:33:17.931677'),
(28, 'store', '0009_cart_customer', '2022-12-21 20:33:18.015133'),
(29, 'store', '0010_merge_20221221_2030', '2022-12-21 20:33:18.021447'),
(30, 'store', '0011_cart_model_delete_cart', '2022-12-21 20:33:18.056847'),
(31, 'store', '0012_rename_cart_model_cart', '2022-12-21 20:33:18.097242'),
(32, 'store', '0013_cart_item', '2022-12-21 20:40:37.044567'),
(33, 'store', '0014_alter_cart_item_cart', '2022-12-21 20:44:44.831798'),
(34, 'store', '0015_delete_cart_item', '2022-12-21 20:51:35.990980'),
(35, 'store', '0016_remove_wish_list_customer_wish_list_user', '2022-12-21 22:01:05.601492'),
(36, 'store', '0017_product_review', '2022-12-21 23:41:57.050734'),
(37, 'store', '0018_product_review_review_photo', '2022-12-21 23:41:57.074974'),
(38, 'store', '0019_branch_delete_musteri', '2022-12-22 23:02:09.606849'),
(39, 'store', '0020_customer_branch_product_branch', '2022-12-22 23:05:17.067754'),
(40, 'store', '0021_branch_phone', '2022-12-23 00:15:18.087332'),
(41, 'store', '0022_address', '2022-12-23 23:56:55.592830');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('8xltczib1u4qm1f55s2izafkwnw57fjp', '.eJxVjDsOgzAQRO_iOrK88RfK9JzBWtvrmCQCCUyFuHuwRJFIU828eTvzuNXit5UWPybWM2C33y5gfNPUhvTC6TnzOE91GQNvCL_WlQ9zos_jYv8EBdfS3jIoSAQOpAMjrRMgzgTZhaSUNTGDzp3EO5GmaEFqg9laEYyImgSe0ohLZf1-HF_xTTp1:1p87eh:Yc_BA7TAJlPv74vjT01kNwsuWsUxxBgiUjc_s5Njreg', '2023-01-04 22:33:43.446316'),
('99burulh72ng98qsexpycbd4y8l9rfug', 'e30:1p87Zm:bhLbLx_g7fBLmWPakMBvmYUbY7028HPWdGItA9M2VZs', '2023-01-04 22:28:38.688175'),
('coz5fez968pzjbfmh4xwm5zc3yk5t329', 'e30:1p8FhE:PW88FVv_QdXhGSVbFlzkFWzRkjUANpKEuQtOhuqEgfY', '2023-01-05 07:08:52.866954'),
('cv91s6un1mpq1r0qw2ygao9tn1kj9ukt', '.eJxVUEtPhDAQ_iumiTe2tBQo7A09GV0PejIxaaYPoIsUhHJYN_x36boHN5lMMvM95suckYDFt2KZzSSsRntEUfR_J0F1xgVAH8E1A1aD85OVOFDwFZ3xYdDm6-HKvTFoYW6DmsmUakMLygqaM14QSraSrJQ6TXmuaprVJYPEmMwoTlmWQ805kTlRmSGwmSqYPNqfURJa8A55aYTGadCL8pf4SYQc9GY7-Az6cyGUUXdXnaDrQP6Nm9H3As5bf7qqrQp8nhFMNtD20IQ5br0f53tWxT3ujbawgx5-Brc9oI8vpDl-ijndlYei6t5eX7CoHsX7R15mAh_HBq3r-gt3k25e:1p7BxJ:xzrpmNE-IhjDPQnUxnev6-hQOceQ74iKDmkMCT8uRiE', '2023-01-02 08:57:05.607294'),
('gwwtmmzbd66l8jbh5jhcs9ve1uay0xcj', '.eJxVjE0OgyAYBe_CuiH8KKjL7nsG8-CDYttgIrgy3r2auGi3b-bNxkasNY1rCcs4ERuYZrffzcG_Qz4BvZCfM_dzrsvk-Knwixb-mCl87pf7F0go6XhHa1qoTkJIIxxAFMhGrTpIEkrErrEeyhuCa3VvlI6AjKGHFg05646ox1LZsO37Fzr_O-0:1p8tKr:Y1XYhvPxQhDEa2-EZwQP89AXVMQjYNUgXA31-2XEiOg', '2023-01-07 01:28:25.051906');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `store_additional_information`
--

CREATE TABLE `store_additional_information` (
  `id` bigint NOT NULL,
  `specification` varchar(100) NOT NULL,
  `detail` varchar(100) NOT NULL,
  `product_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `store_address`
--

CREATE TABLE `store_address` (
  `id` bigint NOT NULL,
  `name` varchar(25) NOT NULL,
  `address_line` varchar(255) NOT NULL,
  `address_line_2` varchar(255) NOT NULL,
  `city` varchar(20) NOT NULL,
  `street` varchar(20) NOT NULL,
  `post_code` varchar(6) NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `store_branch`
--

CREATE TABLE `store_branch` (
  `id` bigint NOT NULL,
  `name` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `street` varchar(20) NOT NULL,
  `post_code` varchar(6) NOT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `store_branch`
--

INSERT INTO `store_branch` (`id`, `name`, `city`, `street`, `post_code`, `phone`) VALUES
(1, 'Trabzon Şube', 'Trabzon', 'Kalkınma', '61080', '04622236161'),
(2, 'Rize Şube', 'Rize', 'Merkez', '53000', '04642235353'),
(3, 'Kırşehir Şube', 'Kırşehir', 'Merkez', '40100', '03862234040'),
(4, 'Samsun Şube', 'Samsun', 'Atakum', '55200', '03622235555');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `store_cart`
--

CREATE TABLE `store_cart` (
  `id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `store_category`
--

CREATE TABLE `store_category` (
  `id` bigint NOT NULL,
  `name` varchar(150) NOT NULL,
  `slug` varchar(500) DEFAULT NULL,
  `main_category_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `store_category`
--

INSERT INTO `store_category` (`id`, `name`, `slug`, `main_category_id`) VALUES
(43, 'Kadın Moda', 'moda-kadin', 5),
(44, 'Erkek Moda', 'moda-erkek', 6),
(48, 'Kız Çocuk', 'kiz-cocuk', 10),
(49, 'Erkek Çocuk', 'erkek-cocuk', 10),
(50, 'Güzellik Ürünleri', 'guzellik-urunleri', 11);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `store_customer`
--

CREATE TABLE `store_customer` (
  `id` bigint NOT NULL,
  `phone` varchar(20) NOT NULL,
  `profile_photo` varchar(100) DEFAULT NULL,
  `point` smallint UNSIGNED DEFAULT NULL,
  `user_id` int NOT NULL,
  `branch_id` bigint NOT NULL
) ;

--
-- Tablo döküm verisi `store_customer`
--

INSERT INTO `store_customer` (`id`, `phone`, `profile_photo`, `point`, `user_id`, `branch_id`) VALUES
(4, '', 'uploads/20221221220840271085674.png', 10, 3, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `store_main_category`
--

CREATE TABLE `store_main_category` (
  `id` bigint NOT NULL,
  `name` varchar(150) NOT NULL,
  `slug` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `store_main_category`
--

INSERT INTO `store_main_category` (`id`, `name`, `slug`) VALUES
(5, 'Kadın', 'kadin'),
(6, 'Erkek', 'erkek'),
(10, 'Çocuk', 'cocuk'),
(11, 'Kişisel Bakım', 'kisisel-bakim');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `store_product`
--

CREATE TABLE `store_product` (
  `id` bigint NOT NULL,
  `name` varchar(150) NOT NULL,
  `slug` varchar(500) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `stock` int NOT NULL,
  `sales` int NOT NULL,
  `price` double NOT NULL,
  `information` longtext NOT NULL,
  `discount` double NOT NULL,
  `in_stock` tinyint(1) NOT NULL,
  `is_trend` tinyint(1) NOT NULL,
  `category_id` bigint NOT NULL,
  `color_id` bigint DEFAULT NULL,
  `size_id` bigint DEFAULT NULL,
  `sub_category_id` bigint DEFAULT NULL,
  `branch_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `store_product`
--

INSERT INTO `store_product` (`id`, `name`, `slug`, `image`, `stock`, `sales`, `price`, `information`, `discount`, `in_stock`, `is_trend`, `category_id`, `color_id`, `size_id`, `sub_category_id`, `branch_id`) VALUES
(1, 'Kadin Deri Ceket', 'kadin-deri-ceket', 'uploads/20221219045733kadin_deri_ceket.jpg', 100, 0, 500, '<p>Kadin Deri Ceket</p>', 10, 0, 0, 43, 1, 1, 8, 1),
(2, 'Kadın Ayakkabı', 'kadn-ayakkab', 'https://m.media-amazon.com/images/I/71-9M8AkRNL._AC_SY695_.jpg', 50, 0, 750, 'Kadın Ayakkabı', 25, 0, 0, 43, 2, 2, 8, 1),
(3, 'Kadın Jean', 'kadn-jean', 'https://productimages.hepsiburada.net/s/112/1000/110000059143845.jpg', 50, 0, 800, 'Kadın Jean', 10, 0, 0, 43, 3, 3, 8, 1),
(4, 'Erkek Deri Mont', 'erkek-deri-mont', 'https://productimages.hepsiburada.net/s/328/1000/110000332680843.jpg', 60, 0, 500, '<p>Erkek Deri Mont</p>', 15, 0, 0, 44, 4, 4, 31, 1),
(5, 'deneme', 'deneme', 'uploads/20221219045703kadın_jean.jpg', 50, 5, 100, '<p>asdadad</p>', 10, 0, 0, 43, 1, 2, 8, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `store_product_color`
--

CREATE TABLE `store_product_color` (
  `id` bigint NOT NULL,
  `code` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `store_product_color`
--

INSERT INTO `store_product_color` (`id`, `code`) VALUES
(1, 'black'),
(2, 'white'),
(3, 'blue'),
(4, 'red');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `store_product_image`
--

CREATE TABLE `store_product_image` (
  `id` bigint NOT NULL,
  `image_url` varchar(200) NOT NULL,
  `product_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `store_product_image`
--

INSERT INTO `store_product_image` (`id`, `image_url`, `product_id`) VALUES
(1, 'https://productimages.hepsiburada.net/l/47/1000/10935030251570.jpg', 1),
(2, 'https://productimages.hepsiburada.net/l/47/1000/10935030218802.jpg', 1),
(3, 'https://productimages.hepsiburada.net/l/47/1000/10935030284338.jpg', 1),
(4, 'https://m.media-amazon.com/images/I/71-9M8AkRNL._AC_SY695_.jpg', 2),
(5, 'https://m.media-amazon.com/images/I/71EJqU0GF8L._AC_SY695_.jpg', 2),
(6, 'https://m.media-amazon.com/images/I/71z6nhMDF+L._AC_SY695_.jpg', 2),
(7, 'https://productimages.hepsiburada.net/s/112/1000/110000059143845.jpg', 3),
(8, 'https://productimages.hepsiburada.net/s/112/1000/110000059143846.jpg', 3),
(9, 'https://productimages.hepsiburada.net/s/112/1000/110000059143848.jpg', 3),
(10, 'https://productimages.hepsiburada.net/s/328/1000/110000332680843.jpg', 4),
(11, 'https://productimages.hepsiburada.net/s/328/1000/110000332680844.jpg', 4),
(12, 'https://productimages.hepsiburada.net/s/328/1000/110000332680846.jpg', 4);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `store_product_review`
--

CREATE TABLE `store_product_review` (
  `id` bigint NOT NULL,
  `review_text` longtext NOT NULL,
  `review_rating` varchar(150) NOT NULL,
  `product_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `review_photo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `store_product_review`
--

INSERT INTO `store_product_review` (`id`, `review_text`, `review_rating`, `product_id`, `user_id`, `review_photo`) VALUES
(10, 'aaaa', '3', 1, 3, '');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `store_product_size`
--

CREATE TABLE `store_product_size` (
  `id` bigint NOT NULL,
  `name` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `store_product_size`
--

INSERT INTO `store_product_size` (`id`, `name`) VALUES
(1, 'M'),
(2, '36'),
(3, 'L'),
(4, 'XL');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `store_slider`
--

CREATE TABLE `store_slider` (
  `id` bigint NOT NULL,
  `image` varchar(100) NOT NULL,
  `slider_name` varchar(50) NOT NULL,
  `discount_deal` varchar(100) NOT NULL,
  `sale` int NOT NULL,
  `discount` int NOT NULL,
  `link` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `store_slider`
--

INSERT INTO `store_slider` (`id`, `image`, `slider_name`, `discount_deal`, `sale`, `discount`, `link`) VALUES
(1, 'media/slider_images/Adsız_tasarım_ceWPab5.png', 'Seçili Ayakkabılarda', 'SÜPER İNDİRİMLER', 15, 25, '-'),
(2, 'media/slider_images/Adsız_tasarım_1_3jHbt2s.png', 'Seçili Ceketlerde', 'SÜPER İNDİRİMLER', 20, 25, '-'),
(3, 'media/slider_images/Adsız_tasarım_2_RXpRfG5.png', 'Seçili Jeanlerde', 'SÜPER İNDİRİMLER', 30, 25, '-');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `store_sub_category`
--

CREATE TABLE `store_sub_category` (
  `id` bigint NOT NULL,
  `name` varchar(150) NOT NULL,
  `slug` varchar(500) DEFAULT NULL,
  `category_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `store_sub_category`
--

INSERT INTO `store_sub_category` (`id`, `name`, `slug`, `category_id`) VALUES
(7, 'Yeni Gelenler', 'yeni-gelenler', 43),
(8, 'Çok Satanlar', 'cok-satanlar', 43),
(9, 'Basic', 'basic-kadin', 43),
(10, 'Kaban', 'kaban-kadin', 43),
(11, 'Ceket', 'ceket-kadin', 43),
(12, 'Blazer', 'blazer-kadin', 43),
(13, 'Yelek', 'yelek-kadin', 43),
(14, 'Elbise', 'elbise', 43),
(15, 'Triko', 'triko', 43),
(16, 'Top', 'top', 43),
(17, 'T-Shirt', 't-shirt-kadin', 43),
(18, 'Sweatshirt', 'sweatshirt-kadin', 43),
(19, 'Pantolon', 'pantolon-kadin', 43),
(20, 'Jean', 'jean-kadin', 43),
(21, 'Etek', 'etek', 43),
(25, 'Gömlek', 'gomlek-kadin', 43),
(26, 'Takım Elbise', 'takim-elbise', 43),
(27, 'Ayakkabı', 'ayakkabi-kadin', 43),
(28, 'Çanta', 'canta-kadin', 43),
(29, 'Aksesuar', 'aksesuar', 43),
(30, 'Basic', 'basic-erkek', 44),
(31, 'Mont', 'mont', 44),
(32, 'Kaban', 'kaban-erkek', 44),
(33, 'Blazer', 'blazer-erkek', 44),
(34, 'Yelek', 'yelek-erkek', 44),
(35, 'Sweatshirt', 'sweatshirt-erkek', 44),
(36, 'Kazak', 'kazak', 44),
(37, 'Pantolon', 'pantolon-erkek', 44),
(38, 'Jean', 'jean-erkek', 44),
(39, 'Gömlek', 'gomlek-erkek', 44),
(40, 'T-Shirt', 't-shirt-erkek', 44),
(41, 'Eşofman Takımı', 'esofman-takimi', 44),
(42, 'Ayakkabı', 'ayakkabi-erkek', 44),
(43, 'Çanta', 'canta-erkek', 44),
(44, '0 - 6 Ay', '0-6-ay-kiz', 48),
(45, '6 Ay - 5 Yaş', '6-ay-5-yas-kiz', 48),
(46, '6 - 14 Yaş', '6-14-yas-kiz', 48),
(47, '0 - 6 Ay', '0-6-ay-erkek', 49),
(48, '6 Ay - 5 Yaş', '6-ay-5-yas-erkek', 49),
(49, '6 - 14 Yaş', '6-14-yas-erkek', 49),
(50, 'Parfüm', 'parfum', 50),
(51, 'Dudak', 'dudak', 50),
(52, 'Göz', 'goz', 50),
(53, 'Yüz', 'yuz', 50),
(54, 'Oje', 'oje', 50),
(55, 'Fırça', 'firca', 50);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `store_wish_list`
--

CREATE TABLE `store_wish_list` (
  `id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Tablo için indeksler `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Tablo için indeksler `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Tablo için indeksler `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Tablo için indeksler `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Tablo için indeksler `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Tablo için indeksler `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Tablo için indeksler `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Tablo için indeksler `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Tablo için indeksler `store_additional_information`
--
ALTER TABLE `store_additional_information`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_additional_inf_product_id_9c0f1b9c_fk_store_pro` (`product_id`);

--
-- Tablo için indeksler `store_address`
--
ALTER TABLE `store_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_address_user_id_34317815_fk_auth_user_id` (`user_id`);

--
-- Tablo için indeksler `store_branch`
--
ALTER TABLE `store_branch`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `store_cart`
--
ALTER TABLE `store_cart`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `store_category`
--
ALTER TABLE `store_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_category_main_category_id_7fc0593b_fk_store_mai` (`main_category_id`),
  ADD KEY `store_category_slug_2d349264` (`slug`);

--
-- Tablo için indeksler `store_customer`
--
ALTER TABLE `store_customer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `store_customer_branch_id_1f9f20b6_fk_store_branch_id` (`branch_id`);

--
-- Tablo için indeksler `store_main_category`
--
ALTER TABLE `store_main_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_main_category_slug_d58386d4` (`slug`);

--
-- Tablo için indeksler `store_product`
--
ALTER TABLE `store_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_product_color_id_80682fd6_fk_store_product_color_id` (`color_id`),
  ADD KEY `store_product_size_id_838e791c_fk_store_product_size_id` (`size_id`),
  ADD KEY `store_product_category_id_574bae65_fk_store_category_id` (`category_id`),
  ADD KEY `store_product_slug_6de8ee4b` (`slug`),
  ADD KEY `store_product_sub_category_id_0afd4673_fk_store_sub_category_id` (`sub_category_id`),
  ADD KEY `store_product_branch_id_30706a81_fk_store_branch_id` (`branch_id`);

--
-- Tablo için indeksler `store_product_color`
--
ALTER TABLE `store_product_color`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `store_product_image`
--
ALTER TABLE `store_product_image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_product_image_product_id_736d1001_fk_store_product_id` (`product_id`);

--
-- Tablo için indeksler `store_product_review`
--
ALTER TABLE `store_product_review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_product_review_product_id_595f6983_fk_store_product_id` (`product_id`),
  ADD KEY `store_product_review_user_id_ef986ac9_fk_auth_user_id` (`user_id`);

--
-- Tablo için indeksler `store_product_size`
--
ALTER TABLE `store_product_size`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `store_slider`
--
ALTER TABLE `store_slider`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `store_sub_category`
--
ALTER TABLE `store_sub_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_sub_category_category_id_f238052b_fk_store_category_id` (`category_id`),
  ADD KEY `store_sub_category_slug_330dd7cb` (`slug`);

--
-- Tablo için indeksler `store_wish_list`
--
ALTER TABLE `store_wish_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_wish_list_product_id_b162065d_fk_store_product_id` (`product_id`),
  ADD KEY `store_wish_list_user_id_d6f03317_fk_auth_user_id` (`user_id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- Tablo için AUTO_INCREMENT değeri `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=180;

--
-- Tablo için AUTO_INCREMENT değeri `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Tablo için AUTO_INCREMENT değeri `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- Tablo için AUTO_INCREMENT değeri `store_additional_information`
--
ALTER TABLE `store_additional_information`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `store_address`
--
ALTER TABLE `store_address`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `store_branch`
--
ALTER TABLE `store_branch`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `store_cart`
--
ALTER TABLE `store_cart`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `store_category`
--
ALTER TABLE `store_category`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- Tablo için AUTO_INCREMENT değeri `store_customer`
--
ALTER TABLE `store_customer`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `store_main_category`
--
ALTER TABLE `store_main_category`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Tablo için AUTO_INCREMENT değeri `store_product`
--
ALTER TABLE `store_product`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `store_product_color`
--
ALTER TABLE `store_product_color`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `store_product_image`
--
ALTER TABLE `store_product_image`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Tablo için AUTO_INCREMENT değeri `store_product_review`
--
ALTER TABLE `store_product_review`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Tablo için AUTO_INCREMENT değeri `store_product_size`
--
ALTER TABLE `store_product_size`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `store_slider`
--
ALTER TABLE `store_slider`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `store_sub_category`
--
ALTER TABLE `store_sub_category`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- Tablo için AUTO_INCREMENT değeri `store_wish_list`
--
ALTER TABLE `store_wish_list`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Tablo kısıtlamaları `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Tablo kısıtlamaları `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Tablo kısıtlamaları `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Tablo kısıtlamaları `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Tablo kısıtlamaları `store_additional_information`
--
ALTER TABLE `store_additional_information`
  ADD CONSTRAINT `store_additional_inf_product_id_9c0f1b9c_fk_store_pro` FOREIGN KEY (`product_id`) REFERENCES `store_product` (`id`);

--
-- Tablo kısıtlamaları `store_address`
--
ALTER TABLE `store_address`
  ADD CONSTRAINT `store_address_user_id_34317815_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Tablo kısıtlamaları `store_category`
--
ALTER TABLE `store_category`
  ADD CONSTRAINT `store_category_main_category_id_7fc0593b_fk_store_mai` FOREIGN KEY (`main_category_id`) REFERENCES `store_main_category` (`id`);

--
-- Tablo kısıtlamaları `store_customer`
--
ALTER TABLE `store_customer`
  ADD CONSTRAINT `store_customer_branch_id_1f9f20b6_fk_store_branch_id` FOREIGN KEY (`branch_id`) REFERENCES `store_branch` (`id`),
  ADD CONSTRAINT `store_customer_user_id_04276401_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Tablo kısıtlamaları `store_product`
--
ALTER TABLE `store_product`
  ADD CONSTRAINT `store_product_branch_id_30706a81_fk_store_branch_id` FOREIGN KEY (`branch_id`) REFERENCES `store_branch` (`id`),
  ADD CONSTRAINT `store_product_category_id_574bae65_fk_store_category_id` FOREIGN KEY (`category_id`) REFERENCES `store_category` (`id`),
  ADD CONSTRAINT `store_product_color_id_80682fd6_fk_store_product_color_id` FOREIGN KEY (`color_id`) REFERENCES `store_product_color` (`id`),
  ADD CONSTRAINT `store_product_size_id_838e791c_fk_store_product_size_id` FOREIGN KEY (`size_id`) REFERENCES `store_product_size` (`id`),
  ADD CONSTRAINT `store_product_sub_category_id_0afd4673_fk_store_sub_category_id` FOREIGN KEY (`sub_category_id`) REFERENCES `store_sub_category` (`id`);

--
-- Tablo kısıtlamaları `store_product_image`
--
ALTER TABLE `store_product_image`
  ADD CONSTRAINT `store_product_image_product_id_736d1001_fk_store_product_id` FOREIGN KEY (`product_id`) REFERENCES `store_product` (`id`);

--
-- Tablo kısıtlamaları `store_product_review`
--
ALTER TABLE `store_product_review`
  ADD CONSTRAINT `store_product_review_product_id_595f6983_fk_store_product_id` FOREIGN KEY (`product_id`) REFERENCES `store_product` (`id`),
  ADD CONSTRAINT `store_product_review_user_id_ef986ac9_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Tablo kısıtlamaları `store_sub_category`
--
ALTER TABLE `store_sub_category`
  ADD CONSTRAINT `store_sub_category_category_id_f238052b_fk_store_category_id` FOREIGN KEY (`category_id`) REFERENCES `store_category` (`id`);

--
-- Tablo kısıtlamaları `store_wish_list`
--
ALTER TABLE `store_wish_list`
  ADD CONSTRAINT `store_wish_list_product_id_b162065d_fk_store_product_id` FOREIGN KEY (`product_id`) REFERENCES `store_product` (`id`),
  ADD CONSTRAINT `store_wish_list_user_id_d6f03317_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
