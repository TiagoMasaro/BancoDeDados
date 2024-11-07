-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           8.2.0 - MySQL Community Server - GPL
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para banco2infod2024_cliente
CREATE DATABASE IF NOT EXISTS `banco2infod2024_cliente` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `banco2infod2024_cliente`;

-- Copiando estrutura para tabela banco2infod2024_cliente.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `codCliente` int NOT NULL AUTO_INCREMENT,
  `nomeCliente` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_ci NOT NULL,
  `rgCliente` varchar(50) NOT NULL DEFAULT '',
  `cpfCliente` varchar(100) NOT NULL DEFAULT '',
  `enderecoCliente` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tipoPessoaCliente` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`codCliente`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela banco2infod2024_cliente.cliente: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela banco2infod2024_cliente.funcionario
CREATE TABLE IF NOT EXISTS `funcionario` (
  `codFuncionario` int NOT NULL AUTO_INCREMENT,
  `nomeFuncionario` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `salarioFuncionario` double NOT NULL,
  `nascimentoFuncionario` date NOT NULL,
  `clienteFuncionario` int NOT NULL,
  PRIMARY KEY (`codFuncionario`),
  KEY `cidadeFuncionario` (`clienteFuncionario`) USING BTREE,
  CONSTRAINT `FK_funcionario_cliente` FOREIGN KEY (`clienteFuncionario`) REFERENCES `cliente` (`codCliente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela banco2infod2024_cliente.funcionario: ~0 rows (aproximadamente)


-- Copiando estrutura do banco de dados para teste2d
CREATE DATABASE IF NOT EXISTS `teste2d` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `teste2d`;

-- Copiando estrutura para procedure teste2d.p_aloMundo
DELIMITER //
CREATE PROCEDURE `p_aloMundo`()
BEGIN
	SELECT "Alô Mundo!" AS mensagem;
END//
DELIMITER ;

-- Copiando estrutura para procedure teste2d.p_alteracliente
DELIMITER //
CREATE PROCEDURE `p_alteracliente`(
	IN `codAlterar` INT,
	IN `nomeAlterar` VARCHAR(150),
	IN `cpfAlterar` VARCHAR(20)
)
BEGIN
		SELECT COUNT(*) INTO @contador FROM tbl_cliente WHERE codCLiente = codAlterar;
		
		if (@contador = 0)
		then select "Cliente não encontrado!" AS erro;
			else update tbl_cliente SET nome = nomeAlterar, cpf = cpfAlterar WHERE codCliente = codAlterar;
		 END if;
		 
		 SELECT * FROM tbl_cliente;
		
END//
DELIMITER ;

-- Copiando estrutura para procedure teste2d.p_alteraTipo
DELIMITER //
CREATE PROCEDURE `p_alteraTipo`(
	IN `codAlterar` INT,
	IN `nome` VARCHAR(200),
	IN `caracteristicasAlterar` VARCHAR(500)
)
BEGIN
	UPDATE tbl_tipo SET nome = nomeAlterar, caracteristicas = caracteristicasAlterar WHERE codTipo = codAlterar;
	SELECT * FROM tbl_tipo;
END//
DELIMITER ;

-- Copiando estrutura para procedure teste2d.p_apagaCliente
DELIMITER //
CREATE PROCEDURE `p_apagaCliente`(
	IN `codApagar` INT
)
BEGIN

	SELECT COUNT(*) INTO @contador FROM tbl_cliente WHERE codCliente = codApagar;
	if(@contador=0)
		then SELECT "O cliente não foi encontrado!" AS erro;
		ELSE DELETE FROM tbl_cliente WHERE codCliente = codApagar; 
		SELECT * FROM tbl_cliente;
	END if;

END//
DELIMITER ;

-- Copiando estrutura para procedure teste2d.p_insereCliente
DELIMITER //
CREATE PROCEDURE `p_insereCliente`(
	IN `nomeNovo` VARCHAR(50),
	IN `cpfNovo` VARCHAR(20)
)
BEGIN
	INSERT INTO tbl_cliente(nome, cpf) VALUES(nomeNovo, cpfNovo);
	SELECT * FROM tbl_cliente;
