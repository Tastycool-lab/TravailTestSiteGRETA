

-- diapo 25
select cours.codecours, cours.libellecours from cours;

-- diapo 26
-- on ajoute "distinct" pour ne pas avoir de doublon car un employ� peut s'inscrir � plusieurs s�minaires
select distinct inscrit.numemp from inscrit;

-- diapo 26
-- exercice: afficher les codes des cours pour lesquels il y a au moins un s�minaire.
select distinct codecours from seminaire;

-- diapo 31
select numemp, nomemp, salaire from employe where salaire > 10000;

--test-> cherche les employe qui ne son pas incrit � un s�minaire
select nomemp from employe where NOT (employe.numemp in (select inscrit.numemp from inscrit));

-- exercices :
-- quels sont les cours (code et libelle) qui durent plus de 3 jours?
select codecours , libellecours from cours where nbjours > 3;

-- exercices:
-- Quels sont les projets (code et nom) qui on d�marr� le 17 janviers 2019?
select codeprojet , nomprojet from projet where debutproj ='07/01/19';


--Test des bornes between
select nomemp , salaire from employe where salaire BETWEEN 10000 AND 11000;

--Num�ros des employ� et date d'inscription qui se sont incrit au mois d'Octobre
select numemp , dateinscrit from inscrit where dateinscrit BETWEEN '30/09/19' AND '30/10/19';
--M�me chose mais en modifiant le format
select numemp , dateinscrit from inscrit where to_char(dateinscrit,'MM/YYYY')='10/2019';

--diapo 33
select employe.numemp, employe.nomemp, employe.prenomemp
from employe
where nomemp in('DUPONT','RIVIERE');

--diapo 34
--nom des employ� qui commence par la lettre G
select nomemp, salaire from employe where nomemp like 'G%';

--nom des employ� avec un E en 2i�me position
select nomemp, salaire from employe where nomemp like '_E%';

--diapo 35
select nomemp from employe where poste = 'C17' AND salaire > 11000;
select nomemp from employe where poste = 'C17' or poste = 'B14';
select numemp, nomemp, salaire, codeprojet from employe where NOT(CODEPROJET is NULL) OR (codeprojet = 'PR1') OR (codeprojet = 'PR2' AND salaire > 10000);

--diapo 36
--NULL ne trouve jamais d'�galit� car cela ne correspond � aucune valeur, c'est un "rien".
select 'bonojur' from dual where null='';
select 'bonojur' from dual where null=0;
select 'bonojur' from dual where null=null;

--diapo 38
select libellecours from cours inner join seminaire on cours.codecours = seminaire.codecours where seminaire.codesemi = 'BR0560210';

--diapo 43
--demonstration des inner join pour �tablier des relation entre deux table.
Select codesemi , libellecours, nbjours 
from cours inner join seminaire on seminaire.codecours = cours.codecours;
Select seminaire.* , cours.nbjours from seminaire inner join cours on cours.codecours = seminaire.codecours where cours.codecours = 'BR035';
Select distinct inscrit.codesemi from inscrit inner join employe on employe.numemp = inscrit.numemp where employe.codeprojet = 'PR1' ;

Select distinct employe.numemp, employe.nomemp, employe.prenomemp from employe inner join participer on participer.numemp = employe.numemp where participer.codejour = 'LU';

select * from participer;

--diapo 44
Select distinct cours.libellecours , cours.codecours 
    from cours inner join seminaire on cours.codecours = seminaire.codecours
    inner join inscrit on seminaire.codesemi = inscrit.codesemi
    inner join employe on employe.numemp = inscrit.numemp
    where employe.codeprojet = 'PR1';
    
--diapo 45
--1-1
select employe.numemp, employe.nomemp, employe.prenomemp 
    from cours inner join seminaire on cours.codecours = seminaire.codecours
    inner join inscrit on seminaire.codesemi = inscrit.codesemi
    inner join employe on inscrit.numemp = employe.numemp
    where employe.nomemp like cours.libellecours;
 --1-2   
select employe.numemp, employe.nomemp, employe.prenomemp
    from employe 
    where employe.nomemp in (select cours.libellecours from cours);
--1-3  
select employe.numemp, employe.nomemp, employe.prenomemp
    from employe inner join cours on employe.nomemp = cours.libellecours;
    
select * from cours;
select * from employe;
    
Select distinct employe.numemp , employe.nomemp , employe.prenomemp
    from employe inner join inscrit on inscrit.numemp = employe.numemp
    where inscrit.dateinscrit > (Select projet.debutproj from projet where projet.codeprojet = 'PR1');
    
