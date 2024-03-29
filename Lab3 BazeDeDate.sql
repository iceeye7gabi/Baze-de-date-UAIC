Laborator 3 Baze de Date
----------------------------------------
1)SELECT CEIL(51.3) FROM DUAL;
2)SELECT FLOOR(51.3) FROM DUAL;
3)SELECT ROUND(21.365,2) AS "Rotunjire-pozitiv" FROM DUAL;
4)SELECT ROUND(21.365,-1) AS "Rotunjire-negativ" FROM DUAL;
5)SELECT TRUNC(21.365,2) AS "Trunchiere-pozitiv" FROM DUAL;
6)SELECT TRUNC(21.365,-1) AS "Trunchiere-negativ" FROM DUAL;
7)SELECT MOD(26,11) AS "Mod" FROM DUAL;
8)SELECT length('cuvant') AS "Lungime cuvant" FROM DUAL;
9)SELECT prenume,length(prenume) FROM profesori WHERE UPPER(TRIM(prenume))='COSMIN';
10)SELECT ASCII('A') FROM DUAL;
11)SELECT INSTR('CORPORATE FLOOR','OR',3,2) AS "Instring" FROM DUAL;
12)SELECT nume,INSTR(nume,'ra') AS "De unde incepe ra" FROM profesori;
13)SELECT INITCAP('adi e tare') FROM DUAL;
14)SELECT UPPER('Sper ca va ajuta ce am facut eu aici') FROM DUAL;
15)SELECT LOWER('GABI CONSTANTINESCU,2E3,2020-2021') FROM DUAL;
16)SELECT REVERS('IBAG TNUS UE') FROM DUAL;
17)SELECT CONCAT(CONCAT(nume,' este student in anul '),an) FROM studenti;
18)SELECT CONCAT('Eu ma numesc','Gabriel Constantinescu and you will remeber IT!') FROM DUAL;
19)SELECT SUBSTR('EU SUNT GABI',3,5) FROM DUAL;
20)SELECT RPAD(nume,12,'ab') FROM studenti WHERE nume='Popescu';
21)SELECT LPAD('Pagina1',15,'*.') FROM DUAL;
22)SELECT CHR(68)||CHR(65)||CHR(64) FROM DUAL;
23)SELECT REPLACE('Gabbbbbi','i','ai') FROM DUAL;
24)SELECT TRANSLATE('48KLM980', '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ', '9999999999XXXXXXXXXXXXXXXXXXXXXXXXXX') "COD" FROM DUAL;
PT 4, 4 ESTE IN DREPTUL LUI X(asta se repeta pt fiecare cifra)
cand ajungem la litere ,vedem ca e X
25)SELECT * FROM studenti WHERE UPPER(prenume)='ANDREI';(case insensitive, ne ajuta sa nu ne mai chinuiem sa vedem cum e scris Andrei in tabel)
26)SELECT * FROM profesori WHERE TRIM(UPPER(nume))='BREABAN';(este de tip char si avem spatii, si ca sa avem rezultatele dorite punem trim)
27)SELECT CURRENT_DATE FROM DUAL;
28)SELECT CURRENT_TIMESTAMP FROM DUAL;
29)SELECT SYSDATE FROM DUAL;
SELECT TO_CHAR(SYSDATE,'DD-MM-YYYY HH:MI') FROM DUAL;
30)SELECT MONTHS_BETWEEN(TO_DATE('02-02-2015','MM-DD-YYYY'),TO_DATE('01-01-2015','MM-DD-YYYY')) AS "Months" FROM DUAL;
31)SELECT data_nastere,ADD_MONTHS(data_nastere,3) FROM studenti WHERE nume='Popescu';
32)SELECT NEXT_DAY('13-OCT-15','TUESDAY') FROM DUAL;
33)SELECT SYSDATE,LAST_DAY(SYSDATe) AS "Last day" FROM DUAL;
34)SELECT ROUND(TO_DATE('27-OCT-16','DD-MM-YY'),'YEAR') AS "New Year" FROM DUAL;
35)SELECT TRUNC(TO_DATE('27-OCT-16','DD-MM-YY'),'YEAR')"First day of the year" FROM DUAL;
36)SELECT TRUNC(TO_DATE('27-OCT-16','DD-MM-YY'),'MONTH)"First day of the month" FROM DUAL;
37)SELECT SYSDATE+10 FROM DUAL;(NR DE ZILE CRESTE CU 10)
38)SELECT (SYSDATE-data_nastere)/365 FROM studenti;
39)SELECT 'Este o zi frumoasa de ' , TO_CHAR(SYSDATE,'month','NLS_DATE_LANGUAGE=ROMANIAN') FROM DUAL;
40)+... functii de conversie
41)SELECT nume,prenume,TO_CHAR(data_nastere,'month','NLS_DATE_LANGUAGE=ROMANIAN') FROM studenti;
42)SELECT USER FROM DUAL;
43)SELECT nume,NVL(bursa,0) "bursa" FROM studenti;
44)SELECT nume,NVL(TO_CHAR(bursa),'Nu are bursa') "Bursa" FROM studenti;
45)SELECT nume,DECODE(bursa,450,'premiulI',350,'premiulII',250,'premiulIII','MENTIUNE') FROM studenti;
46)SELECT LEAST('Mihai','Anca','Gabi','Andrei','GG') "Least" FROM DUAL;
47)SELECT GREATEST('Mihai','Anca','Gabi','Andrei','GG') "Greatest" FROM DUAL;
48)SELECT nume,prenume,NVL(bursa,0)+100 FROM studenti;
--------------------------
Exercitii
1)SELECT CURRENT_DATE "Astazi" FROM DUAL;
2)SELECT nume,data_nastere,FLOOR(MONTHS_BETWEEN(CURRENT_DATE,data_nastere)) FROM studenti;
3)SELECT TO_CHAR(data_nastere,'DAY') FROM studenti;
4)SELECT CONCAT(CONCAT('Elevul ',prenume),CONCAT(' este in grupa ',grupa)) FROM studenti;
5)SELECT nume,RPAD(NVL(bursa,0),10,'$') FROM studenti;
6)SELECT SUBSTR(LOWER(nume),1,1)||SUBSTR(UPPER(nume),2),length(nume) FROM profesori WHERE nume LIKE 'B%';
7)select nume,
       DATA_NASTERE,
       case when to_date(to_char(DATA_NASTERE, 'mmdd'), 'mmdd') < trunc(sysdate)
                    then add_months(to_date(to_char(DATA_NASTERE, 'mmdd'), 'mmdd'), 12)
                    else to_date(to_char(DATA_NASTERE, 'mmdd'), 'mmdd')
       end next_bday,
       NEXT_DAY(case when to_date(to_char(DATA_NASTERE, 'mmdd'), 'mmdd') < trunc(sysdate)
                    then add_months(to_date(to_char(DATA_NASTERE, 'mmdd'), 'mmdd'), 12)
                    else to_date(to_char(DATA_NASTERE, 'mmdd'), 'mmdd')
            end,'SUNDAY')
