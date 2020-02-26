Select * from client;

-- 1 
Select nom , prenom from client where id = 123;

-- 2
select * from produit;

Select id , designation from produit WHERE puht > 18.85;

-- 3
select idproduit , qteligne from ligne_commande where idcommande = 98770;

-- 4
select nom , prenom , adresserue1 , cp, ville from 
    client inner join commande 
    on client.id = commande.idclient where commande.id = 98770;

-- 5
select id , designation , puht from produit inner join ligne_commande on ligne_commande.idproduit= produit.id where ligne_commande.idcommande = 98770;

-- 6
select * from client where ville like 'Bordeaux';

-- 7
select  produit.id , designation  from produit inner join ligne_commande on ligne_commande.idproduit= produit.id inner join commande
    on commande.id = ligne_commande.idcommande where commande.datecde = '01/10/2014';
    
-- 8
select  produit.id , designation  from produit inner join ligne_commande on ligne_commande.idproduit= produit.id inner join commande
    on commande.id = ligne_commande.idcommande inner join client on client.id = commande.idclient where ville = 'Toulon';

-- 9
select count(*) from commande inner join client on client.id = commande.idclient where client.id = 2343;

-- 10
select sum(puht) from produit inner join ligne_commande on ligne_commande.idproduit= produit.id inner join commande
    on commande.id = ligne_commande.idcommande where commande.idclient = 2343;
    
-- 11
select sum(puht * 1.2) from produit inner join ligne_commande on ligne_commande.idproduit= produit.id inner join commande
    on commande.id = ligne_commande.idcommande where commande.idclient = 2343;

-- 12
select count(*) from commande where datecde = '01/10/2014';

-- 13
select count(*)from commande where '09/2014' = to_CHAR(datecde ,'MM/YYYY');

-- 14
select idclient, count(*) from commande group by idclient;

-- 15
select idclient, nom, prenom , count(*) from commande inner join client on client.id = commande.idclient  group by idclient, nom, prenom;

-- 16 REVOIR
select produit.id , produit.designation, ligne_commande.qteligne
    from produit inner join ligne_commande 
                    on produit.id = ligne_commande.idproduit 
    group by produit.id , produit.designation, ligne_commande.qteligne
    having ligne_commande.qteligne > 2;
    
-- 17 
select idcommande, count(distinct idproduit )from ligne_commande group by  idcommande ;

-- 18
select commande.id from produit inner join ligne_commande on ligne_commande.idproduit= produit.id inner join commande
    on commande.id = ligne_commande.idcommande where not produit.designation ='LEGO6858' group by commande.id;
    
-- 19
select id from produit left join ligne_commande on ligne_commande.idproduit = produit.id where ligne_commande.idcommande is null;

-- 20
select * from produit where puht > (select puht from produit where id = 'LEGO6858');

-- 21
select * from produit where (select max(puht) from produit) = puht;

-- 22
select
max(sum(puht*ligne_commande.qteligne))
from produit inner join ligne_commande 
on ligne_commande.idproduit= produit.id 
group by ligne_commande.idcommande;


select   ligne_commande.idcommande, datecde, client.id , client.nom, client.prenom 
from produit inner join ligne_commande 
on ligne_commande.idproduit = produit.id  inner join commande on commande.id = ligne_commande.idcommande inner join client on client.id = commande.idclient
group by ligne_commande.idcommande, datecde, client.id , client.nom, client.prenom 
having sum(puht*ligne_commande.qteligne) =  (select
max(sum(puht*ligne_commande.qteligne))
from produit inner join ligne_commande 
on ligne_commande.idproduit= produit.id 
group by ligne_commande.idcommande);


-- 23
select client.id, count(commande.id) from client inner join commande on commande.idclient = client.id group by client.id ;

select commande.idclient, count(commande.id)
    from commande 
    group by commande.idclient having count(commande.id) =  (select max(count(commande.id)) 
                                                        from  commande 
                                                        group by commande.idclient)  ;

