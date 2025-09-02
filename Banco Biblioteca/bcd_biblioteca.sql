create database biblioteca_leticia;
use biblioteca_leticia;

-- Criação das tabelas
create table Livro(
	id_livro int auto_increment primary key,
    titulo varchar(150),
    descricao text,
    quantidade_paginas int,
    isbn varchar(13) unique
);

create table Usuario(
	id_usuario int auto_increment primary key,
    nome varchar(150),
    email varchar(50) unique,
    data_cadastro date,
    nivel_associacao enum ('Regular','Premium')
);

create table Autor(
	id_autor int auto_increment primary key,
    nome varchar(150),
    data_nascimento date,
    biografia text
);

create table Categoria(
	id_categoria int auto_increment primary key,
    nome varchar(150)
);

create table Emprestimo(
	id_emprestimo int auto_increment primary key,
    data_emprestimo date,
    data_limite_devolucao date,
    data_devolucao date,
    id_usuario int,
    foreign key (id_usuario) references Usuario(id_usuario),
    id_livro int,
    foreign key (id_livro) references Livro(id_livro)
);

-- Tabela associativa de Autor e Livro
create table Autor_Livro(
	id_autor_livro int auto_increment primary key,
    id_autor int,
    foreign key (id_autor) references Autor(id_autor),
    id_livro int,
    foreign key (id_livro) references Livro(id_livro)
);


-- Tabela associativa de Categoria e Livro
create table Categoria_Livro(
	id_categoria_livro int auto_increment primary key,
    id_categoria int,
    foreign key (id_categoria) references Categoria(id_categoria),
    id_livro int,
    foreign key (id_livro) references Livro(id_livro)
);


-- Inserção de dados na tabela Livro
insert into Livro(titulo,descricao,quantidade_paginas,isbn)
values
	(	
		'Dom Casmurro', 
		'Narra a vida de Bento Santiago, que, movido por um ciúme obsessivo, tenta provar a traição de sua esposa, Capitu, com seu melhor amigo, Escobar, baseando-se na semelhança do filho com o amigo e no comportamento da mulher no funeral de Escoba',
		'250',
		'9788516096892'
    ),
    
    (
		'Assim que acaba',
		'Lily Bloom, que, após uma infância marcada pela violência doméstica, apaixona-se por Ryle Kincaid, um neurocirurgião carismático. A relação, no entanto, escala para um ciclo de abuso, forçando Lily a confrontar os traumas do passado e a tomar a difícil decisão de romper com o padrão, com a ajuda inesperada de seu primeiro amor, Atlas. ',
		'260',
		'8501112518'
    ),
    
    (
		'O Guarani',
        'Conta a historia de Peri, um índio forte e leal da Nação Goitacá e sua relação com a familia de dom Antonio de Mariz, um fidalgo português.',
        '180',
        '97885943188'
    ),
    
    (
		'A Culpa é das Estrelas',
        'Hazel e Augustus, dois jovens com câncer, se conhecem em um grupo de apoio e vivem um intenso romance apesar das dificuldades da doença.',
        '288',
        '9892320946'
    ),
    
    (
		'O Pequeno Príncipe',
        'Obra de Antoine de Saint-Exupéry que mistura poesia e filosofia em uma fábula sobre amizade, amor e essência da vida.',
        '96',
        '9788520925836'
    ),
    
    (
		'Orgulho e Preconceito',
        'Romance de Jane Austen que aborda questões de classe, casamento e orgulho na Inglaterra do século XIX.',
        '424',
        '9788582850407'
    ),
    (
		'Harry Potter e a Pedra Filosofal',
        'Primeiro livro da saga de J.K. Rowling, onde Harry descobre que é um bruxo e entra em Hogwarts.',
        '264',
		'9788532530787'
    ),
    (
		'A Metamorfose',
        'Novela de Franz Kafka sobre Gregor Samsa, que acorda transformado em um inseto gigante, explorando alienação e identidade.',
        '104',
        '9788572326972'
    ),
    (
		'1984',
        'Uma distopia clássica que retrata um regime totalitário onde o governo vigia todos os passos dos cidadãos. O livro é uma crítica poderosa ao autoritarismo e à manipulação da verdade.',
        '416',
        '9788535914849'
    ),
    (
		'O Alquimista',
        'Um jovem pastor parte em busca de um tesouro e de si mesmo.',
        '192',
        '9780061122415'
    );
    
-- Inserção de dados na Tabela de Usuario
insert into Usuario(nome,email,data_cadastro,nivel_associacao)
values
	(
		'Ana Souza',
        'ana.souza@example.com',
        '2025-08-01',
        'Premium'
    ),
    (
		'Carlos Mendes',
        'carlos.mendes@gmail.com',
        '2025-08-02',
        'Regular'
    ),
    (
		'Pedro Lima',
        'pedrolima1@gmail.com',
        '2024-09-12',
        'Premium'
    ),
    (
		'Fernanda Alves',
        'alvesfernanda23@gmail.com',
        '2024-09-23',
        'Premium'
    ),
    (
		'Letícia Mendes',
        'mendes.leticia@gmail.com',
        '2025-04-02',
        'Regular'
    ),
    (
		'Layslla Paiva',
        'layslla.paiva@gmail.com',
        '2025-09-23',
        'Premium'
    ),
    (
		'João Marcos',
        'marcosjoaa@gmail.com',
        '2024-09-23',
        'Regular'
    ),
    (
		'Fabio Roth',
        'fabioroth67@gmail.com',
        '2025-09-20',
        'Premium'
    ),
    (
		'Leonardo Mateus',
        'mateus.leonardo126@gmail.com',
        '2024-05-23',
        'Regular'
    ),
    (
		'Carla Diaz',
        'diazzcarla@gmail.com',
        '2025-09-21',
        'Premium'
    );
    
