--------------------------------------------------------
--  Fichier cr�� - lundi-janvier-14-2019   
--------------------------------------------------------
/*
Pr�paration des insertions
*/
alter table employe disable constraint FK_EMPLOYE_EMPLOYE ;
delete from participer;
delete from inscrit;
delete from employe;
delete from projet;
delete from seminaire;
delete from cours;

REM INSERTING into COURS
SET DEFINE OFF;
Insert into COURS (CODECOURS,LIBELLECOURS,NBJOURS) values ('BR035','UML : Perfectionnement','3');
Insert into COURS (CODECOURS,LIBELLECOURS,NBJOURS) values ('BR034','UML : Initiation','1');
Insert into COURS (CODECOURS,LIBELLECOURS,NBJOURS) values ('BR013','Administration BDR','3');
Insert into COURS (CODECOURS,LIBELLECOURS,NBJOURS) values ('BR056','SQL2 : La norme','3');
Insert into COURS (CODECOURS,LIBELLECOURS,NBJOURS) values ('BR057','Conception BD relationnelle','4');
Insert into COURS (CODECOURS,LIBELLECOURS,NBJOURS) values ('BR070','Administration d''une BD','4');
REM INSERTING into PROJET
SET DEFINE OFF;
Insert into PROJET (CODEPROJET,NOMPROJET,DEBUTPROJ,FINPREVUE,NOMCONTACT) values ('PR1 ','Anciens combattants',to_date('07/01/19','DD/MM/RR'),to_date('22/06/21','DD/MM/RR'),'Monsieur DUROI');
Insert into PROJET (CODEPROJET,NOMPROJET,DEBUTPROJ,FINPREVUE,NOMCONTACT) values ('PR2 ','Paye ADCV',to_date('01/04/19','DD/MM/RR'),to_date('19/11/21','DD/MM/RR'),'Monsieur MEYZANDIER');
Insert into PROJET (CODEPROJET,NOMPROJET,DEBUTPROJ,FINPREVUE,NOMCONTACT) values ('PR3 ','Pensions',to_date('08/04/19','DD/MM/RR'),to_date('22/10/21','DD/MM/RR'),'Madame MOULINIE');
Insert into PROJET (CODEPROJET,NOMPROJET,DEBUTPROJ,FINPREVUE,NOMCONTACT) values ('PR4 ','Refonte base pieces',to_date('29/04/19','DD/MM/RR'),to_date('10/11/21','DD/MM/RR'),'Monsieur BERTIN');
Insert into PROJET (CODEPROJET,NOMPROJET,DEBUTPROJ,FINPREVUE,NOMCONTACT) values ('PR5 ','Miroiterie Bonnet',to_date('10/06/19','DD/MM/RR'),to_date('25/11/21','DD/MM/RR'),'Monsieur BONNET');
REM INSERTING into SEMINAIRE
SET DEFINE OFF;
Insert into SEMINAIRE (CODESEMI,CODECOURS,DATEDEBUTSEM) values ('BR0350216','BR035',to_date('11/02/19','DD/MM/RR'));
Insert into SEMINAIRE (CODESEMI,CODECOURS,DATEDEBUTSEM) values ('BR0350316','BR035',to_date('11/03/19','DD/MM/RR'));
Insert into SEMINAIRE (CODESEMI,CODECOURS,DATEDEBUTSEM) values ('BR0350525','BR035',to_date('20/05/19','DD/MM/RR'));
Insert into SEMINAIRE (CODESEMI,CODECOURS,DATEDEBUTSEM) values ('BR0350907','BR035',to_date('02/09/19','DD/MM/RR'));
Insert into SEMINAIRE (CODESEMI,CODECOURS,DATEDEBUTSEM) values ('BR0351019','BR035',to_date('14/10/19','DD/MM/RR'));
Insert into SEMINAIRE (CODESEMI,CODECOURS,DATEDEBUTSEM) values ('BR0340413','BR034',to_date('08/04/19','DD/MM/RR'));
Insert into SEMINAIRE (CODESEMI,CODECOURS,DATEDEBUTSEM) values ('BR0340518','BR034',to_date('13/05/19','DD/MM/RR'));
Insert into SEMINAIRE (CODESEMI,CODECOURS,DATEDEBUTSEM) values ('BR0340921','BR034',to_date('19/09/19','DD/MM/RR'));
Insert into SEMINAIRE (CODESEMI,CODECOURS,DATEDEBUTSEM) values ('BR0341020','BR034',to_date('15/10/19','DD/MM/RR'));
Insert into SEMINAIRE (CODESEMI,CODECOURS,DATEDEBUTSEM) values ('BR0341207','BR034',to_date('02/12/19','DD/MM/RR'));
Insert into SEMINAIRE (CODESEMI,CODECOURS,DATEDEBUTSEM) values ('BR0130223','BR013',to_date('18/02/19','DD/MM/RR'));
Insert into SEMINAIRE (CODESEMI,CODECOURS,DATEDEBUTSEM) values ('BR0130914','BR013',to_date('09/09/19','DD/MM/RR'));
Insert into SEMINAIRE (CODESEMI,CODECOURS,DATEDEBUTSEM) values ('BR0560210','BR056',to_date('06/02/19','DD/MM/RR'));
Insert into SEMINAIRE (CODESEMI,CODECOURS,DATEDEBUTSEM) values ('BR0560525','BR056',to_date('20/05/19','DD/MM/RR'));
Insert into SEMINAIRE (CODESEMI,CODECOURS,DATEDEBUTSEM) values ('BR0560914','BR056',to_date('09/09/19','DD/MM/RR'));
Insert into SEMINAIRE (CODESEMI,CODECOURS,DATEDEBUTSEM) values ('BR0570323','BR057',to_date('18/03/19','DD/MM/RR'));
Insert into SEMINAIRE (CODESEMI,CODECOURS,DATEDEBUTSEM) values ('BR0570928','BR057',to_date('23/09/19','DD/MM/RR'));
Insert into SEMINAIRE (CODESEMI,CODECOURS,DATEDEBUTSEM) values ('BR0571012','BR057',to_date('07/10/19','DD/MM/RR'));
Insert into SEMINAIRE (CODESEMI,CODECOURS,DATEDEBUTSEM) values ('BR0701012','BR070',to_date('07/10/19','DD/MM/RR'));


