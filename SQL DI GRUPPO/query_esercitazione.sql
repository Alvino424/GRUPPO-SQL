-- Marca e Colore delle Auto di che costano più di 10.000 €
select auto.marca,auto.colore from auto where prezzo > 10000;


-- Tutti i proprietari di un’auto di colore ROSSO
select * from propretari left join auto on proprietari.targa = auto.targa
where auto.colore = 'rosso';

-- Costo totale di tutte le auto con Cilindrata superiore a 1600lo c14
select sum(auto.prezzo) from auto where cilindrata > 1600;


-- Targa e Nome del proprietario delle Auto in una concessionaria della Città di Roma
select auto.targa,proprietario.nominativo from auto join proprietari on proprietari.targa = auto.targa
join concessionario on concessionario.id_concessionario = auto.id_concessionario
where concessionario.citta = 'roma';

-- Per ogni Concessionaria, il numero di Auto
select concessionario.citta,count(*) from auto join concessionario on concessionario.id_concessionario = auto.id_concessionario
group by concessionario.citta;

-- Il Responsabile di Concessionaria di tutte le auto con Cambio Automatico e Anno Acquisto 2010
select concessionario.responsabile from ??????;


-- Per ciascuna TARGA il colore, il prezzo e la città in cui si trova il veicolo
select auto.targa,auto.colore,auto.prezzo,proprietari.citta from auto join proprietari on proprietari.targa = auto.targa;

-- Le auto con almeno tre Proprietari
select auto.nome, count(anno_acq) as n_proprietari from auto join proprietari on auto.targa = proprietari.targa 
group by auto.nome
having n_proprietari > 3;

-- La targa delle auto vendute nel 2015
select auto.targa from auto  join proprietari on auto.targa = proprietari.targa
where anno_vend = '2015';


-- La regione con più auto (trovare un modo per associare la Regione)???????



-- La Targa delle auto che si trovano a Milano, con cambio automatico, colore rosso, di proprietari residenti a Milano manca un dato ()

select auto.targa from auto join proprietari  on auto.targa = proprietari.targa
where proprietari.citta = 'milano' and auto.cambio = 'automatico' and auto.colore ='rosso' ;


-- 1. Gestione fatturato per Concessionaria
select concessionario.nome , sum(auto.prezzo), year(anno.acq) as anno from concessionario join auto on concessionario.id_concessionario = auto.id_concessionario
group by concessionario.nome, anno;


-- 2. Gestione Clienti per Concessionaria
select * from proprietari join auto on auto.targa = proprietari.targa
join concessionario on concessionario.id_concessionario = auto.id_concessionario
group by concessionaria.nome;








