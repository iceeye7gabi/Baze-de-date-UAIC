==================================================
===============    NECORELATE    =================
==================================================

1) select nume, prenume from studeti where bursa = (select max(bursa) from studenti);

2) select * from studenti where (an, grupa) in (select an, grupa from studenti where nume='Arhire');

3) select nume, prenume, valoare, an, grupa from studenti natural join note where (valoare, an, grupa) in (select min(valoare), an, grupa from studenti natural join note group by an, grupa);

4)  select nume, prenume, avg(valoare) from studenti natural join note group by nr_matricol, nume, prenume having avg(valoare)>(select avg(valoare) from note);

5)  select * from (select nume, prenume,avg(valoare) from studenti natural join note group by nr_matricol, nume, prenume order by avg(valoare) desc) where rownum<4;

6) select nume, prenume, avg(valoare) from studenti natural join note group by nr_matricol, nume, prenume having avg(valoare)=(select max(avg(valoare)) from note group by nr_matricol);

7) select nume, prenume from studenti s join note n on s.nr_matricol=n.nr_matricol join cursuri c on c.id_curs=n.id_curs where titlu_curs='Logica' and nume<>'Ciobotariu' and prenume<>'Ciprian' and valoare = (select valoare from studenti s join note n on s.nr_matricol=n.nr_matricol join cursuri c on c.id_curs=n.id_curs where s.nume='Ciobotariu' and s.prenume='Ciprian' and c.titlu_curs='Logica');

8) select nume, prenume from (select nume, prenume, rownum rn from (select nume, prenume from studenti order by nume, prenume) where rownum<6) where rn=5;

9)  select * from studenti where nr_matricol IN (select nr_matricol from (select nr_matricol, pct, rownum rn from (select nr_matricol, sum(valoare*credite) pct from note natural join cursuri group by nr_matricol order by pct desc))where rn=3);

10) select nr_matricol, nume, prenume, id_curs, valoare from studenti natural join note group by nr_matricol, nume, prenume, id_curs, valoare having (id_curs,valoare) IN (select id_curs, max(valoare) from note group by id_curs);


dar daca vreau sa afisez si titlu curs ar trebui sa fac un join cu cursurile sau sa ma folosesc de urmatoarea subinterogare corelata:

select s1.nr_matricol, nume, prenume, (select titlu_curs from cursuri where id_curs=n1.id_curs), valoare from studenti s1 join note n1 on s1.nr_matricol=n1.nr_matricol group by s1.nr_matricol, nume, prenume, id_curs, valoare having (id_curs,valoare) IN (select id_curs, max(valoare) from note group by id_curs);

==================================================
=================    CORELATE    =================
==================================================

1) select * from studenti minus select * from studenti s1 where exists(select 'mai mic' from studenti s2 where s1.data_nastere>s2.data_nastere and s1.an=s2.an);

2)  select nume, prenume, avg(valoare) from studenti s1 join note n1 on s1.nr_matricol=n1.nr_matricol group by s1.nr_matricol, nume, prenume, an having avg(valoare) >= ALL(select avg(valoare) from studenti s2 join note n2 on s2.nr_matricol=n2.nr_matricol where s1.an=s2.an group by s2.nr_matricol);

3) select nume, prenume, avg(valoare), an, grupa from studenti s1 join note n1 on s1.nr_matricol=n1.nr_matricol group by s1.nr_matricol, nume, prenume, an, grupa having avg(valoare) >= ALL(select avg(valoare) from studenti s2 join note n2 on s2.nr_matricol=n2.nr_matricol where s1.an=s2.an and s1.grupa=s2.grupa group by s2.nr_matricol);

4) select nume, prenume, avg(valoare), an, grupa from studenti s1 join note n1 on s1.nr_matricol=n1.nr_matricol group by s1.nr_matricol, nume, prenume, an, grupa having avg(valoare) >= ALL(select avg(valoare) from studenti s2 join note n2 on s2.nr_matricol=n2.nr_matricol where s1.an=s2.an and s1.grupa=s2.grupa group by s2.nr_matricol);

5) select * from studenti s1 where not exists (select 'ceva' from studenti s2 where s1.nr_matricol<>s2.nr_matricol and s1.an=s2.an and s1.grupa=s2.grupa);

6) select nume, prenume, avg(valoare) from profesori p1 join didactic d1 on p1.id_prof=d1.id_prof join note n1 on d1.id_curs=n1.id_curs group by p1.id_prof, nume, prenume having avg(valoare) in (select avg(valoare) from profesori p2 join didactic d2 on p2.id_prof=d2.id_prof join note n2 on n2.id_curs=d2.id_curs where p1.id_prof<>p2.id_prof group by p1.id_prof, nume, prenume);

7) select s1.nume, s1.prenume, (select avg(valoare) from note where nr_matricol=s1.nr_matricol) as media from studenti s1;

8) CORELAT: select titlu_curs from cursuri c1 where not exists (select 1 from cursuri c2 where c2.credite>c1.credite and c1.an=c2.an); 

8) NECORELAT: select titlu_curs from cursuri where (credite, an) in (select max(credite), an from cursuri group by an);