-- Inserção de dados Tabela Autor
insert into Autor(nome,data_nascimento,biografia)
values
	(
		'Paulo Coelho',
        '1947-08-24',
        'Escritor brasileiro conhecido por suas obras de cunho espiritual e filosófico. O Alquimista é seu livro mais famoso.'
    ),
    (
		'George Orwell',
        '1903-06-25',
        'Jornalista e escritor inglês, Orwell ficou famoso por suas críticas ao totalitarismo e pela defesa da justiça social.'
    ),
    (
		'Franz Kafka',
        '1883-07-03',
        'Escritor tcheco de língua alemã, Kafka é conhecido por suas obras que exploram o absurdo, o isolamento e a burocracia.'
    ),
    (
		'J.K. Rowling',
        '1965-07-31',
        'Escritora britânica que alcançou fama mundial com a série Harry Potter. Seu primeiro livro, Harry Potter e a Pedra Filosofal..'
    ),
    (
		'Jane Austen',
        '1775-12-16',
        'Escritora inglesa renomada por suas sátiras sociais e romances, Austen criou obras como Orgulho e Preconceito.'
    ),
    (
		'Antoine de Saint-Exupéry',
        '1900-06-29',
        'Piloto e escritor francês, Saint-Exupéry é mundialmente famoso por O Pequeno Príncipe, uma obra poética e filosófica.'
    ),
    (
		'John Green',
        '1977-08-24',
        'Autor contemporâneo norte-americano de romances para jovens adultos, Green ganhou fama mundial com A Culpa é das Estrelas.'
    ),
    (
		'José de Alencar',
        '1829-05-01',
        'mportante romancista brasileiro do século XIX, Alencar é conhecido por suas obras que valorizam a cultura e a história do Brasil.'
    ),
    (
		'Eduardo Galeano',
        '1940-07-03',
        'Escritor uruguaio conhecido por suas obras que misturam história, jornalismo e literatura, Galeano escreveu sobre política, cultura e injustiças sociais.'
    ),
    (
		'Machado de Assis',
        '1839-06-21',
        'Considerado um dos maiores escritores brasileiros, Machado de Assis foi um dos fundadores da Academia Brasileira de Letras.'
    );


-- Inserção de dados na Tabela Categoria
insert into Categoria(nome)
values
	('Literatura Brasileira Clássica'),
    ('Romance Contemporâneo'),
    ('Romance Histórico'),
    ('Drama'),
    ('Romance Clássico Inglês'),
    ('Literatura Infantojuvenil'),
    ('Fantasia Juvenil'),
    ('Ficção Filosófica'),
    ('Distopia'),
    ('Espiritual');
    
-- Inserção de dados na Tabela Emprestimo
insert into Emprestimo(id_usuario,id_livro,data_emprestimo,data_limite_devolucao,data_devolucao)
values
	(1,2,'2025-02-01','2025-02-15','2025-02-12'),
    (3,10,'2025-08-05','2025-08-17','2025-08-20'),
    (4,9,'2025-06-07','2025-06-21','2025-06-21'),
    (6,3,'2025-08-10','2025-08-24','2025-08-22'),
    (2,8,'2025-03-12','2025-03-26','2025-03-29'),
    (7,1,'2025-05-15','2025-05-29','2025-05-28'),
    (5,4,'2025-01-12','2025-01-20','2025-08-18'),
    (10,6,'2025-08-15','2025-08-20','2025-08-17'),
    (8,7,'2025-08-15','2025-08-20','2025-08-17'),
    (9,5,'2025-03-09','2025-03-14','2025-03-12');

-- Inserção de dados Tabela Associativa Autor/Livro
insert into Autor_Livro(id_livro,id_autor)
values
	(1,4),
    (5,8),
    (3,6),
    (7,9),
    (5,7),
    (2,5),
    (4,9),
    (10,10),
    (9,1),
    (6,1);
    
-- Inserção de dados Tabela Associativa Categoria/Livro
insert into Categoria_Livro(id_livro,id_categoria)
values
	(1,6),
    (2,8),
    (5,1),
    (6,2),
    (7,3),
    (10,4),
    (9,9),
    (3,7),
    (8,10),
    (4,5);
    

-- Para visualizar os dados dentro da tabela
select * from Usuario;
select * from Autor;
select * from Livro;
select * from Categoria;
select * from Emprestimo;
select * from Autor_Livro;
select * from Categoria_Livro;

-- Função (PESQUISADA) para ver quais usuários entregaram com atrasado
select count(*) as usuario_entrega_atrasada
from (
	select distinct id_usuario nome
    from Emprestimo
    where data_devolucao > data_limite_devolucao
    ) as t;

-- Para visualizar as tabelas
show tables;    

-- Ver os campos de uma tabela especifica
describe Usuario;


drop database biblioteca_leticia;