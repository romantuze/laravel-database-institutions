-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июн 24 2022 г., 22:17
-- Версия сервера: 10.4.22-MariaDB
-- Версия PHP: 7.4.27

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
-- Структура таблицы `bases`
--

CREATE TABLE `bases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `bases`
--

INSERT INTO `bases` (`id`, `name`) VALUES
(1, 'Электронный аукцион');

-- --------------------------------------------------------

--
-- Структура таблицы `contractors`
--

CREATE TABLE `contractors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `contractors`
--

INSERT INTO `contractors` (`id`, `name`) VALUES
(1, 'АО \"Почта России\"');

-- --------------------------------------------------------

--
-- Структура таблицы `contracts`
--

CREATE TABLE `contracts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `institution_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type_contract` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contract_basis` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contract_date` date DEFAULT NULL,
  `number_contract` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contractor` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_contract` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contract_amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contract_term_1` date DEFAULT NULL,
  `contract_term_2` date DEFAULT NULL,
  `finance` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `responsible_executor` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `revision` tinyint(1) NOT NULL DEFAULT 0,
  `approved` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `contracts`
--

INSERT INTO `contracts` (`id`, `institution_id`, `type_contract`, `contract_basis`, `contract_date`, `number_contract`, `contractor`, `subject_contract`, `contract_amount`, `contract_term_1`, `contract_term_2`, `finance`, `event_title`, `responsible_executor`, `user_id`, `revision`, `approved`, `created_at`, `updated_at`) VALUES
(1, 1, 'Поставка товара', 'Электронный аукцион', '2021-10-21', '45245245', 'АО \"Почта России\"', '452', '52452', '2020-02-20', '2020-02-20', 'источник 1', '45245254245', NULL, 1, 0, 0, '2021-10-21 15:31:13', '2021-10-21 15:31:13'),
(2, 2, 'Поставка товара', 'Электронный аукцион', '2021-10-21', '452542', 'АО \"Почта России\"', '54245', '2452542', '2020-02-20', '2020-02-02', NULL, '54245254', NULL, 1, 0, 0, '2021-10-21 15:51:57', '2021-10-22 14:55:30'),
(5, 1, 'Поставка товара', 'Электронный аукцион', '2021-12-03', 'rtuy', 'АО \"Почта России\"', 'tyury', 'rtuyrt', '2020-07-06', '2020-02-20', 'источник 1', '1201201 2', NULL, 1, 0, 0, '2021-12-03 06:44:41', '2021-12-03 06:44:41');

-- --------------------------------------------------------

--
-- Структура таблицы `contract_types`
--

CREATE TABLE `contract_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `contract_types`
--

INSERT INTO `contract_types` (`id`, `name`) VALUES
(1, 'Поставка товара');

-- --------------------------------------------------------

--
-- Структура таблицы `executors`
--

CREATE TABLE `executors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `files`
--

CREATE TABLE `files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `contract_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `finances`
--

CREATE TABLE `finances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `finances`
--

INSERT INTO `finances` (`id`, `name`) VALUES
(1, 'источник 1');

-- --------------------------------------------------------

--
-- Структура таблицы `institutions`
--

CREATE TABLE `institutions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `institutions`
--

INSERT INTO `institutions` (`id`, `name`, `user_id`) VALUES
(1, 'МБУ ММЦ \"Современник\"', 8),
(2, 'МБУ ММЦ \"Доверие\"', 8),
(3, 'МБУ \"ЦАОиСЗДиМ\"', 8);

-- --------------------------------------------------------

--
-- Структура таблицы `kosgus`
--

