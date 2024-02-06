-- ----------------------------------------------------------------
-- -   Author     : Daniel Molinari                                -
-- -   Num.Est    : 841-19-3459
-- -   Curso      : SICI-4030                                     -
-- -   Sección    : KH1                                           -
-- -   Source     : ExamenPractico-1X-FORMATO-2023.sql            -
-- -   Comentario : Este script es para creación de tablas    -
-- ----------------------------------------------------------------
-- ----------------------------------------------------------------
-- -  EL SET ECHO ON permite ver la corrida en pantalla.          -
-- ----------------------------------------------------------------
SET ECHO ON
-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Aquí se borran las tablas en caso de tener que volver a    -
-- -  crearlas, esta sub dividido por niveles.                    -
-- ----------------------------------------------------------------
 -  Tablas Nivel 3 
DROP TABLE seguidor;       
DROP TABLE coleccion;  
-- -  Tablas Nivel 2 
DROP TABLE comic; 
-- -  Tablas Nivel 1
DROP TABLE compania;       
DROP TABLE coleccionista;  
-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema.                       –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Creacion tabla coleccionista nivel-1                      -
-- ----------------------------------------------------------------
CREATE TABLE coleccionista(
        id_pk                 NUMBER(6),
        nombre                VARCHAR2(30)NOT NULL,
        inicial               VARCHAR2(1),
        apellido_paterno      VARCHAR2(30) NOT NULL,
        apellido_materno      VARCHAR2(30),
        linea_1               VARCHAR2(35) NOT NULL,
        linea_2               VARCHAR2(35),
        ciudad                VARCHAR2(35) NOT NULL,
        pais                  VARCHAR2(35) NOT NULL,
        zipcode               VARCHAR2(30)  NOT NULL,
        celular               VARCHAR2(30),
        correo_electronico    VARCHAR2(35) NOT NULL,
        CONSTRAINT id_colecc_pk
            PRIMARY KEY (id_pk)
);
-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema.                       –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Creacion tabla compania  nivel-1                           -
-- ----------------------------------------------------------------
CREATE TABLE compania(
        id_pk                   VARCHAR2(8),
        nombre                  VARCHAR2(30)NOT NULL,
        linea_1                 VARCHAR2(60) NOT NULL,
        linea_2                 VARCHAR2(60),
        ciudad                  VARCHAR2(35) NOT NULL,
        pais                    VARCHAR2(35) NOT NULL,
        zipcode                 CHAR(5)         NOT NULL,
        telefono                VARCHAR2(10),
        CONSTRAINT codigo_compania_pk
            PRIMARY KEY (id_pk)   
);
-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema.                       –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Creacion tabla comic    nivel-2                            -
-- ----------------------------------------------------------------
CREATE TABLE comic(
        codigo_pk               NUMBER(8),
        id_compania_fk          VARCHAR2(8)  NOT NULL,
        titulo                  VARCHAR2(35) NOT NULL,
        numero                  NUMBER(4) NOT NULL,
        valor                   NUMBER(4,2),
        cover                 VARCHAR2(30)  NOT NULL,
        CONSTRAINT comic_codigo_pk
            PRIMARY KEY (codigo_pk),
        CONSTRAINT comic_id_compania_fk
            FOREIGN KEY (id_compania_fk)
            REFERENCES compania(id_pk)
);
-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema.                       -
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Creacion tabla coleccion  nivel-3                          -
-- ----------------------------------------------------------------
CREATE TABLE coleccion(
        id_coleccionista_pk_fk1 NUMBER(6),
        codigo_comic_pk_fk2     NUMBER(8),
        cantidad                NUMBER(4)            DEFAULT 1,
        condicion               VARCHAR2(10)              NOT NULL,
        CONSTRAINT coleccion_pk_fk1
            PRIMARY KEY (id_coleccionista_pk_fk1, codigo_comic_pk_fk2),
        CONSTRAINT coleccion_coleccionista_fk1
            FOREIGN KEY (id_coleccionista_pk_fk1)
            REFERENCES coleccionista(id_pk),
        CONSTRAINT coleccion_comic_fk2
            FOREIGN KEY (codigo_comic_pk_fk2)
            REFERENCES comic(codigo_pk)
);
-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema.                       –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Creacion tabla seguidor  nivel-3                           -
-- ----------------------------------------------------------------
CREATE TABLE seguidor(
            id_coleccionista_pk_fk1     NUMBER(6),
            id_coleccionista_pk_fk2     NUMBER(6),
            CONSTRAINT seguidor_pk
                PRIMARY KEY (id_coleccionista_pk_fk1, id_coleccionista_pk_fk2),
            CONSTRAINT seguidor_coleccionista_fk1
                FOREIGN KEY (id_coleccionista_pk_fk1)
                REFERENCES coleccionista(id_pk),
            CONSTRAINT seguidor_fk2
                FOREIGN KEY (id_coleccionista_pk_fk2)
                REFERENCES coleccionista(id_pk)
);
-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema.                       –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Insertar datos tabla: coleccionista                        -
-- ----------------------------------------------------------------
INSERT INTO coleccionista (id_pk, nombre, inicial, apellido_paterno, apellido_materno, linea_1, linea_2, ciudad, pais, zipcode, celular, correo_electronico)
VALUES (123456, 'Athene', 'A', 'Hagart', 'Absalom', '601 Comanche Center', '15th Floor', 'Gorelovo', 'Russia', '644091', '6901273782', 'aabsalom0@newyorker.com');

