-- phpMyAdmin SQL Dump
-- version 3.1.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 15, 2009 at 03:29 AM
-- Server version: 5.1.31
-- PHP Version: 5.2.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `spo_development`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE IF NOT EXISTS `admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 0, '2009-07-05 21:17:22', '2009-07-05 21:17:22'),
(2, 0, '2009-07-05 21:59:31', '2009-07-05 21:59:31'),
(3, 0, '2009-07-06 09:23:39', '2009-07-06 09:23:39'),
(4, 0, '2009-07-06 09:25:16', '2009-07-06 09:25:16');

-- --------------------------------------------------------

--
-- Table structure for table `attachments`
--

CREATE TABLE IF NOT EXISTS `attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) DEFAULT NULL,
  `file_file_name` varchar(255) DEFAULT NULL,
  `file_content_type` varchar(255) DEFAULT NULL,
  `file_file_size` int(11) DEFAULT NULL,
  `attachable_id` int(11) DEFAULT NULL,
  `attachable_type` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_attachments_on_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `attachments`
--


-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE IF NOT EXISTS `companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'abc', '2009-06-27 08:32:08', '2009-06-27 08:32:08'),
(2, 'sz', '2009-07-01 19:14:57', '2009-07-01 19:14:57'),
(3, 'abc', '2009-07-01 19:46:49', '2009-07-01 19:46:49'),
(4, 'abc', '2009-07-01 19:47:09', '2009-07-01 19:47:09'),
(5, 'abc', '2009-07-07 04:15:13', '2009-07-07 04:15:13');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE IF NOT EXISTS `departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `fullname`) VALUES
(1, 'AE', 'Aerospace Engineering'),
(2, 'BSBE', 'Biological Sciences and Bioengineering'),
(3, 'CE', 'Civil Engineering'),
(4, 'CHE', 'Chemical Engineering'),
(5, 'CSE', 'Computer Science and Engineering'),
(6, 'EE', 'Electrical Engineering'),
(7, 'IME', 'Industrial Management and Engineering'),
(8, 'MME', 'Materials and Metallurgical Engineering'),
(9, 'ME', 'Mechanical Engineering'),
(10, 'CHM', 'Chemistry'),
(11, 'ECO', 'Economics'),
(12, 'MSC', 'Mathematics and Scientific Computing'),
(13, 'MTH', 'Mathematics and Statistics'),
(14, 'PHY', 'Physics'),
(15, 'MDes', 'Master of Design'),
(16, 'EEM', 'Environmental Engineering and Management'),
(17, 'LT', 'Laser Technology'),
(18, 'MS', 'Materials Science'),
(19, 'NET', 'Nuclear Engineering Technology');

-- --------------------------------------------------------

--
-- Table structure for table `dept_progs`
--

CREATE TABLE IF NOT EXISTS `dept_progs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_prog` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `dept_progs`
--

INSERT INTO `dept_progs` (`id`, `dept_prog`) VALUES
(1, '--- !ruby/object:Pdc \nlist: \n- - 1\n  - 1\n- - 2\n  - 1\n- - 4\n  - 1\n- - 8\n  - 1\n- - 1\n  - 2\n- - 4\n  - 2\n- - 8\n  - 2\n- - 1\n  - 3\n- - 2\n  - 3\n- - 4\n  - 3\n- - 8\n  - 3\n- - 1\n  - 4\n- - 2\n  - 4\n- - 4\n  - 4\n- - 8\n  - 4\n- - 1\n  - 5\n- - 2\n  - 5\n- - 4\n  - 5\n- - 8\n  - 5\n- - 1\n  - 6\n- - 2\n  - 6\n- - 4\n  - 6\n- - 8\n  - 6\n- - 4\n  - 7\n- - 6\n  - 7\n- - 8\n  - 7\n- - 1\n  - 8\n- - 4\n  - 8\n- - 8\n  - 8\n- - 1\n  - 9\n- - 2\n  - 9\n- - 4\n  - 9\n- - 8\n  - 9\n- - 3\n  - 10\n- - 5\n  - 10\n- - 8\n  - 10\n- - 3\n  - 11\n- - 3\n  - 12\n- - 5\n  - 13\n- - 8\n  - 13\n- - 3\n  - 14\n- - 5\n  - 14\n- - 8\n  - 14\n- - 7\n  - 15\n- - 4\n  - 16\n- - 4\n  - 17\n- - 4\n  - 18\n- - 8\n  - 18\n- - 4\n  - 19\n- - 8\n  - 19\n');

-- --------------------------------------------------------

--
-- Table structure for table `dual_datas`
--

CREATE TABLE IF NOT EXISTS `dual_datas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `ug_cpi` float NOT NULL,
  `pg_cpi` float NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `dual_datas`
--


-- --------------------------------------------------------

--
-- Table structure for table `job_applications`
--

CREATE TABLE IF NOT EXISTS `job_applications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_opening_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `job_applications`
--


-- --------------------------------------------------------

--
-- Table structure for table `job_openings`
--

