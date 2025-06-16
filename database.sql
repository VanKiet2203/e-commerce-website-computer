-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 07, 2024 at 05:50 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `duan1_laptop`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`id`, `user_id`, `address`) VALUES
(17, 15, 'Vĩnh Long 123'),
(18, 6, 'Hà Nội'),
(19, 16, '366/31, Chu Văn An, Phường 12');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_price` int(11) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `product_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`cart_id`, `product_id`, `user_id`, `product_name`, `product_price`, `product_quantity`, `product_image`) VALUES
(80, 25, 9, 'Cây cam ngọt', 160000, 1, 'cay-cam-ngot.jpg'),
(81, 23, 9, 'Sách đất rừng', 120000, 1, 'dat-rung.jpg'),
(82, 27, 9, 'Người bà tài giỏi(tái bản 2022)', 180000, 1, 'nguoi-ba.jpg'),
(83, 2, 9, 'Sách mới', 110000, 3, 'book-2.png'),
(138, 32, 11, 'Kiếm Tiền Từ Tiktok', 100000, 1, 'kiem-tien-titok.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `name`, `image`, `status`) VALUES
(2, 'PC', 'pc.jpg', 1),
(4, 'Màn hình', 'manhinh.jpg', 1),
(6, 'VGA', 'vga.jpg', 1),
(16, 'Chuột', 'chuot.jpg', 1),
(17, 'Bàn phím', 'banphim.jpg', 1),
(19, 'Tai nghe', 'tainghe.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 ẩn 1 hiện',
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `content`, `date`, `status`, `user_id`, `product_id`) VALUES
(1, 'Helllo', '2023-11-25 19:46:51', 1, 6, 26),
(2, 'Tôi là khoa nè', '2023-11-25 20:06:15', 1, 6, 21),
(3, 'Admin nè xin chào mn', '2023-11-25 20:48:50', 1, 8, 26),
(4, 'Hello', '2023-11-26 12:00:44', 1, 6, 27),
(5, 'Sản phẩm tốt đọc hay nên mua nha mn', '2023-11-29 21:11:44', 1, 6, 27),
(8, 'Ngày 12/5/2023 Hello every one', '2023-12-05 09:46:35', 1, 6, 28),
(11, 'Xin chào mọi người trên sharecode', '2024-09-05 21:01:47', 1, 6, 31),
(12, 'mUA CODE ỦNG HỘ NHA HIHI', '2024-09-05 21:06:58', 1, 6, 32),
(13, 'mua cho em đi anh nhân ơi', '2024-12-07 18:35:53', 1, 16, 10);

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `orderdetails_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orderdetails`
--

INSERT INTO `orderdetails` (`orderdetails_id`, `order_id`, `product_id`, `quantity`, `price`) VALUES
(21, 10, 24, 1, 120000),
(22, 10, 27, 1, 180000),
(23, 11, 1, 2, 110000),
(24, 11, 24, 1, 120000),
(25, 12, 23, 1, 120000),
(26, 12, 20, 1, 160000),
(27, 13, 25, 2, 160000),
(28, 13, 26, 2, 200000),
(29, 14, 25, 4, 160000),
(30, 14, 27, 1, 180000),
(31, 14, 26, 2, 200000),
(32, 15, 23, 1, 120000),
(33, 15, 26, 1, 200000),
(34, 16, 27, 1, 180000),
(35, 16, 26, 1, 200000),
(36, 16, 20, 1, 160000),
(37, 17, 29, 1, 50000),
(38, 17, 31, 1, 126000),
(39, 17, 32, 2, 100000),
(40, 18, 31, 1, 126000),
(41, 18, 24, 1, 120000),
(42, 19, 30, 1, 102000),
(48, 22, 29, 1, 50000),
(49, 22, 28, 1, 180000),
(50, 23, 1, 2, 159000),
(51, 23, 24, 1, 120000),
(52, 24, 15, 1, 95000),
(53, 24, 14, 1, 102000),
(54, 25, 21, 1, 88000),
(55, 26, 21, 4, 88000),
(56, 27, 29, 1, 50000),
(57, 27, 1, 1, 159000),
(58, 28, 28, 1, 180000),
(59, 29, 2, 1, 97000),
(60, 29, 29, 1, 50000),
(61, 29, 1, 1, 159000),
(62, 30, 31, 3, 126000),
(63, 31, 2, 2, 97000),
(64, 31, 1, 1, 159000),
(65, 32, 32, 1, 100000),
(66, 33, 21, 1, 88000),
(67, 33, 25, 1, 160000),
(68, 33, 28, 3, 180000),
(69, 34, 29, 1, 50000),
(70, 34, 31, 3, 126000),
(71, 35, 1, 1, 159000),
(72, 35, 28, 2, 180000),
(73, 36, 25, 1, 160000),
(74, 36, 27, 1, 180000),
(75, 36, 31, 2, 126000),
(76, 37, 32, 1, 100000),
(77, 38, 31, 1, 126000),
(78, 38, 30, 1, 102000),
(79, 39, 25, 1, 160000),
(80, 39, 29, 2, 50000),
(81, 39, 30, 1, 102000),
(82, 40, 17, 1, 187000),
(83, 40, 16, 1, 90000),
(84, 40, 18, 2, 120000),
(85, 41, 25, 5, 160000),
(86, 42, 29, 2, 50000),
(87, 42, 17, 1, 187000),
(88, 43, 27, 1, 180000),
(89, 43, 31, 1, 126000),
(90, 44, 1, 1, 159000),
(91, 44, 28, 1, 180000),
(92, 45, 28, 1, 180000),
(93, 45, 31, 2, 126000),
(94, 46, 6, 1, 100000),
(95, 47, 6, 5, 100000),
(96, 48, 2, 4, 97000),
(97, 48, 1, 1, 159000),
(98, 49, 31, 1, 126000),
(99, 50, 27, 3, 180000),
(100, 50, 32, 1, 100000),
(101, 51, 32, 1, 100000),
(102, 51, 26, 1, 200000),
(103, 52, 31, 1, 126000),
(104, 52, 32, 2, 100000),
(105, 53, 28, 1, 180000),
(106, 53, 30, 2, 102000),
(107, 54, 27, 1, 180000),
(108, 54, 30, 1, 102000),
(109, 54, 31, 1, 126000),
(110, 55, 24, 2, 120000),
(111, 55, 31, 1, 126000),
(112, 56, 31, 1, 126000),
(113, 56, 26, 1, 200000),
(114, 57, 13, 1, 17750000),
(115, 58, 13, 1, 17750000),
(116, 59, 23, 1, 15500000),
(117, 60, 14, 1, 11790000),
(118, 60, 18, 1, 1000000),
(119, 60, 20, 1, 4950000),
(120, 60, 23, 1, 15500000),
(121, 61, 22, 1, 2800000),
(122, 61, 23, 3, 15500000),
(123, 62, 23, 1, 15500000),
(124, 63, 23, 1, 15500000),
(125, 64, 23, 1, 15500000),
(126, 65, 23, 1, 15500000),
(127, 66, 23, 1, 15500000),
(128, 67, 23, 1, 15500000),
(129, 68, 23, 1, 15500000),
(130, 69, 22, 1, 2800000);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `total` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `note` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `date`, `total`, `address`, `phone`, `note`, `status`) VALUES
(10, 6, '2023-11-27 22:13:51', 300000, 'Can tho', '0909135986', '', 2),
(11, 6, '2023-11-28 09:00:28', 340000, 'Can tho', '0909135986', 'Gói sách kĩ giúp em lần trước mua bị rách', 3),
(12, 7, '2023-11-28 09:24:42', 280000, 'Kiên Giang', '0336216654', 'Hello my friend', 3),
(13, 9, '2023-11-28 12:01:11', 720000, 'Cái Răng, Cần Thơ', '0909135969', 'Đóng gói hàng kĩ', 2),
(14, 6, '2023-11-28 14:00:19', 1220000, 'Can tho', '0909135986', 'hi', 4),
(15, 6, '2023-11-28 18:22:55', 320000, 'Can tho', '0909135986', 'Chúc 1 ngày vui', 4),
(16, 6, '2023-11-29 22:07:55', 540000, 'Can tho', '0909135986', 'Mua hang 29/11/2023', 3),
(17, 10, '2023-12-03 10:12:41', 376000, 'Ninh Kiều, Cần Thơ', '0909135985', 'Gói hàng cẩn thận giao nhanh giúp tôi ', 1),
(18, 6, '2023-12-04 18:23:31', 246000, 'Cái Răng, Cần Thơ', '0909135329', 'Giao hàng nhanh nha, đang cần gấp', 1),
(19, 6, '2023-12-04 19:43:58', 102000, 'Quận Đống Đa, Hà Nội', '0909246546', 'Mong là sách đọc hay', 4),
(22, 11, '2023-12-04 20:28:09', 230000, 'Sóc Trăng', '0336246546', 'Đóng hàng kĩ', 3),
(23, 11, '2023-12-04 20:29:51', 279000, 'Cần Thơ', '0909006764', 'Hello', 1),
(24, 11, '2023-12-04 21:49:06', 197000, 'Cần Thơ', '0909006764', '', 1),
(25, 11, '2023-12-04 21:56:40', 88000, 'Cần Thơ', '0909006764', '', 1),
(26, 11, '2023-12-04 22:00:39', 352000, 'Cần Thơ', '0909006764', '', 1),
(27, 10, '2023-12-06 22:10:19', 209000, 'Ninh Kiều, Cần Thơ', '0909135985', '', 2),
(28, 10, '2023-12-06 22:12:15', 180000, 'Long Hồ, Vĩnh Long', '0909135399', 'Mua hàng cho bạn ở quê', 1),
(29, 6, '2023-12-07 08:48:32', 306000, 'Ninh Kiều, Cần Thơ', '0909135329', '', 3),
(30, 6, '2023-12-07 08:50:28', 378000, 'Quận Mỹ Đình, Hà Nội', '0336216546', 'Hello 2023', 2),
(31, 6, '2023-12-11 17:33:40', 353000, 'Long Biên, Hà Nội', '0336216546', 'Giao hàng nhanh giúp tôi', 1),
(32, 6, '2023-12-11 19:07:50', 100000, 'Cần Thơ', '0336216546', 'Giao nhanh', 1),
(33, 11, '2023-12-11 19:13:10', 788000, 'Quận Cầu Giấy Hà Nội', '0336216546', 'Sách hay quóaa', 1),
(34, 10, '2023-12-11 19:55:09', 428000, 'Quận Cầu Giấy Hà Nội', '0909135329', 'Giao hàng nhanh giúp tôi', 4),
(35, 10, '2023-12-11 20:01:28', 519000, 'Quận Cầu Giấy Hà Nội', '0336216546', 'Giao hàng nhanh giúp tôi', 2),
(36, 6, '2023-12-12 10:11:51', 592000, 'Anh Khánh, Ninh Kiều, Cần Thơ', '0336246546', 'Đóng hàng kĩ', 1),
(37, 6, '2023-12-12 10:25:55', 100000, 'Anh Khánh, Ninh Kiều, Cần Thơ', '0909135985', 'Hello', 4),
(38, 6, '2023-12-12 10:31:24', 228000, 'Anh Khánh, Ninh Kiều, Cần Thơ', '0909135985', 'Đóng hàng kĩ', 1),
(39, 7, '2023-12-12 17:38:21', 362000, 'Số 14 Nguyễn Công Trứ, phường Vĩnh Thanh, thành phố Rạch Giá, tỉnh Kiên Giang', '0336216123', 'Sách hay', 2),
(40, 6, '2023-12-12 17:47:50', 517000, 'Số 14 Nguyễn Công Trứ, phường Vĩnh Thanh, thành phố Rạch Giá, tỉnh Kiên Giang', '0909135329', 'Đóng gói hàng kĩ', 1),
(41, 8, '2023-12-12 17:53:39', 800000, 'Anh Khánh, Ninh Kiều, Cần Thơ', '0336246546', 'Gói hàng kĩ', 1),
(42, 6, '2023-12-12 18:19:03', 287000, 'Quận Cầu Giấy Hà Nội', '0909135329', 'Mua hàng nè hihi', 2),
(43, 10, '2023-12-12 18:22:50', 306000, 'Cái Răng, Cần Thơ', '0336246546', 'Gói hàng kĩ', 1),
(44, 10, '2023-12-12 18:32:55', 339000, 'Số 14 Nguyễn Công Trứ, phường Vĩnh Thanh, thành phố Rạch Giá, tỉnh Kiên Giang', '0909135329', 'Giao hàng nhanh nha', 1),
(45, 6, '2023-12-13 15:12:18', 432000, 'Số 14 thành phố Rạch Giá, tỉnh Kiên Giang', '0336216546', 'Test mua hàng 13/12/2023', 1),
(46, 10, '2023-12-13 16:54:29', 100000, 'Ninh Kiều, Cần Thơ', '0909135985', 'Hảo mua hàng nè', 1),
(47, 10, '2023-12-13 17:01:33', 500000, 'Ninh Kiều, Cần Thơ', '0909135985', '', 1),
(48, 7, '2023-12-13 17:07:00', 547000, 'Kiên Giang', '0336216654', '', 1),
(49, 6, '2024-03-26 20:18:15', 126000, 'Ninh Kiều, Cần Thơ', '0909135329', '', 1),
(50, 6, '2024-03-26 20:20:18', 640000, 'Cần Thơ', '0336216546', '', 1),
(51, 6, '2024-04-19 20:51:54', 300000, 'Anh Khánh, Ninh Kiều, Cần Thơ', '0336216546', 'Đóng hàng kĩ', 1),
(52, 6, '2024-04-21 18:28:19', 326000, 'Ninh Kiều, Cần Thơ', '0909135329', 'Giao nhanh', 1),
(53, 6, '2024-04-21 18:45:37', 384000, 'Anh Khánh, Ninh Kiều, Cần Thơ', '0909135985', 'Đóng hàng kĩ', 1),
(54, 6, '2024-09-05 20:56:24', 408000, 'Ninh Kiều, Cần Thơ', '0909135329', 'oki', 1),
(55, 6, '2024-09-05 21:02:30', 366000, 'Ninh Kiều, Cần Thơ', '0909135329', 'Đóng hàng kĩ', 4),
(56, 6, '2024-09-05 21:09:21', 326000, 'Hà Nội', '0909135555', 'GIAO NHANH NHA', 1),
(57, 16, '2024-12-05 17:25:54', 17750000, '366 chu van an', '0823456781', '', 1),
(58, 16, '2024-12-05 18:14:28', 17750000, '366 chu van an', '0823456781', '', 1),
(59, 16, '2024-12-05 20:10:22', 15500000, '366 chu van an', '0823456781', '', 1),
(60, 16, '2024-12-05 20:40:25', 33240000, '366 chu van an', '0823456781', '', 1),
(61, 16, '2024-12-05 21:14:09', 49300000, '366/31, Chu Văn An, Phường 12', '0854243350', '', 1),
(62, 16, '2024-12-05 21:31:02', 15500000, '366 chu van an', '0823456781', '', 1),
(63, 16, '2024-12-05 21:31:05', 15500000, '366 chu van an', '0823456781', '', 1),
(64, 16, '2024-12-05 21:31:08', 15500000, '366 chu van an', '0823456781', '', 1),
(65, 16, '2024-12-05 21:31:11', 15500000, '366 chu van an', '0823456781', '', 1),
(66, 16, '2024-12-05 21:31:14', 15500000, '366 chu van an', '0823456781', '', 4),
(67, 16, '2024-12-05 21:31:17', 15500000, '366 chu van an', '0823456781', '', 4),
(68, 16, '2024-12-06 19:54:36', 15500000, '366 chu van an', '0823456783', '', 1),
(69, 16, '2024-12-06 19:56:39', 2800000, '366 chu van an', '0823456783', '', 4);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `views` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `category_id`, `title`, `image`, `author`, `content`, `views`, `status`, `created_at`, `updated_at`) VALUES
(1, 9, 'Top 5+ những cuốn sách hay nên đọc 1 lần trong đời', 'top-sach.jpg', 'Admin', '<p><strong>Ngày nay, bạn có thể tìm thấy hàng triệu cuốn sách trên thế giới thuộc vô số chủ đề độc đáo. Tuy nhiên, có những cuốn sách tâm đắc nhất mà bạn không thể bỏ lỡ và nhất định nên đọc một lần. Hãy cùng Sforum điểm qua top 22+ những cuốn sách hay 2023 nên đọc trong đời ngay bây giờ nhé. Đừng quên chọn cho mình cuốn sách ưng ý nhất để đem về tủ sách nhà mình!</strong></p><h4><strong>Nhà giả kim</strong></h4><p>“Nhà giả kim” là một trong những cuốn sách hay của tác giả Paulo Coelho, kể về cuộc hành trình theo đuổi giấc mơ của Santiago, một chàng chăn cừu người Tây Ban Nha. Cuốn sách truyền đạt thông điệp về việc tìm kiếm quy luật của vũ trụ và ý nghĩa thực sự của cuộc đời. Và đây không chỉ là một câu chuyện phiêu lưu mà còn là một hành trình tìm kiếm bản thân, khám phá niềm tin và theo đuổi đam mê.</p><h4><strong>Đắc nhân tâm</strong></h4><p>“Đắc nhân tâm” do Dale Carnegie viết là một trong những cuốn sách hay bán chạy nhất mọi thời đại. Cuốn sách này chứa đựng những bài học về kỹ năng giao tiếp, làm thế nào để thu hút và ảnh hưởng đến người khác. Không chỉ dừng lại ở việc truyền đạt những kỹ năng mềm, cuốn sách còn giúp người đọc hiểu rõ hơn về tâm lý con người và cách xây dựng mối quan hệ.</p><h4><strong>Cà phê cùng Tony</strong></h4><p>“Cà phê cùng Tony” là sách hay nên đọc cho giới trẻ của tác giả Tony Buổi Sáng chứa đựng những suy nghĩ, bài học về cuộc sống, công việc và tình yêu dưới góc nhìn của Tony - một người trẻ tuổi đầy nhiệt huyết. Thông qua những câu chuyện ngắn gọn, dễ hiểu, Tony giúp người đọc nhìn lại và định hình lại quan điểm về nhiều vấn đề trong cuộc sống. Cuốn sách còn một người bạn đồng hành, giúp bạn tìm thấy niềm vui, hạnh phúc và ý nghĩa trong từng khoảnh khắc của cuộc đời.</p><h4><strong>Người giàu có nhất thành Babylon</strong></h4><p>George S. Clason thông qua “Người giàu có nhất thành Babylon” đã trình bày những bài học tài chính quý báu dưới dạng các câu chuyện huyền bí từ Babylon cổ đại, nơi được coi là nền kinh tế phồn thịnh nhất từng tồn tại. Đây là cuốn sách hay 2023 cực kỳ hot mà nhắc tới chắc hẳn ai cũng từng nghe qua một lần.</p><p>Cuốn sách cung cấp cho người đọc những nguyên tắc quản lý tài chính cá nhân, tiết kiệm và đầu tư một cách thông minh. Mỗi chương đều mang đến một bài học riêng biệt, giúp người đọc hiểu biết về việc làm giàu không chỉ dựa vào thu nhập, mà còn cần sự khôn ngoan, kỷ luật và hiểu biết về tiền bạc.</p><h4><strong>Cách nghĩ để thành công (Think &amp; Grow Rich)</strong></h4><p>“Think &amp; Grow Rich” thuộc top những cuốn sách hay nên đọc và là một tác phẩm kinh điển của Napoleon Hill, được viết dựa trên nghiên cứu của ông về hàng trăm người thành đạt nhất thế kỷ 20. Cuốn sách không chỉ giới thiệu về việc kiếm tiền mà còn về việc xây dựng tư duy thành công. Hill trình bày 13 bước để đạt đến sự giàu có và thành công, bắt đầu từ ý thức định hướng, lòng tin và sức mạnh của việc tạo lập mục tiêu cụ thể.</p>', 0, 1, '2023-11-29 17:13:09', '2023-12-04 21:31:51'),
(5, 2, 'Những tác giả có sức ảnh hưởng nhất trong làng sách Việt Nam năm 2015', 'tac-gia.jpg', 'Admin', '<p><strong>Năm 2015, bên cạnh những tác giả đã quá đỗi quen thuộc thì thị trường xuất bản còn đón nhận nhiều gương mặt trẻ. Họ đã thổi một làn gió mới tới những người yêu sách, đem đến tinh thần mua sách và đọc sách ở thế hệ 9x, 10x.&nbsp;</strong></p><p>Cùng LĐTĐ điểm tên 10 nhà văn, tác giả tạo được tiếng vang nhất trong làng sách Việt Nam trong năm qua.</p><h4><strong>Nguyễn Nhật Ánh</strong></h4><p>Năm 2015 có thể coi là một năm “đại thắng” đối với nhà văn Nguyễn Nhật Anh. “Tôi thấy hoa vàng trên cỏ xanh” thu nhận thành công trên mức tưởng tượng khi được chuyển thể thành phim nhựa giới thiệu tới khán giả trong và ngoài nước. Bên cạnh sự phủ sóng mạnh mẽ của “Tôi thấy hoa vàng trên cỏ xanh”, những cuốn sách khác của nhà văn Nguyễn Nhật Ánh như: “Bảy bước tới mùa hè”, “Cô gái đến từ hôm qua”… cũng nhanh chóng trở thành “best-seller” ngay từ khi mới ra mắt.</p><p>Thành công của những tác phẩm do Nguyễn Nhật Ánh sáng tác đến từ sự dung dị, đời thường, gắn liền với những kỷ niệm tươi đẹp của tuổi thơ. Mỗi cuốn sách như một bức tranh mở ra trước mắt người đọc những khung cảnh chân phương, đầy ắp tiếng cười.</p><h4><strong>Nguyễn Phong Việt</strong></h4><p>“Đi qua thương nhớ”, “Sinh ra là để cô đơn” hay mới đây nhất là “Sống một cuộc đời bình thường” đều là những cuốn sách được yêu mến của Nguyễn Phong Việt.</p><p>Được mệnh danh là nhà thơ “ăn khách” nhất, Nguyễn Phong Việt chia sẻ: “Tôi may mắn khi mình có rất nhiều cảm xúc. Ngay từ tập thơ đầu, tôi là người làm thơ không câu nệ câu chữ. Mình nghĩ câu đó cần 20 từ thì viết 20 từ chứ không phải vì để cho ngắn gọn, cho người đọc dễ chịu thì viết ngắn hơn. Mình viết mình cảm nhận được trước đã, rồi độc giả mới hiểu. Sau này, tôi có sự thỏa hiệp nho nhỏ, thay đổi vài từ để cảm xúc của câu chữ không bị bóp nghẹt trong đau đớn”.</p><h4><strong>Anh Khang</strong></h4><p>Sớm định hình phong cách riêng trong dòng văn học trẻ sôi động, Anh Khang - tác giả sinh năm 1987 được độc giả trẻ đón nhận qua những tựa sách “hot” như “Ngày trôi về phía cũ”, “Đường hai ngả người thương thành lạ” hay “Buồn làm sao buông”.</p><p>Văn của Anh Khang không tìm đến sự nổi loạn hay phá cách trong con chữ mà tạo ra dấu ấn riêng nhờ sự nhạy cảm trong lối suy nghĩ thấu đáo, truyền tải đúng tâm tình của người trẻ hiện đại. Anh Khang là một trong những tác giả trẻ sở hữu số lượng fans đông đảo nhất hiện nay trên mạng xã hội cũng như ngoài đời thực.</p>', 0, 1, '2023-11-29 17:25:47', '2023-12-03 13:21:05'),
(8, 9, 'Top cuốn sách tâm lý làm chủ chính mình hay nhất hiện nay', 'top-sach-tam-li.jpg', 'Admin', '<p><i>Tâm lý học là một ngành học thú vị và hấp dẫn, bởi vì nó giúp chúng ta hiểu được tâm lý con người, một thứ rất phức tạp và biến đổi. Nhiều người muốn nâng cao kiến thức về tâm lý học và tìm đọc những cuốn sách chất lượng và hữu ích về ngành học này. Trong bài viết này, sẽ giới thiệu cho bạn top cuốn sách tâm lý nổi tiếng hiện nay.</i></p><h4><strong>Tư duy nhanh và chậm – Daniel Kahneman</strong></h4><p>Tư Duy Nhanh Và Chậm là một cuốn sách nổi tiếng của Daniel Kahneman, một nhà tâm lý học xuất sắc. Sách giải thích rằng tâm trí con người có hai hệ thống hoạt động khác nhau: Hệ thống 1 hoạt động nhanh chóng, trực giác và không cần suy nghĩ nhiều; Hệ thống 2 hoạt động chậm rãi, cẩn thận và cần nhiều sự chú ý. Tác giả cũng cho thấy rằng con người thường mắc phải những sai lầm trong việc ra quyết định, do bị ảnh hưởng bởi những cảm xúc, định kiến và thiếu nhất quán. Cuốn sách này sẽ giúp bạn đọc hiểu được nhiều điều thú vị và sâu sắc về tâm lý con người và nhận ra rằng “Chúng ta không giỏi như chúng ta nghĩ”.</p><h4><a href=\"https://tiki.vn/search?q=phi%20l%C3%BD%20tr%C3%AD\"><strong>Phi lý trí</strong></a><strong> – Dan Ariely</strong></h4><p>Phi Lý Trí là một tác phẩm trong top cuốn sách tâm lý của Dan Ariely, một giáo sư tâm lý học và kinh tế học hành vi, trong đó ông đã trình bày những nghiên cứu và thí nghiệm của mình về sự thiếu hợp lý của con người trong việc ra quyết định và tiết lộ những hiện tượng tâm lý mới lạ và thú vị. Ông đã khẳng định rằng: chúng ta thường bị ảnh hưởng bởi một “hệ thống” phi lý trí vô hình.&nbsp;</p><p>Ông đã kết hợp những nghiên cứu khoa học với những ví dụ thực tế để giúp chúng ta nhận ra những “điểm mù” trong cách suy nghĩ hàng ngày. Phi Lý Trí của Dan Ariely là một cuốn sách tâm lý học rất cuốn hút bởi ông đã sử dụng ngôn ngữ dễ hiểu nhưng vẫn khiến người đọc phải suy ngẫm về những hành vi và những sai lầm của bản thân để có thể sống một cách hợp lý và tốt đẹp hơn.</p><h4><strong>Im lặng – Sức mạnh của người hướng nội</strong></h4><p>Trong cuốn sách này, Susan Cain đã nói về sự khác biệt giữa người hướng ngoại và người hướng nội, và những ưu điểm của người có tính cách nhạy cảm. Tác giả đã chỉ ra rằng người hướng nội có thể tận dụng tính cách của mình để chọn lựa công việc, lĩnh vực phù hợp với mình trong xã hội.&nbsp;</p><p>Cuốn sách này sẽ rất hữu ích cho bạn nếu bạn là người hướng nội muốn tìm đường đi cho bản thân, hoặc nếu bạn muốn hiểu thêm về người hướng nội để có thể quản lý, giao tiếp và hợp tác tốt hơn với họ.</p><h4><strong>Tâm Lý Học Đám Đông – Gustave Le Bon</strong></h4><p>Tác giả Gustave Le Bon, một nhà tâm lý học Pháp nổi tiếng, đã viết cuốn sách Tâm lý học đám đông để nghiên cứu về sự ảnh hưởng của đám đông đến lý trí và cảm xúc của con người. Tác giả đã dựa trên nhiều nghiên cứu về tinh thần và tính cách của các dân tộc, chủng tộc khác nhau trên thế giới. Tác giả đã cho rằng, con người bị chi phối bởi những yếu tố sinh học và tâm lý học. Chủng tộc là một thực thể ẩn sâu trong mỗi cá nhân và có ảnh hưởng đến mọi hành động, ham muốn, xung năng của họ. Tác giả cũng đã trải qua nhiều biến động lịch sử của Pháp, như Công Xã Paris, cách mạng Pháp 1789 và 1848. Những trải nghiệm này đã giúp tác giả có những quan sát và phân tích từ thực tiễn được thể hiện rõ nét trong cuốn sách Tâm lý học đám đông.</p>', 0, 1, '2023-12-03 13:45:32', '2023-12-03 13:45:32'),
(9, 9, '9 cuốn sách kinh tế hay nhất | Muốn kinh doanh phải đọc qua', 'top-9-sach.jpg', 'Admin', '<p><strong>Bạn quan tâm đến tình hình kinh tế thế giới, bạn muốn bắt đầu một sự nghiệp kinh doanh mà phân vân không biết nền kinh tế thực sự vận hành như thế nào, bạn muốn tìm hiểu một tựa sách về kinh tế nhưng vẫn đang phân vân. Bài viết này sẽ giải đáp hết thắc mắc đó. Cùng tìm hiểu những cuốn sách về kinh doanh hay nhất được chúng tớ tổng hợp nhé.</strong></p><h4><strong>Thế giới phẳng – Thomas L.Friedman</strong></h4><p>Sách kinh tế Thế giới phẳng nói về vấn đề toàn cầu hóa dưới góc độ phân tích độc đáo. Theo tác giả, “phẳng” trong thế giới phẳng đó là sự kết nối, phá vỡ đi rào cản về chính trị, tôn giáo, địa lý, từ đó mở ra địa chính trị, địa kinh tế, phương thức sản xuất kinh doanh tiên tiến hiện đại hơn.</p><p>Cuốn sách tập trung mổ xẻ cấu trúc của nền kinh tế và chính trị đương đại, nêu rõ sự phát triển vượt bậc của khoa học kỹ thuật làm thay đổi diện mạo của nền kinh tế thế giới. Bằng cách trình bày hóm hỉnh hài hước, tác giả đã giúp người đọc hiểu thế giới phẳng được bắt đầu khi nào, diễn tiến ra sao, các yếu tố then chốt làm thế giới phẳng. Thông qua cuốn sách, các doanh nghiệp, quốc gia, cá nhân nhìn nhận rõ được cơ hội và thách thức trong bối cảnh toàn cầu hóa, từ đó đưa ra định hướng phát triển riêng cho mình.</p><h4><strong>Lược sử kinh tế học – Niall Kishtainy</strong></h4><p>Sách kinh tế Lược sử kinh tế học luôn nằm trong top những cuốn sách bán chạy nhất hiện nay. Đọc xong cuốn sách mọi người sẽ cảm nhận được kinh tế học không phải là những kiến thức cao siêu dành cho các doanh nhân, chính khách hay nhà kinh tế học mà nó có ích và gần gũi với cuộc sống củ mỗi người. Mỗi người trong thời đại hiện nay đều cần nắm được các kiến thức cơ bản về kinh tế để giúp cuộc sống của mình được tốt đẹp hơn.</p><p>Nội dung sách tập trung nói về các học thuyết và quy luật kinh tế kinh điển ở phương tây trong hàng nghìn năm qua dưới góc độ khác quan. Tác giả đưa ra những minh họa, ví dụ sống động và dễ hiểu để có thể tiếp cận được phần đa người đọc. Với độ dày khoảng 300 trang, sách kinh tế hay Lược sử kinh tế học giúp chúng ta nắm được các cột mốc quan trọng toàn cảnh nền kinh tế, từ lúc khởi nguồn đơn giản đến khi phức tạp hơn, xuất hiện giá trị thặng dư, buôn bán…</p><h4><strong>Doanh nghiệp của thế kỷ 21 – Robert T. Kiyosaki</strong></h4><p>Nhắc đến những cuốn sách kinh tế hay thì không thể nào kể thiếu tên cuốn Doanh nghiệp của thế kỷ 21. Cuốn sách này sẽ nêu rõ lý do tại sao cần phải xây dựng được cho mình doanh nghiệp riêng, và nên hoạt động trong lĩnh vực nào là tốt nhất. Bên cạnh đó tác giả cũng đưa ra nhiều kiến thức về tư duy làm giàu, cách tìm kiếm các phương tiện giúp xây dựng hình ảnh doanh nghiệp tốt hơn đối với khách hàng, người tiêu dùng, đối tác… Những công cụ, cách thức tìm kiếm mọi thứ để giúp doanh nghiệp phát triển toàn diện hơn cũng được bật mí chi tiết và đầy đủ nhất qua cuốn sách.</p><p>Cuốn sách khai sáng tư duy cho những ai đang mong muốn tự lập kinh doanh và làm giàu cho bản thân. Tác giả đưa ra giải pháp mà bất cứ ai cũng có thể vận dụng, áp dụng thành công mà không cần phải có tài năng hay thiên bẩm.</p><h4><strong>Tuần làm việc 4 giờ – Timothy Ferress</strong></h4><p>Một trong những cuốn sách kinh tế hay mà bạn nên đọc đó là Tuần làm việc 4 giờ. Đọc cuốn sách này, mỗi người sẽ tự trả lời được cho mình câu hỏi làm thế nào để có được cuộc sống tự do, thoải mái như một triệu phú, tỷ phú mà không cần phải có 1 triệu đô la, 1 tỷ đô la – số tiền mà ít ai có được trong suốt cuộc đời học tập, làm việc của mình. Tác giả đã giúp mỗi người biết cách tách biệt thu nhập với thời gian, từ đó xây dựng cho mình lối sống lý tưởng với nhiều hoạt động đa dạng như đi vòng quanh thế giới, đọc sách…</p><p>Từ cuốn sách, tác giả Timothy Ferress cũng đã có những chia sẻ về cách kiếm tiền 40 nghìn đô /tháng chỉ bằng cách làm 4 tiếng/tuần. Sự khác biệt của cuốn sách là đưa ra góc nhìn cuộc sống đơn giản và dễ thở hơn, thay vì đề cập đến các vấn đề thường gặp như thiếu thời gian làm việc, nghỉ ngơi, tinh thần căng thẳng… Nhìn chung mỗi người hoàn toàn có thể sống tốt với công việc mà mình có tiềm năng, quan trọng bạn cần phải khai phá tiềm năng của mình đúng đắn.</p><h4><strong>Chiến lược đại dương xanh – W. Chan Kim &amp; Renee Mauborgne</strong></h4><p>Chiến lược đại dương xanh là cuốn sách hay về kinh tế tiếp theo mà chúng tôi muốn giới thiệu đến các bạn đọc. Cuốn sách này xuất bản từ năm 2004, đến nay đã trải qua gần 20 năm nhưng vẫn giữ nguyên tính lịch sử và sự phù hợp với thời đại. Cuốn sách nổi tiếng này đã được dịch hơn 46 thứ tiếng và bán hơn 4 triệu bản trên toàn thế giới.</p><p>Nội dung cuốn sách đề cập đến chiến lược kinh doanh kinh điển mà các doanh nhân, lãnh đạo cần biết, đó là mở rộng và phát triển thị trường mới – một đại dương xanh – ở đó không có bất cứ sự cạnh tranh nào.</p><p>Chiến lược này nhấn mạnh tầm quan trọng của việc nâng cao giá trị dịch vụ cũng như sản phẩm, đi kèm với đó là giá thành hợp lý để mang lại nhiều quyền lợi cho người tiêu dùng. Chiến lược này có thể đưa các doanh nghiệp phát triển nhảy vọt và tăng trưởng mạnh mẽ về giá trị.</p>', 0, 1, '2023-12-03 17:41:06', '2023-12-03 17:44:51');

