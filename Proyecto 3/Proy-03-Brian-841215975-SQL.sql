-- ----------------------------------------------------------------
-- -   Author     : Nombre del estudiante                         -
-- -   Num.Est    : 841-21-5975                                   -
-- -   Curso      : SICI-4030                                     -
-- -   Seccion    : LH1                                           -
-- -   Source     : ExamenPractico-1X-FORMATO-2023.sql            -
-- -   Comentario : Este script es para EL PROYECTO #3            -
-- ----------------------------------------------------------------
-- ----------------------------------------------------------------
-- -  EL SET ECHO ON permite ver la corrida en pantalla.         -
-- ----------------------------------------------------------------
SET ECHO ON
-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Aqui se borran las tablas en caso de tener que volver a   -
-- -  crearlas, esta sub dividido por niveles.                    -
-- ----------------------------------------------------------------
-- NIVEL 3
DROP TABLE sesion;
-- NIVEL 2
DROP TABLE horario;
DROP TABLE cliente;
-- NIVEL 1
DROP TABLE entrenador;
DROP TABLE actividad;
DROP TABLE equipo;
DROP TABLE usuario;
DROP TABLE membresia;
-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Creacion tabla membresia nivel-1 (Indicar el nivel SIEMPRE)  -
-- ----------------------------------------------------------------
CREATE TABLE membresia (
    tipo_pk                  CHAR(1),
    titulo                   VARCHAR2(15)		NOT NULL,
    descripcion              VARCHAR2(50)		NOT NULL,
    costo_mensual            NUMBER(6,2)		NOT NULL,
CONSTRAINT membresia_tipo_pk 
    PRIMARY KEY(tipo_pk)
);
-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Creacion tabla usuario    nivel-1(Indicar el nivel SIEMPRE)-
-- ----------------------------------------------------------------
CREATE TABLE usuario (
    id_pk                    NUMBER(8),
    nombre                   VARCHAR2(15)		NOT NULL,
    password                 VARCHAR2(8)		NOT NULL,
    fecha_acesso             DATE			NOT NULL,
    intento                  NUMBER(2)			NOT NULL,
    fecha_exp                DATE			NOT NULL,
    tipo                     VARCHAR2(2)		NOT NULL,
CONSTRAINT usuario_id_pk 
    PRIMARY KEY(id_pk)
);
-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Creacion tabla equipo  nivel-1(Indicar el nivel SIEMPRE)-
-- ----------------------------------------------------------------
CREATE TABLE equipo (
    codigo_pk                NUMBER(8),
    nombre                   VARCHAR2(35)		NOT NULL,
    costo                    NUMBER(6,2)		NOT NULL,
    comentario               VARCHAR2(57),
CONSTRAINT equipo_codigo_pk 
    PRIMARY KEY(codigo_pk)
);
-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Creacion tabla actividad nivel-1 (Indicar el nivel SIEMPRE)  -
-- ----------------------------------------------------------------
CREATE TABLE actividad (
    codigo_pk                NUMBER(8),
    nombre                   VARCHAR2(25)		NOT NULL,
    descripcion              VARCHAR2(50)		NOT NULL,
    comentario               VARCHAR2(50),
CONSTRAINT actividad_codigo_pk 
    PRIMARY KEY(codigo_pk)
);
-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Creacion tabla entrenador nivel-1 (Indicar el nivel SIEMPRE)  -
-- ----------------------------------------------------------------
CREATE TABLE entrenador (
    real_id_pk               NUMBER(8),
    nombre                   VARCHAR2(15)		NOT NULL,
    inicial                  CHAR(1),
    apellido_paterno         VARCHAR2(15)		NOT NULL,
    apellido_materno         VARCHAR2(15),
    linea_1                  VARCHAR2(50)		NOT NULL,
    linea_2                  VARCHAR2(50),
    ciudad                   VARCHAR2(25)		NOT NULL,
    urban_barrio             VARCHAR2(25),
    estado                   VARCHAR2(25)		NOT NULL,
    zipcode                  NUMBER(5)			NOT NULL,
    fecha_nacimiento         DATE			NOT NULL,
    genero                   CHAR(1)			NOT NULL,
    celular                  VARCHAR2(13),
    email                    VARCHAR2(30),
CONSTRAINT entrenador_real_id_pk 
    PRIMARY KEY(real_id_pk)
);
-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Creacion tabla cliente nivel-2 (Indicar el nivel SIEMPRE)  -
-- ----------------------------------------------------------------
CREATE TABLE cliente (
    real_id_pk               NUMBER(8),
    tipo_membresia_fk        CHAR(1)			NOT NULL,
    nombre                   VARCHAR2(15)		NOT NULL,
    inicial                  CHAR(1),
    apellido_paterno         VARCHAR2(15)		NOT NULL,
    apellido_materno         VARCHAR2(15),
    linea_1                  VARCHAR2(50)		NOT NULL,
    linea_2                  VARCHAR2(50),
    ciudad                   VARCHAR2(25)		NOT NULL,
    urban_barrio             VARCHAR2(25),
    estado                   VARCHAR2(25)		NOT NULL,
    zipcode                  NUMBER(5)			NOT NULL,
    fecha_nacimiento         DATE			NOT NULL,
    genero                   CHAR(1)			NOT NULL,
    celular                  VARCHAR2(13),
    email                    VARCHAR2(30),
CONSTRAINT cliente_real_id_pk 
    PRIMARY KEY(real_id_pk),
CONSTRAINT cliente_tipo_membresia_fk 
    FOREIGN KEY (tipo_membresia_fk) 
    REFERENCES membresia(tipo_pk)
);
-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Creacion tabla horario nivel-2(Indicar el nivel SIEMPRE)   -
-- ----------------------------------------------------------------
CREATE TABLE horario (
    codigo_pk                VARCHAR2(10),
	codigo_actividad_fk  NUMBER(8),
    cant_horas               NUMBER(2)		NOT NULL,
	lugar 		     VARCHAR2(35)	NOT NULL,
CONSTRAINT horario_codigo_pk 
    PRIMARY KEY(codigo_pk),
CONSTRAINT horario_codigo_actividad_fk
	FOREIGN KEY(codigo_actividad_fk)
	REFERENCES actividad(codigo_pk)
);
-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Creacion tabla sesion nivel-3 (Indicar el nivel SIEMPRE)  -
-- ----------------------------------------------------------------
CREATE TABLE sesion (
    id_pk                    NUMBER(13),
    codigo_horario_fk1       VARCHAR2(10)		NOT NULL,
    real_id_cliente_fk2      NUMBER(8)			NOT NULL,
    real_id_entrenador_fk3   NUMBER(8)			NOT NULL,
    codigo_equipo_fk4        NUMBER(8),
    status                   VARCHAR2(25)		NOT NULL,
    comentario               VARCHAR2(50),
CONSTRAINT sesion_id_pk 
    PRIMARY KEY(id_pk),
CONSTRAINT sesion_codigo_horario_fk1 
    FOREIGN KEY (codigo_horario_fk1) 
    REFERENCES horario(codigo_pk),
CONSTRAINT sesion_real_id_cliente_fk2 
    FOREIGN KEY (real_id_cliente_fk2) 
    REFERENCES cliente(real_id_pk),
CONSTRAINT session_real_id_entrenador_fk3
	FOREIGN KEY (real_id_entrenador_fk3)
	REFERENCES entrenador(real_id_pk),
CONSTRAINT sesion_codigo_equipo_fk4 
    FOREIGN KEY (codigo_equipo_fk4) 
    REFERENCES equipo(codigo_pk)
);
-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Insertar datos tabla: membresia                            -
-- ----------------------------------------------------------------