--num�ro , nom et pr�nom des employ�s qui se sont inscrits � uin s�minaire apr�s la date de d�but du projet PR5
Select distinct employe.numemp , employe.nomemp , employe.prenomemp
    from inscrit inner join projet on inscrit.dateinscrit > projet.debutproj
    inner join employe on employe.numemp = inscrit.numemp
    where projet.codeprojet = 'PR5';

--diapo 49
/*Cette requ�te est car il manque des employ�
on doit faire une jointure externe o� la table dominante ne nous retournera pas les employ�s qui ne son pas sur des projet*/
select employe.numemp , employe.nomemp, employe.prenomemp, employe.salaire, projet.codeprojet, projet.nomprojet
 from employe full join projet on employe.codeprojet = projet.codeprojet;
 
 --diapo 49
 /*Afficher les noms des employ�s dont le num�ro est sup�rieur � 17 avec les codes des 
 s�minaires auxquels ils se sont inscrits. Si un employ� ne s'est inscrit � aucun s�minaire, son nom doit apparaitre*/
 
Select employe.nomemp , inscrit.codesemi
    from employe left join inscrit on employe.numemp = inscrit.numemp 
    where employe.numemp > 17;

--diapo 49
/*Rajouter le libellecours: propation des jointures externes.
Obligation de rajouter la jointure externe sur chaque jointure*/
Select employe.nomemp , inscrit.codesemi, cours.libellecours
    from employe left join inscrit on employe.numemp = inscrit.numemp 
    left join seminaire on seminaire.codesemi = inscrit.codesemi
    left join cours on cours.codecours = seminaire.codecours
    where employe.numemp > 17;

Select * from employe;
--Utilisation des ALIAS 
Select e.numemp , e.nomemp , e.prenomemp , e.superieur, s.numemp , s.nomemp, s.prenomemp, s.superieur
    from employe e left join employe s
        on e.superieur = s.numemp;

--On peut aussi utiliser des ALIAS pour renomer les colones
Select e.numemp , e.nomemp , e.prenomemp , e.superieur, s.numemp NUM_SUPERIEUR , s.nomemp NOM_SUPERIEUR , s.prenomemp PRENOM_SUPERIEUR, s.superieur SUP_DU_SUPERIEUR
    from employe e left join employe s
        on e.superieur = s.numemp;

/*Liste des employ�s inscrit au cours BT035*/
Select distinct employe.numemp, employe.nomemp , employe.prenomemp 
from employe inner join inscrit on employe.numemp = inscrit.numemp 
    inner join seminaire on seminaire.codesemi = inscrit.codesemi
    where seminaire.codecours = 'BR035';
    
select * from cours;

Select seminaire.codesemi , seminaire.codecours , cours.libellecours , seminaire.datedebutsem
    from seminaire inner join cours 
    on seminaire.codecours = cours.codecours
    where to_CHAR(seminaire.datedebutsem , 'MM/YYYY') = '05/2019' and  cours.libellecours like( '%UML%');
    
    
--Exemple de soustraction d'ensemble de table
--On retire la table inscrit a la table employe pour voir qui n'est pas inscrit.
Select employe.numemp 
    from employe left join inscrit
    on employe.numemp = inscrit.numemp
    where inscrit.numemp is null;

--diapo 57
/*Test de tri (order by) sur les primes des employ�s par ordre d�croissant (desc).*/
Select * 
    from employe
    where employe.prime is not null
    order by employe.prime desc;

--diapo 57  
select * 
    from employe
    order by employe.codeprojet , employe.salaire desc;

--diapo 57    
select * 
    from projet
    order by projet.finprevue;
    
--TEST de tri seulement en fonction de l'ann�e
select *
    from projet
    order by to_CHAR(projet.finprevue, 'YYYY');
    

--diapo 58
--cr�ation d'une colonne contenant le nbjours de la dur�e du projet
Select nomprojet , finprevue-debutproj nbjours_Projet
    from projet;

--calcul du gain total d'ub employ�, on utilise la fonction coalesce pour �viter d'ajouter un 'NULL'
--car un calcul avec un 'NULL' retournera toujours un NULL !
--1er m�thode
Select nomemp , coalesce(salaire+prime, salaire) GRAIN_TOTALE 
    from employe
    order by salaire;
--seconde m�thode    
Select nomemp , salaire + coalesce(prime,0) GRAIN_TOTALE 
    from employe
    order by salaire;
    
--diapo 63
--exemple de concatenation de colonne
Select numemp, nomemp || ' ' || prenomemp NOM_PRENOM_EMP 
    from employe;
    
