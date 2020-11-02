Lab1 BD
creare tabele...
--------------------------------------------------------------------------------
Lab2 BD
1)Select * from studenti;
2)select nume,prenume,data_nastere from studenti;
3)select nume AS "nume prof" from profesori;
	sau
3')select nume PROFESOR from profesori;
4)select DISTINCT an from studenti;
4')select DISTINCT an,grupa from studenti;
5)SELECT * from cursuri where titlu_curs='Logica'; (Si nu LOGICA,case sensitive)
6)SELECT nume,prenume,bursa+100 FROM studenti;
7)SELECT nume,prenume,(bursa+100)/2 AS "bursa noua" FROM studenti;
8)SELECT 'Studentul'||nume||' '||prenume||'este inmatriculat in anul'||an||'si grupa'||grupa||'.' AS info from studenti;
9)SELECT nume,prenume FROM studenti WHERE an=1;
10)SELECT nume,prenume FROM studenti WHERE bursa IS NOT NULL;
11)SELECT nume,prenume FROM studenti WHERE bursa IS NOT NULL AND an=1;
12)SELECT nume,prenume FROM studenti WHERE nume LIKE '%escu';
13)SELECT nume,prenume,an FROM studenti ORDER BY an ASC;
14)SELECT nume,prenume,an FROM studenti ORDER BY an ASC,grupa DESC;
15)SELECT nume,prenume,grupa FROM studenti WHERE an=1 ORDER BY grupa ASC;
16)SELECT * FROM studenti ORDER BY 2;(2=numele studentilor,2-al2lea camp)
17)SELECT valoare * 5 FROM note;
SELECT valoare / 10 FROM note;
SELECT valoare + 1 FROM note;
SELECT valoare-1FROM note; +concatenare ||
18)SELECT nume AS "STUDENT" FROM studenti WHERE an=2;
19)SELECT * from studenti WHERE an=SOME(1,3);
20)SELECT * FROM studenti WHERE an>=ALL(1,2);
21)SELECT * FROM studenti WHERE prenume IN ('Bogdan','Alexandru');
22)SELECT * FROM studenti WHERE an NOT IN (1,2);
23)SELECT nume,prenume,an FROM studenti WHERE an BETWEEN 1 AND 3;
24)SELECT * FROM studenti WHERE nume LIKE '%andr%';
25)SELECT * FROM studenti WHERE bursa IS NOT NULL AND bursa>200;
26)SELECT * FROM studenti WHERE NOT (bursa IS NULL);
27)SELECT * FROM studenti WHERE an='3'(SAU an=3) AND bursa IS NOT NULL;
28)SELECT * FROM studenti WHERE bursa an=3 OR bursa IS NOT NULL;
29)SELECT nume,an FROM studenti WHERE an=2 UNION SELECT nume,an FROM studenti WHERE an=3;
30)SELECT nume FROM studenti WHERE an=2 INTERSECT SELECT nume FROM studenti WHERE bursa IS NOT NULL;
31)SELECT nume FROM studenti WHERE an=3 MINUS SELECT nume FROM studenti WHERE bursa IS NULL;
-----EXERCITII LAB2
1)SELECT nume,prenume,an,data_nastere FROM studenti;
2)SELECT DISTINCT bursa FROM studenti;
3)SELECT nume GABI,prenume ADI,data_nastere VALI,an ANDREI FROM studenti;
4)SELECT nume||' '||prenume||',grupa '||grupa AS "Studenti pe an de studiu" FROM studenti ORDER BY an DESC;
5)SELECT nume,prenume,data_nastere FROM studenti WHERE data_nastere BETWEEN '01-JAN-95' AND '10-JUN-97' ORDER BY an DESC;
6)SELECT nume,prenume,an,data_nastere FROM studenti WHERE data_nastere LIKE '%95';
SAU SELECT nume,prenume,an,data_nastere FROM studenti WHERE data_nastere BETWEEN '01-JAN-95' AND '31-DEC-95';
7)SELECT * FROM studenti WHERE bursa IS NULL;
8)SELECT nume,prenume FROM studenti WHERE bursa IS NOT NULL and (an=2 OR an=3) ORDER BY nume ASC,prenume DESC;
9)SELECT nume,prenume,bursa+0.15*bursa as "BURSA NOUA" FROM studenti WHERE bursa IS NOT NULL;
10)SELECT nume,prenume,an FROM studenti WHERE nume like 'P$' AND an=1;
11)SELECT * FROM studenti WHERE prenume LIKE '%a%a%';
12)SELECT * FROM studenti WHERE prenume in ('Alexandru','Ioana','Marius');
13)SELECT nume,prenume FROM studenti WHERE bursa IS NOT NULL AND grupa LIKE 'A%';
14)SELECT nume,prenume FROM profesori WHERE trim(prenume) LIKE '%n';
