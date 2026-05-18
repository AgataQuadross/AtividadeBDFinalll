CREATE DATABASE biblioteca;
USE biblioteca;

CREATE TABLE categoria_leitor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE leitor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome_completo VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL,
    email VARCHAR(100),
    telefone VARCHAR(15),
    rua VARCHAR(100),
    numero VARCHAR(10),
    bairro VARCHAR(50),
    cidade VARCHAR(50),
    cep VARCHAR(9),
    id_categoria_leitor INT NOT NULL,
    FOREIGN KEY (id_categoria_leitor) REFERENCES categoria_leitor(id)
);

CREATE TABLE categoria_livro (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE autor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE livro (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    ano_publicacao YEAR,
    editora VARCHAR(100),
    isbn VARCHAR(13),
    id_categoria_livro INT NOT NULL,
    FOREIGN KEY (id_categoria_livro) REFERENCES categoria_livro(id)
);

CREATE TABLE livro_autor (
    id_livro INT NOT NULL,
    id_autor INT NOT NULL,
    PRIMARY KEY (id_livro, id_autor),
    FOREIGN KEY (id_livro) REFERENCES livro(id),
    FOREIGN KEY (id_autor) REFERENCES autor(id)
);

CREATE TABLE emprestimo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_leitor INT NOT NULL,
    data_emprestimo DATE NOT NULL,
    data_prevista_devolucao DATE NOT NULL,
    data_devolucao DATE,
    FOREIGN KEY (id_leitor) REFERENCES leitor(id)
);

CREATE TABLE emprestimo_livro (
    id_emprestimo INT NOT NULL,
    id_livro INT NOT NULL,
    PRIMARY KEY (id_emprestimo, id_livro),
    FOREIGN KEY (id_emprestimo) REFERENCES emprestimo(id),
    FOREIGN KEY (id_livro) REFERENCES livro(id)
);

-- Ceiando um usuario
CREATE IF NOT EXISTS USER 'novo_usuario'@'localhost' IDENTIFIED BY '1234senha';
GRANT CREATE, SELECT, UPDATE, DELETE PRIVILEGES ON database_name.* TO 'new_user'@'localhost';


INSERT INTO categoria_leitor (nome) VALUES ('Aluno'), ('Professor'), ('Comunidade'), ('Funcionário');

INSERT INTO categoria_livro (nome) VALUES ('Ficção Científica'), ('Romance'), ('História'), ('Tecnologia'), ('Suspense');

INSERT INTO autor (nome) VALUES 
('Isaac Asimov'), ('George Orwell'), ('J.K. Rowling'), ('Machado de Assis'), 
('Agatha Christie'), ('Stephen King'), ('Clarice Lispector'), ('J.R.R. Tolkien'),
('Robert C. Martin'), ('Yuval Noah Harari');

INSERT INTO leitor (nome_completo, cpf, email, telefone, rua, numero, bairro, cidade, cep, id_categoria_leitor) VALUES
('João Silva', '111.111.111-11', 'joao@email.com', '(11) 98888-1111', 'Rua A', '100', 'Centro', 'São Paulo', '01000-000', 1),
('Maria Oliveira', '222.222.222-22', 'maria@email.com', '(11) 98888-2222', 'Av B', '200', 'Jardins', 'São Paulo', '02000-000', 2),
('Carlos Souza', '333.333.333-33', 'carlos@email.com', '(21) 97777-3333', 'Rua C', '30', 'Lapa', 'Rio de Janeiro', '20000-000', 1),
('Ana Costa', '444.444.444-44', 'ana@email.com', '(31) 96666-4444', 'Rua D', '45', 'Savassi', 'Belo Horizonte', '30000-000', 3),
('Paulo Freire', '555.555.555-55', 'paulo@email.com', '(11) 95555-5555', 'Av E', '500', 'Centro', 'São Paulo', '01000-001', 2),
('Beatriz Reis', '666.666.666-66', 'beatriz@email.com', '(41) 94444-6666', 'Rua F', '12', 'Batel', 'Curitiba', '80000-000', 1),
('Ricardo Lima', '777.777.777-77', 'ricardo@email.com', '(51) 93333-7777', 'Rua G', '78', 'Moinhos', 'Porto Alegre', '90000-000', 4),
('Fernanda Lima', '888.888.888-88', 'fernanda@email.com', '(61) 92222-8888', 'Asa Sul', '102', 'Plano Piloto', 'Brasília', '70000-000', 3),
('Lucas Mendes', '999.999.999-99', 'lucas@email.com', '(81) 91111-9999', 'Rua H', '99', 'Boa Viagem', 'Recife', '50000-000', 1),
('Mariana Vaz', '101.101.101-10', 'mariana@email.com', '(11) 90000-0000', 'Rua I', '10', 'Moema', 'São Paulo', '04000-000', 2);

