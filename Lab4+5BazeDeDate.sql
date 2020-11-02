Laborator4+5 Baze de Date
1)SELECT * FROM studenti CROSS JOIN note;
2)SELECT * FROM studenti CROSS JOIN note WHERE prenume='Andrei';
3)SELECT * FROM studenti CROSS JOIN note CROSS JOIN cursuri;
4)SELECT * FROM studenti JOIN note ON studenti.nr_matricol=note.nr_matricolo ORDER BY nume;
5)SELECT * FROM studenti JOIN note ON studenti.nr_matricol=note.nr_matricol WHERE prenume='Andrei';
nu merge, trebuie sa folosim NATURAL JOIN
6)SELECT * FROM studenti JOIN note ON studenti.nr_matricol=note.nr_matricol WHERE prenume='Ioana';
7)SELECT nume,prenume,valoare NATURAL JOIN note WHERE prenume='Ioana';
8)SELECT nume,prenume,valoare,studenti.nr_matricol FROM studenti JOIN note ON studenti.nr_matricol=note.nr_matricol WHERE prenume='Ioana';
9)SELECT nume,prenume,valoare,nr_matricol FROM studenti NATURAL JOIN note WHERE prenume='Ioana';
10)SELECT nume,prenume,valoare,s.nr_matricol FROM studenti s JOIN note n ON s.nr_matricol=n.nr_matricol;
11)SELECT nume,prenume,valoare,nr_matricol FROM studenti s NATURAL JOIN note n WHERE s.nr_matricol=n.nr_matricol;
12)SELECT nume,prenume,valoare,nr_matricol FROM studenti s NATURAL JOIN note n WHERE s.nr_matricol=n.nr_matricol;
12 nu merge, nu poti avea qualfiier la natural JOIN
13)SELECT DISTINCT nume FROM studenti s LEFT OUTER JOIN note n ON s.nr_matricol=n.nr_matricol;
14)SELECT DISTINCT nume FROM studenti s RIGHT OUTER JOIN note n ON s.nr_matricol=n.nr_matricol;
15)SELECT DISTINCT nume FROM studenti s,note n WHERE s.nr_matricol=n.nr_matricol(+);==16
16)SELECT DISTINCT nume FROM studenti s FULL OUTER JOIN note n ON s.nr_matricol=n.nr_matricol;
17)SELECT nume,prenume,titlu_curs,valoare FROM studenti s JOIN note n ON s.nr_matricol=n.nr_matricol JOIN cursuri c ON c.id_curs=n.id_curs;
18)SELECT s.nume ||' '|| s.prenume ||' este coleg cu '||colegi.nume || ' '|| colegi.prenume AS "Colegi de grupa" FROM studenti s JOIN studenti colegi ON s.grupa=colegi.grupa AND s.an=colegi.an WHERE s.prenume='Andrei' AND(s.prenume!=colegi.prenume AND s.nume!=colegi.nume);
---------------------------------------
Exercitii
1)SELECT s.nume,p.nume,n.valoare FROM studenti s JOIN note n ON s.nr_matricol=n.nr_matricol JOIN didactic d ON n.id_curs=d.id_curs JOIN profesori p ON d.id_prof=p.id_prof;
2)SELECT s.nume,s.prenume,n.valoare AS "NOTE BD" FROM studenti s JOIN note n ON s.nr_matricol=n.nr_matricol JOIN cursuri c ON n.id_curs=c.id_curs WHERE(titlu_curs='BD' AND n.valoare=10);
3)SELECT p.nume,p.prenume,c.titlu_curs FROM profesori p JOIN didactic d ON p.id_prof=d.id_prof JOIN cursuri c ON d.id_curs=c.id_curs; 
4)SELECT p.nume,p.prenume,c.titlu_curs FROM profesori p LEFT JOIN didactic d ON p.id_prof=d.id_prof LEFT JOIN cursuri c ON d.id_curs=c.id_curs WHERE titlu_curs IS NULL;
5)SELECT p.nume,p.prenume,c.titlu_curs FROM profesori P RIGHT JOIN didactic d ON p.id_prof=d.id_prof RIGHT JOIN cursuri c ON d.id_curs=c.id_curs WHERE p.nume IS NULL AND p.prenume IS NULL;
6)SELECT p.nume,p.prenume,c.titlu_curs FROM profesori p FULL JOIN didactic d ON p.id_prof=d.id_prof FULL JOIN cursuri c ON d.id_curs=c.id_curs WHERE (titlu_curs IS NULL OR (p.nume IS NULL AND p.prenume IS NULL));
7)SELECT s1.nume,s1.data_nastere,s2.nume,s2.data_nastere FROM studenti s1 JOIN studenti s2
ON s1.nr_matricol>s2.nr_matricol WHERE TO_CHAR(s1.data_nastere,'D')=TO_CHAR(s2.data_nastere,'D')
ORDER BY s1.nume,extract(Day from s1.data_nastere);
8)SELECT s1.nume,s1.prenume,s2.nume,s2.prenume,c.titlu_curs FROM studenti s1 JOIN studenti s2 ON s1.nr_matricol<>s2.nr_matricol JOIN note n1 ON s1.nr_matricol=n1.nr_matricol JOIN note n2 ON s2.nr_matricol=n2.nr_matricol JOIN cursuri c ON n1.id_curs=c.id_curs AND n2.id_curs=c.id_curs WHERE (n1.valoare>n2.valoare);
-------------------
LAB 5
Exercitii
1)SELECT s1.nume,s1.prenume,s2.nume,s2.prenume,CEIL(MONTHS_BETWEEN(s1.data_nastere,s2.data_nastere)) FROM studenti s1 JOIN studenti s2 ON s1.nr_matricol<>s2.nr_matricol ORDER BY MONTHS_BETWEEN(s1.data_nastere,s2.data_nastere);
2)SELECT s.nume,s.prenume,p.nume,p.prenume FROM studenti s JOIN profesori p ON length(trim(s.nume))=length(trim(p.nume));  
3)SELECT DISTINCT c.titlu_curs FROM cursuri c JOIN note n ON c.id_curs=n.id_curs WHERE n.valoare<=8;
4)SELECT DISTINCT s.nume FROM studenti s JOIN note n ON s.nr_matricol=n.nr_matricol WHERE n.valoare>=8;
5)SELECT s.nume,s.prenume FROM studenti s JOIN note n ON s.nr_matricol=n.nr_matricol JOIN cursuri c ON n.id_curs=c.id_curs WHERE TO_CHAR(n.data_notare,'day','NLS_DATE_LANGUAGE=romanian')='marți' AND c.id_curs=23 AND (n.valoare=7 OR n.valoare=10);
SELECT s.nume,s.prenume FROM studenti s JOIN note n ON s.nr_matricol=n.nr_matricol JOIN cursuri c ON n.id_curs=c.id_curs WHERE TO_CHAR(n.data_notare,'day')='tuesday' AND c.id_curs=23 AND (n.valoare=7 OR n.valoare=10);
SELECT s.nume,s.prenume FROM studenti s JOIN note n ON s.nr_matricol=n.nr_matricol JOIN cursuri c ON n.id_curs=c.id_curs WHERE TO_CHAR(n.data_notare,'day')='tuesday' AND c.titlu_curs='OOP' AND (n.valoare=7 OR n.valoare=10);
6)SELECT s.nume,s.prenume,n.valoare,c.titlu_curs,TO_CHAR(n.data_notare,'MONTH')||' '||extract(Year FROM n.data_notare) FROM studenti s JOIN note n ON s.nr_matricol=n.nr_matricol JOIN cursuri c ON n.id_curs=c.id_curs WHERE n.valoare>5;

SELECT s.nume,s.prenume,n.valoare,c.titlu_curs,TO_CHAR(n.data_notare,'MONTH')||' '||extract(Year FROM n.data_notare)||' + ' FROM studenti s JOIN note n ON s.nr_matricol=n.nr_matricol JOIN cursuri c ON n.id_curs=c.id_curs WHERE n.valoare>=5 AND extract(Month FROM n.data_notare)=2
UNION
SELECT s.nume,s.prenume,n.valoare,c.titlu_curs,TO_CHAR(n.data_notare,'MONTH')||' '||extract(Year FROM n.data_notare) FROM studenti s JOIN note n ON s.nr_matricol=n.nr_matricol JOIN cursuri c ON n.id_curs=c.id_curs WHERE n.valoare>=5 AND extract(Month FROM n.data_notare)=6;