CREATE TABLE IF NOT EXISTS `job_openings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `nature` varchar(255) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `intern` tinyint(1) NOT NULL,
  `package_bt` varchar(255) DEFAULT NULL,
  `package_mt` varchar(255) DEFAULT NULL,
  `package_dual` varchar(255) DEFAULT NULL,
  `package_msci` varchar(255) DEFAULT NULL,
  `package_msc2` varchar(255) DEFAULT NULL,
  `package_mba` varchar(255) DEFAULT NULL,
  `package_mdes` varchar(255) DEFAULT NULL,
  `package_phd` varchar(255) DEFAULT NULL,
  `package_details` varchar(255) DEFAULT NULL,
  `bond` tinyint(1) NOT NULL,
  `bond_details` varchar(255) DEFAULT NULL,
  `medical_requirements` varchar(255) NOT NULL,
  `resume_shortlist` tinyint(1) NOT NULL,
  `resume_criteria` varchar(255) DEFAULT NULL,
  `aptitude` tinyint(1) NOT NULL,
  `gd` tinyint(1) NOT NULL,
  `tech_test` tinyint(1) NOT NULL,
  `tech_interview` tinyint(1) NOT NULL,
  `no_rounds` int(11) NOT NULL,
  `hr_interview` tinyint(1) NOT NULL,
  `contact_details1` varchar(1024) NOT NULL,
  `contact_details2` varchar(1024) DEFAULT NULL,
  `contact_details3` varchar(1024) DEFAULT NULL,
  `published` tinyint(1) NOT NULL,
  `application_deadline` datetime NOT NULL,
  `eligibility` varchar(1024) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `job_openings`
--

INSERT INTO `job_openings` (`id`, `company_id`, `nature`, `designation`, `description`, `intern`, `package_bt`, `package_mt`, `package_dual`, `package_msci`, `package_msc2`, `package_mba`, `package_mdes`, `package_phd`, `package_details`, `bond`, `bond_details`, `medical_requirements`, `resume_shortlist`, `resume_criteria`, `aptitude`, `gd`, `tech_test`, `tech_interview`, `no_rounds`, `hr_interview`, `contact_details1`, `contact_details2`, `contact_details3`, `published`, `application_deadline`, `eligibility`, `created_at`, `updated_at`) VALUES
(1, 4, 's', 'dsa', 'a', 1, '--- \n- asd\n- asd\n- asd\n', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ads', 1, 'as', 'ads', 1, 'xc', 1, 1, 1, 1, 1, 1, '--- !map:HashWithIndifferentAccess \n"''mobile''": qew\n"''telephone''": qwe\n"''designation''": qwe\n"''name''": weq\n"''city''": qew\n"''address''": wqe\n"''fax''": wqe\n"''email''": qwe\n"''pin''": qwe\n', NULL, NULL, 0, '2009-07-13 14:25:11', '--- !ruby/object:Pdc \nlist: \n- - 1\n  - 1\n', '2009-07-13 18:25:11', '2009-07-13 18:25:11');

-- --------------------------------------------------------

--
-- Table structure for table `notices`
--

CREATE TABLE IF NOT EXISTS `notices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `sent_to` varchar(1024) NOT NULL,
  `content` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `notices`
--

INSERT INTO `notices` (`id`, `title`, `attachment`, `sent_to`, `content`, `created_at`, `updated_at`) VALUES
(1, 'notice1', NULL, 'abc', 'test', '2009-07-08 19:18:18', '2009-07-08 19:18:18'),
(2, 'notice2', '2009fee.pdf', 'abcd', 'test2', '2009-07-08 19:18:39', '2009-07-08 19:18:39');

-- --------------------------------------------------------

--
-- Table structure for table `pg_datas`
--

CREATE TABLE IF NOT EXISTS `pg_datas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `ug_college` varchar(255) NOT NULL,
  `ug_performance` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `pg_datas`
--


-- --------------------------------------------------------

--
-- Table structure for table `phd_datas`
--

CREATE TABLE IF NOT EXISTS `phd_datas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `ug_college` varchar(255) DEFAULT NULL,
  `ug_performance` varchar(255) DEFAULT NULL,
  `pg_college` varchar(255) DEFAULT NULL,
  `pg_performance` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `phd_datas`
--


-- --------------------------------------------------------

--
-- Table structure for table `programs`
--

