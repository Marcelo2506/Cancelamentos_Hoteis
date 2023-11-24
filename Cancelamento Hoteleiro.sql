-- Databricks notebook source
select * from hotel_bookings_csv

-- COMMAND ----------

-- QUANTIDADE DE RESERVAS POR TIPO DE HOTEL
select
hotel,
count(*) as cancelados 
from hotel_bookings_csv
group by hotel

-- COMMAND ----------

-- QUANTIDADE DE RESERVAS CANCELADAS POR TIPO DE HOTEL.
select hotel,count(*) as cancelado
from hotel_bookings_csv
where is_canceled > 0
group by hotel

-- COMMAND ----------

--Podemos verificar em qual ano mais tivemos agendamentos
select
arrival_date_year,
count(*) as contagem
from hotel_bookings_csv
group by arrival_date_year
order by contagem desc 
--2016 foi o ano com mais agendamentos

-- COMMAND ----------

-- Podemos verificar a quantidade de cancelamentos por ano
select
arrival_date_year,
count(*) as contagem
from hotel_bookings_csv
where is_canceled = 1
group by arrival_date_year
order by contagem desc 

-- COMMAND ----------

--vamos analisar o ano de 2016 para vermos a distribuição de cancelamentos ao decorrer do ano
select 
arrival_date_month,
count(*) as cancelamento
from hotel_bookings_csv
where is_canceled = 1
group by arrival_date_month
order by cancelamento desc 

-- COMMAND ----------

--Agora podemos verificar qual o mes com maior numero de agendamentos
select 
arrival_date_month as mes,
count(*) as contagem
from hotel_bookings_csv
group by mes
order by contagem desc
--podemos observervar que ao longo dos 3 anos os 2 meses (julho e agosto) sao os lideres de agendamento, onde há mais procura

-- COMMAND ----------

--Agora podemos verificar a quantidade de cancelamentos por mês
select 
arrival_date_month as mes,
count(*) as contagem
from hotel_bookings_csv
where is_canceled > 0
group by mes
order by contagem desc

-- COMMAND ----------

-- agora vamos analisar por país.
select 
country,
count(*) as contagem
from hotel_bookings_csv
group by country
order by contagem desc
limit 10
--Dentre os 10 países mais procurados, Portugal lidera o ranking com 48.2% 
--Destes 10 países, 9 São europeus, isso explica a maior procura em julho e agosto ja que a europa se encontra no verão nestes meses.

-- COMMAND ----------


