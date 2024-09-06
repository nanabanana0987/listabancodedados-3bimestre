-- 1. Selecionar Livros e Autores Publicados por Uma Editora Específica
SELECT l.titulo, a.nome AS autor
FROM livros l
JOIN autores a ON l.id_autor = a.id
WHERE l.editora = 'HarperCollins';

-- 2. Selecionar Livros por Categoria
SELECT l.titulo
FROM livros l
JOIN categorias c ON l.id_categoria = c.id
WHERE c.nome = 'Ficção Científica';

-- 3. Selecionar Livros e Autores
SELECT l.titulo, a.nome AS autor
FROM livros l
JOIN autores a ON l.id_autor = a.id;

-- 4. Selecionar Livros Disponíveis
SELECT titulo
FROM livros
WHERE disponivel = 'Sim';

-- 5. Selecionar Livros por Editora
SELECT titulo
FROM livros
WHERE editora = 'HarperCollins';

-- 6. Selecionar Livros por Idioma
SELECT titulo
FROM livros
WHERE idioma = 'Inglês';

-- 7. Selecionar Livros com Número de Páginas
SELECT titulo
FROM livros
WHERE paginas > 300;

-- 8. Selecionar Livros Publicados em um Intervalo de Anos
SELECT titulo
FROM livros
WHERE ano_publicacao BETWEEN 1950 AND 2000;

-- 9. Selecionar Livros por Autor Específico
SELECT l.titulo
FROM livros l
JOIN autores a ON l.id_autor = a.id
WHERE a.nome = 'George Orwell';

-- 10. Selecionar Livros por Categoria e Ano de Publicação
SELECT l.titulo
FROM livros l
JOIN categorias c ON l.id_categoria = c.id
WHERE c.nome = 'Romance' AND l.ano_publicacao > 2000;

-- 11. Contar Livros por Categoria
SELECT c.nome AS categoria, COUNT(l.id) AS quantidade
FROM livros l
JOIN categorias c ON l.id_categoria = c.id
GROUP BY c.nome;

-- 12. Selecionar Autores com Número de Livros
SELECT a.nome autor, COUNT(l.id) AS quantidade
FROM livros l
JOIN autores a ON l.id_autor = a.id
GROUP BY a.nome;

-- 13. Selecionar Livros com Editoras e Categorias
SELECT l.titulo, e.nome  editora, c.nome  categoria
FROM livros l
JOIN editoras e ON l.id_editora = e.id
JOIN categorias c ON l.id_categoria = c.id;

-- 14. Selecionar Livros com Autores e Idiomas
SELECT l.titulo, a.nome  autor, l.idioma
FROM livros l
JOIN autores a ON l.id_autor = a.id;

-- 15. Selecionar Livros com Autores e Disponibilidade
SELECT l.titulo, a.nome  autor, l.disponivel
FROM livros l
JOIN autores a ON l.id_autor = a.id;

-- 16. Atualizar Disponibilidade de Livros
UPDATE livros
disponivel = 'Não'
WHERE ano_publicacao < 1990;

-- 17. Atualizar Editora de Livros
UPDATE livros 
editora = 'Nova Editora'
WHERE LIKE '978-006%';

-- 18. Inserir Novo Livro
INSERT INTO livros (titulo, id_autor, ano_publicacao, disponivel, id_categoria, isbn, id_editora, paginas, idioma)
 ('As Aventuras de Sherlock Holmes', 
        (SELECT id FROM autores WHERE nome = 'Arthur Conan Doyle'), 
        1892, 'Sim', 
        (SELECT id FROM categorias WHERE nome = 'Mistério'), 
        '978-0451524935', 
        (SELECT id FROM editoras WHERE nome = 'Penguin Books'), 
        307, 'Inglês');

-- 19. Inserir Novo Autor
INSERT INTO autores (nome) ('Agatha Christie');

-- 20. Inserir Novo Relacionamento Livro-Autor
INSERT INTO livros_autores (id_livro, id_autor SELECT id FROM livros WHERE titulo = 'As Aventuras de Sherlock Holmes
       SELECT id FROM autores WHERE nome = 'Arthur Conan Doyle