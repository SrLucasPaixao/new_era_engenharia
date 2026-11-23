-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 23/11/2026 às 22:50
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `new_era`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `candidaturas`
--

CREATE TABLE `candidaturas` (
  `id_candidatura` int(10) UNSIGNED NOT NULL,
  `id_usuario` int(10) UNSIGNED NOT NULL,
  `id_vaga` int(10) UNSIGNED NOT NULL,
  `data_candidatura` datetime DEFAULT current_timestamp(),
  `status` enum('recebida','em_analise','aprovada','reprovada') NOT NULL DEFAULT 'recebida'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `candidaturas`
--

INSERT INTO `candidaturas` (`id_candidatura`, `id_usuario`, `id_vaga`, `data_candidatura`, `status`) VALUES
(1, 2, 1, '2026-11-21 03:14:09', 'recebida'),
(2, 2, 2, '2026-11-21 03:14:09', 'recebida'),
(3, 3, 2, '2026-11-21 03:14:09', 'recebida');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cursos`
--

CREATE TABLE `cursos` (
  `id_curso` int(10) UNSIGNED NOT NULL,
  `id_administrador` int(10) UNSIGNED NOT NULL,
  `titulo` varchar(120) NOT NULL,
  `descricao` text NOT NULL,
  `carga_horaria` smallint(5) UNSIGNED NOT NULL,
  `status` enum('ativo','inativo','encerrado') NOT NULL DEFAULT 'ativo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cursos`
--

INSERT INTO `cursos` (`id_curso`, `id_administrador`, `titulo`, `descricao`, `carga_horaria`, `status`) VALUES
(1, 4, 'Planejamento de Obras', 'Fundamentos de planejamento e gestão de obras.', 40, 'ativo'),
(2, 4, 'Modelagem 3D', 'Introdução à modelagem de projetos arquitetônicos.', 30, 'ativo');

-- --------------------------------------------------------

--
-- Estrutura para tabela `dados_profissionais`
--

CREATE TABLE `dados_profissionais` (
  `id_usuario` int(10) UNSIGNED NOT NULL,
  `formacao` varchar(150) NOT NULL,
  `area_atuacao` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `dados_profissionais`
--

INSERT INTO `dados_profissionais` (`id_usuario`, `formacao`, `area_atuacao`) VALUES
(2, 'Engenharia Civil', 'Construção de edifícios'),
(3, 'Arquitetura e Urbanismo', 'Projetos arquitetônicos');

-- --------------------------------------------------------

--
-- Estrutura para tabela `matriculas`
--

CREATE TABLE `matriculas` (
  `id_matricula` int(10) UNSIGNED NOT NULL,
  `id_usuario` int(10) UNSIGNED NOT NULL,
  `id_curso` int(10) UNSIGNED NOT NULL,
  `data_matricula` datetime DEFAULT current_timestamp(),
  `status` enum('inscrito','em_andamento','concluido','cancelado') NOT NULL DEFAULT 'inscrito'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `matriculas`
--

INSERT INTO `matriculas` (`id_matricula`, `id_usuario`, `id_curso`, `data_matricula`, `status`) VALUES
(1, 2, 1, '2026-11-21 03:14:29', 'inscrito'),
(2, 2, 2, '2026-11-21 03:14:29', 'inscrito'),
(3, 3, 2, '2026-11-21 03:14:29', 'inscrito');

-- --------------------------------------------------------

--
-- Estrutura para tabela `perfis`
--

CREATE TABLE `perfis` (
  `id_perfil` int(10) UNSIGNED NOT NULL,
  `nome` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `perfis`
--

INSERT INTO `perfis` (`id_perfil`, `nome`) VALUES
(3, 'Administrador'),
(1, 'Cliente'),
(2, 'Profissional');

-- --------------------------------------------------------

--
-- Estrutura para tabela `respostas_solicitacoes`
--

CREATE TABLE `respostas_solicitacoes` (
  `id_resposta` int(10) UNSIGNED NOT NULL,
  `id_solicitacao` int(10) UNSIGNED NOT NULL,
  `id_administrador` int(10) UNSIGNED NOT NULL,
  `mensagem` text NOT NULL,
  `data_resposta` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `respostas_solicitacoes`
--

INSERT INTO `respostas_solicitacoes` (`id_resposta`, `id_solicitacao`, `id_administrador`, `mensagem`, `data_resposta`) VALUES
(1, 1, 4, 'Olá! Nossa equipe está à disposição para apresentar nossos serviços.', '2026-11-21 03:14:55');

-- --------------------------------------------------------

--
-- Estrutura para tabela `solicitacoes`
--

CREATE TABLE `solicitacoes` (
  `id_solicitacao` int(10) UNSIGNED NOT NULL,
  `id_usuario` int(10) UNSIGNED NOT NULL,
  `id_usuario_encerramento` int(10) UNSIGNED DEFAULT NULL,
  `assunto` varchar(150) NOT NULL,
  `mensagem` text NOT NULL,
  `status` enum('aberto','em_atendimento','encerrado') NOT NULL DEFAULT 'aberto',
  `data_abertura` datetime DEFAULT current_timestamp(),
  `data_encerramento` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `solicitacoes`
--

INSERT INTO `solicitacoes` (`id_solicitacao`, `id_usuario`, `id_usuario_encerramento`, `assunto`, `mensagem`, `status`, `data_abertura`, `data_encerramento`) VALUES
(1, 1, NULL, 'Informações sobre a empresa', 'Gostaria de conhecer melhor os serviços da New Era.', 'aberto', '2026-11-21 03:14:43', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(10) UNSIGNED NOT NULL,
  `id_perfil` int(10) UNSIGNED NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `senha` varchar(150) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `id_perfil`, `nome`, `email`, `senha`, `telefone`) VALUES
(1, 1, 'Ana Teste', 'ana@newera.test', 'HASH_TESTE_ANA', '61990000001'),
(2, 2, 'Carlos Teste', 'carlos@newera.test', 'HASH_TESTE_CARLOS', '61990000002'),
(3, 2, 'Mariana Teste', 'mariana@newera.test', 'HASH_TESTE_MARIANA', '61990000003'),
(4, 3, 'Roberto Teste', 'roberto@newera.test', 'HASH_TESTE_ROBERTO', '61990000004');

-- --------------------------------------------------------

--
-- Estrutura para tabela `vagas`
--

CREATE TABLE `vagas` (
  `id_vaga` int(10) UNSIGNED NOT NULL,
  `id_administrador` int(10) UNSIGNED NOT NULL,
  `titulo` varchar(120) NOT NULL,
  `descricao` text NOT NULL,
  `requisitos` text NOT NULL,
  `status` enum('aberta','pausada','encerrada') NOT NULL DEFAULT 'aberta',
  `data_publicacao` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `vagas`
--

INSERT INTO `vagas` (`id_vaga`, `id_administrador`, `titulo`, `descricao`, `requisitos`, `status`, `data_publicacao`) VALUES
(1, 4, 'Engenheiro Civil', 'Atuação em obras residenciais.', 'Graduação em Engenharia Civil.', 'aberta', '2026-11-21 03:13:23'),
(2, 4, 'Arquiteto', 'Desenvolvimento de projetos arquitetônicos.', 'Graduação em Arquitetura e Urbanismo.', 'aberta', '2026-11-21 03:13:23');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `candidaturas`
--
ALTER TABLE `candidaturas`
  ADD PRIMARY KEY (`id_candidatura`),
  ADD UNIQUE KEY `uq_usuario_vaga` (`id_usuario`,`id_vaga`),
  ADD KEY `fk_candidaturas_vaga` (`id_vaga`);

--
-- Índices de tabela `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`id_curso`),
  ADD KEY `fk_cursos_administrador` (`id_administrador`);

--
-- Índices de tabela `dados_profissionais`
--
ALTER TABLE `dados_profissionais`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Índices de tabela `matriculas`
--
ALTER TABLE `matriculas`
  ADD PRIMARY KEY (`id_matricula`),
  ADD UNIQUE KEY `uq_usuario_curso` (`id_usuario`,`id_curso`),
  ADD KEY `fk_matriculas_curso` (`id_curso`);

--
-- Índices de tabela `perfis`
--
ALTER TABLE `perfis`
  ADD PRIMARY KEY (`id_perfil`),
  ADD UNIQUE KEY `nome` (`nome`);

--
-- Índices de tabela `respostas_solicitacoes`
--
ALTER TABLE `respostas_solicitacoes`
  ADD PRIMARY KEY (`id_resposta`),
  ADD KEY `fk_respostas_solicitacao` (`id_solicitacao`),
  ADD KEY `fk_respostas_administrador` (`id_administrador`);

--
-- Índices de tabela `solicitacoes`
--
ALTER TABLE `solicitacoes`
  ADD PRIMARY KEY (`id_solicitacao`),
  ADD KEY `fk_solicitacoes_usuario` (`id_usuario`),
  ADD KEY `fk_solicitacoes_encerramento` (`id_usuario_encerramento`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `fk_usuarios_perfis` (`id_perfil`);

--
-- Índices de tabela `vagas`
--
ALTER TABLE `vagas`
  ADD PRIMARY KEY (`id_vaga`),
  ADD KEY `fk_vagas_administrador` (`id_administrador`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `candidaturas`
--
ALTER TABLE `candidaturas`
  MODIFY `id_candidatura` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `cursos`
--
ALTER TABLE `cursos`
  MODIFY `id_curso` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `matriculas`
--
ALTER TABLE `matriculas`
  MODIFY `id_matricula` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `perfis`
--
ALTER TABLE `perfis`
  MODIFY `id_perfil` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `respostas_solicitacoes`
--
ALTER TABLE `respostas_solicitacoes`
  MODIFY `id_resposta` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `solicitacoes`
--
ALTER TABLE `solicitacoes`
  MODIFY `id_solicitacao` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `vagas`
--
ALTER TABLE `vagas`
  MODIFY `id_vaga` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `candidaturas`
--
ALTER TABLE `candidaturas`
  ADD CONSTRAINT `fk_candidaturas_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_candidaturas_vaga` FOREIGN KEY (`id_vaga`) REFERENCES `vagas` (`id_vaga`) ON UPDATE CASCADE;

--
-- Restrições para tabelas `cursos`
--
ALTER TABLE `cursos`
  ADD CONSTRAINT `fk_cursos_administrador` FOREIGN KEY (`id_administrador`) REFERENCES `usuarios` (`id_usuario`) ON UPDATE CASCADE;

--
-- Restrições para tabelas `dados_profissionais`
--
ALTER TABLE `dados_profissionais`
  ADD CONSTRAINT `fk_dados_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `matriculas`
--
ALTER TABLE `matriculas`
  ADD CONSTRAINT `fk_matriculas_curso` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id_curso`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_matriculas_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON UPDATE CASCADE;

--
-- Restrições para tabelas `respostas_solicitacoes`
--
ALTER TABLE `respostas_solicitacoes`
  ADD CONSTRAINT `fk_respostas_administrador` FOREIGN KEY (`id_administrador`) REFERENCES `usuarios` (`id_usuario`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_respostas_solicitacao` FOREIGN KEY (`id_solicitacao`) REFERENCES `solicitacoes` (`id_solicitacao`) ON UPDATE CASCADE;

--
-- Restrições para tabelas `solicitacoes`
--
ALTER TABLE `solicitacoes`
  ADD CONSTRAINT `fk_solicitacoes_encerramento` FOREIGN KEY (`id_usuario_encerramento`) REFERENCES `usuarios` (`id_usuario`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_solicitacoes_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON UPDATE CASCADE;

--
-- Restrições para tabelas `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_usuarios_perfis` FOREIGN KEY (`id_perfil`) REFERENCES `perfis` (`id_perfil`) ON UPDATE CASCADE;

--
-- Restrições para tabelas `vagas`
--
ALTER TABLE `vagas`
  ADD CONSTRAINT `fk_vagas_administrador` FOREIGN KEY (`id_administrador`) REFERENCES `usuarios` (`id_usuario`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