INSERT INTO membresia 
VALUES ('C', 'Clasico', 'Acceso calistenia y entrenamiento', 25.00);

INSERT INTO membresia 
VALUES ('E', 'Estudiante', 'Acceso a area de pesas y calistenia', 25.00);

INSERT INTO membresia 
VALUES ('F', 'Fanatico', 'Acceso VIP + descuentos', 100.00);

INSERT INTO membresia 
VALUES ('G', 'Gerencia', 'Acceso total', 79.99);

INSERT INTO membresia 
VALUES ('L', 'Limitado', 'Acceso a area de pesas', 19.99);

INSERT INTO membresia 
VALUES ('P', 'Premium', 'Acceso completo', 49.99);

INSERT INTO membresia 
VALUES ('R', 'Regular', 'Acceso a area de pesas y entrenamiento', 29.99);

INSERT INTO membresia 
VALUES ('T', 'Temporero', 'Acceso a programa de entrenamiento', 9.99);

INSERT INTO membresia 
VALUES ('V', 'VIP', 'Acceso completo + maquinas de masaje', 99.99);

INSERT INTO membresia 
VALUES ('U', 'Ultimate', 'Acceso total + descuento 50% + masaje', 120.00);
-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Datos de la tabla horario                                  -
-- ----------------------------------------------------------------
INSERT INTO actividad 
VALUES (500001, 'Levantamiento de Pesas', 'Entrenamiento de fuerza con pesas', 'Rutina para principiantes');