CREATE TABLE IF NOT EXISTS `programs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `programs`
--

INSERT INTO `programs` (`id`, `name`, `fullname`) VALUES
(1, 'btech', 'B.Tech'),
(2, 'dual', 'Dual Degree'),
(3, 'msci', 'Int. M.Sc (5 yr)'),
(4, 'mtech', 'M.Tech'),
(5, 'msc2', 'M.Sc (2 yr)'),
(6, 'mba', 'MBA'),
(7, 'mdes', 'M.Des'),
(8, 'phd', 'PhD');

-- --------------------------------------------------------

--
-- Table structure for table `schema_migrations`
--

CREATE TABLE IF NOT EXISTS `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schema_migrations`
--

INSERT INTO `schema_migrations` (`version`) VALUES
('20090618105756'),
('20090618105813'),
('20090618105825'),
('20090618110033'),
('20090618210522'),
('20090618210533'),
('20090618213549'),
('20090618230408'),
('20090618230424'),
('20090618230542'),
('20090619042531'),
('20090624172907'),
('20090624195958'),
('20090624203629'),
('20090711043412'),
('20090712000755');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE IF NOT EXISTS `students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department_id` int(11) NOT NULL,
  `program_id` int(11) NOT NULL,
  `roll_no` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `students`
--


-- --------------------------------------------------------

--
-- Table structure for table `student_datas`
--

CREATE TABLE IF NOT EXISTS `student_datas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `father_name` varchar(255) NOT NULL,
  `iitk_email` varchar(255) NOT NULL,
  `alternate_email` varchar(255) NOT NULL,
  `mobile_no` varchar(255) NOT NULL,
  `friend_mobile_no` varchar(255) NOT NULL,
  `residence_phone_no` varchar(255) NOT NULL,
  `iitk_hall` varchar(255) NOT NULL,
  `iitk_room_no` varchar(255) NOT NULL,
  `marks_10` varchar(255) NOT NULL,
  `board_10` varchar(255) NOT NULL,
  `year_10` varchar(255) NOT NULL,
  `dob` varchar(255) NOT NULL,
  `guide1_name` varchar(255) NOT NULL,
  `guide1_email` varchar(255) NOT NULL,
  `guide2_name` varchar(255) NOT NULL,
  `guide2_email` varchar(255) NOT NULL,
  `cpi` float DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `student_datas`
--


-- --------------------------------------------------------

--
-- Table structure for table `ug_datas`
--

CREATE TABLE IF NOT EXISTS `ug_datas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ug_datas`
--


-- --------------------------------------------------------

--
-- Table structure for table `userlogins`
--

CREATE TABLE IF NOT EXISTS `userlogins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(15) NOT NULL,
  `crypted_password` varchar(255) NOT NULL,
  `loginable_id` int(11) DEFAULT NULL,
  `loginable_type` varchar(255) DEFAULT NULL,
  `password_salt` varchar(40) NOT NULL,
  `persistence_token` varchar(255) NOT NULL,
  `last_request_at` datetime NOT NULL,
  `last_login_at` datetime NOT NULL,
  `last_login_ip` varchar(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `userlogins`
--

INSERT INTO `userlogins` (`id`, `login`, `crypted_password`, `loginable_id`, `loginable_type`, `password_salt`, `persistence_token`, `last_request_at`, `last_login_at`, `last_login_ip`) VALUES
(2, 'zxc', 'baeb5a380af77ffa614dcdb56dc9988631869dca65c6476745bfd82717cb5e602111c5dc85f1db275ca6ddbc91831ac8da65156e827131d737772ac86060271c', 2, 'Company', 'TP6GzFlsv74Hi4sC18_6', '608fa563036ad8ef1386e476896d0503cefa72e88cd38a7254a00ecd441ac0ab7b765c6c9cbd8ffeb5ed8be5176ed3f7ce64cb634cb8fa48ee1f01a767cd5d05', '2009-07-01 15:14:57', '2009-07-01 15:14:57', '127.0.0.1'),
(3, 'abc', '794fb9a8494162bff7d5a7209d5c48f1a9f6a3c14ac99a14a4c3be6f12baf67fae08fbbcdaff0f26935d999a699398a7a1555514086510545622999e87ca6fb0', 4, 'Company', 'gKRec9myiEFQ8dHi4KSg', '7a5935f61f08ad6afa37718c4cf1f19d334de07f4a4f4e3daf46f61c4919bb768d7f33310a303f751bec51bfaeec198482fab663f85a65941b3c58a5b56ee5e6', '2009-07-15 06:26:12', '2009-07-01 15:47:09', '127.0.0.1'),
(4, 'admin', '462e44ec47d651a91831708bd0c9f47961e8bb20522f5943bb27af18f87b46818034314856502e0271e3fa6ea868e0a0b6c06e05ae43add743c69a062222d37d', 1, 'Admin', 'lXwluPnIEJKiF5W24220', '6bb2cf6c14f2acfa9e8009a9d5a21f8d4fdc6a6f1f59820a31e6a836b37589d8deed63e7ad2ccc05a1e65bfa7e6dc3b49f02d0f2eaa53f648fb07d24926bd8db', '2009-07-12 03:57:56', '2009-07-05 17:17:22', '127.0.0.1'),
(5, 'admin2', '155cae923ec07f4976ef4bfac3177d474a0c678161bfafb2123ae3579d0e20788bb8bc95b888821c99fcf9ff7c04e459bca19b471e7875e4948f3167338dd754', 4, 'Admin', 'ZDeh2Vcwr0Jf21O130_Y', '101c7c95122ee68263d20798eaf055bf4ae5a165a640b3edb42c1f341eab99c30b9f9adc9a491543aebdfc6bfc57a3be8e44adf72e95f57dcad28cd022efc9b9', '2009-07-06 09:25:16', '2009-07-06 05:25:16', '127.0.0.1');

