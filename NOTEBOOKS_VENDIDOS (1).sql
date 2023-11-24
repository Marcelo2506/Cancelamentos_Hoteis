-- Databricks notebook source
select
  *
from
  notebooks_vendidos;

-- COMMAND ----------

-- Vamos criar mais duas colunas para corrigir as colunas de 'preco_atual_real' e 'preco_antigo_real' que foram preenchidas em cotacao de rupias indianas.
create view vw_notebooks_vendidos 
as
select *,
(ULTIMO_PRECO * 0.063) as preco_atual_real, 
(ANTIGO_PRECO * 0.063) as preco_antigo_real
from notebooks_vendidos;

-- COMMAND ----------

--Verificando se as colunas foram adicionadas.
select * from vw_notebooks_vendidos 

-- COMMAND ----------

--verificando a media de preco por marca
select 
MARCA,
avg(preco_atual_real) as preco_medio
from vw_notebooks_vendidos
group by MARCA

-- COMMAND ----------

--Maiores valores de cada marca e modelo
select 
MARCA,MODELO,
max(preco_atual_real) as maiores 
from vw_notebooks_vendidos 
group by MARCA, MODELO
order by maiores desc

-- COMMAND ----------

--Como pudemos notar nas ultimas consultas feitas ha um erro de preenchimento em que se repete a marca lenovo, vamos corrigir e exibir apenas as marcas.
select
case when MARCA = 'lenovo' then 'Lenovo'
    else MARCA
end as marca_ajustada,
max(preco_atual_real) as maiores_valores
from vw_notebooks_vendidos
group by marca_ajustada
order by maiores_valores desc

-- COMMAND ----------

--Vamos analisar qual o processador mais presente no mercado
select 
NOME_PROCESSADOR,
count(*) as PROCESSADORES_PRESENTES
from vw_notebooks_vendidos
group by NOME_PROCESSADOR
order by PROCESSADORES_PRESENTES desc
--Podemos ver que o processadores da intel dominam o mercado e o mais popular e o i5 com 34.8% de presenca nos notebooks.

-- COMMAND ----------

--vamos verificar os notebooks mais bem avaliados (apenas com mais de 4.4/5)
select 
*
from vw_notebooks_vendidos
where AVALIACAO > 4.4

-- COMMAND ----------

--Podemos tambem verificar qual a fabrica de processadores mais presente no mercado
select
marca_processador,
count(*) as contagem
from vw_notebooks_vendidos
group by marca_processador
order by contagem desc
--Podemos verificar que 73.7% dos processadores sao Intel que lidera o ranking em seguida da AMD com 23.2% de parcela do mercado

-- COMMAND ----------

--Maiores valores de cada marca
select
MARCA,
max(preco_atual_real) as maiores_valores
from vw_notebooks_vendidos 
group by MARCA
order by maiores_valores desc
