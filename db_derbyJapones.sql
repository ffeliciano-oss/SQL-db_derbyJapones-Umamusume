create database if not exists db_derbyJapones;
use db_derbyJapones;

create table umamusume(
	id_uma int auto_increment primary key,
    nome_uma varchar(50) not null,
    aptitudePrimaria varchar(30) not null,
    aptitudeSecundaria varchar(30),
    aptitudeSolo varchar(30) not null,
    estilo_corrida varchar(20) not null,
    treinador varchar(50) NULL
);

create table pista_Corrida(
	id_pista int auto_increment primary key,
    nome_pista varchar(50) not null,
    tamanho varchar(50) not null,
    classificacao varchar(50) not null,
    solo varchar(20) not null,
    grade varchar(10) not null
);

create table corrida(
	id_corrida int auto_increment primary key,
    id_pista int not null,
    id_uma int not null,
    posicao_Uma varchar(20) not null,
    mesCorrida varchar(20) not null,
    foreign key(id_pista) references pista_corrida(id_pista),
    foreign key(id_uma) references umamusume(id_uma)
);

insert into umamusume(nome_uma, aptitudePrimaria, aptitudeSecundaria, aptitudeSolo, estilo_corrida, treinador) values
('Rice Shower', 'Long', 'Medium', 'Turf', 'Pace', 'Yoshiji Iizuka'),
('Sakura Bakushin O', 'Sprint', null, 'Turf', 'Front', 'Katsutaro Sakai'),
('Daiwa Scarlet', 'Medium', 'Mile', 'Turf', 'Front', 'Kunihide Matsuda'),
('Agnes Digital', 'Medium', 'Mile', 'Ambos', 'Late', 'Toshiaki Shirai'),
('Tokai Teio',  'Medium', null, 'Turf', 'Pace', 'Soichi Matsumoto'),
('Silence Suzuka', 'Medium', 'Mile', 'Turf', 'Front', 'Mitsuru Hashida'),
('Vodka', 'Medium', 'Mile', 'Turf', 'Late', 'Katsuhiko Sumii'),
('Haru Urara', 'Sprint', null, 'Dirt', 'Late', 'Dai Muneishi'),
('Symboli Rudolf', 'Long', 'Medium', 'Turf', 'Pace', 'Yuji Nohira'),
('Oguri Cap', 'Medium', 'Mile', 'Turf', 'Pace', 'Tsutomu Setoguchi');

insert into pista_Corrida(nome_pista, tamanho, classificacao, solo, grade) values
('Hakodate Junior Skates', '1200m', 'Sprint', 'Turf', 'G3'),
('Marine Cup', '1600m', 'Mile', 'Dirt', 'G3'),
('Queen Sho', '1800m', 'Mile', 'Dirt', 'G3'),
('Diolite Kinen', '2400m', 'Medium', 'Dirt', 'G2'),
('Kanto Oaks', '2100m', 'Medium', 'Dirt', 'G2'),
('Arima Kinen', '2500m', 'Long', 'Turf', 'G1'),
('Tokyo Daishoten', '2000m', 'Medium', 'Dirt', 'G1'),
('Nikkei Sho', '2500m', 'Long', 'Turf', 'G2'),
('Keio Hai Spring Cup', '1400m', 'Sprint', 'Turf', 'G2'),
('Victoria Mile', '1600m', 'Mile', 'Turf', 'G1');

insert into corrida(id_pista, id_uma, posicao_uma, mesCorrida) values
(6, 1, '1° lugar', 'Dezembro'),
(3, 4, '1° lugar', 'Dezembro'),
(8, 9, '1° lugar', 'Março'),
(8, 1, '2° lugar', 'Março'),
(10, 4, '5° lugar', 'Maio'),
(1, 2, '1° lugar', 'Julho'),
(5, 10, '1° lugar', 'Junho'),
(10, 3, '1° lugar', 'Maio'),
(10, 7, '2° lugar', 'Maio'),
(7, 5, '3° lugar', 'Dezembro');


-- atividades
-- 1. Selecione o nome da entidade principal e o nome do item relacionado, exibindo somente os registros que possuem correspondência nas tabelas.
select
	u.nome_uma,
    p.nome_pista
from umamusume u
inner join corrida c on c.id_uma = u.id_uma
inner join pista_Corrida p on p.id_pista = c.id_pista;

-- 2. Exiba o nome da entidade principal e todas as informações descritivas do item relacionado, utilizando as três tabelas.
select
	u.nome_uma,
    p.*
from umamusume u
inner join corrida c on c.id_uma = u.id_uma
inner join pista_Corrida p on p.id_pista = c.id_pista;

-- 3. Liste o nome da entidade principal, o nome do item relacionado e o status do relacionamento.
select
	u.nome_uma,
    p.nome_pista,
    c.posicao_uma
from umamusume u
inner join corrida c on c.id_uma = umamusume.id_uma
inner join pista_Corrida p on p.id_pista = c.id_pista;

-- 4. Exiba o nome da entidade principal, o e-mail ou outro dado de contato e o nome do item relacionado.
select
	u.nome_uma,
    u.treinador,
    p.nome_pista
from umamusume u
inner join corrida c on c.id_uma = u.id_uma
inner join pista_Corrida p on p.id_pista = c.id_pista;

-- 5. Selecione o nome da entidade principal, o nome do item relacionado e a data associada ao relacionamento.
select
	u.nome_uma,
    p.nome_pista,
    c.mesCorrida
from umamusume u
inner join corrida c on c.id_uma = u.id_uma
inner join pista_Corrida p on p.id_pista = c.id_pista;