REM INSERTING into EMPLOYE
SET DEFINE OFF;
Insert into EMPLOYE (NUMEMP,NOMEMP,PRENOMEMP,POSTE,SALAIRE,PRIME,CODEPROJET,SUPERIEUR) values ('1','DUPONT','Pierre','A22','8000','1000','PR1 ','4');
Insert into EMPLOYE (NUMEMP,NOMEMP,PRENOMEMP,POSTE,SALAIRE,PRIME,CODEPROJET,SUPERIEUR) values ('2','JOLIBOIS','Rolland','A12','10500','1500','PR2 ','5');
Insert into EMPLOYE (NUMEMP,NOMEMP,PRENOMEMP,POSTE,SALAIRE,PRIME,CODEPROJET,SUPERIEUR) values ('3','BEAUMONT','Jean','A25','12000','2000','PR1 ','6');
Insert into EMPLOYE (NUMEMP,NOMEMP,PRENOMEMP,POSTE,SALAIRE,PRIME,CODEPROJET,SUPERIEUR) values ('4','DUCHATEL','Mireille','B12','11500','3000','PR2 ','7');
Insert into EMPLOYE (NUMEMP,NOMEMP,PRENOMEMP,POSTE,SALAIRE,PRIME,CODEPROJET,SUPERIEUR) values ('5','MARTIN','Robert','B21','13000','0','PR3 ','7');
Insert into EMPLOYE (NUMEMP,NOMEMP,PRENOMEMP,POSTE,SALAIRE,PRIME,CODEPROJET,SUPERIEUR) values ('6','MAZAUD','Patricia','B14','13000','1500','PR3 ','8');
Insert into EMPLOYE (NUMEMP,NOMEMP,PRENOMEMP,POSTE,SALAIRE,PRIME,CODEPROJET,SUPERIEUR) values ('7','GIMOND','Antoine','C17','21000',null,null,'15');
Insert into EMPLOYE (NUMEMP,NOMEMP,PRENOMEMP,POSTE,SALAIRE,PRIME,CODEPROJET,SUPERIEUR) values ('8','SAULT','Jean','C23','21200',null,null,'15');
Insert into EMPLOYE (NUMEMP,NOMEMP,PRENOMEMP,POSTE,SALAIRE,PRIME,CODEPROJET,SUPERIEUR) values ('9','GALLI','Jean Daniel','A25','10000','2000','PR2 ','5');
Insert into EMPLOYE (NUMEMP,NOMEMP,PRENOMEMP,POSTE,SALAIRE,PRIME,CODEPROJET,SUPERIEUR) values ('10','JACONO','Marie','B14','11500','1500','PR5 ','20');
Insert into EMPLOYE (NUMEMP,NOMEMP,PRENOMEMP,POSTE,SALAIRE,PRIME,CODEPROJET,SUPERIEUR) values ('11','ANTHONY','Henri','A15','9500','0','PR2 ','10');
Insert into EMPLOYE (NUMEMP,NOMEMP,PRENOMEMP,POSTE,SALAIRE,PRIME,CODEPROJET,SUPERIEUR) values ('12','CANE','Michel','B15','10800','1400','PR1 ','8');
Insert into EMPLOYE (NUMEMP,NOMEMP,PRENOMEMP,POSTE,SALAIRE,PRIME,CODEPROJET,SUPERIEUR) values ('13','GOMEZ','Joseph','A12','7500','2000','PR3 ','12');
Insert into EMPLOYE (NUMEMP,NOMEMP,PRENOMEMP,POSTE,SALAIRE,PRIME,CODEPROJET,SUPERIEUR) values ('14','RIVIERE','Maurice','C18','23000',null,null,'15');
Insert into EMPLOYE (NUMEMP,NOMEMP,PRENOMEMP,POSTE,SALAIRE,PRIME,CODEPROJET,SUPERIEUR) values ('15','RUSSOT','Eric','C23','30000',null,null,null);
Insert into EMPLOYE (NUMEMP,NOMEMP,PRENOMEMP,POSTE,SALAIRE,PRIME,CODEPROJET,SUPERIEUR) values ('16','BERNARDI','Patrick','A14','9800','2500','PR2 ','18');
Insert into EMPLOYE (NUMEMP,NOMEMP,PRENOMEMP,POSTE,SALAIRE,PRIME,CODEPROJET,SUPERIEUR) values ('17','BEUGNIES','Maurice','B12','10800','2400','PR1 ','14');
Insert into EMPLOYE (NUMEMP,NOMEMP,PRENOMEMP,POSTE,SALAIRE,PRIME,CODEPROJET,SUPERIEUR) values ('18','FARNY','Daniel','B15','11500','1700','PR5 ','8');
Insert into EMPLOYE (NUMEMP,NOMEMP,PRENOMEMP,POSTE,SALAIRE,PRIME,CODEPROJET,SUPERIEUR) values ('19','ESTIVAL','Sophie','B17','12000','1000','PR4 ','8');
Insert into EMPLOYE (NUMEMP,NOMEMP,PRENOMEMP,POSTE,SALAIRE,PRIME,CODEPROJET,SUPERIEUR) values ('20','LUNEAU','Henri','C17','22500',null,null,'15');
Insert into EMPLOYE (NUMEMP,NOMEMP,PRENOMEMP,POSTE,SALAIRE,PRIME,CODEPROJET,SUPERIEUR) values ('21','BRESSON','Pierre','C23','14000',null,null,'15');
REM INSERTING into INSCRIT
SET DEFINE OFF;
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('1','BR0350216',to_date('21/01/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('2','BR0350216',to_date('24/01/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('3','BR0350216',to_date('24/01/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('7','BR0350316',to_date('25/02/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('5','BR0350316',to_date('25/02/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('6','BR0350316',to_date('05/03/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('4','BR0350316',to_date('05/03/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('8','BR0350525',to_date('29/04/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('9','BR0350525',to_date('30/04/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('10','BR0350525',to_date('30/04/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('11','BR0350525',to_date('08/05/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('12','BR0350525',to_date('15/05/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('16','BR0350907',to_date('22/08/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('13','BR0350907',to_date('22/07/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('14','BR0350907',to_date('26/08/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('18','BR0350907',to_date('27/08/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('15','BR0351019',to_date('26/09/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('19','BR0351019',to_date('27/09/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('20','BR0351019',to_date('02/10/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('1','BR0340413',to_date('02/04/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('3','BR0340413',to_date('02/04/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('4','BR0340413',to_date('04/04/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('2','BR0340518',to_date('29/04/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('5','BR0340518',to_date('10/05/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('6','BR0340518',to_date('06/05/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('7','BR0340518',to_date('01/05/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('8','BR0340518',to_date('29/04/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('9','BR0340921',to_date('26/08/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('10','BR0340921',to_date('05/09/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('12','BR0340921',to_date('02/09/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('13','BR0340921',to_date('27/08/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('14','BR0340921',to_date('27/08/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('16','BR0341020',to_date('30/09/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('17','BR0341020',to_date('07/10/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('11','BR0341020',to_date('07/10/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('18','BR0341207',to_date('25/06/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('19','BR0341207',to_date('27/06/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('15','BR0341207',to_date('26/06/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('20','BR0341207',to_date('25/06/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('1','BR0130223',to_date('05/01/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('2','BR0130223',to_date('05/01/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('4','BR0130223',to_date('15/01/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('8','BR0130223',to_date('15/02/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('15','BR0130914',to_date('15/08/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('16','BR0130914',to_date('17/08/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('12','BR0130914',to_date('29/08/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('17','BR0130914',to_date('27/08/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('18','BR0130914',to_date('17/08/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('5','BR0560210',to_date('21/01/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('7','BR0560210',to_date('22/01/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('3','BR0560210',to_date('30/01/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('9','BR0560210',to_date('31/01/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('1','BR0560525',to_date('06/05/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('2','BR0560525',to_date('07/05/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('13','BR0560525',to_date('07/05/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('14','BR0560525',to_date('08/05/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('17','BR0560914',to_date('27/08/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('19','BR0560914',to_date('30/08/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('18','BR0560914',to_date('02/09/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('20','BR0560914',to_date('03/09/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('1','BR0570323',to_date('04/03/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('4','BR0570323',to_date('06/03/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('5','BR0570323',to_date('08/03/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('10','BR0570928',to_date('09/09/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('11','BR0570928',to_date('10/09/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('13','BR0570928',to_date('16/09/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('15','BR0570928',to_date('16/09/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('14','BR0570928',to_date('18/09/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('17','BR0571012',to_date('26/09/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('16','BR0571012',to_date('27/09/19','DD/MM/RR'));
Insert into INSCRIT (NUMEMP,CODESEMI,DATEINSCRIT) values ('9','BR0571012',to_date('27/09/19','DD/MM/RR'));
REM INSERTING into PARTICIPER
SET DEFINE OFF;
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('1','BR0130223','LU');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('1','BR0130223','MA');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('1','BR0130223','ME');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('1','BR0340413','JE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('1','BR0340413','VE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('1','BR0350216','JE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('1','BR0350216','LU');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('1','BR0350216','MA');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('1','BR0350216','ME');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('1','BR0350216','VE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('1','BR0560525','JE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('1','BR0560525','ME');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('1','BR0570323','JE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('1','BR0570323','LU');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('1','BR0570323','MA');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('1','BR0570323','ME');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('2','BR0130223','LU');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('2','BR0130223','MA');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('2','BR0130223','ME');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('2','BR0340518','JE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('2','BR0350216','JE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('2','BR0350216','LU');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('2','BR0350216','MA');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('2','BR0350216','ME');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('2','BR0350216','VE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('2','BR0560525','JE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('2','BR0560525','ME');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('2','BR0560525','VE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('3','BR0340413','JE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('3','BR0340413','VE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('3','BR0350216','LU');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('3','BR0350216','MA');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('3','BR0350216','ME');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('3','BR0560210','JE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('3','BR0560210','ME');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('4','BR0130223','LU');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('4','BR0130223','MA');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('4','BR0340413','JE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('4','BR0340413','VE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('4','BR0350316','LU');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('4','BR0350316','MA');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('4','BR0350316','ME');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('4','BR0350316','VE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('4','BR0570323','JE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('4','BR0570323','LU');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('4','BR0570323','MA');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('4','BR0570323','ME');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('5','BR0340518','JE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('5','BR0340518','VE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('5','BR0350316','JE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('5','BR0350316','LU');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('5','BR0350316','MA');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('5','BR0350316','ME');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('5','BR0350316','VE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('5','BR0560210','JE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('5','BR0560210','ME');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('5','BR0560210','VE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('5','BR0570323','LU');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('5','BR0570323','MA');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('6','BR0340518','JE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('6','BR0340518','VE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('6','BR0350316','LU');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('7','BR0340518','JE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('7','BR0350316','JE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('7','BR0350316','LU');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('7','BR0350316','MA');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('7','BR0350316','ME');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('7','BR0560210','JE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('7','BR0560210','ME');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('7','BR0560210','VE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('8','BR0130223','LU');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('8','BR0130223','MA');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('8','BR0130223','ME');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('8','BR0340518','JE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('8','BR0340518','VE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('8','BR0350525','JE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('8','BR0350525','LU');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('8','BR0350525','MA');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('8','BR0350525','ME');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('8','BR0350525','VE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('9','BR0340921','JE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('9','BR0350525','JE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('9','BR0350525','LU');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('9','BR0350525','ME');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('9','BR0350525','VE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('9','BR0560210','JE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('9','BR0560210','ME');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('9','BR0560210','VE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('9','BR0571012','LU');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('9','BR0571012','MA');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('10','BR0340921','JE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('10','BR0350525','JE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('10','BR0350525','LU');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('10','BR0350525','MA');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('10','BR0350525','ME');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('10','BR0350525','VE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('10','BR0570928','LU');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('10','BR0570928','MA');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('10','BR0570928','ME');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('11','BR0341020','JE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('11','BR0341020','VE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('11','BR0350525','LU');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('11','BR0350525','MA');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('11','BR0350525','ME');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('11','BR0350525','VE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('11','BR0570928','JE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('11','BR0570928','LU');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('11','BR0570928','MA');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('11','BR0570928','ME');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('12','BR0130914','LU');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('12','BR0130914','MA');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('12','BR0340921','JE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('12','BR0340921','VE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('12','BR0350525','JE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('12','BR0350525','LU');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('12','BR0350525','MA');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('12','BR0350525','ME');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('12','BR0350525','VE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('13','BR0340921','JE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('13','BR0340921','VE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('13','BR0350907','JE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('13','BR0350907','LU');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('13','BR0350907','MA');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('13','BR0350907','ME');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('13','BR0560525','JE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('13','BR0560525','ME');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('13','BR0570928','JE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('13','BR0570928','LU');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('13','BR0570928','MA');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('13','BR0570928','ME');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('14','BR0340921','JE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('14','BR0340921','VE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('14','BR0350907','JE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('14','BR0350907','LU');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('14','BR0350907','MA');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('14','BR0350907','ME');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('14','BR0350907','VE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('14','BR0560525','JE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('14','BR0560525','ME');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('14','BR0560525','VE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('14','BR0570928','LU');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('14','BR0570928','MA');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('14','BR0570928','ME');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('15','BR0130914','LU');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('15','BR0130914','MA');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('15','BR0341207','JE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('15','BR0341207','VE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('15','BR0351019','JE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('15','BR0351019','LU');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('15','BR0351019','MA');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('15','BR0351019','ME');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('15','BR0351019','VE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('15','BR0570928','LU');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('16','BR0130914','LU');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('16','BR0130914','MA');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('16','BR0130914','ME');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('16','BR0341020','JE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('16','BR0341020','VE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('16','BR0350907','LU');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('16','BR0350907','MA');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('16','BR0350907','ME');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('16','BR0571012','LU');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('16','BR0571012','MA');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('16','BR0571012','ME');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('17','BR0130914','LU');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('17','BR0130914','MA');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('17','BR0130914','ME');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('17','BR0341020','JE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('17','BR0560914','JE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('17','BR0560914','ME');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('17','BR0571012','JE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('17','BR0571012','LU');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('17','BR0571012','MA');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('17','BR0571012','ME');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('18','BR0130914','LU');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('18','BR0341207','JE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('18','BR0341207','VE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('18','BR0350907','JE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('18','BR0350907','LU');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('18','BR0350907','ME');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('18','BR0350907','VE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('18','BR0560914','JE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('18','BR0560914','ME');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('18','BR0560914','VE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('19','BR0341207','JE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('19','BR0351019','JE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('19','BR0351019','LU');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('19','BR0351019','MA');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('19','BR0351019','ME');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('19','BR0351019','VE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('19','BR0560914','ME');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('20','BR0341207','JE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('20','BR0341207','VE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('20','BR0351019','JE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('20','BR0351019','LU');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('20','BR0351019','MA');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('20','BR0351019','ME');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('20','BR0560914','JE');
Insert into PARTICIPER (NUMEMP,CODESEMI,CODEJOUR) values ('20','BR0560914','ME');

commit;
alter table employe enable constraint FK_EMPLOYE_EMPLOYE ;