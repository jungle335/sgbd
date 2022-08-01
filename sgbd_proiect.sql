drop table tmcitemicomenzi;
drop table tmcalimentaristoc;
drop table tmcfurnizori;
drop table tmcalbume;
drop table tmccomenzi;
drop table tmcclienti;

CREATE TABLE tmcclienti
  (
    id_client NUMBER PRIMARY KEY,
    nume      VARCHAR(50) NOT NULL,
    prenume   VARCHAR(50) NOT NULL,
    email     VARCHAR(35) NOT NULL,
    telefon   VARCHAR(12) NOT NULL
  );
  
CREATE TABLE tmccomenzi
  (
    nr_comanda NUMBER PRIMARY KEY,
    data_comanda DATE NOT NULL,
    data_ridicare_comanda DATE,
    id_client NUMBER NOT NULL,
    FOREIGN KEY (id_client) REFERENCES tmcclienti(id_client)
  );
  
CREATE TABLE tmcfurnizori
  (
    id_furnizor  NUMBER PRIMARY KEY,
    nume_furnizor VARCHAR(25) NOT NULL,
    telefon VARCHAR(12) NOT NULL
  );

CREATE TABLE tmcalbume
  (
    id_album    NUMBER PRIMARY KEY,
    denumire    VARCHAR(50) NOT NULL,
    nume_trupa  VARCHAR(30) NOT NULL,
    an_lansare  NUMBER(4) NOT NULL
  );

CREATE TABLE tmcalimentaristoc
  (
    cod NUMBER PRIMARY KEY,
    tip VARCHAR(5) CHECK (tip IS NOT NULL AND tip IN ('Cd', 'Vinil')),
    data DATE NOT NULL,
    pret NUMBER NOT NULL,
    nr_bucati_stoc NUMBER NOT NULL,
    id_album NUMBER NOT NULL,
    FOREIGN KEY (id_album) REFERENCES tmcalbume(id_album),
    id_furnizor NUMBER NOT NULL,
    FOREIGN KEY (id_furnizor) REFERENCES tmcfurnizori(id_furnizor)
  );
  
CREATE TABLE tmcitemicomenzi
  (
    nr_comanda NUMBER NOT NULL,
    FOREIGN KEY (nr_comanda) REFERENCES tmccomenzi(nr_comanda),
    cod NUMBER NOT NULL,
    FOREIGN KEY (cod) REFERENCES tmcalimentaristoc(cod),
    UNIQUE(nr_comanda, cod),
    nr_exemplare_comandate NUMBER NOT NULL
  );

INSERT INTO tmcclienti VALUES (1, 'Martin', 'Wolf', 'non.massa@gnanec.org', '072-456-4156');
INSERT INTO tmcclienti VALUES (2, 'Dima', 'Maria', 'mary.semper@in.edu', '072-783-3534');
INSERT INTO tmcclienti VALUES (3, 'Daniel','Radu', 'radu@nulla.ca', '072-335-2889');
INSERT INTO tmcclienti VALUES (4, 'George', 'Marin', 'odio@sem.edu', '073-538-9474');
INSERT INTO tmcclienti VALUES (5, 'Ferdinand', 'Robert', 'tempor@necurna.org', '074-378-6292');
INSERT INTO tmcclienti VALUES (6, 'Rooney', 'Matthews', 'feugiat@sedorci.com', '070-111-3753');
INSERT INTO tmcclienti VALUES (7, 'Popescu', 'Ion', 'pop_ion@gmail.com', '070-820-5645');

INSERT INTO tmccomenzi VALUES(1, '10-MAY-2017', '12-MAY-2017', 1);
INSERT INTO tmccomenzi VALUES(2, '12-MAR-2019', '14-MAR-2019', 2);
INSERT INTO tmccomenzi VALUES(3, '20-MAR-2019', '23-MAR-2019', 5);
INSERT INTO tmccomenzi VALUES(4, '10-OCT-2020', '15-OCT-2020', 3);
INSERT INTO tmccomenzi VALUES(5, '5-JAN-2021', NULL, 1);
INSERT INTO tmccomenzi VALUES(6, '29-DEC-2020', NULL, 4);
INSERT INTO tmccomenzi VALUES(7, sysdate, NULL, 5);
INSERT INTO tmccomenzi VALUES(8, sysdate, NULL, 6);
INSERT INTO tmccomenzi VALUES(9, sysdate, NULL, 7);
INSERT INTO tmccomenzi VALUES(10, sysdate, NULL, 2);
INSERT INTO tmccomenzi VALUES(11, sysdate, NULL, 3);

