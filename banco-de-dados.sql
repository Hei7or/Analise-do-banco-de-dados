SELECT * FROM alugueis;
SELECT * FROM atores;
SELECT * FROM atuacoes;
SELECT * FROM clientes;
SELECT * FROM filmes;

-- Analise do preco medio de aluguel dos filmes --
SELECT AVG (preco_aluguel) FROM filmes;

-- Analise do preco medio de cada genero de filme --
SELECT 
      genero,
      ROUND(AVG(preco_aluguel), 2) AS preco_medio,
      COUNT(*) AS qtd_filmes
FROM filmes
GROUP BY genero;	

-- Analise dos filmes lançados em 2011 -- 
SELECT 
      genero,
      ROUND(AVG(preco_aluguel), 2) AS preco_medio,
      COUNT(*) AS qtd_filmes
FROM filmes
WHERE ano_lancamento = 2011
GROUP BY genero;

-- -- Analise do desempenho dos alugueis -- 

SELECT AVG(notas) FROM alugueis;

SELECT ROUND(AVG(nota),2) FROM alugueis;

SELECT
      *
FROM alugueis
WHERE nota >= (SELECT ROUND(AVG(nota),2) FROM alugueis);

-- Salvar e apagar uma consulta no banco de dados --

CREATE VIEW resultado AS
SELECT
	genero,
	ROUND(AVG(preco_aluguel), 2) AS media_preco,
    COUNT(*) AS qtd_filmes
FROM filmes
GROUP BY genero;

SELECT * FROM resultado;
DROP VIEW resultado;
