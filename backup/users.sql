-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Окт 11 2021 г., 21:57
-- Версия сервера: 5.7.27-30
-- Версия PHP: 7.1.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `u0231253_db2`
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
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `is_admin`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Роман И. И.', 'romantuze@gmail.com', NULL, '$2y$10$mGoU5iEOi/uBcwDQUBn4/OJDUe.sX41YaHcRgjZv57TTjEkVSMjge', '123456', 0, NULL, '2021-09-29 12:47:15', '2021-09-29 12:47:15'),
(2, 'Гутыря Андрей Евгеньевич', 'a.gutyrya@yandex.ru', NULL, '$2y$10$CpcykzS5/H0yzuciASNvm.4wvQ/O3PxKbgGtmyVxim9Y/OwqbEHhq', 'Администратор', 0, NULL, '2021-10-04 02:45:58', '2021-10-04 02:45:58'),
(3, 'Замлелова Ольга', 'OABatova@noyabrsk.yanao.ru', NULL, '$2y$10$6vFF1F4S/FOU8AEx486cpOr2EPkdahS9fwaaLpo8yjxHwBhKcVDk2', 'Админ', 0, NULL, '2021-10-07 08:28:53', '2021-10-07 08:28:53'),
(4, 'Андрей Гутыря', 'gutyrya.ae@gmail.com', NULL, '$2y$10$JczzeVBffh2gJ67CCsSJjO.lJ668oeKi.io2gKsrMN4/J1x2e03X.', 'Администратор', 0, NULL, '2021-10-07 08:45:46', '2021-10-07 08:45:46');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
