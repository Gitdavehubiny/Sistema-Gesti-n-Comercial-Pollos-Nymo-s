-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: juego_lucha_online
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clanes`
--

DROP TABLE IF EXISTS `clanes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clanes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `lema` text DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clanes`
--

LOCK TABLES `clanes` WRITE;
/*!40000 ALTER TABLE `clanes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clanes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `combates`
--

DROP TABLE IF EXISTS `combates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `combates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jugador_1` int(11) DEFAULT NULL,
  `jugador_2` int(11) DEFAULT NULL,
  `ganador` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `duracion_segundos` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jugador_1` (`jugador_1`),
  KEY `jugador_2` (`jugador_2`),
  KEY `ganador` (`ganador`),
  CONSTRAINT `combates_ibfk_1` FOREIGN KEY (`jugador_1`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `combates_ibfk_2` FOREIGN KEY (`jugador_2`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `combates_ibfk_3` FOREIGN KEY (`ganador`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `combates`
--

LOCK TABLES `combates` WRITE;
/*!40000 ALTER TABLE `combates` DISABLE KEYS */;
/*!40000 ALTER TABLE `combates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) DEFAULT NULL,
  `nombre_item` varchar(50) DEFAULT NULL,
  `tipo_item` enum('arma','armadura','consumible') DEFAULT NULL,
  `cantidad` int(11) DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logros`
--

DROP TABLE IF EXISTS `logros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logros` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `dificultad` enum('baja','media','alta') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logros`
--

LOCK TABLES `logros` WRITE;
/*!40000 ALTER TABLE `logros` DISABLE KEYS */;
/*!40000 ALTER TABLE `logros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `misiones`
--

DROP TABLE IF EXISTS `misiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `misiones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `recompensa` int(11) DEFAULT NULL,
  `dificultad` enum('baja','media','alta') DEFAULT NULL,
  `estado` enum('activa','completada','fallida') DEFAULT 'activa',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `misiones`
--

LOCK TABLES `misiones` WRITE;
/*!40000 ALTER TABLE `misiones` DISABLE KEYS */;
/*!40000 ALTER TABLE `misiones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personajes`
--

DROP TABLE IF EXISTS `personajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personajes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `tipo` enum('agil','tanque','equilibrado') DEFAULT NULL,
  `fuerza` int(11) DEFAULT NULL,
  `velocidad` int(11) DEFAULT NULL,
  `defensa` int(11) DEFAULT NULL,
  `habilidad_especial` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personajes`
--

LOCK TABLES `personajes` WRITE;
/*!40000 ALTER TABLE `personajes` DISABLE KEYS */;
/*!40000 ALTER TABLE `personajes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_clan`
--

DROP TABLE IF EXISTS `usuario_clan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_clan` (
  `id_usuario` int(11) NOT NULL,
  `id_clan` int(11) NOT NULL,
  `rol_clan` enum('miembro','líder') DEFAULT 'miembro',
  `fecha_union` date DEFAULT NULL,
  PRIMARY KEY (`id_usuario`,`id_clan`),
  KEY `id_clan` (`id_clan`),
  CONSTRAINT `usuario_clan_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `usuario_clan_ibfk_2` FOREIGN KEY (`id_clan`) REFERENCES `clanes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_clan`
--

LOCK TABLES `usuario_clan` WRITE;
/*!40000 ALTER TABLE `usuario_clan` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_clan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_logro`
--

DROP TABLE IF EXISTS `usuario_logro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_logro` (
  `id_usuario` int(11) NOT NULL,
  `id_logro` int(11) NOT NULL,
  `fecha_desbloqueo` date DEFAULT NULL,
  PRIMARY KEY (`id_usuario`,`id_logro`),
  KEY `id_logro` (`id_logro`),
  CONSTRAINT `usuario_logro_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `usuario_logro_ibfk_2` FOREIGN KEY (`id_logro`) REFERENCES `logros` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_logro`
--

LOCK TABLES `usuario_logro` WRITE;
/*!40000 ALTER TABLE `usuario_logro` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_logro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `correo` varbinary(255) DEFAULT NULL,
  `contraseña` varbinary(255) DEFAULT NULL,
  `rol` enum('jugador','admin') DEFAULT 'jugador',
  `fecha_registro` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-27 18:16:11
