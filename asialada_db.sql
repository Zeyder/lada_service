-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Июн 26 2017 г., 12:56
-- Версия сервера: 5.5.52-38.3
-- Версия PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `asialada_db`
--

-- --------------------------------------------------------

--
-- Структура таблицы `fines`
--

CREATE TABLE IF NOT EXISTS `fines` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_user` int(10) UNSIGNED NOT NULL,
  `model` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_start` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_end` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `date_parking` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `archive` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `fines`
--

INSERT INTO `fines` (`id`, `id_user`, `model`, `state_number`, `token_number`, `date_start`, `date_end`, `date_parking`, `archive`, `created_at`, `updated_at`) VALUES
(1, 3, 'Тойота Ипсум', 'Е191УК38', '128', '23.02.2017 18:52', '', '', 0, '2017-06-13 04:12:25', '2017-06-13 04:12:25'),
(2, 3, 'Nissan Cedric', 'б/н (О322ОО79 - фиктивные)', '324', '15.03.2017 08:14', '', '', 0, '2017-06-13 04:18:26', '2017-06-13 04:18:26'),
(3, 3, 'Мотороллер Муравей', 'б/н', '147', '20.03.2017 16:00', '', '', 0, '2017-06-13 04:27:02', '2017-06-13 04:27:02'),
(4, 3, 'ГАЗ 31029', 'О899АС03', '115', '25.03.2017 16:35', '', '', 0, '2017-06-13 04:29:47', '2017-06-13 04:29:47'),
(5, 3, 'Хонда Такт Мопед', 'б/н', '120', '27.05.2017 20:15', '', '', 0, '2017-06-13 04:37:00', '2017-06-13 04:37:00'),
(6, 3, 'ВАЗ 2101', 'Т762ХУ38', '208', '03.04.2017 23:22', '', '', 0, '2017-06-13 04:43:43', '2017-06-13 04:43:43'),
(7, 3, 'Тойота Марк II', 'М377ХК38', '299', '12.11.2016 13:20', '', '', 0, '2017-06-13 04:53:31', '2017-06-13 04:53:31'),
(8, 3, 'Тойота Land Cruiser', 'Т292НТ98', '303', '12.11.2016 13:26', '', '', 0, '2017-06-13 04:55:13', '2017-06-13 04:55:13'),
(9, 3, 'Субару Легаси', 'подложные номера Х379КВ03', '205', '01.12.2016 18:20', '', '', 0, '2017-06-13 05:02:37', '2017-06-13 05:02:37'),
(10, 3, 'Субару Легаси', 'Е535АТ03', '209', '31.12.2016 04:02', '13.06.2017 19:40', '', 1, '2017-06-13 05:09:09', '2017-06-15 02:41:20'),
(11, 3, 'Мотоцикл Урал', 'б/н', '119', '14.04.2017 17:56', '', '', 0, '2017-06-13 05:30:09', '2017-06-13 05:30:09'),
(12, 3, 'Москвич', '8914БУТ', '313', '15.04.2017 18:00', '', '', 0, '2017-06-13 05:31:08', '2017-06-13 05:31:08'),
(13, 3, 'Мотоцикл Муравей', 'б/н', '201', '16.04.2017 18:41', '', '', 0, '2017-06-13 05:32:54', '2017-06-13 05:32:54'),
(14, 3, 'ВАЗ 2105', 'Т140ВО03', '187', '16.04.2017 23:40', '', '', 0, '2017-06-13 05:33:55', '2017-06-13 05:33:55'),
(15, 3, 'Тойота Камри', 'Н804ЕА03', '161', '25.04.2017 00:29', '', '', 0, '2017-06-13 05:35:37', '2017-06-13 05:35:37'),
(16, 3, 'ГАЗ 3102', 'О542ЕР03', '189', '28.04.2017 00:12', '', '', 0, '2017-06-13 05:37:15', '2017-06-13 05:37:15'),
(17, 3, 'Тойота Краун', 'Н150ЕА03', '190', '28.04.2017 02:18', '', '', 0, '2017-06-13 05:38:01', '2017-06-13 05:38:01'),
(18, 3, 'ВАЗ 2105', 'Х678ЕН03', '167', '28.04.2017 19:45', '', '', 0, '2017-06-13 05:39:19', '2017-06-13 05:39:19'),
(19, 3, 'ГАЗ 3110', 'А359КК03', '172', '29.04.2017 05:30', '', '', 0, '2017-06-13 05:40:22', '2017-06-13 05:40:22'),
(20, 3, 'Мопед', 'б/н', '118', '30.04.2017 17:22', '', '', 0, '2017-06-13 05:41:10', '2017-06-13 05:41:10'),
(21, 3, 'Мопед Альфа', 'б/н', '192', '30.04.2017 22:43', '', '', 0, '2017-06-13 05:42:01', '2017-06-13 05:42:01'),
(22, 3, 'ВАЗ 2106', 'А170ЕЕ03', '193', '07.05.2017 22:45', '', '', 0, '2017-06-13 05:43:02', '2017-06-13 05:43:02'),
(23, 3, 'Тойота Краун', 'Р044КВ03', '176', '08.05.2017 18:00', '', '', 0, '2017-06-13 05:44:01', '2017-06-13 05:44:01'),
(24, 3, 'Мотоцикл Муравей', 'б/н', '329', '09.05.2017 17:43', '', '', 0, '2017-06-13 05:45:24', '2017-06-13 05:45:24'),
(25, 3, 'Митсубиси RVR', 'б/н', '134', '09.05.2017 23:37', '', '', 0, '2017-06-14 06:07:56', '2017-06-14 06:07:56'),
(26, 3, 'Ниссан Санни', 'Т609ЕО03', '154', '10.05.2017 03:24', '10.05.2017 18:50', '10.05.2017 18:50', 1, '2017-06-14 06:09:34', '2017-06-14 07:28:57'),
(27, 3, 'Мотоцикл Восход', '6751БУИ', '150', '10.05.2017 03:30', '', '', 0, '2017-06-14 06:15:45', '2017-06-14 06:15:45'),
(28, 5, 'Мотоцикл Урал', '3787АА03', '181', '14.05.2017 06:36', '', '', 0, '2017-06-14 06:18:39', '2017-06-14 06:18:39'),
(29, 5, 'Ходна Стрим', '0606ЕМ03', '168', '14.05.2017 12:27', '17.05.2017 16:04', '', 1, '2017-06-14 06:21:33', '2017-06-14 07:29:24'),
(30, 5, 'Мотоцикл Восход 3М', 'б/н', '169', '16.05.2017 03:49', '', '', 0, '2017-06-14 06:23:34', '2017-06-14 06:23:34'),
(31, 5, 'Мопед Альфа', 'б/н', '112', '19.05.2017 21:00', '', '', 0, '2017-06-14 06:25:11', '2017-06-14 06:25:11'),
(32, 5, 'ИЖ-2715', 'б/н', '194', '19.05.2017 22:50', '', '', 0, '2017-06-14 06:25:56', '2017-06-14 06:25:56'),
(33, 5, 'Сани деда мороза', 'А000АА03', '5', '01.01.2015 00:00', '01.01.2017 00:01', '01.01.2016 00:00', 1, '2017-06-14 06:28:03', '2017-06-15 02:52:59'),
(34, 5, 'ВАЗ 21093', 'Н738АВ03', '178', '23.05.2017 14:49', '', '', 0, '2017-06-14 07:09:21', '2017-06-14 07:09:21'),
(35, 5, 'Тойота Королла', 'Е870КА03', '210', '28.05.2017 06:00', '', '', 0, '2017-06-14 07:10:33', '2017-06-14 07:10:33'),
(36, 5, 'Тойота Королла', 'Р948ЕМ03', '215', '29.05.2017 17:36', '', '', 0, '2017-06-14 07:11:49', '2017-06-14 07:11:49'),
(37, 5, 'ВАЗ 2121 Нива', 'Х840КУ03', '117', '30.05.2017 16:00', '16.06.2017 13:25', '', 1, '2017-06-14 07:13:09', '2017-06-20 01:23:34'),
(38, 3, 'Мопед Racer', 'б/н', '102', '01.06.2017 00:54', '', '', 0, '2017-06-14 07:15:12', '2017-06-14 07:15:12'),
(39, 3, 'Мопед Рейсер', 'б/н', '142', '03.06.2017 22:00', '', '', 0, '2017-06-14 07:16:30', '2017-06-14 07:16:30'),
(40, 3, 'Москвич 412', 'А197АВ03', '330', '04.06.2017 05:15', '', '', 0, '2017-06-14 07:17:38', '2017-06-14 07:17:38'),
(41, 3, 'Мотоцикл Днепр', 'б/н', '173', '05.06.2017 00:35', '', '', 0, '2017-06-14 07:18:37', '2017-06-14 07:18:37'),
(42, 3, 'Тойота Альфард', '0591УБИ', '136', '07.06.2017 02:25', '', '', 0, '2017-06-14 07:20:08', '2017-06-14 07:20:08'),
(43, 3, 'Мицубиси Делика', 'Т195АХ125', '217', '07.06.2017 08:15', '16.06.2017 10:30', '', 1, '2017-06-14 07:21:24', '2017-06-20 01:13:44'),
(44, 3, 'ГАЗ 3110', 'О258ЕМ03', '328', '07.06.2017 18:20', '14.06.2017 13:20', '14.06.2017 13:20', 1, '2017-06-14 07:24:37', '2017-06-15 02:42:44'),
(45, 3, 'Мопед Рейсер', 'б/н', '121', '07.06.2017 23:53', '', '', 0, '2017-06-14 07:26:15', '2017-06-14 07:26:15'),
(46, 3, 'Nissan Avenir', 'Т776КХ03', '165', '08.06.2017 13:36', '16.06.2017 13:40', '', 1, '2017-06-14 07:27:27', '2017-06-20 01:13:35'),
(47, 3, 'ГАЗ 2410', 'Н719ВН03', '224', '10.06.2017 08:00', '', '', 0, '2017-06-14 07:30:40', '2017-06-14 07:30:40'),
(48, 3, 'Мерседес Бенц Е320', 'б/н', '108', '11.06.2017 14:07', '14.06.2017 18:55', '', 1, '2017-06-14 07:31:59', '2017-06-15 02:44:31'),
(49, 3, 'Хонда HRV', 'Н578КА03', '99', '11.06.2017 19:00', '', '', 0, '2017-06-14 07:33:09', '2017-06-14 07:33:09'),
(50, 3, 'Мопед', 'б/н', '110', '11.06.2017 23:34', '', '', 0, '2017-06-14 07:33:44', '2017-06-14 07:33:44'),
(51, 3, 'ВАЗ 21053', 'В825ЕН03', '232', '12.06.2017 04:40', '', '', 0, '2017-06-14 07:35:00', '2017-06-14 07:35:00'),
(52, 3, 'ВАЗ 2101', 'В296ВЕ03', '180', '12.06.2017 17:17', '', '', 0, '2017-06-14 07:37:36', '2017-06-14 07:37:36'),
(53, 3, 'ВАЗ 2106', 'К2284БУ', '179', '12.06.2017 22:02', '', '', 0, '2017-06-14 07:40:39', '2017-06-14 07:40:39'),
(54, 3, 'ВАЗ 21099', 'А943КР03', '195', '13.06.2017 02:01', '', '', 0, '2017-06-14 07:41:20', '2017-06-14 07:41:20'),
(55, 3, 'Тойота Королла', 'Р026КХ03', '132', '13.06.2017 23:17', '15.06.2017 17:00', '', 1, '2017-06-14 07:42:19', '2017-06-16 00:47:37'),
(56, 3, 'Тойота Таун Айс Ноах', 'В108МА03', '105', '14.06.2017 07:55', '14.06.2017 16:55', '', 1, '2017-06-14 07:44:08', '2017-06-14 07:48:24'),
(57, 3, 'ВАЗ 2101', 'АЕ479В03', '222', '14.06.2017 08:22', '', '', 0, '2017-06-14 07:44:45', '2017-06-14 07:44:45'),
(58, 3, 'Тойота Ленд Крузер Прадо', 'М900ЕР03', '230', '14.06.2017 15:15', '14.06.2017 22:15', '', 1, '2017-06-14 07:45:30', '2017-06-15 02:45:02'),
(59, 3, 'Лифан Салано', 'К776КЕ03', '327', '05.01.2016 02:02', '', '', 0, '2017-06-15 01:42:39', '2017-06-15 01:42:39'),
(60, 3, 'Хонда Торнео', 'К473КЕ03', '326', '05.01.2016 03:02', '', '', 0, '2017-06-15 01:43:46', '2017-06-15 01:43:46'),
(61, 3, 'Мицубиси Галант', 'б/н', '301', '30.05.2016 04:16', '', '', 0, '2017-06-15 01:46:05', '2017-06-15 01:46:05'),
(62, 3, 'Фольксваген Лупо', 'Х376МКО', '207', '09.12.2016 00:53', '', '', 0, '2017-06-15 01:49:52', '2017-06-15 01:49:52'),
(63, 3, 'Москвич 2715', 'б/н', '182', '07.05.2017 14:15', '', '22.05.2017 10:00', 0, '2017-06-15 01:54:47', '2017-06-15 01:57:31'),
(64, 3, 'Тойота Камри', 'К170ЕС03', '162', '17.05.2017 02:20', '', '01.06.2017 13:30', 0, '2017-06-15 02:02:27', '2017-06-15 02:07:50'),
(65, 3, 'Мопед Рейсер', 'б/н', '154', '12.06.2017 00:21', '12.06.2017 17:21', '', 1, '2017-06-15 02:11:06', '2017-06-15 02:47:40'),
(66, 3, 'Инфинити G35', 'В566МР124', '168', '12.06.2017 07:45', '12.06.2017 14:15', '', 1, '2017-06-15 02:13:38', '2017-06-15 02:47:34'),
(67, 3, 'Тойота Таун Айс Ноах', 'В108МА03', '105', '14.06.2017 07:55', '14.06.2017 16:55', '', 1, '2017-06-15 02:15:59', '2017-06-15 02:47:24'),
(68, 3, 'Тойота Корона', 'Е526КМ03', '231', '14.06.2017 21:47', '15.06.2017 15:00', '', 1, '2017-06-15 02:18:35', '2017-06-16 00:49:46'),
(69, 3, 'Тойота Краун', 'К506МА03', '321', '14.06.2017 23:05', '15.06.2017 19:25', '', 1, '2017-06-15 02:21:00', '2017-06-16 00:48:12'),
(70, 3, 'Хендай Старекс', 'К146КО03', '220', '15.06.2017 02:43', '15.06.2017 14:40', '', 1, '2017-06-15 02:22:30', '2017-06-16 00:49:34'),
(71, 3, 'Тойота Краун Маджеста', 'А434КВ03', '200', '15.06.2017 04:00', '15.06.2017 16:50', '', 1, '2017-06-15 02:23:25', '2017-06-16 00:49:18'),
(72, 3, 'Метла бабы яги', 'Я888ЯЯ03', '2003', '01.01.2015 00:01', '03.03.2017 03:03', '02.02.2016 02:02', 1, '2017-06-15 03:07:58', '2017-06-15 03:08:22'),
(73, 3, 'Subaru Forester', 'М990КР03', '123', '15.06.2017 21:35', '16.06.2017 15:50', '', 1, '2017-06-16 00:53:26', '2017-06-19 05:07:10'),
(74, 3, 'Мопед Рейсер', 'б/н', '306', '15.06.2017 22:55', '16.06.2017 12:15', '', 1, '2017-06-16 00:54:10', '2017-06-19 05:08:02'),
(75, 3, 'ВАЗ 2106', 'Е234ЕР03', '183', '15.06.2017 22:58', '16.06.2017 14:40', '', 1, '2017-06-16 00:54:50', '2017-06-19 05:08:45'),
(76, 3, 'Тойота Калдина', 'Н135ЕО03', '237', '15.06.2017 23:38', '16.06.2017 12:20', '', 1, '2017-06-16 00:55:33', '2017-06-19 05:09:17'),
(77, 3, 'Дэу Матиз', 'У832КК03', '214', '16.06.2017 00:25', '16.05.2017 22:25', '', 1, '2017-06-16 00:56:14', '2017-06-19 05:09:47'),
(78, 3, 'Мерседес Бенц С180', 'А737МА03', '209', '16.06.2017 04:00', '16.06.2017 13:25', '', 1, '2017-06-16 00:57:15', '2017-06-19 05:10:25'),
(79, 3, 'Лексус IS250', 'У169КТ777', '108', '16.06.2017 04:49', '16.06.2017 16:30', '', 1, '2017-06-16 00:58:01', '2017-06-19 05:11:05'),
(80, 3, 'Ниссан Сафиро', 'В636КЕ03', '221', '16.06.2017 15:24', '16.06.2017 22:40', '', 1, '2017-06-20 00:53:33', '2017-06-20 01:05:40'),
(81, 3, 'Тойота Карина', 'Р877КУ03', '132', '16.06.2017 19:15', '19.06.2017 12:15', '', 1, '2017-06-20 00:56:46', '2017-06-20 01:05:33'),
(82, 3, 'Тойота Корона', 'О189ХА03', '108', '16.06.2017 20:29', '', '', 0, '2017-06-20 00:59:03', '2017-06-20 00:59:03'),
(83, 3, 'ВАЗ 21074', 'Р467НЕ38', '156', '17.06.2017 04:10', '19.06.2017 08:10', '', 1, '2017-06-20 01:03:04', '2017-06-20 01:05:26'),
(84, 3, 'Тойота Краун', 'К709ЕО03', '165', '17.06.2017 06:27', '17.06.2017 16:40', '', 1, '2017-06-20 01:15:56', '2017-06-20 01:16:04'),
(85, 3, 'Тойота Ариста', 'Т736КВ03', '217', '17.06.2017 07:55', '19.06.2017 16:15', '', 1, '2017-06-20 01:16:54', '2017-06-20 01:17:01'),
(86, 3, 'Ниссан Эксперт', 'С078ЕВ03', '160', '17.06.2017 09:40', '18.06.2017 17:50', '', 1, '2017-06-20 01:18:35', '2017-06-20 01:18:41'),
(87, 3, 'Мотоцикл Битрикс', 'б/н', '107', '17.06.2017 11:06', '17.06.2017 22:15', '', 1, '2017-06-20 01:19:31', '2017-06-20 01:19:35'),
(88, 3, 'Тойота Ист', 'М041ЕЕ75', '154', '17.06.2017 23:00', '18.06.2017 13:00', '', 1, '2017-06-20 01:20:29', '2017-06-20 01:21:30'),
(89, 3, 'Мопед Альфа', 'б/н', '221', '18.06.2017 00:43', '19.06.2017 19:50', '', 1, '2017-06-20 01:21:18', '2017-06-20 01:21:24'),
(90, 3, 'Мазда Фамилия', 'М915ОВ38', '117', '18.06.2017 02:02', '18.06.2017 12:07', '', 1, '2017-06-20 01:24:44', '2017-06-20 01:24:49'),
(91, 3, 'ВАЗ 21074', 'Р467НЕ38', '156', '17.06.2017 04:10', '19.06.2017 08:10', '', 1, '2017-06-23 01:45:36', '2017-06-23 01:55:33'),
(92, 3, 'Тойота Краун', 'К709ЕО03', '165', '17.06.2017 06:27', '17.06.2017 16:40', '', 1, '2017-06-23 01:46:26', '2017-06-23 01:55:28'),
(93, 3, 'Тойота Ариста', 'Т736КВ03', '217', '17.06.2017 07:55', '19.06.2017 16:15', '', 1, '2017-06-23 01:47:31', '2017-06-23 01:55:24'),
(94, 3, 'Ниссан Эксперт', 'С078ЕВ03', '160', '17.06.2017 09:40', '18.06.2017 17:50', '', 1, '2017-06-23 01:49:02', '2017-06-23 01:55:19'),
(95, 3, 'Мотоцикл Битрикс', 'б/н', '107', '17.06.2017 11:06', '17.06.2017 22:15', '', 1, '2017-06-23 01:52:31', '2017-06-23 01:55:14'),
(96, 3, 'Тойота Ист', 'М041ЕЕ75', '154', '17.06.2017 23:00', '18.06.2017 13:00', '', 1, '2017-06-23 01:53:15', '2017-06-23 01:55:08'),
(97, 3, 'Мопед Альфа', 'б/н', '221', '18.06.2017 00:43', '19.06.2017 19:50', '', 1, '2017-06-23 01:53:52', '2017-06-23 01:55:00'),
(98, 3, 'Мазда Фамилия', 'М915ОВ38', '117', '18.06.2017 02:02', '18.06.2017 12:07', '', 1, '2017-06-23 01:54:45', '2017-06-23 01:54:55');

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(17, '2014_10_12_000000_create_users_table', 1),
(18, '2014_10_12_100000_create_password_resets_table', 1),
(19, '2017_05_29_103237_create_fines_table', 1),
(20, '2017_05_29_103331_create_token_numbers_table', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `token_numbers`
--

CREATE TABLE IF NOT EXISTS `token_numbers` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `token_numbers`
--

INSERT INTO `token_numbers` (`id`, `number`, `created_at`, `updated_at`) VALUES
(1, '5', '2017-06-09 10:05:42', '2017-06-09 10:05:42'),
(2, '128', '2017-06-13 04:08:15', '2017-06-13 04:08:15'),
(3, '324', '2017-06-13 04:16:27', '2017-06-13 04:16:27'),
(4, '147', '2017-06-13 04:19:48', '2017-06-13 04:19:48'),
(5, '115', '2017-06-13 04:28:06', '2017-06-13 04:28:06'),
(6, '120', '2017-06-13 04:35:28', '2017-06-13 04:35:28'),
(7, '208', '2017-06-13 04:38:06', '2017-06-13 04:38:06'),
(8, '299', '2017-06-13 04:52:14', '2017-06-13 04:52:14'),
(9, '303', '2017-06-13 04:52:27', '2017-06-13 04:52:27'),
(10, '205', '2017-06-13 05:00:02', '2017-06-13 05:00:02'),
(11, '209', '2017-06-13 05:08:23', '2017-06-13 05:08:23'),
(12, '119', '2017-06-13 05:29:13', '2017-06-13 05:29:13'),
(13, '313', '2017-06-13 05:30:21', '2017-06-13 05:30:21'),
(14, '201', '2017-06-13 05:31:32', '2017-06-13 05:31:32'),
(15, '187', '2017-06-13 05:31:38', '2017-06-13 05:31:38'),
(16, '161', '2017-06-13 05:34:52', '2017-06-13 05:34:52'),
(17, '189', '2017-06-13 05:36:04', '2017-06-13 05:36:04'),
(18, '190', '2017-06-13 05:36:11', '2017-06-13 05:36:11'),
(19, '167', '2017-06-13 05:38:18', '2017-06-13 05:38:18'),
(20, '172', '2017-06-13 05:39:30', '2017-06-13 05:39:30'),
(21, '118', '2017-06-13 05:40:35', '2017-06-13 05:40:35'),
(22, '192', '2017-06-13 05:41:21', '2017-06-13 05:41:21'),
(23, '193', '2017-06-13 05:42:24', '2017-06-13 05:42:24'),
(24, '176', '2017-06-13 05:43:23', '2017-06-13 05:43:23'),
(25, '329', '2017-06-13 05:44:28', '2017-06-13 05:44:28'),
(26, '329', '2017-06-14 06:06:23', '2017-06-14 06:06:23'),
(27, '134', '2017-06-14 06:06:45', '2017-06-14 06:06:45'),
(28, '154', '2017-06-14 06:08:24', '2017-06-14 06:08:24'),
(29, '150', '2017-06-14 06:14:36', '2017-06-14 06:14:36'),
(30, '181', '2017-06-14 06:17:43', '2017-06-14 06:17:43'),
(31, '168', '2017-06-14 06:20:55', '2017-06-14 06:20:55'),
(32, '169', '2017-06-14 06:22:38', '2017-06-14 06:22:38'),
(33, '112', '2017-06-14 06:24:14', '2017-06-14 06:24:14'),
(34, '194', '2017-06-14 06:24:19', '2017-06-14 06:24:19'),
(35, '178', '2017-06-14 07:08:34', '2017-06-14 07:08:34'),
(36, '210', '2017-06-14 07:09:54', '2017-06-14 07:09:54'),
(37, '215', '2017-06-14 07:10:54', '2017-06-14 07:10:54'),
(38, '117', '2017-06-14 07:12:24', '2017-06-14 07:12:24'),
(39, '102', '2017-06-14 07:13:45', '2017-06-14 07:13:45'),
(40, '142', '2017-06-14 07:15:55', '2017-06-14 07:15:55'),
(41, '330', '2017-06-14 07:16:49', '2017-06-14 07:16:49'),
(42, '173', '2017-06-14 07:17:56', '2017-06-14 07:17:56'),
(43, '136', '2017-06-14 07:18:57', '2017-06-14 07:18:57'),
(44, '217', '2017-06-14 07:20:27', '2017-06-14 07:20:27'),
(45, '328', '2017-06-14 07:24:00', '2017-06-14 07:24:00'),
(46, '121', '2017-06-14 07:25:36', '2017-06-14 07:25:36'),
(47, '165', '2017-06-14 07:26:31', '2017-06-14 07:26:31'),
(48, '224', '2017-06-14 07:29:59', '2017-06-14 07:29:59'),
(49, '108', '2017-06-14 07:31:09', '2017-06-14 07:31:09'),
(50, '99', '2017-06-14 07:31:15', '2017-06-14 07:31:15'),
(51, '110', '2017-06-14 07:31:20', '2017-06-14 07:31:20'),
(52, '232', '2017-06-14 07:34:00', '2017-06-14 07:34:00'),
(53, '180', '2017-06-14 07:35:15', '2017-06-14 07:35:15'),
(54, '179', '2017-06-14 07:35:22', '2017-06-14 07:35:22'),
(55, '195', '2017-06-14 07:35:27', '2017-06-14 07:35:27'),
(56, '132', '2017-06-14 07:41:39', '2017-06-14 07:41:39'),
(57, '105', '2017-06-14 07:42:37', '2017-06-14 07:42:37'),
(58, '222', '2017-06-14 07:42:43', '2017-06-14 07:42:43'),
(59, '230', '2017-06-14 07:42:48', '2017-06-14 07:42:48'),
(60, '230', '2017-06-15 01:38:02', '2017-06-15 01:38:02'),
(61, '327', '2017-06-15 01:39:21', '2017-06-15 01:39:21'),
(62, '326', '2017-06-15 01:42:52', '2017-06-15 01:42:52'),
(63, '301', '2017-06-15 01:43:55', '2017-06-15 01:43:55'),
(64, '299', '2017-06-15 01:46:17', '2017-06-15 01:46:17'),
(65, '207', '2017-06-15 01:48:03', '2017-06-15 01:48:03'),
(66, '182', '2017-06-15 01:53:59', '2017-06-15 01:53:59'),
(67, '162', '2017-06-15 01:59:37', '2017-06-15 01:59:37'),
(68, '231', '2017-06-15 02:17:53', '2017-06-15 02:17:53'),
(69, '321', '2017-06-15 02:19:43', '2017-06-15 02:19:43'),
(70, '327', '2017-06-15 02:19:56', '2017-06-15 02:19:56'),
(71, '220', '2017-06-15 02:20:01', '2017-06-15 02:20:01'),
(72, '2003', '2017-06-15 02:20:06', '2017-06-15 02:20:06'),
(73, '200', '2017-06-15 02:20:24', '2017-06-15 02:20:24'),
(74, '327', '2017-06-15 02:21:27', '2017-06-15 02:21:27'),
(75, '327', '2017-06-15 02:21:47', '2017-06-15 02:21:47'),
(76, '327', '2017-06-15 02:27:17', '2017-06-15 02:27:17'),
(77, '317', '2017-06-15 02:31:43', '2017-06-15 02:31:43'),
(78, '123', '2017-06-16 00:51:17', '2017-06-16 00:51:17'),
(79, '306', '2017-06-16 00:51:25', '2017-06-16 00:51:25'),
(80, '183', '2017-06-16 00:51:31', '2017-06-16 00:51:31'),
(81, '237', '2017-06-16 00:51:36', '2017-06-16 00:51:36'),
(82, '214', '2017-06-16 00:51:40', '2017-06-16 00:51:40'),
(83, '209', '2017-06-16 00:51:44', '2017-06-16 00:51:44'),
(84, '108', '2017-06-16 00:51:49', '2017-06-16 00:51:49'),
(85, '221', '2017-06-20 00:52:23', '2017-06-20 00:52:23'),
(86, '132', '2017-06-20 00:55:44', '2017-06-20 00:55:44'),
(87, '108', '2017-06-20 00:57:01', '2017-06-20 00:57:01'),
(88, '156', '2017-06-20 00:59:26', '2017-06-20 00:59:26'),
(89, '165', '2017-06-20 01:03:36', '2017-06-20 01:03:36'),
(90, '165', '2017-06-20 01:03:56', '2017-06-20 01:03:56'),
(91, '217', '2017-06-20 01:04:30', '2017-06-20 01:04:30'),
(92, '165', '2017-06-20 01:04:34', '2017-06-20 01:04:34'),
(93, '217', '2017-06-20 01:05:12', '2017-06-20 01:05:12'),
(94, '165', '2017-06-20 01:05:15', '2017-06-20 01:05:15'),
(95, '165', '2017-06-20 01:13:04', '2017-06-20 01:13:04'),
(96, '217', '2017-06-20 01:13:10', '2017-06-20 01:13:10'),
(97, '165', '2017-06-20 01:13:52', '2017-06-20 01:13:52'),
(98, '217', '2017-06-20 01:13:56', '2017-06-20 01:13:56'),
(99, '165', '2017-06-20 01:14:48', '2017-06-20 01:14:48'),
(100, '217', '2017-06-20 01:14:52', '2017-06-20 01:14:52'),
(101, '160', '2017-06-20 01:17:18', '2017-06-20 01:17:18'),
(102, '107', '2017-06-20 01:17:25', '2017-06-20 01:17:25'),
(103, '154', '2017-06-20 01:17:29', '2017-06-20 01:17:29'),
(104, '221', '2017-06-20 01:17:32', '2017-06-20 01:17:32'),
(105, '117', '2017-06-20 01:17:37', '2017-06-20 01:17:37'),
(106, '117', '2017-06-20 01:23:47', '2017-06-20 01:23:47'),
(107, '156', '2017-06-23 01:26:17', '2017-06-23 01:26:17'),
(108, '165', '2017-06-23 01:26:23', '2017-06-23 01:26:23'),
(109, '217', '2017-06-23 01:26:28', '2017-06-23 01:26:28'),
(110, '160', '2017-06-23 01:47:51', '2017-06-23 01:47:51'),
(111, '107', '2017-06-23 01:47:55', '2017-06-23 01:47:55'),
(112, '154', '2017-06-23 01:47:59', '2017-06-23 01:47:59'),
(113, '221', '2017-06-23 01:48:05', '2017-06-23 01:48:05'),
(114, '117', '2017-06-23 01:48:09', '2017-06-23 01:48:09'),
(115, '117', '2017-06-23 01:48:10', '2017-06-23 01:48:10');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `login` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `password`, `full_name`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$10$fH083MF1slipTI0JVYF/.eR28eR1PJZV4ZYZq90tEVUXtpPdkooce', 'Administrator', '2', 'RGubLzsXr0RvbGutOvcWsFJlFlyXeVqHRDjgI7qfmMQXj2Ztbc83tPDFlYsy', '2017-06-06 20:55:27', '2017-06-06 20:55:27'),
(3, 'Asialada', '$2y$10$uArPzEILYc2XvzNQQaM3ROYOm7ts5qd.gQV.HK4vQYlBEGZbPLLLq', 'Саян Дармаев', '2', 'HtnbRY1YhWrX5uc4JGDeB6bEdRC4nE7p3FcnvexvDa8KbXjGMpx5qAAU66SQ', '2017-06-08 23:55:02', '2017-06-08 23:55:02'),
(4, 'oolah1', '$2y$10$eopRPZLDM7uk3CMXWG7n2O4dwnPzMXLljxay0I6rixL/iYURZyMHy', 'Алексей Хамарханов', '2', '7ti0UtorjJHaOLxPlrhKvLjbGnjrfTvHx7s3tsYBZz2Tcj2u33YoebVKbH2R', '2017-06-08 23:55:44', '2017-06-08 23:55:44'),
(5, 'aldar1980', '$2y$10$wKNuZLEvriXh3oPxCZAFluxK.46bCmblFpM9DDhDPtf7DjjEmHWFS', 'Дармаев Алдар Амгаланович', '1', 'PiKoNC2sckqukINgjsyepd3yUm0bQVTw6vOvEBv0ggBPlnj74j9p3ScltOCv', '2017-06-14 06:17:06', '2017-06-14 06:17:06');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
