-- 1. Título e preço dos livros disponíveis
SELECT titulo AS titulo_do_livro, preco AS preco_em_reais FROM livros WHERE disponivel = TRUE;

-- 2. Total de livros
SELECT COUNT(*) AS total_livros FROM livros;

-- 3. Leitores distintos
SELECT COUNT(DISTINCT leitor) FROM emprestimos;

-- 4. Nacionalidades dos autores (únicas)
SELECT DISTINCT pais FROM autores;

-- 5. Combinações únicas nome/cidade em empréstimos
SELECT DISTINCT leitor, ciade FROM emprestimos;

-- 6. Títulos em ordem alfabética
SELECT titulo FROM livros ORDER BY titulo;

-- 7. Livros publicados entre 1940 e 1960
SELECT * FROM livros WHERE ano_publicacao BETWEEN 1940 AND 1960;

-- 8. Autores de países com 'Unido' (usando LIKE)
SELECT * FROM autores WHERE pais LIKE '%Unido%';

-- 9. Livros dos gêneros 1 ou 3 (usando IN)
SELECT * FROM livros WHERE id_genero IN (1, 3);

-- 10. Livros não disponíveis (usando NOT)
SELECT * FROM livros WHERE NOT disponivel;

-- 11. 300+ páginas e publicados após 1970
SELECT * FROM livros WHERE paginas >= 300 AND ano_publicacao > 1970;

-- 12. Livros de Clarice Lispector (1) ou Machado de Assis (6)
SELECT * FROM livros WHERE id_autor IN (1, 6);

-- 13. Empréstimos não devolvidos
SELECT * FROM emprestimos WHERE data_devolucao IS NULL;

-- 14. Livro com mais e menos páginas
SELECT MAX(paginas) AS mais_paginas, MIN(paginas) AS menos_paginas FROM livros;

-- 15. Top 5 livros mais caros
SELECT * FROM livros ORDER BY preco DESC LIMIT 5;

-- 16. Empréstimos por leitor
SELECT leitor, COUNT(*) FROM emprestimos GROUP BY leitor ORDER BY COUNT(*) DESC;

-- 17. Soma de preços por gênero > 185.00
SELECT id_generos, SUM(preco) FROM livros GROUP BY id_generos HAVING SUM(preco) > 185.00;

-- 18. Segunda página de empréstimos (3 por página)
SELECT * FROM emprestimos LIMIT 3 OFFSET 3;

-- 19. Livros nunca emprestados (subquery)
SELECT titulo FROM livros WHERE id NOT IN (SELECT id_livro FROM emprestimos);

-- 20. Livros com preço acima da média (subquery)
SELECT titulo, preco FROM livros WHERE preco > (SELECT AVG(preco) FROM livros);