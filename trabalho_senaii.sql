-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 19/11/2026 às 12:07
-- Versão do servidor: 8.0.42-0ubuntu0.24.04.2
-- Versão do PHP: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `trabalho_senaii`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `componentes_maquina`
--

CREATE TABLE `componentes_maquina` (
  `id_componente` int NOT NULL,
  `id_maquina` int DEFAULT NULL,
  `nome_componente` varchar(100) DEFAULT NULL,
  `horas_uso_acumulado` int DEFAULT NULL,
  `limites_horas_abertas` int DEFAULT NULL
) ;

--
-- Despejando dados para a tabela `componentes_maquina`
--

INSERT INTO `componentes_maquina` (`id_componente`, `id_maquina`, `nome_componente`, `horas_uso_acumulado`, `limites_horas_abertas`) VALUES
(1, 1, 'Eixo Principal (Spindle)', 1850, 2000),
(2, 2, 'Servomotor Eixo 3', 920, 3000),
(3, 3, 'Bomba Hidráulica Principal', 4100, 4000),
(4, 4, 'Resistência de Aquecimento Cilindro', 640, 1500),
(5, 5, 'Fuso de Esferas Eixo X', 5200, 5000);

-- --------------------------------------------------------

--
-- Estrutura para tabela `estoque_pecas`
--

CREATE TABLE `estoque_pecas` (
  `id_peca` int NOT NULL,
  `codigo_part_number` varchar(50) DEFAULT NULL,
  `descricao` varchar(150) DEFAULT NULL,
  `qtd_estoque` int DEFAULT NULL,
  `preco_unitario` decimal(10,2) DEFAULT NULL
) ;

--
-- Despejando dados para a tabela `estoque_pecas`
--

INSERT INTO `estoque_pecas` (`id_peca`, `codigo_part_number`, `descricao`, `qtd_estoque`, `preco_unitario`) VALUES
(1, 'ROL-6205-ZZ', 'Rolamento de Esferas Alta Rotação', 24, 89.90),
(2, 'CAB-SRV-10M', 'Cabo Encoder Blindado 10 Metros', 12, 340.00),
(3, 'VED-HID-80', 'Kit Vedação Cilindro Hidráulico 80mm', 8, 215.50),
(4, 'RES-COL-220V', 'Resistência Coleira Mica 220V 1500W', 15, 128.00),
(5, 'COR-SIN-5M', 'Correia Sincronizada Passo 5M', 30, 64.75);

-- --------------------------------------------------------

--
-- Estrutura para tabela `historico_sensores`
--

CREATE TABLE `historico_sensores` (
  `id_leitura` int NOT NULL,
  `id_ordem` int DEFAULT NULL,
  `temperatura_medida` decimal(5,2) DEFAULT NULL,
  `vibracao_mm_s` decimal(5,2) DEFAULT NULL,
  `data_hora_leitura` datetime DEFAULT NULL
) ;

--
-- Despejando dados para a tabela `historico_sensores`
--

