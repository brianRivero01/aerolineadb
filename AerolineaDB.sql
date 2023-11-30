-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: aeropuerto
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.18-MariaDB

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

DROP TABLE IF EXISTS `avion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `avion` (
  `idAvion` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(45) DEFAULT NULL,
  `matricula` varchar(45) DEFAULT NULL,
  `modelo` varchar(45) DEFAULT NULL,
  `capacidad` int(11) DEFAULT NULL,
  `Compania_idCompania` int(11) NOT NULL,
  PRIMARY KEY (`idAvion`,`Compania_idCompania`),
  KEY `fk_Avion_Compañia1_idx` (`Compania_idCompania`),
  CONSTRAINT `fk_Avion_Compañia1` FOREIGN KEY (`Compania_idCompania`) REFERENCES `compania` (`idCompania`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avion`
--

LOCK TABLES `avion` WRITE;
/*!40000 ALTER TABLE `avion` DISABLE KEYS */;
INSERT INTO `avion` VALUES (1,'Comercial','ABC123','Boeing 737',150,1),(2,'Comercial','XYZ789','Airbus A320',200,2),(3,'Privado','PQR456','Cessna Citation',8,3),(4,'Comercial','DEF456','Boeing 777',300,4),(5,'Privado','GHI789','Gulfstream G650',10,5);
/*!40000 ALTER TABLE `avion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compania`
--

DROP TABLE IF EXISTS `compania`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compania` (
  `idCompania` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCompania`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compania`
--

LOCK TABLES `compania` WRITE;
/*!40000 ALTER TABLE `compania` DISABLE KEYS */;
INSERT INTO `compania` VALUES (1,'Airline One','123 Main St','123-456-7890','info@airlineone.com'),(2,'SkyJet Airlines','456 Elm St','987-654-3210','contact@skyjet.com'),(3,'Wings International','789 Oak St','555-123-4567','support@wingsintl.com'),(4,'FlyHigh Airways','321 Maple St','888-555-1234','info@flyhigh.com'),(5,'AeroWorld','567 Pine St','777-888-9999','info@aeroworld.com');
/*!40000 ALTER TABLE `compania` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `destinos`
--

DROP TABLE IF EXISTS `destinos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `destinos` (
  `idDestinos` int(11) NOT NULL AUTO_INCREMENT,
  `pais` varchar(45) DEFAULT NULL,
  `ciudad` varchar(45) DEFAULT NULL,
  `duracion` time DEFAULT NULL,
  `sale_desde` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idDestinos`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `destinos`
--

LOCK TABLES `destinos` WRITE;
/*!40000 ALTER TABLE `destinos` DISABLE KEYS */;
INSERT INTO `destinos` VALUES (1,'Estados Unidos','Los Angeles','08:30:00','Lima'),(2,'Francia','París','10:15:00','Ciudad de Mexico'),(3,'Japón','Tokio','12:45:00','Madrid'),(4,'España','Barcelona','09:00:00','Buenos Aires'),(5,'Australia','Sídney','14:20:00','Buenos Aires');
/*!40000 ALTER TABLE `destinos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturas`
--

DROP TABLE IF EXISTS `facturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturas` (
  `idFacturas` int(11) NOT NULL AUTO_INCREMENT,
  `nro` int(11) DEFAULT NULL,
  `fecha_emision` date DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idFacturas`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturas`
--

LOCK TABLES `facturas` WRITE;
/*!40000 ALTER TABLE `facturas` DISABLE KEYS */;
INSERT INTO `facturas` VALUES (1,1001,'2023-05-15',1250.75,'Pagada'),(2,1002,'2023-05-16',2180.50,'Pendiente'),(3,1003,'2023-05-17',1300.00,'Pagada'),(4,1004,'2023-05-18',2150.25,'Pagada'),(5,1005,'2023-05-19',2210.00,'Pendiente');
/*!40000 ALTER TABLE `facturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `origen`
--

DROP TABLE IF EXISTS `origen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `origen` (
  `idOrigen` int(11) NOT NULL AUTO_INCREMENT,
  `pais` varchar(45) DEFAULT NULL,
  `provincia` varchar(45) DEFAULT NULL,
  `localidad` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idOrigen`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `origen`
--

LOCK TABLES `origen` WRITE;
/*!40000 ALTER TABLE `origen` DISABLE KEYS */;
INSERT INTO `origen` VALUES (1,'Argentina','Buenos Aires','CABA','Av. Corrientes 123'),(2,'España','Madrid','Madrid','Calle Gran Vía 456'),(3,'Estados Unidos','California','Los Angeles','Sunset Blvd 789'),(4,'Francia','París','París','Rue de Rivoli 101'),(5,'Italia','Roma','Roma','Via del Corso 234');
/*!40000 ALTER TABLE `origen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pasajeros`
--

DROP TABLE IF EXISTS `pasajeros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pasajeros` (
  `idPasajeros` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `dni` varchar(45) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `Origen_idOrigen` int(11) NOT NULL,
  `Tipos_idTipos` int(11) NOT NULL,
  PRIMARY KEY (`idPasajeros`,`Origen_idOrigen`,`Tipos_idTipos`),
  KEY `fk_Pasajeros_Origen1_idx` (`Origen_idOrigen`),
  KEY `fk_Pasajeros_Tipos1_idx` (`Tipos_idTipos`),
  CONSTRAINT `fk_Pasajeros_Origen1` FOREIGN KEY (`Origen_idOrigen`) REFERENCES `origen` (`idOrigen`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pasajeros_Tipos1` FOREIGN KEY (`Tipos_idTipos`) REFERENCES `tipos` (`idTipos`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pasajeros`
--

LOCK TABLES `pasajeros` WRITE;
/*!40000 ALTER TABLE `pasajeros` DISABLE KEYS */;
INSERT INTO `pasajeros` VALUES (1,'Juan','Pérez','12345678','juan@example.com','123456789',1,1),(2,'María','González','23456789','maria@example.com','987654321',2,2),(3,'Carlos','Rodríguez','34567890','carlos@example.com','456789123',3,1),(4,'Laura','Martínez','45678901','laura@example.com','789123456',4,3),(5,'Pedro','López','56789012','pedro@example.com','321654987',5,2);
/*!40000 ALTER TABLE `pasajeros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pasajeros_has_vuelos`
--

DROP TABLE IF EXISTS `pasajeros_has_vuelos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pasajeros_has_vuelos` (
  `Pasajeros_idPasajeros` int(11) NOT NULL,
  `Vuelos_idVuelos` int(11) NOT NULL,
  PRIMARY KEY (`Pasajeros_idPasajeros`,`Vuelos_idVuelos`),
  KEY `fk_Pasajeros_has_Vuelos_Vuelos1_idx` (`Vuelos_idVuelos`),
  KEY `fk_Pasajeros_has_Vuelos_Pasajeros1_idx` (`Pasajeros_idPasajeros`),
  CONSTRAINT `fk_Pasajeros_has_Vuelos_Pasajeros1` FOREIGN KEY (`Pasajeros_idPasajeros`) REFERENCES `pasajeros` (`idPasajeros`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pasajeros_has_Vuelos_Vuelos1` FOREIGN KEY (`Vuelos_idVuelos`) REFERENCES `vuelos` (`idVuelos`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pasajeros_has_vuelos`
--

LOCK TABLES `pasajeros_has_vuelos` WRITE;
/*!40000 ALTER TABLE `pasajeros_has_vuelos` DISABLE KEYS */;
INSERT INTO `pasajeros_has_vuelos` VALUES (1,2),(2,1),(3,4),(4,3),(5,5);
/*!40000 ALTER TABLE `pasajeros_has_vuelos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pasajes`
--

DROP TABLE IF EXISTS `pasajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pasajes` (
  `idPasajes` int(11) NOT NULL AUTO_INCREMENT,
  `nro_asiento` varchar(45) DEFAULT NULL,
  `Pasajeros_idPasajeros` int(11) NOT NULL,
  `Pasajeros_Origen_idOrigen` int(11) NOT NULL,
  `Facturas_idFacturas` int(11) NOT NULL,
  `Planes_idPlanes` int(11) NOT NULL,
  PRIMARY KEY (`idPasajes`,`Pasajeros_idPasajeros`,`Pasajeros_Origen_idOrigen`,`Facturas_idFacturas`,`Planes_idPlanes`),
  KEY `fk_Pasajes_Pasajeros1_idx` (`Pasajeros_idPasajeros`,`Pasajeros_Origen_idOrigen`),
  KEY `fk_Pasajes_Facturas1_idx` (`Facturas_idFacturas`),
  KEY `fk_Pasajes_Planes1_idx` (`Planes_idPlanes`),
  CONSTRAINT `fk_Pasajes_Facturas1` FOREIGN KEY (`Facturas_idFacturas`) REFERENCES `facturas` (`idFacturas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pasajes_Pasajeros1` FOREIGN KEY (`Pasajeros_idPasajeros`, `Pasajeros_Origen_idOrigen`) REFERENCES `pasajeros` (`idPasajeros`, `Origen_idOrigen`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pasajes_Planes1` FOREIGN KEY (`Planes_idPlanes`) REFERENCES `planes` (`idPlanes`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pasajes`
--

LOCK TABLES `pasajes` WRITE;
/*!40000 ALTER TABLE `pasajes` DISABLE KEYS */;
INSERT INTO `pasajes` VALUES (6,'A01',1,1,1,1),(7,'B02',2,2,2,2),(8,'C03',3,3,3,3),(9,'D04',4,4,4,4),(10,'E05',5,5,5,5);
/*!40000 ALTER TABLE `pasajes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planes`
--

DROP TABLE IF EXISTS `planes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `planes` (
  `idPlanes` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `descuento` decimal(3,2) DEFAULT NULL,
  PRIMARY KEY (`idPlanes`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planes`
--

LOCK TABLES `planes` WRITE;
/*!40000 ALTER TABLE `planes` DISABLE KEYS */;
INSERT INTO `planes` VALUES (1,'Plan Básico','Descuento del 10% en pasajes para vuelos naci',0.10),(2,'Plan Premium','Descuento del 20% en pasajes para vuelos inte',0.20),(3,'Plan Familiar','Descuento del 15% en pasajes para grupos fami',0.15),(4,'Plan Fin de Semana','Descuento del 5% en pasajes para vuelos los f',0.30),(5,'Plan Último Minuto','Descuento del 30% en pasajes para vuelos de ú',0.30);
/*!40000 ALTER TABLE `planes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos`
--

DROP TABLE IF EXISTS `tipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos` (
  `idTipos` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_pasajero` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTipos`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos`
--

LOCK TABLES `tipos` WRITE;
/*!40000 ALTER TABLE `tipos` DISABLE KEYS */;
INSERT INTO `tipos` VALUES (1,'Ejecutivo'),(2,'Turista'),(3,'VIP'),(4,NULL),(5,NULL),(6,'VIP');
/*!40000 ALTER TABLE `tipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vuelos`
--

DROP TABLE IF EXISTS `vuelos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vuelos` (
  `idVuelos` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_salida` datetime DEFAULT NULL,
  `fecha_llegada` datetime DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `Avion_idAvion` int(11) NOT NULL,
  `Destinos_idDestinos` int(11) NOT NULL,
  PRIMARY KEY (`idVuelos`,`Avion_idAvion`,`Destinos_idDestinos`),
  KEY `fk_Vuelos_Avion_idx` (`Avion_idAvion`),
  KEY `fk_Vuelos_Destinos1_idx` (`Destinos_idDestinos`),
  CONSTRAINT `fk_Vuelos_Avion` FOREIGN KEY (`Avion_idAvion`) REFERENCES `avion` (`idAvion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vuelos_Destinos1` FOREIGN KEY (`Destinos_idDestinos`) REFERENCES `destinos` (`idDestinos`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vuelos`
--

LOCK TABLES `vuelos` WRITE;
/*!40000 ALTER TABLE `vuelos` DISABLE KEYS */;
INSERT INTO `vuelos` VALUES (1,'2023-05-15 08:00:00','2023-05-15 16:30:00','Programado',1,1),(2,'2023-05-16 12:00:00','2023-05-16 22:55:00','En curso',2,2),(3,'2023-05-17 15:30:00','2023-05-18 03:15:00','Finalizado',3,3),(4,'2023-05-18 09:00:00','2023-05-18 18:00:00','Programado',4,4),(5,'2023-05-19 14:00:00','2023-05-20 04:50:00','En curso',5,5);
/*!40000 ALTER TABLE `vuelos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-17 14:29:27