END//
DELIMITER ;

-- Copiando estrutura para procedure teste2d.p_insereTipo
DELIMITER //
CREATE PROCEDURE `p_insereTipo`(
	IN `nomeInserir` VARCHAR(200),
	IN `caracteristicasInserir` VARCHAR(500)
)
BEGIN
		INSERT INTO tbl_tipo(nome, caracteristicas) VALUES(nomeInserir, caracteristicasInserir);
		SELECT * FROM tbl_tipo;
END//
DELIMITER ;

-- Copiando estrutura para procedure teste2d.p_media
DELIMITER //
CREATE PROCEDURE `p_media`(
	IN `nota1` FLOAT,
	IN `nota2` FLOAT,
	IN `nota3` FLOAT,
	OUT `resultado` DECIMAL(3,2)
)
BEGIN
	SET resultado = (nota1 + nota2 + nota3)/3;
END//
DELIMITER ;

-- Copiando estrutura para procedure teste2d.p_quadrado
DELIMITER //
CREATE PROCEDURE `p_quadrado`(
	INOUT `numero` INT
)
BEGIN
		set numero = numero * numero;
END//
DELIMITER ;

-- Copiando estrutura para procedure teste2d.p_relatoriosCliente
DELIMITER //
CREATE PROCEDURE `p_relatoriosCliente`(
	IN `tipo` INT
)
BEGIN
		if (tipo = 1)
		then SELECT COUNT(*) FROM tbl_cliente AS total;
		
		ELSE if(tipo = 2)
			then SELECT * FROM tbl_cliente ORDER BY nome ASC;
			
			ELSE if (tipo = 3)
				then SELECT * FROM tbl_cliente ORDER BY nome DESC; 
				ELSE SELECT "Relátorio inexistente" AS erro;
		
				END if;
			END if;
		END if;
END//
DELIMITER ;

-- Copiando estrutura para tabela teste2d.tbl_cliente
CREATE TABLE IF NOT EXISTS `tbl_cliente` (
  `codCliente` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `cpf` varchar(50) DEFAULT NULL,
  `tipoCliente` int DEFAULT NULL,
  PRIMARY KEY (`codCliente`),
  KEY `FK_tbl_cliente_tbl_tipo` (`tipoCliente`),
  CONSTRAINT `FK_tbl_cliente_tbl_tipo` FOREIGN KEY (`tipoCliente`) REFERENCES `tbl_tipo` (`codTipo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela teste2d.tbl_cliente: ~5 rows (aproximadamente)
INSERT INTO `tbl_cliente` (`codCliente`, `nome`, `cpf`, `tipoCliente`) VALUES
	(1, 'Fabrício Alves', '111.111.111-11', 1),
	(2, ' Tiago Masaro', '129.680.560-2', 2),
	(3, 'Pedro Franco', '123.456.789-01', 1),
	(5, 'Tarsicio Amaral', '123.456.313-08', 2),
	(6, 'Priscila Alvin', '444.567.289-09', 2);

-- Copiando estrutura para tabela teste2d.tbl_tipo
CREATE TABLE IF NOT EXISTS `tbl_tipo` (
  `codTipo` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `caracteristicas` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`codTipo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela teste2d.tbl_tipo: ~4 rows (aproximadamente)
INSERT INTO `tbl_tipo` (`codTipo`, `nome`, `caracteristicas`) VALUES
	(1, 'Ocasional', 'Compra sem regularidade'),
	(2, 'Premium', 'Tem uma grande afinidade com a marca ou empresa e continua comprando de forma recorrente.'),
	(3, 'Digital', 'Prefere realizar compras online ou através de múltiplos canais (e-commerce, redes sociais, apps)'),
	(4, 'Corporativo', 'Empresas ou organizações que compram para fins comerciais.)');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
