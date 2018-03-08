-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 08, 2018 at 10:23 PM
-- Server version: 5.7.17
-- PHP Version: 5.5.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `feature_request`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add content type', 4, 'add_contenttype'),
(11, 'Can change content type', 4, 'change_contenttype'),
(12, 'Can delete content type', 4, 'delete_contenttype'),
(13, 'Can add session', 5, 'add_session'),
(14, 'Can change session', 5, 'change_session'),
(15, 'Can delete session', 5, 'delete_session'),
(16, 'Can add employee department', 6, 'add_employeedepartment'),
(17, 'Can change employee department', 6, 'change_employeedepartment'),
(18, 'Can delete employee department', 6, 'delete_employeedepartment'),
(19, 'Can add employee', 7, 'add_employee'),
(20, 'Can change employee', 7, 'change_employee'),
(21, 'Can delete employee', 7, 'delete_employee'),
(22, 'Can add custom user', 8, 'add_customuser'),
(23, 'Can change custom user', 8, 'change_customuser'),
(24, 'Can delete custom user', 8, 'delete_customuser'),
(25, 'Can add product', 9, 'add_product'),
(26, 'Can change product', 9, 'change_product'),
(27, 'Can delete product', 9, 'delete_product'),
(28, 'Can add client', 10, 'add_client'),
(29, 'Can change client', 10, 'change_client'),
(30, 'Can delete client', 10, 'delete_client'),
(31, 'Can add feature', 11, 'add_feature'),
(32, 'Can change feature', 11, 'change_feature'),
(33, 'Can delete feature', 11, 'delete_feature');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(10, 'feature_request', 'client'),
(11, 'feature_request', 'feature'),
(9, 'feature_request', 'product'),
(5, 'sessions', 'session'),
(8, 'users', 'customuser'),
(7, 'users', 'employee'),
(6, 'users', 'employeedepartment');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'users', '0001_initial', '2018-03-04 23:18:25.531129'),
(2, 'contenttypes', '0001_initial', '2018-03-04 23:18:26.003328'),
(3, 'admin', '0001_initial', '2018-03-04 23:18:26.636445'),
(4, 'admin', '0002_logentry_remove_auto_add', '2018-03-04 23:18:26.970748'),
(5, 'contenttypes', '0002_remove_content_type_name', '2018-03-04 23:18:27.358065'),
(6, 'auth', '0001_initial', '2018-03-04 23:18:28.929401'),
(7, 'auth', '0002_alter_permission_name_max_length', '2018-03-04 23:18:29.127720'),
(8, 'auth', '0003_alter_user_email_max_length', '2018-03-04 23:18:29.149279'),
(9, 'auth', '0004_alter_user_username_opts', '2018-03-04 23:18:29.176679'),
(10, 'auth', '0005_alter_user_last_login_null', '2018-03-04 23:18:29.202791'),
(11, 'auth', '0006_require_contenttypes_0002', '2018-03-04 23:18:29.206883'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2018-03-04 23:18:29.262243'),
(13, 'auth', '0008_alter_user_username_max_length', '2018-03-04 23:18:29.285360'),
(14, 'feature_request', '0001_initial', '2018-03-04 23:18:30.658697'),
(15, 'sessions', '0001_initial', '2018-03-04 23:18:31.050383');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('kv89wyggi2n803k2jab9ecvnxj4nfa3c', 'YzRkNzJjMDY0NmRjMjJjMDM0OTRiZDJlY2QyMzg4ZWM4Y2NjZWZlZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImQ5NWJjNDRlMWRlZjQ4MTZiNDFkNTkzZjY2N2U4N2FjZGMyYjY1ODQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-03-22 20:52:28.575809');

-- --------------------------------------------------------

--
-- Table structure for table `feature_request_client`
--

CREATE TABLE `feature_request_client` (
  `id` int(11) NOT NULL,
  `name` varchar(75) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feature_request_client`
--

INSERT INTO `feature_request_client` (`id`, `name`) VALUES
(1, 'Client A'),
(2, 'Client B'),
(3, 'Client C');

-- --------------------------------------------------------

--
-- Table structure for table `feature_request_feature`
--

CREATE TABLE `feature_request_feature` (
  `id` int(11) NOT NULL,
  `title` varchar(75) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `target_date` datetime(6) NOT NULL,
  `priority` smallint(5) UNSIGNED NOT NULL,
  `client_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feature_request_feature`
--

INSERT INTO `feature_request_feature` (`id`, `title`, `description`, `target_date`, `priority`, `client_id`, `product_id`) VALUES
(1, 'Add Bill Description', 'Add User Roles and Permissions', '2018-03-31 00:00:00.000000', 1, 1, 1),
(2, 'Add Claim Email', 'Add Claim Email', '2018-03-31 00:00:00.000000', 2, 1, 2),
(3, 'Add Report Metrics', 'Add Report Metrics', '2018-03-31 00:00:00.000000', 3, 2, 3),
(4, 'Define Policies', 'Define Policies', '2018-03-31 00:00:00.000000', 4, 3, 4);

-- --------------------------------------------------------

--
-- Table structure for table `feature_request_product`
--

CREATE TABLE `feature_request_product` (
  `id` int(11) NOT NULL,
  `name` varchar(75) NOT NULL,
  `is_enabled` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feature_request_product`
--

INSERT INTO `feature_request_product` (`id`, `name`, `is_enabled`) VALUES
(1, 'Bill', 1),
(2, 'Claim', 1),
(3, 'Report', 1),
(4, 'Policy', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users_customuser`
--

CREATE TABLE `users_customuser` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `first_name` varchar(75) DEFAULT NULL,
  `last_name` varchar(75) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `contact_number` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users_employee`
--

CREATE TABLE `users_employee` (
  `id` int(11) NOT NULL,
  `employee_code` varchar(25) NOT NULL,
  `joining_date` date NOT NULL,
  `department_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users_employeedepartment`
--

CREATE TABLE `users_employeedepartment` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `d_code` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_employeedepartment`
--

INSERT INTO `users_employeedepartment` (`id`, `name`, `description`, `d_code`) VALUES
(1, 'Information Technology', 'Information Technology', 'IT'),
(2, 'Sales & Marketing', 'Sales & Marketing', 'SM'),
(3, 'Consulting', 'Consulting', 'CD'),
(4, 'Actuarial services', 'Actuarial services', 'AS'),
(5, 'Finance & Accounting', 'Finance & Accounting', 'FA'),
(6, 'Research & Development', 'Research & Development', 'RD');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_users_customuser_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `feature_request_client`
--
ALTER TABLE `feature_request_client`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feature_request_feature`
--
ALTER TABLE `feature_request_feature`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `feature_request_feature_client_id_priority_12d7ee02_uniq` (`client_id`,`priority`),
  ADD KEY `feature_request_feat_product_id_c25f2c5f_fk_feature_r` (`product_id`);

--
-- Indexes for table `feature_request_product`
--
ALTER TABLE `feature_request_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_customuser`
--
ALTER TABLE `users_customuser`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `users_employee`
--
ALTER TABLE `users_employee`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employee_code` (`employee_code`),
  ADD KEY `users_employee_department_id_518bb83e_fk_users_emp` (`department_id`),
  ADD KEY `users_employee_user_id_6131bb7a_fk_users_customuser_id` (`user_id`);

--
-- Indexes for table `users_employeedepartment`
--
ALTER TABLE `users_employeedepartment`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_employeedepartment_name_d_code_caeca18d_uniq` (`name`,`d_code`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `feature_request_client`
--
ALTER TABLE `feature_request_client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `feature_request_feature`
--
ALTER TABLE `feature_request_feature`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `feature_request_product`
--
ALTER TABLE `feature_request_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `users_customuser`
--
ALTER TABLE `users_customuser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users_employee`
--
ALTER TABLE `users_employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users_employeedepartment`
--
ALTER TABLE `users_employeedepartment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `users_customuser` (`id`);

--
-- Constraints for table `feature_request_feature`
--
ALTER TABLE `feature_request_feature`
  ADD CONSTRAINT `feature_request_feat_client_id_2f7e647d_fk_feature_r` FOREIGN KEY (`client_id`) REFERENCES `feature_request_client` (`id`),
  ADD CONSTRAINT `feature_request_feat_product_id_c25f2c5f_fk_feature_r` FOREIGN KEY (`product_id`) REFERENCES `feature_request_product` (`id`);

--
-- Constraints for table `users_employee`
--
ALTER TABLE `users_employee`
  ADD CONSTRAINT `users_employee_department_id_518bb83e_fk_users_emp` FOREIGN KEY (`department_id`) REFERENCES `users_employeedepartment` (`id`),
  ADD CONSTRAINT `users_employee_user_id_6131bb7a_fk_users_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `users_customuser` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
