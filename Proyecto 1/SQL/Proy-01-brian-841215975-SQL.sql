-- ----------------------------------------------------------------
-- -   Author     : Brian J. Cruz Castro                          -
-- -   Num.Est    : 841-21-5975                                   -
-- -   Curso      : SICI-4030                                     -
-- -   Sección    : LJ1                                           -
-- -   Source     : ExamenPractico-1X-FORMATO-2023.sql            -
-- -   Comentario : Este script es para el proyecto #1            -
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

-- ----------------------------------------------------------------
-- -  Tablas Nivel 3 
-- ----------------------------------------------------------------
DROP TABLE seguidor;       
DROP TABLE coleccion;  
-- ----------------------------------------------------------------
-- -  Tablas Nivel 2 
-- ----------------------------------------------------------------    
DROP TABLE comic; 
-- ----------------------------------------------------------------
-- -  Tablas Nivel 1
-- ----------------------------------------------------------------         
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
        id_pk                   NUMBER(6),
        nombre                  VARCHAR2(15)        NOT NULL,
        inicial                 VARCHAR2(1),
        apellido_paterno        VARCHAR2(15)        NOT NULL,
        apellido_materno        VARCHAR2(15),
        linea_1                 VARCHAR2(50)        NOT NULL,
        linea_2                 VARCHAR2(50),
        ciudad                  VARCHAR2(20)        NOT NULL,
        pais                    VARCHAR2(20)        NOT NULL,
        zipcode                 VARCHAR2(5)         NOT NULL,
        celular                 VARCHAR2(10),
        correo_electronico      VARCHAR2(30)        NOT NULL UNIQUE,
        CONSTRAINT coleccionista_id_pk
            PRIMARY KEY (id_pk),
        CONSTRAINT coleccionista_pais_ck
            CHECK (pais IN('PR', 'CF', 'NV', 'NY', 'CA') )    
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
        nombre                  VARCHAR2(25)        NOT NULL,
        linea_1                 VARCHAR2(50)        NOT NULL,
        linea_2                 VARCHAR2(50),
        ciudad                  VARCHAR2(20)        NOT NULL,
        pais                    VARCHAR2(20)        NOT NULL,
        zipcode                 VARCHAR2(5)         NOT NULL,
        telefono                VARCHAR2(10),
        CONSTRAINT compania_codigo_pk
            PRIMARY KEY (id_pk),    
        CONSTRAINT compania_pais_ck
            CHECK (pais IN('PR', 'CF', 'NV', 'NY', 'CA') )    
);
-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema.                       –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Creacion tabla comic    nivel-2                            -
-- ----------------------------------------------------------------
-- Lista de todos los comics que pueden ser identificados
CREATE TABLE comic(
        codigo_pk               NUMBER(8),
        id_compania_fk          VARCHAR2(8)           NOT NULL,
        titulo                  VARCHAR2(35)         NOT NULL,
        numero                  NUMBER(4)            NOT NULL,
        valor                   NUMBER(4,2),
        portada                 VARCHAR2(30)         NOT NULL,
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
        cantidad                NUMBER(3)            DEFAULT 1,
        condicion               CHAR(2)              NOT NULL,
        CONSTRAINT coleccion_pk
            PRIMARY KEY (id_coleccionista_pk_fk1, codigo_comic_pk_fk2),
        CONSTRAINT coleccion_comic_fk2
            FOREIGN KEY (codigo_comic_pk_fk2)
            REFERENCES comic(codigo_pk),
        CONSTRAINT coleccion_coleccionista_fk1
            FOREIGN KEY (id_coleccionista_pk_fk1)
            REFERENCES coleccionista(id_pk),
        CONSTRAINT condicion_ck
            CHECK (condicion IN('M', 'NM', 'VF', 'FN', 'VG', 'G', 'F', 'P'))
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
INSERT INTO coleccionista 
VALUES (500001, 'Alfonso', 'M', 'Martinez', 'Cruz', 'Av 68 Palomares', 'Calle Las Andinas', 'San Juan', 'PR', '00917', '7873348863', 'alfonso.mcruz@gmail.com');

INSERT INTO coleccionista 
VALUES (500002, 'Luis', 'G', 'Miguel', 'Torres', 'Av 65 Quisqueya', 'Calle Imalaya', 'San Juan', 'PR', '00917', '7874899564', 'miguel.torresito@gmail.com');

INSERT INTO coleccionista 
VALUES (500003, 'Carlos', NULL, 'Perez', 'Nieves', 'Calle Lomas del mar', '#101', 'Corozal', 'PR', '00783', '7654339864', 'perez15.cn@gmail.com');

INSERT INTO coleccionista 
VALUES (500004, 'Omar', 'G', 'Gonzalez', 'Nieves', 'Av Golden', '#66 street', 'San Diego', 'CF', '92111', '6192248852', 'omar.nieve2556@gmail.com');

INSERT INTO coleccionista 
VALUES (500005, 'Jose', 'M', 'Santos', 'Bonilla', 'Calle Chile', NULL, 'Guaynabo', 'PR', '00975', '7874669329', 'joselito.ganga2@gmail.com');
-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema.                       –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Datos de la tabla compania                                 -
-- ----------------------------------------------------------------
INSERT INTO compania
VALUES ('MAR00001', 'Marvel Comics', '135 W. 50th Street', NULL, 'New York', 'NY', '10020', '2125551234');

INSERT INTO compania
VALUES ('DCC00002', 'DC Comics', '4000 Warner Blvd.', NULL, 'Burbank', 'CA', '91522', '4565555678');

INSERT INTO compania
VALUES ('IMG00003', 'Image Comics', '789 Calle Lorenzo', NULL, 'Hormigueros', 'PR', '00851', '7873428922');

INSERT INTO compania
VALUES ('DH000004', 'Dark Horse Comics', '101 Dark Lane', 'Suite 6B', 'Los Angeles', 'CA', '91432', '8335554321');

INSERT INTO compania
VALUES ('IDW00005', 'IDW Publishing', '555 Colorado Street', 'Suite 5A', 'Las Vegas', 'NV', '10005', '6125556789');

-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema.                       –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Datos de la tabla comic                                 -
-- ----------------------------------------------------------------
INSERT INTO comic 
VALUES (10013717, 'MAR00001', 'The Amazing Spider-Man', 1, 9.99, '/images/spiderman.jpg');

INSERT INTO comic 
VALUES (10027143, 'DCC00002', 'Batman: The Dark Knight', 1, 12.50, '/images/batman.jpg');

INSERT INTO comic 
VALUES (10038439, 'IMG00003', 'Spawn', 1, 8.75, '/images/spawn.jpg');

INSERT INTO comic 
VALUES (10040576, 'DH000004', 'Hellboy', 1, 15.20, '/images/hellboy.jpg');

INSERT INTO comic 
VALUES (10054623, 'IDW00005', 'Teenage Mutant Ninja Turtles', 1, 10.75, '/images/tmnt.jpg');
-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema.                       –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- - Datos de la tabla coleccion                                  -
-- ----------------------------------------------------------------
INSERT INTO coleccion 
VALUES (500001, 10013717, 2, 'NM');

INSERT INTO coleccion 
VALUES (500002, 10040576, 1, 'M');

INSERT INTO coleccion 
VALUES (500003, 10054623, 4, 'M');

INSERT INTO coleccion 
VALUES (500001, 10054623, 2, 'VF');

INSERT INTO coleccion 
VALUES (500004, 10027143, 3, 'F');
-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema.                       –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- - Datos de la tabla seguidor                                   -
-- ----------------------------------------------------------------
INSERT INTO seguidor 
VALUES (500001, 500002);

INSERT INTO seguidor 
VALUES (500002, 500001);

INSERT INTO seguidor 
VALUES (500003, 500004);

INSERT INTO seguidor 
VALUES (500001, 500003);

INSERT INTO seguidor 
VALUES (500004, 500005);
-- ----------------------------------------------------------------
-- -   Guarda los datos. De no ponerse, como quiera los guarda   -
-- - en una corrida.  Se deja para explicar su uso.             -
-- ----------------------------------------------------------------
COMMIT;


