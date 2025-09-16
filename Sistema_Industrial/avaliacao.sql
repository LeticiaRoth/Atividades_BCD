CREATE DATABASE sistema_industria;
USE sistema_industria;

-- Criação da Tabela Tecnico --
CREATE TABLE tecnico(
	id_tecnico INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    email VARCHAR(80) NOT NULL UNIQUE,
    descricao TEXT(180) NOT NULL
);

-- Criação da Tabela Peça --
CREATE TABLE peca(
	id_peca INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    nome_fabricante VARCHAR(80) NOT NULL,
    codigo INT NOT NULL UNIQUE
);

-- Criacao Tabela Setor --
CREATE TABLE setor(
	id_setor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL
);


-- Criacao Tabela Agendamento --
CREATE TABLE agendamento(
	id_agendamento INT AUTO_INCREMENT PRIMARY KEY,
    data_proxima DATE NOT NULL
);

-- Criacao Tabela Equipamento -- 
CREATE TABLE equipamento(
	id_equipamento INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    id_agendamento INT,
    FOREIGN KEY (id_agendamento) REFERENCES agendamento(id_agendamento),
    id_setor INT,
    FOREIGN KEY (id_setor) REFERENCES setor(id_setor)
);

-- Criacao Tabela Laudo Técnico --
CREATE TABLE laudo_tecnico(
	id_laudo INT AUTO_INCREMENT PRIMARY KEY,
    observacao TEXT(180) NOT NULL,
    data_realizada DATE NOT NULL,
    resultado VARCHAR(150) NOT NULL
);

-- Criacao Tabela Manutencao --
CREATE TABLE manutencao(
	id_manutencao INT AUTO_INCREMENT PRIMARY KEY,
    tipo ENUM ('Corretiva', 'Preventiva') NOT NULL,
    status_manutencao ENUM ('Aberto', 'Em andamento', 'Concluída') NOT NULL,
    id_equipamento INT,
    FOREIGN KEY (id_equipamento) REFERENCES equipamento(id_equipamento),
    id_laudo INT,
    FOREIGN KEY (id_laudo) REFERENCES laudo_tecnico(id_laudo)
);


-- Criacao Tabela Intermediaria Manutencao_Peca --
CREATE TABLE manutencao_peca(
	id INT AUTO_INCREMENT PRIMARY KEY,
    id_peca INT,
    FOREIGN KEY (id_peca) REFERENCES peca(id_peca),
    id_manutencao INT,
    FOREIGN KEY (id_manutencao) REFERENCES manutencao(id_manutencao),
    quantidade_pecas INT NOT NULL
);

-- Criacao Tabela Intermediaria Tecnico_Manutencao --
CREATE TABLE tecnico_manutencao(
	id INT AUTO_INCREMENT PRIMARY KEY,
    id_tecnico INT,
    FOREIGN KEY (id_tecnico) REFERENCES tecnico(id_tecnico),
    id_manutencao INT,
    FOREIGN KEY(id_manutencao) REFERENCES manutencao (id_manutencao)
);

-- Insercao de Dados dentro das tabelas --

-- Tabela Tecnico --
INSERT INTO tecnico(nome,email,descricao)
VALUES
	(
		'Carlos Roberto Santos', 'carlos.roberto@empresaRX.com', 'Formado em Engenharia Técnica pela Unicamp'
    ),
    (
		'Maria Clara Guimarães', 'guimaraes.clara@empresaRX.com', 'Técnica em manutenções corretivas em peças automobilísticas'
    ),
    (
		'Gabriel de Jesus', 'gabriel.jesus@empresaRX.com', 'Formado na UFJ em mecatronica'
    );
-- Seleçao dos campos --
SELECT * FROM tecnico;

-- Tabela Peca --
INSERT INTO peca(nome, nome_fabricante,codigo)
VALUES 
	(
		'Polia', 'REXROTH Bosch Company', 3456655
    ),
    (
		'Engrenagem', 'Pozelli', 2323118
    ),
    (
		'Retentores',  'Vedatec', 7222454
    );
    
SELECT * FROM peca;
    

 -- Tabela  Setor --
 INSERT INTO setor (nome)
 VALUES 
	(
		'PT'
    ),
    (
		'VM'
    ),
    (
		'PS'
    );
SELECT * FROM setor;


-- Tabela Agendamento --
INSERT INTO agendamento (data_proxima)
VALUES
	(
		'2025-09-30'
    ),
    (
		'2025-11-09'
    ),
    (
		'2025-10-23'
    );
SELECT * FROM agendamento;
  
-- Tabela Laudo Tecnico --
INSERT INTO laudo_tecnico(observacao,data_realizada,resultado)
VALUES
	(
		'Máquina possui um defeito em sua vedação', '2025-01-30', 'Foi corrigido a vedação e trocado o óleo do motor'
    ),
    (
		'Máquina teve seu óleo trocado e parou de funcionar', '2025-05-10', 'Foi esvaziado seu óleo e trocado pelo adequado conforme o fabricante'
    ),
    (
		'Vedação com defeito na hora da produção', '2025-05-30', 'Vedação corrigida com sucesso'
    );
SELECT * FROM laudo_tecnico;


 -- Tabela Equipamento --
 INSERT INTO equipamento (id_setor,id_agendamento,nome)
 VALUES
	(
		1,2, 'Máquina de vedação para carros'
    ),
    (
		2,3, 'Máquina de encher óleo de outras máquinas'
    ),
    (
		3,1, 'Máquina ponte-rolante'
    );
SELECT * FROM equipamento;


-- Tabela Manutencao --
INSERT INTO manutencao(tipo,id_equipamento,id_laudo,status_manutencao)
VALUES
	(
		'Corretiva', 1,2, 'Em andamento'
    ),
    (
		'Preventiva', 2,1, 'Concluída'
    ),
    (
		'Corretiva', 3,3, 'AbertO'
    );
SELECT * FROM manutencao;

-- Tabela Intermediaria Manutencao_Peca --
INSERT INTO manutencao_peca(id_peca,id_manutencao,quantidade_pecas)
VALUES
    (
		1,2,45
    ),
    (
		2,2,24
    ),
    (
		1,3,12
    );
SELECT * FROM manutencao_peca;

-- Tabela Intermediaria Tecnico_Manutencao --
INSERT INTO tecnico_manutencao(id_tecnico,id_manutencao)
VALUES
	(
		1,2
    ),
    (
		3,1
    ),
    (
		2,3
    );
SELECT * FROM tecnico_manutencao;
    
    
-- drop database sistema_industria;