INSERT INTO `historico_sensores` (`id_leitura`, `id_ordem`, `temperatura_medida`, `vibracao_mm_s`, `data_hora_leitura`) VALUES
(6, 21, 74.50, 4.85, '2026-11-18 08:45:00'),
(7, 22, 42.10, 1.15, '2026-11-18 11:00:00'),
(8, 23, 88.90, 6.40, '2026-11-18 13:50:00'),
(9, 24, 195.00, 1.80, '2026-11-19 08:15:00'),
(10, 25, 36.40, 0.90, '2026-11-19 11:30:00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `linhas_producao`
--

CREATE TABLE `linhas_producao` (
  `id_linha` int NOT NULL,
  `id_unidade` int DEFAULT NULL,
  `nome_linha` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `linhas_producao`
--

INSERT INTO `linhas_producao` (`id_linha`, `id_unidade`, `nome_linha`) VALUES
(1, 1, 'Linha 01 - Usinagem CNC'),
(2, 2, 'Linha 02 - Soldagem Robotizada'),
(3, 3, 'Linha 03 - Estamparia Pesada'),
(4, 4, 'Linha 04 - Injeção Plástica'),
(5, 5, 'Linha 05 - Montagem Automatizada');

-- --------------------------------------------------------

--
-- Estrutura para tabela `maquinas_senai`
--

CREATE TABLE `maquinas_senai` (
  `id_maquina` int NOT NULL,
  `id_linha` int DEFAULT NULL,
  `id_tipo` int DEFAULT NULL,
  `tag_patrimonio` varchar(30) DEFAULT NULL,
  `data_aquisicao` date DEFAULT NULL,
  `status_operacao` varchar(20) DEFAULT NULL
) ;

--
-- Despejando dados para a tabela `maquinas_senai`
--

INSERT INTO `maquinas_senai` (`id_maquina`, `id_linha`, `id_tipo`, `tag_patrimonio`, `data_aquisicao`, `status_operacao`) VALUES
(1, 1, 1, 'PAT-CNC-101', '2023-02-10', 'MANUTENCAO'),
(2, 2, 2, 'PAT-ROB-202', '2024-06-18', 'ATIVA'),
(3, 3, 3, 'PAT-PRE-303', '2021-11-05', 'MANUTENCAO'),
(4, 4, 4, 'PAT-INJ-404', '2025-01-22', 'ATIVA'),
(5, 5, 5, 'PAT-CSU-505', '2022-08-30', 'DESATIVADA');

-- --------------------------------------------------------

--
-- Estrutura para tabela `ordens_servico`
--

CREATE TABLE `ordens_servico` (
  `id_ordem` int NOT NULL,
  `id_maquina` int DEFAULT NULL,
  `id_tecnico` int DEFAULT NULL,
  `data_abertura` datetime DEFAULT NULL,
  `tipo_manutencao` varchar(20) DEFAULT NULL,
  `status_os` varchar(20) DEFAULT NULL
) ;

--
-- Despejando dados para a tabela `ordens_servico`
--

INSERT INTO `ordens_servico` (`id_ordem`, `id_maquina`, `id_tecnico`, `data_abertura`, `tipo_manutencao`, `status_os`) VALUES
(21, 1, 6, '2026-11-10 08:30:00', 'preventiva', 'concluida'),
(22, 2, 7, '2026-11-12 14:15:00', 'corretiva', 'em_andamento'),
(23, 3, 8, '2026-11-15 09:00:00', 'preditiva', 'aberta'),
(24, 4, 9, '2026-11-17 16:45:00', 'preventiva', 'encerrada'),
(25, 5, 10, '2026-11-19 08:00:00', 'corretiva', 'aberta');

-- --------------------------------------------------------

--
-- Estrutura para tabela `peca_os`
--

CREATE TABLE `peca_os` (
  `id_ordem` int NOT NULL,
  `id_peca` int NOT NULL,
  `qtd_utilizada` int DEFAULT NULL,
  `preco_aplicado` decimal(10,2) DEFAULT NULL
) ;

--
-- Despejando dados para a tabela `peca_os`
--

INSERT INTO `peca_os` (`id_ordem`, `id_peca`, `qtd_utilizada`, `preco_aplicado`) VALUES
(21, 1, 2, 89.90),
(22, 2, 1, 340.00),
(23, 3, 1, 215.50),
(24, 4, 3, 128.00),
(25, 5, 2, 64.75);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tecnicos`
--

CREATE TABLE `tecnicos` (
  `id_tecnico` int NOT NULL,
  `nome_tecnico` varchar(100) DEFAULT NULL,
  `especialidade` varchar(50) DEFAULT NULL,
  `nivel_certificacao` varchar(30) DEFAULT NULL
) ;

--
-- Despejando dados para a tabela `tecnicos`
--

INSERT INTO `tecnicos` (`id_tecnico`, `nome_tecnico`, `especialidade`, `nivel_certificacao`) VALUES
(6, 'Carlos Eduardo Silva', 'Mecatrônica Industrial', 'SENIOR'),
(7, 'Mariana Costa Oliveira', 'Robótica e Automação', 'SPECIALIST'),
(8, 'Rafael Santos Pereira', 'Hidráulica e Pneumática', 'PLENO'),
(9, 'Fernanda Lima Souza', 'Eletroeletrônica', 'JUNIOR'),
(10, 'Lucas Mendes Rocha', 'Usinagem e Metrologia', 'SENIOR');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipos_maquina`
--

CREATE TABLE `tipos_maquina` (
  `id_tipo` int NOT NULL,
  `nome_tipo` varchar(50) DEFAULT NULL,
  `horas_revisao_padrao` int DEFAULT NULL
) ;

--
-- Despejando dados para a tabela `tipos_maquina`
--

INSERT INTO `tipos_maquina` (`id_tipo`, `nome_tipo`, `horas_revisao_padrao`) VALUES
(1, 'Torno CNC', 250),
(2, 'Fresadora', 300),
(3, 'Prensa Hidráulica', 500),
(4, 'Empilhadeira Elétrica', 200),
(5, 'Compressor de Ar Industrial', 400);

-- --------------------------------------------------------

--
-- Estrutura para tabela `unidades_senai`
--

CREATE TABLE `unidades_senai` (
  `id_unidade` int NOT NULL,
  `nome_unidades` varchar(100) NOT NULL,
  `cidade` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `unidades_senai`
--

INSERT INTO `unidades_senai` (`id_unidade`, `nome_unidades`, `cidade`) VALUES
(1, 'SENAI Suiço-Brasileira', 'São Paulo'),
(2, 'SENAI Roberto Mange', 'Campinas'),
(3, 'SENAI Cimatec', 'Salvador'),
(4, 'SENAI Visconde de Mauá', 'Porto Alegre'),
(5, 'SENAI Euvaldo Lodi', 'Belo Horizonte');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `componentes_maquina`
--
ALTER TABLE `componentes_maquina`
  ADD PRIMARY KEY (`id_componente`),
  ADD KEY `fk_id_maquina` (`id_maquina`);

--
-- Índices de tabela `estoque_pecas`
--
ALTER TABLE `estoque_pecas`
  ADD PRIMARY KEY (`id_peca`),
  ADD UNIQUE KEY `codigo_part_number` (`codigo_part_number`);

--
-- Índices de tabela `historico_sensores`
--
ALTER TABLE `historico_sensores`
  ADD PRIMARY KEY (`id_leitura`),
  ADD KEY `fk_sistema_ordens` (`id_ordem`);

--
-- Índices de tabela `linhas_producao`
--
ALTER TABLE `linhas_producao`
  ADD PRIMARY KEY (`id_linha`),
  ADD KEY `fk_id_unidade` (`id_unidade`);

--
-- Índices de tabela `maquinas_senai`
--
ALTER TABLE `maquinas_senai`
  ADD PRIMARY KEY (`id_maquina`),
  ADD UNIQUE KEY `tag_patrimonio` (`tag_patrimonio`),
  ADD KEY `fk_id_linha` (`id_linha`),
  ADD KEY `fk_id_tipo` (`id_tipo`);

--
-- Índices de tabela `ordens_servico`
--
ALTER TABLE `ordens_servico`
  ADD PRIMARY KEY (`id_ordem`),
  ADD KEY `fk_id_maquinas` (`id_maquina`),
  ADD KEY `fk_id_tecnico` (`id_tecnico`);

--
-- Índices de tabela `peca_os`
--
ALTER TABLE `peca_os`
  ADD PRIMARY KEY (`id_ordem`,`id_peca`),
  ADD KEY `fk_id_pecaos` (`id_peca`);

--
-- Índices de tabela `tecnicos`
--
ALTER TABLE `tecnicos`
  ADD PRIMARY KEY (`id_tecnico`);

--
-- Índices de tabela `tipos_maquina`
--
ALTER TABLE `tipos_maquina`
  ADD PRIMARY KEY (`id_tipo`);

--
-- Índices de tabela `unidades_senai`
--
ALTER TABLE `unidades_senai`
  ADD PRIMARY KEY (`id_unidade`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `componentes_maquina`
--
ALTER TABLE `componentes_maquina`
  MODIFY `id_componente` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `estoque_pecas`
--
ALTER TABLE `estoque_pecas`
  MODIFY `id_peca` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `historico_sensores`
--
ALTER TABLE `historico_sensores`
  MODIFY `id_leitura` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `linhas_producao`
--
ALTER TABLE `linhas_producao`
  MODIFY `id_linha` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `maquinas_senai`
--
ALTER TABLE `maquinas_senai`
  MODIFY `id_maquina` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `ordens_servico`
--
ALTER TABLE `ordens_servico`
  MODIFY `id_ordem` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tecnicos`
--
ALTER TABLE `tecnicos`
  MODIFY `id_tecnico` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tipos_maquina`
--
ALTER TABLE `tipos_maquina`
  MODIFY `id_tipo` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `unidades_senai`
--
ALTER TABLE `unidades_senai`
  MODIFY `id_unidade` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `componentes_maquina`
--
ALTER TABLE `componentes_maquina`
  ADD CONSTRAINT `fk_id_maquina` FOREIGN KEY (`id_maquina`) REFERENCES `maquinas_senai` (`id_maquina`);

--
-- Restrições para tabelas `historico_sensores`
--
ALTER TABLE `historico_sensores`
  ADD CONSTRAINT `fk_sistema_ordens` FOREIGN KEY (`id_ordem`) REFERENCES `ordens_servico` (`id_ordem`);

--
-- Restrições para tabelas `linhas_producao`
--
ALTER TABLE `linhas_producao`
  ADD CONSTRAINT `fk_id_unidade` FOREIGN KEY (`id_unidade`) REFERENCES `unidades_senai` (`id_unidade`);

--
-- Restrições para tabelas `maquinas_senai`
--
ALTER TABLE `maquinas_senai`
  ADD CONSTRAINT `fk_id_linha` FOREIGN KEY (`id_linha`) REFERENCES `linhas_producao` (`id_linha`),
  ADD CONSTRAINT `fk_id_tipo` FOREIGN KEY (`id_tipo`) REFERENCES `tipos_maquina` (`id_tipo`);

--
-- Restrições para tabelas `ordens_servico`
--
ALTER TABLE `ordens_servico`
  ADD CONSTRAINT `fk_id_maquinas` FOREIGN KEY (`id_maquina`) REFERENCES `maquinas_senai` (`id_maquina`),
  ADD CONSTRAINT `fk_id_tecnico` FOREIGN KEY (`id_tecnico`) REFERENCES `tecnicos` (`id_tecnico`);

--
-- Restrições para tabelas `peca_os`
--
ALTER TABLE `peca_os`
  ADD CONSTRAINT `fk_id_ordemos` FOREIGN KEY (`id_ordem`) REFERENCES `ordens_servico` (`id_ordem`),
  ADD CONSTRAINT `fk_id_pecaos` FOREIGN KEY (`id_peca`) REFERENCES `estoque_pecas` (`id_peca`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
