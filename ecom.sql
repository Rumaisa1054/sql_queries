-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 14, 2025 at 10:33 PM
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
-- Database: `ecom`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id_cart` int(11) NOT NULL,
  `id_device` text NOT NULL,
  `id_product` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category_product`
--

CREATE TABLE `category_product` (
  `id_category` int(11) NOT NULL,
  `category` varchar(150) NOT NULL,
  `image` text NOT NULL,
  `status` enum('on','off') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category_product`
--

INSERT INTO `category_product` (`id_category`, `category`, `image`, `status`) VALUES
(1, 'Antibiotics', 'assets/icons/img_antibiotics.png', 'on'),
(2, 'Vitamins', 'assets/icons/img_vitamins.png', 'on'),
(3, 'Digestive', 'assets/icons/img_digestive.png', 'on'),
(4, 'Skin', 'assets/icons/img_skin.png', 'on'),
(5, 'Cough and Flu', 'assets/icons/img_cough_flu.png', 'on'),
(6, 'Fever', 'assets/icons/img_fever.png', 'on'),
(7, 'Antiseptics', 'assets/icons/img_antiseptics.png', 'on'),
(8, 'Covid-19 Info', 'assets/icons/img_covid.png', 'on');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id_orders` int(11) NOT NULL,
  `invoice` varchar(20) NOT NULL,
  `id_user` int(11) NOT NULL,
  `order_at` datetime NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id_orders` int(11) NOT NULL,
  `invoice` varchar(20) NOT NULL,
  `id_product` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id_product` int(11) NOT NULL,
  `id_category` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `image` text NOT NULL,
  `price` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--
DELETE FROM `product`;
INSERT INTO `product` (`id_product`, `id_category`, `name`, `description`, `image`, `price`, `status`, `created_at`) VALUES
(1, 1, 'AMOXSAN 500 MG 10 CAPSULES', 'AMOXSAN is an antibiotic containing Amoxicillin 500 mg. Amoxicillin is a penicillin derivative with broad-spectrum antibacterial activity. \r\nThis drug is bactericidal and effective against Gram-negative and Gram-positive bacteria such as Staphylococci, Streptococci, Enterococci, S. pneumoniae, N. gonorrhoeae, H. influenzae, E. coli, and P. mirabilis. \r\nUse this medication ONLY AS DIRECTED BY A DOCTOR.', 'https://d2qjkwm11akmwu.cloudfront.net/products/a4f4d159-2e8b-4f00-8ba4-605099e3d839_product_image_url.webp', 40000, 1, '2021-04-02 09:49:21'),
(2, 1, 'ZITROLIN 500 MG TABLET', 'ZITROLIN is a medication containing Azithromycin in the form of a film-coated tablet. Azithromycin is a macrolide antibiotic taken orally.\r\nIt works by binding to the 50S ribosomal subunit, disrupting bacterial protein synthesis. This drug is used to treat mild to moderate infections of the upper and lower respiratory tract, skin, soft tissue, and sexually transmitted diseases. \r\nUse this medication ONLY AS DIRECTED BY A DOCTOR.', 'https://d2qjkwm11akmwu.cloudfront.net/products/f9bf636d-22bb-4761-9448-9d436338ee5c_product_image_url.webp', 50000, 1, '2021-04-02 09:50:38'),
(3, 2, 'AMOXSAN DRY SYRUP 60 ML', 'AMOXSAN is an antibiotic containing 125 mg of Amoxicillin per 5 ml. Amoxicillin is a penicillin derivative with broad-spectrum antibacterial activity. \r\nThis drug is bactericidal and effective against Gram-negative and Gram-positive bacteria such as Staphylococci, Streptococci, Enterococci, S. pneumoniae, N. gonorrhoeae, H. influenzae, E. coli, and P. mirabilis. \r\nUse this medication ONLY AS DIRECTED BY A DOCTOR.', 'https://d2qjkwm11akmwu.cloudfront.net/products/cef941df-136a-41c7-b44a-449ba346da57_product_image_url.webp', 35000, 1, '2021-04-02 09:51:29'),
(4, 2, 'AMOXICILLIN 250 MG 10 CAPSULES', 'AMOXICILLIN is an antibiotic containing Amoxicillin as the active ingredient. It belongs to the beta-lactam class of antibiotics, derived from ampicillin. \r\nIt is used for upper respiratory tract infections, otitis media, acute and chronic bronchitis, pneumonia, cystitis, urethritis, pyelonephritis, asymptomatic bacteriuria in pregnancy, gonorrhea, skin and soft tissue infections. \r\nAmoxicillin has a similar spectrum to ampicillin, acting against both Gram-positive and Gram-negative bacteria. It binds to penicillin-binding proteins, inhibiting transpeptidation (cross-linking in bacterial cell wall synthesis), activating autolytic enzymes, and causing bacterial cell wall destruction. \r\nUse this medication ONLY AS DIRECTED BY A DOCTOR.', 'https://d2qjkwm11akmwu.cloudfront.net/products/2cdeb522-60e3-4ac7-b5f6-7a374ae52777_product_image_url.webp', 10000, 1, '2021-04-02 09:53:21'),
(5, 3, 'AMOXICILLIN SYRUP 125 MG/5 ML 60 ML', 'AMOXICILLIN SYRUP 125 MG/5 ML is a generic antibiotic, a penicillin derivative with broad-spectrum antibacterial activity. \r\nThis drug is bactericidal and effective against Gram-negative and Gram-positive bacteria such as Staphylococci, Streptococci, Enterococci, S. pneumoniae, N. gonorrhoeae, H. influenzae, E. coli, and P. mirabilis. \r\nUse this medication ONLY AS DIRECTED BY A DOCTOR.', 'https://d2qjkwm11akmwu.cloudfront.net/products/4c1bff61-da76-49cd-a1d8-513eb75db4e4_product_image_url.webp', 18000, 1, '2021-04-02 09:54:38'),
(6, 3, 'AZITHROMYCIN 500 MG 3 TABLETS', 'AZITHROMYCIN is a broad-spectrum antibiotic used to treat bacterial infections such as respiratory infections, skin infections, ear infections, and sexually transmitted diseases. \r\nIt works by inhibiting bacterial protein synthesis. \r\nUse this medication ONLY AS DIRECTED BY A DOCTOR.',
 'https://th.bing.com/th/id/OIP.sxd860YKg_t6_Jj6WIupMwHaGn?w=218&h=195&c=7&r=0&o=5&dpr=1.5&pid=1.7', 60000, 1, '2021-04-02 09:55:45'),
(7, 4, 'CEFADROXIL 500 MG 10 CAPSULES', 
'CEFADROXIL is an antibiotic belonging to the cephalosporin group used to treat bacterial infections such as skin infections, respiratory infections, urinary tract infections, and bone infections. \r\nIt works by inhibiting bacterial cell wall synthesis, leading to bacterial death. \r\nUse this medication ONLY AS DIRECTED BY A DOCTOR.',
 'https://th.bing.com/th/id/OIP.rBm05-fjZHgZt1eyvXgOdgHaHa?w=173&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7', 45000, 1, '2021-04-02 09:57:12'),
(8, 4, 'CIPROFLOXACIN 500 MG 10 TABLETS',
 'CIPROFLOXACIN is an antibiotic from the fluoroquinolone group used to treat infections such as urinary tract infections, gastrointestinal infections, respiratory infections, and bone infections. \r\nIt works by inhibiting bacterial DNA replication. \r\nUse this medication ONLY AS DIRECTED BY A DOCTOR.',
 'data:image/jpeg;base64,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',
 55000, 1, '2021-04-02 09:58:45'),
(9, 5, 'DOXYCYCLINE 100 MG 10 CAPSULES',
 'DOXYCYCLINE is a tetracycline-class antibiotic used to treat infections such as acne, respiratory infections, urinary tract infections, and sexually transmitted infections. \r\nIt works by inhibiting bacterial protein synthesis. \r\nUse this medication ONLY AS DIRECTED BY A DOCTOR.',
 'https://th.bing.com/th/id/OIP.iIuOowzTjWbaEl2hRx2rtwHaE7?rs=1&pid=ImgDetMain', 25000, 1, '2021-04-02 10:00:12'),
(10, 5, 'ERYTHROMYCIN 250 MG 10 TABLETS',
 'ERYTHROMYCIN is a macrolide antibiotic used to treat infections such as respiratory infections,
 skin infections, and sexually transmitted infections. \r\nIt works by inhibiting bacterial protein
 synthesis. \r\nUse this medication ONLY AS DIRECTED BY A DOCTOR.', 
 'https://th.bing.com/th/id/OIP.CaN_LzrK7dOXmbY69hjFXwHaFH?rs=1&pid=ImgDetMain',
 30000, 1,
 '2021-04-02 10:01:30');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `password` text NOT NULL,
  `created_at` datetime NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`,
 `name`,
 `email`, `phone`, `address`, `password`, `created_at`, `status`) VALUES
(1, 'Rumaisa Awan', 
'rumaisa@gmail.com', 
'085819980891', 
'JL G Raya No 34', 
'admin', 
'2021-04-04 00:30:27',
 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id_cart`);

--
-- Indexes for table `category_product`
--
ALTER TABLE `category_product`
  ADD PRIMARY KEY (`id_category`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id_orders`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id_orders`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id_product`),
  ADD KEY `id_category` (`id_category`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id_cart` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category_product`
--
ALTER TABLE `category_product`
  MODIFY `id_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id_orders` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id_orders` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `category_product` (`id_category`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

ALTER TABLE order_details
ADD CONSTRAINT fk_orderdetails_orders
FOREIGN KEY (id_orders)
REFERENCES orders(id_orders)
ON DELETE CASCADE;

ALTER TABLE orders
ADD CONSTRAINT fk_orders_user
FOREIGN KEY (id_user)
REFERENCES user(id_user)
ON DELETE CASCADE;

ALTER TABLE order_details
ADD CONSTRAINT fk_orderdetails_product
FOREIGN KEY (id_product)
REFERENCES product(id_product)
ON DELETE CASCADE;

ALTER TABLE cart
ADD CONSTRAINT fk_cart_product
FOREIGN KEY (id_product)
REFERENCES product(id_product)
ON DELETE CASCADE;