INSERT INTO tmcfurnizori VALUES(1, 'Empire Music', '070-208-5635');
INSERT INTO tmcfurnizori VALUES(2, 'All You Need', '077-820-5564');
INSERT INTO tmcfurnizori VALUES(3, 'Pragma', '075-820-5345');
INSERT INTO tmcfurnizori VALUES(4, 'The Best', '073-820-5645');
INSERT INTO tmcfurnizori VALUES(5, 'Rapid Music', '075-115-6455');
INSERT INTO tmcfurnizori VALUES(6, 'CD and Vinil', '078-828-5645');
INSERT INTO tmcfurnizori VALUES(7, 'Just CD', '076-288-5554');

INSERT INTO tmcalbume VALUES(1, 'High Voltage', 'Ac/dc', 1976);
INSERT INTO tmcalbume VALUES(2, 'Highway to hell', 'Ac/dc', 1979);
INSERT INTO tmcalbume VALUES(3, 'Ride the lightning', 'Metallica', 1984);
INSERT INTO tmcalbume VALUES(4, 'Load', 'Metallica', 1996);
INSERT INTO tmcalbume VALUES(5, 'Metallica', 'Metallica', 1991);
INSERT INTO tmcalbume VALUES(6, 'Automatic for the people', 'REM', 1992);
INSERT INTO tmcalbume VALUES(7, 'Cantafabule', 'Phoenix', 1975);

INSERT INTO tmcalimentaristoc VALUES(1, 'Cd', '12-OCT-2019', 50, 100, 1, 1);
INSERT INTO tmcalimentaristoc VALUES(2, 'Vinil', '21-DEC-2020', 135, 120, 1, 2);
INSERT INTO tmcalimentaristoc VALUES(3, 'Vinil', '15-MAY-2020', 215, 70, 2, 2);
INSERT INTO tmcalimentaristoc VALUES(4, 'Cd', '20-SEP-2020', 40, 75, 3, 1);
INSERT INTO tmcalimentaristoc VALUES(5, 'Cd', '10-NOV-2020', 70, 35, 4, 3);
INSERT INTO tmcalimentaristoc VALUES(6, 'Cd', '12-NOV-2020', 50, 115, 5, 3);
INSERT INTO tmcalimentaristoc VALUES(7, 'Cd', '14-DEC-2020', 45, 415, 6, 4);
INSERT INTO tmcalimentaristoc VALUES(8, 'Vinil', '15-DEC-2020', 250, 85, 6, 4);
INSERT INTO tmcalimentaristoc VALUES(9, 'Cd', '16-DEC-2020', 30, 115, 3, 5);
INSERT INTO tmcalimentaristoc VALUES(10, 'Vinil', '17-DEC-2020', 350, 55, 5, 6);
INSERT INTO tmcalimentaristoc VALUES(11, 'Vinil', '5-JAN-2021', 42, 55, 7, 7);

INSERT INTO tmcitemicomenzi VALUES(1, 1, 20);
INSERT INTO tmcitemicomenzi VALUES(1, 2, 10);
INSERT INTO tmcitemicomenzi VALUES(2, 3, 15);
INSERT INTO tmcitemicomenzi VALUES(3, 1, 2);
INSERT INTO tmcitemicomenzi VALUES(3, 5, 3);
INSERT INTO tmcitemicomenzi VALUES(4, 5, 11);
INSERT INTO tmcitemicomenzi VALUES(5, 6, 5);
INSERT INTO tmcitemicomenzi VALUES(6, 4, 7);
INSERT INTO tmcitemicomenzi VALUES(7, 2, 25);
INSERT INTO tmcitemicomenzi VALUES(8, 4, 3);
INSERT INTO tmcitemicomenzi VALUES(9, 3, 9);
INSERT INTO tmcitemicomenzi VALUES(9, 5, 9);
INSERT INTO tmcitemicomenzi VALUES(10, 5, 29);
INSERT INTO tmcitemicomenzi VALUES(11, 6, 9);

--6. 
set serveroutput on;
CREATE OR REPLACE TYPE vector AS VARRAY(20) OF VARCHAR2(40);
/
CREATE OR REPLACE PROCEDURE showAlbums (nul_alb vector, tr_nume tmcalbume.nume_trupa % TYPE) AS  albume vector := nul_alb; 
BEGIN
  SELECT denumire
  BULK COLLECT INTO albume
  FROM tmcalbume
  WHERE nume_trupa = tr_nume;
  
  FOR i IN albume.first..albume.last LOOP
    DBMS_OUTPUT.PUT_LINE(albume(i));
  END LOOP;
END showAlbums;
/

DECLARE
  nul_alb vector := vector();
BEGIN   
   showAlbums(nul_alb, 'Metallica'); 
END; 
/

--7.
set serveroutput on;
CREATE OR REPLACE PROCEDURE p7 IS 
  numee tmcclienti.nume % TYPE; 
  prenumee tmcclienti.prenume % TYPE;
  datac tmccomenzi.data_comanda % TYPE;
