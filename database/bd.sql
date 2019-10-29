-- --------------------------------------------------------
-- Servidor:                     sql10.freemysqlhosting.net
-- Versão do servidor:           5.5.58-0ubuntu0.14.04.1 - (Ubuntu)
-- OS do Servidor:               debian-linux-gnu
-- HeidiSQL Versão:              9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Copiando estrutura para tabela sql10310108.avaliacoes
CREATE TABLE IF NOT EXISTS `avaliacoes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discente` int(11) DEFAULT NULL,
  `docente` int(11) DEFAULT NULL,
  `didatica` int(11) DEFAULT NULL,
  `coerencia` int(11) DEFAULT NULL,
  `comentario` text,
  `cursariaNovamente` tinyint(4) DEFAULT '0',
  `disponivel` int(11) DEFAULT '1',
  `dataCriacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `dataAtualizacao` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `discente_avaliacao` (`discente`),
  KEY `docente_avaliacao` (`docente`),
  CONSTRAINT `discente_avaliacao` FOREIGN KEY (`discente`) REFERENCES `discentes` (`id`),
  CONSTRAINT `docente_avaliacao` FOREIGN KEY (`docente`) REFERENCES `docentes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Copiando dados para a tabela sql10310108.avaliacoes: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `avaliacoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `avaliacoes` ENABLE KEYS */;

-- Copiando estrutura para tabela sql10310108.denuncias
CREATE TABLE IF NOT EXISTS `denuncias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `avaliacao` int(11) DEFAULT NULL,
  `email` varchar(75) DEFAULT NULL,
  `status` enum('RECEBIDA','APROVADA','REPROVADA') DEFAULT 'RECEBIDA',
  `dataCriacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `dataAtualizacao` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `avaliacao_denuncia` (`avaliacao`),
  CONSTRAINT `avaliacao_denuncia` FOREIGN KEY (`avaliacao`) REFERENCES `avaliacoes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Copiando dados para a tabela sql10310108.denuncias: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `denuncias` DISABLE KEYS */;
/*!40000 ALTER TABLE `denuncias` ENABLE KEYS */;

-- Copiando estrutura para tabela sql10310108.discentes
CREATE TABLE IF NOT EXISTS `discentes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `matricula` varchar(75) DEFAULT NULL,
  `codigoVerificacao` varchar(75) DEFAULT NULL,
  `apelido` varchar(75) DEFAULT NULL,
  `dataEmissaoVerificacao` datetime DEFAULT NULL,
  `dataCriacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `dataAtualizacao` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela sql10310108.discentes: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `discentes` DISABLE KEYS */;
/*!40000 ALTER TABLE `discentes` ENABLE KEYS */;

-- Copiando estrutura para tabela sql10310108.disciplinas
CREATE TABLE IF NOT EXISTS `disciplinas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(75) DEFAULT NULL,
  `codigo` varchar(75) DEFAULT NULL,
  `unidadeAcademica` int(11) DEFAULT NULL,
  `ano` int(11) DEFAULT NULL,
  `semestre` int(11) DEFAULT NULL,
  `dataCriacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `dataAtualizacao` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `unidadeAcademica_disciplina` (`unidadeAcademica`),
  CONSTRAINT `unidadeAcademica_disciplina` FOREIGN KEY (`unidadeAcademica`) REFERENCES `unidadesAcademicas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Copiando dados para a tabela sql10310108.disciplinas: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `disciplinas` DISABLE KEYS */;
/*!40000 ALTER TABLE `disciplinas` ENABLE KEYS */;

-- Copiando estrutura para tabela sql10310108.docentes
CREATE TABLE IF NOT EXISTS `docentes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(75) DEFAULT NULL,
  `matricula` varchar(75) DEFAULT NULL,
  `unidadeAcademica` int(11) DEFAULT NULL,
  `dataCriacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `dataAtualizacao` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `unidadeAcademica_docente` (`unidadeAcademica`),
  CONSTRAINT `unidadeAcademica_docente` FOREIGN KEY (`unidadeAcademica`) REFERENCES `unidadesAcademicas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Copiando dados para a tabela sql10310108.docentes: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `docentes` DISABLE KEYS */;
/*!40000 ALTER TABLE `docentes` ENABLE KEYS */;

-- Copiando estrutura para tabela sql10310108.unidadesAcademicas
CREATE TABLE IF NOT EXISTS `unidadesAcademicas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(75) DEFAULT NULL,
  `dataCriacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `dataAtualizacao` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Copiando dados para a tabela sql10310108.unidadesAcademicas: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `unidadesAcademicas` DISABLE KEYS */;
/*!40000 ALTER TABLE `unidadesAcademicas` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