Select codesemi, seminaire.codecours, cours.libellecours
, cours.nbjours, datedebutsem || ' ' || (cours.nbjours+seminaire.datedebutsem-1) datedebut_datedefin
, to_CHAR(datedebutsem,'Day') Jour_Debut
,to_CHAR(datedebutsem +cours.nbjours-1,'Day') Jour_Fin
    from seminaire inner join cours on seminaire.codecours = cours.codecours
    order by Jour_Fin;
    
--diapo 66
--LES FONCTIONS DE COLONNE
--Max salaire
Select Max(salaire) Salaire_MAX from employe;
-- ne marchera pas car on ne peut pas associ� une valeur horizontale sans fonction de regroupement
Select Max(salaire) Salaire_MAX, nomemp from employe;
-- ca non plus car on ne peut pas comparer une valeur horizontal avec un valeur vertical
Select Max(salaire) Salaire_MAX from employe where salaire = Mex(salaire);
--TEST
select nomemp from employe where salaire =(select Max(salaire)from employe);

--exercices
--diapo 66
Select Max(salaire) Salaire_MAX from employe;
select Min(prime) Prime_Min from employe;
select avg(salaire) salaire_moyen, avg(prime)prime_moyenne from employe;
--m�me fonction arrondi a 2 decimal "round(???,nb_decimal)"
select round(avg(salaire),2) salaire_moyen, round(avg(prime),2) prime_moyenne from employe;
select count(poste) nb_employe_poste_A12 from employe where poste='A12';
--pour celle-ci pas besoin de prendre un compte les employ� avec une prime null car les fonctions de controle ne les prend jamais en compte
select count(prime) nb_prime from employe;
--Si l'on veut la moyenne des primes avec tous les employ�s confondu il faut ajout� un value 0 aux null
select avg(coalesce(prime,0)) Moy_Prime  from employe;
--On souhaite calculer le nbre de poste diff�rent donc l'on ajoute un distinct � la fonction car l'on sait que certain employ� on le m�me poste.
select count(distinct poste) nb_poste from employe;
--On ajoute un coalesce car il faut prendre compte les employ� ne touchant pas de prime
select Min(coalesce(prime,0)+salaire) total_min from employe;

select avg(finprevue-debutproj+1) nb_jour_moyen from projet;

--bonus
/*Quels sont les s�minaires qui traite de SQL ou il y au moins de 3 inscrits.
 Codesemi, codecours, libellecours, datedebut, datefin*/
 Select distinct seminaire.codesemi, seminaire.codecours, cours.libellecours, datedebutsem, datedebutsem+cours.nbjours date_de_fin
    from seminaire 
    inner join cours on cours.codecours = seminaire.codecours
    where cours.libellecours like '%SQL%' and (select count(distinct inscrit.codesemi) 
    from inscrit) >= 3 ;

--diapo 71;
/* 1 - on regroupe par codeprojet
    2- on compte � l'int�rieur de charque groupe*/
Select codeprojet, count(*) nb_employe
    from employe 
    group by codeprojet;
--on remarque que les null forme un groupe donc:
Select codeprojet, count(*) nb_employe
    from employe 
    where codeprojet is not null
    group by codeprojet;
--Si l'on veut afficher aucun � la place de null
Select coalesce(codeprojet,'Aucun'), count(*) nb_employe
    from employe 
    group by codeprojet;
--Si l'on veut trier sur le nombre d'employ� par projet
Select coalesce(codeprojet,'Aucun'), count(*) nb_employe
    from employe 
    group by codeprojet
    order by nb_employe desc;
    
--diapo 72
Select SUM(salaire), poste 
    from employe
    group by poste;
--la m�me avec un tri, on peut utiliser l'alias
Select SUM(salaire)sum_salaire , poste 
    from employe
    group by poste
    order by sum_salaire;
    
Select count(codesemi) nb_seminaire , seminaire.codecours
    from seminaire
    group by seminaire.codecours;
--cette requete ne convient pas car il peut y avoir des cours sans qu'on ait de seminaire
--ATTENTION on fait le group by sur COURS.CODECOURS car c'est lui qui verre si un cours ne comprend pas de cours
--il faut donc faire :
Select count(codesemi) nb_seminaire , cours.codecours
    from seminaire right join cours on cours.codecours = seminaire.codecours
    group by cours.codecours;
    
--il n'y a pas de cours sans siminaire donc on l'ajoute
insert into cours (codecours, libellecours, nbjours)
    values ('BR099','Cours du Gratin',5);
