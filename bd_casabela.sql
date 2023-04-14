-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 14-Abr-2023 às 22:43
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bd_casabela`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidos`
--

CREATE TABLE `pedidos` (
  `id_pedido` int(11) NOT NULL,
  `id_produto` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `data_pedido` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `id_produto` int(11) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `imagem` varchar(80) NOT NULL,
  `preco` decimal(5,2) NOT NULL,
  `descricao` varchar(120) NOT NULL,
  `qtd` int(11) NOT NULL,
  `avaliacao` int(11) DEFAULT NULL,
  `num_avaliacoes` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`id_produto`, `nome`, `imagem`, `preco`, `descricao`, `qtd`, `avaliacao`, `num_avaliacoes`) VALUES
(1, 'Sofá cama marrom ', 'sofa.webp', '99.99', 'O Sofá Lubeck possui estrutura em madeira 25mm e MDF 15mm, encosto em plumante 100% siliconado, assento em espuma D26 e ', 7, 13, 4),
(3, 'Sofá Cinza', 'sofa2.webp', '180.00', 'O Sofá Lubeck possui estrutura em madeira 25mm e MDF 15mm, encosto em plumante 100% siliconado, assento em espuma D26 e ', 11, 24, 6),
(4, 'Sofá de canto branco', 'sofa3.webp', '576.00', 'O Sofá Lubeck possui estrutura em madeira 25mm e MDF 15mm, encosto em plumante 100% siliconado, assento em espuma D26 e ', 4, 29, 7),
(5, 'Sofá branco com detalhes coloridos', 'sofa4.jpg', '430.00', 'O Sofá Lubeck possui estrutura em madeira 25mm e MDF 15mm, encosto em plumante 100% siliconado, assento em espuma D26 e ', 12, 11, 3),
(6, 'Sofá cama marrom ', 'sofa.webp', '219.99', 'Qualidade, sofisticação, otimização de espaço e conforto. Com o Sofá Retrátil e Reclinável de Couro Montana é possível a', 17, 5, 1),
(7, 'Sofá de canto branco', 'sofa3.webp', '802.99', 'O Sofá Lubeck possui estrutura em madeira 25mm e MDF 15mm, encosto em plumante 100% siliconado, assento em espuma D26 e ', 6, 5, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `idCliente` int(11) NOT NULL,
  `nome` varchar(40) NOT NULL,
  `senha` varchar(30) NOT NULL,
  `email` varchar(40) NOT NULL,
  `endereco` varchar(60) NOT NULL,
  `numero` int(11) NOT NULL,
  `cep` varchar(8) NOT NULL,
  `bairro` varchar(40) DEFAULT NULL,
  `cidade` varchar(20) DEFAULT NULL,
  `dataNasc` date NOT NULL,
  `cpf` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `id_produto` (`id_produto`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Índices para tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id_produto`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idCliente`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id_produto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id_produto`),
  ADD CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`idCliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