CREATE TABLE `kosgus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `kosgus`
--

INSERT INTO `kosgus` (`id`, `name`) VALUES
(1, '221'),
(2, '222');

-- --------------------------------------------------------

--
-- Структура таблицы `kosgu_contracts`
--

CREATE TABLE `kosgu_contracts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `contract_id` bigint(20) UNSIGNED NOT NULL,
  `kosgu_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kosgu_amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `kosgu_contracts`
--

INSERT INTO `kosgu_contracts` (`id`, `contract_id`, `kosgu_title`, `kosgu_amount`) VALUES
(1, 1, '221', '452452'),
(2, 5, '221', '21021'),
(3, 5, '222', '21210');

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2021_09_21_171705_create_contracts_table', 1),
(6, '2021_09_26_183013_create_institutions_table', 1),
(7, '2021_09_26_183143_create_contract_types_table', 1),
(8, '2021_09_26_183234_create_bases_table', 1),
(9, '2021_09_26_183325_create_contractors_table', 1),
(10, '2021_09_26_183349_create_kosgus_table', 1),
(11, '2021_09_26_183408_create_finances_table', 1),
(12, '2021_09_26_183425_create_executors_table', 1),
(13, '2021_09_26_184715_create_user_contracts_table', 1),
(14, '2021_09_29_085618_create_files_table', 1),
(15, '2021_09_29_085713_create_remarks_table', 1),
(16, '2021_10_07_180856_create_kosgu_contracts_table', 1),
(17, '2021_10_21_141504_create_user_institutions_table', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `remarks`
--

CREATE TABLE `remarks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `contract_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `remark_date` date NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `remarks`
--

INSERT INTO `remarks` (`id`, `contract_id`, `user_id`, `remark_date`, `name`, `message`, `created_at`, `updated_at`) VALUES
(1, 2, 1, '2021-10-22', 'Роман Романов Романович', 'hhjkhjgkjkhjkh', '2021-10-22 14:55:30', '2021-10-22 14:55:30');

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

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `is_operator`, `is_coordinator`, `is_admin`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Роман Романов Романович', 'romantuze@gmail.com', NULL, '$2y$10$fquppZaSP1BriykJAngkR.NAwU8xJ34Xzf8n95LNqCgsICOmqvvXq', 'Администратор', 0, 0, 1, NULL, '2021-10-08 02:48:36', '2021-10-08 02:48:36'),
(2, 'Федор Федорович Федоров', 'romich-fx@mail.ru', NULL, '$2y$10$0qaKWO3M7ePb6rGcZ.71KuCkJkeumKSNly18Y2.ECsNE3QaWdPQj.', 'Согласующий', 0, 1, 0, NULL, '2021-10-08 07:30:12', '2021-10-12 09:58:25'),
(4, 'Михаилов Михаил Михаилович', 'gfhjgh@mail.ru', NULL, '$2y$10$rAQAYRpt56Ssr2a7WPT9FewRQTmCeNP.0UivrL89S/7DGpfdRPIYC', 'Согласующий', 0, 1, 0, NULL, '2021-10-08 07:47:06', '2021-10-08 07:47:06'),
(5, 'Гутыря Андрей Евгеньевич', 'a.gutyrya@yandex.ru', NULL, '$2y$10$CpcykzS5/H0yzuciASNvm.4wvQ/O3PxKbgGtmyVxim9Y/OwqbEHhq', 'Администратор', 0, 0, 1, NULL, '2021-10-03 18:45:58', '2021-10-12 06:09:14'),
(6, 'Замлелова Ольга', 'OABatova@noyabrsk.yanao.ru', NULL, '$2y$10$6vFF1F4S/FOU8AEx486cpOr2EPkdahS9fwaaLpo8yjxHwBhKcVDk2', 'Администратор', 0, 0, 1, NULL, '2021-10-07 00:28:53', '2021-10-12 06:09:21'),
(7, 'Андрей Гутыря', 'gutyrya.ae@gmail.com', NULL, '$2y$10$JczzeVBffh2gJ67CCsSJjO.lJ668oeKi.io2gKsrMN4/J1x2e03X.', 'Администратор', 0, 0, 1, NULL, '2021-10-07 00:45:46', '2021-10-12 06:09:30'),
(8, 'Эдуардов Эдуард Эдуардович', 'echeremin@mail.ru', NULL, '$2y$10$cjDFIC9zZtxeHMUPBBDnC.a3S2wqskfmeg49j7zyo81.EuZvdQWT6', 'Оператор', 1, 0, 0, NULL, '2021-10-12 01:00:27', '2021-10-12 01:00:27'),
(10, 'Test Test', 'testfdgdhf@sdfgdf.ru', NULL, '$2y$10$5hWWXj1uthG7LgV5yx8TJeoMBUgTRku2ziTx/En/ZRsWIbuoROUee', 'Согласующий', 0, 1, 0, NULL, '2021-10-29 08:57:42', '2021-10-29 08:57:42'),
(13, 'Андрей Гутыря', 'a.gutyrya@mail.ru', NULL, '$2y$10$Qa2Yhka/rKQJfPKwL1IoaOLV/f7hLgGHBSK2ZUBwVwnv4P7Ak1Aum', 'Администратор', 0, 0, 1, NULL, '2021-12-03 08:50:50', '2021-12-03 08:50:50'),
(14, 'Андрей Гутыря', 'udsm@yanao.ru', NULL, '$2y$10$1.w8PYaQuTfOzY.VEXx3NOz3QNWj1Q4dpsyIbSKcDx7.gHhnXDt8C', 'Администратор', 0, 0, 1, NULL, '2021-12-23 10:39:49', '2021-12-23 10:39:49'),
(15, 'Ким', 'xottab4@list.ru', NULL, '$2y$10$EyEKU1VBJ/TZaGyA8CcWeOIDJCsn8v186O3QtDFiLxxJbWRRO4wFG', 'Оператор', 1, 0, 0, NULL, '2021-12-23 10:46:40', '2021-12-23 10:46:40');

-- --------------------------------------------------------

--
-- Структура таблицы `user_contracts`
--

CREATE TABLE `user_contracts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `contract_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_approved` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `user_contracts`
--