INSERT INTO actividad 
VALUES (500002, 'Natacion', 'Nado y ejercicios acuaticos', 'Entrenamiento cardiovascular en la piscina');

INSERT INTO actividad 
VALUES (500003, 'Cardio', 'Ejercicios cardiovasculares', 'Rutina intensiva de cardio');

INSERT INTO actividad 
VALUES (500004, 'Spinning', 'Ciclismo indoor con musica', 'Clase de spinning para quemar calorias');

INSERT INTO actividad 
VALUES (500005, 'Entrenamiento Funcional', 'Ejercicios variados de cuerpo completo', 'Sesion de entrenamiento funcional');

INSERT INTO actividad 
VALUES (500006, 'Atletismo', 'Carrera y ejercicios de velocidad', 'Sesion de entrenamiento en pista cubierta');

INSERT INTO actividad 
VALUES (500007, 'Yoga', 'Ejercicios de flexibilidad y relajacion', 'Clase de yoga para mejorar la flexibilidad');

INSERT INTO actividad 
VALUES (500008, 'Baloncesto', 'Juego de baloncesto en grupo', 'Partido amistoso de baloncesto en la cancha');

INSERT INTO actividad 
VALUES (500009, 'Tenis', 'Partido de tenis individual', 'Sesion de tenis para mejorar las habilidades');

INSERT INTO actividad 
VALUES (500010, 'CrossFit', 'Entrenamiento de alta intensidad', 'Clase de CrossFit para mejorar la resistencia');

-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Datos de la tabla usuario                                -
-- ----------------------------------------------------------------
INSERT INTO usuario 
VALUES (100001, 'Ana', 'pass123', TO_DATE('2023-11-21', 'YYYY-MM-DD'), 3, TO_DATE('2023-12-01', 'YYYY-MM-DD'), 'A');

INSERT INTO usuario 
VALUES (100002, 'Carlos', 'gym2023', TO_DATE('2023-11-21', 'YYYY-MM-DD'), 0, TO_DATE('2023-12-15', 'YYYY-MM-DD'), 'A');

INSERT INTO usuario 
VALUES (100003, 'Luis', 'clave456', TO_DATE('2023-11-21', 'YYYY-MM-DD'), 5, TO_DATE('2023-12-10', 'YYYY-MM-DD'), 'A');

INSERT INTO usuario 
VALUES (100004, 'Maria', 'pass789', TO_DATE('2023-11-21', 'YYYY-MM-DD'), 1, TO_DATE('2023-12-05', 'YYYY-MM-DD'), 'A');

INSERT INTO usuario 
VALUES (100005, 'Elena', 'gym2023', TO_DATE('2023-11-21', 'YYYY-MM-DD'), 2, TO_DATE('2023-12-20', 'YYYY-MM-DD'), 'A');

INSERT INTO usuario 
VALUES (100006, 'David', 'clave123', TO_DATE('2023-11-21', 'YYYY-MM-DD'), 0, TO_DATE('2023-12-08', 'YYYY-MM-DD'), 'U');

INSERT INTO usuario 
VALUES (100007, 'Sara', 'pass456', TO_DATE('2023-11-21', 'YYYY-MM-DD'), 3, TO_DATE('2023-12-18', 'YYYY-MM-DD'), 'U');

INSERT INTO usuario 
VALUES (100008, 'Javier', 'gym2023', TO_DATE('2023-11-21', 'YYYY-MM-DD'), 1, TO_DATE('2023-12-12', 'YYYY-MM-DD'), 'U');

INSERT INTO usuario 
VALUES (100009, 'Laura', 'clave789', TO_DATE('2023-11-21', 'YYYY-MM-DD'), 4, TO_DATE('2023-12-03', 'YYYY-MM-DD'), 'U');

