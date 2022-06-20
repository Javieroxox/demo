-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-05-2022 a las 17:56:36
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dam020_productos`
--

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`cod_producto`, `nombre`, `precio`, `stock`, `deleted_at`) VALUES
('C00385', 'Cutting Edge: The Magic of Movie Editing, The', 31783, 3, '2022-05-25 15:52:57'),
('C00946', 'Army of Crime (L\'armée du crime)', 98297, 36, '2022-05-25 15:52:26'),
('C01049', 'For the Love of Movies', 10499, 21, '2022-05-25 15:52:08'),
('C01117', 'Very Harold & Kumar 3D Christmas, A', 86084, 49, NULL),
('C08939', 'Louisiana Story', 43771, 37, '2022-05-25 15:52:28'),
('C10761', 'See the Sea', 28901, 19, NULL),
('C14091', 'Laid To Rest', 40143, 22, '2022-05-25 15:54:28'),
('C14703', 'Seems Like Old Times', 9508, 29, NULL),
('C16940', 'Grand Prix', 92408, 17, NULL),
('C21880', 'Marriage of Maria Braun, The (Ehe der Maria Braun, Die)', 61881, 7, NULL),
('C24069', 'Restrepo', 47794, 31, NULL),
('C27307', 'Stalingrad', 64426, 25, NULL),
('C31727', 'Teddy Bear (10 timer til Paradis)', 59923, 44, NULL),
('C36378', 'Kanak Attack', 50219, 6, NULL),
('C40922', 'Happy, Texas', 54599, 46, NULL),
('C42429', 'Man for a Day', 56773, 12, NULL),
('C43031', 'Comin\' at Ya!', 59612, 0, NULL),
('C43078', 'Young Black Stallion, The', 91437, 28, NULL),
('C44449', 'Murder at the Gallop', 26437, 38, NULL),
('C46308', 'Backfire', 86887, 47, NULL),
('C47095', 'Mack, The', 5119, 23, NULL),
('C49114', 'Den tatuerade änkan (Tattooed Widow, The) ', 13449, 4, NULL),
('C50108', 'Street Fighter', 72396, 39, NULL),
('C52954', 'Twenty-Four Eyes (Nijûshi no hitomi)', 34237, 8, NULL),
('C53194', 'Intimidation', 59857, 29, NULL),
('C59871', 'Apache', 95872, 33, NULL),
('C61698', 'Flight Command', 83376, 25, NULL),
('C63930', 'Nina Takes a Lover', 23418, 21, NULL),
('C64167', 'Cannonball Run, The', 25526, 30, NULL),
('C65340', 'Conscientious Objector, The', 95251, 49, NULL),
('C66472', 'Mooz-lum', 85276, 14, NULL),
('C67385', 'Donnie Darko', 54139, 32, NULL),
('C67948', 'Road to Perdition', 3807, 44, NULL),
('C71591', 'Lakeboat', 11028, 20, NULL),
('C72845', 'Friends of Eddie Coyle, The', 12433, 4, NULL),
('C73189', 'My Dinner with André', 18218, 8, NULL),
('C76707', 'Avventura, L\' (Adventure, The)', 76460, 22, NULL),
('C76767', 'Safe', 62217, 38, NULL),
('C78202', 'Dangerous Liaisons', 78312, 10, NULL),
('C80906', 'Chef in Love, A (Shekvarebuli kulinaris ataserti retsepti)', 21225, 34, NULL),
('C84971', 'Hearts of the West', 39600, 11, NULL),
('C89828', 'Girl by the Lake, The (La ragazza del lago)', 57124, 45, NULL),
('C92304', 'Manslaughter (Drabet)', 24881, 22, NULL),
('C92526', 'Soldier\'s Tale, A', 34369, 21, NULL),
('C96676', 'Carcasses', 93227, 11, NULL),
('C98872', 'Wild at Heart', 32571, 50, NULL),
('C99020', 'Nemesis 3: Time Lapse', 61254, 5, NULL),
('C99161', 'Ghoulies', 33089, 34, NULL),
('C99168', 'When Trumpets Fade', 15782, 19, NULL),
('C99181', 'Assassination of Richard Nixon, The', 53754, 19, NULL),
('N00001', 'Multiverse of Madness', 35000, 10, NULL),
('N00002', 'Thor 4', 30000, 27, NULL),
('N00003', 'Aliens', 23000, 87, NULL),
('N00004', 'Aliens 3', 34000, 45, NULL),
('N00005', 'Thor 4', 30000, 27, NULL),
('N00006', 'wqewqe', 322321, 23, NULL),
('N0007', 'sdasd', 3221, 23, NULL),
('N0008', 'sdasd', 3221, 23, NULL),
('N0009', 'sdasd', 3221, 23, NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