INSERT INTO livro (titulo, ano_publicacao, editora, isbn, id_categoria_livro) VALUES
('Fundação', 1951, 'Aleph', '9788576571551', 1),
('1984', 1949, 'Companhia das Letras', '9788535914849', 1),
('Harry Potter e a Pedra Filosofal', 1997, 'Rocco', '9788532511010', 2),
('Dom Casmurro', 1899, 'Principis', '9788594318602', 2),
('E não sobrou nenhum', 1939, 'Globo Livros', '9788525057396', 5),
('O Iluminado', 1977, 'Suma', '9788581050478', 5),
('A Hora da Estrela', 1977, 'Rocco', '9788532508102', 2),
('O Hobbit', 1937, 'HarperCollins', '9788595084741', 2),
('Clean Code', 2008, 'Alta Books', '9788576082675', 4),
('Sapiens', 2011, 'L&PM', '9788525432186', 3),
('Eu, Robô', 1950, 'Aleph', '9788576571629', 1),
('A Revolução dos Bichos', 1945, 'Companhia das Letras', '9788535909555', 1),
('Harry Potter e a Câmara Secreta', 1998, 'Rocco', '9788532511669', 2),
('Memórias Póstumas de Brás Cubas', 1881, 'Principis', '9788594318619', 2),
('Assassinato no Expresso Oriente', 1934, 'Globo Livros', '9788525057150', 5),
('It: A Coisa', 1986, 'Suma', '9788581050584', 5),
('Perto do Coração Selvagem', 1943, 'Rocco', '9788532508119', 2),
('O Senhor dos Anéis', 1954, 'HarperCollins', '9788595086356', 2),
('Arquitetura Limpa', 2017, 'Alta Books', '9788550804606', 4),
('Homo Deus', 2015, 'Companhia das Letras', '9788535928198', 3);

INSERT INTO livro_autor (id_livro, id_autor) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9), (10, 10),
(11, 1), (12, 2), (13, 3), (14, 4), (15, 5), (16, 6), (17, 7), (18, 8), (19, 9), (20, 10);

INSERT INTO emprestimo (id_leitor, data_emprestimo, data_prevista_devolucao, data_devolucao) VALUES
(1, '2024-03-01', '2024-03-15', '2024-03-12'), -- No prazo
(2, '2024-03-05', '2024-03-19', '2024-03-22'), -- Atrasado e Devolvido
(3, '2024-03-10', '2024-03-24', NULL),         -- Em aberto e Atrasado (considerando hoje > Março)
(4, '2024-04-01', '2024-04-15', '2024-04-15'), -- No prazo (limite)
(5, '2024-04-05', '2024-04-19', NULL),         -- Em aberto
(6, '2024-01-10', '2024-01-24', '2024-02-05'), -- Muito atrasado, mas devolvido
(7, '2024-04-10', '2024-04-24', NULL);         -- Em aberto

INSERT INTO emprestimo_livro (id_emprestimo, id_livro) VALUES
(1, 1), (1, 11), -- João pegou 2 livros de Asimov
(2, 2),          -- Maria pegou 1984
(3, 9), (3, 19), -- Carlos pegou os livros de Clean Code e Arquitetura
(4, 3), (4, 13), -- Ana pegou Harry Potters
(5, 10),         -- Paulo pegou Sapiens
(6, 16),         -- Beatriz pegou It
(7, 5);          -- Ricardo pegou Agatha Christie


-- Lista de livros emprestados e com quem estão
CREATE VIEW vw_livros_emprestados AS
SELECT
    l.titulo AS  livro,
    lei.nome AS     leitor,
    e.data_emprestimo
FROM  emprestimo e
 JOIN livro l on e.id_livro = l.id
 JOIN leitore lei ON e.id_leitor = lei.id
WHERE e.data_devolucao IS NULL;

-- Lista vremelha
CREATE VIEW vw_lista_vermelha AS
SELECT
    lei.nome AS leitor,
    lei.telefone,
    l.titulo AS livro,
    e.data_prevista_devolucao
