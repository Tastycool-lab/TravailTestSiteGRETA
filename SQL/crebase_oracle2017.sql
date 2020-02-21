-- ************************************************************
--   Nom de la base   :  BASE_EXEMPLE                          
--   Nom de SGBD      :  ORACLE Version 9.2.0                    
--   Date de mdification:  23/02/2017  17:34                       
--   Auteur :  Benoît ROCHE    
-- ************************************************************

drop table PARTICIPER cascade constraints
/

drop table INSCRIT cascade constraints
/

drop table EMPLOYE cascade constraints
/

drop table SEMINAIRE cascade constraints
/

drop table PROJET cascade constraints
/

drop table COURS cascade constraints
/

-- ************************************************************
--   Table : COURS                                             
-- ************************************************************
create table COURS
(
    CODECOURS     varchar(6)            not null,
    LIBELLECOURS  varchar(35)           not null,
    NBJOURS       SMALLINT              default 3 not null,
    constraint PK_COURS primary key (CODECOURS),
	constraint ckc_cours_nbjours check (nbjours between 1 and 5)
)
/

-- ************************************************************
--   Table : PROJET                                            
-- ************************************************************
create table PROJET
(
    CODEPROJET    CHAR(4)                not null,
    NOMPROJET     varchar(20)           not null,
    DEBUTPROJ     DATE			    not null,
    FINPREVUE     DATE                   not null,
    NOMCONTACT    varchar(35)           not null,
    constraint PK_PROJET primary key (CODEPROJET),
	constraint ckc_datedebutfin_projet check (FINPREVUE>DEBUTPROJ)
)
/

-- ************************************************************
--   Table : SEMINAIRE                                         
-- ************************************************************
create table SEMINAIRE
(
    CODESEMI      varchar(10)           not null,
    CODECOURS     varchar(6)            not null,
    DATEDEBUTSEM  DATE                   not null,
    constraint PK_SEMINAIRE primary key (CODESEMI),
    constraint FK_SEMINAIRE_COURS foreign key  (CODECOURS)
       references COURS (CODECOURS) on delete cascade
)
/

-- ************************************************************
--   Autres index sur : SEMINAIRE 
-- ************************************************************
create index FK1_SEMINAIRE on SEMINAIRE (CODECOURS asc)
/

-- ************************************************************
--   Table : EMPLOYE                                           
-- ************************************************************
create table EMPLOYE
(
    NUMEMP        INTEGER                not null,
    NOMEMP        varchar(25)           not null,
    PRENOMEMP     varchar(25)           not null,
    POSTE         varchar(20)           not null,
    SALAIRE       NUMBER(8,2)            not null,
    PRIME         NUMBER(7,2)            null    ,
    CODEPROJET    CHAR(4)                null    ,
    SUPERIEUR     INTEGER                null    ,
    constraint PK_EMPLOYE primary key (NUMEMP),
    constraint FK_EMPLOYE_EMPLOYE foreign key  (SUPERIEUR)
       references EMPLOYE (NUMEMP),
    constraint FK_EMPLOYE_PROJET foreign key  (CODEPROJET)
       references PROJET (CODEPROJET)
)
/


-- ************************************************************
--   Autres index sur : EMPLOYE 
-- ************************************************************
create index FK1_EMPLOYE on EMPLOYE (SUPERIEUR asc)
/
create index FK2_EMPLOYE on EMPLOYE (CODEPROJET asc)
/

-- ************************************************************
--   Table : INSCRIT                                   
-- ************************************************************
create table INSCRIT
(
    NUMEMP        INTEGER                not null,
    CODESEMI      varchar(10)           not null,
    DATEINSCRIT   DATE                   default sysdate not null,
    constraint PK_INSCRIT primary key (CODESEMI, NUMEMP),
    constraint FK_INSCRIT_SEMINAIRE foreign key  (CODESEMI)
       references SEMINAIRE (CODESEMI) on delete cascade,
    constraint FK_INSCRIT_EMPLOYE foreign key  (NUMEMP)
       references EMPLOYE (NUMEMP)
)
/

-- ************************************************************
--   Autres index sur : INSCRIT 
-- ************************************************************
create index FK1_INSCRIT on INSCRIT (CODESEMI asc)
/
create index FK2_INSCRIT on INSCRIT (NUMEMP asc)
/

-- ************************************************************
--   Table : PARTICIPER                                        
-- ************************************************************
create table PARTICIPER
(
    NUMEMP        INTEGER                not null,
    CODESEMI      varchar(10)           not null,
    CODEJOUR      CHAR(2)                not null,
    constraint CKC_CODEJOUR_PARTICIP check (CODEJOUR in ('LU','MA','ME','JE','VE')),
    constraint PK_PARTICIPER primary key (NUMEMP, CODESEMI, CODEJOUR),
    constraint FK_PARTICIPER_INSCRIT foreign key (numemp, codesemi)
          references inscrit (numemp, codesemi) on delete cascade
)
/

-- ************************************************************
--   Autres index sur : PARTICIPER 
-- ************************************************************
create index FK1_PARTICIPER on PARTICIPER (CODESEMI asc)
/
create index FK2_PARTICIPER on PARTICIPER (NUMEMP asc)
/

