-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Окт 21 2021 г., 16:17
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
  `institution` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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

INSERT INTO `contracts` (`id`, `institution`, `type_contract`, `contract_basis`, `contract_date`, `number_contract`, `contractor`, `subject_contract`, `contract_amount`, `contract_term_1`, `contract_term_2`, `finance`, `event_title`, `responsible_executor`, `user_id`, `revision`, `approved`, `created_at`, `updated_at`) VALUES
(1, 'МБУ ММЦ \"Современник\"', 'Поставка товара', 'Электронный аукцион', '2020-02-20', '0115201501515345', 'АО \"Почта России\"', 'поставка методик', '12012012', '2020-02-20', '2020-02-20', 'источник 1,источник 2', 'остатки мз 2020', 'Горн М.В.', 2, 0, 0, '2021-10-08 11:54:09', '2021-10-08 11:54:09'),
(2, 'МБУ ММЦ \"Современник\"', 'Поставка товара', 'Электронный аукцион', '2020-02-20', '0115201501515345', 'АО \"Почта России\"', 'поставка методик', '12012012', '2020-02-20', '2020-02-20', 'источник 1,источник 2', 'остатки мз 2020', 'Горн М.В.', 2, 0, 1, '2021-10-08 12:00:35', '2021-10-12 14:12:46'),
(3, 'МБУ ММЦ \"Современник\"', 'Поставка товара', 'Электронный аукцион', '2020-02-20', '0115201501515345', 'АО \"Почта России\"', 'поставка методик', '12012012', '2020-02-20', '2020-02-20', 'источник 1,источник 2', 'остатки мз 2020', 'Горн М.В.', 2, 0, 0, '2021-10-08 12:01:58', '2021-10-08 12:01:58'),
(4, 'МБУ ММЦ \"Современник\"', 'Поставка товара', 'Электронный аукцион', '2020-02-20', '0115201501515345', 'АО \"Почта России\"', '45455454', '454545', '2020-02-20', '2020-02-20', 'источник 1', 'остатки мз 2020', 'Горн М.В.', 2, 0, 0, '2021-10-08 12:15:44', '2021-10-08 12:15:44'),
(5, 'МБУ ММЦ \"Современник\"', 'Поставка товара', 'Электронный аукцион', '2020-02-20', '1202', 'АО \"Почта России\"', '0120', '12012', '2020-02-20', '2020-02-20', 'источник 1', '452452', 'Горн М.В.', 1, 0, 0, '2021-10-11 06:56:47', '2021-10-11 06:56:47'),
(6, 'МБУ ММЦ \"Современник\"', 'Поставка товара', 'Электронный аукцион', '2020-02-20', '1202', 'АО \"Почта России\"', '0120', '12012', '2020-02-20', '2020-02-20', 'источник 1', '452452', 'Горн М.В.', 1, 0, 0, '2021-10-11 07:03:42', '2021-10-11 07:03:42'),
(7, 'МБУ ММЦ \"Современник\"', 'Поставка товара', 'Электронный аукцион', '2020-02-20', '1202', 'АО \"Почта России\"', '0120', '12012', '2020-02-20', '2020-02-20', 'источник 1', '452452', 'Горн М.В.', 1, 0, 0, '2021-10-11 07:04:37', '2021-10-11 07:04:37'),
(8, 'МБУ ММЦ \"Современник\"', 'Поставка товара', 'Электронный аукцион', '2020-02-20', '1202', 'АО \"Почта России\"', '0120', '12012', '2020-02-20', '2020-02-20', 'источник 1', '452452', 'Горн М.В.', 1, 0, 0, '2021-10-11 07:04:50', '2021-10-11 07:04:50'),
(9, 'МБУ ММЦ \"Современник\"', 'Поставка товара', 'Электронный аукцион', '2020-02-20', '1202', 'АО \"Почта России\"', '0120', '12012', '2020-02-20', '2020-02-20', 'источник 1', '452452', 'Горн М.В.', 1, 1, 0, '2021-10-11 07:05:47', '2021-10-13 15:07:43'),
(10, 'МБУ ММЦ \"Современник\"', 'Поставка товара', 'Электронный аукцион', '2020-02-20', '1202', 'АО \"Почта России\"', '0120', '12012', '2020-02-20', '2020-02-20', 'источник 1', '452452', 'Горн М.В.', 1, 1, 0, '2021-10-11 07:07:08', '2021-10-13 15:18:10'),
(11, 'МБУ ММЦ \"Современник\"', 'Поставка товара', 'Электронный аукцион', '2021-10-12', '452452', 'АО \"Почта России\"', '45245', '2452', '2020-02-21', '2020-02-20', 'источник 1', '452452', 'Горн М.В.', 1, 0, 1, '2021-10-12 14:16:29', '2021-10-12 15:25:18');

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
(2, 'Доставка товара'),
(1, 'Поставка товара');

