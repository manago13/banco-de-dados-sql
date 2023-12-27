CREATE TABLE turma (
    id_turma SERIAL PRIMARY KEY,
    codigo_turma VARCHAR(10), 
    nome_turma VARCHAR(100)
);

CREATE TABLE alunos (
    id_aluno SERIAL PRIMARY KEY,
    nome_aluno VARCHAR(100),
	aluno_alocado BOOLEAN,
	id_turma INT, 
	FOREIGN KEY (id_turma) REFERENCES turma (id_turma)
);

-- Inserir pelo menos duas turmas diferentes na tabela de turma
INSERT INTO turma(codigo_turma, nome_turma)
VALUES
    ('DS-PY-006', 'banco de dados I'),
    ('DS-PY-007', 'estatística I')
;

-- Inserir pelo menos 1 aluno alocado em cada uma destas turmas na tabela aluno (todos com NULL na coluna aluno_alocado);
INSERT INTO alunos(nome_aluno, id_turma)
VALUES
    ('joao', 2),
    ('maria', 1)
;

-- Inserir pelo menos 2 alunos não alocados em nenhuma turma na tabela aluno (todos com NULL na coluna aluno_alocado);
INSERT INTO alunos(nome_aluno)
VALUES
    ('jose'),
    ('ana'),
    ('alex')
;

-- Atualizar a coluna aluno_alocado da tabela aluno, de modo que os alunos associados a uma disciplina recebam o valor True e alunos não associdos a nenhuma disciplina recebam o falor False para esta coluna.
UPDATE alunos
SET aluno_alocado = CASE
    WHEN id_turma IS NULL THEN false
    ELSE true
    END
;