INSERT INTO usuario 
VALUES (100010, 'Pedro', 'pass123', TO_DATE('2023-11-21', 'YYYY-MM-DD'), 2, TO_DATE('2023-12-22', 'YYYY-MM-DD'), 'SU');
-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Datos de la tabla equipo                                  -
-- ----------------------------------------------------------------
INSERT INTO equipo 
VALUES (200001, 'Maquina de Pesas', 499.99, 'Equipo de entrenamiento para levantamiento de pesas');

INSERT INTO equipo 
VALUES (200002, 'Cinta de Correr', 899.99, 'Equipo de cardio para correr y caminar');

INSERT INTO equipo 
VALUES (200003, 'Banco de Pesas', 299.99, 'Banco ajustable para ejercicios de pesas');

INSERT INTO equipo 
VALUES (200004, 'Bicicleta Estacionaria', 599.99, 'Bicicleta estatica para entrenamiento cardiovascular');

INSERT INTO equipo 
VALUES (200005, 'Maquina de Remo', 749.99, 'Equipo para ejercicios de remo y entrenamiento de espalda');

INSERT INTO equipo 
VALUES (200006, 'Maquina de Cardio Eliptica', 699.99, 'Equipo de cardio para entrenamiento eliptico');

INSERT INTO equipo 
VALUES (200007, 'Maquina Smith', 799.99, 'Equipo versatil para ejercicios de fuerza');

INSERT INTO equipo 
VALUES (200008, 'Bola de Medicina', 49.99, 'Bola ponderada para ejercicios de resistencia');

INSERT INTO equipo 
VALUES (200009, 'Bandas de Resistencia', 29.99, 'Bandas elasticas para entrenamiento de resistencia');

INSERT INTO equipo 
VALUES (200010, 'Maquina de Abdominales', 129.99, 'Equipo para ejercicios abdominales y de core');

-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Datos de la tabla entrenador                               -
-- ----------------------------------------------------------------
INSERT INTO entrenador 
VALUES (300001, 'Jose', 'J', 'Gomez', 'Perez', 'Calle Principal 123', 'Piso 2, Apt. 5', 'Ciudad A', 'Centro', 'Estado X', 12345, TO_DATE('1980-05-15', 'YYYY-MM-DD'), 'M', '+123456789', 'jose.gomez@email.com');

INSERT INTO entrenador 
VALUES (300002, 'Lucy', 'A', 'Torres', 'Matos', 'Avenida Secundaria 456', 'Piso 1, Apt. 8', 'Ciudad B', 'Norte', 'Estado Y', 54321, TO_DATE('1985-09-23', 'YYYY-MM-DD'), 'F', '+987654321', 'ana.lopez@email.com');

INSERT INTO entrenador 
VALUES (300003, 'Carlos', 'C', 'Sandoval', 'Lemus', 'Calle Residencial 789', 'Piso 3, Apt. 12', 'Ciudad C', 'Oeste', 'Estado Z', 67890, TO_DATE('1978-12-10', 'YYYY-MM-DD'), 'M', '+1122334455', 'carlos.rodriguez@email.com');

INSERT INTO entrenador 
VALUES (300004, 'Jorge', 'M', 'Sandoval', 'Torres', 'Boulevard Principal 567', 'Piso 2, Apt. 3', 'Ciudad D', 'Este', 'Estado W', 98765, TO_DATE('1982-03-30', 'YYYY-MM-DD'), 'F', '+5544332211', 'maria.fernandez@email.com');

INSERT INTO entrenador 
VALUES (300005, 'Eduardo', 'E', 'Gutierrez', 'Diaz', 'Calle de la Playa 890', 'Piso 1, Apt. 15', 'Ciudad E', 'Sur', 'Estado V', 54321, TO_DATE('1987-08-18', 'YYYY-MM-DD'), 'M', '+9988776655', 'eduardo.gutierrez@email.com');

INSERT INTO entrenador 
VALUES (300006, 'Laura', 'L', 'Perez', 'Romero', 'Avenida Central 1234', 'Piso 4, Apt. 7', 'Ciudad F', 'Centro', 'Estado U', 12345, TO_DATE('1989-11-25', 'YYYY-MM-DD'), 'F', '+6677889900', 'laura.perez@email.com');

