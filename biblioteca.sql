-- MySQL dump 10.13  Distrib 8.0.21, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: biblioteca
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `Contem`
--

DROP TABLE IF EXISTS `Contem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Contem` (
  `codigoL` int DEFAULT NULL,
  `Qtd_pedido` int NOT NULL,
  `valor_itens_pedidos` float NOT NULL,
  UNIQUE KEY `CodigoL` (`codigoL`),
  CONSTRAINT `FK_LIV` FOREIGN KEY (`codigoL`) REFERENCES `Livro` (`codigoL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Editora`
--

DROP TABLE IF EXISTS `Editora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Editora` (
  `codigoE` int NOT NULL AUTO_INCREMENT,
  `telefone` varchar(100) DEFAULT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `e_mail` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`codigoE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Estoque`
--

DROP TABLE IF EXISTS `Estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Estoque` (
  `codigoL` int DEFAULT NULL,
  `qtd_estoque` int DEFAULT NULL,
  UNIQUE KEY `codigoL` (`codigoL`),
  CONSTRAINT `FK_LIV_` FOREIGN KEY (`codigoL`) REFERENCES `Livro` (`codigoL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Livro`
--

DROP TABLE IF EXISTS `Livro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Livro` (
  `codigoE` int NOT NULL,
  `Ano` date NOT NULL,
  `valor` float NOT NULL,
  `editora` varchar(100) NOT NULL,
  `Autor` varchar(100) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `categoria` varchar(100) NOT NULL,
  `codigoL` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`codigoL`),
  KEY `FK_E` (`codigoE`),
  CONSTRAINT `FK_E` FOREIGN KEY (`codigoE`) REFERENCES `Editora` (`codigoE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Pedido`
--

DROP TABLE IF EXISTS `Pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pedido` (
  `num_pedido` int NOT NULL AUTO_INCREMENT,
  `codigoC` int NOT NULL,
  `Dia` date DEFAULT NULL,
  `valor_pedido` float DEFAULT NULL,
  PRIMARY KEY (`num_pedido`),
  UNIQUE KEY `codigoC` (`codigoC`),
  CONSTRAINT `FK_CLI_P` FOREIGN KEY (`codigoC`) REFERENCES `cliente` (`codigoC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `codigoC` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `telefone` char(11) DEFAULT NULL,
  `e_mail` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`codigoC`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco` (
  `codigoC` int NOT NULL,
  `rua` varchar(100) NOT NULL,
  `bairro` varchar(100) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `complemento` varchar(100) DEFAULT NULL,
  `CEP` char(8) DEFAULT NULL,
  UNIQUE KEY `codigoC` (`codigoC`),
  CONSTRAINT `FK_CLI` FOREIGN KEY (`codigoC`) REFERENCES `cliente` (`codigoC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pFisica`
--

DROP TABLE IF EXISTS `pFisica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pFisica` (
  `codigoC` int DEFAULT NULL,
  `RG` char(9) DEFAULT NULL,
  `CPF` char(11) DEFAULT NULL,
  UNIQUE KEY `codigoC` (`codigoC`),
  CONSTRAINT `FK_CLI_F` FOREIGN KEY (`codigoC`) REFERENCES `cliente` (`codigoC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pJuridica`
--

DROP TABLE IF EXISTS `pJuridica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pJuridica` (
  `codigoC` int DEFAULT NULL,
  `IE` char(12) DEFAULT NULL,
  `CNPJ` char(14) DEFAULT NULL,
  UNIQUE KEY `codigoC` (`codigoC`),
  CONSTRAINT `FK_CLI_J` FOREIGN KEY (`codigoC`) REFERENCES `cliente` (`codigoC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-26 11:17:35