FROM emprestimo e
 JOIN leitore lei ON e.id_leitor = lei.id
 JOIN livro l ON e.id_livro = l.id
WHERE e.data_devolucao IS NULL
AND e.data_prevista_devolucao < CURDATE();

-- Acervo por categoria
CREATE VIEW vw_total_por_categoria AS
SELECT
    c.nome AS categoria_livro,
    COUNT(l.id) AS quantidade_livro
    FROM livro l 
     JOIN categoria_livro a ON l.id_categoria_livro = c.id
    GROUP BY c.nome_categoria_livro;
    
-- Quantidade de livros por autor
CREATE VIEW vw_total_por_autor AS
SELECT
    a.nome AS autor,
    COUNT(l.id) AS total_livro
FROM livro l
 JOIN autor a ON l.id_autor = a.id
GROUP BY a.nome;

-- Clientes com endereço completo
CREATE VIEW vw_clientes_endereco_completo AS
SELECT
    nome AS leitor,
    CONCAT(rua, ', ', numero, ' - ', bairro, ', ', cidade) AS endereco_completo
FROM leitor;

-- Livros emprestados por perfil de leitor
CREATE VIEW vw_emprestimos_por_perfil AS
SELECT
    lei.nome AS categoria_leitor,
    l.titulo AS livro,
    lei.nome AS leitor
FROM emprestimo e
 JOIN leitor lei ON e.id_leitor = lei.id
 JOIN livro l ON e.id_livro = l.id
WHERE e.data_prevista_devolucao IS NULL
ORDER BY lei.nome

-- 1. Uma lista mostrando quais livros estão emprestados no momento e com quem estão.
CREATE VIEW vw_livros_atualmente_emprestados AS
SELECT 
    l.titulo AS Livro,
    le.nome_completo AS Leitor,
    e.data_emprestimo AS Data_Emprestimo
FROM emprestimo e
JOIN leitor le ON e.id_leitor = le.id
JOIN emprestimo_livro el ON e.id = el.id_emprestimo
JOIN livro l ON el.id_livro = l.id
WHERE e.data_devolucao IS NULL;


-- 2. Uma lista vermelha mostrando apenas os leitores que estão com livros atrasados.
CREATE VIEW vw_lista_vermelha_atrasos AS
SELECT 
    le.nome_completo AS Leitor,
    le.telefone,
    l.titulo AS Livro,
    e.data_prevista_devolucao
FROM emprestimo e
JOIN leitor le ON e.id_leitor = le.id
JOIN emprestimo_livro el ON e.id = el.id_emprestimo
JOIN livro l ON el.id_livro = l.id
WHERE e.data_devolucao IS NULL 
  AND e.data_prevista_devolucao < CURDATE();


-- 3. Uma lista mostrando quantos livros de cada categoria nós temos no acervo total.
CREATE VIEW vw_total_livros_por_categoria AS
SELECT 
    c.nome AS Categoria,
    COUNT(l.id) AS Quantidade_Total
FROM categoria_livro c
LEFT JOIN livro l ON c.id = l.id_categoria_livro
GROUP BY c.nome;


-- 4. Uma lista mostrando a quantidade total de livros cadastrados por autor.
CREATE VIEW vw_total_livros_por_autor AS
SELECT 
    a.nome AS Autor,
    COUNT(la.id_livro) AS Quantidade_Livros
FROM autor a
LEFT JOIN livro_autor la ON a.id = la.id_autor
GROUP BY a.nome;


-- 5. Uma lista mostrando os clientes e o endereço completo deles (em uma única coluna).
CREATE VIEW vw_clientes_endereco_completo AS
SELECT 
    nome_completo AS Cliente,
    CONCAT(rua, ', nº ', numero, ' - ', bairro, ', ', cidade, ' - CEP: ', cep) AS Endereco_Completo
FROM leitor;


-- 6. Uma lista mostrando quais livros estão emprestados no momento, separados por perfil de leitor.
CREATE VIEW vw_emprestimos_por_perfil AS
SELECT 
    cl.nome AS Perfil_Leitor,
    l.titulo AS Livro,
    le.nome_completo AS Leitor
FROM emprestimo e
JOIN leitor le ON e.id_leitor = le.id
JOIN categoria_leitor cl ON le.id_categoria_leitor = cl.id
JOIN emprestimo_livro el ON e.id = el.id_emprestimo
JOIN livro l ON el.id_livro = l.id
WHERE e.data_devolucao IS NULL
ORDER BY cl.nome;
