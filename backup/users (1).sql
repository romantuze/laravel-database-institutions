-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Окт 21 2021 г., 19:54
-- Версия сервера: 10.4.19-MariaDB
-- Версия PHP: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `db2`
--

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `institution_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_operator` tinyint(1) NOT NULL DEFAULT 0,
  `is_coordinator` tinyint(1) NOT NULL DEFAULT 0,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `institution_id`, `is_operator`, `is_coordinator`, `is_admin`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Роман Романов Романович', 'romantuze@gmail.com', NULL, '$2y$10$fquppZaSP1BriykJAngkR.NAwU8xJ34Xzf8n95LNqCgsICOmqvvXq', 'Администратор', NULL, 0, 0, 1, NULL, '2021-10-08 06:48:36', '2021-10-08 06:48:36'),
(2, 'Федор Федорович Федоров', 'romich-fx@mail.ru', NULL, '$2y$10$0qaKWO3M7ePb6rGcZ.71KuCkJkeumKSNly18Y2.ECsNE3QaWdPQj.', 'Согласующий', 1, 0, 1, 0, NULL, '2021-10-08 11:30:12', '2021-10-12 13:58:25'),
(4, 'Михаилов Михаил Михаилович', 'gfhjgh@mail.ru', NULL, '$2y$10$rAQAYRpt56Ssr2a7WPT9FewRQTmCeNP.0UivrL89S/7DGpfdRPIYC', 'Согласующий', 1, 0, 1, 0, NULL, '2021-10-08 11:47:06', '2021-10-08 11:47:06'),
(5, 'Гутыря Андрей Евгеньевич', 'a.gutyrya@yandex.ru', NULL, '$2y$10$CpcykzS5/H0yzuciASNvm.4wvQ/O3PxKbgGtmyVxim9Y/OwqbEHhq', 'Администратор', NULL, 0, 0, 1, NULL, '2021-10-03 22:45:58', '2021-10-12 10:09:14'),
(6, 'Замлелова Ольга', 'OABatova@noyabrsk.yanao.ru', NULL, '$2y$10$6vFF1F4S/FOU8AEx486cpOr2EPkdahS9fwaaLpo8yjxHwBhKcVDk2', 'Администратор', NULL, 0, 0, 1, NULL, '2021-10-07 04:28:53', '2021-10-12 10:09:21'),
(7, 'Андрей Гутыря', 'gutyrya.ae@gmail.com', NULL, '$2y$10$JczzeVBffh2gJ67CCsSJjO.lJ668oeKi.io2gKsrMN4/J1x2e03X.', 'Администратор', NULL, 0, 0, 1, NULL, '2021-10-07 04:45:46', '2021-10-12 10:09:30'),
(8, 'Эдуардов Эдуард Эдуардович', 'echeremin@mail.ru', NULL, '$2y$10$cjDFIC9zZtxeHMUPBBDnC.a3S2wqskfmeg49j7zyo81.EuZvdQWT6', 'Оператор', NULL, 1, 0, 0, NULL, '2021-10-12 05:00:27', '2021-10-12 05:00:27');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
