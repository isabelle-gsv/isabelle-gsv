-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 01/09/2025 às 03:17
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `livraria`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `autor`
--

CREATE TABLE `autor` (
  `idautor` int(11) NOT NULL,
  `nome` varchar(150) DEFAULT NULL,
  `dataNasc` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `autor`
--

INSERT INTO `autor` (`idautor`, `nome`, `dataNasc`) VALUES
(1, 'Jorge Amado', '1982-08-10'),
(2, 'Machado de Assis', '1839-06-21'),
(3, 'Paulo Coelho', '1947-08-24'),
(4, 'Clarice Lispector', '1920-12-10'),
(5, 'Abraham Silberschatz', '1954-02-03'),
(6, 'Henry F. Korth S.', '1965-01-30'),
(7, 'S. Sudarshan', '1967-10-11'),
(8, 'Peter Baer Galvin', '1960-09-23'),
(9, 'Greg Gagne', '1975-04-15');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `idcliente` int(11) NOT NULL,
  `nome` varchar(150) DEFAULT NULL,
  `dataNasc` date DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `telefone` char(11) DEFAULT NULL,
  `endereco` varchar(200) NOT NULL,
  `celular` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`idcliente`, `nome`, `dataNasc`, `email`, `telefone`, `endereco`, `celular`) VALUES
(1, 'Ana Souza', '1972-06-10', 'anass@uul.com.br', '24932321178', '', ''),
(2, 'Camila Silva', '1982-10-31', 'csilva@doc.com.br', '24923234455', '', ''),
(3, 'Paulo Matos', '1967-08-24', '', '24933115678', '', ''),
(4, 'Vicente Castro', '1975-12-05', 'v_castro@dcc.gov.br', '', '', ''),
(5, 'Viviane Batista', '1995-08-15', '', '24988871131', '', ''),
(6, 'Cinthia Silva', '1998-05-27', 'cinthia_s@dcc.br', '', '', ''),
(7, 'Mateus Nunes', '1994-04-04', '', '24922235678', '', '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `escreve`
--

CREATE TABLE `escreve` (
  `autor_idautor` int(11) NOT NULL,
  `livro_idlivro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `escreve`
--

INSERT INTO `escreve` (`autor_idautor`, `livro_idlivro`) VALUES
(1, 622),
(2, 715),
(3, 135),
(3, 234),
(3, 345),
(4, 236),
(4, 421),
(4, 567),
(5, 123),
(5, 368),
(5, 775),
(5, 908),
(6, 368),
(6, 908),
(7, 368),
(7, 908),
(8, 123),
(8, 775),
(9, 123),
(9, 775);

-- --------------------------------------------------------

--
-- Estrutura para tabela `genero`
--

CREATE TABLE `genero` (
  `idgenero` int(11) NOT NULL,
  `descricao` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `genero`
--

INSERT INTO `genero` (`idgenero`, `descricao`) VALUES
(1, 'Romance'),
(2, 'Ficção'),
(3, 'Drama'),
(4, 'Suspense'),
(5, 'Infanto-Juvenil'),
(6, 'Técnico');

-- --------------------------------------------------------

--
-- Estrutura para tabela `itemvenda`
--

CREATE TABLE `itemvenda` (
  `venda_idvenda` int(11) NOT NULL,
  `livro_idlivro` int(11) NOT NULL,
  `quantidade` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `itemvenda`
--

INSERT INTO `itemvenda` (`venda_idvenda`, `livro_idlivro`, `quantidade`) VALUES
(1, 135, 1),
(1, 234, 2),
(2, 345, 1),
(3, 622, 2),
(4, 715, 3),
(5, 123, 1),
(5, 368, 1),
(5, 908, 1),
(6, 775, 2),
(6, 908, 1),
(7, 123, 1),
(7, 135, 2),
(7, 368, 1),
(7, 421, 1),
(8, 421, 1),
(9, 135, 1),
(9, 715, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `livro`
--

CREATE TABLE `livro` (
  `idlivro` int(11) NOT NULL,
  `titulo` varchar(150) DEFAULT NULL,
  `preco` float DEFAULT NULL,
  `estoque` int(11) DEFAULT NULL,
  `editora` varchar(45) DEFAULT NULL,
  `genero_idgenero` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `livro`
--

INSERT INTO `livro` (`idlivro`, `titulo`, `preco`, `estoque`, `editora`, `genero_idgenero`) VALUES
(123, 'Sistemas Operacionais com Java', 112.189, 27, 'Elsevier', 6),
(135, 'O Alquimista', 13.9, 25, 'Planeta', 2),
(234, 'Onze Minutos', 11.9, 0, 'Pergaminho', 3),
(236, 'O mistério do coelho pensante e outros contos', 26.4, 20, 'Rocco', 5),
(345, 'Manuscrito Encontrado em Accra', 24.99, 31, 'Sextante', 2),
(368, 'Sistema de Banco de Dados, 6e', 241.89, 48, 'Elsevier', 6),
(421, 'A Hora da Estrela', 13.8, 12, 'Rocco', 1),
(567, 'Água Viva', 15.9, 0, 'Rocco', 1),
(622, 'Gabriela, Cravo e Canela', 17, 15, 'Companhia das Letras', 1),
(715, 'Dom Casmurro', 15, 45, 'Globo Editora', 1),
(775, 'Fundamentos de Sistemas Operacionais', 130.15, 25, 'LTC', 6),
(908, 'Sistema de Banco de Dados', 95.15, 15, 'Elsevier', 6);

-- --------------------------------------------------------

--
-- Estrutura para tabela `venda`
--

CREATE TABLE `venda` (
  `idvenda` int(11) NOT NULL,
  `data` date DEFAULT NULL,
  `cliente_idcliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `venda`
--

INSERT INTO `venda` (`idvenda`, `data`, `cliente_idcliente`) VALUES
(1, '2014-06-23', 4),
(2, '2014-07-05', 2),
(3, '2014-08-10', 3),
(4, '2014-08-20', 1),
(5, '2014-08-23', 7),
(6, '2014-09-02', 5),
(7, '2014-09-11', 6),
(8, '2014-09-11', 3),
(9, '2014-09-20', 7);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`idautor`);

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idcliente`);

--
-- Índices de tabela `escreve`
--
ALTER TABLE `escreve`
  ADD PRIMARY KEY (`autor_idautor`,`livro_idlivro`),
  ADD KEY `fk_escreve_livro` (`livro_idlivro`);

--
-- Índices de tabela `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`idgenero`);

