CREATE DATABASE  IF NOT EXISTS `crossfit_box` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `crossfit_box`;
-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: crossfit_box
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `clases`
--

DROP TABLE IF EXISTS `clases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clases` (
  `id_clase` int NOT NULL AUTO_INCREMENT,
  `id_entrenador` int DEFAULT NULL,
  `id_wod` int DEFAULT NULL,
  `tipo_clase` varchar(50) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `cupo_maximo` int NOT NULL,
  PRIMARY KEY (`id_clase`),
  KEY `id_entrenador` (`id_entrenador`),
  KEY `id_wod` (`id_wod`),
  CONSTRAINT `clases_ibfk_1` FOREIGN KEY (`id_entrenador`) REFERENCES `entrenadores` (`id_entrenador`),
  CONSTRAINT `clases_ibfk_2` FOREIGN KEY (`id_wod`) REFERENCES `wods_detalle` (`id_wod`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clases`
--

LOCK TABLES `clases` WRITE;
/*!40000 ALTER TABLE `clases` DISABLE KEYS */;
INSERT INTO `clases` VALUES (1,1,1,'CrossFit','2024-04-01','08:00:00',15),(2,2,2,'CrossFit','2024-04-01','09:00:00',12),(3,3,3,'Funcional','2024-04-01','18:00:00',15),(4,4,4,'CrossFit','2024-04-02','19:00:00',14),(5,5,5,'Endurance','2024-04-02','07:00:00',12),(6,6,6,'CrossFit','2024-04-03','20:00:00',15),(7,1,7,'CrossFit','2024-04-03','08:00:00',15),(8,2,8,'Técnica','2024-04-04','09:00:00',10),(9,3,9,'Funcional','2024-04-04','18:00:00',15),(10,4,10,'CrossFit','2024-04-05','19:00:00',14);
/*!40000 ALTER TABLE `clases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_membresias`
--

DROP TABLE IF EXISTS `cliente_membresias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente_membresias` (
  `id_cliente_membresia` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `id_plan` int NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `estado` varchar(25) DEFAULT 'Activa',
  PRIMARY KEY (`id_cliente_membresia`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_plan` (`id_plan`),
  CONSTRAINT `cliente_membresias_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  CONSTRAINT `cliente_membresias_ibfk_2` FOREIGN KEY (`id_plan`) REFERENCES `planes_membresia` (`id_plan`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_membresias`
--

LOCK TABLES `cliente_membresias` WRITE;
/*!40000 ALTER TABLE `cliente_membresias` DISABLE KEYS */;
INSERT INTO `cliente_membresias` VALUES (1,1,1,'2025-01-01','2025-01-31','Finalizada'),(2,2,3,'2025-01-10','2025-02-09','Activa'),(3,3,2,'2025-01-05','2025-02-04','Activa'),(4,4,6,'2025-01-15','2025-02-14','Activa'),(5,5,5,'2024-11-01','2025-01-29','Finalizada'),(6,6,8,'2025-01-20','2025-02-19','Activa'),(7,7,4,'2024-12-01','2025-02-28','Activa'),(8,8,7,'2025-01-12','2025-02-11','Activa'),(9,9,9,'2025-01-01','2025-12-31','Activa'),(10,10,10,'2025-01-18','2025-02-17','Activa');
/*!40000 ALTER TABLE `cliente_membresias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) NOT NULL,
  `apellido` varchar(25) NOT NULL,
  `dni` varchar(25) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `telefono` int DEFAULT NULL,
  `fecha_registro` date NOT NULL,
  `estado` varchar(25) NOT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Juan','Pérez','30123456','1985-04-12',1123456789,'2024-01-10','Activo'),(2,'María','Gómez','28987654','1982-09-30',1134567890,'2024-01-15','Activo'),(3,'Carlos','Rodríguez','33456789','1990-06-21',1145678901,'2024-02-01','Inactivo'),(4,'Lucía','Fernández','35678901','1995-11-05',1156789012,'2024-02-10','Activo'),(5,'Martín','López','31234567','1988-03-18',1167890123,'2024-02-20','Activo'),(6,'Ana','Martínez','27890123','1979-07-25',1178901234,'2024-03-01','Inactivo'),(7,'Diego','Sánchez','34567890','1992-12-02',1189012345,'2024-03-05','Activo'),(8,'Paula','Romero','36789012','1997-08-14',1190123456,'2024-03-12','Activo'),(9,'Federico','Torres','29876543','1983-01-09',1101234567,'2024-03-20','Inactivo'),(10,'Valentina','Álvarez','38901234','2000-05-27',1112345678,'2024-04-01','Activo'),(11,'Santiago','Ruiz','32345678','1989-10-16',1123456790,'2024-04-05','Activo'),(12,'Camila','Morales','40123456','2001-02-11',1134567801,'2024-04-10','Activo'),(13,'Nicolás','Herrera','31456789','1987-06-03',1145678012,'2024-04-15','Inactivo'),(14,'Florencia','Castro','37654321','1994-09-19',1156789123,'2024-04-20','Activo'),(15,'Andrés','Silva','29123498','1981-12-28',1167890234,'2024-04-25','Activo');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrenador_cliente`
--

DROP TABLE IF EXISTS `entrenador_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrenador_cliente` (
  `id_entrenador` int NOT NULL,
  `id_cliente` int NOT NULL,
  PRIMARY KEY (`id_entrenador`,`id_cliente`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `entrenador_cliente_ibfk_1` FOREIGN KEY (`id_entrenador`) REFERENCES `entrenadores` (`id_entrenador`),
  CONSTRAINT `entrenador_cliente_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrenador_cliente`
--

LOCK TABLES `entrenador_cliente` WRITE;
/*!40000 ALTER TABLE `entrenador_cliente` DISABLE KEYS */;
INSERT INTO `entrenador_cliente` VALUES (1,1),(6,1),(1,2),(6,2),(2,4),(2,5),(3,7),(3,8),(4,9),(4,10),(5,11),(5,12);
/*!40000 ALTER TABLE `entrenador_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrenadores`
--

DROP TABLE IF EXISTS `entrenadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrenadores` (
  `id_entrenador` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) NOT NULL,
  `apellido` varchar(25) NOT NULL,
  `especialidad` varchar(50) DEFAULT NULL,
  `telefono` int DEFAULT NULL,
  `fecha_alta` date DEFAULT NULL,
  PRIMARY KEY (`id_entrenador`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrenadores`
--

LOCK TABLES `entrenadores` WRITE;
/*!40000 ALTER TABLE `entrenadores` DISABLE KEYS */;
INSERT INTO `entrenadores` VALUES (1,'Lucas','Méndez','CrossFit Nivel 2',1161234567,'2023-05-01'),(2,'Agustín','Navarro','Levantamiento Olímpico',1162345678,'2023-06-15'),(3,'Carolina','Ríos','Funcional y movilidad',1163456789,'2023-07-10'),(4,'Matías','Herrera','Gimnásticos',1164567890,'2023-08-01'),(5,'Florencia','Vega','Endurance',1165678901,'2023-09-12'),(6,'Nicolás','Peralta','CrossFit Nivel 1',1166789012,'2023-10-20');
/*!40000 ALTER TABLE `entrenadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscripciones`
--

DROP TABLE IF EXISTS `inscripciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inscripciones` (
  `id_inscripcion` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int DEFAULT NULL,
  `fecha_inscripcion` date DEFAULT NULL,
  PRIMARY KEY (`id_inscripcion`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `inscripciones_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscripciones`
--

LOCK TABLES `inscripciones` WRITE;
/*!40000 ALTER TABLE `inscripciones` DISABLE KEYS */;
INSERT INTO `inscripciones` VALUES (1,1,'2024-01-10'),(2,2,'2024-01-12'),(3,4,'2024-01-20'),(4,5,'2024-02-01'),(5,7,'2024-02-10'),(6,8,'2024-02-15'),(7,9,'2024-03-01'),(8,10,'2024-03-05'),(9,11,'2024-03-10'),(10,12,'2024-03-15');
/*!40000 ALTER TABLE `inscripciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagos`
--

DROP TABLE IF EXISTS `pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagos` (
  `id_pago` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int DEFAULT NULL,
  `id_plan` int DEFAULT NULL,
  `fecha_pago` date NOT NULL,
  `metodo_pago` varchar(25) NOT NULL,
  PRIMARY KEY (`id_pago`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_plan` (`id_plan`),
  CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  CONSTRAINT `pagos_ibfk_2` FOREIGN KEY (`id_plan`) REFERENCES `planes_membresia` (`id_plan`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos`
--

LOCK TABLES `pagos` WRITE;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
INSERT INTO `pagos` VALUES (1,1,1,'2025-01-01','Efectivo'),(2,2,3,'2025-01-10','Tarjeta'),(3,3,2,'2025-01-05','Transferencia'),(4,4,6,'2025-01-15','Tarjeta'),(5,5,5,'2024-11-01','Efectivo'),(6,6,8,'2025-01-20','Transferencia'),(7,7,4,'2024-12-01','Tarjeta'),(8,8,7,'2025-01-12','Efectivo'),(9,9,9,'2025-01-01','Transferencia'),(10,10,10,'2025-01-18','Tarjeta'),(11,3,2,'2026-01-25','Tarjeta'),(12,3,1,'2026-01-25','Tarjeta');
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planes_membresia`
--

DROP TABLE IF EXISTS `planes_membresia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `planes_membresia` (
  `id_plan` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` text,
  `precio` int NOT NULL,
  `duracion_dias` int NOT NULL,
  `limite_clases` int NOT NULL,
  PRIMARY KEY (`id_plan`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planes_membresia`
--

LOCK TABLES `planes_membresia` WRITE;
/*!40000 ALTER TABLE `planes_membresia` DISABLE KEYS */;
INSERT INTO `planes_membresia` VALUES (1,'Plan Básico','Acceso limitado a clases semanales',12000,30,8),(2,'Plan Standard','Clases regulares sin restricción horaria',18000,30,12),(3,'Plan Pro','Acceso completo a todas las clases',25000,30,0),(4,'Plan Trimestral Básico','Plan básico por 3 meses',32000,90,24),(5,'Plan Trimestral Pro','Plan pro por 3 meses',65000,90,0),(6,'Plan Estudiante','Plan con descuento para estudiantes',10000,30,8),(7,'Plan Mañana','Acceso solo en turno mañana',14000,30,10),(8,'Plan Fin de Semana','Clases solo sábados y domingos',9000,30,6),(9,'Plan Anual Pro','Acceso ilimitado por un año',220000,365,0),(10,'Plan Recovery','Clases suaves y movilidad',11000,30,6);
/*!40000 ALTER TABLE `planes_membresia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservas`
--

DROP TABLE IF EXISTS `reservas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservas` (
  `id_reserva` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int DEFAULT NULL,
  `id_clase` int DEFAULT NULL,
  `fecha_reserva` date DEFAULT NULL,
  `horario` time NOT NULL,
  PRIMARY KEY (`id_reserva`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_clase` (`id_clase`),
  CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  CONSTRAINT `reservas_ibfk_2` FOREIGN KEY (`id_clase`) REFERENCES `clases` (`id_clase`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservas`
--

LOCK TABLES `reservas` WRITE;
/*!40000 ALTER TABLE `reservas` DISABLE KEYS */;
INSERT INTO `reservas` VALUES (1,1,1,'2024-04-01','08:00:00'),(2,2,1,'2024-04-01','08:00:00'),(3,4,2,'2024-04-01','09:00:00'),(4,5,3,'2024-04-01','18:00:00'),(5,7,4,'2024-04-02','19:00:00'),(6,8,5,'2024-04-02','07:00:00'),(7,9,6,'2024-04-03','20:00:00'),(8,10,7,'2024-04-03','08:00:00'),(9,11,8,'2024-04-04','09:00:00'),(10,12,9,'2024-04-04','18:00:00'),(11,1,10,'2024-04-05','19:00:00'),(12,2,6,'2024-04-03','20:00:00'),(13,1,1,'2026-01-25','08:00:00');
/*!40000 ALTER TABLE `reservas` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_control_cupo_clase` BEFORE INSERT ON `reservas` FOR EACH ROW BEGIN 
	DECLARE cupo INT;
    DECLARE reservas_actuales INT;
    
    -- Para obtener el cupo máximo de la clase
    SELECT cupo_maximo
    INTO cupo
    FROM clases
    WHERE id_clase = NEW.id_clase;
    
    -- contar las reservas actuales para esa clase
    SELECT COUNT(*)
    INTO reservas_actuales
    FROM reservas
    WHERE id_clase = NEW.id_clase;
    
    -- para validar el cupo
    IF reservas_actuales >= cupo THEN
		SIGNAL SQLSTATE '45000'
        SET message_text = 'No se puede reservar: la clase ya alcanzó el cupo máximo';
        END IF;
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `v_clases_completas`
--

DROP TABLE IF EXISTS `v_clases_completas`;
/*!50001 DROP VIEW IF EXISTS `v_clases_completas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_clases_completas` AS SELECT 
 1 AS `id_clase`,
 1 AS `fecha`,
 1 AS `hora`,
 1 AS `tipo_clase`,
 1 AS `cupo_maximo`,
 1 AS `nombre_entrenador`,
 1 AS `apellido_entrenador`,
 1 AS `tipo_wod`,
 1 AS `duracion`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_clientes_membresias_activas`
--

DROP TABLE IF EXISTS `v_clientes_membresias_activas`;
/*!50001 DROP VIEW IF EXISTS `v_clientes_membresias_activas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_clientes_membresias_activas` AS SELECT 
 1 AS `id_cliente`,
 1 AS `nombre`,
 1 AS `apellido`,
 1 AS `nombre_membresia`,
 1 AS `precio`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_pagos_clientes`
--

DROP TABLE IF EXISTS `v_pagos_clientes`;
/*!50001 DROP VIEW IF EXISTS `v_pagos_clientes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_pagos_clientes` AS SELECT 
 1 AS `id_pago`,
 1 AS `nombre`,
 1 AS `apellido`,
 1 AS `membresia`,
 1 AS `fecha_pago`,
 1 AS `metodo_pago`,
 1 AS `precio_membresia`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_reservas_por_clase`
--

DROP TABLE IF EXISTS `v_reservas_por_clase`;
/*!50001 DROP VIEW IF EXISTS `v_reservas_por_clase`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_reservas_por_clase` AS SELECT 
 1 AS `id_clase`,
 1 AS `fecha`,
 1 AS `hora`,
 1 AS `tipo_clase`,
 1 AS `cantidad_reservas`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_clientes_activos`
--

DROP TABLE IF EXISTS `vista_clientes_activos`;
/*!50001 DROP VIEW IF EXISTS `vista_clientes_activos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_clientes_activos` AS SELECT 
 1 AS `id_cliente`,
 1 AS `nombre`,
 1 AS `apellido`,
 1 AS `dni`,
 1 AS `fecha_registro`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `wods`
--

DROP TABLE IF EXISTS `wods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wods` (
  `id_wod` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(25) NOT NULL,
  `descripcion_clase` text NOT NULL,
  `duracion` time DEFAULT NULL,
  PRIMARY KEY (`id_wod`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wods`
--

LOCK TABLES `wods` WRITE;
/*!40000 ALTER TABLE `wods` DISABLE KEYS */;
INSERT INTO `wods` VALUES (1,'AMRAP','AMRAP 20: burpees, box jumps y wall balls','00:20:00'),(2,'EMOM','EMOM 12: deadlift pesado + double unders','00:12:00'),(3,'FOR TIME','21-15-9 thrusters y pull-ups','00:15:00'),(4,'AMRAP','AMRAP 15: kettlebell swings y push-ups','00:15:00'),(5,'EMOM','EMOM 16: squat clean + toes to bar','00:16:00'),(6,'FOR TIME','Carrera 400m + 30 wall balls (3 rondas)','00:18:00'),(7,'AMRAP','AMRAP 25: remo, lunges y sit-ups','00:25:00'),(8,'EMOM','EMOM 10: snatch técnico','00:10:00'),(9,'FOR TIME','50 pull-ups + 50 push-ups + 50 squats','00:20:00'),(10,'AMRAP','AMRAP 18: bike y dumbbell snatch','00:18:00');
/*!40000 ALTER TABLE `wods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'crossfit_box'
--
/*!50003 DROP FUNCTION IF EXISTS `calcular_edad_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `calcular_edad_cliente`(param_id_cliente INT) RETURNS int
    DETERMINISTIC
BEGIN
	DECLARE edad INT;
    SELECT 
		TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE())
	INTO edad
    FROM clientes
    WHERE id_cliente = param_id_cliente;
    RETURN edad;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `clases_reservadas_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `clases_reservadas_cliente`(param_id_cliente INT) RETURNS int
    DETERMINISTIC
BEGIN
	DECLARE total_reservas INT;
    SELECT count(*)
    into total_reservas
    FROM reservas
    WHERE id_cliente = param_id_cliente;
    
    RETURN total_reservas;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrar_pago_membresia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrar_pago_membresia`(
	IN pr_id_cliente INT,
    IN pr_id_plan INT,
    IN pr_metodo_pago VARCHAR(100)
)
BEGIN
	INSERT INTO pagos (id_cliente, id_plan, fecha_pago, metodo_pago)
    VALUES (pr_id_cliente, pr_id_plan, curdate(), pr_metodo_pago);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrar_reserva_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrar_reserva_cliente`(
	IN pr_id_cliente INT,
    IN pr_id_clase INT,
    IN pr_fecha DATE,
    IN pr_horario TIME
)
BEGIN
	DECLARE estado_cliente VARCHAR(50);
	-- quiero obtener el estado del cliente
    SELECT estado 
    INTO estado_cliente
    FROM clientes 
    WHERE id_cliente = pr_id_cliente;
    
    -- quiero validar que el cliente esté activo
    IF estado_cliente <> 'Activo' THEN
		SIGNAL SQLSTATE '45000'
        SET message_text = 'El cliente no está activo y no puede reservar clases';
	ELSE
		INSERT INTO reservas (id_cliente, id_clase, fecha_reserva, horario)
        VALUES (pr_id_cliente, pr_id_clase, pr_fecha, pr_horario);
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `v_clases_completas`
--

/*!50001 DROP VIEW IF EXISTS `v_clases_completas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_clases_completas` AS select `c`.`id_clase` AS `id_clase`,`c`.`fecha` AS `fecha`,`c`.`hora` AS `hora`,`c`.`tipo_clase` AS `tipo_clase`,`c`.`cupo_maximo` AS `cupo_maximo`,`e`.`nombre` AS `nombre_entrenador`,`e`.`apellido` AS `apellido_entrenador`,`w`.`tipo` AS `tipo_wod`,`w`.`duracion` AS `duracion` from ((`clases` `c` join `entrenadores` `e` on((`c`.`id_entrenador` = `e`.`id_entrenador`))) join `wods` `w` on((`c`.`id_wod` = `w`.`id_wod`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_clientes_membresias_activas`
--

/*!50001 DROP VIEW IF EXISTS `v_clientes_membresias_activas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_clientes_membresias_activas` AS select `cl`.`id_cliente` AS `id_cliente`,`cl`.`nombre` AS `nombre`,`cl`.`apellido` AS `apellido`,`pm`.`nombre` AS `nombre_membresia`,`pm`.`precio` AS `precio` from ((`clientes` `cl` join `cliente_membresias` `cm` on((`cl`.`id_cliente` = `cm`.`id_cliente`))) join `planes_membresia` `pm` on((`cm`.`id_plan` = `pm`.`id_plan`))) where (`cm`.`estado` = 'Activa') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_pagos_clientes`
--

/*!50001 DROP VIEW IF EXISTS `v_pagos_clientes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_pagos_clientes` AS select `p`.`id_pago` AS `id_pago`,`cl`.`nombre` AS `nombre`,`cl`.`apellido` AS `apellido`,`m`.`nombre` AS `membresia`,`p`.`fecha_pago` AS `fecha_pago`,`p`.`metodo_pago` AS `metodo_pago`,`m`.`precio` AS `precio_membresia` from ((`pagos` `p` join `clientes` `cl` on((`p`.`id_cliente` = `cl`.`id_cliente`))) join `planes_membresia` `m` on((`p`.`id_plan` = `m`.`id_plan`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_reservas_por_clase`
--

/*!50001 DROP VIEW IF EXISTS `v_reservas_por_clase`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_reservas_por_clase` AS select `c`.`id_clase` AS `id_clase`,`c`.`fecha` AS `fecha`,`c`.`hora` AS `hora`,`c`.`tipo_clase` AS `tipo_clase`,count(`r`.`id_reserva`) AS `cantidad_reservas` from (`clases` `c` left join `reservas` `r` on((`c`.`id_clase` = `r`.`id_clase`))) group by `c`.`id_clase`,`c`.`fecha`,`c`.`hora`,`c`.`tipo_clase` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_clientes_activos`
--

/*!50001 DROP VIEW IF EXISTS `vista_clientes_activos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_clientes_activos` AS select `clientes`.`id_cliente` AS `id_cliente`,`clientes`.`nombre` AS `nombre`,`clientes`.`apellido` AS `apellido`,`clientes`.`dni` AS `dni`,`clientes`.`fecha_registro` AS `fecha_registro` from `clientes` where (`clientes`.`estado` = 'Activo') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-25 13:41:05