/*6. Liste o nome da entidade principal e o nome do item relacionado,
 mostrando apenas os relacionamentos com status igual a um valor escolhido por você.*/
 select
	u.nome_uma,
    p.nome_pista
from umamusume u
inner join corrida c on c.id_uma = u.id_uma
inner join pista_Corrida p on p.id_pista = c.id_pista
where u.nome_uma = 'Rice Shower';

/*7. Liste todas as entidades principais e os nomes dos itens relacionados, 
incluindo as entidades que não possuem nenhum relacionamento cadastrado.*/
select
	u.nome_uma,
    p.nome_pista
from umamusume u
left join corrida c on c.id_uma = u.id_uma
left join pista_Corrida p on p.id_pista = c.id_pista;

/*8. Exiba todas as entidades principais, seus dados de contato e os nomes dos itens relacionados, 
mesmo quando não houver correspondência.*/
select
	u.nome_uma,
    u.treinador,
    p.nome_pista
from umamusume u
left join corrida c on c.id_uma = u.id_uma
left join pista_Corrida p on p.id_pista = c.id_pista;

-- 9. Liste todos os itens do catálogo e os nomes das entidades principais relacionadas a eles, incluindo itens sem nenhum relacionamento.
select
    p.nome_pista,
	u.nome_uma
from umamusume u
right join corrida c on c.id_uma = u.id_uma
right join pista_Corrida p on p.id_pista = c.id_pista;

-- 10. Exiba todas as entidades principais, o nome do item relacionado e o status, mantendo as entidades sem relacionamentos.
select
	u.nome_uma,
    p.nome_pista,
    c.posicao_uma
from umamusume u
left join corrida c on c.id_uma = u.id_uma
left join pista_Corrida p on p.id_pista = c.id_pista;

-- 11. Utilize LEFT JOIN para listar somente as entidades principais que não possuem nenhum relacionamento cadastrado.
select
	u.id_uma,
	u.nome_uma
from umamusume u
left join corrida c on c.id_uma = u.id_uma
where c.id_uma is null;

/*12. Liste todos os itens do catálogo e suas informações relacionadas,
mantendo inclusive os itens que ainda não foram associados a nenhuma entidade principal.*/
select
	p.*,
    u.nome_uma
from pista_Corrida p
left join corrida c on c.id_pista = p.id_pista
left join umamusume u on u.id_uma = c.id_uma;

/*13. Utilize RIGHT JOIN para exibir todos os itens do catálogo e as entidades principais relacionadas a eles, 
mesmo quando não houver correspondência.*/
select
	p.id_pista,
	p.nome_pista,
    u.id_uma,
    u.nome_uma
from umamusume u
right join corrida c on c.id_uma = u.id_uma
right join pista_Corrida p on p.id_pista = c.id_pista;

/*14. Exiba todos os itens do catálogo, seus dados descritivos e os status 
dos relacionamentos existentes, incluindo os itens sem relacionamentos.*/
select
	p.*,
    c.mesCorrida
from umamusume u
right join corrida c on c.id_uma = u.id_uma
right join pista_Corrida p on p.id_pista = c.id_pista;

/*15. Utilize RIGHT JOIN para listar todos os registros da tabela de relacionamento, 
exibindo também os nomes correspondentes das duas tabelas relacionadas.*/
select
p.*
from corrida c
right join pista_Corrida p on p.id_pista = c.id_pista
where c.id_uma is not null;

-- 16. Utilize RIGHT JOIN para identificar os itens do catálogo que não possuem nenhum relacionamento cadastrado.
select
    p.id_pista,
    p.nome_pista
from corrida c
right join pista_Corrida p on p.id_pista = c.id_pista
where c.id_pista is null;

/*17. Crie uma consulta com INNER JOIN envolvendo as três tabelas
e exiba apenas os registros que atendam a uma condição escolhida por você, utilizando WHERE.*/
select
	u.nome_uma,
    p.nome_pista,
    c.posicao_uma,
    c.mesCorrida
from umamusume u
inner join corrida c on c.id_uma = u.id_uma
inner join pista_Corrida p on p.id_pista = c.id_pista
where p.nome_pista = 'Victoria Mile' or u.nome_uma = 'Symboli Rudolf';

/*18. Crie uma consulta com LEFT JOIN que mostre todas as entidades principais,
incluindo aquelas sem relacionamento, e exiba somente duas ou três colunas escolhidas por você.*/
select
	u.nome_uma,
    p.nome_pista,
    p.classificacao
from umamusume u
left join corrida c on c.id_uma = u.id_uma
left join pista_Corrida p on p.id_pista = c.id_pista;

/*19. Crie uma consulta com RIGHT JOIN que apresente todos os itens do catálogo e os 
dados das entidades relacionadas, selecionando as colunas que considerar mais relevantes.*/
select
	c.id_corrida,
    c.mesCorrida,
    p.*
from corrida c
right join pista_Corrida p on p.id_pista = c.id_pista
order by c.id_corrida asc;

/*20. Elabore um relatório geral utilizando as três tabelas e LEFT JOIN, mostrando as principais informações 
do seu sistema e preservando todas as entidades da tabela principal, mesmo quando não houver correspondência.*/
select
	u.id_uma,
    u.nome_uma,
    u.treinador,
    u.aptitudePrimaria,
    u.estilo_corrida,
    c.posicao_uma,
    p.*,
    c.mesCorrida
from umamusume u
left join corrida c on c.id_uma = u.id_uma
left join pista_Corrida p on p.id_pista = c.id_pista;