INSERT INTO coleccionista (id_pk, nombre, inicial, apellido_paterno, apellido_materno, linea_1, linea_2, ciudad, pais, zipcode, celular, correo_electronico)
VALUES (123457, 'Rhody', 'C', 'Corbyn', 'Greaves', '10 Hansons Pass', '1st Floor', 'Wagar', 'Sudan', '423256', '2055098669', 'rgreaves1@forbes.com');

INSERT INTO coleccionista (id_pk, nombre, inicial, apellido_paterno, apellido_materno, linea_1, linea_2, ciudad, pais, zipcode, celular, correo_electronico)
VALUES (789456, 'Mayne', 'C', 'Bunnell', 'Atcock', '17189 Hermina Avenue', 'Room 664', 'Seongnam-si', 'South Korea', '059322', '6301838761', 'matcock2@ihg.com');

INSERT INTO coleccionista (id_pk, nombre, inicial, apellido_paterno, apellido_materno, linea_1, linea_2, ciudad, pais, zipcode, celular, correo_electronico)
VALUES (654321, 'Lissa', 'B', 'Skate', 'Windebank', '5936 Kennedy Court', '1st Floor', 'Boychinovtsi', 'Bulgaria', '345344', '1098009141', 'lwindebank3@themeforest.net');

INSERT INTO coleccionista (id_pk, nombre, inicial, apellido_paterno, apellido_materno, linea_1, linea_2, ciudad, pais, zipcode, celular, correo_electronico)
VALUES (456789, 'Priscilla', 'E', 'Fetherston', 'Tregunnah', '46262 Randy Parkway', '19th Floor', 'Nanterre', 'France', '92019', '9238127896', 'ptregunnah4@altervista.org');

-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema.                       –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Datos de la tabla compania                                 -
-- ----------------------------------------------------------------
INSERT INTO compania (id_pk, nombre, linea_1, linea_2, ciudad, pais, zipcode, telefono)
VALUES ('jkl24680', 'Scout Comics', '823 Waywood Hill', 'Room 1214', 'Jingjiao', 'China', '12980', '1117913353');

INSERT INTO compania (id_pk, nombre, linea_1, linea_2, ciudad, pais, zipcode, telefono)
VALUES ('def67890', 'Black Mask Studios', '672 Carey Way', '2nd Floor', 'Liangcunchang', 'China', '25980', '6296696348');

INSERT INTO compania (id_pk, nombre, linea_1, linea_2, ciudad, pais, zipcode, telefono)
VALUES ('ghi13579', 'Ahoy Comics', '8 Fisk Street', 'PO Box 74469', 'Xiaoqi', 'China', '69980', '5134845679');