-- --------------------------------------------------------

--
-- Table structure for table `post_categories`
--

CREATE TABLE `post_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `post_categories`
--

INSERT INTO `post_categories` (`id`, `name`) VALUES
(1, 'Chưa có chuyên mục'),
(2, 'Tác giả nổi tiếng'),
(9, 'Giới thiệu sách');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `sell_quantity` int(11) NOT NULL DEFAULT 0,
  `price` int(11) NOT NULL,
  `sale_price` int(11) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT current_timestamp(),
  `views` int(11) NOT NULL DEFAULT 0,
  `details` text NOT NULL,
  `short_description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `warehouse_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `category_id`, `name`, `image`, `quantity`, `sell_quantity`, `price`, `sale_price`, `create_date`, `views`, `details`, `short_description`, `status`, `warehouse_id`) VALUES
(10, 2, 'PC Gamma', 'pc2.png', 123, 0, 22000000, 21890000, '2024-12-05 17:15:52', 8, '<p>PC 2</p>', '<p>PC 2</p>', 1, 15),
(11, 2, 'PC Belta', 'pc3.jpg', 431, 0, 26000000, 25990000, '2024-12-05 17:18:16', 1, '<p>PC 3</p>', '<p>PC 3</p>', 1, 16),
(12, 4, 'Màn hình MSI MP241', 'manmsi.jpg', 666, 0, 2000000, 1870000, '2024-12-05 17:22:55', 1, 'Màn hình MSI MP241', 'Màn hình MSI MP241', 1, 18),
(13, 2, 'PC Alpha', 'pc4.jpg', 553, 2, 18000000, 17750000, '2024-12-05 17:23:23', 5, '<p>PC 4</p>', '<p>PC 4</p>', 1, 17),
(14, 4, 'Màn hình BenQ XL2546', 'manzo.jpg', 332, 1, 12000000, 11790000, '2024-12-05 18:16:57', 0, 'Màn hình FPS', 'Màn hình FPS', 1, 19),
(15, 6, 'RTX 2060', '2060.jpg', 444, 0, 6200000, 6000000, '2024-12-05 18:26:33', 5, 'RTX 2060', 'RTX 2060', 1, 28),
(16, 16, 'Chuột DareU EM901X RGB', 'chuotdareu.jpg', 321, 0, 800000, 710000, '2024-12-05 18:27:07', 2, 'Chuột DareU EM901X RGB', 'Chuột DareU EM901X RGB', 1, 27),
(17, 17, 'Bàn phím DareU EK75', 'bpdareu.png', 1000, 0, 600000, 549000, '2024-12-05 18:27:40', 0, 'Bàn phím DareU EK75', 'Bàn phím DareU EK75', 1, 26),
(18, 17, 'Bàn phím AKKO 5075B Plus Naruto', 'akko.jpg', 531, 1, 1200000, 1000000, '2024-12-05 18:28:11', 2, 'Bàn phím AKKO 5075B Plus Naruto', 'Bàn phím AKKO 5075B Plus Naruto', 1, 25),
(19, 19, 'Tai nghe Razor Barracuda X', 'tnrazor.png', 444, 0, 2500000, 2250000, '2024-12-05 18:28:41', 4, 'Tai nghe Razor Barracuda X', 'Tai nghe Razor Barracuda X', 1, 24),
(20, 19, 'Tai nghe Corsair Virtuoso', 'tncorsair.jpg', 230, 1, 5200000, 4950000, '2024-12-05 18:29:11', 1, 'Tai nghe Corsair Virtuoso', 'Tai nghe Corsair Virtuoso', 1, 23),
(21, 16, 'Chuột Zowie S1-C', 'zowie.jpg', 109, 0, 2100000, 1980000, '2024-12-05 18:29:39', 4, 'Chuột Zowie S1-C', 'Chuột Zowie S1-C', 1, 22),
(22, 6, 'GTX 1660', '1660.jpg', 158, 2, 3100000, 2800000, '2024-12-05 18:30:01', 32, 'GTX 1660', 'GTX 1660', 1, 21),
(23, 6, 'RTX 4070', '4070.jpg', 543, 12, 16500000, 15500000, '2024-12-05 18:30:26', 46, '<p>RTX 4070</p>', '<p>RTX 4070</p>', 1, 20),
(26, 2, 'PC Hexa', 'pc1.jpg', 777, 0, 22000000, 20000000, '2024-12-06 20:13:28', 4, 'PC Hexa', 'PC Hexa', 1, 32);

--
-- Triggers `products`
--
DELIMITER $$
CREATE TRIGGER `update_warehouse_data` AFTER UPDATE ON `products` FOR EACH ROW BEGIN
    -- Đồng bộ `name`, `category_id`, `create_date` từ bảng products sang warehouse
    UPDATE warehouse
    SET 
        name = NEW.name,
        category_id = NEW.category_id,
        create_date = NEW.create_date
    WHERE warehouse_id = NEW.warehouse_id;

    -- Cập nhật số lượng trong warehouse nếu `quantity` thay đổi
    IF NEW.quantity <> OLD.quantity THEN
        UPDATE warehouse
        SET quantity = quantity + (NEW.quantity - OLD.quantity)
        WHERE warehouse_id = NEW.warehouse_id;
    END IF;

    -- Xử lý thay đổi warehouse_id
    IF NEW.warehouse_id <> OLD.warehouse_id THEN
        -- Giảm số lượng từ warehouse cũ
        UPDATE warehouse
        SET quantity = quantity - OLD.quantity
        WHERE warehouse_id = OLD.warehouse_id;

        -- Tăng số lượng vào warehouse mới
        UPDATE warehouse
        SET quantity = quantity + NEW.quantity
        WHERE warehouse_id = NEW.warehouse_id;
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_warehouse_quantity` AFTER UPDATE ON `products` FOR EACH ROW BEGIN
  -- Kiểm tra nếu quantity trong bảng products thay đổi
  IF OLD.quantity != NEW.quantity THEN
    -- Cập nhật số lượng trong bảng warehouse tương ứng
    UPDATE warehouse
    SET quantity = NEW.quantity
    WHERE warehouse_id = NEW.warehouse_id;
  END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL COMMENT 'Tên đăng nhập',
  `password` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL COMMENT 'Họ tên',
  `image` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `address` varchar(255) NOT NULL,
  `role` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 là khách hàng 1 là nhân viên',
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `recovery_token` varchar(100) DEFAULT NULL,
  `token_expiry` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `full_name`, `image`, `email`, `phone`, `address`, `role`, `active`, `recovery_token`, `token_expiry`) VALUES
