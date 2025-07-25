-- ========================================================================
-- SCRIPT DE CRIAÇÃO DO BANCO DE DADOS "programacoes_filmes"
-- 
-- Este arquivo contém todos os comandos necessários para criar a estrutura
-- do banco de dados (tabelas, chaves primárias e estrangeiras) e popular 
-- com os dados iniciais utilizados na aplicação.
--
-- IMPORTANTE:
-- 1. Para executar este script, é necessário ter o MySQL instalado.
-- 2. A execução deve ser feita em um cliente MySQL, como o MySQL Workbench 
--    ou via terminal com o comando:
-- 
--      mysql -u SEU_USUARIO -p < setup.sql
--
-- 3. Esse script irá:
--    - Criar o banco de dados `programacoes_filmes` (se ainda não existir)
--    - Criar as tabelas: filme, canal, elenco, exibicao
--    - Inserir dados de exemplo em cada tabela
--
-- Dica: certifique-se de que o banco não existe previamente para evitar
-- conflitos, ou adapte os comandos conforme necessário.
-- ========================================================================


CREATE DATABASE  IF NOT EXISTS `programacoes_filmes` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `programacoes_filmes`;
-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: programacoes_filmes
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
-- Table structure for table `canal`
--

DROP TABLE IF EXISTS `canal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `canal` (
  `num_canal` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  PRIMARY KEY (`num_canal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canal`
--

LOCK TABLES `canal` WRITE;
/*!40000 ALTER TABLE `canal` DISABLE KEYS */;
INSERT INTO `canal` VALUES (111,'AXN'),(222,'HBO'),(333,'Cinemax'),(444,'TNT'),(555,'Warner Channel'),(666,'Telecine Premium');
/*!40000 ALTER TABLE `canal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elenco`
--

DROP TABLE IF EXISTS `elenco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elenco` (
  `num_filme` int(11) NOT NULL,
  `nome_ator_atriz` varchar(100) NOT NULL,
  `protagonista` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`num_filme`,`nome_ator_atriz`),
  CONSTRAINT `elenco_ibfk_1` FOREIGN KEY (`num_filme`) REFERENCES `filme` (`num_filme`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elenco`
--

