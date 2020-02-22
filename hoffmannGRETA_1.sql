select * from projet;
select * from rochesql.projet;
select employe.nomemp from employe where numemp=2;
select systimestamp from dual;
select
   to_char(systimestamp,'dd-mm-yyyy hh24:mi:ss.FF') as ts,
   to_timestamp(
      to_char(sysdate,'dd-mm-yyyy hh24:mi:ss.')
      ||
      to_char(
         to_number(
            to_char(systimestamp,'FF')
         ) + 250),'dd-mm-yyyy hh24:mi:ss.FF'
   ) as ts_1
from dual;

-- diapo 25
select cours.codecours, cours.libellecours from cours;

-- diapo 26
-- on ajoute "distinct" pour ne pas avoir de doublon car un employé peut s'inscrir à plusieurs séminaires
select distinct inscrit.numemp from inscrit;

-- diapo 26
-- exercice: afficher les codes des cours pour lesquels il y a au moins un séminaire.
select distinct codecours from seminaire;

-- diapo 31
select numemp, nomemp, salaire from employe where salaire > 10000;

--test-> cherche les employe qui ne son pas incrit à un séminaire
select nomemp from employe where NOT (employe.numemp in (select inscrit.numemp from inscrit));

-- exercices :
-- quels sont les cours (code et libelle) qui durent plus de 3 jours?
select codecours , libellecours from cours where nbjours > 3;

-- exercices:
-- Quels sont les projets (code et nom) qui on démarré le 17 janviers 2019?
select codeprojet , nomprojet from projet where debutproj ='07/01/19';


--Test des bornes between
select nomemp , salaire from employe where salaire BETWEEN 10000 AND 11000;

--Numéros des employé et date d'inscription qui se sont incrit au mois d'Octobre
select numemp , dateinscrit from inscrit where dateinscrit BETWEEN '30/09/19' AND '30/10/19';
--Même chose mais en modifiant le format
select numemp , dateinscrit from inscrit where to_char(dateinscrit,'MM/YYYY')='10/2019';

--diapo 33
select employe.numemp, employe.nomemp, employe.prenomemp
from employe
where nomemp in('DUPONT','RIVIERE');

--diapo 34
--nom des employé qui commence par la lettre G
select nomemp, salaire from employe where nomemp like 'G%';

--nom des employé avec un E en 2ième position
select nomemp, salaire from employe where nomemp like '_E%';

--diapo 35
select nomemp from employe where poste = 'C17' AND salaire > 11000;
select nomemp from employe where poste = 'C17' or poste = 'B14';
select numemp, nomemp, salaire, codeprojet from employe where NOT(CODEPROJET is NULL) OR (codeprojet = 'PR1') OR (codeprojet = 'PR2' AND salaire > 10000);

--diapo 36
--NULL ne trouve jamais d'égalité car cela ne correspond à aucune valeur, c'est un "rien".
select 'bonojur' from dual where null='';
select 'bonojur' from dual where null=0;
select 'bonojur' from dual where null=null;

--diapo 38
select libellecours from cours inner join seminaire on cours.codecours = seminaire.codecours where seminaire.codesemi = 'BR0560210';

--diapo 43
--demonstration des inner join pour établier des relation entre deux table.
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
    
--numéro , nom et prénom des employés qui se sont inscrits à uin séminaire après la date de début du projet PR5
Select distinct employe.numemp , employe.nomemp , employe.prenomemp
    from inscrit inner join projet on inscrit.dateinscrit > projet.debutproj
    inner join employe on employe.numemp = inscrit.numemp
    where projet.codeprojet = 'PR5';

--diapo 49
/*Cette requête est car il manque des employé
on doit faire une jointure externe où la table dominante ne nous retournera pas les employés qui ne son pas sur des projet*/
select employe.numemp , employe.nomemp, employe.prenomemp, employe.salaire, projet.codeprojet, projet.nomprojet
 from employe full join projet on employe.codeprojet = projet.codeprojet;
 
 --diapo 49
 /*Afficher les noms des employés dont le numéro est supérieur à 17 avec les codes des 
 séminaires auxquels ils se sont inscrits. Si un employé ne s'est inscrit à aucun séminaire, son nom doit apparaitre*/
 
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

Select e.numemp , e.nomemp , e.prenomemp , e.superieur, s.numemp , s.nomemp, s.prenomemp, s.superieur
    from employe e left join employe s
        on e.superieur = s.numemp;