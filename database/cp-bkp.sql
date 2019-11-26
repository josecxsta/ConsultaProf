-- --------------------------------------------------------
-- Servidor:                     sql10.freemysqlhosting.net
-- Versão do servidor:           5.5.58-0ubuntu0.14.04.1 - (Ubuntu)
-- OS do Servidor:               debian-linux-gnu
-- HeidiSQL Versão:              10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Copiando estrutura para tabela sql10313419.avaliacoes
CREATE TABLE IF NOT EXISTS `avaliacoes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discente` int(11) DEFAULT NULL,
  `docente` int(11) DEFAULT NULL,
  `didatica` int(11) DEFAULT NULL,
  `coerencia` int(11) DEFAULT NULL,
  `pontualidade` int(11) DEFAULT NULL,
  `cordialidade` int(11) DEFAULT NULL,
  `tituloComentario` varchar(255) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Copiando dados para a tabela sql10313419.avaliacoes: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `avaliacoes` DISABLE KEYS */;
INSERT INTO `avaliacoes` (`id`, `discente`, `docente`, `didatica`, `coerencia`, `pontualidade`, `cordialidade`, `tituloComentario`, `comentario`, `cursariaNovamente`, `disponivel`, `dataCriacao`, `dataAtualizacao`) VALUES
	(12, 1, 1, 2, 3, 4, 2, 'Nem bom nem ruim', 'Não gostei', 0, 1, '2019-11-25 20:54:48', NULL),
	(13, 1, 1, 2, 5, 3, 4, 'Razoavel!', 'Ok', 0, 1, '2019-11-25 20:55:54', NULL);
/*!40000 ALTER TABLE `avaliacoes` ENABLE KEYS */;

-- Copiando estrutura para tabela sql10313419.denuncias
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

-- Copiando dados para a tabela sql10313419.denuncias: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `denuncias` DISABLE KEYS */;
/*!40000 ALTER TABLE `denuncias` ENABLE KEYS */;

-- Copiando estrutura para tabela sql10313419.discentes
CREATE TABLE IF NOT EXISTS `discentes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) DEFAULT NULL,
  `senha` text,
  `matricula` varchar(75) DEFAULT NULL,
  `codigoVerificacao` varchar(75) DEFAULT NULL,
  `apelido` varchar(75) DEFAULT NULL,
  `dataEmissaoVerificacao` datetime DEFAULT NULL,
  `dataCriacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `dataAtualizacao` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela sql10313419.discentes: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `discentes` DISABLE KEYS */;
INSERT INTO `discentes` (`id`, `email`, `senha`, `matricula`, `codigoVerificacao`, `apelido`, `dataEmissaoVerificacao`, `dataCriacao`, `dataAtualizacao`) VALUES
	(1, 'josecxsta@gmail.com', NULL, '201703761', 'dshduiah22wj0dp=', 'Anonimo1', '2019-11-25 14:23:25', '2019-11-25 14:23:27', '2019-11-25 14:23:28');
/*!40000 ALTER TABLE `discentes` ENABLE KEYS */;

-- Copiando estrutura para tabela sql10313419.disciplinas
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
  CONSTRAINT `unidadeAcademica_disciplina` FOREIGN KEY (`unidadeAcademica`) REFERENCES `unidadesacademicas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Copiando dados para a tabela sql10313419.disciplinas: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `disciplinas` DISABLE KEYS */;
/*!40000 ALTER TABLE `disciplinas` ENABLE KEYS */;

-- Copiando estrutura para tabela sql10313419.docentes
CREATE TABLE IF NOT EXISTS `docentes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(75) DEFAULT NULL,
  `matricula` varchar(75) DEFAULT NULL,
  `unidadeAcademica` int(11) DEFAULT NULL,
  `dataCriacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `dataAtualizacao` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `unidadeAcademica_docente` (`unidadeAcademica`),
  CONSTRAINT `unidadeAcademica_docente` FOREIGN KEY (`unidadeAcademica`) REFERENCES `unidadesacademicas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Copiando dados para a tabela sql10313419.docentes: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `docentes` DISABLE KEYS */;
INSERT INTO `docentes` (`id`, `nome`, `matricula`, `unidadeAcademica`, `dataCriacao`, `dataAtualizacao`) VALUES
	(1, 'Professor de Teste', '002', 1, '2019-11-25 14:47:34', '2019-11-25 14:47:35'),
	(2, 'Júnior Oliveira', '203', 1, '2019-11-26 00:19:46', '2019-11-26 00:19:47'),
	(3, 'Letícia Almeida', '305', 2, '2019-11-26 00:20:04', '2019-11-26 00:20:05'),
	(4, 'Maria Julia', '809', 1, '2019-11-26 00:21:30', '2019-11-26 00:20:21');
/*!40000 ALTER TABLE `docentes` ENABLE KEYS */;

-- Copiando estrutura para tabela sql10313419.unidadesacademicas
CREATE TABLE IF NOT EXISTS `unidadesacademicas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(75) DEFAULT NULL,
  `dataCriacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `dataAtualizacao` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Copiando dados para a tabela sql10313419.unidadesacademicas: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `unidadesacademicas` DISABLE KEYS */;
INSERT INTO `unidadesacademicas` (`id`, `nome`, `dataCriacao`, `dataAtualizacao`) VALUES
	(1, 'Instituto de Informática', '2019-11-25 14:44:51', '2019-11-25 14:44:52'),
	(2, 'Faculdade de Administração, Ciências Contábeis e Ciências Econômicas', '2019-11-26 00:17:36', '2019-11-26 00:17:36');
/*!40000 ALTER TABLE `unidadesacademicas` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
