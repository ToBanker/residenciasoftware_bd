-- Esse comando 'ativa' a restrição de chave estrangeira (FK) no SQLite que não vem ativada por padrão
-- Configurando dessa forma, conseguimos garantir que só é possível usar a chave estrangeira caso 
-- exista um registro para ela na tabela de origem (onde ela é uma primary key)
PRAGMA foreign_keys = ON; 

-- 
-- Criar tabelas
-- 

CREATE TABLE artista (
    id            INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    nome 	  TEXT,
    popularidade  INTEGER,
    seguidores    INTEGER
);

CREATE TABLE genero (
    id            INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    nome 	  TEXT
);

CREATE TABLE musica (
    id            INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    nome          TEXT,
    url           TEXT, 
    id_artista	  INTEGER,
    FOREIGN KEY(id_artista) REFERENCES artista(id)
);

CREATE TABLE pais (
    id            INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    sigla 	  TEXT,
    nome    TEXT
);

CREATE TABLE artista_genero (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    id_artista INTEGER,
    id_genero INTEGER,
    FOREIGN KEY(id_artista) REFERENCES artista(id),
    FOREIGN KEY(id_genero) REFERENCES genero(id)
);

CREATE TABLE pais_musica (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    id_pais INTEGER,
    id_musica INTEGER,
    posicao       INTEGER,
    streams       INTEGER,
    FOREIGN KEY(id_pais) REFERENCES pais(id),
    FOREIGN KEY(id_musica) REFERENCES musica(id)
);