--
-- Índices de tabela `itemvenda`
--
ALTER TABLE `itemvenda`
  ADD PRIMARY KEY (`venda_idvenda`,`livro_idlivro`),
  ADD KEY `fk_itemVenda_livro` (`livro_idlivro`);

--
-- Índices de tabela `livro`
--
ALTER TABLE `livro`
  ADD PRIMARY KEY (`idlivro`),
  ADD KEY `fk_livro_genero` (`genero_idgenero`);

--
-- Índices de tabela `venda`
--
ALTER TABLE `venda`
  ADD PRIMARY KEY (`idvenda`),
  ADD KEY `fk_venda_cliente` (`cliente_idcliente`);

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `escreve`
--
ALTER TABLE `escreve`
  ADD CONSTRAINT `fk_escreve_autor` FOREIGN KEY (`autor_idautor`) REFERENCES `autor` (`idautor`),
  ADD CONSTRAINT `fk_escreve_livro` FOREIGN KEY (`livro_idlivro`) REFERENCES `livro` (`idlivro`);

--
-- Restrições para tabelas `itemvenda`
--
ALTER TABLE `itemvenda`
  ADD CONSTRAINT `fk_itemVenda_livro` FOREIGN KEY (`livro_idlivro`) REFERENCES `livro` (`idlivro`),
  ADD CONSTRAINT `fk_itemVenda_venda` FOREIGN KEY (`venda_idvenda`) REFERENCES `venda` (`idvenda`);

--
-- Restrições para tabelas `livro`
--
ALTER TABLE `livro`
  ADD CONSTRAINT `fk_livro_genero` FOREIGN KEY (`genero_idgenero`) REFERENCES `genero` (`idgenero`);

--
-- Restrições para tabelas `venda`
--
ALTER TABLE `venda`
  ADD CONSTRAINT `fk_venda_cliente` FOREIGN KEY (`cliente_idcliente`) REFERENCES `cliente` (`idcliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