INSERT INTO entrenador 
VALUES (300007, 'Javier', 'J', 'Hernandez', 'Sanchez', 'Calle Principal 5678', 'Piso 3, Apt. 1', 'Ciudad G', 'Norte', 'Estado T', 45678, TO_DATE('1984-06-12', 'YYYY-MM-DD'), 'M', '+1122334455', 'javier.hernandez@email.com');

INSERT INTO entrenador 
VALUES (300008, 'Isabel', 'I', 'Padilla', 'Jimenez', 'Avenida Secundaria 910', 'Piso 2, Apt. 5', 'Ciudad H', 'Oeste', 'Estado S', 78901, TO_DATE('1986-02-08', 'YYYY-MM-DD'), 'F', '+9988776655', 'isabel.gomez@email.com');

INSERT INTO entrenador 
VALUES (300009, 'Sergio', 'S', 'Martinez', 'Fernandez', 'Calle Residencial 1112', 'Piso 1, Apt. 8', 'Ciudad I', 'Este', 'Estado R', 23456, TO_DATE('1981-07-05', 'YYYY-MM-DD'), 'M', '+5544332211', 'sergio.martinez@email.com');

INSERT INTO entrenador 
VALUES (300010, 'Monica', 'M', 'Garcia', 'Lopez', 'Boulevard Principal 1314', 'Piso 4, Apt. 11', 'Ciudad J', 'Sur', 'Estado Q', 56789, TO_DATE('1983-04-20', 'YYYY-MM-DD'), 'F', '+6677889900', 'monica.garcia@email.com');
-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Datos de la tabla cliente                                  -
-- ----------------------------------------------------------------
INSERT INTO cliente 
VALUES (400001, 'R', 'Ana', 'A', 'Lopez', 'Garcia', 'Avenida Secundaria 456', 'Piso 1, Apt. 8', 'Ciudad B', 'Barrio Norte', 'Estado Y', 54321, TO_DATE('1940-09-23', 'YYYY-MM-DD'), 'F', '+987654321', 'ana.lopez@email.com');

INSERT INTO cliente 
VALUES (400002, 'R', 'Carlos', 'C', 'Rodriguez', 'Hernandez', 'Calle Residencial 789', 'Piso 3, Apt. 12', 'Ciudad C', 'Barrio Oeste', 'Estado Z', 67890, TO_DATE('1978-12-10', 'YYYY-MM-DD'), 'M', '+1122334455', 'carlos.rodriguez@email.com');

INSERT INTO cliente 
VALUES (400003, 'L', 'Luis', 'L', 'Martinez', 'Fernandez', 'Boulevard Principal 567', 'Piso 2, Apt. 3', 'Ciudad D', 'Barrio Este', 'Estado W', 98765, TO_DATE('1982-03-30', 'YYYY-MM-DD'), 'M', '+5544332211', 'luis.martinez@email.com');

INSERT INTO cliente 
VALUES (400004, 'V', 'Maria', 'M', 'Fernandez', 'Martinez', 'Calle de la Playa 890', 'Piso 1, Apt. 15', 'Ciudad E', 'Barrio Sur', 'Estado V', 54321, TO_DATE('1987-08-18', 'YYYY-MM-DD'), 'F', '+9988776655', 'maria.fernandez@email.com');

INSERT INTO cliente 
VALUES (400005, 'P', 'Elena', 'E', 'Gutierrez', 'Diaz', 'Avenida Central 1234', 'Piso 4, Apt. 7', 'Ciudad F', 'Barrio Centro', 'Estado U', 12345, TO_DATE('1989-11-25', 'YYYY-MM-DD'), 'F', '+6677889900', 'elena.gutierrez@email.com');

INSERT INTO cliente 
VALUES (400006, 'G', 'David', 'D', 'Perez', 'Romero', 'Calle Principal 5678', 'Piso 3, Apt. 1', 'Ciudad G', 'Barrio Norte', 'Estado T', 45678, TO_DATE('1984-06-12', 'YYYY-MM-DD'), 'M', '+1122334455', 'david.perez@email.com');

INSERT INTO cliente 
VALUES (400007, 'V', 'Sara', 'S', 'Hernandez', 'Sanchez', 'Avenida Secundaria 910', 'Piso 2, Apt. 5', 'Ciudad H', 'Barrio Oeste', 'Estado S', 78901, TO_DATE('1986-02-08', 'YYYY-MM-DD'), 'F', '+9988776655', 'sara.hernandez@email.com');

