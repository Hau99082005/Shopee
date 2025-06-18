-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 18, 2025 lúc 07:22 PM
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
(1, 1, 1, 3, '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(2, 1, 1, 1, '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(3, 1, 1, 5, '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(4, 1, 1, 2, '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(5, 1, 1, 4, '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(6, 1, 1, 4, '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(7, 1, 1, 5, '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(8, 1, 1, 1, '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(9, 1, 1, 3, '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(10, 1, 1, 5, '2025-06-18 10:10:54', '2025-06-18 10:10:54');

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
(1, 'qui', 'https://via.placeholder.com/640x480.png/000066?text=enim', 'Alice\'s shoulder, and it was very uncomfortable.', NULL, '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(2, 'minus', 'https://via.placeholder.com/640x480.png/007711?text=a', 'Alice was only a child!\' The Queen smiled and.', NULL, '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(3, 'expedita', 'https://via.placeholder.com/640x480.png/0055cc?text=aut', 'Gryphon only answered \'Come on!\' and ran till.', NULL, '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(4, 'iure', 'https://via.placeholder.com/640x480.png/008822?text=doloribus', 'White Rabbit, who said in an offended tone. And.', NULL, '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(5, 'eaque', 'https://via.placeholder.com/640x480.png/00bb99?text=non', 'And it\'ll fetch things when you throw them, and.', NULL, '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(6, 'quibusdam', 'https://via.placeholder.com/640x480.png/0099ff?text=labore', 'Hatter: \'it\'s very rude.\' The Hatter opened his.', NULL, '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(7, 'non', 'https://via.placeholder.com/640x480.png/00ccff?text=ut', 'AND WASHING--extra.\"\' \'You couldn\'t have wanted.', NULL, '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(8, 'dignissimos', 'https://via.placeholder.com/640x480.png/005588?text=saepe', 'HAVE tasted eggs, certainly,\' said Alice, a.', NULL, '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(9, 'ut', 'https://via.placeholder.com/640x480.png/004422?text=veritatis', 'Alice thought this must ever be A secret, kept.', NULL, '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(10, 'dolores', 'https://via.placeholder.com/640x480.png/0088cc?text=aspernatur', 'Mock Turtle said: \'advance twice, set to work.', NULL, '2025-06-18 10:10:54', '2025-06-18 10:10:54');

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
(13, '2025_06_18_172142_create_sessions_table', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `status` enum('pending','paid','shipped','cancelled') NOT NULL,
  `shipping_address` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `total_price`, `status`, `shipping_address`, `created_at`, `updated_at`) VALUES
(1, 1, 4602.88, 'cancelled', '886 Alfred Ville\nWolffton, IL 92332', '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(2, 1, 7745.92, 'cancelled', '34252 Beahan Plain\nNew Jennings, OR 06010', '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(3, 1, 4296.74, 'shipped', '72021 Dibbert Overpass Apt. 528\nAdahhaven, NC 58689', '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(4, 1, 4307.57, 'cancelled', '6610 Leuschke Points Apt. 737\nLake Armani, AR 71475', '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(5, 1, 1251.69, 'cancelled', '49773 Lehner Trail\nSouth Hunterborough, NV 73605', '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(6, 1, 7636.02, 'cancelled', '6880 Heaney Canyon Suite 227\nRempelfurt, AK 95425-9997', '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(7, 1, 6994.94, 'paid', '8401 VonRueden Fall Apt. 755\nLabadiefurt, CO 59548-7355', '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(8, 1, 173.40, 'pending', '67161 Dorothy Forest Apt. 689\nHammesside, MI 50320-6592', '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(9, 1, 4748.19, 'paid', '7691 Barrett Parks\nWalterfort, VA 97255', '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(10, 1, 2744.76, 'cancelled', '43978 Stiedemann Causeway Apt. 228\nAltenwerthshire, WV 69382-9577', '2025-06-18 10:10:54', '2025-06-18 10:10:54');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2, 670.06, '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(2, 1, 1, 5, 812.65, '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(3, 1, 1, 7, 346.54, '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(4, 1, 1, 2, 678.72, '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(5, 1, 1, 6, 915.95, '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(6, 1, 1, 8, 567.00, '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(7, 1, 1, 1, 814.69, '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(8, 1, 1, 10, 390.57, '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(9, 1, 1, 7, 147.16, '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(10, 1, 1, 3, 350.56, '2025-06-18 10:10:54', '2025-06-18 10:10:54');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `method` enum('credit_card','bank_transfer','momo') NOT NULL,
  `status` enum('pending','completed','failed') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `payments`
--

INSERT INTO `payments` (`id`, `order_id`, `amount`, `method`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 3738.15, 'bank_transfer', 'completed', '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(2, 1, 503.09, 'momo', 'failed', '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(3, 1, 8118.02, 'momo', 'pending', '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(4, 1, 2507.20, 'momo', 'completed', '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(5, 1, 8041.60, 'bank_transfer', 'failed', '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(6, 1, 3251.87, 'credit_card', 'pending', '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(7, 1, 5897.33, 'credit_card', 'failed', '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(8, 1, 1015.97, 'momo', 'pending', '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(9, 1, 6204.19, 'credit_card', 'failed', '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(10, 1, 1233.89, 'momo', 'pending', '2025-06-18 10:10:54', '2025-06-18 10:10:54');

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
(1, 'dolor', 'https://via.placeholder.com/640x480.png/008899?text=hic', 'She said this she looked at the sudden change, but she knew she had caught the flamingo and.', 317.300, 92, 1, 1, '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(2, 'quia', 'https://via.placeholder.com/640x480.png/00aaff?text=qui', 'Alice thought to herself, \'because of his shrill little voice, the name of the hall: in fact she.', 485.400, 71, 1, 1, '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(3, 'corporis', 'https://via.placeholder.com/640x480.png/00bb11?text=nam', 'Go on!\' \'I\'m a poor man, your Majesty,\' said Two, in a shrill, passionate voice. \'Would YOU like.', 636.690, 49, 1, 1, '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(4, 'perferendis', 'https://via.placeholder.com/640x480.png/006633?text=ducimus', 'They all returned from him to you, Though they were gardeners, or soldiers, or courtiers, or three.', 630.190, 86, 1, 1, '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(5, 'et', 'https://via.placeholder.com/640x480.png/00bb77?text=eum', 'I do it again and again.\' \'You are all dry, he is gay as a cushion, resting their elbows on it, or.', 924.570, 45, 1, 1, '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(6, 'dolor', 'https://via.placeholder.com/640x480.png/0000ee?text=dolor', 'Alice said to herself. \'I dare say you\'re wondering why I don\'t remember where.\' \'Well, it must be.', 698.480, 4, 1, 1, '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(7, 'minus', 'https://via.placeholder.com/640x480.png/00dd66?text=totam', 'Duchess said in a melancholy tone: \'it doesn\'t seem to have him with them,\' the Mock Turtle sang.', 98.340, 98, 1, 1, '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(8, 'reprehenderit', 'https://via.placeholder.com/640x480.png/0022dd?text=necessitatibus', 'March Hare and his friends shared their never-ending meal, and the jury consider their verdict,\'.', 499.050, 96, 1, 1, '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(9, 'est', 'https://via.placeholder.com/640x480.png/00dd99?text=doloremque', 'Quick, now!\' And Alice was silent. The Dormouse shook itself, and was a dead silence instantly.', 697.120, 90, 1, 1, '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(10, 'a', 'https://via.placeholder.com/640x480.png/00ff33?text=assumenda', 'I almost wish I\'d gone to see the Hatter and the party were placed along the sea-shore--\' \'Two.', 239.100, 11, 1, 1, '2025-06-18 10:10:54', '2025-06-18 10:10:54');

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
(1, 1, 'https://via.placeholder.com/640x480.png/0088ff?text=quo', '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(2, 1, 'https://via.placeholder.com/640x480.png/00aabb?text=saepe', '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(3, 1, 'https://via.placeholder.com/640x480.png/0066ff?text=cupiditate', '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(4, 1, 'https://via.placeholder.com/640x480.png/00dd77?text=consectetur', '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(5, 1, 'https://via.placeholder.com/640x480.png/0055cc?text=ab', '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(6, 1, 'https://via.placeholder.com/640x480.png/00ffaa?text=cumque', '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(7, 1, 'https://via.placeholder.com/640x480.png/002211?text=ducimus', '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(8, 1, 'https://via.placeholder.com/640x480.png/000000?text=delectus', '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(9, 1, 'https://via.placeholder.com/640x480.png/003388?text=autem', '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(10, 1, 'https://via.placeholder.com/640x480.png/001188?text=quaerat', '2025-06-18 10:10:54', '2025-06-18 10:10:54');

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
(1, 1, 1, 3, NULL, '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(2, 1, 1, 3, NULL, '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(3, 1, 1, 5, NULL, '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(4, 1, 1, 5, NULL, '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(5, 1, 1, 3, NULL, '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(6, 1, 1, 2, NULL, '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(7, 1, 1, 5, NULL, '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(8, 1, 1, 5, NULL, '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(9, 1, 1, 5, NULL, '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(10, 1, 1, 1, NULL, '2025-06-18 10:10:54', '2025-06-18 10:10:54');

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

--
-- Đang đổ dữ liệu cho bảng `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('negT2bDe9S0sQvt2jNLefkFQFimLRGIkajU4Tn8w', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWHd6aW9tTG1kQlQwYmFsVzZNTkJxOUNDbzd6RllCTWFiTjFIQWh4eCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1750267308);

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
(1, 1, 'King, Moore and Mann', 'ac3c25ab-986f-369a-acad-57dfa0949491', 'shipped', '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(2, 1, 'Lowe, Wintheiser and Fisher', 'fce0b58d-481b-3d19-8c9d-8f4ba9b01ef3', 'shipped', '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(3, 1, 'Greenholt Group', '93392d4d-326d-3f8b-be97-d4b9100eaba8', 'delivered', '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(4, 1, 'Monahan-Baumbach', '0ca787c8-7bd1-3ded-a21e-3038569bfcde', 'delivered', '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(5, 1, 'Feeney-Pollich', '23f32970-7d65-3cfe-a75d-887b7c515ca0', 'delivered', '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(6, 1, 'Veum-Anderson', 'f95c8b85-973d-3a60-b81d-0d59d1d58a9f', 'processing', '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(7, 1, 'Brown Group', '57829bd5-8f8b-348d-938f-d63c6514a5e8', 'processing', '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(8, 1, 'Walker Group', 'aa5a264e-fad9-3ad9-8ce3-e8a7dc34e87f', 'delivered', '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(9, 1, 'Dooley, Kshlerin and Blanda', 'b0949f01-7bca-377b-bdd8-911a60f18ce5', 'delivered', '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(10, 1, 'Cremin-Herman', '42fc8a16-b7f7-3ceb-9539-9527cae88efb', 'processing', '2025-06-18 10:10:54', '2025-06-18 10:10:54');

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
(1, 'Dr. Mylene Paucek', 'jroob@example.net', '$2y$12$ixLcN193vw1xM9VPUPftse7Ht4vaOdKSxMzVxzJvJcabs2DoWIpoK', '1-432-692-6370', '3615 Bednar Junction\nNew Shaina, MN 08797-7777', 'customer', '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(2, 'Mrs. Carmella Friesen DDS', 'herta59@example.net', '$2y$12$pYrRL5JAKYmjib7sYGBEuuydqZD2Ui.lJ07DesNez6H9FyEpsDDXW', '305-784-9673', '930 McKenzie Passage\nNorth Teresa, SC 73293-3779', 'customer', '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(3, 'Seth Beatty', 'kilback.jessica@example.com', '$2y$12$raNJGqXCelmYU6TqVtb8EOD4D6bgePBZae85GOVBAU5qaXgSShemq', '+1-947-322-1536', '4030 Turcotte Shore Apt. 340\nYundtfort, AZ 11726', 'admin', '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(4, 'Miracle Moore', 'trevor.lockman@example.net', '$2y$12$7pDVtxYwWRMn3cnJUZyBNeiQuAp/dM09v1XmakPKHbLYgHXPPFx0G', '+1.272.312.5226', '64827 Lang Unions Apt. 569\nMarksport, IN 68547', 'customer', '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(5, 'Cameron O\'Kon', 'eula.farrell@example.com', '$2y$12$SpLeirvmJjRXjbFj9qB6/e5G1kaIx9XCEuaAuluDjtYpjJCRAOoIC', '+1-320-902-2148', '21961 Will Villages\nNorth Merle, TN 77643-2281', 'admin', '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(6, 'Yesenia Ortiz', 'alicia12@example.org', '$2y$12$dc3Stn4mKWc91MAU/0aNQOo2qTON3LFmH9uZ9SNIdPDZKKICaX/su', '1-607-798-4971', '886 Noelia Fork Apt. 931\nLuettgenfort, TN 60961', 'seller', '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(7, 'Prof. Jermey Turner Sr.', 'josephine.larson@example.com', '$2y$12$JGrUPjXeofuK7UMCbCTP/OkgDcCeDmt4zoWrTOlVvfkXj/rkzTCR.', '1-845-901-1721', '2219 Turcotte Radial\nWest Priscillafort, GA 05229-8319', 'admin', '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(8, 'Johnathan Bernhard', 'monahan.jovanny@example.com', '$2y$12$K3Pa21uFeA5OZnxN83xpGuNZdrqGD/Mi5ZlI4625oTsiEhuDGoX6e', '(201) 722-7591', '23536 Heller Point Suite 390\nGrahamtown, VT 32757-0763', 'seller', '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(9, 'Dr. Willy Padberg', 'mckenna28@example.org', '$2y$12$FT4SidB2JmRmSCToIuuofuiaYJPuyStHj4jprx57U3K2/t3Z29NWO', '1-678-633-6454', '55790 Deckow Tunnel Apt. 292\nFerryberg, GA 78636-2137', 'customer', '2025-06-18 10:10:54', '2025-06-18 10:10:54'),
(10, 'Judson Ziemann', 'bill.buckridge@example.org', '$2y$12$n4yIIkfWsKMkdjrglKbS7uOxiBAUIVAUmdwdei3htRjqtVVme0Oc.', '860.853.8863', '531 Denesik Rest\nRozellachester, CT 02533-4145', 'customer', '2025-06-18 10:10:54', '2025-06-18 10:10:54');

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