INSERT INTO compania (id_pk, nombre, linea_1, linea_2, ciudad, pais, zipcode, telefono)
VALUES ('vwx90246', 'AfterShock Comics', '54 Blackbird Park', 'Suite 81', 'Mananjary', 'Madagascar', '93980', '8141593103');

INSERT INTO compania (id_pk, nombre, linea_1, linea_2, ciudad, pais, zipcode, telefono)
VALUES ('ghi13578', 'Mad Cave Studios', '8 Cordelia Street', 'Apt 400', 'Panorama', 'Brazil', '52980', '1105311627');

-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema.                       –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Datos de la tabla comic                                 -
-- ----------------------------------------------------------------
INSERT INTO comic (codigo_pk, id_compania_fk, titulo, numero, valor, cover)
VALUES (23789145, 'jkl24680', 'Capitan calzoncillos', 12, 29.1, 'C://est/OneDrive/1.jpg');

INSERT INTO comic (codigo_pk, id_compania_fk, titulo, numero, valor, cover)
VALUES (56871234, 'def67890', 'Green Lantern', 14, 44.3, 'C://est/OneDrive/2.jpg');

INSERT INTO comic (codigo_pk, id_compania_fk, titulo, numero, valor, cover)
VALUES (61548923, 'ghi13579', 'Tintin', 91, 88.6, 'C://est/OneDrive/3.jpg');

INSERT INTO comic (codigo_pk, id_compania_fk, titulo, numero, valor, cover)
VALUES (74561239, 'vwx90246', 'Snoopi', 11, 22.3, 'C://est/OneDrive/4.jpg');

INSERT INTO comic (codigo_pk, id_compania_fk, titulo, numero, valor, cover)
VALUES (93456789, 'ghi13578', 'The Punisher', 18, 76.5, 'C://est/OneDrive/5.jpg');
-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema.                       –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- - Datos de la tabla coleccion                                  -
-- ----------------------------------------------------------------
INSERT INTO coleccion (id_coleccionista_pk_fk1, codigo_comic_pk_fk2, cantidad, condicion)
VALUES (123456, 23789145, 5, 'good');

INSERT INTO coleccion (id_coleccionista_pk_fk1, codigo_comic_pk_fk2, cantidad, condicion)
VALUES (123457, 56871234, 5, 'bad');

INSERT INTO coleccion (id_coleccionista_pk_fk1, codigo_comic_pk_fk2, cantidad, condicion)
VALUES (789456, 61548923, 8, 'good');

INSERT INTO coleccion (id_coleccionista_pk_fk1, codigo_comic_pk_fk2, cantidad, condicion)
VALUES (654321, 74561239, 1, 'well');

INSERT INTO coleccion (id_coleccionista_pk_fk1, codigo_comic_pk_fk2, cantidad, condicion)
VALUES (456789, 93456789, 1, 'fine');


-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema.                       –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- - Datos de la tabla seguidor                                   -
-- ----------------------------------------------------------------
INSERT INTO seguidor (id_coleccionista_pk_fk1, id_coleccionista_pk_fk2)
VALUES (123456, 456789);

INSERT INTO seguidor (id_coleccionista_pk_fk1, id_coleccionista_pk_fk2)
VALUES (123457, 654321);

INSERT INTO seguidor (id_coleccionista_pk_fk1, id_coleccionista_pk_fk2)
VALUES (789456, 123456);

INSERT INTO seguidor (id_coleccionista_pk_fk1, id_coleccionista_pk_fk2)
VALUES (654321, 789456);

INSERT INTO seguidor (id_coleccionista_pk_fk1, id_coleccionista_pk_fk2)
VALUES (456789, 123457);



-- ----------------------------------------------------------------
-- -   Guarda los datos. De no ponerse, como quiera los guarda   -
-- - en una corrida.  Se deja para explicar su uso.             -
-- ----------------------------------------------------------------
COMMIT;