BEGIN
    FOR i IN (select nume numee, prenume prenumee, data_comanda datac
              from tmcclienti c, tmccomenzi cz
              where c.id_client = cz.id_client and cz.data_ridicare_comanda is not null) LOOP
      DBMS_OUTPUT.PUT_LINE(i.numee || ' ' || i.prenumee || ' ' || i.datac);
    END LOOP;
END p7;
/ 

EXECUTE p7();

--8.

CREATE OR REPLACE FUNCTION showD(id_c NUMBER)
   RETURN tmcclienti.nume % TYPE AS 
      denumiree tmcalbume.denumire % TYPE;
      tipp tmcalimentaristoc.tip % TYPE;
      nr_exp NUMBER;
      exceptie EXCEPTION;
      ok NUMBER := 0;
BEGIN 
  FOR i IN (select a.denumire denumiree, tip tipp, nr_exemplare_comandate nr_exp 
            from tmcitemicomenzi ic, tmcalimentaristoc st, tmcalbume a
            where ic.cod = st.cod and a.id_album = st.id_album and nr_comanda = id_c) LOOP
            ok := 1;
            DBMS_OUTPUT.PUT_LINE('La comanda cu numarul ' || id_c || ' au fost cumparate ' || i.nr_exp || ' albume de tipul ' || i.tipp);
  END LOOP;
  
  IF ok = 0 THEN RAISE exceptie; END IF;
  RETURN ' ';
  
  EXCEPTION 
    WHEN exceptie THEN RAISE_APPLICATION_ERROR(-20001, 'Numarul comenzii este invalid!');
    WHEN OTHERS THEN RAISE_APPLICATION_ERROR(-20002, 'An error occured!'); 
END showD; 
/

EXECUTE DBMS_OUTPUT.PUT_LINE(showD(1));

--9.
set serveroutput on;
CREATE OR REPLACE PROCEDURE print IS 
      numee tmcalbume.denumire % TYPE; 
      prenumee tmcalbume.denumire % TYPE;
      denumiree tmcalbume.denumire % TYPE; 
      ok NUMBER := 0;
      exp EXCEPTION;
BEGIN
      FOR i IN (select nume numee, prenume prenumee, denumire denumiree
                from tmcclienti c, tmccomenzi cz, tmcitemicomenzi ic, tmcalimentaristoc st, tmcalbume a
                where c.id_client = cz.id_client and cz.nr_comanda = ic.nr_comanda and ic.cod = st.cod and a.id_album = st.id_album and tip = 'Cd') LOOP
          ok := 1;
          DBMS_OUTPUT.PUT_LINE(i.numee || ' ' || i.prenumee || ' ' || ' ' || i.denumiree);
      END LOOP;
      
      IF ok = 0 THEN RAISE exp; END IF;
      EXCEPTION
          WHEN exp THEN RAISE_APPLICATION_ERROR(-20001, 'Nu exista albume de tip Cd cumparate!');
          WHEN OTHERS THEN RAISE_APPLICATION_ERROR(-20002, 'An error occured!');
END print;
/

EXECUTE print();
                    
--10. 
CREATE OR REPLACE TRIGGER trigAlbume
    BEFORE UPDATE OR DELETE ON tmcalbume 
BEGIN 
  IF USER <> upper('Scott') THEN 
        RAISE_APPLICATION_ERROR(-20001, 'Tabelul nu poate fi actualizat'); 
  END IF; 
END; 
/

UPDATE TMCALBUME
SET denumire = 'Deep Purple'
WHERE id_album = 1;

DELETE TMCALBUME
WHERE id_album = 1;

--11
CREATE OR REPLACE TRIGGER insertion 
  BEFORE INSERT OR UPDATE ON tmcitemicomenzi 
  FOR EACH ROW
DECLARE
  nr_buc NUMBER;
  exceptie EXCEPTION;
BEGIN 
    IF INSERTING THEN 
        SELECT nr_bucati_stoc
        INTO nr_buc
        FROM tmcalimentaristoc
        WHERE cod = :NEW.cod;
        
        IF :NEW.nr_exemplare_comandate <= nr_buc THEN
            INSERT INTO tmccomenzi VALUES(12, sysdate, NULL, 3);
            
            UPDATE tmcalimentaristoc
            SET nr_bucati_stoc = nr_bucati_stoc - :NEW.nr_exemplare_comandate
            WHERE cod = :NEW.cod;
        ELSE RAISE exceptie;
        END IF;
    END IF;
    
    EXCEPTION
        WHEN exceptie THEN RAISE_APPLICATION_ERROR(-20001, 'Comanda nu a putut fi inregistrata, deoarece stocul este insuficient!');
END;
/

INSERT INTO tmcitemicomenzi VALUES(12, 5, 36);

--12. 

