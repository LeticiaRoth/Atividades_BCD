create database biblioteca_leticia;
use biblioteca_leticia;

-- Criação das tabelas
create table Livro(
	id_livro int primary key auto_increment,
    titulo varchar(150),
    descricao text,
    quantidade_paginas int,
    isbn varchar(13)
);

create table Usuario(
	id_usuario int primary key auto_increment,
    nome varchar(150),
    email varchar(50) unique,
    data_cadastro date,
    nivel_associacao enum ('regular','premium')
);

create table Autor(
	id_autor int,
    nome varchar(150),
    data_nascimento date,
    biografia text
);

create table Categoria(
	id_categoria int,
    nome varchar(150)
);

create table Emprestimo(
	id_emprestimo int primary key auto_increment,
    data_limite_devolucao date,
    data_devolucao date,
    data_emprestimo date,
    usuario_id int,
    foreign key (usuario_id) references Usuario(id_usuario),
    livro_id int,
    foreign key (livro_id) references Livro(id_livro)
);

-- Tabela associativa de Autor e Livro
create table Autor_Livro(
	id_autor_livro int,
    id_autor int,
    foreign key (id_autor) references Autor(id_autor),
    id_livro int,
    foreign key (id_livro) references Livro(id_livro)
);


-- Tabela associativa de Categoria e Livro
create table Categoria_Livro(
	id_categoria_livro int,
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
        'Hazel Grace Lancaster e Augustus Waters são dois adolescentes que se conhecem em um grupo de apoio para pacientes com câncer. Por causa da doença, Hazel sempre descartou a ideia de se envolver amorosamente, mas acaba cedendo ao se apaixonar por Augustus',
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
    );