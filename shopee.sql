-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 18, 2025 lúc 08:47 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `shopee`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `product_id`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 5, '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(2, 1, 1, 1, '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(3, 1, 1, 4, '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(4, 1, 1, 2, '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(5, 1, 1, 4, '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(6, 1, 1, 4, '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(7, 1, 1, 4, '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(8, 1, 1, 1, '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(9, 1, 1, 4, '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(10, 1, 1, 1, '2025-06-18 11:46:17', '2025-06-18 11:46:17');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `desc` varchar(255) NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `image`, `desc`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 'illum', 'https://via.placeholder.com/640x480.png/0055ff?text=repudiandae', 'King put on her face in her pocket) till she got.', NULL, '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(2, 'corrupti', 'https://via.placeholder.com/640x480.png/0022cc?text=est', 'COURT.\' Everybody looked at each other for some.', NULL, '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(3, 'sapiente', 'https://via.placeholder.com/640x480.png/007711?text=labore', 'Alice; \'and I wish I hadn\'t mentioned Dinah!\'.', NULL, '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(4, 'repellendus', 'https://via.placeholder.com/640x480.png/00dd44?text=in', 'THESE?\' said the Gryphon. \'Of course,\' the.', NULL, '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(5, 'sint', 'https://via.placeholder.com/640x480.png/002200?text=reprehenderit', 'Alice, as she had put on his spectacles and.', NULL, '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(6, 'quod', 'https://via.placeholder.com/640x480.png/002200?text=dolorem', 'Gryphon. \'It\'s all about it!\' and he checked.', NULL, '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(7, 'excepturi', 'https://via.placeholder.com/640x480.png/003355?text=veniam', 'No, there were a Duck and a Canary called out in.', NULL, '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(8, 'tenetur', 'https://via.placeholder.com/640x480.png/00bbaa?text=et', 'This did not answer, so Alice went on saying to.', NULL, '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(9, 'nisi', 'https://via.placeholder.com/640x480.png/0099bb?text=porro', 'Ann, what ARE you doing out here? Run home this.', NULL, '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(10, 'maxime', 'https://via.placeholder.com/640x480.png/003388?text=et', 'Gryphon, lying fast asleep in the trial one way.', NULL, '2025-06-18 11:46:17', '2025-06-18 11:46:17');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000001_create_cache_table', 1),
(2, '0001_01_01_000002_create_jobs_table', 1),
(3, '2025_06_18_100000_create_users_table', 1),
(4, '2025_06_18_142244_create_categories_table', 1),
(5, '2025_06_18_142320_create_products_table', 1),
(6, '2025_06_18_142358_create_orders_table', 1),
(7, '2025_06_18_142428_create_order_items_table', 1),
(8, '2025_06_18_142532_create_reviews_table', 1),
(9, '2025_06_18_142556_create_carts_table', 1),
(10, '2025_06_18_142642_create_payments_table', 1),
(11, '2025_06_18_142737_create_product_images_table', 1),
(12, '2025_06_18_143133_create_shipping_table', 1),
(13, '2025_06_18_172142_create_sessions_table', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `total_price` decimal(10,3) NOT NULL,
  `status` enum('pending','paid','shipped','cancelled') NOT NULL,
  `shipping_address` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `total_price`, `status`, `shipping_address`, `created_at`, `updated_at`) VALUES
(1, 1, 9086.100, 'shipped', '926 Waters Shoals Apt. 074\nSouth Jamisonberg, WA 33933-9939', '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(2, 1, 2463.890, 'cancelled', '67774 Waelchi Vista Suite 296\nEmmerichborough, WY 53526-8054', '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(3, 1, 2086.230, 'pending', '735 Elinore Valleys\nAmericoport, OH 75099', '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(4, 1, 3258.360, 'pending', '5701 Johnston Ranch Suite 968\nPort Tyson, WV 61656-2973', '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(5, 1, 9422.260, 'pending', '60994 Amir Trace\nKulashaven, WI 54036', '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(6, 1, 2039.250, 'pending', '64864 Rossie Flat Apt. 211\nHenrihaven, MO 01276-7395', '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(7, 1, 3363.180, 'pending', '23475 Zulauf Landing\nWest Jaeden, MD 00432', '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(8, 1, 9804.830, 'shipped', '1400 Dibbert Courts\nNorth Elody, RI 09410-1668', '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(9, 1, 387.650, 'paid', '82876 Jamie Pine Suite 515\nKoreyfort, MI 06543-9451', '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(10, 1, 1534.160, 'pending', '4055 Kristopher Terrace\nTillmanville, ID 89442', '2025-06-18 11:46:17', '2025-06-18 11:46:17');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,3) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 4, 700.720, '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(2, 1, 1, 8, 751.060, '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(3, 1, 1, 4, 179.000, '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(4, 1, 1, 2, 753.780, '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(5, 1, 1, 1, 717.970, '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(6, 1, 1, 9, 878.030, '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(7, 1, 1, 2, 807.850, '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(8, 1, 1, 10, 609.870, '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(9, 1, 1, 10, 856.070, '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(10, 1, 1, 2, 68.490, '2025-06-18 11:46:17', '2025-06-18 11:46:17');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(10,3) NOT NULL,
  `method` enum('credit_card','bank_transfer','momo') NOT NULL,
  `status` enum('pending','completed','failed') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `payments`
--

INSERT INTO `payments` (`id`, `order_id`, `amount`, `method`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 7081.670, 'credit_card', 'completed', '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(2, 1, 1893.720, 'credit_card', 'failed', '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(3, 1, 2460.690, 'momo', 'pending', '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(4, 1, 9479.240, 'momo', 'failed', '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(5, 1, 112.410, 'credit_card', 'completed', '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(6, 1, 3184.640, 'momo', 'pending', '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(7, 1, 4019.260, 'credit_card', 'failed', '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(8, 1, 9674.910, 'credit_card', 'failed', '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(9, 1, 8486.810, 'momo', 'pending', '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(10, 1, 726.220, 'credit_card', 'failed', '2025-06-18 11:46:17', '2025-06-18 11:46:17');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,3) NOT NULL,
  `stock` int(11) NOT NULL,
  `seller_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `image`, `description`, `price`, `stock`, `seller_id`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'est', 'https://via.placeholder.com/640x480.png/005588?text=accusantium', 'I shall see it again, but it did not like to see the earth takes twenty-four hours to turn into a.', 847.830, 66, 1, 1, '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(2, 'quia', 'https://via.placeholder.com/640x480.png/000055?text=explicabo', 'They are waiting on the second verse of the deepest contempt. \'I\'ve seen hatters before,\' she said.', 993.090, 95, 1, 1, '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(3, 'nesciunt', 'https://via.placeholder.com/640x480.png/00dddd?text=excepturi', 'March Hare. \'I didn\'t know that Cheshire cats always grinned; in fact, a sort of way to fly up.', 328.430, 94, 1, 1, '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(4, 'culpa', 'https://via.placeholder.com/640x480.png/007744?text=ad', 'NOT be an old crab, HE was.\' \'I never heard of \"Uglification,\"\' Alice ventured to say. \'What is.', 545.420, 81, 1, 1, '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(5, 'est', 'https://via.placeholder.com/640x480.png/00bbcc?text=quis', 'Rome, and Rome--no, THAT\'S all wrong, I\'m certain! I must be a very good height indeed!\' said the.', 800.560, 26, 1, 1, '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(6, 'esse', 'https://via.placeholder.com/640x480.png/00dd44?text=et', 'VERY much out of a globe of goldfish she had hurt the poor little thing was snorting like a tunnel.', 437.710, 57, 1, 1, '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(7, 'aut', 'https://via.placeholder.com/640x480.png/00eecc?text=velit', 'Caterpillar. \'I\'m afraid I don\'t know what \"it\" means well enough, when I sleep\" is the same size.', 546.400, 59, 1, 1, '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(8, 'nobis', 'https://via.placeholder.com/640x480.png/001100?text=animi', 'March Hare. \'Yes, please do!\' but the Gryphon repeated impatiently: \'it begins \"I passed by his.', 339.620, 7, 1, 1, '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(9, 'voluptatum', 'https://via.placeholder.com/640x480.png/0044cc?text=aliquam', 'Heads below!\' (a loud crash)--\'Now, who did that?--It was Bill, I fancy--Who\'s to go on till you.', 735.180, 10, 1, 1, '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(10, 'eos', 'https://via.placeholder.com/640x480.png/00bbee?text=aspernatur', 'She was close behind us, and he\'s treading on my tail. See how eagerly the lobsters to the.', 193.740, 25, 1, 1, '2025-06-18 11:46:17', '2025-06-18 11:46:17');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image_url`, `created_at`, `updated_at`) VALUES
(1, 1, 'https://via.placeholder.com/640x480.png/005599?text=enim', '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(2, 1, 'https://via.placeholder.com/640x480.png/0088ee?text=in', '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(3, 1, 'https://via.placeholder.com/640x480.png/0066bb?text=a', '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(4, 1, 'https://via.placeholder.com/640x480.png/00dddd?text=et', '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(5, 1, 'https://via.placeholder.com/640x480.png/00eeaa?text=mollitia', '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(6, 1, 'https://via.placeholder.com/640x480.png/00dd33?text=quis', '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(7, 1, 'https://via.placeholder.com/640x480.png/003344?text=aperiam', '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(8, 1, 'https://via.placeholder.com/640x480.png/00ddff?text=aut', '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(9, 1, 'https://via.placeholder.com/640x480.png/004499?text=quia', '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(10, 1, 'https://via.placeholder.com/640x480.png/0033aa?text=aut', '2025-06-18 11:46:17', '2025-06-18 11:46:17');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `product_id`, `rating`, `comment`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 3, NULL, '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(2, 1, 1, 5, NULL, '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(3, 1, 1, 1, NULL, '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(4, 1, 1, 2, NULL, '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(5, 1, 1, 3, NULL, '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(6, 1, 1, 1, NULL, '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(7, 1, 1, 1, NULL, '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(8, 1, 1, 3, NULL, '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(9, 1, 1, 5, NULL, '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(10, 1, 1, 5, NULL, '2025-06-18 11:46:17', '2025-06-18 11:46:17');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `shipping`
--

CREATE TABLE `shipping` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `carrier` varchar(255) NOT NULL,
  `tracking_number` varchar(255) DEFAULT NULL,
  `status` enum('processing','shipped','delivered') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `shipping`
--

INSERT INTO `shipping` (`id`, `order_id`, `carrier`, `tracking_number`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Buckridge-Little', '3836bdde-49e5-3d0c-9cda-e200f6bed991', 'delivered', '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(2, 1, 'Metz, Beahan and Kulas', '411a58c4-61c6-37b0-9cde-e3f0f1ec9c01', 'processing', '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(3, 1, 'Schneider Group', '77948b2a-15a0-3492-b1c9-0b2d5bc0ed3c', 'delivered', '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(4, 1, 'Krajcik Inc', '3b4d1bc9-4b22-393a-8546-b91bbaa9f66f', 'processing', '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(5, 1, 'Barrows, Emmerich and Cummings', 'ea3b6082-789e-355d-a5b9-acbcc20f0771', 'processing', '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(6, 1, 'White LLC', '4bbbbc40-a5af-3ead-9459-92089a99546c', 'shipped', '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(7, 1, 'Cartwright, Watsica and Streich', '074c3e70-e4a4-3a8a-8921-246fd161f31a', 'processing', '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(8, 1, 'Hermann-Kris', '5c94f7e5-0893-3c12-8aec-5187f58ac0bd', 'delivered', '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(9, 1, 'Jakubowski, Halvorson and Fritsch', 'd6aaa5b8-b11a-3cdd-9d14-a5a59eb87877', 'processing', '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(10, 1, 'Wilkinson-Schimmel', 'a142735a-8a38-35b1-9bae-c1df6b2dee49', 'processing', '2025-06-18 11:46:17', '2025-06-18 11:46:17');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `role` enum('admin','customer','seller') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `phone`, `address`, `role`, `created_at`, `updated_at`) VALUES
(1, 'Mrs. Alexandra Williamson', 'wcarter@example.org', '$2y$12$y4N1827IN19qFdAWifPhnOMd0SJTsA5wrGqqCYp23i4QuMZ6qqauu', '(951) 755-2793', '836 Lynch Island\nWest Juliannemouth, MS 36922-2611', 'admin', '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(2, 'Alisa Crona', 'gulgowski.itzel@example.org', '$2y$12$DA2XfIsuB.VvFWIvMQFXsuU3gOY64S3LU3AB65CNcc.xJglZgh3Ae', '1-971-905-7876', '1444 Bulah Row Suite 018\nNorth Sibylmouth, IL 51055-2170', 'seller', '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(3, 'Royal Ruecker', 'mac.dicki@example.net', '$2y$12$xlN1iaByhOE5Fv7AeUrYF.WbBvB8NQzocO0zd7P53WCqP12ylX7LG', '801.796.5464', '710 Turner Causeway Suite 429\nNorth Mabelborough, NH 58425', 'admin', '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(4, 'Uriah Ullrich II', 'ella91@example.com', '$2y$12$CuOt5Nv4/Mc7t4lz1a2SsemNzliadL3pVlT3e4xW2sKiIGhTxFGd2', '1-276-992-7302', '3853 Theodore Parkways Suite 898\nHassieberg, ND 05532-6769', 'customer', '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(5, 'Ms. Fabiola Becker Sr.', 'hans.mccullough@example.org', '$2y$12$Y94FYToebLfdxJ0TUIYrqedllMzqkJnQOdID1wVSG2lzGwWpKbMDy', '1-531-625-7954', '9756 Buckridge Fields\nSamantafort, NM 91370-1615', 'seller', '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(6, 'Emelia Rodriguez DDS', 'hkemmer@example.net', '$2y$12$0BNMcrhQ6NG85WYO.Pk74.g2fKK3nAQrJ2aVDMz7fT5qjOauSc5ua', '+1-878-989-4174', '5370 Madeline Mews Suite 568\nNorth Minerva, UT 63566-0759', 'customer', '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(7, 'Kamren Abernathy', 'nico.collins@example.com', '$2y$12$PiYlHZzU8K4AYa/4X3cZm.B0.KFOdvglRvQ3jN/B4VtrBJbVbPf72', '+12673490265', '601 Schaefer Light Suite 423\nWest Maxwell, NV 38359-0838', 'admin', '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(8, 'Austyn Vandervort MD', 'aglae23@example.org', '$2y$12$qc8ztPpDYqBIzrbfNARAhuV3cccJfS74mpjPdx.Lh8cVzWhhjMpoC', '+1 (435) 543-8349', '27432 Domenica Shore Suite 414\nBinsburgh, IA 13120-2743', 'customer', '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(9, 'Rigoberto Wuckert', 'jaime63@example.org', '$2y$12$7Ri9LtbmQR8Czt7tdk6/n.NfRiz1ff.WsRao4jmtRYlTw2nRlQeDa', '+14195929813', '4163 Metz Valley Apt. 299\nWest Emmanuel, MD 05776', 'seller', '2025-06-18 11:46:17', '2025-06-18 11:46:17'),
(10, 'Ms. Giovanna Stroman', 'nwintheiser@example.com', '$2y$12$IDuLsizC6kwqC/OXZ71IyuhkBKUwJ8RQClAKTTMwGJbAaXXteCzjC', '+1.239.603.5985', '971 Greenfelder Well\nPort Gregoriomouth, PA 84922', 'seller', '2025-06-18 11:46:17', '2025-06-18 11:46:17');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Chỉ mục cho bảng `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Chỉ mục cho bảng `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Chỉ mục cho bảng `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_order_id_foreign` (`order_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_seller_id_foreign` (`seller_id`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Chỉ mục cho bảng `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_user_id_foreign` (`user_id`),
  ADD KEY `reviews_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Chỉ mục cho bảng `shipping`
--
ALTER TABLE `shipping`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shipping_order_id_foreign` (`order_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `shipping`
--
ALTER TABLE `shipping`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `shipping`
--
ALTER TABLE `shipping`
  ADD CONSTRAINT `shipping_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
