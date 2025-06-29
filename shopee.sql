-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 29, 2025 lúc 10:27 AM
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
-- Cấu trúc bảng cho bảng `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `banners`
--

INSERT INTO `banners` (`id`, `title`, `image`, `link`, `created_at`, `updated_at`) VALUES
(1, 'banner', 'anh1.jpg', NULL, NULL, NULL),
(2, 'banner1', 'banner1.png', NULL, '2025-06-29 06:35:09', '2025-06-29 06:35:09'),
(3, 'banner3', 'banner3.jpg', NULL, '2025-06-29 06:36:02', '2025-06-29 06:36:02'),
(4, 'banner5', 'banner5.jpg', NULL, '2025-06-29 06:36:27', '2025-06-29 06:36:27'),
(6, 'banner', 'banner7.png', NULL, '2025-06-29 06:37:27', '2025-06-29 06:37:27'),
(7, 'banner', 'banner8.jpg', NULL, '2025-06-29 06:38:00', '2025-06-29 06:38:00'),
(8, 'banner', 'banner9.jpg', NULL, '2025-06-29 06:38:36', '2025-06-29 06:38:36');

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
(1, 'Thời trang nam', 'thời trang nam.webp', 'Thời trang nam', NULL, '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(2, 'Điện thoại & Phụ Kiện', 'điện thoại.webp', 'Điện thoại và phụ kiện', NULL, '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(3, 'Thiết Bị Điện Tử', 'dien tu.webp', 'Thiết Bị Điện Tử', NULL, '2025-06-27 18:05:05', '2025-06-27 18:05:05'),
(4, 'Máy tính và laptop', 'máy tính và laptop.webp', 'Máy tính và laptop', NULL, '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(5, 'Máy ảnh và quay phim', 'máy ảnh và quay phim.webp', 'Máy ảnh và quay phim', NULL, '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(6, 'Đồng Hồ', 'dong ho.webp', 'Đồng Hồ', NULL, '2025-06-27 18:05:05', '2025-06-27 18:05:05'),
(7, 'Giày Dép Nam', 'giay dep nam.webp', 'Giày Dép Nam', NULL, '2025-06-27 18:05:05', '2025-06-27 18:05:05'),
(8, 'Thiết Bị Điện Gia Dụng', 'thiet bi.webp', 'Thiết Bị Điện Gia Dụng', NULL, '2025-06-27 18:05:05', '2025-06-27 18:05:05'),
(9, 'Thể Thao & Du Lịch', 'the thao.webp', 'Thể Thao & Du Lịch', NULL, '2025-06-27 18:05:05', '2025-06-27 18:05:05'),
(10, 'Ô Tô & Xe Máy & Xe Đạp', 'o to.webp', 'Ô Tô & Xe Máy & Xe Đạp', NULL, '2025-06-27 18:05:05', '2025-06-27 18:05:05'),
(11, 'Balo & Túi Ví Nam', 'balo.webp', 'Balo & Túi Ví Nam', NULL, '2025-06-27 18:05:05', '2025-06-27 18:05:05'),
(12, 'Đồ Chơi', 'do choi.webp', 'Đồ Chơi', NULL, '2025-06-27 18:05:05', '2025-06-27 18:05:05'),
(13, 'Chăm Sóc Thú Cưng', 'cham soc.webp', 'Chăm Sóc Thú Cưng', NULL, '2025-06-27 18:05:05', '2025-06-27 18:05:05'),
(14, 'Giặt Giũ & Chăm Sóc Nhà Cửa', 'giac giu.webp', 'Giặt Giũ & Chăm Sóc Nhà Cửa', NULL, '2025-06-27 18:05:05', '2025-06-27 18:05:05'),
(15, 'Voucher & Dịch Vụ', 'voucher.webp', 'Voucher & Dịch Vụ', NULL, '2025-06-27 18:05:05', '2025-06-27 18:05:05'),
(16, 'Thời Trang Nữ', 'thoi trang nu.webp', 'Thời Trang Nữ', NULL, '2025-06-27 18:05:05', '2025-06-27 18:05:05'),
(17, 'Mẹ & Bé', 'me.webp', 'Mẹ & Bé', NULL, '2025-06-27 18:05:05', '2025-06-27 18:05:05'),
(18, 'Nhà Cửa & Đời Sống', 'nha cua.webp', 'Nhà Cửa & Đời Sống', NULL, '2025-06-27 18:05:05', '2025-06-27 18:05:05'),
(19, 'Sắc Đẹp', 'sac dep.webp', 'Sắc Đẹp', NULL, '2025-06-27 18:05:05', '2025-06-27 18:05:05'),
(20, 'Sức Khỏe', 'suc khoe.webp', 'Sức Khỏe', NULL, '2025-06-27 18:05:05', '2025-06-27 18:05:05'),
(21, 'Giày Dép Nữ', 'giay dep nu.webp', 'Giày Dép Nữ', NULL, '2025-06-27 18:05:05', '2025-06-27 18:05:05'),
(22, 'Túi Ví Nữ', 'tui vi.webp', 'Túi Ví Nữ', NULL, '2025-06-27 18:05:05', '2025-06-27 18:05:05'),
(23, 'Phụ Kiện & Trang Sức Nữ', 'phu kien.webp', 'Phụ Kiện & Trang Sức Nữ', NULL, '2025-06-27 18:05:05', '2025-06-27 18:05:05'),
(24, 'Bách Hóa Online', 'bach hoa.webp', 'Bách Hóa Online', NULL, '2025-06-27 18:05:05', '2025-06-27 18:05:05'),
(25, 'Nhà Sách Online', 'sach.webp', 'Nhà Sách Online', NULL, '2025-06-27 18:05:05', '2025-06-27 18:05:05'),
(26, 'Thời Trang Trẻ Em', 'thoi trang tre em.webp', 'Thời Trang Trẻ Em', NULL, '2025-06-27 18:05:05', '2025-06-27 18:05:05'),
(27, 'Dụng cụ và thiết bị tiện ích', 'dung cu.webp', 'Dụng cụ và thiết bị tiện ích', NULL, '2025-06-27 18:05:05', '2025-06-27 18:05:05');

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
(13, '2025_06_18_172142_create_sessions_table', 1),
(15, '2025_06_29_000001_create_product_details_table', 2),
(16, '2024_06_18_200000_create_banners_table', 3);

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
(1, 1, 4578.900, 'paid', '4163 Vada Overpass\nNorth Orie, MS 58616-9977', '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(2, 1, 4547.080, 'paid', '18496 Gutmann Ports\nPort Devante, MO 83088', '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(3, 1, 4487.210, 'cancelled', '1481 Kim Via Apt. 821\nSimonisview, OK 25150-0977', '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(4, 1, 1294.900, 'cancelled', '289 Weber Oval\nBogantown, NY 59454-7527', '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(5, 1, 8665.600, 'shipped', '752 Juston Point Suite 652\nWest Eugeneberg, MI 50155-6516', '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(6, 1, 6905.190, 'pending', '108 Lyric Roads\nSouth Leila, MD 76189', '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(7, 1, 8869.020, 'paid', '4483 Hettinger Glens\nWest Douglasshire, MN 56434-7095', '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(8, 1, 6038.980, 'paid', '33282 Leonard Burgs\nEast Bo, GA 79080-8026', '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(9, 1, 2053.120, 'paid', '2702 Jerde Brooks Apt. 431\nKuhntown, NE 43612', '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(10, 1, 4885.940, 'pending', '1654 Morar Tunnel Suite 517\nKundeton, AZ 73833', '2025-06-23 19:15:08', '2025-06-23 19:15:08');

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
(1, 1, 1, 5, 999.380, '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(2, 1, 1, 7, 490.130, '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(3, 1, 1, 1, 435.830, '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(4, 1, 1, 2, 994.820, '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(5, 1, 1, 8, 105.870, '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(6, 1, 1, 2, 664.640, '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(7, 1, 1, 7, 486.500, '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(8, 1, 1, 2, 282.970, '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(9, 1, 1, 3, 659.660, '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(10, 1, 1, 6, 515.940, '2025-06-23 19:15:08', '2025-06-23 19:15:08');

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
(1, 1, 6315.850, 'bank_transfer', 'completed', '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(2, 1, 3492.510, 'credit_card', 'completed', '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(3, 1, 5122.270, 'momo', 'failed', '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(4, 1, 2982.640, 'bank_transfer', 'failed', '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(5, 1, 8093.290, 'momo', 'completed', '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(6, 1, 7423.160, 'momo', 'pending', '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(7, 1, 6198.200, 'credit_card', 'failed', '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(8, 1, 1132.270, 'momo', 'completed', '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(9, 1, 4780.300, 'bank_transfer', 'pending', '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(10, 1, 7010.440, 'bank_transfer', 'completed', '2025-06-23 19:15:08', '2025-06-23 19:15:08');

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
  `price_old` decimal(10,3) NOT NULL,
  `stock` int(11) NOT NULL,
  `seller_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `image`, `description`, `price`, `price_old`, `stock`, `seller_id`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'Áo Thun Polo Nam Thêu Chữ U,Chất Liệu Thấm Hút Mồ Hôi,Cổ Phối Màu', 'vn-11134207-7r98o-lrol6kavr6hl42.webp', 'CAM KẾT - ĐẢM BẢO:\n\n- Đảm bảo vải chuẩn cotton chất lượng cao.\n\n- Hàng có sẵn, giao hàng ngay khi nhận được đơn đặt hàng .\n\n- Hoàn tiền 100% nếu sản phẩm lỗi, nhầm hoặc không giống với mô tả.\n\n- Chấp nhận đổi hàng khi size không vừa (vui lòng nhắn tin riêng cho shop).\n\n- Giao hàng toàn quốc, thanh toán khi nhận hàng.\n\n- Hỗ trợ đổi trả theo quy định của Shopee.\n\nCAM KẾT - ĐẢM BẢO:\n\n- Đảm bảo vải chuẩn cotton chất lượng cao.\n\n- Hàng có sẵn, giao hàng ngay khi nhận được đơn đặt hàng .\n\n- Hoàn tiền 100% nếu sản phẩm lỗi, nhầm hoặc không giống với mô tả.\n\n- Chấp nhận đổi hàng khi size không vừa (vui lòng nhắn tin riêng cho shop).\n\n- Giao hàng toàn quốc, thanh toán khi nhận hàng.\n\n- Hỗ trợ đổi trả theo quy định của Shopee.', 39.000, 81.000, 426, 1, 1, '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(2, 'Áo sơ mi nam kiểu dáng basic TOPMEN khoác ngoài chất vải kaki cao cấp trẻ trung năng động phù hợp cả mặc đi làm, đi chơi', 'ao_so_mi.webp', '\n   SHOP CAM KẾT\n- Sản phẩm Áo sơ mi kaki basic giống mô tả 100%\n- Hình ảnh sản phẩm là ảnh thật, các hình hoàn toàn do shop tự thiết kế.\n- Kiểm tra  cẩn thận trước khi gói hàng giao cho Quý Khách\n- Hàng có sẵn, giao hàng ngay khi nhận được đơn \n- Hoàn tiền nếu sản phẩm không giống với mô tả\n- Chấp nhận đổi hàng khi size không vừa trong 3 ngày.\n\n   HỖ TRỢ ĐỔI TRẢ THEO QUY ĐỊNH CỦA SHOPEE\n- Điều kiện áp dụng (trong vòng 2 ngày kể từ khi nhận sản phẩm) \n- Hàng hoá bị rách, in lỗi, bung chỉ, và các lỗi do vận chuyển hoặc do nhà sản xuất.\n1. Trường hợp được chấp nhận: \n- Hàng giao sai size khách đã đặt hàng \n- Giao thiếu hàng \n2. Trường hợp không đủ điều kiện áp dụng chính sách: \n- Quá 2 ngày kể từ khi Quý khách nhận hàng \n- Gửi lại hàng không đúng mẫu mã, không phải sản phẩm của shop\n- Không thích, không hợp, đặt nhầm mã, nhầm màu,... ', 99.000, 100.000, 89, 1, 4, '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(3, 'Bộ Đồ Nam Nữ Unisex Mùa Hè Ngắn Tay Cổ Tròn Họa Tiết Loang Vẩy Sơn Hot Trend Thời Trang Zenkonu QA NAM 104', '132909f048482d8d984a069b76f58788.webp', 'Bộ Đồ Nam Nữ Unisex Mùa Hè Ngắn Tay Cổ Tròn Họa Tiết Loang Vẩy Sơn Hot Trend Thời Trang Zenkonu QA NAM 104\n\n* THÔNG TIN SẢN PHẨM:\n\n🔸Chât liệu: vải thun lạnh mềm mại.\n\n🔸 Kích thước: XS   S   M   L    XL\n\n🔸 Xuất xứ: Việt Nam\n\nVới thiết kế trẻ trung năng động, phù hợp nhiều hoàn cảnh, phong cách Ulzzang cập nhập xu hướng mới nhất.\n\n* Chi tiết Size:\n\nSize XS: cho bạn có cân nặng từ 40 - 45kg tùy chiều cao \n\nSize S: cho bạn có cân nặng từ 45 - 50kg tùy chiều cao \n\nSize M: cho bạn có cân nặng từ 50 - 55kg tùy chiều cao \n\nSize L: cho bạn có cân nặng từ 55 - 60kg tùy chiều cao \n\nSize XL: cho bạn có cân nặng từ 60 - 65kg tùy chiều cao \n\n🔰 Thông tin thêm:\n\n- Để bảo quản áo cũng như chất liệu hình in, shop khuyên bạn lộn mặt trái khi giặt và ủi nha\n\n- Bảng size chỉ mang tính chất tham khảo, tùy thuộc hình thể mỗi người và chất liệu nên có chênh lệch. Hãy ibox cho shop khi cần tư vấn cụ thể nha ^^\n\n Hãy theo dõi để ủng hộ shop và cập nhập các chương trình khuyến mãi cũng như các mẫu sản phẩm mới nhất của shop nhé!\n\n🔸 Lưu ý: Shop chỉ hỗ trợ xử lý đơn hàng đổi trả trong vòng 15 ngày kể từ khi giao hàng thành công!', 55.000, 145.000, 173, 1, 2, '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(4, '🔥 SỐC 🔥 Thắt lưng nam da cao cấp khóa hợp kim tự động sang trọng lịch lãm - Nịt da bảo hành 12 tháng', 'vn-11134207-7r98o-ls5qxklob6ah16.webp', 'Hatter. \'He won\'t stand beating. Now, if you like!\' the Duchess said in a coaxing tone, and everybody else. \'Leave off that!\' screamed the Gryphon. \'Turn a somersault in the pool as it went. So she.', 1.000, 10.000, 89, 1, 5, '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(5, 'ÁO THUN TRƠN ĐEN TRẮNG BASIC NAM NỮ CỔ TRÒN BAO MỊN', '924d38318e94fa9d48017a0d9ee237b7.webp', 'Anubis Store - UNISEX CLOTHING - MẪU MÃ LẠ - CUNG CẤP VÀ IN ẤN ÁO THUN THEO YÊU CẦU CHO CÁ NHÂN, DOANH NGHIỆP, TEAMBUILDING\n\nLƯU Ý CHO SẢN PHẨM:\n\n- VUỐT ẢNH SANG BÊN PHẢI ĐỂ XEM CÁC MẪU \n\n✔ Nếu khách muốn mặc áo theo dạng form rộng, theo chuẩn xu hướng hiện nay, xin vui lòng chọn lớn hơn từ 1-2 size\n\n+ Mặc ở nhà, đi tập thể thao, hay kết hợp với quần/váy... đều đẹp\n\n+ Size cơ bản theo chuẩn quốc tế cho UNISEX (cả nam và nữ)\n\n+ Có các Size: S M L XL XXL ( ib size hoặc ghi chú size trong đơn hàng giúp shop nha)\n\n+ Có cả size cho 110kg, lh shop lấy link bigsize nhen hoặc vào shop xem ạ\n\n✔ Với đơn hàng từ 50k, bạn được add mã MIỄN PHÍ VẬN CHUYỂN của Shopee phát hành vào đơn hàng.\n\n------ Size tham khảo: (Lưu Ý: đây là áo form suông vừa, không rộng.Nếu Khách muốn mặc rộng vui lòng đặt lớn hơn 1 size)\n\n▶ QUYỀN LỢI CỦA KHÁCH HÀNG:\n\n✔ Được mua sản phẩm đúng như trên ảnh và đúng như mô tả.\n\n✔ Mọi thắc mắc xin hãy vui lòng nhắn tin cho Shop, Shop sẽ tư vấn cho bạn nhiệt tình, bất kể ngày đêm.\n\n✔ Nếu sản phẩm của Shop gửi sai hoặc phát sinh lỗi, Shop sẽ hỗ trợ đổi trả ngay và luôn, không lòng vòng.\n\n\n\nXIN CẢM ƠN QUÝ KHÁCH ĐÃ THAM KHẢO !\n\n #aothungiasi #aothunnam #aothuncotron #aothuncotton #aothunin #aothunnu #ao #thoitrangnamnu #aothun #aothuningiasi #Anubis Store #aothuntrend #aothun #aothuntron #aoanime #unisex \n\naothun #unisex #freesize #taylo #ao #thun #anhstore #inhinh #hanquoc #formrong #fullbox #aothununisex #aothuntaylo #aophong #nam #nu #tay #lo #phong #dai #ngan #form #rong #co #tron\n\n#aothunnam #aothun #aophong #taylo #aothunnu #taydai #aophongnu #aothununisex #aoformrong #aophongrong #aocotron #cotton #trang #tron #dep #cotron #aothunrong #den #cao #cap #caocap #aotee #tee #nelly #aodoi #oversize #in #hinh #inhinh', 55.000, 150.000, 144, 1, 4, '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(6, 'Áo thun nam nữ tay lỡ Angel Devil, áo phông cotton from rộng freesize unisex AD-Trend', 'vn-11134207-7r98o-lssn4ws9k8g422@resize_w900_nl.webp', '\nTHÔNG TIN SẢN PHẨM:\n• Áo thun nam nữ unisex tay lỡ Angel Devil, áo phông cotton freesize AD-Trend\n• Kiểu dáng: Unisex, Freesize, Tay lỡ, Form rộng\n• Xuất sứ: Việt Nam\n• Chất liệu: Poly , cotton co dãn, không xù\n• Họa tiết: In\n• Màu sắc: Đen, Trắng\n\nSIZE: M, L, XL:\nUnisex form rộng có 3 size phù hợp hầu hết mọi lứa tuổi:\n• Size M: Dài 67Cm, Rộng 51Cm, Dài tay áo 25Cm (Dưới 1m6, dưới 46Kg)\n• Size L: Dài 70Cm, Rộng 53Cm, Dài tay áo 25Cm (1m6 - 1m7, 46Kg - 65Kg)\n• Size XL: Dài 73Cm, Rộng 56Cm, Dài tay áo 25Cm (1m7 - 1m75, 66Kg - 75Kg)\n\n\nJIMY OFFICIAL CAM KẾT:\n• Form dáng của sản phẩm đẹp chuẩn như hình.\n• Đảm bảo vải chất lượng Poly, cotton.\n• Tất cả các đơn hàng trước khi gửi đi đều được kiểm tra kĩ lưỡng, đóng gói cẩn thận.\n• Hàng có sẵn, giao hàng ngay khi nhận được đơn.\n• Giao hàng toàn quốc, nhận hàng thanh toán.\n• Hỗ trợ trả hàng trong 6 ngày (Từ khi nhận hàng)\n\nDo màn hình và điều kiện ánh sáng khác nhau, màu sắc thực tế của sản phẩm có thể chênh lệch khoảng 3-5%', 29.000, 50.000, 195, 1, 2, '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(7, 'Bộ Quần Áo Nam HDSHOP Đồ Bộ Nam Cộc Tay ICON DSQ Hoạ Tiết Chất Vải Cotton Cao Cấp Co Dãn 2 màu đen Trắng', 'vn-11134207-7ra0g-m92y54emdojm13.webp', 'Bộ Hè Nam HDSHOP Bộ Quần Áo Nam Mùa hè BỘ Nam ICON DSQ Hoạ Tiết Chất Vải Cotton Cao Cấp Co Dãn 2 Màu Đen Trắng\n\n\n\n⚠️ LƯU Ý ⚠️ Sản phẩm shop đều chỉ bán hàng loại 1 bộ nam chất vải thun thể thao co dãn phong cách đạt tiêu chuẩn tránh nhầm lẫn với các hàng loại 2,của các shop khác  giá rẻ nhái mẫu tràn lan ngoài thị trường chất lượng kém nhanh bai gião, xù lông xù chỉ bai màu.mẫu bên shop đều in 3d trên áo sẽ In 3d hoặc thêu Theo từng mẫu.\n\n\n\n🌈 Đồ Bộ NAM NỮ CHUẨN FORM DÁNG HÀN QUỐC Năng Đông Trẻ Chung HOT TREND \n\n\n\n\n\n✔️ Chất Liệu: Poly Cotton Thể Thao Cotton Co Dãn\n\n✔️ Kiểu dáng: Đồ bộ nam thể thao basic cực dễ phối đồ .phù hợp mặc ở nhà đi chơi dã ngoại\n\n✔️ Thiết Kế Độc Đáo:Bộ nam Thêu hoăc in 3d ko bị bay màu  cực cá tính và phong cách,...\n\n✔️ Màu sắc: Đồ Bộ  Nam Nữ Đủ màu basic cực dễ tôn da tôn dáng, phối đồ,...\n\n\n\n✔️ HƯỚNG DẪN CHỌN SIZE: Đồ Bộ Nam Thể Thao Phong Cách\n\n- Size M từ35 45kg, cao dưới 1m6 / dài 66cm, rộng 51cm, \n\n- Size L từ45.62kg, cao dưới 168 / dài 68cm, rộng 52cm, \n\n- Size XL từ 63.73 kg,cao dưới 1m71 / dài 71cm, rộng 54cm,\n\n- Size XXL Cao 1m70 - 1m80. dưới 85kg. dài 75cm, rộng 56cm', 99.750, 185.760, 307, 1, 5, '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(8, 'Đồ Bộ Nam HD shop Bộ Quần Áo Nam Ngắn Tay In Hình Tia sét Chất Vải Thun Thể Thao Cotton Cao Cấp Co Dãn 4 Chiều', 'vn-11134201-7r98o-ly4fvv1pz26bf0.webp', 'Bộ Nam Hè - Đồ Bộ Nam Ngắn Tay In Hình Tia set Chất Vải Thun Thể Thao Cotton Cao Cấp Co Dãn 4 Chiều MÃ TiasET\n\n\n\nSize M - L - XL\n\nGiá rẻ nhất thị trường,\n\nmọi người thấy shop khác rẻ hơn cũng đừng vội đánh giá, vì chất lượng chưa chắc đã phải hàng cao cấp.\n\n  \n\n✔️ Tên Đơn Vị Sản Xuất : Xưởng May Hoang Duy\n\n✔️ Địa Chỉ Sản Xuất: Xóm 8 Mỹ Thắng Mỹ Lộc Nam Định\n\n\n\n\n\nChất liệu: Thun lạnh cao cấp, hàng vải xuất dư, hàng may công ty với đường may chắc chắn, chữ ép logo decal rất bền ko bong khi giặt, sản phẩm không bài không xù khi giặt, có thể giặt máy thoải mái nha quý khách. Là hàng đẹp nên khách không nên so sánh giá với những loại rẻ tiền chất liệu thông thường hay loại freesize ạ. Size số chuẩn và form to nha khách.\n\n\n\n• Thiết kế : 3 size\n\nSize M : Từ 45 – 53 Kg\n\nSize L  : Từ 54 – 60Kg\n\nSize XL: Từ 60– 75kg\n\nLƯU Ý: Size shop ghi là tham khảo theo cân nặng, Bạn nào béo, cao, có bụng, thích mặc phom rộng hoặc ôm thì còn tùy thuộc vào chiều cao,vui lòng chat với shop\n\nđể được tư vấn.\n\n➡️Thiết kế thể thao sang trọng - thoải mái\n\n➡️Hàng đảm bảo y hình 100%', 65.000, 150.000, 227, 1, 1, '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(9, 'Đồ Bộ Nam Hè.hdshop đồ Bộ Nam Hè Tia Sét Phối Tay Thể Thao Đủ Size Chất Vải Thun Cotton Co Dãn 2 Màu Đen Trắng', 'vn-11134211-7r98o-lswwnyefqax0ba.webp', 'Đồ Bộ Nam Hè. Bộ Nam Mùa Hè Tia Sét Phối Tay Thể Thao Đủ Size Chất Vải Thun Cotton Co Dãn 2 Màu Đen Trắng\n\n\n\n⚠️ LƯU Ý ⚠️ Sản phẩm shop đều chỉ bán hàng loại 1 bộ nam chất vải thun thể thao co dãn phong cách đạt tiêu chuẩn tránh nhầm lẫn với các hàng loại 2,của các shop khác  giá rẻ nhái mẫu tràn lan ngoài thị trường chất lượng kém nhanh bai gião, xù lông xù chỉ bai màu.mẫu bên shop đều in 3d trên áo sẽ In 3d hoặc thêu Theo từng mẫu.', 89.000, 100.000, 246, 1, 1, '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(10, '⚡️ Sốc ⚡️Thắt lưng mặt xoay nam thắt lưng nam cao cấp 007xmen - Nịt nam thời trang dây nịt da khóa tự động', 'vn-11134207-7ras8-m2fnqdxc5meq01@resize_w900_nl.webp', '⚡️ Sốc ⚡️Thắt lưng mặt xoay nam thắt lưng nam cao cấp 007xmen - Nịt nam thời trang dây nịt da khóa tự động\n\n\n\nShop luôn cập nhật những mẫu mã thắt lưng nam mặt xoay mới nhất, hot nhất thị trường, khách hàng hãy ấn theo dõi shop để xem đc các sản phẩm dây lưng nam cao cấp mới nhất nhé.', 10.000, 20.000, 385, 1, 5, '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(11, 'HIP Áo thun ngắn tay local brand fashion áo phông nam nữ unisex bigsize vintage 230g cotton', 'vn-11134207-7r98o-lxnnny0wnw7tb9.webp', 'HIPHOPPUNKS CAM KẾT:\r\n﻿\r\n◾ Chất liệu vải Cotton 100% co dãn 2 chiều, Định lượng cao 230gsm, \r\n﻿\r\n◾ Vải chính phẩm đã qua xử lý co rút, và lông thừa\r\n﻿\r\n◾ chất vải mềm mịn dày nhưng cực kì mát và không xù\r\n﻿\r\n◾ Hoàn tiền nếu sản phẩm không giống với mô tả\r\n﻿\r\n◾ Nam và Nữ đều mặc được, form áo rộng chuẩn TAY LỠ UNISEX cực đẹp\r\n﻿', 88.000, 99.000, 140, 1, 1, '2025-06-18 03:57:51', '2025-06-17 03:57:51'),
(12, 'Bộ Đồ Nam Nữ Unisex Mùa Hè Ngắn Tay Cổ Tròn Họa Tiết Loang Vẩy Sơn Hot Trend Thời Trang Zenkonu QA NAM 104', '132909f048482d8d984a069b76f58788 (1).webp', 'Bộ Đồ Nam Nữ Unisex Mùa Hè Ngắn Tay Cổ Tròn Họa Tiết Loang Vẩy Sơn Hot Trend Thời Trang Zenkonu QA NAM 104', 55.000, 100.000, 245, 1, 1, '2025-06-28 04:00:43', '2025-06-28 04:00:43'),
(13, 'Áo Polo Nam Phối Cổ From Rộng In Chữ Trước Ngực Chất Cotton Thoáng Mát Thời Trang Zenkonu TOP NAM 351V1', 'vn-11134207-7r98o-lrs8uwy6b5w900.webp', 'Áo Polo Nam Phối Cổ From Rộng In Chữ Trước Ngực Chất Cotton Thoáng Mát Thời Trang Zenkonu TOP NAM 351V1\r\n\r\n* THÔNG TIN SẢN PHẨM:\r\n\r\n🔸Chât liệu: vải tô ong co giãn, thấm hút mồ hôi.\r\n\r\n🔸 Kích thước:  M   L    XL\r\n\r\n🔸 Xuất xứ: Việt Nam\r\n\r\nVới thiết kế trẻ trung năng động, phù hợp nhiều hoàn cảnh, phong cách Ulzzang cập nhập xu hướng mới nhất.\r\n\r\n* Chi tiết Size:\r\n\r\nSize M: cho bạn có cân nặng từ 50 - 58kg tùy chiều cao, Dài 69, Rộng 57, Vải 56\r\n\r\nSize L: cho bạn có cân nặng từ 59 - 64kg tùy chiều cao, Dài 70, Rộng 58, Vải 57\r\n\r\nSize XL: cho bạn có cân nặng từ 65 - 70kg tùy chiều cao, Dài 71, Rộng 59, Vai 58\r\n\r\n🔰 Thông tin thêm:\r\n\r\n- Để bảo quản áo cũng như chất liệu hình in, shop khuyên bạn lộn mặt trái khi giặt và ủi nha\r\n\r\n- Bảng size chỉ mang tính chất tham khảo, tùy thuộc hình thể mỗi người và chất liệu nên có chênh lệch. Hãy ibox cho shop khi cần tư vấn cụ thể nha ^^\r\n\r\nHãy theo dõi để ủng hộ shop và cập nhập các chương trình khuyến mãi cũng như các mẫu sản phẩm mới nhất của shop nhé!\r\n\r\n🔸 Lưu ý: Shop chỉ hỗ trợ xử lý đơn hàng đổi trả trong vòng 15 ngày kể từ khi giao hàng thành công!', 89.000, 150.000, 123, 1, 1, '2025-06-28 04:02:39', '2025-06-28 04:02:39'),
(14, 'Ốp Lưng iPhone DSQ IMD Cứng Nhám, Siêu Chống Sốc, Bảo Vệ Camera - iP 6/6s/7/8/Plus/X/XS/XR/11/12/13/14/15/Pro/Max', 'sg-11134201-7rdwb-lxrn7i4b7xosec.webp', 'Ốp Lưng iPhone DSQ IMD Cứng Nhám, Siêu Chống Sốc, Bảo Vệ Camera - iP 6/6s/7/8/Plus/X/XS/XR/11/12/13/14/15/Pro/Max', 3.000, 10.000, 256, 1, 2, '2025-06-12 04:04:52', '2025-06-12 04:04:52'),
(15, 'Sạc Nhanh Đa Năng 4IN1 65W / 120W Cao Cấp 1.2M, Dây Dù Chống Đứt - Cho USB-Type C, Type C-Type C, Type C- iP, USB-iP', 'vn-11134207-7ra0g-m9zvmwhswboadd.webp', 'Sạc Nhanh Đa Năng 4IN1 65W / 120W Cao Cấp 1.2M, Dây Dù Chống Đứt - Cho USB-Type C, Type C-Type C, Type C- iP, USB-iP', 22.000, 30.000, 456, 1, 2, '2025-06-01 04:07:00', '2025-06-01 04:07:00'),
(16, 'Combo 3 Món Sạc Nhanh gồm : Củ Sạc Nhanh 4 Cổng 120w, Cáp Sạc 3 Đầu 100w, Cáp Sạc 4 Đầu ( Cáp 4in1 ) - Sạc Điện thoại .', 'vn-11134207-7ras8-m4958w58nk0733.webp', 'Combo 3 Món Sạc Nhanh gồm : Củ Sạc Nhanh 4 Cổng 120w, Cáp Sạc 3 Đầu 100w, Cáp Sạc 4 Đầu ( Cáp 4in1 ) - Sạc Điện thoại .', 81.000, 103.560, 235, 1, 2, '2025-06-26 04:07:41', '2025-06-26 04:07:41'),
(17, 'Điện thoại Apple iPhone 16 128GB', 'sg-11134301-7rdw4-m01cupmnad4w07.webp', 'Điện thoại Apple iPhone 16 128GB', 20190.000, 25459.000, 156, 7, 2, '2025-06-27 04:10:59', '2025-06-27 04:10:59'),
(18, 'Gậy chụp hình gấp gọn, có remote kết nối bluetooth và đèn LED trợ sáng, quay được 360 độ.', 'vn-11134207-7r98o-lyg80iwzr7f1b9.webp', 'Gậy chụp hình gấp gọn, có remote kết nối bluetooth và đèn LED trợ sáng, quay được 360 độ.', 58.000, 130.000, 345, 6, 2, '2025-06-30 04:12:41', '2025-06-30 04:12:41'),
(19, 'Tai nghe Gaming X15 / G11 PRO Tws Bluetooth 5.0.Tai nghe chơi game bluetooth, Không dây có mic với độ trễ cực thấp', 'vn-11134207-7ras8-m226l1btlnmmb9.webp', 'Tai nghe Gaming X15 / G11 PRO Tws Bluetooth 5.0.Tai nghe chơi game bluetooth, Không dây có mic với độ trễ cực thấp', 58.000, 150.000, 142, 8, 4, '2025-06-27 04:13:39', '2025-06-13 04:13:39'),
(20, 'Tai Nghe Bluetooth M10 Phiên Bản Pro Nâng Cấp Pin Trâu, Nút Cảm Ứng Tự Động Kết Nối, Chống Nước, Chống Ồn, Bảo Hành 12 T', '3707054f82e636c896458869737cc914.webp', 'Tai Nghe Bluetooth M10 Phiên Bản Pro Nâng Cấp Pin Trâu, Nút Cảm Ứng Tự Động Kết Nối, Chống Nước, Chống Ồn, Bảo Hành 12 T', 59.000, 160.000, 356, 7, 4, '2025-06-18 04:15:57', '2025-06-18 04:15:57'),
(21, 'Tai Nghe Có Dây JIASHUO X5 Pro Gaming Super Bass Chống Ồn Cực Tốt Có Mic Đàm Thoại', 'cn-11134207-7ras8-m6j9axg1x5n7e3.webp', 'Tai Nghe Có Dây JIASHUO X5 Pro Gaming Super Bass Chống Ồn Cực Tốt Có Mic Đàm Thoại', 42.000, 48.000, 159, 8, 4, '2025-06-28 04:16:51', '2025-06-28 04:16:51'),
(22, 'Tai Nghe Chụp Tai bluetooth Thời Trang Và Phong Cách Âm Bass Ấm Sống Động Có Mic Đàm Thoại Cho Học Tập Giải Trí', 'vn-11134207-7ras8-m2ndxaowapza01.webp', 'Tai Nghe Chụp Tai bluetooth Thời Trang Và Phong Cách Âm Bass Ấm Sống Động Có Mic Đàm Thoại Cho Học Tập Giải Trí', 139.000, 150.000, 432, 7, 4, '2025-06-28 04:18:33', '2025-06-28 04:18:33'),
(23, 'Chuột USB Chơi Game Có Dây LED RGB Ergonomic 1200DPI 3 Nút Tắt Tiếng Cho Laptop Văn Phòng PC', 'sg-11134301-7rdyw-lxtef5wjpznudf.webp', 'Chuột USB Chơi Game Có Dây LED RGB Ergonomic 1200DPI 3 Nút Tắt Tiếng Cho Laptop Văn Phòng PC', 38.500, 41.520, 200, 7, 4, '2025-06-30 04:19:27', '2025-06-30 04:19:27'),
(24, 'Webcam Có Mic 2K/1080P Máy tính USB Cho PC Laptop Livestream/Họp trực tuyến, Camera mini, Học và Làm việc Online', 'vn-11134207-7r98o-lyndud5x82ap61.webp', 'Webcam Có Mic 2K/1080P Máy tính USB Cho PC Laptop Livestream/Họp trực tuyến, Camera mini, Học và Làm việc Online', 197.010, 200.950, 145, 5, 4, '2025-06-25 04:21:34', '2025-06-25 04:21:34'),
(25, 'Kệ để máy tính giá laptop kê màn hình bằng gỗ đa năng tặng kèm vít', 'vn-11134207-7r98o-lyf2tssulcnh99.webp', 'Kệ để máy tính giá laptop kê màn hình bằng gỗ đa năng tặng kèm vít', 30.000, 50.000, 234, 1, 4, '2025-06-20 04:23:45', '2025-06-20 04:23:45'),
(26, 'Bàn phím bluetooth mini cho điện thoại android không dây bàn phím máy tính kèm chuột combo', 'vn-11134207-7r98o-lnaxicb3runh4d.webp', 'Bàn phím bluetooth mini cho điện thoại android không dây bàn phím máy tính kèm chuột combo', 120.000, 150.000, 560, 5, 4, '2025-06-19 04:25:04', '2025-06-12 04:25:04'),
(27, 'Drone camera 4k mini Máy Bay Flycam trang bị camera kép 4k - Lai Cam Điều Khiển Từ Xa,Chất lượng hình ảnh siêu rõ ràng', 'vn-11134207-7r98o-lkm6h7r7lyaye0.webp', 'Drone camera 4k mini Máy Bay Flycam trang bị camera kép 4k - Lai Cam Điều Khiển Từ Xa,Chất lượng hình ảnh siêu rõ ràng', 215.000, 230.000, 231, 8, 5, '2025-06-26 04:26:06', '2025-06-26 04:26:06'),
(28, 'Ốp Silicon BRDRC Cho DJI Osmo Pocket 3 Tay Cầm Máy Ảnh Gimbal Cầm Tay Vỏ Chống Trầy Xước Vỏ Bảo Vệ Mềm Nắp Ống Kính Vỏ....', 'sg-11134201-7rav1-mb3dyyp0y8eb1a.webp', 'Ốp Silicon BRDRC Cho DJI Osmo Pocket 3 Tay Cầm Máy Ảnh Gimbal Cầm Tay Vỏ Chống Trầy Xước Vỏ Bảo Vệ Mềm Nắp Ống Kính Vỏ....', 195.000, 200.000, 234, 7, 5, '2025-06-25 04:27:06', '2025-06-25 04:27:06'),
(29, 'TNW 11inch Đèn LED chữ nhật đèn livetream chuyên nghiệp kèm nắp đậy đèn led chụp ảnh đèn vuông', 'vn-11134207-7r98o-lvybd7z6xw4916.webp', 'TNW 11inch Đèn LED chữ nhật đèn livetream chuyên nghiệp kèm nắp đậy đèn led chụp ảnh đèn vuông', 64.900, 65.000, 324, 2, 5, '2025-06-27 04:28:56', '2025-06-27 04:28:56'),
(30, 'Bộ Dây Đai Đeo Ngực Gắn Điện Thoại, Camera Hành Trình, Gopro,..,Đa Dạng Mẫu, Phụ Kiện Chắc Chắn Quay Video, Vlog - FCS', 'vn-11134207-7r98o-ly55nqcubcm9a5.webp', 'Bộ Dây Đai Đeo Ngực Gắn Điện Thoại, Camera Hành Trình, Gopro,..,Đa Dạng Mẫu, Phụ Kiện Chắc Chắn Quay Video, Vlog - FCS', 79.000, 89.000, 342, 8, 4, '2025-06-26 04:29:52', '2025-06-26 04:29:52');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_details`
--

CREATE TABLE `product_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `price` decimal(10,3) NOT NULL,
  `price_old` decimal(10,3) NOT NULL,
  `color` varchar(255) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `material` varchar(255) DEFAULT NULL,
  `origin` varchar(255) DEFAULT NULL,
  `warranty` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_details`
--

INSERT INTO `product_details` (`id`, `product_id`, `name`, `image`, `price`, `price_old`, `color`, `size`, `material`, `origin`, `warranty`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'Áo Polo Nam UMA MEN Thêu Chữ U Chất Liệu Vải Poly Dệt Kim Cao Cấp Thấm Mồ Hôi Áo Thun Nam Cổ Bẻ Phối Màu Trẻ Trung APL05', 'vn-11134207-7r98o-loz71fxpqmajb8.webp', 65.000, 127.000, 'cam,xanh, vàng', 'M, L, XL', NULL, NULL, NULL, 'Áo Polo Nam UMA MEN Thêu Chữ U Chất Liệu Vải Poly Dệt Kim Cao Cấp Thấm Mồ Hôi Áo Thun Nam Cổ Bẻ Phối Màu Trẻ Trung APL05\r\n\r\n1.  GIỚI THIỆU SẢN PHẨM\r\n\r\nÁo Polo nam là những mẫu áo thun có phần cổ bẻ, có thiết kế cài khoảng 2 đến 3 phía trên cổ áo. Áo polo nam còn được biết đến với tên gọi khác là áo thun polo hoặc áo phông polo. Với việc được may từ những chất liệu cao cấp, thoáng mát nên áo polo có khả năng thấm hút mồ hôi rất tốt.\r\n\r\nTrái ngược hoàn toàn với áo thun cổ tròn, áo polo nam mang đến cho người mặc sự lịch sự, tinh tế, sang trọng nhưng cũng không kém phần trẻ trung và năng động. Áo polo thường được nam giới yêu thích bởi ưu điểm dễ mặc, dễ kết hợp trang phục mà lại không bị gò bó như áo sơ mi, vest. Chính bởi lý do đó mà ngày nay, áo polo nam được nhiều thương hiệu chú trọng phát triển, đem đến cho khách hàng nhiều sự lựa chọn. Áo polo nam được ứng dụng nhiều trong trang phục hang ngày và trở thành sự lựa chọn hàng đầu của phái mạnh bởi sự đơn giản nhưng vẫn toát lên được sự tinh tế. Áo polo nam không những thích hợp mặc ở nhà, đi học, đi dạo phố mà còn mặc trong những buổi lễ long trọng của doanh nghiệp\r\n\r\nÁo polo nam UMA phần lớn đều có thiết kế một hàng cúcở bên dưới trụ cổ và được may bằng chất liệu vải poly dệt kim cao cấp có độ bền màu cao, không nhăn nhàu, thấm hút mồ hôi tốt và dễ dàng làm sạch.\r\n\r\nÁo polo nam UMA kiểu dáng basic thiết kế đơn giản, dáng áo suông không ôm body, không bó sát vào cơ thể nên không gây ra sự khó chịu nào cho người mặc. Do đó, đây được xem là mẫu áo thun polo được nhiều người lựa chọn nhất trên thị trường hiện nay\r\n\r\nÁo polo nam UMA thường là những mẫu áo polo một màu đơn sắc hoặc phối màu cổ áo và bo viền tay áo đơn giản cùng hình thêu thương hiệu UMA. Đây là một trong những items luôn được nhiều chàng trai yêu thích sự thanh lịch, đơn giản, dễ phối và là items không thể thiếu trong tủ quần áo của mình.\r\n\r\nÁo Polo Nam UMA Thêu Chữ U có nhiều màu cơ bản, trung tính rất dễ mặc, với thiết kế đơn giản nhưng vô cùng bắt mắt, form áo vừa vặn cơ thể, thoải mái theo từng cử động.\r\n\r\n2. THÔNG TIN SẢN PHẨM\r\n\r\n- Chất liệu: Vải Poly dệt kim cao cấp thấm hút mồ hôi , giặt không ra màu , không mất form, vải không nhăn nhàu , không xù lông , không bai nhão.\r\n\r\n- Các Size M - L - XL - XXL - 3XL\r\n\r\n- Form áo tôn dáng, khả năng co giãn 4 chiều thoải mái.\r\n\r\n- Kiểu dệt xương cá giúp áo có độ thoáng khí tốt hơn\r\n\r\n3. CAM KẾT BẢO HÀNH\r\n\r\n- Sản phẩm áo polo nam chất lượng, giống hình, giống mô tả 100%\r\n\r\n- Áo được kiểm tra kỹ càng, cẩn thận tư vấn nhiệt tình trước khi gói hàng giao cho quý khách\r\n\r\n- Hoàn tiền 100% sản phẩm lỗi, không giống với mô tả.\r\n\r\n- Chấp nhận đổi hàng khi size không vừa Hàng có sẵn, giao hàng\r\n\r\nngay khi nhận được đơn đặt hàng\r\n\r\n- Shop luôn sẵn sàng trả lời inbox để tư vấn\r\n\r\n\r\n\r\nUMA STORE MEN rất cảm ơn Quý Khách Hàng đã tin tưởng và lựa chọn sử dụng các Sản Phẩm của chúng tôi!', '2025-06-27 02:59:49', '2025-06-26 02:59:49'),
(2, 2, 'Áo sơ mi kiểu dáng basic Men Store+ chất vải kaki cao cấp nam nữ', 'sg-11134201-23010-3eds9jmvivlv8d@resize_w900_nl.webp', 95.000, 199.000, 'cam, xanh, vàng', 'M, L, XL', NULL, NULL, NULL, 'MÔ TẢ SẢN PHẨM\r\n\r\n⭐ Tên sản phẩm : Áo sơ mi kaki basic cao cấp\r\n\r\n⭐ Chất Liệu: Chất kaki xuất hàn xịn \r\n\r\n⭐ Màu sắc: Đen – Be - Trắng - Cam - Xám\r\n\r\n⭐ Đặc Tính:  Chất vải áo là chất kaki cao cấp dày dặn, dễ phối hợp đồ, nam nữ mặc đều đẹp ạ \r\n\r\n\r\n\r\nBảng size bên shop các bạn tham khảo ạ:\r\n\r\nSize M: Dành cho người nặng từ  42kg - 50kg 1m55-1m60\r\n\r\nSize L : Dành cho người nặng từ  51kg - 58kg 1m60-1m65\r\n\r\nSize XL: Dành cho người nặng từ  59kg  - 67kg 1m65-1m70\r\n\r\nSize 2XL: Dành cho người nặng từ  68kg  - 75kg 1m70-1m75\r\n\r\nSize 3XL: Dành cho người nặng từ  76kg  - 85kg 1m75-1m80\r\n\r\n\r\n\r\n👉 Bảng size mang tính chất tham khảo bạn có thể lấy size to hơn hoặc nhỏ theo yêu cầu của bạn!\r\n\r\nMàu sắc: Đen – Be - Trắng - Cam - Xám\r\n\r\nLưu ý: Các bạn hãy nhắn tin cho shop để tư vấn size chính xác\r\n\r\n\r\n\r\n\r\n\r\n   SHOP CAM KẾT\r\n\r\n- Sản phẩm Áo sơ mi kaki basic giống mô tả 100%\r\n\r\n- Hình ảnh sản phẩm là ảnh thật, các hình hoàn toàn do shop tự thiết kế.\r\n\r\n- Kiểm tra  cẩn thận trước khi gói hàng giao cho Quý Khách\r\n\r\n- Hàng có sẵn, giao hàng ngay khi nhận được đơn \r\n\r\n- Hoàn tiền nếu sản phẩm không giống với mô tả\r\n\r\n- Chấp nhận đổi hàng khi size không vừa trong 3 ngày.\r\n\r\n\r\n\r\n   HỖ TRỢ ĐỔI TRẢ THEO QUY ĐỊNH CỦA SHOPEE\r\n\r\n- Điều kiện áp dụng (trong vòng 2 ngày kể từ khi nhận sản phẩm) \r\n\r\n- Hàng hoá bị rách, in lỗi, bung chỉ, và các lỗi do vận chuyển hoặc do nhà sản xuất.\r\n\r\n1. Trường hợp được chấp nhận: \r\n\r\n- Hàng giao sai size khách đã đặt hàng \r\n\r\n- Giao thiếu hàng \r\n\r\n2. Trường hợp không đủ điều kiện áp dụng chính sách: \r\n\r\n- Quá 2 ngày kể từ khi Quý khách nhận hàng \r\n\r\n- Gửi lại hàng không đúng mẫu mã, không phải sản phẩm của shop\r\n\r\n- Không thích, không hợp, đặt nhầm mã, nhầm màu,... \r\n\r\n', '2025-06-28 03:03:40', '2025-06-28 03:03:40'),
(3, 3, 'Bộ Đồ Nam Nữ Cao Cấp ATHEYA (1) Thoáng Mát Chất Tổ Ong , Bộ Thể Thao Chất Cotton Tổ ong in chữ Đẹp', 'vn-11134207-7r98o-lxtya8wjx3h533.webp', 91.200, 169.000, NULL, NULL, NULL, NULL, NULL, 'Bảng Size\r\n\r\nM : 40 - 50Kg\r\n\r\nL : 50 - 60Kg\r\n\r\nxl: 60Kg - Oversize\r\n\r\nBảng size phù hợp 90% khách hàng. Nếu bạn không chắc chắn thì inbox shop tư vấn ạ\r\n\r\nNếu bạn béo bụng hay muốn mặc rộng hơn chút thì nhớ tăng 1 size nha!', '2025-06-06 03:06:16', '2025-06-06 03:06:16'),
(4, 4, 'Thắt Lưng nylon Khóa Kim Loại Tự Động Co Giãn Phong Cách Quân Đội Cho Nam', 'cn-11134207-7r98o-lm4is96hi57oad.webp', 1.000, 10.000, NULL, NULL, NULL, NULL, NULL, 'Tên sản phẩm: Thắt lưng nam / Thắt lưng thường\r\n\r\nChất liệu: Vải + hợp kim\r\n\r\nTrọng lượng: Khoảng 0,25kg\r\n\r\nMàu: Đen, Trắng, Xám, Kaki\r\n\r\nChiều rộng đai: 3,6cm\r\n\r\nChiều dài dây đai: 115cm-125cm-135cm\r\n\r\nTính năng\r\n\r\n• Khóa tự động bằng hợp kim kẽm\r\n\r\nKhóa làm bằng hợp kim kẽm. mạnh mẽ và chắc chắn. Sẽ không vô tình mở ra.\r\n\r\n\r\n\r\n• Sợi đàn hồi mạnh mẽ\r\n\r\nCác sợi đàn hồi mới được dệt chặt chẽ giúp tăng cường độ dẻo dai và giúp dây đai bền hơn. Tuổi thọ hơn 8 năm.\r\n\r\n\r\n\r\n• Thuận tiện\r\n\r\nVì nó kéo căng thắt lưng nên khi bạn ngồi xổm hoặc cúi xuống, thắt lưng sẽ co giãn, rất thoải mái.\r\n\r\n\r\n\r\n• Cảnh được sử dụng\r\n\r\nThích hợp để đi bộ đường dài, câu cá, chạy, săn bắn, cắm trại, đi làm, huấn luyện quân sự, trượt tuyết, v.v. và một số công việc ngoài trời.', '2025-06-29 03:08:01', '2025-06-29 03:08:01'),
(5, 5, 'Áo thun nam trơn HAFOS cotton cao cấp mềm mịn, ít nhăn, tay ngắn. Áo phông basic phối đồ đơn giản, mặc mọi dịp', 'vn-11134207-7ras8-mbdoaijcyorb07.webp', 189.000, 209.000, NULL, NULL, NULL, NULL, NULL, 'Áo thun nam trơn HAFOS cotton cao cấp mềm mịn, ít nhăn, tay ngắn. Áo phông basic phối đồ đơn giản, mặc mọi dịp', '2025-06-29 03:10:25', '2025-06-29 03:10:25'),
(6, 6, 'Áo thun LIFE unisex MONSTER X STREET Life phông tay lỡ nam nữ form rộng Local Brand', '44e7e4ccd60934dd859f42d6ffb42f15.webp', 99.000, 117.400, NULL, NULL, NULL, NULL, NULL, 'Thông tin sản phẩm Áo thun unisex MONSTER X STREET phông tay lỡ nam nữ form rộng Local Brand\r\n\r\n- Hàng chuẩn MONSTER X STREET sản xuất, tem mác chuẩn chính hãng.\r\n\r\n- Chất liệu: thun cotton 95% - 5% spandex co giãn 4 chiều, vải mềm, vải mịn, thoáng mát, không xù lông.\r\n\r\n- Đường may chuẩn chỉnh, tỉ mỉ, chắc chắn.\r\n\r\n- Mặc ở nhà, mặc đi chơi hoặc khi vận động thể thao. Phù hợp khi mix đồ với nhiều loại.\r\n\r\n- Thiết kế hiện đại, trẻ trung, năng động. Dễ phối đồ.\r\n\r\n\r\n\r\nThông số chọn size:\r\n\r\nSize M: 1m50-1m60 (45-55kg) \r\n\r\nSize L: 1m60-1m70 (55-65kg) \r\n\r\nSize XL: 1m70- 1m85 (65-80kg) \r\n\r\nSize XXL: 1m80 trở lên (Từ 80kg trở lên)\r\n\r\n(Bảng trên chỉ mang tính chất tham khảo, chọn mặc fom vừa vặn thoải mái, lên xuống size tuỳ theo sở thích ăn mặc của bạn)\r\n\r\n\r\n\r\nHướng dẫn sử dụng sản phẩm của MONSTER X STREET:\r\n\r\n- Nhớ lộn trái sản phẩm khi giặt và không giặt ngâm\r\n\r\n- Không giặt máy trong 7 ngày đầu\r\n\r\n- Không sử dụng thuốc tẩy\r\n\r\n- Khi phơi lộn trái và không phơi trực tiếp dưới ánh nắng mặt trời\r\n\r\n\r\n\r\nCHÚNG TÔI XIN CAM KẾT:\r\n\r\nSản phẩm áo hoodie của MONSTER X STREET:\r\n\r\nĐảm bảo vải chuẩn nỉ bông cotton dày dặn\r\n\r\nHàng có sẵn, giao hàng ngay khi nhận được đơn đặt hàng .\r\n\r\nHoàn tiền nếu sản phẩm lỗi, nhầm hoặc không giống với mô tả.\r\n\r\nHỗ trợ đổi trả theo quy định của Shopee .', '2025-06-29 03:14:37', '2025-06-29 03:14:37'),
(7, 7, 'Quần Áo Nam Mùa Hè Chất Liệu PoLy Coolmax Thoáng Khí, Bộ Quần Áo Nam Cổ Tròn Cộc Tay Aventino J29', 'vn-11134207-7ra0g-m9icmld7ephj9e.webp', 136.240, 240.000, NULL, NULL, NULL, NULL, NULL, 'Quần Áo Nam Mùa Hè Chất Liệu PoLy Coolmax Thoáng Khí, Bộ Quần Áo Nam Cổ Tròn Cộc Tay  Aventino J29\r\n\r\n\r\n\r\n🔰 Thông tin sản phẩm Quần Áo Nam Mùa Hè Chất Liệu PoLy Coolmax Thoáng Khí, Bộ Quần Áo Nam Cổ Tròn Cộc Tay  Aventino J29\r\n\r\n\r\n\r\n🎗 Màu sắc: Trắng - Đen - Xanh than - Xám\r\n\r\n🎗 Thương hiệu: Aventino\r\n\r\n🎗Kích thước: M-L-XL-XXL\r\n\r\n\r\n\r\n🔰Mô tả chi tiết sản phẩm Quần Áo Nam Mùa Hè Chất Liệu PoLy Coolmax Thoáng Khí, Bộ Quần Áo Nam Cổ Tròn Cộc Tay  Aventino J29\r\n\r\n\r\n\r\n👉Bộ đồ nam được làm từ chất liệu vải Poly Coolmax sợi Poly kết hợp sợi Spandex giúp bạn thoải mái trong mọi hoạt động\r\n\r\n👉Kết hợp bộ đồ nam được đa dạng phong cách có thể mặc nhà, dạo phố hay chơi thể thao\r\n\r\n👉Màu sắc đa dạng, basic phù hợp với nhiều lứa tuổi\r\n\r\n👉 Đường may tinh tế, tỉ mỉ trong từng chi tiết\r\n\r\n\r\n\r\n🔰 Hướng dẫn cách đặt hàng Bộ Đồ Nam Aventino', '2025-06-29 03:16:23', '2025-06-29 03:16:23'),
(8, 8, 'Đồ Bộ Quần Áo Nam Thể Thao Mùa Hè Polo Chất Thun Cá Sấu Co Giãn ABANDON J9', 'vn-11134207-7ra0g-m6c1xnwaeugoe7.webp', 158.000, 250.000, NULL, NULL, NULL, NULL, NULL, 'Hướng dẫn sử dụng:\r\n\r\n- Nên giặt tay lần đâu tiên để tránh phai màu sang quần áo khác\r\n\r\n- Khi giặt nên lộn mặt trái ra để đảm bảo độ bền của sản phẩm\r\n\r\n- Sản phẩm phù hợp cho giặt máy/giặt tay\r\n\r\n\r\n\r\nBảng size có trong mô tả ảnh sản phẩm\r\n\r\n\r\n\r\nLưu ý về sản phẩm:\r\n\r\n- Nếu chưa chắc chắn về chọn size sản phẩm\r\n\r\n- Nếu khách form người không cân đối (Béo, gầy, thấp...)\r\n\r\n- Nếu khách thích mặc ôm body hoặc mặc rộng thoải mái\r\n\r\n INBOX trực tiếp cho shop để được tư vấn size nhé\r\n\r\n\r\n\r\nChế độ bảo hành ABANDON\r\n\r\n- Tất cả các sản phẩm đều được shop hỗ trợ đổi trả\r\n\r\n- Nếu quá thời hạn 3 ngày kể từ ngày nhận đơn hàng, chế độ bảo hành của ELEVEN sẽ hết hiệu lực\r\n\r\n\r\n\r\nABANDON cam kết:\r\n\r\n- ABANDON cam kết mang đến cho khách hàng những sản phẩm với chất lượng tốt nhất trong tầm giá\r\n\r\n- ABANDON cam kết chính sách bảo hành tốt nhất (Hỗ trợ đổi size, Hỗ trợ đổi Sản phẩm lỗi)\r\n\r\n#DoBoQuanAoNam #DoBoNamTheThao #BoDoNamPolo #BoDoNamCocTay #BoDoNamThunCaSau #BoDoNamCoGian #BoDoNamMuaHe #BoDoNamThoangMat #BoDoNamDep #BoDoNamCaoCap #DoBoNamChinhHang #BoDoNamMoiNhat #BoDoNamHotTrend #BoDoNamThoiTrang #BoDoNamFormDep #BoDoNamBanChay #DoBoNamGiaTot #DoBoNamGiamGia #BoDoNamReDep #DoBoTheThaoNam', '2025-06-29 03:17:47', '2025-06-29 03:17:47'),
(9, 9, 'Bộ Đồ Thể Thao Nam Chất Liệu Tổ Ong Mắt Nhỏ Thấm Hút Mồ Hôi Hoạt Động Thể Thao Ngoài Trời Aventino J35', 'vn-11134207-7r98o-lygd1msipgo1a3.webp', 79.000, 119.000, NULL, NULL, NULL, NULL, NULL, ' Hướng dẫn sử dụng và bảo quản Áo thun Polo nam cổ dệt :\r\n\r\n   - Giặt ở nhiệt độ bình thường với chu kì ngắn\r\n\r\n   - Không được dùng hóa chất tẩy.\r\n\r\n   - Hạn chế sử dụng máy sấy ,ủi ở nhiệt độ thích hợp.\r\n\r\n   - Lộn mặt trái khi phơi tránh bị phai màu\r\n\r\n\r\n\r\nAventino luôn có rất nhiều ƯU ĐÃI - bạn hãy Áp dụng đủ các mã để mua sản phẩm với giá tốt nhất nhé :\r\n\r\n   - Giá tốt hơn khi mua từ 2 sản phẩm\r\n\r\n   - Voucher của Shop \r\n\r\n   - Mua kèm Deal shock các sản phẩm HOT khác \r\n\r\n   - Freeship Extra toàn quốc\r\n\r\n\r\n\r\n  LƯU Ý: \r\n\r\n Khi bạn gặp bất kì vấn đề gì về sản phẩm đừng vội đánh giá mà hãy liên hệ Shop để đc hỗ trợ 1 cách tốt nhất nhé\r\n\r\n Aventino xin cảm ơn bạn và mong bạn có trải nghiệm tốt nhất khi mua hàng tại Shop ạ.\r\n\r\n\r\n\r\n#bothethao #bothethaonam #đobothethao #đobonam #đobo #quanaonam #bothethaonam #đonam #quanaohenam #quanaonamhe #bodothethaonam\r\n\r\n#bococnam #bonammuahe #bohe', '2025-06-29 03:19:21', '2025-06-29 03:19:21'),
(10, 10, 'Thắt lưng nam cao cấp FaiaoePOLO, sang trọg lịch sự LEANO fullbox 579', 'vn-11134207-7r98o-llxriu8kxm1r55.webp', 1.000, 10.000, NULL, NULL, NULL, NULL, NULL, 'Thương hiệu : FAIAOEPOLO\r\n\r\n◾  Mặt hợp kim cao cấp  - dùng khóa tự động\r\n\r\n◾  Kích thước 3.4cm x 120cm\r\n\r\n◾  Màu sắc: Đen\r\n\r\n◾  Full hộp đựng - Khách hàng cần túi xách làm quà tặng hãy inbox trực tiếp cho SHOP nhé !\r\n\r\n◾  Chất liệu DA BÒ 2 Lớp \r\n\r\n◾  Bảo hành 1 năm - đổi trả miễn phí trong vòng 15 ngày nếu có lỗi từ nhà sản xuất\r\n\r\n       - Hoàn tiền 100% khi khách hàng nhận hàng nhưng không hài lòng sản phẩm\r\n\r\n       - Hãy nhắn tin STK ngân hàng SHOP sẽ hoàn tiền 100% cho bạn \r\n\r\n◾  Hàng nhập trực tiếp không qua trung gian và shop bán online nên tiết kiệm nhiều \r\n\r\n  chi phí nên giá rất ưu đãi , nếu bạn tìm được sản phẩm này bán ở shop khác rẻ hơn \r\n\r\n                                                            SHOP XIN TẶNG BẠN LUÔN SẢN PHẨM NÀY\r\n\r\n   SHOP đã lựa chọn những sản phẩm tốt nhất - đẹp nhất để gửi đến quý khách hàng\r\n\r\n◾  Kiểu dáng hiện đại - sang trọng - nam tính\r\n\r\n◾  Thắt lưng nam cao cấp FaiaoePOLO  được gia công tỉ mỉ - chất liệu da mềm , làm quà tặng rất đẹp\r\n\r\n◾  Da bò được xử lý đúng theo quy trình nên sử dụng càng lâu thì thắt lưng sẽ càng mềm mại, dẻo dai, bền màu và tăng độ bóng mịn\r\n\r\n◾  Sản phẩm dễ dàng phối với quần âu, quần kaiki... Mang lại vẻ thanh lịch, hiện đại và trẻ trung cho bạn\r\n\r\n                    SẢN PHẨM ĐẸP NHỎ GỌN THÍCH HỢP LÀM QUÀ TẶNG SẾP , NGƯỜI YÊU , SINH NHẬT\r\n\r\n                                                            IN THIỆP MIỄN PHÍ TẶNG KHÁCH HÀNG \r\n\r\n#thắt_lưng_da_nam #thắt lưng da nam #thoitrangnam #Thắtlưngdanamhànghiệu #thatlung #thatlungnam #daynitnam #thatlungda#daylungnam #Thắtlưngdanamhànội #that lung da nam #day nit nam\r\n\r\n#Thắtlưngdanam #thắtlưngnam #dâynịtnam #Dâynịtnamhànghiệu #dâylưngnam #thắtlưngnamdabò #thatlungdabo #daynitdabo #daylungnam #daynichnam #daynitdanam\r\n\r\n#thắtlưngdanam #thắtlưngdanamcaocấp #thắtlưngnamdabò #thắtlưngnamgiárẻ #chínhhãng #freeship\r\n\r\n#dâynịtnam #Thắtlưngnamđẹp #thatlungnampolo #thatlungdanampolo #thắt lưng da nam polo\r\n\r\n#day_nịt_nam_cao_cấp #dây_lưng_nam_da_bo #thắt_lưng_nam_cao_cấp #thắt_lưng_nam_đẹp #thắt_lưng_nam_hàng_hiệu #thắt_lưng_da #thắt_lưng_da_nam_williampolo #thắt_lưng_william #thắt_lưng_polo*\r\n\r\n◾ Xuất xứ : Quảng châu - Trung Quốc', '2025-06-30 03:20:40', '2025-06-29 03:20:40'),
(11, 11, 'Áo thun TEESHARKBUY 100% Cotton tay ngắn dáng rộng in chữ phong cách hip hop đường phố mỹ cá tính cho nam nữ Unisex M-4XL', 'sg-11134201-7rd40-lwwcdtkvx74c33.webp', 55.000, 60.000, NULL, NULL, NULL, NULL, NULL, 'Phong cách cơ bản: Thanh niên Phổ biến\r\n\r\nĐộ dày: thông thường\r\n\r\nThương hiệu: other / other\r\n\r\nCảnh áp dụng: giải trí khác\r\n\r\nLoại tay áo: Thường xuyên\r\n\r\nPhong cách phân khu: Thủy triều\r\n\r\nPhiên bản phiên bản: Loose\r\n\r\nNăm thị trường Mùa: Mùa xuân 2024\r\n\r\nĐối tượng áp dụng: Thanh thiếu niên\r\n\r\nLoại cổ áo: Cổ tròn\r\n\r\nMô hình hoa: Chữ cái / Số / Văn bản\r\n\r\nChiều dài tay áo: Tay áo ngắn\r\n\r\nLoại thương hiệu: Thương hiệu thời trang\r\n\r\nChi tiết phong cách: Khác\r\n\r\nMùa áp dụng: Mùa hè\r\n\r\nCông nghệ quần áo: Xử lý không sắt\r\n\r\nChủ đề in ấn: Phong cách thành phố', '2025-06-29 03:22:04', '2025-06-29 03:22:04'),
(12, 12, 'Set Bộ Thể Thao Nam Nữ hàng siêu cấp Thời Trang Mùa Thu Đông Mẫu hot nhất 2024 BN07 - OVERMAN', 'vn-11134207-7r98o-lmqvhpmvgau791.webp', 149.000, 199.000, NULL, NULL, NULL, NULL, NULL, 'Set Bộ Thể Thao Nam Nữ hàng siêu cấp Thời Trang Mùa Thu Đông Mẫu hot nhất 2024 BN07 BO07 - OVERMAN\r\n\r\n\r\n\r\n🔸 Thông tin sản phẩm : BỘ QUẦN ÁO THỂ THAO NAM ĐỒ BỘ MÙA THU ĐÔNG CAO CẤP BN07  BO07\r\n\r\n♥️ Mã SP: BO07\r\n\r\n♥️ Chất liệu : BỘ thể thao nam chất Chất tổ ong co dãn 4 chiểu cao cấp , mềm mịn , thoáng mát tạo cảm giác mát nhẹ , thoải mái cho người mặc \r\n\r\n- SIZE M :     45 - 57 Kg\r\n\r\n- SIZE L:    57 - 65 Kg\r\n\r\n- SIZE XL:    65 - 73 Kg\r\n\r\n- SIZE 2XL:    73 - 85Kg \r\n\r\n♥️ Bảng màu Bộ quần áo nam : có 4 màu :đen, trắng, xám, dương\r\n\r\n♥️ Đồ thể thao là phụ kiện thời trang đơn giản nhưng không thể thiếu cho mùa hè. Các anh có thể mặc đồ bộ nam ờ nhà, hay dùng làm đồ thể thao, tập gym rất mát mẻ và thoải mái', '2025-06-29 03:23:40', '2025-06-29 03:23:40'),
(13, 13, 'Áo polo boxy local brand nam nữ thun có cổ phông oversize sọc kẻ phối màu form rộng bigsize cặp đôi px pandax polime', 'vn-11134207-7ra0g-m78y9dvuleuu38@resize_w900_nl.webp', 210.000, 350.000, NULL, NULL, NULL, NULL, NULL, 'Áo polo boxy local brand nam nữ thun có cổ phông oversize sọc kẻ phối màu form rộng bigsize cặp đôi px pandax polime Unisex Menswear là một sản phẩm unisex thời trang với chất liệu Polyester chất lượng.\r\n\r\nPhong cách: Tối giản, Hàn Quốc, Sang trọng, Khỏe mạnh\r\n\r\nFIT: Rộng lùng thùng\r\n\r\nMẫu: Kẻ sọc\r\n\r\nDịp sử dụng: Thông thường\r\n\r\nSản phẩm này có thiết kế form rộng oversize và phù hợp cho cả nam và nữ. Áo có chiều dài tay ngắn tạo điểm nhấn cá tính cho người mặc.\r\n\r\nHướng dẫn giặt:\r\n\r\nVới xuất xứ từ Việt Nam và được sản xuất bởi tổ chức PX PANDAXVN, đảm bảo bạn sẽ hài lòng với Áo polo boxy local brand này từ chất lượng đến kiểu dáng.\r\n\r\n#polo #aopolo #polonam #pololocalbrand #poloessentials #aopolochinhang #aopoloformrong #aopolobigsize #aopoloboypho #aopolobasic #aopolocotton #aopolococo #aopolonamdep #aopoloden #aopolonamdep #aopolodentrang #aopolodoi #aopolocap', '2025-06-29 03:27:26', '2025-06-29 03:27:26'),
(14, 14, 'Ốp lưng từ tính trong suốt KOLEAD P12 chống sốc hỗ trợ sạc không dây cho iphone 16 15 14 13 12 11 Pro Max plus Casephone', 'vn-11134207-7r98o-lnqwdzzjwl8a69.webp', 25.000, 40.000, NULL, NULL, NULL, NULL, NULL, 'Ốp lưng từ tính trong suốt KOLEAD P12 chống sốc hỗ trợ sạc không dây cho iphone 16 15 14 13 12 11 Pro Max plus Casephone\r\n\r\n\r\n\r\nLƯU Ý: Phân loại xịn sẽ dày hơn, nam châm hút tốt hơn\r\n\r\n             ( Đối với ốp từ tính loại thường: Khách hàng nhớ bóc lớp bảo vệ ốp ở ngoài ốp, trong ốp và trong vòng tròn để sử dụng nhé)', '2025-06-29 03:28:32', '2025-06-29 03:28:32'),
(15, 15, 'Cáp sạc đa năng 3 màu Hoco X76 4-in-1 2Type-C + ip+ Micro hổ trợ sạc 2.0A dây dù siêu bền dài 100cm (3 MÀU)', 'vn-11134207-7r98o-lyc1mlmq6obl8b.webp', 39.000, 139.000, NULL, NULL, NULL, NULL, NULL, 'Cáp sạc Hoco X76 4-in-1 2Type-C + Lightning + Micro hổ trợ sạc 2.0A dây dù siêu bền dài 100cm\r\n\r\n\r\n\r\nThông Tin:\r\n\r\n1. Chiều dài: 1m (đường chính 0,8m + đường nhánh 0,2m), trọng lượng: 60g\r\n\r\n2. Chất liệu bên ngoài: dệt nylon\r\n\r\n3. Chất liệu khớp: hợp kim nhôm\r\n\r\n4. Lõi: đường chính (34 / 0,1) x 2+ nhánh dòng (26 / 0.1) x 2 OD3.2mm\r\n\r\n5. Dòng điện có thể đạt 2A\r\n\r\n6. Không hỗ trợ truyền dữ liệu\r\n\r\n\r\n\r\nCHÍNH SÁCH BẢO HÀNH\r\n\r\n1)Sản phẩm giao tới khách hàng hoàn toàn nguyên seal.\r\n\r\n2) Bảo hành 06 tháng tại cửa hàng\r\n\r\n3) Khách hàng vui lòng bảo quản sản phẩm, hộp, phụ kiện để được bảo hành đổi mới.\r\n\r\n4) Không bảo hành sản phẩm rơi vỡ, bể, cấn móp, rách hộp, mất hộp,.... \r\n\r\n5) Thời gian bảo hành được tính từ ngày đặt hàng của đơn hàng\r\n\r\n6) Mỗi sản phẩm được bảo hành một lần trong thời gian còn bảo hành 6 tháng\r\n\r\n7) Không hỗ trợ đổi trả hàng khi khách hàng đặt nhầm.', '2025-06-17 03:29:53', '2025-06-25 03:29:53'),
(16, 16, 'Cáp Sạc Nhanh Alix Combo 3 Cáp Sạc kèm 1 Củ Sạc Tiện Lợi', 'vn-11134207-7ras8-m26lpyh8j92s47.webp', 99.000, 179.000, NULL, NULL, NULL, NULL, NULL, 'Cáp Sạc Nhanh Đa Năng 4 trong 1\r\n\r\nBạn muốn một giải pháp đa năng cho việc sạc nhanh và truyền dữ liệu cho cả iP và điện thoại Android Type-C của bạn? Đây chính là giải pháp hoàn hảo cho bạn - Cáp Sạc Nhanh Đa Năng 4 trong 1.\r\n\r\nTHÔNG SỐ KỸ THUẬT:\r\n\r\n- Đầu sạc: TYPE-C và IP\r\n\r\n- Chiều dài: 1m\r\n\r\n- Số lượng đầu nối nhánh: 4 nhánh như hình ảnh\r\n\r\n- Chất liệu dây: Dây dệt chắc chắn.\r\n\r\n- Các tính năng: Hỗ sạc nhanh và truyền dẫn dự liệu.\r\n\r\nƯU ĐIỂM:\r\n\r\nSạc nhanh iP: Có cổng tích hợp để sạc nhanh cho các thiết bị như iP với công suất lên đến 20W.\r\n\r\nSạc nhanh điện thoại Android Type-C: Với cổng Type-C hỗ trợ sạc nhanh lên đến 65W, bạn có thể sạc nhanh cho bất kỳ thiết bị Android nào hỗ trợ chuẩn sạc PD hoặc QC.\r\n\r\nHỗ Trợ Tiêu Chuẩn Sạc Nhanh:\r\n\r\nĐược thiết kế để hỗ trợ các tiêu chuẩn sạc nhanh như Power Delivery (PD) cho iP và Quick Charge (QC) cho điện thoại Android. Đảm bảo bạn có trải nghiệm sạc nhanh và an toàn nhất.\r\n\r\nĐộ Dài Phù Hợp:\r\n\r\nCáp có độ dài 1m để phù hợp với nhu cầu sử dụng của bạn. Tiện lợi cho di chuyển đến cáp dài hơn cho việc sử dụng ở nhà hoặc văn phòng.\r\n\r\n\r\n\r\n#sactypec #daysac2dautypec #capsac2dautypec #capsactypec #daysactypec #daysactypectotypec #capsactypectotypec #ctoc #ctotypec #cap #sac #day #typec', '2025-06-29 03:31:23', '2025-06-28 03:31:23'),
(17, 17, 'Điện thoại iPhone 16 128GB - Hàng chính hãng', 'vn-11134207-7ras8-m0jmtwb5dg27b0.webp', 20190.000, 24100.000, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-29 03:33:03', '2025-06-29 03:33:03'),
(18, 18, 'Gậy Chụp Ảnh 3 Chân CYKE L16 Kéo Dài 1m55 - Sử Dụng Cho Đa Thiết Bị', 'vn-11134207-7ra0g-m7tk5roj596u23.webp', 269.000, 359.000, NULL, NULL, NULL, NULL, NULL, 'Gậy Chụp Ảnh 3 Chân CYKE L16 Kéo Dài 1m55 - Sử Dụng Cho Đa Thiết Bị\r\n\r\n\r\n\r\n💙 Nhà sản xuất: CYKE –CTY TNHH HỒ NGUYÊN THẨM QUYẾN (Shenzhen Chaoyuan Technology Co., Ltd.)\r\n\r\n💙 Phân phối bởi: EROS VIETNAM\r\n\r\n\r\n\r\n🍏 Sản phẩm hoàn toàn phù hợp với các tiêu chuẩn quốc tế: PSE, RoHs, FCC, CE, BQB, UL, CB \r\n\r\n🍏 Tích hợp đầu gắn phụ kiện phù hợp cho các thiết bị như máy ảnh MIRRORLESS, DSLR, đèn trợ sáng\r\n\r\n 🍏 Chất liệu hợp kim siêu bền', '2025-06-29 03:36:45', '2025-06-29 03:36:45'),
(19, 19, 'Tai nghe Bluetooth Gaming Dogiek X15 Type 1 TWS Bluetooth 5.3 2025, Có Game mode, trễ âm thấp', 'fd03dc6166a3bf65d367f3cd34dc8a3f.webp', 68.000, 72.000, NULL, NULL, NULL, NULL, NULL, 'LƯU Ý :\r\n\r\n+  Sản phẩm của Shop là được GIAO TRỰC TIẾP TỪ TRONG NƯỚC VÀ BẢO HÀNH 1 ĐỔI 1 NGAY VÀ NHANH CHÓNG, Không phải hàng Order hay các shop bán Dropship giao chậm 10-14 ngày. không có chế độ bảo hành và nếu có thì bảo hành rất lâu và mất thời gian. Quý khách có thể cân nhắc nhé !\r\n\r\n+ Sản phẩm mua phải có LOGO DOGITEK khắc chìm trên hộp sạc và ngoài vỏ\r\n\r\n---------------------------------\r\n\r\nGIỚI THIỆU SẢN PHẨM TAI NGHE BLUETOOTH GAMING KHÔNG DÂY X15, PHIÊN BẢN TYPE 1  : \r\n\r\n-	Sau bao lâu chờ đợi, siêu phẩm tai nghe không dây nhét tai bluetooth X15 được ra đời, phiên bản này đặc biết với thiết kế thể thao, đậm phong cách gaming. Đi kèm đó là siêu Chip đời 02/2025 cập nhật lên 5.3 mạnh mẽ. \r\n\r\n-	Với thiết kế tai nghe không dây cao cấp, tai nghe k dây X15 chắc chắn là sự lựa chọn không thể bỏ qua. Với thiết kế và công nghệ hiện đại, X15 sẽ đáp ứng mọi nhu cầu của bạn, ngay cả khi chơi game với cường độ cao, không cho phép độ trễ âm.\r\n\r\n-	Nếu bạn là một phan cuồng của công nghệ và đam mê tai nghe gaming không dây Bluetooth không trễ âm, Vậy đừng bỏ qua một sản phẩm tuyệt vời này nhé bạn !\r\n\r\n -------------------------------\r\n\r\nTHÔNG SỐ KĨ THUẬT TAI NGHE BLUETOOTH GAMING KHÔNG DÂY X15, PHIÊN BẢN TYPE 1  :  : \r\n\r\n•	Cảm biến chạm cao cấp , Chống Thấm Nước IPX5, Công nghệ Bass Deep 9D , Chip Jerry đời 02/2025 bản 5.3 mạnh mẽ\r\n\r\n•	Phù hợp với tất cả các dòng thiết bị điện thoại, máy tính, laptop...\r\n\r\n•	Bluetooth Phiên Bản: lên đến 5.3\r\n\r\n•	Dung lượng pin tai nghe bluetooth : 35-40 mAh Polymer lithium Pin, pin hộp sạc 350mAh ,\r\n\r\n•	Thời gian gọi: khoảng 3 giờ\r\n\r\n•	Thời gian Nghe: Khoảng 4 giờ\r\n\r\n•	Thời gian sạc tai nghe: khoảng 1,0 giờ\r\n\r\n•	Thời gian sạc hộp sạc: khoảng 2,0 giờ\r\n\r\n•	Mức độ chống thấm nước: IPX5 \r\n\r\n•	Thời gian chờ: 120 giờ\r\n\r\n•	Thời gian sạc tai nghe: khoảng 35-60 phút\r\n\r\n•	Thời gian sạc hộp sạc: khoảng 1.0 giờ\r\n\r\n•	Tai nghe thiết kế tinh xảo, nhiều đèn LED đem lại cảm giác trẻ trung và thể thao\r\n\r\n•	Có nhiều tính năng như kháng nước kháng bụi, nút cảm ứng trên tai nghe, âm thanh vòm 10D\r\n\r\n•	Đây là bản 2025, có hỗ trợ lên Bluetooth 5.3 cao cấp\r\n\r\n----------------------------------\r\n\r\nƯU ĐIỂM CỦA SẢN PHẨM TAI NGHE BLUETOOTH X15 : CÓ GAME MODE MUSIC MODE RIÊNG, TYPE 1   \r\n\r\n + Thiết kế tinh tế, dáng trẻ trung và cũng rất hầm hố\r\n\r\n + Không bị đau tai khi sử dụng quá lâu\r\n\r\n + Dễ dàng kết nối và sử dụng, chỉ với vài thao tác đơn giản nhé.\r\n\r\n+ Công nghệ True wireless Stereo : Âm thanh vòm và nghe ấm\r\n\r\n+  Tai nghe Bluetooth pin trâu, chống ồn, chống nước , chống va đập\r\n\r\n+ Có Siri, google assistant điều khiển bằng giọng nói nhanh.\r\n\r\n+ Công nghệ hiện đại, có tính năng bảo vệ pin Lithium, sạc nhanh.. để bền bỉ\r\n\r\n+ Game thủ cũng trở lên chuyên nghiệp hơn khi sử dụng nhé.\r\n\r\n+ Đèn LED đổi màu RGB, sẽ làm bạn nổi bật so với phần còn lại.', '2025-06-29 03:38:08', '2025-06-29 03:38:08'),
(20, 20, 'Tai nghe bluetooth không dây S10 Pro, M10, M27, X55, S510 gaming nhét tai âm thanh 9D có micro S P', 'vn-11134207-7ras8-m4gglot2sqfj7f.webp', 63.000, 80.000, NULL, NULL, NULL, NULL, NULL, 'Tên sản phẩm: Tai nghe bluetooth không dây S10 Pro, M10, M27, F9, M19 V5.3 gaming nhét tai âm thanh 9D có micro S P, tay nghe không dây nhét tai thể thao giá rẻ cho samsung phone điện thoại gồm: \r\n\r\n❶ Tai nghe bluetooth không dây M19, M10, Amoi F9 Pro TWS màu Đen/ Trắng.\r\n\r\n❷ Dây cáp sạc cho tai nghe bluetooth không dây M19, M10, Amoi F9 ProTWS.\r\n\r\n❸ Hộp đựng tai nghe bluetooth không dây M19, M10, Amoi F9 Pro TWS.\r\n\r\n❹ Núm hỗ trợ thay thế tai nghe bluetooth không dây M19, M10, Amoi F9 Pro TWS.', '2025-06-29 03:39:31', '2025-06-29 03:39:31'),
(21, 21, 'Tai nghe gaming có dây nhét tai S2000, tai phone in ear chơi game chống ồn pc, điện thoại có mic, bass giá rẻ S P', 'vn-11134207-7ras8-m546qd9dw003f7.webp', 48.900, 70.000, NULL, NULL, NULL, NULL, '', 'Sản phẩm: Tai nghe gaming có dây nhét tai S2000, tai phone in ear chơi game chống ồn IP, pc, điện thoại có mic, bass giá rẻ Sagopy\n\n\n\n💯 THÔNG TIN SẢN PHẨM Tai nghe gaming có dây nhét tai S2000, tai phone in ear chơi game chống ồn IP, pc, điện thoại có', '2025-06-29 03:40:56', '2025-06-29 03:40:56'),
(22, 22, 'Tai nghe bluetooth không dây không nhét tai BYZ S600 có micro chống Ồn Pin lâu 800mAh', 'cn-11134207-7ras8-m2rk244xkzwzd8.webp', 561.900, 650.000, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-29 03:42:40', '2025-06-29 03:42:40'),
(23, 23, 'Chuột máy tính có dây SIDOTECH B2 gaming silent tắt âm 6 nút bấm 8800 DPI có app laptop pc chơi game làm việc', 'vn-11134207-7r98o-lyga5im7v3j540.webp', 127.000, 199.000, NULL, NULL, NULL, NULL, NULL, '🔰 CHÍNH SÁCH BẢO HÀNH / ĐỔI TRẢ\r\n\r\nChính sách đổi trả hàng:\r\n\r\n•	Hàng bị lỗi kỹ thuật do nhà sản xuất.\r\n\r\n•	Hàng bị hư hỏng do quá trình vận chuyển.\r\n\r\n•	Hàng giao không đúng mẫu mã, thiếu phụ kiện như mô tả hoặc như yêu cầu của khách\r\n\r\nĐiều kiện đổi trả hàng\r\n\r\n•	Khách hàng thông báo cho chúng tôi về tình trạng lỗi sản phẩm, sự cố đơn hàng trong vòng 7 ngày kể từ thời điểm giao hàng thành công.\r\n\r\n•	Hãy cung cấp video mở hộp sản phẩm để chứng minh lỗi do quá trình vận chuyển hoặc sản xuất để được giải quyết nhanh nhất.\r\n\r\n•	Hàng hóa phải còn đầy đủ phụ kiện đi kèm.\r\n\r\nCác trường hợp không đủ điều kiện đổi trả\r\n\r\n•	Sản phẩm bị hưu hỏng do lỗi của khách hàng\r\n\r\n•	Khách hàng không cung cấp được video/hình ảnh chứng minh vấn đề lỗi do nhà sản xuất và vận chuyển.\r\n\r\n•	Hàng hoàn về không còn đầy đủ phụ kiện ban đầu.\r\n\r\n\r\n\r\nĐiều kiện bảo hành\r\n\r\n\r\n\r\n•	Sản phẩm bị lỗi kỹ thuật do nhà sản xuất.\r\n\r\n•	Đã kích hoạt bảo hành online thông qua thẻ bảo hành đi kèm.\r\n\r\n•	Còn trong thời hạn bảo hành\r\n\r\n\r\n\r\nHình thức, chi phí đổi trả/ bảo hành:\r\n\r\n•	Hình thức đổi trả: Sidotech sẽ đổi sản phẩm mới 100% cho khách hàng nếu đủ điều kiện phía trên.\r\n\r\n•	Lệ phí đổi trả: Miễn phí vận chuyển đến tay khách hàng nếu xác định đúng lỗi do Sidotech.\r\n\r\n•	Hình thức bảo hành: Tùy vào mức độ hư hỏng Sidotech sẽ xác định sửa chữa hoặc đổi sản phẩm mới 100% cho khách.\r\n\r\n\r\n\r\n\r\n\r\n#chuot #may #tinh #gaming #co #day #vi #tinh #laptop #pc #silent #choi #game #thu #gia #re #combo #cong #thai #hoc #om #tay #led #sidotech #inphic #tat #am #chong #on #DPI #1200 #1600 #3000 #4000 #8800 #van #phong #p20 #p1w #ban #di #lot #chinh #hang #6nut #macro #chuotcoapp #app', '2025-06-29 03:44:07', '2025-06-29 03:44:07'),
(24, 24, 'Webcam Máy Tính PC Laptop Ziyou Q-20 Độ Phân Giải 2K Có Mic Camera Trợ Sáng Cực Nét', 'vn-11134207-7r98o-lx3dogriu1nfb3.webp', 289.000, 450.000, NULL, NULL, NULL, NULL, NULL, 'ZIYOU CAM KẾT\r\n\r\n-------------\r\n\r\nTOÀN BỘ SẢN PHẨM GỬI ĐI ĐỀU ĐÃ ĐƯỢC KIỂM TRA KỸ 100% TRƯỚC KHI ĐÓNG GÓI\r\n\r\n\r\n\r\nCAM KẾT BẢO HÀNH ĐÚNG THEO THÔNG TIN\r\n\r\n\r\n\r\nHOÀN 100% TIỀN NẾU NHẬN HÀNG BỊ LỖI, GIAO NHẦM\r\n\r\n\r\n\r\nHIỆN TẠI CÓ RẤT NHIỀU SẢN PHẨM GIỐNG MẪU MÃ NHƯNG CHẤT LƯỢNG KÉM HƠN -> ZIYOU CAM KẾT LUÔN BÁN SẢN PHẨM CÓ CHẤT LƯỢNG TỐT NHẤT\r\n\r\n\r\n\r\n🍀🍀🍀 Webcam Máy Tính, Camera Có Mic Cho Laptop Học Online Qua ZOOM, Trực Tuyến - Hội Họp - Gọi Video Hình Ảnh Sắc Nét\r\n\r\nWebcam Có Mic sẽ giúp người sử dụng có thể học online, trực tuyến qua zoom, hội họp trực tiếp thông qua chiếc máy tính, Cách sử dụng rất đơn giản không cần cài đặt, kết nối qua cổng USB máy tính, laptop sẽ tự nhật Driver và có thể sử dụng.\r\n\r\n- Thông số kĩ thuật độ phân giải : 1080P, 2K\r\n\r\n- Sản phẩm full box, new sẽ test trước khi giao hàng, bảo hành 12 tháng do lỗi nhà sản xuất\r\n\r\n- Tích hợp micro thu âm rõ nét chống ồn.\r\n\r\n- Trang bị chân đế đa năng có thể cài webcam ở mọi thiết bị.\r\n\r\n- Thích hợp với thiết bị Window, Mac ..', '2025-06-29 03:45:39', '2025-06-29 03:45:39'),
(25, 25, 'Giá đỡ LAPTOP, MACBOOK, IPAD GOLDTECH N4 bằng nhôm có thể điều chỉnh được độ cao, đế tản nhiệt kê laptop', 'vn-11134207-7ra0g-m795xp8xty5vb1.webp', 61.000, 100.000, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-29 03:46:58', '2025-06-29 03:46:58'),
(26, 26, 'Bộ chuột bàn phím Bluetooth cho iPad Android iOS Máy tính bảng Bàn phím không dây 10 inch đầy màu sắc', 'cn-11134207-7r98o-lxlznnry074z47@resize_w900_nl.webp', 61.000, 258.000, NULL, NULL, NULL, NULL, NULL, 'Chào mừng đến với Cửa hàng địa phương Danycase \r\n\r\n \r\n\r\n✅ Đơn hàng của bạn sẽ được chuyển từ Thành phố Hồ Chí Minh và giao hàng trong vòng 2-4 ngày!\r\n\r\n\r\n\r\n✅ Theo dõi chúng tôi để nhận phiếu giảm giá và cửa hàng của chúng tôi sẽ cung cấp các chương trình khuyến mãi bất thường với chiết khấu\r\n\r\n\r\n\r\n✅ Sản phẩm này đi kèm với \"Phản hồi phần thưởng\". Nếu bạn hài lòng với sản phẩm và dịch vụ của chúng tôi, những đánh giá tích cực sẽ tìm thấy Shopee Coin\r\n\r\n\r\n\r\nNếu bạn có bất kỳ câu hỏi nào, xin vui lòng liên hệ với chúng tôi!\r\n\r\n\r\n\r\n------------------------------------------------------------------------------------------\r\n\r\nSuit 1 = Bộ bàn phím 2 = Bàn phím + Chuột\r\n\r\nSuit 1 = Bộ bàn phím 2 = Bàn phím + Chuột\r\n\r\nSuit 1 = Bộ bàn phím 2 = Bàn phím + Chuột\r\n\r\nSuit 1 = Bộ bàn phím 2 = Bàn phím + Chuột\r\n\r\nSuit 1 = Bộ bàn phím 2 = Bàn phím + Chuột', '2025-06-29 03:48:46', '2025-06-29 03:48:46'),
(27, 27, 'Máy bay Điều khiển từ xa Drone JJRC H121, Camera HD kết nối điện thoại, Đồ chơi Máy bay xốp dễ điều khiển - Sunny Kids', 'vn-11134207-7ras8-m1rydsx91opfad.webp', 433.000, 538.500, NULL, NULL, NULL, NULL, NULL, 'Máy bay Điều khiển từ xa Drone JJRC H121, Camera HD kết nối điện thoại, Đồ chơi Máy bay xốp dễ điều khiển - Sunny Kids', '2025-06-29 03:49:57', '2025-06-29 03:49:57'),
(28, 28, 'Ốp Lưng iPhone siêu mỏng Da Sang Trọng Tương Thích Họa tiết Litchi Hà Không Vân Tay Ốp điện thoại Trơn Silicon mềm màu kẹo cát màu....', 'sg-11134201-7repn-m20gudtkhlrz46.webp', 12.000, 27.000, NULL, NULL, NULL, NULL, NULL, '📣📣📣 Chào mừng đến với cửa hàng Gourde 💕 💕 💕\r\n\r\n Vui lòng thêm cửa hàng của chúng tôi vào danh sách sau của bạn và bạn sẽ là VIP của chúng tôi để được giảm giá đặc biệt cho bạn.\r\n\r\n 💎 💎💎 100% thương hiệu mới chất lượng cao, chúng tôi hứa sẽ cung cấp cho bạn chất lượng tốt giá tốt nhất.\r\n\r\n Các tính năng: Giá đỡ dây quản lý tổ chức cáp thời trang mới 🔥 🔥🔥\r\n\r\n “Ốp lưng chống va đập ”\r\n\r\n Vỏ được làm bằng tpu dẻo cao cấp, ốp lưng chống trượt có thể uốn cong có khả năng chống sốc, có thể bảo vệ iPhone của bạn một cách chắc chắn.\r\n\r\n “Hỗ trợ bộ sạc không dây ”\r\n\r\n Có THỂ LÀM VIỆC với bộ sạc không dây. Vỏ TPU tương thích với iPhone 11-14 Pro Max\r\n\r\n \"Nút xúc giác tinh tế ”\r\n\r\n Truy cập vào tất cả các cổng, điều khiển và cảm biến. Các nút cảm nhận nhạy bén\r\n\r\n Dịch vụ của chúng tôi > > >\r\n\r\n 🤙 Vận chuyển nhanh 24 giờ + trả lời nhanh chóng và nhiệt tình + thái độ tích cực;\r\n\r\n 🤙 Giải quyết nhanh chóng các vấn đề cho từng khách hàng;\r\n\r\n 🤙 ✨ Hủy hỗ trợ vận chuyển! Hỗ trợ trộn màu! Hỗ trợ bán buôn!✨\r\n\r\n -> 💖 💖 💖Thông tin sản phẩm💖 💖 💖\r\n\r\n 🤙Nhà máy bán hàng trực tiếp, giá thấp nhất, chất lượng tốt nhất\r\n\r\n 🤙Mực in cao cấp, sắc nét, không phai, không gây hại cho da,\r\n\r\n 🤙 Hình ảnh thiết kế đẹp mắt, phong cách, trẻ trung.\r\n\r\n 🤙Dễ sử dụng, nhẹ, kết cấu và đường khâu trang nhã.\r\n\r\n 🤙Vừa vặn với điện thoại của bạn một cách hoàn hảo, dễ dàng tháo lắp.\r\n\r\n 🤙Hình ảnh sản phẩm giống nhau 100%.\r\n\r\n 🤙100% chất lượng bìa đảm bảo.\r\n\r\n 🤙Loại: Vỏ chống va đập\r\n\r\n ❗❗❗Các cặp mô hình iphone sử dụng cùng một trường hợp❗❗❗\r\n\r\n Thương hiệu tương thích: Apple iPhone\r\n\r\n Ốp lưng cho iPhone 7Plus = iPhone 8Plus; (chọn: iPhone 7Plus / 8Plus)\r\n\r\n Ốp lưng cho iPhone X = iPhone XS; (chọn: iPhone X / XS)\r\n\r\n Vỏ cho iphone XR\r\n\r\n Ốp lưng cho iphone XSMAX\r\n\r\n Vỏ cho iphone 11\r\n\r\n Ốp lưng cho iphone 11 Pro\r\n\r\n Ốp lưng cho iphone 11 Promax\r\n\r\n Ốp lưng cho iphone 12\r\n\r\n Ốp lưng cho iphone 12Pro\r\n\r\n Ốp lưng cho iphone 12Promax\r\n\r\n Ốp lưng cho iphone 13\r\n\r\n Ốp lưng cho iphone 13Pro\r\n\r\n Ốp lưng cho iphone 13Promax\r\n\r\n Ốp lưng cho iphone 14\r\n\r\n Ốp lưng cho iphone 14Pro\r\n\r\n Ốp lưng cho iphone 14Promax\r\n\r\n Ốp lưng cho iphone 15\r\n\r\n Ốp lưng cho iphone 15Pro\r\n\r\n Ốp lưng cho iphone 15Promax\r\n\r\n Ốp lưng cho iphone 16\r\n\r\n Ốp lưng cho iphone 16Pro\r\n\r\n Ốp lưng cho iphone 16Promax\r\n\r\n Danh sách đóng gói:\r\n\r\n Gói bao gồm 1 x Vỏ chống va đập\r\n\r\n ✅Nếu có vấn đề với sản phẩm, vui lòng liên hệ với shop của tôi ngay khi bạn nhận được gói hàng. Chúng tôi sẽ cố gắng hết sức để giải quyết vấn đề cho bạn.\r\n\r\n Một đánh giá tiêu cực sẽ không giúp giải quyết vấn đề! Cảm ơn! Xin đừng ngại cho chúng tôi một đánh giá xấu\r\n\r\n ⭐⭐⭐⭐⭐Nếu bạn hài lòng với sản phẩm và dịch vụ của chúng tôi, vui lòng giúp chúng tôi đánh giá năm sao. Vui lòng dành một phút để lại phản hồi tích cực của bạn. Cảm ơn bạn! ⭐⭐⭐⭐⭐\r\n\r\n 🌷 🌷 🌷Lời chúc tốt nhất 🌷 🌷 🌷\r\n\r\n ﻿\r\n\r\n #iphone #phone #appleIP #casing #cover #iphone11 Trường hợp chuyên nghiệp #iphone 13 ProMax #skin Ốp lưng iphone #transparent Trường hợp có viền vuông #iphone Trường hợp xr trường hợp Hình vuông #edge Ốp lưng iphone #iphone Trường hợp bảo vệ máy ảnh #camera Bảo vệ #protective Trường hợp', '2025-06-29 03:51:11', '2025-06-29 03:51:11'),
(29, 29, 'Đèn học LED bảo vệ mắt chống cận cảm ứng Rhino L201, tích điện đa năng làm việc, để bàn học', 'sg-11134201-23020-o0151c71wanv8d.webp', 87.000, 145.000, NULL, NULL, NULL, NULL, NULL, 'Đèn học LED bảo vệ mắt chống cận cảm ứng Rhino L201, tích điện đa năng làm việc, để bàn học, đọc sách, đèn ngủ nhiều chế độ sáng, đèn led chính hãng', '2025-06-29 03:52:35', '2025-06-29 03:52:35'),
(30, 30, 'Tzuzl 2024 Tai nghe không dây MỚI Bluetooth 5.3 Tai nghe đeo cổ Màn hình LED chơi game Tai nghe HIFI Tai nghe thể thao Tai nghe nhét tai....', 'sg-11134201-7rcdo-lsgmsl01tlh66d.webp', 108.000, 211.306, NULL, NULL, NULL, NULL, NULL, 'Thương hiệu mới và chất lượng cao\r\n\r\n Loại: Tai nghe Bluetooth\r\n\r\n Vật chất: ABS + TPE + Linh kiện điện tử\r\n\r\n Pin: Pin sạc 280mAh tích hợp (Đi kèm)\r\n\r\n Độ nhạy: 101,7dB + / 3dB\r\n\r\n Chip: Bluetooth 5.3\r\n\r\n Sạc hiện tại: 5V = 1A\r\n\r\n Phiên bản Bluetooth: 5.1 + EDR\r\n\r\n Tỷ lệ tín hiệu trên tiếng ồn: 95dB\r\n\r\n Màu sắc: Đen, Vàng\r\n\r\n Gói bao gồm:\r\n\r\n 1 x Tai nghe Bluetooth\r\n\r\n 1 x Cáp sạc USB\r\n\r\n \r\n\r\n Các tính năng:\r\n\r\n 1.Chip Bluetooth 5.3 mang đến tốc độ cao và đường truyền ổn định, có khả năng chống nhiễu mạnh mẽ. Bạn sẽ cảm thấy thoải mái khi đeo tai nghe với thiết kế tiện dụng.\r\n\r\n 2.Nó được làm bằng ABS, TPE cao cấp và vật liệu linh kiện điện tử. Nó là đáng tin cậy và bền.\r\n\r\n 3.Nó phù hợp cho thể thao, du lịch, v.v.\r\n\r\n 4.Hỗ trợ thẻ nhớ\r\n\r\n \r\n\r\n Lời khuyên:\r\n\r\n 1. Do hiệu ứng ánh sáng và màn hình, màu sắc có thể có sự khác biệt nhỏ.\r\n\r\n 2. Vui lòng cho phép lỗi kích thước nhỏ do đo lường thủ công. Cảm ơn sự hiểu biết của bạn!', '2025-06-29 03:54:14', '2025-06-29 03:54:14');

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
(1, 1, '132909f048482d8d984a069b76f58788 (2).webp', '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(2, 1, 'c.webp', '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(3, 1, '98c357b90681f99d05ce605e8283a4d0.webp', '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(4, 1, '7aad8b5f3d542bff9d067d80d396edaa.webp', '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(5, 1, 'f117457327883af148b472362e1536e0.webp', '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(6, 1, 'afe044f6a738557701937803f8fd8709.webp', '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(7, 1, 'e25f6b1aa248d785c1bca0c1bfeb36e8', '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(8, 1, '46ae1e959d8fbbb4e735fe4a4fa19c17.webp', '2025-06-23 19:15:08', '2025-06-23 19:15:08');

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
(1, 1, 1, 5, NULL, '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(2, 1, 1, 5, NULL, '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(3, 1, 1, 3, NULL, '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(4, 1, 1, 1, NULL, '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(5, 1, 1, 1, NULL, '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(6, 1, 1, 5, NULL, '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(7, 1, 1, 2, NULL, '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(8, 1, 1, 2, NULL, '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(9, 1, 1, 4, NULL, '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(10, 1, 1, 1, NULL, '2025-06-23 19:15:08', '2025-06-23 19:15:08');

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
('S7qoCk9jKdLb9XhtPU10AvqLagJkHGlSR8UChEDQ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWjRqYTZUZllvakNiSnp2YW9LcFRuTXRCcXRhZ1V5TUtjNWxZWERjTCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wcm9kdWN0cy8xL2RldGFpbCI7fX0=', 1751185610);

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
(1, 1, 'Skiles-Weimann', 'd668c47b-718c-3440-abe5-a1575490ae61', 'delivered', '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(2, 1, 'Nicolas-Johns', 'd486e7dd-a4d4-3a1a-b9da-1dfa581e6a1d', 'delivered', '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(3, 1, 'Labadie, Morar and Fahey', 'cf6d5318-8bf3-3596-a5d0-21d3abb87f71', 'delivered', '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(4, 1, 'Brekke-Cole', '5507ffd5-3942-3816-b322-f5cfac80a944', 'shipped', '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(5, 1, 'Maggio-Toy', '99b58f1b-65e8-346d-a475-a2ed6037db71', 'processing', '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(6, 1, 'Wyman, Ruecker and Dietrich', '9a79586d-ecf1-3692-837d-7716008b835d', 'shipped', '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(7, 1, 'Grant-Ullrich', '04bb76a4-da32-3e1d-b28c-1bc4276ddf07', 'processing', '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(8, 1, 'Dach, Auer and Russel', '8bd4372d-c23a-303c-a203-9c8fb3653880', 'delivered', '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(9, 1, 'Gorczany PLC', 'fb88ab5f-fecd-36fd-9b65-bff4f5d0e68e', 'shipped', '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(10, 1, 'VonRueden, Hayes and Bailey', '8d806b73-83b4-3797-8172-6c18d398eda2', 'delivered', '2025-06-23 19:15:08', '2025-06-23 19:15:08');

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
(1, 'Meaghan Stark V', 'dbernier@example.org', '$2y$12$x3W8eUVl0ina1/lgDBW8Eenfz1BYoi8h2Wj7FXlJnQ2.ZRNCxRO9C', '+1-445-591-9303', '79103 Sadie Lights\nLake Cynthiaberg, NH 31934-6811', 'customer', '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(2, 'Trystan Mertz', 'herbert.stark@example.com', '$2y$12$YMmI1iP4mBAJrDPLQBmf4eMsGQJOHx7xDj2MEcVbw1g8sUrJBHYc2', '978.387.6915', '363 Reba Heights\nTorpfort, OH 04847', 'seller', '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(3, 'Ms. Carolyne Breitenberg', 'slangworth@example.com', '$2y$12$0zWAtccuc6y.cop1c6W/8Oa.6O1Dmb7eU.CYa.RyMe9Ut91AeYHY.', '(559) 260-2288', '2694 Friesen Cape\nEast Gonzalofort, NC 41380-1609', 'admin', '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(4, 'Jared Beier', 'casper.brandi@example.org', '$2y$12$aAKXHZ97zVsGELt1YI5ve.ClMzUQVuyNE37NtlP08Ya.f1eGQgUCK', '+15712441322', '50616 Paula Valley\nSouth Zachariah, ID 20046-8543', 'customer', '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(5, 'Otho Botsford', 'grant.shea@example.com', '$2y$12$f31LWu6y4ue6dx0jtcXSnuxdR01Xf0zt4pZCghvaxLAzmkeDrLCmK', '+1-346-401-0438', '36012 Marquardt Route Apt. 577\nKoeppberg, NY 46508-8923', 'seller', '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(6, 'Alek Kilback', 'gladyce.hoppe@example.net', '$2y$12$rAOj.6gce6nISywouk4oiu6C9Pd8wpk8v7gLk9UPmu.8yFzia1V12', '325-273-5825', '1173 Leilani Road\nLake Paige, OK 59440-7137', 'admin', '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(7, 'Dr. Anjali Bogisich DVM', 'hermina.klocko@example.org', '$2y$12$NcZAaeoVUEhUHrS/C68gDO85pathZuToNEhYN3EOtPpUusP5DC1n6', '1-641-397-9147', '65707 Elvie Isle\nWest Norris, TX 06211', 'admin', '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(8, 'Brennon Hills III', 'rosenbaum.laila@example.net', '$2y$12$2B4nrrOV4ZI2lbHj.fdZH.wCNGPMDexcOaqZRvy/zHxmJ0BcANPAy', '240.625.9620', '650 Arnold Harbor Apt. 230\nPort Freida, IA 29129-0269', 'admin', '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(9, 'Prof. Khalid Bergnaum PhD', 'kay15@example.com', '$2y$12$IaEFIzeIHDlsWbM5BOMN0.XjEwmAVJ/1OSnIPxF.G.2Dor9kj61Au', '445-853-8474', '326 Abbie Green Suite 420\nWest Roxannefurt, IA 06338', 'admin', '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(10, 'Prof. Gussie Bogan V', 'wiza.jessie@example.net', '$2y$12$F2G8BGYnPYjWw530zc1dBOG0Lg/8O4.z1hS4Y0XZkgcNiAkeoh.Qm', '1-806-378-4364', '5269 Boehm Circle\nNew Garlandhaven, IA 88299', 'admin', '2025-06-23 19:15:08', '2025-06-23 19:15:08');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

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
-- Chỉ mục cho bảng `product_details`
--
ALTER TABLE `product_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_details_product_id_foreign` (`product_id`);

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
-- AUTO_INCREMENT cho bảng `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT cho bảng `product_details`
--
ALTER TABLE `product_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

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
-- Các ràng buộc cho bảng `product_details`
--
ALTER TABLE `product_details`
  ADD CONSTRAINT `product_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

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
