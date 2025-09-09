CREATE DATABASE plataforma_estudos;
USE plataforma_estudos;

-- Criação da tabela Plano
CREATE TABLE plano_vigente(
	id_plano INT AUTO_INCREMENT PRIMARY KEY,
    tipo_plano ENUM ("Basico","Premium") NOT NULL,
    beneficios TEXT(150) NOT NULL
);
    

-- Criação da tabela aluno
CREATE TABLE aluno(
	id_aluno INT AUTO_INCREMENT	PRIMARY KEY,
    nome VARCHAR (180) NOT NULL,
    data_nascimento DATE NOT NULL,
    email VARCHAR(80) UNIQUE,
    telefone VARCHAR(9) NOT NULL,
    id_plano INT,
    FOREIGN KEY (id_plano) REFERENCES plano_vigente(id_plano)
);

-- Criação da tabela Perfil
CREATE TABLE perfil(
	id_perfil INT AUTO_INCREMENT PRIMARY KEY,
    foto BLOB NULL,
    biografia TEXT(150) NULL,
    data_nascimento DATE NULL,
    id_aluno INT,
    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno)
);

-- Criação da tabela curso
CREATE TABLE curso(
	id_curso INT AUTO_INCREMENT PRIMARY KEY,
    descricao TEXT(150) NOT NULL,
    nome VARCHAR(80) NOT NULL
);


-- Criação da tabela Professor
CREATE TABLE professor(
	id_professor INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR (180) NOT NULL,
    data_nascimento DATE NOT NULL,
    email VARCHAR(80) UNIQUE
);

-- Criação da tabela Modulo
CREATE TABLE modulo(
	id_modulo INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR (50) NOT NULL,
    ordem INT NOT NULL,
    carga_horaria INT NOT NULL,
    id_curso INT,
    FOREIGN KEY (id_curso) REFERENCES curso(id_curso)
);


-- Criação da Tabela Intermediária Inscricao (Aluno_Curso)
CREATE TABLE inscricao(
	id_inscricao INT AUTO_INCREMENT PRIMARY KEY,
    data_inscricao DATE NOT NULL,
    situacao ENUM('Ativa','Concluída','Trancada') NOT NULL,
    id_aluno INT,
    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
    id_curso INT,
    FOREIGN KEY(id_curso) REFERENCES curso(id_curso)
);


-- Criação da Tabela Intermediária Pagina_Curso (Professor_Curso)ALTER
CREATE TABLE pagina_curso(
	id_pagina_curso INT AUTO_INCREMENT PRIMARY KEY,
    papel_professor ENUM('Titular','Tutor') NOT NULL,
    id_professor INT,
    FOREIGN KEY (id_professor) REFERENCES professor(id_professor),
    id_curso INT,
    FOREIGN KEY (id_curso) REFERENCES curso(id_curso)
);


-- Inserção de Dados Tabela Plano_Vigente
INSERT INTO plano_vigente(tipo_plano,beneficios)
VALUES
	(
		'Basico','Certificado Digital e Suporte 24h'
    ),
    (
		'Premium','Acesso vitalíico a plataforma de estudos'
    ),
    (
		'Basico','Certificado Digital e Suporte 24h'
    );
    
SELECT * FROM plano_vigente;


-- Inserção de Dados Tabela Aluno
INSERT INTO aluno(nome,data_nascimento,email,telefone,id_plano)
VALUES
	(
		'Maria Oliveira', '2000-05-12', 'maria.oliveira@email.com', '987654321', 1
    ),
    (
		'João Silva', '1998-09-23', 'joao.silva@email.com', '912345678', 2
    ),
    (
		'Mateus Roth', '1997-03-23','mateus.roth@email', '976543210',3
    );
    
SELECT * FROM aluno;


-- Inserção de Dados da Tabela Perfil
INSERT INTO perfil(foto,biografia,data_nascimento,id_aluno)
VALUES
	(
		'IMAGEM.png', 'Estudante dedicada, apaixonada por leitura e música.', '2000-05-12', 1
    ),
    (
		'IMAGEM.jpg', 'Interessado em tecnologia e esportes, sempre buscando aprender.', '1998-09-23', 2
    ),
    (
		'IMAGEM.png', 'Ama viajar e conhecer novas culturas. Focada em desenvolvimento pessoal.', '2002-03-15', 3
    );
SELECT * FROM perfil;


-- Inserção de Dados da Tabela Curso
INSERT INTO curso(descricao,nome)
VALUES
	(
		'Curso básico de informática, voltado para iniciantes.', 'Informática Básica'
    ),
    (
		'Curso avançado de programação em Python.', 'Programação em Python'
    ),
    (
		'Curso de inglês com foco em conversação para negócios.', 'Inglês Empresarial'
    );
SELECT * FROM curso;


-- Inserção de Dados da Tabela Professor
INSERT INTO professor(nome,data_nascimento,email)
VALUES
	(
		'Carlos Almeida', '1980-04-15', 'carlos.almeida@escola.com'
    ),
    (
		'Fernanda Costa', '1975-09-30', 'fernanda.costa@escola.com'
    ),
    (
		'Ricardo Silva', '1988-12-05', 'ricardo.silva@escola.com'
    );
SELECT * FROM professor;


-- Inserção de Dados da Tabela Modulo
INSERT INTO modulo(titulo,ordem,carga_horaria,id_curso)
VALUES
	(
		'Introdução à Informática', 1, 27, 1
    ),
    (
		'Estruturas de Dados em Python', 2, 35, 2
    ),
    (
		'JAVA - Iniciante ao Avançado', 3, 80, 3
    );
SELECT * FROM modulo;

-- Inserção de Dados da Tabela Inscricao
INSERT INTO inscricao(data_inscricao,situacao,id_aluno,id_curso)
VALUES
	(
		'2025-02-01', 'Ativa', 1, 1
    ),
    (
		'2025-03-10', 'Concluída', 2, 2
    ),
    (
		'2025-04-05', 'Trancada', 3, 3
    );
SELECT * FROM inscricao;


-- Inserção de Dados na Tabeça de Pagina Curso
INSERT INTO pagina_curso(papel_professor,id_professor,id_curso)
VALUES
	(
		'Titular', 1, 1
    ),
    (
		'Tutor', 2, 2
    ),
    (
		'Titular', 3, 3
    );
SELECT * FROM pagina_curso;
    
DROP DATABASE plataforma_estudos;


