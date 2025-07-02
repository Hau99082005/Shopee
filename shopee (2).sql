-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 02, 2025 lúc 04:21 AM
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

--
-- Đang đổ dữ liệu cho bảng `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `product_id`, `quantity`, `created_at`, `updated_at`) VALUES
(15, 1, 17, 1, '2025-07-01 19:20:46', '2025-07-01 19:20:46');

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
(1, 'Áo Thun Polo Nam Thêu Chữ U,Chất Liệu Thấm Hút Mồ Hôi,Cổ Phối Màu', 'vn-11134207-7r98o-lrol6kavr6hl42 (1).webp', 'ÁO THUN POLO\r\n\r\nÁo thun Cotton 100% co dãn 4 chiều\r\n\r\n\r\n\r\n✔️Size sz M L XL XXL\r\n\r\n\r\n\r\nSize M 35-45kg\r\n\r\nSize L 45-55kg\r\n\r\nSize XL 55-65kg\r\n\r\nSize XXL 65-75kg\r\n\r\nTuỳ chiều cao nhích size cho phù hợp giúp em nha. Bảng cân nặng chỉ là tương đối ạ\r\n\r\n\r\n\r\n=========================================\r\n\r\nCAM KẾT - ĐẢM BẢO:\r\n\r\n- Đảm bảo vải chuẩn cotton chất lượng cao.\r\n\r\n- Hàng có sẵn, giao hàng ngay khi nhận được đơn đặt hàng .\r\n\r\n- Hoàn tiền 100% nếu sản phẩm lỗi, nhầm hoặc không giống với mô tả.\r\n\r\n- Chấp nhận đổi hàng khi size không vừa (vui lòng nhắn tin riêng cho shop).\r\n\r\n- Giao hàng toàn quốc, thanh toán khi nhận hàng.\r\n\r\n- Hỗ trợ đổi trả theo quy định của Shopee.\r\n\r\n\r\n\r\nĐIỀU KIỆN ĐỔI TRẢ:\r\n\r\n- Hỗ trợ trong vòng 03 ngày từ khi nhận hàng.\r\n\r\n- Hàng hoá vẫn còn mới nguyên tem mác, chưa qua sử dụng.\r\n\r\n- Hàng hoá bị lỗi hoặc hư hỏng do vận chuyển hoặc do nhà sản xuất.\r\n\r\n\r\n\r\n📌 LƯU Ý:  Khi bạn gặp bất kì vấn đề gì về sản phẩm đừng vội đánh giá  mà hãy chat liên hệ Shop để đc hỗ trợ 1 cách tốt nhất  nhé.\r\n\r\n#aothun #aopolonam #polo #polonam #aocotron #aothunnam #aothuncotron #aocotton #aothundep #aophong #aophongnam #aophongcotron #aophongtayngan #aothuntayngan #aothunbody ', 39.000, 90.000, 100, 1, 1, '2025-07-01 07:53:07', '2025-07-01 07:53:07'),
(2, 'Áo thun polo nam chất vải cá sấu co giản 4 chiều thời trang Everest Nhiều màu', 'vn-11134207-7ra0g-m8flnkirvlvrb9.webp', 'Áo polo nam thun cá sấu có cổ, áo thun cổ bẻ cotton hàng hot vải mịn Thời Trang Everest \r\n\r\nÁo thun polo nam chất vải cá sấu co giản 4 chiều thời trang Everest \r\n\r\nThông tin sản phẩm:\r\n\r\n\r\n\r\n - Chất liệu: Vải thun cá sấu cao cấp, 4 chiều co dãn, thấm hút mồ hôi tốt, không nóng bức khi vận động nhiều, không nhăn, không co rút sau khi giặt.\r\n\r\n\r\n\r\nĐặc điểm nổi bật: \r\n\r\n\r\n\r\n- Thiết kế trang nhã, màu sắc ấn tượng, tiện dụng và thoải mái mang đến vẻ thanh lịch, tự tin cho người mặc.\r\n\r\n\r\n\r\n - Form áo suông phù hợp với mọi độ tuổi, tay áo bo nhẹ khỏe khoắn.\r\n\r\n\r\n\r\n - Áo Thun có cổ rất đa năng, mặc được trong nhiều dịp khác nhau, đi dạo phố cùng bạn bè, đi phượt, mặc hàng ngày...\r\n\r\n\r\n\r\n - Với thiết kế đơn giản nhưng đẳng cấp, cùng với sự tiện dụng và thoải mái khi mặc.\r\n\r\n\r\n\r\n-	Xuất xứ: Việt Nam\r\n\r\n\r\n\r\n-	Size: S-M-L-XL-XXL-3XL (Tham khảo bảng size ở hình ảnh kỹ hơn)\r\n\r\n\r\n\r\nĐÔI NÉT VỀ SẢN PHẨM ÁO THUN NAM\r\n\r\n\r\n\r\nÁo thun nam là trang phục cơ bản và tiện dụng nhất đối với phái mạnh. Hầu như người đàn ông nào cũng đều phải có vài chiếc áo pull nam trong tủ áo của mình. Việc mua áo thun nam cũng được bàn tán sôi nổi trên khắp các diễn đàn hay blog cá nhân. Với những ưu điểm tuyệt vời như phong cách đa dạng, kiểu dáng đơn giản và chất liệu thoáng mát, áo thun nam Hàn Quốc được phái mạnh yêu thích và lựa chọn khi đến công sở hay dạo phố. Bên cạnh đó, áo thun nam cổ trụ cũng được các chàng trai văn phòng yêu thích vì nét lịch sự và trẻ trung. Chỉ cần kết hợp áo thun nam body với quần jeans nam hay quần kaki nam và những phụ kiện đi kèm như ví nam, túi du lịch nam hay đơn giản hơn là chiếc balo laptop nam năng động, bạn đã có ngay bộ cánh đơn giản mà hiện đại. \r\n\r\n\r\n\r\nHướng dẫn sử dụng\r\n\r\n\r\n\r\n- Khuyến khích giặt tay\r\n\r\n\r\n\r\n- Không nên dùng bột giặt có chất tẩy mạnh\r\n\r\n\r\n\r\n- Ủi nhẹ ở nhiệt độ thấp\r\n\r\n\r\n\r\n#aothun #aopolo #aothuncotru #aothunpolonam #aopolonam #aothuncasau #aocasau #áocásấu #aothunnam #aothunnu #aonam #aonu #aothunden #aothuneverest #everest', 55.800, 118.000, 100, 1, 1, '2025-07-29 15:31:26', '2025-07-29 15:31:26'),
(3, 'Áo phông nam Gman cổ bẻ ngắn tay cao cấp, Áo thun polo nam nữ kiểu dáng Hàn Quốc co giãn 4 chiều PL01', 'vn-11134207-7r98o-m0bh7j4u0wdpa8.webp', '        Gman hân hạnh được phục vụ quý khách. Những sản phẩm mới nhất liên tục được cập nhật mỗi ngày . QUÝ KHÁCH NHỚ LIKE SẢN PHẨM VÀ THEO DÕI SHOP ĐỂ LUÔN CẬP NHẬT MÃ GIẢM GIÁ, CHƯƠNG TRÌNH DEAL SỐC , KHUYẾN MÃI KHỦNG TRONG THÔNG BÁO CỦA QUÝ KHÁCH .\r\n\r\n\r\n\r\n1. GIỚI THIỆU SẢN PHẨM\r\n\r\n    Áo Phông Nam ngắn tay , cổ bẻ , chống nhăn cao cấp  chính là gợi ý tuyệt vời cho nam giới mỗi khi lựa chọn trang phục mỗi ngày. Với những mẫu áo phông nam thiết kế đơn giản và toát lên vẻ lịch lãm tinh tế, mang đến phong cách thời trang trẻ trung, năng động chắc chắn sẽ là lựa chọn hoàn hảo cho chàng trai hiện đại, nam tính. Những chiếc áo phông nam dù kết hợp với quần âu, quần jeans khi đi làm hay diện cùng quần ngố, quần short đi chơi đều NỔI BẬT, THOẢI MÁI và PHONG CÁCH. Với form dáng vừa vặn các chàng có thể tự tin khoe body cực chuẩn của mình. Hãy bổ sung ngay vào tủ đồ item này để diện thật chất nhé!\r\n\r\n\r\n\r\n2. THÔNG TIN CHI TIẾT \r\n\r\n👉Màu sắc  : ĐEN, TRẮNG , XANH THAN, GHI SÁNG , XÁM ĐẬM ,VÀNG , ĐỎ \r\n\r\n👉 Chất liệu: cotton , thấm hút mồ hôi \r\n\r\n👉 Chất vải sờ mịn không bai, không nhăn, không xù\r\n\r\n👉 Quy cách, tiêu chuẩn đường may tinh tế, tỉ mỉ trong từng chi tiết\r\n\r\n👉 Kiểu dáng: Thiết kế đơn giản, dễ mặc, dễ phối đồ\r\n\r\n👉 Form body Hàn Quốc mang lại phong cách trẻ trung, lịch lãm\r\n\r\n👉 Chất lượng sản phẩm tốt, giá cả hợp lý\r\n\r\n\r\n\r\n3. CHÍNH SÁCH BÁN HÀNG:\r\n\r\n👉 Cam kết chất lượng và mẫu mã sản phẩm giống với hình ảnh.\r\n\r\n👉 Hoàn tiền nếu sản phẩm không giống với mô tả.\r\n\r\n👉 Ngoài ra IKEMEN SHOP tặng voucher hoặc hoàn xu cho các đơn hàng tương ứng đủ điều kiện.\r\n\r\n👉 Rất mong nhận được ý kiến đóng góp của Quý khách hàng để chúng tôi cải thiện chất lượng dịch vụ tốt hơn.\r\n\r\n\r\n\r\n 4. HƯỚNG DẪN CÁCH ĐẶT HÀNG\r\n\r\n👉 Bước 1: Cách chọn size, shop có bảng size mẫu. Bạn NÊN INBOX, cung cấp chiều cao, cân nặng để SHOP TƯ VẤN SIZE\r\n\r\n👉 Bước 2: Cách đặt hàng: Nếu bạn muốn mua 2 sản phẩm khác nhau hoặc 2 size khác nhau, để được freeship\r\n\r\n👉 Bạn chọn từng sản phẩm rồi thêm vào giỏ hàng\r\n\r\n👉 Khi giỏ hàng đã có đầy đủ các sản phẩm cần mua, bạn mới tiến hành ấn nút “ Thanh toán”\r\n\r\n👉 Shop luôn sẵn sàng trả lời inbox để tư vấn\r\n\r\n\r\n\r\n5. HƯỚNG DẪN CHỌN SIZE ÁO PHÔNG NAM:\r\n\r\n    (Size áo phụ thuộc vào chiều cao cân nặng và các yếu tố khác như vòng ngực, bụng, vai, bắp tay,... Do đó quý khách còn phân vân xin vui lòng nhắn tin trực tiếp để được hỗ trợ tốt nhất)\r\n\r\n👉  Size M     :  Cân nặng từ 45-51kg,  Chiều cao dưới 160cm\r\n\r\n👉  Size L      :  Cân nặng từ 52-58kg,  Chiều cao dưới 165cm\r\n\r\n👉  Size XL    :  Cân nặng từ 59-65kg,  Chiều cao dưới 170cm\r\n\r\n👉  Size 2XL  :  Cân nặng từ 66-72kg,  Chiều cao dưới 175cm\r\n\r\n👉  Size 3XL  :  Cân nặng từ 73-80kg,  Chiều cao dưới 185cm\r\n\r\n------- Hàng có sẵn, đủ size:   M, L, XL, 2XL,3XL -----\r\n\r\n              NHẬN ĐẶT HÀNG MUA BUÔN/MUA SỈ SỐ LƯỢNG LỚN\r\n\r\n  Tham khảo thêm các sản phẩm khác tại:#gman.vn\r\n\r\n#thoitrangnam#aothunnam#aothun#aophongnu#aonam#aophongnam#aophongtrang#aothuncoco#aothunnamtaylo#aophongdoi#aothunnamco', 59.000, 65.000, 100, 1, 1, '2025-07-31 15:33:48', '2025-07-31 15:33:48'),
(4, 'Áo polo nam thể thao chất vải thun cá sấu phối sọc viền tay cổ Everest 15 màu', 'vn-11134207-7ra0g-m8fqgww1w6te06.webp', 'Áo thun polo cá sấu nam có cổ, áo thun cổ bẻ cotton hàng hot vải mịn chất thun cá sấu co giản Thời Trang Everest áo polo nam thể thao \r\n\r\n\r\n\r\nMàu chụp studio và màu thực tế cam thường có thể chênh lệch 1-5% , quý khách xem bảng màu thực tế bên dưới ạ .\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nThông tin sản phẩm:\r\n\r\n\r\n\r\n - Chất liệu: Vải thun cá sấu cao cấp, 4 chiều co dãn mềm mại, thấm hút mồ hôi tốt, không nóng bức khi vận động nhiều, không nhăn, không co rút sau khi giặt.\r\n\r\n\r\n\r\nĐặc điểm nổi bật: \r\n\r\n\r\n\r\n- Cổ áo và tay áo phối sọc tinh tế tạo điểm nhấn thời trang bắt mắt\r\n\r\n\r\n\r\n- Thiết kế trang nhã, màu sắc ấn tượng, tiện dụng và thoải mái mang đến vẻ thanh lịch, tự tin cho người mặc.\r\n\r\n\r\n\r\n - Form áo suông phù hợp với mọi độ tuổi, tay áo bo nhẹ khỏe khoắn.\r\n\r\n\r\n\r\n - Áo Thun có cổ rất đa năng, mặc được trong nhiều dịp khác nhau, đi dạo phố cùng bạn bè, đi phượt, mặc hàng ngày...\r\n\r\n\r\n\r\n - Với thiết kế đơn giản nhưng đẳng cấp, cùng với sự tiện dụng và thoải mái khi mặc.\r\n\r\n\r\n\r\n-	Xuất xứ: Việt Nam\r\n\r\n\r\n\r\n-	Size: S-M-L-XL-XXL-3XL (Tham khảo bảng size ở hình ảnh kỹ hơn)\r\n\r\n\r\n\r\nĐÔI NÉT VỀ SẢN PHẨM ÁO THUN NAM\r\n\r\n\r\n\r\nÁo thun nam là trang phục cơ bản và tiện dụng nhất đối với phái mạnh. Hầu như người đàn ông nào cũng đều phải có vài chiếc áo pull nam trong tủ áo của mình. Việc mua áo thun nam cũng được bàn tán sôi nổi trên khắp các diễn đàn hay blog cá nhân. Với những ưu điểm tuyệt vời như phong cách đa dạng, kiểu dáng đơn giản và chất liệu thoáng mát, áo thun nam Hàn Quốc được phái mạnh yêu thích và lựa chọn khi đến công sở hay dạo phố. Bên cạnh đó, áo thun nam cổ trụ cũng được các chàng trai văn phòng yêu thích vì nét lịch sự và trẻ trung. Chỉ cần kết hợp áo thun nam body với quần jeans nam hay quần kaki nam và những phụ kiện đi kèm như ví nam, túi du lịch nam hay đơn giản hơn là chiếc balo laptop nam năng động, bạn đã có ngay bộ cánh đơn giản mà hiện đại.\r\n\r\n\r\n\r\nHướng dẫn sử dụng\r\n\r\n\r\n\r\n- Khuyến khích giặt tay\r\n\r\n\r\n\r\n- Không nên dùng bột giặt có chất tẩy mạnh\r\n\r\n\r\n\r\n- Ủi nhẹ ở nhiệt độ thấp\r\n\r\n\r\n\r\n#aothun #aopolo #aothuncotru #aothunpolonam #aopolonam #aothuncasau #aocasau #áocásấu #aothunnam #aothunnu #aonam #aonu #aothunden #aothuneverest #everest', 54.900, 118.000, 245, 1, 1, '2025-07-16 15:36:42', '2025-07-16 15:36:42'),
(5, 'Áo phông trơn cotton Nam logo thêu chất Cotton , chuẩn form, trẻ trung, thanh lịch', 'vn-11134207-7ra0g-m6sgxmrhfzvc74.webp', 'Áo phông trơn nam logo thêu chất cotton , chuẩn form, trẻ trung, thanh lịch\r\n\r\n🔰 THÔNG TIN CHI TIẾT \r\n\r\n🔰 HƯỚNG DẪN CÁCH ĐẶT HÀNG \r\n\r\n⏩ Cách chọn size: Shop có bảng size mẫu. Bạn NÊN INBOX, cung cấp chiều cao, cân nặng để SHOP TƯ VẤN SIZE \r\n\r\n⏩ Cách đặt hàng: Nếu bạn muốn mua 2 sản phẩm khác nhau hoặc 2 size khác nhau, để được freeship \r\n\r\n- Bạn chọn từng sản phẩm rồi thêm vào giỏ hàng \r\n\r\n- Khi giỏ hàng đã có đầy đủ các sản phẩm cần mua, bạn mới tiến hành ấn nút “ Thanh toán” \r\n\r\n⏩ Shop luôn sẵn sàng trả lời inbox để tư vấn \r\n\r\n#áothunnam #áothun #áothunnamcổtròn #aothunnam #áothunnamđẹp #áothunnamformrộng #áothunnamcaocấp #áothunđẹp #áothuncaocấp #áothunnamngắntay #áothunchất #áonamđẹp #áothunnambasic #áothuncộctaynam #aothun #áonam #áophông #áophôngnam #áophôngnamđẹp #áophôngtrắngnam #áophôngnamcaocấp #áophôngtrơn #áophôngnamtayngắn #áophôngnamkhôngcổ #áophôngnamcổtròn #phôngnam #áophôngtrơnnam #áocộctaynam #áocộcnam #thunnam #thun #áopolonam #áopolo #áothunpolo #áothunnampolo #áophôngpolo #polonam #polo #aothunpolonam #áonampolo #áopolonamcaocấp #áophôngnampolo #áopolotrắng #áophôngpolonam #áothunnamcócổ #áophôngnamcócổ #áothuncócổnam #áophôngcócổ #áothuncócổ #áothuncổbẻ #áophôngcócổnam #áothểthaocócổ #áothunnamcổbẻ #áothunnamáongắntay', 84.300, 189.000, 100, 1, 1, '2025-07-30 15:37:54', '2025-07-30 15:37:54'),
(6, 'Quần Short unisex chất cotton cao cấp,Quần Short nam nữ phong cách thể thao -NANA SHOP.', 'vn-11134207-7qukw-lju0wkebupz659.webp', 'MÔ TẢ SẢN PHẨM;Quần Short unisex chất cotton cao cấp,Quần Short nam nữ phong cách thể thao -NANA SHOP.\r\n\r\n\r\n\r\nQuần Short trơn và Quần Short Comp chất tổ ong cao cấp\r\n\r\n    ✪ Chất Liệu Vải :  cotton cao cấp 100%, co giãn 4 chiều, vải mềm, mịn, thoáng mát, không xù lông.\r\n\r\n    ✪ Kĩ thuật may: Đường may chuẩn chỉnh, tỉ mỉ, chắc chắn\r\n\r\n    ✪ Hình in: Công nghệ in tiên tiến đảm bảo độ bền màu và hình in ngay cả khi giặt máy.\r\n\r\n    ✪ Kiểu Dáng :Form Rộng Thoải Mái\r\n\r\n    ✪ Full size nam nữ : 40 - 85 kg\r\n\r\nI. SHP CAM KẾT\r\n\r\n- Sản phẩm quần Short đùi Unisex cotton cao cấp giống mô tả 100%\r\n\r\n- Hình ảnh sản phẩm là ảnh thật, các hình hoàn toàn do shop tự thiết kế.\r\n\r\n- Kiểm tra  cẩn thận trước khi gói hàng giao cho Quý Khách\r\n\r\n- Hàng có sẵn, giao hàng ngay khi nhận được đơn \r\n\r\n- Hoàn tiền nếu sản phẩm không giống với mô tả\r\n\r\n- Chấp nhận đổi hàng khi size không vừa trong 3 ngày.\r\n\r\nHỖ TRỢ ĐỔI TRẢ THEO QUY ĐỊNH CỦA SHOPEE\r\n\r\n- Điều kiện áp dụng (trong vòng 2 ngày kể từ khi nhận sản phẩm) \r\n\r\n- Hàng hoá bị rách, in lỗi, bung chỉ, và các lỗi do vận chuyển hoặc do nhà sản xuất.\r\n\r\n1. Trường hợp được chấp nhận \r\n\r\n- Hàng giao sai size khách đã đặt hàng \r\n\r\n- Giao thiếu hàng \r\n\r\n2. Trường hợp không đủ điều kiện áp dụng chính sách \r\n\r\n- Quá 2 ngày kể từ khi Quý khách nhận hàng \r\n\r\n G-ửi lại hàng không đúng mẫu mã, không phải sản phẩm của TNK STORE\r\n\r\n- Không thích, không hợp, đặt nhầm mã, nhầm màu,........\r\n\r\n#aothun #thun #aophong #unisex #aothunnam #aothunnu #freesize #oversize #aophongloang #taylo #formrong #hanquoc #aothuntaylo #aocotron #aothunformrong #samexoy #aosamexoy #aodoi #aothunmixmau #aophongmixmau #aothunmix #aophongmix #aoswweater #sweater #quanshort#quan', 58.800, 98.000, 234, 1, 1, '2025-07-01 15:39:24', '2025-07-01 15:39:24'),
(7, 'Áo Phông Cho Nam Nữ Dsquared2 Họa Tiết in hình cây dừa Cực Sắc Nét Đẹp 2 Màu Trắng Đen hot 2025 [M02]', 'vn-11134207-7ra0g-m6c32piys6bne6.webp', 'Tất cả Hình Ảnh, Video đều được shop tự quay, chụp. Hình ảnh sao nhận hàng vậy.\r\n\r\n🖋Bảo hàng đổi trà hoàn tiền theo chính sách của shopee trong các trường hợp: lỗi do nhà sản xuất, shop gửi nhầm mẫu, hư hỏng do vận chuyển...\r\n\r\n🖋Hỗ trợ đổi size cho khách hàng khi áo còn nguyên vẹn.\r\n\r\n✈ Ship cod toàn quốc\r\n\r\n 🖋Nhận hàng hàng TRƯỚC - Thu tiền SAU\r\n\r\n 2️⃣𝐇𝐮̛𝐨̛́𝐧𝐠 𝐃𝐚̂̃𝐧 𝐒𝐮̛̉ 𝐃𝐮̣𝐧𝐠 : -\r\n\r\n⛔ Không dùng hóa chất hay bột giặt có hoạt tính tẩy rửa mạnh \r\n\r\n⛔ Không dùng bàn chải cứng để vệ sinh giày sẽ làm hư\r\n\r\n⛔ Không đi mưa ngâm nước lâu, không phơi áo trực tiếp dưới ngoài trời nắng gắt\r\n\r\n⛔Với các sàn phẩm sáng màu, nên vệ sinh thường xuyên\r\n\r\n⛔ Tránh cất giữ giày khi còn ướt, ẩm..\r\n\r\n\r\n\r\n3️⃣ Mô tả chi tiết:\r\n\r\n✔️Đủ size Nam nữ : S - XXL\r\n\r\n✔️Hàng chất lượng\r\n\r\n✔️Giá rẻ \r\n\r\n✔️Quý khách cứ yên tâm , chúng tôi luôn đem đến cho quý khách những sản phẩm chất lượng nhất với giá thành hợp lý nhất .\r\n\r\n✔️Bảo hành do lỗi sản xuất : 01 Tháng\r\n\r\n✔️ Kiểu dáng hot trend của năm nay và còn kéo dài trong những năm tiếp theo. \r\n\r\n✔️Áo đẹp, thấm hút mồ hôi tốt, bền. Giá phải chăng phù hợp với các bạn học sinh, sinh viên. Có thể làm áo đôi, áo nhóm. Thích hợp đi chơi, du lịch, chạy bộ, gym, đi học, đi làm... \r\n\r\n✔️ Dễ phối đồ, có thể kết hợp với váy, jeans, sooc…. Phù hợp với mọi thời tiết từ đông sang hè.\r\n\r\n\r\n\r\n4️⃣ Lời muốn nói\r\n\r\nCảm ơn các bạn đã tin tưởng ủng hộ, chúc các bạn mang lên chân những đôi giày đẹp nhất và ưng ý nhất\r\n\r\nHãy để lại đánh giá của mình về chất lượng sản phẩm để shop và mọi có thể nhìn nhận khách quan nhất.\r\n\r\nĐừng quên theo dõi shop để cập nhập những mẫu hot hàng ngày.', 1.500, 15.000, 234, 1, 1, '2025-07-29 15:40:40', '2025-07-29 15:40:40'),
(8, 'Áo thun nam, áo phông nam tay ngắn cổ tròn chất thun lạnh co giãn 4 chiều hình thành phố alex cool', '6aba1d32171c02c7e0c3d59a5f75fbb8.webp', 'Áo thun nam, áo phông nam tay ngắn cổ tròn chất thun lạnh co giãn 4 chiều hình thành phố alex cool\r\n\r\n------------------------------\r\n\r\nLuôn luôn cập nhật những mẫu mã mới , đa dạng – ALEX COOL e hứa hẹn sẽ luôn đem lại cho bạn những sản phẩm thời trang ưng ý và hoàn hảo nhất.\r\n\r\n- Về sản phẩm: Shop cam kết cả về CHẤT LIỆU cũng như HÌNH DÁNG ( đúng với những gì được nêu bật trong phần mô tả sản phẩm). \r\n\r\n- Về giá cả : Shop nhập với số lượng nhiều và trực tiếp nên chi phí sẽ là RẺ NHẤT nhé.-\r\n\r\n- Thời gian chuẩn bị hàng: Hàng có sẵn, thời gian chuẩn bị tối ưu nhất. \r\n\r\n Shop Buôn Sỉ Áo Thun Nam Tay Ngắn In Họa Tiết \r\n\r\nMÔ TẢ CHI TIẾT SẢN PHẨM\r\n\r\n📢 Kích cỡ :* Chất Liệu :  \r\n\r\n- Chất thun lạnh , chất vải mềm , mịn , mặc thoải mái , đường chỉ may chắc chắn , không bị giản , nhão....\r\n\r\n  *  Công Nghệ In : Với công nghệ in chuyển nhiệt , chất liệu màu sẽ thấm trực tiếp lên vải  \r\n\r\n     -------------- \r\n\r\nƯu điểm : màu sắc , hình ảnh in lên áo cam kết đẹp và sắc nét hơn so với hình mẫu\r\n\r\n     ----------------- \r\n\r\nÁo thun nam, áo phông nam tay ngắn cổ tròn chất thun lạnh co giãn 4 chiều hình thành phố alex cool\r\n\r\nvới chất liệu lực nhập khẩu hàn quốc  thì hình in không bao giờ phai cho dù mặc áo đã lâu , đã cũ , không bao giờ nhòe màu...\r\n\r\n        ---------------------\r\n\r\n- Kích thước áo thun:\r\n\r\n+ Size M:  40kg- 50kg\r\n\r\n+ Size L: 50-60kg\r\n\r\n​+ Size XL:  61- 67kg\r\n\r\n+ Size XXL:  68-75kg\r\n\r\n----------------------------------\r\n\r\n\" CAM KẾT VỚI BẠN\"\r\n\r\n- Sản phẩm đúng như mô tả\r\n\r\n- Kiểm tra hàng trước khi giao cho bạn \r\n\r\n- Đóng gói hàng cẩn thận \r\n\r\n- Xuất hiện đơn của bạn shop sẽ gửi hàng cho bạn nhanh nhất\r\n\r\n- Khi có sự sai xót về sản phẩm shop xin được đổi trả nhanh nhất cho bạn\r\n\r\n---------------------------------------------\r\n\r\nThời trang ALEX COOL xin được chân thành cảm ơn quý khách.\r\n\r\n- người chịu trách nhiệm về hàng hóa : Nguyễn Tiến Cường , quốc oai - hà nội\r\n\r\n\r\n\r\n\" Thái độ - An toàn - Nhanh - Chất lượng - Phục vụ hậu mãi \"\r\n\r\n#ALEXCOOL #unisex #aothunnu #aothun #ao #aothungiare #siaothunnutphcm #aothuntayngan \r\n\r\n#aophong #thoitrangnu #aothunteen #aocap #aodoi #aothuncotton #xuongsiaothun #aophong #aothunnam #aothuncotron ', 55.000, 95.000, 256, 1, 1, '2025-07-30 15:42:23', '2025-07-30 15:42:23'),
(9, 'Quần short nam KAKI GIÓ cạp chun pha cúc trẻ trung', 'vn-11134207-7qukw-liiyv3lg7t8y69.webp', 'Quần ngố,quần short kaki nam cạp chun pha cúc trẻ trung tiện lợi\r\n\r\n- Chất liệu vải Kaki giấy mềm,độ mỏng vừa phải.\r\n\r\n- Quần short Kaki được thiết kế có 2 túi trước, 1 túi sau \r\n\r\n Kiểu dáng: quần short nam kaki lưng thun với kiểu dáng trơn, form ống rộng, nhiều màu trung tính có thể mặc ở nhà, đi chơi, thể thao.\r\n\r\nQuần gồm 5 màu : Đen - Trắng - ghi - vàng - đỏ đô\r\n\r\nBảng SIZE: 5 Size 50-90kg\r\n\r\nM: 50kg - 58kg\r\n\r\nL:  9kg -67kg\r\n\r\nXL: 68 - 74kg\r\n\r\n2XL: 75 - 80kg\r\n\r\n3XL: 81 - 86kg\r\n\r\nBảng size tham khảo các anh bụng to ,mông to có thể lên thêm 1 size mặc cho thoải mái\r\n\r\nShop có hỗ trợ đổi trả sản phẩm nếu hàng lỗi hoặc không vừa size\r\n\r\n#quanshortnamkaki #quanshortkakinam #quanshortnamkakilungthun #quanshortnamkakicaocap #quanshortnamkakithuncogian #quanshortkakinamcaocap #quanshortkakinam #quanshortnamkakibigsize\r\n\r\n#quanshortkakinamlungthun #quanshortkakinamden #quanshortnamkakitrang #quanshortkakinamnu\r\n\r\n#quanshortkakinamunisex #quanshortkakinamtrang #quanshortkakinamcogian #quanshortnamquankaki\r\n\r\n#quanshortkakinamquankaki #quanshortnamkakithun', 65.000, 203.000, 256, 1, 1, '2025-07-31 15:43:27', '2025-07-31 15:43:27'),
(10, 'Quần short nam, quần ngắn nam KAKI gió, cạp khuy trẻ trung năng động', 'vn-11134207-7r98o-llx0ldy38tenec.webp', '- Quần phom vừa, dáng thanh niên trẻ trung, nếu khách thích mặc thoải mái có thể lấy tăng 1 size hoăc chat với shop để được tư vẫn size phù hợp.\r\n\r\n- Bảng size chỉ mang tính chất tương đối, nếu kh cao, thấp... nên chat với shop để được tư vấn size phù hợp nhất\r\n\r\n\r\n\r\n- Quần short có chất liệu KAKI, vải dày dặn mát mịn, thoải mái trong từng chuyển động khi  di chuyển, đứng lên/ ngồi xuống.\r\n\r\n-Giặt tay hay giặt máy thoải mái không sợ ra màu, nhăn , mất form\r\n\r\n-----------------\r\n\r\n🔸 Cách đặt hàng\r\n\r\n- KH chọn từng màu và size cho vào giỏ hàng rồi quay ra tiếp tục chọn như vậy, khi nào chọn đủ sản phẩm muốn mua KH vào giỏ hàng và bấm mua hàng là được ạ! ( Khách vẫn chưa biết đặt có thể chat với shop)\r\n\r\n- Shop đóng gói theo đơn khách đặt, ko đóng theo ghi chú hay tin nhắn\r\n\r\n-------------------------\r\n\r\n🔸 CAM KẾT - ĐẢM BẢO:\r\n\r\n- Hàng có sẵn, giao hàng ngay khi nhận được đơn đặt hàng .\r\n\r\n- Chấp nhận đổi hàng khi size không vừa hoặc hàng lỗi (vui lòng nhắn tin riêng cho shop).\r\n\r\n- Hỗ trợ đổi trả theo quy định của Shopee.\r\n\r\n-------------------------\r\n\r\n🔸ĐIỀU KIỆN ĐỔI TRẢ:\r\n\r\n- Hỗ trợ trong vòng 03 ngày từ khi nhận hàng.\r\n\r\n- Hàng hoá vẫn còn mới nguyên tem mác, chưa qua sử dụng.\r\n\r\n- Hàng hoá bị lỗi hoặc hư hỏng do vận chuyển hoặc do nhà sản xuất.\r\n\r\n--------------------------\r\n\r\n📌 LƯU Ý:  Khi bạn gặp bất kì vấn đề gì về sản phẩm đừng vội đánh giá  mà hãy chat liên hệ Shop để đc hỗ trợ 1 cách tốt nhất  nhé.\r\n\r\n\r\n\r\n#Quầnđùinam #quầnshortnam #quầnsoocnam #quầnlửngnam #quầnsọtnam #shortnam #quầnsócnam #quầnsortnam #quầnshotnam #quanduinam #quầnshorts #quầnsọcnam #quầnsocnam #quânshortnam #quầnsọt #quầnnamngắn #quầncộcnam #quầncộcnam #quanshortnam #quầnshortlửng #soocnam #quầnshortkakinam #quầnshortkaki #quầnđùikaki #quầnshortnamkaki #shortkaki #quầnđùikakinam #quầnsoockaki #quầnngốkakinam #quầnsọtkakinam #quầnlửngkakinam #quầnkakinamngắn #shortkakinam #quầnsoockakinam #quầnkakilửngnam', 73.500, 115.000, 256, 1, 1, '2025-07-31 15:44:38', '2025-07-31 15:44:38'),
(11, 'Quần short nam, quần ngắn nam KAKI gió, cạp khuy trẻ trung năng động', 'vn-11134207-7r98o-llx0ldy38tenec (1).webp', '- Quần phom vừa, dáng thanh niên trẻ trung, nếu khách thích mặc thoải mái có thể lấy tăng 1 size hoăc chat với shop để được tư vẫn size phù hợp.\r\n\r\n- Bảng size chỉ mang tính chất tương đối, nếu kh cao, thấp... nên chat với shop để được tư vấn size phù hợp nhất\r\n\r\n\r\n\r\n- Quần short có chất liệu KAKI, vải dày dặn mát mịn, thoải mái trong từng chuyển động khi  di chuyển, đứng lên/ ngồi xuống.\r\n\r\n-Giặt tay hay giặt máy thoải mái không sợ ra màu, nhăn , mất form\r\n\r\n-----------------\r\n\r\n🔸 Cách đặt hàng\r\n\r\n- KH chọn từng màu và size cho vào giỏ hàng rồi quay ra tiếp tục chọn như vậy, khi nào chọn đủ sản phẩm muốn mua KH vào giỏ hàng và bấm mua hàng là được ạ! ( Khách vẫn chưa biết đặt có thể chat với shop)\r\n\r\n- Shop đóng gói theo đơn khách đặt, ko đóng theo ghi chú hay tin nhắn\r\n\r\n-------------------------\r\n\r\n🔸 CAM KẾT - ĐẢM BẢO:\r\n\r\n- Hàng có sẵn, giao hàng ngay khi nhận được đơn đặt hàng .\r\n\r\n- Chấp nhận đổi hàng khi size không vừa hoặc hàng lỗi (vui lòng nhắn tin riêng cho shop).\r\n\r\n- Hỗ trợ đổi trả theo quy định của Shopee.\r\n\r\n-------------------------\r\n\r\n🔸ĐIỀU KIỆN ĐỔI TRẢ:\r\n\r\n- Hỗ trợ trong vòng 03 ngày từ khi nhận hàng.\r\n\r\n- Hàng hoá vẫn còn mới nguyên tem mác, chưa qua sử dụng.\r\n\r\n- Hàng hoá bị lỗi hoặc hư hỏng do vận chuyển hoặc do nhà sản xuất.\r\n\r\n--------------------------\r\n\r\n📌 LƯU Ý:  Khi bạn gặp bất kì vấn đề gì về sản phẩm đừng vội đánh giá  mà hãy chat liên hệ Shop để đc hỗ trợ 1 cách tốt nhất  nhé.\r\n\r\n\r\n\r\n#Quầnđùinam #quầnshortnam #quầnsoocnam #quầnlửngnam #quầnsọtnam #shortnam #quầnsócnam #quầnsortnam #quầnshotnam #quanduinam #quầnshorts #quầnsọcnam #quầnsocnam #quânshortnam #quầnsọt #quầnnamngắn #quầncộcnam #quầncộcnam #quanshortnam #quầnshortlửng #soocnam #quầnshortkakinam #quầnshortkaki #quầnđùikaki #quầnshortnamkaki #shortkaki #quầnđùikakinam #quầnsoockaki #quầnngốkakinam #quầnsọtkakinam #quầnlửngkakinam #quầnkakinamngắn #shortkakinam #quầnsoockakinam #quầnkakilửngnam', 73.500, 115.000, 140, 1, 1, '2025-07-30 15:47:11', '2025-07-30 15:47:11'),
(12, 'Bộ 3 áo thun polo nam vải cá sấu co giãn 4 chiều cổ bẻ Everest Nhiều màu', 'vn-11134207-7ra0g-m8cvhk9d7triac.webp', '\"QUÝ KHÁCH MUỐN CHỌN MÀU TRONG COMBO THÌ LÚC ĐẶT HÀNG ĐIỀN MÀU MÌNH MUỐN CHỌN VÀO PHẦN \"\" GHI CHÚ \"\" ạ , nếu quý khách không ghi vào phần ghi chú shop sẽ soạn 3 màu theo màu có sẵn trên hình phân loại ạ !\r\n\r\nTHÔNG TIN SẢN PHẨM\r\n\r\ncombo Bộ 3 áo thun polo nam vải cá sấu co giãn 4 chiều cổ bẻ Everest Nhiều màu\r\n\r\nKhách nhận 3 áo\r\n\r\nÁo thun nam cổ bẻ thời trangthiết kế cổ bẻ, tay ngắn, mang đến phong cách khỏe khoắn, năng động\r\n\r\n\r\n\r\nThiết kế đơn giản, lịch sự,phù hợp với nhiều độ tuổi, mặc đượctrong nhiều hoàn cảnh khác nhau\r\n\r\n\r\n\r\nMàu trơn đơn giản, tinh tế cùng với form áo rộng rãi, thoải mái giúp tôn được nét mạnh mẽ, nam tính\r\n\r\n\r\n\r\nÁo thun cá sấu Có nhiều màu sắc khác nhau cho bạn lựa chọn phù hợp với sở thích\r\n\r\n\r\n\r\nChất liệu thun cá sấu mềm mại, thấm hút mồ hôi, mang lại cảm giác thoải mái khi mặc\r\n\r\n\r\n\r\nBạn có thể chọn kết hợp với quần jeans, đồng hồ thể thao và giày lười để tạo nên một set đồ hiện đại hoặc nhiều trang phục thời trang khác\r\n\r\n\r\n\r\nÁo thun nam thời trang ngày nay rất được các bạn trẻ yêu thích. Áo thun đã có từ lâu đời nhưng trai qua thời gian và nhiều xu hướng mới nổi lên, nhưng áo thun chưa bao giờ bị lãng quên và lỗi mốt. Áo thun có thể mặc trong nhiều dịp khác nhau, từ đi làm đến đi chơi, dạo phố,… Chỉ cần bạn biết cách phối đồ một chút thì trong bạn sẽ thật sành điệu và thời trang.\r\n\r\n\r\n\r\nÁo thun nam cổ bẻ thời trang có thiết kế tay ngắn, mang đến phong cách khỏe khoắn, năng động\r\n\r\n\r\n\r\nÁo thun nam cổ bẻ thời trang có thiết kế tay ngắn, mang đến phong cách khỏe khoắn, năng động. Thiết kế đơn giản, lịch sự, phù hợp với nhiều độ tuổi, mặc được trong nhiều hoàn cảnh khác nhau. Màu trơn đơn giản, tinh tế cùng với form áo rộng rãi, thoải mái giúp tôn được nét mạnh mẽ, nam tính. Phối logo thêu bên ngực trái, nhấn nhá làm tăng vẻ thời trang cho chiếc áo. Đặc biệt, áo có chất liệu thun cá sấu mềm mại, thấm hút mồ hôi, mang lại cảm giác thoải mái khi mặc.\r\n\r\n\r\n\r\nÁo thun nam cổ bẻ này có nhiều size khác nhau cho bạn lựa chọn phù hợp với dáng người, phù hợp nhiều lứa tuổi khác nhau, dù bạn là một cậu nhóc còn đi học hay là một anh chàng sành điệu đi làm công sở thì vẫn mặc được. Áo được làm từ chất liệu thun cá sấu mềm mại, thấm hút mồ hôi, mặc thoải mái suốt cả ngày dài. Áo có màu xám thanh lịch, đỏ mạnh mẽ và màu vàng trẻ trung cho bạn phối với quần jean, short, giày,… khi đi làm, đi chơi với bạn bè. Hãy MUA NGAY cho mình một sản phẩm nhé, chúng tôi sẽ giao hàng tận nơi cho bạn.\r\n\r\n#aothun #aopolo #aothuncotru #aothunpolonam #aopolonam #aothuncasau #aocasau #áocásấu #aothunnam #aothunnu #aonam #aonu #aothunden #aothuneverest #everest\r\n\r\n', 163.000, 300.000, 245, 1, 1, '2025-07-31 15:48:07', '2025-07-31 15:48:07'),
(13, 'Bộ Sạc Đa Năng 4IN1 65W / 120W Cao Cấp 1M, Dây Dù Chống Đứt - Cho USB-Type C, Type C-Type C, Type C- i.P, USB-i.P', 'sg-11134201-7rdyd-lxt55pf2tylc84.webp', 'PHỤ KIỆN ĐIỆN THOẠI HATU\r\n\r\n\r\n\r\nThông tin sản phẩm: Bộ Sạc Đa Năng 4IN1 65W / 120W Cao Cấp 1M, Dây Dù Chống Đứt - Cho USB-Type C, Type C-Type C, Type C- i.P, USB-i.P\r\n\r\n\r\n\r\nTHÔNG SỐ SẢN PHẨM :\r\n\r\n- Chất liệu ABS + Dây dù + Đầu cáp kim loại\r\n\r\n- Chân kết nối : USB-C, USB\r\n\r\n- Chân cắm :USB A - Type C, USB A - , Type C - Type C, Type C - \r\n\r\n- Công suất : PD 27W (IP) - 65W(ANDROID, LAPTOP)\r\n\r\n- Chiều dài 1m\r\n\r\n-Truyền tải dữ liệu 480 Mbps\r\n\r\n\r\nƯU ĐIỂM CỦA CÁP\r\n\r\n 1. [Thích ứng đa giao thức] Nhiều kiểu thiết bị được sử dụng để hỗ trợ giao thức sạc PD cho điện thoại di động / máy tính bảng / máy tính xách tay.\r\n\r\n 2. [Sạc] Với đầu sạc giao thức sạc ban đầu, nó có thể được sạc đến 80% trong 40 phút, hỗ trợ sạc IOS27W và sạc 65W.\r\n\r\n 3. [Có thể chuyển đổi 4 loại giao diện theo ý muốn] Hỗ trợ đầy đủ thiết bị, bạn có thể chuyển đổi giữa điện thoại di động, máy tính bảng, tai nghe và các thiết bị khác, hỗ trợ giao diện:\r\n\r\n 4. [Tế bào dày] Lõi đồng đóng hộp ít hao hụt có thể dễ dàng mang dòng điện lớn, thân dây bện nylon chắc chắn và chống đứt.\r\n\r\n 5. [Truyền tốc độ cao] Tốc độ truyền 480Mbps / s, sạc / truyền dữ liệu được thực hiện đồng bộ.\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nCủ Sạc 65W QC3.0 3 Cổng USB + Type C PD Phích Cắm EU\r\n\r\n✔ Thông tin sản phẩm\r\n\r\n**** ĐẦU SẠC 65W\r\n\r\n- Giao diện đầu ra: 1 Cổng USB, 2 cổng Type C\r\n\r\n- Đầu vào: 100-240V-50 / 60Hz 0,5A\r\n\r\n- Chất liệu:PC + ABS\r\n\r\n- Đầu ra Type C: 5V = 3A, 9V = 2.2A, 12V = 1.5A\r\n\r\n- Đầu ra USB: 3,6-6,5V = 3A, 6,5V-9V = 2A, 9-12V = 1,5A\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nCỦ SẠC 120W\r\n\r\n- Giao diện đầu ra: 2 cổng USB A + 2 cổng PD\r\n\r\n- Đầu vào: 100-240V-50/60Hz0.5A\r\n\r\n- Cổng Loại C: 5V-3A, 9V-2.2A, 12V-1.5A\r\n\r\n- Cổng USB A: 3.6-6.5V 3A, 6.5-9V 2A, 9-12V 1.5A\r\n\r\n\r\n\r\n\r\nShop Cam Kết:\r\n\r\n- Với đội ngũ hơn 100 nhân viên, shop mang lại cho quý khách trải nghiệm và dịch vụ tuyệt vời nhất!\r\n\r\n- Nếu quý khách không hài lòng với bất kì lí do gì shop sẽ hoàn tiền hoặc gửi lại sản phẩm mới thay thế cho quý khách. \r\n\r\n- Thương hiệu tạo niềm tin!\r\n\r\n\r\n\r\nShop Đảm Bảo:\r\n\r\n- Hình ảnh sản phẩm giống 100%\r\n\r\n- Chất lượng sản phẩm tốt 100%.\r\n\r\n- Sản phẩm được kiểm tra kĩ càng, nghiêm ngặt trước khi giao hàng.\r\n\r\n- Giao hàng ngay khi nhận được đơn hàng.\r\n\r\n- Hoàn tiền ngay nếu sản phẩm không giống với mô tả.\r\n\r\n- Đổi trả ngay nếu bất kì lí do gì khiến quý khách không hài lòng.\r\n\r\n- Giao hàng toàn quốc, nhận hàng thanh toán.\r\n\r\n- Hỗ trợ đổi trả theo quy định.\r\n\r\n- Đóng gói siêu, gửi hàng siêu tốc.\r\n\r\n\r\n\r\nQuý khách lưu ý:\r\n\r\n- Khi nhận được hàng Quý khách vui lòng bỏ chút thời gian để đánh giá cho shop, để shop có chiều hướng phục vụ tốt hơn cho Quý khách.\r\n\r\n\r\n\r\nHashtag: #Bộ #Củ #Cốc #Dây #Cáp #Sạc #Điện #Thoại #Samsung # Oppo #Vivo #Xiaomi #PD #Hoco #18W #20W #CaoCấp #ChínhHãng', 27.900, 39.000, 256, 1, 2, '2025-07-31 15:50:18', '2025-07-30 15:50:18'),
(14, '【Bộ sạc nhanh lP】Củ sạc nhanhPD30W/PD20W+Dây sạc nhanh 1m/1.5m/2m,Sạc nhanh nhiệt độ thấp Hàng chính hãng phụ kiện phone', 'vn-11134207-7ra0g-m76a05nkk8knb1.webp', '✅ Thông Tin Sản Phẩm:Bộ Sạc Nhanh PD 30W \r\n\r\n\r\n\r\n- Sản phẩm bao gồm: Củ sạc nhanh + Dây sạc nhanh (PD 30W)\r\n\r\n- Chất liệu: Nhựa PVC\r\n\r\n- Công suất: PD30W/PD20W\r\n\r\n\r\n\r\n✅ Ưu Điểm  Sản Phẩm Bộ Sạc Nhanh PD30W:\r\n\r\n\r\n\r\n- Sạc Loại tốt đạt đủ công suất 30W\r\n\r\n- Sạc Nhanh được kích hoạt từ 0 đến 80% trong khoản thời gian chỉ từ 30 đến 45 phút.\r\n\r\n- Không làm chai pin, hỏng pin\r\n\r\n- Tốc độ sạc nhanh và ổn định\r\n\r\n- Có mạch bảo vệ tự ngắt khi sạc đầy\r\n\r\n- Sạc nhanh nhiệt độ thấp\r\n\r\n- An toàn khi sử dụng.\r\n\r\n\r\n\r\n✅ CAM KẾT VỚI KHÁCH HÀNG:\r\n\r\n\r\n\r\n- 100% giống mô tả, có hình ảnh chụp và video quay sản phẩm thực tế\r\n\r\n\r\n\r\n-Sản phẩm bán ra là sản phẩm mới 100%\r\n\r\n\r\n\r\n- Đảm bảo chất lượng, dịch vụ tốt nhất, hàng được giao từ 1-5 ngày kể từ ngày đặt hàng \r\n\r\n\r\n\r\n- Bảo hành 12 tháng - Lỗi 1 đổi 1 trong 30 ngày đầu\r\n\r\n\r\n\r\n- Gói hàng chắc chắn, tỉ mỉ để hàng khi đến với khách hàng trong trang thái tốt nhất.\r\n\r\n-----------------------------------------------------\r\n\r\n\r\n\r\n#bosacnhanh #bosac#bosac30w #bosacnhanhpd #bosacpd #bosacnhanh20w #sac20w #sacnhanh20w #sacpd #20w #sacnhanh30w', 28.000, 47.000, 256, 1, 2, '2025-07-31 15:52:59', '2025-07-31 15:52:59'),
(15, 'Ốp Lưng iPhone TPU Chống Bẩn Lót Nhung, Bảo Vệ Camera - iP 6/6s/7/8/Plus/X/XS/XR/11/12/13/14/15/Pro/Max', 'vn-11134207-7ra0g-ma0no4sczi8q98.webp', 'Ốp Lưng iPhone TPU Chống Bẩn Lót Nhung, Bảo Vệ Camera - iP 6/6s/7/8/Plus/X/XS/XR/11/12/13/14/15/Pro/Max\r\n\r\n\r\n\r\nShin Case cam kết:\r\n\r\n- Với đội ngũ hơn 100 nhân viên Shin Case mang lại cho quý khách trải nghiệm và dịch vụ tuyệt vời nhất!\r\n\r\n\r\n\r\n- Nếu quý khách không hài lòng với bất kì lí do gì. Shin Case sẽ hoàn tiền hoặc gửi lại sản phẩm mới thay thế cho quý khách. \r\n\r\n\r\n\r\n- Thương hiệu tạo niềm tin!\r\n\r\n\r\n\r\nShin Case đảm bảo:\r\n\r\n\r\n\r\n- Hình ảnh sản phẩm giống 100%.\r\n\r\n\r\n\r\n- Chất lượng sản phẩm tốt 100%.\r\n\r\n\r\n\r\n- Sản phẩm được kiểm tra kĩ càng, nghiêm ngặt trước khi giao hàng.\r\n\r\n\r\n\r\n- Sản phẩm luôn có sẵn trong kho hàng. \r\n\r\n\r\n\r\n- Giao hàng ngay khi nhận được đơn hàng.\r\n\r\n\r\n\r\n- Hoàn tiền ngay nếu sản phẩm không giống với mô tả.\r\n\r\n\r\n\r\n- Đổi trả ngay nếu bất kì lí do gì khiến quý khách không hài lòng.\r\n\r\n\r\n\r\n- Giao hàng toàn quốc, nhận hàng thanh toán.\r\n\r\n\r\n\r\n- Hỗ trợ đổi trả theo quy định.\r\n\r\n\r\n\r\n- Gửi hàng siêu tốc : Với đội ngũ hơn 100 nhân viên Shin case cam kết dịch vụ đóng gói siêu nhanh.\r\n\r\n\r\n\r\nThông tin sản phẩm: \r\n\r\n\r\n\r\n- Chất liệu:  Nhựa dẻo TPU cao cấp\r\n\r\n\r\n\r\n- Màu sắc: Nhiều Màu.\r\n\r\n\r\n\r\n- Ốp lưng được đóng gói bằng túi nilon thiết kế đẹp.\r\n\r\n\r\n\r\n- Hình ảnh chất lượng cao,sắc nét, không phai màu.\r\n\r\n\r\n\r\n- Hình ảnh thiết kế đẹp, phong cách, trẻ trung.\r\n\r\n\r\n\r\n- Công dụng: Là phụ kiện thời trang, thay đổi màu sắc cho điện thoại, giữ điện thoại chắc chắn trên tay, an toàn chống trầy xước,  bảo vệ chiếc điện thoại khỏi va đập.', 34.900, 49.800, 100, 1, 2, '2025-07-31 16:02:14', '2025-07-31 16:02:14'),
(16, 'Giá Đỡ Điện Thoại Máy Tính Bảng HỢP KIM NHÔM Xoay 360, Kệ Để Điện Thoại Xem Phim Livestream', 'vn-11134207-7r98o-lx49qcrtzfmhe9.webp', 'ƯU ĐIỂM SẢN PHẨM GIÁ ĐỠ ĐIỆN THOẠI XOAY 360 XEM PHIM LIVESTREAM\r\n\r\n\r\n\r\n- Giá đỡ điện thoại sử dụng công nghệ xoay AR mới mang lái sự ổn định bền bỉ\r\n\r\n- Kệ điện thoại có trục xoay 360° không góc chết di chuyển xoay theo ý thích một cách linh hoạt\r\n\r\n- Giá đỡ điện thoại làm từ vật liệu sắt và hợp kim nhôm CNC nguyên khối mang đến sự tỉ mỉ hoàn thiện cao\r\n\r\n- Giá đỡ xem phim livestream chịu được tải trọng lên đến 5kg thích hợp cho điện thoại và máy tính bảng\r\n\r\n- Kích thước tiêu chuẩn : 10cmx6,5cmx17cm\r\n\r\n\r\n\r\nTHÔNG TIN SẢN PHẨM KỆ ĐỂ ĐIỆN THOẠI IPAD IPHONE MÁY TÍNH BẢNG TABLET\r\n\r\n- Tên sản phẩm: giá đỡ điện thoại\r\n\r\n- Màu sắc: Xám kim loại / Tím kim loại\r\n\r\n- Kích thước phù hợp: trong vòng 10,9 inch\r\n\r\n- Chất liệu: Kim loại hợp kim\r\n\r\n- Trọng lượng: 130g', 1.250, 15.000, 123, 1, 2, '2025-07-31 16:03:29', '2025-07-31 16:03:29'),
(17, '20w 30W Sạc Nhanh Thông Minh USB C PD US Cắm Dữ Liệu Sạc Nhanh 1 Mét PD Cáp Adapter Dây USB-C Cắm', 'sg-11134201-7rcd4-ls19ecm1qqtc96.webp', 'Gói bao gồm:\r\n\r\nBộ chuyển đổi PD 20W / 30W, cáp PD.\r\n\r\n\r\n\r\nCác tính năng:\r\n\r\n1. Bộ sạc di động cho gia đình, văn phòng, du lịch và các mục đích sử dụng trong nhà khác.\r\n\r\n2. 1 cổng Loại C (sạc nhanh PD 20w).\r\n\r\n3. 8 Bảo vệ giúp bạn và thiết bị của bạn an toàn hơn.\r\n\r\n4. Tương thích với smartphones \r\n\r\n5. Sạc nhanh 20W.\r\n\r\n6. Thiết kế nhỏ gọn, kích thước nhỏ và trọng lượng nhẹ\r\n\r\n\r\n\r\nĐiện áp đầu vào: AC 100-240V 50-60Hz 0.8A\r\n\r\nTổng công suất: 20W\r\n\r\nĐầu ra 1: DC 5V / 3A DC9V / 2A DC12V / 1.5A \r\n\r\nTiêu chuẩn cắm: phích cắm của Hoa Kỳ\r\n\r\nMàu trắng\r\n\r\nChất liệu: PC chống cháy', 31.790, 72.600, 256, 1, 2, '2025-07-30 16:05:46', '2025-07-30 16:05:46'),
(18, 'Ốp điện thoại Silicon mềm chống trượt màu đen MỚI cho IP IPhone 7 8 14 15 16 Plus X XR XS Max 11 12 13 14 15 16 Pro Max 11prm 12prm 13prm....', 'cn-11134207-7ras8-m6nn8tyt7bo37e.webp', '“Hàng sẵn sàng ”\r\n\r\n Vỏ điện thoại Silicon mềm chống trượt màu đen MỚI cho IP IPhone 7 8 14 15 16 Plus X XR XS Max 11 12 13 14 15 16 Pro Max 11prm 12prm 13prm 14prm 15prm 16prm Logo\r\n\r\n Chú ý: In logo được làm bằng chất liệu màu đen. Ngoài ra, do lý do chụp máy ảnh, một số bộ phận của vỏ dưới có thể có màu sáng hơn hoặc tối hơn. Người mua quan tâm, xin vui lòng lựa chọn cẩn thận\r\n\r\n \r\n\r\n \r\n\r\n \r\n\r\n Thông báo của người mua:\r\n\r\n 1.Vui lòng kiểm tra mã số trên đầu hình ảnh.\r\n\r\n 2.Cập nhật hàng ngày trường hợp mới và thời trang, Xin vui lòng chú ý đến cửa hàng của chúng tôi.\r\n\r\n 3.Mua nhiều hơn 6 chiếc cùng một lúc, chúng tôi sẽ giới thiệu một loại nhựa đóng gói bán lẻ bằng vật liệu OPP.\r\n\r\n \r\n\r\n \r\n\r\n \r\n\r\n Ưu điểm:\r\n\r\n 100% thương hiệu mới, hoàn toàn phù hợp với điện thoại tình yêu của bạn.\r\n\r\n Chống bám bụi và trầy xước, ốp lưng chống sốc hiệu quả.\r\n\r\n \r\n\r\n \r\n\r\n \r\n\r\n Gói bao gồm:\r\n\r\n 1 gói = 1 trường hợp\r\n\r\n \r\n\r\n \r\n\r\n \r\n\r\n Chất liệu: Silicon mềm\r\n\r\n \r\n\r\n \r\n\r\n \r\n\r\n Tương thích với:\r\n\r\n 1.Iphone\r\n\r\n Iphone 7 / 8 / SE 2020 / SE 2022\r\n\r\n Iphone 7Plus / 8Plus\r\n\r\n Iphone X / XS\r\n\r\n Iphone XR\r\n\r\n Iphone XS Max\r\n\r\n Iphone 11\r\n\r\n Iphone 11Pro\r\n\r\n Iphone 11Pro Max\r\n\r\n Iphone 12\r\n\r\n Iphone 12Pro\r\n\r\n Iphone 12Pro tối đa\r\n\r\n Iphone 13\r\n\r\n Iphone 13Pro\r\n\r\n Iphone 13Pro tối đa\r\n\r\n Iphone 14\r\n\r\n Iphone 14 Pro\r\n\r\n Iphone 14 Pro Max\r\n\r\n Iphone 15\r\n\r\n Iphone 15 chuyên nghiệp\r\n\r\n Iphone 15 Pro Max\r\n\r\n Iphone 16\r\n\r\n Iphone 16 Pro\r\n\r\n Iphone 16 Pro Max\r\n\r\n \r\n\r\n \r\n\r\n \r\n\r\n #caseiphone7 #caseiphone8 #caseiphone7plus #caseiphone8plus #caseiphonex #caseiphonexs #caseiphonexr #caseiphonexsmax #caseiphone11 #caseiphone11pro #caseiphone11promax #caseiphone12 #caseiphone12pro #caseiphone12promax #caseiphone13 #caseiphone13pro #caseiphone13promax #caseiphone14 #caseiphone14plus #caseiphone14pro #caseiphone14promax #caseiphone15 #caseiphone15plus #caseiphone15pro #caseiphone15promax#caseiphone16 #caseiphone16plus #caseiphone16pro #caseiphone16promax', 19.224, 32.387, 256, 1, 2, '2025-07-09 16:07:06', '2025-07-09 16:07:06'),
(19, 'Giá đỡ điện thoại để bàn L98 chân xoay 360 độ tiện lợi bằng hợp kim nhôm gấp gọn', 'vn-11134207-7r98o-lvtusc0sj6c9eb.webp', 'Giá đỡ điện thoại để bàn L98 chân xoay 360 độ tiện lợi bằng hợp kim nhôm gấp gọn\r\n\r\n✔️  Chất liệu full hợp kim nhôm \r\n\r\n\r\n\r\n✔️  Các khớp chắc chắn bền bỉ.\r\n\r\n\r\n\r\n✔️  Gọn nhẹ, rất tiện lợi bỏ túi khi mang theo\r\n\r\n\r\n\r\n✔️  Có thể điều chỉnh độ cao + góc nghiêng\r\n\r\n\r\n\r\n✔️  Màu sắc: Trắng, Đen\r\n\r\n✔️  Đệm cao su chống trơn trượt và trầy xước máy tính bảng, điện thoại\r\n\r\n\r\n\r\n✔️  Kích thước: chi tiết trong hình sản phẩm\r\n\r\n\r\n\r\n✔️ Trọng lượng: khoảng 150g\r\n\r\n- Hoàn tiền ngay nếu sản phẩm không giống với mô tả.\r\n\r\n- Đổi trả ngay nếu bất kì lí do gì khiến quý khách không hài lòng.\r\n\r\n- Giao hàng toàn quốc, nhận hàng thanh toán. \r\n\r\n- Hỗ trợ đổi trả theo quy định.\r\n\r\n- Gửi hàng siêu tốc\r\n\r\nQuý khách lưu ý:\r\n\r\n- Khi nhận được hàng Quý khách vui lòng bỏ chút thời gian để đánh giá cho shop, để shop có chiều hướng phục vụ tốt hơn cho Quý khách.\r\n\r\n- Thiết kế vỏ hộp có thể thay đổi theo từng lô sản xuất của xưởng', 18.000, 22.000, 140, 1, 2, '2025-07-31 16:14:55', '2025-07-31 16:14:55'),
(20, 'GOOJODOQ 5000mah Mini Power Bank cho iPhone Android Phone Cáp tích hợp Bộ sạc di động nhỏ gọn Lightning & Type C', 'cn-11134207-7ras8-m66bo5mqa7tt6e.webp', 'Cảm ơn bạn đã chọn GOOJODOQ, Trước khi mua bạn có thể tìm hiểu về:\r\n\r\n❤️Giao hàng nhanh (Vận chuyển trong vòng 24 giờ)\r\n\r\n❤️Đảm bảo chất lượng thương hiệu &amp;  Bao bì an toàn&amp;Kiểm tra kỹ trước khi đăng\r\n\r\n❤️Đảm bảo các dịch vụ hiệu quả và nhanh chóng trước khi &amp; Sau bán hàng\r\n\r\n\r\n\r\nLoại C tích hợp &amp; Phích cắm sét: Bộ sạc dự phòng 5000mAh của chúng tôi được trang bị cáp Loại C và đầu nối lightning không dây cáp, phù hợp với 95% điện thoại di động, máy tính bảng và tai nghe. Bạn không cần thêm dây khi đang di chuyển để tránh những rắc rối khi sạc.\r\n\r\n\r\n\r\nSạc đồng thời 2 thiết bị: Bạn được phép sạc hai thiết bị cùng lúc bằng cáp Type-C khép kín và đầu nối lightning, đáp ứng 99% nhu cầu của thiết bị. Khi nó được sạc lại, bạn có thể sử dụng cáp Loại C đi kèm.\r\n\r\n\r\n\r\nKích thước nhỏ gọn di động: Có kích thước 77,5 x 26,5 x 50mm và trọng lượng 97g, kích thước bỏ túi của nó phù hợp với hầu hết các túi hoặc túi xách của bạn và cho phép bạn xử lý nó khi di chuyển, đi làm, Mua sắm, v.v. \r\n\r\n\r\n\r\nThiết kế cân nhắc: Đầu nối sét của nó có nắp bảo vệ bằng silicon để ngăn nó khỏi bị oxy hóa và trầy xước. Có đèn báo hiển thị mức pin hiện tại để nhắc bạn sạc kịp thời. Hơn nữa, cáp TPE mềm được thiết kế như một sợi dây để thuận tiện mang theo bằng ngón tay.\r\n\r\n\r\n\r\nMột món quà đáng yêu cho phụ nữ: Bộ sạc dự phòng di động trông rất dễ thương như một viên nang nhỏ và được thiết kế với chất lượng cao đầy kết cấu kim loại và cảm ứng thoải mái. Đây là một món quà hoàn hảo cho người bạn nữ của bạn, những người cần một pin dự phòng di động mỗi ngày. Có 5 màu tùy chọn để đáp ứng sở thích của bạn.', 89.100, 180.000, 256, 1, 2, '2025-07-31 16:16:13', '2025-07-31 16:16:13'),
(21, 'Loa Bluetooth mini KTS-1057 nhỏ gọn âm thanh siêu hay đèn led nhấp nháy Hỗ trợ cắm thẻ nhớ, USB', 'vn-11134207-7r98o-lzlr4452vbmpe1.webp', '-----  SHOP CAM KẾT ------\r\n\r\n✅	PHƯƠNG CHÂM “MỘT CHỮ TÍN - VẠN NIỀM TIN”\r\n\r\n✅Chúng tôi cam kết mang đển cho khách hàng những sản phẩm tốt nhất trong tâm giá so với thị trường, mang lại sự hài lòng tuyệt đối cho khách hàng đã tin tưởng mua sản phẩm.\r\n\r\n✅	Quyền lợi khách hàng  là mục tiêu phát triển của chúng tôi.\r\n\r\n✅	 Shop cam kết hoàn tiền hoặc gửi lại sản mới thay thế cho quý khách sớm nhất có thể, nếu khách hàng không hài lòng về chất lượng của sản phẩm\r\n\r\n\r\n\r\n\r\n\r\n------  SHOP ĐẢM BẢO ------\r\n\r\n✅	Hình ảnh sản phẩm giống hình 100%\r\n\r\n✅	Chất lượng sản phẩm đúng như mô tả\r\n\r\n✅	Sản phẩm được kiểm tra kĩ càng, nghiêm ngặt trước khi giao hàng\r\n\r\n✅	Đóng gói và giao hàng ngay khi nhận được đơn đặt hàng\r\n\r\n✅	Hoàn tiền ngay nếu sản phẩm không đúng như mô tả\r\n\r\n✅	Giao hàng toàn quốc, chấp nhận nhiều phương thức thanh toán\r\n\r\n✅	Hỗ trợ đổi trả 1:1 nếu sản phẩm có bất kì sai xót nào từ nhà cung cấp\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n🔊 Loa bluetooth không dây KTS-1057 \r\n\r\n\r\n\r\n📢 Trang bị công nghệ bluetooth vô cùng phổ biến nên có thể kết nối với tất cả các thiết bị thông minh như điện thoại, loptop, airpad,....\r\n\r\n📢Kết nối siêu đơn giản chỉ cần mở nguồn loa sẽ tự động kết nối, sau đó kết nối điện thoại của bạn.\r\n\r\n👉Có thể nghe nhạc, xem phim , nghe điện thoại với âm cực chuẩn , siêu hay, siêu thỏa mái.\r\n\r\n👉 Ngoài kết nói bluetooth loa có trang bị thẻ nhớ và cổng USB có thể phát nhạc một cách dễ dàng\r\n\r\n👌THÔNG SỐ KĨ THUẬT\r\n\r\nSản phẩm gồm: Loa, cáp sạc, chuổi.\r\n\r\n👉Chất liêu: nhựa, kim loại.\r\n\r\n👉Công suất: 5 W\r\n\r\n👉Thời gian sử dụng: 3-5h ( tùy âm lượng sử dụng)\r\n\r\n👉Thời gian sạc:1.5-2h\r\n\r\n👉 Kết nối bluetooth, 10m \r\n\r\n👉 Tần số đáp ứng: 100Hz - 20KHz \r\n\r\n👉 Nghe nhạc từ USB (max 32Gb) /SD Card \r\n\r\n👉 Tần số radio: 85.7 - 108.0 MHz \r\n\r\n👉Cổng AUX: kết nối với các thiết bị phát bằng dây khi không có bluetooth\r\n\r\n👉Cổng sạc mini USB, DC 5V\r\n\r\n\r\n\r\n\r\n\r\n☀LƯU Ý:\r\n\r\n✔ Nếu khách hàng muốn đặt nhiều màu khác nhau thì vui lòng CHỌN MÀU 1 -> THÊM VÀO GIỎ HÀNG -> CHỌN MÀU 2 -> THÊM VÀO GIỎ HÀNG... . Sau khi chọn đủ các màu, bạn chọn TỚI GIỎ HÀNG hoàn thành các bước thanh toán nhé\r\n\r\n▶️ Chúng tôi đặt lợi ích của khách hàng lên hàng đầu với các chính sách 100% có lợi chính đáng cho khách hàng:', 18.000, 40.000, 100, 1, 3, '2025-07-31 01:49:53', '2025-07-31 01:49:53'),
(22, 'Tai Nghe Không Dây X55 / F9 / M10 / KY8 PRO Bluetooth Màn Hình LED Tai Nghe Tích Hợp Mic , Khử Tiếng Ồn', 'vn-11134207-7ra0g-m6o2nnk0ba7b4d.webp', 'Thương hiệu:NO\r\n\r\nSản phẩm: Tai nghe ngủ không dây X55\r\n\r\nMàu: Trắng / Đen / Hồng / Xanh / Kaki / Tím\r\n\r\nĐặc điểm kỹ thuật: tai nghe buletooth không dây\r\n\r\nMặc: trong tai\r\n\r\nThời gian làm việc: 3-4 giờ\r\n\r\nThời gian sạc hộp sạc: khoảng 30 phút-1 giờ\r\n\r\nPhương pháp điều khiển: điều khiển nút\r\n\r\nKhả năng tương thích rộng:\r\n\r\nĐối với android, iP, máy tính, máy tính xách tay và tất cả các thiết bị khác hỗ trợ chức năng bluetooth.\r\n\r\nTính năng:\r\n\r\n-Tai Nghe ngủ. Rất thoải mái khi mặc\r\n\r\n-Điều Khiển một nút\r\n\r\n- Micrô tích hợp\r\n\r\n-LED Màn hình\r\n\r\n-Chất Lượng âm thanh Hi-fi, thưởng thức siêu cao\r\n\r\nCách CẶP:\r\n\r\nVui lòng làm theo các bước dưới đây để ghép nối tai nghe với thiết bị của bạn một cách chính xác.\r\n\r\n1. Vui lòng kiểm tra xem tai nghe có nguồn hay không. Nếu không có điện, xin vui lòng sạc nó.\r\n\r\n2. Lấy hai tai nghe ra khỏi hộp sạc. “Lấy ra cùng một lúc\r\n\r\nThời gian. Rất quan trọng. Bên trái và bên phải sẽ ghép nhau. \"\r\n\r\n3. Chờ trong 5 giây.\r\n\r\n4. Bật chức năng \"Bluetooth\" của thiết bị của bạn.\r\n\r\n5. Tìm biểu tượng \"TWS\" trong danh sách thiết bị bluetooth, nhấp vào \"TWS\" để ghép nối.\r\n\r\n5. \"Tws\" xuất hiện trong danh sách được ghép nối.\r\n\r\n7. Việc gọt thành công.\r\n\r\nDanh sách gói:\r\n\r\n2 * tai nghe (bên phải và bên trái)\r\n\r\n1 * hộp sạc\r\n\r\n1 * Cáp sạc\r\n\r\n1 * Hướng dẫn sử dụng\r\n\r\n#tainghex55#tainghe#tainghebluetooth', 12.500, 59.000, 140, 1, 3, '2025-07-31 01:51:41', '2025-07-31 01:51:41'),
(23, 'Bao tay chơi game BlueWow Găng tay đầu ngón tay chống trượt chống mồ hôi Găng tay chơi game', 'cn-11134207-7r98o-lxxu3j42a6n7f5.webp', '👏👏👏 Chào mừng bạn đến với \"Cửa hàng chính thức 3C Tech (R)\": BlueWow\r\n\r\n\r\n\r\n🎁 Nếu bạn nhấp vào cửa hàng \"theo dõi\", bạn sẽ có phiếu giảm giá số lượng lớn và quyền giao hàng ưu tiên.\r\n\r\n\r\n\r\n🎁 Chúng tôi là cửa hàng chính thức được ủy quyền, cảm ơn bạn đã đến và theo dõi chúng tôi tại đây. \r\n\r\n\r\n\r\n🎁 Các bưu kiện sẽ được gửi trong 24 giờ sau khi thanh toán được thực hiện. \r\n\r\n\r\n\r\n🎁 Chất lượng tốt với bảo hành, và giá là giá bán buôn. \r\n\r\n\r\n\r\n🎁 Chúng tôi có đội ngũ hỗ trợ chuyên nghiệp để gặp bạn trong 24 giờ, vui lòng liên hệ với chúng tôi nếu bạn có bất kỳ câu hỏi nào. Cảm ơn bạn!', 15.400, 52.000, 256, 1, 3, '2025-07-31 01:53:02', '2025-07-31 01:53:02'),
(24, 'Loa bluetooth không dây mini A005 đèn led âm bass mạnh hỗ trợ lắp thẻ nhớ hàng cao cấp', 'vn-11134207-7qukw-lh74iwm8y8s3fc.webp', 'Loa bluetooth không dây mini A005 đèn led theo nhạc hàng cao cấp bảo hành lỗi 1 đổi 1\r\n\r\nThông số kỹ thuật:\r\n\r\n- Model: A005\r\n\r\n- Bluetooth: V4.2\r\n\r\n- Hỗ trợ cổng: USB, thẻ nhớ TF,...\r\n\r\n- Khoảng cách kết nối: ~10 mét\r\n\r\n- Cổng sạc: Micro USB\r\n\r\n- Bộ sản phẩm: 1 x Loa, 1 x Dây sạc\r\n\r\n-----------------------------------------------------------------\r\n\r\nGiới thiệu sản phẩm:\r\n\r\n\r\n\r\n- Loa không dây loa bluetooth mini TG 162 A005 được thiết kế với vẻ ngoài nhỏ gọn có kích thước 108*84.1*83.6mm và trọng lượng 310g. Bạn có thể dễ dàng mang theo loa mọi nơi từ những chuyến du lịch hay buổi dã ngoại Vì vậy bạn có thể thoải mái nghe nhạc trong bất kì hoàn cảnh nào từ trong nhà, ngoài trời hay thậm chí là ở nơi làm việc.\r\n\r\n- Với thiết kế mới, loa mini bluetooth TG 162 A005 mang đến kiểu dáng mới với 5 màu sắc rực rỡ cùng lớp hoàn thiện mịn màng, tạo nên phong cách đặc trưng của loa. \r\n\r\n- Bên ngoài loa được làm bằng nhựa, chất liệu phủ bởi cao su khiến cho chiếc loa cầm trong tay rất chắc chắn và cứng cáp. Mặt trước loa dùng mặt lưới kim loại chắc chắn, kèm theo đó là đèn LED 7 màu tiện dụng ở sau màn lưới. Mặt trên chiếc loa là các phím bấm chức năng cơ bản giúp sử dụng một cách dễ dàng và tiện lợi hơn.\r\n\r\n- Loa bluetooth mini TG 162 A005 có khả năng kết nối không dây bluetooth 4.2 với bất kỳ điện thoại thông minh hay máy tính bảng nào. Với tốc độ kết nối nhanh chóng và ổn định, âm thanh khi phát ra sẽ liền mạch, không bị đứt đoạn đồng thời bạn có thể linh hoạt hơn trong việc sử dụng.\r\n\r\n- Loa bluetooth mini TG 162 A005 được trang bị loa ngoài chống ồn tiện lợi, giúp người nghe có một không gian nghe nhạc tuyệt vời đồng thời cho phép bạn nhận cuộc gọi mà không cần tắt loa. Ngoài ra, Loa bluetooth mini TG 162 A005 còn sử dụng 1 driver với kích thước 52mm và công suất 5W, nhờ vậy loa luôn đem lại âm bass to và âm thanh chất lượng ở tất cả thể loại.\r\n\r\nFullBox: Loa + Cáp Sạc USB+ Mic dây tặng kèm\r\n\r\n\r\n\r\n☀LƯU Ý:\r\n\r\n✔ Nếu khách hàng muốn đặt nhiều màu khác nhau thì vui lòng CHỌN MÀU 1 -> THÊM VÀO GIỎ HÀNG -> CHỌN MÀU 2 -> THÊM VÀO GIỎ HÀNG... . Sau khi chọn đủ các màu, bạn chọn TỚI GIỎ HÀNG hoàn thành các bước thanh toán nhé\r\n\r\n▶️ Chúng tôi đặt lợi ích của khách hàng lên hàng đầu với các chính sách 100% có lợi chính đáng cho khách hàng:\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n#loabluetooth #loabluetoothmini#loabluetooth #loabluetoothmini#loabluetooth #loabluetoothmini#loabluetooth #loabluetoothmini#loabluetooth #loabluetoothmini', 9.500, 56.000, 256, 1, 3, '2025-07-23 01:54:45', '2025-07-24 01:54:45'),
(25, 'Tai Nghe Bluetooth 5.3 FN-98 PIN TRÂU Sử Dụng Lên Đến 20H, Nghe Nhạc Bass Mạnh Ấm, Đàm Thoại 2 Chiều', 'vn-11134207-7r98o-lvhjg70q34h063.webp', 'CAM KẾT VỚI KHÁCH HÀNG\r\n\r\n- Hoàn tiền 100% nếu sản phẩm không giống hình\r\n\r\n- Giao Hàng Trên Toàn Quốc\r\n\r\n- Cam Kết Hỗ Trợ Kỹ Thuật Trong Toàn Bộ Thời Gian Quý Khách Hàng Sử Dụng Sản Phẩm\r\n\r\n- Sản Phẩm 1 ĐỔI 1 Trong 7 Ngày Với Lỗi Của Nhà Sản Xuất\r\n\r\n- Bảo Hành Sản Phẩm: 3 Tháng\r\n\r\n\r\n\r\n*** MÔ TẢ SẢN PHẨM\r\n\r\n- Thiết kế nhỏ gọn, rất nhẹ vừa vặn đeo trên tai\r\n\r\n- Đảm bảo không bị rơi khi vận động liên tục\r\n\r\n- Tai nghe bluetooth FN-98 chơi game âm thanh rất tốt độ trễ cực thấp\r\n\r\n- Với bluetooth 5.3 kết nối tự động, đường truyền mạnh mẽ, ổn định và tiết kiệm pin\r\n\r\n- Công nghệ mới giúp bạn tăng giảm âm lượng trên tai nghe mà không cần điện thoại\r\n\r\n- Tai nghe được nâng cấp lên bass mạnh và sâu hơn, âm thanh chân thật và sống động hơn\r\n\r\n- Tương thích với tất cả các thiết bị có bluetooth như: điện thoại, máy tính bảng, laptop....\r\n\r\n- Hộp sạc được trang bị màn hình LED hiển thị % PIN dễ dàng giúp chúng ta biết được khi nào hết pin để mà sạc\r\n\r\n- Tích hợp sạc nhanh, cổng sạc Type-c công nghệ sạc mới\r\n\r\n\r\n\r\n****THÔNG SỐ KỸ THUẬT\r\n\r\n- Tên tai nghe: FN-98\r\n\r\n- Tên kết nối :FN-98\r\n\r\n- Bluetooth: V5.3\r\n\r\n- Khoảng cách kết nối: 10m\r\n\r\n- Dung lượng pin: 180mAh\r\n\r\n- Thời gian chơi nhạc/đàm thoại: 10-20h\r\n\r\n- Thời gian sạc: 1-1.5h\r\n\r\n- Nguồn sạc: 5V-1A', 79.000, 130.000, 123, 1, 3, '2025-07-30 01:57:50', '2025-07-30 01:57:50');
INSERT INTO `products` (`id`, `name`, `image`, `description`, `price`, `price_old`, `stock`, `seller_id`, `category_id`, `created_at`, `updated_at`) VALUES
(26, 'Loa Bluetooth 3 Trong 1 Tích Hợp Sạc Dự Phòng K1, Làm Loa Phát Nhạc, Giá Đỡ Điện Thoại Chống Trượt Có Thể Gập Lại', 'vn-11134207-7r98o-m06s4273izkf49.webp', '----  SHOP CAM KẾT ------\r\n\r\n✅	PHƯƠNG CHÂM “MỘT CHỮ TÍN - VẠN NIỀM TIN”\r\n\r\n✅Chúng tôi cam kết mang đển cho khách hàng những sản phẩm tốt nhất trong tâm giá so với thị trường, mang lại sự hài lòng tuyệt đối cho khách hàng đã tin tưởng mua sản phẩm.\r\n\r\n✅	Quyền lợi khách hàng  là mục tiêu phát triển của chúng tôi.\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n------  SHOP ĐẢM BẢO ------\r\n\r\n✅	Hình ảnh sản phẩm giống hình 100%\r\n\r\n✅	Chất lượng sản phẩm đúng như mô tả\r\n\r\n✅	Sản phẩm được kiểm tra kĩ càng, nghiêm ngặt trước khi giao hàng\r\n\r\n✅	Đóng gói và giao hàng ngay khi nhận được đơn đặt hàng\r\n\r\n\r\n\r\n\r\n\r\nTHÔNG TIN SẢN PHẨM:\r\n\r\n Thời gian sạc: Khoảng 1h\r\n\r\n- Thời gian làm việc: Khoảng 8-10 giờ\r\n\r\n- Khoảng cách hiệu quả: 10 mét\r\n\r\n- Bluetooth 5.3\r\n\r\n- Dung lượng pin: 5000mAh\r\n\r\n- Chất liệu: nhựa ABS bền đẹp chống va đập\r\n\r\n- Loa cho chất lượng âm thanh vòm 9D rất sống động\r\n\r\n- Phụ kiện bao gồm:\r\n\r\n1 Giá đỡ điện thoại di động để bàn\r\n\r\n1 cáp USB', 49.000, 130.000, 100, 1, 3, '2025-07-23 02:04:47', '2025-07-31 02:04:47'),
(27, 'Dành Cho Xiaomi MiBand 10 9 8 Dây Đeo Thông Minh Silicon Cho Mi Band 8 9 10 NFC Dây Thể Thao Chống Thấm Nước Mềm', 'cn-11134207-7r98o-ly0my07cwz6re0.webp', '✔️Đặc biệt dành cho Xiaomi MI Band 8; MI Band 9: MI Band 10\r\n\r\n📌 Chiều dài dây đeo: 122MM + 105MM\r\n\r\n\r\n\r\n👍Các tính năng: 100% thương hiệu mới và chất lượng cao. \r\n\r\n✨Chất liệu cao: TPE + TPU Silicon cao cấp với môi trường\r\n\r\n💕 Độ mềm vừa phải, mặc rất thoải mái Đúc nén, chắc chắn và bền \r\n\r\n\r\n\r\nĐóng gói Bao gồm:\r\n\r\n1 * Dây đeo tay + Khóa (không có gói bán lẻ)', 17.600, 20.790, 100, 1, 3, '2025-07-31 02:10:34', '2025-07-24 02:10:34'),
(28, 'Chuột Gaming Không Dây T28 Dành Cho Game Thủ Chống Ồn Có Đèn LED Chơi Game Cực Đã Bảo Hành 12 Tháng', 'ee16962a0937b7313c75e818d9af8f1a.webp', '------  SHOP CAM KẾT ------\r\n\r\n✅	PHƯƠNG CHÂM “MỘT CHỮ TÍN - VẠN NIỀM TIN”\r\n\r\n✅Chúng tôi cam kết mang đển cho khách hàng những sản phẩm tốt nhất trong tâm giá so với thị trường, mang lại sự hài lòng tuyệt đối cho khách hàng đã tin tưởng mua sản phẩm.\r\n\r\n✅	Quyền lợi khách hàng  là mục tiêu phát triển của chúng tôi.\r\n\r\n✅	 Shop cam kết hoàn tiền hoặc gửi lại sản mới thay thế cho quý khách sớm nhất có thể, nếu khách hàng không hài lòng về chất lượng của sản phẩm\r\n\r\n\r\n\r\n\r\n\r\n------  SHOP ĐẢM BẢO ------\r\n\r\n✅	Hình ảnh sản phẩm giống hình 100%\r\n\r\n✅	Chất lượng sản phẩm đúng như mô tả\r\n\r\n✅	Sản phẩm được kiểm tra kĩ càng, nghiêm ngặt trước khi giao hàng\r\n\r\n✅	Đóng gói và giao hàng ngay khi nhận được đơn đặt hàng\r\n\r\n✅	Hoàn tiền ngay nếu sản phẩm không đúng như mô tả\r\n\r\n✅	Giao hàng toàn quốc, chấp nhận nhiều phương thức thanh toán\r\n\r\n✅	Hỗ trợ đổi trả 1:1 nếu sản phẩm có bất kì sai xót nào từ nhà cung cấp\r\n\r\n✅	Gửi hàng siêu tốc\r\n\r\n\r\n\r\nChuột Gaming Không Dây T28 Dành Cho Game Thủ Chống Ồn Có Đèn LED Chơi Game Cực Đã Bảo Hành 12 Tháng\r\n\r\n\r\n\r\n• Chuột Gaming Không Dây T28 bản nâng cấp cực kỳ hoàn hảo. \r\n\r\n• Chuột không dây gaming cho streamer\r\n\r\n• Thiết kế phong cách Esport\r\n\r\n• Điều chỉnh độ nhạy 3 cấp độ phù hợp cho nhiều loại game khác nhau\r\n\r\n• Sạc pin tiện dụng, sạc một lần dùng 1 tháng\r\n\r\n• Nút bên sườn phụ trợ cho nhiều thao tác\r\n\r\n• Tắt click chống ồn phù hợp chơi game ban đêm hoặc trong môi trường cần yên tĩnh\r\n\r\n• Chế độ LED biến đổi có thể điều chỉnh\r\n\r\n• Cổng thu USB 2.4G cho độ ổn định cực cao\r\n\r\n• Sử dụng song song ngay trong lúc sạc pin\r\n\r\n• Tắt đèn LED một cách chủ động tùy theo nhu cầu\r\n\r\n• Thiết kế công thái học cho cảm giác cầm nắm tốt\r\n\r\n• Nhựa an toàn ABS siêu bền\r\n\r\n• LED 7 màu chủ động thay đổi theo yêu cầu\r\n\r\n• Dễ sử dụng, tương thích mọi loại máy tính, laptop\r\n\r\n• Đế chống mòn\r\n\r\n• Tuổi thọ click cực cao\r\n\r\n\r\n\r\n✪  Nếu bạn đang đi tìm một con chuột máy tính để chơi game hay dùng trong văn phòng chắc chắn điều đầu tiên bạn mong muốn đó là một con chuột bền, bấm nhạy có thiết kế đẹp và dễ sử dụng. Đây chính là câu trả lời cho bạn, nó là dòng chuột có dây đã được hàng chục nghìn khách hàng của Shop đánh giá rất cao, do đó bạn hoàn toàn yên tâm để sử dụng.\r\n\r\n\r\n\r\n✿ HƯỚNG DẪN SỬ DỤNG:\r\n\r\nSử dụng được cho Máy Tính, PC, MAC,LAPTOP có cổng USB  đều có thể sử dụng được. \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n☀LƯU Ý:\r\n\r\n\r\n\r\n\r\n\r\n▶️ Chúng tôi đặt lợi ích của khách hàng lên hàng đầu với các chính sách 100% có lợi chính đáng cho khách hàng:\r\n\r\n\r\n\r\n\r\n\r\n▶️ Sự hài lòng của khách hàng là vô cùng quan trọng cho sự thành công của shop, chúng tôi trân trọng mọi khách hàng. \r\n\r\n\r\n\r\n▶️Thông tin phản hồi của bạn là vô cùng quan trọng đối với chúng tôi.\r\n\r\n', 7.500, 98.500, 123, 1, 4, '2025-07-02 02:12:57', '2025-07-02 02:12:57'),
(29, 'Hub USB Type C 4 trong 1 Tốc Độ Cao Type-C USB OTG 3.0 Docking Station Bộ Chia Adapter Phụ Kiện Cho Laptop', 'vn-11134207-7r98o-loetoa420ss733.webp', '💝 Chào mừng đến với cửa hàng của chúng tôi 💝\r\n\r\n\r\n\r\n✍️Cắm và chạy\r\n\r\nHỗ trợ OTG. chức năng\r\n\r\nKhả năng tương thích phổ quát\r\n\r\nUsb 3.0: siêu tốc độ 5Gbps\r\n\r\nUsb2.0: tốc độ cao 480Mbps\r\n\r\nLoại Type-C: 1 * Cổng USB 3.0 + 3 * cổng USB 2.0\r\n\r\nLoại USB: 1 * Cổng USB 3.0 + 3 * Cổng USB 2.0\r\n\r\n\r\n\r\n✍️Mô Tả Sản Phẩm\r\n\r\n+Hai giao diện: Loại USB và Type-C\r\n\r\n+Hai màu: xám và bạc\r\n\r\n+Hai mẫu:\r\n\r\n-Loại Type-C: 1 * Cổng USB 3.0 + 3 * cổng USB 2.0\r\n\r\n-Loại USB: 1 * Cổng USB 3.0 + 3 * Cổng USB 2.0\r\n\r\n+Truyền 3 * Hub 2.0 và 1 * Hub 3.0:\r\n\r\n -Usb 3.0: siêu tốc độ 5Gbps\r\n\r\n-Usb2.0: tốc độ cao 480Mbps\r\n\r\n+Tốc độ đầy đủ 12mbps\r\n\r\n+Tốc độ thấp 1,5Mbps\r\n\r\n\r\n\r\n✍️Ưu Điểm Sản Phẩm:\r\n\r\n1 Cắm và chạy, dễ cài đặt.\r\n\r\n2 Bố cục giao diện USB hợp lý, có thể hỗ trợ đồng thời bốn thiết bị tốc độ cao USB\r\n\r\n3 Usb 3.0, nhanh hơn 10 lần so với USB 2.0, tốc độ truyền lên đến 5Gbps. Tương thích với thông số kỹ thuật USB 2.0 và 1.1\r\n\r\n4 Hỗ trợ điện áp quá tải và chức năng bảo vệ đồng thời, nó có thể bảo vệ hiệu quả các thiết bị được kết nối và chính Hub khi bật nguồn đột ngột.\r\n\r\n5 Thiết kế giao diện nghiêng tiện dụng, xem xét Công nghệ nhân bản.\r\n\r\n6 Hiệu suất ổn định, bền bỉ và đáng tin cậy.\r\n\r\n7 Hỗ trợ chức năng OTG: Kết nối điện thoại với chuột, bàn phím, đĩa flash, nhưng cần có chức năng OTG cho điện thoại\r\n\r\n8 Khả năng tương thích phổ quát: Tương thích hoàn toàn với hầu hết các thiết bị USB, bàn phím, chuột, đĩa U, máy ảnh, tai nghe USB, máy in, cáp USB, micrô, máy chơi game, quạt USB, máy tính, máy tính xách tay, v.v.\r\n\r\n9 Plug and play: không cần trình điều khiển, tương thích với Windows Series, MA-C OS, Linux, v.v. Nhiều hệ thống, khả năng tương thích thiết bị mạnh mẽ\r\n\r\n10 Hiệu suất vượt trội: Được trang bị siêu chip, mang lại hiệu suất hiệu quả và ổn định\r\n\r\n\r\n\r\n✅ Đảm bảo chất lượng & Kiểm tra gấp đôi trước khi giao hàng.\r\n\r\n✅ Chúng tôi hỗ trợ COD !!!\r\n\r\n✅ Chúng tôi từ Thạnh phố Thuận An, tất cả các sản phẩm điều có sẵn kho.\r\n\r\n✅ Thanh toán của bạn là an toàn và được bảo đảm bởi Shopee\r\n\r\n🛒 Gửi hàng trong vòng 24 giờ 🛒 \r\n\r\nĐược giao hàng từ Thạnh phố Thuận An, thường là giao hàng 2-3 ngày, tùy thuộc vào Công ty vận chuyển nhé.\r\n\r\n👉Nếu bạn thích nó, xin hãy vui lòng cho chúng tôi 5 sao nhé⭐⭐⭐⭐⭐\r\n\r\n👉Sự hài lòng và phản hồi tích cực của bạn là rất có ý nghĩa đối với chúng tôi. Nếu bạn có bất kỳ sự không hài lòng nào, xin hãy vui lòng liên hệ kịp thời chúng tôi, chúng tôi sẽ ngay lập tức phục vụ bạn.\r\n\r\nCảm ơn bạn! chúc bạn khỏe mạnh và vui vẻ nhé!😁😁😁😁😁\r\n\r\nhub_usb #hub_type_c #hub #typec #pc #macbook #usb #hubchuyendoi #hubdanang #hubtypec #typectousb #hubtotypec #typec #ugreen #usb2.0 #usb3.0 #laptop #pc #switch', 28.900, 49.000, 256, 1, 4, '2025-07-31 02:13:52', '2025-07-31 02:13:52'),
(30, '【🔥Free ship🔥】Chuột chơi game có dây 2000-4000 DPI LED USB cho máy tính xách tay', '8f4b946d32237e63bfdc02bfd4918418.webp', '✨Chào mừng bạn đến với Kammy Official Flagship Store✨\r\n\r\n✅100% chính hãng ✅100% vận chuyển từ TP.HCM ✅ Đảm bảo 100% sau bán\r\n\r\n🎈Chúng tôi là thương nhân địa phương tại TP.HCM\r\n\r\n🎁Chúc các bạn quan tâm và chia sẻ 🎁Cửa hàng có các chương trình giảm giá lớn tùy từng thời điểm\r\n\r\n⏰ Giờ làm việc của chúng tôi: 9:00 sáng đến 7:00 tối (Chúng tôi có thể không trả lời tin nhắn kịp thời vào cuối tuần)\r\n\r\n\r\n\r\nĐặc trưng:\r\n\r\n  DPI có thể điều chỉnh: 1000DPI\r\n\r\n  Kết nối: USB2.0\r\n\r\n  Kích thước sản phẩm: xấp xỉ 127 * 78 * 38mm / 5 * 3.07 * 1.49 \'\'\r\n\r\n  Chiều dài cáp: khoảng. 145cm / 4,75\r\n\r\n  Ánh sáng phía dưới: Ánh sáng LED đầy màu sắc độc đáo \r\n\r\n  Thiết kế: Thiết kế tiện dụng\r\n\r\n  Thích hợp cho: chuột chơi game\r\n\r\n  Màu sắc: Đen / trắng\r\n\r\n  Công dụng: Cho Máy tính để bàn, Laptop, Notebook \r\n\r\n \r\n\r\n  Thông tin sản phẩm: \r\n\r\n  Loại sản phẩm: Chuột Chơi Game Có Dây\r\n\r\n  Chế độ: Opto-điện tử\r\n\r\n  Trọng lượng: 100g\r\n\r\n  Phong cách: Mini\r\n\r\n  Số con lăn: 1\r\n\r\n  Số model: chuột chơi game có dây\r\n\r\n  Đóng gói: Có\r\n\r\n  Loại điện: Có thể sạc lại\r\n\r\n  Loại: USB\r\n\r\n  DPI: 1000\r\n\r\n \r\n\r\nGói hàng bao gồm: \r\n\r\n  1 x Chuột chơi game có dây\r\n\r\n\r\n\r\n💎Ghi chú:\r\n\r\n· Kích thước đo thủ công thực tế có thể có một số sai sót Kích thước thực tế tùy thuộc vào sản phẩm thực tế.\r\n\r\n· Do điều kiện ánh sáng và chụp khác nhau, màu sắc của hình ảnh có thể khác một chút so với sản phẩm thực tế, vui lòng tham khảo sản phẩm thực tế.', 29.000, 39.900, 234, 1, 4, '2025-07-02 02:19:16', '2025-07-02 02:19:16');

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
('IgMUPXvSz9Xv5HQ5gbZZuBTp4pA0YKULFqoawx8f', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiNklRWkFES1c4UlVUYXVyekR1SjNhUFYwenh3M2xCREc4dzhLZmtvRCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi1wcm9kdWN0cyI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1751356704),
('mz9tR6OynhuVI2vpTvDVu6OPp2ipg1bBtjQgeyPr', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiMUg2SmZMMkxaNmszdERZNG8xdFJJbng2SjJ5b3dieVN0dlhLMUpZUiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9jYXJ0Ijt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1751422849),
('rAT2PnVqPa7xHTP1EcUERqiUVK7SyLfd94J95BsN', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS1FHbzNaM1JKRzlIeHZNOWZFeGwySjRyakxDcmJPeXNPS3N2dFFMYiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fX0=', 1751386642);

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
(1, 'Lê Văn Hậu', 'hau99082005@gmail.com', '$2y$12$ekGzd7sUEsJur.OYhf56j.mOP23l7KjjHkXUuEPE2INy0LW21MR9i', '0367722389', 'Thôn Thống Nhất-Hải Ba-Hải Lăng-Quảng Trị', 'admin', '2025-07-01 00:06:36', '2025-07-01 00:06:36');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