from STUDENTI
:((
8)SELECT nume,prenume,TO_CHAR(data_nastere,'month') "L" FROM studenti WHERE bursa IS NULL ORDER BY L ASC;
sau cu extract(nu este in laborator)
SELECT nume,prenume,extract(month FROM data_nastere) "L" FROM studenti WHERE bursa IS NULL ORDER BY L ASC;
9)SELECT nume,prenume,DECODE(bursa,450,'premiul1',350,'premiul2',250,'premiul3','mentiune') AS "Premiu" FROM studenti;
10)SELECT TRANSLATE(nume,'ai','ia') as"Translatie" FROM studenti;
11)SELECT nume,FLOOR(MONTHS_BETWEEN(CURRENT_DATE,DATA_NASTERE)/12) AS "ANI" FROM studenti;
SELECT NUME,MOD(FLOOR(MONTHS_BETWEEN(CURRENT_DATE,DATA_NASTERE)/12),12) AS"LUNI" FROM studenti;
SELECT NUME,FLOOR(CURRENT_DATE-ADD_MONTHS(DATA_NASTERE,FLOOR(MONTHS_BETWEEN(CURRENT_DATE,DATA_NASTERe)))) AS "Zile" FROM studenti;
SELECT NUME,365-FLOOR(CURRENT_DATE-ADD_MONTHS(DATA_NASTERE,FLOOR(MONTHS_BETWEEN(CURRENT_DATE,DATA_NASTERe)))) AS "Zile" FROM studenti;
12)SELECT nume,'1/'||extract(month FROM add_months(DATA_NASTERE,1))|| '/'||extract(year from add_months(data_nastere,1)) as "INFO",DECODE(bursa,450,450+0.10*450,350,350+0.15*350,250,250+0.20*250,0) AS "INFO2" FROM studenti;
13)SELECT nume,NVL(RPAD(' ',bursa/50,'*'),'nu are bursa') FROM studenti;
sau la final cu WHERE bursa IS NOT NULL;
