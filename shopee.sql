-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 25, 2025 lúc 06:31 AM
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
(3, 'Thiết bị điện tử', 'thiết bị điện tử.webp', 'Thiết bị điện tử', NULL, '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(4, 'Máy tính và laptop', 'máy tính và laptop.webp', 'Máy tính và laptop', NULL, '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(5, 'Máy ảnh và quay phim', 'máy ảnh và quay phim.webp', 'Máy ảnh và quay phim', NULL, '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(6, 'Đồng hồ ', 'đồng hồ.webp', 'Đồng Hồ', NULL, '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(7, 'giày dép nam', 'giaydepnam.webp', 'giày dép nam', NULL, '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(8, 'Thiết bị gia dụng', 'thietbigiadung.webp', 'Thiết bị gia dụng', NULL, '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(9, 'Thể thao và du lịch', 'thethaodulic.webp', 'Thiết bị và du lịch', NULL, '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(10, 'Ô tô và xe đạp', 'otovaxedep.webp', 'Ô tô và xe đạp', NULL, '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(11, 'Thời trang nữ', 'thoitrangnu.webp', 'Thời trang nữ', NULL, '2025-06-27 12:55:17', '2025-06-27 12:55:17'),
(12, 'Sức khoẻ', 'suckhoe.webp', 'Sức khoẻ', NULL, '2025-06-21 12:56:17', '2025-06-19 12:56:17'),
(13, 'Mã giảm giá', 'mã giảm giá.jpg', 'mã giảm giá', NULL, '2025-06-19 12:57:15', '2025-06-25 12:57:15'),
(14, 'Phụ kiện và trang sức', 'phukienvatrangsuc.webp', 'Phụ kiện và trang sức', NULL, '2025-06-27 13:00:12', '2025-06-27 13:00:12'),
(15, 'Voucher và Dịch vụ', 'voucher&dichvu.webp', 'Voucher và dịch vụ', NULL, '2025-06-18 13:02:54', '2025-06-27 13:02:54'),
(17, 'SamSung', 'samsung.jpg', 'SamSung', NULL, '2025-06-20 13:10:57', '2025-06-21 13:10:57'),
(18, 'Nhà sách', 'nhasach.webp', 'Nhà sách', NULL, '2025-06-27 13:11:34', '2025-06-14 13:11:34'),
(19, 'Bách hoá online', 'bachhoaonline.webp', 'Bách hoá online', NULL, '2025-06-12 13:12:32', '2025-06-20 13:12:32'),
(20, 'Dịch vụ và thiết bị tiện ích', 'e4fbccba5e1189d1141b9d6188af79c0@resize_w640_nl.webp', 'Dịch vụ và thiết bị tiện ích', NULL, '2025-06-27 13:23:42', '2025-06-27 13:23:42'),
(21, 'giày dép nữ', '48630b7c76a7b62bc070c9e227097847@resize_w640_nl.webp', 'giày dép nữ', NULL, '2025-06-06 13:24:35', '2025-06-20 13:24:35');

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
(1, 'Áo Thun Polo Nam Thêu Chữ U,Chất Liệu Thấm Hút Mồ Hôi,Cổ Phối Màu', 'vn-11134207-7r98o-lrol6kavr6hl42.webp', 'CAM KẾT - ĐẢM BẢO:\n\n- Đảm bảo vải chuẩn cotton chất lượng cao.\n\n- Hàng có sẵn, giao hàng ngay khi nhận được đơn đặt hàng .\n\n- Hoàn tiền 100% nếu sản phẩm lỗi, nhầm hoặc không giống với mô tả.\n\n- Chấp nhận đổi hàng khi size không vừa (vui lòng nhắn tin riêng cho shop).\n\n- Giao hàng toàn quốc, thanh toán khi nhận hàng.\n\n- Hỗ trợ đổi trả theo quy định của Shopee.\n\nCAM KẾT - ĐẢM BẢO:\n\n- Đảm bảo vải chuẩn cotton chất lượng cao.\n\n- Hàng có sẵn, giao hàng ngay khi nhận được đơn đặt hàng .\n\n- Hoàn tiền 100% nếu sản phẩm lỗi, nhầm hoặc không giống với mô tả.\n\n- Chấp nhận đổi hàng khi size không vừa (vui lòng nhắn tin riêng cho shop).\n\n- Giao hàng toàn quốc, thanh toán khi nhận hàng.\n\n- Hỗ trợ đổi trả theo quy định của Shopee.', 39.000, 426, 1, 1, '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(2, 'Áo sơ mi nam kiểu dáng basic TOPMEN khoác ngoài chất vải kaki cao cấp trẻ trung năng động phù hợp cả mặc đi làm, đi chơi', 'sg-11134201-23010-3eds9jmvivlv8d.webp', '\n   SHOP CAM KẾT\n- Sản phẩm Áo sơ mi kaki basic giống mô tả 100%\n- Hình ảnh sản phẩm là ảnh thật, các hình hoàn toàn do shop tự thiết kế.\n- Kiểm tra  cẩn thận trước khi gói hàng giao cho Quý Khách\n- Hàng có sẵn, giao hàng ngay khi nhận được đơn \n- Hoàn tiền nếu sản phẩm không giống với mô tả\n- Chấp nhận đổi hàng khi size không vừa trong 3 ngày.\n\n   HỖ TRỢ ĐỔI TRẢ THEO QUY ĐỊNH CỦA SHOPEE\n- Điều kiện áp dụng (trong vòng 2 ngày kể từ khi nhận sản phẩm) \n- Hàng hoá bị rách, in lỗi, bung chỉ, và các lỗi do vận chuyển hoặc do nhà sản xuất.\n1. Trường hợp được chấp nhận: \n- Hàng giao sai size khách đã đặt hàng \n- Giao thiếu hàng \n2. Trường hợp không đủ điều kiện áp dụng chính sách: \n- Quá 2 ngày kể từ khi Quý khách nhận hàng \n- Gửi lại hàng không đúng mẫu mã, không phải sản phẩm của shop\n- Không thích, không hợp, đặt nhầm mã, nhầm màu,... ', 99.000, 89, 1, 4, '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(3, 'Bộ Đồ Nam Nữ Unisex Mùa Hè Ngắn Tay Cổ Tròn Họa Tiết Loang Vẩy Sơn Hot Trend Thời Trang Zenkonu QA NAM 104', '132909f048482d8d984a069b76f58788.webp', 'Bộ Đồ Nam Nữ Unisex Mùa Hè Ngắn Tay Cổ Tròn Họa Tiết Loang Vẩy Sơn Hot Trend Thời Trang Zenkonu QA NAM 104\n\n* THÔNG TIN SẢN PHẨM:\n\n🔸Chât liệu: vải thun lạnh mềm mại.\n\n🔸 Kích thước: XS   S   M   L    XL\n\n🔸 Xuất xứ: Việt Nam\n\nVới thiết kế trẻ trung năng động, phù hợp nhiều hoàn cảnh, phong cách Ulzzang cập nhập xu hướng mới nhất.\n\n* Chi tiết Size:\n\nSize XS: cho bạn có cân nặng từ 40 - 45kg tùy chiều cao \n\nSize S: cho bạn có cân nặng từ 45 - 50kg tùy chiều cao \n\nSize M: cho bạn có cân nặng từ 50 - 55kg tùy chiều cao \n\nSize L: cho bạn có cân nặng từ 55 - 60kg tùy chiều cao \n\nSize XL: cho bạn có cân nặng từ 60 - 65kg tùy chiều cao \n\n🔰 Thông tin thêm:\n\n- Để bảo quản áo cũng như chất liệu hình in, shop khuyên bạn lộn mặt trái khi giặt và ủi nha\n\n- Bảng size chỉ mang tính chất tham khảo, tùy thuộc hình thể mỗi người và chất liệu nên có chênh lệch. Hãy ibox cho shop khi cần tư vấn cụ thể nha ^^\n\n Hãy theo dõi để ủng hộ shop và cập nhập các chương trình khuyến mãi cũng như các mẫu sản phẩm mới nhất của shop nhé!\n\n🔸 Lưu ý: Shop chỉ hỗ trợ xử lý đơn hàng đổi trả trong vòng 15 ngày kể từ khi giao hàng thành công!', 55.000, 173, 1, 2, '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(4, '🔥 SỐC 🔥 Thắt lưng nam da cao cấp khóa hợp kim tự động sang trọng lịch lãm - Nịt da bảo hành 12 tháng', 'vn-11134207-7r98o-ls5qxklob6ah16.webp', 'Hatter. \'He won\'t stand beating. Now, if you like!\' the Duchess said in a coaxing tone, and everybody else. \'Leave off that!\' screamed the Gryphon. \'Turn a somersault in the pool as it went. So she.', 1.000, 89, 1, 5, '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(5, 'ÁO THUN TRƠN ĐEN TRẮNG BASIC NAM NỮ CỔ TRÒN BAO MỊN', 'vn-11134258-7ras8-mb6jjcl02xnc6b.png', 'Anubis Store - UNISEX CLOTHING - MẪU MÃ LẠ - CUNG CẤP VÀ IN ẤN ÁO THUN THEO YÊU CẦU CHO CÁ NHÂN, DOANH NGHIỆP, TEAMBUILDING\n\nLƯU Ý CHO SẢN PHẨM:\n\n- VUỐT ẢNH SANG BÊN PHẢI ĐỂ XEM CÁC MẪU \n\n✔ Nếu khách muốn mặc áo theo dạng form rộng, theo chuẩn xu hướng hiện nay, xin vui lòng chọn lớn hơn từ 1-2 size\n\n+ Mặc ở nhà, đi tập thể thao, hay kết hợp với quần/váy... đều đẹp\n\n+ Size cơ bản theo chuẩn quốc tế cho UNISEX (cả nam và nữ)\n\n+ Có các Size: S M L XL XXL ( ib size hoặc ghi chú size trong đơn hàng giúp shop nha)\n\n+ Có cả size cho 110kg, lh shop lấy link bigsize nhen hoặc vào shop xem ạ\n\n✔ Với đơn hàng từ 50k, bạn được add mã MIỄN PHÍ VẬN CHUYỂN của Shopee phát hành vào đơn hàng.\n\n------ Size tham khảo: (Lưu Ý: đây là áo form suông vừa, không rộng.Nếu Khách muốn mặc rộng vui lòng đặt lớn hơn 1 size)\n\n▶ QUYỀN LỢI CỦA KHÁCH HÀNG:\n\n✔ Được mua sản phẩm đúng như trên ảnh và đúng như mô tả.\n\n✔ Mọi thắc mắc xin hãy vui lòng nhắn tin cho Shop, Shop sẽ tư vấn cho bạn nhiệt tình, bất kể ngày đêm.\n\n✔ Nếu sản phẩm của Shop gửi sai hoặc phát sinh lỗi, Shop sẽ hỗ trợ đổi trả ngay và luôn, không lòng vòng.\n\n\n\nXIN CẢM ƠN QUÝ KHÁCH ĐÃ THAM KHẢO !\n\n #aothungiasi #aothunnam #aothuncotron #aothuncotton #aothunin #aothunnu #ao #thoitrangnamnu #aothun #aothuningiasi #Anubis Store #aothuntrend #aothun #aothuntron #aoanime #unisex \n\naothun #unisex #freesize #taylo #ao #thun #anhstore #inhinh #hanquoc #formrong #fullbox #aothununisex #aothuntaylo #aophong #nam #nu #tay #lo #phong #dai #ngan #form #rong #co #tron\n\n#aothunnam #aothun #aophong #taylo #aothunnu #taydai #aophongnu #aothununisex #aoformrong #aophongrong #aocotron #cotton #trang #tron #dep #cotron #aothunrong #den #cao #cap #caocap #aotee #tee #nelly #aodoi #oversize #in #hinh #inhinh', 55.000, 144, 1, 4, '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(6, 'Áo thun nam nữ tay lỡ Angel Devil, áo phông cotton from rộng freesize unisex AD-Trend', 'vn-11134258-7ras8-mb6jnsu1lznld5.png', '\nTHÔNG TIN SẢN PHẨM:\n• Áo thun nam nữ unisex tay lỡ Angel Devil, áo phông cotton freesize AD-Trend\n• Kiểu dáng: Unisex, Freesize, Tay lỡ, Form rộng\n• Xuất sứ: Việt Nam\n• Chất liệu: Poly , cotton co dãn, không xù\n• Họa tiết: In\n• Màu sắc: Đen, Trắng\n\nSIZE: M, L, XL:\nUnisex form rộng có 3 size phù hợp hầu hết mọi lứa tuổi:\n• Size M: Dài 67Cm, Rộng 51Cm, Dài tay áo 25Cm (Dưới 1m6, dưới 46Kg)\n• Size L: Dài 70Cm, Rộng 53Cm, Dài tay áo 25Cm (1m6 - 1m7, 46Kg - 65Kg)\n• Size XL: Dài 73Cm, Rộng 56Cm, Dài tay áo 25Cm (1m7 - 1m75, 66Kg - 75Kg)\n\n\nJIMY OFFICIAL CAM KẾT:\n• Form dáng của sản phẩm đẹp chuẩn như hình.\n• Đảm bảo vải chất lượng Poly, cotton.\n• Tất cả các đơn hàng trước khi gửi đi đều được kiểm tra kĩ lưỡng, đóng gói cẩn thận.\n• Hàng có sẵn, giao hàng ngay khi nhận được đơn.\n• Giao hàng toàn quốc, nhận hàng thanh toán.\n• Hỗ trợ trả hàng trong 6 ngày (Từ khi nhận hàng)\n\nDo màn hình và điều kiện ánh sáng khác nhau, màu sắc thực tế của sản phẩm có thể chênh lệch khoảng 3-5%', 29.000, 195, 1, 2, '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(7, 'Bộ Quần Áo Nam HDSHOP Đồ Bộ Nam Cộc Tay ICON DSQ Hoạ Tiết Chất Vải Cotton Cao Cấp Co Dãn 2 màu đen Trắng', 'vn-11134201-7r98o-ly4fvzalrc1v5e.webp', 'Bộ Hè Nam HDSHOP Bộ Quần Áo Nam Mùa hè BỘ Nam ICON DSQ Hoạ Tiết Chất Vải Cotton Cao Cấp Co Dãn 2 Màu Đen Trắng\n\n\n\n⚠️ LƯU Ý ⚠️ Sản phẩm shop đều chỉ bán hàng loại 1 bộ nam chất vải thun thể thao co dãn phong cách đạt tiêu chuẩn tránh nhầm lẫn với các hàng loại 2,của các shop khác  giá rẻ nhái mẫu tràn lan ngoài thị trường chất lượng kém nhanh bai gião, xù lông xù chỉ bai màu.mẫu bên shop đều in 3d trên áo sẽ In 3d hoặc thêu Theo từng mẫu.\n\n\n\n🌈 Đồ Bộ NAM NỮ CHUẨN FORM DÁNG HÀN QUỐC Năng Đông Trẻ Chung HOT TREND \n\n\n\n\n\n✔️ Chất Liệu: Poly Cotton Thể Thao Cotton Co Dãn\n\n✔️ Kiểu dáng: Đồ bộ nam thể thao basic cực dễ phối đồ .phù hợp mặc ở nhà đi chơi dã ngoại\n\n✔️ Thiết Kế Độc Đáo:Bộ nam Thêu hoăc in 3d ko bị bay màu  cực cá tính và phong cách,...\n\n✔️ Màu sắc: Đồ Bộ  Nam Nữ Đủ màu basic cực dễ tôn da tôn dáng, phối đồ,...\n\n\n\n✔️ HƯỚNG DẪN CHỌN SIZE: Đồ Bộ Nam Thể Thao Phong Cách\n\n- Size M từ35 45kg, cao dưới 1m6 / dài 66cm, rộng 51cm, \n\n- Size L từ45.62kg, cao dưới 168 / dài 68cm, rộng 52cm, \n\n- Size XL từ 63.73 kg,cao dưới 1m71 / dài 71cm, rộng 54cm,\n\n- Size XXL Cao 1m70 - 1m80. dưới 85kg. dài 75cm, rộng 56cm', 99.750, 307, 1, 5, '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(8, 'Đồ Bộ Nam HD shop Bộ Quần Áo Nam Ngắn Tay In Hình Tia sét Chất Vải Thun Thể Thao Cotton Cao Cấp Co Dãn 4 Chiều', 'vn-11134201-7r98o-ly4fvv1pz26bf0.webp', 'Bộ Nam Hè - Đồ Bộ Nam Ngắn Tay In Hình Tia set Chất Vải Thun Thể Thao Cotton Cao Cấp Co Dãn 4 Chiều MÃ TiasET\n\n\n\nSize M - L - XL\n\nGiá rẻ nhất thị trường,\n\nmọi người thấy shop khác rẻ hơn cũng đừng vội đánh giá, vì chất lượng chưa chắc đã phải hàng cao cấp.\n\n  \n\n✔️ Tên Đơn Vị Sản Xuất : Xưởng May Hoang Duy\n\n✔️ Địa Chỉ Sản Xuất: Xóm 8 Mỹ Thắng Mỹ Lộc Nam Định\n\n\n\n\n\nChất liệu: Thun lạnh cao cấp, hàng vải xuất dư, hàng may công ty với đường may chắc chắn, chữ ép logo decal rất bền ko bong khi giặt, sản phẩm không bài không xù khi giặt, có thể giặt máy thoải mái nha quý khách. Là hàng đẹp nên khách không nên so sánh giá với những loại rẻ tiền chất liệu thông thường hay loại freesize ạ. Size số chuẩn và form to nha khách.\n\n\n\n• Thiết kế : 3 size\n\nSize M : Từ 45 – 53 Kg\n\nSize L  : Từ 54 – 60Kg\n\nSize XL: Từ 60– 75kg\n\nLƯU Ý: Size shop ghi là tham khảo theo cân nặng, Bạn nào béo, cao, có bụng, thích mặc phom rộng hoặc ôm thì còn tùy thuộc vào chiều cao,vui lòng chat với shop\n\nđể được tư vấn.\n\n➡️Thiết kế thể thao sang trọng - thoải mái\n\n➡️Hàng đảm bảo y hình 100%', 65.000, 227, 1, 1, '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(9, 'Đồ Bộ Nam Hè.hdshop đồ Bộ Nam Hè Tia Sét Phối Tay Thể Thao Đủ Size Chất Vải Thun Cotton Co Dãn 2 Màu Đen Trắng', 'vn-11134258-7ras8-mb6jloxumto387.png', 'Đồ Bộ Nam Hè. Bộ Nam Mùa Hè Tia Sét Phối Tay Thể Thao Đủ Size Chất Vải Thun Cotton Co Dãn 2 Màu Đen Trắng\n\n\n\n⚠️ LƯU Ý ⚠️ Sản phẩm shop đều chỉ bán hàng loại 1 bộ nam chất vải thun thể thao co dãn phong cách đạt tiêu chuẩn tránh nhầm lẫn với các hàng loại 2,của các shop khác  giá rẻ nhái mẫu tràn lan ngoài thị trường chất lượng kém nhanh bai gião, xù lông xù chỉ bai màu.mẫu bên shop đều in 3d trên áo sẽ In 3d hoặc thêu Theo từng mẫu.', 89.000, 246, 1, 1, '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(10, '⚡️ Sốc ⚡️Thắt lưng mặt xoay nam thắt lưng nam cao cấp 007xmen - Nịt nam thời trang dây nịt da khóa tự động', 'vn-11134207-7ras8-m2fnqdxc5meq01@resize_w900_nl.webp', '⚡️ Sốc ⚡️Thắt lưng mặt xoay nam thắt lưng nam cao cấp 007xmen - Nịt nam thời trang dây nịt da khóa tự động\n\n\n\nShop luôn cập nhật những mẫu mã thắt lưng nam mặt xoay mới nhất, hot nhất thị trường, khách hàng hãy ấn theo dõi shop để xem đc các sản phẩm dây lưng nam cao cấp mới nhất nhé.', 10.000, 385, 1, 5, '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(11, 'HIP Áo thun ngắn tay local brand fashion áo phông nam nữ unisex bigsize vintage 230g cotton', 'vn-11134207-7r98o-lxnnny0wnw7tb9.webp', 'HIPHOPPUNKS CAM KẾT:\r\n﻿\r\n◾ Chất liệu vải Cotton 100% co dãn 2 chiều, Định lượng cao 230gsm, \r\n﻿\r\n◾ Vải chính phẩm đã qua xử lý co rút, và lông thừa\r\n﻿\r\n◾ chất vải mềm mịn dày nhưng cực kì mát và không xù\r\n﻿\r\n◾ Hoàn tiền nếu sản phẩm không giống với mô tả\r\n﻿\r\n◾ Nam và Nữ đều mặc được, form áo rộng chuẩn TAY LỠ UNISEX cực đẹp\r\n﻿', 88.000, 140, 1, 1, '2025-06-18 03:57:51', '2025-06-17 03:57:51'),
(12, 'Bộ Đồ Nam Nữ Unisex Mùa Hè Ngắn Tay Cổ Tròn Họa Tiết Loang Vẩy Sơn Hot Trend Thời Trang Zenkonu QA NAM 104', '132909f048482d8d984a069b76f58788 (1).webp', 'Bộ Đồ Nam Nữ Unisex Mùa Hè Ngắn Tay Cổ Tròn Họa Tiết Loang Vẩy Sơn Hot Trend Thời Trang Zenkonu QA NAM 104', 55.000, 245, 1, 1, '2025-06-28 04:00:43', '2025-06-28 04:00:43'),
(13, 'Áo Polo Nam Phối Cổ From Rộng In Chữ Trước Ngực Chất Cotton Thoáng Mát Thời Trang Zenkonu TOP NAM 351V1', 'vn-11134207-7ra0g-m7d6unqhxcvq34.webp', 'Áo Polo Nam Phối Cổ From Rộng In Chữ Trước Ngực Chất Cotton Thoáng Mát Thời Trang Zenkonu TOP NAM 351V1\r\n\r\n* THÔNG TIN SẢN PHẨM:\r\n\r\n🔸Chât liệu: vải tô ong co giãn, thấm hút mồ hôi.\r\n\r\n🔸 Kích thước:  M   L    XL\r\n\r\n🔸 Xuất xứ: Việt Nam\r\n\r\nVới thiết kế trẻ trung năng động, phù hợp nhiều hoàn cảnh, phong cách Ulzzang cập nhập xu hướng mới nhất.\r\n\r\n* Chi tiết Size:\r\n\r\nSize M: cho bạn có cân nặng từ 50 - 58kg tùy chiều cao, Dài 69, Rộng 57, Vải 56\r\n\r\nSize L: cho bạn có cân nặng từ 59 - 64kg tùy chiều cao, Dài 70, Rộng 58, Vải 57\r\n\r\nSize XL: cho bạn có cân nặng từ 65 - 70kg tùy chiều cao, Dài 71, Rộng 59, Vai 58\r\n\r\n🔰 Thông tin thêm:\r\n\r\n- Để bảo quản áo cũng như chất liệu hình in, shop khuyên bạn lộn mặt trái khi giặt và ủi nha\r\n\r\n- Bảng size chỉ mang tính chất tham khảo, tùy thuộc hình thể mỗi người và chất liệu nên có chênh lệch. Hãy ibox cho shop khi cần tư vấn cụ thể nha ^^\r\n\r\nHãy theo dõi để ủng hộ shop và cập nhập các chương trình khuyến mãi cũng như các mẫu sản phẩm mới nhất của shop nhé!\r\n\r\n🔸 Lưu ý: Shop chỉ hỗ trợ xử lý đơn hàng đổi trả trong vòng 15 ngày kể từ khi giao hàng thành công!', 89.000, 123, 1, 1, '2025-06-28 04:02:39', '2025-06-28 04:02:39'),
(14, 'Ốp Lưng iPhone DSQ IMD Cứng Nhám, Siêu Chống Sốc, Bảo Vệ Camera - iP 6/6s/7/8/Plus/X/XS/XR/11/12/13/14/15/Pro/Max', 'sg-11134201-7rdwb-lxrn7i4b7xosec.webp', 'Ốp Lưng iPhone DSQ IMD Cứng Nhám, Siêu Chống Sốc, Bảo Vệ Camera - iP 6/6s/7/8/Plus/X/XS/XR/11/12/13/14/15/Pro/Max', 3.000, 256, 1, 2, '2025-06-12 04:04:52', '2025-06-12 04:04:52'),
(15, 'Sạc Nhanh Đa Năng 4IN1 65W / 120W Cao Cấp 1.2M, Dây Dù Chống Đứt - Cho USB-Type C, Type C-Type C, Type C- iP, USB-iP', 'vn-11134207-7ra0g-m9zvmwhswboadd.webp', 'Sạc Nhanh Đa Năng 4IN1 65W / 120W Cao Cấp 1.2M, Dây Dù Chống Đứt - Cho USB-Type C, Type C-Type C, Type C- iP, USB-iP', 22.000, 456, 1, 2, '2025-06-01 04:07:00', '2025-06-01 04:07:00'),
(16, 'Combo 3 Món Sạc Nhanh gồm : Củ Sạc Nhanh 4 Cổng 120w, Cáp Sạc 3 Đầu 100w, Cáp Sạc 4 Đầu ( Cáp 4in1 ) - Sạc Điện thoại .', 'vn-11134207-7ras8-m4958w58nk0733.webp', 'Combo 3 Món Sạc Nhanh gồm : Củ Sạc Nhanh 4 Cổng 120w, Cáp Sạc 3 Đầu 100w, Cáp Sạc 4 Đầu ( Cáp 4in1 ) - Sạc Điện thoại .', 81.000, 235, 1, 2, '2025-06-26 04:07:41', '2025-06-26 04:07:41'),
(17, 'Điện thoại Apple iPhone 16 128GB', 'sg-11134301-7rdw4-m01cupmnad4w07.webp', 'Điện thoại Apple iPhone 16 128GB', 20190.000, 156, 7, 2, '2025-06-27 04:10:59', '2025-06-27 04:10:59'),
(18, 'Gậy chụp hình gấp gọn, có remote kết nối bluetooth và đèn LED trợ sáng, quay được 360 độ.', 'vn-11134207-7r98o-lyg80iwzr7f1b9.webp', 'Gậy chụp hình gấp gọn, có remote kết nối bluetooth và đèn LED trợ sáng, quay được 360 độ.', 58.000, 345, 6, 2, '2025-06-30 04:12:41', '2025-06-30 04:12:41'),
(19, 'Tai nghe Gaming X15 / G11 PRO Tws Bluetooth 5.0.Tai nghe chơi game bluetooth, Không dây có mic với độ trễ cực thấp', 'vn-11134207-7ras8-m226l1btlnmmb9.webp', 'Tai nghe Gaming X15 / G11 PRO Tws Bluetooth 5.0.Tai nghe chơi game bluetooth, Không dây có mic với độ trễ cực thấp', 58.000, 142, 8, 4, '2025-06-27 04:13:39', '2025-06-13 04:13:39'),
(20, 'Tai Nghe Bluetooth M10 Phiên Bản Pro Nâng Cấp Pin Trâu, Nút Cảm Ứng Tự Động Kết Nối, Chống Nước, Chống Ồn, Bảo Hành 12 T', '3707054f82e636c896458869737cc914.webp', 'Tai Nghe Bluetooth M10 Phiên Bản Pro Nâng Cấp Pin Trâu, Nút Cảm Ứng Tự Động Kết Nối, Chống Nước, Chống Ồn, Bảo Hành 12 T', 59.000, 356, 7, 4, '2025-06-18 04:15:57', '2025-06-18 04:15:57'),
(21, 'Tai Nghe Có Dây JIASHUO X5 Pro Gaming Super Bass Chống Ồn Cực Tốt Có Mic Đàm Thoại', 'cn-11134207-7ras8-m6j9axg1x5n7e3.webp', 'Tai Nghe Có Dây JIASHUO X5 Pro Gaming Super Bass Chống Ồn Cực Tốt Có Mic Đàm Thoại', 42.000, 159, 8, 4, '2025-06-28 04:16:51', '2025-06-28 04:16:51'),
(22, 'Tai Nghe Chụp Tai bluetooth Thời Trang Và Phong Cách Âm Bass Ấm Sống Động Có Mic Đàm Thoại Cho Học Tập Giải Trí', 'vn-11134207-7ras8-m2ndxaowapza01.webp', 'Tai Nghe Chụp Tai bluetooth Thời Trang Và Phong Cách Âm Bass Ấm Sống Động Có Mic Đàm Thoại Cho Học Tập Giải Trí', 139.000, 432, 7, 4, '2025-06-28 04:18:33', '2025-06-28 04:18:33'),
(23, 'Chuột USB Chơi Game Có Dây LED RGB Ergonomic 1200DPI 3 Nút Tắt Tiếng Cho Laptop Văn Phòng PC', 'sg-11134301-7rdyw-lxtef5wjpznudf.webp', 'Chuột USB Chơi Game Có Dây LED RGB Ergonomic 1200DPI 3 Nút Tắt Tiếng Cho Laptop Văn Phòng PC', 38.500, 200, 7, 4, '2025-06-30 04:19:27', '2025-06-30 04:19:27'),
(24, 'Webcam Có Mic 2K/1080P Máy tính USB Cho PC Laptop Livestream/Họp trực tuyến, Camera mini, Học và Làm việc Online', 'vn-11134207-7r98o-lyndud5x82ap61.webp', 'Webcam Có Mic 2K/1080P Máy tính USB Cho PC Laptop Livestream/Họp trực tuyến, Camera mini, Học và Làm việc Online', 197.010, 145, 5, 4, '2025-06-25 04:21:34', '2025-06-25 04:21:34'),
(25, 'Kệ để máy tính giá laptop kê màn hình bằng gỗ đa năng tặng kèm vít', 'vn-11134207-7r98o-lyf2tssulcnh99.webp', 'Kệ để máy tính giá laptop kê màn hình bằng gỗ đa năng tặng kèm vít', 30.000, 234, 1, 4, '2025-06-20 04:23:45', '2025-06-20 04:23:45'),
(26, 'Bàn phím bluetooth mini cho điện thoại android không dây bàn phím máy tính kèm chuột combo', 'vn-11134207-7r98o-lnaxicb3runh4d.webp', 'Bàn phím bluetooth mini cho điện thoại android không dây bàn phím máy tính kèm chuột combo', 120.000, 560, 5, 4, '2025-06-19 04:25:04', '2025-06-12 04:25:04'),
(27, 'Drone camera 4k mini Máy Bay Flycam trang bị camera kép 4k - Lai Cam Điều Khiển Từ Xa,Chất lượng hình ảnh siêu rõ ràng', 'vn-11134207-7r98o-lkm6h7r7lyaye0.webp', 'Drone camera 4k mini Máy Bay Flycam trang bị camera kép 4k - Lai Cam Điều Khiển Từ Xa,Chất lượng hình ảnh siêu rõ ràng', 215.000, 231, 8, 5, '2025-06-26 04:26:06', '2025-06-26 04:26:06'),
(28, 'Ốp Silicon BRDRC Cho DJI Osmo Pocket 3 Tay Cầm Máy Ảnh Gimbal Cầm Tay Vỏ Chống Trầy Xước Vỏ Bảo Vệ Mềm Nắp Ống Kính Vỏ....', 'sg-11134201-7rav1-mb3dyyp0y8eb1a.webp', 'Ốp Silicon BRDRC Cho DJI Osmo Pocket 3 Tay Cầm Máy Ảnh Gimbal Cầm Tay Vỏ Chống Trầy Xước Vỏ Bảo Vệ Mềm Nắp Ống Kính Vỏ....', 195.000, 234, 7, 5, '2025-06-25 04:27:06', '2025-06-25 04:27:06'),
(29, 'TNW 11inch Đèn LED chữ nhật đèn livetream chuyên nghiệp kèm nắp đậy đèn led chụp ảnh đèn vuông', 'vn-11134207-7r98o-lvybd7z6xw4916.webp', 'TNW 11inch Đèn LED chữ nhật đèn livetream chuyên nghiệp kèm nắp đậy đèn led chụp ảnh đèn vuông', 64.900, 324, 2, 5, '2025-06-27 04:28:56', '2025-06-27 04:28:56'),
(30, 'Bộ Dây Đai Đeo Ngực Gắn Điện Thoại, Camera Hành Trình, Gopro,..,Đa Dạng Mẫu, Phụ Kiện Chắc Chắn Quay Video, Vlog - FCS', 'vn-11134207-7r98o-ly55nqcubcm9a5.webp', 'Bộ Dây Đai Đeo Ngực Gắn Điện Thoại, Camera Hành Trình, Gopro,..,Đa Dạng Mẫu, Phụ Kiện Chắc Chắn Quay Video, Vlog - FCS', 79.000, 342, 8, 4, '2025-06-26 04:29:52', '2025-06-26 04:29:52');

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
(1, 1, 'https://via.placeholder.com/640x480.png/002266?text=molestiae', '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(2, 1, 'https://via.placeholder.com/640x480.png/005588?text=tempora', '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(3, 1, 'https://via.placeholder.com/640x480.png/00aa00?text=necessitatibus', '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(4, 1, 'https://via.placeholder.com/640x480.png/0088cc?text=est', '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(5, 1, 'https://via.placeholder.com/640x480.png/007733?text=quia', '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(6, 1, 'https://via.placeholder.com/640x480.png/0099ee?text=et', '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(7, 1, 'https://via.placeholder.com/640x480.png/001177?text=officia', '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(8, 1, 'https://via.placeholder.com/640x480.png/00aaff?text=facere', '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(9, 1, 'https://via.placeholder.com/640x480.png/00bbcc?text=doloribus', '2025-06-23 19:15:08', '2025-06-23 19:15:08'),
(10, 1, 'https://via.placeholder.com/640x480.png/0099aa?text=qui', '2025-06-23 19:15:08', '2025-06-23 19:15:08');

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
('Pj3zjy96IT8P0hs3LyfDfVLqH1HaD1JND7qboY6C', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT0t2YVZyNjRDQzVGTkQ4MUR0VkFPMkVMVWtFVDNHTWtCMVhXUDhYdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1750825861);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

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