commit;
 
 --le petit pi�ge est qu'il fallait faire afficher les cours pour le quel il n'y avais pas de s�minaire   
Select count(seminaire.codesemi) nb_seminaire , cours.codecours, cours.libellecours
    from seminaire right join cours on cours.codecours = seminaire.codecours
    group by cours.codecours , cours.libellecours;
    
Select count(numemp)nb_employer_inscrit, dateinscrit 
    from inscrit inner join seminaire 
    on seminaire.codesemi = inscrit.codesemi 
    where codecours = 'BR013' 
    group by dateinscrit;
    
Select employe.numemp, count(inscrit.numemp)nb_inscription
    from employe left join inscrit on inscrit.numemp = employe.numemp
    group by employe.numemp;
    
/*
Combien y a t-il eu de jours de pr�sence pour le s�minaire BR0350216 (nb jours) ?
*/
select count(codejour) nb_jours_participation , codesemi 
    from participer 
    where codesemi = 'BR0350216' 
    group by codesemi ;
    
--Combien y a t il eu de jours de pr�sence par s�minaire , pour les s�minaire qui ont eu lieu (codesemi, nb)  
--Correction: Pas besoin de inner join car les inscrit dans participer sont par logique termin� (sauf un s�minaire est en cours ...)
select count(participer.codejour) nb_jours_participation , participer.codesemi , seminaire.datedebutsem+cours.nbjours-1 date_fin_semi
    from participer
    inner join seminaire on seminaire.codesemi = participer.codesemi
    inner join cours on cours.codecours = seminaire.codecours
    where  seminaire.datedebutsem+cours.nbjours-1 < SYSDATE
    group by participer.codesemi, seminaire.datedebutsem+cours.nbjours-1 ;
    
--ratio de pr�sence par s�minaire (NBjours de rp�sence / NBjours pr�vus)
select inscrit.codesemi, count(inscrit.numemp) nb_emp
from seminaire sem inner join inscrit
    on sem.codesemi= inscrit.codesemi
group by inscrit.codesemi;

select participer.codesemi, round(count(*) / A.nb_emp* cours.nbjours, 2) ratio
from participer inner join seminaire on seminaire.codesemi = participer.codesemi
inner join cours on cours.codecours = seminaire.codecours
inner join (select inscrit.codesemi, count(inscrit.numemp) nb_emp
from seminaire sem inner join inscrit
    on sem.codesemi= inscrit.codesemi
group by inscrit.codesemi) A on A.codesemi = seminaire.codesemi
group by participer.codesemi, cours.nbjours, a.nb_emp;

--test
select to_DATE(SYSDATE, 'DD/MM/YYYY') from dual;


--Diapo 75 HAVING
/*Salaire moyen par poste, pour les postes comportant plus de deux employ�s.*/
Select AVG(salaire) , poste from employe group by poste having count(numemp) > 2;

/*liste des s�minaires, o� il y a plus de 3 inscrit*/
--Correction: le inner join est l� pour obtenir le libelle du cours
Select inscrit.codesemi , seminaire.codecours, cours.libellecours 
    from employe 
        inner join inscrit on employe.numemp = inscrit.numemp 
        inner join seminaire on seminaire.codesemi = inscrit.codesemi
        inner join cours on cours.codecours = seminaire.codecours
        group by inscrit.codesemi , seminaire.codecours, cours.libellecours
        having count(inscrit.numemp) > 3;
    
/*Salaire moyen par poste, pour les employ�s dont la prime est � null, et pour les postes comportant plus de deux employ�s*/
--Correction: Meme raisonnement que la primi�re requete sauf qu'on ne prend en compte que les employ�s avec une prime null
Select AVG(salaire), poste from employe where prime is null group by poste having count(numemp) > 2;
--TEST 
select * from employe where poste = 'C23';

--Diapo 81 exercices LES SELECT IMBRIQUES
 /*Liste des employ�s inscrits � au moins un s�minaire auquiel s'est inscrit "JOLIBOIS"*/
 --Correction ajout d'un DISTINCT un employ� � peut s'incire � plusieurs s�minaires aux quels s'est inscrit l'employ� "JOLIEBOIS"
 Select employe.numemp, employe.nomemp , inscrit.codesemi
    from employe inner join inscrit 
    on inscrit.numemp = employe.numemp
    where inscrit.codesemi in 
    (Select inscrit.codesemi 
        from inscrit 
        inner join employe 
        on inscrit.numemp = employe.numemp 
        where employe.nomemp = 'JOLIBOIS') 
    AND nomemp not like 'JOLIBOIS';