set serveroutput on;
CREATE OR REPLACE TRIGGER showtrig
  AFTER CREATE OR DROP OR ALTER ON SCHEMA
BEGIN 
    DBMS_OUTPUT.PUT_LINE('La data ' || SYSDATE || ' s-a declansat evenimentul ' || SYS.SYSEVENT || ' asupra obiectului de tip ' || SYS.DICTIONARY_OBJ_TYPE || ' numit ' || SYS.DICTIONARY_OBJ_NAME);
END; 
/

--13
CREATE OR REPLACE PACKAGE MusicPackage AS
    PROCEDURE showAlbums(nul_alb vector,  tr_nume tmcalbume.nume_trupa % TYPE);
    PROCEDURE p7;
    FUNCTION showD(id_c NUMBER)
      RETURN tmcclienti.nume % TYPE;
    PROCEDURE print;
END MusicPackage;
/

CREATE OR REPLACE PACKAGE BODY MusicPackage AS
    PROCEDURE showAlbums (nul_alb vector, tr_nume tmcalbume.nume_trupa % TYPE) AS  albume vector := nul_alb; 
    BEGIN
      SELECT denumire
      BULK COLLECT INTO albume
      FROM tmcalbume
      WHERE nume_trupa = tr_nume;
      
      FOR i IN albume.first..albume.last LOOP
        DBMS_OUTPUT.PUT_LINE(albume(i));
      END LOOP;
    END showAlbums;
    
    PROCEDURE p7 IS 
        numee tmcclienti.nume % TYPE; 
        prenumee tmcclienti.prenume % TYPE;
        datac tmccomenzi.data_comanda % TYPE;
    BEGIN
        FOR i IN (select nume numee, prenume prenumee, data_comanda datac
                  from tmcclienti c, tmccomenzi cz
                  where c.id_client = cz.id_client and cz.data_ridicare_comanda is not null) LOOP
          DBMS_OUTPUT.PUT_LINE(i.numee || ' ' || i.prenumee || ' ' || i.datac);
        END LOOP;
    END p7;
    
    FUNCTION showD(id_c NUMBER)
       RETURN tmcclienti.nume % TYPE AS 
          denumiree tmcalbume.denumire % TYPE;
          tipp tmcalimentaristoc.tip % TYPE;
          nr_exp NUMBER;
          exceptie EXCEPTION;
          ok NUMBER := 0;
    BEGIN 
      FOR i IN (select a.denumire denumiree, tip tipp, nr_exemplare_comandate nr_exp 
                from tmcitemicomenzi ic, tmcalimentaristoc st, tmcalbume a
                where ic.cod = st.cod and a.id_album = st.id_album and nr_comanda = id_c) LOOP
                ok := 1;
                DBMS_OUTPUT.PUT_LINE('La comanda cu numarul ' || id_c || ' au fost cumparate ' || i.nr_exp || ' albume de tipul ' || i.tipp);
      END LOOP;
      
      IF ok = 0 THEN RAISE exceptie; END IF;
      RETURN ' ';
      
      EXCEPTION 
        WHEN exceptie THEN RAISE_APPLICATION_ERROR(-20001, 'Numarul comenzii este invalid!');
        WHEN OTHERS THEN RAISE_APPLICATION_ERROR(-20002, 'An error occured!'); 
    END showD; 

    PROCEDURE print IS 
            numee tmcalbume.denumire % TYPE; 
            prenumee tmcalbume.denumire % TYPE;
            denumiree tmcalbume.denumire % TYPE; 
            ok NUMBER := 0;
            exp EXCEPTION;
      BEGIN
            FOR i IN (select nume numee, prenume prenumee, denumire denumiree
                      from tmcclienti c, tmccomenzi cz, tmcitemicomenzi ic, tmcalimentaristoc st,tmcalbume a
                      where c.id_client = cz.id_client and cz.nr_comanda = ic.nr_comanda and ic.cod = st.cod and a.id_album = st.id_album and tip = 'Cd') LOOP
                ok := 1;
                DBMS_OUTPUT.PUT_LINE(i.numee || ' ' || i.prenumee || ' ' || ' ' || i.denumiree);
            END LOOP;
            
            IF ok = 0 THEN RAISE exp; END IF;
            EXCEPTION
                WHEN exp THEN RAISE_APPLICATION_ERROR(-20001, 'Nu exista albume de tip Cd cumparate!');
                WHEN OTHERS THEN RAISE_APPLICATION_ERROR(-20002, 'An error occured!');
      END print;
END MusicPackage;
/

set serveroutput on;
DECLARE
  nul_alb vector := vector();
BEGIN   
   MusicPackage.showAlbums(nul_alb, 'Phoenix');
   MusicPackage.p7();
   DBMS_OUTPUT.PUT_LINE(MusicPackage.showD(1));
   MusicPackage.print();
END; 
/