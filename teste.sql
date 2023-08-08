-- Tabela de testes iniciais

CREATE TABLE IF NOT EXISTS teste (
	id INTEGER PRIMARY KEY NOT NULL,
	name TEXT NOT NULL,
	qtt INTERGER
 );

INSERT INTO teste (name, qtt)
	VALUES 	('Árvore', 5),
		('Pedra', NULL);

SELECT * FROM teste;