(6, 'khoanguyen', '$2y$10$YO9fd9Wdhed5mYcUFc5eTe5o7zrasZtl2x7Wt4J03im0NWaRisesu', 'Nguyễn Lê Anh Khoa', 'user-default.png', 'khoacntt2003@gmail.com', '0909135329', 'Ninh Kiều, Cần Thơ', 0, 1, NULL, NULL),
(7, 'khahi', '$2y$10$sF.yA6lAhvCE1vhwffwijuzA3JMoVhgnxkk.FdqXR4HVHlHdnXHzK', 'Lê Châu Khả Hi', 'user-default.png', 'hilckpc06524@fpt.edu.vn', '0336216654', 'Kiên Giang', 0, 1, NULL, NULL),
(8, 'admin', '$2y$10$Cm.2KiZ85WRGUTBk8vhMaOIQt46A53HKuzPfZh2jS.fdZzAr33dTi', 'Admin', 'user-default.png', 'khoacn03@gmail.com', '0336216559', 'Cần Thơ', 1, 1, NULL, NULL),
(9, 'tranvana', '$2y$10$ts748iCUjwA5HpQBMLuROuAXa70addsKmfkMh9rYIw/PjhxLLwH8i', 'Trần Văn A', 'user-default.png', 'tranvana@gmail.com', '0909135969', 'Cái Răng, Cần Thơ', 0, 1, NULL, NULL),
(10, 'haohao', '$2y$10$gcBHpzElBGDkOv5EEzJFhuoireNk2HsaloJQLy2KHvzGqx6MIyYku', 'Mai Hảo Hảo', 'user-default.png', 'haomhpc07316@fpt.edu.vn', '0909135985', 'Ninh Kiều, Cần Thơ', 0, 1, NULL, NULL),
(11, 'tuankiet', '$2y$10$ENy4z0Infjac7VjlKYp2A.gqCBwc8N01tKGLT9A3buGdVoyd7sXnK', 'Đặng tuấn Kiệt', 'user-default.png', 'kietdtpc06764@fpt.edu.vn', '0909006764', 'Cần Thơ', 0, 1, NULL, NULL),
(12, 'khoanguyen111', '$2y$10$ZPAY2O7ntfQ5/Huv3dUAIuY4qHuPD/DpRxiw11TurgYr3hCrWfnv2', 'Nguyễn Lê Anh Khoa', 'khoanguyen.jpg', 'khoanlapc1234@gmail.com', '0336216546', 'Cần Thơ', 0, 1, NULL, NULL),
(13, 'khoanguyen001', '$2y$10$ptSvfsaT78h4LdZQNCrKdemlC.AqyZ/q5cudTk9/FKcbe6TtJDJAC', 'Nguyễn Lê Anh Khoa', 'user-default.png', 'khoanla113@gmail.com', '0336216555', 'Can tho', 0, 1, NULL, NULL),
(15, 'toan', '$2y$10$rwdD7UlOPC2XUc4d3nJ/nO0THzotlhmrKekcbBynHxTqpOmFlN79a', 'Toàn', 'user-default.png', 'toan@gmail.com', '0336256555', 'Đại Học Cửu Long', 0, 1, NULL, NULL),
(16, 'vankiet', '$2y$10$uxjFWw9F9VTBPdEkyuTsr.aX3XeXd.zDo9AQ7sVJ3bBgPLVE0Iri6', 'van kiet', '82124780_574782770038914_6163290280352022528_n.jpg', 'vankiet@gmail.com', '0823456783', '366 chu van an', 0, 1, NULL, NULL),
(19, 'kiet2203', '$2y$10$kg3FC9a4ywY717jZoKA7nuxHVRrRF/WLoEqy8r3EQvG8.wRZwYH5e', 'nguyen kiet', '82124780_574782770038914_6163290280352022528_n.jpg', 'vankiet2203.nguyen@gmail.com', '0871231263', '366 chu van an', 0, 1, '113ab1397752cd01287d6113482cf108d27cd9cee57c2e35e3ca29359e1b198116468a1611049850c2ee51b8e0b5bac94200', '2024-12-07 23:45:54'),
(20, 'kiet22', '$2y$10$Ci/P.kzjj.fFKs7zzNPbcu4bAI5sjOJ5Ou5u7PZ4danFtUyREPeXW', 'van kiet 1', 'user-default.png', 'vankiet2203@gmail.com', '0854123123', '355 chu van an', 0, 1, NULL, NULL),
(21, 'kietyugi123', '$2y$10$hqPxt/i7MB1l8XIt2FhsmeuXHZOJ7aavAsQJR1ZyWj0sXYcGpOPDq', 'van kiet', 'user-default.png', '3121411117@sv.sgu.edu.vn', '0823456785', '366 chu van an', 0, 1, NULL, NULL),
(22, 'tnhan', '$2y$10$2Ovpfi5ZH6Q0/n5P9umfye10aPRaoM5Zip3Tskjvc1H8MkIJv.QPa', 'thanh nhan', 'Screenshot 2024-11-25 164237.png', 'thanhnhan@gmail.com', '0987654321', '1 long en', 0, 1, NULL, NULL),
(23, 'bphuoc', '$2y$10$gyNjXkcMzqhAcd6zFXOXk.nYt71eHlGpQWTi1mM7lzFHoVHgUd6MK', 'binh phuoc', 'Screenshot 2024-11-13 230040.png', 'binhphuoc@gmail.com', '0891234567', '1 dong nai', 0, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

CREATE TABLE `warehouse` (
  `warehouse_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `o_price` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `warehouse`
--

INSERT INTO `warehouse` (`warehouse_id`, `category_id`, `name`, `o_price`, `quantity`, `create_date`) VALUES
(15, 2, 'PC Gamma', 17000000.00, 123, '2024-12-05 17:15:52'),
(16, 2, 'PC Belta', 20000000.00, 431, '2024-12-05 17:18:16'),
(17, 2, 'PC Alpha', 14000000.00, 553, '2024-12-05 17:23:23'),
(18, 4, 'Màn hình MSI MP241', 1400000.00, 666, '2024-12-05 17:22:55'),
(19, 4, 'Màn hình BenQ XL2546', 10000000.00, 332, '2024-12-05 12:16:21'),
(20, 6, 'RTX 4070', 12500000.00, 542, '2024-12-05 18:30:26'),
(21, 6, 'GTX 1660', 2200000.00, 157, '2024-12-05 18:30:01'),
(22, 16, 'Chuột Zowie S1-C', 1480000.00, 109, '2024-12-05 18:29:39'),
(23, 19, 'Tai nghe Corsair Virtuoso', 4000000.00, 230, '2024-12-05 18:29:11'),
(24, 19, 'Tai nghe Razor Barracuda X', 2000000.00, 444, '2024-12-05 18:28:41'),
(25, 17, 'Bàn phím AKKO 5075B Plus Naruto', 900000.00, 531, '2024-12-05 18:28:11'),
(26, 17, 'Bàn phím DareU EK75', 449000.00, 1000, '2024-12-05 12:20:51'),
(27, 16, 'Chuột DareU EM901X RGB', 600000.00, 321, '2024-12-05 18:27:07'),
(28, 6, 'RTX 2060', 5000000.00, 444, '2024-12-05 18:26:33'),
(32, 2, 'PC Hexa', 99999999.99, 777, '2024-12-06 20:13:28');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`orderdetails_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`warehouse_id`),
  ADD KEY `category_id` (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=277;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `orderdetails_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `warehouse`
--
ALTER TABLE `warehouse`
  MODIFY `warehouse_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`warehouse_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD CONSTRAINT `warehouse_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
