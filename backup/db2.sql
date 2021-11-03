-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Окт 01 2021 г., 09:21
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
-- Структура таблицы `commitments`
--

CREATE TABLE `commitments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `commitments`
--

INSERT INTO `commitments` (`id`, `name`) VALUES
(1, 'Остатки средств на начало года (МЗ)');

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
  `kosgu` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kosgu_amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commitments` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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

INSERT INTO `contracts` (`id`, `institution`, `type_contract`, `contract_basis`, `contract_date`, `number_contract`, `contractor`, `subject_contract`, `contract_amount`, `contract_term_1`, `contract_term_2`, `kosgu`, `kosgu_amount`, `commitments`, `event_title`, `responsible_executor`, `user_id`, `revision`, `approved`, `created_at`, `updated_at`) VALUES
(1, 'МБУ ММЦ \"Современник\"', 'Поставка товара', 'выбрать', '2120-05-04', '01152015015151', 'АО \"Почта России\"', 'поставка методик', '279000', '2020-02-15', '2020-12-05', '221', '45254', 'Остатки средств на начало года (МЗ)', 'остатки мз 2020', 'Горн М.В.', 1, 0, 0, '2021-09-29 12:58:06', '2021-09-29 12:58:06'),
(2, 'МБУ ММЦ \"Современник\"', 'Поставка товара', 'выбрать', '2455-05-04', '01152015015151', 'АО \"Почта России\"', 'поставка методик', '279000', '2020-05-04', '2202-02-20', '221', '452', 'Остатки средств на начало года (МЗ)', 'остатки мз 2020', 'Горн М.В.', 1, 0, 0, '2021-09-29 13:01:18', '2021-09-29 13:01:18'),
(3, 'МБУ ММЦ \"Современник\"', 'Поставка товара', 'Электронный аукцион', '2020-05-31', '0115201501515345', 'выбрать', '56435', '345634', '2020-05-31', '2020-06-05', '221', '279000', 'Остатки средств на начало года (МЗ)', 'остатки мз 2020', 'Горн М.В.', 1, 0, 0, '2021-09-29 13:55:47', '2021-09-29 13:55:47'),
(4, 'МБУ ММЦ \"Современник\"', 'Поставка товара', 'Электронный аукцион', '2020-05-31', '0115201501515345', 'выбрать', '56435', '345634', '2020-05-31', '2020-06-05', '221', '279000', 'Остатки средств на начало года (МЗ)', 'остатки мз 2020', 'Горн М.В.', 1, 0, 0, '2021-09-29 13:57:35', '2021-09-29 13:57:35'),
(5, 'МБУ ММЦ \"Современник\"', 'Поставка товара', 'Электронный аукцион', '2020-05-31', '0115201501515345', 'выбрать', '56435', '345634', '2020-05-31', '2020-06-05', '221', '279000', 'Остатки средств на начало года (МЗ)', 'остатки мз 2020', 'Горн М.В.', 1, 0, 0, '2021-09-29 13:59:40', '2021-09-29 13:59:40'),
(6, 'МБУ ММЦ \"Современник\"', 'Поставка товара', 'Электронный аукцион', '2020-05-04', NULL, 'АО \"Почта России\"', '56435', '279000', '2020-02-20', '2020-02-22', '221', NULL, 'Остатки средств на начало года (МЗ)', '1542452', 'Горн М.В.', 1, 0, 0, '2021-09-29 14:00:26', '2021-09-30 12:57:02'),
(7, 'МБУ ММЦ \"Современник\"', 'Поставка товара', 'Электронный аукцион', '2020-02-20', '45245', NULL, '20202', '2020', '2020-02-20', '2020-02-20', NULL, NULL, NULL, 'остатки мз 2020', NULL, 1, 1, 0, '2021-09-29 14:22:05', '2021-10-01 02:53:18'),
(8, 'МБУ ММЦ \"Современник\"', 'Поставка товара', 'Электронный аукцион', '2020-01-21', '0115201501515345', 'АО \"Почта России\"', '56435', '279000', '2020-02-20', '2020-02-20', '221', '2020', 'Остатки средств на начало года (МЗ)', 'остатки мз 2020', 'Горн М.В.', 1, 0, 0, '2021-09-29 14:32:53', '2021-09-29 14:32:53'),
(9, 'МБУ ММЦ \"Современник\"', 'Поставка товара', 'Электронный аукцион', '2020-01-21', '0115201501515345', 'АО \"Почта России\"', '56435', '279000', '2020-02-20', '2020-02-20', '221', '2020', 'Остатки средств на начало года (МЗ)', 'остатки мз 2020', 'Горн М.В.', 1, 0, 0, '2021-09-29 14:33:13', '2021-09-29 14:33:13'),
(10, 'МБУ ММЦ \"Современник\"', 'Поставка товара', 'Электронный аукцион', '4525-02-05', '0115201501515346', 'АО \"Почта России\"', '56435', '2020', '2020-02-05', '2020-12-22', '221', '543', 'Остатки средств на начало года (МЗ)', '453', 'Горн М.В.', 1, 0, 1, '2021-09-30 12:46:57', '2021-09-30 16:36:25');

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
(1, 9, 1, 'file1', 'public/uploads/file1_1632940394.doc'),
(2, 10, 1, 'file1', 'public/uploads/file1_1633024137.doc');

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
(1, '221');

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
(11, '2021_09_26_183408_create_commitments_table', 1),
(12, '2021_09_26_183425_create_executors_table', 1),
(13, '2021_09_26_184715_create_user_contracts_table', 1),
(14, '2021_09_29_085618_create_files_table', 1),
(15, '2021_09_29_085713_create_remarks_table', 1);

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
  `remark_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `remarks`
--

INSERT INTO `remarks` (`id`, `contract_id`, `user_id`, `remark_date`, `name`, `message`, `created_at`, `updated_at`) VALUES
(1, 10, 1, '2020-02-20', 'Роман И. И.', 'тест', '2021-09-30 13:42:02', '2021-09-30 13:42:02');

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
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `is_admin`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Роман И. И.', 'romantuze@gmail.com', NULL, '$2y$10$mGoU5iEOi/uBcwDQUBn4/OJDUe.sX41YaHcRgjZv57TTjEkVSMjge', '123456', 0, NULL, '2021-09-29 12:47:15', '2021-09-29 12:47:15');

-- --------------------------------------------------------

--
-- Структура таблицы `user_contracts`
--

CREATE TABLE `user_contracts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `contract_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `revision` tinyint(1) NOT NULL DEFAULT 0,
  `approved` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `user_contracts`
--

INSERT INTO `user_contracts` (`id`, `contract_id`, `user_id`, `revision`, `approved`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 0, 0, '2021-09-29 13:01:18', '2021-09-29 13:01:18'),
(2, 5, 1, 0, 0, '2021-09-29 13:59:40', '2021-09-29 13:59:40'),
(3, 6, 1, 0, 0, '2021-09-29 14:00:26', '2021-09-29 14:00:26'),
(4, 7, 1, 0, 0, '2021-09-29 14:22:06', '2021-09-29 14:22:06'),
(5, 9, 1, 0, 0, '2021-09-29 14:33:14', '2021-09-29 14:33:14'),
(6, 10, 1, 0, 0, '2021-09-30 12:46:57', '2021-09-30 12:46:57');

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
-- Индексы таблицы `commitments`
--
ALTER TABLE `commitments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `commitments_name_unique` (`name`);

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
-- AUTO_INCREMENT для таблицы `commitments`
--
ALTER TABLE `commitments`
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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `contract_types`
--
ALTER TABLE `contract_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `executors`
--
ALTER TABLE `executors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
-- AUTO_INCREMENT для таблицы `institutions`
--
ALTER TABLE `institutions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `kosgus`
--
ALTER TABLE `kosgus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