-- --------------------------------------------------------

--
-- Структура таблицы `executors`
--

CREATE TABLE `executors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `executors`
--

INSERT INTO `executors` (`id`, `name`) VALUES
(1, 'Горн М.В.');

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

--
-- Дамп данных таблицы `files`
--

INSERT INTO `files` (`id`, `contract_id`, `user_id`, `name`, `url`) VALUES
(1, 2, 1, 'file1_1633024137', 'uploads/file1_1633024137_1633708835.doc'),
(2, 3, 1, 'file1_1632940394', 'uploads/file1_1632940394_1633708918.doc');

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
(1, 'источник 1'),
(2, 'источник 2'),
(3, 'источник 3');

-- --------------------------------------------------------

--
-- Структура таблицы `institutions`
--

CREATE TABLE `institutions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `institutions`
--

INSERT INTO `institutions` (`id`, `name`) VALUES
(2, 'МБУ ММЦ \"Современник 2\"'),
(1, 'МБУ ММЦ \"Современник\"');

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
(2, '222'),
(3, '223');

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
(1, 1, '221', '54545'),
(2, 1, '222', '56565'),
(3, 4, '221', '45245455'),
(4, 5, '221', '120'),
(5, 6, '221', '120'),
(6, 7, '221', '120'),
(7, 8, '221', '120'),
(8, 9, '221', '120'),
(9, 10, '221', '120'),
(10, 11, '222', '54245');

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
(16, '2021_10_07_180856_create_kosgu_contracts_table', 1);

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
(1, 9, 1, '2021-10-13', 'Михаилов Михаил Михаилович', 'нет согласующих', '2021-10-13 15:06:37', '2021-10-13 15:06:37');

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

-- --------------------------------------------------------

--
-- Структура таблицы `user_contracts`
--

CREATE TABLE `user_contracts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `contract_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_revision` tinyint(1) NOT NULL DEFAULT 0,
  `user_approved` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `user_contracts`
--

INSERT INTO `user_contracts` (`id`, `contract_id`, `user_id`, `user_revision`, `user_approved`) VALUES
(1, 10, 4, 0, 0),
(2, 11, 2, 0, 1),
(3, 11, 4, 0, 1),
(5, 10, 2, 0, 0),
(6, 9, 2, 0, 0);

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
  ADD KEY `user_contracts_contract_id_foreign` (`contract_id`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `contract_types`
--
ALTER TABLE `contract_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `executors`
--
ALTER TABLE `executors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `files`
--
ALTER TABLE `files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `finances`
--
ALTER TABLE `finances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `institutions`
--
ALTER TABLE `institutions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `kosgus`
--
ALTER TABLE `kosgus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `kosgu_contracts`
--
ALTER TABLE `kosgu_contracts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `user_contracts`
--
ALTER TABLE `user_contracts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
  ADD CONSTRAINT `user_contracts_contract_id_foreign` FOREIGN KEY (`contract_id`) REFERENCES `contracts` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