/*Liste des employ�s de poste B12 dont le salaire est �gal � l'un des salaires des employ�s du poste B15(n�,nom,prenom)*/
Select numemp , nomemp , prenomemp 
    from employe 
    where poste = 'B12' 
        AND salaire in  (select salaire 
                            from employe 
                            where poste = 'B15');
                            
/*Liste des employ�s inscrits � un s�minaires d'un cours de UML*/
Select distinct employe.numemp , nomemp , prenomemp 
    from employe
        inner join inscrit on employe.numemp = inscrit.numemp 
        inner join seminaire on seminaire.codesemi = inscrit.codesemi
        inner join cours on cours.codecours = seminaire.codecours
            where cours.libellecours in (Select cours.libellecours 
                                    from cours 
                                    where cours.libellecours like '%UML%');
    
/*Liste des employ�s n� nom prenom dont le gain (salaire + prime) est sup�rieur � 90% du salaire de son superieur hierachique*/                 
Select e.numemp , e.nomemp , e.prenomemp , (e.salaire + coalesce(e.prime,0)) gain, (s.salaire * 0.9) S_Sup_90
    from employe e left join employe s on e.superieur = s.numemp
    where(e.salaire + coalesce(e.prime,0) > (Select salaire * 0.9 
                                            from employe 
                                            where e.superieur = numemp));
                                            
                                            

--TEST
Select * from employe where numemp = 2;

Select e.numemp , e.nomemp , e.prenomemp , (e.salaire + coalesce(e.prime,0)) gain, (s.salaire * 0.9) S_Sup_90
    from employe e left join employe s on e.superieur = s.numemp;
                                            
/*liste des employes dont le salaire est inf�rieur � la moyenne des salaires des employ�s travaillant sur le m�me projet.
On prend en compte lest employ�s travaillant sur aucun projet*/
Select numemp , nomemp , prenomemp , e.codeprojet
    from employe e left join projet on projet.codeprojet  = e.codeprojet
    where salaire < (select AVG(salaire) 
                        from employe 
                        where coalesce(codeprojet,'pas_de_projet' )= coalesce(e.codeprojet,'pas_de_projet' ));
    
--Diapo 87 UPDATE
--Exercice
select * from employe ;
Update 
    employe 
set 
    prime = 1000
where 
    numemp = 11;
--Ici pas de clause where  car l'on veut mettre � jour toutes les lignes
Update 
    employe 
set 
    salaire = salaire + 150;

update
    employe
set 
    salaire = salaire + 5150
where 
    codeprojet = 'PR1';
    
    
select numemp, salaire from employe where numemp in (16,17) ;
update 
    employe
set
    salaire = (select salaire from employe where numemp = 17)
where numemp = 16;

select min(salaire) from employe group by codeprojet;
update
    employe emp 
set 
    salaire = salaire + (salaire * 0.15)
where 
    salaire in (select min(salaire) from employe where emp.codeprojet = employe.codeprojet);

select inscrit.numemp, employe.prime , count(*)
    from inscrit 
        inner join employe 
        on employe.numemp = inscrit.numemp 
        group by inscrit.numemp, employe.prime having count(inscrit.numemp)> 3;
        
/*Augment� la prime des employ�s qui se sont inscrit � plus de 3 s�minaires*/
update
    employe
set
    prime = prime  + 150
where 
    numemp in (select numemp from inscrit group by numemp having count(numemp)> 3);

--Diapo 88 DELETE
--Attention , certaine instructions seront refus�es si il y a une perte d'int�grit� r�f�rentielle.
--exemple, je ne peut pas supprimer un client qui a une commande en cours.

--par contre
delete from cours where codecours = 'BR035';

/*Ca a march� car il y a une suppression en cascade des enregistrements de la
table seminaire. Tous les s�minaires du cours BR035 ont �t� supprim�s.*/

-- pour rire on detruit tout en cascade:
delete from cours;
select * from cours;
select * from seminaire;
select * from inscrit;
select * from participer;

delete from inscrit where numemp = 1 and codesemi = 'BR0350216';

delete from inscrit where 
    numemp in (select numemp 
                from employe 
                where employe.codeprojet = 'PR1') 
    AND codesemi in (select inscrit.codesemi 
                        from inscrit 
                        where seminaire.codecours = 'BR035');

ROLLBACK;

--Diapo 91 INSERT
insert into cours (codecours, libellecours , nbjours)
    values ('BR077', 'Cours SQL GRTA', 3);

-- ne marchera pas
insert into cours (codecours, libellecours, nbjours)
values
('BR060','informatique RGPD',5),
('BR061','cuisine',6);