INSERT INTO cliente 
VALUES (400008, 'R', 'Javier', 'J', 'Gomez', 'Jimenez', 'Calle Residencial 1112', 'Piso 1, Apt. 8', 'Ciudad I', 'Barrio Este', 'Estado R', 23456, TO_DATE('1981-07-05', 'YYYY-MM-DD'), 'M', '+5544332211', 'javier.gomez@email.com');

INSERT INTO cliente 
VALUES (400009, 'P', 'Laura', 'L', 'Martinez', 'Fernandez', 'Boulevard Principal 1314', 'Piso 4, Apt. 11', 'Ciudad J', 'Barrio Sur', 'Estado Q', 56789, TO_DATE('1983-04-20', 'YYYY-MM-DD'), 'F', '+6677889900', 'laura.martinez@email.com');

INSERT INTO cliente 
VALUES (400010, 'G', 'Pedro', 'P', 'Garcia', 'Lopez', 'Avenida Principal 1516', 'Piso 2, Apt. 9', 'Ciudad K', 'Barrio Oeste', 'Estado P', 98765, TO_DATE('1980-09-10', 'YYYY-MM-DD'), 'M', '+1122334455', 'pedro.garcia@email.com');
-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Datos de la tabla horario                                  -
-- ----------------------------------------------------------------
INSERT INTO horario 
VALUES ('L08081123', 500001, 2, 'Zona de Levantamiento de Pesas');

INSERT INTO horario 
VALUES ('L08091123', 500002, 1, 'Zona de Calistenia');

INSERT INTO horario 
VALUES ('K09101123', 500003, 3, 'area de Cardio');

INSERT INTO horario 
VALUES ('M09151123', 500004, 2, 'Clase de Spinning');

INSERT INTO horario 
VALUES ('J07301123', 500005, 4, 'Estudio de Fitness');

INSERT INTO horario 
VALUES ('J09301123', 500006, 2, 'Pista Cubierta');

INSERT INTO horario 
VALUES ('V08251123', 500007, 1, 'Estudio de Yoga');

INSERT INTO horario 
VALUES ('V08281123', 500008, 3, 'Cancha de Baloncesto');

INSERT INTO horario 
VALUES ('S08221123', 500009, 4, 'Canchas de Tenis');

INSERT INTO horario 
VALUES ('S08251123', 500010, 3, 'Box de CrossFit');
-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Datos de la tabla sesion                                   -
-- ----------------------------------------------------------------
INSERT INTO sesion 
VALUES (600001, 'L08081123', 400001, 300001, 200001, 'activo', 'Primera sesion de entrenamiento');

INSERT INTO sesion 
VALUES (600002, 'L01081123', 400002, 300002, 200002, 'pendiente', 'Sesion de entrenamiento cardiovascular');

INSERT INTO sesion 
VALUES (600003, 'K09101123', 400003, 300003, 200003, 'cancelado', 'Entrenador ausente');

INSERT INTO sesion 
VALUES (600004, 'M09151123', 400004, 300004, 200004, 'activo', 'Clase de spinnig');

INSERT INTO sesion 
VALUES (600005, 'J07301123', 400005, 300005, 200005, 'pendiente', 'Sesion de entrenamiento funcional');

INSERT INTO sesion 
VALUES (600006, 'J09301123', 400006, 300006, 200006, 'cancelado', 'Entrenador de atletismo ausente');

INSERT INTO sesion 
VALUES (600007, 'V08251123', 400007, 300007, 200007, 'activo', NULL);

INSERT INTO sesion 
VALUES (600008, 'V08281123', 400008, 300008, 200008, 'completado', 'Sesion de baloncesto exitosa');

INSERT INTO sesion 
VALUES (600009, 'S08221123', 400009, 300009, 200009, 'cancelado', 'Tenis cancelado por fuertes lluvias');

INSERT INTO sesion 
VALUES (600010, 'S08251123', 400010, 300010, 200010, 'completado', 'Un cliente se lesiono durante el CrossFit');

-- ----------------------------------------------------------------
-- -   Guarda los datos. De no ponerse, como quiera los guarda   -
-- - en una corrida.  Se deja para explicar su uso.             -
-- ----------------------------------------------------------------
COMMIT;