INSERT INTO `user_contracts` (`id`, `contract_id`, `user_id`, `user_approved`) VALUES
(1, 1, 7, 0),
(2, 1, 4, 1),
(3, 1, 2, 0),
(4, 2, 8, 0),
(11, 5, 7, 0),
(12, 5, 4, 0),
(13, 5, 2, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `user_institutions`
--

CREATE TABLE `user_institutions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `institution_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `user_institutions`
--

INSERT INTO `user_institutions` (`id`, `institution_id`, `user_id`) VALUES
(1, 1, 7),
(2, 1, 4),
(3, 1, 2),
(5, 2, 8);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `bases`
--
ALTER TABLE `bases`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bases_name_unique` (`name`);

--
-- Индексы таблицы `contractors`
--
ALTER TABLE `contractors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `contractors_name_unique` (`name`);

--
-- Индексы таблицы `contracts`
--
ALTER TABLE `contracts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `contract_types`
--
ALTER TABLE `contract_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `contract_types_name_unique` (`name`);

--
-- Индексы таблицы `executors`
--
ALTER TABLE `executors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `executors_name_unique` (`name`);

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Индексы таблицы `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `files_contract_id_foreign` (`contract_id`);

--
-- Индексы таблицы `finances`
--
ALTER TABLE `finances`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `finances_name_unique` (`name`);

--
-- Индексы таблицы `institutions`
--
ALTER TABLE `institutions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `institutions_name_unique` (`name`);

--
-- Индексы таблицы `kosgus`
--
ALTER TABLE `kosgus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kosgus_name_unique` (`name`);

--
-- Индексы таблицы `kosgu_contracts`
--
ALTER TABLE `kosgu_contracts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kosgu_contracts_contract_id_foreign` (`contract_id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Индексы таблицы `remarks`
--
ALTER TABLE `remarks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `remarks_contract_id_foreign` (`contract_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Индексы таблицы `user_contracts`
--
ALTER TABLE `user_contracts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_contracts_contract_id_foreign` (`contract_id`),
  ADD KEY `user_contracts_user_id_foreign` (`user_id`);

--
-- Индексы таблицы `user_institutions`
--
ALTER TABLE `user_institutions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_institutions_institution_id_foreign` (`institution_id`),
  ADD KEY `user_institutions_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `bases`
--
ALTER TABLE `bases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `contractors`
--
ALTER TABLE `contractors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `contracts`
--
ALTER TABLE `contracts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `contract_types`
--
ALTER TABLE `contract_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `executors`
--
ALTER TABLE `executors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `files`
--
ALTER TABLE `files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `finances`
--
ALTER TABLE `finances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `institutions`
--
ALTER TABLE `institutions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `kosgus`
--
ALTER TABLE `kosgus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `kosgu_contracts`
--
ALTER TABLE `kosgu_contracts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT для таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `remarks`
--
ALTER TABLE `remarks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `user_contracts`
--
ALTER TABLE `user_contracts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `user_institutions`
--
ALTER TABLE `user_institutions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `files`
--
ALTER TABLE `files`
  ADD CONSTRAINT `files_contract_id_foreign` FOREIGN KEY (`contract_id`) REFERENCES `contracts` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `kosgu_contracts`
--
ALTER TABLE `kosgu_contracts`
  ADD CONSTRAINT `kosgu_contracts_contract_id_foreign` FOREIGN KEY (`contract_id`) REFERENCES `contracts` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `remarks`
--
ALTER TABLE `remarks`
  ADD CONSTRAINT `remarks_contract_id_foreign` FOREIGN KEY (`contract_id`) REFERENCES `contracts` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user_contracts`
--
ALTER TABLE `user_contracts`
  ADD CONSTRAINT `user_contracts_contract_id_foreign` FOREIGN KEY (`contract_id`) REFERENCES `contracts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_contracts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user_institutions`
--
ALTER TABLE `user_institutions`
  ADD CONSTRAINT `user_institutions_institution_id_foreign` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_institutions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