LOCK TABLES `elenco` WRITE;
/*!40000 ALTER TABLE `elenco` DISABLE KEYS */;
INSERT INTO `elenco` VALUES (90001,'Sam Worthington',1),(90001,'Sigourney Weaver',0),(90001,'Zoe Saldaña',1),(90002,'Kate Winslet',1),(90002,'Leonardo DiCaprio',1),(90003,'Carrie Fisher',1),(90003,'Harrison Ford',1),(90003,'Mark Hamill',1),(90004,'Chris Evans',1),(90004,'Josh Brolin',0),(90004,'Robert Downey Jr.',1),(90004,'Scarlett Johansson',1),(90004,'Zoe Saldaña',0),(90006,'Marlon Brando',1),(90006,'Al Pacino',1),(90007,'Christian Bale',1),(90007,'Heath Ledger',0),(90010,'Elijah Wood',1),(90010,'Viggo Mortensen',1),(90011,'Tom Hanks',1),(90012,'Leonardo DiCaprio',1),(90012,'Joseph Gordon-Levitt',0),(90012,'Tom Hardy',0),(90013,'Keanu Reeves',1),(90013,'Laurence Fishburne',0),(90018,'Tom Hanks',1),(90020,'Song Kang-ho',1),(90033,'Tom Hardy',1),(90033,'Charlize Theron',1),(90036,'Harrison Ford',0);
/*!40000 ALTER TABLE `elenco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exibicao`
--

DROP TABLE IF EXISTS `exibicao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exibicao` (
  `num_filme` int(11) NOT NULL,
  `num_canal` int(11) NOT NULL,
  `data_exibicao` date NOT NULL,
  `hora_exibicao` time NOT NULL,
  PRIMARY KEY (`num_filme`,`num_canal`,`data_exibicao`,`hora_exibicao`),
  KEY `num_canal` (`num_canal`),
  CONSTRAINT `exibicao_ibfk_1` FOREIGN KEY (`num_filme`) REFERENCES `filme` (`num_filme`),
  CONSTRAINT `exibicao_ibfk_2` FOREIGN KEY (`num_canal`) REFERENCES `canal` (`num_canal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exibicao`
--

LOCK TABLES `exibicao` WRITE;
/*!40000 ALTER TABLE `exibicao` DISABLE KEYS */;
INSERT INTO `exibicao` VALUES (90001,222,'2025-06-27','14:00:00'),(90002,333,'2025-06-28','09:30:00'),(90002,333,'2025-06-28','20:30:00'),(90003,111,'2025-06-27','19:45:00'),(90005,222,'2025-08-03','16:20:00'),(90005,333,'2025-08-03','16:20:00'),(90004,444,'2025-07-25','22:00:00'),(90007,666,'2025-07-26','21:00:00'),(90011,555,'2025-07-27','18:00:00'),(90013,111,'2025-07-28','23:30:00'),(90021,444,'2025-07-29','20:15:00'),(90033,222,'2025-07-30','22:00:00'),(90040,333,'2025-08-01','19:00:00'),(90050,666,'2025-08-02','00:00:00'),(90001,444,'2025-08-05','17:30:00'),(90002,555,'2025-08-08','21:45:00'),(90004,222,'2025-08-10','14:10:00'),(90006,666,'2025-08-12','22:00:00'),(90015,111,'2025-08-15','23:00:00'),(90023,555,'2025-08-17','16:00:00'),(90024,333,'2025-08-20','13:00:00'),(90028,222,'2025-08-22','11:00:00'),(90038,666,'2025-08-25','22:00:00'),(90042,111,'2025-08-28','23:15:00'),(90044,444,'2025-09-01','20:00:00'),(90017,222,'2025-09-05','22:30:00'),(90019,666,'2025-09-07','19:45:00'),(90027,111,'2025-09-10','01:00:00'),(90034,555,'2025-09-12','18:30:00'),(90045,444,'2025-09-15','22:00:00');
/*!40000 ALTER TABLE `exibicao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filme`
--

DROP TABLE IF EXISTS `filme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filme` (
  `num_filme` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `ano` int(11) DEFAULT NULL,
  `duracao` int(11) DEFAULT NULL,
  PRIMARY KEY (`num_filme`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filme`
--

LOCK TABLES `filme` WRITE;
/*!40000 ALTER TABLE `filme` DISABLE KEYS */;
INSERT INTO `filme` VALUES (90001,'Avatar',2022,162),(90002,'Titanic',1997,194),(90003,'Star Wars',2019,NULL),(90004,'Vingadores Ultimato',2019,180),(90005,'Lilo & Stitch',2025,108),(90006,'O Poderoso Chefão',1972,175),(90007,'Batman: O Cavaleiro das Trevas',2008,152),(90008,'Pulp Fiction',1994,154),(90009,'A Lista de Schindler',1993,195),(90010,'O Senhor dos Anéis: O Retorno do Rei',2003,201),(90011,'Forrest Gump',1994,142),(90012,'A Origem',2010,148),(90013,'Matrix',1999,136),(90014,'Os Bons Companheiros',1990,146),(90015,'O Silêncio dos Inocentes',1991,118),(90016,'Cidade de Deus',2002,130),(90017,'Gladiador',2000,155),(90018,'O Resgate do Soldado Ryan',1998,169),(90019,'Interestelar',2014,169),(90020,'Parasita',2019,132),(90021,'Jurassic Park',1993,127),(90022,'A Viagem de Chihiro',2001,125),(90023,'O Rei Leão',1994,88),(90024,'De Volta para o Futuro',1985,116),(90025,'Psicose',1960,109),(90026,'O Iluminado',1980,146),(90027,'Clube da Luta',1999,139),(90028,'Toy Story',1995,81),(90029,'WALL-E',2008,98),(90030,'Up - Altas Aventuras',2009,96),(90031,'Divertida Mente',2015,95),(90032,'Coco',2017,105),(90033,'Mad Max: Estrada da Fúria',2015,120),(90034,'Homem-Aranha: No Aranhaverso',2018,117),(90035,'Coringa',2019,122),(90036,'Blade Runner 2049',2017,163),(90037,'A Chegada',2016,116),(90038,'Duna',2021,155),(90039,'O Grande Hotel Budapeste',2014,99),(90040,'La La Land',2016,128),(90041,'Whiplash',2014,107),(90042,'O Lobo de Wall Street',2013,180),(90043,'Django Livre',2012,165),(90044,'Bastardos Inglórios',2009,153),(90045,'Kill Bill: Volume 1',2003,111),(90046,'O Fabuloso Destino de Amélie Poulain',2001,122),(90047,'E o Vento Levou',1939,238),(90048,'Casablanca',1942,102),(90049,'Cidadão Kane',1941,119),(90050,'2001: Uma Odisseia no Espaço',1968,149);
/*!40000 ALTER TABLE `filme` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Trigger para validar que o ano de lançamento do filme não é futuro (INSERT)
DELIMITER $$
CREATE TRIGGER trg_validar_ano_filme_insert
BEFORE INSERT ON filme
FOR EACH ROW
BEGIN
    IF NEW.ano > YEAR(CURDATE()) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'O ano de lançamento do filme não pode ser futuro.';
    END IF;
END$$
DELIMITER ;

-- Trigger para validar que o ano de lançamento do filme não é futuro (UPDATE)
DELIMITER $$
CREATE TRIGGER trg_validar_ano_filme_update
BEFORE UPDATE ON filme
FOR EACH ROW
BEGIN
    IF NEW.ano > YEAR(CURDATE()) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'O ano de lançamento do filme não pode ser futuro.';
    END IF;
END$$
DELIMITER ;


-- Dump completed on 2025-07-11 21:42:17